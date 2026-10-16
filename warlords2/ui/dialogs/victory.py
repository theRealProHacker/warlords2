"""The victory screen (the pending `Victory`, ovl68:04bd -> ovl61:1fbd; also after an accepted
surrender, ovl61:1e4e -> 1fbd).

Evidence (asm ovl61:1fbd..2045):
* 1fbd: ovl58:0000(3) music (M10c), 12bf:07a5, DS:166a = 1, ovl17:0000(0x16): popup 0x16 =
  RESIGNYE.PCK (picture 13, ovl17:0000's mapping, `ui.widgets.POPUP_PICTURE`) at (136, 40)
  368 x 390 (its title and words are part of the picture: no STRING text is drawn);
  ovl53:056a(0x20): JOIN screen 32; 08a9:066e(483, 1); SCN 0x157 = 1 (the engine,
  `rules.victory.victory_screen`); 12bf:0757.  No wait: the screen stays up, the main loop has
  returned to the command loop.
* 483 (BUTTON.PCK) -> 07be:0abf -> ovl61:2004: 12bf:07a5, ovl17:069c (the popup closed), 0757,
  DS:166a = 0, ovl64:15da, SCN 0x124 (Hidden Map) = 0 (2026), ovl61:011f(1, 1, 1) (the map, the
  overview, the info bar and the buttons drawn again), ovl68:04bd(0) (203e): the command
  CloseVictory (`Game.answer`), whose events (the rest of the turn start) are played next.
* Keys (07be:0064 with DS:166a set, `ui.keys.popup_key`): 483 is in both DS:1514 and DS:155c, so
  Esc and Return press it; right press: the button's help (HLP record 483).
"""
from __future__ import annotations

from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..widgets import POPUP_PICTURE, ButtonRow, kit
from ...assets.store import cache_load

POPUP, SCREEN, DONE = 0x16, 32, 483


class VictoryScreen(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, host, popup=POPUP, screen=SCREEN, ids=(DONE,), on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        self.popup = popup
        lay = k.layouts.screen(screen)
        self.row = ButtonRow([lay.button(i) for i in ids], k.picture)
        cache_load(k, POPUP_PICTURE.get(popup, 25), *(b.picture for b in self.row.buttons))   # ovl17:0000, buttons (X44)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        self.close(None)
        return True

    def draw(self, fb) -> None:
        self.k.draw_popup(fb, self.popup)
        self.row.draw(fb)


@registry.dialog("victory")
def victory(host, on_close=None):
    return VictoryScreen(host, on_close=on_close)
