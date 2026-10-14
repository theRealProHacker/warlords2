"""Start state (docs/plan.md section 2.2).

pgsm gives the start state `on_init` only, never `on_enter`, so the app always starts in
`boot`, whose first `update` requests the real target with its arguments.
"""
from __future__ import annotations

import argparse
from typing import Any

import pygame

from .base import BaseState


N_SIDES = 8
DEFAULT_CONTROLS = "HCCCCCCC"      # chosen here: side 1 human, the rest computer
DEFAULT_LEVELS = "00000000"        # 0 in the shipped SCN files (scenario.md 0x0C0)


def _per_side(flag: str, s: str, allowed: dict[str, int]) -> tuple[int, ...]:
    s = s.upper()
    if len(s) != N_SIDES or not set(s) <= set(allowed):
        raise SystemExit(f"{flag}: need {N_SIDES} characters of {'/'.join(allowed)}, got {s!r}")
    return tuple(allowed[c] for c in s)


def new_game_config(cfg: argparse.Namespace):
    """`NewGameConfig` from --scenario and its flags (docs/plan.md section 3.2).

    No CLI source: `cards` and `enhanced` are (0,) * 8, `names` is None (the scenario's
    names)."""
    from ..model.ids import LEVEL_OFF, Control         # M4a
    from ..model.newgame import NewGameConfig
    from ..model.options import GameOptions
    controls = _per_side("--controls", cfg.controls or DEFAULT_CONTROLS,
                         {"H": Control.HUMAN, "C": Control.COMPUTER})
    levels = _per_side("--levels", cfg.levels or DEFAULT_LEVELS, {str(n): n for n in range(LEVEL_OFF + 1)})
    if cfg.options:
        try:
            options = GameOptions.from_words(int(w) for w in cfg.options.split(","))
        except ValueError as e:
            raise SystemExit(f"--options: {e}") from None
    else:
        options = GameOptions()
    return NewGameConfig(scenario=cfg.scenario, controls=controls, levels=levels, cards=(0,) * N_SIDES,
                         enhanced=(0,) * N_SIDES, names=None, options=options,
                         army_set=int(cfg.alt_names), seed=cfg.seed)


def boot_target(cfg: argparse.Namespace, available: set[str]) -> tuple[str, dict[str, Any]]:
    """(state name, on_enter kwargs) to go to from boot, given the states that exist."""
    if cfg.probe:
        return cfg.probe, {}
    if cfg.scenario:
        if "game" not in available:
            raise SystemExit("--scenario: the game state is not implemented yet (M3)")
        return "game", {"new_game": new_game_config(cfg)}
    if "intro" in available and not cfg.no_intro:
        return "intro", {}
    if "menu" in available:
        return "menu", {}
    raise SystemExit("no menu state yet (M2b); start a probe state with --probe NAME")


class Boot(BaseState):
    def __init__(self, app, target: str, kw: dict[str, Any]):
        super().__init__(app)
        self.target, self.kw = target, kw

    def step(self, events: list[pygame.event.Event], dt: float) -> None:
        self.request(self.target, **self.kw)

    def paint(self, fb: pygame.Surface) -> None:
        fb.fill(0)
