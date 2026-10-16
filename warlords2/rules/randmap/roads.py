"""Stage 80 of the random-map generator, ovl12:0000: the tiling ovl09:0000, bridges, ports and
the roads between city pairs, laid through the path search of 0555 in the road-builder mode.

* The work block ovl12 allocates (0x2bc bytes, DS:3f8e / 3f92) is modelled as one flat image
  (`Slots`): X +0x000, Y +0x064, Z +0x0c8 (bridge orientation), U +0x12c (slot taken),
  A +0x190 (distance to the nearest city), B +0x1f4 (to the nearest taken slot), 50 words each,
  and CU +0x258, 100 bytes (city used).  Every byte is written before it is read [V].
* Bridges (05b4 / 08f6): only tile 0x26 with 0x28 / 0x18 to the right yields a candidate that
  can pass (the vertical test of the source is compiled `h && .. || h && ..`), so every bridge
  is horizontal (tiles 0x85 / 0x86, grid 1, road piece 1 on both flanks).
* Ports (01f6 / 03c3): one rnd(1, 2, -1) per interior square, then up to 10 ports (the pick
  runs an 11th time and rolls).
* Roads (0e22 / 0b86 / 0ad0 / 0c1c / 0f4b): a pair of cities 30..70 apart, a free square on
  the ring around each, `rules.pathfinding.find_path` in the road-builder mode (cost map of
  0555:0d9e for side 0xE, DS:00e0 = 1) and road piece 1 on every land square of the path.

The path search shares the pathfinder's run memory with the games of the run: the path cache
DS:3f7e (20 slots, read and written here; cleared only at its allocation 0555:02f2 and by a
game load ovl29:0e51), the search field DS:3f86 and the cost map DS:3f82.  `PathRun` (core)
holds them; the stage takes `work.pathfinder` as the host passed it (`random_begin(pathfinder=)`,
the previous game's; None: a fresh run) and leaves it there for the host to hand to the next
game (rules.saveload BEGIN_FIELDS path_cache / dist_table, EL §10.7; core module docstring).
"""
from __future__ import annotations

from types import SimpleNamespace

from ...model.ids import MAP_PORT
from ..constants import movement as MK
from ..constants import randmap as K
from ..pathfinding import cost_map, distance, find_path, step
from . import PathRun
from . import tiles as T
from .buffer import Region

# ---------------------------------------------------------------- the ovl12 work block
NONE = -1


class Slots(Region):
    """The ovl12 work block (0x2bc bytes) with its word arrays."""

    def __init__(self):
        super().__init__(K.SLOTS_SIZE.value, name="ovl12 work block")

    def get(self, arr: int, i: int) -> int:
        """Word i of the array at `arr` (signed).
        Evidence: asm ovl12 `word ptr es:[bx + arr]`, bx = 2 i (e.g. 0179..018f)."""
        return self.word(arr + 2 * i)

    def put(self, arr: int, i: int, v: int) -> None:
        """Write word i of the array at `arr`.
        Evidence: asm ovl12 word stores (0179..018f, 0343 / 0346, 0762..076c)."""
        self.set_word(arr + 2 * i, v)

    def used(self, c: int) -> int:
        """CU byte of city c, sign-extended (cwde).
        Evidence: asm ovl12:0e4f..0e54, 0eb7..0ebc."""
        return self.sbyte(K.CITY_USED.value + c)

    def set_used(self, c: int, v: int) -> None:
        """Write CU byte of city c.
        Evidence: asm ovl12:009d, 0e73, 0f2c, 0f91."""
        self.set_byte(K.CITY_USED.value + c, v)


# ---------------------------------------------------------------- helpers


def _ncity(work) -> int:
    return work.scn.word(K.SCN_CITY_COUNT.value)


def _city(work, c: int) -> tuple[int, int]:
    r = K.CITY_LEN.value * c
    return work.scn.word(K.SCN_CITY_X.value + r), work.scn.word(K.SCN_CITY_Y.value + r)


def _dist(x1: int, y1: int, x2: int, y2: int) -> int:
    return distance((x1, y1), (x2, y2))


def land(work, x: int, y: int) -> bool:
    """ovl12:0a7f(x, y): grid (flat index, no bounds test) is 7, 4 or 5.
    Evidence: asm ovl12:0a7f..0acf."""
    return work.buf.grid(x, y) in K.ROAD_LAND.value


