"""The whole game state.

`flags` holds SCN words keyed by SCN offset: the header 0x0A0..0x182 and the player-record
words not modelled in `Player`, verbatim unless a rule changes them (plan register S1), plus
words of the runtime regions that the set-up writes (0x10f3[p]).  Words with a known role
have names below.  Bytes 0x100..0x10f and 0x134 are stored as byte values.
"""
from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass, field
from typing import Any

from .army import Army, ArmyType
from .city import City
from .hero import HeroSlot
from .item import Item
from .player import Player
from .site import Site
from .world import World

# SCN words with a known role (EL §6.1, §6.7, §6.9, §7).
SCN_CURRENT_PLAYER = 0x110
SCN_BONUS_CAP = 0x112
SCN_HUMAN_INFAMY = 0x116          # +400 start infamy for humans when set (EL §6.6, X29)
SCN_TUTORIAL = 0x12E
SCN_VICTORY = 0x15B
SCN_SURRENDER_OFFERED = 0x15D
SCN_TERRAIN_SET = 0x161
SCN_TURN_ORDER = 0x163            # 8 words
SCN_ROUND_COMPLETE = 0x118        # EL §9.2
SCN_TURN_POS = 0x173              # position in the turn order (EL §9.1)
SCN_ARMY_HIGH = 0x181             # army-table high-water mark (EL §9.2)


@dataclass
class Monster:
    """Ruin guardian: name 2c04:0f67 + t*0x10, strength 2c04:1007 + t*2 (EL §5.1)."""
    name: str
    strength: int


N_PATH_SLOTS = 20                 # 0555:0350 clears slots 19..0; 0x10b8 bytes = 20 x 0xd6
PATH_SLOT_CODES = 200             # +0x0e..+0xd5 (0555:146c, 165c, 1595 count to 0xc8)


@dataclass
class PathSlot:
    """One record of the path cache 0555 allocates at 0555:02f2 (0xd6 bytes each): +0 validity
    word, +2 mode, +4 mask, +6/+8 source, +0xa/+0xc destination, +0xe 200 direction codes.  A
    cleared slot (0555:146c) is all zero: source and destination (0, 0), 200 codes 0."""
    valid: int = 0
    mode: int = 0
    mask: int = 0
    src: tuple[int, int] = (0, 0)
    dst: tuple[int, int] = (0, 0)
    codes: list[int] = field(default_factory=lambda: [0] * PATH_SLOT_CODES)


def cleared_path_cache() -> list[PathSlot]:
    return [PathSlot() for _ in range(N_PATH_SLOTS)]


@dataclass
class Selection:
    """The selected stack and the stack palette (DGROUP words of the original, all zero in the
    EXE image and at new game).  Every field changes what a later command does, so all are
    game state (serialised and hashed); derived or display-only words are not kept:
    DS:5dfe (count) = len(moving), DS:2bda (group flag) = len(moving) > 1 wherever it is read
    with a selection, DS:5dfc / 5dfa (mode, mask) = rules.movement.stack_mode(moving), DS:5e00
    (lowest moves), DS:6832 (palette bracket marks), DS:2eaa / 2ea6 / 2ea8 (path display),
    DS:30f6 = len(palette).  Army ids stand for the original's far pointers (-1 = null)."""
    selected: int = -1                    # DS:5e62, the stack's leader
    moving: list[int] = field(default_factory=list)   # DS:5e3e[0..7], the moving group
    hero: int = -1                        # DS:5e5e, the group's hero (set by 0c8c:0529, ovl67:0955)
    next_ref: tuple[int, int] = (0, 0)    # DS:3250 / 3252, Next's reference square
    palette: list[int] = field(default_factory=list)            # DS:6862[i], square list order
    palette_selected: list[int] = field(default_factory=list)   # DS:6842[i], in the moving group
    palette_group: list[int] = field(default_factory=list)      # DS:6852[i], palette group index


BATTLE_A_SLOTS = 8                # DS:424c / 4274 / 429c: 8 bytes each
BATTLE_D_SLOTS = 32               # DS:422c / 4254 / 427c / 42a4: 32 bytes each (4 squares x 8)


