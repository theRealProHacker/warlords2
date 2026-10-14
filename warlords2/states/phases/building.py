"""Building: start the engine game, after the scenario load when the game was entered
without one.

From the setup screen the load and the strategic map (ovl57:0194, ovl63:232b) ran before
the Game Setup screen and the bitmap came with Begin (`overview=`); Begin goes straight
into the game (ovl57:0cfe -> ovl61:0000(0, 1)), so only the engine game starts here.
--scenario has no setup screen: the same load (`states.setup.load_scroll`, STRING groups
135 then 137) runs first, its rolls from an `Rng` like the one `new_game` starts with.
Then the first main-loop pass (`Game.loop_pass`) before the first frame of the map.
"""
from __future__ import annotations

from ...rules.rng import Rng
from ..setup import load_scroll
from . import Phase


class Building(Phase):
    name = "building"

    def enter(self) -> None:
        g = self.game
        self.done = False
        if g.overview is None and g.load_slot is None:
            cfg = g.config
            load_scroll(g, cfg.scenario, Rng(cfg.seed, cfg.rng), self._loaded)
        else:
            self._loaded(None, g.overview)

    def _loaded(self, sc, pixels) -> None:
        g = self.game
        g.overview = pixels
        g.start_engine(sc)
        self.done = True

    def step(self, events, dt):
        if not self.done:
            return None
        self.game.map_ready = True
        self.game.loop_pass()
        return "turn_start"


PHASE = Building
