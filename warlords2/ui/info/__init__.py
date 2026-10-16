"""Right-click info panels of the game screen (map, overview, stack palette).

Shared frame (Evidence, asm ovl46):
* ovl46:131a(rect, x, y, mode) places a 256x75 panel, ovl46:1486(rect, x, y) a 240x128 one,
  with the same rule: centre cx = ((px + 4) >> 3) << 3 clamped to [w/2, 640 - w/2],
  cy = py clamped to [h/2, 478 - h/2] (halves truncated), rectangle (cx - w/2, cy - h/2, w, h).
  Mode 1 (a map square) takes the square's centre, px = (x - SCN 0x177) * 40 + 36,
  py = (y - SCN 0x175) * 40 + 50 (ovl46:1338..135b); mode 0 the pointer.
* ovl46:1201 hides the pointer (12bf:07a5), saves the screen under the rectangle and draws
  picture 0x1d (POPUP.PCK) through its mask from (0, 0) at the rectangle (DS:1048 = 0, 0,
  256, 75); the sign (ovl46:0a1c) draws picture 0x24 (POPUP2.PCK) the same way, the army
  panel (ovl46:0626) picture 0x28 (POPUP3.PCK, DS:1050 = 0, 0, 240, 128).
* ovl46:10e1(title, text): SetFont(2, 7, 0, 3) title centred at (left + 120, top + 11),
  SetFont(2, 15, 0, 3) text centred at (left + 120, top + 35) (ovl59:00d6).
* Every panel sets DS:1174; the area dispatcher 0726:0009 then only waits, and when no mouse
  button is held (12bf:0944 = 0, 0726:003b..0048) ovl46:11cf restores the screen and shows
  the pointer.  Right presses meanwhile are ignored (ovl46:018a, ovl66:0aea).
"""
from __future__ import annotations

from typing import Callable

import pygame

from ...assets.fonts import CHANCE17
from ..dialog import Dialog
from ..mapview import AREA
from ..widgets import text_centred

SCREEN_W, SCREEN_BOTTOM = 640, 478          # 0x280, 0x1de
POPUP, POPUP2, POPUP3 = 29, 36, 40          # FILE.DAT group-3 pictures (0x1d, 0x24, 0x28)
SMALL, LARGE = (256, 75), (240, 128)        # ovl46:131a, ovl46:1486
SQUARE_CX, SQUARE_CY = 36, 50               # ovl46:1347 / 1358
TITLE_INK, TEXT_INK, SHADOW = 7, 15, 0
TEXT_X, TITLE_Y, TEXT_Y = 120, 11, 35


def panel_rect(pos: tuple[int, int], size: tuple[int, int] = SMALL) -> tuple[int, int, int, int]:
    """ovl46:131a / 1486: the panel rectangle around `pos`."""
    w, h = size
    cx = min(max((pos[0] + 4) >> 3 << 3, w // 2), SCREEN_W - w // 2)
    cy = min(max(pos[1], h // 2), SCREEN_BOTTOM - h // 2)
    return cx - w // 2, cy - h // 2, w, h


def square_centre(view_origin: tuple[int, int], x: int, y: int) -> tuple[int, int]:
    """Mode 1 of ovl46:131a: the screen centre a map square's panel is placed around."""
    left, top = view_origin
    return (x - left) * 40 + SQUARE_CX, (y - top) * 40 + SQUARE_CY


def in_map(pos: tuple[int, int]) -> bool:
    x, y, w, h = AREA
    return x <= pos[0] < x + w and y <= pos[1] < y + h


class Panel(Dialog):
    """A right-click panel: its picture at the rectangle, then `content(fb, left, top)`; it
    closes in the first frame with no mouse button held."""
    event_loop = False                 # ovl46: held while the right button is down (0726:003b loop)
    hides_pointer = True

    def __init__(self, k, input, rect, picture: int, content: Callable, on_close=None):
        super().__init__(on_close)
        self.kit, self.input, self.rect, self.picture, self.content = k, input, rect, picture, content

    def update(self, events, dt) -> None:
        if not self.input.buttons:
            self.close(None)

    def draw(self, fb: pygame.Surface) -> None:
        x, y, w, h = self.rect
        fb.blit(self.kit.picture(self.picture), (x, y), (0, 0, w, h))
        self.content(fb, x, y)


def two_lines(k, title: str, text: str, title_ink: int = TITLE_INK) -> Callable:
    """ovl46:10e1's text (the sign draws both lines in ink 15, ovl46:0b49)."""
    def content(fb, left, top):
        f = k.fonts[CHANCE17]
        text_centred(fb, f, left + TEXT_X, top + TITLE_Y, title, title_ink, SHADOW)
        text_centred(fb, f, left + TEXT_X, top + TEXT_Y, text, TEXT_INK, SHADOW)
    return content


def visible(state, sp, view_origin: tuple[int, int], x: int, y: int) -> bool:
    """ovl64:15ff(1, x, y): Hidden Map off -> yes; a square in the view -> its cache cell is
    not the black square 0x0e (ovl64:1648..169e, the cell `mapview.compose` builds); outside
    the view -> the road layer's seen bit 0x20 (ovl64:1736..174d)."""
    from ...assets.sprites import FOG_FULL
    from ...model.ids import MAP_W, ROAD_SEEN
    from ..mapview import VIEW, fog_mask
    if not state.options.hidden_map:
        return True
    w = state.world
    seen = bool(w.roads[y * MAP_W + x] & ROAD_SEEN)
    left, top = view_origin
    if left <= x < left + VIEW and top <= y < top + VIEW and not seen:
        return sp.fog_table[fog_mask(w, x, y, sp.neighbours)] != FOG_FULL
    return seen
