"""Item record, 0x1d bytes at 2c04:0ce9, 22 entries (EL §5.1)."""
from __future__ import annotations

from dataclasses import dataclass


@dataclass
class Item:
    name: str                # +0x00
    type: int                # +0x14 ItemType
    value: int               # +0x15
    state: int               # +0x16 ItemState
    holder: int              # +0x17 army index (carried) or site index (in a site)
    x: int                   # +0x19 (on the map)
    y: int                   # +0x1b
