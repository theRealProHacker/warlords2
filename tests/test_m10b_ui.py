"""M10b package U: the Save / Load / New Game / Quit dialogs of `ui.dialogs.save_load`, the shared
input box `ui.text_input` and the one ovl51 name buffer DS:483c, with a real App in a game and
the save files in a temporary user directory."""
import os
from types import SimpleNamespace

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.assets.fonts import CHANCE17  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.formats.scenario import parse_scenario_dat  # noqa: E402
from warlords2.states.menu import Menu  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui import text_input as TI  # noqa: E402
from warlords2.ui.dialogs import save_load as SLD  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

pytestmark = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
OK, CANCEL = 123, 124


def key(k, ch=""):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=ch, mod=0, scancode=0)


RET, ESC = key(pygame.K_RETURN, "\r"), key(pygame.K_ESCAPE, "\x1b")


def _top(g):
    return g.dialogs.top if g.dialogs else None


def _human(a, n=400):
    for _ in range(n):
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            return g
        top = _top(g) if hasattr(g, "dialogs") else None
        tid = getattr(top, "dialog_id", None)
        if tid == "production":
            top.press(192)
            a.step([])
            continue
        if tid == "hero_offer":
            top.press(287)
            a.step([])
            continue
        a.step([UP] if tid in ("turn_start", "tutorial_page", "message", "level_up", "medal") else [])
    raise AssertionError("no human phase")


@pytest.fixture(scope="module")
def app(game, tmp_path_factory):
    u = tmp_path_factory.mktemp("u")
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--user-dir", str(u)]))
    yield a
    a.close()


@pytest.fixture
def g(app, tmp_path):
    """The game in its human phase, a fresh user directory, slot table and run memory."""
    from warlords2.persist.saves import RunCarry, Saves
    from warlords2.persist.userdir import UserDir
    g = _human(app)
    while g.dialogs:
        g.dialogs.top.close(None)
    app.saves = Saves(UserDir(tmp_path / "user", app.cfg.data), app.gd)
    app.run_carry = RunCarry()
    rec = next(r for r in parse_scenario_dat(kit(app).store.read("DATA/SCENARIO.DAT"))
               if r["str_3c"].upper() == "TUTORIA")
    app.run_carry.enter(g.state, rec)
    return g


def _spy(monkeypatch, g, name):
    calls = []
    monkeypatch.setattr(g, name, lambda *a: calls.append(a), raising=False)
    return calls


# ------------------------------------------------------------------ the shared input box


def test_input_box_editor_rules(g):
    k = kit(g.app)
    got = []
    d = registry.open_dialog("input_box", g, title="t", lines=["a", "b"], text="old", limit=15, width=0xA0,
                             on_close=got.append)
    assert d.buttons.state[TI.NO] == NORMAL and d.buttons.state[TI.YES] == NORMAL
    d.press(TI.FIELD)
    d.update([key(pygame.K_i, "i")] * 40, 16)
    assert d.typing == "i" * 14                           # fewer than limit - 1 before a key
    d.update([ESC], 16)
    assert d.typing is None and d.text == "old"           # Esc keeps the old text
    d.press(TI.FIELD)
    d.update([key(pygame.K_m, "M")] * 40, 16)
    f = k.fonts[CHANCE17]
    t = d.typing
    assert f.width(t[:-1]) < 0xA0 <= f.width(t) and len(t) < 14       # the 160 px stop
    d.update([key(pygame.K_BACKSPACE), key(pygame.K_a, "{"), RET], 16)   # '{' = 0x7b is refused
    assert d.text == t[:-1]
    d.press(TI.FIELD)
    d.update([RET], 16)
    assert d.text == ""                                   # Return keeps an empty text too
    d.press(TI.YES)
    assert got == [""] and d.stack is None
    d2 = registry.open_dialog("input_box", g, title="t", lines=["a", "b"], text="x", limit=15, width=0xA0,
                              cancel_live=False, on_close=got.append)
    assert d2.buttons.state[TI.NO] == DISABLED
    d2.close(None)


def test_rename_city_is_the_shared_box():
    from warlords2.ui.dialogs.rename_city import RenameCity
    assert issubclass(RenameCity, TI.InputBox)


# ------------------------------------------------------------------ Save Game


