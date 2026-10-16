"""M10b package G: the host wiring of Save / Load / New Game / Quit (`states.game`, `states.menu`,
`states.setup`, `app`): the run memory (`persist.saves.RunCarry`) entered at Begin and at
every load, the one dice stream of the run, the load's present points in 02d3's order, the
refused-load paths, New Game's order (face, then ovl25:0519), the list name buffer DS:483c
as run memory, and a load in a fresh run of the program.  Game text is never compared
literally."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import save_load as SLD  # noqa: E402

pytestmark = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
ARGS = ["--headless", "--no-intro", "--no-voice", "--seed", "3"]


def key(k, ch=""):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=ch, mod=0, scancode=0)


def _top(st):
    return st.dialogs.top if st.dialogs else None


def _human(a, n=600):
    """Step until the game waits in its human phase with no dialog (the turn-1 dialogs closed)."""
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) in ("human", "over") and not g.dialogs:
            return g
        tid = getattr(_top(g), "dialog_id", None) if hasattr(g, "dialogs") else None
        if tid == "production":
            _top(g).press(192)
        elif tid == "hero_offer":
            _top(g).press(287)
        a.step([UP] if tid in ("turn_start", "tutorial_page", "message", "level_up", "medal") else [])
    raise AssertionError("no human phase")


def _settle(a, name, n=400):
    for _ in range(n):
        st = a.manager.current_state()
        if a.manager.current_state_str() == name and not st.dialogs and getattr(st, "ready", True):
            return st
        a.step([])
    raise AssertionError("not settled in %s" % name)


def _app(user, *extra):
    return App(parse_args([*ARGS, *extra, "--user-dir", str(user)]))


def _save(g, entry, text="s"):
    d = registry.run_action(registry.MENU_ID["save_game"], g)
    d.press(114 + entry)
    d.press(123)
    box = _top(g)
    box.text = text
    box.answer(True)
    assert not g.dialogs


def _load(a, host, entry):
    """Load list -> row `entry` -> OK -> the scroll(s) -> the message; returns the Game with
    the message up."""
    d = registry.run_action(registry.MENU_ID["load_game"], host)
    d.press(114 + entry)
    d.press(123)
    for _ in range(400):
        a.step([])
        cur = a.manager.current_state()
        if getattr(_top(cur), "dialog_id", None) == "message":
            return cur
    raise AssertionError("no load message")


@pytest.fixture
def erythea(tmp_path):
    a = _app(tmp_path / "u", "--scenario", "ERYTHEA", "--controls", "HCCCCCCC")
    yield a
    a.close()


# ------------------------------------------------------------------ Begin: run memory, one stream


def test_begin_enters_the_run_memory(erythea):
    """Begin: the game is the run's memory with its record DS:5d64 (`RunCarry.enter`), the
    list name buffer is the run's, and the game's dice are the run's one stream."""
    a = erythea
    g = _human(a)
    carry = a.run_carry
    assert carry.game is g.state and carry.record["str_3c"].upper() == "ERYTHEA"
    assert g.state.list_names is carry.names
    assert a.session_dice is g.state.rng
    assert not hasattr(a, "ds_city_counts")
    assert g.scenario_dir().upper() == "ERYTHEA"


