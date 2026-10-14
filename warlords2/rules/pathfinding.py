"""The path search of the original (resident segment 0555) and the per-turn reach.

Addresses are resident code; "asm" = capstone listing, "decomp" = out/rea/decomp/.

* cost map 0555:0d9e: one byte per square for the side whose turn it is: bits 0-2 the cost
  (DS:1274, road 1, foreign city 0), 0x08 water, 0x10 crossing (bridge, port, own coastal
  city), 0x20 hills, 0x40 woods, 0x80 city;
* search 0555:000a: direct step for a neighbour (0555:020e); else the distance field of
  0555:08bf / 0555:0373 is flooded *from the destination* in growing squares inside a box
  around both ends (margin 6, then 50) until the start square is settled, and 0555:117b walks
  down the field from the start.  The search is not a shortest-path algorithm: it stops at
  the sweep that settles the start, cells are relaxed in sweep order, and ties go to the
  first neighbour in the order of DS:0212 rotated to an octant taken from the *previously
  tried* square (registers DI/CX, asm 0555:1224) — all reproduced here;
* reach 0555:18be with the step cost 0555:19e4.

The cost map is one buffer of the original (DS:3f82), kept in `GameState.cost_map` and rebuilt
only where the original calls 0555:0d9e, always for SCN 0x110 (`rebuild_cost_map`):

  ovl61:2194  main-loop pass, after ovl62:0000 (2183), before the side's turn   -> M8a (turn)
  ovl36:0f69  after a city is taken (rules.city.take_city)                       -> done (M6a)
  ovl49:0391 / ovl49:138a  the two load-game paths (ovl49:02d3, ovl49:12f2)      -> M10b
  ovl29:0402  ovl29:0398 (AI per-city tables, from ovl29:010b in the new game) with
              SCN 0x110 forced to 0 -> rules.setup builds it for side 0 there; ovl61:2194
              rebuilds it before the first command.  (ovl12:00e3 builds it for side 0xE in the
              random-map road builder, X20.)
The search patches the target city into it and restores it afterwards in place (0555:0bde),
and the restore is not the inverse of the patch (see `_restore_target_city`).

The path cache (`GameState.path_cache`, 20 `PathSlot`s, 0555:02f2) is looked up before the
direct step and before any search, and a search result is stored in it (`find_path`); it is
cleared only by 0555:0350: at its allocation (0555:02f2, first use) and on the save path
(ovl29:0dff at ovl29:0e51) -> `clear_cache`.  Not modelled: the view scroll 0555:13e4 (called on
an uninitialised stack word, display only) and the distance-map mode (mask bit 0x10,
0555:1ab9, AI only: it skips the cache lookup and store but still patches the cost map).
"""
from __future__ import annotations

from math import isqrt

from ..model.ids import MAP_H, MAP_OWNER_MASK, MAP_PORT, MAP_W, ROAD_PIECE_MASK, Control, Terrain
from ..model.state import PATH_SLOT_CODES, cleared_path_cache
from .constants import movement as K

W, H = MAP_W, MAP_H


def _terrain(state, x: int, y: int) -> int:
    w = state.world
    return w.terrain_of_tile[w.tiles[y * W + x]]


def step(x: int, y: int, d: int):
    """Square one step in direction d (0 = north, clockwise), or None at the map edge.
    Evidence: 0a8b:0b4d with DS:2b16 / DS:2b04 (fails on x or y < 0, x == 112, y == 156)."""
    nx, ny = x + K.DIR_DX.value[d], y + K.DIR_DY.value[d]
    if nx < 0 or ny < 0 or nx == W or ny == H:
        return None
    return nx, ny


def direction(x1: int, y1: int, x2: int, y2: int) -> int:
    """Octant from (x1, y1) towards (x2, y2); 0xff for the same point.
    Evidence: decomp 01b394 (0a8b:0ae4)."""
    if x1 == x2 and y1 == y2:
        return K.NO_DIRECTION.value
    if x1 == x2:
        return 0 if y2 < y1 else 4
    if y1 == y2:
        return 6 if x2 < x1 else 2
    if x1 <= x2:
        return 1 if y2 < y1 else 3
    return 7 if y2 < y1 else 5


