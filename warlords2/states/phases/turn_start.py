"""Turn start: the events of a main-loop run (`rules.turn.run`, after the new game or End Turn)
played one after the other, then the question the turn start left pending, then the human
phase.

The run itself is the engine's (`states.game.Game._loop`); what the original shows on the way is
registered per event: the "Turn %d" pop-up and the sound of TurnStarted (ovl68:03a9..0444,
`ui.dialogs.turn_start`, `audio.effects`), the talking advisor (TurnCue "advice", ovl58:026f(5)),
the turn-1 production screen (TurnCue "city_screen", ovl45:0000(2), M6b) and the tutorial pages
(TurnCue "tutorial", `ui.tutorial`).  The map shows the state after the run (the original draws
it at ovl64:0629 inside the turn start, before the pop-up; with Hidden Map and several humans the
game frame holds them back (black after End Turn, the backdrop at Begin) until the pop-up and the
turn sample are over, `Game.blank_map`, and the info bar until ovl66:0356 runs, `Game.bar_blank`).

A pending hero offer (HeroOffered, ovl68:04bd -> ovl47:0d5c) opens M7b's dialog "hero_offer"
(`Game.answer` takes its AcceptHero / NameHero, whose events, from rules.turn.resume(state, 1),
are played here too).  The events after the HeroOffered (the tutorial page (25, 0), which
ovl47:11d5..1207 shows inside 0d5c once the dialog is drawn) are held back and shown over the
dialog when it opens.  Without that dialog the offer of turn 1, whose only enabled terminal
button is accept (decline 0x120 is disabled on turn 1, ovl47:120c), is accepted with the drawn
name after those pages and a warning is logged; a later offer (accept or decline is the
player's choice) stays pending with an error logged, and the game cannot go on.

The end of the game (ovl68:04bd, `rules.turn.resume`): a pending Victory is the victory screen
(dialog "victory", RESIGNYE, button 483 -> CloseVictory), a pending SurrenderOffered the offer
(dialog "surrender", RESIGN, 485 / 486 -> AcceptSurrender); the decline screen (RESIGNNO, 484) is
the view of TurnCue "surrender_declined" (`ui.dialogs.surrender`), which holds the turn-start
events after it until 484.  Once the loop is over (SCN 0x15b and 0x157, ovl61:2236..2252) the
game goes on in the over phase instead of the human phase.

TurnCue "info_bar" (ovl68:05a8, ovl66:0356) is where a held-back info bar is drawn again
(`Game.info_bar_drawn`), and the buttons get their states (ovl61:0174 at 05ad); until then they
are as the run left them (after a run with computer turns: End Turn's ovl61:0418 disabled them,
or Begin's 0174), and a hero offer's answer refreshes them (ovl61:011f -> 0174).

The computer sides' turns: a run that draws goes through the computer phase
(`states.phases.computer`, M8b1), which hands the rest of the run, from the human turn start on,
to this phase (`Game.hand_over`); it runs the loop one computer side per run itself.  When this
phase has played a run that stopped before a computer side (`Game.loop_waits`) it runs the next
one too.  Without the AI hooks a computer side's turn is logged by rules/turn.py as not
implemented (strict mode refuses the loop, see `Game._loop`).
"""
from __future__ import annotations

import logging

from ...model import commands as C
from ...model import events as E
from ...rules import turn as T
from ...ui import registry
from ...ui.animate import Animator
from ...ui.palettes import ActionPalette, painter_for
from . import Phase

log = logging.getLogger(__name__)


class TurnStart(Phase):
    name = "turn_start"

    def enter(self) -> None:
        g = self.game
        self.painter = painter_for(g)
        self.palette = ActionPalette(g)
        run = getattr(g, "run_palette", None)
        if run is not None:                    # the buttons as the run left them (ovl61:0418 at
            self.palette.row.state = dict(run.row.state)     # End Turn; nothing enables them
            self.palette.row.buttons = list(run.row.buttons)  # before ovl61:0174 at ovl68:05ad)
            self.palette.hidden = set(run.hidden)
        else:
            self.palette.refresh(g.state, False)
        self.animator = Animator(g)
        self.asked = None
        self.held = []                         # events inside the offer dialog (ovl47:0d5c)
        self.accept_due = False
        events, g.turn_events = g.turn_events or [], None
        self.play(events, g.state.copy())

    def play(self, events, before) -> None:
        events = list(events)
        k = next((i for i, e in enumerate(events) if isinstance(e, E.HeroOffered)), None)
        if k is not None:
            events, self.held = events[:k + 1], events[k + 1:]
        self.animator.play(events, before)

    def _open_held(self) -> None:
        """The pages the offer dialog shows once it is drawn, over it (ovl47:11d5..1207)."""
        held, self.held = self.held, []
        for ev in reversed(held):          # pushed last = on top = shown first
            if isinstance(ev, E.TurnCue) and ev.info.get("kind") == "tutorial":
                registry.open_dialog("tutorial_page", self.game, index=ev.info["file"][1])
            else:
                log.error("event %s inside the hero offer dialog is not shown", type(ev).__name__)

    def busy(self) -> bool:
        return True

    def scene(self):
        return self.animator.scene if self.animator.busy else self.game.state

    def step(self, events, dt):
        if self.animator.busy:
            self.animator.step()
            return None
        g = self.game
        p = g.state.pending
        if self.accept_due:
            self.accept_due = False
            g.answer(C.AcceptHero(True))
            return None
        if p is None:
            if g.loop_waits():
                g.run_loop()
                return None
            return "over" if T.loop_over(g.state) else "human"
        if p is self.asked:
            return None
        self.asked = p
        if isinstance(p, E.Victory):                  # ovl61:1fbd
            registry.open_dialog("victory", g, on_close=lambda _: g.answer(C.CloseVictory()))
            return None
        if isinstance(p, E.SurrenderOffered):         # ovl61:1f68
            registry.open_dialog("surrender", g,
                                 on_close=lambda yes: g.answer(C.AcceptSurrender(yes), refresh=False))
            return None
        if isinstance(p, E.HeroOffered):
            if registry.has_dialog("hero_offer"):
                registry.open_dialog("hero_offer", g, offer=p)
                self._open_held()
                return None
            if p.info.get("free"):
                log.warning("hero offer of turn 1 (ovl47:0d5c): dialog 'hero_offer' (M7b) not implemented; "
                            "accepted with the drawn name %r (accept is its only enabled answer)", p.info["name"])
                self._open_held()
                self.accept_due = True
                return None
        log.error("%s pending after the turn start: its dialog is not implemented; the game cannot go on",
                  type(p).__name__)
        return "human"

    def paint(self, fb) -> None:
        self.painter.draw(fb, self.scene())
        self.palette.draw(fb)


PHASE = TurnStart
