"""--fullscreen / --frameless / --scale / --integer-scale: the flags, the view of the frame in
the window, and the window <-> logical mapping (pure functions; one dummy-display Screen)."""
from pathlib import Path

import numpy as np
import pygame
import pytest

from warlords2.config import parse_args
from warlords2.ui.input import Input, to_logical, to_window
from warlords2.ui.screen import Screen, view_rect, window_size


def test_flags_default_off_and_parse():
    cfg = parse_args(["--seed", "1"])
    assert not cfg.fullscreen and not cfg.frameless and cfg.scale is None and not cfg.integer_scale
    cfg = parse_args(["--seed", "1", "--fullscreen", "--frameless", "--scale", "3", "--integer-scale"])
    assert cfg.fullscreen and cfg.frameless and cfg.integer_scale
    assert cfg.scale == 3 and isinstance(cfg.scale, int)          # whole: still an int
    assert parse_args(["--seed", "1", "--scale", "1.5"]).scale == 1.5
    assert parse_args(["--seed", "1", "--scale", "0.75"]).scale == 0.75


@pytest.mark.parametrize("bad", ["0", "-1", "-0.5", "abc", "nan", "inf"])
def test_scale_must_be_a_positive_number(bad):
    with pytest.raises(SystemExit):
        parse_args(["--seed", "1", "--scale", bad])


@pytest.mark.parametrize("size, rect", [
    ((1280, 960), (0, 0, 1280, 960)),            # the --scale 2 window: the whole window
    ((640, 480), (0, 0, 640, 480)),
    ((1920, 1080), (240, 0, 1440, 1080)),        # 2.25, bars left and right only
    ((2560, 1440), (320, 0, 1920, 1440)),        # 3
    ((3840, 2160), (480, 0, 2880, 2160)),        # 4.5
    ((1366, 768), (171, 0, 1024, 768)),          # 1.6
    ((1920, 1200), (160, 0, 1600, 1200)),        # 2.5
    ((1280, 1024), (0, 32, 1280, 960)),          # 2, bars top and bottom only
    ((320, 240), (0, 0, 320, 240)),              # smaller than the frame: uniform 0.5
    ((400, 240), (40, 0, 320, 240)),
])
def test_view_rect(size, rect):
    assert view_rect(size) == pygame.Rect(rect)


@pytest.mark.parametrize("size, rect", [
    ((1280, 960), (0, 0, 1280, 960)),
    ((640, 480), (0, 0, 640, 480)),
    ((1920, 1080), (320, 60, 1280, 960)),        # integer 2, borders left/right and top/bottom
    ((2560, 1440), (320, 0, 1920, 1440)),        # integer 3
    ((3840, 2160), (640, 120, 2560, 1920)),       # integer 4
    ((1366, 768), (363, 144, 640, 480)),         # integer 1
    ((320, 240), (0, 0, 320, 240)),              # smaller than the frame: uniform 0.5
    ((400, 240), (40, 0, 320, 240)),
])
def test_view_rect_integer_scale(size, rect):
    assert view_rect(size, integer=True) == pygame.Rect(rect)


@pytest.mark.parametrize("scale, size", [
    (1, (640, 480)), (2, (1280, 960)), (1.5, (960, 720)), (2.25, (1440, 1080)), (1.37, (877, 658)),
])
def test_window_size_rounds_to_whole_pixels(scale, size):
    assert window_size(scale) == size and Input(scale).view == pygame.Rect((0, 0), size)


