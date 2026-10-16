"""Stages 10 and 20 of the random-map generator: mountain / hill ridges (ovl04:0000) and the
straight passes / valleys (ovl07:0000) (M11 R1).

Seed records live in the RANDOM.DAT buffer (+0x5dd6, 14 bytes each: x, y, type, nlinks,
links[3]; count word +0x611e) and are read back live, because the ridge painter's unclamped
side squares can overwrite them (rows -1..-3 of the grid alias +0x5fd0..0x611f).
Grid values: 7 land, 6 mountains, 5 hills, 3 shore.  Screen-only work (ovl02:03aa) is not
modelled.  `smooth` (ovl04:002e) and `hill_ring` (033a) also run in stage 30 (ovl06).
"""
from __future__ import annotations

import math

from ..constants import randmap as K
from . import Work, clamp, tries
from . import land as L
from .buffer import Buffer, s16


_W, _H = K.GRID_W.value, K.GRID_H.value
_N = K.N_DIRS.value
LAND, SHORE, HILLS, MOUNTAINS = L.LAND, L.SHORE, 5, 6


def _crem(a: int, b: int) -> int:
    return int(math.fmod(a, b))


def _rec(n: int) -> int:
    return K.SEEDS.value + K.SEED_SIZE.value * n


# ---------------------------------------------------------------- ovl04 helpers


def smooth(work: Work) -> None:
    """ovl04:002e.  Pass 1 (x outer 0..0x6f, y inner 0..0x9b, in place): a non-border land
    square whose four flat neighbours (y + 1, x + 1, x - 1, y - 1) are all mountains becomes
    mountains, then (same square) all hills -> hills; then any mountains square with a shore
    8-neighbour (ovl03:11f5) becomes land (border squares too).  Pass 2 (x 1..0x6e, y
    1..0x9a) on mountains: (x+1, y+1), (x-1, y-1) mountains and (x+1, y-1), (x-1, y+1) not:
    rnd(1, 10, 0) <= 5 (site ovl04:0233) -> (x+1, y-1) mountains, else (x-1, y+1); otherwise
    the mirror test (site 02d8): (x-1, y-1), else (x+1, y+1).
    Evidence: asm ovl04:002e..0339."""
    buf, rng = work.buf, work.rng
    for x in range(_W):
        for y in range(_H):
            if not L.on_border(x, y) and buf.grid(x, y) == LAND:
                if (buf.grid(x, y + 1) == MOUNTAINS and buf.grid(x + 1, y) == MOUNTAINS
                        and buf.grid(x - 1, y) == MOUNTAINS and buf.grid(x, y - 1) == MOUNTAINS):
                    buf.set_grid(x, y, MOUNTAINS)
                if (buf.grid(x, y + 1) == HILLS and buf.grid(x + 1, y) == HILLS
                        and buf.grid(x - 1, y) == HILLS and buf.grid(x, y - 1) == HILLS):
                    buf.set_grid(x, y, HILLS)
            if buf.grid(x, y) == MOUNTAINS and buf.nb8(x, y, SHORE):
                buf.set_grid(x, y, LAND)
    roll, top = K.RIDGE_MEND_ROLL.value, K.RIDGE_MEND_MAX.value
    for x in range(1, _W - 1):
        for y in range(1, _H - 1):
            if buf.grid(x, y) != MOUNTAINS:
                continue
            if (buf.grid(x + 1, y + 1) == MOUNTAINS and buf.grid(x - 1, y - 1) == MOUNTAINS
                    and buf.grid(x + 1, y - 1) != MOUNTAINS and buf.grid(x - 1, y + 1) != MOUNTAINS):
                if rng.rnd(*roll) <= top:
                    buf.set_grid(x + 1, y - 1, MOUNTAINS)
                else:
                    buf.set_grid(x - 1, y + 1, MOUNTAINS)
            elif (buf.grid(x - 1, y + 1) == MOUNTAINS and buf.grid(x + 1, y - 1) == MOUNTAINS
                    and buf.grid(x - 1, y - 1) != MOUNTAINS and buf.grid(x + 1, y + 1) != MOUNTAINS):
                if rng.rnd(*roll) <= top:
                    buf.set_grid(x - 1, y - 1, MOUNTAINS)
                else:
                    buf.set_grid(x + 1, y + 1, MOUNTAINS)


def hill_ring(buf: Buffer) -> None:
    """ovl04:033a: x outer, y inner, in place: a square that is neither mountains nor hills and
    has a mountains 8-neighbour (ovl03:11f5) becomes hills (water and shore included).
    Evidence: asm ovl04:033a..03ae."""
    for x in range(_W):
        for y in range(_H):
            g = buf.grid(x, y)
            if g != MOUNTAINS and g != HILLS and buf.nb8(x, y, MOUNTAINS):
                buf.set_grid(x, y, HILLS)