def test_second_begin_keeps_the_run_words(tmp_path, monkeypatch):
    """New Game -> Begin: `rules.setup.new_game(run=run_part(previous game))` (EL §10.7), the
    setup screen's stream state at Begin is the game's (one stream), and New Game's AI set-up
    ovl25:0519 runs on the abandoned game after the Game Start screen's face."""
    import warlords2.ai.cards as AC
    import warlords2.rules.setup as RS
    a = _app(tmp_path / "u", "--scenario", "ERYTHEA", "--controls", "HCCCCCCC")
    try:
        g = _human(a)
        old = g.state
        old.path_cache.clear()
        old.city_counts[:] = [7, 1, 2, 3, 4, 5, 6, 9]          # DS:5dea as the old game left it
        old.list_names[:] = ["n%d" % i for i in range(4)]
        order = []
        real_setup = AC.setup_all
        monkeypatch.setattr(AC, "setup_all", lambda st, cards: (order.append(("setup_all", st)),
                                                                   real_setup(st, cards))[1])
        registry.run_action(registry.MENU_ID["new_game"], g)
        _top(g).close(True)
        menu = _settle(a, "menu")
        a.step([])                                               # its start_screen (the face, then 0519)
        assert order == [("setup_all", old)] and a.run_carry.game is old
        assert all(x.owner == 0xFF or x.owner == 15 for x in old.armies)      # 0b62:03be on every record
        assert menu.directory == "ERYTHEA" and a.session_dice is old.rng
        got = {}
        real = RS.new_game

        def spy(*args, **kw):
            got["run"] = kw.get("run")
            return real(*args, **kw)
        monkeypatch.setattr(RS, "new_game", spy)
        menu.on_button(103)
        setup = _settle(a, "setup")
        setup.on_button(141)
        g2 = _human(a)
        run = got["run"]
        assert run is not None and run.rng is old.rng and run.list_names is a.run_carry.names
        assert g2.state is not old and a.run_carry.game is g2.state and a.session_dice is g2.state.rng
        assert g2.state.list_names is a.run_carry.names and g2.state.list_names[:4] == ["n%d" % i for i in range(4)]
    finally:
        a.close()


def test_begin_stream_equals_the_session_stream(tmp_path):
    """The game's dice at Begin are where the setup screen's (session) stream is: the loader's
    rolls and the setup rolls replayed by `rules.setup.new_game` end on the same state."""
    a = _app(tmp_path / "u")
    try:
        menu = _settle(a, "menu")
        menu.on_button(103)
        setup = _settle(a, "setup")
        captured = {}
        setup.request = lambda name, **kw: captured.update(kw)
        setup.on_button(141)
        for _ in range(50):
            if captured:
                break
            a.step([])
        want = a.session_dice.state()
        from warlords2.rules.constants.setup import LOADER_TILE_ROLLS
        from warlords2.rules.rng import Rng
        cfg = captured["new_game"]
        r = Rng.from_state(cfg.rng_state)
        count, roll = LOADER_TILE_ROLLS.value
        for _ in range(count):
            r.rnd(*roll)
        for x in cfg.setup_rolls:
            r.rnd(*x)
        assert r.state() == want                    # Begin's game stream starts where the session is
    finally:
        a.close()


# ------------------------------------------------------------------ Load


def test_in_game_load_resumes_mid_turn(erythea):
    """Alt+L in a game: the scroll over the game screen, then 02d3: the game screen (the human
    phase entered, no turn start), the strips (1, 0) / (0, 0), the message (47, 1); the loaded
    state is the run's memory and its dice the run's stream; SCN 0x130 = 1."""
    a = erythea
    g = _human(a)
    _save(g, 0)
    calls = []
    real = g.strip_call
    g.strip_call = lambda at: (calls.append(at), real(at))
    g2 = _load(a, g, 0)
    assert g2 is g and g.phase_name == "human" and g.map_ready and g.load_where is None
    assert calls == ["ovl49:03b0", "ovl49:03bb"]
    msg = _top(g)
    from warlords2.ui.dialogs.hero_offer import raw, sprintf
    from warlords2.ui.widgets import kit
    assert msg.lines == [sprintf(raw(kit(a), 47, 1), g.state.players[g.state.current].name)]
    st = g.state
    assert a.run_carry.game is st and a.session_dice is st.rng and st.flags[0x130] == 1
    assert st.list_names is a.run_carry.names
    assert g.turn_events is None and g._next is None
    a.step([UP])
    a.step([])
    assert not g.dialogs and g.phase_name == "human"


def test_in_game_load_keeps_the_screen_under_the_scroll(erythea):
    """DS:2a86 stays 1 through 0414: the game screen (state, phase, map) stays up under the
    scroll; the same scenario rebuilds no overview (the minimap pixels kept)."""
    a = erythea
    g = _human(a)
    _save(g, 0)
    old_state, old_pixels = g.state, g.minimap.pixels
    d = registry.run_action(registry.MENU_ID["load_game"], g)
    d.press(114)
    d.press(123)
    a.step([])
    a.step([])
    assert getattr(_top(g), "dialog_id", None) == "progress"
    assert g.state is old_state and g.phase_name == "human" and g.map_ready and SLD.where_of(g) == "game"
    for _ in range(100):
        a.step([])
        if getattr(_top(g), "dialog_id", None) == "message":
            break
    assert g.state is not old_state and (g.minimap.pixels == old_pixels).all()