def coastal(state, x: int, y: int) -> bool:
    """Whether the city block at (x, y) touches Bridge, Water or Shore on its 12-square ring.
    Evidence: decomp 0165ed (0555:109d) with DS:01f8; the walk gives up at the map edge."""
    w = state.world
    i = y * W + x - 1                    # flat index as coded: x = 0 reads the row above
    if i >= 0 and w.terrain_of_tile[w.tiles[i]] == Terrain.CITY:
        x -= 1
    i = (y - 1) * W + x
    if i >= 0 and w.terrain_of_tile[w.tiles[i]] == Terrain.CITY:
        y -= 1
    for d in K.COAST_WALK.value:
        nxt = step(x, y, d)
        if nxt is None:
            return False
        x, y = nxt
        if _terrain(state, x, y) in K.COAST_TERRAIN.value:
            return True
    return False


def cost_map(state, side: int | None = None) -> list[int]:
    """Cost-map bytes for `side` (default: the side whose turn it is), index y*112 + x.
    Evidence: asm 0555:0d9e..1085 (table DS:1274, jump table 0555:1089, city owner nibble of
    the map word compared with the side, port bit -> 0x10, razed coastal cities -> 0x18);
    EL §4.1."""
    side = state.current if side is None else side
    w = state.world
    table = K.ALT_TERRAIN_COST.value if side == K.ALT_TABLE_SIDE.value else K.TERRAIN_COST.value
    flags_of = K.TERRAIN_FLAGS.value
    out = [0] * (W * H)
    for y in range(H):
        for x in range(W):
            i = y * W + x
            t = w.terrain_of_tile[w.tiles[i]]
            b = K.ROAD_COST.value if w.roads[i] & ROAD_PIECE_MASK else table[t]
            if t == Terrain.CITY:
                if w.flags[i] & MAP_OWNER_MASK != side:
                    b = 0
                elif coastal(state, x, y):
                    b |= K.COAST_FLAGS.value
                b |= K.CM_CITY.value
            else:
                b |= flags_of.get(t, 0)
            if w.flags[i] & MAP_PORT:
                b |= K.CM_CROSSING.value
            out[i] = b
    for c in reversed(state.cities):                     # asm 0555:0f81..1066
        if _terrain(state, c.x, c.y) != Terrain.CITY and coastal(state, c.x, c.y):
            for dx, dy in ((0, 0), (0, 1), (1, 0), (1, 1)):
                out[(c.y + dy) * W + c.x + dx] |= K.COAST_FLAGS.value
    return out


def rebuild_cost_map(state) -> None:
    """Rebuild the cached cost map for the side whose turn it is (SCN 0x110).
    Evidence: every movement caller of 0555:0d9e passes (SCN 0x110, 1): asm ovl61:2188..2194,
    ovl36:0f5d..0f69, ovl49:0385..0391, ovl49:137e..138a."""
    state.cost_map = cost_map(state, state.current)


def cached_cost_map(state) -> list[int]:
    """The cached cost map; raises when it was never built.
    Evidence: 0555:0373, 18be and 19e4 read the buffer DS:3f82 through DS:3f76 (asm 0555:1924,
    19f3) without rebuilding it."""
    if not state.cost_map:
        raise RuntimeError("cost map not built: call rules.pathfinding.rebuild_cost_map "
                           "(0555:0d9e, the main loop does it at ovl61:2194)")
    return state.cost_map


def clear_cache(state) -> None:
    """Clear the 20 path-cache slots (all words and codes 0).
    Evidence: asm 0555:0350 -> 0555:146c for slots 19..0 (only when the cache exists, DS:00de);
    callers 0555:02f2 (allocation on first use) and ovl29:0e51 (save path ovl29:0dff)."""
    state.path_cache = cleared_path_cache()


def entry_cost(cm: list[int], x: int, y: int, mode: int, mask: int, stopped: bool):
    """(cost of entering (x, y), stop flag after it) for a stack in `mode` / `mask`.
    Evidence: decomp 016f34 (0555:19e4): 0x80 once stopped; mode 2: 2 on water without
    crossing, else 1 for cost 1 and 2 otherwise; mode 1: a square whose water bit differs
    from the aboard bit (mask & 8) without crossing sets the stop flag (its own cost still
    counts), and c > 2 on hills/woods with the matching bonus costs 2; mode 0: the cost."""
    if stopped:
        return K.STOPPED_STEP_COST.value, True
    b = cm[y * W + x]
    c = b & K.CM_COST.value
    water, cross = b & K.CM_WATER.value, b & K.CM_CROSSING.value
    if mode == K.MODE_FLY.value:
        if not water or cross:
            return (K.FLY_CHEAP.value if c == K.FLY_CHEAP.value else K.FLY_COST.value), False
        return K.FLY_COST.value, False
    if mode == K.MODE_LAND.value:
        aboard = mask & K.MASK_ABOARD.value
        if not cross and ((aboard and not water) or (not aboard and water)):
            stopped = True
        if mask and c > 2 and ((mask & K.MASK_HILLS.value and b & K.CM_HILLS.value)
                               or (mask & K.MASK_WOODS.value and b & K.CM_WOODS.value)):
            c = K.BONUS_COST.value
    return c, stopped


