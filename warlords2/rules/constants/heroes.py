"""Numbers of heroes, items, sites and quests (rules/heroes.py, rules/ruins.py, rules/quests.py).

EL = docs/research/exe_logic.md §5.  "asm" = the capstone listing out/asm/ovlNN.asm, "decomp" =
the Ghidra decompilation in out/rea/decomp/; both re-read by the M7a implementer at the
addresses given.  DS:xxxx tables were read from WARLORD2.EXE at file offset 0x33250 + xxxx.
Dice are (dice, sides, add) as pushed to ovl59:02bf (a `push dword` carries sides and add).
"""
from __future__ import annotations

from . import Const

# ---------------------------------------------------------------- hero offer (ovl47:0000)
OFFER_CAP = Const(5, "asm ovl47:0076: [bp-4] = 5 heroes per side")
OFFER_CAP_BIG = Const(6, "asm ovl47:008c..0093: 6 when the side owns >= 0x28 cities (DS:5dea)")
OFFER_BIG_CITIES = Const(40, "asm ovl47:008c: cmp cities, 0x28; jl")
OFFER_TOTAL_MAX = Const(40, "asm ovl47:00e6: cmp si (heroes on the map), 0x28; jl -> no offer at 40")
OFFER_PRICE_FIRST = Const((1, 400, 300), "asm ovl47:010f: push 0x12c0190, push 1 -> rnd(1,400,300)")
OFFER_PRICE_MORE = Const((1, 600, 1000), "asm ovl47:00fd: push 0x3e80258, push 1 -> rnd(1,600,1000)")
OFFER_ROLL = Const((1, 30, 0), "asm ovl47:0142: push dword 0x1e, push 1")
OFFER_ROLL_MAX = Const(6, "asm ovl47:014f: cmp ax, 6; jle offer -> 1..6 of 30")
OFFER_CITY_ROLL_ADD = Const(0, "asm ovl47:015a: push 0, push cities, push 1 -> rnd(1, cities, 0)")

# ---------------------------------------------------------------- new hero (ovl47:031b)
HERO_STRENGTH = Const(5, "asm ovl47:03ec: +8 = 5")
HERO_MOVES = Const(14, "asm ovl47:03e2..03e8: +6 = +7 = 0x0e")
HERO_PLACE_TRIES = Const(20, "decomp ovl43:0bff with the flag set: 20 tries (local_c < 0x14)")
HERO_PLACE_STEP = Const((1, 3, -2), "decomp ovl43:0bff: rnd(1, 0xfffe0003) -> rnd(1,3,-2) = -1..1")
NAME_ROLL = Const((1, 100, 0), "asm ovl47:0cd3: push dword 0x64, push 1")
NAME_MARK = Const(0x23, "asm ovl47:0cec: '#' starts an entry")
NAME_MALE = Const(0x30, "asm ovl47:0d05: the byte after '#' == '0' -> male (DS:44d0 = 0)")
NAME_SKIP = Const(2, "asm ovl47:0d15: name starts 2 bytes after the sex byte")
NAME_END_BELOW = Const(0x20, "asm ovl47:0d21: the name ends at the first byte < 0x20")
NAME_MAX = Const(15, "asm ovl47:12d8: the name editor ovl56:03a6 gets 0x0f")
NAME_ENCODING = Const("cp437", "DOS text file TERRAIN0/HERONAM<p>.DAT (tables.md §2)")
NAME_FILE = Const("TERRAIN%d/HERONAM%d.DAT", "FILE.DAT group 20 formatted with SCN 0x161 and the "
                  "player (asm ovl47:0c74..0c82; tables.md §2)")

# ---------------------------------------------------------------- allies (ovl47:01fc, 1a9b)
ALLY_COUNT_ROLL = Const((1, 100, 0), "asm ovl47:024d: push dword 0x64, push 1")
ALLY_COUNT_STEPS = Const(((70, 1), (95, 2)), "asm ovl47:025c / 0266: r < 0x46 -> 1, r < 0x5f -> 2, else 3")
ALLY_COUNT_ELSE = Const(3, "asm ovl47:0270")
ALLY_TYPES = Const(28, "asm ovl47:1ab5: types 0..0x1b with DS:45c8[6t] (w13) != 0")
ALLY_TYPE_ROLL_ADD = Const(-1, "asm ovl47:1aba: push -1, push n, push 1 -> rnd(1, n, -1)")
ALLY_FALLBACK = Const(25, "asm ovl47:1aff: dx = 0x19 when nothing was found")
PLACE_TRIES = Const(10, "asm ovl34:12ee: [bp-0xa] = 10")
PLACE_STEP = Const((1, 3, -2), "asm ovl34:1351 / 1367: push 0xfffe0003, push 1")

