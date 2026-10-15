"""No main-loop pass between two human commands (ovl61:2123 returns after ovl68:0259 for a human
side; the event loop 08a9:000e runs none of ovl35:09f2, ovl62:0000, 0555:0d9e), the refreshes
the commands do themselves, and the info area kept as ovl66:0356 last drew it."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model.ids import MAP_ARMY, MAP_OWNER_MASK, MAP_W, Terrain  # noqa: E402
from warlords2.rules import engine, mapwords, pathfinding as P  # noqa: E402
from warlords2.rules.constants import history as KH  # noqa: E402
from warlords2.ui.dialog import Dialog  # noqa: E402
from warlords2.ui.palettes import info_values, painter_for  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
CAPITAL = (86, 8)                          # ERYTHEA: side 0's capital Mirea, a stack in it
CITY_COST = 0x99                           # 0555:0d9e: own coastal city (city, crossing, water, cost 1)


@pytest.fixture
def app(game, tmp_path):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "1", "--scenario", "ERYTHEA",
                        "--controls", "HHHHHHHH", "--user-dir", str(tmp_path / "u")]))
    yield a
    a.close()


def _human(a, n=600):
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            return g
        top = g.dialogs.top if getattr(g, "dialogs", None) else None
        tid = getattr(top, "dialog_id", None)
        if tid == "production":
            top.press(192)
        elif tid == "hero_offer":
            top.press(287)
        a.step([UP] if tid in ("turn_start", "tutorial_page", "message") else [])
    raise AssertionError("human phase not reached")


def _squares(c):
    return [(c.x + dx, c.y + dy) for dy in (0, 1) for dx in (0, 1)]


def _plain_next_to(st, x, y, avoid=()):
    for d in range(8):
        n = P.step(x, y, d)
        if n is not None and n not in avoid and st.world.terrain(*n) == Terrain.PLAIN \
                and not st.world.flags[n[1] * MAP_W + n[0]] & MAP_ARMY:
            return n
    raise AssertionError("no free plain square next to %r" % ((x, y),))


@gamedata
def test_a_vacated_plain_square_keeps_its_owner_nibble(app):
    """0b62:01a7 clears only bits 0x10 / 0x20 of the square left; ovl62:0000 would set an empty
    non-city square's nibble to 0xF, but no pass runs before the next side's."""
    g = _human(app)
    st = g.state
    p = st.current
    g.phase.apply(C.SelectStack(*CAPITAL))
    group = tuple(st.selection.moving) or (st.selection.selected,)
    a = st.armies[group[0]]
    city = _squares(st.cities[st.city_at(*CAPITAL)])
    first = _plain_next_to(st, a.x + 1, a.y + 1, city)
    g.phase.apply(C.Move(group, first))
    assert (a.x, a.y) == first
    i = first[1] * MAP_W + first[0]
    assert st.world.flags[i] & MAP_OWNER_MASK == p and st.world.flags[i] & MAP_ARMY
    for k in group:
        st.armies[k].moves_left = st.armies[k].allowance
    second = _plain_next_to(st, *first, city)
    g.phase.apply(C.Move(group, second))
    assert (a.x, a.y) == second
    assert st.world.flags[i] & MAP_OWNER_MASK == p and not st.world.flags[i] & MAP_ARMY
    cp = st.copy()
    mapwords.refresh_map(cp)                               # what the removed per-command pass did
    assert cp.world.flags[i] & MAP_OWNER_MASK == 0x0F
    ended = st.copy()
    engine.apply(ended, C.EndTurn())                       # the next side's pass top (ovl61:2183)
    assert ended.world.flags[i] & MAP_OWNER_MASK == 0x0F


@gamedata
def test_razed_squares_cost_one_until_end_turn(app):
    """ovl32:0061 recounts (03f9 / 02bf / 0372) but runs no 0555:0d9e: the four squares keep the
    own city's cost byte 0x99 (cost 1) for the rest of the turn; a move over them is charged 1
    per square, and the next side's pass (ovl61:2194) rebuilds them."""
    g = _human(app)
    st = g.state
    ci = st.city_at(*CAPITAL)
    c = st.cities[ci]
    sq = [y * MAP_W + x for x, y in _squares(c)]
    assert [st.cost_map[i] for i in sq] == [CITY_COST] * 4
    g.apply(C.RazeOwnCity(ci))
    assert st.world.terrain(c.x, c.y) == Terrain.SITE
    assert [st.cost_map[i] for i in sq] == [CITY_COST] * 4
    fresh = st.copy()
    P.rebuild_cost_map(fresh)
    assert all(fresh.cost_map[i] & 0x07 > 1 for i in sq)
    g.phase.apply(C.SelectStack(*CAPITAL))
    group = tuple(st.selection.moving) or (st.selection.selected,)
    lead = st.armies[group[0]]
    dest = _plain_next_to(st, c.x + 2, c.y)
    other = st.copy()
    P.rebuild_cost_map(other)
    engine.apply(other, C.Move(group, dest))
    g.phase.apply(C.Move(group, dest))
    assert (lead.x, lead.y) == dest == (other.armies[lead.id].x, other.armies[lead.id].y)
    assert lead.moves_left > other.armies[lead.id].moves_left
    ended = st.copy()
    engine.apply(ended, C.EndTurn())
    assert [ended.cost_map[i] for i in sq] != [CITY_COST] * 4