def _human_hidden(state) -> bool:
    """0555:08bf bVar1: Hidden Map on and the side is not computer-run (ovl25:09ab: SCN 0x0D0
    of the side == 1, or DS:0836 = 1 while the computer phase ovl25 runs, set at ovl25:0071)."""
    return bool(state.options.hidden_map) and state.players[state.current].control != Control.COMPUTER


def _city_index_at(state, x: int, y: int) -> int:
    """0555:0bde: last city record (scan from the end) whose 2x2 block holds (x, y)."""
    for i in range(len(state.cities) - 1, -1, -1):
        c = state.cities[i]
        if c.x <= x <= c.x + 1 and c.y <= y <= c.y + 1:
            return i
    return -1


_CITY_PATCH_ORDER = ((1, 1), (0, 1), (0, 0), (1, 0))   # DS:01ce / DS:01d6 words at 6, 4, 2, 0


def _open_target_city(state, cm, x, y) -> int:
    """0555:0bde(req, 1): a foreign city as destination becomes enterable for the search;
    returns the patched city (DS:3f6a) or -1."""
    if _terrain(state, x, y) != Terrain.CITY:
        return -1
    ci = _city_index_at(state, x, y)
    if ci < 0:
        return -1
    c = state.cities[ci]
    for dx, dy in _CITY_PATCH_ORDER:
        tx, ty = c.x + dx, c.y + dy
        b = K.ENEMY_CITY_PATCH_COST.value
        if coastal(state, tx, ty):
            b |= K.COAST_FLAGS.value
        cm[ty * W + tx] = b | K.CM_CITY.value
    return ci


def _restore_target_city(state, cm, ci: int) -> None:
    """0555:0bde(req, 0) (asm 0555:0d1f..0d85): the patched city's four squares become 1, then 0
    when the map owner nibble is not SCN 0x110, else | 0x18 when coastal; | 0x80.  Not the
    cost-map builder's value: the port bit 0x10 of 0555:0d9e is not restored."""
    c = state.cities[ci]
    for dx, dy in _CITY_PATCH_ORDER:
        tx, ty = c.x + dx, c.y + dy
        i = ty * W + tx
        b = K.ENEMY_CITY_PATCH_COST.value
        if state.world.flags[i] & MAP_OWNER_MASK != state.current:
            b = 0
        elif coastal(state, tx, ty):
            b |= K.COAST_FLAGS.value
        cm[i] = b | K.CM_CITY.value


def _init_field(state, cm, dst, mode) -> list[int]:
    """0555:08bf: 30000 everywhere, BLOCKED where the stack cannot be."""
    hidden = _human_hidden(state)
    roads = state.world.roads
    ex = K.EXPLORED.value
    dx, dy = dst
    dist = [K.UNVISITED.value] * (W * H)
    for y in range(H):
        for x in range(W):
            i = y * W + x
            b = cm[i]
            unexplored = hidden and not roads[i] & ex
            if mode == K.MODE_LAND.value:
                blocked = (unexplored and (x, y) != (dx, dy)) or not b & K.CM_COST.value
            elif mode == K.MODE_SHIP.value:          # asm 0555:0a95: row OR column of dst exempt
                blocked = (unexplored and x != dx and y != dy) or not b & K.CM_WATER.value
            else:                                    # asm 0555:0b69, same exemption
                blocked = ((unexplored and x != dx and y != dy)
                           or (b & K.CM_CITY.value and not b & K.CM_COST.value))
            if blocked:
                dist[i] = K.BLOCKED.value
    return dist


def _neighbours(x: int, y: int):
    """DS:00e2 / 00f6 / 0162 list for the square's edge case (asm 0555:05xx)."""
    if y == 0:
        k = 1 if x == 0 else 3 if x == W - 1 else 2
    elif y == H - 1:
        k = 6 if x == 0 else 8 if x == W - 1 else 7
    elif x == 0:
        k = 4
    elif x == W - 1:
        k = 5
    else:
        k = 0
    j = K.NEIGHBOUR_START.value[k]
    ndx, ndy, end = K.NEIGHBOUR_DX.value, K.NEIGHBOUR_DY.value, K.NEIGHBOUR_END.value
    while ndx[j] != end:
        yield x + ndx[j], y + ndy[j]
        j += 1


