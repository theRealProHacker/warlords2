"""M2a: text, layout tables, menu bar, registry (docs/plan.md section 4, row M2a).

Game text is checked by digest and length only (docs/plan.md section 0)."""
import hashlib
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.assets.fonts import Fonts  # noqa: E402
from warlords2.assets.store import AssetStore  # noqa: E402
from warlords2.assets.text import Text, printf  # noqa: E402
from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialog import DialogStack  # noqa: E402
from warlords2.ui.layout import Layouts  # noqa: E402
from warlords2.ui.menubar import (MenuBar, MenuDialog, check_menu_ids, getch_code,  # noqa: E402
                                  read_menu_tables, with_codes)

gamedata = pytest.mark.gamedata
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def sha(s: str) -> str:
    return hashlib.sha256(s.encode("cp437")).hexdigest()


@pytest.fixture(scope="module")
def store(game):
    pygame.display.init()
    return AssetStore(GameDir(game))


@pytest.fixture(scope="module")
def fonts(store):
    return Fonts(store.read)


@pytest.fixture(scope="module")
def tables(store):
    return read_menu_tables(store.read("WARLORD2.EXE"))


class In:
    def __init__(self, pos=(0, 0), buttons=(), keys=()):
        self.pos, self.buttons, self.keys = pos, set(buttons), set(keys)


class App:
    def __init__(self, store=None, buttons=()):
        self.assets = store
        self.input = In(buttons=buttons)


class Host:
    def __init__(self, store=None, buttons=()):
        self.dialogs = DialogStack()
        self.app = App(store, buttons)


# --------------------------------------------------------------------------- text


def test_printf_conversions():
    assert printf("%d%%", 70) == "70%"
    assert printf("%s/%lu", "a", 5) == "a/5"
    with pytest.raises(TypeError):
        printf("%d", 1, 2)


@gamedata
def test_string_clamp_and_hlp_first_record(store):
    t = Text(store.read("DATA/STRING.DAT"), store.read("HELP/WARLORD2.HLP"))
    g = t.group(137)
    assert t.S(137, 99) == g[-1]                     # ovl59:04f0 clamps to count-1
    assert t.hlp(100)["word2"] == 0 and len(t.hlp(100)["title"]) == 16
    assert t.hlp(65000) is None


# --------------------------------------------------------------------------- layout


@gamedata
def test_layout_join_and_button_100(store):
    lay = Layouts(store.read("DATA/JOIN.DAT"), store.read("DATA/AREA.DAT"), store.read("DATA/BUTTON.DAT"))
    s = lay.screen(1)
    b = s.button(100)
    assert b.rect == (32, 162, 248, 53) and b.picture == 1
    assert s.area(3).rect == (0, 0, 640, 18)
    assert lay.find_button(100) == (1, b)


# --------------------------------------------------------------------------- menu bar


@gamedata
def test_menu_tables_match_registry(tables):
    menus, actions = tables
    check_menu_ids(actions)
    assert len(menus) == 8 and len(actions) == 39
    assert [len(m.items) for m in menus] == [1, 8, 5, 7, 4, 8, 5, 1]


@gamedata
def test_title_rects(tables, fonts):
    bar = MenuBar(*tables, fonts[0])
    assert [r[0] for r in bar.title_rects] == [8, 56, 112, 168, 232, 280, 328, 392]
    assert {r[3] for r in bar.title_rects} == {17}


@gamedata
def test_unregistered_items_grey_and_inert(tables, fonts, monkeypatch):
    ran = []
    quit_id, save_id = registry.MENU_ID["quit"], registry.MENU_ID["save_game"]
    monkeypatch.setitem(registry._actions, quit_id, lambda host: ran.append(quit_id))
    monkeypatch.delitem(registry._actions, save_id, raising=False)
    bar = MenuBar(*tables, fonts[0])
    host = Host()
    quit_, save = bar.by_id[quit_id], bar.by_id[save_id]
    assert bar.item_enabled(quit_.menu, quit_.item) and not bar.item_enabled(save.menu, save.item)
    # the key of an unregistered item is swallowed and runs nothing
    assert bar.key(host, save.key) is True and not host.dialogs and not ran
    # mouse: press Game, release over the unregistered row: nothing runs
    host.app.input.pos = (60, 5)
    for item, expect in ((save, []), (quit_, [quit_id])):
        bar.press(host, (60, 5))
        d = host.dialogs.top
        assert isinstance(d, MenuDialog) and d.item_y[save.item] == 0x2710
        row = [ry for kind, ry, it in d.rows if kind == "item" and it.number == item.item][0]
        d.update([pygame.event.Event(pygame.MOUSEBUTTONUP, pos=(70, d.y + row + 2), button=1)], 16)
        assert not host.dialogs and ran == expect
    # keyboard: the item's own key runs it
    assert bar.key(host, quit_.key) and ran == [quit_id, quit_id]


