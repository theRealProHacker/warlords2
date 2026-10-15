"""The game state's phase machine (docs/plan.md sections 1.4 and 2.2).

One module per phase, `warlords2.states.phases.<name>`, each defining `PHASE`, a `Phase`
subclass.  `step` returns the name of the next phase or None to stay.  A phase whose
module does not exist yet (its milestone is not done) is entered as None: the game shows
the map and waits.
"""
from __future__ import annotations

import importlib

import pygame

NAMES = ("building", "turn_start", "human", "computer", "animating", "over")


class Phase:
    name = ""

    def __init__(self, game):
        self.game = game

    def enter(self) -> None:
        """Called on the main thread when the phase becomes current."""

    def step(self, events: list[pygame.event.Event], dt: float) -> str | None:
        return None

    def paint(self, fb: pygame.Surface) -> None:
        """Drawn after the game frame, before the dialogs."""

    def busy(self) -> bool:
        """Presenting something (no input taken)."""
        return False

    def held_mode(self) -> bool:
        """A mouse drag is held (DS:1176 / 1172)."""
        return False


def phase_class(name: str) -> type[Phase] | None:
    if name not in NAMES:
        raise ValueError(f"unknown phase {name!r}; phases are {NAMES}")
    mod = f"{__name__}.{name}"
    try:
        m = importlib.import_module(mod)
    except ModuleNotFoundError as e:
        if e.name != mod:
            raise
        return None
    return m.PHASE
