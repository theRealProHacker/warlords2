"""Register X44: the occupant of cache group 8 (`assets.store.CacheGroup8`) and what slots
11 / 12 (DS:51a9 / 51e4, the records 15 of its 49 pictures share) draw for a planted item 11
or 12 (`assets.sprites.Sprites.draw_standard`)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import numpy as np  # noqa: E402
import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.assets import sprites as S  # noqa: E402
from warlords2.assets.store import AssetStore, CacheGroup8, cache_load, cache_unload  # noqa: E402
from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.rules.constants import UnverifiedError, allowing_unverified  # noqa: E402

gamedata = pytest.mark.gamedata
SCROLL, STACK, VOICE, VOICEBIT, RMAPBAR, HELPGFX, BSCROLL, MOVEBAR0 = 45, 46, 50, 51, 54, 62, 70, 71
MENUBUTT, CITYBACK, ATRANS2 = 43, 55, 9
SHARED = (SCROLL, STACK, VOICE, RMAPBAR, HELPGFX, 69, BSCROLL, *range(MOVEBAR0, MOVEBAR0 + 8))


@pytest.fixture(scope="module")
def kit(game):
    pygame.display.init()
    store = AssetStore(GameDir(game))
    return store, S.Sprites(store)


@pytest.fixture
def sp(kit):
    store, sp = kit
    sp.group8 = CacheGroup8(store.pictures)
    return sp


def _dst():
    from warlords2.ui.screen import IDENTITY
    d = pygame.Surface((40, 40), depth=8)
    d.set_palette(IDENTITY)
    return d


def _occupy(sp, *pictures):
    for k in pictures:
        sp.group8.load(k)
    sp.group8.map_drawn()


def _cell(px, w, h):
    """The flag cell of a picture of byte stride w / 8 (all five are a multiple of 16 wide):
    byte offset y * S + 52 is the contiguous rectangle ((52 % S) * 8, 29 + 52 // S, 32, 29)."""
    s = w // 8
    x, y = 52 % s * 8, 29 + 52 // s
    return px[x:x + 32, y:y + 29]


# ----------------------------------------------------------------------------- the word


@gamedata
def test_occupant_is_the_last_group8_load_and_0066_drops_the_other_directories(kit):
    """0997:0129 etc.: a group-8 load replaces the occupant, other groups leave it; 0066
    unloads directory != 0 (movebars, SCENARIO.PCK, TOWER.PCK, CITYBACK.PCK), keeps directory 0."""
    store, _ = kit
    g = CacheGroup8(store.pictures)
    assert g.now is None and g.shown == {None}
    g.load(ATRANS2)                                        # group 9: no change
    assert g.now is None and g.shown == {None}
    g.load(STACK)
    g.load(MENUBUTT)
    assert g.now == MENUBUTT and g.shown == {None, STACK, MENUBUTT}
    g.map_drawn()
    assert g.shown == {MENUBUTT}
    for k, kept in ((MOVEBAR0 + 3, None), (2, None), (CITYBACK, None), (STACK, STACK), (BSCROLL, BSCROLL)):
        g.load(k)
        g.unload()
        assert g.now == kept, k
    g.map_drawn()
    assert g.shown == {BSCROLL}
    assert [e.index for e in store.pictures if e.group == 8 and e.directory] == [2, 37, 55, *range(71, 79)]


# ----------------------------------------------------------------------------- the pixels


@gamedata
def test_read_stays_inside_five_pictures_and_leaves_movebar_and_rmapbar(kit):
    store, sp = kit
    for k, at in ((SCROLL, (160, 30)), (STACK, (16, 30)), (VOICE, (64, 30)), (HELPGFX, (416, 29)),
                  (BSCROLL, (80, 30))):
        pic = store.picture(k)
        w, h = pic.get_size()
        px = pygame.surfarray.array2d(pic)
        got = S.group8_read(px, w, h)
        assert got.shape == (32, 29)
        assert (got == px[at[0]:at[0] + 32, at[1]:at[1] + 29]).all() and (got == _cell(px, w, h)).all(), k
        assert sp.group8_source(k) == k
    for k in (RMAPBAR, *range(MOVEBAR0, MOVEBAR0 + 8)):
        pic = store.picture(k)
        assert S.group8_read(pygame.surfarray.array2d(pic), *pic.get_size()) is None
        assert sp.group8_source(k) == S.HEAP
    assert all(sp.group8_source(e.index) is None for e in store.pictures
               if e.group == 8 and e.index not in SHARED)
    assert sp.group8_source(None) is None


@gamedata
def test_stack_occupant_draws_its_cell_through_the_army_mask(kit, sp):
    """Slot 12 (bitmap record, 4 planes): dst = (dst & M) | (src & ~M), M the a8 key mask;
    slot 11 (mask record, 1 plane): only colour bit 0, 1 on the key colour (VOICE.PCK's 10)."""
    store, _ = kit
    _occupy(sp, MOVEBAR0, STACK)
    pic = store.picture(STACK)
    want = _cell(pygame.surfarray.array2d(pic), *pic.get_size())
    m = sp.standard_mask                                   # True: keep the OS bitmap
    for i in (12, 28):
        dst = _dst()
        dst.fill(6)
        sp.draw_standard(dst, i, (3, 4))
        px = pygame.surfarray.array2d(dst)
        cell = px[3:35, 4:33]
        assert (cell[m] == 6).all() and (cell[~m] == want[~m]).all()
        assert (px[:3] == 6).all() and (px[:, :4] == 6).all() and (px[35:] == 6).all()
    assert not (sp.standard_bit0(11)).any()               # no key colour (5) in STACK's cell
    _occupy(sp, VOICE)                                     # VOICE's cell has key colour 10 and others
    pic = store.picture(VOICE)
    key = _cell(pygame.surfarray.array2d(pic), *pic.get_size()) == store.pictures[VOICE].key
    assert key.any() and (~key).any()
    assert (sp.standard_bit0(11) == key).all() and sp.is_mask_standard(11) and not sp.is_mask_standard(12)
    for fill in (0x0A, 0x0B):
        dst = _dst()
        dst.fill(fill)
        sp.draw_standard(dst, 27, (0, 0))
        cell = pygame.surfarray.array2d(dst)[:32, :29]
        assert (cell[m] == fill).all()
        assert (cell[~m] == np.where(key, 0x0B, 0x0A)[~m]).all()
    with pytest.raises(ValueError, match="mask record"):
        sp.standard(11)


@gamedata
def test_nothing_drawn_without_one_of_the_15(kit, sp):
    """No group-8 picture loaded, or one with records of its own, or the 15 unloaded by a later
    group-8 load: +0x34 = 0 planes, nothing drawn, exact (no unverified value read)."""
    for loads in ((), (MENUBUTT,), (STACK, MENUBUTT), (BSCROLL, 31), (VOICE, VOICEBIT), (MOVEBAR0, 47)):
        sp.group8 = CacheGroup8(sp.store.pictures)
        _occupy(sp, *loads)
        for i in (11, 12, 27, 28):
            dst = _dst()
            dst.fill(9)
            sp.draw_standard(dst, i, (0, 0))
            assert (pygame.surfarray.array2d(dst) == 9).all(), loads
        assert sp.group8_occupant() is None


@gamedata
def test_heap_and_unplaced_map_draws_stay_unverified(kit, sp):
    """Movebar / rmapbar: heap memory.  Occupants that differ since the last placed map draw:
    which one the screen's map holds is unknown.  Provisionally nothing is drawn."""
    for case in ((MOVEBAR0 + 5,), (RMAPBAR,), "mixed", "two"):
        sp.group8 = CacheGroup8(sp.store.pictures)
        if case == "mixed":
            sp.group8.load(STACK)                          # shown {None, 46}: nothing or the cell
        elif case == "two":
            _occupy(sp, SCROLL)
            sp.group8.load(BSCROLL)                        # shown {45, 70}: two cells
        else:
            _occupy(sp, *case)
        with pytest.raises(UnverifiedError, match="X44"):
            sp.draw_standard(_dst(), 12, (0, 0))
        with pytest.raises(UnverifiedError, match="X44"):
            sp.draw_standard(_dst(), 11, (0, 0))
        with allowing_unverified():
            dst = _dst()
            dst.fill(6)
            sp.draw_standard(dst, 12, (0, 0))
            sp.draw_standard(dst, 11, (0, 0))
            assert (pygame.surfarray.array2d(dst) == 6).all()
    sp.group8 = CacheGroup8(sp.store.pictures)
    _occupy(sp, STACK, MENUBUTT, STACK)                    # the same output from all: exact
    sp.group8.load(STACK)
    assert sp.group8_occupant() == STACK


# ----------------------------------------------------------------------------- the hooks


def _app(game, tmp_path, controls="HCCCCCCC"):
    from warlords2.app import App
    from warlords2.config import parse_args
    return App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "ERYTHEA",
                           "--controls", controls, "--user-dir", str(tmp_path / "u")]))