def pathfinder(work) -> PathRun:
    """The run's pathfinder memory for this generation: `work.pathfinder` as the host passed it
    (the previous game's), or a fresh `PathRun` (a run whose path cache 0555:02f2 allocates and
    clears at the first 0d9e), stored in `work.pathfinder` for the host to take.
    Evidence: asm 0555:0da6..0dae (DS:00de == 0 -> 02f2: allocate, 0350 clear)."""
    if work.pathfinder is None:
        work.pathfinder = PathRun()
    return work.pathfinder


class SearchView:
    """The memory images 0555 reads during a road search, as a GameState-like view: map words
    1e1d (low / high bytes), road layer 19d9, SCN terrain table 0x710, the SCN city records,
    SCN 0x124 (hidden map), 0x110 and 0x0d0[p] (ovl25:09ab), plus the pathfinder's run words."""

    def __init__(self, work, run: PathRun):
        m, scn = work.map, work.scn
        n = K.GRID_W.value * K.GRID_H.value
        self.world = SimpleNamespace(
            tiles=[m.data[2 * i] for i in range(n)], flags=[m.data[2 * i + 1] for i in range(n)],
            roads=list(work.roads.data[:n]),
            terrain_of_tile=[scn.byte(K.TERRAIN_TABLE.value + t) for t in range(K.N_TILES.value)])
        self.cities = [SimpleNamespace(x=x, y=y) for x, y in
                       (_city(work, c) for c in range(max(_ncity(work), 0)))]
        self.options = SimpleNamespace(hidden_map=scn.word(K.SCN_HIDDEN.value))
        self.players = [SimpleNamespace(control=scn.word(K.SCN_CONTROL.value + 2 * p))
                        for p in range(K.N_SIDES.value)]
        self.current = scn.word(K.SCN_SIDE.value)
        self.road_mode = run.road_mode
        self.cost_map = run.cost_map
        self.path_cache = run.path_cache
        self.dist_table = run.dist_table


def rebuild_cost_map(work, run: PathRun) -> None:
    """0555:0d9e(0x0e, 1): DS:3f6c = 0xE, DS:00e0 = 1, the cost map for side 0xE (DS:01e0
    costs, road 1, city squares 0 unless their owner nibble is 0xE) from the memory as it is.
    Evidence: asm 0555:0d9e..1088 (0dc3..0dd6, 0e46..0e72); `rules.pathfinding.cost_map`."""
    run.side = K.ROAD_SIDE.value
    run.road_mode = True
    view = SearchView(work, run)
    run.cost_map = cost_map(view, K.ROAD_SIDE.value)


def search(work, run: PathRun, src: tuple, dst: tuple):
    """0555:000a for the request {src, dst, mask 0, mode 1}: direction codes or None, through
    the run's path cache and cost map (both changed in place, the field kept in DS:3f86).
    Evidence: asm ovl12:0c25..0c62 (request record, 0555:000a); rules.pathfinding.find_path."""
    view = SearchView(work, run)
    codes = find_path(view, src, dst, K.SEARCH_MODE.value, K.SEARCH_MASK.value)
    run.dist_table = view.dist_table
    return codes


# ---------------------------------------------------------------- bridges and ports


def _clear_slot(b: Slots, s: int) -> None:
    for arr in (K.SLOT_B.value, K.SLOT_A.value, K.SLOT_Z.value, K.SLOT_Y.value, K.SLOT_X.value):
        b.put(arr, s, NONE)


def bridges_and_ports(work, b: Slots) -> None:
    """ovl12:0165(buf): slots 49..0 := -1 (B, A, Z, Y, X) and U := 0; bridges 05b4; the slots
    not taken := -1 again (U kept); ports 01f6.
    Evidence: asm ovl12:0165..01f5."""
    for s in range(K.N_WORK_SLOTS.value - 1, -1, -1):
        _clear_slot(b, s)
        b.put(K.SLOT_U.value, s, 0)
    bridges(work, b)
    for s in range(K.N_WORK_SLOTS.value - 1, -1, -1):
        if b.get(K.SLOT_U.value, s) == 0:
            _clear_slot(b, s)
    ports(work, b)


