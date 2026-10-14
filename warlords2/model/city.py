"""City record, 0x41 bytes at 2c04:157d + c*0x41 (EL §6.1)."""
from __future__ import annotations

from dataclasses import dataclass, field

from .ids import EMPTY_SLOT


@dataclass
class Slot:
    """One production slot: +0x16 type, +0x1a time, +0x1e strength, +0x22 moves, +0x26 cost."""
    type: int = EMPTY_SLOT
    time: int = 0
    strength: int = 0
    moves: int = 0
    cost: int = 0


@dataclass
class City:
    index: int
    x: int                         # +0x00, top-left square of the 2x2 city
    y: int                         # +0x02
    name: str                      # +0x04
    owner: int                     # +0x15 (0-7, 0x0f none)
    owner2: int                    # +0x2f (set to 0x0f when razed; meaning [I])
    defence: int                   # +0x14
    slots: list[Slot] = field(default_factory=list)
    income: int = 0                # +0x2a
    current: int = 0               # +0x2c army type in production
    turns_left: int = 0            # +0x2d
    attacked_by: int = 0           # +0x30 bitmask [I]
    vectoring: int = 0             # +0x31
    vector_to: tuple[int, int] = (0, 0)    # +0x33 / +0x35
    tail: list[int] = field(default_factory=list)   # +0x2e and +0x37..+0x40, meaning unknown
