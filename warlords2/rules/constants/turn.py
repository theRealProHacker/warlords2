"""Numbers of the turn loop (rules/turn.py): main-loop pass, side rotation, round end, the
turn starts of computer and human sides, the talking advisor's turn remark.

"asm" = the capstone listing out/asm/ovlNN.asm, "decomp" = out/rea/decomp/, re-read by the
M8a implementer at the addresses given.  SCN offsets are 2c04 offsets (the segment is the SCN
image, EL §7).  Dice are (dice, sides, add) for `Rng.rnd`; Borland pushes the last two as one
dword (EL §6 pitfalls), read that way here.
"""
from __future__ import annotations

from . import Const

# ---------------------------------------------------------------- SCN words written or read here
SCN_ACK_VICTORY = Const(0x157, "asm ovl61:1ff6 (victory screen sets it), ovl61:224c (main loop ends "
                               "when 0x15b and 0x157), ovl68:04db")
SCN_VIEWED = Const(0x159, "asm ovl68:0028 / 0080 / 00af (computer: 0x147[p], 1 without humans, 0 "
                          "with Hidden Map, > 1 human and p not shown), ovl68:02ed (human: 1)")
SCN_ACK_SURRENDER = Const(0x15F, "asm ovl61:1faf (surrender screen sets it), ovl68:04fa")
SCN_TUTORIAL_BYTE = Const(0x134, "asm ovl68:05c6 / 05d9: byte 0x134 bit 0x40 = turn-2 tutorial page shown")
SCN_FIRST_CAPITAL = Const(0x193, "decomp ovl36:10d7: player record +0x10 / +0x12 (0x193 / 0x195 + "
                                 "0x14 p), the capital written at new game (EL §9.4)")
SCN_VIEW = Const((0x175, 0x177, 0x179, 0x17B, 0x17D, 0x17F),
                 "decomp ovl64:0629: top, left, bottom, right, centre x, centre y of the map view")
PLAYER_REC_LEN = Const(0x14, "player record stride (EL §6.1)")

# ---------------------------------------------------------------- turn order (ovl61:1732 / 17f6)
SIDES = Const(8, "asm ovl61:1757 / 1778: order[0..7]; ovl61:1874: position >= 8 ends the round")
TURN_SWAPS = Const(20, "asm ovl61:17e1: cmp si, 0x14 (Random Turns, SCN 0x122)")
TURN_SWAP_ROLL = Const((1, 8, -1), "asm ovl61:177e / 1790: push 0xffff0008, push 1 -> rnd(1, 8, -1)")

# ---------------------------------------------------------------- view centre (ovl64:0629)
VIEW_X = Const((4, 107), "decomp ovl64:0629: x < 5 -> 4, x > 0x6a -> 0x6b")
VIEW_Y = Const((4, 151), "decomp ovl64:0629: y < 5 -> 4, y > 0x96 -> 0x97")
VIEW_MARGIN = Const(4, "decomp ovl64:0629: rectangle centre -4 .. +4")
VIEW_MAX = Const((0x6F, 0x9B), "decomp ovl64:0629: right edge <= 0x6f, bottom <= 0x9b")

# ---------------------------------------------------------------- Hidden Map lifted (ovl64:175c)
ALL_SEEN = Const(0xFF, "decomp ovl64:175c: the four explored bytes of every intact city OR the "
                       "dead-side mask == 0xff")
HIDDEN_LIFTED_MSG = Const((18, 0), "asm ovl64:18c7..18d6: ovl59:04f0(0x12, 0) shown by ovl61:11d1")

# ---------------------------------------------------------------- Active neutral cities (ovl39:025a)
ACTIVE_NEUTRALS = Const(2, "asm ovl39:0267: SCN 0x11a >= 2 (Active)")
ACTIVE_ARMY_CAP = Const(4, "asm ovl39:035c: 0b62:007d count >= 4 -> no new production")
ACTIVE_KIND = Const(2, "asm ovl39:0368: ovl29:103d(c, 2, -1, 0)")
PRODUCTION_RESERVE = Const(30, "decomp ovl29:0e5a: refused when gold[0x110] < slot cost + 0x1e ...")
PRODUCTION_FREE_TURNS = Const(5, "decomp ovl29:0e5a: ... and ovl61:225b() > 5")

# ---------------------------------------------------------------- human turn start (ovl68:04bd)
FIRST_TURN = Const(1, "asm ovl68:0553 / 0556: si <= 1 and turn == 1 -> ovl45:0000(2, capital), return")
TUTORIAL_TURN = Const(2, "asm ovl68:05bf: SCN 0x12e set and turn == 2")
TUTORIAL_BIT = Const(0x40, "asm ovl68:05ca..05d9: byte 0x134 >> 6 & 1, then |= 0x40")
TUTORIAL_FILE = Const((25, 7), "asm ovl68:05df: push 0x70019 -> FILE.DAT (25, 7) for ovl61:168d")

# ---------------------------------------------------------------- talking advisor (ovl58:026f(5))
ADVICE_CITY_MAX = Const(40, "asm ovl58:02b7: DS:5dea[p] >= 0x28 -> nothing")
ADVICE_MODE_BYTE = Const(0x100, "asm ovl58:049d / 04d9: SCN byte 0x100[p], 1 winning / 2 losing")
ADVICE_BUCKET_BYTE = Const(0x108, "asm ovl58:04b4 / 04ee: SCN byte 0x108[p], last bucket (cities / 5 * 5)")
ADVICE_BUCKET = Const(5, "asm ovl58:04ba / 04f4: bucket + 5 <= cities -> winning")
ADVICE_LOSE = Const({5: 40, 10: 41, 15: 42, 20: 43, 25: 44, 30: 45}, "jump table ovl58:0b3b (t + 5 -> group)")
ADVICE_LOSE_ELSE = Const(46, "ovl58:0b3b default")
ADVICE_WIN = Const({10: 48, 15: 49, 20: 50, 25: 51, 30: 52, 35: 53}, "jump table ovl58:0b23 (t -> group)")
ADVICE_WIN_ELSE = Const(47, "ovl58:0b23 default")
ADVICE_EVERY = Const(7, "asm ovl58: remarks only when ovl61:225b() % 7 == 0")
ADVICE_GOLD = Const(((100, 54), (2800, 55)), "asm ovl58:063d / 0670: gold < 100 -> 54, gold > 2800 -> 55")
ADVICE_HEROES = Const(((0, 56), (5, 57)), "asm ovl58:0692 / 06af: heroes <= 0 -> 56, >= 5 -> 57")
ADVICE_REMARK = Const(58, "asm ovl58:06e9 / 06f1: group 0x3a (0x58 = caption)")
ADVICE_REMARK_ROLL = Const((1, 5, 0), "asm ovl58:06cd: push 5 (dword), push 1 -> rnd(1, 5, 0) == 1")
ADVICE_CAPTION = Const(30, "asm ovl58:0405..048a: without DS:37a4 the caption group = sample group + 0x1e")
ADVICE_PICK_ADD = Const(-1, "ovl59:0505 with index -1 -> ovl59:052f rnd(1, members, -1)")
ADVICE_BLINK_ROLL = Const((1, 30, 10), "asm ovl58:094c: the face's blink counter, once per face")
