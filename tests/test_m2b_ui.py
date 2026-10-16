"""M2b: Game Start and Game Setup screens (docs/plan.md section 4, row M2b).

The screens run in a headless App; the hand-off to the game state (M3) is checked on the
request the setup screen records.  Game text is never compared literally."""
import dataclasses
import os
import struct

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model.ids import LEVEL_OFF  # noqa: E402
from warlords2.model.newgame import NewGameConfig  # noqa: E402
from warlords2.model.options import GameOptions  # noqa: E402
from warlords2.rules.setup import difficulty_rating  # noqa: E402
from warlords2.states.menu import scenario_info  # noqa: E402
from warlords2.states.setup import quote_lines, read_quote  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs.options import cycle, option_pos, presets  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL, PRESSED  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402

gamedata = pytest.mark.gamedata


@pytest.fixture
def app(game, tmp_path):
    a = App(parse_args(["--data", game, "--headless", "--no-intro", "--no-voice", "--seed", "7",
                        "--user-dir", str(tmp_path / "u")]))
    yield a
    a.close()


def frames(app, n):
    for _ in range(n):
        app.step([])


def to_setup(app, scenario=None):
    frames(app, 2)
    menu = app.manager.current_state()
    assert app.manager.current_state_str() == "menu"
    if scenario:
        menu.choose([r["str_3c"].upper() for r in menu.records].index(scenario))
    menu.on_button(103)
    for _ in range(90):                       # the load and map scrolls (progress.py, 10-tick wait)
        app.step([])
        setup = app.manager.current_state()
        if getattr(setup, "ready", False):
            break
    assert app.manager.current_state_str() == "setup" and setup.ready
    return setup


@gamedata
def test_scenario_list_is_the_six_records(app):
    frames(app, 2)
    menu = app.manager.current_state()
    assert len(menu.records) == 6
    assert menu.directory == "ERYTHEA"                       # DS:2a6e on the first visit
    registry.open_dialog("scenario_select", menu, records=menu.records, current=menu.index,
                         on_close=menu.choose)
    d = menu.dialogs.top
    assert d.rows == [0, 1, 2, 3, 4, 5, -1] and d.selected == 3
    assert d.buttons.state[470] == DISABLED and d.buttons.state[471] == DISABLED
    d.press(476)
    d.press(474)
    assert menu.directory == "TUTORIA" and not menu.dialogs


@gamedata
def test_load_game_and_random_map_inert(app):
    import pygame
    frames(app, 2)
    menu = app.manager.current_state()
    assert registry.has_action(101) and registry.has_action(102)    # 101: M10b's Load Game, 102: M11's panel
    assert menu.buttons.state[101] == DISABLED                # no saves (ovl49:0e25)
    assert menu.buttons.state[102] == NORMAL
    b = next(b for b in menu.buttons.buttons if b.id == 101)            # a press on the disabled 101
    s = app.cfg.scale
    c = ((b.rect[0] + 4) * s, (b.rect[1] + 4) * s)
    app.step([pygame.event.Event(pygame.MOUSEBUTTONDOWN, pos=c, button=1)])
    app.step([pygame.event.Event(pygame.MOUSEBUTTONUP, pos=c, button=1)])
    assert not menu.dialogs and app.manager.current_state_str() == "menu"
    menu.on_button(102)
    frames(app, 1)
    assert app.manager.current_state_str() == "menu" and not menu.dialogs


@gamedata
def test_random_rule(app):
    k = kit(app)
    info = scenario_info(k, "RANDOM")
    scn = k.store.read("RANDOM/RANDOM.SCN")
    assert info["title"] == k.text.S(0, 0)
    assert info["cities"] == struct.unpack_from("<H", scn, 0x157B)[0]
    assert info["sites"] == struct.unpack_from("<H", scn, 0x80F)[0]
    assert info["players"] == sum(1 for w in struct.unpack_from("<8H", scn, 0x137) if w)


