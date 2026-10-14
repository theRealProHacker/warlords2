"""640x480 indexed framebuffer; the DAC palette is applied only when presenting.

docs/plan.md section 3.1.  `fb` is an 8-bit surface of colour indices under a fixed
identity palette that every sprite surface shares, so 8-bit to 8-bit blits keep indices
and colour keys (X13).  `fb.set_palette` is never called after creation (it would remap
later blits).  The 16 DAC colours (STANDARD.PAL, intro palettes, fade steps) become a
numpy LUT in `present()`, written into the 32-bit `present_surface`; captures and
recordings read `present_surface`.
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


class Screen:
    def __init__(self, scale: int, dac: list[RGB]):
        self.scale = scale
        self.fb = pygame.Surface((W, H), depth=8)
        self.fb.set_palette(IDENTITY)
        self.window = pygame.display.set_mode((W * scale, H * scale))
        self.present_surface = pygame.Surface((W, H), 0, self.window)    # the window's pixel format
        self._dac = list(dac)
        self._fade: tuple[list[RGB], list[RGB], int, int] | None = None   # from, to, step, steps

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
        """fb indices -> LUT -> present_surface -> integer-scaled window."""
        if self._fade:
            self._advance_fade()
        idx = pygame.surfarray.array2d(self.fb)
        if __debug__ and idx.max() >= N_COLOURS:
            ys, xs = np.nonzero(idx.T >= N_COLOURS)
            raise ValueError(f"framebuffer index {idx.max()} >= {N_COLOURS} at ({xs[0]}, {ys[0]})")
        lut = np.zeros(256, np.uint32)
        lut[:N_COLOURS] = [self.present_surface.map_rgb(c) for c in self._dac]
        pygame.surfarray.blit_array(self.present_surface, lut[idx])
        if self.scale == 1:
            self.window.blit(self.present_surface, (0, 0))
        else:
            pygame.transform.scale(self.present_surface, self.window.get_size(), self.window)
        pygame.display.flip()
