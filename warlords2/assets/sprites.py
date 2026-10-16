"""Map graphics: which sheet cell the original draws for a tile, road, tower, army, flag,
port, item, fog pattern and overview colour (register G1).

Every rectangle below is the one WARLORD2.EXE passes to its blit routines; nothing is
inferred from the look of a sheet.  Sources (overlay offsets, docs/research/exe_logic.md §1):

* ovl64:2756 fills the 9x9 view cache from the map; ovl64:1a79 draws it into the 360x360
  "OS bitmap" DS:6795 (ovl64:0000); ovl64:006c copies that to the screen (G6, `ui.mapview`).
* Picture slots (picture table DS:1f56 +1 / +6, read from the user's EXE by
  `assets.store`): DS:5133 scenery0, 516e scenery1, 52d0/5295 road + mask, 525a/521f
  ashadow, 57a7/576c atrans2, 4f20 + 0x3b*k = a<k> with the one mask DS:4ee5 that every
  a*.pck load rebuilds (0997:03a9 -> 151d:00cf), 5559/551e hidden (ovl52:015f frees the
  hidden bitmap and keeps its mask), 161b a black 40-px bitmap (ovl52:016b..0185).
* Opaque 40x40 copy 052a:0009; masked blit [DS:69c8] (src, sx, sy, w, h, dst, x, y, mask,
  msx, msy); mask blit with a black source 052a:017f (48x40).
* Planted-standard slots 11 / 12 (DS:51a9 / 51e4) are the records 15 of cache group 8's
  pictures share; what they hold follows the group's occupant (`assets.store.CacheGroup8`,
  register X44; `Sprites.group8_occupant`, `group8_read`).

Tables of numbers the EXE keeps in DGROUP are read from the user's EXE (`assets.exe`).
"""
from __future__ import annotations

from dataclasses import dataclass

import numpy as np
import pygame

from ..formats.tables import parse_mapcolor
from ..rules.constants import Unverified
from .exe import ds_bytes, ds_far, ds_words
from .store import PIC_ENTRY, PIC_TABLE, CacheGroup8, group8_of
from ..ui.screen import IDENTITY

Rect = tuple[int, int, int, int]

KEY = 255                        # colour key of surfaces built here (fb holds 0..15 only)

TILE = 40                        # 052a:0009 copies 5 words x 0x28 rows
SCENERY1_FROM = 0x60             # ovl64:27b0: tile byte >= 0x60 -> scenery1, cell tile - 0x60
SCENERY_COLS, SCENERY_CELLS = 16, 0x60   # ovl64:1cc2..1cd9: sx = c%16*40, sy = (c%96)/16*40

ROAD_W, ROAD_H, ROAD_COLS = 48, 40, 13   # ovl64:1eb4..1f02: r = road-1, sx = r%13*48, sy = r/13*40
TOWER_X, TOWER_Y = 0xC0, 0x28            # ovl64:2008..204b: road.pck (0xc0 + 48*owner, 40, 48, 40)
ROAD_MAX = 17                            # largest road code in the shipped .RD files (scenario.md)

