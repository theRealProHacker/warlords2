"""M11 R1: the terrain stages of the random-map generator (rules/randmap land, ridges, rivers,
forest, marsh = ovl03, ovl04 + ovl07, ovl06, ovl05, ovl08).

Every scripted test feeds hand-built grids and a `ScriptedRng` whose entries (sides, add,
value) were derived from the asm by hand (cited per test); the ScriptedRng checks each call's
parameters and that the script is used up, so these also pin the exact call sequence.  Header
words and the direction table are synthetic (written by the test), not game data.  The
`gamedata` tests run the stages on the user's RANDOM.DAT.
"""
from fractions import Fraction
import math

import pytest

from randmapkit import RecordingRng, ScriptedRng, blank_work
from warlords2.rules import randmap as RM
from warlords2.rules.constants import randmap as K
from warlords2.rules.randmap import forest as F
from warlords2.rules.randmap import land as L
from warlords2.rules.randmap import marsh as M
from warlords2.rules.randmap import ridges as RG
from warlords2.rules.randmap import rivers as RV
from warlords2.rules.rng import Rng

W, H, GRID = 0x70, 0x9C, 0x6120
WATER, SHORE, FOREST, HILLS, MOUNTAINS, LAND, MARSH = 2, 3, 4, 5, 6, 7, 8

# Synthetic 8-neighbour table (clockwise from south, y down) and the word pair before it.
DIRS = [(0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1)]


def work(script=(), fill=None):
    w = blank_work(ScriptedRng(list(script)))
    for k, (dx, dy) in enumerate(DIRS):
        w.buf.set_point(0xBC + 4 * k, dx, dy)
    w.buf.set_point(0xB8, -1, 1)
    if fill is not None:
        w.buf.data[GRID:GRID + W * H] = bytes([fill]) * (W * H)
    return w


def cells(buf, v):
    return {(x, y) for x in range(W) for y in range(H) if buf.grid(x, y) == v}


def put(buf, v, *xys):
    for x, y in xys:
        buf.set_grid(x, y, v)


def jit(a1, d1, a2, d2, edge_roll, step):
    """ovl02:04ae's five calls (04be, 04cc, 04ec, 04fa, 0517)."""
    return [(3, -2, a1), (step, 0, d1), (3, -2, a2), (step, 0, d2), (100, 0, edge_roll)]


# --------------------------------------------------------------------------- ovl03 helpers


@pytest.mark.parametrize("p1,p2,want", [
    ((5, 5), (5, 5), (0, 0)), ((5, 5), (5, 9), (0, 1)), ((5, 9), (5, 5), (0, -1)),
    ((5, 5), (9, 5), (1, 0)), ((9, 5), (5, 5), (-1, 0)),
    # east: s = dy / dx against 2.414 / 0.414 / -0.414 / -2.414 (0e6a..0fe6)
    ((0, 0), (5, 13), (0, 1)), ((0, 0), (5, 12), (1, 1)), ((0, 0), (5, 3), (1, 1)),
    ((0, 0), (5, 2), (1, 0)), ((0, 0), (5, -2), (1, 0)), ((0, 0), (5, -3), (1, -1)),
    ((0, 0), (5, -12), (1, -1)), ((0, 0), (5, -13), (0, -1)),
    # west (x1 > x2): the same slopes give the mirrored steps
    ((5, 13), (0, 0), (0, -1)), ((5, 12), (0, 0), (-1, -1)), ((5, 2), (0, 0), (-1, 0)),
    ((5, -3), (0, 0), (-1, 1)), ((5, -13), (0, 0), (0, 1)),
])
def test_direction_octants(p1, p2, want):
    assert L.direction(*p1, *p2) == want


def _exact_direction(x1, y1, x2, y2):
    """Reference: the slope compared as the exact x87 value (64-bit quotient, stored double)."""
    if x1 == x2:
        return (0, 0) if y1 == y2 else ((0, -1) if y1 > y2 else (0, 1))
    if y1 == y2:
        return (-1, 0) if x1 > x2 else (1, 0)
    s = L.fpu_quotient(y2 - y1, x2 - x1, 53)
    c = [Fraction(v) for v in (2.414, 0.414, -0.414, -2.414)]
    west = [(0, -1), (-1, -1), (-1, 0), (-1, 1), (0, 1)]
    east = [(0, 1), (1, 1), (1, 0), (1, -1), (0, -1)]
    out = west if x1 > x2 else east
    for i, ci in enumerate(c):
        if s >= ci:
            return out[i]
    return out[4]


def test_direction_matches_the_exact_fpu_value():
    for dx in range(-40, 41):
        for dy in range(-120, 121, 3):
            assert L.direction(0, 0, dx, dy) == _exact_direction(0, 0, dx, dy), (dx, dy)


def test_slopes_near_the_thresholds():
    # For |dx| < 500 (beyond any reachable step: the map is 112 x 156) no dy / dx comes within
    # 2^-40 (relative) of a constant, so a float64 quotient decides as the x87 does.  From
    # dx = 500 on, dy / dx can equal the decimal 2.414 = 1207 / 500 exactly (the double differs
    # by under one ulp); for every such near case in the 16-bit range the float64 comparison and
    # the exact x87 value (64-bit quotient, stored double) agree too.
    near = 0
    for c in K.SLOPES.value:
        num, den = Fraction(c).numerator, Fraction(c).denominator
        for dx in range(1, 0x8000):
            for dy in (math.floor(c * dx), math.ceil(c * dx)):
                if abs(dy) >= 0x8000:
                    continue
                gap = abs(dy * den - num * dx) / (dx * den) / abs(c)
                if dx < 500:
                    assert gap > 2.0 ** -40, (dx, dy)
                if gap < 1e-9:
                    near += 1
                    assert (dy / dx >= c) == (L.fpu_quotient(dy, dx, 53) >= Fraction(c)), (dx, dy)
                    assert L.direction(0, 0, dx, dy) == _exact_direction(0, 0, dx, dy)
    assert near > 0


@pytest.mark.gamedata
def test_slope_constants_are_the_exe_doubles(game):
    import struct
    from warlords2.assets.exe import ds_bytes
    from warlords2.formats.gamedir import EXE_NAME, GameDir
    raw = ds_bytes(GameDir(game).read(EXE_NAME), 0x292, 32)
    assert struct.unpack("<4d", raw) == K.SLOPES.value


def test_fpu_quotient():
    assert L.fpu_quotient(1, 3, 24) == Fraction(11184811, 33554432)      # float32(1/3)
    assert L.fpu_quotient(1, 3, 53) == Fraction(1 / 3)
    assert L.fpu_quotient(-7, 2, 24) == Fraction(-7, 2)
    with pytest.raises(ZeroDivisionError):
        L.fpu_quotient(1, 0, 24)


def test_cheb_side_of_on_border():
    assert L.cheb(3, 4, 10, 2) == 7 and L.cheb(10, 2, 3, 4) == 7 and L.cheb(1, 1, 1, 1) == 0
    # 1016: x == 0 first, then y == 0, then x == 0x6f, then y == 0x9b
    assert [L.side_of(*p) for p in [(0, 0), (0, 155), (111, 0), (111, 155), (5, 0), (111, 5),
                                    (5, 155), (0, 5), (5, 5)]] == [3, 3, 0, 1, 0, 1, 2, 3, -1]
    assert L.on_border(0, 9) and L.on_border(9, 155) and not L.on_border(1, 154)


