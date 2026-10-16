"""M8a: the turn loop in the game state (turn-start phase, End Turn, Settings, tutorial pop-ups)."""
import logging
import re
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.model.ids import Control  # noqa: E402
from warlords2.ui import registry  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))


def _app(game, tmp_path, *extra):
    return App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                           "--user-dir", str(tmp_path / "u"), *extra]))


ANSWER = {"hero_offer": 287, "production": 192}   # accept (ovl47:120c), Done (ovl45)


def _until(a, cond, n=150, dismiss=False):
    """Step until cond(state); with `dismiss` a release closes each pop-up, the hero offer is
    accepted and the turn-1 production screen closed by their buttons."""
    seen = []
    for _ in range(n):
        g = a.manager.current_state()
        if cond(g):
            return g, seen
        dialogs = getattr(g, "dialogs", None)
        top = dialogs.top if dialogs else None
        if top is not None:
            seen.append(getattr(top, "dialog_id", type(top).__name__))
        if dismiss and top is not None and getattr(top, "dialog_id", "") in ANSWER:
            top.press(ANSWER[top.dialog_id])
            a.step([])
            continue
        a.step([UP] if dismiss and top is not None else [])
    raise AssertionError("condition not reached; dialogs seen %r" % seen)


def _human(g):
    return getattr(g, "phase_name", None) == "human" and not g.dialogs


@pytest.fixture
def hotseat(game, tmp_path):
    a = _app(game, tmp_path, "--controls", "HCCCCCCH")
    yield a
    a.close()


@gamedata
def test_turn_start_popup_then_human_phase(hotseat):
    a = hotseat
    g, _ = _until(a, lambda g: getattr(g, "dialogs", None) and g.dialogs.top is not None
                  and getattr(g.dialogs.top, "dialog_id", "") == "turn_start")
    st = g.state
    assert g.phase_name == "turn_start" and st.current == 0 and st.turn == 1
    assert g.dialogs.top.turn.endswith("1") and g.dialogs.top.name == st.players[0].name
    assert (g.view.cx, g.view.cy) == (st.flags[0x17D], st.flags[0x17F]) == st.players[0].capital
    g, seen = _until(a, _human, dismiss=True)
    assert st.pending is None and any(x.type_id == 28 and x.owner == 0 for x in st.armies)   # turn-1 hero
    assert seen.count("turn_start") >= 1 and max(x.moves_left for x in st.armies if x.owner == 0) > 0


@gamedata
def test_scroll_writes_the_scn_view_words(hotseat):
    g, _ = _until(hotseat, _human, dismiss=True)
    st = g.state
    g.phase.scroll(2)                                               # one square east (ovl64:0723)
    x, y = st.players[0].capital
    assert (st.flags[0x17D], st.flags[0x17F]) == (g.view.cx, g.view.cy) == (x + 1, y)
    assert st.flags[0x177] == x + 1 - 4 and st.flags[0x17B] == st.flags[0x177] + 8
    g.scroll_to(0, 0)                                               # overview click: as given
    assert (st.flags[0x17D], st.flags[0x17F], st.flags[0x175], st.flags[0x177]) == (0, 0, 0, 0)


@gamedata
def test_end_turn_hot_seat_round(hotseat):
    """End Turn (menu 535): side 7's turn 1, then side 0's turn 2 with the turn-2 tutorial page
    (25, 7) after the pop-up (ovl68:05bf..05ef)."""
    a = hotseat
    g, _ = _until(a, _human, dismiss=True)
    registry.run_action(registry.MENU_ID["end_turn"], g)
    a.step([])
    g, seen = _until(a, _human, dismiss=True)
    assert g.state.current == 7 and g.state.turn == 1 and "turn_start" in seen
    registry.run_action(registry.MENU_ID["end_turn"], g)
    a.step([])
    g, seen = _until(a, _human, dismiss=True)
    assert g.state.current == 0 and g.state.turn == 2
    assert seen.index("turn_start") < seen.index("tutorial_page")
    assert g.state.flags[0x134] & 0x40


