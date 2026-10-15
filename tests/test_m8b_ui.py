"""M8b1 UI: the computer sides' turns on screen (states/phases/computer.py: the engine paused at
its present points, the picture drawn from the real state; ui/turn_bar.py)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

from types import SimpleNamespace  # noqa: E402

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model import commands as C  # noqa: E402
from warlords2.model.ids import MAP_W, Control  # noqa: E402
from warlords2.rules.engine import apply  # noqa: E402
from warlords2.states.phases import computer as CP  # noqa: E402
from warlords2.ui.layout import DISABLED  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
ANSWER = {"hero_offer": 287, "production": 192}   # accept (ovl47:120c), Done (ovl45)
SHIFT = dict(key=pygame.K_LSHIFT, mod=0, unicode="", scancode=0)
BARS = [5, 10, 15, 20, 25, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]
HIDDEN_MAP = "1,1,0,1,0,0,0,0,0,0"


def _app(game, tmp_path, scenario, controls, options=None):
    args = ["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", scenario,
            "--controls", controls, "--user-dir", str(tmp_path / "u")]
    if options:
        args += ["--options", options]
    return App(parse_args(args))


def _top(g):
    d = getattr(g, "dialogs", None)
    return getattr(d.top, "dialog_id", type(d.top).__name__) if d and d.top is not None else None


def _until(a, cond, n=3000):
    """Step until cond(state); pop-ups are dismissed (the hero offer accepted, the production
    screen closed), Settings is left alone."""
    for _ in range(n):
        g = a.manager.current_state()
        if cond(g):
            return g
        top = _top(g)
        if top in ANSWER:
            g.dialogs.top.press(ANSWER[top])
            a.step([])
            continue
        a.step([UP] if top not in (None, "settings") else [])
    raise AssertionError("condition not reached")


def _human(g):
    return getattr(g, "phase_name", None) == "human" and not g.dialogs


def _phase(name):
    return lambda g: getattr(g, "phase_name", None) == name


@pytest.fixture
def erythea(game, tmp_path):
    a = _app(game, tmp_path, "ERYTHEA", "HCCCCCCC")
    yield a
    a.close()


@pytest.fixture
def record(monkeypatch):
    """Every present point the computer phase draws: (frame, name, info)."""
    got = []
    orig = CP.ComputerTurn.handle

    def handle(self, name, info):
        got.append((self.game.app.frame, name, info, self))
        return orig(self, name, info)
    monkeypatch.setattr(CP.ComputerTurn, "handle", handle)
    return got


def _end_turn(a):
    """End Turn from the human phase; returns (game, the engine-only result of the same End Turn)."""
    g = _until(a, _human)
    want = g.state.copy()
    apply(want, C.EndTurn())
    g.end_turn()
    assert g.phase_name == "computer"                 # at once: no frame between (ovl61:2074 -> 2123)
    return g, want


def _to_turn_start(a, g):
    n = 0
    while g.phase_name == "computer":
        a.step([])
        n += 1
        assert n < 60000
    return n


@gamedata
def test_end_turn_plays_each_computer_side_then_the_turn_start(erythea, record, monkeypatch):
    """ovl68:0000 per side: its name (ovl61:11d1), 1291 and 131b(5); then ovl25:0000's 18 bars
    in order; no pointer (ovl61:21e8); then the human turn start; the state is the engine's."""
    a = erythea
    bars = []
    orig = CP.TurnBar.progress
    monkeypatch.setattr(CP.TurnBar, "progress", lambda self, st, n: (bars.append((st.current, n)), orig(self, st, n)))
    g, want = _end_turn(a)
    names, hidden = [], 0
    while g.phase_name == "computer":
        ph = g.phase
        if ph.bar.text is not None and (not names or names[-1] != ph.bar.text[0]):
            names.append(ph.bar.text[0])
        hidden += ph.hides_pointer
        a.step([])
    assert g.phase_name == "turn_start"
    sides = [p.name for p in want.players[1:]]
    assert [n for n in names if n in sides] == sides
    for p in range(1, 8):
        assert [n for q, n in bars if q == p] == BARS
    assert hidden > 0
    assert g.state.hash() == want.hash()


