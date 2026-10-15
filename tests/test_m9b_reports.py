"""M9b package R: Report > Army / City / Gold / Production / Winning (ovl42, ovl43; menu 510-514)
and Report > Quest (516, ovl01:0167)."""
import dataclasses
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.assets.exe import ds_str, ds_words  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.model.ids import HERO_TYPE, MAP_W, Terrain  # noqa: E402
from warlords2.model.state import ReportEntry  # noqa: E402
from warlords2.rules import engine  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import quest as Q  # noqa: E402
from warlords2.ui.dialogs import reports as R  # noqa: E402
from warlords2.ui.dialogs.hero_offer import raw, sprintf  # noqa: E402
from warlords2.ui.keys import ESC_LIST, RETURN_LIST, ds_list  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL, PRESSED  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))


def key(k, ch):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=ch, mod=0, scancode=0)


ESC, RET, LETTER = key(pygame.K_ESCAPE, "\x1b"), key(pygame.K_RETURN, "\r"), key(pygame.K_a, "A")


def _top(g):
    d = getattr(g, "dialogs", None)
    return d.top if d is not None else None


def _human(a, n=400):
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            return g
        tid = getattr(_top(g), "dialog_id", None)
        if tid == "production":
            _top(g).press(192)
        elif tid == "hero_offer":
            _top(g).press(287)
        a.step([UP] if tid in ("turn_start", "tutorial_page", "message") else [])
    raise AssertionError("human phase not reached")


@pytest.fixture
def app(game, tmp_path):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "1", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--user-dir", str(tmp_path / "u")]))
    yield a
    a.close()


def _draw(g):
    fb = g.app.screen.fb
    g.paint(fb)
    g.dialogs.draw(fb)
    return fb


# ------------------------------------------------------------------ pure parts


def test_bar_length():
    """ovl42:0683..06cb: 1 without a scale, a negative value counts 0, at least 1, 240 * v / scale."""
    assert R.bar_length(5, 0) == 1 and R.bar_length(5, -2) == 1
    assert R.bar_length(-30, 10) == 1 and R.bar_length(0, 10) == 1
    assert R.bar_length(10, 10) == 240 and R.bar_length(5, 10) == 120
    assert R.bar_length(1, 750) == 1 and R.bar_length(7, 750) == 2      # 1680 / 750 truncated
    assert R.bar_length(749, 750) == 239


def test_bar_cells():
    """06d0..0767: whole 8-px cells, then the rest."""
    assert R.bar_cells(1) == [(0, 1)]
    assert R.bar_cells(8) == [(0, 8)]
    assert R.bar_cells(19) == [(0, 8), (8, 8), (16, 3)]
    assert len(R.bar_cells(240)) == 30


def test_sentences():
    """Jump table ovl42:0262: one-army / one-city forms unformatted, the production index flipped,
    the winning rank as the index."""
    assert R.sentence_entry(R.ARMY, 1) == (0x4B, 0, False)
    assert R.sentence_entry(R.ARMY, 7) == (0x4B, 1, True)
    assert R.sentence_entry(R.CITY, 1) == (0x4C, 0, False)
    assert R.sentence_entry(R.CITY, 0) == (0x4C, 1, True)
    assert R.sentence_entry(R.GOLD, 1) == (0x4D, 0, True)
    assert R.sentence_entry(R.PRODUCTION, 1) == (0x4E, 1, True)
    assert R.sentence_entry(R.PRODUCTION, 4) == (0x4E, 0, True)
    assert R.sentence_entry(R.WINNING, 3) == (0x4F, 3, False)


def test_paging():
    """ovl43:0805 / 0abd / 0af5 / 0b29 / 0b91 / 0a33."""
    assert R.paging_start(0) == (0, -1, 0)
    assert R.paging_start(3) == (0, 2, 3)
    assert R.paging_start(9) == (0, 4, 5)
    st = R.paging_start(9)
    st = R.paging_step(R.DOWN, 9, *st)
    assert st == (1, 5, 5)
    assert R.paging_step(R.UP, 9, *st) == (0, 4, 5)
    st = R.paging_step(R.PAGE_DOWN, 9, *st)
    assert st == (4, 8, 5)                                   # 6..10 pulled back to the end
    assert R.paging_step(R.PAGE_DOWN, 9, *st) == (4, 8, 5)
    assert R.paging_step(R.PAGE_UP, 9, 3, 7, 5) == (0, 4, 5)
    assert R.paging_step(R.PAGE_DOWN, 12, 0, 4, 5) == (5, 9, 5)
    assert R.paging_step(R.PAGE_DOWN, 3, 0, 2, 3) == (0, 2, 3)  # first 0: no pull-back, last clamped
    assert R.paging_states(9, 0, 4) == {R.DOWN: NORMAL, R.PAGE_DOWN: NORMAL, R.UP: DISABLED, R.PAGE_UP: DISABLED}
    assert R.paging_states(9, 4, 8) == {R.DOWN: DISABLED, R.PAGE_DOWN: DISABLED, R.UP: NORMAL, R.PAGE_UP: NORMAL}
    assert set(R.paging_states(0, 0, -1).values()) == {DISABLED}


