"""Stage 30 of the random-map generator: rivers, ovl06:0000 (M11 R1).

`river` (ovl06:005d) is also ovl03's sea channel (edge to edge, wide, ovl03:0daa) and
`cleanup` (ovl06:060c) runs after the channels too.  Grid values: 2 water, 3 shore, 4 forest
(tested only), 5 hills, 6 mountains, 7 land.  Screen-only work (ovl02:03aa) is not modelled.
"""
from __future__ import annotations

import math

from ..constants import Const
from ..constants import randmap as K
from . import Work, clamp, tries
from . import land as L
from . import ridges as RG
from .buffer import Buffer, s16

NARROW_ARGS = Const((0, 1, 0), "asm ovl06:0008..000f: push dword 1; push 0 -> 005d(0, 1, 0)")
WIDE_ARGS = Const((1, 1, 0), "asm ovl06:0024..002b: push dword 1; push 1 -> 005d(1, 1, 0)")
END_TRIES = Const(200, "asm ovl06:00f9 / 0155: cmp si, 0xc8; jl (200 samples, the last kept)")
EDGE_X = Const((0, 0x6F), "asm ovl06:0070 [bp-4] = 0, 0088 [bp-8] = 0x6f")
ROW_ROLL = Const((1, 0x9C, -1), "asm ovl06:0075 / 008d / 00ba / 0116: push 0xffff009c; push 1")
COL_ROLL = Const((1, 0x70, -1), "asm ovl06:00a7 / 0103: push 0xffff0070; push 1")
DRIFT_ROLL = Const((1, 4, 0), "asm ovl06:05a5..05aa: ovl59:02bf(1, 4, 0); 2 -> T[k+2], 3 -> T[k+6]")
GAP_ROLL = Const((1, 10, 0), "asm ovl06:08d9..08de / 0a08..0a0d: ovl59:02bf(1, 10, 0)")
GAP_BELOW = Const(5, "asm ovl06:08e6 / 0a15: cmp ax, 5; jge (the second square)")
GAP_SIDES = Const((5, 4, 7), "asm ovl06:0852..08d7 / 0981..0a06: hills, forest, land (test order)")

_W, _H = K.GRID_W.value, K.GRID_H.value
_N = K.N_DIRS.value
WATER, SHORE, LAND = L.WATER, L.SHORE, L.LAND
_HILLS, _MOUNTAINS = 5, 6


def _crem(a: int, b: int) -> int:
    return int(math.fmod(a, b))


def _put(buf: Buffer, x: int, y: int) -> None:
    """A clamped copy of (x, y) painted water (ovl06:0271.. each `put`)."""
    x, y = clamp(x, y)
    buf.set_grid(x, y, WATER)


def river(work: Work, wide: int, stop_on_water: int, edge: int) -> None:
    """ovl06:005d(wide, stop_on_water, edge).  Ends: `edge` -> (0, rnd(1, 156, -1)) (site
    ovl06:007d) and (0x6f, rnd(1, 156, -1)) (0095); else up to 200 samples (00af, 00c2) for a
    source on hills / mountains, then up to 200 (010b, 011e) for a mouth on water / shore,
    keeping the last sample when none fits.  Walk from the source (never clamped itself): D =
    direction(c, e), k = the last index with dir8(k) == D (-1 if none); with `stop_on_water`
    the square c + dir8(k) (flat, unchecked) holding water ends the river the second time it
    is seen; paint water at clamped copies of c, c +- dir8(k +- 1) (narrow), plus c +-
    2 dir8(k +- 1) (wide), plus c +- 3 dir8(k +- 1) (wide and edge); c += D; c == e ends;
    then always r = rnd(1, 4, 0) (05aa): 2 -> c += dir8(k + 2), 3 -> c += dir8(k + 6).
    Evidence: asm ovl06:005d..060b."""
    buf, rng = work.buf, work.rng
    hits = 0
    if edge:
        sx = EDGE_X.value[0]
        sy = rng.rnd(*ROW_ROLL.value)
        ex = EDGE_X.value[1]
        ey = rng.rnd(*ROW_ROLL.value)
    else:
        for _ in range(END_TRIES.value):
            sx = rng.rnd(*COL_ROLL.value)
            sy = rng.rnd(*ROW_ROLL.value)
            g = buf.grid(sx, sy)
            if g == _HILLS or g == _MOUNTAINS:
                break
        for _ in range(END_TRIES.value):
            ex = rng.rnd(*COL_ROLL.value)
            ey = rng.rnd(*ROW_ROLL.value)
            g = buf.grid(ex, ey)
            if g == WATER or g == SHORE:
                break
    cx, cy = sx, sy
    done = (cx, cy) == (ex, ey)
    for _ in tries("ovl06:005d"):
        if done:
            return
        d = L.direction(cx, cy, ex, ey)
        k = -1
        for i in range(_N):
            if buf.dir8(i) == d:
                k = i
        a, b = buf.dir8(_crem(k + 1, _N)), buf.dir8(_crem(k + 7, _N))
        if stop_on_water:
            tx, ty = buf.dir8(k)
            if buf.grid(s16(cx + tx), s16(cy + ty)) == WATER and hits == 1:
                done = True
            if buf.grid(s16(cx + tx), s16(cy + ty)) == WATER and hits == 0:
                hits += 1
        _put(buf, cx, cy)
        _put(buf, cx + a[0], cy + a[1])
        _put(buf, cx + b[0], cy + b[1])
        if wide:
            _put(buf, cx + 2 * a[0], cy + 2 * a[1])
            _put(buf, cx + 2 * b[0], cy + 2 * b[1])
            if edge:
                _put(buf, cx + 3 * a[0], cy + 3 * a[1])
                _put(buf, cx + 3 * b[0], cy + 3 * b[1])
        cx, cy = s16(cx + d[0]), s16(cy + d[1])
        if (cx, cy) == (ex, ey):
            done = True
        r = rng.rnd(*DRIFT_ROLL.value)
        if r == 2:
            t = buf.dir8(_crem(k + 2, _N))
            cx, cy = s16(cx + t[0]), s16(cy + t[1])
        elif r == 3:
            t = buf.dir8(_crem(k + 6, _N))
            cx, cy = s16(cx + t[0]), s16(cy + t[1])


