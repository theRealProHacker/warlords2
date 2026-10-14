"""Bitmap fonts: `<NAME>.FNT` (PCK glyph sheet) + `<NAME>.FIN` (docs/formats/graphics.md
section 4).

Slots (Evidence: EXE ovl50:0000 loads Chance36 into the font record at DS:47d7,
Chance17 into DS:47b6 and Text into DS:47f8, which `SetFont` ovl50:06ae selects as slots
1, 2 and 0):

    0 TEXT      menu bar, dialogs
    1 CHANCE36  GFX `#H`
    2 CHANCE17  GFX `#T`, `#Fnnn`

Only colour block 0 is used: its pixels are ink (15), a one-pixel shadow (0) and
background (3) (graphics.md section 4 [data]); `SetFont(slot, ink, shadow, bg)` recolours
that block, so drawing maps 15 -> ink, 0 -> shadow and leaves the background
transparent.  Text width is the sum of the per-glyph advances (the measuring routine
11e2:0a8e sums one byte per character); the pen advances by the same amount.
"""
from __future__ import annotations

import numpy as np
import pygame

from ..formats.font import FontInfo, glyph_rects, parse_fin
from ..formats.pck import decode_pck
from ..ui.screen import IDENTITY

SLOTS = ("TEXT", "CHANCE36", "CHANCE17")
TEXT, CHANCE36, CHANCE17 = 0, 1, 2
INK, SHADOW, BACK = 15, 0, 3                 # colours of block 0 on disk
CLEAR = 255                                  # colour key of glyph surfaces (fb uses 0..15)


class Font:
    def __init__(self, fin: bytes, fnt: bytes):
        self.info: FontInfo = parse_fin(fin)
        bm = decode_pck(fnt)
        sheet = np.frombuffer(b"".join(bm.rows), np.uint8).reshape(bm.height, bm.width)
        self.height = self.info.line_height
        self._cells = []
        for x, y, w, h in glyph_rects(self.info):
            self._cells.append(sheet[y:y + h, x:x + w].copy())
        self._cache: dict[tuple[int, int, int], pygame.Surface | None] = {}

    def _index(self, ch: str) -> int:
        i = ord(ch) - self.info.first_char
        return i if 0 <= i < self.info.n_chars else 0

    def advance(self, ch: str) -> int:
        return self.info.advances[self._index(ch)]

    def width(self, text: str) -> int:
        return sum(self.advance(c) for c in text)

    def _glyph(self, i: int, ink: int, shadow: int) -> pygame.Surface | None:
        k = (i, ink, shadow)
        if k not in self._cache:
            cell = self._cells[i]
            if cell.size == 0:
                self._cache[k] = None
            else:
                lut = np.full(256, CLEAR, np.uint8)
                lut[INK], lut[SHADOW] = ink, shadow
                s = pygame.image.frombytes(lut[cell].tobytes(), (cell.shape[1], cell.shape[0]), "P")
                s.set_palette(IDENTITY)
                s.set_colorkey(CLEAR)
                self._cache[k] = s
        return self._cache[k]

    def draw(self, fb: pygame.Surface, x: int, y: int, text: str, ink: int, shadow: int,
             bg: int | None = None) -> int:
        """Draw `text` with the top of its glyph cells at y; transparent (11e2:04aa), or
        opaque on `bg` (11e2:0401).  Returns the pen x after it."""
        for ch in text:
            i = self._index(ch)
            if bg is not None and self.info.widths[i]:
                fb.fill(bg, (x, y, self.info.widths[i], self.height))
            g = self._glyph(i, ink, shadow)
            if g is not None:
                fb.blit(g, (x, y))
            x += self.info.advances[i]
        return x


class Fonts:
    """The three font slots of WARLORD2.EXE, read from the game directory."""

    def __init__(self, read):
        self.slots = [Font(read(f"{n}.FIN"), read(f"{n}.FNT")) for n in SLOTS]

    def __getitem__(self, slot: int) -> Font:
        return self.slots[slot]
