"""Hidden-map view (SCN 0x124 option): which squares the side on turn has explored.

The working view is bit 5 of the road-layer byte (19d9:0000, `World.roads`); the path search
blocks unexplored squares for human sides (0555:08bf) and moving reveals them (ovl64:1298).
Each side's own view is a bit of the 112 x 156 byte buffer DS:126c (`World.explored`, bit p =
side p), built at new game by rules.setup (ovl64:113b), copied into bit 5 at the start of a
turn (`load_view`, ovl64:0d39) and back at its end (`store_view`, ovl64:0e68); calling them
is the turn sequence's job (M8a).

Bit 5 set means *seen*: 0555:08bf blocks a square for human pathing when the bit is clear,
ovl64:1298 sets it on the squares it reveals, and ovl64:0d39 sets it from the side's bit
(EL §4.1 / §9.5 corrected accordingly; `model.ids.ROAD_SEEN`).
"""
from __future__ import annotations

from ..model.ids import MAP_H, MAP_W, Control, Terrain
from .constants import movement as K

W, H = MAP_W, MAP_H


def visible(state, x: int, y: int) -> bool:
    """Whether (x, y) is explored in the current view (always, without Hidden Map).
    Evidence: 0555:08bf / ovl64:1298 test road-layer bit 0x20 only when SCN 0x124 is set."""
    if not state.options.hidden_map:
        return True
    return bool(state.world.roads[y * W + x] & K.EXPLORED.value)


def reveal(state, x: int, y: int, flying: bool) -> bool:
    """Explore the box around (x, y): radius 2 for a flying stack or on a City square, else 1;
    only when some square of the box is still unexplored.  Returns whether it changed.
    `flying` stands for DS:5dfc == 2, the move mode of the selected stack (written only by
    0c8c:0529).  The routine's first argument (all callers push SCN 0x110) is never read, so
    there is no player parameter.
    Evidence: asm ovl64:1298..13c7 (args at bp+8 / bp+0xa; bp+6 unread); does nothing without
    Hidden Map (SCN 0x124).  Callers: per step 0a8b:05d1 (rules.movement), after a won battle
    ovl36:0d35 at DS:41e9/41e1 (rules.combat), per city square ovl36:0f31 (rules.city.take_city);
    ovl01:10dd / 1ce5 and ovl34:0db5 / 11cf belong to M7a."""
    if not state.options.hidden_map:
        return False
    w = state.world
    wide = flying or w.terrain_of_tile[w.tiles[y * W + x]] == Terrain.CITY
    r = K.REVEAL_RADIUS_WIDE.value if wide else K.REVEAL_RADIUS.value
    box = [(i, j) for i in range(x - r, x + r + 1) for j in range(y - r, y + r + 1)
           if 0 <= i < W and 0 <= j < H]
    ex = K.EXPLORED.value
    if all(w.roads[j * W + i] & ex for i, j in box):
        return False
    for i, j in box:
        w.roads[j * W + i] |= ex
    return True


def _hole_mask(state, x: int, y: int) -> int:
    """ovl64:0f6f with DS:3254 = 0: bit k set when neighbour k is off the map or unexplored."""
    m = 0
    ex = K.EXPLORED.value
    for k in range(8):
        i, j = x + K.HOLE_DX.value[k], y + K.HOLE_DY.value[k]
        if not (0 <= i < W and 0 <= j < H) or not state.world.roads[j * W + i] & ex:
            m |= 1 << k
    return m


def hidden_single_view(state, x: int, y: int, edge: int = 1) -> bool:
    """DS:2d56[ovl64:1055(x, y, edge)] == 0x0e with DS:3254 set: every neighbour k of (x, y)
    (DS:2efa / 2f0a, the same offsets as `HOLE_DX` / `HOLE_DY`) is off the map (bit k = `edge`)
    or without road bit 7 (the one human's view, `store_view`).
    Evidence: asm ovl64:1055..10cb (105c DS:3254 != 0: 1092 off the map -> edge << k, 10ae road
    bit 7 clear -> 1 << k); DS:2d56 holds 0x0e only at index 0xff (`FOG_FULL`)."""
    m = 0
    pv = K.ROAD_PORT_VIEW.value
    for k in range(8):
        i, j = x + K.HOLE_DX.value[k], y + K.HOLE_DY.value[k]
        if not (0 <= i < W and 0 <= j < H):
            m |= edge << k
        elif not state.world.roads[j * W + i] & pv:
            m |= 1 << k
    return K.HOLE_PATTERN.value[m & 0xFF] == K.FOG_FULL.value


def fill_holes(state) -> None:
    """Explore every unexplored square whose neighbour pattern has no fog-edge piece.
    Evidence: decomp 087258 (ovl64:1558) with ovl64:0f6f and DS:2d56; two scans, in place."""
    roads = state.world.roads
    ex = K.EXPLORED.value
    table = K.HOLE_PATTERN.value
    for _ in range(K.HOLE_PASSES.value):
        for x in range(W):
            for y in range(H):
                if not roads[y * W + x] & ex and table[_hole_mask(state, x, y)] == 0xFF:
                    roads[y * W + x] |= ex


def load_view(state, p: int, fill: bool = True) -> None:
    """Start of side p's turn: bit 5 := mask bit p, then (`fill`) `fill_holes`.
    Evidence: decomp 086a39 (ovl64:0d39) and ovl64:1558: the computer turn calls both only with
    SCN 0x124 (ovl68:00c8 / 00cd); the human turn calls 0d39 always (ovl68:02f9) and 1558 only
    with SCN 0x124 (ovl68:031a)."""
    masks = state.world.explored
    roads = state.world.roads
    ex = K.EXPLORED.value
    for i in range(W * H):
        roads[i] = (roads[i] & ~ex & 0xFF) | (ex if masks[i] >> (p & 0x1F) & 1 else 0)
    if fill:
        fill_holes(state)


def store_view(state, p: int) -> None:
    """End of side p's turn: OR bit 5 into mask bit p; with exactly one living human side and
    p human, also copy bit 5 into road-layer bit 7.
    Evidence: decomp 086b68 (ovl64:0e68, called at ovl68:0223 and ovl61:2095)."""
    masks = state.world.explored
    humans = sum(1 for q in state.players if q.alive and q.control == Control.HUMAN)
    single = humans == 1 and state.players[p].control == Control.HUMAN
    roads = state.world.roads
    ex, pv = K.EXPLORED.value, K.ROAD_PORT_VIEW.value
    for i in range(W * H):
        bit = roads[i] >> 5 & 1
        if single:
            roads[i] = (roads[i] & ~pv & 0xFF) | (bit << 7)
        masks[i] |= bit << (p & 0x1F)
