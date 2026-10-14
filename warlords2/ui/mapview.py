"""The playing map: 9x9 squares of 40 px (registers G1, G6).

Evidence (overlay offsets, docs/research/exe_logic.md §1; cells: `assets.sprites`):

* View rectangle ovl65:0227: left = max(0, cx - 4) capped at 0x67, top = max(0, cy - 4)
  capped at 0x93, right/bottom = left/top + 8 (SCN 0x177, 0x175, 0x17b, 0x179); the centre
  (0x17d, 0x17f) is stored as given.  The view therefore never shows squares off the map.
* ovl64:006c builds the view (ovl64:0053 -> 2593 cache, 1a79 draw) into the 360x360 bitmap
  DS:6795 (ovl64:0000), columns and rows at DS:2d2a / DS:2d3c = 0, 40 .. 320, and copies
  (0, 0, 360, 360) of it to the screen at (16, 30) (14d0:009d, push 0x1e0010).  AREA.DAT has
  the same rectangle (tables.md §6).
* Cache ovl64:25ec / 2756 / 2985 / 2d7c, drawing order ovl64:1a79 (see `render`).

* The moving army DS:5e62 (`compose(moving=)`, ovl64:2c4d..2d78): when its square is in
  view, that cell takes its type (5 when aboard, +0xc bit 0x1000, with no port test), its
  owner, and cell +0x1c bit 0x10, which lets the stack draw on a fortified square
  (ovl64:21ec..2218).
* The path ghost (`path_ghost`, set by ovl64:2ef5 at 3015..3077 for the path end
  DS:6471/6473 in view, drawn by ovl64:238e..23ff after the stacks): ashadow cell
  (t % 16 * 32, t / 16 * 29, 32, 29) of the moving army's type t (+4, signed) through
  ashadow's own mask (DS:521f) at the square + (8, 5).

Not drawn here (M4c): the path marks of ovl64:2ef5 (cell +0x1b bits 4-5 from the path list
DS:6475, drawn ovl64:22bf..2385 as ashadow (0x1f0, 0x1f or 0x30, 16, 14) at + (16, 13));
the sage map-view mode DS:3254 (road bit 0x80 instead of 0x20) and the debug switch
DS:26c6 (0a4c:0100) that adds a marker to stacks.
"""
from __future__ import annotations

from dataclasses import dataclass

import pygame

from ..assets import sprites as S
from ..model.ids import MAP_H, MAP_W
from .screen import IDENTITY

AREA = (16, 30, 360, 360)
VIEW = 9
VIEW_MAX_LEFT, VIEW_MAX_TOP = 0x67, 0x93        # ovl65:0227
VIEW_HALF = 4
# map high byte / road layer bits used by the view (EL §4.1, §9.5; ovl64:2756, 1055)
OWNER, PORT, FORTIFIED = 0x0F, 0x80, 0x20
ROAD_PIECE, SEEN, ITEM_FLAG = 0x1F, 0x20, 0x40
ABOARD = 0x1000                 # army +0xc (ovl64:2985)
DEAD = 0xFF                     # army +5 of a free record (ovl53:0000)
ON_MAP = 1                      # item +0x16 (ovl64:2d7c)


def view_origin(cx: int, cy: int) -> tuple[int, int]:
    """Top-left square of the view centred on (cx, cy) (ovl65:0227)."""
    return (min(cx - VIEW_HALF if cx >= VIEW_HALF else 0, VIEW_MAX_LEFT),
            min(cy - VIEW_HALF if cy >= VIEW_HALF else 0, VIEW_MAX_TOP))


@dataclass
class Cell:
    """One square of the view cache (8 bytes at DS:5f3b + x*0x48 + y*8)."""
    tile: int
    road: int = 0                 # road-layer piece, 0 = none
    port: bool = False
    fortified: bool = False
    item: bool = False            # an item lies here (atrans2 bag)
    standard: int = -1            # item index planted here
    owner: int = 0                # +0x18 >> 4: owner row of the stack (0..8)
    army_type: int = 0
    count: int = 0
    fog: int = -1                 # hidden-map pattern 0..13, 14 = black square, -1 none
    raised: bool = False          # +0x1c bit 0x10: the moving army's square


