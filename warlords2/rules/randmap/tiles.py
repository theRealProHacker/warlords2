"""Tile words of the random map: ovl09:0000 (005c, 0464 twice; run inside stage 80 by ovl12:003a)
and the road pieces ovl09:0a4b (stage 90, run first by ovl09:0014).

* `base_tiles` ovl09:005c: one tile per grid class (`RANDOM.DAT` block +0x464 + 0x40 g), the
  2 x 2 city blocks, site pictures, and the tile of the first 8 SCN sites; no dice.
* `retile` ovl09:0464: five row-major sweeps (water / shore, forest, mountains, hills, marsh)
  that pick the tile from an 8-neighbour mask through the pattern table +0x264; the grid is
  rewritten in place, so later squares of a sweep see earlier rewrites.  Lone water becomes
  marsh and sprays marsh around it (ovl08:0029, package R1: `marsh.spray`).
* `road_tiles` ovl09:0a4b: road piece ids from the road-neighbour mask and table +0x364, then
  two scatters of the markers 0x11 / 0x10 on straight pieces.

Every map write is `Mlo := v` (the low byte only, `and byte 0; or byte al`): the high bytes
stay as the run left them (register X62).  "chk" is the checkerboard parity the EXE computes
with truncating division: 1 when x + y is 0 or even, else 0 (it picks entry 2 * chk).
The table offsets below are the RANDOM.DAT work buffer's (values read at run time).
"""
from __future__ import annotations

import importlib

from ..constants import randmap as K

# ---------------------------------------------------------------- grid classes
G_BRIDGE, G_WATER, G_SHORE, G_FOREST, G_HILLS, G_MOUNTAINS, G_PLAIN, G_MARSH = 1, 2, 3, 4, 5, 6, 7, 8
G_CITY, G_SITE = 10, 11


def resolve(module: str, func: str, addr: str, package: str):
    """The function `module.func` of this package, looked up when called (the modules of R1 / R2
    may not exist yet); missing -> NotImplementedError naming the address and package.
    Evidence: none needed (module plumbing, as rules.randmap._stage); no game rule."""
    name = "%s.%s" % (__package__, module)
    try:
        mod = importlib.import_module(name)
    except ModuleNotFoundError as e:
        if e.name != name:
            raise
        mod = None
    f = getattr(mod, func, None)
    if f is None:
        raise NotImplementedError("%s: %s.%s (package %s)" % (addr, name, func, package))
    return f


def chk(x: int, y: int) -> int:
    """The checkerboard word of ovl09: 1 when x + y == 0 or (x + y) / 2 != (x + y - 1) / 2
    (C division, truncating), else 0; for x, y >= 0: 1 when x + y is even.
    Evidence: asm ovl09:006b..0091 (also 04af, 05df, 0735, 0841, 09a5, 0a84)."""
    s = x + y
    if s == 0:
        return 1
    return 0 if int(s / 2) == int((s - 1) / 2) else 1


def _w(work, off: int) -> int:
    return work.buf.word(off)


def _lo(work, off: int) -> int:
    """Low byte of a buffer word (the EXE's `and ax, 0xff` before the tile store)."""
    return work.buf.uword(off) & 0xFF


