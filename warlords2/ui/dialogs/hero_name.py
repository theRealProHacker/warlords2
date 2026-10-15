"""The name editor of the hero offer: ovl56:03a6(rect, buffer, max length, max width)
(`ui.text_input.LineEditor`, the one editor of every ovl56 caller, register X52).

Evidence: ovl47:12ce calls ovl56:03a6(DS:113a = (328, 287, 208, 20), DS:44d2, 15, DS:1140 - 0x20 =
176) (asm ovl47:12d1..12eb); the editor as traced for the Setup Side retype
(`ui.dialogs.setup_side`, ovl56:03a6..04cf): the field starts empty, the inner rectangle colour
3, the text at (x + 3, y + 2) in SetFont(2, 15, 0, 3) and the cursor glyph DS:2375 at text
width + 5 (its ink alternates 15 / 9 each time the key poll ovl59:020d returns: on a key, or
when its poll count (1000 / 20000) or a time test on 0000:1bf0 (emulated floating point, not
decoded) ends; drawn steady in 15 here); Return keeps the typed text, Escape the old one;
Backspace; characters 0x20..0x7a while fewer than max length - 1 are typed and the text typed
so far is narrower than the max width.  After it returns ovl47:12ce runs only ovl47:120c (the
editor leaves the final text drawn; here the offer's name box shows it).

Return stores the typed text, also an empty one (ovl56:0575 copies the buffer; `NameHero("")`
is accepted); Escape keeps the old name (ovl56:045b).
"""
from __future__ import annotations

import pygame

from .. import registry
from ..dialog import Dialog
from ..text_input import LineEditor
from ..widgets import kit


class HeroName(Dialog):
    def __init__(self, k, rect, old: str, max_len: int, max_width: int, on_close=None):
        super().__init__(on_close)
        self.k, self.rect, self.old = k, tuple(rect), old
        self.max_len, self.max_width = max_len, max_width
        self.editor = LineEditor(k, rect, max_len, max_width)

    @property
    def text(self) -> str:
        return self.editor.text

    def update(self, events, dt) -> None:
        r = self.editor.feed(events)
        if r is not None:
            (how, text), i = r
            self.finish(text if how == "ok" else None, events[i + 1:])

    def finish(self, result, rest) -> None:
        """Close; the keys typed after Return / Esc stay in the BIOS buffer (ovl59:020d reads one
        key per call), so the next reader gets them: the dialog on top after the close (the
        line-2 editor that ovl13:042d opens, or the pop-up's 07be:0064)."""
        stack = self.stack
        self.close(result)
        keys = [e for e in rest if e.type in (pygame.KEYDOWN, pygame.KEYUP)]
        if keys and stack is not None and stack.top is not None:
            stack.top.update(keys, 0)

    def draw(self, fb) -> None:
        self.editor.draw(fb)


@registry.dialog("hero_name")
def hero_name(host, rect, old: str, max_len: int, max_width: int, on_close=None):
    return HeroName(kit(host.app), rect, old, max_len, max_width, on_close)
