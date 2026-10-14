"""Right-click help on a button: the HLP record of its id (WARLORD2.HLP).

Evidence:
* a right press over a live button (hit test 08a9:0756, later records win) calls
  ovl15:0000(id) unless a popup is already up; ovl15:0000 reads HLP records until the id
  matches; word2 == 0 shows the record's title and text; other word2 values go to the
  dynamic selectors of ovl15:00df (registered with `registry.help_selector`); 65535
  matches no range and shows nothing; an id missing from HLP shows nothing;
* popup ovl46:1201 / 131a: POPUP.PCK (picture 29, keyed) 256x75 around the pointer:
  cx = ((x + 4) >> 3) << 3 clamped to [128, 512], cy = y clamped to [37, 441],
  rectangle (cx - 128, cy - 37, 256, 75);
* text ovl46:1158: title SetFont(2, 7, 0, 3) centred at (left + 120, top + 11),
  description SetFont(2, 15, 0, 3) centred at (left + 120, top + 35);
* it stays while any mouse button is held and closes when all are up (0726:0009);
  keys and left presses are ignored meanwhile; the pointer is hidden (12bf:07a5): a
  host does not draw the pointer while a dialog with `hides_pointer` is on its stack.
"""
from __future__ import annotations

import pygame

from ...assets.fonts import CHANCE17
from .. import registry
from ..dialog import Dialog
from ..widgets import kit, text_centred

POPUP_PICTURE, W, H = 29, 256, 75
TITLE_INK, TEXT_INK, SHADOW = 7, 15, 0
STATIC = 0


def popup_rect(pos: tuple[int, int]) -> tuple[int, int, int, int]:
    cx = min(max((pos[0] + 4) >> 3 << 3, W // 2), 640 - W // 2)
    cy = min(max(pos[1], 37), 478 - 37)
    return cx - W // 2, cy - 37, W, H


class PopupHelp(Dialog):
    hides_pointer = True

    def __init__(self, k, title: str, text: str, pos: tuple[int, int], input, on_close=None):
        super().__init__(on_close)
        self.kit, self.title, self.text, self.input = k, title, text, input
        self.rect = popup_rect(pos)

    def update(self, events, dt) -> None:
        if not self.input.buttons:
            self.close(None)

    def draw(self, fb: pygame.Surface) -> None:
        x, y, _, _ = self.rect
        f = self.kit.fonts[CHANCE17]
        fb.blit(self.kit.picture(POPUP_PICTURE), (x, y), (0, 0, W, H))
        text_centred(fb, f, x + 120, y + 11, self.title, TITLE_INK, SHADOW)
        text_centred(fb, f, x + 120, y + 35, self.text, TEXT_INK, SHADOW)


def help_texts(host, button_id: int) -> tuple[str, str] | None:
    """(title, text) for a button id, or None when the original shows no popup."""
    rec = kit(host.app).text.hlp(button_id)
    if rec is None:
        return None
    if rec["word2"] == STATIC:
        return rec["title"], rec["text"]
    sel = registry.help_selector_for(rec["word2"])
    return sel(host, rec, rec["word2"]) if sel else None


@registry.right_click("button")
def button_help(host, button_id: int, pos: tuple[int, int]):
    """Open the help popup of a button; returns the dialog or None."""
    if any(isinstance(d, PopupHelp) for d in host.dialogs):
        return None
    t = help_texts(host, button_id)
    if t is None:
        return None
    return host.dialogs.push(PopupHelp(kit(host.app), *t, pos, host.app.input))
