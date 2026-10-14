"""What the Game Setup screen hands to `rules.setup.new_game`."""
from __future__ import annotations

from dataclasses import dataclass

from .options import GameOptions


@dataclass(frozen=True)
class NewGameConfig:
    """Per-side tuples have 8 entries, in player order.

    controls: Control per side (SCN 0x0D0).  levels: 0..2 (K/L/W) or LEVEL_OFF = side switched
    off (SCN 0x0C0).  cards: card number (SCN 0x0E0).  enhanced: SCN 0x0F0.  names: None
    keeps the scenario's names.  army_set: 0 = ARMYTYPE.DAT, 1 = ARMYTYP2.DAT (tables.md §1,
    DS:26c4).  seed: engine RNG seed.  rng: die source of rules.rng.Rng, "python" (default,
    distribution-equivalent) or "borland" (the executable's rand(), plan register X06).
    greatest: SCN 0x116 as the setup screen left it (I am the Greatest, ovl57:0ee8 writes 1 /
    0 at ovl57:0f52 / 0f60); None keeps the scenario file's word.  setup_rolls: the
    (dice, sides, add) of every ovl59:02bf roll the setup screen made after the loader's
    (quotation ovl57:0fe8, Random Characters ovl57:20af), in order; `new_game` repeats them
    after the loader's rolls so the game's dice continue the one stream of ovl59:02bf.
    """
    scenario: str
    controls: tuple[int, ...]
    levels: tuple[int, ...]
    cards: tuple[int, ...]
    enhanced: tuple[int, ...]
    names: tuple[str, ...] | None
    options: GameOptions
    army_set: int
    seed: int
    rng: str = "python"
    greatest: int | None = None
    setup_rolls: tuple[tuple[int, int, int], ...] = ()
