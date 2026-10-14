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
  Here it is a Dialog that closes with True / False.  Keyboard answers: none traced.
Text positions are read from the EXE.
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from .. import registry
from ..dialog import Dialog
from ..widgets import ButtonRow, kit, text_centred

POPUP, SCREEN = 1, 5
YES, NO, FIELD = 189, 190, 191
TITLE_POS, BODY_POS = 0x2368, 0x2318
INK, SHADOW = 15, 0


class Confirm(Dialog):
    def __init__(self, k, title: str, lines: list[str], on_close=None):
        super().__init__(on_close)
        if not 1 <= len(lines) <= 4:
            raise ValueError("a confirmation has one to four body lines")
        self.kit, self.title, self.lines = k, title, list(lines)
        self.title_pos = ds_words(k.exe, TITLE_POS, 2)
        base = BODY_POS + 16 * len(lines)
        self.pos = [ds_words(k.exe, base + 4 * i, 2) for i in range(len(lines))]
        lay = k.layouts.screen(SCREEN)
        self.buttons = ButtonRow([lay.button(YES), lay.button(NO)], k.picture)

    def update(self, events, dt) -> None:
        for e in events:
            hit = self.buttons.event(e)
            if hit in (YES, NO):
                return self.close(hit == YES)

    def draw(self, fb: pygame.Surface) -> None:
        f = self.kit.fonts
        self.kit.draw_popup(fb, POPUP)
        text_centred(fb, f[CHANCE36], *self.title_pos, self.title, INK, SHADOW)
        for (x, y), s in zip(self.pos, self.lines):
            text_centred(fb, f[CHANCE17], x, y, s, INK, SHADOW)
        self.buttons.draw(fb)


@registry.dialog("confirm")
def confirm(host, title: str, lines: list[str], on_close=None):
    return Confirm(kit(host.app), title, lines, on_close)