def _kd(key, text=""):
    return pygame.event.Event(pygame.KEYDOWN, key=key, unicode=text)


def test_getch_codes_use_the_modifiers_held_at_each_key():
    alt, f = pygame.K_LALT, pygame.K_f
    up = pygame.event.Event(pygame.KEYUP, key=alt)
    # Input saw the whole frame: Alt went down before f and stays held
    codes = [c for _, c in with_codes([_kd(alt), _kd(f, "f")], In(keys={alt, f}))]
    assert codes == [None, 0x121]
    # f, then Alt down in the same frame: f was typed without Alt
    assert [c for _, c in with_codes([_kd(f, "f"), _kd(alt)], In(keys={alt, f}))] == [ord("f"), None]
    # Alt held from an earlier frame, released after f in this frame
    assert [c for _, c in with_codes([_kd(f, "f"), up], In(keys={f}))] == [0x121, None]
    assert getch_code(_kd(f, "f"), False, True) == ord("f") & 0x1F


# --------------------------------------------------------------------------- dialogs


@gamedata
def test_registry_loads_m2a_dialogs():
    names = registry.load_all()
    for d in ("message", "confirm", "progress", "help_page", "help_items", "tutorial_page"):
        assert registry.has_dialog(d)
    assert not hasattr(registry, "KEYS")
    assert any(n.endswith(".popup_help") for n in names)
    assert registry.has_action(188)


@gamedata
def test_right_click_button_100_shows_its_hlp_record(store):
    registry.load_all()
    t = Text(store.read("DATA/STRING.DAT"), store.read("HELP/WARLORD2.HLP"))
    rec = t.hlp(100)
    host = Host(store, buttons={3})
    d = registry.right_click_handler("button")(host, 100, (40, 170))
    assert sha(d.title + "|" + d.text) == sha(rec["title"] + "|" + rec["text"])
    assert d.rect == (0, 133, 256, 75)
    assert registry.right_click_handler("button")(host, 100, (40, 170)) is None   # one at a time
    host.app.input.buttons.clear()
    d.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_a, unicode="a")], 16)
    assert not host.dialogs                                   # closed: no button held
    assert registry.right_click_handler("button")(host, 65000, (40, 170)) is None


@gamedata
def test_gfx_help_pages_blit_inside_their_pictures(store):
    from warlords2.ui.gfxpage import render
    from warlords2.ui.widgets import Kit
    k = Kit(store)
    fb = pygame.Surface((640, 480), depth=8)
    for name in ("HELP/HMOUSE.GFX", "HELP/HKEYS.GFX", "HELP/HITEM.GFX"):
        for pic, (sx, sy, w, h), _ in render(fb, store.read(name), (120, 50), k.fonts, k.picture):
            pw, ph = k.picture(pic).get_size()
            assert 0 <= sx and 0 <= sy and sx + w <= pw and sy + h <= ph, (name, pic)


def test_progress_bar_width():
    from warlords2.ui.dialogs.progress import bar_width
    assert [bar_width(p) for p in (0, 10, 50, 90, 100)] == [32, 48, 112, 176, 192]


@gamedata
def test_progress_shows_a_new_bar_one_frame_before_its_text(store):
    """ovl02:01ff: the bar first, the text after the BSCROLL reload (progress.py)."""
    registry.load_all()

    def work():
        yield 0
        yield None
        yield 10
        yield None
        return "done"
    host, got = Host(store), []
    d = registry.open_dialog("progress", host, group=137, work=work(), on_close=got.append)
    assert d.dialog_id == "progress"
    seen = []
    for _ in range(5):
        d.update([], 16)
        seen.append((d.pct, d.shown))
    assert seen == [(0, None), (0, 0), (10, 0), (10, 10), (10, 10)] and got == ["done"] and not host.dialogs