def test_load_over_phase(erythea):
    """A game saved after the acknowledged victory (SCN 0x15b / 0x157) resumes in the over phase."""
    a = erythea
    g = _human(a)
    g.state.flags[0x15B] = g.state.flags[0x157] = 1
    _save(g, 0)
    _load(a, g, 0)
    assert g.phase_name == "over"


def test_refused_in_game_load_restores_the_game(erythea, caplog):
    """A file that is not a save of this program: the Cancel path of 02d3 in a game
    (ovl61:0000(0, 0)): the same game and phase, redrawn."""
    a = erythea
    g = _human(a)
    _save(g, 0)
    a.saves.game_path(0).write_text("not json")
    st, ph = g.state, g.phase
    redraws = []
    g.redraw_game_screen = lambda: redraws.append(1)
    d = registry.run_action(registry.MENU_ID["load_game"], g)
    d.press(114)
    d.press(123)
    for _ in range(20):
        a.step([])
    assert g.state is st and g.phase is ph and redraws == [1] and not g.dialogs and g.load_where is None


def test_refused_load_from_game_start_rolls_nothing(tmp_path):
    """X47 stand-in: a used slot without its file in a fresh run (no game in memory): the
    Cancel path ovl60:0000(0): the Game Start screen again, no face, no die drawn."""
    from warlords2.persist.saves import SlotTable
    user = tmp_path / "u"
    a = _app(user)
    try:
        a.saves.table = SlotTable(used=[True] + [False] * 9, desc=["x"] + [""] * 9)
        menu = _settle(a, "menu")
        a.step([])                                               # its start_screen (the greeting)
        a.step([])
        menu.refresh()
        from warlords2.states.menu import session_dice
        before = session_dice(a).state()
        faces = []
        menu.face = lambda speech, then: (faces.append(speech), then())
        d = registry.run_action(101, menu)
        d.press(114)
        d.press(123)
        for _ in range(20):
            a.step([])
        assert a.manager.current_state_str() == "menu" and not menu.dialogs and faces == []
        assert a.session_dice.state() == before and a.run_carry.game is None
    finally:
        a.close()


def test_refused_load_from_setup_keeps_the_setup_screen(tmp_path):
    """From the Game Setup screen: ovl57:0000(0, 0, 0, 1): no reload, no quotation roll, the
    sides as they were."""
    from warlords2.persist.saves import SlotTable
    a = _app(tmp_path / "u")
    try:
        _settle(a, "menu").on_button(103)
        setup = _settle(a, "setup")
        setup.sides.set_name(0, "Edited")
        a.saves.table = SlotTable(used=[True] + [False] * 9, desc=["x"] + [""] * 9)
        before, rolls = a.session_dice.state(), list(setup.rolls)
        d = registry.run_action(registry.MENU_ID["load_game"], setup)
        d.press(114)
        d.press(123)
        for _ in range(20):
            a.step([])
        assert a.manager.current_state_str() == "setup" and setup.ready and not setup.dialogs
        assert setup.sides.name(0) == "Edited" and setup.rolls == rolls and a.session_dice.state() == before
    finally:
        a.close()


