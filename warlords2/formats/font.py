"""`.FIN` font descriptions; the glyphs themselves are a `.FNT` file in PCK format.

Format: docs/formats/graphics.md section 4.
"""
from __future__ import annotations

import struct
from dataclasses import dataclass

Rect4 = tuple[int, int, int, int]     # x, y, w, h


@dataclass
class FontInfo:
    n_chars: int          # 96
    first_char: int       # 32
    sheet_width: int      # == FNT bitmap width
    line_height: int      # height of one glyph row in the sheet
    ascent: int           # byte 5; baseline offset (meaning not verified)
    unk6: int             # byte 6 (0/1/2; meaning not verified)
    rows: int             # glyph rows per colour block
    widths: list[int]     # bitmap width of each glyph in the sheet
    advances: list[int]   # pen advance of each glyph
    variants: list[tuple[int, int, int]]  # (ink, 1-px left shadow, background) colour per block

    @property
    def block_height(self) -> int:
        return self.line_height * self.rows


def parse_fin(data: bytes) -> FontInfo:
    n, first = data[0], data[1]
    (width,) = struct.unpack_from(">H", data, 2)
    line_h, ascent, unk6 = data[4], data[5], data[6]
    rows, nvar = struct.unpack_from(">HH", data, 7)
    need = 11 + 2 * n + 6 * nvar
    if len(data) != need:
        raise ValueError(f"FIN size {len(data)} != {need}")
    widths = list(data[11:11 + n])
    adv = list(data[11 + n:11 + 2 * n])
    var = [struct.unpack_from(">3H", data, 11 + 2 * n + 6 * i) for i in range(nvar)]
    return FontInfo(n, first, width, line_h, ascent, unk6, rows, widths, adv, var)


def glyph_rects(fi: FontInfo) -> list[Rect4]:
    """(x, y, w, h) of every glyph inside colour block 0 of the FNT bitmap.
    Glyphs are stored left to right in cells of ceil(width/8)*8 pixels; a glyph whose
    cell would cross the right edge starts the next row.  Zero-width glyphs (space)
    take no cell."""
    rects = []
    x = y = 0
    for w in fi.widths:
        cell = (w + 7) // 8 * 8
        if x + cell > fi.sheet_width:
            x = 0
            y += fi.line_height
        rects.append((x, y, w, fi.line_height))
        x += cell
    return rects
