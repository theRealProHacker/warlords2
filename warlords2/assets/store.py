"""Pictures and palettes from the game directory.

WARLORD2.EXE holds a static table of 79 pictures, 12 bytes each, at DS:0x1F56 (count at
DS:0x230A; `assets.exe`), indexed like the 79 names of FILE.DAT group 3
(docs/formats/graphics.md section 2, Transparency):

    +0  u8   flags: bits 0-1 directory (0 PICS\\, 1 <scenario>\\PICS\\, 2 TERRAIN<n>\\),
             bit 5 build a mask from the key colour; bit 4 (0x10, set only on abits.pck)
             is undocumented and ignored here
    +5  u8   cache group        +10 u16 key colour

Masked pictures get the key as colour key; all others are drawn opaque.  A name can
appear twice (marble.pck at index 25, group 1, and 39, group 8): lookup by name gives
the last entry, lookup by index (GFX #G, BUTTON.DAT) the exact one.  The table is
read from the user's EXE at run time.  Pictures are decoded on first use and cached; that
must happen on the main thread (pgsm hooks run on other threads, docs/plan.md 2.1).
"""
from __future__ import annotations

import struct
import sys
import threading
from dataclasses import dataclass

import pygame

from ..formats.gamedir import EXE_NAME, GameDir
from .exe import ds_bytes, ds_word
from ..formats.pal import parse_pal
from ..formats.pck import Bitmap, decode_pck
from ..formats.tables import StringTable
from ..ui.screen import IDENTITY, indexed_surface

PIC_TABLE, PIC_COUNT = 0x1F56, 0x230A       # DS offsets
PIC_ENTRY = 12
PIC_GROUP = 3                       # FILE.DAT group with the picture names
FLAG_DIR = 0x03
FLAG_MASK = 0x20
DIRS = {0: "PICS", 2: "TERRAIN{t}"}          # 1 = <scenario>/PICS
# Named without a digit in FILE.DAT, shipped as quadrants 0 TL, 1 TR, 2 BL, 3 BR of
# 320x240 each (graphics.md section 3, Root and PICS, [shot]).
QUADRANTS = ("startup.pck", "screen.pck")
PALETTES = ("STANDARD.PAL", "BLACK.PAL")

# ERROR.DAT messages (group, index); printed to stderr, never on screen (plan 1.6).  A file
# the EXE cannot open (0997:0489..04b5 pictures, ovl61:0971..099c, ovl45:1e92..1eb6) is
# sprintf(ERROR.DAT (1, 0) via ovl59:051a, name) handed to ovl52:0000, which plays the chord
# (ovl58:0b5f at ovl52:002e) before it prints the message and exits (ovl59:012b, 0a4c:02b5).
# The three boot tables STRING / ERROR / FILE.DAT fail silently in the EXE (ovl59:03a0 jumps
# to 04ec); here a file missing while the store is built is reported and exits without it.
ERR_SCENARIO, ERR_FILE, ERR_MOUSE = (0, 0), (1, 0), (2, 0)


@dataclass(frozen=True)
class PicEntry:
    index: int
    name: str           # lower case, as in FILE.DAT
    flags: int
    group: int
    key: int

    @property
    def directory(self) -> int:
        return self.flags & FLAG_DIR

    @property
    def masked(self) -> bool:
        return bool(self.flags & FLAG_MASK)


def parse_picture_table(exe: bytes, names: list[str]) -> list[PicEntry]:
    """The EXE picture table, one entry per FILE.DAT group-3 name."""
    count = ds_word(exe, PIC_COUNT, signed=False)
    if count != len(names):
        raise ValueError(f"picture table has {count} entries, FILE.DAT group {PIC_GROUP} {len(names)}")
    out = []
    for i, name in enumerate(names):
        e = ds_bytes(exe, PIC_TABLE + PIC_ENTRY * i, PIC_ENTRY)
        out.append(PicEntry(i, name.lower(), e[0], e[5], struct.unpack_from("<H", e, 10)[0]))
    return out


