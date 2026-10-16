"""Tutorial pop-ups (TUTORIA, SCN 0x12e set; plan X09): when they show.

The engine decides and records each page (SCN byte 0x134) and returns it as
`TurnCue {"kind": "tutorial", "file": (25, n)}`: the turn-2 page (25, 7) of the human turn start
(ovl68:05bf..05ef, `rules.turn.resume`), the hero offer's page (25, 0) (ovl47:11d5..1207,
`rules.heroes.human_offer`; shown over the offer dialog by `states.phases.turn_start`, not here),
and the select / Next pages (25, 3), (25, 4), (25, 5) (0b62:04f7..063f, ovl67:01ea..0337,
`rules.selection.tutorial_pages`), and the move tail's (25, 9) on turn 1, (25, 4) / (25, 5)
(0c8c:02a1..0415, `rules.selection.tutorial_after_move` from `rules.movement._tail_01fd`).
Here each such cue is
shown when the animator reaches it, as the FILE.DAT page through ovl61:168d (`tutorial_page`,
dismissed by a key or a mouse release, also one queued in the same input batch as the press that
opened it: ovl61:10fb has no flush before ovl59:0142); the next event waits until it is closed, so
several pages of one command come one after the other in the EXE's order.

The other pages are shown by their screens: the production screen's (25, 1), (25, 6), (25, 2)
(ovl45:025d..0336, `ui.dialogs.production.screen_tutorial`), the setup screen's (25, 8)
(ovl57:00a4, `states.setup`) and the battle result's (25, 10) (ovl31:026e..0293, once per
program run by DS:0a54, `ui.dialogs.capture`).

This module is imported by `states.game` (it is not under a registry package).
"""
from __future__ import annotations

from ..model import events as E
from . import registry

TUTORIAL_GROUP = 25


def _wait(d):
    while d.stack is not None:
        yield None


@registry.event_view(E.TurnCue)
def tutorial_page(host, ev):
    if ev.info.get("kind") != "tutorial":
        return None
    group, index = ev.info["file"]
    if group != TUTORIAL_GROUP:
        raise ValueError("tutorial cue outside FILE.DAT group 25: %r" % (ev.info["file"],))
    return _wait(registry.open_dialog("tutorial_page", host, index=index))
