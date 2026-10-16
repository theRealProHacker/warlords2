"""M11 package U: the random-map panel of the Game Start screen (`ui.random_panel`, ovl60:011e /
0332 / 0512 / 0571 / 05f5 / 063a / 0661) and the Save Map / Load Map dialogs (`ui.dialogs.map_slots`,
ovl49:1214 / 128a / 12f2 / 13c2 / 1463), in a headless App with the files in a temporary user
directory.  Game text is never compared literally: texts come from STRING.DAT, TERRAIN.DAT and
the EXE at test time; the numbers below are the asm's and the EXE image's (DGROUP dump, prep §1.1)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.assets.exe import ds_str, ds_word, ds_words  # noqa: E402
from warlords2.assets.text import printf  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.formats.scenario import parse_scenario_dat  # noqa: E402
from warlords2.persist.saves import RunCarry  # noqa: E402
from warlords2.rules.randmap import RandomRun, slider_args  # noqa: E402
from warlords2.ui import random_panel as RP  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui import text_input as TI  # noqa: E402
from warlords2.ui.dialogs import map_slots as MS  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL, PRESSED  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

pytestmark = pytest.mark.gamedata
OK, CANCEL, ROW0 = 123, 124, 114
PANEL_IDS = (104, 105, *range(106, 114))


def key(k, ch=""):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=ch, mod=0, scancode=0)


RET, ESC = key(pygame.K_RETURN, "\r"), key(pygame.K_ESCAPE, "\x1b")


class NoDice:
    """An Rng that must not be rolled."""

    def rnd(self, *a):
        raise AssertionError("rolled %r" % (a,))


# ------------------------------------------------------------------ the slider maths (no App)


def test_slider_value_inside_the_button():
    """ovl60:0539..054d over the 120-px button at x 384 (DS:29ac[i]): 0..6, each of the seven."""
    got = [RP.slider_value(mx, 384, 120) for mx in range(384, 504)]
    assert got == [(mx - 384) * 7 // 120 for mx in range(384, 504)]
    assert got[0] == 0 and got[-1] == 6 and sorted(set(got)) == list(range(7))
    assert [RP.slider_value(mx, 384, 120) for mx in (401, 402, 418, 419)] == [0, 1, 1, 2]


def test_slider_value_outside_truncates_toward_zero():
    """idiv truncates: a mouse left of the button gives 0 down to x - 17, then negatives; right of
    it 7 (the generator's "roll" value, unreachable from inside, Q1) and more; no clamp."""
    assert RP.slider_value(383, 384, 120) == 0                  # floor division would give -1
    assert RP.slider_value(367, 384, 120) == 0
    assert RP.slider_value(366, 384, 120) == -1
    assert RP.slider_value(300, 384, 120) == -4
    assert RP.slider_value(504, 384, 120) == 7
    assert RP.slider_value(639, 384, 120) == 14


def test_query_never_reaches_the_generator():
    """Q1 / X54: DS:28d8 is not read by ovl57:1193..11cc; a "?" slider passes its value, no roll."""
    run = RandomRun(sliders=[0, 6, 2, 5], shown=[0, 0, 0, 0])
    assert slider_args(run, NoDice()) == [0, 6, 2, 5]
    run.shown = [1, 1, 1, 1]
    assert slider_args(run, NoDice()) == [0, 6, 2, 5]


def test_run_words_by_address():
    run = RandomRun(random=1, terrain_set=0, allies=1, sliders=[1, 2, 3, 4], shown=[1, 0, 1, 0])
    exe = b""                                                   # not read for run words
    assert [RP.dgroup_word(exe, run, 0x28D0 + 2 * i) for i in range(4)] == [1, 2, 3, 4]
    assert [RP.dgroup_word(exe, run, 0x28D8 + 2 * i) for i in range(4)] == [1, 0, 1, 0]
    assert RP.dgroup_word(exe, run, 0x28C8) == 1 and RP.dgroup_word(exe, run, 0x28CC) == 1
    assert RP.dgroup_word(exe, run, 0x28CE, index=5) == 5 and RP.dgroup_word(exe, run, 0x28C6) == 1


# ------------------------------------------------------------------ the Game Start screen


@pytest.fixture(scope="module")
def start_app(game, tmp_path_factory):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "7",
                        "--user-dir", str(tmp_path_factory.mktemp("u"))]))
    yield a
    a.close()


