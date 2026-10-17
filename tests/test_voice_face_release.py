"""The talking advisor's caption wait ends on a release or a key, never on a press: ovl58:0ea6
-> ovl59:015e -> 11b5:0003 with mask 0xd4 (`widgets.is_dismiss`).  A click held over the face
must therefore neither end it on its press (the main map's held poll 0726:0009 would act on
the square under the pointer) nor leave a release for the next pop-up (the first TurnStart
after Setup Begin)."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.audio import audio  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.states.phases.human import TILE  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs.voice_face import VoiceFace  # noqa: E402
from warlords2.ui.mapview import AREA  # noqa: E402
from warlords2.ui.palettes import leader  # noqa: E402
from warlords2.ui.widgets import kit  # noqa: E402


def press(a, pos):
    w = a.input.window(pos)
    a.step([pygame.event.Event(pygame.MOUSEMOTION, pos=w, rel=(0, 0), buttons=(0, 0, 0)),
            pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=w)])


def hold(a, pos):
    a.step([pygame.event.Event(pygame.MOUSEMOTION, pos=a.input.window(pos), rel=(0, 0), buttons=(1, 0, 0))])


def release(a, pos):
    a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=a.input.window(pos))])


def click(a, pos, held=1):
    press(a, pos)
    for _ in range(held - 1):
        hold(a, pos)
    release(a, pos)


def top(host):
    return host.dialogs.top if host.dialogs else None


@pytest.fixture
def turn(game, tmp_path):
    """TUTORIA, the talking advisor on, side 0's hero stack (Origin, (57, 64)) selected."""
    a = App(parse_args(["--data", game, "--headless", "--seed", "3", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--options", "0,0,0,0,0,0,0,1,0,0",
                        "--user-dir", str(tmp_path / "u")]))
    answer = {"hero_offer": 287, "production": 192}
    for _ in range(400):
        g = a.manager.current_state()
        d = top(g) if getattr(g, "dialogs", None) is not None else None
        if d is not None and getattr(d, "dialog_id", "") in answer:
            d.press(answer[d.dialog_id])
            a.step([])
        elif d is not None:
            a.step([pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))])
        else:
            a.step([])
        g = a.manager.current_state()
        if getattr(g, "phase_name", None) == "human" and not g.dialogs:
            break
    assert g.phase_name == "human" and not g.dialogs
    g.state.flags[0x134] |= 0x02 | 0x04 | 0x08 | 0x10 | 0x20 | 0x80   # the tutorial pages count as shown
    a.step([])
    left, top_ = g.view.origin
    click(a, (AREA[0] + (57 - left) * TILE + 20, AREA[1] + (64 - top_) * TILE + 20))
    for _ in range(40):
        a.step([])
    assert (leader(g.state).x, leader(g.state).y) == (57, 64)
    audio(a).mixer.available = False                       # no digital driver: captions
    yield a, g
    a.close()


@pytest.mark.parametrize("held", [2, 6])
def test_held_click_ending_the_caption_does_not_reach_the_map(turn, held):
    a, g = turn
    d = registry.open_dialog("voice_face", g, speech=1, blink=25)
    assert isinstance(d, VoiceFace) and d.speech.caption is not None
    left, top_ = g.view.origin
    boot = (AREA[0] + (56 - left) * TILE + 20, AREA[1] + (63 - top_) * TILE + 20)   # a move square
    while d.stack is not None:
        line = d.speech.caption
        press(a, boot)
        for _ in range(held - 1):
            hold(a, boot)
            assert top(g) is d and d.speech.caption == line          # a press ends nothing
        release(a, boot)
    for _ in range(40):
        a.step([])
    assert (leader(g.state).x, leader(g.state).y) == (57, 64) and top(g) is None


def test_begin_face_leaves_the_turn_popup_up(game, tmp_path):
    a = App(parse_args(["--data", game, "--headless", "--seed", "5", "--no-intro", "--user-dir", str(tmp_path / "u")]))
    try:
        def centre(id):
            x, y, w, h = kit(a).layouts.find_button(id)[1].rect
            return (x + w // 2, y + h // 2)

        for _ in range(5):
            a.step([])
        assert isinstance(top(a.manager.current_state()), VoiceFace)
        while a.manager.current_state().dialogs:                    # the Game Start face (sample)
            a.step([])
        audio(a).mixer.available = False                             # captions from here on
        click(a, centre(103))                                        # New Game
        for _ in range(300):
            a.step([])
            s = a.manager.current_state()
            if a.manager.current_state_str() == "setup" and not s.dialogs:
                break
        click(a, centre(141))                                        # Begin -> ovl58:026f(1)
        s = a.manager.current_state()
        assert isinstance(top(s), VoiceFace)
        f = top(s)
        while len(f.speech._lines):
            click(a, (320, 240))
        click(a, (320, 240), held=6)                                 # ends the last line on its release
        for _ in range(60):
            a.step([])
            g = a.manager.current_state()
            if a.manager.current_state_str() == "game" and type(top(g)).__name__ == "TurnStart":
                break
        assert type(top(g)).__name__ == "TurnStart"
        for _ in range(30):
            a.step([])
        assert type(top(g)).__name__ == "TurnStart"                  # waits for its own click
    finally:
        a.close()