def test_rotate_reads_the_buffer_table():
    # 104a: c = first index of d, rnd(1, 5, c - 2) (site ovl03:1091), r % 8 C-style
    w = work([(5, -2, -1), (5, 0, 4), (5, 6, 11), (5, -2, 1)])
    w.buf.set_point(0xB8, 9, 9)                         # r == -1 reads +0xb8, not dir8(7)
    assert L.rotate(w, (0, 1)) == (9, 9)
    assert L.rotate(w, (1, 0)) == (0, -1)               # c = 2, r = 4
    assert L.rotate(w, (5, 5)) == (1, -1)               # not found: c = 8, r = 11 -> 3
    w.buf.set_point(0xBC + 4 * 5, 0, 1)                 # duplicate of dir8(0): the first wins
    assert L.rotate(w, (0, 1)) == (1, 1)
    w.rng.assert_done()


def test_shore_marks_water_next_to_land_hills_mountains():
    w = work(fill=WATER)
    b = w.buf
    put(b, LAND, (10, 10))
    put(b, HILLS, (30, 30))
    put(b, MOUNTAINS, (50, 50))
    put(b, FOREST, (70, 70))
    L.shore(b)
    ring = lambda x, y: {(x + dx, y + dy) for dx in (-1, 0, 1) for dy in (-1, 0, 1)} - {(x, y)}
    assert cells(b, SHORE) == ring(10, 10) | ring(30, 30) | ring(50, 50)


# --------------------------------------------------------------------------- ovl03 outline


def side_header(b, nv):
    b.set_word(0x2C, nv)
    b.set_point(0x8C, 0, 0)
    b.set_point(0x90, 111, 0)
    b.set_point(0xAC, -1, -1)
    b.set_point(0xB0, 1, -1)


def test_side_ends_jitters_the_inset_corners():
    # 0087: (0, 0) - 10 * (-1, -1) = (10, 10), jitter(16, edge 1) (013f); (111, 0) - 10 * (1, -1)
    # = (101, 10), jitter (01c7) with the edge roll 29 < 30: y = 11 is the least distance -> 0
    w = work(jit(1, 2, 0, 5, 50, 16) + jit(-1, 3, 1, 1, 29, 16), fill=WATER)
    side_header(w.buf, 3)
    L.side_ends(w, 0)
    w.rng.assert_done()
    assert w.buf.point(0x244) == (12, 10) and w.buf.point(0x254) == (98, 0)
    assert cells(w.buf, LAND) == {(12, 10), (98, 0)}


def test_side_ends_straight_side_takes_the_seeds():
    w = work(fill=WATER)
    side_header(w.buf, 2)
    L.side_ends(w, 0)
    assert w.buf.point(0x244) == (0, 0) and w.buf.point(0x254) == (111, 0)
    assert cells(w.buf, LAND) == set()


def corners(b, ends, starts):
    for s in range(4):
        b.set_point(0x254 + 4 * s, *ends[s])
        b.set_point(0x244 + 4 * s, *starts[s])


def test_fix_corners_swaps_only_when_strictly_greater():
    w = work()
    b = w.buf
    # s = 0: a = (56 - 46) / (78 - 68) = 1; START[1] = (36, 58): 20 / 20 = 1 -> no swap (jbe)
    ends = [(46, 68), (10, 10), (20, 20), (30, 30)]
    starts = [(30, 30), (36, 58), (10, 10), (20, 20)]
    corners(b, ends, starts)
    L.fix_corners(b)
    assert b.point(0x254) == (46, 68) and b.point(0x248) == (36, 58)
    # START[1] = (26, 58): 30 / 20 = 1.5 > 1 -> swapped
    corners(b, ends, [(30, 30), (26, 58), (10, 10), (20, 20)])
    L.fix_corners(b)
    assert b.point(0x254) == (26, 58) and b.point(0x248) == (46, 68)
    assert b.point(0x258) == (10, 10) and b.point(0x24C) == (10, 10)


def test_fix_corners_compares_float32_values():
    # a = 31946 / 31945, b = 31945 / 31944 > a exactly, but both round up to the same float32
    # (fstp dword): no swap.  Any operand kept in double precision would swap.
    w = work()
    b = w.buf
    e0 = (56 - 31946, 78 - 31945)
    s1 = (56 - 31945, 78 - 31944)
    corners(b, [e0, (10, 10), (20, 20), (30, 30)], [(30, 30), s1, (10, 10), (20, 20)])
    assert Fraction(31945, 31944) > Fraction(31946, 31945)
    assert L.fpu_quotient(31945, 31944, 24) == L.fpu_quotient(31946, 31945, 24)
    assert L.fpu_quotient(31945, 31944, 24) > L.fpu_quotient(31946, 31945, 53)
    L.fix_corners(b)
    assert b.point(0x254) == e0 and b.point(0x248) == s1


def verts(b, s, n):
    return [b.point(0x104 + 0x50 * s + 4 * j) for j in range(n)]


def vert_header(b, nv, start, end):
    b.set_word(0x2C, nv)
    b.set_point(0x244, *start)
    b.set_point(0x254, *end)


def test_side_vertices_stops_near_the_end():
    # 02f9: L = 20 // 5 = 4, jitter step 2 (04b7); p = V[k] + 4 (1, 0), jitter +2 in x:
    # (16, 10), (22, 10), (28, 10): cheb 2 < 4 stops at CNT 4 < NV - 1 = 5
    script = jit(1, 2, 0, 1, 99, 2) * 3
    w = work(script, fill=WATER)
    vert_header(w.buf, 6, (10, 10), (30, 10))
    L.side_vertices(w, 0)
    w.rng.assert_done()
    assert w.buf.word(0xFC) == 5
    assert verts(w.buf, 0, 5) == [(10, 10), (16, 10), (22, 10), (28, 10), (30, 10)]
    assert cells(w.buf, LAND) == {(16, 10), (22, 10), (28, 10)}


def test_side_vertices_stops_at_nv_minus_one():
    w = work(jit(0, 1, 0, 1, 1, 2) * 4, fill=WATER)
    vert_header(w.buf, 6, (10, 10), (30, 10))
    L.side_vertices(w, 0)
    w.rng.assert_done()
    assert w.buf.word(0xFC) == 6
    assert verts(w.buf, 0, 6) == [(10, 10), (14, 10), (18, 10), (22, 10), (26, 10), (30, 10)]


def test_side_vertices_distance_equal_to_l_goes_on():
    # 0550: cmp ax, L; jl -> only cheb < L stops: (26, 10) is exactly L = 4 from the end
    w = work(jit(1, 2, 0, 1, 99, 2) * 2 + jit(0, 1, 0, 1, 99, 2) * 2, fill=WATER)
    vert_header(w.buf, 6, (10, 10), (30, 10))
    L.side_vertices(w, 0)
    w.rng.assert_done()
    assert verts(w.buf, 0, 6) == [(10, 10), (16, 10), (22, 10), (26, 10), (30, 10), (30, 10)]


def test_side_vertices_step_zero_still_rolls_and_border_ends_skip():
    # L = 3 // 3 = 1: jitter step 0 -> rnd(1, 0, 0) entries (no draw, value = add)
    w = work([(3, -2, 0), (0, 0, 0), (3, -2, 0), (0, 0, 0), (100, 0, 1)] * 2, fill=WATER)
    vert_header(w.buf, 4, (10, 10), (13, 10))
    L.side_vertices(w, 0)
    w.rng.assert_done()
    assert verts(w.buf, 0, 4) == [(10, 10), (11, 10), (12, 10), (13, 10)]
    w = work(fill=WATER)
    vert_header(w.buf, 6, (0, 10), (40, 155))
    L.side_vertices(w, 0)
    assert w.buf.word(0xFC) == 2 and verts(w.buf, 0, 2) == [(0, 10), (40, 155)]


