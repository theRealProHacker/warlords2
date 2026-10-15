"""Numbers of cities, production, vectoring and the economy (rules/city.py, rules/vectoring.py,
rules/economy.py).

EL = docs/research/exe_logic.md §6.3-6.5.  "asm" = the capstone listing out/asm/ovlNN.asm,
"decomp" = the Ghidra decompilation in out/rea/decomp/; both re-read by the M6a implementer
at the addresses given.  DS:xxxx tables were read from WARLORD2.EXE at file 0x33250 + xxxx.
Dice are (dice, sides, add) for `Rng.rnd`; Borland pushes the last two as one dword
(EL §6 pitfalls), read that way here.
"""
from __future__ import annotations

from . import Const

# ---------------------------------------------------------------- records and owners
OWNER_LIMIT = Const(8, "asm ovl62:0398, 02ee, 041e: a city / army counts for its owner when the "
                       "signed owner byte is < 8 (0x0f = none)")
NO_PRODUCTION = Const(0xFF, "asm ovl44:0185 / ovl36:10ab / ovl32:016b: city +0x2c = 0xff")
GOLD_BITS = Const(16, "player record +0 is a signed word (asm ovl68:0863..087a add / cmp 0 / jge)")

# ---------------------------------------------------------------- slots, defence, buying (ovl44)
SLOTS = Const(4, "decomp ovl44:094f / ovl44:0000: four slot bytes at city +0x16")
DEFENCE_FEW = Const(1, "decomp ovl44:0930: 1 with < 3 filled slots")
DEFENCE_MANY = Const(2, "decomp ovl44:0930: else 2")
DEFENCE_MANY_FROM = Const(3, "decomp ovl44:0930: ovl44:094f(c) < 3 -> 1")
BUY_RECORDS = Const(28, "decomp ovl44:0dae / 0ee3: buy list = ARMYTYPE records 0..0x1b with w4 >= 0")
BUY_PRICE_MIN = Const(0, "decomp ovl44:0dae: record +0x1e (w4) tested > -1")

# ---------------------------------------------------------------- delivery (ovl43)
ROOM_DX = Const((0, 1, 0, 1), "DS:0e54 (read from the EXE), ovl43:0bff city squares in search order")
ROOM_DY = Const((0, 0, 1, 1), "DS:0e5c (read from the EXE)")
SQUARE_FULL = Const(8, "asm ovl43:0c60 (room: count < 8) and ovl43:032c (standard square: count >= 8 "
                       "refused); 0b62:007d counts at most 8")
ENHANCED = Const((2, 9), "asm ovl43:0e83..0ecd: Enhanced[SCN 0x110] -> min(slot strength + 2, 9)")
UPKEEP_DIVISOR = Const(2, "asm ovl43:0f08..0f16: upkeep = signed slot cost / 2 (cwd; sub; sar)")
TRANSIT_NEW = Const(0x65, "asm ovl43:0f63 (created in transit), ovl43:01e5 / 03a1 (rerouted)")
TRANSIT_ON_WAY = Const(0x66, "asm ovl43:0088 / 00d1: 0x65 -> 0x66 at the owner's turn start")
TRANSIT_NONE = Const(0xFF, "asm ovl43:04a2 / 0f7c: placed or produced in the city")
TRANSIT_X_CITY = Const(-1, "asm ovl43:0f42: vectored to a city: x = -1")
TRANSIT_X_STANDARD = Const(-2, "asm ovl43:0f30..0f38: destination >= 100: x = -2")
TRANSIT_Y = Const(-1, "asm ovl43:0f4a: y = -1")
DIRECT = Const(-1, "asm ovl43:0e16 / 0f2b: destination -1 = placed at the given square")

# ---------------------------------------------------------------- vectoring (ovl44, ovl47, ovl62)
STANDARD_DEST = Const(100, "decomp ovl62:0651 / asm ovl43:05ec: destination p + 100 = side p's "
                           "standard (ovl47:0b47); ovl44:028b: index >= 100 -> target (-2, -2)")
