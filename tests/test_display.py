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
    assert not cfg.fullscreen and not cfg.frameless and cfg.scale is None
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


# ------------------------------------------------------------------ the default window size (ui.fit)

from warlords2.ui import fit  # noqa: E402


@pytest.mark.parametrize("avail, scale", [
    ((1880, 960), 2), ((1880, 959), 1), ((1326, 648), 1), ((2520, 1440), 3), ((3800, 2040), 4),
    ((300, 200), 1),
])
def test_fit_scale(avail, scale):
    assert fit.fit_scale(avail) == scale


@pytest.mark.parametrize("desktop, scale", [
    ((1920, 1080), 2), ((1366, 768), 1), ((2560, 1440), 2), ((3840, 2160), 4),
])
def test_place_without_a_work_area(desktop, scale, monkeypatch):
    monkeypatch.setattr(fit, "_windows_work_area", lambda: None)
    monkeypatch.setattr(fit.sys, "platform", "win32")
    assert fit.place(desktop) == scale


def test_place_in_the_windows_work_area(monkeypatch):
    """1920x1080 at 150 %, DPI aware: a 72 px taskbar, a 45 px title bar."""
    monkeypatch.setattr(fit.sys, "platform", "win32")
    monkeypatch.delenv("SDL_VIDEO_WINDOW_POS", raising=False)
    monkeypatch.setattr(fit, "_windows_work_area", lambda: (0, 0, 1920, 1008, 45))
    assert fit.place((1920, 1080)) == 2                     # 1280x960 + title bar fits 1008
    x, y = map(int, fit.os.environ["SDL_VIDEO_WINDOW_POS"].split(","))
    assert x == 320 and 45 <= y and y + 960 <= 1008
    monkeypatch.setattr(fit, "_windows_work_area", lambda: (0, 0, 1366, 728, 31))
    monkeypatch.setenv("SDL_VIDEO_WINDOW_POS", "5,5")       # the user's own wins
    assert fit.place((1366, 768)) == 1 and fit.os.environ["SDL_VIDEO_WINDOW_POS"] == "5,5"



def test_headless_default_scale_is_2(tmp_path):
    from warlords2.app import App
    from warlords2.config import parse_args
    game = Path(__file__).resolve().parents[1] / "original" / "game" / "Warlrd2"
    if not game.is_dir():
        pytest.skip("no game files")
    app = App(parse_args(["--headless", "--seed", "1", "--data", str(game), "--user-dir", str(tmp_path)]))
    assert app.cfg.scale == 2 and app.screen.window.get_size() == (1280, 960)