def test_walk_rolls_rotates_and_keeps_momentum():
    # 0a0e A (10, 10) -> B (16, 10): r 3 (0a74) rotates (1, 0) -> dir8(1) (1091: rnd(1, 5, 0)
    # = 1 -> c - 1), r 2 repeats the rotated step, then r 1 twice, then cheb < 3 steps
    w = work([(3, 0, 3), (5, 0, 1), (3, 0, 2), (3, 0, 1), (3, 0, 1)], fill=WATER)
    L.walk(w, (10, 10), (16, 10))
    w.rng.assert_done()
    assert cells(w.buf, LAND) == {(11, 11), (12, 12), (13, 11), (14, 11), (15, 10), (16, 10)}


def corner_header(b):
    for c, p in enumerate([(0, 0), (111, 0), (111, 155), (0, 155)]):
        b.set_point(0x7C + 4 * c, *p)


def test_border_run_same_side_and_corners():
    w = work(fill=WATER)
    corner_header(w.buf)
    L.border_run(w, (0, 10), (0, 14))                   # same side: straight, A not painted
    assert cells(w.buf, LAND) == {(0, 11), (0, 12), (0, 13), (0, 14)}
    w = work(fill=WATER)
    corner_header(w.buf)
    L.border_run(w, (0, 3), (4, 0))                     # sides 3 / 0: |diff| 3 -> corner 0
    assert cells(w.buf, LAND) == {(0, 2), (0, 1), (0, 0), (3, 0), (2, 0), (1, 0)}
    w = work(fill=WATER)
    corner_header(w.buf)
    L.border_run(w, (111, 0), (111, 5))                 # (111, 0) is side 0: corner 1 = A
    assert cells(w.buf, LAND) == {(111, 4), (111, 3), (111, 2), (111, 1), (111, 0)}


def test_border_run_opposite_sides_walks(monkeypatch):
    seen = []
    monkeypatch.setattr(L, "walk", lambda w, a, b: seen.append((a, b)))
    w = work(fill=WATER)
    L.border_run(w, (0, 10), (111, 20))
    assert seen == [((0, 10), (111, 20))]


def test_draw_outline_segments(monkeypatch):
    log = []
    monkeypatch.setattr(L, "walk", lambda w, a, b: log.append(("walk", a, b)))
    monkeypatch.setattr(L, "border_run", lambda w, a, b: log.append(("run", a, b)))
    w = work()
    b = w.buf
    lists = [[(0, 5), (0, 9), (20, 20)], [(30, 0), (40, 0)], [(50, 50)] * 2, [(0, 70), (5, 5)]]
    for s, vs in enumerate(lists):
        b.set_word(0xFC + 2 * s, len(vs))
        for j, p in enumerate(vs):
            b.set_point(0x104 + 0x50 * s + 4 * j, *p)
    L.draw_outline(w)
    assert log == [("run", (0, 5), (0, 9)), ("walk", (0, 9), (20, 20)), ("walk", (20, 20), (30, 0)),
                   ("run", (30, 0), (40, 0)), ("walk", (40, 0), (50, 50)),
                   ("walk", (50, 50), (50, 50)), ("walk", (50, 50), (0, 70)),
                   ("walk", (0, 70), (5, 5)), ("walk", (5, 5), (0, 5))]


# --------------------------------------------------------------------------- ovl03 sea


def test_fill_sea_closed_ring():
    w = work(fill=WATER)
    b = w.buf
    ring = {(x, y) for x in range(10, 21) for y in range(10, 21)} - \
        {(x, y) for x in range(11, 20) for y in range(11, 20)}
    put(b, LAND, *ring)
    L.fill_sea(b)
    land = {(x, y) for x in range(10, 21) for y in range(10, 21)}
    assert cells(b, LAND) == land and len(cells(b, WATER)) == W * H - len(land)


def test_fill_sea_is_eight_sweeps_not_a_flood_fill():
    # A staircase corridor from the left border, alternating right / up runs.  Each sweep pair
    # carries water down-right (0867 sweeps 1, 2) or up-left (3, 4), one family at a time, so
    # after two passes the far runs are still unknown and become land.
    w = work(fill=LAND)
    b = w.buf
    path, x, y = [], 0, 50
    path.append((x, y))
    for _ in range(5):
        for _ in range(5):
            x += 1
            path.append((x, y))
        for _ in range(5):
            y -= 1
            path.append((x, y))
    put(b, WATER, *path)
    L.fill_sea(b)
    assert all(b.grid(*p) == WATER for p in path[:11])          # first right run + up run
    assert all(b.grid(*p) == LAND for p in path[-15:])          # the far runs: pockets
    assert b.grid(25, 25) == LAND


def test_fill_ok_flat_neighbours():
    # 10bd: shore / bridge -> 0; a border square holding 0 -> 1; else a 4-neighbour of water,
    # read by flat index (x - 1 of (0, y) is (0x6f, y - 1))
    w = work()
    b = w.buf
    assert L.fill_ok(b, 0, 40) == 1 and L.fill_ok(b, 20, 40) == 0
    put(b, LAND, (5, 40))
    put(b, WATER, (4, 40))
    assert L.fill_ok(b, 5, 40) == 1
    for v in (SHORE, 1):
        put(b, v, (5, 40))
        assert L.fill_ok(b, 5, 40) == 0
    put(b, LAND, (0, 60))
    assert L.fill_ok(b, 0, 60) == 0
    put(b, WATER, (111, 59))
    assert L.fill_ok(b, 0, 60) == 1


# --------------------------------------------------------------------------- ovl03:0000


def straight_map_header(b):
    for s, (p, q) in enumerate([((0, 0), (111, 0)), ((111, 0), (111, 155)),
                                ((111, 155), (0, 155)), ((0, 155), (0, 0))]):
        b.set_word(0x2C + 2 * s, 2)
        b.set_point(0x8C + 8 * s, *p)
        b.set_point(0x90 + 8 * s, *q)
    corner_header(b)


OUTLINE_WALK = [(3, 0, 1)] * 109     # side 2 (111, 155) -> (0, 155): opposite sides -> 0a0e


def test_continent_straight_sides_no_channel():
    # NV <= 2 everywhere: the outline is the map border; side 2 is a walk (rolls while cheb >= 3);
    # (111, 155) is never painted (walk's A, run's B), so it stays water and becomes shore.
    w = work(OUTLINE_WALK + [(100, 0, 50)], fill=WATER)
    straight_map_header(w.buf)
    L.continent(w)
    w.rng.assert_done()
    assert cells(w.buf, SHORE) == {(111, 155)} and len(cells(w.buf, LAND)) == W * H - 1


def channel_cells():
    out = set()
    for x in range(111):
        for k in range(4):
            out |= {L.clamp(*p) for p in [(x + k, 10 - k), (x + k, 10 + k)]}
    return out


