"""`.PCK` packed 16-colour bitmaps and the catalogue of what each sheet holds.

Format: docs/formats/graphics.md sections 2 and 3.
"""
from __future__ import annotations

import fnmatch
import struct
from dataclasses import dataclass, field
from typing import NamedTuple

N_PLANES = 4


class Bitmap(NamedTuple):
    """Indexed bitmap: `rows` holds `height` bytes objects of `width` colour indices 0..15."""
    width: int
    height: int
    rows: list[bytes]


def decode_pck(data: bytes) -> Bitmap:
    """-> Bitmap(width, height, rows) where rows is a list of `height` bytes objects of
    `width` colour indices 0..15.  Raises ValueError on any inconsistency.

    Header: u16le 1, u16le width, u16le height.  Then 4 bit planes (plane p = bit p
    of the colour index), each (width/8)*height bytes, MSB = leftmost pixel, packed
    as one continuous token stream:
        b < 0x80         : copy the next b+1 bytes literally
        b >= 0x80, b2, n : copy n+1 bytes from (current position + off) where
                           off = int16((b << 8) | b2) < 0, byte by byte (may overlap);
                           never reaches back before the start of the current plane
    A plane ends exactly when its size is reached; the next token starts the next plane.
    """
    if len(data) < 6:
        raise ValueError("PCK too short")
    one, width, height = struct.unpack_from("<3H", data, 0)
    if one != 1:
        raise ValueError(f"PCK first word is {one}, expected 1")
    if width % 8 or not width or not height:
        raise ValueError(f"bad PCK size {width}x{height}")
    stride = width // 8
    psize = stride * height
    pos = 6
    planes = []
    for p in range(N_PLANES):
        out = bytearray()
        while len(out) < psize:
            b = data[pos]
            if b & 0x80:
                src = len(out) + ((b << 8) | data[pos + 1]) - 0x10000
                n = data[pos + 2] + 1
                pos += 3
                if src < 0:
                    raise ValueError(f"plane {p}: back-reference before plane start")
                for i in range(n):
                    out.append(out[src + i])
            else:
                n = b + 1
                if pos + 1 + n > len(data):
                    raise ValueError(f"plane {p}: literal run past end of file")
                out += data[pos + 1:pos + 1 + n]
                pos += 1 + n
        if len(out) != psize:
            raise ValueError(f"plane {p}: token overruns plane ({len(out)} > {psize})")
        planes.append(bytes(out))
    if pos != len(data):
        raise ValueError(f"{len(data) - pos} trailing bytes after 4 planes")
    # planar -> chunky via a 256-entry spread table per plane
    spread = [[bytes(((v >> (7 - i)) & 1) << p for i in range(8)) for v in range(256)]
              for p in range(N_PLANES)]
    rows = []
    for y in range(height):
        acc = bytearray(width)
        for p in range(N_PLANES):
            line = planes[p][y * stride:(y + 1) * stride]
            bits = b"".join(spread[p][v] for v in line)
            acc = bytearray(a | b for a, b in zip(acc, bits))
        rows.append(bytes(acc))
    return Bitmap(width, height, rows)


# --------------------------------------------------------------------------- sheet catalogue


@dataclass
class Sheet:
    pattern: str                 # fnmatch pattern on the upper-case relative path
    what: str
    palette: str = "STANDARD.PAL"
    key: int | None = None       # colour index the game turns into a mask (None: opaque)
    cell: tuple[int, int] | None = None   # regular grid cell (w, h), row-major from (0, 0)
    rects: list[tuple[int, int, int, int]] = field(default_factory=list)  # explicit frames

    def frames(self, width: int, height: int) -> list[tuple[int, int, int, int]]:
        if self.rects:
            return list(self.rects)
        if self.cell:
            cw, ch = self.cell
            return [(x, y, cw, ch) for y in range(0, height - ch + 1, ch)
                    for x in range(0, width - cw + 1, cw)]
        return [(0, 0, width, height)]