def bridges(work, b: Slots) -> None:
    """ovl12:05b4(buf): candidates for y 1..0x99, x 1..0x6d (y outer): tile 0x26 / 0x16 with
    0x28 / 0x18 to the right, or 0x21 / 0x11 with 0x24 / 0x14 below; h = (tile == 0x26); a
    candidate passes when h and land on both sides (x - 1, x + 2) or h and land above and below
    (y - 1, y + 2); up to 50 are kept (X, Y, Z = h).  Then while `pick_bridge` gives a slot:
    U := 1 and the bridge is built: Z != 0: tiles 0x85 / 0x86 at x / x + 1, grid 1 on both,
    road piece 1 at x + 2 and x - 1; Z == 0 (unreachable): 0x84 / 0x94 at y / y + 1, grid 1,
    road piece 1 at y + 2 and y - 1.  Tiles low bytes only.
    Evidence: asm ovl12:05b4..08f5 (06f3..074c the h && .. || h && .. test, 0752 the cap,
    07aa..0845 / 0848..08d3 the two builds)."""
    m, buf, r = work.map, work.buf, work.roads
    n = 0
    for y in range(*K.BRIDGE_ROWS.value):
        for x in range(*K.BRIDGE_COLS.value):
            t = m.lo(x, y)
            cand = ((t in K.BRIDGE_LEFT.value and m.lo(x + 1, y) in K.BRIDGE_RIGHT.value)
                    or (t in K.BRIDGE_TOP.value and m.lo(x, y + 1) in K.BRIDGE_BELOW.value))
            if not cand:
                continue
            h = 1 if t == K.BRIDGE_H.value else 0
            ok = ((h and land(work, x - 1, y) and land(work, x + 2, y))
                  or (h and land(work, x, y - 1) and land(work, x, y + 2)))
            if ok and n < K.N_WORK_SLOTS.value:
                b.put(K.SLOT_X.value, n, x)
                b.put(K.SLOT_Y.value, n, y)
                b.put(K.SLOT_Z.value, n, h)
                n += 1
    if n == 0:
        return
    piece = K.BRIDGE_PIECE.value
    while True:
        s = pick_bridge(work, b, n)
        if s == NONE:
            return
        b.put(K.SLOT_U.value, s, 1)
        x, y = b.get(K.SLOT_X.value, s), b.get(K.SLOT_Y.value, s)
        if b.get(K.SLOT_Z.value, s) != 0:
            m.set_lo(x, y, K.BRIDGE_TILES_H.value[0])
            m.set_lo(x + 1, y, K.BRIDGE_TILES_H.value[1])
            buf.set_grid(x + 1, y, K.GRID_BRIDGE.value)
            buf.set_grid(x, y, K.GRID_BRIDGE.value)
            r.set_at(x + 2, y, (r.at(x + 2, y) & K.ROAD_KEEP.value) | piece)
            r.set_at(x - 1, y, (r.at(x - 1, y) & K.ROAD_KEEP.value) | piece)
        else:
            m.set_lo(x, y, K.BRIDGE_TILES_V.value[0])
            m.set_lo(x, y + 1, K.BRIDGE_TILES_V.value[1])
            buf.set_grid(x, y + 1, K.GRID_BRIDGE.value)
            buf.set_grid(x, y, K.GRID_BRIDGE.value)
            r.set_at(x, y + 2, (r.at(x, y + 2) & K.ROAD_KEEP.value) | piece)
            r.set_at(x, y - 1, (r.at(x, y - 1) & K.ROAD_KEEP.value) | piece)


def _city_distances(work, b: Slots, s: int) -> int:
    best = K.ROADS_FAR.value
    sx, sy = b.get(K.SLOT_X.value, s), b.get(K.SLOT_Y.value, s)
    for c in range(_ncity(work) - 1, -1, -1):
        cx, cy = _city(work, c)
        d = _dist(sx, sy, cx, cy)
        if d < best:
            best = d
    return best


def _taken_distance(b: Slots, s: int, n: int) -> int:
    best = K.ROADS_FAR.value
    sx, sy = b.get(K.SLOT_X.value, s), b.get(K.SLOT_Y.value, s)
    for t in range(n - 1, -1, -1):
        if b.get(K.SLOT_U.value, t) != 0:
            d = _dist(sx, sy, b.get(K.SLOT_X.value, t), b.get(K.SLOT_Y.value, t))
            if d < best:
                best = d
    return best