def test_continent_channel():
    # 005c 49 < 50, 0071 n = 1; ovl06:005d(1, 0, 1): (0, 10) -> (0x6f, 10) (007d, 0095), one
    # 05aa roll per step (111); the 7-wide band runs along dir8(k +- 1) = (1, -+1); then 060c:
    # pass 1 (x outer from 0, in place) turns (0, 9) into water through the flat x - 1 wrap to
    # (111, 8), not (0, 11): (111, 10) is still land when x = 0 runs; later (111, 10) itself
    # turns, its flat x + 1 being (0, 11); no pass-3 pattern (no die); then shore.
    script = OUTLINE_WALK + [(100, 0, 49), (3, -1, 1), (156, -1, 10), (156, -1, 10)] + [(4, 0, 1)] * 111
    w = work(script, fill=WATER)
    straight_map_header(w.buf)
    L.continent(w)
    w.rng.assert_done()
    wet = cells(w.buf, WATER) | cells(w.buf, SHORE)
    assert wet == channel_cells() | {(0, 9), (111, 10), (111, 155)}
    assert w.buf.grid(50, 10) == WATER and w.buf.grid(50, 7) == SHORE and w.buf.grid(0, 10) == SHORE
    assert w.buf.grid(0, 9) == SHORE and w.buf.grid(111, 7) == SHORE and w.buf.grid(0, 11) == LAND
    assert w.buf.grid(111, 10) == WATER


def test_continent_zero_channels_still_cleans(monkeypatch):
    calls = []
    real = RV.cleanup
    monkeypatch.setattr(RV, "cleanup", lambda w: (calls.append("cleanup"), real(w)))
    w = work(OUTLINE_WALK + [(100, 0, 1), (3, -1, 0)], fill=WATER)
    straight_map_header(w.buf)
    L.continent(w)
    w.rng.assert_done()
    assert calls == ["cleanup"]


# --------------------------------------------------------------------------- ovl06


def test_river_second_water_sighting_ends_it():
    # 005d(0, 1, 0): source (10, 10) hills (00af / 00c2), mouth (30, 10) water (010b / 011e);
    # the look-ahead sees (15, 10) at c = 14 (hits 1) and (20, 10) at c = 19 (done)
    w = work([(112, -1, 10), (156, -1, 10), (112, -1, 30), (156, -1, 10)] + [(4, 0, 1)] * 10, fill=LAND)
    b = w.buf
    put(b, HILLS, (10, 10))
    put(b, WATER, (15, 10), (20, 10), (30, 10))
    RV.river(w, 0, 1, 0)
    w.rng.assert_done()
    want = {(x, 10) for x in range(10, 20)} | {(x + 1, 10 + d) for x in range(10, 20) for d in (-1, 1)}
    assert cells(b, WATER) == want | {(20, 10), (30, 10)}


def test_river_drift_follows_the_last_matching_index():
    # r 2 -> c += dir8(k + 2), r 3 -> c += dir8(k + 6) (05be / 05d7), k recomputed per step
    w = work([(112, -1, 10), (156, -1, 10), (112, -1, 13), (156, -1, 10),
              (4, 0, 2), (4, 0, 3), (4, 0, 1), (4, 0, 1)], fill=LAND)
    b = w.buf
    put(b, MOUNTAINS, (10, 10))
    put(b, WATER, (13, 10))
    RV.river(w, 0, 1, 0)
    w.rng.assert_done()
    assert cells(b, WATER) == {(10, 10), (11, 9), (11, 11), (12, 9), (11, 10), (12, 11), (12, 10),
                               (13, 9), (13, 11), (13, 10)}


def test_river_keeps_the_last_of_200_samples():
    script = [(112, -1, 40), (156, -1, 40)] * 199 + [(112, -1, 50), (156, -1, 50)]
    script += [(112, -1, 52), (156, -1, 50), (4, 0, 1), (4, 0, 1)]
    w = work(script, fill=LAND)
    put(w.buf, WATER, (52, 50))
    RV.river(w, 0, 1, 0)
    w.rng.assert_done()
    assert cells(w.buf, WATER) == {(50, 50), (51, 49), (51, 51), (51, 50), (52, 49), (52, 51), (52, 50)}


def test_wide_river_paints_two_diagonals_each_side():
    w = work([(112, -1, 10), (156, -1, 10), (112, -1, 12), (156, -1, 10), (4, 0, 1), (4, 0, 1)],
             fill=LAND)
    put(w.buf, HILLS, (10, 10))
    put(w.buf, SHORE, (12, 10))                         # a mouth on shore; the look-ahead wants 2
    RV.river(w, 1, 1, 0)
    w.rng.assert_done()
    want = {(x, 10) for x in (10, 11)} | {(x + 1, 10 + d) for x in (10, 11) for d in (-1, 1)} \
        | {(x + 2, 10 + d) for x in (10, 11) for d in (-2, 2)}
    assert cells(w.buf, WATER) == want


def test_cleanup_pass1_counts_flat_neighbours():
    w = work(fill=LAND)
    b = w.buf
    put(b, WATER, (0, 21), (1, 20), (111, 19))          # (0, 20): x - 1 is (111, 19)
    put(b, SHORE, (40, 41), (41, 40), (39, 40))         # hills with three wet sides
    put(b, HILLS, (40, 40))
    put(b, WATER, (60, 61), (61, 60), (59, 60))
    put(b, FOREST, (60, 60))                            # forest is not tested
    RV.cleanup(w)
    assert b.grid(0, 20) == WATER and b.grid(40, 40) == WATER and b.grid(60, 60) == FOREST


def test_cleanup_pass2_drops_lonely_shore():
    w = work(fill=WATER)
    b = w.buf
    put(b, SHORE, (20, 20), (40, 40))
    put(b, LAND, (41, 41), (42, 41), (41, 42), (42, 42))
    RV.cleanup(w)
    assert b.grid(20, 20) == WATER and b.grid(40, 40) == SHORE


@pytest.mark.parametrize("roll,first", [(4, True), (5, False)])
def test_cleanup_pass3_diagonal_gaps(roll, first):
    # 08de / 0a0d rnd(1, 10, 0) < 5; the side squares must be hills / forest / land (not 6)
    w = work([(10, 0, roll), (10, 0, roll)], fill=MOUNTAINS)
    b = w.buf
    put(b, WATER, (50, 50), (51, 51), (49, 49))
    put(b, FOREST, (51, 49))
    put(b, LAND, (49, 51))
    put(b, WATER, (60, 50), (59, 51), (61, 49))
    put(b, HILLS, (59, 49))
    put(b, LAND, (61, 51))
    put(b, WATER, (70, 50), (71, 51), (69, 49))         # side squares mountains: no pattern
    RV.cleanup(w)
    w.rng.assert_done()
    assert (b.grid(51, 49), b.grid(49, 51)) == ((SHORE, LAND) if first else (FOREST, SHORE))
    assert (b.grid(59, 49), b.grid(61, 51)) == ((SHORE, LAND) if first else (HILLS, SHORE))


def test_rivers_stage_order(monkeypatch):
    log = []
    monkeypatch.setattr(RV, "river", lambda w, *a: log.append(("river",) + a))
    monkeypatch.setattr(RV, "cleanup", lambda w: log.append("cleanup"))
    monkeypatch.setattr(L, "shore", lambda b: log.append("shore"))
    monkeypatch.setattr(RG, "smooth", lambda w: log.append("smooth"))
    monkeypatch.setattr(RG, "hill_ring", lambda b: log.append("ring"))
    w = work()
    w.buf.set_word(0x3A, 2)
    w.buf.set_word(0x38, 1)
    RV.rivers(w)
    assert log == [("river", 0, 1, 0), ("river", 0, 1, 0), ("river", 1, 1, 0), "cleanup", "shore",
                   "smooth", "ring", "cleanup", "shore"]


# --------------------------------------------------------------------------- ovl04


