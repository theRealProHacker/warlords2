"""Army types (ARMYTYPE.DAT records) and armies (1e1d:8880 records, EL §5.1, §6.1, §7)."""
from __future__ import annotations

from dataclasses import dataclass

# The 20 words after the name, in file order (docs/formats/tables.md §1).
WORDS = (
    "strength", "turns", "cost", "moves", "buy_price",
    "str_bonus_city", "str_bonus_open", "str_bonus_woods", "str_bonus_hills",
    "stack_bonus_city", "stack_bonus_open", "stack_bonus_woods", "stack_bonus_hills",
    "special", "enemy_stack_mod", "cancel_mode", "flag16", "flag17", "flag18", "flag19",
)


@dataclass(frozen=True)
class ArmyType:
    type_id: int
    name: str
    strength: int            # w0
    turns: int               # w1
    cost: int                # w2
    moves: int               # w3
    buy_price: int           # w4
    str_bonus_city: int      # w5..w8
    str_bonus_open: int
    str_bonus_woods: int
    str_bonus_hills: int
    stack_bonus_city: int    # w9..w12
    stack_bonus_open: int
    stack_bonus_woods: int
    stack_bonus_hills: int
    special: int             # w13
    enemy_stack_mod: int     # w14
    cancel_mode: int         # w15
    flag16: int              # flies
    flag17: int              # forest move
    flag18: int              # hills move
    flag19: int              # ship

    @classmethod
    def from_record(cls, rec: dict) -> ArmyType:
        """From a `formats.tables.parse_armytypes` record."""
        return cls(rec["type_id"], rec["name"], *(rec[w] for w in WORDS))


@dataclass
class Army:
    id: int
    type_id: int             # +4
    owner: int               # +5
    x: int                   # +0 (x < 0: off the map, e.g. in transit)
    y: int                   # +2
    allowance: int           # +6 movement allowance
    moves_left: int          # +7
    strength: int            # +8
    home_city: int           # +9 (hero: city it appeared in)
    hero_slot: int           # +0xa for heroes
    medals: int              # +0xa for non-heroes
    upkeep: int              # +0xb
    flags: int               # +0xc (0x1000 aboard, 0x02..0x10 temple blessings)
    vector_dest: int         # +0xf bits 1-7
    transit: int             # +0x10 (0x65, 0x66, 0xff)
    group: int               # +0x11
    goto: tuple[int, int]    # +0x12 / +0x14, (-1, -1) = none