def _score(work, b: Slots, s: int) -> int:
    v = work.rng.rnd(*K.PICK_ROLL.value)
    a = K.CITY_BONUS.value - b.get(K.SLOT_A.value, s)
    return v + (a if a >= 0 else 0)


def pick_bridge(work, b: Slots, n: int) -> int:
    """ovl12:08f6(buf, n): when A[0] == -1, A[s] = distance to the nearest city (cities
    ncity-1..0, start 10000) for s = n-1..0; B[s] = distance to the nearest taken slot for the
    free slots; then over s = n-1..0 free with B[s] >= 10: v = rnd(1, 15, 1) + max(0, 30 - A[s])
    (the die first), the first strict maximum wins; -1 when none.
    Evidence: asm ovl12:08f6..0a7e (die 0a30)."""
    best, bestv = NONE, NONE
    if b.get(K.SLOT_A.value, 0) == NONE:
        for s in range(n - 1, -1, -1):
            b.put(K.SLOT_A.value, s, _city_distances(work, b, s))
    for s in range(n - 1, -1, -1):
        if b.get(K.SLOT_U.value, s) == 0:
            b.put(K.SLOT_B.value, s, _taken_distance(b, s, n))
    for s in range(n - 1, -1, -1):
        if b.get(K.SLOT_U.value, s) == 0 and b.get(K.SLOT_B.value, s) >= K.NEAR_TAKEN.value:
            v = _score(work, b, s)
            if v > bestv:
                bestv, best = v, s
    return best


def port_spacing(b: Slots, x: int, y: int) -> int:
    """ovl12:0565(buf, x, y): distance from (x, y) to the nearest filled slot (X != -1, slots
    49..0), 10000 when none.
    Evidence: asm ovl12:0565..05b3."""
    best = K.ROADS_FAR.value
    for s in range(K.N_WORK_SLOTS.value - 1, -1, -1):
        if b.get(K.SLOT_X.value, s) != NONE:
            d = _dist(x, y, b.get(K.SLOT_X.value, s), b.get(K.SLOT_Y.value, s))
            if d < best:
                best = d
    return best


def ports(work, b: Slots) -> None:
    """ovl12:01f6(buf): for y 1..0x99, x 1..0x6d (y outer): rnd(1, 2, -1) (every square, before
    any test), on 0: a coast tile 0x20..0x25 whose three squares outward (west 0x20 / 0x23,
    north 0x21, east 0x22 / 0x25, south 0x24) are all grid 2 (flat reads, all three read) and
    which lies >= 15 from every filled slot goes into the first slot with X == -1.  Then A[0] =
    -1 and while `pick_port` gives a slot and fewer than 10 ports are made: U := 1, map high
    byte | 0x80 (port).
    Evidence: asm ovl12:01f6..03b6 (die 0217; table cs:03b7; 0315..0346; 035d; 039a..03b1)."""
    buf, m, rng = work.buf, work.map, work.rng
    for y in range(*K.BRIDGE_ROWS.value):
        for x in range(*K.BRIDGE_COLS.value):
            if rng.rnd(*K.PORT_ROLL.value) != 0:
                continue
            k = (m.lo(x, y) - K.PORT_TILE0.value) & 0xFFFF
            ok = 0
            if k <= len(K.PORT_PROBES.value) - 1:
                dx, dy = K.PORT_PROBES.value[k]
                ok = 1
                for i in (3, 2, 1):
                    if buf.grid(x + i * dx, y + i * dy) != K.PORT_WATER.value:
                        ok = 0
            if ok and port_spacing(b, x, y) >= K.PORT_SPACING.value:
                for s in range(K.N_WORK_SLOTS.value):
                    if b.get(K.SLOT_X.value, s) == NONE:
                        b.put(K.SLOT_X.value, s, x)
                        b.put(K.SLOT_Y.value, s, y)
                        break
    b.put(K.SLOT_A.value, 0, NONE)
    made = 0
    while True:
        s = pick_port(work, b)
        if s == NONE or made >= K.MAX_PORTS.value:
            return
        made += 1
        b.put(K.SLOT_U.value, s, 1)
        x, y = b.get(K.SLOT_X.value, s), b.get(K.SLOT_Y.value, s)
        m.set_hi(x, y, m.hi(x, y) | MAP_PORT)


