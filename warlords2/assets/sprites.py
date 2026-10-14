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

Tables of numbers the EXE keeps in DGROUP are read from the user's EXE (`assets.exe`).
"""
from __future__ import annotations

from dataclasses import dataclass

import numpy as np
import pygame

from ..formats.tables import parse_mapcolor
from .exe import ds_bytes, ds_far, ds_words
from .store import PIC_ENTRY, PIC_TABLE
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
        hidden = pygame.surfarray.array2d(pic("hidden.pck"))
        fog = pygame.Surface(hidden.shape, depth=8)
        fog.set_palette(IDENTITY)
        fog.fill(0)
        self.fog = _keyed(fog, hidden == self.store.entry("hidden.pck").key)
        self.pennant_rows = ds_words(exe, PENNANT_ROWS_DS, 4)
        self.fog_table = ds_bytes(exe, FOG_TABLE_DS, 256)
        self.neighbours = tuple(zip(ds_words(exe, FOG_NEIGHBOURS_DS[0], 8), ds_words(exe, FOG_NEIGHBOURS_DS[1], 8)))
        self.city_marks = [ds_words(exe, CITY_MARK_DS + 8 * o, 4) for o in range(9)]

    def standard(self, i: int) -> pygame.Surface:
        """ovl64:213c: the 32x29 flag of planted item i, (416, 29) of picture slot DS:4f20 +
        0x3b * (i & 15) through the army mask DS:4ee5 at the same place.  Slots 0-8 are
        a0..a8; slot 9 is scenery0 (DS:5133), 10 scenery1 (516e), 14 ashadow (525a), each
        the bitmap slot (+1) of exactly one picture-table entry.  Slots 11 (51a9), 13 (521f)
        and 15 (5295) are mask slots (+6) and 12 (51e4) the bitmap of cache group 8, which
        holds whichever of its pictures was loaded last; what the masked blit [DS:69c8]
        (0f00:0c4d) makes of those is not traced, so they raise."""
        i &= 0x0F
        if i < len(self.armies):
            return self.armies[i].subsurface(STANDARD)
        if i not in self._standards:
            slot = SLOTS + SLOT_STEP * i
            owners = self.slot_pictures.get(slot, ())
            if len(owners) != 1 or owners[0][1] != "bitmap":
                raise NotImplementedError(f"planted item {i}: picture slot DS:{slot:04x} is {owners or 'unused'} "
                                          "(ovl64:213c through the masked blit 0f00:0c4d, not traced)")
            src = self.store.picture(owners[0][0])
            x, y, w, h = STANDARD
            cell = pygame.Surface((w, h), depth=8)
            cell.set_palette(IDENTITY)
            cell.blit(src, (0, 0), STANDARD)
            self._standards[i] = _keyed(cell, self.standard_mask)
        return self._standards[i]

    def pennant(self, n: int) -> Rect:
        """Pennant of 1..4 armies (ovl64:0335, DS:2d4e[n-1])."""
        return PENNANT_X, self.pennant_rows[n - 1], PENNANT_W, PENNANT_H

    def city_mark(self, owner: int, shift: int) -> Rect:
        sx, sy, w, h = self.city_marks[owner_row(owner)]
        return sx, sy + shift * h, w, h
