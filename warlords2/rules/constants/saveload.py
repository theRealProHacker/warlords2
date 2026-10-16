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
SCN_RANDOM_MAP = Const(0x120, "asm ovl49:0728 / 07a9 / 090d (load), 0bbe / 0c46 (save): SCN "
                              "0x120 != 0 -> RANDOM.SPC / .CTY blocks, ovl45:1de4; ovl57:007f "
                              "writes it = DS:28c8")
RANDOM_TEXTS = Const((("SPC", (34, 0)), ("CTY", (35, 0))),
                     "asm ovl49:0bbe..0c41 / 0c46..0cc9 (save: FILE.DAT (0x22, 0) RANDOM\\RANDOM.SPC "
                     "then (0x23, 0) RANDOM\\RANDOM.CTY, open mode 2, lseek length, 4-byte length + "
                     "bytes, between CURRENT.SGN (0x1d) and CURRENT.HST (6)); load 0728..079c / "
                     "07a9..081d (read, each written back to the same file, open mode 9); "
                     "FILE.DAT groups 34 / 35 [D]")
MAP_FILE = Const(26, "asm ovl49:135c..135e: FILE.DAT (0x1a, e) SAVE\\RMAP<e>.DAT (Load Map 0414 "
                     "and the copy back 0d61; Save Map 1491..1493 the copy target) [D]")
MAP_TEMP_FILE = Const((27, 0), "asm ovl49:11f6 / 134e / 14aa: FILE.DAT (0x1b, 0) "
                               "SAVE\\RMAPTEMP.DAT [D]")
MAP_LOAD_ARGS = Const((0, 1), "asm ovl49:1340..1348: 0414(e, game 0, rebuild 1) (push 0x10000)")
SAVE_MAP_GATE = Const((0x130, 0x120), "asm ovl49:121d..1234: Save Map lists only when SCN 0x130 "
                                      "== 0, SCN 0x120 != 0 and DS:28c6 == 0")
MAP_MUSIC_MODE = Const(0, "asm ovl49:13b7..13b9: ovl58:0000(0) after ovl57:0000(0, 1, 0, 1)")
LOAD_MESSAGE = Const((47, 1), "asm ovl49:03d6: STRING (47, 1) sprintf with the side name "
                              "2c04:0000 + 0x14 SCN 0x110, ovl61:10fb")
LOAD_MUSIC_MODE = Const(1, "asm ovl49:040a..040c: ovl58:0000(1)")
LOAD_STRIP = Const(((1, 0), (0, 0)), "asm ovl49:03ad..03bb: ovl68:0952(1, 0) then (0, 0)")