@gamedata
def test_begin_hands_newgameconfig_with_options_dat_words(app, game):
    setup = to_setup(app)
    with open(os.path.join(game, "DATA", "OPTIONS.DAT"), "rb") as f:
        words = list(struct.unpack("<10h", f.read(20)))
    got = []
    setup.request = lambda name, **kw: got.append((name, kw))
    setup.on_button(141)
    assert len(got) == 1 and got[0][0] == "game" and set(got[0][1]) == {"new_game", "overview", "under"}
    cfg = got[0][1]["new_game"]
    assert isinstance(cfg, NewGameConfig) and cfg.scenario == "ERYTHEA" and cfg.seed == 7
    assert cfg.options.to_words() == words
    assert cfg.controls == (0,) * 8 and len(cfg.names) == 8
    with open(os.path.join(game, "DATA", "QUOTES.DAT"), "rb") as f:
        assert cfg.setup_rolls == ((1, int(f.read(2)), 0),)          # the quotation, ovl57:0fe8
    assert cfg.greatest == setup.sides.get(0x116)
    assert (app.user.path("DATA/OPTIONS.DAT")).read_bytes() == struct.pack("<10h", *words)


@gamedata
def test_rating_is_rules_difficulty_rating(app):
    setup = to_setup(app)
    for p, n in ((0, 1), (3, 2), (5, 3)):
        for _ in range(n):                                   # human -> K -> L -> W
            setup.cycle(p)
            setup.anim = None
    lv = [setup.sides.get(0xC0, p) if setup.sides.playing_computer(p) else LEVEL_OFF for p in range(8)]
    assert lv[0] == 0 and lv[3] == 1 and lv[5] == 2
    assert setup.rating() == difficulty_rating(GameOptions.from_words(setup.words), lv)
    setup.cycle(5)
    setup.anim = None
    assert setup.sides.get(0xC0, 5) == LEVEL_OFF and setup.sides.get(0xD0, 5) == 1
    setup.cycle(5)
    setup.anim = None
    assert setup.sides.get(0xD0, 5) == 0                     # off -> human (ovl57:0a4e)


@gamedata
def test_presets_and_option_cycle(app):
    rows = presets(kit(app).exe)
    assert len(rows) == 3 and all(len(r) == 10 for r in rows)
    setup = to_setup(app)
    assert setup.words[:6] == list(rows[0][:6])
    assert setup.buttons.state[145] == PRESSED and setup.buttons.state[147] == NORMAL
    setup.on_button(147)
    assert setup.words[:6] == list(rows[2][:6]) and setup.buttons.state[147] == PRESSED
    w = [0] * 10
    cycle(w, 0), cycle(w, 0), cycle(w, 0)
    assert w[0] == 0
    cycle(w, 4)
    assert w[4] == 1
    assert option_pos(0) == (128, 131) and option_pos(9) == (320, 300)


@gamedata
def test_no_side_playing_keeps_setup(app):
    setup = to_setup(app)
    for p in range(8):
        setup.sides.set(0xC0, p, LEVEL_OFF)
    got = []
    setup.request = lambda name, **kw: got.append(name)
    setup.begin()
    assert got == []


@gamedata
def test_greatest_and_random_characters(app):
    setup = to_setup(app)
    setup.on_button(143)
    s = setup.sides
    assert s.get(0x116) == 1 and all(s.get(0xC0, p) == 2 and s.get(0xD0, p) == 1 for p in range(8))
    assert 143 in setup.hidden and setup.buttons.state[144] == NORMAL
    setup.on_button(158)
    assert all(s.get(0xE0, p) >= 1 for p in range(8))
    assert len(setup.rolls) == 1 + 8                         # quotation, then ovl57:20af per side
    got = []
    setup.request = lambda name, **kw: got.append(kw["new_game"])
    setup.on_button(141)
    assert got[0].greatest == 1 and got[0].setup_rolls == tuple(setup.rolls)
    del setup.request
    setup.on_button(144)
    assert s.get(0x116) == 0 and 144 in setup.hidden


