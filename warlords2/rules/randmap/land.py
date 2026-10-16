"""Stage 0 of the random-map generator: the continent, ovl03:0000 (M11 R1).

Four coast sides (vertex walks between jittered corner points), the sea fill, the shore
ring, and 0..2 sea channels (ovl06:005d edge to edge).  Grid values (terrain ids, DS:01e0
order): 2 water (the ovl02:036b start), 7 land, 3 shore, 0 "unknown" inside `fill_sea` only.

Also the ovl03 helpers other stages call: `direction` (0dd0, ovl04 / 06 / 07), `cheb` (0fed),
`rotate` (104a, ovl04:09a7), `shore` (0ce7, ovl06).  ovl03:11f5 / 117d are `Buffer.nb8`.

Scratch words of RANDOM.DAT written here (in the buffer, never saved): START +0x244, END
+0x254 (a point per side), CNT +0xfc (word per side), the vertex lists +0x104 (0x50 per side).
Screen-only work (ovl02:03aa preview pixels, ovl02:0449 redraw) is not modelled.
"""
from __future__ import annotations

import math
from fractions import Fraction

from ...model.ids import Terrain
from ..constants import randmap as K
from . import Work, clamp, jitter, tries
from .buffer import Buffer, s16

_W, _H = K.GRID_W.value, K.GRID_H.value
_XMAX, _YMAX = _W - 1, _H - 1
LAND, WATER, SHORE = int(Terrain.PLAIN), int(Terrain.WATER), int(Terrain.SHORE)
_BRIDGE, _HILLS, _MOUNTAINS = int(Terrain.BRIDGE), int(Terrain.HILLS), int(Terrain.MOUNTAINS)
_UNKNOWN = 0                                     # fill_sea's temporary value (ovl03:08ae)


# ---------------------------------------------------------------- the x87 arithmetic


def _round_bits(q: Fraction, bits: int) -> Fraction:
    """q rounded to `bits` significant bits, to nearest, ties to even (the FPU's rounding)."""
    if q == 0:
        return q
    a = abs(q)
    e = a.numerator.bit_length() - a.denominator.bit_length()
    if a < Fraction(2) ** e:
        e -= 1
    scale = Fraction(2) ** (bits - 1 - e)
    r = Fraction(round(a * scale)) / scale
    return r if q > 0 else -r


def fpu_quotient(a: int, b: int, bits: int) -> Fraction:
    """`fild a; fild b; fdivp st(1)`: a / b rounded to the 64-bit mantissa of the precision
    control Borland sets (CW 0x1332), then the store: `fstp dword` (bits 24) or `fstp qword`
    (bits 53).  b == 0 raises ZeroDivisionError (the zero-divide exception is unmasked in that
    control word: the EXE aborts) [I]; unreachable with the shipped RANDOM.DAT: 0206 divides by
    0x4e - y of a START / END point, whose y lies in 0..26 or 129..155 (never 0x4e), and 0dd0
    only when x1 != x2 (review M11 R1).
    Evidence: asm ovl03:0241..0257 (0206) and 0e49..0e5d (0dd0), FPU bytes re-disassembled
    (int 34h..3Dh -> 9B D8..DF); 64-then-24-bit precedent ui/dialogs/history.f32_div."""
    return _round_bits(_round_bits(Fraction(a, b), 64), bits)


def _not_below(dy: int, dx: int, c: float) -> bool:
    """`fld qword s; fcomp qword c; jb` not taken, s = double(dy / dx) through the 64-bit
    quotient.  Rounding is monotone and c is representable, so the float64 quotient decides
    unless it lies within 1e-9 of c; then the exact emulation does."""
    q = dy / dx
    if abs(q - c) > 1e-9:
        return q >= c
    return fpu_quotient(dy, dx, 53) >= Fraction(c)


# ---------------------------------------------------------------- small helpers of ovl03