@gamedata
def test_end_turn_disables_the_palette_for_the_run(erythea):
    """ovl61:0418 at End Turn (2092): 0xad..0xb7, 0xba..0xbc, 0xf0, 0xf1, 0x140..0x147
    disabled; nothing enables them during the computer turns (no ovl61:0174); the turn start
    shows them so until ovl68:05ad."""
    a = erythea
    g, _ = _end_turn(a)
    while g.phase_name == "computer":
        st = g.phase.palette.row.state
        assert all(st.get(i) == DISABLED for i in CP.END_TURN_OFF)
        a.step([])
    ts = g
    a.step([])
    assert ts.phase_name == "turn_start"
    assert all(ts.phase.palette.row.state.get(i) == DISABLED for i in CP.END_TURN_OFF)


@gamedata
def test_observe_off_keeps_the_map_and_the_step_waits(erythea, record):
    """ovl64:006c returns for a computer side with SCN 0x159 == 0: the map picture End Turn drew
    stays; the walk's step wait (0a8b:05f7..0654) still runs, so the turns take frames."""
    a = erythea
    g = _until(a, _human)
    for p in range(1, 8):
        assert g.command(C.SetObserve(p, False)) is not None
    g, want = _end_turn(a)
    picture = g.phase.map
    first = pygame.image.tobytes(picture, "P")
    frames = _to_turn_start(a, g)
    steps = [r for r in record if r[1] == "step"]
    assert steps and frames > 3 * len(steps) // 2
    assert pygame.image.tobytes(picture, "P") == first and all(r[3].map is picture for r in steps)
    assert g.state.hash() == want.hash()


@gamedata
def test_shift_held_opens_settings_after_the_side(erythea, record):
    """ovl25:045e: Shift held -> ovl33:0000(0) after the side's phases, drawn with that side's
    colours (SCN 0x110 then); the loop runs to ovl61:220b and stops there (the next side has
    not started); closing (251) goes on; the result is the engine's."""
    a = erythea
    g, want = _end_turn(a)
    for _ in range(40):
        a.step([])
    a.step([pygame.event.Event(pygame.KEYDOWN, **SHIFT)])
    g = _until(a, lambda g: _top(g) == "settings")
    side = next(r[2]["player"] for r in reversed(record) if r[1] == "turn_start")
    d = g.dialogs.top
    f = g.state.flags
    assert d.title_colours == (f[0xA0 + 2 * side], f[0xB0 + 2 * side])
    for _ in range(5):
        a.step([])
    ph = g.phase
    assert ph.runner is None and ph.done_events is not None          # stopped at 220b
    assert record[-1][1] == "loop_check" and g.state.current != side
    n = len(record)
    for _ in range(5):
        a.step([])
    assert len(record) == n and _top(g) == "settings"                 # nothing runs meanwhile
    a.step([pygame.event.Event(pygame.KEYUP, **SHIFT)])
    g.dialogs.top.press(251)
    a.step([])
    assert _top(g) is None
    g = _until(a, _phase("turn_start"))
    assert g.state.hash() == want.hash()


@gamedata
def test_settings_changes_reach_the_next_side(erythea):
    """The loop stops after the side whose turn ovl25:045e interrupted (ovl61:220b); a change
    made in the dialog (Observe off for every side) applies to the sides after it."""
    a = erythea
    g, _ = _end_turn(a)
    for _ in range(40):
        a.step([])
    a.step([pygame.event.Event(pygame.KEYDOWN, **SHIFT)])
    g = _until(a, lambda g: _top(g) == "settings" and g.phase.runner is None)
    a.step([pygame.event.Event(pygame.KEYUP, **SHIFT)])
    nxt = g.state.current
    for p in range(1, 8):
        if g.state.players[p].shown:
            g.dialogs.top.press(268 + p)
    assert not any(g.state.players[p].shown for p in range(1, 8))
    g.dialogs.top.press(251)
    want = g.state.copy()
    from warlords2.rules import turn as T
    while want.pending is None and want.players[want.current].control != Control.HUMAN:
        T.run(want, max_sides=1)
    a.step([])
    assert g.state.current == nxt and g.state.flags[0x159] == 0
    g = _until(a, _phase("turn_start"))
    assert g.state.hash() == want.hash()