def place_seeds(work: Work, kind: tuple[int, int], count_word: int, site: str) -> None:
    """ovl04:0495 (mountains: type 2, grid 6, count word +0x34) / 03af (hills: type 1, grid 5,
    +0x36): while the count word > i: (x, y) = (rnd(1, 112, -1), rnd(1, 156, -1)) until the
    square is land (sites 04b4 / 04c6, 03ce / 03e0; unbounded, `tries`); paint it; record
    (x, y, type, nlinks 0) at the seed count, count += 1.
    Evidence: asm ovl04:0495..057a, 03af..0494."""
    buf, rng = work.buf, work.rng
    typ, value = kind
    i = 0
    while buf.word(count_word) > i:
        for _ in tries(site):
            x = rng.rnd(*K.RIDGE_COL_ROLL.value)
            y = rng.rnd(*K.RIDGE_ROW_ROLL.value)
            if buf.grid(x, y) == LAND:
                break
        buf.set_grid(x, y, value)
        for field, v in ((K.SEED_X.value, x), (K.SEED_Y.value, y), (K.SEED_TYPE.value, typ),
                         (K.SEED_NLINKS.value, 0)):
            buf.set_word(_rec(buf.word(K.SEED_COUNT.value)) + field, v)
        buf.set_word(K.SEED_COUNT.value, buf.word(K.SEED_COUNT.value) + 1)
        i += 1


def link_seeds(work: Work) -> None:
    """ovl04:057b: with more than one seed, per seed si: d = rnd(1, 2, -1) for type 1 (site
    05b2) else rnd(1, 4, -1) (05d8); nlinks = min(d, count - 1); link k = the nearest other
    seed by ovl03:0fed not linked yet (strict <, so the lowest index on ties; -1 if none).
    Evidence: asm ovl04:057b..06d1."""
    buf, rng = work.buf, work.rng
    cnt = K.SEED_COUNT.value
    if buf.word(cnt) <= 1:
        return
    si = 0
    while buf.word(cnt) > si:
        r = _rec(si)
        d = rng.rnd(*(K.HILL_LINKS.value if buf.word(r + K.SEED_TYPE.value) == 1 else K.MOUNTAIN_LINKS.value))
        top = buf.word(cnt) - 1
        buf.set_word(r + K.SEED_NLINKS.value, d if top > d else top)
        k = 0
        while buf.word(r + K.SEED_NLINKS.value) > k:
            best, bi = K.RIDGE_FAR.value, -1
            di = 0
            while buf.word(cnt) > di:
                if di != si and all(buf.word(r + K.SEED_LINKS.value + 2 * j) != di for j in range(k)):
                    dist = L.cheb(*buf.point(_rec(di) + K.SEED_X.value), *buf.point(r + K.SEED_X.value))
                    if dist < best:
                        best, bi = dist, di
                di += 1
            buf.set_word(r + K.SEED_LINKS.value + 2 * k, bi)
            k += 1
        si += 1


def _paint(buf: Buffer, x: int, y: int, value: int) -> None:
    """09a7's paint: flat square y * 0x70 + x (no clamp); land or hills -> value."""
    off = buf.cell(x, y)
    g = buf.byte(off)
    if g == LAND or g == HILLS:
        buf.set_byte(off, value)


class LineState:
    """The stack word [bp-0x26] of ovl04:09a7 (the direction index of the last step), kept
    across calls: when a line starts and ends on one square its first step is (0, 0), no index
    matches and the EXE uses whatever the slot holds.
    Frame analysis (review M11 R1) [V]: with S = 06d2's SP before it pushes a callee's
    arguments (06d2 pushes only si / di, so S is the same for every call), all four callers
    (0884, 08f3, 0962, 098c) give 09a7 bp = S-32, so the slot is the word at S-70 for every
    line; the deepest code between two 09a7 calls (the stub's / 0962's dice ovl59:02bf with
    rand 0000:200a, about S-50; the clamp 0470, about S-28) stays above it, so the slot holds
    the index the previous line stored.  [unverified]: the first line's content (S-70 was
    last written by some deeper chain of stage 0 / the progress update; 0 here), and real-mode
    interrupt handlers or an FPU emulator (int 34h..3Dh without an 8087) running on the user
    stack between lines."""

    def __init__(self) -> None:
        self.idx = 0