def test_smooth_pass1():
    w = work(fill=LAND)
    b = w.buf
    put(b, MOUNTAINS, (20, 21), (21, 20), (19, 20), (20, 19))
    put(b, HILLS, (30, 31), (31, 30), (29, 30), (30, 29))
    put(b, MOUNTAINS, (0, 41), (1, 40), (0, 39))        # border land square: not filled
    put(b, MOUNTAINS, (50, 50))
    put(b, SHORE, (51, 51))
    put(b, MOUNTAINS, (0, 60))
    put(b, SHORE, (1, 61))                              # border mountains next to shore too
    RG.smooth(w)
    w.rng.assert_done()
    assert b.grid(20, 20) == MOUNTAINS and b.grid(30, 30) == HILLS and b.grid(0, 40) == LAND
    assert b.grid(50, 50) == LAND and b.grid(0, 60) == LAND


@pytest.mark.parametrize("roll,first", [(5, True), (6, False)])
def test_smooth_pass2_closes_diagonal_mountains(roll, first):
    # 0233 / 02d8: rnd(1, 10, 0) <= 5 (jg 5) -> the first square
    w = work([(10, 0, roll), (10, 0, roll)], fill=LAND)
    b = w.buf
    put(b, MOUNTAINS, (69, 69), (70, 70), (71, 71))     # centre (70, 70), first test
    put(b, MOUNTAINS, (89, 71), (90, 70), (91, 69))     # centre (90, 70), mirror test
    RG.smooth(w)
    w.rng.assert_done()
    got1 = (b.grid(71, 69), b.grid(69, 71))
    got2 = (b.grid(89, 69), b.grid(91, 71))
    assert got1 == ((MOUNTAINS, LAND) if first else (LAND, MOUNTAINS))
    assert got2 == ((MOUNTAINS, LAND) if first else (LAND, MOUNTAINS))


def test_hill_ring():
    w = work(fill=WATER)
    b = w.buf
    put(b, MOUNTAINS, (10, 10), (11, 10))
    put(b, HILLS, (12, 11))
    RG.hill_ring(b)
    ring = {(x, y) for x in range(9, 13) for y in range(9, 12)} - {(10, 10), (11, 10)}
    assert cells(b, HILLS) == ring and cells(b, MOUNTAINS) == {(10, 10), (11, 10)}


def seeds(b):
    return [tuple(b.word(0x5DD6 + 14 * n + f) for f in (0, 2, 4, 6))
            for n in range(b.word(0x611E))]


def test_place_seeds_retries_until_land_and_records():
    w = work([(112, -1, 5), (156, -1, 5), (112, -1, 6), (156, -1, 7), (112, -1, 8), (156, -1, 9),
              (112, -1, 1), (156, -1, 2)], fill=LAND)
    b = w.buf
    put(b, WATER, (5, 5))
    b.set_word(0x34, 2)
    b.set_word(0x36, 1)
    RG.place_seeds(w, (2, 6), 0x34, "ovl04:04b4")
    RG.place_seeds(w, (1, 5), 0x36, "ovl04:03ce")
    w.rng.assert_done()
    assert seeds(b) == [(6, 7, 2, 0), (8, 9, 2, 0), (1, 2, 1, 0)]
    assert b.grid(6, 7) == MOUNTAINS and b.grid(1, 2) == HILLS


def add_seed(b, x, y, typ, links=()):
    n = b.word(0x611E)
    r = 0x5DD6 + 14 * n
    b.set_point(r, x, y)
    b.set_word(r + 4, typ)
    b.set_word(r + 6, len(links))
    for k, t in enumerate(links):
        b.set_word(r + 8 + 2 * k, t)
    b.set_word(0x611E, n + 1)


def links(b, n):
    r = 0x5DD6 + 14 * n
    return [b.word(r + 8 + 2 * k) for k in range(b.word(r + 6))]


def test_link_seeds_nearest_lowest_index_on_ties():
    # 05d8 rnd(1, 4, -1) (type 2), 05b2 rnd(1, 2, -1) (type 1); n = min(d, count - 1)
    w = work([(4, -1, 3), (2, -1, 1), (4, -1, 0), (2, -1, 1)])
    b = w.buf
    add_seed(b, 10, 10, 2)
    add_seed(b, 13, 10, 1)
    add_seed(b, 10, 14, 2)
    add_seed(b, 30, 30, 1)
    RG.link_seeds(w)
    w.rng.assert_done()
    assert [links(b, n) for n in range(4)] == [[1, 2, 3], [0], [], [0]]


def test_link_seeds_cap_and_single_seed():
    w = work([(4, -1, 3), (4, -1, 2)])
    add_seed(w.buf, 10, 10, 2)
    add_seed(w.buf, 20, 10, 2)
    RG.link_seeds(w)
    w.rng.assert_done()
    assert links(w.buf, 0) == [1] and links(w.buf, 1) == [0]
    w = work()
    add_seed(w.buf, 10, 10, 2)
    RG.link_seeds(w)                                    # count <= 1: no die
    assert w.buf.word(0x5DD6 + 6) == 0


def test_line_width3_paints_two_away_and_the_unclamped_side():
    # 09a7 westwards along row 0: a = dir8(6 + 2) = (0, 1), b = dir8(6 + 6) = (0, -1); width 3
    # paints cur, clamp(cur + 2a) and the unclamped cur + 2b = row -2 (RANDOM.DAT +0x6040 +x)
    w = work([(3, 0, 1)], fill=LAND)
    b = w.buf
    b.data[0x6047], b.data[0x6046], b.data[0x6045] = 7, 5, 3
    RG.line(w, (8, 0), (5, 0), 3, MOUNTAINS)
    w.rng.assert_done()
    assert cells(b, MOUNTAINS) == {(7, 0), (6, 0), (5, 0), (7, 2), (6, 2), (5, 2)}
    assert (b.data[0x6047], b.data[0x6046], b.data[0x6045]) == (6, 6, 3)


def test_line_width2_wraps_the_unclamped_side_to_the_next_row():
    w = work([(3, 0, 1)], fill=LAND)
    b = w.buf
    RG.line(w, (111, 20), (111, 17), 2, MOUNTAINS)
    w.rng.assert_done()
    assert cells(b, MOUNTAINS) == {(111, 19), (111, 18), (111, 17), (110, 19), (110, 18), (110, 17),
                                   (0, 20), (0, 19), (0, 18)}


def test_line_rotation_sets_the_momentum():
    w = work([(3, 0, 3), (5, 0, 1), (3, 0, 2), (3, 0, 1), (3, 0, 1)], fill=LAND)
    RG.line(w, (10, 10), (16, 10), 1, MOUNTAINS)
    w.rng.assert_done()
    assert cells(w.buf, MOUNTAINS) == {(11, 11), (12, 12), (13, 11), (14, 11), (15, 10), (16, 10)}


def test_line_paints_only_land_and_hills():
    w = work([], fill=WATER)
    put(w.buf, HILLS, (11, 10))
    put(w.buf, FOREST, (12, 10))
    RG.line(w, (10, 10), (12, 10), 1, MOUNTAINS)
    assert cells(w.buf, MOUNTAINS) == {(11, 10)} and w.buf.grid(12, 10) == FOREST


def test_stub_rolls_then_draws():
    # 0884: t = clamp(3 - 9, 3 - 9) = (0, 0) (0892, 08aa), width rnd(1, 2, 1) (08d8) = 2; the
    # line's last step puts the unclamped b = (1, -1) on row -1 (+0x60b1)
    w = work([(5, -10, -9), (5, -10, -9), (2, 1, 2), (3, 0, 1)], fill=LAND)
    b = w.buf
    b.data[0x60B1] = 7
    RG.stub(w, 3, 3, MOUNTAINS)
    w.rng.assert_done()
    assert cells(b, MOUNTAINS) == {(2, 2), (1, 3), (3, 1), (1, 1), (0, 2), (2, 0), (0, 0), (0, 1)}
    assert b.data[0x60B1] == 6