class _Search:
    """State of one 0555:000a call: the distance field and the registers the backtrace reads."""

    def __init__(self, state, src, dst, mode, mask):
        self.src, self.dst, self.mode, self.mask = src, dst, mode, mask
        self.cm = cached_cost_map(state)                      # patched in place, see restore()
        self.patched = -1
        di = dst[1] * W + dst[0]
        if self.cm[di] & K.CM_CITY.value and not self.cm[di] & K.CM_COST.value:
            self.patched = _open_target_city(state, self.cm, *dst)   # asm 0555:090c..0928
        self.state = state
        self.penalty = 0
        if mode == K.MODE_LAND.value:
            self.penalty = (K.LANDING_PENALTY_WATER.value
                            if _terrain(state, *dst) in (Terrain.WATER, Terrain.SHORE)
                            else K.LANDING_PENALTY.value)
        self.dist = _init_field(state, self.cm, dst, mode)
        self.radius = 0
        self.cx = 0                                            # CX left by 0555:0373

    def restore(self) -> None:
        """0555:01e0 -> 0555:0bde(req, 0), run after every search."""
        if self.patched >= 0:
            _restore_target_city(self.state, self.cm, self.patched)

    def flood(self, pass_no: int) -> int:
        """0555:0373 (mask bit 0x10, the distance-map mode, is not used by movement)."""
        sx, sy = self.src
        dx, dy = self.dst
        margin = K.PASS_MARGIN.value[pass_no]
        if pass_no == 0:
            self.radius = 0
        self.cx = dy                                           # asm 0555:043d: CX = dst y
        xlo, xhi = max(min(dx, sx) - margin, 0), min(max(dx, sx) + margin, W - 1)
        ylo, yhi = max(min(dy, sy) - margin, 0), min(max(dy, sy) + margin, H - 1)
        dist, cm, mode, mask = self.dist, self.cm, self.mode, self.mask
        blocked = K.BLOCKED.value
        water, cross = K.CM_WATER.value, K.CM_CROSSING.value
        going, result = True, 1
        while going:
            r = self.radius
            expanded = False
            for x in range(max(dx - r, 0, xlo), min(dx + r, W - 1, xhi) + 1):
                for y in range(max(dy - r, 0, ylo), min(dy + r, H - 1, yhi) + 1):
                    i = y * W + x
                    v = dist[i]
                    if v >= 1:
                        continue
                    expanded = True
                    d = -v
                    dist[i] = d
                    b1 = cm[i]
                    for nx, ny in _neighbours(x, y):
                        j = ny * W + nx
                        if dist[j] == blocked:
                            continue
                        b2 = cm[j]
                        c = b2 & K.CM_COST.value
                        self.cx = c
                        if (nx, ny) == (sx, sy):
                            if (mode == K.MODE_LAND.value and not b1 & cross and not b2 & cross
                                    and (b2 & water) != (b1 & water)):
                                continue
                            c = 1
                        elif mode == K.MODE_FLY.value:
                            if b2 & water and not b2 & cross:
                                c = K.FLY_COST.value
                            else:
                                c = c if (c or 2) <= 2 and c else K.FLY_COST.value
                        elif mode == K.MODE_SHIP.value:
                            if not b2 & water and not b2 & K.CM_CITY.value:
                                dist[j] = blocked
                                continue
                        else:
                            if not b1 & cross and not b2 & cross and (b2 & water) != (b1 & water):
                                continue
                            if mask and c > 2 and ((mask & K.MASK_HILLS.value and b2 & K.CM_HILLS.value)
                                                   or (mask & K.MASK_WOODS.value and b2 & K.CM_WOODS.value)):
                                c = K.BONUS_COST.value
                            if (not b1 & water or b1 & cross) and b2 & water and not b2 & cross:
                                c += self.penalty
                        self.cx = c
                        if abs(dist[j]) > d + c:
                            dist[j] = -d - c
                    if (x, y) == (sx, sy):
                        going = False
            self.radius += 1
            if not expanded:
                going, result = False, 0
        return result

    def backtrace(self) -> list[int]:
        """0555:117b: direction codes from the start down the field (<= 198)."""
        x, y = self.src
        dist = self.dist
        best = abs(dist[y * W + x])
        di, cx = K.BACKTRACE_ENTRY_DI.value, self.cx
        cm, mode = self.cm, self.mode
        water, cross = K.CM_WATER.value, K.CM_CROSSING.value
        codes: list[int] = []
        dst = self.dst
        while (x, y) != dst:
            here = cm[y * W + x]
            here_cross = here & cross if mode == K.MODE_LAND.value else 0
            here_water = here & water
            base = direction(di, cx, *dst)
            bx = by = -1
            pick = 0
            for off in K.BACKTRACE_ORDER.value:
                k = (base + off) % 8
                nx, ny = x + K.DIR_DX.value[k], y + K.DIR_DY.value[k]
                di, cx = nx, ny
                if not (0 <= nx < W and 0 <= ny < H):
                    continue
                v = dist[ny * W + nx]
                if v in (K.UNVISITED.value, K.BLOCKED.value):
                    continue
                if not here_cross:
                    nb = cm[ny * W + nx]
                    if not nb & cross and mode == K.MODE_LAND.value and bool(here_water) != bool(nb & water):
                        continue
                if abs(v) < best:
                    best, bx, by, pick = abs(v), nx, ny, k
            if len(codes) >= K.PATH_MAX.value or bx == -1:
                self.dst = dst = (x, y)                       # asm 0555:13aa: path cut here
                break
            x, y = bx, by
            codes.append(pick)
        return codes


