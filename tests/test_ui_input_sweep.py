"""The shared pop-up input rules of 08a9:012c / 07be:0064 on every JOIN-screen pop-up, and the
file-error chord of ovl52:0000.

* 08a9:0143: no button help while a left press is held on a button (DS:166c);
* 07be:006f: no key at all (no press, no chord) while DS:166c is set;
* 07be:0e7b: a left press on a disabled or pressed button chords;
* ovl52:002e: a file the store cannot open chords before the message."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

from types import SimpleNamespace  # noqa: E402

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.assets.store import AssetStore  # noqa: E402
from warlords2.audio import effects  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.ui import keys, registry  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL, PRESSED  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
DISMISS = ("turn_start", "tutorial_page", "message", "level_up", "medal", "quest_reward")


def _ev(t, button, pos):
    return pygame.event.Event(t, button=button, pos=pos)


def _key(k, uni=""):
    return pygame.event.Event(pygame.KEYDOWN, key=k, unicode=uni, mod=0, scancode=0)


class _B:
    def __init__(self, id, rect):
        self.id, self.rect = id, rect

    def contains(self, pos):
        x, y, w, h = self.rect
        return x <= pos[0] < x + w and y <= pos[1] < y + h


class _Row:
    def __init__(self, *buttons):
        self.buttons = list(buttons)
        self.state = {b.id: NORMAL for b in buttons}
        self.held = None

    def at(self, pos):
        return next((b for b in reversed(self.buttons) if b.contains(pos)), None)


@pytest.fixture
def chords(monkeypatch):
    out = []
    monkeypatch.setattr(effects, "chord", lambda app: out.append(app) or 0)
    return out


@pytest.fixture
def helps(monkeypatch):
    out = []
    monkeypatch.setitem(registry._right_click, "button", lambda host, id, pos: out.append(id))
    return out


# ------------------------------------------------------------------ helpers (no game data)


def test_right_help_skips_while_held(helps):
    a = _B(7, (0, 0, 10, 10))
    row = _Row(a)
    assert keys.right_help("host", row, (5, 5)) is True and helps == [7]
    assert keys.right_help("host", row, (50, 50)) is False                      # an area's
    row.held = a
    assert keys.right_help("host", row, (5, 5)) is True and helps == [7]       # 08a9:0143
    assert keys.right_help("host", row, (50, 50)) is True                       # 0726:001d


def test_popup_key_silent_while_held(chords):
    exe = b""                                              # never read: the held test comes first
    row = _Row(_B(7, (0, 0, 10, 10)))
    row.held = row.buttons[0]
    for code in (keys.ESC, keys.RETURN, keys.DEL, 0x31):
        assert keys.popup_key("app", row, code, exe, esc=(7,), ret=(7,)) is None
    assert chords == []
    row.held = None
    assert keys.popup_key("app", row, keys.ESC, exe, esc=(7,), ret=(7,)) == 7
    assert keys.popup_key("app", row, 0x31, exe, esc=(7,), ret=(7,)) is None and chords == ["app"]


class _Dlg:
    def __init__(self, stack=None):
        self.host = SimpleNamespace(app=SimpleNamespace(input=SimpleNamespace(keys=set())))
        self.stack = stack
        self.seen = []

    def update(self, events, dt):
        self.seen += events


def test_popup_input_follows_a_rebuilt_row():
    """A press that rebuilds the row (Build Production's `buttons`): later events of the
    batch go to the new row."""
    from warlords2.ui.widgets import ButtonRow
    from warlords2.ui.layout import Button
    mk = lambda id: ButtonRow([Button(id, (0, 0, 10, 10), ((0, 0),) * 3, 0)], None)   # noqa: E731
    d = _Dlg()
    d.stack = SimpleNamespace(top=d)
    rows = {"cur": mk(1)}
    hits = []

    def press(id):
        hits.append(id)
        rows["cur"] = mk(2)
    evs = [_ev(pygame.MOUSEBUTTONDOWN, 1, (5, 5)), _ev(pygame.MOUSEBUTTONUP, 1, (5, 5)),
           _ev(pygame.MOUSEBUTTONDOWN, 1, (5, 5)), _ev(pygame.MOUSEBUTTONUP, 1, (5, 5))]
    keys.popup_input(d, evs, lambda: rows["cur"], b"", press)
    assert hits == [1, 2]


def test_hand_on_gives_the_rest_to_the_new_top():
    child = _Dlg()
    d = _Dlg()
    d.stack = SimpleNamespace(top=child)
    keys.hand_on(d, ["k"], 16)
    assert child.seen == ["k"]
    d.stack = SimpleNamespace(top=d)
    keys.hand_on(d, ["x"], 16)
    assert d.seen == [] and child.seen == ["k"]


def _host_stub(cls, buttons, bar_keys):
    h = cls.__new__(cls)
    h.app = SimpleNamespace(input=SimpleNamespace(keys=set()), kit=object())
    h.dialogs = []
    h.starting = False
    h.buttons = buttons
    h._kit = lambda: None
    bar = SimpleNamespace(press=lambda host, pos: False, key=lambda host, code: bar_keys.append(code) or True)
    h.bar = SimpleNamespace(bar=bar, press=bar.press, key=bar.key)
    return h


@pytest.mark.parametrize("which", ["host", "probe"])
def test_pre_game_keys_ignored_while_held(which, chords):
    """07be:006f: no key reaches the menu bar while a left press is held on a button."""
    from warlords2.debug.probe_states import UiHost
    from warlords2.states.host import ScreenHost
    from warlords2.ui.widgets import ButtonRow
    from warlords2.ui.layout import Button
    row = ButtonRow([Button(5, (0, 0, 10, 10), ((0, 0),) * 3, 0)], None)
    got = []
    h = _host_stub(ScreenHost if which == "host" else UiHost, row, got)
    key = _key(pygame.K_1, "1")
    h.step([_ev(pygame.MOUSEBUTTONDOWN, 1, (5, 5)), key], 16)
    assert row.held is not None and got == [] and chords == []
    h.step([_ev(pygame.MOUSEBUTTONUP, 1, (50, 50)), key], 16)
    assert row.held is None and got == [0x31]
    row.state[5] = DISABLED
    h.step([_ev(pygame.MOUSEBUTTONDOWN, 1, (5, 5))], 16)
    assert len(chords) == 1 and row.held is None                    # 07be:0e7b


# ------------------------------------------------------------------ the dialogs (game data)


def _drive(a):
    for _ in range(5000):
        g = a.manager.current_state()
        t = getattr(g, "dialogs", None)
        t = t.top if t is not None else None
        tid = getattr(t, "dialog_id", None)
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            return g
        if tid == "production":
            t.press(192)
        elif tid == "hero_offer":
            t.press(287)
        a.step([UP] if tid in DISMISS else [])
    raise AssertionError("no human phase")


@pytest.fixture(scope="module")
def app(game, tmp_path_factory):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "6", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--levels", "03333330",
                        "--user-dir", str(tmp_path_factory.mktemp("u"))]))
    yield a
    a.close()


@pytest.fixture
def g(app):
    g = _drive(app)
    yield g
    while g.dialogs:
        g.dialogs.top.close(None)


def _open(g, name):
    registry.run_action(registry.MENU_ID[name], g)
    d = g.dialogs.top
    g.app.step([])
    return d


def _feed(g, d, *evs):
    g.app.input.feed(list(evs))
    d.update(list(evs), 16)


def _centre(b):
    x, y, w, h = b.rect
    return x + w // 2, y + h // 2


@gamedata
@pytest.mark.parametrize("name", ["hero_levels", "items", "settings"])
def test_popup_help_not_while_held(g, helps, name):
    d = _open(g, name)
    b = d.row.buttons[0]
    live = next(x for x in d.row.buttons if d.row.state[x.id] == NORMAL)
    _feed(g, d, _ev(pygame.MOUSEBUTTONDOWN, 1, _centre(live)))
    assert d.row.held is live
    _feed(g, d, _ev(pygame.MOUSEBUTTONDOWN, 3, _centre(b)))
    assert helps == []
    _feed(g, d, _ev(pygame.MOUSEBUTTONUP, 3, _centre(b)), _ev(pygame.MOUSEBUTTONUP, 1, (2, 2)))
    assert d.row.held is None and g.dialogs.top is d
    _feed(g, d, _ev(pygame.MOUSEBUTTONDOWN, 3, _centre(b)))
    assert helps == [b.id]
    _feed(g, d, _ev(pygame.MOUSEBUTTONUP, 3, _centre(b)))


@gamedata
def test_hero_levels_keys(g, chords):
    """469 is in DS:1514 and DS:155c: Esc closes; a digit chords; 'A'..'Z' nothing."""
    d = _open(g, "hero_levels")
    _feed(g, d, _key(pygame.K_a, "A"))
    assert chords == [] and g.dialogs.top is d
    _feed(g, d, _key(pygame.K_1, "1"))
    assert len(chords) == 1 and g.dialogs.top is d
    _feed(g, d, _key(pygame.K_ESCAPE))
    assert g.dialogs.top is not d


@gamedata
def test_key_ignored_while_held(g, chords):
    d = _open(g, "items")
    close = next(b for b in d.row.buttons if b.id == 495)
    _feed(g, d, _ev(pygame.MOUSEBUTTONDOWN, 1, _centre(close)))
    _feed(g, d, _key(pygame.K_ESCAPE), _key(pygame.K_1, "1"))
    assert chords == [] and g.dialogs.top is d                    # 07be:006f
    _feed(g, d, _ev(pygame.MOUSEBUTTONUP, 1, (2, 2)))
    _feed(g, d, _key(pygame.K_ESCAPE))
    assert g.dialogs.top is not d


@gamedata
def test_settings_disabled_button_chords(g, chords):
    d = _open(g, "settings")
    dis = [b for b in d.row.buttons if d.row.state[b.id] == DISABLED]
    if not dis:
        d.row.state[d.row.buttons[-1].id] = DISABLED
        dis = [d.row.buttons[-1]]
    _feed(g, d, _ev(pygame.MOUSEBUTTONDOWN, 1, _centre(dis[0])))
    assert len(chords) == 1 and d.row.held is None                # 07be:0e7b, no press
    _feed(g, d, _ev(pygame.MOUSEBUTTONUP, 1, _centre(dis[0])))
    assert g.dialogs.top is d


@gamedata
def test_temple_style_pressed_button_chords(g, chords):
    """A pressed (state 0) button chords too (options' presets, hero offer's sex)."""
    d = _open(g, "hero_levels")
    d.row.state[469] = PRESSED
    _feed(g, d, _ev(pygame.MOUSEBUTTONDOWN, 1, _centre(d.row.buttons[0])))
    assert len(chords) == 1 and d.row.held is None


@gamedata
def test_map_right_press_blocked_while_palette_held(g, helps, monkeypatch):
    """0726:0016..001f: the map panels' poll returns while DS:166c is set; 08a9:0143 the help."""
    ph = g.phase
    seen = []
    monkeypatch.setattr(ph, "map_info", lambda sq: seen.append(sq))
    b = ph.palette.row.buttons[0]
    ph.palette.row.held = b
    try:
        ph.right_press((200, 200))
        ph.right_press(_centre(b))
        assert seen == [] and helps == []
    finally:
        ph.palette.row.held = None
    ph.right_press((200, 200))
    assert len(seen) == 1


# ------------------------------------------------------------------ ovl52:0000


@gamedata
def test_missing_file_chords_before_message(game, chords, capsys):
    app = object()
    store = AssetStore(GameDir(game), app=app)
    with pytest.raises(SystemExit):
        store.read("DATA/NOSUCH.DAT")
    assert chords == [app]
    assert "NOSUCH.DAT" in capsys.readouterr().err
    with pytest.raises(SystemExit):
        AssetStore(GameDir(game)).read("DATA/NOSUCH.DAT")
    assert chords == [app]


@gamedata
def test_area_right_press_blocked_while_held(g, monkeypatch):
    """0726:0016..001f: the pop-ups' area handlers do not run while DS:166c is set."""
    from warlords2.ui.dialogs import hero_inspect as HI
    from warlords2.ui.dialogs import production as P
    st = g.state
    ci = next(i for i, c in enumerate(st.cities) if (c.owner & 0xFF) == st.current)
    d = registry.open_dialog("production", g, city=ci)
    g.app.step([])
    polls = []
    monkeypatch.setattr(d, "map_poll", lambda pos, *a: polls.append(pos))
    done = next(b for b in d.row.buttons if d.row.state[b.id] == NORMAL)
    inside = (P.MAP_RECT[0] + 50, P.MAP_RECT[1] + 50)
    _feed(g, d, _ev(pygame.MOUSEBUTTONDOWN, 1, _centre(done)), _ev(pygame.MOUSEBUTTONDOWN, 3, inside))
    assert polls == []
    _feed(g, d, _ev(pygame.MOUSEBUTTONUP, 3, inside), _ev(pygame.MOUSEBUTTONUP, 1, (2, 2)))
    _feed(g, d, _ev(pygame.MOUSEBUTTONDOWN, 3, inside))
    assert polls == [inside]
    _feed(g, d, _ev(pygame.MOUSEBUTTONUP, 3, inside))
    d.close(None)
    h = _open(g, "hero_inspect")
    opened = []
    real = registry.open_dialog
    monkeypatch.setattr(registry, "open_dialog", lambda name, *a, **k: opened.append(name))
    live = next(b for b in h.row.buttons if h.row.state[b.id] == NORMAL)
    inside = (HI.MAP_AREA[0] + 50, HI.MAP_AREA[1] + 50)
    _feed(g, h, _ev(pygame.MOUSEBUTTONDOWN, 1, _centre(live)), _ev(pygame.MOUSEBUTTONDOWN, 3, inside))
    assert opened == []
    _feed(g, h, _ev(pygame.MOUSEBUTTONUP, 3, inside), _ev(pygame.MOUSEBUTTONUP, 1, (2, 2)))
    _feed(g, h, _ev(pygame.MOUSEBUTTONDOWN, 3, inside))
    assert opened == ["info/text"]
    monkeypatch.setattr(registry, "open_dialog", real)


@gamedata
def test_production_tabs_read_the_stored_city_count(g):
    """ovl45:0447 tests DS:5dea[SCN 0x110] (`GameState.city_counts`), not a fresh count."""
    from warlords2.ui.dialogs import production as P
    st = g.state
    ci = next(i for i, c in enumerate(st.cities) if (c.owner & 0xFF) == st.current)
    keep = list(st.city_counts)
    try:
        st.city_counts[st.current] = 0
        d = registry.open_dialog("production", g, city=ci)
        assert d.row.state[P.BUILD_TAB] == DISABLED
        d.close(None)
        st.city_counts[st.current] = 1
        d = registry.open_dialog("production", g, city=ci)
        assert d.row.state[P.BUILD_TAB] != DISABLED
        d.close(None)
    finally:
        st.city_counts[:] = keep


@gamedata
def test_map_palette_press_chords_and_keys_wait(g, chords, monkeypatch):
    """The game screen shares 08a9:012c: a disabled palette button chords (07be:0e7b); keys do
    nothing while a palette button is held (07be:006f)."""
    ph = g.phase
    row = ph.palette.row
    b = row.buttons[0]
    keep = row.state[b.id]
    seen = []
    monkeypatch.setattr(ph, "centre_leader", lambda: seen.append(1))
    try:
        row.state[b.id] = DISABLED
        e = _ev(pygame.MOUSEBUTTONDOWN, 1, _centre(b))
        g.app.input.feed([e])
        ph.step([e], 16)
        assert len(chords) == 1 and row.held is None
        e = _ev(pygame.MOUSEBUTTONUP, 1, _centre(b))
        g.app.input.feed([e])
        ph.step([e], 16)
        row.held = b                                             # DS:166c
        k = _key(pygame.K_5, "5")
        g.app.input.feed([k])
        ph.step([k], 16)
        assert seen == [] and len(chords) == 1
        row.held = None
        g.app.input.feed([k])
        ph.step([k], 16)
        assert seen == [1]
    finally:
        row.state[b.id] = keep
        row.held = None


@gamedata
@pytest.mark.parametrize("key", [pygame.K_ESCAPE, pygame.K_DELETE])
def test_editor_del_is_esc(g, key):
    """ovl59:020d 024d..0253 turns Del (0x153) into Esc, which ovl56:03a6 tests at 0455."""
    got = []
    d = registry.open_dialog("hero_name", g, rect=(328, 287, 208, 20), old="x", max_len=15,
                             max_width=176, on_close=got.append)
    _feed(g, d, _key(pygame.K_b, "b"), _key(key))
    assert got == [None] and d.stack is None