def test_draw_ridges_mountain_and_hill_links():
    # seed 0 (type 2) -> 0962 width die (0971) value 6; seed 1 (type 1) -> a type-2 target:
    # 0962 again
    w = work([(2, 1, 2), (3, 0, 1), (2, 1, 3), (3, 0, 1)], fill=LAND)
    b = w.buf
    add_seed(b, 10, 10, 2, [1])
    add_seed(b, 13, 10, 1, [0])
    RG.draw_ridges(w)
    w.rng.assert_done()
    east = {(x, y) for x in (11, 12, 13) for y in (9, 10, 11)}
    west = {(10, 10), (11, 10), (12, 10)} | {(x, y) for x in (10, 11, 12) for y in (8, 12)}
    assert cells(b, MOUNTAINS) == east | west


def test_draw_ridges_hill_to_hill_has_no_width_die():
    w = work([(3, 0, 1), (3, 0, 1)], fill=LAND)
    b = w.buf
    add_seed(b, 10, 10, 1, [1])
    add_seed(b, 13, 10, 1, [0])
    RG.draw_ridges(w)
    w.rng.assert_done()
    assert (11, 12) in cells(b, HILLS) and (11, 11) not in cells(b, HILLS)


def test_draw_ridges_line_from_a_square_to_itself_keeps_the_previous_index():
    # 09a7 [bp-0x26]: a line with p1 == p2 steps (0, 0), matches no direction, and paints its
    # side squares from the index the previous line left (all callers share one frame).
    # Seed 0 (type 2) -> seed 1: the diagonal NW (index 5), width die 2, 28 walk dice.  Seeds
    # 1 and 2 (type 1, same square) link each other: 098c, width 3 value 5, no die.
    w = work([(2, 1, 2)] + [(3, 0, 1)] * 28, fill=LAND)
    b = w.buf
    add_seed(b, 50, 50, 2, [1])
    add_seed(b, 20, 20, 1, [2])
    add_seed(b, 20, 20, 1, [1])
    RG.draw_ridges(w)
    w.rng.assert_done()
    # index 5: a = T[7] = (-1, 1), b = T[3] = (1, -1); 2a clamped, 2b raw
    assert cells(b, HILLS) == {(18, 22), (22, 18)}


def test_draw_ridges_stubs():
    # type 1 without links -> 08f3 (value 5, dice 0901 / 0919 / 0947), type 2 -> 0884 (value 6)
    line5 = [(3, 0, 1)] * 3
    w = work([(5, -10, -5), (5, -10, -5), (2, 1, 2)] + line5 + [(5, -10, -5), (5, -10, -5), (2, 1, 2)]
             + line5, fill=LAND)
    b = w.buf
    add_seed(b, 20, 20, 1)
    add_seed(b, 40, 40, 2)
    RG.draw_ridges(w)
    w.rng.assert_done()
    assert {(19, 19), (15, 15)} <= cells(b, HILLS) and {(39, 39), (35, 35)} <= cells(b, MOUNTAINS)
    w = work([], fill=LAND)
    add_seed(w.buf, 20, 20, 1)
    RG.draw_ridges(w)                                   # one seed: nothing
    assert cells(w.buf, HILLS) == set()


def test_ridges_resets_the_seed_count():
    w = work([], fill=LAND)
    w.buf.set_word(0x611E, 5)
    RG.ridges(w)
    assert w.buf.word(0x611E) == 0 and cells(w.buf, LAND) == {(x, y) for x in range(W) for y in range(H)}


# --------------------------------------------------------------------------- ovl07


CUT_TO = [(112, -1, 10), (156, -1, 10), (112, -1, 14), (156, -1, 10)]


def test_cut_mode0_mountains_to_hills():
    w = work(CUT_TO, fill=MOUNTAINS)
    b = w.buf
    put(b, HILLS, (12, 10))                             # centre not mountains: skipped
    put(b, WATER, (12, 9))                              # overwritten once a centre qualifies
    RG.cut(w, 0)
    w.rng.assert_done()
    want = set()
    for x in (10, 11, 13):
        want |= {(x, 10), (x + 1, 9), (x + 1, 11), (x + 2, 8), (x + 2, 12)}
    assert cells(b, HILLS) == want | {(12, 10)} and b.grid(14, 10) == MOUNTAINS


def test_cut_mode1_clamps_at_the_edge():
    w = work([(112, -1, 0), (156, -1, 0), (112, -1, 2), (156, -1, 0)], fill=HILLS)
    RG.cut(w, 1)
    w.rng.assert_done()
    # c = (0, 0): five squares clamped; c = (1, 0) is land by then (its own square was
    # painted), so nothing more
    assert cells(w.buf, LAND) == {(0, 0), (1, 0), (1, 1), (2, 0), (2, 2)}
    assert w.buf.oob_writes == 0


def test_cut_and_river_take_the_last_matching_index():
    # 00d9..00fa / 019c..01bd: k = the last index whose entry equals the step; with a
    # duplicate (1, 0) at dir8(7) the side squares are dir8(0) / dir8(6) instead
    w = work([(112, -1, 10), (156, -1, 10), (112, -1, 12), (156, -1, 10)], fill=MOUNTAINS)
    w.buf.set_point(0xBC + 4 * 7, 1, 0)
    RG.cut(w, 0)
    w.rng.assert_done()
    want = set()
    for x in (10, 11):
        want |= {(x, 10), (x, 11), (x - 1, 10), (x, 12), (x - 2, 10)}
    assert cells(w.buf, HILLS) == want
    w = work([(112, -1, 10), (156, -1, 10), (112, -1, 12), (156, -1, 10), (4, 0, 1), (4, 0, 1)],
             fill=LAND)
    w.buf.set_point(0xBC + 4 * 7, 1, 0)
    put(w.buf, HILLS, (10, 10))
    put(w.buf, WATER, (12, 10))
    RV.river(w, 0, 1, 0)
    w.rng.assert_done()
    assert cells(w.buf, WATER) == {(10, 10), (10, 11), (9, 10), (11, 10), (11, 11), (12, 10)}


def test_line_takes_the_last_matching_index():
    w = work([], fill=LAND)
    w.buf.set_point(0xBC + 4 * 7, 1, 0)                 # idx 7: a = dir8(1), b = dir8(5)
    RG.line(w, (10, 10), (12, 10), 2, MOUNTAINS)
    assert cells(w.buf, MOUNTAINS) == {(11, 10), (12, 11), (10, 9), (12, 10), (13, 11), (11, 9)}


def test_cuts_stage(monkeypatch):
    log = []
    monkeypatch.setattr(RG, "cut", lambda w, mode: log.append(mode))
    w = work(fill=LAND)
    b = w.buf
    b.set_word(0x40, 2)
    b.set_word(0x3E, 1)
    put(b, HILLS, (30, 30))
    put(b, MOUNTAINS, (30, 31), (31, 30), (29, 30))     # 04d6: 3 of 4 -> mountains
    put(b, HILLS, (60, 61), (61, 60), (59, 60))         # 05ae: land with 3 hills -> hills
    put(b, HILLS, (0, 80))
    put(b, MOUNTAINS, (0, 81), (1, 80), (0, 79))        # border: skipped
    RG.cuts(w)
    assert log == [0, 0, 1]
    assert b.grid(30, 30) == MOUNTAINS and b.grid(60, 60) == HILLS and b.grid(0, 80) == HILLS
    assert b.grid(32, 31) == HILLS                      # 033a ring around the new mountains


