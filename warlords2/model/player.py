"""One side: SCN name, per-side words and the player record at 2c04:0185 + p*0x14 (EL §6.1)."""
from __future__ import annotations

from dataclasses import dataclass, field


@dataclass
class Quest:
    """Quest record, 0xc bytes at 2c04:1103 + p*0xc (EL §5.1)."""
    active: int = 0
    type: int = 0
    hero: int = 0            # army index of the questing hero
    target: int = 0
    amount: int = 0
    progress: int = 0


@dataclass
class Player:
    index: int
    name: str                # SCN 0x000 + p*20
    control: int             # SCN 0x0D0[p], Control
    level: int               # SCN 0x0C0[p], 0..2 = K/L/W, 3 = off
    card: int                # SCN 0x0E0[p]
    enhanced: int            # SCN 0x0F0[p]
    alive: int               # SCN 0x137[p]
    gold: int                # record +0
    capital: tuple[int, int] # record +4 / +6
    infamy: int = 0          # 2c04:10e3[p]
    shown: int = 0           # SCN 0x147[p]
    quest: Quest = field(default_factory=Quest)