# ------------------------------------------------------------------ the screen


@gamedata
def test_keys_of_the_exe(app):
    k = kit(app)
    assert R.CLOSE in ds_list(k.exe, ESC_LIST) and R.CLOSE in ds_list(k.exe, RETURN_LIST)
    assert Q.PAGE_CLOSE in ds_list(k.exe, ESC_LIST) and Q.PAGE_CLOSE in ds_list(k.exe, RETURN_LIST)
    assert not set(range(206, 223)) & set(ds_list(k.exe, ESC_LIST) + ds_list(k.exe, RETURN_LIST))


@gamedata
def test_menu_ids_open_their_page_and_close(app):
    g = _human(app)
    closed = []
    g.settings_closed = lambda: closed.append(1)
    for mode, id in enumerate(range(510, 515)):
        assert registry.has_action(id)
        registry.run_action(id, g)
        d = _top(g)
        assert d.dialog_id == "reports" and d.mode == mode
        assert d.row.state[R.PAGES + mode] == PRESSED
        assert all(d.row.state[R.PAGES + i] == NORMAL for i in range(5) if i != mode)
        assert d.row.state[R.CLOSE] == NORMAL
        assert (set(R.PAGING) <= set(d.row.state)) == (mode == R.PRODUCTION)
        _draw(g)
        d.update([LETTER], 16)
        assert _top(g) is d                                  # 'A'..'Z' ignored
        d.update([ESC if mode % 2 else RET], 16)
        assert not g.dialogs and closed == [1] * (mode + 1)  # 223 -> ovl42:02e4 -> ovl61:011f


@gamedata
def test_page_buttons_switch(app):
    g = _human(app)
    registry.run_action(510, g)
    d = _top(g)
    for mode in (1, 2, 3, 4, 0):
        d.press(R.PAGES + mode)
        assert _top(g) is d and d.mode == mode and d.row.state[R.PAGES + mode] == PRESSED
        _draw(g)
    d.press(R.CLOSE)
    assert not g.dialogs


STALE_INCOME, STALE_UPKEEP = 1234, 77


def _stale(st):
    st.income_cache[:] = [STALE_INCOME] * 8
    st.upkeep_cache[:] = [STALE_UPKEEP] * 8


@gamedata
def test_gold_and_winning_pages_refresh_the_caches(app):
    """ovl42:01d4 / 01d9 (Gold) and 04c2 / 04c7 (Winning): ovl62:0372 then 02bf write the income
    and upkeep caches, on opening and on each page button (`ReportPage`)."""
    from warlords2.rules import economy as EC
    g = _human(app)
    st = g.state
    live = ([EC.income(st, p) for p in range(8)],)
    for id in (512, 514):
        _stale(st)
        registry.run_action(id, g)
        assert st.income_cache == live[0] and st.income_cache != [STALE_INCOME] * 8
        assert st.upkeep_cache != [STALE_UPKEEP] * 8
        ref = st.copy()
        EC.refresh_upkeep(ref)
        assert st.upkeep_cache == ref.upkeep_cache
        _top(g).press(R.CLOSE)
    registry.run_action(511, g)
    for mode in (2, 4):                                      # page buttons run ovl42:0000 again
        _stale(st)
        _top(g).press(R.PAGES + mode)
        assert st.income_cache == live[0] and st.upkeep_cache != [STALE_UPKEEP] * 8
    _top(g).press(R.CLOSE)