def _shield_rects():
    r = [(40 * i, 0, 40, 40) for i in range(9)]           # 0..8  large framed shields
    r += [(40 * i, 40, 24, 24) for i in range(8)]         # 9..16 sword icons
    r += [(40 * i + 24, 40, 16, 24) for i in range(8)]    # 17..24 small shields
    r += [(320 + 8 * (i % 4), 40 + 8 * (i // 4), 8, 8) for i in range(8)]  # 25..32 tiny shields
    r += [(352, 40, 16, 24)]                              # 33 empty shield outline
    return r


TERRAIN_PAL = "TERRAIN0/WAR2.PAL"

# Key colours and directories come from the picture table in WARLORD2.EXE (see the doc).
SHEETS = [
    Sheet("TERRAIN0/A4.PCK", "army set for player 4 (green; background is colour 11): 32 cells of 32x30",
          TERRAIN_PAL, 11, (32, 30)),
    Sheet("TERRAIN0/A[0-8].PCK", "army set for one player (A8 = neutral): 32 cells of 32x30",
          TERRAIN_PAL, 10, (32, 30)),
    Sheet("TERRAIN0/ASHADOW.PCK", "army silhouettes, same cells as A*.PCK", TERRAIN_PAL, 15, (32, 30)),
    Sheet("TERRAIN0/ATRANS2.PCK", "ship/explosion/standard overlays and small shield strips",
          TERRAIN_PAL, 1),
    Sheet("TERRAIN0/BSHIELD.PCK", "big shield + CAPITAL label + small shield, one 32-px column per player",
          TERRAIN_PAL, 12, rects=[(32 * i, 0, 32, 59) for i in range(9)]),
    Sheet("TERRAIN0/CITYBACK.PCK", "city screen background strip", TERRAIN_PAL),
    Sheet("TERRAIN0/MOVEBAR4.PCK", "movement bar ornament, player 4 (green; background is colour 1)",
          TERRAIN_PAL, 1),
    Sheet("TERRAIN0/MOVEBAR[0-7].PCK", "movement bar ornament in one player's colours", TERRAIN_PAL, 10),
    Sheet("TERRAIN0/ROAD.PCK", "road pieces, bridges/ruins and small site markers: 40x40 cells",
          TERRAIN_PAL, 1, (40, 40)),
    Sheet("TERRAIN0/SCENERY0.PCK", "terrain tiles: 16x6 cells of 40x40", TERRAIN_PAL, None, (40, 40)),
    Sheet("TERRAIN0/SCENERY1.PCK", "cities/sites (2x2 tiles each), bridges, forest: 40x40 cells",
          TERRAIN_PAL, None, (40, 40)),
    Sheet("TERRAIN0/SHIELDS.PCK", "player shields in several sizes", TERRAIN_PAL, None,
          rects=_shield_rects()),
    Sheet("STAND.PCK", "12 mouse cursors of 16x20", key=10, cell=(16, 20)),
    Sheet("PICS/CURS.PCK", "4 animation frames of the map selection boxes", key=0,
          rects=[(64 * i, 0, 64 if i < 3 else 48, 80) for i in range(4)]),
    Sheet("START/SPARKLE.PCK", "4 sparkle frames of 32x41 (intro)", "START/SCREEN0.PAL", None, (32, 41)),
    Sheet("START/SSG.PCK", "SSG logo screen (intro)", "START/LOGO.PAL"),
    Sheet("START/START.PCK", "title painting (intro)", "START/SCREEN0.PAL"),
    Sheet("START/STEXT.PCK", "'Warlords II' title lettering (intro)", "START/SCREEN0.PAL"),
    Sheet("START/BLACK.PCK", "all-black screen (intro)", "START/SCREEN0.PAL"),
    Sheet("*/PICS/SCENARIO.PCK", "scenario picture shown in the scenario menu"),
    Sheet("PICS/ABITS.PCK", "army selection rings per player, group buttons, misc icons", key=None),
    Sheet("PICS/WAR.PCK", "battle explosion and result icons", key=1),
    Sheet("PICS/HIDDEN.PCK", "dither patterns for the hidden-map fog", key=1),
    Sheet("PICS/POPUP.PCK", "marble popup panel", key=1),
    Sheet("PICS/POPUP2.PCK", "wooden signpost popup", key=1),
    Sheet("PICS/POPUP3.PCK", "marble popup panels", key=10),
    Sheet("PICS/BIGARMY.PCK", "blacksmith picture (production)", key=15),
    Sheet("PICS/SCROLL.PCK", "parchment scroll", key=10),
    Sheet("PICS/BSCROLL.PCK", "big parchment scroll with logo", key=10),
    Sheet("PICS/STACK.PCK", "stack info titles and buttons", key=5),
    Sheet("PICS/VOICE.PCK", "horned helmet (advisor voice)", key=10),
    Sheet("PICS/RMAPBAR.PCK", "random-map progress bar ornament", key=10),
    Sheet("PICS/HELPGFX.PCK", "key caps and icons used by HELP/*.GFX", key=10),
    Sheet("PICS/*.PCK", "full picture / button sheet (rects live in the executable and DATA/*.DAT)"),
    Sheet("*.FNT", "font glyph sheet (see the FIN file)"),
]


def sheet_info(rel: str) -> Sheet:
    rel = rel.replace("\\", "/").upper()
    for s in SHEETS:
        if fnmatch.fnmatchcase(rel, s.pattern):
            return s
    return Sheet(rel, "unknown picture")