@gamedata
def test_begin_computer_battle_against_a_human_shows_the_window(game, tmp_path, record):
    """TUTORIA, the Knights computer: Begin runs their turn (one side per run); their attack on
    the human Darklords: the mark (1836), STRING 0x94, the window and its kills (show2: a human
    defender), the result line in the info area and the window, the window closed without a
    wait (ovl37:04f6 for a computer side), the map rebuilt (1836(x, y, 0)); then the
    Darklords' Turn 1."""
    a = _app(game, tmp_path, "TUTORIA", "CCCCCCCH")
    g = _until(a, lambda g: getattr(g, "phase", None) is not None and getattr(g.phase, "fight", None) is not None)
    d = g.phase.fight
    assert g.phase_name == "computer" and not d.mark and not d.human
    phases = set()
    while g.phase.fight is d:
        phases.add(d.phase)
        a.step([])
    assert {"kills", "result"} <= phases and d.dead and d.lines
    names = [r[1] for r in record]
    i = names.index("battle_window")
    assert names[i - 2:i] == ["battle_mark", "battle_before"] or names[i - 1] == "battle_before"
    assert names[names.index("battle_result") + 1] == "battle_after"
    g = _until(a, lambda g: _top(g) == "turn_start")
    assert g.state.players[g.state.current].control == Control.HUMAN
    a.close()


@gamedata
def test_battle_result_names_the_hero_ds_5e5e(game, tmp_path, record):
    """The won line 0x8e names DS:5e5e (state.selection.hero after ovl36:0a6b), else 0x96 with
    the side's name; drawn in the info area when DS:0cf8 (ovl36:16b3)."""
    from warlords2.ui.widgets import kit
    a = _app(game, tmp_path, "ERYTHEA", "HCCCCCCC")
    T = kit(a).text
    lines = []
    orig = CP.ComputerTurn._result

    def result(self, line, window):
        st = self.game.state
        h = st.selection.hero
        hero = st.heroes[st.armies[h].hero_slot].name if 0 <= h < len(st.armies) else None
        lines.append((line, hero, st.players[st.current].name))
        return orig(self, line, window)
    CP.ComputerTurn._result = result
    try:
        g, _ = _end_turn(a)
        _to_turn_start(a, g)
    finally:
        CP.ComputerTurn._result = orig
    assert lines
    for line, hero, side in lines:
        assert line in (T.S(0x98, 0, side), T.S(0x96, 0, side)) or (hero and line == T.S(0x8E, 0, hero))
    assert any(hero and line == T.S(0x8E, 0, hero) for line, hero, _ in lines)
    a.close()


@gamedata
def test_survivors_drawn_on_their_square_after_a_capture(game, tmp_path, record):
    """After a computer battle the picture is the state's: at 1836(x, y, 0) every army of the
    attacking side in the view is drawn on its own square (the take-over leaves the group at
    the city's corner, not on the attacked square)."""
    a = _app(game, tmp_path, "ERYTHEA", "HCCCCCCC")
    g, _ = _end_turn(a)
    checked = 0
    orig = CP.ComputerTurn.p_battle_after

    def after(self, x, y):
        nonlocal checked
        orig(self, x, y)
        st = self.game.state
        left, top = self.map_origin
        for a_ in st.armies:
            if a_.owner == st.current and a_.x >= 0 and left <= a_.x < left + 9 and top <= a_.y < top + 9:
                assert self.cells[a_.x - left][a_.y - top].count > 0
                checked += 1
    CP.ComputerTurn.p_battle_after = after
    try:
        _to_turn_start(a, g)
    finally:
        CP.ComputerTurn.p_battle_after = orig
    assert checked
    a.close()


