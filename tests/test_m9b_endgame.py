"""M9b package V: the shield strip (ui/shield_strip.py, ovl68:0952), the victory / surrender /
decline screens (ui/dialogs/victory.py, surrender.py), the end-state messages of the round end
(states/phases/computer.py), the over phase (states/phases/over.py) and the turn-loop rollback."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

from types import SimpleNamespace  # noqa: E402

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model import events as E  # noqa: E402
from warlords2.model.ids import Control  # noqa: E402
from warlords2.model.state import SCN_SURRENDER_OFFERED, SCN_VICTORY  # noqa: E402
from warlords2.rules import victory as V  # noqa: E402
from warlords2.rules.constants import turn as KT  # noqa: E402
from warlords2.states.phases import computer as CP  # noqa: E402
from warlords2.ui import shield_strip as SS  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
ANSWER = {"hero_offer": 287, "production": 192}


def key(k, uni=""):
    return pygame.event.Event(pygame.KEYDOWN, key=k, mod=0, unicode=uni, scancode=0)


ESC, RET = key(pygame.K_ESCAPE, "\x1b"), key(pygame.K_RETURN, "\r")


def _app(game, tmp_path, controls, levels=None, scenario="ERYTHEA"):
    args = ["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", scenario,
            "--controls", controls, "--user-dir", str(tmp_path / "u")]
    if levels:
        args += ["--levels", levels]
    return App(parse_args(args))


def _top(g):
    d = getattr(g, "dialogs", None)
    return getattr(d.top, "dialog_id", type(d.top).__name__) if d and d.top is not None else None


def _until(a, cond, n=4000, click=("message", "turn_start", "tutorial_page")):
    """Step until cond(game); the pop-ups in `click` are dismissed, hero offer / production
    answered, every other dialog left alone."""
    for _ in range(n):
        g = a.manager.current_state()
        if cond(g):
            return g
        top = _top(g)
        if top in ANSWER:
            g.dialogs.top.press(ANSWER[top])
            a.step([])
            continue
        a.step([UP] if top in click else [])
    raise AssertionError("condition not reached")


def _phase(name):
    return lambda g: getattr(g, "phase_name", None) == name and not g.dialogs


def _dialog(name):
    return lambda g: _top(g) == name


# ----------------------------------------------------------------------------- strip layout


def _st(alive, order=range(8), current=0, turn=1):
    flags = {SS.SCN_TURN_ORDER + 2 * i: s for i, s in enumerate(order)}
    return SimpleNamespace(players=[SimpleNamespace(alive=int(p in alive)) for p in range(8)],
                           flags=flags, current=current, turn=turn)


def test_slots_right_aligned_in_turn_order():
    """ovl68:097f..0a39: live sides in the order 0x163, X = 0x200 + 16 (8 - n + c)."""
    st = _st({1, 4, 6}, order=[6, 0, 4, 2, 1, 3, 5, 7], current=4)
    sides, xs, cp = SS.slots(st)
    assert sides == [6, 4, 1] and xs == [592, 608, 624] and cp == 1
    assert SS.slots(_st(range(8)))[1] == [512 + 16 * i for i in range(8)]


def test_marks_current_black_previous_white_cyclic():
    """ovl68:0a3e..0ab0: A = cp, B = cp - 1; cp 0 -> B = n - 1; one side -> only B."""
    assert SS.marks(5, 3) == (3, 2)
    assert SS.marks(5, 0) == (0, 4)
    assert SS.marks(1, 0) == (None, 0)
    assert SS.marks(0, None) == (None, None)


@gamedata
def test_full_and_step_draw_pixels(game, tmp_path):
    """Full: white DS:3256, "Turn %d" right edge 4 px left of the first shield, no box; step:
    white box behind B, black box behind A, (X - 3, 1, 17, 15)."""
    from warlords2.ui.widgets import kit
    a = _app(game, tmp_path, "HCCCCCCC")
    try:
        s = SS.ShieldStrip(kit(a))
        assert s.rect == (437, 0, 202, 17) and s.fmt == "Turn %d"
        st = _st({0, 2, 5}, current=2, turn=0)
        s.draw(st, 1, 0)
        px = pygame.surfarray.array2d(s.layer)
        xs = SS.slots(st)[1]
        assert px[437, 0] == px[638, 16] == 15 and px[436, 0] == SS.CLEAR
        assert px[xs[1] - 3, 1] == 15                               # no box in a full draw
        ink = [x for x in range(437, xs[0]) if (px[x, :] == 0).any()]
        assert ink and max(ink) < xs[0] - 4 + 1 and max(ink) >= xs[0] - 8
        s.draw(st, 0, 0)
        px = pygame.surfarray.array2d(s.layer)
        assert px[xs[1] - 3, 1] == 0 and px[xs[1] + 13, 15] == 0    # black: side on turn (slot 1)
        assert px[xs[0] - 3, 1] == 15                               # white: slot 0
        s.draw(st, 1, 0)
        before = pygame.surfarray.array2d(s.layer).copy()
        s.draw(st, 0, 1)                                            # quiet: no box
        assert (pygame.surfarray.array2d(s.layer) == before).all()
        s.draw(_st(set()), 1, 0)                                    # no live side: nothing
        assert (pygame.surfarray.array2d(s.layer) == before).all()
    finally:
        a.close()


# ----------------------------------------------------------------------------- strip in the game


@gamedata
def test_strip_from_begin_and_after_the_human_turn_start(game, tmp_path):
    """Nothing before Begin (m3_dragon's golden); Begin's full draw (ovl61:0034); the human turn
    start's step draw (ovl68:0374, after "human_turn") boxes the human black (probed at X - 2: a box spans X - 3 .. X + 13, so neighbours share a column); after End Turn a
    computer side is boxed (ovl25:0064), and on the next human turn the human again."""
    a = _app(game, tmp_path, "HCCCCCCC")
    try:
        g = a.manager.current_state()
        for _ in range(3):
            a.step([])
        g = a.manager.current_state()
        assert getattr(g, "shield_strip", None) is None
        g = _until(a, _phase("human"))
        s = g.shield_strip
        assert s is not None and s.drawn
        sides, xs, _ = SS.slots(g.state)
        px = pygame.surfarray.array2d(s.layer)
        human = sides.index(0)
        assert px[xs[human] - 2, 1] == 0
        g.end_turn()
        seen = set()
        while g.phase_name == "computer":
            px = pygame.surfarray.array2d(s.layer)
            seen |= {sides[i] for i, x in enumerate(xs) if px[x - 2, 1] == 0}
            a.step([])
        assert len(seen) > 2
        g = _until(a, _phase("human"))
        px = pygame.surfarray.array2d(s.layer)
        assert [i for i, x in enumerate(xs) if px[x - 2, 1] == 0] == [human]
        from warlords2.ui.screen import IDENTITY
        fb = pygame.Surface((640, 480), depth=8)
        fb.set_palette(IDENTITY)
        g.paint(fb)
        assert fb.get_at_mapped((xs[human] - 2, 1)) == 0 and fb.get_at_mapped((437, 0)) == 15
    finally:
        a.close()


# ----------------------------------------------------------------------------- the victory


@pytest.fixture
def lone(game, tmp_path):
    a = _app(game, tmp_path, "CCCCCCCC", "03333333")
    yield a
    a.close()


@gamedata
def test_lone_computer_wins_victory_screen_then_over(lone):
    """ovl61:1aed: no human, one computer -> the winner line (S(15, 0), one-line wait at 1d71)
    before the round-end strip; the side is human, its turn start shows the victory screen
    (popup 0x16, JOIN 32) with Victory pending; Esc presses 483 -> CloseVictory -> the over phase,
    Hidden Map off; End Turn does nothing there."""
    a = lone
    g = _until(a, _dialog("message"), click=())                     # STRING 14 at Begin
    a.step([UP])
    g = _until(a, _dialog("message"), click=())                     # the winner line
    d = g.dialogs.top
    from warlords2.ui.widgets import kit
    assert d.lines == [kit(a).text.S(15, 0, g.state.players[0].name)]
    assert g.phase_name == "computer" and g.state.turn == 2
    assert g.state.players[0].control == Control.COMPUTER       # d0 = 0 only after the wait (1d80)
    assert g.shield_strip.drawn
    a.step([UP])
    g = _until(a, _dialog("victory"), click=("turn_start",))
    assert isinstance(g.state.pending, E.Victory)
    v = g.dialogs.top
    assert v.popup == 0x16 and [b.id for b in v.row.buttons] == [483]
    a.step([UP])                                                    # a release off the button
    assert _top(g) == "victory"
    a.step([ESC])
    g = _until(a, _phase("over"), click=())
    st = g.state
    assert st.pending is None and st.flags[SCN_VICTORY] and st.flags[KT.SCN_ACK_VICTORY.value]
    assert st.options.hidden_map == 0
    h = st.hash()
    a.step([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(408, 8))])   # menus live
    assert type(g.dialogs.top).__name__ == "MenuDialog"
    g.dialogs.top.close(None)
    g.end_turn()
    for _ in range(5):
        a.step([])
    assert g.phase_name == "over" and st.hash() == h


@gamedata
def test_victory_return_presses_483_and_answers_once(lone, monkeypatch):
    a = lone
    calls = []
    g = _until(a, _dialog("victory"), click=("message", "turn_start"))
    orig = type(g).answer
    monkeypatch.setattr(type(g), "answer", lambda self, cmd, **kw: calls.append((cmd, kw)) or orig(self, cmd, **kw))
    g.bar_blank = True
    monkeypatch.setattr(g.phase, "play", lambda events, before: None)   # ovl61:011f(1, 1, 1) itself, not the
    a.step([RET])                                                        # turn start's info_bar cue
    assert [type(c).__name__ for c, _ in calls] == ["CloseVictory"] and calls[0][1] == {}
    assert g.bar_blank is False


# ----------------------------------------------------------------------------- the surrender


def _offer(a):
    """The human phase of ERYTHEA, then the surrender offer as ovl68:04bd would leave it."""
    g = _until(a, _phase("human"))
    st = g.state
    st.flags[SCN_SURRENDER_OFFERED] = 1
    g.turn_events = V.surrender_offer(st)
    g._next = "turn_start"
    return _until(a, _dialog("surrender"), click=())


@pytest.fixture
def erythea(game, tmp_path):
    a = _app(game, tmp_path, "HCCCCCCC")
    yield a
    a.close()


@gamedata
def test_surrender_offer_screen_and_accept_by_return(erythea):
    """Popup 0x14 (RESIGN.PCK), JOIN 30, 485 / 486; Return = 485 (DS:155c) -> the computers out,
    the victory screen; no palette refresh with the answer (ovl61:1e4e)."""
    a = erythea
    g = _offer(a)
    d = g.dialogs.top
    assert d.popup == 0x14 and sorted(b.id for b in d.row.buttons) == [485, 486]
    refreshed = []
    g._refresh_palette = lambda: refreshed.append(1)
    a.step([RET])
    g = _until(a, _dialog("victory"), click=())
    assert isinstance(g.state.pending, E.Victory) and not refreshed
    assert not any(p.alive and p.control == Control.COMPUTER for p in g.state.players)


@gamedata
def test_surrender_decline_by_esc_holds_the_turn_start_until_484(erythea):
    """Esc = 486 (DS:1514) -> the decline screen (popup 0x15, JOIN 31, 484); the turn start's
    events wait behind it; 484 (Return) runs ovl61:011f(0, 0, 0) and the human phase follows."""
    a = erythea
    g = _offer(a)
    a.step([ESC])
    g = _until(a, _dialog("surrender_declined"), click=())
    d = g.dialogs.top
    assert d.popup == 0x15 and [b.id for b in d.row.buttons] == [484]
    assert g.state.pending is None and g.phase_name == "turn_start"
    assert g.phase.animator.busy                                    # the held events
    for _ in range(5):
        a.step([])
    held = [e.info.get("kind") for e in g.phase.animator.queue if isinstance(e, E.TurnCue)]
    assert _top(g) == "surrender_declined" and "city_screen" in held   # turn 1: ovl45:0000(2) waits
    refreshed = []
    orig = g._refresh_palette
    g._refresh_palette = lambda: (refreshed.append(1), orig())
    a.step([RET])
    assert refreshed and _top(g) != "surrender_declined"
    g = _until(a, _dialog("production"), click=())
    g = _until(a, _phase("human"), click=())
    assert g.state.flags[KT.SCN_ACK_SURRENDER.value] == 1


# ----------------------------------------------------------------------------- end states


@gamedata
def test_end_state_points_wait_on_message_popups(erythea):
    """no_players / no_humans: two lines S(g, i), S(g, i + 1) (ovl61:1160); winner: one line
    with the name (ovl61:10fb); each holds the run until dismissed; quit ends the program."""
    a = erythea
    g = _until(a, _phase("human"))
    ph = CP.ComputerTurn(g)
    ph.current = True
    T = ph.k.text
    for name in ("no_players", "no_humans"):
        group = 12 if name == "no_players" else 13
        ph.keys.append(0x61)
        assert ph.handle(name, {"group": group, "index": 2, "at": "x"}) is None
        assert g.dialogs.top.lines == [T.S(group, 2), T.S(group, 3)] and ph.waiting()
        g.dialogs.top.close(None)
        assert not ph.waiting() and ph.keys                     # ovl61:1160: no flush
    ph.handle("winner", {"group": 15, "index": 0, "args": ("Abc",), "at": "x"})
    assert g.dialogs.top.lines == [T.S(15, 0, "Abc")] and ph.keys
    g.dialogs.top.close(None)
    assert not ph.keys                                          # ovl61:10fb: ovl59:01f1 at 1159
    ph.keys.append(0x61)
    ph.handle("eliminated", {"group": 11, "index": 0, "args": ("Abc",), "timed": False, "wait": 100})
    g.dialogs.top.close(None)
    assert not ph.keys
    it = ph.handle("quit", {"at": "ovl61:1c55"})
    assert a.running is False and next(it) is None and next(it) is None


@gamedata
def test_resigned_human_gives_no_humans_messages_at_the_round_end(erythea):
    """Resign razes every city; the round end eliminates the human and ovl61:1aed shows the two
    STRING 13 pop-ups (1c8d / 1cb4) in the computer phase; the war goes on."""
    a = erythea
    got = []
    orig = CP.ComputerTurn.handle

    def handle(self, name, info):
        got.append(name)
        return orig(self, name, info)
    CP.ComputerTurn.handle = handle
    try:
        g = _until(a, _phase("human"))
        g.apply(C.Resign(True))
        g.end_turn()
        T = g.phase.k.text
        msgs = []
        for _ in range(20000):
            top = g.dialogs.top
            if _top(g) == "message":
                msgs.append(list(top.lines))
                a.step([UP])
                if "no_humans" in got and got.count("no_humans") == 2:
                    break
                continue
            a.step([])
        assert [T.S(13, 0), T.S(13, 1)] in msgs and [T.S(13, 2), T.S(13, 3)] in msgs
        assert got.count("no_humans") == 2
        assert g.state.players[0].control == Control.COMPUTER
    finally:
        CP.ComputerTurn.handle = orig


# ----------------------------------------------------------------------------- rollback


@gamedata
def test_failed_run_restores_the_production_report_and_the_strip(erythea, monkeypatch, caplog):
    """`Game.run_failed` puts the production report block (not in the snapshot) back byte for
    byte, also the slot bytes past the count and a count above 127, and the strip."""
    from warlords2.ai.phases import production
    from warlords2.model.state import REPORT_COUNT, ReportEntry
    a = erythea
    g = _until(a, _phase("human"))
    rep = g.state.production_report
    rep.clear()
    rep.append(ReportEntry(2, 1, 0, -1))
    rep.data[REPORT_COUNT - 1] = 0x5A                # a slot byte past the count
    before = bytes(rep.data)
    layer = pygame.surfarray.array2d(g.shield_strip.layer).copy()
    changed = []
    orig = production.production

    def boom(st):
        changed.append(st.current)
        if len(changed) == 2:                     # the second computer side: report and strip moved on
            d = st.production_report.data
            d[REPORT_COUNT - 1] = 0x11                   # past the count
            d[REPORT_COUNT] = 0x90                       # a count read as negative (s8)
            raise RuntimeError("planted")
        return orig(st)
    monkeypatch.setattr(production, "production", boom)
    g.end_turn()
    for _ in range(4000):
        if g.phase_name == "human" and "planted" in caplog.text:
            break
        a.step([])
    assert "planted" in caplog.text and g.phase_name == "human"
    assert len(changed) == 2
    assert bytes(g.state.production_report.data) == before
    assert (pygame.surfarray.array2d(g.shield_strip.layer) == layer).all()