def test_save_list_box_and_write(g, monkeypatch):
    drawn = _spy(monkeypatch, g, "palette_drawn")
    carry, sv = g.app.run_carry, g.app.saves
    carry.row = 2
    d = registry.run_action(501, g)
    assert d.dialog_id == "sage_list" and len(d.names) == 10 and d.sel == 2 and d.buffer is carry
    assert d.title == kit(g.app).text.S(46, 0)
    d.press(114 + 3)
    d.press(OK)
    box = _top(g)
    assert box.dialog_id == "input_box" and (box.limit, box.width) == (15, 0xA0)
    assert carry.slot == carry.row == 3 and box.text == sv.table.desc[3]
    assert box.title == kit(g.app).text.S(46, 0) and box.lines == [kit(g.app).text.S(46, i) for i in (1, 2)]
    box.press(TI.FIELD)
    box.update([key(pygame.K_q, "Q"), key(pygame.K_SPACE, " "), key(pygame.K_z, "z"), RET], 16)
    assert not drawn
    box.press(TI.YES)
    assert not g.dialogs and drawn                        # ovl61:0000(0, 0): the info area
    assert sv.table.used[3] and sv.table.desc[3] == "Q z"
    assert sv.game_path(3).is_file()
    raw = (sv.user.root / sv.table_rel()).read_bytes()
    assert raw.split(b"\n\r")[3] == b"104Q_z"


def test_save_cancels(g, monkeypatch):
    drawn = _spy(monkeypatch, g, "palette_drawn")
    carry, sv = g.app.run_carry, g.app.saves
    d = registry.run_action(501, g)
    d.press(CANCEL)
    assert not g.dialogs and len(drawn) == 1 and not any(sv.table.used)
    assert not (sv.user.root / sv.table_rel()).exists()
    d = registry.run_action(501, g)
    d.press(115)
    d.press(OK)
    _top(g).update([ESC], 16)                             # Esc on the box -> 190 -> ovl34:1434
    assert not g.dialogs and len(drawn) == 2
    assert carry.slot == carry.row == 1                   # 0995 set them before the box
    assert not any(sv.table.used) and not sv.game_path(1).exists()


def test_save_empty_description_marks_the_slot(g):
    sv = g.app.saves
    d = registry.run_action(501, g)
    d.press(OK)
    box = _top(g)
    box.press(TI.FIELD)
    box.update([RET], 16)
    box.press(TI.YES)
    assert sv.table.used[0] and sv.table.desc[0] == "" and sv.game_path(0).is_file()


# ------------------------------------------------------------------ Load Game


def test_load_list_stale_rows_and_entry_as_file(g, monkeypatch):
    carry, sv = g.app.run_carry, g.app.saves
    asked = []
    monkeypatch.setattr(g, "request", lambda name, **kw: asked.append((name, kw)))
    sv.table.desc = ["d%d" % i for i in range(10)]
    sv.save_list(carry)                                   # an earlier Save list filled all ten
    for i in (2, 5, 8):
        sv.table.used[i] = True
    carry.row = 7
    d = registry.run_action(502, g)
    assert d.title == kit(g.app).text.S(47, 0)
    assert d.rows == [3, 4, 5, 2, 2] and d.sel == 4 and len(d.names) == 3
    assert [carry.name(e) for e in d.rows] == ["d3", "d4", "d5", "d8", "d8"]   # 0..2 compacted, 3.. stale
    d.press(114 + 2)
    d.press(OK)
    assert asked == [("game", {"load_slot": 5})] and carry.slot == carry.row == 5


def test_load_button_101_and_cancel_paths(g, monkeypatch):
    assert registry.has_action(101) and registry.has_action(502) and registry.has_action(500)
    assert registry.has_action(501)
    g.app.saves.table.used[0] = True
    drawn = _spy(monkeypatch, g, "palette_drawn")
    registry.run_action(101, g).press(CANCEL)
    assert len(drawn) == 1                                # in a game: the game screen
    menu = Menu.__new__(Menu)
    menu.app = g.app                                      # ovl60:0000(0) plays music mode 0 (M10c)
    setup = SimpleNamespace(app=g.app, dialogs=None)
    hits = []
    menu.refresh = lambda: hits.append("menu")
    setup.refresh = lambda: hits.append("setup")
    assert SLD.where_of(menu) == "game_start" and SLD.where_of(setup) == "setup" and SLD.where_of(g) == "game"
    SLD.back(menu)
    SLD.back(setup)
    assert hits == ["menu", "setup"] and len(drawn) == 1


def _run(work):
    out = []
    try:
        while True:
            out.append(next(work))
    except StopIteration as s:
        return out, s.value


