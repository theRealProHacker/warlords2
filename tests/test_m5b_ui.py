"""M5b: battle display, capture question, Military Advisor (ovl36, ovl37, ovl31).

Every attack needs the after-battle hook "ai_memory" (ovl25:09d7, M8b1's AI), so these tests run
the attack with unverified values allowed (`rules.constants.set_allow_unverified`), reset after
each test.
"""
import dataclasses
import os
from pathlib import Path

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.model.ids import Terrain  # noqa: E402
from warlords2.rules import combat  # noqa: E402
from warlords2.rules.constants import set_allow_unverified  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.anim import battle as B  # noqa: E402
from warlords2.ui.dialogs import advisor as AD  # noqa: E402
from warlords2.ui.dialogs import capture as CP  # noqa: E402
from warlords2.ui.dialogs import fight as F  # noqa: E402
from warlords2.ui import keys as K  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL  # noqa: E402
from warlords2.ui.widgets import tick_frames  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
SPACE = pygame.event.Event(pygame.KEYDOWN, key=pygame.K_SPACE, unicode=" ", mod=0, scancode=0)
ANSWERS = (287, 192, 201)          # hero offer accept, production Done (other milestones' dialogs)
SCRIPTS = Path(__file__).resolve().parent / "scripts"


# --------------------------------------------------------------------------- pure helpers


def test_registered():
    registry.load_all()
    for d in ("fight", "capture", "capture/result", "advisor"):
        assert registry.has_dialog(d)
    assert not hasattr(B, "_attack_move")                            # walk skips info["attack"]
    assert B.battle_started in registry.event_views(E.BattleStarted)
    assert B.battle_ended in registry.event_views(E.BattleEnded)
    assert B.map_redraw in registry.event_views(B.MapRedraw)
    assert CP.captured in registry.event_views(E.CityCaptured)
    assert registry.left_click_handler("advisor") is AD.advise
    assert all(registry.help_selector_for(w) is not None for w in range(45, 72))


def test_kill_ticks():
    assert B.duel_ticks(None, 3) == [13, 13, 13]
    assert B.duel_ticks(1, 3) == [13, 5, 5]


def test_bevel_order():
    s = pygame.Surface((10, 10), depth=8)
    s.fill(3)
    CP.bevel(s, (0, 0, 10, 10), 4, 2)            # a > b: b first, the corners in a
    assert s.get_at_mapped((9, 0)) == 4 and s.get_at_mapped((0, 9)) == 4 and s.get_at_mapped((9, 9)) == 2
    CP.bevel(s, (0, 0, 10, 10), 2, 4)            # a < b: a first, the corners in b
    assert s.get_at_mapped((9, 0)) == 4 and s.get_at_mapped((0, 0)) == 2


def test_replace_first_only():
    lst = [1, 285, 7, 285]
    CP.replace(lst, 285, 284)
    assert lst == [1, 284, 7, 285]
    CP.replace(lst, 999, 1)
    assert lst == [1, 284, 7, 285]


# --------------------------------------------------------------------------- game fixtures


def _settle(a, n=400):
    """Until the human phase waits for a command; the turn-start dialogs answered."""
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs and not g.phase.animator.busy:
            return g
        top = getattr(g, "dialogs", None) and g.dialogs.top
        row = getattr(top, "row", None)
        b = next((b for b in getattr(row, "buttons", ()) if b.id in ANSWERS and row.state.get(b.id) == NORMAL), None)
        if b is not None:
            x, y, w, h = b.rect
            p = (x + w // 2, y + h // 2)
            a.step([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=p)])
            a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=p)])
        else:
            a.step([UP] if top is not None else [])
    raise AssertionError("no idle human phase")


@pytest.fixture
def game_app(game, tmp_path):
    set_allow_unverified(True)
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--options", "0,0,0,0,0,0,0,0,1,0", "--scale", "1",
                        "--user-dir", str(tmp_path / "u")]))
    try:
        yield a, _settle(a)
    finally:
        a.close()
        set_allow_unverified(False)