@pytest.fixture
def menu(start_app):
    """The Game Start screen with fresh run words (EXE image values) and no random flag."""
    start_app.run_carry = RunCarry()
    for _ in range(2):
        start_app.step([])
    m = start_app.manager.current_state()
    assert start_app.manager.current_state_str() == "menu"
    while m.dialogs:
        m.dialogs.top.close(None)
    m.choose(m.index)                                           # ovl60:067c: DS:28c8 = 0
    return m


def _click(app, pos):
    s = app.cfg.scale
    p = (pos[0] * s, pos[1] * s)
    app.step([pygame.event.Event(pygame.MOUSEMOTION, pos=p, rel=(0, 0), buttons=(0, 0, 0)),
              pygame.event.Event(pygame.MOUSEBUTTONDOWN, pos=p, button=1),
              pygame.event.Event(pygame.MOUSEBUTTONUP, pos=p, button=1)])


def test_image_values_and_panel_hidden_without_random(menu):
    run = menu.app.run_carry.random_map
    assert (run.random, run.terrain_set, run.allies, run.sliders, run.shown) == (0, 0, 0, [3, 3, 2, 3], [1] * 4)
    assert not menu.random and menu.buttons.state[102] == NORMAL
    assert all(id in menu.hidden for id in PANEL_IDS)           # 011e: 08a9:03b3


def test_random_map_button_shows_the_panel(menu):
    """ovl60:05f5 via a click on 102: DS:28c8 = 1; 102 disabled; 104..113 live."""
    b = next(b for b in menu.buttons.buttons if b.id == 102)
    _click(menu.app, (b.rect[0] + 10, b.rect[1] + 10))
    run = menu.app.run_carry.random_map
    assert run.random == 1 and menu.random
    assert menu.buttons.state[102] == DISABLED
    assert not any(id in menu.hidden for id in PANEL_IDS)
    assert all(menu.buttons.state[id] == NORMAL for id in PANEL_IDS)
    menu.choose(menu.index)                                     # the scenario list's OK: panel off again
    assert all(id in menu.hidden for id in PANEL_IDS)


def test_slider_click_reads_the_mouse_at_handler_time(menu):
    registry.run_action(102, menu)
    run = menu.app.run_carry.random_map
    for i, mx, want in ((0, 384, 0), (1, 503, 6), (2, 444, 3), (3, 418, 1)):
        x, y, w, h = ds_words(kit(menu.app).exe, 0x29AC + 8 * i, 4)
        assert (x, y, w, h) == (384, 216 + 30 * i, 120, 20)
        _click(menu.app, (mx, y + 5))
        assert run.sliders[i] == want and run.shown[i] == 1
    menu.app.input.pos = (600, 0)                               # the handler reads where the mouse is now
    registry.run_action(106, menu)
    assert run.sliders[0] == RP.slider_value(600, 384, 120) == 12


def test_query_toggle_and_its_pressed_button(menu, monkeypatch):
    """0571: DS:28d8[i] = 0, the value stays; 110 + i drawn pressed (state 0), so a press on it only
    chords (07be:0e7b); a slider click while "?" shows brings the value back (0512's else branch)
    without reading the mouse."""
    from warlords2.audio import effects
    chords = []
    monkeypatch.setattr(effects, "chord", lambda app: chords.append(1))
    registry.run_action(102, menu)
    run = menu.app.run_carry.random_map
    run.sliders[1] = 5
    b = next(b for b in menu.buttons.buttons if b.id == 111)
    _click(menu.app, (b.rect[0] + 5, b.rect[1] + 5))
    assert run.shown == [1, 0, 1, 1] and run.sliders[1] == 5
    assert menu.buttons.state[111] == PRESSED and menu.buttons.state[110] == NORMAL
    _click(menu.app, (b.rect[0] + 5, b.rect[1] + 5))
    assert chords == [1] and run.shown == [1, 0, 1, 1]
    _click(menu.app, (384, 246 + 5))                            # 107 at its left end: value 0 if read
    assert run.shown == [1] * 4 and run.sliders[1] == 5
    assert menu.buttons.state[111] == NORMAL


def test_allies_and_terrain_set(menu, monkeypatch):
    k = kit(menu.app)
    registry.run_action(102, menu)
    run = menu.app.run_carry.random_map
    registry.run_action(105, menu)
    assert run.allies == 1
    registry.run_action(105, menu)
    assert run.allies == 0
    data = k.store.read(k.files.get(36, 0))
    assert RP.terrain_count(k) == int.from_bytes(data[:2], "little") == 1      # one record in 1.02
    registry.run_action(104, menu)
    assert run.terrain_set == 0                                 # (0 + 1) % 1
    monkeypatch.setattr(RP, "terrain_count", lambda k: 3)
    got = []
    for _ in range(4):
        registry.run_action(104, menu)
        got.append(run.terrain_set)
    assert got == [1, 2, 0, 1]