@gamedata
def test_army_city_production_pages_write_no_caches(app):
    """Modes 1 / 3 run no state write; mode 0 only the army bits (ovl63:158d)."""
    from warlords2.model.ids import MAP_ARMY
    g = _human(app)
    st = g.state
    for id in (510, 511, 513):
        _stale(st)
        before = st.hash()
        registry.run_action(id, g)
        _draw(g)
        _top(g).press(R.CLOSE)
        assert st.income_cache == [STALE_INCOME] * 8 and st.upkeep_cache == [STALE_UPKEEP] * 8
        assert st.hash() == before                           # the army bits were already right
    i = next(i for i, f in enumerate(st.world.flags) if not f & MAP_ARMY)
    st.world.flags[i] |= MAP_ARMY                            # a stale bit
    registry.run_action(511, g)
    assert st.world.flags[i] & MAP_ARMY                      # City: no rebuild
    _top(g).press(R.PAGES + R.ARMY)
    assert not st.world.flags[i] & MAP_ARMY                  # Army: ovl63:15fb..1625 cleared it
    _top(g).press(R.CLOSE)


@gamedata
def test_report_page_command(app):
    from warlords2.model.ids import Control
    from warlords2.rules.engine import IllegalCommand
    g = _human(app)
    st = g.state.copy()
    from warlords2.rules import economy as EC
    for mode in (2, 4):
        _stale(st)
        assert engine.apply(st, C.ReportPage(mode)) == []
        ref = st.copy()
        EC.refresh_income(ref)
        EC.refresh_upkeep(ref)
        assert st.income_cache == ref.income_cache and st.upkeep_cache == ref.upkeep_cache
        assert st.upkeep_cache != [STALE_UPKEEP] * 8
    for mode in (0, 1, 3):
        _stale(st)
        engine.apply(st, C.ReportPage(mode))
        assert st.income_cache == [STALE_INCOME] * 8 and st.upkeep_cache == [STALE_UPKEEP] * 8
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.ReportPage(5))
    st.players[st.current].control = Control.COMPUTER
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.ReportPage(0))


@gamedata
def test_values_and_sentence(app):
    g = _human(app)
    st = g.state
    k = kit(app)
    registry.run_action(511, g)
    d = _top(g)
    from warlords2.rules import reports as RR
    want = RR.report(st.copy(), 1)
    assert d.values == want
    own = want["own"]
    g_, i, fmt = R.sentence_entry(1, own)
    assert (g_, i, fmt) == ((0x4C, 0, False) if own == 1 else (0x4C, 1, True))
    _draw(g)


def _bar_y(k, s):
    return ds_words(k.exe, R.BAR_Y, 8)[s]


