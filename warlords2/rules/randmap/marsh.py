"""Stage 50 of the random-map generator: marshes, ovl08:0000 (M11 R1).

1..3 marsh blobs (grid 8) near the coast, each a seed square and five sprays.  `spray`
(ovl08:0029) is also called by ovl09:0464 inside stage 80 (package R3).  Screen-only work
(ovl02:03aa) is not modelled.
"""
from __future__ import annotations

from ..constants import Const
from . import Work, clamp, tries
from . import land as L

BLOBS_ROLL = Const((1, 3, 0), "asm ovl08:0007..000c: push dword 3; push 1 -> ovl59:02bf(1, 3, 0)")
X_ROLL = Const((1, 0x66, 5), "asm ovl08:0124..012c: push 0x50066; push 1 (x 6..107)")
Y_ROLL = Const((1, 0x92, 5), "asm ovl08:0136..013e: push 0x50092; push 1 (y 6..151)")
COAST_TRIES = Const(4, "asm ovl08:0166: cmp word [bp-2], 4; jge (the fifth land hit is taken)")
SPRAY_COUNT = Const((1, 5, 3), "asm ovl08:0030..0038: push 0x30005; push 1 (4..8 drops)")
SPRAY_REACH = Const((1, 3, 0), "asm ovl08:0048..004d / 007d..0082: push dword 3; push 1")
SPRAY_DIR = Const((1, 8, -1), "asm ovl08:0056..005e / 008b..0093: push 0xffff0008; push 1")
SPRAY_AT = Const(((0, 0), (1, 1), (-1, -1), (-1, 1), (1, -1)),
                 "asm ovl08:01fc, 0205, 0214, 0223, 0232: spray(x, y), (x+1, y+1), (x-1, y-1), "
                 "(x-1, y+1), (x+1, y-1)")

LAND, SHORE, MARSH = L.LAND, L.SHORE, 8


def spray(work: Work, x: int, y: int) -> None:
    """ovl08:0029(x, y): n = rnd(1, 5, 3) (site 0038); n times: a = rnd(1, 3, 0) (004d), d =
    rnd(1, 8, -1) (005e), px = x + a * dir8(d).x; b = rnd(1, 3, 0) (0082), e = rnd(1, 8, -1)
    (0093), py = y + b * dir8(e).y (two independent directions); clamp; land -> marsh.
    Evidence: asm ovl08:0029..0109."""
    buf, rng = work.buf, work.rng
    n = rng.rnd(*SPRAY_COUNT.value)
    i = 0
    while i < n:
        a = rng.rnd(*SPRAY_REACH.value)
        px = x + a * buf.dir8(rng.rnd(*SPRAY_DIR.value))[0]
        b = rng.rnd(*SPRAY_REACH.value)
        py = y + b * buf.dir8(rng.rnd(*SPRAY_DIR.value))[1]
        px, py = clamp(px, py)
        if buf.grid(px, py) == LAND:
            buf.set_grid(px, py, MARSH)
        i += 1


def marsh_blob(work: Work) -> None:
    """ovl08:010a: sample (rnd(1, 102, 5), rnd(1, 146, 5)) (sites 012c / 013e) until a land
    square is taken (unbounded, `tries`): the fifth land hit always, an earlier one when
    (x, y), (x+1, y), (x, y+1) or (x+1, y+1) has a shore 8-neighbour (ovl03:11f5, all four
    tested); that square marsh, then spray at it and its four diagonals (order SPRAY_AT).
    Evidence: asm ovl08:010a..0244."""
    buf, rng = work.buf, work.rng
    hits = 0
    for _ in tries("ovl08:012c"):
        x = rng.rnd(*X_ROLL.value)
        y = rng.rnd(*Y_ROLL.value)
        if buf.grid(x, y) != LAND:
            continue
        if hits >= COAST_TRIES.value:
            break
        near = [buf.nb8(x, y, SHORE), buf.nb8(x + 1, y, SHORE), buf.nb8(x, y + 1, SHORE),
                buf.nb8(x + 1, y + 1, SHORE)]
        hits += 1
        if any(near):
            break
    buf.set_grid(x, y, MARSH)
    for dx, dy in SPRAY_AT.value:
        spray(work, x + dx, y + dy)


def marshes(work: Work) -> None:
    """ovl08:0000 (stage 50): n = rnd(1, 3, 0) (site 000c); n x marsh_blob.  Returns None.
    Evidence: asm ovl08:0000..0028."""
    n = work.rng.rnd(*BLOBS_ROLL.value)
    i = 0
    while i < n:
        marsh_blob(work)
        i += 1