def _until(a, cond, n=4000):
    up = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))
    for _ in range(n):
        g = a.manager.current_state()
        if cond(g):
            return g
        top = g.dialogs.top if getattr(g, "dialogs", None) else None
        name = getattr(top, "dialog_id", type(top).__name__) if top is not None else None
        if name in ("hero_offer", "production"):
            top.press({"hero_offer": 287, "production": 192}[name])
            a.step([])
            continue
        a.step([up] if name in ("message", "turn_start", "tutorial_page") else [])
    raise AssertionError("condition not reached")


@gamedata
def test_hooks_at_the_mapped_sites(game, tmp_path):
    """Start-up ovl14:02fb (43); Begin's new-game scroll ovl61:137e (70); the turn-start popup
    type 6 (CITY.PCK 28); the stack dialog ovl66:0e85 (46); the items dialog's STACK.PCK buttons;
    the progress scroll (70, then 54 and 70 per new percentage); 0997:0066; the turn bar
    ovl61:131b (71 + side); the talking face (50, then 51 at a blink); the computer turn's map
    draw places the occupant (`shown`)."""
    from types import SimpleNamespace

    from warlords2.ui import registry
    from warlords2.ui.dialogs.voice_face import VoiceFace
    from warlords2.ui.turn_bar import TurnBar
    from warlords2.ui.widgets import kit as kit_of
    a = _app(game, tmp_path)
    try:
        g8 = a.group8
        assert g8.now == MENUBUTT and g8.shown == {None, MENUBUTT}  # start-up 08a9:0219
        g = _until(a, lambda g: getattr(g, "phase_name", None) == "human" and not g.dialogs)
        assert {BSCROLL, 28} <= g8.shown                            # Begin, popup 6 at the turn start
        registry.open_dialog("stack", g).close(None)
        assert g8.now == STACK
        cache_load(a, MENUBUTT)
        items = registry.open_dialog("items", g)
        assert g8.now == STACK                                      # buttons 495 / 496
        cache_load(a, MENUBUTT)
        items.press(495 + 1)                                        # 496: the HITEM page, then 0f0c
        g.dialogs.top.close(None)
        assert g8.now == STACK
        items.close(None)
        a.step([])
        assert not g.dialogs

        def work():
            yield 0
            yield None
        registry.open_dialog("progress", g, group=133, work=work())
        assert g8.now == BSCROLL
        cache_load(a, MENUBUTT)
        a.step([])
        assert g8.now == BSCROLL and RMAPBAR in g8.shown           # 01ff then 070b
        while g.dialogs:
            a.step([])
        TurnBar(g).progress(g.state, 5)
        assert g8.now == MOVEBAR0 + g.state.current
        cache_unload(a)
        assert g8.now is None
        speech = SimpleNamespace(eye=None, caption=None, step=lambda pressed: True)
        d = VoiceFace(kit_of(a), speech)
        assert g8.now == VOICE
        d.update([], 0)
        assert g8.now == VOICE
        speech.eye = 1
        d.update([], 0)
        assert g8.now == VOICEBIT
        cache_load(a, STACK)
        cache_unload(a)
        assert g8.now == STACK
        g8.map_drawn()
        assert g8.shown == {STACK} and g.sprites.group8 is g8
        assert g.sprites.group8_occupant() == STACK
        g.end_turn()
        c = _until(a, lambda g: getattr(g, "phase_name", None) == "computer")
        c.phase.render_map(c.state)                                 # ovl64:1a79: shown = {now}
        assert g8.shown == {g8.now}
    finally:
        a.close()


