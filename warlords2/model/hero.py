"""Hero slots, 40 entries (EL §5.1: 2c04:0543 used, 0593 female, 0223 name, 05e3 level/exp)."""
from __future__ import annotations

from dataclasses import dataclass


@dataclass
class HeroSlot:
    used: int = 0
    female: int = 0
    name: str = ""
    level: int = 0           # bits 0-1 of 2c04:05e3[s]
    exp: int = 0             # bits 2-7