@gamedata
def test_keys_typed_during_the_turn_wait_in_the_buffer(erythea):
    """The BIOS buffer: keys typed during a computer turn stay until the next loop pass
    (ovl59:01f1 at ovl61:2165) or the kills' flush (ovl37:0157); the kill loop takes one per
    kill (ovl37:00ae), a space makes the rest fast."""
    a = erythea
    g, _ = _end_turn(a)
    ph = g.phase
    a.step([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_SPACE, mod=0, unicode=" ", scancode=0)])
    assert list(ph.keys) == [0x20]
    ph.handle("loop_pass", {})
    assert not ph.keys
    d = SimpleNamespace(fast=False, dead=set(), blast=None, phase="kills", slot=lambda ev: 0)
    ph.keys.extend([ord("a"), 0x20])
    kills = ph._kills(d, [{"loser": "attacker"}, {"loser": "defender"}, {"loser": "defender"}])
    for _ in kills:
        pass
    assert d.fast and not ph.keys and d.phase == "result"


@gamedata
def test_hidden_map_one_human_gates_the_map_draw(game, tmp_path):
    """ovl64:006c with DS:3254: a stack square whose neighbours are all hidden in the human's
    view (road bit 7; DS:2d56[1055] == 0x0e) is not drawn unless it is within one square of the
    last drawn centre with DS:2eac set; a hidden centre near it draws once and clears DS:2eac."""
    a = _app(game, tmp_path, "ERYTHEA", "HCCCCCCC", HIDDEN_MAP)
    g = _until(a, _human)
    ph = CP.ComputerTurn(g)
    st = g.state
    real = st
    st = g.state = real.copy()
    try:
        st.current = 1
        st.players[1].control = Control.COMPUTER
        st.flags[0x159] = 1
        st.ai.proc.single_view = 1
        roads = st.world.roads
        for i in range(len(roads)):
            roads[i] &= 0x7F                          # nothing seen by the human
        for x in range(0, 30):
            for y in range(0, 30):
                roads[y * MAP_W + x] |= 0x80          # but the corner
        st.selection.selected = -1

        def centre(x, y):
            st.flags[0x17D], st.flags[0x17F] = x, y

        centre(10, 10)
        ph.map_draw()
        assert ph.eac == 1 and (ph.eae, ph.eb0) == (10, 10) and isinstance(ph.map, pygame.Surface)
        drawn = ph.map
        centre(60, 60)                                # far, hidden
        ph.map_draw()
        assert ph.map is drawn and ph.eac == 0
        ph.eac = 1
        ph.eae, ph.eb0 = 59, 61
        ph.map_draw()                                 # hidden, but near the last centre: once
        assert ph.map is not drawn and ph.eac == 0 and (ph.eae, ph.eb0) == (60, 60)
        drawn = ph.map
        ph.map_draw()                                 # again: DS:2eac clear now
        assert ph.map is drawn
        assert ph.hidden_at(st, 60, 60) and not ph.hidden_at(st, 10, 10)
        assert not ph.hidden_at(st, 30, 10)           # a seen neighbour (29, ...) is enough
    finally:
        g.state = real
    a.close()


@gamedata
def test_hidden_map_one_human_end_turn(game, tmp_path, record):
    """A whole End Turn with Hidden Map and one human (DS:3254): the map is drawn from the
    human's stored view (bit 7), only where the gate lets it; the result is the engine's."""
    a = _app(game, tmp_path, "ERYTHEA", "HCCCCCCC", HIDDEN_MAP)
    g, want = _end_turn(a)
    _to_turn_start(a, g)
    assert g.state.hash() == want.hash()
    assert any(r[1] == "step" for r in record)
    a.close()