def test_fresh_run_load_from_game_start(tmp_path):
    """Run 1 saves; run 2 (a new App on the same user dir) loads it from the Game Start button
    101: the slot table read at start-up enables 101, the overview is rebuilt (256 dice), the
    game screen frame comes after the scroll over the Game Start screen; two fresh runs give
    one hash, and the loaded game holds the saved part of run 1."""
    from warlords2.rules import saveload as SL
    user = tmp_path / "u"
    a = _app(user, "--scenario", "ERYTHEA", "--controls", "HCCCCCCC")
    try:
        g = _human(a)
        _save(g, 0)
        want = SL.saved_part(g.state, a.run_carry.record)["state"]
    finally:
        a.close()
    hashes = []
    for _ in range(2):
        b = _app(user)
        try:
            menu = _settle(b, "menu")
            assert menu.buttons.state[101] == 1                        # NORMAL: ovl60:011e
            d = registry.run_action(101, menu)
            d.press(114)
            d.press(123)
            b.step([])
            game = b.manager.current_state()
            assert b.manager.current_state_str() == "game" and game.load_backdrop == "menu"
            assert SLD.where_of(game) == "game_start"
            g2 = None
            for _ in range(400):
                b.step([])
                if getattr(_top(game), "dialog_id", None) == "message":
                    g2 = game
                    break
            assert g2 is not None and g2.phase_name == "human" and g2.load_backdrop is None
            st = g2.state
            got = SL.saved_part(st, b.run_carry.record)["state"]
            w = dict(want, flags={k: v for k, v in want["flags"].items() if k != str(0x130)})
            assert got["flags"].pop(str(0x130)) == 1 and want["flags"][str(0x130)] == 0
            assert got == w                                          # every other SCN word too
            assert b.session_dice is st.rng and st.list_names is b.run_carry.names
            hashes.append(st.hash())
        finally:
            b.close()
    assert hashes[0] == hashes[1]


def test_load_reads_the_file_once(erythea, monkeypatch):
    a = erythea
    g = _human(a)
    _save(g, 0)
    n = []
    real = a.saves.read_game
    monkeypatch.setattr(a.saves, "read_game", lambda k: (n.append(k), real(k))[1])
    _load(a, g, 0)
    assert n == [0]


# ------------------------------------------------------------------ the list name buffer DS:483c


def test_engine_list_writers_fill_the_run_buffer(erythea):
    """ovl51:03d9 mode 2 inside the engine (here ovl38:0d1a, `rules.bonuses.battle_items`)
    writes DS:483c, the run's buffer the Load list draws its stale rows from; a copy has its
    own buffer; the entries past the list keep their bytes."""
    from warlords2.model.ids import HERO_TYPE, ItemState
    from warlords2.rules.bonuses import battle_items, list_lying
    a = erythea
    g = _human(a)
    st = g.state
    hero = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == st.current)
    for i in (3, 5):
        st.items[i].state, st.items[i].holder = int(ItemState.CARRIED), hero.id
    a.run_carry.write_names(["a%d" % i for i in range(8)])
    battle_items(st, hero)
    from warlords2.rules.bonuses import carried_items
    names = [st.items[i].name for i in carried_items(st, hero)]
    assert 3 <= len(names) < 8 and a.run_carry.names == names + ["a%d" % i for i in range(len(names), 8)]
    cp = st.copy()
    battle_items(cp, hero)
    assert cp.list_names is not st.list_names
    list_lying(cp, -5, -5, 22)                       # an empty list writes nothing
    assert cp.list_names == st.list_names


def test_random_characters_write_the_leader_names(tmp_path):
    """ovl57:2051 -> ovl51:03d9(7, level) per qualifying side (209e), before its roll: the last
    such side's leader names end in DS:483c."""
    from warlords2.ui.dialogs.setup_side import OFF_LEVEL, leader_names
    from warlords2.ui.widgets import kit
    a = _app(tmp_path / "u")
    try:
        _settle(a, "menu").on_button(103)
        setup = _settle(a, "setup")
        from warlords2.ui.dialogs.setup_side import OFF_CONTROL
        for p, lv in ((1, 1), (3, 0)):                               # two computer sides take part
            setup.sides.set(OFF_CONTROL, p, 1)
            setup.sides.set(OFF_LEVEL, p, lv)
        a.run_carry.names[:] = ["z"] * 40
        setup.random_characters()
        last = max(p for p in range(8) if setup.sides.playing_computer(p))
        names = leader_names(kit(a), setup.sides.get(OFF_LEVEL, last))
        assert a.run_carry.names[:len(names)] == names and a.run_carry.names[len(names):] == ["z"] * (40 - len(names))
    finally:
        a.close()


# ------------------------------------------------------------------ the input box


