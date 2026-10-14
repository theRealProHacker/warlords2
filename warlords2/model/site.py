"""Site ("special") record, 0x1f bytes at 2c04:0811 (EL §5.1)."""
from __future__ import annotations

from dataclasses import dataclass


@dataclass
class Site:
    x: int                   # +0
    y: int                   # +2
    name: str                # +4
    kind: int                # +0x18 SiteKind
    item: int                # +0x19 item index
    guardian_or_ally: int    # +0x1a monster type (kinds 2/4) or ally army type (kind 5)
    flag_1b: int             # +0x1b word (X25)
    shown_mask: int          # +0x1d word, bit p = shown to player p