@dataclass
class BattleWork:
    """The DGROUP battle arrays of the last ovl38:008b set-up (DS:41fa..436a, EL §7), written
    by every set-up, also the advisor's trial battles (ovl36:2065 -> 124a), and read after the
    battle by ovl36:0a6b (types; for defender i the byte DS:424c[i], ovl36:0c8e) and
    ovl01:1ded (quest check).  `a_types` / `d_types` are the whole arrays: a set-up writes
    only the first count bytes (asm ovl38:06e5..072d), so the bytes past a side's count are
    the previous set-up's.  The area is zero in the EXE image (file offset 0x33250 + 0x41fa),
    hence the zero defaults.  Army ids stand for the far pointers DS:42c6 / 42e6; the alive
    lists hold the current counts only (nothing reads past them)."""
    attacker: int = 0                     # DS:41fa
    owner: int = 0                        # DS:41fb
    attackers: list[int] = field(default_factory=list)   # DS:42c6[0..42c4)
    defenders: list[int] = field(default_factory=list)   # DS:42e6[0..42c5)
    a_alive: list[int] = field(default_factory=list)     # DS:4224[0..42c4)
    d_alive: list[int] = field(default_factory=list)     # DS:422c[0..42c5)
    a_types: list[int] = field(default_factory=lambda: [0] * BATTLE_A_SLOTS)   # DS:424c[8]
    d_types: list[int] = field(default_factory=lambda: [0] * BATTLE_D_SLOTS)   # DS:4254[32]


@dataclass
class GameState:
    world: World
    players: list[Player]
    cities: list[City]
    sites: list[Site]
    items: list[Item]
    armies: list[Army]
    heroes: list[HeroSlot]
    monsters: list[Monster]
    army_types: list[ArmyType]            # ARMYTYPE.DAT or ARMYTYP2.DAT, file order
    fight_order: list[list[int]]          # SCN 0x60B, 9 rows x 29 (EL §3.2)
    options: Any                          # GameOptions
    turn: int                             # SCN 0x135
    current: int                          # SCN 0x110
    relations: list[list[int]]            # 2c04:153b[a*8+b] bytes (EL §6.6)
    rng: Any                              # rules.rng.Rng
    history: list = field(default_factory=list)
    pending: Any = None                   # pending question event, or None
    flags: dict[int, int] = field(default_factory=dict)
    reveal_at_first_human_turn: int = 0   # DS:16a6, cleared at ovl68:026d (EL §9.2)
    overview_mountain_rolls: list[int] = field(default_factory=list)  # ovl63:232b's 256 rnd(1,3,1), the
    #                                     overview map's mountain colours (per pixel ovl63:2785; EL §9.1)
    cost_map: list[int] = field(default_factory=list)         # 0555:0d9e buffer DS:3f82, [] = not built
    path_cache: list[PathSlot] = field(default_factory=cleared_path_cache)   # DS:3f7e, 20 slots
    selection: Selection = field(default_factory=Selection)   # selected stack and stack palette
    hero_names: list = field(default_factory=list)  # per side [female, name] in file order, from
    #                                     TERRAIN<set>/HERONAM<p>.DAT (ovl47:0c67), given to rules.setup.new_game
    news: list = field(default_factory=lambda: [[] for _ in range(8)])  # 2c04:13e3 + p*0x2b, up to two
    #                                     [kind, a, b, name] per side (ovl41:1244; rules.heroes.news)
    battle_work: BattleWork = field(default_factory=BattleWork)   # last battle's DGROUP arrays
    # The talking advisor (ovl58:026f(5), rules.turn.advice): it writes SCN bytes 0x100 / 0x108
    # and rolls the game's dice, so its switches are game state.  Session settings in the
    # original, set by the caller (presentation) from the sound settings; off by default.
    advisor_talking: int = 0              # DS:26c8 == 0 (OPTIONS.SND digit 2, ovl33:05b7 toggle)
    advisor_digital: int = 0              # DS:37a4 != 0: sample groups, else caption groups (+30)
    advisor_groups: dict = field(default_factory=dict)   # FILE.DAT group -> number of entries
    #                                     (ovl59:052f picks a random one), for the advisor's groups

    def army_type(self, type_id: int) -> ArmyType:
        """The record with this id; the game scans for type_id (tables.md §1, ovl44:14ac)."""
        for t in self.army_types:
            if t.type_id == type_id:
                return t
        raise KeyError(type_id)

    def city_at(self, x: int, y: int) -> int:
        """Index of the city whose 2x2 block covers (x, y), else -1 (ovl62:044a)."""
        for i, c in enumerate(self.cities):
            if c.x in (x, x - 1) and c.y in (y, y - 1):
                return i
        return -1

    def site_at(self, x: int, y: int) -> int:
        """Index of the site at (x, y), else -1 (sites are looked up by x, y: EL §5.4)."""
        for i, s in enumerate(self.sites):
            if (s.x, s.y) == (x, y):
                return i
        return -1

    def hash(self) -> str:
        """SHA-256 of the canonical serialised state (incl. RNG state)."""
        from .serialize import dump
        blob = json.dumps(dump(self), sort_keys=True, separators=(",", ":"))
        return hashlib.sha256(blob.encode()).hexdigest()

    def copy(self) -> GameState:
        from .serialize import dump, load
        return load(dump(self))