# --------------------------------------------------------------------------- ovl05


def test_forest_init_and_done():
    w = work(fill=WATER)
    b = w.buf
    sq = [(x, y) for y in range(10, 13) for x in range(100)]
    put(b, LAND, *sq[:250])
    put(b, HILLS, *sq[250:280])
    put(b, MOUNTAINS, *sq[280:300])
    put(b, FOREST, *[(x, 50) for x in range(100)])     # not counted
    b.set_word(0x3C, 15)
    b.set_word(0x1F52, 99)
    F.forest_init(b)
    assert b.word(0x1F54) == 45 and b.word(0x1F52) == 0
    assert not F.forest_done(b)
    b.set_word(0x1F52, 45)
    assert F.forest_done(b)
    b.set_word(0x1F54, 0)
    b.set_word(0x1F52, -1)                              # signed compare
    assert not F.forest_done(b)


# rnd(1, A - k / 2, B - k / 4) (0271) and rnd(1, A - k / 2, B - k / 3) (029b) for A = 4, B = 2,
# k = 1..10, with the value taken (positive sides: 1 + add; sides 0: add, no draw; sides < 0:
# one draw, 1 + add here).
SMALL_ARM = [
    [(4, 2, 3), (4, 2, 3)],          # k 1
    [(3, 2, 3), (3, 2, 3)],          # k 2
    [(3, 2, 3), (3, 1, 2)],          # k 3
    [(2, 1, 2), (2, 1, 2)],          # k 4
    [(2, 1, 2), (2, 1, 2)],          # k 5
    [(1, 1, 2), (1, 0, 1)],          # k 6
    [(1, 1, 2), (1, 0, 1)],          # k 7
    [(0, 0, 0), (0, 0, 0)],          # k 8: sides 0
    [(0, 0, 0), (0, -1, -1)],        # k 9
    [(-1, 0, 1), (-1, -1, 0)],       # k 10: sides -1, one draw each
]


def test_forest_blob_small_shape_sides_zero_and_negative():
    script = [(112, -1, 50), (156, -1, 40), (100, 0, 64), (8, 2, 10)] + [(8, 2, 3)] * 7
    script += [e for k in SMALL_ARM for e in k]
    for _ in range(7):
        script += [e for k in SMALL_ARM[:3] for e in k]
    w = work(script, fill=LAND)
    b = w.buf
    F.forest_blob(w)
    w.rng.assert_done()
    assert {(50, y) for y in range(40, 51)} <= cells(b, FOREST)
    assert b.grid(51, 50) == FOREST and b.grid(49, 50) == LAND     # k 10: n1 = 1 east, n2 = 0
    assert b.word(0x1F52) == len(cells(b, FOREST))


# The same for the large shape, A = 6, B = 4, k = 1..6.
LARGE_ARM = [
    [(6, 4, 5), (6, 4, 5)],          # k 1
    [(5, 4, 5), (5, 4, 5)],          # k 2
    [(5, 4, 5), (5, 3, 4)],          # k 3
    [(4, 3, 4), (4, 3, 4)],          # k 4
    [(4, 3, 4), (4, 3, 4)],          # k 5
    [(3, 3, 4), (3, 2, 3)],          # k 6
]


def test_forest_blob_large_shape_and_retry():
    # 00c9 / 00dc retried on water; 0107 65 -> the large shape: 8 x rnd(1, 10, 5) (0152)
    script = [(112, -1, 1), (156, -1, 1), (112, -1, 60), (156, -1, 60), (100, 0, 65)]
    script += [(10, 5, 6)] * 8
    script += [e for _ in range(8) for k in LARGE_ARM for e in k]
    w = work(script, fill=LAND)
    put(w.buf, WATER, (1, 1))
    F.forest_blob(w)
    w.rng.assert_done()
    assert w.buf.grid(60, 60) == FOREST and w.buf.word(0x1F52) == len(cells(w.buf, FOREST))


def test_forest_fill():
    w = work([(10, 0, 4)], fill=WATER)
    b = w.buf
    put(b, LAND, (20, 20))
    put(b, FOREST, (20, 21), (21, 20), (19, 20))         # pass 1: 3 of 4 -> forest, counted
    put(b, LAND, (0, 41))
    put(b, FOREST, (0, 42), (1, 41), (111, 40))          # flat x - 1 of (0, 41) is (111, 40)
    put(b, FOREST, (50, 50), (51, 51), (49, 49))
    put(b, SHORE, (51, 49))                              # pass 2 side squares: hills / shore / land
    put(b, LAND, (49, 51))
    put(b, FOREST, (70, 50), (71, 51), (69, 49))
    put(b, FOREST, (71, 49))                             # forest is not a side square
    put(b, LAND, (69, 51))
    F.forest_fill(w)
    w.rng.assert_done()
    assert b.grid(20, 20) == FOREST and b.grid(0, 41) == FOREST and b.word(0x1F52) == 2
    assert b.grid(51, 49) == FOREST and b.grid(49, 51) == LAND


def test_forest_fill_pass_two_mirror_branch_and_the_five_boundary():
    # cond A fails, the mirror test (05c1..0678) passes: die 067f < 5 (0687 jge) -> (x-1, y-1),
    # else (x+1, y+1); cond A with 5 (0584) -> its second square (x-1, y+1).  x outer order.
    w = work([(10, 0, 4), (10, 0, 5), (10, 0, 5)], fill=WATER)
    b = w.buf
    put(b, FOREST, (30, 30), (29, 31), (31, 29))
    put(b, LAND, (29, 29), (31, 31))
    put(b, FOREST, (60, 80), (59, 81), (61, 79))
    put(b, HILLS, (59, 79))
    put(b, SHORE, (61, 81))
    put(b, FOREST, (90, 100), (91, 101), (89, 99))
    put(b, HILLS, (91, 99))
    put(b, LAND, (89, 101))
    F.forest_fill(w)
    w.rng.assert_done()
    assert (b.grid(29, 29), b.grid(31, 31)) == (FOREST, LAND)            # roll 4
    assert (b.grid(59, 79), b.grid(61, 81)) == (HILLS, FOREST)           # roll 5
    assert (b.grid(91, 99), b.grid(89, 101)) == (HILLS, FOREST)          # cond A, roll 5
    assert b.word(0x1F52) == 0                                           # pass 2 does not count


def test_forests_stage_stops_at_the_target():
    w = work([], fill=LAND)
    w.buf.set_word(0x3C, 0)
    F.forests(w)                                         # target 0: tested before the first blob
    assert w.buf.word(0x1F54) == 0 and cells(w.buf, FOREST) == set()


# --------------------------------------------------------------------------- ovl08


def test_spray_independent_directions():
    # 0029: n = rnd(1, 5, 3) (0038); per drop a (004d), d (005e), b (0082), e (0093)
    w = work([(5, 3, 4),
              (3, 0, 2), (8, -1, 2), (3, 0, 1), (8, -1, 0),        # (50 + 2, 50 + 1)
              (3, 0, 3), (8, -1, 6), (3, 0, 3), (8, -1, 4),        # (47, 47): water
              (3, 0, 1), (8, -1, 0), (3, 0, 1), (8, -1, 2),        # (50, 50)
              (3, 0, 3), (8, -1, 6), (3, 0, 3), (8, -1, 4)], fill=LAND)
    b = w.buf
    put(b, WATER, (47, 47))
    M.spray(w, 50, 50)
    w.rng.assert_done()
    assert cells(b, MARSH) == {(52, 51), (50, 50)}


