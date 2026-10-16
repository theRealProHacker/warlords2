"""One- and two-line messages that wait for a key or a mouse release.

Evidence: ovl61:10fb(msg) opens popup type 5 ((144, 179) 352x64, marble), sets
SetFont(2, 15, 0, 3) and draws msg centred at DS:2acc = (320, 201); ovl61:1160 draws two
lines centred at DS:2ad0 = (320, 190) and DS:2ad4 = (320, 212).  Both wait for an event
of mask 0xd4 (left or right button release, key; ovl59:0142), then close the popup.
The positions are read from the EXE.
"""
from __future__ import annotations

from ...assets.exe import ds_words
from ...assets.fonts import CHANCE17
from .. import registry
from ..dialog import Dialog
from ..widgets import is_dismiss, kit, text_centred

POPUP = 5
ONE_LINE, TWO_LINES = (0x2ACC,), (0x2AD0, 0x2AD4)
INK, SHADOW = 15, 0


class Message(Dialog):
    event_loop = False                 # ovl61:10fb / ovl59:0142: its own wait loop
    def __init__(self, k, lines: list[str], on_close=None):
        super().__init__(on_close)
        if len(lines) not in (1, 2):
            raise ValueError("a message has one or two lines")
        self.kit, self.lines = k, list(lines)
        offs = ONE_LINE if len(lines) == 1 else TWO_LINES
        self.pos = [ds_words(k.exe, o, 2) for o in offs]

    def update(self, events, dt) -> None:
        if any(is_dismiss(e) for e in events):
            self.close(None)

    def draw(self, fb) -> None:
        self.kit.draw_popup(fb, POPUP)
        for (x, y), s in zip(self.pos, self.lines):
            text_centred(fb, self.kit.fonts[CHANCE17], x, y, s, INK, SHADOW)


@registry.dialog("message")
def message(host, lines: list[str], on_close=None):
    return Message(kit(host.app), lines, on_close)