def test_input_box_hands_leftover_keys_on(erythea):
    """ovl56:03a6 reads one key per call: keys after the Return that ended the editor reach the
    box's key read 07be:0064, so "ab, Return, Return" presses 189."""
    a = erythea
    g = _human(a)
    got = []
    d = registry.open_dialog("input_box", g, title="t", lines=["a", "b"], text="", limit=15, width=0xA0,
                             on_close=got.append)
    d.press(191)
    ret = key(pygame.K_RETURN, "\r")
    d.update([key(pygame.K_a, "a"), key(pygame.K_b, "b"), ret, ret], 16)
    assert got == ["ab"] and d.stack is None


def test_palette_paint_does_not_write_the_buffer(erythea):
    """The movement-kind cell's DS:483c writes come only from ovl66:070d at the 0356 sites (and
    0a8b:0d05), not from our per-frame paint: after Plant Standard (ovl47:0a89 lists, then no
    0356) the buffer stays as the plant left it however many frames are drawn; a 0356 point
    (`Game.palette_drawn`, e.g. a Stack dialog close) writes the palette's hero lists."""
    from warlords2.model import commands as C
    from warlords2.model.ids import HERO_TYPE, ROAD_STANDARD, ItemState
    from warlords2.rules.bonuses import carried_items
    from warlords2.rules.heroes import _flat
    a = erythea
    g = _human(a)
    st = g.state
    hero = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == st.current)
    for i in (3, 5):
        st.items[i].state, st.items[i].holder = int(ItemState.CARRIED), hero.id
    cand = None
    for dx in range(-6, 7):
        for dy in range(-6, 7):
            x, y = hero.x + dx, hero.y + dy
            if (0 <= x < 112 and 0 <= y < 156 and st.world.terrain(x, y) in (0, 1, 4, 5, 6, 7)
                    and not st.world.roads[_flat(x, y)] & ROAD_STANDARD and st.city_at(x, y) < 0
                    and not any((o.x, o.y) == (x, y) for o in st.armies)):
                cand = (x, y)
    hero.x, hero.y = cand
    g.phase.apply(C.SelectStack(hero.x, hero.y))
    a.step([])
    planted = carried_items(st, hero)
    a.run_carry.write_names(["z%d" % i for i in range(6)])
    assert g.phase.apply(C.PlantFlag(hero.id)) is not None
    after = list(a.run_carry.names)
    assert after == [st.items[i].name for i in planted] + ["z%d" % i for i in range(len(planted), 6)]
    for _ in range(3):
        a.step([])
    assert a.run_carry.names == after                    # the paint writes nothing
    g.palette_drawn()                                    # a 0356 point: 055c -> 070d
    now = [st.items[i].name for i in carried_items(st, hero)]
    assert len(now) == len(planted) - 1 and a.run_carry.names[:len(now)] == now


def test_redraw_palette_writes_the_palette_heroes(erythea):
    """rules.selection.redraw_palette (ovl66:0356) runs 070d's 08b4 lists: the selected palette
    heroes' items into DS:483c; nothing without DS:5e62."""
    from warlords2.model.ids import HERO_TYPE
    from warlords2.rules.bonuses import carried_items
    from warlords2.rules.selection import redraw_palette
    a = erythea
    g = _human(a)
    st = g.state.copy()
    hero = next(x for x in st.armies if x.type_id == HERO_TYPE and x.owner == st.current)
    st.selection.selected, st.selection.palette, st.selection.palette_selected = hero.id, [hero.id], [1]
    st.list_names[:] = ["q"] * 6
    redraw_palette(st)
    names = [st.items[i].name for i in carried_items(st, hero)]
    assert names and st.list_names[:len(names)] == names
    st.list_names[:] = ["q"] * 6
    st.selection.palette_selected = [0]
    redraw_palette(st)
    assert st.list_names == ["q"] * 6                    # not selected in the palette: no 08b4
    st.selection.selected = -1
    st.selection.palette_selected = [1]
    redraw_palette(st)
    assert st.list_names == ["q"] * 6                    # DS:5e62 null: the info area, no 070d