def _direct(state, src, dst, mode) -> list[int] | None:
    """0555:020e: one step to a neighbour, by terrain only."""
    ts, td = _terrain(state, *src), _terrain(state, *dst)
    if mode != K.MODE_FLY.value:
        ws, wd = ts in (Terrain.WATER, Terrain.SHORE), td in (Terrain.WATER, Terrain.SHORE)
        if ws != wd or K.TERRAIN_COST.value[td] == 0:
            return None
    return [direction(*src, *dst)]


def distance(src: tuple, dst: tuple) -> int:
    """trunc(sqrt(dx^2 + dy^2)).
    Evidence: 0a8b:0acc (EL §9.7), called by 0555:000a (asm 0555:0026) and 0555:16f0 (175c)."""
    return isqrt((src[0] - dst[0]) ** 2 + (src[1] - dst[1]) ** 2)


def _on_path(slot, src: tuple) -> int:
    """0555:165c: index of `src` on the stored path (walked from the stored source), -1 when a
    0xff code comes first, a step leaves the map, or 200 codes pass."""
    x, y = slot.src
    for i in range(PATH_SLOT_CODES):
        d = slot.codes[i]
        if d == K.NO_DIRECTION.value:
            return -1
        if (x, y) == src:
            return i
        nxt = step(x, y, d)
        if nxt is None:
            return -1
        x, y = nxt
    return -1


def _lookup(state, k: int, src, dst, mode, mask):
    """0555:1595(req, k): same destination, mode and mask (the validity word is not read) and the
    source on the stored path -> the codes from there on, validity = 2."""
    slot = state.path_cache[k]
    if (slot.dst, slot.mode, slot.mask) != (dst, mode, mask):
        return None
    i = _on_path(slot, src)
    if i < 0:
        return None
    slot.valid = K.CACHE_VALID.value
    return slot.codes[i:]


def _store(state, dist: int, src, dst, mode, mask, buf: list[int], far: bool) -> None:
    """0555:16f0(dist, req, far): slot 0 for a near request; else the first slot 1..19 whose
    validity word is 0, else the one with the smallest stored source-destination distance (first
    on ties) if that is below `dist`, else nothing.  201 bytes are copied: the last (always
    0xff) lands in the low byte of the next slot's validity word (for slot 19 it lands past the
    0x10b8-byte block: not modelled)."""
    cache = state.path_cache
    if not far:
        target = 0
    else:
        target, best_d, best = -1, K.CACHE_NO_DISTANCE.value, -1
        for k in range(1, len(cache)):
            if cache[k].valid == 0:
                target = k
                break
            d = distance(cache[k].dst, cache[k].src)
            if d < best_d:
                best_d, best = d, k
        if target == -1 and best != -1 and best_d < dist:
            target = best
        if target == -1:
            return
    slot = cache[target]
    slot.codes = list(buf[:PATH_SLOT_CODES])
    if target + 1 < len(cache):
        nxt = cache[target + 1]
        nxt.valid = (nxt.valid & 0xFF00) | buf[PATH_SLOT_CODES]
    slot.valid = K.CACHE_VALID.value
    slot.mode, slot.mask, slot.src, slot.dst = mode, mask, tuple(src), tuple(dst)