def direction(x1: int, y1: int, x2: int, y2: int) -> tuple[int, int]:
    """ovl03:0dd0(x1, y1, x2, y2, &out): the 8-way unit step from (x1, y1) towards (x2, y2).
    Same x: (0, 0) / (0, -1) / (0, 1); same y: (-1, 0) / (1, 0); else the slope
    s = (y2 - y1) / (x2 - x1) (double) against 2.414, 0.414, -0.414, -2.414 (DS:0292..02aa;
    `jb` = below, so equality counts as at least): westwards (x1 > x2) (0, -1), (-1, -1),
    (-1, 0), (-1, 1), else (0, 1); eastwards (0, 1), (1, 1), (1, 0), (1, -1), else (0, -1).
    Evidence: asm ovl03:0dd0..0fec, FPU bytes re-disassembled (M11 A1 / A2: 0e48..0fe6, the
    ten exits via 116d:000e(out, x, y))."""
    if x2 == x1:
        if y1 == y2:
            return 0, 0
        return (0, -1) if y1 > y2 else (0, 1)
    if y2 == y1:
        return (-1, 0) if x1 > x2 else (1, 0)
    dy, dx = s16(y2 - y1), s16(x2 - x1)
    c1, c2, c3, c4 = K.SLOPES.value
    if x1 > x2:
        if _not_below(dy, dx, c1):
            return 0, -1
        if _not_below(dy, dx, c2):
            return -1, -1
        if _not_below(dy, dx, c3):
            return -1, 0
        if _not_below(dy, dx, c4):
            return -1, 1
        return 0, 1
    if _not_below(dy, dx, c1):
        return 0, 1
    if _not_below(dy, dx, c2):
        return 1, 1
    if _not_below(dy, dx, c3):
        return 1, 0
    if _not_below(dy, dx, c4):
        return 1, -1
    return 0, -1


def cheb(x1: int, y1: int, x2: int, y2: int) -> int:
    """ovl03:0fed(x1, y1, x2, y2): max(|x1 - x2|, |y1 - y2|) (16-bit).
    Evidence: asm ovl03:0fed..1015 (cwd / xor / sub abs, jle picks the larger)."""
    return max(abs(s16(x1 - x2)), abs(s16(y1 - y2)))


def side_of(x: int, y: int) -> int:
    """ovl03:1016(x, y): x == 0 -> 3, else y == 0 -> 0, else x == 0x6f -> 1, else y == 0x9b ->
    2, else -1 (so the corners (0, 0) and (0, 0x9b) are side 3, (0x6f, 0) side 0).
    Evidence: asm ovl03:1016..1049."""
    if x == 0:
        return 3
    if y == 0:
        return 0
    if x == _XMAX:
        return 1
    if y == _YMAX:
        return 2
    return -1


def on_border(x: int, y: int) -> bool:
    """x == 0 or y == 0 or x == 0x6f or y == 0x9b: the inline test of ovl03:0386 / 05e8 / 10f6.
    Evidence: asm ovl03:0391..03b0, 05e8..063d, 10f6..1107."""
    return x == 0 or y == 0 or x == _XMAX or y == _YMAX


def _crem(a: int, b: int) -> int:
    """C `%` (idiv remainder, sign of the dividend)."""
    return int(math.fmod(a, b))


def _cdiv(a: int, b: int) -> int:
    """C `/` on ints (idiv quotient, truncated toward zero)."""
    q = abs(a) // abs(b)
    return q if (a < 0) == (b < 0) else -q


def rotate(work: Work, d: tuple[int, int]) -> tuple[int, int]:
    """ovl03:104a(&d): c = the first k in 0..7 with dir8(k) == d (8 if none); r = rnd(1, 5,
    c - 2) (site ovl03:1091); d = the buffer's point at +0xbc + 4 (r % 8) with C's remainder,
    so r == -1 reads +0xb8 (the shipped file holds (-1, 1) there, = dir8(7)).
    Evidence: asm ovl03:104a..10bc (0f80 loop, 1087 add ax, 0xfffe, 109e idiv 8, 10ae read)."""
    buf = work.buf
    c = K.N_DIRS.value
    for k in range(K.N_DIRS.value):
        if buf.dir8(k) == d:
            c = k
            break
    r = work.rng.rnd(1, K.ROT_SIDES.value, c - 2)
    return buf.dir8(_crem(r, K.N_DIRS.value))