def test_pointer_hidden_during_the_load_scroll(erythea):
    """ovl49:0606 12bf:07a5 after the 10, 092f 12bf:0757 after the scroll's close."""
    a = erythea
    g = _human(a)
    _save(g, 0)
    d = registry.run_action(registry.MENU_ID["load_game"], g)
    d.press(114)
    d.press(123)
    seen = []
    for _ in range(200):
        a.step([])
        top = _top(g)
        tid = getattr(top, "dialog_id", None)
        seen.append((tid, getattr(top, "percent", None), g.pointer_hidden))
        if tid == "message":
            break
    prog = [h for t, _, h in seen if t == "progress"]
    assert prog and not prog[0] and prog[-1]             # shown at the 0 / 10, hidden later
    assert seen[-1][0] == "message" and not g.pointer_hidden


def test_fresh_run_part_shares_the_run_buffer(tmp_path, monkeypatch):
    """A fresh-run load builds its run part with the run's DS:483c (`RunCarry.names`), so the
    loaded state shares it from `merge` on (before `RunCarry.enter`)."""
    from warlords2.rules import saveload as SL
    user = tmp_path / "u"
    a = _app(user, "--scenario", "ERYTHEA", "--controls", "HCCCCCCC")
    try:
        _save(_human(a), 0)
    finally:
        a.close()
    b = _app(user)
    try:
        seen = []
        real = SL.merge
        monkeypatch.setattr(SL, "merge", lambda saved, run: (seen.append(run.list_names), real(saved, run))[1])
        from warlords2.ui.dialogs.save_load import run_carry
        res = b.saves.load_game(run_carry(b), 0, where="game_start", rng=__import__("warlords2.states.menu",
                                fromlist=["session_dice"]).session_dice(b), process=b.ai_process)
        assert seen and seen[0] is b.run_carry.names and res.state.list_names is b.run_carry.names
    finally:
        b.close()


# ------------------------------------------------------------------ the action palette's ground


def _ground_check(g, want_marble: bool) -> None:
    """Game.paint over DS:2a94: outside the screen-0 button rectangles the marble (0, 0) of
    picture 25 after ovl61:0000 (0a9d at 007b), else SCREEN0-3's own pixels; every drawn button
    over it in its own art (0174 after 0a9d)."""
    import numpy as np
    from warlords2.assets.exe import ds_words
    from warlords2.ui.widgets import kit
    k = kit(g.app)
    x, y, w, h = ds_words(k.exe, 0x2A94, 4)
    fb = g.app.screen.fb
    g.paint(fb)
    px = pygame.surfarray.array2d(fb)[x:x + w, y:y + h]
    gaps = np.ones((w, h), bool)
    for b in k.layouts.screen(0).buttons:
        bx, by, bw, bh = b.rect
        gaps[max(bx - x, 0):max(bx + bw - x, 0), max(by - y, 0):max(by + bh - y, 0)] = False
    if want_marble:
        want = pygame.surfarray.array2d(k.picture(25))[0:w, 0:h]
    else:
        want = pygame.surfarray.array2d(g.app.assets.picture("screen.pck"))[x:x + w, y:y + h]
    assert (px[gaps] == want[gaps]).all()
    assert gaps.sum() > 2000 and (want_marble or not g.screen_up)
    pal = getattr(g.begin_phase or g.phase, "palette", None)
    if pal is None and g.phase_name == "building":
        pal = g.run_palette                       # the frame before the turn-start phase
    for b in (pal.row.buttons if pal is not None else []):
        bx, by, bw, bh = b.rect
        if x <= bx and bx + bw <= x + w and y <= by and by + bh <= y + h:
            sx, sy, _, _ = b.source(pal.row.state[b.id])
            art = pygame.surfarray.array2d(pal.row.picture(b.picture))[sx:sx + bw, sy:sy + bh]
            assert (px[bx - x:bx - x + bw, by - y:by - y + bh] == art).all(), b.id


def test_palette_ground_from_begin_through_the_computer_turn(erythea):
    """Before Begin the game frame's own pixels (no ovl61:0000 yet); ovl61:0000(0, 1) covers
    DS:2a94 with marble and the buttons go over it: the human turn 1, the computer turn after
    End Turn (ovl61:0418's disabled buttons) and the next human turn keep it."""
    a = erythea
    for _ in range(50):
        a.step([])
        g = a.manager.current_state()
        if a.manager.current_state_str() == "game" and g.sprites is not None and g.dialogs:
            break
    assert g.phase_name == "building" and not g.screen_up
    _ground_check(g, False)
    g = _human(a)
    assert g.screen_up
    _ground_check(g, True)
    g.end_turn()
    assert g.phase_name == "computer"
    _ground_check(g, True)
    g = _human(a, 4000)
    assert g.state.turn == 2
    _ground_check(g, True)