def _land(st, x, y) -> bool:
    return (st.world.terrain(x, y) in (Terrain.PLAIN, Terrain.FOREST, Terrain.HILLS)
            and st.city_at(x, y) < 0 and not any(a.x == x and a.y == y for a in st.armies))


def _field_battle(a, g):
    """The Knights' hero and army 3 (Group All) next to a Darklords stack of three (army 5 and two
    former neutral garrisons, strengths 9, 5, 3), on open land near Origin."""
    st = g.state
    knights = [x for x in st.armies if x.owner == 0 and x.x >= 0]
    spots = [(x, y) for y in range(56, 72) for x in range(52, 66) if _land(st, x, y) and _land(st, x + 1, y)]
    (ax, ay) = spots[0]
    dx, dy = ax + 1, ay
    for k in knights:
        k.x, k.y = ax, ay
    defenders = [st.armies[5], st.armies[0], st.armies[1]]
    for d, strength in zip(defenders, (9, 5, 3)):
        d.owner, d.x, d.y, d.strength = 7, dx, dy, strength
    _hand_edit_done(g.state)
    g.phase.apply(C.SelectStack(ax, ay))
    g.phase.apply(C.GroupAll(ax, ay))
    g.scroll_to(ax, ay)
    g = _settle(a)
    group = tuple(st.selection.moving) if len(st.selection.moving) > 1 else (st.selection.selected,)
    return g, group, (dx, dy)



def _hand_edit_done(st):
    """The map words and the cost map after a hand edit of the armies (what the next main-loop
    pass top would do, ovl62:0000 at ovl61:2183, 0555:0d9e at 2194; no command does it)."""
    from warlords2.rules.mapwords import refresh_map
    from warlords2.rules.pathfinding import rebuild_cost_map
    refresh_map(st)
    rebuild_cost_map(st)


def _expected_slots(events):
    """The slot ovl37:0094 explodes for each Duel event (DS:41b5 order)."""
    start = next(e for e in events if isinstance(e, E.BattleStarted))
    out = []
    for d in (e for e in events if isinstance(e, E.Duel)):
        if d.info["loser"] == "attacker":
            out.append(F.A_BASE + start.info["attackers"].index(d.info["attacker"]))
        else:
            out.append(start.info["defenders"].index(d.info["defender"]))
    return out


def _play(a, g, space_at=None, n=2000):
    """Step until the window waits; return [(frame, slot)] of each explosion start."""
    d = g.dialogs.top
    assert d.dialog_id == "fight"
    blasts, last = [], None
    for i in range(n):
        if d.blast is not None and d.blast != last:
            blasts.append((i, d.blast))
        last = d.blast
        if d.phase == "wait":
            return d, blasts
        a.step([SPACE] if i == space_at else [])
    raise AssertionError("the battle window never waited")


@gamedata
def test_display_order_is_the_duel_order(game_app):
    a, g = game_app
    g, group, target = _field_battle(a, g)
    ev = g.phase.apply(C.Attack(group, *target))
    duels = [e for e in ev if isinstance(e, E.Duel)]
    assert len(duels) >= 2 and any(e.info["loser"] == "attacker" for e in duels)
    d, blasts = _play(a, g)
    assert [s for _, s in blasts] == _expected_slots(ev)
    starts = [f for f, _ in blasts]
    ticks = [13 * k for k in range(len(starts))]                     # 5 + 3 + 5 per kill
    assert [f - starts[0] for f in starts] == [tick_frames(t, a.cfg.tick_hz) for t in ticks]
    assert d.dead == set(_expected_slots(ev))
    end = next(e for e in ev if isinstance(e, E.BattleEnded))
    T = d.k.text
    assert d.lines[0] == (T.S(B.HERO_WON, 0, g.state.heroes[g.state.armies[6].hero_slot].name)
                          if end.info["attacker_won"] else T.S(B.LOST, 0))
    a.step([UP])                                                     # flushed? no: a later frame
    a.step([UP])
    assert not any(isinstance(x, F.Fight) for x in g.dialogs)