def fog_mask(world, x: int, y: int, neighbours) -> int:
    """ovl64:0f6f: bit k = neighbour k (DS:2eda/2eea order) off the map or unseen."""
    m = 0
    for k, (dx, dy) in enumerate(neighbours):
        nx, ny = x + dx, y + dy
        if not (0 <= nx < MAP_W and 0 <= ny < MAP_H) or not world.roads[ny * MAP_W + nx] & SEEN:
            m |= 1 << k
    return m


@dataclass
class Ghost:
    """ovl64:2ef5's cache header +0x29f bit 0 with +0x2a0 / 2a2 (view column, row), +0x2a4 type."""
    col: int
    row: int
    type_id: int


def path_ghost(state, left: int, top: int, moving: int, end: tuple[int, int]) -> Ghost | None:
    """ovl64:3015..3077: the ghost of the moving army (DS:5e62, `moving` its index) on the
    path end square `end` (DS:6471/6473) when that square is in the view at (left, top)."""
    x, y = end
    if left <= x < left + VIEW and top <= y < top + VIEW:
        return Ghost(x - left, y - top, state.armies[moving].type_id)     # +4 (cwde: types < 0x80)
    return None


def compose(state, left: int, top: int, sp, moving: int | None = None) -> list[list[Cell]]:
    """cells[x][y] of the view whose top-left square is (left, top), as ovl64:2593 builds it.
    `moving`: index of the army DS:5e62 points at, else None."""
    w = state.world
    hidden = bool(state.options.hidden_map)                       # SCN 0x124
    first = []                                                    # ovl64:25ec: rank-0 type per row
    for row in state.fight_order:
        first.append(next((t for t, r in enumerate(row) if r == 0), 0))
    cells = []
    for x in range(left, left + VIEW):
        col = []
        for y in range(top, top + VIEW):
            i = y * MAP_W + x
            f, r = w.flags[i], w.roads[i]
            c = Cell(w.tiles[i] & 0xFF, r & ROAD_PIECE, bool(f & PORT), bool(f & FORTIFIED),
                     army_type=first[S.owner_row(f & OWNER)])
            if hidden and not r & SEEN:                           # ovl64:13c8
                v = sp.fog_table[fog_mask(w, x, y, sp.neighbours)]
                c.fog = -1 if v == 0xFF else v
            col.append(c)
        cells.append(col)

    def at(x, y):
        if left <= x < left + VIEW and top <= y < top + VIEW:
            return cells[x - left][y - top]
        return None

    for a in reversed(state.armies):                              # ovl64:2985
        if a.x < 0 or a.owner == DEAD:
            continue
        c = at(a.x, a.y)
        if c is None:
            continue
        c.count = (c.count + 1) & 0x1F
        c.owner = S.owner_row(a.owner)
        rank = state.fight_order[c.owner]
        if rank[c.army_type] < rank[a.type_id]:
            c.army_type = a.type_id
        if a.flags & ABOARD and not w.flags[a.y * MAP_W + a.x] & PORT:
            c.army_type = S.NAVY_TYPE
    for n in reversed(range(len(state.items))):                   # ovl64:2d7c
        it = state.items[n]
        c = at(it.x, it.y) if it.state == ON_MAP else None
        if c is None:
            continue
        if w.roads[it.y * MAP_W + it.x] & ITEM_FLAG:
            c.standard = n & 0x0F
        else:
            c.item = True
    if moving is not None:
        a = state.armies[moving]
        c = at(a.x, a.y)                                          # ovl64:2c4d..2d78
        if c is not None:
            c.army_type = S.NAVY_TYPE if a.flags & ABOARD else a.type_id & 0x1F
            c.raised = True
            c.owner = S.owner_row(a.owner & OWNER)
    return cells