def test_windowed_mapping_is_integer_division_by_the_scale():
    for s in (1, 2, 3):
        v = pygame.Rect(0, 0, 640 * s, 480 * s)
        for wx, wy in ((0, 0), (1, 1), (639 * s + s - 1, 479 * s + s - 1), (640 * s, 480 * s), (7, 13)):
            assert to_logical((wx, wy), v) == (wx // s, wy // s)
        for x, y in ((0, 0), (5, 7), (639, 479)):
            assert to_window((x, y), v) == (x * s, y * s)
    assert Input(scale=2).logical((1279, 959)) == (639, 479)


@pytest.mark.parametrize("view", [
    (0, 0, *window_size(1.5)), (0, 0, *window_size(2.25)), (0, 0, *window_size(1.37)),
    (0, 0, *window_size(963 / 480)), tuple(view_rect((1920, 1080))), tuple(view_rect((1366, 768))),
])
def test_fractional_mapping_round_trips_and_matches_the_picture(view):
    """Every logical px survives to_window -> to_logical, and every window px maps to the
    logical px that nearest-neighbour pygame.transform.scale shows there."""
    v = pygame.Rect(view)
    assert all(to_logical(to_window((x, 0), v), v)[0] == x for x in range(640))
    assert all(to_logical(to_window((0, y), v), v)[1] == y for y in range(480))
    src = pygame.Surface((640, 480), 0, 32)
    pygame.surfarray.blit_array(src, np.arange(640, dtype=np.uint32)[:, None]
                                + (np.arange(480, dtype=np.uint32)[None, :] << 10))
    shown = pygame.surfarray.array2d(pygame.transform.scale(src, v.size))
    assert all(to_logical((v.x + p, v.y), v)[0] == shown[p, 0] & 1023 for p in range(v.w))
    assert all(to_logical((v.x, v.y + p), v)[1] == shown[0, p] >> 10 for p in range(v.h))


def test_screen_window_at_a_fractional_scale(monkeypatch):
    """--scale 1.5: a 960x720 window, all of it the view; a logical px covers 1 or 2 window px
    of its own colour (sharp, nothing blended)."""
    monkeypatch.setenv("SDL_VIDEODRIVER", "dummy")
    pygame.display.init()
    dac = [(i * 16, 255 - i * 16, (i * 85) % 256) for i in range(16)]
    sc = Screen(1.5, dac)
    assert sc.window.get_size() == (960, 720) and sc.view == pygame.Rect(0, 0, 960, 720)
    sc.fb.fill(0)
    sc.fb.fill(1, (1, 0, 1, 480))                          # logical column 1: window px 2
    sc.fb.fill(2, (2, 0, 1, 480))                          # column 2: window px 3..4
    sc.present()
    px = pygame.surfarray.array3d(sc.window)
    assert [tuple(int(v) for v in c) for c in px[:6, 10]] == [dac[i] for i in (0, 0, 1, 2, 2, 0)]
    assert len({tuple(c) for c in px.reshape(-1, 3)}) == 3


def test_letterboxed_mapping_round_trips_and_clamps_the_borders():
    v = view_rect((1920, 1080), integer=True)    # (320, 60, 1280, 960)
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
    inp.view, inp.clamp = view_rect((1920, 1080), integer=True), True
    out = inp.feed([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(330, 70)),
                    pygame.event.Event(pygame.MOUSEMOTION, pos=(10, 10))])
    assert out[0].pos == (5, 5) and out[1].pos == (0, 0) and out[1].rel == (-5, -5)
    inp.view = view_rect((1920, 1080))           # (240, 0, 1440, 1080): 2.25
    out = inp.feed([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=1, pos=(251, 9))])
    assert out[0].pos == (11 * 640 // 1440, 9 * 480 // 1080) == (4, 4)


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
def test_fit_scale_integer(avail, scale):
    assert fit.fit_scale(avail, integer=True) == scale


@pytest.mark.parametrize("avail, scale", [
    ((1880, 960), 2), ((1880, 959), 959 / 480), ((1326, 648), 1.35), ((2520, 1440), 3),
    ((3800, 2040), 4.25), ((300, 200), 1),
])
def test_fit_scale(avail, scale):
    assert fit.fit_scale(avail) == pytest.approx(scale)
    w, h = window_size(fit.fit_scale(avail))
    assert (w <= avail[0] and h <= avail[1]) or scale == 1      # at least 1, even if it spills


@pytest.mark.parametrize("desktop, scale, integer", [
    ((1920, 1080), 2, True), ((1366, 768), 1, True), ((2560, 1440), 2, True), ((3840, 2160), 4, True),
    ((1920, 1080), 2, False), ((1366, 768), 1.35, False), ((2560, 1440), 2.75, False),
    ((3840, 2160), 4.25, False),
])
def test_place_without_a_work_area(desktop, scale, integer, monkeypatch):
    monkeypatch.setattr(fit, "_windows_work_area", lambda: None)
    monkeypatch.setattr(fit.sys, "platform", "win32")
    assert fit.place(desktop, integer) == pytest.approx(scale)


def test_place_in_the_windows_work_area(monkeypatch):
    """1920x1080 at 150 %, DPI aware: a 72 px taskbar, a 45 px title bar."""
    monkeypatch.setattr(fit.sys, "platform", "win32")
    monkeypatch.delenv("SDL_VIDEO_WINDOW_POS", raising=False)
    monkeypatch.setattr(fit, "_windows_work_area", lambda: (0, 0, 1920, 1008, 45))
    assert fit.place((1920, 1080), integer=True) == 2       # 1280x960 + title bar fits 1008
    x, y = map(int, fit.os.environ["SDL_VIDEO_WINDOW_POS"].split(","))
    assert x == 320 and 45 <= y and y + 960 <= 1008
    monkeypatch.delenv("SDL_VIDEO_WINDOW_POS")
    s = fit.place((1920, 1080))                             # fractional: the 963 px under the title bar
    assert s == pytest.approx(963 / 480) and window_size(s) == (1284, 963)
    assert fit.os.environ["SDL_VIDEO_WINDOW_POS"] == "318,45"
    monkeypatch.setattr(fit, "_windows_work_area", lambda: (0, 0, 1366, 728, 31))
    monkeypatch.setenv("SDL_VIDEO_WINDOW_POS", "5,5")       # the user's own wins
    assert fit.place((1366, 768), integer=True) == 1 and fit.os.environ["SDL_VIDEO_WINDOW_POS"] == "5,5"
    assert window_size(fit.place((1366, 768))) == (929, 697)  # 697 = 728 - 31


def _game():
    game = Path(__file__).resolve().parents[1] / "original" / "game" / "Warlrd2"
    if not game.is_dir():
        pytest.skip("no game files")
    return game


def test_headless_default_scale_is_2(tmp_path):
    from warlords2.app import App
    app = App(parse_args(["--headless", "--seed", "1", "--data", str(_game()), "--user-dir", str(tmp_path)]))
    assert app.cfg.scale == 2 and app.screen.window.get_size() == (1280, 960)


def test_headless_fractional_scale_maps_clicks(tmp_path):
    """--scale 1.5: a 960x720 window; window px p is logical px p * 640 // 960."""
    from warlords2.app import App
    app = App(parse_args(["--headless", "--seed", "1", "--data", str(_game()), "--user-dir", str(tmp_path),
                          "--scale", "1.5"]))
    assert app.screen.window.get_size() == (960, 720) and app.input.view == pygame.Rect(0, 0, 960, 720)
    assert app.input.logical((959, 719)) == (639, 479) and app.input.logical((5, 5)) == (3, 3)
    assert app.input.window((3, 3)) == (5, 5)
