"""The progress scroll of loading and map building (STRING.DAT groups 133-138).

Evidence:
* popup type 0x17 = BSCROLL.PCK keyed at (160, 55) (ovl17:0000; [shot] SHOT 03 at
  (160, 55), mean error 3.4 on the unkeyed pixels);
* text ovl61:1471: SetFont(2, 0, 7, 1), transparent; with the scroll open, string 0 of
  the 7-string group is not drawn and strings 1..6 are centred at x = 328,
  y = 161, 181, 201, 221, 241, 261;
* bar ovl02:01b5: colour-0 outline on (232, 255, 192, 25); ovl02:01ff(pct) with
  si = pct + 10: RMAPBAR.PCK (picture 54, keyed) source (0, 0, w, 21) at (232, 257),
  w = (si / 10) * 16 + 16 (integer division), drawn before the text; then ovl17:070b
  restores the text background from BSCROLL and the percentage is drawn with the EXE
  format DS:028a centred at (328, 237), SetFont(2, 0, 7, 1);
* the strategic-map builder ovl63:232b shows 0 and then each new tenth up to 90; the
  last 11 columns are built under "90 %" before the scroll closes (ovl63:277c);
* the scenario load ovl57:0194 shows 100 (ovl57:02c6) and then waits ovl59:0000(10)
  (ovl57:02ce) before the map builder starts; the work yields None for the frames of
  that wait (`widgets.tick_frames`, register X05).

Transient (SHOT 04-07): RMAPBAR, SCROLL2 and BSCROLL (picture-table entries 54, 69, 70
at DS:1f56) share cache slot byte +5 = 08 and the buffer 3125:51e4.  Each ovl02:01ff
call therefore evicts BSCROLL, draws the new bar, and loads BSCROLL from disk again
before the text background and the text are redrawn.  The captures at 10/30/50/70 %
were taken during that load: they show the bar of the next call (`bar_width(pct + 10)`)
under the previous percentage; the 0 % capture shows the settled frame.  Here a new
percentage shows its bar at once and its text one frame later (the frame of the disk
load), so both frames exist.

The work runs as a generator on the main thread (docs/plan.md 2.2): each frame advances
it once; a yielded int is the new percentage, None a frame without news.  When it ends the
dialog closes with the generator's return value, but only once the last percentage's text
has been drawn: in the next frame when that text was still pending.
"""
from __future__ import annotations

from typing import Generator

import pygame

from ...assets.exe import ds_str
from ...assets.fonts import CHANCE17
from ...assets.text import printf
from .. import registry
from ..dialog import Dialog
from ..widgets import kit, text_centred

POPUP = 0x17
RMAPBAR = 54
LINE_X, LINE_Y0, LINE_DY = 328, 161, 20
BAR_FRAME = (232, 255, 192, 25)
BAR_AT, BAR_H = (232, 257), 21
PCT_POS = (328, 237)
PCT_FORMAT = 0x028A
INK, SHADOW = 0, 7


def bar_width(pct: int) -> int:
    """ovl02:01ff: w = ((pct + 10) / 10) * 16 + 16."""
    return (pct + 10) // 10 * 16 + 16


class Progress(Dialog):
    def __init__(self, k, lines: list[str], work: Generator, on_close=None):
        super().__init__(on_close)
        self.kit, self.lines, self.work = k, list(lines), work
        self.fmt = ds_str(k.exe, PCT_FORMAT)
        self.pct: int | None = None              # its bar is drawn
        self.shown: int | None = None            # its text is drawn
        self.result: tuple | None = None         # (return value,) once the work has ended

    def update(self, events, dt) -> None:
        drawn = self.shown == self.pct           # the last frame drew the text of pct
        self.shown = self.pct                    # the BSCROLL reload of the last frame is over
        if self.result is not None:
            return self.close(self.result[0])
        try:
            v = next(self.work)
        except StopIteration as stop:
            if drawn:
                return self.close(stop.value)
            self.result = (stop.value,)          # this frame draws the last text, the next closes
            return
        if v is not None:
            self.pct = v

    def draw(self, fb: pygame.Surface) -> None:
        k, f = self.kit, self.kit.fonts[CHANCE17]
        k.draw_popup(fb, POPUP)
        for i, s in enumerate(self.lines[1:7]):
            if s:
                text_centred(fb, f, LINE_X, LINE_Y0 + LINE_DY * i, s, INK, SHADOW)
        pygame.draw.rect(fb, 0, BAR_FRAME, 1)
        if self.pct is not None:
            fb.blit(k.picture(RMAPBAR), BAR_AT, (0, 0, bar_width(self.pct), BAR_H))
        if self.shown is not None:
            text_centred(fb, f, *PCT_POS, printf(self.fmt, self.shown), INK, SHADOW)


@registry.dialog("progress")
def progress(host, group: int, work: Generator, on_close=None):
    """`group` = the STRING.DAT group of the seven lines (133-138)."""
    k = kit(host.app)
    return Progress(k, k.text.group(group), work, on_close)