def test_terrain_label_is_the_record_text(menu):
    k = kit(menu.app)
    data = k.store.read(k.files.get(36, 0))
    want = data[4:2 + 0x34].split(b"\0")[0].decode("cp437")
    assert want and RP.terrain_label(k, 0) == want
    assert RP.terrain_label(k, 1) == "" and RP.terrain_label(k, -1) == ""


def test_value_texts_and_sources(menu):
    k = kit(menu.app)
    exe = k.exe
    run = RandomRun()
    rows = {0: range(5, 18, 2), 1: range(5, 18, 2), 2: range(70, 101, 5), 3: range(9, 22, 2)}
    for i, values in rows.items():
        fmt = ds_str(exe, ds_words(exe, 0x2918 + 4 * i, 2, signed=False)[0])
        for v, n in enumerate(values):
            run.sliders[i] = v
            assert RP.value_text(k, run, i) == printf(fmt, n)
            assert RP.slider_source(k, run, i) == (496, 80 + 20 * v, 120, 20)
        run.shown[i] = 0
        assert RP.value_text(k, run, i) == ds_str(exe, 0x2A76)
        assert RP.slider_source(k, run, i) == (496, 220, 120, 20)
        run.shown[i] = 1
    run.sliders[3] = 7                                          # past the row: DS:2918's first word
    assert RP.value_text(k, run, 3) == printf(ds_str(exe, ds_words(exe, 0x2918 + 12, 2)[0]), ds_word(exe, 0x2918))
    run.sliders[0] = -1                                         # before the row: DS:28de = DS:28d8[3]
    for s3 in (0, 1):
        run.shown[3] = s3
        assert RP.value_text(k, run, 0) == printf(ds_str(exe, ds_words(exe, 0x2918, 2)[0]), s3)


def _frame(menu):
    fb = pygame.Surface((640, 480), depth=8)
    fb.set_palette(menu.app.screen.fb.get_palette())
    menu.paint(fb)
    return fb


def _same(fb, at, pic, src):
    x, y = at
    sx, sy, w, h = src
    return all(fb.get_at_mapped((x + dx, y + dy)) == pic.get_at_mapped((sx + dx, sy + dy))
               for dx in range(0, w, 3) for dy in range(0, h, 3))


def test_panel_pixels(menu):
    """0332(-1): colour 3 over DS:2930 = (328, 200, 264, 225); each slider picture copied opaque
    from picture 1 at DS:299c[i] = (384, 216 + 30 i); the labels end at x 376 (right-aligned)."""
    k = kit(menu.app)
    registry.run_action(102, menu)
    run = menu.app.run_carry.random_map
    run.sliders, run.shown = [0, 6, 2, 5], [1, 1, 1, 0]
    fb = _frame(menu)
    pic = k.picture(1)
    assert fb.get_at_mapped((329, 201)) == 3 and fb.get_at_mapped((590, 423)) == 3
    for i, src in enumerate([(496, 80, 120, 20), (496, 200, 120, 20), (496, 120, 120, 20), (496, 220, 120, 20)]):
        assert _same(fb, (384, 216 + 30 * i), pic, src)
    for i in range(4):                                          # nothing of the label right of x 376
        row = [fb.get_at_mapped((x, 215 + 30 * i + dy)) for x in range(376, 384) for dy in range(20)]
        assert set(row) == {3}
        assert any(fb.get_at_mapped((x, 215 + 30 * i + dy)) != 3 for x in range(332, 376) for dy in range(20))
    menu.choose(menu.index)                                     # 06b8 clears the one word DS:28c8
    assert run.random == 0 and not menu.random
    fb = _frame(menu)
    assert not _same(fb, (384, 216), pic, (496, 80, 120, 20))  # no panel: the scenario picture


# ------------------------------------------------------------------ Save Map / Load Map


def _human(a, n=400):
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            return g
        top = g.dialogs.top if getattr(g, "dialogs", None) else None
        tid = getattr(top, "dialog_id", None)
        if tid == "production":
            top.press(192)
            a.step([])
            continue
        if tid == "hero_offer":
            top.press(287)
            a.step([])
            continue
        up = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
        a.step([up] if tid in ("turn_start", "tutorial_page", "message", "level_up", "medal") else [])
    raise AssertionError("no human phase")


