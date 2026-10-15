"""The Military Advisor ovl36:1f19 (a click with the question-mark cursor, plan X34).

The pop-up consumes the game's dice: the 19 trial battles of ovl36:2065 (`rules.combat.odds`),
then the address line (0x7c, -1) and the lead-in (0x7d, -1), each ovl59:04f0 index -1 ->
ovl59:02bf(1, n, -1) with n the STRING.DAT group's entry count.  So it is a command, `Advise`.
"""
from __future__ import annotations

from ..model import commands as C
from ..model import events as E
from . import combat
from .constants import combat as K


def advise(state, cmd: C.Advise) -> list:
    """Advise(x, y): with the Military Advisor option off (SCN 0x12c == 0) nothing happens and
    no event comes back (ovl36:1f24..1f2c returns before any roll).  Else r = ovl36:2065(x, y)
    on the current selection (`combat.selection_group`: DS:5e3e with DS:2bda, else DS:5e62;
    the set-up writes `state.battle_work`, as the original's trial set-ups do), then the two
    text rolls in that order.  Returns one `Advised` with info "x", "y", "verdict" (r, 0..9 =
    the index of STRING (0x7e, r)), "texts" ((0x7c index, 0x7d index)).  IllegalCommand when
    nothing is selected (selection_group).
    Evidence: asm ovl36:1f19..204f (1f24 SCN 0x12c, 1fd3 call 2065, 1ff0 (0x7c, -1), 200e
    (0x7d, -1), 202f (0x7e, r)); ovl59:052f..0595 (index < 0 -> 02bf(1, count, -1))."""
    if not state.options.military_advisor:
        return []
    group = combat.selection_group(state)
    verdict = combat.odds(state, group, cmd.x, cmd.y)
    n7c, n7d = K.ADVISOR_TEXT_COUNTS.value
    r1 = state.rng.rnd(1, n7c, K.TEXT_ROLL_ADD.value)
    r2 = state.rng.rnd(1, n7d, K.TEXT_ROLL_ADD.value)
    return [E.Advised({"x": cmd.x, "y": cmd.y, "verdict": verdict, "texts": (r1, r2)})]
