"""The 12 mouse pointers of STAND.PCK, drawn in software as WARLORD2.EXE does.

Evidence (register row G4):
* STAND.PCK is loaded by ovl52:0054 and handed to the pointer module with key colour 10
  (0709:0000 -> 12bf:000a); the mask is built from that key.
* `12bf:036f(n)` cuts cell n at (16 n, 0, 16, 16): 16x16, the rows 16-19 of the sheet
  are not used.
* The pointer table at DS:048c (u16 count 12, four far tables) gives per cursor a width
  (DS:042c), a height (DS:0444) and the hotspot DS:045c; 12bf:0412 / 0426 subtract the
  DS:045c value from both x and y, so the hotspot is (h, h).  The fourth table (DS:0474)
  is never read.  The tables are read from the user's EXE.
* Default pointer: 0 (12bf:002b calls 12bf:036f(0)).
* The image lands at (x - h, y - h): 12bf:036f keeps 8 copies of the cell, copy i
  shifted right by i at x = (W + 8) i + i of the work bitmap, and 12bf:098d blits copy
  (x - h) & 7 (source x = ((x - h) & 7) (W + 8)) to the byte column (x - h) & ~7.

Which cursor shows when is decided by 08a9:0896 (map cursor selection, M4c); the
meanings below are what the cells show [seen]: 0 arrow, 1 magnifier, 2 ship, 3 tower,
4 hand, 5 target, 6 boot, 7 ruin, 8 sword, 9 question mark, 10 heart, 11 path arrow.
"""
from __future__ import annotations


import numpy as np
import pygame

from ..formats.pck import decode_pck
from .exe import ds_far, ds_word, ds_words
from ..ui.screen import IDENTITY

KEY = 10
CELL = 16
TABLE = 0x048C
ARROW, MAGNIFIER, SHIP, TOWER, HAND, TARGET, BOOT, RUIN, SWORD, QUESTION, HEART, PATH = range(12)


def read_hotspots(exe: bytes) -> list[int]:
    """DS:045c, through the far pointer of the DS:048c table (third of four)."""
    n = ds_word(exe, TABLE, signed=False)
    return list(ds_words(exe, ds_far(exe, TABLE + 2 + 4 * 2), n))


class Cursors:
    def __init__(self, stand_pck: bytes, exe: bytes):
        bm = decode_pck(stand_pck)
        sheet = np.frombuffer(b"".join(bm.rows), np.uint8).reshape(bm.height, bm.width)
        self.hot = read_hotspots(exe)
        self.cells = []
        for n in range(len(self.hot)):
            cell = np.ascontiguousarray(sheet[:CELL, n * CELL:(n + 1) * CELL])
            s = pygame.image.frombytes(cell.tobytes(), (CELL, CELL), "P")
            s.set_palette(IDENTITY)
            s.set_colorkey(KEY)
            self.cells.append(s)
        self.current = ARROW

    def draw(self, fb: pygame.Surface, pos: tuple[int, int], n: int | None = None) -> None:
        n = self.current if n is None else n
        h = self.hot[n]
        fb.blit(self.cells[n], (pos[0] - h, pos[1] - h))