@gamedata
def test_quotes_parse(game):
    with open(os.path.join(game, "DATA", "QUOTES.DAT"), "rb") as f:
        data = f.read()
    n = int(data[:2])
    for k in range(1, n + 1):
        lines = quote_lines(read_quote(data, k))
        assert 1 <= len(lines) <= 5


@gamedata
def test_off_side_has_no_leaders(app):
    """ovl51:0636: DS:5c88[3] is the NUL after "KLW": no file, no leaders, no description."""
    from warlords2.ui.dialogs.setup_side import card_file, description_line, leader_names
    setup = to_setup(app)
    k = kit(app)
    assert leader_names(k, 3) == [] and card_file(k.exe, 3, 0, "DSC") is None
    assert description_line(k, 3, 0, 1) == ""
    assert all(len(leader_names(k, lv)) > 1 for lv in range(3))
    for _ in range(4):                                       # human -> K -> L -> W -> off
        setup.cycle(1)
        setup.anim = None
    assert setup.sides.get(0xC0, 1) == LEVEL_OFF and setup.sides.get(0xD0, 1) == 1
    setup.on_button(134)
    d = setup.dialogs.top
    assert type(d).__name__ == "SetupSide" and d.names == [] and d.rows == [-1] * 5
    assert all(d.buttons.state[i] == DISABLED for i in (460, 461, 462, 463, *range(464, 469)))
    app.step([])                                             # draws without an error


@gamedata
def test_rename_measures_the_text_before_the_new_character(app):
    """ovl56:0495..04cf: a character is taken while the text so far is narrower than 128."""
    import pygame
    from warlords2.assets.fonts import CHANCE17
    setup = to_setup(app)
    setup.on_button(133)
    d = setup.dialogs.top
    d.press(459)
    f = kit(app).fonts[CHANCE17]
    text = ""
    while f.width(text + "W") < 128:
        text += "W"
    d.typing = text                                        # with "W" it reaches 128 or more
    assert f.width(text) < 128 <= f.width(text + "W") and len(text) < 13
    d.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_w, unicode="W")], 16)
    assert d.typing == text + "W"
    d.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_w, unicode="W")], 16)
    assert d.typing == text + "W"                          # now the text so far is too wide


@gamedata
def test_begin_with_voice_opens_the_face_and_rolls_once(game, tmp_path):
    """ovl57:0e2c: ovl58:026f(1), whose rnd(1, 30, 10) (ovl58:094c) runs once per call."""
    a = App(parse_args(["--data", game, "--headless", "--no-intro", "--seed", "7", "--user-dir", str(tmp_path / "u")]))
    try:
        frames(a, 1)
        menu = a.manager.current_state()
        while menu.dialogs:                                  # the Game Start face
            a.step([])
        setup = to_setup(a)
        got = []
        setup.request = lambda name, **kw: got.append(kw["new_game"])
        setup.on_button(141)
        assert setup.dialogs.top.dialog_id == "voice_face" and got == []
        while setup.dialogs:
            a.step([])
        assert got[0].setup_rolls[-1] == (1, 30, 10) and len(got[0].setup_rolls) == 2
    finally:
        a.close()


@pytest.fixture
def voice_app(game, tmp_path):
    """The talking advisor on (the game's OPTIONS.SND), the dummy mixer playing samples."""
    a = App(parse_args(["--data", game, "--headless", "--no-intro", "--seed", "7", "--user-dir", str(tmp_path / "u")]))
    yield a
    a.close()


@gamedata
def test_greeting_face_is_the_first_roll_of_the_run(voice_app, monkeypatch):
    from warlords2.audio import voice
    from warlords2.rules.rng import Rng
    got = []
    real = voice.speak
    monkeypatch.setattr(voice, "speak", lambda app, n, blink, file=None: got.append((n, blink)) or real(app, n, blink))
    frames(voice_app, 2)
    menu = voice_app.manager.current_state()
    assert menu.dialogs.top.dialog_id == "voice_face"
    assert got == [(2, Rng(7, NewGameConfig.rng).rnd(1, 30, 10))]                  # ovl60:0000 -> 026f(2)
    while menu.dialogs:
        voice_app.step([])
    menu.random = True                                       # Begin with the random map, ovl60:0621
    menu.on_button(103)
    assert got[-1][0] == 0 and menu.dialogs.top.dialog_id == "voice_face"