def base_tiles(work) -> None:
    """ovl09:005c: for y 0..0x9b, x 0..0x6f: a grid 10 square whose upper and left neighbours
    are not 10, with x > 0 and y > 0, gets the 2 x 2 city block (b, b + 1 / b + 0x10, b + 0x11,
    b = word +0x6e4); else grid 11 the site tile word +0x724 + 2 chk; other grid 10 squares
    nothing; any other class g the tile word +0x464 + 0x40 g + 2 chk (g sign-extended).  Then
    the squares of SCN sites 0..7 get word +0x728.  Low bytes only; no dice.
    Evidence: asm ovl09:005c..027b (00a0..00e7 the city test, the neighbour reads before the
    x / y tests; 0194..01f6; 0228..0276)."""
    buf, m = work.buf, work.map
    for y in range(K.GRID_H.value):
        for x in range(K.GRID_W.value):
            v = chk(x, y)
            g = buf.grid(x, y)
            if (g == G_CITY and buf.grid(x, y - 1) != G_CITY and buf.grid(x - 1, y) != G_CITY
                    and x > 0 and y > 0):
                b = buf.uword(K.CITY_TILES.value)
                m.set_lo(x, y, b)
                m.set_lo(x + 1, y, b + 1)
                m.set_lo(x, y + 1, b + 0x10)
                m.set_lo(x + 1, y + 1, b + 0x11)
            elif g == G_SITE:
                m.set_lo(x, y, _lo(work, K.SITE_TILES.value + 2 * v))
            elif g == G_CITY:
                pass
            else:
                m.set_lo(x, y, _lo(work, K.TILE_BLOCKS.value + 0x40 * buf.sgrid(x, y) + 2 * v))
    t = _lo(work, K.FIRST_SITE_TILE.value)
    for s in range(K.N_FIRST_SITES.value):
        x = work.scn.word(K.SCN_SITE.value + K.SITE_LEN.value * s)
        y = work.scn.word(K.SCN_SITE_Y.value + K.SITE_LEN.value * s)
        m.set_lo(x, y, t)


def _mask(work, x: int, y: int, hit) -> int:
    """Bit d set when neighbour d (+0xbc table) is off the map or its grid byte satisfies `hit`
    (the off-map square's byte is still read by the EXE, without effect)."""
    buf = work.buf
    out = 0
    for d in range(K.N_DIRS.value):
        dx, dy = buf.dir8(d)
        nx, ny = x + dx, y + dy
        if not buf.in_map(nx, ny) or hit(buf.grid(nx, ny)):
            out |= 1 << d
    return out


def water_mask(work, x: int, y: int) -> int:
    """ovl09:0c9d(x, y): neighbour bits for off-map or grid 2, 3, 1.
    Evidence: asm ovl09:0c9d..0d4e (jl / jge bounds, 0cfc..0d26, shl ax, cl)."""
    return _mask(work, x, y, lambda g: g in K.WATER_SET.value)


def forest_mask(work, x: int, y: int) -> int:
    """ovl09:0d4f(x, y): neighbour bits for off-map or grid 4.
    Evidence: asm ovl09:0d4f..0dca."""
    return _mask(work, x, y, lambda g: g == G_FOREST)


def mountain_mask(work, x: int, y: int) -> int:
    """ovl09:0dcb(x, y): neighbour bits for off-map or grid 6.
    Evidence: asm ovl09:0dcb..0e46."""
    return _mask(work, x, y, lambda g: g == G_MOUNTAINS)


def hill_mask(work, x: int, y: int) -> int:
    """ovl09:0e47(x, y): neighbour bits for off-map or grid 6 or 5.
    Evidence: asm ovl09:0e47..0ee2."""
    return _mask(work, x, y, lambda g: g in K.HILL_SET.value)


def road_mask(work, x: int, y: int) -> int:
    """ovl09:0ee3(x, y): bit d (+0xdc table) for an on-map neighbour with a road piece
    (byte & 0x1f) or a tile of terrain 1 (Bridge, SCN 0x710); off the map no bit.
    Evidence: asm ovl09:0ee3..0f71."""
    buf, m, r, scn = work.buf, work.map, work.roads, work.scn
    out = 0
    for d in range(K.N_DIRS.value):
        dx, dy = buf.point(K.DIR8_ROAD.value + 4 * d)
        nx, ny = x + dx, y + dy
        if not buf.in_map(nx, ny):
            continue
        if (r.at(nx, ny) & K.ROAD_BITS.value
                or scn.byte(K.TERRAIN_TABLE.value + m.lo(nx, ny)) == K.TERRAIN_BRIDGE.value):
            out |= 1 << d
    return out