# ---------------------------------------------------------------- experience (ovl47:04f1, 0579)
EXP_MAX = Const(60, "asm ovl47:051d..0534: exp + n >= 0x3c -> bits 2-7 = 0x3c")
LEVEL_NEEDS = Const((15, 30, 60), "asm ovl47:05f2 / 0621 / 0650: level 0, 1, 2 need exp >= 0x0f, 0x1e, 0x3c")
LEVEL_MSG = Const(((101, 16), (102, 17), (103, 18)),
                  "asm ovl47:05f7 / 0626 / 0655: ovl47:0672(army, STRING group, ovl17 page)")
PROMOTE_STRENGTH = Const(1, "asm ovl47:06c5..06d9: 0b62:0005(army, 1)")
PROMOTE_MOVES = Const(2, "asm ovl47:06f4..0715: +6 += 2 (byte)")
STRENGTH_CAP = Const(9, "decomp 0b62:0005: strength += n; > 9 -> 9 (signed char)")
EXP_SAGE = Const(3, "asm ovl34:010c..0112: ovl47:04f1(hero, 3)")
EXP_RUIN = Const(3, "decomp ovl34:01ab: ovl47:04f1(hero, 3) before the outcome (asm ovl34:0210)")
EXP_BLESS = Const(1, "decomp ovl34:08a1: ovl47:04f1(hero, 1) for a blessed hero (asm ovl34:0a19)")
EXP_QUEST = Const(10, "asm ovl01:1db0..1dd9: ovl47:04f1(quest hero, 10)")

# ---------------------------------------------------------------- medals (ovl36:2274)
MEDAL_BASE = Const(40, "asm ovl36:2355..2373: 0x28 - 5*m")
MEDAL_STEP = Const(5, "asm ovl36:2357")
MEDAL_FLOOR = Const(12, "asm ovl36:235f..2364: below 0x0c -> 0x0c")
MEDAL_ROLL = Const((1, 100, 0), "asm ovl36:23ce: push dword 0x64, push 1; award when r < chance")
MEDAL_PICK_ADD = Const(-1, "asm ovl36:23ee: push -1, push eligible, push 1")
MEDAL_REAL_SIDE = Const(2, "asm ovl36:2378..2384: DS:42c4 >= 2 and DS:42c5 >= 2")
MEDAL_EARLY_TURN = Const(20, "asm ovl36:238f..2397: ovl61:225b() < 0x14")
MEDAL_EARLY_STRENGTH = Const(4, "asm ovl36:23a4: DS:42a4 (first defender's battle strength) >= 4")
MEDAL_MAX = Const(4, "asm ovl36:2465: medals (+0xa) >= 4 -> nothing")
MEDAL_MOVE_FROM = Const(15, "asm ovl36:247c: strength >= 0x0f -> +6 += 1, else 0b62:0005(+1)")
MEDAL_WIN = Const(1, "asm ovl36:23b7: argument (the battle result word [bp-8] of ovl36:0000) == 1")

# ---------------------------------------------------------------- items (ovl47:08c7 / 0943 / 09f7)
STANDARDS = Const(8, "asm ovl47:0921: take clears road bit 0x40 only for item < 8; items 0..7 are "
                  "the sides' standards (ovl47:0a96: item == SCN 0x110)")
PLANT_REFUSED_TERRAIN = Const((2, 3, 10, 11), "asm ovl47:0a38..0a53: Water, Shore, City, Site")
DROP_DESTROY_TERRAIN = Const(2, "asm ovl47:0982 / ovl36:1735: Water destroys a dropped item (state 0)")

