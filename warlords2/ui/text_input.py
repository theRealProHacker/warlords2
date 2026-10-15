"""The text input of ovl56: the line editor ovl56:03a6 and the input box ovl56:0000 around it.

One widget for every caller (register X52): Rename City (ovl45:2013), the Save Game
description (ovl49:0995), the hero name of the offer (ovl47:12ce) and the signpost lines
(ovl13:03dd) use the same editor; the first two also the same box.

Evidence (asm ovl56):
* ovl56:0000(title, l1, l2, text, ok, cancel, cancel_live, limit, width): DS:166a = 1,
  DS:58d0 = 0 (input variant), DS:58ce = cancel_live, DS:58d4 = limit, DS:58d2 = width (0xe8
  when width <= 0, 001e..0029), ok / cancel to DS:592c / DS:5928, the text copied to DS:58d8;
  ovl56:00e2 draws popup type 1, SetFont(1, 15, 0, 3) the title centred at DS:2368,
  SetFont(2, 15, 0, 3) the lines centred at the points of DS:2318 + 16 si (si = 2, + 1 per
  line given: + 0 / + 2 the first, + 4 / + 6 the second), and the field ovl59:0058(DS:236c,
  DS:58d8): colour 3, bevel 14d0:02e5(4, 2), the text opaque at (x + 3, y + 2); JOIN screen 5;
  ovl56:02c7: 189 normal, 190 normal when DS:58ce else disabled, 191 normal (input variant);
* 191 -> ovl56:037c -> 03a6(DS:236c, DS:58d8, DS:58d4, DS:58d2), then 02c7 again;
* ovl56:03a6(rect, buffer, limit, width): the inside (x + 1, y + 1, w - 2, h - 2) in colour 3,
  typing from empty at (x + 3, y + 2), the cursor DS:2375 at text width + 5 (its ink alternates
  15 / 9 each time the key poll ovl59:020d returns: on a key, or when its poll count (1000 /
  20000) or a time test on 0000:1bf0 (emulated floating point, not decoded) ends; drawn
  steady in 15 here); Return keeps the typed text (also when empty, 0575), Escape (and Del,
  ovl59:020d 024d) the old one (045b); Backspace; characters 0x20 <= c < 0x7b (0495..04cf)
  while fewer than limit - 1 are typed and the text typed so far is narrower than width;
* 189 -> ovl56:0312(1): ovl17:069c, ok(DS:58d8) (0363); 190 -> 0312(0): ovl17:069c, cancel()
  (0373);
* keys outside the editor (07be:0064 with DS:166a set, `ui.keys`): Esc presses 190, Return 189
  (DS:1514 / DS:155c); 'A'..'Z' nothing; every other key the chord.
"""
from __future__ import annotations

import pygame

from ..assets.exe import ds_str, ds_words
from ..assets.fonts import CHANCE17, CHANCE36
from .dialog import Dialog
from .dialogs.setup_side import bevel
from .keys import popup_input
from .layout import DISABLED, NORMAL
from .widgets import ButtonRow, text_centred

CURSOR = 0x2375
INK, SHADOW, PAPER = 15, 0, 3
FIRST, LAST = 0x20, 0x7B                         # ovl56:0495..04cf: 0x20 <= c < 0x7b
POPUP, SCREEN = 1, 5
YES, NO, FIELD = 189, 190, 191
TITLE_AT, LINES_AT, BOX = 0x2368, 0x2318 + 16 * 4, 0x236C
DEFAULT_WIDTH = 0xE8                             # ovl56:0026