@gamedata
def test_no_face_with_the_talking_advisor_off(app):
    frames(app, 2)
    assert app.manager.current_state_str() == "menu" and not app.manager.current_state().dialogs


@gamedata
def test_face_draws_the_caption_and_ends_on_a_key(voice_app):
    import pygame
    from warlords2.audio import audio
    frames(voice_app, 2)
    menu = voice_app.manager.current_state()
    menu.dialogs.remove(menu.dialogs.top)
    audio(voice_app).mixer.available = False                 # no digital driver: captions
    try:
        registry.open_dialog("voice_face", menu, speech=1, blink=25)
        d = menu.dialogs.top
        assert d.speech.caption is not None
        fb = voice_app.screen.fb.copy()
        d.draw(fb)
        bare = voice_app.screen.fb.copy()
        d.speech.caption = None
        d.draw(bare)
        assert pygame.image.tobytes(fb, "P") != pygame.image.tobytes(bare, "P")
        while menu.dialogs:                                  # each key ends a line (ovl59:015e)
            d.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_SPACE, unicode=" ")], 16)
    finally:
        audio(voice_app).mixer.available = True


@gamedata
def test_chords(app, monkeypatch):
    """ovl57:0d36 Begin without a side, 07be:0e7b a press on a disabled / pressed button,
    07be:032c an unbound key."""
    import pygame
    from warlords2.audio import effects
    chords = []
    monkeypatch.setattr(effects, "chord", lambda a: chords.append(1))
    frames(app, 2)
    menu = app.manager.current_state()
    b = next(b for b in menu.buttons.buttons if b.id == 101)            # Load Game, disabled
    s = app.cfg.scale
    c = ((b.rect[0] + 4) * s, (b.rect[1] + 4) * s)                     # window pixels
    app.step([pygame.event.Event(pygame.MOUSEBUTTONDOWN, pos=c, button=1)])
    app.step([pygame.event.Event(pygame.MOUSEBUTTONUP, pos=c, button=1)])
    assert len(chords) == 1 and not menu.dialogs
    for key, uni in ((pygame.K_a, "A"), (pygame.K_a, "a"), (pygame.K_1, "1")):
        app.step([pygame.event.Event(pygame.KEYDOWN, key=key, unicode=uni)])
    assert len(chords) == 2                                   # only '1': 'A'..'Z' and 'a' are bound
    setup = to_setup(app)
    for p in range(8):
        setup.sides.set(0xC0, p, LEVEL_OFF)
    setup.begin()
    assert len(chords) == 3


@gamedata
def test_quit_speaks_then_exits(voice_app):
    """505 = ovl49:0000: before a game ovl49:0072 at once, the face ovl58:026f(4), then the exit."""
    frames(voice_app, 1)
    menu = voice_app.manager.current_state()
    while menu.dialogs:
        voice_app.step([])
    registry.run_action(registry.MENU_ID["quit"], menu)
    assert menu.dialogs.top.dialog_id == "voice_face" and voice_app.running
    while menu.dialogs:
        voice_app.step([])
    assert not voice_app.running


@gamedata
def test_quit_in_a_game_asks_first(app, capsys):
    """ovl49:0000 with DS:2a86 set (a game screen): the confirmation; No = ovl34:1434 (the game
    screen again, `redraw_game_screen`), Yes = ovl49:0072 -> 0a4c:02b5 (`App.exit_program`:
    the banner printf(DS:27c9, DS:27f8) from the EXE, the run ends)."""
    from warlords2.assets.exe import ds_str
    from warlords2.states.base import BaseState
    host = BaseState(app)
    from types import SimpleNamespace
    from warlords2.rules.rng import Rng
    host.state, host.phase_name = SimpleNamespace(rng=Rng(1, "python")), "human"   # a game screen is up
    redraws = []
    host.redraw_game_screen = lambda: redraws.append(1)
    registry.run_action(registry.MENU_ID["quit"], host)
    d = host.dialogs.top
    assert d.dialog_id == "confirm" and len(d.lines) == 4
    d.close(False)
    assert app.running and not host.dialogs and redraws == [1]
    registry.run_action(registry.MENU_ID["quit"], host)
    capsys.readouterr()
    host.dialogs.top.close(True)                             # yes: ovl49:0072, no face (voice off)
    assert not app.running
    exe = app.gd.read("WARLORD2.EXE")
    assert capsys.readouterr().out == ds_str(exe, 0x27C9).replace("%s", ds_str(exe, 0x27F8))
    app.running = True