ARMY_W, ARMY_H, ARMY_PITCH = 32, 0x1D, 0x1E   # ovl64:0335: sx = t%16*32, sy = t/16*30, 32x29
ARMY_AT = (8, 7)                              # drawn at tile + (8, 7)
POLE = ((2, 14), (3, 13), (4, 14))            # 1012:0f08 (x offset, colour), 40 rows from the tile top
POLE_LEN = 0x28
PENNANT_X, PENNANT_W, PENNANT_H = 0x1D0, 0x30, 8     # a*.pck (464, DS:2d4e[n-1], 48, 8)
PENNANT_ROWS_DS = 0x2D4E                             # 4 words: 29, 38, 47, 56
PENNANT_LOW_AT = 8                                   # count > 4: a full pennant at tile + (0, 8)
STANDARD = (0x1A0, 0x1D, 32, 0x1D)                   # ovl64:213c: slot<i> (416, 29, 32, 29), mask 4ee5
SLOTS, SLOT_STEP = 0x4F20, 0x3B                      # ovl64:217d..2185: picture slot DS:4f20 + 0x3b * (i & 15)
GHOST_W, GHOST_H, GHOST_AT = 32, 0x1D, (8, 5)        # ovl64:239d..23e3: ashadow (t%16*32, t/16*29), + (8, 5)
NAVY_TYPE = 5                                        # ovl64:2985: aboard and not on a port
PORT = (0, 0, 32, 0x1D)                              # ovl64:1f67: atrans2 (0, 0, 32, 29)
ITEM = (0x40, 0, 32, 0x1D)                           # ovl64:20b0: atrans2 (64, 0, 32, 29)
GROUP8_SLOTS = (11, 12)                              # DS:51a9 / 51e4: cache group 8 (picture table +5)
GROUP8_STANDARD = Unverified(
    "planted-standard flag of item 11 or 12 (cache group 8's mask / bitmap)", "X44", None,
    "the occupant of cache group 8 at the map draw (`assets.store.CacheGroup8`) is MOVEBAR0..7 or "
    "RMAPBAR, whose 0f00:0c4d read at rows 29..57, x 416 (plane byte y * stride + 52, no clip to "
    "the source) runs past the plane buffer into heap memory, or the map on the screen may have "
    "been drawn with any of several occupants that give different flags: this program repaints "
    "the map every frame and has no counterpart of the EXE's ovl64:006c calls outside the "
    "computer turn, so it knows only every occupant since the last map draw it can place.  "
    "Provisional: the flag is not drawn (the EXE's result when the occupant is none of the 15 "
    "pictures that share the records)")
HEAP = "heap"                                        # `group8_source`: the read leaves the planes
FOG_W, FOG_H, FOG_COLS, FOG_PITCH = 48, 40, 7, 0x29  # ovl64:24e2..251e: hidden mask (v%7*48, v/7*41)
FOG_FULL = 0x0E                                      # ovl64:1b6e: the black tile, nothing else drawn
FOG_TABLE_DS = 0x2D56                                # 256 bytes, neighbour mask -> pattern (0xff none)
# ovl64:0f6f neighbour order (DS:2eda / DS:2eea): bit k set = that neighbour is off the map or unseen
FOG_NEIGHBOURS_DS = (0x2EDA, 0x2EEA)

CITY_MARK_DS = 0x2C2E            # ovl63:0ed7: 9 x (sx, sy, w, h) in atrans2, owner 0xf -> 8;
                                 # 8 copies pre-shifted by 0..7 px below each other (sy + shift*h)
NEUTRAL_ROW = 8                  # owner 0x0f -> sheet / marker 8 (ovl64:0335, ovl63:0ed7)


def owner_row(owner: int) -> int:
    """Sheet / table row of an owner: 0..7, and 8 for 0x0f (and anything above 7)."""
    return owner if owner < NEUTRAL_ROW else NEUTRAL_ROW