# ---------------------------------------------------------------- search (ovl34)
SITE_MOVES_NEEDED = Const(1, "asm ovl34:0017: leader +7 > 0 (signed)")
RUIN_SURVIVE = Const((90, 3, 5), "decomp ovl34:07ad: dies when 90 + 3*S + 5*(H + B - M) < rnd(1,100,0)")
RUIN_ROLL = Const((1, 100, 0), "asm ovl34:084b: push dword 0x64, push 1")
RUIN_GOLD = Const((3, 500, 500), "decomp ovl34:01ab: rnd(3,500,500) for kind 4")
RUIN_GOLD_SPECIAL = Const((3, 1000, 1000), "decomp ovl34:01ab: rnd(3,1000,1000) when +0x1b is set")
RUIN_ALLIES = Const((1, 2, 0), "decomp ovl34:01ab: rnd(1,2,0) allies for kind 5")
RUIN_ALLIES_SPECIAL = Const(2, "decomp ovl34:01ab: +2 when +0x1b is set")
STAT_RECORD = Const((0x1163, 0x5a), "2c04:1163 + p*0x5a per-side statistics (asm ovl34:0314 / 0357, "
                    "ovl36:1b73..1f00)")
STAT_HERO_LOST = Const(0x1167, "asm ovl34:0314: inc word 2c04:1167 + p*0x5a (hero lost in a ruin)")
STAT_STANDARD_LOST = Const(0x116B, "asm ovl34:0357: inc word 2c04:116b + p*0x5a per carried item < 8")
TEMPLES = Const(4, "decomp ovl34:08a1: the first four kind-1 sites in table order are temples 1-4")
TEMPLE_FLAGS = Const((0x02, 0x04, 0x08, 0x10), "decomp ovl34:08a1: army +0xc bit per temple")
BLESS_STRENGTH = Const(1, "decomp ovl34:08a1: 0b62:0005(army, 1)")
SAGE_GEM = Const((3, 500, 500), "decomp ovl34:0b1a: rnd(3,500,500)")
SAGE_SHOW_RANGE = Const(35, "decomp ovl34:1610 / 0e85: distance(site, sage) < 0x23")
SAGE_NO_DISTANCE = Const(0x2710, "decomp ovl34:0e85 / ovl01:1909: best distance starts at 0x2710 "
                         "(Ghidra prints it as s__x__Use_extended_memory_4125_2703 + 0xd)")
SAGE_MAP_BACK = Const((1, 5, 8), "asm ovl34:0cde / 0cf6: push 0x80005, push 1 -> rnd(1,5,8)")
SAGE_MAP_SIZE = Const((1, 10, 15), "asm ovl34:0d0e / 0d21: push 0xf000a, push 1 -> rnd(1,10,15)")
SAGE_MAP_LIMIT = Const((0x70, 0x9c), "asm ovl34:0d4a..0d71: x0 + w >= 0x70 -> w = 0x70 - x0 - 1; y with 0x9c")
SAGE_MAP_PIXEL = Const((0x50, 0x3c, 2), "asm res_0726:036f..0387: square = (px - 0x50) / 2, (py - 0x3c) / 2")
SAGE_GOLD_ENTRY = Const(-1, "decomp ovl34:1610: list entry 0xffff = nearest gold ruin")
SAGE_ALLIES_ENTRY = Const(-2, "decomp ovl34:1610: list entry 0xfffe = nearest allies ruin")
SITE_TILE = Const({"temple": 0x0B, "plain": 0x0C, "hidden": 0x09, "shown": 0x0A},
                  "decomp ovl35:09f2: map low byte of every site; kind 1 -> 0x0b; +0x1b clear -> 0x0c; "
                  "+0x1b set, not shown to p and Quests on -> 0x09; else 0x0a")
OVERVIEW_TILES = Const((0x50, 0x60), "asm ovl63:2849..2856: 0x50 <= tile < 0x60 -> four rnd(1,3,1)")
OVERVIEW_ROLL = Const((1, 3, 1), "asm ovl63:285b..28dd: push 0x10003, push 1, four times")
OVERVIEW_ROLLS = Const(4, "asm ovl63:2863, 288b, 28b4, 28dd")

