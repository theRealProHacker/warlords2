"""The shield strip on the right of the menu bar: "Turn %d" and the live sides' shields in turn
order, the side on turn boxed black, the one before it boxed white.

Evidence (asm ovl68:0952..0d8b, `draw(full, quiet)`; the first argument is [bp+6]: `push 0x10001`
at ovl61:002e, `push dword 1` at ovl61:183c, `push dword 0` at ovl68:0168 / 036f, ovl25:0061):
* n = live sides (2c04:0137[p], 095a..0976); n == 0 -> return at once (097c).
* Slots (097f..0a39): for i in 0..7 the side S = turn order 2c04:0163[i] (SCN 0x163 + 2 i, written
  by ovl61:1732 = `rules.turn.turn_order`), when live, gets slot c = 0, 1, ...: S[c] = S,
  X[c] = 0x200 + 16 (8 - n + c); cp = the slot of SCN 0x110 (left uninitialised when the side on
  turn is not live).
* Marks (0a3e..0ab0): cp == 0 or n == 1 -> A[0] = (n != 1), B[n - 1] = 1; else A[cp] = 1,
  B[cp - 1] = 1 (A = the side on turn, B = the slot before it, cyclic).
* full != 0 (0aba..0b9d): colour 15, fill DS:3256 = (437, 0, 202, 17); SetFont(2, 0, 15, 3)
  (ovl50:06ae: CHANCE17, ink 0, shadow 15); sprintf DS:326b with ovl61:225b (max(SCN 0x135, 1));
  right-aligned (ovl59:0103) at (0x1fc + 16 (8 - n), 0); per slot picture 9 source
  ((S / 4) 16 + 0x70, (S % 4) 14 + 0x5e, 16, 14) masked (0997:027e) at (X, 2).  No boxes.
* full == 0 and quiet == 0 (0ba2..0d80): the last B slot: colour 15, fill (X - 3, 1, 17, 15), the
  shield again; then the last A slot: colour 0, the same box, the shield again.
The callers' (full, quiet) are `CALLS`.  Nothing else erases a box, so the picture is kept here
(`ShieldStrip.layer`) and put over the menu bar after every bar draw (the bar here fills its row
each frame; the EXE's title repaint 1372:132f fills nothing).  [unverified] a step draw with the
side on turn not live (cp uninitialised): taken as cp = 0 here; the callers never do it (the
round-end call 183f, where SCN 0x110 may be dead, is a full draw, which draws no box).
"""
from __future__ import annotations

import pygame

from ..assets.exe import ds_str, ds_words
from ..assets.fonts import CHANCE17
from .screen import IDENTITY

SIDES = 8
TURN_FMT, RECT = 0x326B, 0x3256                  # DS strings / rect of ovl68:0aef / 0acc
SLOT_X0, SLOT_W, SHIELD_Y = 0x200, 16, 2          # ovl68:0a0a..0a14, 0b1e
TEXT_RIGHT, TEXT_Y = 0x1FC, 0                     # ovl68:0b06..0b0e
SHIELDS = 9                                       # ATRANS2 (0997:027e picture 9)
CELL_X0, CELL_Y0, CELL_W, CELL_H = 0x70, 0x5E, 16, 14
BOX_DX, BOX_Y, BOX_W, BOX_H = -3, 1, 17, 15       # ovl68:0c02..0c16
WHITE, BLACK = 15, 0
INK, SHADOW = 0, 15
LAYER_H = 17
CLEAR = 255                                       # never drawn by the strip (colours 0..15)
SCN_TURN_ORDER = 0x163

# caller -> (full, quiet)
CALLS = {"ovl61:0034": (1, 1),                   # Begin (ovl61:0000(0, 1))
         "ovl61:183f": (1, 0),                   # round end (ovl61:17f6)
         "ovl68:0374": (0, 0),                   # human turn start (ovl68:0259)
         "ovl25:0064": (0, 0),                   # computer turn (ovl25:0000)
         "ovl68:016d": (0, 0),                   # computer side without a city (ovl68:0000)
         "ovl49:03b0": (1, 0), "ovl49:03bb": (0, 0)}   # load (M10b)


def slots(state) -> tuple[list[int], list[int], int | None]:
    """(sides, x positions, slot of the side on turn or None) in turn order (ovl68:097f..0a39)."""
    n = sum(1 for p in state.players if p.alive)
    sides, xs, cp = [], [], None
    for i in range(SIDES):
        s = state.flags.get(SCN_TURN_ORDER + 2 * i, i)
        if not (0 <= s < len(state.players)) or not state.players[s].alive:
            continue
        c = len(sides)
        sides.append(s)
        xs.append(SLOT_X0 + SLOT_W * (SIDES - n + c))
        if s == state.current:
            cp = c
    return sides, xs, cp


def marks(n: int, cp: int | None) -> tuple[int | None, int | None]:
    """(A slot = black box, B slot = white box) of ovl68:0a3e..0ab0 (None = no box)."""
    if n == 0:
        return None, None
    if not cp or n == 1:                          # [unverified] cp None (side not live) as 0
        return (0 if n != 1 else None), n - 1
    return cp, cp - 1


class ShieldStrip:
    """The strip as the EXE left it on the screen (drawn only at the call points)."""

    def __init__(self, k):
        self.k = k
        self.rect = tuple(ds_words(k.exe, RECT, 4))
        self.fmt = ds_str(k.exe, TURN_FMT)
        self.layer = pygame.Surface((640, LAYER_H), depth=8)
        self.layer.set_palette(IDENTITY)
        self.clear()

    def clear(self) -> None:
        self.layer.fill(CLEAR)
        self.layer.set_colorkey(CLEAR)
        self.drawn = False

    def copy(self) -> pygame.Surface:
        return self.layer.copy()

    def restore(self, layer: pygame.Surface, drawn: bool) -> None:
        self.layer.blit(layer, (0, 0))
        self.drawn = drawn

    def call(self, state, at: str) -> None:
        """The draw of the caller at `at` (`CALLS`)."""
        self.draw(state, *CALLS[at])

    def draw(self, state, full: int, quiet: int) -> None:
        """ovl68:0952(full, quiet)."""
        sides, xs, cp = slots(state)
        n = len(sides)
        if n == 0:
            return
        a, b = marks(n, cp)
        fb = self.layer
        if full:
            fb.fill(WHITE, self.rect)
            s = self.fmt % max(state.turn, 1)
            f = self.k.fonts[CHANCE17]
            f.draw(fb, TEXT_RIGHT + SLOT_W * (SIDES - n) - f.width(s), TEXT_Y, s, INK, SHADOW)
            for side, x in zip(sides, xs):
                self.shield(side, x)
        elif not quiet:
            for slot, colour in ((b, WHITE), (a, BLACK)):
                if slot is None:
                    continue
                fb.fill(colour, (xs[slot] + BOX_DX, BOX_Y, BOX_W, BOX_H))
                self.shield(sides[slot], xs[slot])
        self.drawn = True

    def shield(self, side: int, x: int) -> None:
        src = (side // 4 * CELL_W + CELL_X0, side % 4 * CELL_H + CELL_Y0, CELL_W, CELL_H)
        self.layer.blit(self.k.picture(SHIELDS), (x, SHIELD_Y), src)

    def paint(self, fb) -> None:
        if self.drawn:
            fb.blit(self.layer, (0, 0))
