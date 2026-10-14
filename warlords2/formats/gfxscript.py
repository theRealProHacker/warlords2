"""`.GFX` text page scripts (help, credits, tutorial pages).

Format: docs/formats/graphics.md section 5.
"""
from __future__ import annotations

import re

GfxCmd = tuple    # (letter, *arguments), see parse_gfx


def parse_gfx(data: bytes) -> list[GfxCmd]:
    """GFX = text page script.  Returns a list of commands:
        ('H',)                       select heading font (font 1), colour 15
        ('T',)                       select text font (font 2), colour 15
        ('F', colour)                select text font (font 2) in colour 0..15
        ('C'|'L'|'R', x, y, text)    draw text centred on / left at / right-aligned to x
        ('G', sx, sy, w, h, pic, dx, dy)  blit rect of picture `pic` (FILE.DAT group 3 index)
        ('D', n)                     ignored by both executables
        ('E',)                       end of script
    Coordinates are relative to the origin the caller passes to the interpreter."""
    text = data.decode("latin-1")
    cmds = []
    i = 0
    num = r"(\d{3})"
    while True:
        i = text.find("#", i)
        if i < 0:
            raise ValueError("GFX script has no #E")
        c = text[i + 1]
        rest = text[i + 2:]
        if c == "E":
            cmds.append(("E",))
            return cmds
        if c in "HT":
            cmds.append((c,))
        elif c in "FD":
            m = re.match(num, rest)
            if not m:
                raise ValueError(f"bad #{c} at {i}")
            cmds.append((c, int(m.group(1))))
        elif c in "CLR":
            m = re.match(rf"\({num},{num}\)\|([^|]*)\|", rest)
            if not m:
                raise ValueError(f"bad #{c} at {i}")
            cmds.append((c, int(m.group(1)), int(m.group(2)), m.group(3)))
        elif c == "G":
            m = re.match(rf"\({num},{num},{num},{num}\){num}\({num},{num}\)", rest)
            if not m:
                raise ValueError(f"bad #G at {i}")
            cmds.append(("G", *map(int, m.groups())))
        else:
            raise ValueError(f"unknown GFX command #{c} at {i}")
        i += 2