class LineEditor:
    """ovl56:03a6 on a rectangle: `feed(events)` types; it returns (result, i) once Return
    ("ok", the typed text) or Esc / Del ("cancel", None) ended the editing at event i, else
    None.  `text` is what is typed so far."""

    def __init__(self, k, rect, limit: int, width: int):
        self.k, self.rect = k, tuple(rect)
        self.limit, self.width = limit, width
        self.text = ""

    def feed(self, events):
        f = self.k.fonts[CHANCE17]
        for i, e in enumerate(events):
            if e.type != pygame.KEYDOWN:
                continue
            if e.key in (pygame.K_RETURN, pygame.K_KP_ENTER):
                return ("ok", self.text), i                       # ovl56:0575, also ""
            if e.key in (pygame.K_ESCAPE, pygame.K_DELETE):     # Del = Esc (ovl59:020d 024d)
                return ("cancel", None), i                        # ovl56:045b: the old text
            if e.key == pygame.K_BACKSPACE:
                self.text = self.text[:-1]
                continue
            u = getattr(e, "unicode", "")
            if len(u) == 1 and FIRST <= ord(u) < LAST:
                if len(self.text) < self.limit - 1 and f.width(self.text) < self.width:
                    self.text += u
        return None

    def draw(self, fb) -> None:
        f = self.k.fonts[CHANCE17]
        x, y, w, h = self.rect
        fb.fill(PAPER, (x + 1, y + 1, w - 2, h - 2))
        f.draw(fb, x + 3, y + 2, self.text, INK, SHADOW)
        f.draw(fb, x + f.width(self.text) + 5, y + 2, ds_str(self.k.exe, CURSOR), INK, SHADOW)


class InputBox(Dialog):
    """ovl56:0000.  `text` is DS:58d8; it closes with the text (189, ok) or None (190,
    cancel); subclasses override `answer`."""

    def __init__(self, k, title: str, lines: list[str], text: str, limit: int, width: int,
                 cancel_live: bool = True, on_close=None, host=None):
        super().__init__(on_close)
        if host is not None:
            self.host = host
        if len(lines) != 2:
            raise ValueError("the input box has two lines")     # every caller passes two
        self.kit = k
        exe = k.exe
        self.title, self.lines = title, list(lines)
        self.title_at = ds_words(exe, TITLE_AT, 2)
        self.lines_at = [ds_words(exe, LINES_AT + 4 * i, 2) for i in range(2)]
        self.box = ds_words(exe, BOX, 4)
        self.text = text                                    # DS:58d8
        self.limit = limit                                  # DS:58d4
        self.width = width if width > 0 else DEFAULT_WIDTH  # DS:58d2
        self.editor: LineEditor | None = None
        lay = k.layouts.screen(SCREEN)
        self.buttons = ButtonRow([lay.button(YES), lay.button(NO), lay.button(FIELD)], k.picture)
        self.buttons.state[NO] = NORMAL if cancel_live else DISABLED   # ovl56:02c7

    @property
    def typing(self) -> str | None:
        return None if self.editor is None else self.editor.text

    def _type(self, events) -> None:
        """ovl56:03a6; the keys typed after the one that ended it stay in the BIOS buffer
        (ovl59:020d reads one key per call), so the box's own key read 07be:0064 gets them next
        (as `hero_name.HeroName.finish` hands them on): "abc, Return, Return" presses 189."""
        r = self.editor.feed(events)
        if r is not None:
            (how, text), i = r
            if how == "ok":
                self.text = text
            self.editor = None
            keys = [e for e in events[i + 1:] if e.type in (pygame.KEYDOWN, pygame.KEYUP)]
            if keys and self.stack is not None:
                self.update(keys, 0)

    def update(self, events, dt) -> None:
        if self.editor is not None:
            return self._type(events)
        rest = popup_input(self, events, self.buttons, self.kit.exe, self.press)
        if self.editor is not None and rest:
            self._type(rest)

    def press(self, id: int) -> bool:
        if id == FIELD:
            self.editor = LineEditor(self.kit, self.box, self.limit, self.width)
            return True                                  # the rest of the frame types
        if id in (YES, NO):
            self.answer(id == YES)
        return False

    def answer(self, yes: bool) -> None:
        """ovl56:0312."""
        self.close(self.text if yes else None)

    def draw(self, fb: pygame.Surface) -> None:
        k = self.kit
        f = k.fonts[CHANCE17]
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *self.title_at, self.title, INK, SHADOW)
        for (x, y), s in zip(self.lines_at, self.lines):
            text_centred(fb, f, x, y, s, INK, SHADOW)
        x, y, w, h = self.box
        fb.fill(PAPER, self.box)
        bevel(fb, self.box, 4, 2)
        if self.editor is None:                          # ovl59:0058
            f.draw(fb, x + 3, y + 2, self.text, INK, SHADOW, PAPER)
        else:                                            # ovl56:03a6
            self.editor.draw(fb)
        self.buttons.draw(fb)