def pick_port(work, b: Slots) -> int:
    """ovl12:03c3(buf): when A[0] == -1, A[s] for the filled slots 49..0 (nearest city); B[s]
    for the free filled slots (computed, not used); then over s = 49..0 free and filled:
    v = rnd(1, 15, 1) + max(0, 30 - A[s]), the first strict maximum wins; -1 when none.
    Evidence: asm ovl12:03c3..0564 (die 0516)."""
    n = K.N_WORK_SLOTS.value
    best, bestv = NONE, NONE
    if b.get(K.SLOT_A.value, 0) == NONE:
        for s in range(n - 1, -1, -1):
            if b.get(K.SLOT_X.value, s) != NONE:
                b.put(K.SLOT_A.value, s, _city_distances(work, b, s))
    for s in range(n - 1, -1, -1):
        if b.get(K.SLOT_U.value, s) == 0 and b.get(K.SLOT_X.value, s) != NONE:
            b.put(K.SLOT_B.value, s, _taken_distance(b, s, n))
    for s in range(n - 1, -1, -1):
        if b.get(K.SLOT_U.value, s) == 0 and b.get(K.SLOT_X.value, s) != NONE:
            v = _score(work, b, s)
            if v > bestv:
                bestv, best = v, s
    return best


# ---------------------------------------------------------------- roads


def choose_pair(work, b: Slots):
    """ovl12:0e22(buf, &a, &b): up to 80 tries c = rnd(1, ncity, -1) for an unused city a (none:
    no pair, 0); CU[a] = 1; over unused c = ncity-1..0 at distance 30..70 from a, r = rnd(1,
    1000, 0), the first strict maximum is b; none: start again (a stays used); else CU[b] = 1.
    Returns (a, b) or None.
    Evidence: asm ovl12:0e22..0f4a (dice 0e40, 0f01; restart 0f23 -> 0e2a)."""
    rng = work.rng
    lo, hi = K.PAIR_DIST.value
    while True:
        a = NONE
        n = _ncity(work)
        for _ in range(K.PAIR_TRIES.value):
            c = rng.rnd(1, n, -1)
            if b.used(c) == 0:
                a = c
                break
        if a == NONE:
            return None
        b.set_used(a, 1)
        ax, ay = _city(work, a)
        best, bestv = NONE, NONE
        for c in range(_ncity(work) - 1, -1, -1):
            if b.used(c) != 0:
                continue
            cx, cy = _city(work, c)
            d = _dist(ax, ay, cx, cy)
            if lo <= d <= hi:
                v = rng.rnd(*K.PAIR_ROLL.value)
                if v > bestv:
                    bestv, best = v, c
        if best != NONE:
            b.set_used(best, 1)
            return a, best


def ring_square(work, x: int, y: int):
    """ovl12:0ad0(x, y, &p): up to 8 tries p = (x, y) + DS:0382[rnd(1, 12, -1)] until the grid
    at p (flat, no bounds test) is 7, 4 or 5.  Returns (found, p): p is the last try on failure.
    Evidence: asm ovl12:0ad0..0b85 (die 0ae5)."""
    p = (x, y)
    for _ in range(K.RING_TRIES.value):
        dx, dy = K.RING.value[work.rng.rnd(*K.RING_ROLL.value)]
        p = (x + dx, y + dy)
        if land(work, *p):
            return True, p
    return False, p


def mark_near(work, b: Slots, x: int, y: int) -> None:
    """ovl12:0f4b(buf, x, y): every city c = ncity-1..0 closer than 10 to (x, y) is used.
    Evidence: asm ovl12:0f4b..0fa0."""
    for c in range(_ncity(work) - 1, -1, -1):
        cx, cy = _city(work, c)
        if _dist(x, y, cx, cy) < K.MARK_DIST.value:
            b.set_used(c, 1)