STANDARD_TARGET = Const((-2, -2), "decomp ovl44:028b: target x/y = 0xfffe for a destination >= 100")
VECTOR_OFF_TARGET = Const((-1, -1), "decomp ovl44:028b / ovl44:0185: target x/y = 0xffff")
VECTOR_MAX_OTHERS = Const(3, "decomp ovl44:028b: refused when ovl44:0410 counts more than 3 "
                             "(so at most 4 sources per destination)")
STANDARD_ITEM_STATE = Const(1, "decomp ovl47:0b47: item p state (+0x16) == 1 (on the map)")
CANCELLED_TARGET = Const((0, 0), "asm ovl36:1068..109c, decomp ovl32:016b: target words = 0 when the "
                                 "destination is taken or razed")

# ---------------------------------------------------------------- economy (ovl62, ovl68, ovl35)
ABOARD_UPKEEP_MIN = Const(4, "asm ovl62:0336..034b: aboard (0x1000) -> upkeep 4 if <= 4")
GOLD_ITEM = Const(7, "asm ovl35:083d: item +0x14 == 7, value = signed byte +0x15")

# ---------------------------------------------------------------- capture (ovl36:0a6b tail)
LOOT_SINGLE_CITY = Const(1, "asm ovl36:0da0: cities[d] <= 1 -> loot = gold[d], else gold[d] / cities[d]")
LOOT_DIVISOR = Const(2, "asm ovl36:0de0..0df6: loot = max(trunc(loot / 2), 0)")
LOOT_LOSS = Const(2, "asm ovl36:0e5b..0e62: gold[d] -= 2 * loot")
LOOT_OWNER_LIMIT = Const(8, "asm ovl36:0e3a: gold moves only when the owner nibble < 8")
LOOT_MSG = Const((0x93, 0), "asm ovl36:0e11..0e32: human attacker and loot > 0: STRING (0x93, 0) % loot")

# ---------------------------------------------------------------- capture choices (ovl31, ovl19, ovl32)
SLOT_VALUE_DIVISOR = Const(2, "asm ovl31:0870..087e: |w4| / 2 (cwd; xor; sub; then cwd; sub; sar)")
SACK_FIRST_SLOT = Const(1, "decomp ovl31:07d0 / 0941: slots 1 .. filled-1 (not the first)")
PILLAGE_INFAMY = Const((1, 5, 0), "asm ovl31:04d3..04f1 push 5 (dword), push 1")
SACK_INFAMY = Const(((1, 10, 0), 5), "asm ovl31:03c6..03e7: rnd(1,10,0) + 5")
RAZE_INFAMY = Const(((1, 15, 0), 10), "asm ovl31:0326..0347: rnd(1,15,0) + 10; ovl19:1864 the same")
RAZE_OWN_INFAMY = Const(((1, 25, 0), 25), "decomp ovl32:0061: rnd(1,0x19) + 0x19")
RUIN_TILES = Const((0xA0, 0xA1, 0xB0, 0xB1), "decomp ovl32:016b: tiles (x,y), (x+1,y), (x,y+1), "
                                             "(x+1,y+1) = base + 2 * old owner (byte arithmetic)")
QUEST_PILLAGE_SACK = Const(1, "asm ovl31:03ec..03f3 / 04f6..04fd: ovl01:1ded(1, 0, value, 0, 0)")
QUEST_RAZE = Const(2, "asm ovl31:034c..0354: ovl01:1ded(2, 0, 0, 0, 0)")
QUEST_OCCUPY = Const((4, 0, 0, 0x4D, 0x3005), "asm ovl31:041c..0427: ovl01:1ded words as pushed")

# ---------------------------------------------------------------- rename (ovl45:2013)
NAME_MAX = Const(15, "decomp ovl45:2013: the text editor 7b13:0000 gets 15 (low word of 0x80000f) "
                     "for the name at city +0x04; the field ends at +0x13 (+0x14 is the defence)")
NAME_ENCODING = Const("cp437", "city names are DOS bytes (scenario.md city record)")
CHOOSE_NONE = Const(-1, "asm ovl45:01f2 / ovl44:01d3: DS:0e9e = -1 (no production remembered); "
                       "ovl44:00ff with it picks the first slot of type byte 0xff (ovl44:0000)")
REDIRECT_MAX = Const(4, "asm ovl44:07aa..07b3: sources n + cities at the new destination m > 4 -> nothing")
