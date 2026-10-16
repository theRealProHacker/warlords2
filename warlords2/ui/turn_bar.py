"""The info area during a computer side's turn: the announcement, the timed messages and the
progress bar (ovl61:11d1, 1291, 131b; ovl68:0000, ovl25:0000).

Evidence (asm ovl61; rectangles and points are DGROUP words read from the user's EXE or
immediates of the listing):

* ovl61:11d1(msg, t) (the info-area message): the marble (picture 25) source (0, 0x3c, w, h)
  with w = DS:2aa0 (360) and h = DS:2aa6 - DS:2a9e + 0x14 (32), opaque (0997:0129), at DS:2a9c
  = (16, 403); SetFont(2, SCN 0x0a0[0x110], SCN 0x0b0[0x110], 3) (ovl50:06ae: the colours of
  the side on turn); msg centred at DS:2aa4 = (196, 415) (ovl59:00d6); then, for t > 0, the wait
  ovl59:0000(t) (t BIOS ticks); the pointer is hidden around it (12bf:07a5 / 0757).
* ovl61:1291() (the bar's ground): the marble source (0x28 - DS:2a9c - 0x10, 0x1bc - DS:2a9e +
  0x33, 0x160, 0x1f) = (8, 92, 352, 31) opaque at (0x18, 0x1b3) = (24, 435); colour 0
  (14d0:0002(0)), the one-pixel outline (116d:01fd) of (0x24, 0x1ba, 0x140, 0x16) = (36, 442,
  320, 22).
* ovl61:131b(n) (the bar): MOVEBAR<p>.PCK, picture 0x47 + SCN 0x110 (TERRAIN0/MOVEBAR0..7),
  source (0, 0, (n / 5) * 16, 0x12) masked (0997:027e, the picture's colour key) at (0x20,
  0x1bc) = (32, 444).  No wait.  (The outline of 1291 is 4 px to the right of the bar's left
  edge as coded.)
* ovl61:0aeb (End Turn at ovl61:20cb, Begin at ovl61:0076): the plain marble cell (0, 0x3c, 360,
  66) at (16, 403) (`Painter.strip`).

Callers: ovl68:0000 (computer turn start) 11d1("%s" DS:3260 with the side's name, 0) at 013e,
1291 at 0146, 131b(5) at 014d; a side without cities 1291, 131b(25 / 50 / 75 / 100) at
0173..0192; ovl25:0000 131b(10, 15, 20, 25, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90,
95, 100) after its phases (00c7..034e).  The timed messages of a computer turn: ovl00:0f65
(diplomacy, t = 0x14), ovl36:2238 (treachery, 0x14), ovl36:14db / 16c3 (the AI's battle, 5),
ovl64:18d6 (Hidden Map lifted, 0x19), ovl61:1a41 (a computer side eliminated with no human
alive, 0x64).
"""
from __future__ import annotations

import pygame

from ..assets.exe import ds_str, ds_words
from ..assets.store import cache_load
from ..assets.fonts import CHANCE17
from .widgets import blit_opaque, kit, text_centred

MARBLE = 25
MOVEBAR0 = 0x47                                  # + SCN 0x110 (ovl61:1370)
INFO_RECT, TEXT_AT = 0x2A9C, 0x2AA4              # DS:2a9c (16, 403, 360, 66), DS:2aa4 (196, 415)
MSG_SRC_Y, MSG_EXTRA_H = 0x3C, 0x14              # ovl61:1208, 1214
GROUND_AT = (0x18, 0x1B3)                        # ovl61:1297
GROUND_SRC_X, GROUND_SRC_Y = 0x28 - 0x10, 0x1BC + 0x33   # minus DS:2a9c / DS:2a9e (ovl61:12aa..12c2)
GROUND_W, GROUND_H = 0x160, 0x1F                 # ovl61:12aa
OUTLINE = (0x24, 0x1BA, 0x140, 0x16)             # ovl61:12f6..12fc
OUTLINE_COLOUR = 0                               # 14d0:0002(0) at ovl61:12f0
BAR_AT, BAR_H, BAR_STEP, BAR_UNIT = (0x20, 0x1BC), 0x12, 5, 16   # ovl61:1321..1343
SCN_INK, SCN_SHADOW = 0xA0, 0xB0                 # SCN words [p] (ovl61:123c..125e)
NAME_FMT = 0x3260                                # "%s" (ovl68:0127)


def bar_width(n: int) -> int:
    """ovl61:1321..1332: (n / 5) * 16, C division."""
    return int(n / BAR_STEP) * BAR_UNIT


class TurnBar:
    """What the info area shows during computer turns; `draw` paints it every frame."""

    def __init__(self, host):
        k = self.k = kit(host.app)
        exe = k.exe
        self.marble = k.picture(MARBLE)
        x, y, w, h = ds_words(exe, INFO_RECT, 4)
        self.text_at = ds_words(exe, TEXT_AT, 2)
        self.msg_at = (x, y)
        self.msg_src = (0, MSG_SRC_Y, w, self.text_at[1] - y + MSG_EXTRA_H)
        self.ground_src = (GROUND_SRC_X - x, GROUND_SRC_Y - y, GROUND_W, GROUND_H)
        self.name_fmt = ds_str(exe, NAME_FMT)
        self.font = k.fonts[CHANCE17]
        self.text: tuple[str, int, int] | None = None      # (msg, ink, shadow) of the last 11d1
        self.ground = False                                 # 1291 drawn
        self.bar: tuple[int, int] | None = None             # (side, n) of the last 131b

    # ---------------------------------------------------------------- the routines

    def message(self, state, msg: str) -> None:
        """ovl61:11d1 (its wait is the caller's)."""
        p = state.current
        self.text = (msg, state.flags.get(SCN_INK + 2 * p, 0), state.flags.get(SCN_SHADOW + 2 * p, 0))

    def announce(self, state) -> None:
        """ovl68:0127..013e: sprintf("%s", side name), 11d1(.., 0)."""
        self.message(state, self.name_fmt % state.players[state.current].name)

    def ground_on(self) -> None:
        """ovl61:1291."""
        self.ground = True
        self.bar = None

    def progress(self, state, n: int) -> None:
        """ovl61:131b(n)."""
        self.bar = (state.current, n)
        cache_load(self.k, MOVEBAR0 + state.current)     # 027e at 1374 (X44)

    # ---------------------------------------------------------------- drawing

    def draw(self, fb: pygame.Surface) -> None:
        if self.text is not None:
            blit_opaque(fb, self.marble, self.msg_at, self.msg_src)
            msg, ink, shadow = self.text
            text_centred(fb, self.font, *self.text_at, msg, ink, shadow)
        if self.ground:
            blit_opaque(fb, self.marble, GROUND_AT, self.ground_src)
            pygame.draw.rect(fb, OUTLINE_COLOUR, OUTLINE, 1)
        if self.bar is not None:
            p, n = self.bar
            w = bar_width(n)
            if w > 0:
                fb.blit(self.k.picture(MOVEBAR0 + p), BAR_AT, (0, 0, w, BAR_H))