def shore(buf: Buffer) -> None:
    """ovl03:0ce7: x outer 0..0x6f, y inner 0..0x9b, in place: a water square (2) with a land
    (7, ovl03:117d), hills (5) or mountains (6) neighbour (ovl03:11f5) becomes shore (3); the
    three tests run one after the other on the same square.
    Evidence: asm ovl03:0ce7..0da9."""
    for x in range(_W):
        for y in range(_H):
            if buf.grid(x, y) != WATER:
                continue
            if buf.nb8(x, y, LAND):
                buf.set_grid(x, y, SHORE)
            if buf.nb8(x, y, _HILLS):
                buf.set_grid(x, y, SHORE)
            if buf.nb8(x, y, _MOUNTAINS):
                buf.set_grid(x, y, SHORE)


# ---------------------------------------------------------------- the outline


def _vert(s: int, j: int) -> int:
    return K.VERTS.value + K.VERTS_STRIDE.value * s + 4 * j


def side_ends(work: Work, s: int) -> None:
    """ovl03:0087(s): side s's START / END points.  NV[s] <= 2 (signed): START = SIDE[s].a,
    END = SIDE[s].b, no dice.  Else START = jitter(SIDE[s].a - 10 INSET[s], 16, edge 1) and
    END = jitter(SIDE[s].b - 10 INSET[(s + 1) % 4], 16, 1), each painted land.
    Evidence: asm ovl03:0087..0205 (jitter calls ovl03:013f, 01c7)."""
    buf, rng = work.buf, work.rng
    d = (s + 1) % 4
    if buf.word(K.NV.value + 2 * s) <= 2:
        buf.set_point(K.START.value + 4 * s, *buf.point(K.SIDE_A.value + 8 * s))
        buf.set_point(K.END.value + 4 * s, *buf.point(K.SIDE_B.value + 8 * s))
        return
    step, edge = K.END_JITTER.value
    for seed, inset, out in ((K.SIDE_A, s, K.START), (K.SIDE_B, d, K.END)):
        x, y = buf.point(seed.value + 8 * s)
        ix, iy = buf.point(K.INSET.value + 4 * inset)
        x = s16(x + s16(-ix * K.INSET_MUL.value))
        y = s16(y + s16(-iy * K.INSET_MUL.value))
        x, y = jitter(rng, x, y, step, edge)
        buf.set_grid(x, y, LAND)
        buf.set_point(out.value + 4 * s, x, y)


def fix_corners(buf: Buffer) -> None:
    """ovl03:0206: for each side s with d = (s + 1) % 4: a = float32((56 - END[s].x) /
    (78 - END[s].y)), b = the same for START[d]; when b > a the two points swap.
    Evidence: asm ovl03:0206..02f8, FPU bytes re-disassembled (fild / fdivp / fstp dword,
    fld b; fcomp a; jbe = no swap)."""
    cx, cy = K.CENTRE.value
    for s in range(4):
        d = (s + 1) % 4
        ex, ey = buf.point(K.END.value + 4 * s)
        a = fpu_quotient(s16(cx - ex), s16(cy - ey), 24)
        sx, sy = buf.point(K.START.value + 4 * d)
        b = fpu_quotient(s16(cx - sx), s16(cy - sy), 24)
        if b > a:
            buf.set_point(K.END.value + 4 * s, sx, sy)
            buf.set_point(K.START.value + 4 * d, ex, ey)