def _settle(app, name):
    """Step until state `name` is current, no dialog (a face, the scrolls) is open and the
    screen is ready."""
    for _ in range(400):
        st = app.manager.current_state()
        if app.manager.current_state_str() == name and not st.dialogs and getattr(st, "ready", True):
            return st
        app.step([])
    raise AssertionError("dialogs still open")


def _expected(seed, source, rolls):
    from warlords2.rules.rng import Rng
    r = Rng(seed, source)
    for roll in rolls:
        r.rnd(*roll)
    return r


@gamedata
@pytest.mark.parametrize("source", ["python", "borland"])
def test_game_start_face_rolls_first_in_the_one_stream(game, tmp_path, monkeypatch, source):
    """ovl60:0109 -> ovl58:026f(2) -> rnd(1, 30, 10) (094c) comes before the loader's 256
    rnd(1,3,1) (ovl63:2479); the setup screen's Main Menu (ovl57:0ee0 -> ovl60:0000(1)) rolls
    a face again and the next visit continues the stream (DS:2678: seeded once); Begin hands
    the stream to new_game (NewGameConfig.rng_state)."""
    from warlords2.rules.constants.setup import LOADER_TILE_ROLLS
    from warlords2.rules.setup import new_game
    from warlords2.formats.scenario import load_scenario
    from warlords2.formats.tables import parse_armytypes
    monkeypatch.setattr(NewGameConfig, "rng", source)
    a = App(parse_args(["--data", game, "--headless", "--no-intro", "--seed", "7", "--user-dir", str(tmp_path / "u")]))
    try:
        face, (count, load) = (1, 30, 10), LOADER_TILE_ROLLS.value
        frames(a, 2)
        menu = _settle(a, "menu")
        menu.on_button(103)
        setup = _settle(a, "setup")
        first = list(setup.rolls)                            # the quotation
        assert setup.rng_state == _expected(7, source, [face]).state()
        setup.on_button(142)                                 # Main Menu: ovl60:0000(1), a face
        frames(a, 2)
        _settle(a, "menu").on_button(103)
        setup = _settle(a, "setup")
        before = [face] + [load] * count + first + [face]
        assert setup.rng_state == _expected(7, source, before).state()
        got = []
        setup.request = lambda name, **kw: got.append(kw["new_game"])
        setup.on_button(141)
        for _ in range(400):                                 # Begin's face, then the request
            if got:
                break
            a.step([])
        cfg = got[0]
        assert cfg.rng == source and cfg.rng_state == setup.rng_state and cfg.setup_rolls[-1] == face
        types = list(parse_armytypes(a.gd.read("TERRAIN0/ARMYTYPE.DAT")))
        st = new_game(load_scenario(a.gd, cfg.scenario), cfg, types)
        r = _expected(7, source, before)
        assert st.overview_mountain_rolls == [r.rnd(*load) for _ in range(count)]
        fresh = new_game(load_scenario(a.gd, cfg.scenario), dataclasses.replace(cfg, rng_state=None), types)
        assert fresh.overview_mountain_rolls != st.overview_mountain_rolls
    finally:
        a.close()


@gamedata
def test_no_face_no_roll_before_the_loader(app):
    """With the talking advisor off (ovl58:0293) the loader's rolls start the stream."""
    from warlords2.rules.rng import Rng
    setup = to_setup(app)
    assert setup.rng_state == Rng(7, NewGameConfig.rng).state()
