"""Edit Options on the Game Setup screen (button 148).

Evidence (WARLORD2.EXE ovl57):
* 148 -> ovl57:0cf4 -> 12a2: popup type 4 (marble, (120, 50) 400x360), the page
  ovl57:12ca(-1), JOIN screen 4, buttons ovl57:15cd;
* page ovl57:12ca: title STRING 8 SetFont(1, 15, 0, 3) centred at (320, 55); colour 15
  lines (160, 111) and (160, 250), colour 0 lines (161, 112) and (161, 251), each 320
  long; colour 3 over (320 - w/2 - 4, y, w + 8, 2) at y = 111 / 250 for the headings
  STRING 9 / 10 (w = their widths), which are centred at (320, 104) / (320, 243) in
  SetFont(2, 15, 0, 3);
* option i (STRING group 4 / OPTIONS.DAT order): i < 6 at y = 131 + 30 (i / 2), else at
  y = 270 + 30 ((i - 6) / 2); x = 128 for even i, 320 for odd i; label STRING (4, i)
  left at (x, y) in SetFont(2, 15, 0, 3); value left at (x + 128, y) in
  SetFont(2, 7, 0, 3): option 0 STRING (5, value); option 5 the EXE strings DS:25a5
  when set, DS:25a9 when clear; the others DS:25ac when set, DS:25af when clear (the
  inversion of option 5 is as coded; the rating formula, EL section 6.9, adds option 5);
* buttons ovl57:15cd: 159-168 (one per option) normal; 169-171 pressed while the first
  six words equal row 0-2 of the presets at DS:2378 (ovl57:1241), else normal; 172 normal;
* dispatch 07be:04d8: 159-168 -> ovl57:1650(i): option 0 cycles 0 -> 1 -> 2 -> 0, the
  others toggle; 169-171 -> ovl57:1694(p): the first six words become preset row p;
  172 -> ovl57:16c6 (close; the setup screen redraws its buttons and rating).
Input (DS:166a = 1, ovl57:12b5; `ui.keys.popup_input`): 172 is in DS:1514 and DS:155c, so
Esc and Return close, 'A'..'Z' nothing, any other key the chord; a left press on a pressed
preset chords (07be:0e7b).
`words` (the ten option words, DS:23b4) is changed in place; the dialog closes with None.
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..layout import NORMAL, PRESSED
from ..widgets import ButtonRow, kit, text_centred
from ...assets.store import cache_load

POPUP, SCREEN = 4, 4
OPTION_IDS, PRESET_IDS, OK = range(159, 169), range(169, 172), 172
PRESETS, N_AFFECTING = 0x2378, 6
ON_OFF_5, ON_OFF = (0x25A5, 0x25A9), (0x25AC, 0x25AF)
TITLE, HEAD_1, HEAD_2, LABELS, NEUTRAL = 8, 9, 10, 4, 5
INK, VALUE_INK, SHADOW, PAPER = 15, 7, 0, 3


def presets(exe: bytes) -> list[tuple[int, ...]]:
    """The three preset rows of ten words at DS:2378 (Beginner, Intermediate, Advanced)."""
    return [ds_words(exe, PRESETS + 20 * p, 10) for p in range(3)]


def matches(words, row) -> bool:
    """ovl57:1241: the first six words equal the preset row."""
    return list(words[:N_AFFECTING]) == list(row[:N_AFFECTING])


def apply_preset(words: list[int], row) -> None:
    """ovl57:1273 / 1694."""
    words[:N_AFFECTING] = list(row[:N_AFFECTING])


def cycle(words: list[int], i: int) -> None:
    """ovl57:1650."""
    words[i] = (words[0] + 1) % 3 if i == 0 else int(words[i] == 0)


def option_pos(i: int) -> tuple[int, int]:
    """ovl57:12ca (C division of non-negative values)."""
    y = 131 + 30 * (i // 2) if i < 6 else 270 + 30 * ((i - 6) // 2)
    return (128 if i % 2 == 0 else 320), y


class Options(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, k, words: list[int], host, on_close=None):
        super().__init__(on_close)
        self.kit, self.words, self.host = k, words, host
        self.presets = presets(k.exe)
        self.buttons = ButtonRow(list(k.layouts.screen(SCREEN).buttons), k.picture)
        cache_load(k, *(b.picture for b in self.buttons.buttons))   # SETUPBU buttons, 0771:0090 (X44)
        self._states()

    def _states(self) -> None:
        """ovl57:15cd."""
        st = self.buttons.state
        for id in OPTION_IDS:
            st[id] = NORMAL
        for p, id in enumerate(PRESET_IDS):
            st[id] = PRESSED if matches(self.words, self.presets[p]) else NORMAL
        st[OK] = NORMAL

    def value_text(self, i: int) -> str:
        v = self.words[i]
        if i == 0:
            return self.kit.text.S(NEUTRAL, v)
        on, off = ON_OFF_5 if i == 5 else ON_OFF
        return ds_str(self.kit.exe, on if v else off)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.buttons, self.kit.exe, self.press)

    def press(self, hit: int) -> bool:
        if hit in OPTION_IDS:
            cycle(self.words, hit - OPTION_IDS[0])
        elif hit in PRESET_IDS:
            apply_preset(self.words, self.presets[hit - PRESET_IDS[0]])
        elif hit == OK:
            self.close(None)
            return True
        self._states()
        return False

    def draw(self, fb: pygame.Surface) -> None:
        k, t = self.kit, self.kit.text
        f, big = k.fonts[CHANCE17], k.fonts[CHANCE36]
        k.draw_popup(fb, POPUP)
        text_centred(fb, big, 320, 55, t.S(TITLE, 0), INK, SHADOW)
        for y in (111, 250):
            fb.fill(15, (160, y, 320, 1))
            fb.fill(0, (161, y + 1, 320, 1))
        for g, y, ty in ((HEAD_1, 111, 104), (HEAD_2, 250, 243)):
            s = t.S(g, 0)
            w = f.width(s)
            fb.fill(PAPER, (320 - int(w / 2) - 4, y, w + 8, 2))
            text_centred(fb, f, 320, ty, s, INK, SHADOW)
        for i in range(10):
            x, y = option_pos(i)
            f.draw(fb, x, y, t.S(LABELS, i), INK, SHADOW)
            f.draw(fb, x + 128, y, self.value_text(i), VALUE_INK, SHADOW)
        self.buttons.draw(fb)


@registry.dialog("options")
def options(host, words: list[int], on_close=None):
    return Options(kit(host.app), words, host, on_close)