def side_vertices(work: Work, s: int) -> None:
    """ovl03:02f9(s): the vertex list of side s.  V[0] = START, CNT = 1.  NV[s] <= 2 or both
    ends on the border: V[1] = END, CNT = 2.  Else L = cheb(END, START) / (NV - 1); repeat:
    p = V[k] + direction(V[k], END) * L, jitter(p, L / 2, edge 0) (site ovl03:04b7), painted
    land, appended; stop when cheb(END, p) < L or CNT >= NV - 1; then END appended.
    Evidence: asm ovl03:02f9..05c6."""
    buf, rng = work.buf, work.rng
    cnt = K.CNT.value + 2 * s
    buf.set_point(_vert(s, 0), *buf.point(K.START.value + 4 * s))
    buf.set_word(cnt, 1)
    nv = buf.word(K.NV.value + 2 * s)
    sx, sy = buf.point(K.START.value + 4 * s)
    ex, ey = buf.point(K.END.value + 4 * s)
    if nv <= 2 or (on_border(sx, sy) and on_border(ex, ey)):
        buf.set_word(cnt, buf.word(cnt) + 1)
        buf.set_point(_vert(s, 1), ex, ey)
        return
    length = _cdiv(cheb(ex, ey, sx, sy), nv - 1)
    k = 0
    while True:
        vx, vy = buf.point(_vert(s, k))
        ex, ey = buf.point(K.END.value + 4 * s)
        dx, dy = direction(vx, vy, ex, ey)
        px, py = s16(vx + s16(dx * length)), s16(vy + s16(dy * length))
        px, py = jitter(rng, px, py, _cdiv(length, 2), 0)
        k += 1
        buf.set_grid(px, py, LAND)
        buf.set_point(_vert(s, k), px, py)
        buf.set_word(cnt, buf.word(cnt) + 1)
        if cheb(*buf.point(K.END.value + 4 * s), *buf.point(_vert(s, k))) < length:
            break
        if buf.word(cnt) >= buf.word(K.NV.value + 2 * s) - 1:
            break
    k += 1
    buf.set_point(_vert(s, k), *buf.point(K.END.value + 4 * s))
    buf.set_word(cnt, buf.word(cnt) + 1)


def walk(work: Work, a: tuple[int, int], b: tuple[int, int]) -> None:
    """ovl03:0a0e(A, B): the random coast walk.  prev = direction(A, B); per step d =
    direction(cur, B); within cheb 3 of B step d, else r = rnd(1, 3, 0) (site ovl03:0a74):
    1 step d, 2 step prev, 3 d = rotate(d) (site ovl03:1091), step d, prev = d; clamp, paint
    land; until cur == B.  A itself is not painted.
    Evidence: asm ovl03:0a0e..0b0d."""
    buf, rng = work.buf, work.rng
    cx, cy = a
    bx, by = b
    prev = direction(cx, cy, bx, by)
    for _ in tries("ovl03:0a0e"):
        d = direction(cx, cy, bx, by)
        if cheb(cx, cy, bx, by) < K.LAND_NEAR.value:
            step = d
        else:
            r = rng.rnd(*K.WALK_ROLL.value)
            if r == 1:
                step = d
            elif r == 2:
                step = prev
            elif r == 3:
                step = prev = rotate(work, d)
            else:
                step = (0, 0)
        cx, cy = clamp(s16(cx + step[0]), s16(cy + step[1]))
        buf.set_grid(cx, cy, LAND)
        if (cx, cy) == (bx, by):
            return


def _straight(buf: Buffer, a: tuple[int, int], b: tuple[int, int], site: str) -> None:
    """A run of one direction (taken once) from a to b, b painted, a not: clamp, paint land."""
    dx, dy = direction(*a, *b)
    cx, cy = a
    for _ in tries(site):
        if (cx, cy) == b:
            return
        cx, cy = clamp(s16(cx + dx), s16(cy + dy))
        buf.set_grid(cx, cy, LAND)


def border_run(work: Work, a: tuple[int, int], b: tuple[int, int]) -> None:
    """ovl03:0b0e(A, B), both on the border: same side (ovl03:1016): a straight run A -> B;
    opposite sides (|sA - sB| == 2): `walk`; else to the shared corner CORNER[c] (c = 0 when
    |sA - sB| == 3, else max(sA, sB)) straight from A, then straight from B.
    Evidence: asm ovl03:0b0e..0ce6."""
    buf = work.buf
    sa, sb = side_of(*a), side_of(*b)
    if sa == sb:
        _straight(buf, a, b, "ovl03:0b55")
        return
    diff = abs(sa - sb)
    if diff == 2:
        walk(work, a, b)
        return
    c = 0 if diff == 3 else max(sa, sb)
    corner = buf.point(K.CORNER.value + 4 * c)
    _straight(buf, a, corner, "ovl03:0c26")
    _straight(buf, b, corner, "ovl03:0c94")


def _segment(work: Work, a: tuple[int, int], b: tuple[int, int]) -> None:
    if on_border(*a) and on_border(*b):
        border_run(work, a, b)
    else:
        walk(work, a, b)


