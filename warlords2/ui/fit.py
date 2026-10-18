"""The window's default size and place: the largest scale of the 640x480 frame that fits the
free desktop area (without the taskbar or dock, and leaving room for the title bar), at least
1; fractional (the window rounded to whole pixels, `ui.screen.window_size`), or the largest
whole scale with `--integer-scale`.

Windows enlarges the window of a program that does not declare itself DPI aware by the
display scaling (125 %, 150 %, ...), so a 1280x960 window became 1920x1440 and ran off the
screen.  `dpi_aware` sets SDL's hint before the display opens, so sizes are real pixels and
`fit_scale` picks the scale against the real work area.  On Windows the work area comes from
SystemParametersInfo(SPI_GETWORKAREA) and the window is placed centred in it
(SDL_VIDEO_WINDOW_POS); elsewhere the desktop size less a margin is used and the window
manager places it.  `--scale N` (e.g. 1.5) still sets the scale; headless runs keep 2.
"""
from __future__ import annotations

import os
import sys

FRAME = (640, 480)
MARGIN = (40, 120)           # without a work area: room for a taskbar / dock / menu bar and title bar
HEADLESS_SCALE = 2


def dpi_aware() -> None:
    """Before `pygame.display.init`; a value the user set already wins."""
    os.environ.setdefault("SDL_WINDOWS_DPI_AWARENESS", "permonitorv2")


def fit_scale(avail: tuple[int, int], integer: bool = False) -> float:
    """The largest scale (with `integer` the largest whole one) whose frame fits `avail`
    (width, height), at least 1."""
    if integer:
        return max(1, min(avail[0] // FRAME[0], avail[1] // FRAME[1]))
    return max(1, min(avail[0] / FRAME[0], avail[1] / FRAME[1]))


def _windows_work_area() -> tuple[int, int, int, int, int] | None:
    """(left, top, width, height, title bar height) of the primary monitor's work area, in
    pixels of the DPI-aware process; None when the calls fail."""
    try:
        import ctypes
        from ctypes import wintypes
        rect = wintypes.RECT()
        if not ctypes.windll.user32.SystemParametersInfoW(0x30, 0, ctypes.byref(rect), 0):   # SPI_GETWORKAREA
            return None
        m = ctypes.windll.user32.GetSystemMetrics
        title = m(4) + m(33) + m(92)            # SM_CYCAPTION + SM_CYFRAME + SM_CXPADDEDBORDER
        return rect.left, rect.top, rect.right - rect.left, rect.bottom - rect.top, title
    except (AttributeError, OSError):
        return None


def place(desktop: tuple[int, int], integer: bool = False) -> float:
    """The window scale for this desktop (pygame.display.get_desktop_sizes()[0], after
    `display.init`); on Windows also sets where the window opens."""
    from .screen import window_size
    area = _windows_work_area() if sys.platform == "win32" else None
    if area is None:
        return fit_scale((desktop[0] - MARGIN[0], desktop[1] - MARGIN[1]), integer)
    left, top, w, h, title = area
    scale = fit_scale((w, h - title), integer)  # the side / bottom borders are invisible (Windows 10+)
    if "SDL_VIDEO_WINDOW_POS" not in os.environ:
        ww, wh = window_size(scale)
        x = left + (w - ww) // 2
        y = top + title + max(0, (h - title - wh) // 2)
        os.environ["SDL_VIDEO_WINDOW_POS"] = f"{x},{y}"
    return scale