@gamedata
def test_hooks_of_the_pre_game_screens_begin_and_load(game, tmp_path, monkeypatch):
    """Game Start ovl60:011e (STARTBU buttons, 1); Begin -> ovl57:0000(1, 1, 1, 0): 0997:0066 at
    0014 (a movebar unloaded), the load scroll (70, 54), the Setup screen ovl57:0416 (SETUPBU,
    31); the game's Begin ovl53:013a -> ovl61:137e (BSCROLL); a load ovl49:0414's 0066 at 0449
    before its scroll."""
    from warlords2.app import App
    from warlords2.config import parse_args
    from warlords2.states.game import Game
    from warlords2.ui.dialogs import save_load
    begun = []
    orig = Game.start_engine

    def spy(self, sc=None):
        cache_load(self.app, MENUBUTT)
        orig(self, sc)
        begun.append(self.app.group8.now)
    monkeypatch.setattr(Game, "start_engine", spy)
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3",
                        "--user-dir", str(tmp_path / "u")]))
    try:
        g8 = a.group8
        for _ in range(3):
            a.step([])
        assert a.manager.current_state_str() == "menu" and g8.now == 1
        cache_load(a, MOVEBAR0)
        g8.map_drawn()
        a.manager.current_state().on_button(103)               # Begin -> ovl60:060f
        for _ in range(400):
            a.step([])
            s = a.manager.current_state()
            if a.manager.current_state_str() == "setup" and s.ready:
                break
        assert g8.now == 31 and {None, BSCROLL, RMAPBAR} <= g8.shown and g8.now in g8.shown
        s.on_button(141)                                       # Begin -> ovl57:0cfe
        for _ in range(400):
            a.step([])
            if begun:
                break
        assert begun == [BSCROLL]
        g = a.manager.current_state()
        cache_load(a, MOVEBAR0)
        g8.map_drawn()
        save_load.open_load(g, 99, "game", done=lambda r: None, refused=lambda: None)
        assert None in g8.shown and g8.now == BSCROLL           # 0066, then the scroll's popup 0x17
    finally:
        a.close()
