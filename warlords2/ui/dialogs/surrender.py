"""The surrender offer (the pending `SurrenderOffered`, ovl68:04bd -> ovl61:1f68) and the screen
after it is declined (TurnCue "surrender_declined", ovl61:1ecd).

Evidence (asm ovl61:1e4e..2073):
* Offer 1f68: 12bf:07a5, DS:166a = 1, ovl58:0000(9) music (M10c), ovl17:0000(0x14): popup 0x14 =
  RESIGN.PCK (picture 12) at (136, 40) 368 x 390, its title and words part of the picture (no
  STRING text is drawn; `SurrenderOffered.info["text"]` has nothing behind it here);
  ovl53:056a(0x1e): JOIN screen 30; 08a9:066e(485, 1), (486, 1); SCN 0x15f = 1 (the engine);
  12bf:0757.  Buttons (DBUTTON.PCK): 485 accept, 486 decline.
* 485 -> 07be:0aaa -> ovl61:1e4e: the computers out, SCN 0x15b, news (the engine,
  AcceptSurrender(True)); 12bf:07a5, ovl17:069c (this popup closed), ovl61:1fbd (the victory
  screen, `ui.dialogs.victory`, the pending Victory), 0757.  No ovl61:011f.
* 486 -> 07be:0ab1 -> ovl61:1ecd: 07a5, ovl17:069c, ovl58:0000(0xa) music (M10c),
  ovl17:0000(0x15): popup 0x15 = RESIGNNO.PCK (picture 14), ovl53:056a(0x1f): JOIN screen 31,
  08a9:066e(484, 1), 0757; SCN 0x10f3 words (the engine, AcceptSurrender(False)).  DS:166a stays
  1.  The engine runs 484's continuation ovl68:04bd(0) with the answer; its events follow the
  TurnCue "surrender_declined" and are held here until 484.
* 484 (BUTTON.PCK) -> 07be:0ab8 -> ovl61:2046: 07a5, ovl17:069c, 0757, DS:166a = 0,
  ovl61:011f(0, 0, 0) (the buttons, `Game.screen_closed`), ovl68:04bd(0) (2063).
* Keys (07be:0064 with DS:166a set, `ui.keys.popup_key`): 485 is only in the Return list DS:155c,
  486 only in the Esc list DS:1514, 484 in both; right press: the button's help.
"""
from __future__ import annotations

from ...model import events as E
from .. import registry
from .hero_offer import wait
from .victory import VictoryScreen

OFFER_POPUP, OFFER_SCREEN, ACCEPT, DECLINE = 0x14, 30, 485, 486
DECLINED_POPUP, DECLINED_SCREEN, DONE = 0x15, 31, 484
DECLINED = "surrender_declined"


class SurrenderOffer(VictoryScreen):
    def __init__(self, host, on_close=None):
        super().__init__(host, OFFER_POPUP, OFFER_SCREEN, (ACCEPT, DECLINE), on_close)

    def press(self, id: int) -> bool:
        self.close(id == ACCEPT)
        return True


@registry.dialog("surrender")
def surrender(host, on_close=None):
    return SurrenderOffer(host, on_close)


@registry.dialog(DECLINED)
def surrender_declined(host, on_close=None):
    return VictoryScreen(host, DECLINED_POPUP, DECLINED_SCREEN, (DONE,), on_close)


@registry.event_view(E.TurnCue)
def _declined(host, ev):
    """The decline screen; the turn start's events after it wait for 484."""
    if ev.info.get("kind") != DECLINED:
        return None
    done = getattr(host, "screen_closed", None)
    return wait(registry.open_dialog(DECLINED, host, on_close=lambda _: done and done()))
