"""Stage 40 of the random-map generator: forests, ovl05:0000 (M11 R1).

Blobs of forest (grid 4) on land (7) until the counter word +0x1f52 reaches the target +0x1f54
= (land squares / 100) * word +0x3c (slider 3).  Both counters live in the RANDOM.DAT buffer.
Screen-only work (ovl02:03aa) is not modelled.
"""
from __future__ import annotations

import math

from ..constants import randmap as K
from . import Work, clamp, tries
from . import land as L
from .buffer import Buffer


_W, _H = K.GRID_W.value, K.GRID_H.value
_N = K.N_DIRS.value
LAND, FOREST, HILLS, MOUNTAINS = L.LAND, 4, 5, 6


def _crem(a: int, b: int) -> int:
    return int(math.fmod(a, b))


def _cdiv(a: int, b: int) -> int:
    q = abs(a) // abs(b)
    return q if (a < 0) == (b < 0) else -q


def _grow(buf: Buffer, x: int, y: int) -> None:
    """Land -> forest and the counter + 1 (ovl05:01f1.. and its two copies)."""
    if buf.grid(x, y) == LAND:
        buf.set_grid(x, y, FOREST)
        buf.set_word(K.PLACED.value, buf.word(K.PLACED.value) + 1)


def forest_init(buf: Buffer) -> None:
    """ovl05:001f: n = squares holding land, hills or mountains (x outer, y inner); word +0x1f54
    = (n / 100) * word +0x3c (16-bit), word +0x1f52 = 0.
    Evidence: asm ovl05:001f..0098."""
    n = 0
    for x in range(_W):
        for y in range(_H):
            g = buf.grid(x, y)
            if g == LAND or g == HILLS or g == MOUNTAINS:
                n += 1
    buf.set_word(K.TARGET.value, _cdiv(n, K.PER.value) * buf.word(K.FOREST_DENSITY.value))
    buf.set_word(K.PLACED.value, 0)


def forest_done(buf: Buffer) -> bool:
    """ovl05:0099: word +0x1f52 >= word +0x1f54 (signed).
    Evidence: asm ovl05:0099..00b4."""
    return buf.word(K.PLACED.value) >= buf.word(K.TARGET.value)


def forest_blob(work: Work) -> None:
    """ovl05:00b5: (x, y) = (rnd(1, 112, -1), rnd(1, 156, -1)) until land (sites 00c9 / 00dc;
    unbounded, `tries`); rnd(1, 100, 0) < 65 (0107) -> 8 lengths rnd(1, 8, 2) (0120), A = 4,
    B = 2, else 8 x rnd(1, 10, 5) (0152), A = 6, B = 4; the seed square forest, counter + 1;
    per direction d: L[d] steps p += dir8(d) (clamped, kept clamped) growing p; at step k
    (1-based) n1 = rnd(1, A - k / 2, B - k / 4) (0271), n2 = rnd(1, A - k / 2, B - k / 3)
    (029b) (sides 0: no draw; negative: one draw), then n1 squares from p along dir8(d + 2)
    and n2 along dir8(d + 6), each clamped and grown.
    Evidence: asm ovl05:00b5..03d8."""
    buf, rng = work.buf, work.rng
    for _ in tries("ovl05:00c9"):
        x = rng.rnd(*K.FOREST_COL_ROLL.value)
        y = rng.rnd(*K.FOREST_ROW_ROLL.value)
        if buf.grid(x, y) == LAND:
            break
    roll, a_, b_ = K.SMALL.value if rng.rnd(*K.SHAPE_ROLL.value) < K.SHAPE_BELOW.value else K.LARGE.value
    lengths = [rng.rnd(*roll) for _ in range(_N)]
    buf.set_grid(x, y, FOREST)
    buf.set_word(K.PLACED.value, buf.word(K.PLACED.value) + 1)
    for d in range(_N):
        px, py = x, y
        k = 0
        step = 0
        while lengths[d] > step:
            tx, ty = buf.dir8(d)
            px, py = clamp(px + tx, py + ty)
            _grow(buf, px, py)
            sa = buf.dir8(_crem(d + 2, _N))
            sb = buf.dir8(_crem(d + 6, _N))
            k += 1
            n1 = rng.rnd(1, a_ - _cdiv(k, 2), b_ - _cdiv(k, 4))
            n2 = rng.rnd(1, a_ - _cdiv(k, 2), b_ - _cdiv(k, 3))
            qx, qy = px, py
            for _ in range(n1):
                qx, qy = clamp(qx + sa[0], qy + sa[1])
                _grow(buf, qx, qy)
            qx, qy = px, py
            for _ in range(n2):
                qx, qy = clamp(qx + sb[0], qy + sb[1])
                _grow(buf, qx, qy)
            step += 1


def forest_fill(work: Work) -> None:
    """ovl05:03d9.  Pass 1 (x outer 0..0x6f, y inner 0..0x9b, in place): land with >= 3 of the
    four flat neighbours (y + 1, y - 1, x + 1, x - 1; unchecked, stand-in X61) forest ->
    forest, counter + 1.  Pass 2 (x 1..0x6e, y 1..0x9a) on forest: (x+1, y+1), (x-1, y-1)
    forest and (x+1, y-1), (x-1, y+1) hills / shore / land: rnd(1, 10, 0) < 5 (site 057c) ->
    (x+1, y-1) forest, else (x-1, y+1); otherwise the mirror test (067f): (x-1, y-1), else
    (x+1, y+1).  No counter in pass 2.
    Evidence: asm ovl05:03d9..06e0."""
    buf, rng = work.buf, work.rng
    for x in range(_W):
        for y in range(_H):
            if buf.grid(x, y) != LAND:
                continue
            n = ((buf.grid(x, y + 1) == FOREST) + (buf.grid(x, y - 1) == FOREST)
                 + (buf.grid(x + 1, y) == FOREST) + (buf.grid(x - 1, y) == FOREST))
            if n >= 3:
                buf.set_grid(x, y, FOREST)
                buf.set_word(K.PLACED.value, buf.word(K.PLACED.value) + 1)
    sides = K.FOREST_MEND_SIDES.value
    roll, below = K.FOREST_MEND_ROLL.value, K.FOREST_MEND_BELOW.value
    for x in range(1, _W - 1):
        for y in range(1, _H - 1):
            if buf.grid(x, y) != FOREST:
                continue
            if (buf.grid(x + 1, y + 1) == FOREST and buf.grid(x - 1, y - 1) == FOREST
                    and buf.grid(x + 1, y - 1) in sides and buf.grid(x - 1, y + 1) in sides):
                if rng.rnd(*roll) < below:
                    buf.set_grid(x + 1, y - 1, FOREST)
                else:
                    buf.set_grid(x - 1, y + 1, FOREST)
            elif (buf.grid(x - 1, y + 1) == FOREST and buf.grid(x + 1, y - 1) == FOREST
                    and buf.grid(x - 1, y - 1) in sides and buf.grid(x + 1, y + 1) in sides):
                if rng.rnd(*roll) < below:
                    buf.set_grid(x - 1, y - 1, FOREST)
                else:
                    buf.set_grid(x + 1, y + 1, FOREST)


def forests(work: Work) -> None:
    """ovl05:0000 (stage 40): forest_init; while not forest_done: forest_blob, forest_fill
    (tested before the first blob).  Returns None.
    Evidence: asm ovl05:0000..001e."""
    forest_init(work.buf)
    while not forest_done(work.buf):
        forest_blob(work)
        forest_fill(work)