@gamedata
def test_space_bar_skips_the_rest(game_app, monkeypatch):
    from warlords2.audio import effects
    calls = []
    monkeypatch.setattr(effects, "army", lambda app, n: calls.append(n) or 0)
    a, g = game_app
    g, group, target = _field_battle(a, g)
    ev = g.phase.apply(C.Attack(group, *target))
    n = sum(isinstance(e, E.Duel) for e in ev)
    d, blasts = _play(a, g, space_at=3)                               # during the first kill
    assert [s for _, s in blasts] == _expected_slots(ev) and d.fast
    starts = [f - blasts[0][0] for f, _ in blasts]
    ticks = [0] + [13 + 5 * k for k in range(n - 1)]                  # kill 1 slow, the rest fast
    assert starts == [tick_frames(t, a.cfg.tick_hz) for t in ticks]
    assert len(calls) == 1                                            # only the first kill's sample


@gamedata
def test_mark_and_window_layout(game_app):
    a, g = game_app
    g, group, target = _field_battle(a, g)
    ev = g.phase.apply(C.Attack(group, *target))
    d = g.dialogs.top
    start = next(e for e in ev if isinstance(e, E.BattleStarted))
    n_a, n_d = len(start.info["attackers"]), len(start.info["defenders"])
    pos = F.slot_positions(d.k.exe, n_a, n_d)
    assert pos[0][1] == 86 and pos[F.A_BASE][1] == 246
    assert len(pos) == n_a + n_d and d.phase == "kills" and d.hides_pointer
    (sx, sy, w, h), (dx, dy) = F.mark_blit(d.k.exe, g.view.origin, *target)
    left, top = g.view.origin
    assert (dx, dy) == ((target[0] - left) * 40 - 40, (target[1] - top) * 40 - 40) and (w, h) == (128, 120)
    assert F.mark_blit(d.k.exe, (10, 20), 10, 28) == ((40, 0, 80, 80), (0, 280))


def test_slot_rows(monkeypatch):
    def words(_exe, off, n, signed=True):            # DS:0d14 / 0d1e / 0d2e of v1.02
        tab = {F.ROW_Y: (86, 116, 146, 176, 246), F.EVEN_X: (216, 248, 280, 312, 344, 376, 408, 440),
               F.ODD_X: (232, 264, 296, 328, 360, 392, 424, 176)}
        return tab[off][:n]
    monkeypatch.setattr(F, "ds_words", words)
    p = F.slot_positions(None, 2, 11)
    assert [p[i] for i in range(8)] == [(x, 86) for x in (216, 248, 280, 312, 344, 376, 408, 440)]
    assert [p[i] for i in range(8, 11)] == [(296, 116), (328, 116), (360, 116)]
    assert [p[32], p[33]] == [(312, 246), (344, 246)]


# --------------------------------------------------------------------------- capture


def _capture(g, ci, slots):
    st = g.state
    c = st.cities[ci]
    for s, t in zip(c.slots, slots):
        s.type = t
    ev = E.CityCaptured({"city": ci, "attacker": st.current, "owner": 0x0F, "texts": [1, 2]})
    st.pending = ev
    F.battle_names(g)[:] = [None, None]
    return ev


@gamedata
def test_capture_buttons_follow_the_values(game_app):
    a, g = game_app
    st = g.state
    for slots, pv, sv in (([-1, -1, -1, -1], DISABLED, DISABLED), ([2, -1, -1, -1], NORMAL, DISABLED),
                          ([11, 2, 4, -1], NORMAL, NORMAL)):
        ev = _capture(g, 3, slots)
        d = CP.Capture(g, ev)
        assert d.row.state[CP.PILLAGE] == pv and d.row.state[CP.SACK] == sv       # ovl31:021e..024e
        assert d.row.state[CP.OCCUPY] == d.row.state[CP.RAZE] == NORMAL
        assert K.first_live(d.row, CP._return_list) == CP.OCCUPY                 # 07be:0001 -> 285
        assert K.first_live(d.row, d.esc_list) == CP.OCCUPY