def cleanup(work: Work) -> None:
    """ovl06:060c.  Pass 1 (x outer 0..0x6f, y inner 0..0x9b, in place): land, hills or
    mountains with >= 3 of the four flat neighbours (y + 1, y - 1, x + 1, x - 1; unchecked,
    stand-in X61) water or shore -> water.  Pass 2: shore with no land / hills / mountains
    8-neighbour (ovl03:11f5) -> water.  Pass 3 (x 1..0x6e, y 1..0x9a): on water / shore, if
    (x+1, y+1) and (x-1, y-1) are water / shore and (x+1, y-1), (x-1, y+1) are hills / forest /
    land: rnd(1, 10, 0) < 5 (site ovl06:08de) -> (x+1, y-1) shore, else (x-1, y+1); otherwise
    the mirror test with rnd at 0a0d: (x-1, y-1) shore, else (x+1, y+1).
    Evidence: asm ovl06:060c..0a6e."""
    buf, rng = work.buf, work.rng
    wet = (SHORE, WATER)
    for x in range(_W):
        for y in range(_H):
            g = buf.grid(x, y)
            if g == LAND or g == _HILLS or g == _MOUNTAINS:
                n = ((buf.grid(x, y + 1) in wet) + (buf.grid(x, y - 1) in wet)
                     + (buf.grid(x + 1, y) in wet) + (buf.grid(x - 1, y) in wet))
                if n >= 3:
                    buf.set_grid(x, y, WATER)
    for x in range(_W):
        for y in range(_H):
            if (buf.grid(x, y) == SHORE and not buf.nb8(x, y, LAND) and not buf.nb8(x, y, _HILLS)
                    and not buf.nb8(x, y, _MOUNTAINS)):
                buf.set_grid(x, y, WATER)
    sides = GAP_SIDES.value
    roll, below = GAP_ROLL.value, GAP_BELOW.value
    for x in range(1, _W - 1):
        for y in range(1, _H - 1):
            if buf.grid(x, y) not in (WATER, SHORE):
                continue
            if (buf.grid(x + 1, y + 1) in (WATER, SHORE) and buf.grid(x - 1, y - 1) in (WATER, SHORE)
                    and buf.grid(x + 1, y - 1) in sides and buf.grid(x - 1, y + 1) in sides):
                if rng.rnd(*roll) < below:
                    buf.set_grid(x + 1, y - 1, SHORE)
                else:
                    buf.set_grid(x - 1, y + 1, SHORE)
            elif (buf.grid(x - 1, y + 1) in (WATER, SHORE) and buf.grid(x + 1, y - 1) in (WATER, SHORE)
                    and buf.grid(x - 1, y - 1) in sides and buf.grid(x + 1, y + 1) in sides):
                if rng.rnd(*roll) < below:
                    buf.set_grid(x - 1, y - 1, SHORE)
                else:
                    buf.set_grid(x + 1, y + 1, SHORE)


def rivers(work: Work) -> None:
    """ovl06:0000 (stage 30): while word +0x3a > i: river(0, 1, 0) (narrow); while word +0x38 >
    i: river(1, 1, 0) (wide); cleanup; ovl03:0ce7 shore; ovl04:002e smooth; ovl04:033a hill
    ring; cleanup; shore.  Returns None (no progress of its own).
    Evidence: asm ovl06:0000..005c."""
    buf = work.buf
    i = 0
    while buf.word(K.NARROW_RIVERS.value) > i:
        river(work, *NARROW_ARGS.value)
        i += 1
    i = 0
    while buf.word(K.WIDE_RIVERS.value) > i:
        river(work, *WIDE_ARGS.value)
        i += 1
    cleanup(work)
    L.shore(buf)
    RG.smooth(work)
    RG.hill_ring(buf)
    cleanup(work)
    L.shore(buf)