@gamedata
def test_end_turn_ignored_while_presenting(hotseat):
    g, _ = _until(hotseat, lambda g: getattr(g, "phase_name", None) == "turn_start")
    h = g.state.hash()
    registry.run_action(registry.MENU_ID["end_turn"], g)
    assert g.state.hash() == h


def _phase_missing(monkeypatch, name="production"):
    """ai.base.PHASES with phase `name` pointing at a function that does not exist (a computer
    phase not written yet)."""
    from warlords2.ai import base as AB
    monkeypatch.setattr(AB, "PHASES", tuple((n, ms, "test_m8a_ui:not_written" if n == name else t, a)
                                            for n, ms, t, a in AB.PHASES))


@gamedata
def test_strict_mode_with_a_computer_side_logs_and_stays(game, tmp_path, caplog, monkeypatch):
    """Default controls: the Darklords are a computer side, whose turn needs every AI phase: with
    one not written the loop is refused (logged), nothing changed, the map is shown without a
    turn start."""
    _phase_missing(monkeypatch)
    a = _app(game, tmp_path)
    with caplog.at_level(logging.ERROR):
        g, _ = _until(a, _human)
    assert g.state.turn == 1 and g.state.pending is None
    assert any("turn loop refused" in r.message and re.search(r"M8b[1-4]", r.message) for r in caplog.records)
    a.close()


@gamedata
def test_select_shows_the_first_tutorial_page(hotseat):
    g, _ = _until(hotseat, _human, dismiss=True)
    st = g.state
    h = next(x for x in st.armies if x.owner == 0 and x.type_id == 28)
    g.phase.select((h.x, h.y))
    assert g.dialogs.top.dialog_id == "tutorial_page" and st.flags[0x134] & 0x08
    hotseat.step([UP])                                              # its release closes it
    hotseat.step([])                                                # the animator's page view ends
    hotseat.step([])
    assert not g.dialogs and g.phase.stack_drag is None             # 0726:0030: the poll ends the drag


@gamedata
def test_menu_keys_wait_for_a_released_drag(hotseat):
    """07be:007d..00a2: no menu key while DS:1172 / 1176 is set."""
    g, _ = _until(hotseat, _human, dismiss=True)
    g.state.flags[0x134] |= 0x98
    g.phase.stack_drag = 0
    alt = pygame.event.Event(pygame.KEYDOWN, key=pygame.K_LALT, mod=0, unicode="", scancode=0)
    x = pygame.event.Event(pygame.KEYDOWN, key=pygame.K_x, mod=0, unicode="x", scancode=0)
    g.app.input.keys.add(pygame.K_LALT)
    g.step([alt, x], 16)
    assert not g.dialogs
    g.phase.stack_drag = None
    g.step([alt, x], 16)                                            # Alt+X: Settings (DS:1798)
    assert g.dialogs.top.dialog_id == "settings"


@gamedata
def test_settings_dialog_toggles(hotseat):
    g, _ = _until(hotseat, _human, dismiss=True)
    st = g.state
    registry.run_action(registry.MENU_ID["settings"], g)
    d = g.dialogs.top
    assert d.dialog_id == "settings"
    ids = {b.id for b in d.row.buttons}
    assert {252, 260, 268, 259, 267, 275} <= ids and not ids & {253, 261, 269}     # dead side 1
    assert d.row.state[276] == 1                       # a music driver (SOUND.DAT; --music off: 2, test_m10c)
    d.press(259)
    assert st.players[7].control == Control.COMPUTER
    d.press(259)
    shown = st.players[0].shown
    d.press(260)
    d.press(268)
    assert st.players[7].control == Control.HUMAN and st.players[0].enhanced == 1 and st.players[0].shown == 1 - shown
    talking = st.advisor_talking
    d.press(278)                                                                    # ovl33:05b7
    assert st.advisor_talking == 1 - talking
    fb = g.app.screen.fb
    g.dialogs.draw(fb)
    d.press(251)
    assert not g.dialogs