class AssetStore:
    def __init__(self, gd: GameDir, terrain_set: int = 0, app=None):
        self.gd = gd
        self.app = None                                  # set once the tables below are read
        self.terrain_set = terrain_set
        self.errors = StringTable(self.read("DATA/ERROR.DAT"))
        names = StringTable(self.read("DATA/FILE.DAT")).groups[PIC_GROUP]
        self.pictures = parse_picture_table(self.read(EXE_NAME), names)
        self._by_name = {p.name: p for p in self.pictures}
        self.palettes = {n: parse_pal(self.read(n)) for n in PALETTES}
        self._cache: dict[tuple[int, str | None], pygame.Surface] = {}
        self.app = app                                   # the chord of ovl52:0000 from here on

    def error(self, which: tuple[int, int], arg: str) -> str:
        """An ERROR.DAT message with its %s filled in."""
        return self.errors.get(*which).replace("\\n", "").replace("%s", arg)

    def read(self, rel: str) -> bytes:
        """Bytes of a game file; a missing file plays the chord (once the store is built with
        an app), prints the ERROR.DAT message and exits."""
        try:
            return self.gd.read(rel)
        except FileNotFoundError:
            errors = getattr(self, "errors", None)       # unset while ERROR.DAT itself loads
            if self.app is not None:
                from ..audio import effects
                effects.chord(self.app)                  # ovl52:002e, before the message
            print(self.error(ERR_FILE, rel) if errors else f"cannot open {rel}", file=sys.stderr)
            raise SystemExit(1) from None

    def palette(self, rel: str) -> list[tuple[int, int, int]]:
        if rel not in self.palettes:
            self.palettes[rel] = parse_pal(self.read(rel))
        return self.palettes[rel]

    def entry(self, which: str | int) -> PicEntry:
        """By FILE.DAT name (the last entry of that name) or by table index."""
        if isinstance(which, int):
            return self.pictures[which]
        return self._by_name[which.lower()]

    def _dir(self, e: PicEntry, scenario: str | None) -> str:
        if e.directory == 1:
            if scenario is None:
                raise ValueError(f"{e.name} lives in a scenario directory; pass scenario=")
            return f"{scenario}/PICS"
        return DIRS[e.directory].format(t=self.terrain_set)

    def bitmap(self, rel: str) -> Bitmap:
        return decode_pck(self.read(rel))

    def picture(self, which: str | int, scenario: str | None = None) -> pygame.Surface:
        """A table picture by FILE.DAT name or table index, keyed as the table says.  Cached."""
        _main_thread()
        e = self.entry(which)
        k = (e.index, scenario if e.directory == 1 else None)
        if k not in self._cache:
            d = self._dir(e, scenario)
            key = e.key if e.masked else None
            if e.name in QUADRANTS:
                stem = e.name.rsplit(".", 1)[0]
                s = pygame.Surface((640, 480), depth=8)
                s.set_palette(IDENTITY)
                for q in range(4):
                    s.blit(indexed_surface(self.bitmap(f"{d}/{stem}{q}.pck")), (320 * (q % 2), 240 * (q // 2)))
                if key is not None:
                    s.set_colorkey(key)
            else:
                s = indexed_surface(self.bitmap(f"{d}/{e.name}"), key)
            self._cache[k] = s
        return self._cache[k]

    def surface(self, rel: str, key: int | None = None) -> pygame.Surface:
        """Any PCK by path (pictures outside the table, e.g. START/*.PCK, STAND.PCK)."""
        _main_thread()
        return indexed_surface(self.bitmap(rel), key)


GROUP8 = 8                          # the cache group of DS:51a9 / 51e4 (register X44)


class CacheGroup8:
    """Which picture of cache group 8 the EXE holds loaded (register X44).

    Every cache call that draws or loads a picture (0997:00a2 / 0129 / 027e / 034a) first
    tests the picture's loaded bit (+0 bit 2, e.g. 0135..0141): when it is set nothing is
    loaded or unloaded; otherwise it unloads the first loaded picture with the same group
    byte +5 (0143..0171: 059c clears bit 2 and frees the bitmap and mask records,
    1012:0975 sets +0x34 = 0) and loads the new one (03a9 sets bit 2 at 04c2).  So at most
    one of the 49 group-8 pictures is loaded, and it is the last one asked for.  0997:0066
    (ovl57:0014, ovl49:0449) unloads every loaded picture whose directory (+0 bits 0-1) is
    not 0: in group 8 the movebars, TOWER.PCK and CITYBACK.PCK (TERRAIN<n>) and SCENARIO.PCK
    (<scenario>\\PICS).  Nothing else in the EXE writes the loaded bit or the
    records DS:51a9 / 51e4 (0997:000e / 003a have no caller; 0997:03a9 and 059c are only
    called from 0997 itself).  Before the first group-8 load nothing of the group is loaded.

    `now`: the occupant after the last load point this program has passed, in the EXE's
    order of its loads (the hooks `cache_load` / `cache_unload` sit where the UI does what
    the EXE routine with the cache call does).  `shown`: every occupant since the last map
    draw this program knows to be one of the EXE's (`map_drawn`, the computer turn's
    ovl64:006c); the map on the screen is the one the EXE drew last, so the flag of a
    planted item 11 / 12 drawn every frame can come from any of them.  A per-App word
    (`App.group8`), not game state."""

    def __init__(self, pictures):
        self.pictures = pictures
        self.now: int | None = None
        self.shown: set[int | None] = {None}

    def load(self, index: int) -> None:
        """0997:00a2 / 0129 / 027e / 034a with picture `index` (other groups: no change)."""
        if self.pictures[index].group != GROUP8:
            return
        self.now = index
        self.shown.add(index)

    def unload(self) -> None:
        """0997:0066: the pictures of directory != 0 unloaded."""
        if self.now is not None and self.pictures[self.now].directory != 0:
            self.now = None
            self.shown.add(None)

    def map_drawn(self) -> None:
        """An ovl64:006c of the EXE at this point of its order: the map holds `now`'s flag."""
        self.shown = {self.now}


def group8_of(owner) -> CacheGroup8 | None:
    """The App's `CacheGroup8` from an App, an AssetStore, a Kit or anything with `.app`
    (None for a store built without an App)."""
    o = getattr(owner, "store", owner)                     # a Kit -> its AssetStore
    o = getattr(o, "app", o)                               # an AssetStore / host -> the App
    return getattr(o, "group8", None)


def cache_load(owner, *pictures: int) -> None:
    """The EXE's cache calls for `pictures`, in this order (`CacheGroup8.load`)."""
    g = group8_of(owner)
    if g is not None:
        for k in pictures:
            g.load(k)


def cache_unload(owner) -> None:
    """0997:0066 (`CacheGroup8.unload`)."""
    g = group8_of(owner)
    if g is not None:
        g.unload()


def map_drawn(owner) -> None:
    """ovl64:006c reached in the EXE's order (`CacheGroup8.map_drawn`)."""
    g = group8_of(owner)
    if g is not None:
        g.map_drawn()


def _main_thread() -> None:
    if threading.current_thread() is not threading.main_thread():
        raise RuntimeError("pictures load on the main thread (pgsm hooks run on others)")