def lay_road(work, b: Slots, run: PathRun, x0: int, y0: int, x1: int, y1: int, stop: int) -> int:
    """ovl12:0c1c(buf, x0, y0, x1, y1, stop): the path from (x0, y0) to (x1, y1) (0555:000a,
    mode 1, mask 0); none -> 0.  Then for up to 200 codes, k += 1: stop at (x1, y1), at code
    0xff, at the map edge (0a8b:0b4d), or on a road square when `stop`; a square of grid 3, 2, 1
    gets no road (when its terrain SCN 0x710 is not 3, 2, 1 the EXE's debug branch sets the
    view centre SCN 0x17d / 0x17f and draws), any other gets road piece 1; when k > 5: k = 0 and
    `mark_near`.  The start square gets no road, the target does.  Returns 1.
    Evidence: asm ovl12:0c1c..0e21."""
    codes = search(work, run, (x0, y0), (x1, y1))
    if codes is None:
        return 0
    dirs = list(codes[:K.ROAD_STEPS.value]) + [MK.NO_DIRECTION.value] * (K.ROAD_STEPS.value - len(codes))
    buf, m, r, scn = work.buf, work.map, work.roads, work.scn
    x, y, k = x0, y0, 0
    for i in range(K.ROAD_STEPS.value):
        k += 1
        if (x, y) == (x1, y1):
            break
        d = dirs[i]
        if d == MK.NO_DIRECTION.value:
            break
        nxt = step(x, y, d)
        if nxt is None:
            break
        x, y = nxt
        if r.at(x, y) & K.ROAD_BITS.value and stop:
            break
        if buf.grid(x, y) in K.WATER_GRID.value:
            if scn.byte(K.TERRAIN_TABLE.value + m.lo(x, y)) not in K.WATER_GRID.value:
                scn.set_word(K.VIEW_X.value, x)                      # debug branch, [I] unreachable
                scn.set_word(K.VIEW_Y.value, y)
        else:
            r.set_at(x, y, (r.at(x, y) & K.ROAD_KEEP.value) | K.ROAD_PIECE.value)
        if k > K.MARK_EVERY.value:
            k = 0
            mark_near(work, b, x, y)
    return 1


def connect(work, b: Slots, run: PathRun, a: int, c: int) -> int:
    """ovl12:0b86(buf, a, b): a ring square of city a, then (only if found) one of city b; both
    found and different -> `lay_road` with stop 0; else 0.
    Evidence: asm ovl12:0b86..0c1b."""
    ok, p0 = ring_square(work, *_city(work, a))
    if not ok:
        return 0
    ok, p1 = ring_square(work, *_city(work, c))
    if not ok or p0 == p1:
        return 0
    return lay_road(work, b, run, p0[0], p0[1], p1[0], p1[1], 0)


def roads(work):
    """ovl12:0000 (stage 80, generator of its percentages): 81; the tiling ovl09:0000; map high
    bit 7 and road bits 0x1f cleared everywhere; 82; bridges and ports (0165); CU[99..0] = 0;
    83; while `choose_pair` gives a pair: while si < 10 (from 4) rnd(1, 3, -1) == 0 shows 0x50 +
    si (si += 1); 0555:0d9e(0x0e, 1); `connect`.  Last, the road byte of every grid 0xb square
    &= 0xe0.  The pathfinder memory is `work.pathfinder` (`pathfinder`).
    Evidence: asm ovl12:0000..0164 (00b7..00dc: `cmp si, 0xa; jge` before the die)."""
    b = Slots()
    run = pathfinder(work)
    p81, p82, p83 = K.ROADS_PROGRESS.value
    yield p81
    T.tiling(work)
    m, r, buf = work.map, work.roads, work.buf
    for x in range(K.GRID_W.value):
        for y in range(K.GRID_H.value):
            m.set_hi(x, y, m.hi(x, y) & K.HI_CLEAR.value)
            r.set_at(x, y, r.at(x, y) & K.ROAD_KEEP.value)
    yield p82
    bridges_and_ports(work, b)
    for c in range(K.N_CITY_USED.value - 1, -1, -1):
        b.set_used(c, 0)
    yield p83
    si, top, base, roll = K.PAIR_PROGRESS.value
    while True:
        pair = choose_pair(work, b)
        if pair is None:
            break
        if si < top and work.rng.rnd(*roll) == 0:
            yield base + si
            si += 1
        rebuild_cost_map(work, run)
        connect(work, b, run, *pair)
    for y in range(K.GRID_H.value):
        for x in range(K.GRID_W.value):
            if buf.grid(x, y) == K.SITE_GRID.value:
                r.set_at(x, y, r.at(x, y) & K.ROAD_KEEP.value)
