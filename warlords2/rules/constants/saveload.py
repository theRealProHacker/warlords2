"""Numbers of Save / Load / New Game (rules/saveload.py, ovl49).

EL = docs/research/exe_logic.md ("Save / Load / Quit (ovl49)").
"""
from __future__ import annotations

from . import Const

# ---------------------------------------------------------------- the load ovl49:0414
WIPED_RECORDS = Const(10, "asm ovl49:0458..04a5: army records 0..9 (cmp dword [bp-4], 0xa)")
WIPED_OWNER = Const(0x0F, "asm ovl49:046d: byte es:[0x8885 + 0x16 i] (record +5, owner) = 0x0f")
WIPED_XY = Const((-1, -1), "asm ovl49:048b..0499: words +0 (x) and +2 (y) = 0xffff")
SCN_LOADED = Const((0x130, 1), "asm ovl49:0891..0896: SCN 0x130 = 1 after the file blocks "
                               "(the Save Map gate of ovl49:1214), not reached on a failed open")
SCN_RANDOM_MAP = Const(0x120, "asm ovl49:0723 / 07a4 / 090d: SCN 0x120 != 0 -> RANDOM.SPC / "
                              ".CTY blocks, ovl45:1de4")
LOAD_MESSAGE = Const((47, 1), "asm ovl49:03d6: STRING (47, 1) sprintf with the side name "
                              "2c04:0000 + 0x14 SCN 0x110, ovl61:10fb")
LOAD_MUSIC_MODE = Const(1, "asm ovl49:040a..040c: ovl58:0000(1)")
LOAD_STRIP = Const(((1, 0), (0, 0)), "asm ovl49:03ad..03bb: ovl68:0952(1, 0) then (0, 0)")