def line(work: Work, p1: tuple[int, int], p2: tuple[int, int], width: int, value: int,
         state: LineState | None = None) -> None:
    """ovl04:09a7(p1, p2, width, value): the ridge walk.  D = direction(p1, p2); per step dn =
    direction(cur, p2); within cheb 3 of p2 step dn, else r = rnd(1, 3, 0) (site 0a14): 1 dn,
    2 D, 3 dn = rotate(dn) (ovl03:1091), D = dn; F = the step taken, idx = the last k with
    dir8(k) == F; a = dir8(idx + 2), b = dir8(idx + 6) from the unclamped cur; cur clamped and
    painted; width 2 also paints clamp(cur + a) and the unclamped cur + b, width 3 clamp(cur +
    2a) and the unclamped cur + 2b (not the adjacent squares).  Paint = land / hills -> value
    on the flat square.  Ends when cur == p2.
    Evidence: asm ovl04:09a7..0d42."""
    buf, rng = work.buf, work.rng
    if state is None:
        state = LineState()
    cx, cy = p1
    tx, ty = p2
    mom = L.direction(cx, cy, tx, ty)
    for _ in tries("ovl04:09a7"):
        dn = L.direction(cx, cy, tx, ty)
        f = None
        if L.cheb(cx, cy, tx, ty) < K.RIDGE_NEAR.value:
            f = dn
        else:
            r = rng.rnd(*K.LINE_ROLL.value)
            if r == 1:
                f = dn
            elif r == 2:
                f = mom
            elif r == 3:
                f = mom = L.rotate(work, dn)
        if f is not None:
            cx, cy = s16(cx + f[0]), s16(cy + f[1])
            for k in range(_N):
                if buf.dir8(k) == f:
                    state.idx = k
        a = buf.dir8(_crem(state.idx + 2, _N))
        b = buf.dir8(_crem(state.idx + 6, _N))
        ax, ay = s16(cx + a[0]), s16(cy + a[1])
        bx, by = s16(cx + b[0]), s16(cy + b[1])
        a2x, a2y = s16(cx + 2 * a[0]), s16(cy + 2 * a[1])
        b2x, b2y = s16(cx + 2 * b[0]), s16(cy + 2 * b[1])
        cx, cy = clamp(cx, cy)
        _paint(buf, cx, cy, value)
        done = (cx, cy) == (tx, ty)
        if width == 2:
            _paint(buf, *clamp(ax, ay), value)
            _paint(buf, bx, by, value)
        if width == 3:
            _paint(buf, *clamp(a2x, a2y), value)
            _paint(buf, b2x, b2y, value)
        if done:
            return


def stub(work: Work, x: int, y: int, value: int, state: LineState | None = None) -> None:
    """ovl04:0884 (value 6) / 08f3 (value 5): a seed without links: t = clamp(x + rnd(1, 5,
    -10), y + rnd(1, 5, -10)) (sites 0892 / 08aa, 0901 / 0919: always up-left), then
    line((x, y), t, rnd(1, 2, 1), value) (08d8 / 0947).
    Evidence: asm ovl04:0884..0961."""
    rng = work.rng
    tx = s16(x + rng.rnd(*K.STUB_ROLL.value))
    ty = s16(y + rng.rnd(*K.STUB_ROLL.value))
    tx, ty = clamp(tx, ty)
    line(work, (x, y), (tx, ty), rng.rnd(*K.WIDTH_ROLL.value), value, state)


def draw_ridges(work: Work) -> None:
    """ovl04:06d2: with more than one seed, per seed in order: type 1 without links -> stub
    value 5 (08f3); type 1 links: to a type-1 seed line width 3 value 5 (098c, no die), else
    line rnd(1, 2, 1) value 6 (0962, site 0971); other types: no links -> stub value 6 (0884),
    else per link line rnd(1, 2, 1) value 6 (0962).  Every record field is read live.
    Evidence: asm ovl04:06d2..0883."""
    buf, rng = work.buf, work.rng
    cnt = K.SEED_COUNT.value
    if buf.word(cnt) <= 1:
        return
    state = LineState()
    si = 0
    while buf.word(cnt) > si:
        r = _rec(si)
        if buf.word(r + K.SEED_TYPE.value) == 1:
            if buf.word(r + K.SEED_NLINKS.value) == 0:
                stub(work, *buf.point(r + K.SEED_X.value), HILLS, state)
            else:
                di = 0
                while buf.word(r + K.SEED_NLINKS.value) > di:
                    t = _rec(buf.word(r + K.SEED_LINKS.value + 2 * di))
                    if buf.word(t + K.SEED_TYPE.value) == 1:
                        w, v = K.HILL_LINE.value
                        line(work, buf.point(r + K.SEED_X.value), buf.point(t + K.SEED_X.value), w, v, state)
                    else:
                        p1, p2 = buf.point(r + K.SEED_X.value), buf.point(t + K.SEED_X.value)
                        line(work, p1, p2, rng.rnd(*K.WIDTH_ROLL.value), MOUNTAINS, state)
                    di += 1
        elif buf.word(r + K.SEED_NLINKS.value) == 0:
            stub(work, *buf.point(r + K.SEED_X.value), MOUNTAINS, state)
        else:
            di = 0
            while buf.word(r + K.SEED_NLINKS.value) > di:
                t = _rec(buf.word(r + K.SEED_LINKS.value + 2 * di))
                p1, p2 = buf.point(r + K.SEED_X.value), buf.point(t + K.SEED_X.value)
                line(work, p1, p2, rng.rnd(*K.WIDTH_ROLL.value), MOUNTAINS, state)
                di += 1
        si += 1


