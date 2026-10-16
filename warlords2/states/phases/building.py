"""Building: start the engine game, after the scenario load when the game was entered
without one.

From the setup screen the load and the strategic map (ovl57:0194, ovl63:232b) ran before
the Game Setup screen and the bitmap came with Begin (`overview=`); Begin goes straight
into the game (ovl57:0cfe -> ovl61:0000(0, 1)), so only the engine game starts here.
--scenario has no setup screen: the same load (`states.setup.load_scroll`, STRING groups
135 then 137) runs first, its rolls from an `Rng` like the one `new_game` starts with.
Then the main loop runs (`Game.start_turns`: ovl61:0000(0, 1) -> ovl61:2123, whose passes begin
with the site tiles, map words and cost map) before the first frame of the map.
A load (`load_slot=`) does not pass here: `Game.step` runs `Game.start_load` (the game screen
of an in-game load stays up, with its phase, under the scroll; DS:2a86 stays 1).
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
        if g.overview is None:
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
        g = self.game
        self.done = False
        g.start_turns()
        g.map_ready = True
        if g._next is None and not g.dialogs:     # the loop was refused (logged): the bare map
            return "human"
        return None                          # turn_start / human chosen, or the message first

    def paint(self, fb) -> None:
        """The frame between Begin's loop handing a human turn start over (`Game.hand_over`)
        and the turn-start phase: what the turn start drew before its pop-up (ovl68:0259 di = 1:
        the info area 03a4; di = 0: the strip) over the buttons the run left (0174 / 0418)."""
        g = self.game
        if g._next == "turn_start" and g.run_palette is not None:
            from ...ui.palettes import painter_for
            painter = painter_for(g)
            if g.bar_blank:
                painter.strip(fb)                    # ovl68:034c, no ovl66:0356 (di = 0)
            else:
                painter.draw(fb, g.state)            # ovl68:03a4
            g.run_palette.draw(fb)


PHASE = Building