# ---------------------------------------------------------------- news (ovl41:1244)
NEWS_RECORD = Const((0x13E3, 0x2B), "decomp ovl41:1244: 2c04:13e3 + p*0x2b: count, 2 kinds, 2+2 words, 2 names")
NEWS_SLOTS = Const(2, "decomp ovl41:1244: count < 2 appends, else the slot with the larger kind is replaced")
NEWS_HERO = Const(0, "asm ovl47:04d1..04e7: ovl41:1244(p, 0, city, 0, name) for a new hero")
NEWS_RUIN_DEATH = Const((1, -2), "decomp ovl34:01ab: ovl41:1244(p, 1, 0xfffe, 0, name)")
NEWS_QUEST_DONE = Const(2, "asm ovl01:1d99..1da8: ovl41:1244(p, 2, 0, 0, name)")
NEWS_QUEST = Const(3, "asm ovl01:0d9f..0dae: ovl41:1244(p, 3, 0, 0, name)")
NEWS_SITE = Const(6, "decomp ovl34:0000 / 01ab: kind 6 with a = 0x65 sage, item index, 0x66 gold, 100 allies")
NEWS_SAGE, NEWS_GOLD, NEWS_ALLIES = (Const(0x65, "decomp ovl34:0000 (kind 3)"),
                                     Const(0x66, "decomp ovl34:01ab (kind 4)"),
                                     Const(100, "decomp ovl34:01ab (kind 5)"))
NEWS_NAME_MAX = Const(15, "decomp ovl41:1244: names copied into 16-byte slots (+0x13ee + 0x10*i)")

# ---------------------------------------------------------------- quests (ovl01)
QUEST_TABLE = Const((0, 1, 2, 3, 4, 5, 6, 4, 5, 6), "DS:00a0 (read from the EXE), indexed by rnd(1,10,-1) "
                    "(asm ovl01:0e12..0e25)")
QUEST_TABLE_ROLL = Const((1, 10, -1), "asm ovl01:0e12: push -1, push [bp-0x12] = 10, push 1")
QUEST_AI_FIRST = Const((1, 5, -1), "asm ovl01:0de2: push 0xffff0005, push 1; != 0 -> 4, 0 -> 5")
QUEST_AI_ORDER = Const((None, 3, 6), "asm ovl01:0dd1..0e0b: attempt 1 rolls 4/5, attempt 2 -> 3, "
                       "attempt 3 -> 6, later attempts keep the last type")
QUEST_ITEM_RANGE = Const((50, 30), "asm ovl01:0f60..0f6b: |dx| and |dy| < 0x32 (human) / 0x1e (computer)")
QUEST_SIDE_TRIES = Const(200, "asm ovl01:1237: [bp-0xa] < 0xc8")
QUEST_SIDE_ROLL = Const((1, 8, -1), "asm ovl01:11fa: push 0xffff0008, push 1")
QUEST_KILLS = Const((1, 12, 10), "asm ovl01:125f: push 0xa000c, push 1 -> rnd(1,12,10)")
QUEST_TYPE_TRIES = Const(5, "asm ovl01:11c3: [bp-4] < 5 tries of ovl47:1a9b")
QUEST_CITY_TRIES = Const(200, "asm ovl01:1392 / 1488: [bp-0xa] < 0xc8")
QUEST_CITY_ANY_FROM = Const(100, "asm ovl01:137e / 1474: any distance once [bp-0xa] >= 0x64")
QUEST_OCCUPY_RANGE = Const((60, 40), "asm ovl01:12bf..12cd: 0x3c (human) / 0x28 (computer), dist <= range")
QUEST_RAZE_RANGE = Const(60, "asm ovl01:146f: cmp ax, 0x3c; jle")
QUEST_CITY_ROLL_ADD = Const(-1, "asm ovl01:12d0: push -1, push SCN 0x157b, push 1")
QUEST_GOLD = Const((3, 300, 500), "asm ovl01:14e7: push 0x1f4012c, push 3 -> rnd(3,300,500)")
REWARD_FEW_CITIES = Const(10, "asm ovl01:191d: cities (DS:5dea) < 0x0a")
REWARD_LATE_TURN = Const(15, "asm ovl01:1929: ovl61:225b() > 0x0f")
REWARD_ALLIES_MANY = Const((1, 3, 5), "asm ovl01:192e..1936: push 5, push 0x30001 -> rnd(1,3,5)")
REWARD_ALLIES = Const((1, 3, 2), "asm ovl01:1be0 -> 1930: rnd(1,3,2)")
REWARD_GOLD_MIN = Const(100, "asm ovl01:195c: gold >= 0x64 to try item, site or allies")
REWARD_TRY = Const((1, 3, 0), "asm ovl01:1a1a / 1aab: push dword 3, push 1")
REWARD_ALLIES_TRY = Const((1, 2, 0), "asm ovl01:1bce: push dword 2, push 1; == 1 -> allies")
REWARD_GOLD = Const((2, 1000, 1000), "asm ovl01:1be5: push 0x3e803e8, push 2 -> rnd(2,1000,1000)")
REWARD_ALLY_TYPE = Const(0x13, "asm ovl01:1d5b: ovl34:12e6(0x13, hero x, y)")
REWARD_KIND = Const({"item": 0, "site": 1, "gold": 2, "allies": 3},
                    "asm ovl01:1de5 jump table 1c36, 1c6f, 1c1c, 1d0f for the ovl01:1909 result")