@gamedata
def test_site_squares_of_the_overview_redrawn_only_after_09f2(app, monkeypatch):
    """ovl35:09f2 redraws the sites' overview squares (ovl35:0b0b -> ovl63:2785) where it runs:
    a command that rewrote a site's tile byte (the sage, a quest reward), not every command."""
    g = _human(app)
    st = g.state
    seen = []
    monkeypatch.setattr(g.minimap, "redraw_sites", lambda s: seen.append(1))
    g.phase.apply(C.SelectStack(*CAPITAL))
    assert seen == []
    s = st.sites[0]
    real = engine.apply

    def sage(state, cmd):
        ev = real(state, cmd)
        state.world.tiles[s.y * MAP_W + s.x] ^= 1          # as ovl35:09f2 inside the command
        return ev
    monkeypatch.setattr(engine, "apply", sage)
    g.phase.apply(C.Deselect())
    assert seen == [1]


@gamedata
def test_info_area_keeps_what_0356_drew(app):
    """ovl61:011f(0, 0, 0) (the report's close) skips ovl66:0356: Report > Gold refreshes DS:5dda
    (ovl42:01d4 / 01d9) but the info area keeps the upkeep it showed until the next 0356 (the
    Deselect 0b62:08fa here)."""
    g = _human(app)
    st = g.state
    pt = painter_for(g)
    p = st.current
    st.upkeep_cache[p] += 13                              # stale, as after a disband by the AI
    g.phase.apply(C.SelectStack(*CAPITAL))
    g.phase.apply(C.Deselect())                            # 0356 with no selection: the info area
    assert pt.info == info_values(st) and pt.info[3] == st.upkeep_cache[p]
    shown = pt.info
    g.command(C.ReportPage(KH.REPORT_GOLD.value))
    assert st.upkeep_cache[p] == shown[3] - 13 and pt.info == shown
    g.phase.apply(C.SelectStack(*CAPITAL))
    assert pt.info == info_values(st) != shown


@gamedata
def test_info_area_redrawn_by_the_dialogs_that_run_0356(app):
    """A close through ovl61:011f(x, y, 1) / ovl61:0000(x, 0) (the city screen ovl45:02e1) draws
    the numbers again; one through 011f(0, 0, 0) (the reports ovl42:02e4) does not."""
    g = _human(app)
    st = g.state
    pt = painter_for(g)
    pt.palette_drawn(st)
    for did, redraws in (("reports", False), ("history", False), ("production", True), ("quest", True)):
        shown = pt.info
        st.players[st.current].gold += 7
        d = Dialog()
        d.dialog_id = did
        g.dialogs.push(d)
        d.close(None)
        assert (pt.info == info_values(st) != shown) if redraws else pt.info == shown


@gamedata
def test_raze_own_city_draws_no_palette_until_the_city_screen_closes(app):
    """ovl32:0061 after the recounts: ovl61:0000(0, 0) at 00b5 only with DS:4124 set, which only
    ovl32:0006 writes (0); the city screen ovl45:0000 comes back and its close ovl45:02e1
    (011f(1, 1, 1)) draws the info area with the new counts."""
    g = _human(app)
    st = g.state
    pt = painter_for(g)
    pt.palette_drawn(st)
    shown = pt.info
    g.apply(C.RazeOwnCity(st.city_at(*CAPITAL)))
    assert info_values(st) != shown and pt.info == shown
    d = Dialog()
    d.dialog_id = "production"
    g.dialogs.push(d)
    d.close(None)
    assert pt.info == info_values(st)


@gamedata
def test_city_counts_carry_over_to_the_next_game_of_the_run(app):
    """DS:5dea is DGROUP memory: no new-game path calls ovl62:03f9, so the next game starts with
    the counts the last one left, and Begin's ovl61:0519 reads them (0745 / 0886)."""
    g = _human(app)
    cfg = g.config
    g.state.city_counts[:] = [9, 8, 7, 6, 5, 4, 3, 2]
    g.on_exit("menu")
    g.on_enter("setup", new_game=cfg)
    g._ready()
    g.start_engine()
    assert g.state.city_counts == [9, 8, 7, 6, 5, 4, 3, 2]