@gamedata
def test_message_points_draw_in_the_info_area(erythea):
    """ovl61:11d1(msg, t) for the messages of a computer turn (ovl00:0f5f 0x14, ovl64:18c7 0x19),
    in SCN 0x110's colours; ovl61:1a39 timed (0x64) for a computer side with no human alive, else
    the waiting pop-up ovl61:10fb; the raze / sack / pillage lines (DS:0788 / 079b / 07af through
    ovl36:16b3) only with DS:0cf8."""
    from warlords2.ai.phases import assault as AS
    from warlords2.assets.exe import ds_str
    from warlords2.ui.animate import frames
    a = erythea
    g, _ = _end_turn(a)
    ph = g.phase
    st = g.state
    T = ph.k.text
    it = ph.handle("message", {"group": 111, "index": 0, "args": ("Kingdoms",), "wait": 0x14})
    n = sum(1 for _ in it)
    assert ph.bar.text[0] == T.S(111, 0, "Kingdoms")
    assert ph.bar.text[1:] == (st.flags[0xA0 + 2 * st.current], st.flags[0xB0 + 2 * st.current])
    assert abs(n - frames(a, 0x14)) <= 1
    it = ph.handle("eliminated", {"group": 11, "index": 0, "args": ("Kingdoms",), "timed": True, "wait": 0x64})
    assert abs(sum(1 for _ in it) - frames(a, 0x64)) <= 1 and ph.popup is None
    assert ph.handle("eliminated", {"group": 11, "index": 0, "args": ("Kingdoms",), "timed": False, "wait": 0x64}) is None
    assert ph.popup is not None and _top(g) == "message" and ph.waiting()
    ph.popup.close(None)
    assert not ph.waiting()
    fmts = [ds_str(ph.k.exe, f) for f in (AS.RAZED_FMT, AS.SACKED_FMT, AS.PILLAGED_FMT)]
    assert all("%s" in f for f in fmts)
    ph.told = 0
    assert ph.handle("city_line", {"fmt": AS.RAZED_FMT, "city": 0}) is None
    ph.told = 1
    it = ph.handle("city_line", {"fmt": AS.SACKED_FMT, "city": 0})
    assert sum(1 for _ in it) >= 1 and ph.bar.text[0] == fmts[1] % st.cities[0].name


@gamedata
def test_battle_result_with_a_dead_hero_names_its_record(erythea):
    """ovl36:15a6..15b7 reads the hero DS:5e5e points at even when 0a6b freed it (0b62:03be keeps
    +0xa): the line names that slot's hero."""
    from warlords2.model.ids import HERO_TYPE
    from warlords2.rules.movement import remove_army
    a = erythea
    g, _ = _end_turn(a)
    ph = g.phase
    real = g.state
    st = g.state = real.copy()
    try:
        h = next(x for x in st.armies if x.type_id == HERO_TYPE)
        name = st.heroes[h.hero_slot].name
        remove_army(st, h)
        st.selection.hero = h.id
        ph.told, ph.fight = 1, None
        for _ in ph.handle("battle_result", {"x": 0, "y": 0, "won": True, "show": True, "show2": False, "view": False}):
            pass
        assert ph.bar.text[0] == ph.k.text.S(0x8E, 0, name)
    finally:
        g.state = real


@gamedata
@pytest.mark.parametrize("scen,ctl", [("TUTORIA", "CCCCCCCH"), ("ERYTHEA", "HCCCCCCC")])
def test_begin_disables_the_buttons(game, tmp_path, scen, ctl):
    """ovl61:0000(0, 1) (si = 1): 0174 at 0080, then 0418 at 009f: the buttons of End Turn's
    set are disabled for the computer turns and, with a human first, the turn start (until
    ovl68:05ad)."""
    a = _app(game, tmp_path, scen, ctl)
    g = _until(a, lambda g: getattr(g, "phase_name", None) in ("computer", "turn_start"))
    st = g.phase.palette.row.state
    assert all(st.get(i) == DISABLED for i in CP.END_TURN_OFF)
    a.close()