def _codes(buf) -> list[int]:
    out = []
    for d in buf:
        if d == K.NO_DIRECTION.value:
            break
        out.append(d)
    return out


def find_path(state, src: tuple, dst: tuple, mode: int, mask: int) -> list[int] | None:
    """Direction codes (0 = north, clockwise) from `src` towards `dst` for a stack in move
    `mode` with bonus `mask` (rules.movement.stack_mode), or None when there is no path.  The
    path may stop short of `dst` (198 codes, or no lower neighbour).  Reads and writes the
    path cache and patches / restores the cached cost map (`state` changes).
    Evidence: asm 0555:000a: destination off the map -> none (0034..0056); 201-byte buffer
    filled with 0xff (0063..007a); cache slot 0 (1508(req, 0) at 008f), then slots 1..19 when
    0a8b:0acc(src, dst) >= 15 (1508(req, 1) at 00ae); direct step 0555:020e only for distance
    1 (00c3); search 0555:08bf, destination BLOCKED and not a city -> none (0132..015c), passes
    0/1 of 0555:0373, backtrace 0555:117b, whose cut rewrites the request destination
    (0555:13aa); the result stored by 0555:16f0 (dist < 15 -> slot 0, else 1..19; 01b6..01dd);
    target city restored by 0555:0bde(req, 0) (01e0)."""
    if not (0 <= dst[0] < W and 0 <= dst[1] < H):
        return None
    src, dst = tuple(src), tuple(dst)
    dist = distance(src, dst)
    hit = _lookup(state, 0, src, dst, mode, mask)
    if hit is None and dist >= K.CACHE_FAR.value:
        for k in range(1, len(state.path_cache)):
            hit = _lookup(state, k, src, dst, mode, mask)
            if hit is not None:
                break
    if hit is not None:
        return _codes(hit)
    if dist == K.ADJACENT_DISTANCE.value:
        codes = _direct(state, src, dst, mode)
        if codes is not None:
            return codes
    s = _Search(state, src, dst, mode, mask)
    try:
        di = dst[1] * W + dst[0]
        if s.dist[di] == K.BLOCKED.value and not s.cm[di] & K.CM_CITY.value:
            return None
        s.dist[di] = K.START_MARK.value
        found = 0
        for p in range(K.PASSES.value):
            found = s.flood(p)
            if found:
                break
        if found != 1:
            return None
        codes = s.backtrace()
        buf = codes + [K.NO_DIRECTION.value] * (PATH_SLOT_CODES + 1 - len(codes))
        _store(state, dist, src, s.dst, mode, mask, buf, dist >= K.CACHE_FAR.value)
        return codes
    finally:
        s.restore()


def cells(src: tuple, codes) -> list[tuple]:
    """The squares a path of direction codes visits after `src` (stops at 0xff / map edge).
    Evidence: 0a8b:0b4d walk as in 0555:18be."""
    out = []
    x, y = src
    for d in codes:
        if d == K.NO_DIRECTION.value:
            break
        nxt = step(x, y, d)
        if nxt is None:
            break
        x, y = nxt
        out.append(nxt)
    return out


def path_costs(state, src: tuple, codes, mode: int, mask: int) -> list[int]:
    """Cumulative cost after each step (capped at 255), at most 100 steps.
    Evidence: decomp 016e0e (0555:18be) with 0555:19e4; the stop flag starts clear and
    `mask & 8` stands for the aboard state of the whole path."""
    cm = cached_cost_map(state)
    out: list[int] = []
    stopped, cum = False, 0
    for (x, y) in cells(src, list(codes)[:K.REACH_STEPS.value]):
        c, stopped = entry_cost(cm, x, y, mode, mask, stopped)
        cum += c
        out.append(min(cum, K.REACH_CUM_CAP.value))
    return out


def reach_this_turn(state, src: tuple, codes, mode: int, mask: int, moves: int) -> int:
    """Number of path steps whose cumulative cost is <= `moves`.
    Evidence: decomp 016e0e (0555:18be): counts every step with cum <= budget, cum not capped."""
    cm = cached_cost_map(state)
    stopped, cum, n = False, 0, 0
    for (x, y) in cells(src, list(codes)[:K.REACH_STEPS.value]):
        c, stopped = entry_cost(cm, x, y, mode, mask, stopped)
        cum += c
        if cum <= moves:
            n += 1
    return n