@pytest.fixture(scope="module")
def game_app(game, tmp_path_factory):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--user-dir", str(tmp_path_factory.mktemp("u"))]))
    yield a
    a.close()


@pytest.fixture
def g(game_app, tmp_path):
    """The game in its human phase, a fresh user directory, slot tables and run memory; the SCN
    marks a fresh random map (0x120 = 1, 0x130 = 0) and RMAPTEMP holds its snapshot."""
    from warlords2.persist.maps import Maps
    from warlords2.persist.saves import Saves
    from warlords2.persist.userdir import UserDir
    g = _human(game_app)
    while g.dialogs:
        g.dialogs.top.close(None)
    user = UserDir(tmp_path / "user", game_app.cfg.data)
    game_app.saves = Saves(user, game_app.gd)
    game_app.maps = Maps(user, game_app.gd, saves=game_app.saves)
    game_app.run_carry = RunCarry()
    rec = next(r for r in parse_scenario_dat(kit(game_app).store.read("DATA/SCENARIO.DAT"))
               if r["str_3c"].upper() == "TUTORIA")
    game_app.run_carry.enter(g.state, rec)
    old = dict(g.state.flags)
    g.state.flags[0x120], g.state.flags[0x130] = 0, 0
    assert game_app.maps.write_temp(g.state, rec)               # 11f3 runs before ovl57:007f sets 0x120
    g.state.flags[0x120] = 1
    yield g
    g.state.flags.clear()
    g.state.flags.update(old)


def _spy(monkeypatch, g, name):
    calls = []
    monkeypatch.setattr(g, name, lambda *a: calls.append(a), raising=False)
    return calls


def test_save_map_gate(g):
    """1214 lists only with SCN 0x130 == 0, SCN 0x120 != 0 and DS:28c6 == 0."""
    assert registry.has_action(503) and registry.has_action(504)
    g.state.flags[0x130] = 1
    assert registry.run_action(503, g) is None and not g.dialogs
    g.state.flags[0x130], g.state.flags[0x120] = 0, 0
    assert registry.run_action(503, g) is None and not g.dialogs
    g.state.flags[0x120] = 1
    from warlords2.states.menu import Menu
    menu = Menu.__new__(Menu)
    menu.app, menu.dialogs = g.app, g.dialogs
    assert registry.run_action(503, menu) is None and not g.dialogs        # the Game Start screen
    assert MS.scn_flags(type("S", (), {"app": g.app, "sides": None, "state": None})()) is g.state.flags
    d = registry.run_action(503, g)
    assert d.dialog_id == "sage_list"
    d.close(-1)


def test_save_map_list_box_and_copy(g, monkeypatch):
    drawn = _spy(monkeypatch, g, "palette_drawn")
    k, carry, mp = kit(g.app), g.app.run_carry, g.app.maps
    carry.map_row = 4
    d = registry.run_action(503, g)
    assert d.title == k.text.S(48, 0) and len(d.names) == 10 and d.sel == 0 and d.buffer is carry
    d.press(ROW0 + 2)
    d.press(OK)
    box = g.dialogs.top
    assert box.dialog_id == "input_box" and (box.limit, box.width) == (15, 0xA0)
    assert box.title == k.text.S(48, 0) and box.lines == [k.text.S(48, i) for i in (1, 2)]
    assert carry.slot == carry.map_row == 2 and box.text == mp.table.desc[2]
    box.press(TI.FIELD)
    box.update([key(pygame.K_m, "m"), key(pygame.K_SPACE, " "), key(pygame.K_x, "x"), RET], 16)
    assert not drawn
    box.press(TI.YES)
    assert not g.dialogs and len(drawn) == 1                    # the three-way redraw: the game screen
    assert mp.table.used[2] and mp.table.desc[2] == "m x" and mp.any_used() == 1
    assert mp.map_path(2).read_bytes() == mp.temp_path().read_bytes()


def test_save_map_cancels(g, monkeypatch):
    drawn = _spy(monkeypatch, g, "palette_drawn")
    mp = g.app.maps
    d = registry.run_action(503, g)
    d.update([ESC], 16)                                         # Esc -> 124 -> 13c2(-1)
    assert not g.dialogs and len(drawn) == 1
    d = registry.run_action(503, g)
    d.press(ROW0 + 1)
    d.update([RET], 16)                                         # Return -> 123
    box = g.dialogs.top
    assert box.dialog_id == "input_box"
    box.update([ESC], 16)                                       # ovl34:1434
    assert not g.dialogs and len(drawn) == 2
    assert not any(mp.table.used) and not mp.map_path(1).exists()


