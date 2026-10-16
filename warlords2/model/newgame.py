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
    rng_state: `rules.rng.Rng.state()` of that one stream as the setup screen's loader found
    it (before ovl63:2479's 256 rolls): ovl59:02bf seeds itself once per run (DS:2678,
    ovl59:0356), so the Game Start faces' rolls and an earlier setup visit's rolls come
    before the loader's (`states.menu.session_dice`).  `new_game` continues it (its source
    decides the die; `seed` and `rng` only name where it began); None starts the stream at
    `seed` with `rng`, as `--scenario` does (no Game Start, so nothing rolls before the
    loader).  `rules.setup.begin` (Load Map's Begin, which continues the live stream) refuses
    a cfg with rng_state or setup_rolls set.
    random_flag: DS:28c8, the Game Start screen's random-map flag (`rules.randmap.RandomRun.
    random`), which ovl57:007f writes into SCN 0x120 at every ovl57:0000 entry; `new_game`
    sets SCN 0x120 from it (0 for a scenario from the list).
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
    rng_state: dict | None = None
    random_flag: int = 0
