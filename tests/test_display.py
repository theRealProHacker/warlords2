"""--fullscreen / --frameless: the flags, the view of the frame in the window, and the
window <-> logical mapping (pure functions, no display)."""
from pathlib import Path

import pygame
import pytest

from warlords2.config import parse_args
from warlords2.ui.input import Input, to_logical, to_window
from warlords2.ui.screen import view_rect


def test_flags_default_off_and_parse():
    cfg = parse_args(["--seed", "1"])
    assert not cfg.fullscreen and not cfg.frameless and cfg.scale == 2
    cfg = parse_args(["--seed", "1", "--fullscreen", "--frameless", "--scale", "3"])
    assert cfg.fullscreen and cfg.frameless and cfg.scale == 3


@pytest.mark.parametrize("size, rect", [
    ((1280, 960), (0, 0, 1280, 960)),            # the --scale 2 window: the whole window
    ((640, 480), (0, 0, 640, 480)),
    ((1920, 1080), (320, 60, 1280, 960)),        # integer 2, borders left/right and top/bottom
    ((2560, 1440), (320, 0, 1920, 1440)),        # integer 3
    ((3840, 2160), (640, 120, 2560, 1920)),       # integer 4
    ((1366, 768), (363, 144, 640, 480)),         # integer 1
    ((320, 240), (0, 0, 320, 240)),              # smaller than the frame: uniform 0.5
    ((400, 240), (40, 0, 320, 240)),
])
def test_view_rect(size, rect):
    assert view_rect(size) == pygame.Rect(rect)


def test_windowed_mapping_is_integer_division_by_the_scale():
    for s in (1, 2, 3):
        v = pygame.Rect(0, 0, 640 * s, 480 * s)
        for wx, wy in ((0, 0), (1, 1), (639 * s + s - 1, 479 * s + s - 1), (640 * s, 480 * s), (7, 13)):
            assert to_logical((wx, wy), v) == (wx // s, wy // s)
        for x, y in ((0, 0), (5, 7), (639, 479)):
            assert to_window((x, y), v) == (x * s, y * s)
    assert Input(scale=2).logical((1279, 959)) == (639, 479)


def test_letterboxed_mapping_round_trips_and_clamps_the_borders():
    v = view_rect((1920, 1080))                  # (320, 60, 1280, 960)
    for x, y in ((0, 0), (1, 2), (320, 240), (639, 479)):
        assert to_logical(to_window((x, y), v), v, True) == (x, y)
    assert to_logical((320, 60), v, True) == (0, 0)
    assert to_logical((321, 61), v, True) == (0, 0)
    assert to_logical((322, 62), v, True) == (1, 1)
    assert to_logical((0, 0), v, True) == (0, 0)                 # the borders: the frame edge
    assert to_logical((1919, 1079), v, True) == (639, 479)
    assert to_logical((1919, 500), v, True) == (639, (500 - 60) // 2)


def test_downscaled_mapping_stays_on_the_frame():
    v = view_rect((320, 240))
    assert to_logical((0, 0), v, True) == (0, 0) and to_logical((319, 239), v, True) == (638, 478)
    for x, y in ((0, 0), (2, 4), (638, 478)):
        assert to_logical(to_window((x, y), v), v, True) == (x, y)


def test_input_feed_uses_the_view():
    inp = Input(scale=2)
    inp.view, inp.clamp = view_rect((1920, 1080)), True
    out = inp.feed([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(330, 70)),
                    pygame.event.Event(pygame.MOUSEMOTION, pos=(10, 10))])
    assert out[0].pos == (5, 5) and out[1].pos == (0, 0) and out[1].rel == (-5, -5)


def test_linux_audio_defaults_to_alsa_first(monkeypatch):
    """A windowed run on Linux asks SDL for ALSA before pulseaudio; a set SDL_AUDIODRIVER wins."""
    import warlords2.app as A
    src = Path(A.__file__).read_text()
    assert A.LINUX_AUDIO == "alsa,pulseaudio"
    assert 'os.environ.setdefault("SDL_AUDIODRIVER", LINUX_AUDIO)' in src