def draw_stack(dst: pygame.Surface, sp, x0: int, y0: int, owner: int, type_id: int, count: int) -> None:
    """ovl64:0335: army, flag pole, pennant(s) of a stack at the square (x0, y0)."""
    sheet = sp.armies[S.owner_row(owner)]
    dst.blit(sheet, (x0 + S.ARMY_AT[0], y0 + S.ARMY_AT[1]), S.army_cell(type_id))
    for dx, colour in S.POLE:
        dst.fill(colour, (x0 + dx, y0, 1, S.POLE_LEN))
    if count > 4:
        dst.blit(sheet, (x0, y0 + S.PENNANT_LOW_AT), sp.pennant(1))
        count -= 4
    dst.blit(sheet, (x0, y0), sp.pennant(min(count, 4)))


def render(dst: pygame.Surface, cells: list[list[Cell]], sp, ghost: Ghost | None = None) -> None:
    """Draw the cache into a 360x360 surface in the order of ovl64:1a79."""
    todo = []
    for x, col in enumerate(cells):
        for y, c in enumerate(col):
            if c.fog == S.FOG_FULL:
                dst.fill(0, (x * S.TILE, y * S.TILE, S.TILE, S.TILE))
            else:
                todo.append((x * S.TILE, y * S.TILE, c))
    for sheet in (0, 1):
        for px, py, c in todo:
            s, rect = S.tile_cell(c.tile)
            if s == sheet:
                dst.blit(sp.scenery[s], (px, py), rect)
    for px, py, c in todo:
        if c.road:
            dst.blit(sp.road, (px, py), S.road_cell(c.road))
    for px, py, c in todo:
        if c.port:
            dst.blit(sp.atrans, (px, py), S.PORT)
    for px, py, c in todo:
        if c.fortified:
            dst.blit(sp.road, (px, py), S.tower_cell(c.owner))
    for px, py, c in todo:
        if c.item:
            dst.blit(sp.atrans, (px, py), S.ITEM)
    for px, py, c in todo:
        if c.standard >= 0:                                   # ovl64:213c
            dst.blit(sp.standard(c.standard), (px, py))
    for owner in range(S.NEUTRAL_ROW + 1):
        for px, py, c in todo:
            if c.count and c.owner == owner and (not c.fortified or c.raised):
                draw_stack(dst, sp, px, py, owner, c.army_type, c.count)
    if ghost is not None:                                     # ovl64:238e..23ff
        dst.blit(sp.ashadow, (ghost.col * S.TILE + S.GHOST_AT[0], ghost.row * S.TILE + S.GHOST_AT[1]),
                 S.ghost_cell(ghost.type_id))
    for px, py, c in todo:
        if 0 <= c.fog < S.FOG_FULL:
            dst.blit(sp.fog, (px, py), S.fog_cell(c.fog))


class MapView:
    """The 360x360 view buffer and the view centre."""

    def __init__(self, sprites):
        self.sp = sprites
        self.buf = pygame.Surface(AREA[2:], depth=8)
        self.buf.set_palette(IDENTITY)
        self.cx = self.cy = 0

    def centre(self, x: int, y: int) -> None:
        self.cx, self.cy = x, y

    def square_at(self, pos: tuple[int, int]) -> tuple[int, int] | None:
        """The map square under a screen position inside the view (AREA), else None."""
        x, y = pos[0] - AREA[0], pos[1] - AREA[1]
        if 0 <= x < AREA[2] and 0 <= y < AREA[3]:
            left, top = self.origin
            return left + x // S.TILE, top + y // S.TILE
        return None

    @property
    def origin(self) -> tuple[int, int]:
        return view_origin(self.cx, self.cy)

    def draw(self, fb: pygame.Surface, state, moving: int | None = None,
             ghost: tuple[int, int] | None = None) -> None:
        left, top = self.origin
        g = None if moving is None or ghost is None else path_ghost(state, left, top, moving, ghost)
        render(self.buf, compose(state, left, top, self.sp, moving), self.sp, g)
        fb.blit(self.buf, AREA[:2])
