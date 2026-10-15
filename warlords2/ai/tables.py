"""ovl29:0398 / 0749 and ovl25:0656 (ai.md §4.2): the neighbour table NB, six nearest cities
per city by land, built once at new game (ovl53:013a -> ovl30:0000 -> ovl29:010b -> 0398,
before the territories) and saved with the game.  No rnd.
"""
from __future__ import annotations

from ..model.ai import NB_SLOTS
from ..model.ids import MAP_OWNER_MASK, MAP_W
from ..rules import pathfinding as P
from .util import nearest_ring

EMPTY = 0xFF                      # NB id byte of an empty entry (ovl29:03c8)
N_CANDIDATES = 50                 # ovl29:0761 / 0835 (0x32)
PICK_START = 10000                # ovl29:0830 (0x2710)
CROWD, CROWD_PENALTY = 2, 50      # ovl29:0889..0924: a direction with > 2 picks costs + 50
LIMIT, LIMIT_RETRY = 45, 60       # ovl29:058b / 05e7
MODE_LAND, MASK_NONE = 1, 0       # ovl29:056a push dword 1: mode 1, mask 0
SQUARES = ((0, 0), (1, 0), (0, 1), (1, 1))   # the map words +1, +3, +0xe1, +0xe3 of the corner

def nearest_six(state, c: int, dm) -> int:
    """ovl29:0749(c, &NB[6c], &NB[600 + 6c]) on the distance table `dm`.  Candidates: every
    other city d = count-1..0 that ovl21:0a85(d, flag 0) reaches, n counted; each goes into
    the first empty one of 50 slots, or replaces the slot with the largest distance (strict >,
    unsigned bytes; an empty slot found later wins) when its own distance is smaller.  Then up
    to six picks: the candidate (slots 49..0, strict <: the highest slot wins ties) with the
    smallest distance + 50 when it lies in a direction (x <, x >, y <, y > than c's corner)
    already holding more than 2 picks; the pick's id and distance go to NB and count for its
    directions.  Returns n (reachable cities, not the picks).
    Evidence: asm ovl29:0749..0a26 (0751 0555:1b0a lock, 075c..0788 slots, 078a..081b
    candidates: 07b3 ovl21:0a85, 07bd x == -1, 07c3 n += 1, 07cc..07f2 slot search, 07f4..080e
    store; 081e..0a18 picks: 0830 best, 083d..0939 scan, 0946 none, 094e..0a0f store and
    direction counts W [bp-0x10] / E di / N [bp-0x14] / S [bp-0x12]; 0a1b 0555:1b2e)."""
    cities = state.cities
    cand_id = [EMPTY] * N_CANDIDATES
    cand_d = [0] * N_CANDIDATES
    n = 0
    for d in range(len(cities) - 1, -1, -1):
        if d == c:
            continue
        dd, x, _ = nearest_ring(state, d, dm, 0)
        if x == -1:
            continue
        n += 1
        slot, worst = -1, dd
        for s in range(N_CANDIDATES):
            if cand_id[s] == EMPTY:
                slot = s
                break
            if cand_d[s] > worst:
                slot, worst = s, cand_d[s]
        if slot != -1 and (cand_id[slot] == EMPTY or cand_d[slot] > dd):
            cand_id[slot], cand_d[slot] = d & 0xFF, dd & 0xFF
    nb = state.ai.neighbours
    me = cities[c]
    west = east = north = south = 0
    for k in range(NB_SLOTS):
        best, pick = PICK_START, -1
        for s in range(N_CANDIDATES - 1, -1, -1):
            if cand_id[s] == EMPTY:
                continue
            v = cand_d[s]
            t = cities[cand_id[s]]
            if ((t.x < me.x and west > CROWD) or (t.x > me.x and east > CROWD)
                    or (t.y < me.y and north > CROWD) or (t.y > me.y and south > CROWD)):
                v += CROWD_PENALTY
            if v < best:
                best, pick = v, s
        if pick == -1:
            break
        nb.ids[c * NB_SLOTS + k] = cand_id[pick]
        t = cities[cand_id[pick]]
        west += t.x < me.x
        east += t.x > me.x
        north += t.y < me.y
        south += t.y > me.y
        nb.dists[c * NB_SLOTS + k] = cand_d[pick]
        cand_id[pick] = EMPTY
    return n


def build_neighbours(state) -> None:
    """ovl29:0398: NB ids = 0xff, distances = 0 for all 100 cities; SCN 0x110 = 0 for the whole
    build; the cost map for side 0 (0555:0d9e(0, 1)); per city c = 0..count-1: owner byte and
    the owner nibble of its four squares := SCN 0x110 (0), the distance map 0555:1ab9(45, c, land
    mode 1, mask 0) and 0749; when 0749 reached no city, again with limit 60; then the owner
    byte and the four nibbles := the saved owner byte (the nibbles become owner & 0xf, whatever
    they were).  SCN 0x110 is restored.  The cost map is left as the searches left it (0bde
    opens a foreign target city and its restore marks it passable: rules.pathfinding); the
    main loop rebuilds it before the first command (ovl61:2194).  The progress bar ovl61:1463
    is presentation.
    Evidence: asm ovl29:0398..0748 (03b1..03eb init, 03f2 0x110 = 0, 0402 0d9e, 040f..0720
    city loop: 0419 save, 045d / 0499..0565 writes, 058d 1ab9(0x2d), 05bc 0749, 05c4 n == 0,
    05e9 1ab9(0x3c), 0618 0749, 062b..071b restore; 0740 0x110)."""
    nb = state.ai.neighbours
    for i in range(len(nb.ids) - 1, -1, -1):
        nb.ids[i], nb.dists[i] = EMPTY, 0
    saved_current = state.current
    state.current = 0
    try:
        state.cost_map = P.cost_map(state, state.current)
        flags = state.world.flags
        for c, city in enumerate(state.cities):
            old = city.owner & 0xFF
            _own(flags, city, state.current & 0xFF)
            try:
                dm = P.distance_map(state, LIMIT, city.x, city.y, MODE_LAND, MASK_NONE)
                if nearest_six(state, c, dm) == 0:
                    dm = P.distance_map(state, LIMIT_RETRY, city.x, city.y, MODE_LAND, MASK_NONE)
                    nearest_six(state, c, dm)
            finally:
                _own(flags, city, old)
    finally:
        state.current = saved_current


def _own(flags, city, owner: int) -> None:
    city.owner = owner
    for dx, dy in SQUARES:
        i = (city.y + dy) * MAP_W + city.x + dx
        flags[i] = (flags[i] & 0xF0) | (owner & MAP_OWNER_MASK)


def is_neighbour(state, c: int, d: int) -> tuple[int, list, list]:
    """ovl25:0656(c, d, ids, dists): 1 when d (a word) equals one of c's six NB id bytes, with
    c's six ids and distances (what 0656 copies to non-null pointers, i = 5..0).
    Evidence: asm ovl25:0656..06d3 (0661 05e6 lock, 0664..06c8 loop: 0676..0680 byte vs word,
    0683..06a0 ids, 06a2..06c0 distances + 0x258; 06cb 063d)."""
    nb = state.ai.neighbours
    ids = nb.ids[c * NB_SLOTS:(c + 1) * NB_SLOTS]
    dists = nb.dists[c * NB_SLOTS:(c + 1) * NB_SLOTS]
    return int(any(v == d for v in ids)), list(ids), list(dists)
