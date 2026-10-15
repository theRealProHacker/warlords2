"""Order > Signpost (menu 519, key 'x'): the two lines of the sign under the selected stack.

Evidence (asm ovl13:01a4..04d6; key table 07be:0337 'x' -> 07be:0268 -> ovl13:01a4; buttons
07be:04d8 421 -> 0a1e ovl13:0486, 422 -> 0a26 ovl13:03dd, 423 -> 0a2e ovl13:0432):
* 01a4..02ad: no selected stack, its square's terrain not the sign, CURRENT.SGN missing or no
  record at the stack's square -> nothing; else DS:3f9a = the record's index (`rules.signs.sign_at`
  gives it, None when the EXE opens nothing);
* 02b0 popup 1 ((160, 90) 320x200, marble); 02d7(0): SetFont(1, 15, 0, 3) DS:03eb centred at
  (320, 94); SetFont(2, 15, 0, 3) DS:03f7 centred at (320, 140), DS:0410 at (320, 160); the name
  boxes ovl59:0058((200, 190, 240, 22), line 1) and ((200, 215, 240, 22), line 2) (the box of
  `hero_offer.name_box`); DS:166a = 1; JOIN screen 24 (02c6); 03ae: 421 / 422 / 423 normal;
* 422 -> 03dd: ovl56:03a6(the line-1 box, record +4, 0x1e, 0xd8) (`ui.dialogs.hero_name`: the
  field starts empty, Return keeps what was typed, Esc the old line, at most 0x1e - 1 characters
  and narrower than 216 px), then 042d falls into 0432: the same for line 2 (record +0x36, the
  line-2 box), then 03ae;  423 -> 0432 alone;
* 421 -> 0486: CURRENT.SGN written whole (open mode 9, 04a8), the buffer freed, ovl17:069c,
  ovl61:0000(0, 0) (the redraw and the palette refresh).  No cancel: the line editors write the
  record in place, and Esc / Return press 421 (both lists hold it).  Here the edit is the
  command `EditSign(sign, line1, line2)` sent at 421 (the game state's signs are CURRENT.SGN).
"""
from __future__ import annotations

import logging

import pygame

from ...assets.exe import ds_str
from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from ...rules import signs
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..widgets import ButtonRow, kit, text_centred
from .hero_offer import answer, human_phase, name_box

log = logging.getLogger(__name__)

POPUP, SCREEN = 1, 24
OK, LINE1, LINE2 = 421, 422, 423
TITLE, ASK1, ASK2 = 0x03EB, 0x03F7, 0x0410
TITLE_AT, ASK1_AT, ASK2_AT = (320, 94), (320, 140), (320, 160)
BOX1, BOX2 = (200, 190, 240, 22), (200, 215, 240, 22)          # ovl13:036b / 0393, 03e3 / 0438
MAX_LEN, MAX_WIDTH = 0x1E, 0xD8                                 # ovl13:03fc / 0451
INK, SHADOW = 15, 0


class Signpost(Dialog):
    def __init__(self, host, sign: int, on_close=None):
        super().__init__(on_close)
        self.host, self.sign = host, sign
        k = self.k = kit(host.app)
        s = host.state.world.signs[sign]
        self.lines = [s.line1, s.line2]
        lay = k.layouts.screen(SCREEN)
        self.row = ButtonRow([lay.button(i) for i in (OK, LINE1, LINE2)], k.picture)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        if id == OK:
            self.ok()
            return True
        if id in (LINE1, LINE2):
            self.edit(id - LINE1, then_next=id == LINE1)
            return True
        return False

    def edit(self, n: int, then_next: bool) -> None:
        """ovl56:03a6 on line n (03dd / 0432); after line 1 line 2 follows (042d)."""
        def done(text):
            if text is not None:
                self.lines[n] = text
            if then_next:
                self.edit(1, False)
        registry.open_dialog("hero_name", self.host, rect=(BOX1, BOX2)[n], old=self.lines[n],
                             max_len=MAX_LEN, max_width=MAX_WIDTH, on_close=done)

    def ok(self) -> None:
        """ovl13:0486."""
        self.close(None)
        if answer(self.host, C.EditSign(self.sign, *self.lines)) is None:      # Human.apply: 0174
            log.error("EditSign refused for sign %d: %r", self.sign, self.lines)
            refresh = getattr(getattr(self.host, "phase", None), "refresh", None)
            if refresh is not None:
                refresh()                                    # the one ovl61:0000 of 04cc

    def draw(self, fb: pygame.Surface) -> None:
        k = self.k
        exe = k.exe
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *TITLE_AT, ds_str(exe, TITLE), INK, SHADOW)
        f = k.fonts[CHANCE17]
        text_centred(fb, f, *ASK1_AT, ds_str(exe, ASK1), INK, SHADOW)
        text_centred(fb, f, *ASK2_AT, ds_str(exe, ASK2), INK, SHADOW)
        name_box(fb, f, BOX1, self.lines[0])
        name_box(fb, f, BOX2, self.lines[1])
        self.row.draw(fb)


@registry.dialog("signpost")
def signpost(host, sign: int, on_close=None):
    return Signpost(host, sign, on_close)


@registry.action(registry.MENU_ID["signpost"])
def open_signpost(host):
    """07be:0268 -> ovl13:01a4."""
    st = getattr(host, "state", None)
    if st is None or human_phase(host) is None:
        return None
    i = signs.sign_at(st)
    if i is None:
        return None
    return registry.open_dialog("signpost", host, sign=i)