@gamedata
def test_bars_axis_and_dead_sides(app):
    g = _human(app)
    st = g.state
    k = kit(app)
    st.players[0].gold, st.players[7].gold = 400, 100
    registry.run_action(512, g)
    d = _top(g)
    assert d.values["scale"] == 400
    fb = _draw(g)
    pic = k.picture(R.SHIELDS)
    src = ds_words(k.exe, R.BAR_SRC, 16)
    for s, n in ((0, 240), (7, 60)):
        y = _bar_y(k, s)
        sx, sy = src[2 * s], src[2 * s + 1]
        for dx in (0, 8 * (n // 8 - 1)):
            for px, py in ((1, 1), (5, 6)):
                assert fb.get_at_mapped((312 + dx + px, y + py)) == pic.get_at_mapped((sx + px, sy + py))
        assert fb.get_at_mapped((311, y + 3)) == 0             # left edge (14d0:02e5(.., 0, 1))
        assert fb.get_at_mapped((312 + 20, y - 1)) == 0        # top edge
        assert fb.get_at_mapped((312 + n, y + 3)) == 1         # right edge
        assert fb.get_at_mapped((312 + 20, y + 8)) == 1        # bottom edge
    marble = k.picture(25)
    y = _bar_y(k, 3)                                         # dead side 3: the MARBLE stays
    for x in (311, 316, 400):
        assert fb.get_at_mapped((x, y + 4)) == marble.get_at_mapped((x - 80, y + 4 - 60))
    # axis: colour 1 at (312, 196), colour 0 one pixel up-left; ticks
    assert fb.get_at_mapped((400, 196)) == 1 and fb.get_at_mapped((400, 195)) == 0
    assert fb.get_at_mapped((552, 192)) == 1 and fb.get_at_mapped((551, 191)) == 0
    assert fb.get_at_mapped((372, 194)) == 1 and fb.get_at_mapped((371, 192)) == 0
    assert fb.get_at_mapped((372, 191)) != 1                  # the short tick starts at 192


@gamedata
def test_negative_gold_bar_is_one_pixel(app):
    g = _human(app)
    st = g.state
    st.players[0].gold = -50
    st.players[7].gold = 300
    registry.run_action(512, g)
    d = _top(g)
    assert d.values["values"][0] == -50
    k = kit(app)
    fb = _draw(g)
    y = _bar_y(k, 0)
    assert fb.get_at_mapped((313, y + 3)) == 1               # L = 1: right edge at 312 + 1
    assert fb.get_at_mapped((311, y + 3)) == 0


def _entries(st):
    own = [i for i, c in enumerate(st.cities) if (c.owner & 0xFF) == st.current]
    other = [i for i, c in enumerate(st.cities) if i not in own]
    c0, c1 = own[0], other[0]
    es = [ReportEntry(0, 3, c0, 100 + st.current), ReportEntry(0, 4, c0, c1), ReportEntry(1, 5, c1, c0)]
    es += [ReportEntry(2, t, c0, -1) for t in range(6)]
    return es, c0, c1


@gamedata
def test_entry_texts(app):
    g = _human(app)
    st = g.state
    exe = kit(app).exe
    es, c0, c1 = _entries(st)
    assert R.entry_text(exe, st, es[0]) == sprintf(ds_str(exe, 0x0E67), ds_str(exe, 0x0E6E))
    assert R.entry_text(exe, st, es[1]) == sprintf(ds_str(exe, 0x0E77), st.cities[c1].name)
    assert R.entry_text(exe, st, es[2]) == sprintf(ds_str(exe, 0x0E7E), st.cities[c1].name)
    assert R.entry_text(exe, st, es[3]) == st.cities[c0].name
    assert len({R.entry_text(exe, st, e) for e in es[:4]}) == 4


@gamedata
def test_production_page_paging(app):
    g = _human(app)
    st = g.state
    es, c0, c1 = _entries(st)
    st.production_report[:] = es
    registry.run_action(513, g)
    d = _top(g)
    assert d.values["own"] == 9 and (d.first, d.last, d.rows) == (0, 4, 5)
    assert d.row.state[R.UP] == DISABLED and d.row.state[R.PAGE_UP] == DISABLED
    assert d.row.state[R.DOWN] == NORMAL and d.row.state[R.PAGE_DOWN] == NORMAL
    _draw(g)
    d.press(R.PAGE_DOWN)
    assert (d.first, d.last, d.rows) == (4, 8, 5)
    assert d.row.state[R.DOWN] == DISABLED and d.row.state[R.UP] == NORMAL
    d.press(R.UP)
    assert (d.first, d.last) == (3, 7) and d.row.state[R.DOWN] == NORMAL
    d.press(R.PAGE_UP)
    assert (d.first, d.last) == (0, 4)
    d.press(R.DOWN)
    d.press(R.PAGES + R.PRODUCTION)                          # pressed page: the press is not refused here,
    assert (d.first, d.last) == (0, 4)                       # ovl43:0805 resets the paging
    d.press(R.PAGES + R.ARMY)
    assert R.DOWN not in d.row.state                         # 206-209 hidden
    _draw(g)


@gamedata
def test_production_rows_drawn(app):
    """ovl43:086e: the number at (312, 176 + 30 i), the ring at (328, 170 + 30 i)."""
    g = _human(app)
    st = g.state
    es, _, _ = _entries(st)
    st.production_report[:] = es
    registry.run_action(513, g)
    k = kit(app)
    fb = _draw(g)
    abits = k.picture(8)
    for i in range(5):
        y = 170 + 30 * i
        assert [fb.get_at_mapped((328, y + dy)) for dy in range(30)] == \
            [abits.get_at_mapped((0, dy)) for dy in range(30)]          # the ring's left column
    st.production_report[:] = es[:2]
    _top(g).press(R.PAGES + R.PRODUCTION)
    d = _top(g)
    assert d.rows == 2
    fb = _draw(g)
    marble = k.picture(25)
    x, y = 340, 170 + 30 * 3 + 10                            # row 4 empty: the MARBLE panel
    assert fb.get_at_mapped((x, y)) == marble.get_at_mapped((x - 80, y - 60))


def _city_square(w, x, y):
    return w.terrain_of_tile[w.tiles[y * MAP_W + x] & 0xFF] == Terrain.CITY


@gamedata
def test_army_markers_skip_city_squares(app):
    """ovl63:158d's fifth argument: an army on a city square is not drawn (Report > Army)."""
    g = _human(app)
    k = kit(app)
    st = g.state.copy()
    w = st.world
    a = next(x for x in st.armies if x.x >= 0 and _city_square(w, x.x, x.y))
    st.armies = [a]
    ref = g.minimap.buf.copy()
    snap = lambda b: pygame.image.tobytes(b, "P")             # noqa: E731
    buf = ref.copy()
    Q.army_markers(k, buf, st, -1, -1, skip_city=True)
    assert snap(buf) == snap(ref)
    Q.army_markers(k, buf, st, -1, -1, skip_city=False)
    assert snap(buf) != snap(ref)
    x0 = a.x
    a.x = next(x for x in range(x0 + 1, x0 + 10) if not _city_square(w, x, a.y))
    buf = ref.copy()
    Q.army_markers(k, buf, st, -1, -1, skip_city=True)
    assert snap(buf) != snap(ref)


@gamedata
def test_hidden_map_edge_colour(app):
    """Modes 1 / 2 / 4 run no ovl63:04d3: colour 4; modes 0 / 3 colour 3."""
    g = _human(app)
    st = g.state
    st.options = dataclasses.replace(st.options, hidden_map=1)
    registry.run_action(511, g)
    d = _top(g)
    for mode, edge in ((1, 4), (2, 4), (4, 4), (0, 3), (3, 3)):
        d.press(R.PAGES + mode)
        fb = _draw(g)
        assert fb.get_at_mapped((80, 200)) == edge and fb.get_at_mapped((150, 60)) == edge
        assert fb.get_at_mapped((150, 60 + 311)) == edge


# ------------------------------------------------------------------ Report > Quest


@gamedata
def test_quest_page_without_a_quest_uses_the_roll(app):
    g = _human(app)
    st = g.state
    k = kit(app)
    assert not Q.has_quest(st) and registry.has_action(516)
    for _ in range(40):                                      # a state whose next roll is not member 0
        ref = st.copy()
        want = engine.apply(ref, C.QuestPage())
        assert len(want) == 1 and isinstance(want[0], E.Msg) and want[0].group == 20
        if raw(k, 20, want[0].index) != raw(k, 20, 0):
            break
        engine.apply(st, C.QuestPage())
    assert raw(k, 20, want[0].index) != raw(k, 20, 0)
    closed = []
    g.settings_closed = lambda: closed.append(1)
    registry.run_action(516, g)
    d = _top(g)
    assert d.dialog_id == "quest" and d.empty == raw(k, 20, want[0].index)
    assert st.hash() == ref.hash()                           # the roll went through the engine
    st.options = dataclasses.replace(st.options, hidden_map=1)
    fb = _draw(g)
    assert fb.get_at_mapped((80, 200)) == 4                  # no ovl63:04d3 on this page
    d.update([LETTER], 16)
    assert _top(g) is d
    d.update([ESC], 16)
    assert not g.dialogs and closed == [1]
    registry.run_action(516, g)
    _top(g).update([RET], 16)
    assert not g.dialogs and closed == [1, 1]


@gamedata
def test_quest_page_with_a_quest(app):
    g = _human(app)
    st = g.state
    hero = next(a for a in st.armies if a.type_id == HERO_TYPE and a.owner == st.current and a.x >= 0)
    q = st.players[st.current].quest
    q.active, q.type, q.hero, q.amount, q.progress = 1, 6, hero.id, 1000, 10
    before = st.hash()
    registry.run_action(516, g)
    d = _top(g)
    assert d.dialog_id == "quest" and d.empty is None and d.hero is hero and d.lines
    assert st.hash() == before                               # type 6: no army bits, no roll
    st.options = dataclasses.replace(st.options, hidden_map=1)
    fb = _draw(g)
    assert fb.get_at_mapped((80, 200)) == 3                  # ovl63:04d3 (ovl01:0310)
    d.update([RET], 16)
    assert not g.dialogs


# ------------------------------------------------------------------ review fixes


def _off_city(w, x, y):
    for dx in range(1, 12):
        if not _city_square(w, x + dx, y) and w.terrain(x + dx, y) != Terrain.WATER:
            return x + dx
    raise AssertionError


@gamedata
def test_army_markers_skip_own(app):
    """ovl63:1718..172c: with the fourth argument an army of SCN 0x110 is not drawn."""
    g = _human(app)
    k = kit(app)
    st = g.state.copy()
    w = st.world
    mine = next(a for a in st.armies if a.x >= 0 and a.owner == st.current)
    other = next(a for a in st.armies if a.x >= 0 and a.owner not in (st.current, 0xFF))
    mine.x = _off_city(w, mine.x, mine.y)
    other.x = _off_city(w, other.x, other.y)
    mine.type_id = other.type_id
    st.armies = [mine, other]
    snap = lambda b: pygame.image.tobytes(b, "P")             # noqa: E731
    ref = g.minimap.buf.copy()
    only_other = ref.copy()
    Q.army_markers(k, only_other, _only(st, other), -1, -1)
    got = ref.copy()
    Q.army_markers(k, got, st, -1, other.type_id, skip_own=True)
    assert snap(got) == snap(only_other)
    both = ref.copy()
    Q.army_markers(k, both, st, -1, other.type_id)
    assert snap(both) != snap(only_other)


def _only(st, a):
    c = st.copy()
    c.armies = [a]
    return c


@gamedata
def test_quest_type2_page_skips_own_armies(app):
    g = _human(app)
    k = kit(app)
    st = g.state
    hero = next(a for a in st.armies if a.type_id == HERO_TYPE and a.owner == st.current and a.x >= 0)
    w = st.world
    mine = next(a for a in st.armies if a.x >= 0 and a.owner == st.current and a is not hero)
    mine.x = _off_city(w, mine.x, mine.y)
    q = st.players[st.current].quest
    q.active, q.type, q.hero, q.target = 1, 2, hero.id, mine.type_id
    registry.run_action(516, g)
    d = _top(g)
    ref = g.minimap.buf.copy()
    got, want, plain = ref.copy(), ref.copy(), ref.copy()
    d.marks(got)
    Q.army_markers(k, want, st, -1, mine.type_id, skip_own=True)
    Q.army_markers(k, plain, st, -1, mine.type_id)
    snap = lambda b: pygame.image.tobytes(b, "P")             # noqa: E731
    assert snap(got) == snap(want) and snap(got) != snap(plain)


@gamedata
def test_quest_page_type1_marks_the_site(app):
    """ovl01:0682..06a9: an item in a site (+0x16 == 2) -> its site's +0x1d |= 1 << SCN 0x110."""
    from warlords2.model.ids import ItemState
    g = _human(app)
    st = g.state
    hero = next(a for a in st.armies if a.type_id == HERO_TYPE and a.owner == st.current and a.x >= 0)
    i = len(st.items) - 1
    st.items[i].state, st.items[i].holder = ItemState.IN_SITE, 0     # TUTORIA has none in a site
    site = st.sites[0]
    site.shown_mask &= ~(1 << st.current)
    rest = site.shown_mask
    q = st.players[st.current].quest
    q.active, q.type, q.hero, q.target = 1, 1, hero.id, i
    assert engine.apply(st, C.QuestPage()) == []
    assert site.shown_mask == rest | (1 << st.current)
    site.shown_mask &= ~(1 << st.current)
    st.items[i].state = ItemState.ON_MAP
    engine.apply(st, C.QuestPage())
    assert not site.shown_mask & (1 << st.current)            # only state 2 (ovl01:0675)


@gamedata
def test_rows_outside_the_tables(app):
    """X40: aliased rows whose city / type byte lies outside the tables raise Unverified."""
    from warlords2.rules.constants import UnverifiedError, allowing_unverified
    g = _human(app)
    st = g.state
    exe = kit(app).exe
    for e in (ReportEntry(2, 1, -1, -1), ReportEntry(1, 1, len(st.cities), 0), ReportEntry(0, 1, 0, -3)):
        with pytest.raises(UnverifiedError):
            R.entry_text(exe, st, e)
        with allowing_unverified():
            assert R.entry_text(exe, st, e) in ("", sprintf(ds_str(exe, 0x0E77), ""), sprintf(ds_str(exe, 0x0E7E), ""))
    assert R.entry_text(exe, st, ReportEntry(0, 1, 0, 120)) == sprintf(ds_str(exe, 0x0E67), ds_str(exe, 0x0E6E))
    st.production_report[:] = [ReportEntry(2, -2, 0, -1)]
    registry.run_action(513, g)
    with pytest.raises(UnverifiedError):
        _draw(g)
    with allowing_unverified():
        fb = _draw(g)
    abits = kit(app).picture(8)
    assert [fb.get_at_mapped((328 + 16, 170 + dy)) for dy in range(30)] == \
        [abits.get_at_mapped((16, dy)) for dy in range(30)]   # the ring alone
