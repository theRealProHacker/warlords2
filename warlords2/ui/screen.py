"""640x480 indexed framebuffer; the DAC palette is applied only when presenting.

docs/plan.md section 3.1.  `fb` is an 8-bit surface of colour indices under a fixed
identity palette that every sprite surface shares, so 8-bit to 8-bit blits keep indices
and colour keys (X13).  `fb.set_palette` is never called after creation (it would remap
later blits).  The 16 DAC colours (STANDARD.PAL, intro palettes, fade steps) become a
numpy LUT in `present()`, written into the 32-bit `present_surface`; captures and
recordings read `present_surface`.  The window shows `present_surface` scaled into `view`:
the whole window at `--scale`, or in full screen (`--fullscreen`, Alt+Enter) the centred
`view_rect` of the desktop with black borders.
"""
from __future__ import annotations

import numpy as np
import pygame

from ..formats.pck import Bitmap

W, H = 640, 480
N_COLOURS = 16
IDENTITY = [(i, i, i) for i in range(256)]

RGB = tuple[int, int, int]


def indexed_surface(bm: Bitmap, key: int | None = None) -> pygame.Surface:
    """8-bit surface of colour indices under the identity palette; `key` -> colour key."""
    s = pygame.image.frombytes(b"".join(bm.rows), (bm.width, bm.height), "P")
    s.set_palette(IDENTITY)
    if key is not None:
        s.set_colorkey(key)
    return s


def view_rect(window: tuple[int, int]) -> pygame.Rect:
    """Where the 640x480 frame goes in a window of this size: scaled by the largest integer
    factor that fits, else (a window smaller than the frame) by the largest uniform factor
    that fits; centred."""
    ww, wh = window
    k = min(ww // W, wh // H)
    if k >= 1:
        w, h = W * k, H * k
    else:
        f = min(ww / W, wh / H)
        w, h = max(1, min(ww, int(W * f))), max(1, min(wh, int(H * f)))
    return pygame.Rect((ww - w) // 2, (wh - h) // 2, w, h)


class Screen:
    def __init__(self, scale: int, dac: list[RGB], fullscreen: bool = False, frameless: bool = False):
        self.scale = scale
        self.frameless = frameless
        self.fb = pygame.Surface((W, H), depth=8)
        self.fb.set_palette(IDENTITY)
        self.set_fullscreen(fullscreen)
        self._dac = list(dac)
        self._fade: tuple[list[RGB], list[RGB], int, int] | None = None   # from, to, step, steps

    def set_fullscreen(self, on: bool) -> None:
        """Full screen at the desktop resolution, or the `--scale` window (without a title bar
        with `--frameless`)."""
        self.fullscreen = on
        if on:
            self.window = pygame.display.set_mode((0, 0), pygame.FULLSCREEN)
        else:
            self.window = pygame.display.set_mode((W * self.scale, H * self.scale),
                                                  pygame.NOFRAME if self.frameless else 0)
        pygame.mouse.set_visible(False)    # the game draws its own pointer (STAND.PCK cells)
        # the window as asked for, whatever size the driver gave (the dummy driver caps it at
        # 1024x768): input keeps dividing by the scale, as scripts and tests expect
        self.view = view_rect(self.window.get_size()) if on else pygame.Rect(0, 0, W * self.scale, H * self.scale)
        self.letterboxed = on and self.view != self.window.get_rect()
        self.present_surface = pygame.Surface((W, H), 0, self.window)    # the window's pixel format

    @property
    def dac(self) -> list[RGB]:
        return list(self._dac)

    def set_dac(self, colours: list[RGB]) -> None:
        """Show these 16 colours from the next present on; cancels a running fade."""
        if len(colours) != N_COLOURS:
            raise ValueError(f"DAC needs {N_COLOURS} colours, got {len(colours)}")
        self._dac = list(colours)
        self._fade = None

    def fade_to(self, target: list[RGB], frames: int) -> None:
        """Move the DAC linearly to `target` over the next `frames` presents.

        Unverified: the curve is a guess.  Nothing yet shows that the original blends
        linearly per 8-bit channel (its DAC is 6-bit, and its fade loop is not traced)."""
        if len(target) != N_COLOURS or frames < 1:
            raise ValueError("fade needs 16 colours and at least one frame")
        self._fade = (list(self._dac), list(target), 0, frames)

    @property
    def fading(self) -> bool:
        return self._fade is not None

    def _advance_fade(self) -> None:
        start, target, step, steps = self._fade
        step += 1
        self._dac = [tuple(a + (b - a) * step // steps for a, b in zip(c0, c1))
                     for c0, c1 in zip(start, target)]
        self._fade = None if step == steps else (start, target, step, steps)

    def present(self) -> None:
        """fb indices -> LUT -> present_surface -> scaled into `view` of the window."""
        if self._fade:
            self._advance_fade()
        idx = pygame.surfarray.array2d(self.fb)
        if __debug__ and idx.max() >= N_COLOURS:
            ys, xs = np.nonzero(idx.T >= N_COLOURS)
            raise ValueError(f"framebuffer index {idx.max()} >= {N_COLOURS} at ({xs[0]}, {ys[0]})")
        lut = np.zeros(256, np.uint32)
        lut[:N_COLOURS] = [self.present_surface.map_rgb(c) for c in self._dac]
        pygame.surfarray.blit_array(self.present_surface, lut[idx])
        if self.fullscreen:
            if self.letterboxed:
                self.window.fill(0)
            pygame.transform.scale(self.present_surface, self.view.size, self.window.subsurface(self.view))
        elif self.scale == 1:
            self.window.blit(self.present_surface, (0, 0))
        else:
            pygame.transform.scale(self.present_surface, self.window.get_size(), self.window)
        pygame.display.flip()