def _pattern(work, table: int, mask: int) -> int:
    return work.buf.sbyte(table + mask)


def retile(work) -> None:
    """ovl09:0464: five sweeps, each y 0..0x9b outer, x 0..0x6f inner, the grid rewritten in place:
    1. grid 2 / 3: t = pattern[water mask]; t < 0: grid 8, tile +0x664 + 2 chk, marsh spray
       ovl08:0029(x, y), map high bit 7 cleared; else grid 2, tile +0x4e4 + 4 t + 2 chk.
    2. grid 4: t < 0: rnd(1, 10, 0) <= 5 -> tile +0x624 + 2 chk, grid 7; else tile +0x598 +
       2 chk; t >= 0: tile +0x564 + 4 t + 2 chk, grid 4.
    3. grid 6: t < 0: tile +0x5a4 + 2 chk, grid 5; else tile +0x5e4 + 4 t + 2 chk, grid 6.
    4. grid 5: t < 0: rnd(1, 10, 0) <= 5 -> plain as 2; else grid 5, tile +0x5d8 + 2 chk;
       t >= 0: tile +0x5a4 + 4 t + 2 chk, grid 5.
    5. grid 8: rnd(1, 10, 0) <= 6 -> tile +0x664 + 2 chk, else +0x664 + 4 rnd(1, 4, 0); grid 8.
    Evidence: asm ovl09:0464..0a4a (dice 061e, 0880, 09d3, 09ec; spray 052a; 0543)."""
    buf, m, rng = work.buf, work.map, work.rng
    spray = None
    W, H = K.GRID_W.value, K.GRID_H.value
    for y in range(H):                                            # sweep 1: water / shore
        for x in range(W):
            if buf.grid(x, y) not in (G_WATER, G_SHORE):
                continue
            t = _pattern(work, K.PATTERN.value, water_mask(work, x, y))
            v = chk(x, y)
            if t < 0:
                buf.set_grid(x, y, G_MARSH)
                m.set_lo(x, y, _lo(work, K.MARSH_TILES.value + 2 * v))
                if spray is None:
                    spray = resolve("marsh", "spray", "ovl08:0029", "R1")
                spray(work, x, y)
                m.set_hi(x, y, m.hi(x, y) & K.HI_PORT.value)
            else:
                buf.set_grid(x, y, G_WATER)
                m.set_lo(x, y, _lo(work, K.WATER_TILES.value + 4 * t + 2 * v))
    for y in range(H):                                            # sweep 2: forest
        for x in range(W):
            if buf.grid(x, y) != G_FOREST:
                continue
            t = _pattern(work, K.PATTERN.value, forest_mask(work, x, y))
            v = chk(x, y)
            if t < 0:
                if rng.rnd(*K.ROLL_TEN.value) <= K.LONE_PLAIN_MAX.value:
                    m.set_lo(x, y, _lo(work, K.PLAIN_TILES.value + 2 * v))
                    buf.set_grid(x, y, G_PLAIN)
                else:
                    m.set_lo(x, y, _lo(work, K.FOREST_LONE.value + 2 * v))
            else:
                m.set_lo(x, y, _lo(work, K.FOREST_TILES.value + 4 * t + 2 * v))
                buf.set_grid(x, y, G_FOREST)
    for y in range(H):                                            # sweep 3: mountains
        for x in range(W):
            if buf.grid(x, y) != G_MOUNTAINS:
                continue
            t = _pattern(work, K.PATTERN.value, mountain_mask(work, x, y))
            v = chk(x, y)
            if t < 0:
                m.set_lo(x, y, _lo(work, K.HILL_TILES.value + 2 * v))
                buf.set_grid(x, y, G_HILLS)
            else:
                m.set_lo(x, y, _lo(work, K.MOUNTAIN_TILES.value + 4 * t + 2 * v))
                buf.set_grid(x, y, G_MOUNTAINS)
    for y in range(H):                                            # sweep 4: hills
        for x in range(W):
            if buf.grid(x, y) != G_HILLS:
                continue
            t = _pattern(work, K.PATTERN.value, hill_mask(work, x, y))
            v = chk(x, y)
            if t < 0:
                if rng.rnd(*K.ROLL_TEN.value) <= K.LONE_PLAIN_MAX.value:
                    m.set_lo(x, y, _lo(work, K.PLAIN_TILES.value + 2 * v))
                    buf.set_grid(x, y, G_PLAIN)
                else:
                    buf.set_grid(x, y, G_HILLS)
                    m.set_lo(x, y, _lo(work, K.HILL_LONE.value + 2 * v))
            else:
                m.set_lo(x, y, _lo(work, K.HILL_TILES.value + 4 * t + 2 * v))
                buf.set_grid(x, y, G_HILLS)
    for y in range(H):                                            # sweep 5: marsh
        for x in range(W):
            if buf.grid(x, y) != G_MARSH:
                continue
            v = chk(x, y)
            if rng.rnd(*K.ROLL_TEN.value) <= K.MARSH_PLAIN_MAX.value:
                i = 2 * v
            else:
                i = 4 * rng.rnd(*K.MARSH_ROLL.value)
            m.set_lo(x, y, _lo(work, K.MARSH_TILES.value + i))
            buf.set_grid(x, y, G_MARSH)