def tile_cell(tile: int) -> tuple[int, Rect]:
    """(0 scenery0 | 1 scenery1, source rect) for a map tile byte (ovl64:2756, 1a79)."""
    tile &= 0xFF
    sheet = int(tile >= SCENERY1_FROM)
    c = (tile - SCENERY1_FROM) & 0xFF if sheet else tile
    return sheet, (c % SCENERY_COLS * TILE, c % SCENERY_CELLS // SCENERY_COLS * TILE, TILE, TILE)


def road_cell(road: int) -> Rect:
    """ROAD.PCK rect of road-layer piece 1..31 (ovl64:2756 stores road-1 in 5 bits)."""
    r = (road - 1) & 0x1F
    return r % ROAD_COLS * ROAD_W, r // ROAD_COLS * ROAD_H, ROAD_W, ROAD_H


def tower_cell(owner_nibble: int) -> Rect:
    """ROAD.PCK rect of the fortified-square picture of a cell owner 0..8 (ovl64:1fe8)."""
    return TOWER_X + ROAD_W * owner_nibble, TOWER_Y, ROAD_W, ROAD_H


def army_cell(type_id: int) -> Rect:
    t = type_id & 0x1F
    return t % 16 * ARMY_W, t // 16 * ARMY_PITCH, ARMY_W, ARMY_H


def ghost_cell(type_id: int) -> Rect:
    return type_id % 16 * GHOST_W, type_id // 16 * GHOST_H, GHOST_W, GHOST_H


def fog_cell(v: int) -> Rect:
    return v % FOG_COLS * FOG_W, v // FOG_COLS * FOG_PITCH, FOG_W, FOG_H


@dataclass(frozen=True)
class MapColors:
    """TERRAIN<n>/MAPCOLOR.DAT as ovl63:2a11 reads it: four tile tables (pixel TL, TR, BL,
    BR of a tile; DS:5e92, 5e8e, 5e8a, 5e86), three 16-word colour remaps (terrain set 0,
    1, 2; DS:5e72, 5e6e, 5e6a, chosen by SCN 0x161 at ovl63:2404), four road tables
    indexed by road-1 (DS:5e82, 5e7e, 5e7a, 5e76)."""
    tiles: tuple[tuple[int, ...], ...]
    remaps: tuple[tuple[int, ...], ...]
    roads: tuple[tuple[int, ...], ...]

    @classmethod
    def parse(cls, data: bytes) -> MapColors:
        d = parse_mapcolor(data)
        return cls(tuple(map(tuple, d["tile_tables"])), tuple(map(tuple, d["word_tables"])),
                   tuple(map(tuple, d["byte_tables"])))

    @classmethod
    def load(cls, store, terrain_set: int) -> MapColors:
        """TERRAIN<SCN 0x161>/MAPCOLOR.DAT (ovl63:2a11: FILE.DAT 0x17 with SCN 0x161)."""
        return cls.parse(store.read(f"TERRAIN{terrain_set}/MAPCOLOR.DAT"))


def picture_slots(exe: bytes, n: int) -> dict[int, list[tuple[int, str]]]:
    """DS offset of each picture slot -> [(picture index, "bitmap" | "mask")] from the far
    pointers at +1 (bitmap) and +6 (mask) of the picture table DS:1f56 (`assets.store`)."""
    out: dict[int, list[tuple[int, str]]] = {}
    for k in range(n):
        for off, kind in ((1, "bitmap"), (6, "mask")):
            p = ds_far(exe, PIC_TABLE + PIC_ENTRY * k + off)
            if p is not None:
                out.setdefault(p, []).append((k, kind))
    return out


def group8_read(px: np.ndarray, w: int, h: int) -> np.ndarray | None:
    """The pixels ([x, y], 32x29) of a w x h picture `px` ([x, y]) that 0f00:0c4d takes for the
    flag cell STANDARD from that picture's record: plane byte (sy + r) * S + (sx >> 3) + (c >> 3)
    for row r, column c (0c56..0c6a, DS:699e = 3), S the record's +8 words * 2 = 2 * ceil(w / 16)
    (1012:0232 / 0b8a with DS:69a6 = 15, DS:69a0 = 4: 1012:0187 with the mode table's +0x12 = 0
    for mode 4), no clip to the source.  A stride under 56 bytes runs on into later rows.  None
    when a byte lies past the plane buffer (S * h bytes: heap memory) or in a row's padding."""
    sx, sy, cw, ch = STANDARD
    stride = 2 * ((w + 15) // 16)
    c = np.arange(cw)[:, None]
    o = (sy + np.arange(ch)[None, :]) * stride + (sx >> 3) + (c >> 3)
    x, y = (o % stride) * 8 + (c & 7), o // stride
    if o.max() >= stride * h or x.max() >= w:
        return None
    return px[x, y]


def _keyed(base: pygame.Surface, transparent: np.ndarray) -> pygame.Surface:
    """Copy of an 8-bit sheet whose `transparent` pixels (array [x, y]) become KEY."""
    s = base.copy()
    s.set_colorkey(None)
    px = pygame.surfarray.pixels2d(s)
    px[transparent] = KEY
    del px
    s.set_colorkey(KEY)
    return s


class Sprites:
    """The map sheets, built on the main thread from an `AssetStore`."""

    def __init__(self, store):
        self.store = store
        exe = store.read("WARLORD2.EXE")
        pic = store.picture
        self.scenery = (pic("scenery0.pck"), pic("scenery1.pck"))
        self.road = pic("road.pck")                 # key 1 (picture table)
        self.atrans = pic("atrans2.pck")            # key 1
        self.ashadow = pic("ashadow.pck")           # key 15: its mask DS:521f
        # DS:4ee5 is rebuilt by every a*.pck load; ovl64:1a79 loads a0..a8 in that order,
        # so the shape of every army sheet is a8's key-10 mask.
        last = pic("a8.pck")
        a8 = pygame.surfarray.array2d(last)
        mask = a8 == self.store.entry("a8.pck").key
        self.armies = [_keyed(pic(f"a{k}.pck"), mask) for k in range(9)]
        x, y, w, h = STANDARD
        self.standard_mask = mask[x:x + w, y:y + h]
        self._standards: dict[int, pygame.Surface] = {}
        self.slot_pictures = picture_slots(exe, len(store.pictures))
        self.group8 = group8_of(store) or CacheGroup8(store.pictures)   # the App's word (X44)
        self._group8_px: dict[int, np.ndarray | None] = {}
        hidden = pygame.surfarray.array2d(pic("hidden.pck"))
        fog = pygame.Surface(hidden.shape, depth=8)
        fog.set_palette(IDENTITY)
        fog.fill(0)
        self.fog = _keyed(fog, hidden == self.store.entry("hidden.pck").key)
        self.pennant_rows = ds_words(exe, PENNANT_ROWS_DS, 4)
        self.fog_table = ds_bytes(exe, FOG_TABLE_DS, 256)
        self.neighbours = tuple(zip(ds_words(exe, FOG_NEIGHBOURS_DS[0], 8), ds_words(exe, FOG_NEIGHBOURS_DS[1], 8)))
        self.city_marks = [ds_words(exe, CITY_MARK_DS + 8 * o, 4) for o in range(9)]

    def standard(self, i: int) -> pygame.Surface | None:
        """ovl64:213c: the 32x29 flag of planted item i, (416, 29) of picture slot DS:4f20 +
        0x3b * (i & 15) through the army mask DS:4ee5 at the same place, by the masked blit
        [DS:69c8] = 0f00:0c4d into the OS bitmap DS:6795 (not the screen DS:342a, so the
        path 0ee6..1121): for each plane p below the source's plane count (+0x34, 1086..109a)
        0e68:00f3 sets dst = (dst & M) | (src & ~M), M = plane 0 of DS:4ee5, whose bits are 1
        on the key colour (151d:00cf, 0227..02cd).  Slots 0-8 are a0..a8; slot 9 is scenery0
        (DS:5133), 10 scenery1 (516e), 14 ashadow (525a), each the bitmap slot (+1) of exactly
        one picture-table entry: a 4-plane source, the flag cell drawn keyed (`draw_standard`).
        Slots 13 (521f, ashadow's mask) and 15 (5295, road's mask) are mask records: one plane
        (1012:0232 passes 1, 151d:00ed) of the picture's size and stride, so only plane 0 of
        the OS bitmap changes: colour bit 0 becomes 1 where that picture has its key colour at
        (416..447, 29..57), 0 elsewhere, under the army mask (`standard_bit0`).  Slots 11 (51a9)
        and 12 (51e4) are the mask and bitmap records of 15 of cache group 8's 49 pictures
        (scroll, stack, voice, rmapbar, helpgfx, scroll2, bscroll, movebar0..7), zero in the
        image and after any other group-8 load; an item 11 or 12 can lie alone on a flagged
        square in play.  `group8_occupant` (register X44): None draws nothing (no picture of
        the 15 loaded, +0x34 = 0 planes); one of them gives the cell `group8_read` takes from
        its planes, slot 12 keyed as here, slot 11 bit 0 only (`standard_bit0`)."""
        if (i & 0x0F) in GROUP8_SLOTS:
            k = self.group8_occupant()
            if k is None:
                return None
            if (i & 0x0F) != GROUP8_SLOTS[1]:
                raise ValueError(f"planted item {i}: DS:51a9 is a mask record (`standard_bit0`)")
            cell = pygame.Surface(STANDARD[2:], depth=8)
            cell.set_palette(IDENTITY)
            pygame.surfarray.blit_array(cell, self._group8_cell(k))
            return _keyed(cell, self.standard_mask)
        i &= 0x0F
        if i < len(self.armies):
            return self.armies[i].subsurface(STANDARD)
        if i not in self._standards:
            k = self._slot_owner(i, "bitmap")
            src = self.store.picture(k)
            x, y, w, h = STANDARD
            cell = pygame.Surface((w, h), depth=8)
            cell.set_palette(IDENTITY)
            cell.blit(src, (0, 0), STANDARD)
            self._standards[i] = _keyed(cell, self.standard_mask)
        return self._standards[i]

    def _slot_owner(self, i: int, kind: str) -> int:
        slot = SLOTS + SLOT_STEP * i
        owners = self.slot_pictures.get(slot, ())
        if len(owners) != 1 or owners[0][1] != kind:
            raise ValueError(f"planted item {i}: picture slot DS:{slot:04x} is {owners or 'unused'}, "
                             "not one picture's bitmap or mask")
        return owners[0][0]

    def is_mask_standard(self, i: int) -> bool:
        """Slot i & 15 is a mask record (one plane, `standard`): of one picture, or slot 11's
        DS:51a9 of the 15 group-8 pictures."""
        owners = self.slot_pictures.get(SLOTS + SLOT_STEP * (i & 0x0F), ())
        return bool(owners) and all(kind == "mask" for _, kind in owners)

    # ---------------------------------------------------------------- cache group 8 (X44)

    def group8_source(self, k: int | None):
        """What slots 11 / 12 hold with picture k the group's occupant: None for no picture or
        one with records of its own (nothing drawn), k when 0c4d's read stays in its planes,
        HEAP when it runs past them."""
        if k is None or (k, "bitmap") not in self.slot_pictures.get(SLOTS + SLOT_STEP * GROUP8_SLOTS[1], ()):
            return None
        return k if self._group8_cell(k) is not None else HEAP

    def group8_occupant(self) -> int | None:
        """The group-8 picture whose records slots 11 / 12 show, None for nothing drawn; every
        occupant since the last placed map draw (`CacheGroup8.shown`) must give the same, else
        (or for HEAP) `GROUP8_STANDARD`: `UnverifiedError`, None with unverified values allowed."""
        outs = {self.group8_source(k) for k in self.group8.shown}
        if len(outs) == 1 and HEAP not in outs:
            return outs.pop()
        return GROUP8_STANDARD.value

    def _group8_cell(self, k: int) -> np.ndarray | None:
        if k not in self._group8_px:
            pic = self.store.picture(k)
            self._group8_px[k] = group8_read(pygame.surfarray.array2d(pic), *pic.get_size())
        return self._group8_px[k]

    def standard_bit0(self, i: int) -> np.ndarray | None:
        """Plane 0 of mask slot i & 15 over the flag cell ([x, y], True = key colour, 151d:00cf);
        for slot 11 the occupant's mask record read as `group8_read`, None when nothing is drawn."""
        i &= 0x0F
        if i == GROUP8_SLOTS[0]:
            k = self.group8_occupant()
            return None if k is None else self._group8_cell(k) == self.store.pictures[k].key
        k = self._slot_owner(i, "mask")
        x, y, w, h = STANDARD
        px = pygame.surfarray.array2d(self.store.picture(k))[x:x + w, y:y + h]
        return px == self.store.pictures[k].key

    def draw_standard(self, dst: pygame.Surface, i: int, pos: tuple[int, int]) -> None:
        """ovl64:213c into the 8-bit `dst` at `pos`, clipped (`standard`)."""
        if not self.is_mask_standard(i):
            cell = self.standard(i)
            if cell is not None:                       # None: nothing drawn (X44)
                dst.blit(cell, pos)
            return
        bit = self.standard_bit0(i)
        if bit is None:                                # slot 11, nothing drawn (X44)
            return
        bit = bit.astype(np.uint8)
        put = ~self.standard_mask                      # M = 0: the army sheet's opaque pixels
        x0, y0 = pos
        w, h = bit.shape
        dw, dh = dst.get_size()
        ax, ay, bx, by = max(0, x0), max(0, y0), min(dw, x0 + w), min(dh, y0 + h)
        if ax >= bx or ay >= by:
            return
        px = pygame.surfarray.pixels2d(dst)
        area = px[ax:bx, ay:by]
        sel = put[ax - x0:bx - x0, ay - y0:by - y0]
        area[sel] = (area[sel] & 0xFE) | bit[ax - x0:bx - x0, ay - y0:by - y0][sel]
        del area, px

    def pennant(self, n: int) -> Rect:
        """Pennant of 1..4 armies (ovl64:0335, DS:2d4e[n-1])."""
        return PENNANT_X, self.pennant_rows[n - 1], PENNANT_W, PENNANT_H

    def city_mark(self, owner: int, shift: int) -> Rect:
        sx, sy, w, h = self.city_marks[owner_row(owner)]
        return sx, sy + shift * h, w, h