@gamedata
def test_capture_tutorial_page_once_per_app(game_app):
    """ovl31:0276..027d: with SCN 0x12e the first capture of the run shows FILE.DAT (25, 10) and
    sets DS:0a54 (`App.capture_tutorial_shown`); a second capture in the same App shows none."""
    a, g = game_app
    st = g.state
    st.flags[0x12E] = 1
    assert not a.capture_tutorial_shown
    opened = []
    for _ in range(2):
        CP.captured(g, _capture(g, 3, [11, 2, 4, -1]))
        opened.append([d.dialog_id for d in g.dialogs])
        while g.dialogs.top is not None:
            g.dialogs.top.close(None)
    assert opened == [["capture", "tutorial_page"], ["capture"]] and a.capture_tutorial_shown


@gamedata
def test_capture_texts_are_the_engine_rolls(game_app):
    """ovl31:0039 / 005a: the engine's rolls (CityCaptured info "texts"); the dialog draws none."""
    a, g = game_app
    st = g.state
    ev = _capture(g, 3, [11, 2, 4, -1])
    before = st.rng.state()
    k = registry_kit(a)
    d = CP.Capture(g, ev)
    names = (st.players[0].name, st.cities[3].name)
    assert d.lines[:2] == [k.text.S(0x42, 1, names[0]), k.text.S(0x43, 2, names[1])]
    assert st.rng.state() == before


def registry_kit(a):
    from warlords2.ui.widgets import kit
    return kit(a)


@gamedata
def test_raze_quest_sets_return(game_app):
    a, g = game_app
    st = g.state
    st.options = dataclasses.replace(st.options, quests=1)
    q = st.players[0].quest
    q.active, q.type, q.target, q.hero = 1, 5, 3, 6
    st.selection.hero = 6
    ev = _capture(g, 3, [11, 2, 4, -1])
    d = CP.Capture(g, ev)
    assert K.first_live(d.row, CP._return_list) == CP.RAZE
    d2 = CP.Capture(g, ev)                                         # normalised again (284 -> 285 first)
    assert K.first_live(d2.row, CP._return_list) == CP.RAZE


@gamedata
def test_pillage_result_popup(game_app):
    a, g = game_app
    st = g.state
    ev = _capture(g, 3, [11, 2, 4, -1])
    registry.open_dialog("capture", g, event=ev)
    d = g.dialogs.top
    gold = st.players[0].gold
    pv = CP.RC.pillage_value(st, 3)
    d.press(CP.PILLAGE)
    r = g.dialogs.top
    assert r.dialog_id == "capture/result" and r.lost == [(4, pv)] and pv > 0
    assert st.players[0].gold == gold + pv and CP.RC.filled_slots(st.cities[3]) == 2
    assert r.texts[3][1] == r.k.text.S(0x48, 1, 2)                       # 2 units remain (DS:4116)
    a.step([UP])
    assert not any(isinstance(x, (CP.Capture, CP.CaptureResult)) for x in g.dialogs)


# --------------------------------------------------------------------------- advisor


@gamedata
def test_advisor_shows_combat_odds(game_app):
    a, g = game_app
    g, group, target = _field_battle(a, g)
    st = g.state
    probe = st.copy()
    want = combat.odds(probe, group, *target)
    k = registry_kit(a)
    lines = (probe.rng.rnd(1, len(k.text.group(0x7c)), -1), probe.rng.rnd(1, len(k.text.group(0x7d)), -1))
    registry.left_click_handler("advisor")(g, target, None)
    d = g.dialogs.top
    assert d.dialog_id == "advisor" and d.verdict == want
    assert [s for _, s in d.lines] == [k.text.S(0x7c, lines[0]), k.text.S(0x7d, lines[1]), k.text.S(0x7e, want)]
    assert st.rng.state() == probe.rng.state()
    assert K.first_live(d.row, K.ds_list(k.exe, K.ESC_LIST)) == AD.CLOSE
    a.step([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_ESCAPE, unicode="\x1b", mod=0, scancode=0)])
    assert not g.dialogs


