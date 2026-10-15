"""The treachery question: with Diplomacy on, the side on turn attacks a side it is at peace
with, or a city (index > 0, ovl36:00e2) of a side it is neutral with; squares of the neutral
owner 0x0f never ask (ovl36:00bd) (`TreacheryPrompt`, rules.combat.attack).

Evidence (asm ovl36:010c..0170, ovl36:2262..2272, ovl56:0088):
* ovl36:010c: ovl56:0088(STRING (140, 0), (140, 1), (140, 2), (140, 3), (140, 4), yes
  3024:006b -> ovl36:20a8, no 3024:0070 -> ovl36:2262): the confirmation box
  (`ui.dialogs.confirm`, popup 1, JOIN screen 5: 189 yes, 190 no; DS:166a set, so Esc answers
  no and Return yes through `ui.keys`), title (140, 0), body lines (140, 1..4);
* yes: ovl36:20a8 (`ConfirmTreachery(True)`: infamy, war both ways, the attack);
* no: ovl36:2262: ovl61:011f(0, 0, 0) (redraw only; `ConfirmTreachery(False)` changes
  nothing; the human phase's refresh is ovl61:0174).
ovl36:010c..0170 asks whoever attacks (no human test), so the view opens for every attacker.
The answer goes through the human phase (`apply`), whose animator plays the
attack's events after this view.
"""
from __future__ import annotations

from ...model import commands as C
from ...model import events as E
from .. import registry
from ..widgets import kit
from .confirm import Confirm
from .hero_offer import raw

GROUP, LINES = 140, 4


def texts(k) -> tuple[str, list[str]]:
    """Title and body lines: STRING (140, 0) and (140, 1..4)."""
    return raw(k, GROUP, 0), [raw(k, GROUP, i) for i in range(1, LINES + 1)]


def answer(host, yes: bool):
    cmd = C.ConfirmTreachery(bool(yes))
    apply = getattr(getattr(host, "phase", None), "apply", None)
    return apply(cmd) if apply is not None else host.command(cmd)


@registry.dialog("treachery_confirm")
def treachery_confirm(host, on_close=None):
    k = kit(host.app)
    title, lines = texts(k)

    def done(yes):
        answer(host, yes)
        if on_close:
            on_close(yes)
    return Confirm(k, title, lines, done, host=host)


@registry.event_view(E.TreacheryPrompt)
def treachery_prompt(host, ev):
    d = registry.open_dialog("treachery_confirm", host)
    return _wait(d)


def _wait(d):
    while d.stack is not None:
        yield None