@gamedata
def test_alt_held_opens_settings_after_the_side(erythea):
    """ovl25:045e tests 0000:0417 & 8 (Alt) as well as & 3 (Shift)."""
    a = erythea
    g, _ = _end_turn(a)
    for _ in range(40):
        a.step([])
    a.step([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_LALT, mod=0, unicode="", scancode=0)])
    g = _until(a, lambda g: _top(g) == "settings")
    assert g.phase_name == "computer"


@gamedata
def test_settings_reads_the_keys_typed_while_the_loop_ran(erythea, monkeypatch):
    """Keys typed while the side's turn runs go to the BIOS buffer (int 9; nothing flushes it
    before the next loop pass ovl61:2165); when ovl61:220b stops the loop for the Settings
    dialog ovl25:045e opened, the dialog's loop (07be:0064) reads what is left there."""
    from warlords2.ui.dialogs.settings import Settings
    got = []
    orig = Settings.update
    monkeypatch.setattr(Settings, "update", lambda self, ev, dt: (got.extend(ev), orig(self, ev, dt)))
    a = erythea
    g, _ = _end_turn(a)
    for _ in range(40):
        a.step([])
    ret = pygame.event.Event(pygame.KEYDOWN, key=pygame.K_x, mod=0, unicode="x", scancode=0)
    a.step([pygame.event.Event(pygame.KEYDOWN, **SHIFT), ret])
    g = _until(a, lambda g: _top(g) == "settings" and g.phase.runner is None)
    a.step([])
    assert ret in got
    assert not g.phase.keys and not g.phase.handoff


@gamedata
def test_engine_error_after_the_first_draw_is_contained(erythea, monkeypatch, caplog):
    """An exception of a later run point is logged; the state is as before End Turn and the game
    back in the human phase (no crash, game.py's promise for a refused loop)."""
    from warlords2.ai.phases import production
    calls = []
    orig = production.production

    def boom(st):
        calls.append(st.current)
        if len(calls) == 3:
            raise RuntimeError("planted")
        return orig(st)
    monkeypatch.setattr(production, "production", boom)
    a = erythea
    g = _until(a, _human)
    before = g.state.hash()
    g.end_turn()
    for _ in range(3000):
        if g.phase_name == "human" and len(calls) >= 3:
            break
        a.step([])
    assert len(calls) == 3 and g.phase_name == "human" and g.state.hash() == before
    assert "planted" in caplog.text
    a.step([])
    assert g.phase_name == "human"


@gamedata
def test_refusal_after_entering_the_computer_phase_returns_to_the_human_phase(erythea, monkeypatch, caplog):
    """IllegalCommand in the first pump, after the computer phase became current (the side's
    announcement drew): logged, the state restored, the human phase back at once."""
    from warlords2.ai import base as B
    from warlords2.rules.engine import IllegalCommand

    def refuse(st):
        raise IllegalCommand("planted refusal")
    monkeypatch.setattr(B, "pre_turn", refuse)
    a = erythea
    g = _until(a, _human)
    human = g.phase
    before = g.state.hash()
    g.end_turn()
    assert g.phase_name == "human" and g.phase is human and g.state.hash() == before
    assert "planted refusal" in caplog.text
    for _ in range(3):
        a.step([])
    assert g.phase_name == "human"


@gamedata
def test_overview_point_force(erythea):
    """ovl63:0000(1, 0, NULL) (ovl47:020a) draws nothing while the markers are on (DS:2d25);
    (1, 1, NULL) (ovl26:0360) draws."""
    a = erythea
    g, _ = _end_turn(a)
    ph = g.phase
    ph.overview = old = pygame.Surface((224, 312))
    ph.handle("overview", {"at": "ovl47:020a", "markers": 1, "force": 0})
    assert ph.overview is old and ph.markers == 1
    st = g.state
    st.flags[0x159] = 1
    ph.handle("overview", {"at": "ovl26:0360"})
    assert ph.overview is not old