def test_palette_ground_after_a_load_from_game_start(tmp_path):
    """A load in a fresh run (the Game Start screen under the scroll, no Begin): 02d3's
    ovl61:0000(DS:28c6, 0) covers DS:2a94 with marble before the buttons."""
    user = tmp_path / "u"
    a = _app(user, "--scenario", "ERYTHEA", "--controls", "HCCCCCCC")
    try:
        _save(_human(a), 0)
    finally:
        a.close()
    b = _app(user)
    try:
        menu = _settle(b, "menu")
        d = registry.run_action(101, menu)
        d.press(114)
        d.press(123)
        b.step([])
        game = b.manager.current_state()
        assert game.load_backdrop == "menu" and not game.screen_up
        for _ in range(400):
            b.step([])
            if getattr(_top(game), "dialog_id", None) == "message":
                break
        assert game.phase_name == "human" and game.screen_up
        _ground_check(game, True)
    finally:
        b.close()


def test_begin_message_without_humans_over_begins_screen(tmp_path):
    """No live human: ovl61:0000(0, 1) draws the strip (0076), the ground (007b), the buttons
    (0174) disabled by 0418 (009f), no map (si = 1, no ovl64:006c) and the overview (00b8)
    before its message (0110); the loop's computer phase starts from that picture."""
    import numpy as np
    from warlords2.states.phases.computer import END_TURN_OFF
    from warlords2.ui.layout import DISABLED
    from warlords2.ui.mapview import AREA
    from warlords2.ui.minimap import RECT
    a = _app(tmp_path / "u", "--scenario", "ERYTHEA", "--controls", "CCCCCCCC")
    try:
        g = None
        for _ in range(200):
            a.step([])
            g = a.manager.current_state()
            if getattr(_top(g), "dialog_id", None) == "message":
                break
        assert g.phase_name == "building" and g.begin_phase is not None
        pal = g.begin_phase.palette
        assert all(pal.row.state[i] == DISABLED for i in END_TURN_OFF if i in pal.row.state)
        _ground_check(g, True)
        px = pygame.surfarray.array2d(g.app.screen.fb)
        back = pygame.surfarray.array2d(g.app.assets.picture("screen.pck"))
        x, y, w, h = AREA
        assert (px[x:x + w, y:y + h] == back[x:x + w, y:y + h]).all()          # no 006c
        ox, oy, ow, oh = RECT
        assert (px[ox:ox + ow, oy:oy + oh] != back[ox:ox + ow, oy:oy + oh]).sum() > ow * oh // 2   # 00b8
        ph = g.begin_phase
        a.step([UP])
        for _ in range(50):
            if g.phase_name == "computer":
                break
            a.step([])
        assert g.phase is ph and g.begin_phase is None                        # the same picture runs on
    finally:
        a.close()


# ------------------------------------------------------------------ Begin from the Setup screen


def _setup_begin(tmp_path, computers: int, hidden: bool):
    """Game Start -> Setup (ERYTHEA) with the first `computers` sides computer-played and
    Hidden Map as given; returns (app, setup, game) right after Begin (ovl57:0cfe)."""
    from warlords2.model.options import GameOptions
    a = _app(tmp_path / "u")
    _settle(a, "menu").on_button(103)
    s = _settle(a, "setup")
    for p in range(computers):
        s.on_button(125 + p)                                  # ovl57:0a4e: human -> level 0
        for _ in range(10):
            a.step([])
    words = list(s.words)
    words[3] = int(hidden)
    s.words[:] = words
    assert bool(GameOptions.from_words(s.words).hidden_map) == hidden
    s.on_button(141)
    for _ in range(100):
        a.step([])
        if a.manager.current_state_str() == "game":
            break
    return a, s, a.manager.current_state()


def kit_picture(g, n):
    from warlords2.ui.widgets import kit
    return kit(g.app).picture(n)


def _area(fb, r):
    x, y, w, h = r
    return pygame.surfarray.array2d(fb)[x:x + w, y:y + h]