@gamedata
def test_hidden_map_hot_seat_blanks_until_the_popup_closes(game, tmp_path):
    """Begin (ovl61:0000 si = 1): no map, no overview with Hidden Map, no 0a6e -> the backdrop
    shows; End Turn: ovl61:0a6e black.  The info bar is the marble cell ovl61:0aeb (picture 25
    at (0, 0x3c)) until ovl66:0356 runs (ovl68:03a4 is skipped for di = 0)."""
    import numpy as np
    from warlords2.model.options import GameOptions
    from warlords2.ui.mapview import AREA
    words = ",".join(str(w) for w in GameOptions(hidden_map=1).to_words())
    a = _app(game, tmp_path, "--controls", "HCCCCCCH", "--options", words)
    is_popup = (lambda g: getattr(g, "dialogs", None) and g.dialogs.top is not None
                and getattr(g.dialogs.top, "dialog_id", "") == "turn_start")
    g, _ = _until(a, is_popup)
    assert g.blank_map == "backdrop" and g.bar_blank
    fb = g.app.screen.fb
    g.paint(fb)
    px = pygame.surfarray.array2d(fb)
    back = pygame.surfarray.array2d(g.app.assets.picture("screen.pck"))
    x, y, w, h = AREA
    assert (px[x:x + w, y:y + h] == back[x:x + w, y:y + h]).all()
    marble = pygame.surfarray.array2d(g.phase.painter.marble)
    assert (px[16:376, 403:469] == marble[0:360, 60:126]).all()
    g, _ = _until(a, _human, dismiss=True)
    assert not g.blank_map and not g.bar_blank             # the hero accept redrew the bar (ovl61:0168)
    registry.run_action(registry.MENU_ID["end_turn"], g)
    assert g.blank_map == "black" and g.bar_blank
    g.paint(fb)
    px = pygame.surfarray.array2d(fb)
    assert not px[x:x + w, y:y + h].any() and (px[16:376, 403:469] == marble[0:360, 60:126]).all()
    a.close()

def _paint(g):
    g.paint(g.app.screen.fb)
    from warlords2.ui.widgets import kit
    return kit(g.app).cursors.current


@gamedata
def test_pointer_is_the_arrow_under_settings_and_menus(hotseat):
    """08a9:0896 returns 0 with DS:3700 (08ab) or DS:166a (08cc); the human phase alone shows
    the map's shape."""
    from warlords2.assets import cursors as CU
    g, _ = _until(hotseat, _human, dismiss=True)
    st = g.state
    k = g.app.cfg.scale
    hotseat.step([pygame.event.Event(pygame.MOUSEMOTION, pos=(196 * k, 210 * k), rel=(0, 0),
                                     buttons=(0, 0, 0))])                # over the map
    assert _paint(g) != CU.ARROW
    registry.run_action(registry.MENU_ID["settings"], g)
    assert _paint(g) == CU.ARROW
    g.dialogs.top.press(251)
    assert _paint(g) != CU.ARROW
    g.bar.bar.press(g, (20, 5))                                     # the Game menu opens
    assert g.dialogs and _paint(g) == CU.ARROW
    assert st.pending is None


@gamedata
def test_press_and_release_in_one_frame_close_the_select_page(hotseat):
    """ovl61:168d -> 10fb -> ovl59:0142 waits on the event queue without a flush: a release
    queued with the press closes the page it opened."""
    g, _ = _until(hotseat, _human, dismiss=True)
    st = g.state
    h = next(x for x in st.armies if x.owner == 0 and x.type_id == 28)
    from warlords2.ui.mapview import AREA
    pos = (AREA[0] + (h.x - g.view.origin[0]) * 40 + 20, AREA[1] + (h.y - g.view.origin[1]) * 40 + 20)
    assert g.view.square_at(pos) == (h.x, h.y)
    k = g.app.cfg.scale                                             # window pixels
    win = (pos[0] * k, pos[1] * k)
    down = pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=win)
    up = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=win)
    hotseat.step([pygame.event.Event(pygame.MOUSEMOTION, pos=win, rel=(0, 0), buttons=(0, 0, 0))])
    hotseat.step([down, up])
    assert st.flags[0x134] & 0x08 and st.selection.selected == h.id
    assert not g.dialogs


