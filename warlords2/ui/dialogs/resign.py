"""Order > Resign (menu 509, key 'r').

Evidence (asm ovl49:150d..1851; key table 07be:0337 'r' -> 07be:022d -> ovl49:150d; buttons
07be:04d8 487 -> 0ac6 ovl49:1608(0), 488 -> 0aca ovl49:1608(1), 489 -> 0ad4 ovl49:1832):
* 150d: DS:5dea[SCN 0x110] (the side's city count) == 0 -> nothing (151c); else DS:166a = 1,
  popup 1 ((160, 90) 320x200, marble), SetFont(1, 15, 0, 3) STRING (165, 0) centred at
  (320, 92), SetFont(2, 15, 0, 3) STRING (165, 1..3) centred at (320, 140 / 160 / 180)
  (1526..15d1); JOIN screen 33 (15d4), 487 / 488 / 489 normal (15dc..1603).  The buttons are
  RESIGNBU.PCK cells (BUTTON.DAT).  DS:166a set: Esc and Return press 489 (DS:1514 and DS:155c
  hold it, not 487 / 488; `ui.keys`).
* 489 -> 1832: ovl17:069c, DS:166a = 0, ovl61:011f(1, 1, 1) (the redraw and the palette refresh).
* 487 / 488 -> 1608(di): ovl17:069c, DS:166a = 0 (1610..161b); di == 0 (487): ovl61:10fb with
  STRING (165, 6), (165, 7), (165, 8) one after the other (one-line messages, each waiting),
  ovl61:1160((165, 9), (165, 10)) (two lines, waiting), the map redraw ovl64:006c (161f..168f);
  then for both the burning (1694..17ec: `Resign`, rules.victory.resign: cities razed silently
  by ovl32:016b(x, y, 0), armies deleted, heroes through ovl36:16cd, Hidden Map seen, the
  selection cleared, ovl62:0000), ovl61:011f(1, 1, 1) (17f9); di == 1 (488): then
  ovl61:1160((165, 4), (165, 5)) (1801..182b).  So the gracious answer talks before the burning
  and the other one after it.  `graceful` is di == 0.  No sound, no music.
The gate 151c reads the stored count DS:5dea (`economy.cached_cities`), which only ovl62:03f9
rewrites (`rules.economy`).  The burning ovl32:016b sets the owner bytes (01c3) without it, so
after a resignation the word keeps the old count until the next 03f9 (a report page ovl42:0343,
a battle, at the latest the round end's 18b3), and this dialog opens again in the same turn.
"""
from __future__ import annotations

import pygame

from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..widgets import ButtonRow, kit, text_centred
from .hero_offer import answer, human_phase, raw

POPUP, SCREEN, GROUP = 1, 33, 165
GRACEFUL, UNGRACEFUL, KEEP = 487, 488, 489
TITLE_AT, LINES_AT = (320, 92), ((320, 140), (320, 160), (320, 180))
INK, SHADOW = 15, 0
BEFORE = ((6,), (7,), (8,), (9, 10))           # 487: ovl49:161f..1687
AFTER = ((4, 5),)                              # 488: ovl49:1806..1826


class Resign(Dialog):
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        lay = k.layouts.screen(SCREEN)
        self.row = ButtonRow([lay.button(i) for i in (GRACEFUL, UNGRACEFUL, KEEP)], k.picture)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        host = self.host
        if id == KEEP:                                       # ovl49:1832
            self.close(None)
            host.settings_closed()                           # ovl61:011f(1, 1, 1): 0174 ...
            drawn = getattr(host, "palette_drawn", None)
            if drawn is not None:
                drawn()                                      # ... and ovl66:0356 (0168)
            return True
        if id == GRACEFUL:                                   # 1608(0)
            self.close(id)
            messages(host, BEFORE, lambda: answer(host, C.Resign(True)))
            return True
        if id == UNGRACEFUL:                                 # 1608(1)
            self.close(id)
            if answer(host, C.Resign(False)) is not None:
                messages(host, AFTER)
            return True
        return False

    def draw(self, fb: pygame.Surface) -> None:
        k = self.k
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *TITLE_AT, raw(k, GROUP, 0), INK, SHADOW)
        f = k.fonts[CHANCE17]
        for i, at in enumerate(LINES_AT, 1):
            text_centred(fb, f, *at, raw(k, GROUP, i), INK, SHADOW)
        self.row.draw(fb)


def messages(host, seq, then=None) -> None:
    """ovl61:10fb / 1160 one after the other (each waits), then `then()`."""
    if not seq:
        if then is not None:
            then()
        return
    k = kit(host.app)
    lines = [raw(k, GROUP, i) for i in seq[0]]
    registry.open_dialog("message", host, lines=lines, on_close=lambda _: messages(host, seq[1:], then))


@registry.dialog("resign")
def resign(host, on_close=None):
    return Resign(host, on_close)


@registry.action(registry.MENU_ID["resign"])
def open_resign(host):
    """07be:022d -> ovl49:150d: nothing for a side without cities (DS:5dea, 151c)."""
    from ...rules import economy
    st = getattr(host, "state", None)
    if st is None or human_phase(host) is None:
        return None
    if economy.cached_cities(st, st.current) == 0:
        return None
    return registry.open_dialog("resign", host)