def test_load_scroll_percentages_same_run(g):
    carry, sv = g.app.run_carry, g.app.saves
    carry.slot = 4
    assert sv.write_game(carry, "x", g.state)
    steps, (res, failed) = _run(SLD.load_work(g.app, 4, "game"))
    assert not failed and not res.rebuilt                 # same scenario, in a game: no 232b
    assert steps == [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    assert carry.game is res.state


def test_load_scroll_failed_open(g):
    g.app.run_carry.game = g.state.copy()                 # the failed open wipes it in place
    steps, (res, failed) = _run(SLD.load_work(g.app, 9, "game"))
    assert failed and steps == [0, 10, 80, 90, 100]       # 0620 jumps to 08b1


def test_load_scroll_rebuild_then_build(g):
    from warlords2.persist.saves import RunCarry
    carry, sv = g.app.run_carry, g.app.saves
    carry.slot = 1
    sv.write_game(carry, "y", g.state)
    g.app.run_carry = RunCarry()                          # a fresh run on the Game Start screen
    steps, (res, failed) = _run(SLD.load_work(g.app, 1, "game_start"))
    assert res.rebuilt and steps == [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
    assert res.state.advisor_groups == g.state.advisor_groups and res.state.advisor_groups
    from warlords2.ui import minimap
    px = minimap.blank()
    steps2, _ = _run(SLD.build_work(g.app, res.state, px))
    assert steps2 == [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100] and px.any()


def test_open_load_chains_the_two_scrolls(g):
    from warlords2.persist.saves import RunCarry
    carry, sv = g.app.run_carry, g.app.saves
    carry.slot = 2
    sv.write_game(carry, "z", g.state)
    g.app.run_carry = RunCarry()
    got = []
    SLD.open_load(g, 2, "game_start", got.append)
    groups = []
    for _ in range(400):
        if got:
            break
        top = _top(g)
        groups.append(top.lines[2])
        top.update([], 16)
    t = kit(g.app).text
    assert got and got[0].overview is not None and not got[0].failed
    assert groups[0] == t.S(133, 2) and groups[-1] == t.S(137, 2)


def test_load_message(g):
    d = SLD.load_message(g, g.state)
    name = g.state.players[g.state.current].name
    assert d.dialog_id == "message" and d.lines == [kit(g.app).text.group(47)[1].replace("%s", name)]
    d.update([UP], 16)
    assert not g.dialogs


# ------------------------------------------------------------------ New Game, Quit


def test_new_game_confirm(g, monkeypatch):
    drawn = _spy(monkeypatch, g, "palette_drawn")
    yes = _spy(monkeypatch, g, "new_game_confirmed")
    d = registry.run_action(500, g)
    assert d.title == kit(g.app).text.S(45, 0) and len(d.lines) == 4
    d.press(190)
    assert drawn and not yes
    registry.run_action(500, g).press(189)
    assert yes == [()]


def test_quit(g, monkeypatch):
    out = []
    monkeypatch.setattr(g.app, "exit_program", lambda: out.append("exit"), raising=False)
    drawn = _spy(monkeypatch, g, "palette_drawn")
    SLD.quit_game(g)
    d = _top(g)
    assert d.dialog_id == "confirm" and d.title == kit(g.app).text.S(44, 0) and len(d.lines) == 4
    d.press(190)
    assert drawn and not out and not g.dialogs
    SLD.quit_game(g)
    _top(g).press(189)
    assert out == ["exit"]                                # --no-voice: no face
    menu = Menu.__new__(Menu)
    menu.app, menu.dialogs = g.app, None
    menu.roll = lambda *a: 0
    SLD.quit_game(menu)                                   # DS:2a86 == 0: at once
    assert out == ["exit", "exit"]


# ------------------------------------------------------------------ the name buffer DS:483c


def test_scenario_list_writes_the_buffer(g):
    from warlords2.persist.saves import RunCarry
    g.app.run_carry = RunCarry(names=["s%d" % i for i in range(10)])
    recs = parse_scenario_dat(kit(g.app).store.read("DATA/SCENARIO.DAT"))
    registry.open_dialog("scenario_select", g, records=recs, current=0).close(None)
    n = len(recs)
    assert g.app.run_carry.names[:n] == [r["dir"] for r in recs]     # record +0x14 (ovl60:05bf)
    assert g.app.run_carry.names[n:] == ["s%d" % i for i in range(n, 10)]


def test_slot_list_draws_the_buffer(g, tmp_path):
    from warlords2.persist.saves import RunCarry
    carry = RunCarry(names=["aa", "bb", "cc", "dd", "ee", "ff"])
    k = kit(g.app)
    fb = pygame.Surface((640, 480), depth=8)
    a = registry.open_dialog("sage_list", g, title="t", names=["aa"], first=5, buffer=carry)
    b = registry.open_dialog("sage_list", g, title="t", names=["aa"], first=5)
    assert a.rows == b.rows == [1, 0, 0, 0, 0] and a.sel == 4     # the -1 rows are shifted too
    fb.fill(0)
    a.draw(fb)
    with_buffer = pygame.image.tobytes(fb, "P")
    fb.fill(0)
    b.draw(fb)
    assert pygame.image.tobytes(fb, "P") != with_buffer      # the stale entry 1 is drawn
    a.close(None)
    b.close(None)
    assert k is not None
