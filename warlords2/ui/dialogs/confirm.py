"""Two-button confirmation box with a title and one to four body lines.

Evidence: ovl56:0088(title, l1..l4, yes, no) and its draw ovl56:01ad:
* popup type 1 ((160, 90) 320x200, marble, framed);
* title SetFont(1, 15, 0, 3) centred at DS:2368 = (320, 92);
* body SetFont(2, 15, 0, 3); n = number of body lines given; line k centred at the k-th
  (x, y) of the table DS:2318 + 16 n (n = 4 starts higher, at y 140);
* buttons of JOIN screen 5 (ovl53:056a(5)): 189 answers yes, 190 answers no
  (07be:04d8 -> ovl56:0312(1 / 0)); 191 (the text field of the input variant
  ovl56:0000) is switched off;
* the box is not modal in the EXE: it returns and the button dispatcher calls back.
  Here it is a Dialog that closes with True / False;
* keys: ovl56:0088 sets DS:166a = 1 (008b), so 07be:0064's pop-up rules apply (`ui.keys`):
  Esc presses the first live id of DS:1514, which holds 190 and not 189 (no), Return the
  first live id of DS:155c, which holds 189 and not 190 (yes); 'A'..'Z' nothing; every other
  key the chord; a right press over a button its help (ovl15:0000).
Text positions are read from the EXE.
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..widgets import ButtonRow, kit, text_centred

POPUP, SCREEN = 1, 5
YES, NO, FIELD = 189, 190, 191
TITLE_POS, BODY_POS = 0x2368, 0x2318
INK, SHADOW = 15, 0


class Confirm(Dialog):
    def __init__(self, k, title: str, lines: list[str], on_close=None, host=None):
        super().__init__(on_close)
        if host is not None:
            self.host = host
        if not 1 <= len(lines) <= 4:
            raise ValueError("a confirmation has one to four body lines")
        self.kit, self.title, self.lines = k, title, list(lines)
        self.title_pos = ds_words(k.exe, TITLE_POS, 2)
        base = BODY_POS + 16 * len(lines)
        self.pos = [ds_words(k.exe, base + 4 * i, 2) for i in range(len(lines))]
        lay = k.layouts.screen(SCREEN)
        self.buttons = ButtonRow([lay.button(YES), lay.button(NO)], k.picture)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.buttons, self.kit.exe, self.press)

    def press(self, id: int) -> None:
        if id in (YES, NO):
            self.close(id == YES)

    def draw(self, fb: pygame.Surface) -> None:
        f = self.kit.fonts
        self.kit.draw_popup(fb, POPUP)
        text_centred(fb, f[CHANCE36], *self.title_pos, self.title, INK, SHADOW)
        for (x, y), s in zip(self.pos, self.lines):
            text_centred(fb, f[CHANCE17], x, y, s, INK, SHADOW)
        self.buttons.draw(fb)


@registry.dialog("confirm")
def confirm(host, title: str, lines: list[str], on_close=None):
    return Confirm(kit(host.app), title, lines, on_close, host=host)