@gamedata
def test_hero_offer_page_over_the_dialog(hotseat):
    """ovl47:0d5c draws the offer, then the page (25, 0) over it (11d5..1207); bit 0 of 0x134."""
    a = hotseat
    for _ in range(150):
        g = a.manager.current_state()
        top = g.dialogs.top if getattr(g, "dialogs", None) else None
        if getattr(top, "dialog_id", "") == "tutorial_page" and g.state.pending is not None:
            break
        a.step([UP] if getattr(top, "dialog_id", "") == "turn_start" else [])
    assert [d.dialog_id for d in g.dialogs] == ["hero_offer", "tutorial_page"]
    assert g.dialogs.top.dialog_id == "tutorial_page" and g.state.flags[0x134] & 0x01


@gamedata
def test_answer_runs_no_main_loop_pass(hotseat, monkeypatch):
    """ovl47:127e -> ovl61:011f(1, 0, 1), ovl68:04bd(1): no pass top after the answer."""
    from warlords2.model import commands as C
    a = hotseat
    g, _ = _until(a, lambda g: getattr(g, "state", None) is not None and g.state.pending is not None,
                  dismiss=True)
    from warlords2.rules import mapwords, pathfinding, turn
    calls = []
    for mod, name in ((turn, "pass_top"), (turn, "refresh_map"), (pathfinding, "rebuild_cost_map"),
                      (mapwords, "refresh_map")):
        monkeypatch.setattr(mod, name, lambda *a, _n=name: calls.append(_n))
    assert g.answer(C.AcceptHero(True)) is not None and calls == []


@gamedata
def test_settings_speech_is_a_command_and_music_box_unticked(hotseat, monkeypatch):
    """SetSpeech (ovl33:0576(2)); the music box shows DS:0bee (the run's music words, off in a
    headless run with a fresh user dir), not the settings' digit."""
    from warlords2.model import commands as C
    g, _ = _until(hotseat, _human, dismiss=True)
    seen = []
    real = g.command
    monkeypatch.setattr(g, "command", lambda cmd: (seen.append(cmd), real(cmd))[1])
    registry.run_action(registry.MENU_ID["settings"], g)
    d = g.dialogs.top
    talking = g.state.advisor_talking
    d.press(278)
    assert isinstance(seen[-1], C.SetSpeech) and g.state.advisor_talking == 1 - talking
    from warlords2.audio import audio
    audio(g.app).settings.music = True
    ticks = []
    monkeypatch.setattr(d, "tick", lambda fb, at, on: ticks.append((tuple(at), on)))
    d.draw(g.app.screen.fb)
    assert (tuple(d.sound_at[0]), False) in ticks


@gamedata
def test_turn_sound_only_for_a_human_turn_started(hotseat, monkeypatch):
    """ovl58:0b93 has one caller, ovl68:0415 (human turn start): the event decides."""
    from warlords2.audio import effects
    from warlords2.model import events as E
    g, _ = _until(hotseat, _human, dismiss=True)
    played = []
    monkeypatch.setattr(effects, "turn", lambda app: played.append(1) or 0)
    effects._turn(g, E.TurnStarted({"player": 3, "turn": 1, "human": False}))
    assert played == []
    effects._turn(g, E.TurnStarted({"player": 0, "turn": 1, "human": True}))
    assert played == [1]


@gamedata
def test_no_human_game_waits_for_the_message(game, tmp_path, caplog, monkeypatch):
    """ovl61:0000: STRING (14, 0) / (14, 1) through ovl61:1160 (a blocking wait) before the loop
    ovl61:2123: nothing runs until it is closed; then the loop (refused here: an AI phase is
    stubbed as not written)."""
    _phase_missing(monkeypatch)
    a = _app(game, tmp_path, "--controls", "CCCCCCCC")
    g, _ = _until(a, lambda g: getattr(g, "dialogs", None) and g.dialogs.top is not None
                  and getattr(g.dialogs.top, "dialog_id", "") == "message")
    h = g.state.hash()
    for _ in range(5):
        a.step([])
    assert g.state.hash() == h and g.dialogs.top.dialog_id == "message" and g.phase_name == "building"
    with caplog.at_level(logging.ERROR):
        a.step([UP])
        g, _ = _until(a, lambda g: getattr(g, "phase_name", None) == "human")
    assert any("turn loop refused" in r.message for r in caplog.records) and g.state.hash() == h
    a.close()