def _until(app, pred, n=600):
    for _ in range(n):
        if pred():
            return
        app.step([])
    raise AssertionError("not reached")


def test_load_map_list_scroll_and_hook(g, monkeypatch):
    k, carry, mp = kit(g.app), g.app.run_carry, g.app.maps
    carry.slot = 0
    mp.save_map(carry, "zero")
    mp.table.used[5], mp.table.desc[5] = True, "five"
    mp.temp_path().write_bytes(b"other")                       # RMAPTEMP changed since the save
    carry.map_row = 1
    groups = []
    real = registry._dialogs["progress"]
    monkeypatch.setitem(registry._dialogs, "progress",
                        lambda host, group, work, on_close=None: groups.append(group) or real(host, group, work, on_close))
    got = _spy(monkeypatch, g, "map_loaded")
    d = registry.run_action(504, g)
    assert d.title == k.text.S(49, 0) and len(d.names) == 2 and d.sel == 1
    assert [carry.name(e) for e in d.rows[:2]] == ["zero", "five"]
    d.press(ROW0)
    d.press(OK)
    assert carry.slot == carry.map_row == 0
    _until(g.app, lambda: got)
    assert groups == [134, 137]                                 # the read, then ovl63:232b always
    (r,), = got
    assert isinstance(r, MS.MapLoadResult) and r.n == 0 and not r.failed and r.loaded.rebuilt
    assert r.overview is not None and r.loaded.state.flags[0x130] == 1
    assert mp.temp_path().read_bytes() == mp.map_path(0).read_bytes()    # 0d61 RMAP0 -> RMAPTEMP
    assert carry.game is r.loaded.state


def test_load_map_entry_index_is_the_file_and_cancel(g, monkeypatch):
    """12f2 opens FILE.DAT (26, entry): with only slot 3 used its row opens RMAP0, which is missing
    here: the failed open goes on over the game in memory (12f2 tests no result)."""
    drawn = _spy(monkeypatch, g, "palette_drawn")
    carry, mp = g.app.run_carry, g.app.maps
    carry.slot = 3
    mp.save_map(carry, "three")
    d = registry.run_action(504, g)
    d.update([ESC], 16)
    assert not g.dialogs and len(drawn) == 1                    # 12f2(-1): the three-way redraw
    got = _spy(monkeypatch, g, "map_loaded")
    d = registry.run_action(504, g)
    d.update([RET], 16)
    _until(g.app, lambda: got)
    (r,), = got
    assert r.n == 0 and r.failed and r.loaded.state is g.state
    assert not mp.map_path(0).exists()


def test_load_map_without_host_hook_goes_back(g, monkeypatch):
    """A host without `map_loaded` (review U M1): the list's OK goes back at once, before the
    scroll, the load or the RMAPTEMP copy touch anything."""
    drawn = _spy(monkeypatch, g, "palette_drawn")
    carry, mp = g.app.run_carry, g.app.maps
    carry.slot = 0
    mp.save_map(carry, "zero")
    mp.temp_path().write_bytes(b"other")
    if "map_loaded" in vars(g):                                 # left by an earlier test's spy
        monkeypatch.delattr(g, "map_loaded")
    monkeypatch.delattr(type(g), "map_loaded")
    assert not hasattr(g, "map_loaded")
    live, row = carry.game, carry.map_row
    d = registry.run_action(504, g)
    d.press(OK)
    assert not g.dialogs and len(drawn) == 1
    assert carry.game is live and carry.map_row == row and mp.temp_path().read_bytes() == b"other"


def _drain(gen):
    out = []
    while True:
        try:
            out.append(next(gen))
        except StopIteration as stop:
            return out, stop.value


def test_load_map_work_percentages(g):
    """0414's ovl02:01ff calls are not gated by the game flag: 0, 10, the open, 20 .. 70 after a
    good open only, 80, 90; 232b's scroll and the 100 follow (rebuild always)."""
    carry, mp = g.app.run_carry, g.app.maps
    carry.slot = 0
    mp.save_map(carry, "zero")
    hidden = []
    steps, (res, failed) = _drain(MS.load_map_work(g.app, 0, hide=lambda: hidden.append(1)))
    assert steps == [0, 10, 20, 30, 40, 50, 60, 70, 80, 90] and not failed and res.rebuilt and hidden == [1]
    carry.enter(g.state, carry.record)
    steps, (res, failed) = _drain(MS.load_map_work(g.app, 1))
    assert steps == [0, 10, 80, 90] and failed and res.state is g.state