def _steps_to(a, g, cond, n=400):
    for _ in range(n):
        if cond(g):
            return
        a.step([])
    raise AssertionError("not reached")


def test_setup_begin_keeps_the_setup_screen_in_the_map_area(tmp_path):
    """ovl57:0cfe draws only the strip (0eb3) before ovl61:0000(0, 1), which skips ovl64:006c:
    the Setup screen stays up until 0000 (no bare frame) and in the map area DS:2ab0 under the
    no-humans message and in the computer phase's picture until its first map draw."""
    from warlords2.ui.mapview import AREA
    from warlords2.ui.minimap import RECT
    a, s, g = _setup_begin(tmp_path, 8, False)
    try:
        under = g.under
        assert under is not None and not g.map_ready
        fb = g.app.screen.fb
        g.paint(fb)
        for r in (AREA, RECT, (400, 355, 224, 114), (16, 403, 360, 66)):
            assert (_area(fb, r) == _area(under, r)).all()           # ovl57:0e24..0eae
        assert (_area(under, AREA) != _area(g.app.assets.picture("screen.pck"), AREA)).any()
        _steps_to(a, g, lambda g: getattr(_top(g), "dialog_id", None) == "message")
        _ground_check(g, True)
        assert (_area(fb, AREA) == _area(under, AREA)).all()
        assert (pygame.surfarray.array2d(g.begin_phase.map) == _area(under, AREA)).all()
    finally:
        a.close()


def test_setup_begin_with_hidden_map_is_black(tmp_path):
    """With Hidden Map ovl57:0ec5 fills the map and the overview with colour 0 (ovl61:0a6e);
    nothing draws them before the no-humans message."""
    from warlords2.ui.mapview import AREA
    from warlords2.ui.minimap import RECT
    a, s, g = _setup_begin(tmp_path, 8, True)
    try:
        _steps_to(a, g, lambda g: getattr(_top(g), "dialog_id", None) == "message")
        fb = g.app.screen.fb
        _ground_check(g, True)
        assert not _area(fb, AREA).any() and not _area(fb, RECT).any()
    finally:
        a.close()


def test_setup_begin_hot_seat_hidden_map_turn_start(tmp_path):
    """Eight humans with Hidden Map: the first turn start (ovl68:0259 di = 0) draws nothing
    before its pop-up, so the map and the overview are ovl57:0ec5's black, under Begin's
    disabled buttons from the first frame of the game on."""
    from warlords2.ui.mapview import AREA
    from warlords2.ui.minimap import RECT
    a, s, g = _setup_begin(tmp_path, 0, True)
    try:
        _steps_to(a, g, lambda g: g.map_ready)
        assert g.phase_name == "building" and g._next == "turn_start"
        _ground_check(g, True)                                         # the run's buttons drawn
        fb = g.app.screen.fb
        assert not _area(fb, AREA).any() and not _area(fb, RECT).any()
        marble = pygame.surfarray.array2d(kit_picture(g, 25))[0:360, 60:126]
        assert g.bar_blank and (_area(fb, (16, 403, 360, 66)) == marble).all()   # ovl68:034c only
        _steps_to(a, g, lambda g: getattr(_top(g), "dialog_id", None) == "turn_start")
        g.paint(fb)
        assert not _area(fb, AREA).any() and not _area(fb, RECT).any()
    finally:
        a.close()


def test_setup_begin_frame_before_the_turn_start_phase(tmp_path):
    """Without Hidden Map (di = 1) the turn start draws the map, the overview and the info area
    (0344 / 039c / 03a4) before its pop-up; the frame before the turn-start phase shows them
    over Begin's buttons."""
    from warlords2.ui.palettes import painter_for
    a, s, g = _setup_begin(tmp_path, 0, False)
    try:
        _steps_to(a, g, lambda g: g.map_ready)
        assert g.phase_name == "building" and g._next == "turn_start" and not g.bar_blank
        _ground_check(g, True)
        fb = g.app.screen.fb
        want = fb.copy()
        painter_for(g).info_area(want, g.state)
        r = (16, 403, 360, 66)
        assert (_area(fb, r) == _area(want, r)).all()
    finally:
        a.close()