@gamedata
def test_progress_draws_the_last_percentage_before_closing(store):
    """ovl63:232b: "90 %" stays up while the last columns build; ovl57:02c6: 100 % then a wait."""
    registry.load_all()

    def work(last, wait):
        yield 0
        yield last
        for _ in range(wait):
            yield None
        return "done"
    for last, wait in ((90, 0), (100, 10)):
        host, got = Host(store), []
        d = registry.open_dialog("progress", host, group=137, work=work(last, wait), on_close=got.append)
        drawn = []
        while host.dialogs:
            d.update([], 16)
            if host.dialogs:
                drawn.append(d.shown)                     # the text this frame draws
        assert drawn.count(last) == max(1, wait) and got == ["done"]


@gamedata
def test_kit_is_kept_on_the_app_and_popup_type_2_is_refused(store):
    from warlords2.ui.widgets import kit
    app = App(store)
    k = kit(app)
    assert app.kit is k and kit(app) is k
    fb = pygame.Surface((640, 480), depth=8)
    with pytest.raises(NotImplementedError, match="ovl63:0000"):
        k.draw_popup(fb, 2)
    assert k.draw_popup(fb, 5) == (144, 179)


@gamedata
def test_cursor_hotspots_from_exe_and_image_at_pos_minus_hotspot(store):
    from warlords2.assets.cursors import Cursors
    c = Cursors(store.read("STAND.PCK"), store.read("WARLORD2.EXE"))
    assert c.hot == [0, 6, 8, 6, 8, 8, 8, 8, 0, 8, 8, 0]
    assert all(s.get_size() == (16, 16) for s in c.cells)
    for n, pos in ((1, (13, 21)), (0, (5, 3)), (2, (100, 50))):     # 12bf:036f / 098d
        fb = pygame.Surface((640, 480), depth=8)
        fb.fill(14)
        c.draw(fb, pos, n)
        want = pygame.Surface((640, 480), depth=8)
        want.fill(14)
        want.blit(c.cells[n], (pos[0] - c.hot[n], pos[1] - c.hot[n]))
        assert pygame.image.tobytes(fb, "P") == pygame.image.tobytes(want, "P"), n


@gamedata
def test_confirm_answers_with_buttons(store):
    registry.load_all()
    host, got = Host(store), []
    d = registry.open_dialog("confirm", host, title="t", lines=["a", "b"], on_close=got.append)
    assert d.pos == [(320, 150), (320, 173)]
    yes = d.buttons.buttons[0]
    c = (yes.rect[0] + 2, yes.rect[1] + 2)
    d.update([pygame.event.Event(pygame.MOUSEBUTTONDOWN, pos=c, button=1),
              pygame.event.Event(pygame.MOUSEBUTTONUP, pos=c, button=1)], 16)
    assert got == [True] and not host.dialogs


def test_modifier_alone_does_not_dismiss():
    from warlords2.ui.widgets import is_dismiss
    assert not is_dismiss(pygame.event.Event(pygame.KEYDOWN, key=pygame.K_LSHIFT, unicode=""))
    assert is_dismiss(pygame.event.Event(pygame.KEYDOWN, key=pygame.K_SPACE, unicode=" "))


def test_tick_frames_are_bios_ticks_at_the_tick_rate():
    """ovl59:0000(n) waits n BIOS ticks of 65536 / 1193182 s (register X05); chained waits
    carry the fraction (1 tick at 60 Hz = 3.2955 frames)."""
    from warlords2.ui.widgets import tick_frames
    assert tick_frames(1, 60) == 4 and tick_frames(10, 60) == 33          # ceil(32.955)
    assert [tick_frames(1, 60, e) for e in range(3)] == [4, 3, 3]
    for hz in (18, 30, 60, 70, 120):
        chained = sum(tick_frames(1, hz, e) for e in range(40))
        assert chained == tick_frames(40, hz) == -(-40 * hz * 65536 // 1193182)
    assert tick_frames(0, 60, 5) == 0
