"""Numbers of the music call ovl58:0000 (rules/music.py).

Read from a raw-byte disassembly of WARLORD2.EXE at file offset 0x73b40 (the out/asm listing
of ovl58:0000 is broken by case labels), DATA/FILE.DAT (group sizes, `formats.tables.StringTable`)
and res_155e (playback).  EL = docs/research/exe_logic.md §9.8 addition "Music".
"""
from __future__ import annotations

from . import Const

# mode -> FILE.DAT (group, index); index -1 = a random entry (ovl59:052f rolls rnd(1, n, -1)).
# Mode 2 has no entry: its group is chosen at 0096..00f6 (MODE2_*).
TRACKS = Const({0: (8, 0), 1: (10, -1), 3: (9, -1), 4: (12, 0), 5: (13, -1), 6: (14, -1),
                7: (15, 0), 8: (16, 0), 9: (17, 0), 10: (18, 0), 11: (19, 0)},
               "raw ovl58:0043 push 8 (dword: group 8, index 0) for mode 0; 0079 push 0xffff0009 "
               "(3); 0086 0xffff000a (1); 0125 0xc (4); 0130 0xffff000d (5); 013e 0xffff000e (6); "
               "014c 0xf (7); 0157 0x10 (8); 0162 0x11 (9); 016d 0x12 (10); 0178 0x13 (11); all "
               "reach 0046 ovl59:0505(group, index)")
MODES = Const(12, "raw ovl58:0173..017e: modes 0..11 have a table entry; any other mode falls "
                  "through to 017e after 0028..003a (DS:2632 written, the old sequence stopped); "
                  "no caller passes one (EL: the 18 callers)")
DIR_ENTRY = Const((7, 0), "raw ovl58:0050 / 0106 push 7 (dword: group 7, index 0) -> ovl59:0505: "
                          "the directory SOUND\\, a fixed entry (no die)")
# FILE.DAT group sizes of the music groups (the n of ovl59:052f's rnd(1, n, -1)).
GROUP_SIZES = Const({7: 1, 8: 1, 9: 3, 10: 8, 11: 5, 12: 1, 13: 2, 14: 1, 15: 1, 16: 1, 17: 1,
                     18: 1, 19: 1},
                    "DATA/FILE.DAT read with formats.tables.StringTable (tests/engine/test_music.py "
                    "checks the user's copy); ovl59:052f (058b..05aa): n = the group's entry count")
PICK_ADD = Const(-1, "ovl59:052f 058b..0595: index < 0 -> ovl59:02bf(1, n, -1), then index = "
                     "min(result, n - 1); a 1-entry group still draws one die (02bf skips only for "
                     "sides == 0, 02e4)")
# Mode 2 (the computer phase, ovl61:21d4): 0096..011d.
MODE2 = Const(2, "raw ovl58:008e cmp si, 2")
MODE2_HUMAN_GROUP = Const(11, "raw ovl58:00cb je 00f6: a live human side (SCN 0x137[p] != 0 and "
                              "0x0d0[p] == 0 for some p < 8, 009d..00c7) -> push 0xffff000b")
MODE2_ROLL = Const((1, 100, 0), "raw ovl58:00cd..00d2: push 0x64 (dword), push 1, ovl59:02bf -> "
                                "rnd(1, 100, 0), only without a live human")
MODE2_LOW = Const((6, 12), "raw ovl58:00dc cmp dx, 6; jge 00e9: r < 6 -> push 0xffff000c (12, -1)")
MODE2_HIGH = Const((53, 10), "raw ovl58:00e9 cmp dx, 0x35; jl 00f6: r >= 53 -> push 0xffff000a (10, -1)")
MODE2_MID_GROUP = Const(11, "raw ovl58:00f6: 6 <= r < 53 -> push 0xffff000b (11, -1)")
# 155e:0412(seq, flags): the second argument, stored in DS:37a9; bit 0 = repeat (155e:02ab).
LOOP_FLAG = Const(1, "raw ovl58:0065 push 1 before 0067 push 0 (seq), 0069 155e:0412; "
                     "res_155e:02bc test DS:37a9, 1 -> 0412(DS:379e, DS:37a9) again (restart)")
MODE2_LOOP_FLAG = Const(0, "raw ovl58:011b push 0, jmp 0067: mode 2 plays once (155e:02ab then "
                           "stops it, 02e7 155e:0466)")
# The callers' modes (each at its site, rules.music.play's `site`).
SETTINGS_MODE = Const(1, "asm ovl33:05a0 push 1 -> ovl58:0000, after DS:0bee toggled on")
TURN_START_MODE = Const(1, "asm ovl68:0546 push 1 (no hero offer, SCN 0x15b == 0)")
OFFER_MODE = Const(4, "asm ovl68:0529 push 4 (a hero offer, SCN 0x15b == 0), before ovl47:0d5c")
PROMOTION_MODE = Const(7, "asm ovl47:0726 push 7 (human: ovl25:09ab == 0 at 071a)")
MEDAL_MODE = Const(8, "asm ovl36:24c9 push 8 (DS:41fa human), before the text rolls 2524 / 2581")
MEDAL_AFTER_MODE = Const(1, "asm ovl36:2668 push 1, after ovl61:10fb and ovl17:069c")
TEMPLE_MODE = Const(5, "asm ovl01:0006 push 5, the first thing of the temple menu ovl01:0000")
SAGE_MODE = Const(6, "asm ovl34:0aad push 6, after 12bf:07a5 and the list ovl34:1610")
QUEST_MODE = Const(3, "asm ovl01:272c push 3 (human: ovl25:09ab == 0 at 2723), after the reward "
                      "ovl01:1909 / 1c02")
VICTORY_MODE = Const(3, "asm ovl61:1fc0 push 3, the first call of the victory screen ovl61:1fbd")
SURRENDER_MODE = Const(9, "asm ovl61:1f76 push 9, surrender offer ovl61:1f68 (after 12bf:07a5, "
                          "DS:166a = 1)")
DECLINED_MODE = Const(10, "asm ovl61:1edb push 0xa, button 0x1e6 ovl61:1ecd (after 12bf:07a5, "
                          "ovl17:069c), before the 0x10f3 loop 1f0a")
