"""Identifiers shared by the model and the rules.

EL = docs/research/exe_logic.md.  Values are the ones the executable stores, so records can
be compared with the SCN image and the EXE traces directly.
"""
from __future__ import annotations

from enum import IntEnum

MAP_W, MAP_H = 112, 156          # EL §4.1 (map at 1e1d:0000, y*0xE0 + x*2)
N_PLAYERS = 8                    # eight sides, SCN 0x137 / 0x0C0 / 0x0D0 arrays (EL §6.1)
NEUTRAL_OWNER = 0x0F             # neutral city +0x15, garrison +5, map nibble (EL §9.2, §9.5; X17 closed)
NO_OWNER = 0x0F                  # same value: "nobody" / razed (EL §4.1, §6.1)
FIGHT_ORDER_LAST_ROW = 8         # fight-order row = min(owner, 8) (EL §3.2 ovl38:008b)
HERO_TYPE = 28                   # army type 0x1c (EL §5.2 ovl47:031b, §7)
N_ARMY_TYPES = 29                # ARMYTYPE.DAT records (tables.md §1)
N_HERO_SLOTS = 40                # EL §5.1 (2c04:0543[s])
N_ITEMS = 22                     # EL §5.1 item table 2c04:0ce9
N_STARTING_ITEMS = 8             # items 0..7 are the per-side starting items (EL §5.2, §5.5)
N_SLOTS = 4                      # production slots per city (EL §6.1 +0x16..+0x19)
EMPTY_SLOT = -1                  # slot type byte 0xff, tested as signed `>= 0` (EL §6.1 ovl44:094f)


class Terrain(IntEnum):
    """STRING group 128 order, verified by the terrain popup ovl46:0000 (EL §4.1)."""
    ROAD = 0
    BRIDGE = 1
    WATER = 2
    SHORE = 3
    FOREST = 4
    HILLS = 5
    MOUNTAINS = 6
    PLAIN = 7
    MARSH = 8
    TOWER = 9
    CITY = 10
    SITE = 11


class TerrainClass(IntEnum):
    """Battle terrain class of ovl38:0000 (EL §3.3)."""
    CITY = 0
    OPEN = 1
    WOODS = 2
    HILLS = 3


class ItemType(IntEnum):
    """Item record +0x14 (EL §5.6); types 3 and 4 were not seen."""
    BATTLE = 1
    COMMAND = 2
    FLIGHT = 5
    DOUBLE_MOVE = 6
    GOLD = 7
    STANDARD = 8


class ItemState(IntEnum):
    """Item record +0x16 (EL §5.1)."""
    NOT_IN_PLAY = 0
    ON_MAP = 1
    IN_SITE = 2
    CARRIED = 3


class SiteKind(IntEnum):
    """Site record +0x18 (EL §5.1)."""
    EMPTIED = 0
    TEMPLE = 1
    ITEM_RUIN = 2
    SAGE = 3
    GOLD_RUIN = 4
    ALLIES_RUIN = 5


class Relation(IntEnum):
    """Relation bits 0-1 / 2-3 of 2c04:153b[a*8+b]; values [V], names [I] (EL §6.6, R10a)."""
    PEACE = 0
    NEUTRAL = 1
    WAR = 2


class Control(IntEnum):
    """SCN 0x0D0[p]: 0 human, 1 computer (EL §6.1, ovl68:0000)."""
    HUMAN = 0
    COMPUTER = 1


LEVEL_OFF = 3                    # SCN 0x0C0[p] = 3: side not playing (ovl57:0194, ovl57:0bab; EL §6.1)

# High byte of a map word (EL §4.1).
MAP_OWNER_MASK = 0x0F
MAP_ARMY = 0x10
MAP_FORTIFIED = 0x20             # word bit 0x2000
MAP_EXPLORED = 0x40              # word bit 0x4000, site searched (EL §5.1)
MAP_PORT = 0x80                  # word bit 0x8000
# Road layer byte at 19d9:0000 (EL §4.1, §5.6).
ROAD_PIECE_MASK = 0x1F
ROAD_SEEN = 0x20                 # set = seen in the working view: 0555:08bf blocks clear squares, ovl64:1298 sets it
ROAD_STANDARD = 0x40             # a planted standard: set by ovl47:09f7 (0b28), cleared by the take
#                                  ovl47:08c7 for items < 8 (093a) and at new game ovl53:0259; a drop
#                                  (ovl47:0943) or a dead hero's items (ovl36:16cd) never set it