def test_spray_clamps():
    w = work([(5, 3, 4)] + [(3, 0, 3), (8, -1, 5), (3, 0, 3), (8, -1, 5)] * 4, fill=LAND)
    M.spray(w, 1, 1)
    w.rng.assert_done()
    assert cells(w.buf, MARSH) == {(0, 0)}


def centre_sprays():
    """Five sprays whose drops all land on the spray's own square (a = 1, d = 0: dx 0;
    b = 1, e = 2: dy 0)."""
    return ([(5, 3, 4)] + [(3, 0, 1), (8, -1, 0), (3, 0, 1), (8, -1, 2)] * 4) * 5


def test_marsh_blob_fifth_land_hit_is_taken():
    script = [(102, 5, 10), (146, 5, 10)]                # water: not counted
    for x in (20, 30, 40, 50, 60):
        script += [(102, 5, x), (146, 5, 80)]
    w = work(script + centre_sprays(), fill=LAND)
    put(w.buf, WATER, (10, 10))
    M.marsh_blob(w)
    w.rng.assert_done()
    assert cells(w.buf, MARSH) == {(60, 80), (61, 81), (59, 79), (59, 81), (61, 79)}


def test_marsh_blob_takes_a_coastal_hit():
    # (x + 1, y) = (21, 20) has the shore (22, 21) as a neighbour (ovl03:11f5, 0188)
    w = work([(102, 5, 20), (146, 5, 20)] + centre_sprays(), fill=LAND)
    put(w.buf, SHORE, (22, 21))
    M.marsh_blob(w)
    w.rng.assert_done()
    assert (20, 20) in cells(w.buf, MARSH)


def test_marsh_blob_spray_order():
    # 01fc..023b: spray at (x, y), (x+1, y+1), (x-1, y-1), (x-1, y+1), (x+1, y-1); the third
    # spray's first drop goes one square east (a = 1, d = 2; b = 1, e = 2)
    third = [(5, 3, 4), (3, 0, 1), (8, -1, 2), (3, 0, 1), (8, -1, 2)] + \
        [(3, 0, 1), (8, -1, 0), (3, 0, 1), (8, -1, 2)] * 3
    sprays = centre_sprays()
    one = len(sprays) // 5
    w = work([(102, 5, 20), (146, 5, 20)] + sprays[:2 * one] + third + sprays[3 * one:], fill=LAND)
    put(w.buf, SHORE, (22, 19))                          # next to (x + 1, y) only (0188)
    M.marsh_blob(w)
    w.rng.assert_done()
    assert cells(w.buf, MARSH) == {(20, 20), (21, 21), (19, 19), (19, 21), (21, 19), (20, 19)}


def test_marshes_count():
    w = work([(3, 0, 2), (102, 5, 20), (146, 5, 20)] + centre_sprays()
             + [(102, 5, 30), (146, 5, 30)] + centre_sprays(), fill=LAND)
    put(w.buf, SHORE, (19, 19), (29, 29))
    M.marshes(w)
    w.rng.assert_done()
    assert cells(w.buf, MARSH) >= {(20, 20), (30, 30)}


# --------------------------------------------------------------------------- a real run


def stage_calls():
    """The pipeline's own stage calls (so the names R0 resolves are exercised)."""
    by = {c.__name__: c for _, calls in RM.PIPELINE for c in calls}
    return [by[n] for n in ("continent", "ridges", "cuts", "rivers", "forests", "marshes")]


def nbrs(x, y):
    return [(x + dx, y + dy) for dx in (-1, 0, 1) for dy in (-1, 0, 1)
            if (dx or dy) and 0 <= x + dx < W and 0 <= y + dy < H]


def real_run(game, seed, sliders=(3, 3, 2, 3), check=True):
    from warlords2.formats.gamedir import GameDir
    gd = GameDir(game)
    buf = RM.load_buffer(gd.read)
    RM.apply_sliders(buf, list(sliders))
    rng = RecordingRng(Rng(seed, "borland"))
    w = RM.Work(buf, rng, RM.RandomRun(), gd.read)
    RM.clear_grid(w)
    g = lambda: [buf.grid(x, y) for x in range(W) for y in range(H)]
    for stage in stage_calls():
        assert stage(w) is None
        if not check:
            continue
        vals = set(g())
        name = stage.__name__
        if name == "continent":
            assert vals <= {WATER, SHORE, LAND}
            assert not any(buf.grid(*p) == LAND for x, y in cells(buf, WATER) for p in nbrs(x, y))
        if name == "ridges":
            assert buf.word(0x611E) == buf.word(0x34) + buf.word(0x36)
        if name in ("ridges", "cuts"):
            assert vals <= {WATER, SHORE, HILLS, MOUNTAINS, LAND}
            assert all(buf.grid(*p) in (HILLS, MOUNTAINS)
                       for x, y in cells(buf, MOUNTAINS) for p in nbrs(x, y))
        if name == "rivers":
            assert vals <= {WATER, SHORE, HILLS, MOUNTAINS, LAND}
            assert not any(buf.grid(*p) in (LAND, HILLS, MOUNTAINS)
                           for x, y in cells(buf, WATER) for p in nbrs(x, y))
        if name == "forests":
            assert buf.word(0x1F52) >= buf.word(0x1F54) > 0 and FOREST in vals
        if name == "marshes":
            assert MARSH in vals and vals <= {WATER, SHORE, FOREST, HILLS, MOUNTAINS, LAND, MARSH}
    return w


@pytest.mark.gamedata
@pytest.mark.parametrize("seed,sliders", [(1, (3, 3, 2, 3)), (7, (0, 0, 0, 0)), (11, (6, 6, 6, 6))])
def test_real_run_stage_invariants(game, seed, sliders):
    real_run(game, seed, sliders)


@pytest.mark.gamedata
def test_real_run_is_deterministic(game):
    a = real_run(game, 5, check=False)
    b = real_run(game, 5, check=False)
    c = real_run(game, 6, check=False)
    assert a.buf.data == b.buf.data and a.rng.calls == b.rng.calls
    assert a.buf.data != c.buf.data


@pytest.mark.gamedata
def test_real_runs_reach_every_dice_signature(game, monkeypatch):
    edge = []
    real = RV.river
    monkeypatch.setattr(RV, "river", lambda w, *a: (edge.append(a), real(w, *a))[1])
    seen = set()
    for seed in range(1, 7):
        seen |= {(d, s, a) for d, s, a, _ in real_run(game, seed, check=False).rng.calls}
    fixed = {(1, 100, 0), (1, 3, -1), (1, 3, 0), (1, 3, -2), (1, 16, 0),        # ovl03, 04ae
             (1, 112, -1), (1, 156, -1), (1, 2, -1), (1, 4, -1), (1, 5, -10),   # ovl04 / 07 / 06
             (1, 2, 1), (1, 10, 0), (1, 4, 0),
             (1, 8, 2), (1, 10, 5),                                             # ovl05
             (1, 5, 3), (1, 8, -1), (1, 102, 5), (1, 146, 5)}                   # ovl08
    assert fixed <= seen
    assert any(s == 5 and a in (-2, -1, 0, 1, 2, 4, 5) for _, s, a in seen)      # ovl03:1091
    assert (1, 0, 0) in seen or any(s == 0 for _, s, _ in seen)                 # zero sides
    assert (1, 0, 1) in edge                                                    # channels