@gamedata
def test_advisor_off_does_nothing(game_app):
    a, g = game_app
    g.state.options = dataclasses.replace(g.state.options, military_advisor=0)
    assert registry.left_click_handler("advisor")(g, (50, 69), None) is None and not g.dialogs


# --------------------------------------------------------------------------- scripts


WANT = {"m5b_raze": (["advisor", "fight", "tutorial_page", "capture", "message"], E.CityRazed),
        "m5b_battle": (["advisor", "fight", "tutorial_page", "capture", "capture/result"], E.CityPillaged)}


def _traced_run(script, out, monkeypatch):
    """debug.run.run with the attack allowed, recording the top dialog and the battle window's
    explosion of every frame and the events of every command the human phase applies."""
    from warlords2 import app as A
    from warlords2.debug.run import run
    from warlords2.states.phases import human as H
    frames, events = [], []
    step, apply = A.App.step, H.Human.apply

    def traced_step(self, ev=None):
        step(self, ev)
        g = self.manager.current_state()
        top = getattr(g, "dialogs", None) and g.dialogs.top
        frames.append((getattr(top, "dialog_id", None), getattr(top, "blast", None)))

    def traced_apply(self, cmd, *a, **k):
        out_ = apply(self, cmd, *a, **k)
        events.append((cmd, list(out_ or ())))
        return out_

    monkeypatch.setattr(A.App, "step", traced_step)
    monkeypatch.setattr(H.Human, "apply", traced_apply)
    set_allow_unverified(True)
    try:
        m = run(script, out, ["--headless"], enforce_golden=False)
    finally:
        set_allow_unverified(False)
        monkeypatch.undo()
    return m, frames, events


@gamedata
@pytest.mark.parametrize("name", sorted(WANT))
def test_scripts_with_the_attack(name, tmp_path, monkeypatch):
    """The battle scripts with the attack allowed (tests/test_scripts.py runs them strictly,
    where the attack is refused): the dialogs come in the EXE's order, the explosions are the
    Duel events' losers, the choice is applied, and two runs give the same frames."""
    m1, frames, events = _traced_run(SCRIPTS / f"{name}.json", tmp_path / "a", monkeypatch)
    m2, _, _ = _traced_run(SCRIPTS / f"{name}.json", tmp_path / "b", monkeypatch)
    assert all(c["ok"] for c in m1["checks"]) and all(c["ok"] for c in m2["checks"])
    assert [s["sha256"] for s in m1["shots"]] == [s["sha256"] for s in m2["shots"]]
    assert [seg["frame_sha256"] for seg in m1["segments"]] == [seg["frame_sha256"] for seg in m2["segments"]]
    seen = [d for i, (d, _) in enumerate(frames) if d is not None and (i == 0 or frames[i - 1][0] != d)]
    want, choice = WANT[name]
    it = iter(seen)
    assert all(w in it for w in want), seen                         # in this order
    attack = next(ev for cmd, ev in events if isinstance(cmd, C.Attack) and ev)
    blasts = [b for i, (d, b) in enumerate(frames) if b is not None and frames[i - 1][1] != b]
    assert blasts == _expected_slots(attack)
    assert any(isinstance(e, choice) for _, ev in events for e in ev)


def _hero_next_to(a, g, x, y):
    st = g.state
    hero = next(h for h in st.armies if h.owner == 0 and h.type_id == 28)
    hero.x, hero.y = x, y
    _hand_edit_done(g.state)
    g.phase.apply(C.SelectStack(x, y))
    g.scroll_to(x, y)
    return _settle(a), hero


