"""`.GFX` text pages (help, tutorial) drawn as WARLORD2.EXE draws them.

Script format: docs/formats/graphics.md section 5, parsed by `formats.gfxscript`.
Interpreter (Evidence: EXE ovl59:06de, jump table ovl59:08c5):
* `#H` SetFont(1, 15, 0, 3) (CHANCE36); `#T` SetFont(2, 15, 0, 3); `#Fnnn`
  SetFont(2, nnn, 0, 3).  The font is not reset at the start of a page.
* `#C` draws at x - width/2 (ovl59:00d6), `#L` at x (ovl59:00bf), `#R` at x - width
  (ovl59:0103); transparent (11e2:04aa); y is the top of the text; the origin is added
  to the text point.
* `#G` blits the source rectangle of picture ppp (FILE.DAT group 3) to origin + (dx, dy),
  masked when the picture table builds a mask, else opaque (0997:027e).
* `#E` ends; `#D` and other letters are ignored by the interpreter.  The pre-scan
  ovl59:062a returns the number after the first `#D` (0 when `#E` comes first); the
  tutorial caller ovl61:168d opens popup type 0x0e + that number.
The interpreter draws no background: the caller opens a popup first (ovl61:16f5 type 4
at (120, 50) for HMOUSE / HKEYS; ovl61:168d type 0x0e + #D for TUTORIA pages and HITEM),
then waits for a key or a mouse release (ovl61:10fb) and closes the popup.
"""
from __future__ import annotations

import pygame

from ..assets.fonts import CHANCE17, CHANCE36
from ..formats.gfxscript import parse_gfx
from .dialog import Dialog
from .widgets import is_dismiss

INK, SHADOW = 15, 0
TUTORIAL_POPUP, HELP_POPUP = 0x0E, 4


def prescan(script: bytes) -> int:
    """ovl59:062a: the number after the first #D, or 0 when #E comes first."""
    for cmd in parse_gfx(script):
        if cmd[0] == "D":
            return cmd[1]
        if cmd[0] == "E":
            return 0
    return 0


def render(fb: pygame.Surface, script: bytes, origin: tuple[int, int], fonts, picture) -> list[tuple]:
    """Draw a GFX script at `origin`; `picture(index)` returns the FILE.DAT group-3
    picture.  Every shipped page selects a font (#H) before its first text, so the font
    left by an earlier page never shows; pages start in font 2, ink 15.  Returns the
    `#G` blits as (picture, source rect, destination)."""
    ox, oy = origin
    slot, ink = CHANCE17, INK
    blits = []
    for cmd in parse_gfx(script):
        c = cmd[0]
        if c == "E":
            break
        if c == "H":
            slot, ink = CHANCE36, INK
        elif c == "T":
            slot, ink = CHANCE17, INK
        elif c == "F":
            slot, ink = CHANCE17, cmd[1]
        elif c in "CLR":
            _, x, y, text = cmd
            font = fonts[slot]
            w = font.width(text)
            x = {"C": x - int(w / 2), "L": x, "R": x - w}[c]
            font.draw(fb, ox + x, oy + y, text, ink, SHADOW)
        elif c == "G":
            _, sx, sy, w, h, pic, dx, dy = cmd
            fb.blit(picture(pic), (ox + dx, oy + dy), (sx, sy, w, h))
            blits.append((pic, (sx, sy, w, h), (dx, dy)))
    return blits


class GfxPages(Dialog):
    """One or more GFX pages shown one after the other in a popup, each dismissed by a
    key or a mouse release (ovl61:16f5 / 168d + ovl61:10fb)."""

    def __init__(self, kit, scripts: list[bytes], popup: int | None = None, on_close=None):
        super().__init__(on_close)
        self.kit, self.scripts, self.popup = kit, list(scripts), popup
        self.page = 0

    def popup_type(self, script: bytes) -> int:
        return self.popup if self.popup is not None else TUTORIAL_POPUP + prescan(script)

    def update(self, events, dt) -> None:
        for e in events:
            if is_dismiss(e):
                self.page += 1
                if self.page == len(self.scripts):
                    return self.close(None)

    def draw(self, fb: pygame.Surface) -> None:
        s = self.scripts[self.page]
        origin = self.kit.draw_popup(fb, self.popup_type(s))
        render(fb, s, origin, self.kit.fonts, self.kit.picture)