QUEST_FAIL_MSG = Const({"hero": 0x20, "razed": 0x21, "without_hero": 0x22, "occupied": 0x23,
                        "plundered": 0x24, "raze_without_hero": 0x25, "razed_target": 0x26,
                        "side_dead": 0x27, "item_lost": 0x28, "hero_target_dead": 0x29, "owned": 0x2A},
                       "asm ovl01:1e67 .. 2688: STRING group pushed for ovl61:1160 (index 1, 0)")
QUEST_EVENTS = Const((-1, 0, 1, 2, 3, 4), "asm ovl01:1ea8..1eb6 jump table 2745 indexed by event + 1: "
                     "1ebb turn, 20fe battle, 23b8 pillage/sack, 24f7 raze, 26a3 items, 2228 occupy")
QUEST_CHECK_BATTLE = Const((0, 0, 0, 0, 0), "asm ovl36:04b7..04bf: ovl01:1ded(0, 0, 0, 0, 0)")
QUEST_CHECK_CAPTURE = Const((0, 0, 0, 0x75, 0x3024), "asm ovl36:04d7..04e2: event 0 with the "
                            "continuation 3024:0075 = ovl36:04f7 (capture choice) in DS:3f64")
QUEST_CHECK_ITEMS = Const((3, 0, 0, 0, 0), "asm ovl40:0b47..0b4f (item dialog closed), "
                          "ovl34:1951..1959 (search result: take)")
MEDAL_TEXT_COUNTS = Const((7, 4), "STRING.DAT groups 158 / 160 have 7 / 4 entries: the medal pop-up's "
                                  "rolls ovl36:2524 then 2581, index -1 (tests re-read the counts)")
MEDAL_TEXT_HUMAN = Const(0, "asm ovl36:24a5..24ba: SCN word 0xd0 + 2 * DS:41fa (the battle's attacking "
                            "side) == 0 (human) -> pop-up and its rolls, else return")
ITEM_RECORDS = Const(0x16, "asm ovl51:05bc..062e: the item lists scan records 0..0x15 (cmp si, 0x16)")
TAKE_ALL_LIST_MODE = Const(3, "asm ovl34:18b3: ovl51:03d9(3, x, y): mode 3 = case 05bc, items 0..0x15 with "
                              "+0x16 == 1 and +0x19 / +0x1b == the hero's square, table order")
QUEST_PAGE_TYPES = Const((2, 3), "asm ovl01:03c8 jump table cs:0d57 (cases 06fe, 0788): only quest types "
                                 "2 and 3 reach ovl63:158d (ovl01:0842..0845)")
QUEST_ITEM_TYPE = Const(1, "asm ovl01:03c8 jump table cs:0d57 case 0591: the item quest's page; "
                           "an item in state 2 marks its site shown (0682..06a9)")
NO_QUEST_GROUP = Const(20, "asm ovl01:0244: push 0xffff0014 -> ovl59:04f0(20, -1)")
NO_QUEST_COUNT = Const(4, "STRING.DAT group 20 has 4 entries: the roll rnd(1, 4, -1) of ovl59:052f "
                          "(tests re-read the count)")
ARMY_BITS_SKIP_HIDDEN = Const(0x124, "asm ovl63:159a..15c5: SCN 0x124 (Hidden Map) set, SCN 0xd0[SCN 0x110] "
                                     "!= 0 (computer) and SCN 0x159 == 0 -> ovl63:158d returns at once")
ARMY_BITS_SKIP_UNLESS = Const(0x159, "asm ovl63:15bd: SCN word 0x159 != 0 lifts the Hidden-Map skip")