@gamedata
def test_unopposed_city_lines(game_app):
    """ovl36:030f..03c2: no defenders -> (0x8d, rnd) with the engine's roll (BattleEnded info
    "fled_text"), then (0x8e) with the hero's name; DS:4148 / 4134 for the capture question."""
    a, g = game_app
    st = g.state
    st.armies[2].x, st.armies[2].y = -1, -1                         # Zekond's garrison gone
    g, hero = _hero_next_to(a, g, 51, 69)
    ev = g.phase.apply(C.Attack((hero.id,), 50, 69))
    assert not any(isinstance(e, E.Duel) for e in ev)
    d, _ = _play(a, g)
    T = d.k.text
    name = st.heroes[hero.hero_slot].name
    end = next(e for e in ev if isinstance(e, E.BattleEnded))
    assert d.lines == [T.S(0x8D, end.info["fled_text"]), T.S(0x8E, 0, name)]
    assert F.battle_names(g) == [name, st.cities[3].name]


@gamedata
def test_loot_line_inside_the_window(game_app):
    """ovl36:0e18..0e32: the loot line (0x93) is the window's next line, before its wait."""
    a, g = game_app
    st = g.state
    st.players[7].gold = 400
    st.armies[5].strength = 1
    g, hero = _hero_next_to(a, g, 53, 50)
    ev = g.phase.apply(C.Attack((hero.id,), 52, 50))
    loot = next(e for e in ev if isinstance(e, E.Msg) and e.group == 0x93)
    d, _ = _play(a, g)
    assert d.lines[-1] == d.k.text.S(0x93, loot.index, *loot.args) and len(d.lines) == 2


@gamedata
def test_popup_keys_and_help(game_app, monkeypatch):
    """07be:0064 with DS:166a set on the advisor (screen 25): Esc / Return press 424, 'A'..'Z'
    nothing, every other key (Del, 'i', an arrow) the chord; a right press over 424 opens its
    HLP record (ovl15:0000)."""
    from warlords2.audio import effects
    a, g = game_app
    chords = []
    monkeypatch.setattr(effects, "chord", lambda app: chords.append(1))
    g, group, target = _field_battle(a, g)
    registry.left_click_handler("advisor")(g, target, None)
    d = g.dialogs.top
    k = registry_kit(a)
    assert K.popup_key(a, d.row, ord("Q"), k.exe) is None and not chords
    for code in (K.DEL, ord("i"), 0x14B, K.SILENT):
        assert K.popup_key(a, d.row, code, k.exe) is None
    assert len(chords) == 3                                         # 0x181 is silent
    assert K.popup_key(a, d.row, K.RETURN, k.exe) == AD.CLOSE
    b = next(b for b in d.row.buttons if b.id == AD.CLOSE)
    x, y, w, h = b.rect
    d.update([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=3, pos=(x + 2, y + 2))], 16)
    assert g.dialogs.top is not d and d.stack is not None


def test_map_redraw_goes_before_the_quest_check():
    """ovl36:0445..04e2: window close -> overview, re-selection, medals, map (ovl61:011f), quest."""
    from collections import deque
    from types import SimpleNamespace
    host = SimpleNamespace(state=SimpleNamespace(copy=lambda: "now"))
    q = [E.MedalAwarded({}), E.QuestCompleted({}), E.Msg({}), E.BattleEnded({})]
    anim = SimpleNamespace(queue=deque(q), overview=None)
    B.window_closed(host, anim)
    assert anim.overview == "now"
    assert [type(e) for e in anim.queue] == [E.MedalAwarded, B.MapRedraw, E.QuestCompleted, E.Msg, E.BattleEnded]
    anim = SimpleNamespace(queue=deque([E.MedalAwarded({}), E.BattleEnded({})]), overview=None)
    B.window_closed(host, anim)
    assert not any(isinstance(e, B.MapRedraw) for e in anim.queue)  # BattleEnded redraws
