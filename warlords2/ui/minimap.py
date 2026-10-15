"""The overview map: the strategic bitmap at 2 px per square, city markers, view box (T3).

Evidence (overlay offsets, docs/research/exe_logic.md §1):

* ovl63:232b (the map-building progress, STRING group 137) runs inside the scenario load
  (ovl57:0194 at 02d4), before the Game Setup screen and before Begin, so it reads the map
  as loaded: tile bytes 1e1d (low byte of each word), road layer 19d9, terrain set SCN
  0x161.  It fills STRAT.PCK's 224x312 bitmap (DS:581d), x outer 0..111, y inner 0..155.
  Square (x, y) owns the pixels (2x, 2y), (2x+1, 2y), (2x, 2y+1), (2x+1, 2y+1).  With a
  road piece r (road layer & 0x1f) the index is r-1 into the four MAPCOLOR road tables,
  else the tile byte into the four tile tables; the colour is remap[table[index]] (remap
  of the terrain set, ovl63:2404).  Squares whose index is 0x50..0x5f (mountains; never a
  road index) take their four colours unmapped from the 256 rnd(1,3,1) values drawn
  before the loop (ovl63:2479; `GameState.overview_mountain_rolls`), consumed 4 per
  square, wrapping at 256.  Before the column x with x*10/112 above the last tenth it
  shows the next 10 % (ovl63:24a3..24c1, ovl02:01ff).  The city tile bytes Begin rewrites
  (ovl39:0000) do not reach this bitmap.
* ovl63:2785(0, x, y): one square again from the map as it is now, the same four tables
  but always the first remap DS:5e72 (ovl63:27a3), and four fresh rnd(1,3,1) for a mountain
  index (ovl63:285b..28fc).  Its caller in the main loop is ovl35:09f2 (ovl61:217d, every
  pass): with Quests (SCN 0x11E) on, after rewriting each site's tile byte
  (`rules.ruins.site_tiles`) it redraws that site's square (ovl35:0b0b).  A site's tile
  byte is 9..0x0C and a site square's road index at most 0x1e, never 0x50..0x5f, so that
  call never rolls (the engine side, `rules.heroes.overview_rolls`, draws no dice there);
  here the pixels are redrawn by `Minimap.redraw_sites`.  With Quests off the overview keeps the
  loaded tile bytes.
* ovl63:0000(1, 1, NULL), the main-loop call (ovl61:0066): copy (0, 0, 224, 312) of the
  bitmap (with Hidden Map: through the fog mask DS:54e3 over black; ovl63:2200 makes the
  mask from the road-layer "seen" bit 0x20), then ovl63:0ed7 the city markers, then to the
  screen at (400, 30).  Both return at once with Hidden Map on while a computer side moves
  (asm ovl63:0010..0042 and 0ee4..0f16: SCN 0x124 != 0, 0x0D0[0x110] != 0, SCN 0x159 == 0,
  DS:2d28 == 0), so the screen keeps the last overview.  DS:2d28 is set only by ovl64:0dc7
  (1) and ovl64:0e59 (0), neither with a direct far call in the listing; it stays 0 (its
  initial value) here.
* ovl63:0ed7: a city whose top-left square has terrain 10 (not razed) gets atrans2 marker
  DS:2c2e[owner] (owner 0x0f -> 8) at (((2x-1) >> 3) * 8, 2y-1) (signed: x = 0 gives -8,
  drawn clipped), taking the copy pre-shifted by (2x-1) & 7; with Hidden Map only when one
  of its four squares is seen.
* ovl65:0227 / 0698: the view box, colour 15, two-pixel lines of 18 px at
  (400 + 2*left, 30 + 2*top).  The original slides the box towards a new position in steps
  of up to 8 squares (X05 timing); here it is drawn at its final place.
"""
from __future__ import annotations

import numpy as np
import pygame

from ..assets import sprites as S
from ..model.ids import MAP_H, MAP_W, ROAD_PIECE_MASK, ROAD_SEEN, Control, Terrain
from .screen import IDENTITY

RECT = (400, 30, 224, 312)
MOUNTAINS = range(0x50, 0x60)
ROAD_PIECE, SEEN = ROAD_PIECE_MASK, ROAD_SEEN
BOX, BOX_LEN, BOX_COLOUR = 18, 0x12, 15
VARIANT_STEP = 4
SQUARE_REMAP = 0                         # ovl63:2785 uses DS:5e72, the first remap
SCN_159 = 0x159                          # ovl63:0033 / 0f07


def column(tiles, roads, remap, rolls, colors: S.MapColors, x: int, k: int, out: np.ndarray) -> int:
    """Fill column x of `out` ([x, y] indexed, 224x312) as ovl63:232b does; `k` is the
    position in the 256 rolls, returned advanced."""
    for y in range(MAP_H):
        i = y * MAP_W + x
        road = roads[i] & ROAD_PIECE
        d = road - 1 if road else tiles[i] & 0xFF
        if d in MOUNTAINS:
            px = rolls[k:k + VARIANT_STEP]
            k += VARIANT_STEP
            if k >= len(rolls):
                k = 0
        else:
            t = colors.roads if road else colors.tiles
            px = [remap[t[q][d]] for q in range(4)]
        out[2 * x, 2 * y], out[2 * x + 1, 2 * y], out[2 * x, 2 * y + 1], out[2 * x + 1, 2 * y + 1] = px
    return k