def tiling(work) -> None:
    """ovl09:0000: `base_tiles` (005c), then `retile` (0464) twice.
    Evidence: asm ovl09:0000..0013 (near calls 005c, 0464, 0464); only caller ovl12:003a."""
    base_tiles(work)
    retile(work)
    retile(work)


def road_tiles(work) -> None:
    """ovl09:0a4b: for y 0..0x9b, x 0..0x6f with a road piece (byte & 0x1f): t = road pattern
    [road mask]; t < 0 (a lone road square): rnd(1, 10, 0) <= 5 -> plain tile +0x624 + 2 chk and
    grid 7, else the tile +0x5d8 + 2 chk (road byte kept); t >= 0: piece := t + 1 (low 5 bits,
    bits 0xe0 kept).  Then twice n = rnd(1, 10, 10) markers: per marker up to 10000 tries of
    x = rnd(1, 0x70, -1), y = rnd(1, 0x9c, -1) until the piece is 2 (marker 0x11) / 1 (0x10).
    Evidence: asm ovl09:0a4b..0c9c (dice 0ac3, 0b87, 0ba8, 0bba, 0c14, 0c35, 0c47)."""
    buf, m, r, rng = work.buf, work.map, work.roads, work.rng
    for y in range(K.GRID_H.value):
        for x in range(K.GRID_W.value):
            if not r.at(x, y) & K.ROAD_BITS.value:
                continue
            mask = road_mask(work, x, y)
            v = chk(x, y)
            t = _pattern(work, K.ROAD_PATTERN.value, mask)
            if t < 0:
                if rng.rnd(*K.ROLL_TEN.value) <= K.LONE_PLAIN_MAX.value:
                    m.set_lo(x, y, _lo(work, K.PLAIN_TILES.value + 2 * v))
                    buf.set_grid(x, y, G_PLAIN)
                else:
                    m.set_lo(x, y, _lo(work, K.HILL_LONE.value + 2 * v))
            else:
                r.set_at(x, y, (r.at(x, y) & K.ROAD_KEEP.value) | ((t + 1) & K.ROAD_BITS.value))
    for roll, piece, marker in K.MARKERS.value:
        n = rng.rnd(*roll)
        for _ in range(n):
            for _ in range(K.MARKER_TRIES.value):
                x = rng.rnd(*K.MARKER_ROLL_X.value)
                y = rng.rnd(*K.MARKER_ROLL_Y.value)
                if r.at(x, y) & K.ROAD_BITS.value == piece:
                    r.set_at(x, y, (r.at(x, y) & K.ROAD_KEEP.value) | marker)
                    break