def draw_outline(work: Work) -> None:
    """ovl03:05c7: per side s, the segments V[s][j] -> V[s][j + 1] (j < CNT - 1), then V[s][last]
    -> V[(s + 1) % 4][0]; a segment with both ends on the border is `border_run`, else `walk`.
    Evidence: asm ovl03:05c7..0866."""
    buf = work.buf
    for s in range(4):
        j = 0
        while buf.word(K.CNT.value + 2 * s) - 1 > j:
            _segment(work, buf.point(_vert(s, j)), buf.point(_vert(s, j + 1)))
            j += 1
        _segment(work, buf.point(_vert(s, j)), buf.point(_vert((s + 1) % 4, 0)))


# ---------------------------------------------------------------- the sea


def fill_ok(buf: Buffer, x: int, y: int) -> int:
    """ovl03:10bd(x, y): 0 on shore (3) or bridge (1); 1 on a border square holding 0; else 1
    when (x + 1, y), (x - 1, y), (x, y + 1) or (x, y - 1) holds water (2), read by flat index
    without a bounds check (x +- 1 wraps rows; row -1 / 0x9c read RANDOM.DAT scratch / past
    the buffer: stand-in X61).
    Evidence: asm ovl03:10bd..117c."""
    g = buf.grid(x, y)
    if g == SHORE or g == _BRIDGE:
        return 0
    if on_border(x, y) and g == _UNKNOWN:
        return 1
    if (buf.grid(x + 1, y) == WATER or buf.grid(x - 1, y) == WATER
            or buf.grid(x, y + 1) == WATER or buf.grid(x, y - 1) == WATER):
        return 1
    return 0


def fill_sea(buf: Buffer) -> None:
    """ovl03:0867: land (7) -> 3, everything else -> 0; then twice the four in-place sweeps
    (x outer up, y outer up, x outer down, y outer down; inner loop the other axis in the same
    sense) writing water where `fill_ok`; then water stays water, all else -> land.  Not a
    flood fill: pockets the sweeps miss become land.
    Evidence: asm ovl03:0867..0a0d."""
    for x in range(_W):
        for y in range(_H):
            buf.set_grid(x, y, SHORE if buf.grid(x, y) == LAND else _UNKNOWN)
    xs, ys = range(_W), range(_H)
    for _ in range(K.SWEEPS.value):
        for x in xs:
            for y in ys:
                if fill_ok(buf, x, y):
                    buf.set_grid(x, y, WATER)
        for y in ys:
            for x in xs:
                if fill_ok(buf, x, y):
                    buf.set_grid(x, y, WATER)
        for x in reversed(xs):
            for y in reversed(ys):
                if fill_ok(buf, x, y):
                    buf.set_grid(x, y, WATER)
        for y in reversed(ys):
            for x in reversed(xs):
                if fill_ok(buf, x, y):
                    buf.set_grid(x, y, WATER)
    for x in range(_W):
        for y in range(_H):
            buf.set_grid(x, y, WATER if buf.grid(x, y) == WATER else LAND)


def channels(work: Work, n: int) -> None:
    """ovl03:0daa(n): n times ovl06:005d(1, 0, 1) (a wide edge-to-edge sea channel), then
    ovl06:060c once (also for n == 0).
    Evidence: asm ovl03:0daa..0dcf."""
    from . import rivers                   # ovl06 calls back into this module (direction)
    i = 0
    while i < n:
        rivers.river(work, *K.CHANNEL_ARGS.value)
        i += 1
    rivers.cleanup(work)


# ---------------------------------------------------------------- the stage


def continent(work: Work) -> None:
    """ovl03:0000 (stage 0, after ovl02:036b): side_ends(0..3), fix_corners, side_vertices(0..3),
    draw_outline, fill_sea, shore; rnd(1, 100, 0) < 50 (site ovl03:005c) -> channels(rnd(1, 3,
    -1)) (site ovl03:0071); shore again.  No progress of its own (returns None).
    Evidence: asm ovl03:0000..0086."""
    buf, rng = work.buf, work.rng
    for s in range(4):
        side_ends(work, s)
    fix_corners(buf)
    for s in range(4):
        side_vertices(work, s)
    draw_outline(work)
    fill_sea(buf)
    shore(buf)
    if rng.rnd(*K.CHANNEL_ROLL.value) < K.CHANNEL_BELOW.value:
        channels(work, rng.rnd(*K.CHANNEL_COUNT.value))
    shore(buf)