def square(tiles, roads, colors: S.MapColors, x: int, y: int, out: np.ndarray) -> None:
    """ovl63:2785(0, x, y) for a square whose index is not a mountain: its four pixels from
    the current tile byte or road piece, remap DS:5e72."""
    i = y * MAP_W + x
    road = roads[i] & ROAD_PIECE
    d = road - 1 if road else tiles[i] & 0xFF
    if d in MOUNTAINS:
        raise ValueError(f"square ({x}, {y}): mountain index {d:#x} rolls (ovl63:285b), not modelled")
    remap, t = colors.remaps[SQUARE_REMAP], colors.roads if road else colors.tiles
    out[2 * x, 2 * y], out[2 * x + 1, 2 * y], out[2 * x, 2 * y + 1], out[2 * x + 1, 2 * y + 1] = (
        remap[t[q][d]] for q in range(4))


def frozen(state) -> bool:
    """ovl63:0000 / 0ed7 draw nothing: Hidden Map on, SCN 0x0D0[SCN 0x110] (the moving side's
    control) not human and SCN 0x159 = 0 (DS:2d28 is 0, see the module docstring)."""
    return (bool(state.options.hidden_map) and state.players[state.current].control != Control.HUMAN
            and state.flags[SCN_159] == 0)


def build(tiles, roads, terrain_set: int, rolls, colors: S.MapColors, out: np.ndarray):
    """ovl63:232b as a generator over the loaded map (tile words or bytes, road layer, SCN
    0x161, the 256 rolls): yields 0 (ovl02:01ff(0) before the loop), then each new tenth
    before its column; the columns between are built in the same step."""
    remap = colors.remaps[terrain_set]
    yield 0
    k = shown = 0
    for x in range(MAP_W):
        if x * 10 // MAP_W > shown:
            shown += 1
            yield shown * 10
        k = column(tiles, roads, remap, rolls, colors, x, k, out)


def blank() -> np.ndarray:
    """STRAT.PCK as loaded: all colour 0."""
    return np.zeros(RECT[2:], np.uint8)


class Minimap:
    def __init__(self, sprites, colors: S.MapColors, pixels: np.ndarray | None = None):
        """`colors`: MAPCOLOR.DAT of the terrain set (SCN 0x161); `pixels`: the bitmap
        `build` filled at the scenario load (DS:581d)."""
        self.sp, self.colors = sprites, colors
        self.pixels = blank() if pixels is None else pixels
        self.buf = pygame.Surface(RECT[2:], depth=8)
        self.buf.set_palette(IDENTITY)
        self.drawn = False

    def redraw_sites(self, state) -> None:
        """ovl35:09f2's ovl63:2785(0, x, y) for every site, with Quests on (after
        `rules.ruins.site_tiles`)."""
        if state.options.quests:
            w = state.world
            for s in state.sites:
                square(w.tiles, w.roads, self.colors, s.x, s.y, self.pixels)

    def draw(self, fb: pygame.Surface, state, view_left: int, view_top: int) -> None:
        if not (self.drawn and frozen(state)):
            self.compose(state)
        fb.blit(self.buf, RECT[:2])
        x, y = RECT[0] + 2 * view_left, RECT[1] + 2 * view_top
        for d in (0, 1, BOX - 2, BOX - 1):
            fb.fill(BOX_COLOUR, (x, y + d, BOX_LEN, 1))
            fb.fill(BOX_COLOUR, (x + d, y, 1, BOX_LEN))

    def compose(self, state, seen_bit: int = SEEN, markers: bool = True) -> None:
        """ovl63:0000's bitmap copy and (`markers`) ovl63:0ed7's markers into `buf`; the fog
        from road bit `seen_bit` (0x80 in the map-view mode DS:3254, ovl63:0ff8)."""
        self.drawn = True
        w = state.world
        hidden = bool(state.options.hidden_map)
        px = self.pixels
        if hidden:
            seen = (np.array(w.roads, np.uint8).reshape(MAP_H, MAP_W).T & seen_bit) != 0
            px = np.where(np.repeat(np.repeat(seen, 2, 0), 2, 1), px, 0).astype(np.uint8)
        pygame.surfarray.blit_array(self.buf, px)
        for c in state.cities if markers else ():
            if w.terrain(c.x, c.y) != Terrain.CITY:
                continue
            if hidden and not any(w.roads[(c.y + dy) * MAP_W + c.x + dx] & seen_bit
                                  for dx in (0, 1) for dy in (0, 1)):
                continue
            u = 2 * c.x - 1
            self.buf.blit(self.sp.atrans, ((u >> 3) * 8, 2 * c.y - 1), self.sp.city_mark(c.owner, u & 7))

    def tile_at(self, pos: tuple[int, int]) -> tuple[int, int] | None:
        """The square under a screen position inside the overview, else None."""
        x, y = pos[0] - RECT[0], pos[1] - RECT[1]
        if 0 <= x < RECT[2] and 0 <= y < RECT[3]:
            return x // 2, y // 2
        return None