def ridges(work: Work) -> None:
    """ovl04:0000 (stage 10): seed count := 0; mountain seeds (word +0x34), hill seeds
    (+0x36); link_seeds; draw_ridges; smooth; hill_ring.  Returns None.
    Evidence: asm ovl04:0000..002d."""
    buf = work.buf
    buf.set_word(K.SEED_COUNT.value, 0)
    place_seeds(work, K.MOUNTAIN_SEED.value, K.MOUNTAIN_SEEDS.value, "ovl04:04b4")
    place_seeds(work, K.HILL_SEED.value, K.HILL_SEEDS.value, "ovl04:03ce")
    link_seeds(work)
    draw_ridges(work)
    smooth(work)
    hill_ring(buf)


# ---------------------------------------------------------------- ovl07


def cut(work: Work, mode: int) -> None:
    """ovl07:0044(mode): p1 = (rnd(1, 112, -1), rnd(1, 156, -1)), p2 the same (sites 0054,
    0067, 007a, 008d); walk the 8-way line p1 -> p2 (p2 itself not visited): k = the last
    index with dir8(k) == direction(cur, p2); mode != 0 and cur hills / mountains: land at the
    clamped cur, cur + dir8(k + 1), cur + dir8(k + 7), cur + 2 dir8(k + 1), cur + 2 dir8(k +
    7); mode 0 and cur mountains: the same five squares hills.
    Evidence: asm ovl07:0044..04d5."""
    buf, rng = work.buf, work.rng
    x1, y1 = rng.rnd(*K.RIDGE_COL_ROLL.value), rng.rnd(*K.RIDGE_ROW_ROLL.value)
    x2, y2 = rng.rnd(*K.RIDGE_COL_ROLL.value), rng.rnd(*K.RIDGE_ROW_ROLL.value)
    cx, cy = x1, y1
    done = (cx, cy) == (x2, y2)
    for _ in tries("ovl07:0044"):
        if done:
            return
        d = L.direction(cx, cy, x2, y2)
        k = -1
        for i in range(_N):
            if buf.dir8(i) == d:
                k = i
        s = buf.dir8(_crem(k + 1, _N))
        t = buf.dir8(_crem(k + 7, _N))
        g = buf.grid(cx, cy)
        paint = None
        if mode != 0:
            if g == MOUNTAINS or g == HILLS:
                paint = LAND
        elif g == MOUNTAINS:
            paint = HILLS
        if paint is not None:
            for px, py in ((cx, cy), (cx + s[0], cy + s[1]), (cx + t[0], cy + t[1]),
                           (cx + 2 * s[0], cy + 2 * s[1]), (cx + 2 * t[0], cy + 2 * t[1])):
                buf.set_grid(*clamp(px, py), paint)
        cx, cy = s16(cx + d[0]), s16(cy + d[1])
        if (cx, cy) == (x2, y2):
            done = True


def _majority(buf: Buffer, centre: int, near: int, to: int) -> None:
    for x in range(_W):
        for y in range(_H):
            if L.on_border(x, y) or buf.grid(x, y) != centre:
                continue
            n = ((buf.grid(x, y + 1) == near) + (buf.grid(x, y - 1) == near)
                 + (buf.grid(x + 1, y) == near) + (buf.grid(x - 1, y) == near))
            if n >= 3:
                buf.set_grid(x, y, to)


def cuts(work: Work) -> None:
    """ovl07:0000 (stage 20): while word +0x40 > i: cut(0) (passes); while word +0x3e > i:
    cut(1) (valleys); 04d6: non-border hills with >= 3 mountains among the four neighbours ->
    mountains; 05ae: non-border land with >= 3 hills neighbours -> hills (both x outer, y
    inner, in place); ovl04:033a.  Returns None.
    Evidence: asm ovl07:0000..0043, 04d6..05ad, 05ae..0685."""
    buf = work.buf
    i = 0
    while buf.word(K.PASSES.value) > i:
        cut(work, 0)
        i += 1
    i = 0
    while buf.word(K.VALLEYS.value) > i:
        cut(work, 1)
        i += 1
    _majority(buf, HILLS, MOUNTAINS, MOUNTAINS)
    _majority(buf, LAND, HILLS, HILLS)
    hill_ring(buf)
