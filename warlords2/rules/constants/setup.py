"""Numbers of the new-game set-up (rules/setup.py).

EL = docs/research/exe_logic.md (§9 is the set-up sequence).  Dice are (dice, sides, add)
for `Rng.rnd`.  DS tables were checked against WARLORD2.EXE at file 0x33250 + offset.
"""
from __future__ import annotations

from . import Const, Unverified

# ---------------------------------------------------------------- load and Begin (EL §9.1)
UNUSED_NAME_DS = Const(0x256F, "EL §9.1 ovl57:0194: name of a side with alive = 0 (DS:256f)")
DGROUP_FILE_OFFSET = Const(0x33250, "EL §1 address notation: DS:OOOO = file 0x33250 + OOOO")
LOADER_TILE_ROLLS = Const((256, (1, 3, 1)), "asm ovl63:2479..2489: 256 x rnd(1,3,1) (push dword 0x10003 = "
                                             "sides 3, add 1; push 1 = dice) into the local table "
                                             "[bp-0x10a] (EL §9.1, corrected)")
HUMAN_LEVEL = Const(2, "EL §9.1 ovl57:0cfe: a human side gets level 2")
RANDOM_TURN_SWAPS = Const(20, "EL §9.1 ovl61:1732: 20 swaps with Random Turns")
TURN_SWAP_ROLL = Const((1, 8, -1), "EL §9.1 ovl61:1732: a = rnd(1,8,-1), b = rnd(1,8,-1)")

# ---------------------------------------------------------------- ovl53:0000 (EL §9.2)
NEW_GAME_WORDS = Const({0x118: 0, 0x15D: 0, 0x135: 1, 0x181: 10, 0x157: 0},
                       "EL §9.2 ovl53:000f..0033: round complete, surrender offered, turn, "
                       "army high-water mark, victory acknowledged")
VIEW_MARGIN = Const(4, "EL §9.2 ovl53:01e8..022a")
VIEW_X = Const((4, 107), "EL §9.2 ovl53:019c..01c4 clamp")
VIEW_Y = Const((4, 151), "EL §9.2 ovl53:01aa..01d3 clamp")

# ---------------------------------------------------------------- sites and items (EL §5.5, §9.3)
SITE_FLAG_FRACTION = Const((3, 10), "EL §9.3 ovl35:091e: sites*3/10 flagged non-temple sites")
SITE_SHOWN_INIT = Const(0x00FF, "EL §9.3 ovl35:091e: +0x1d = 0x00ff, 0 for flagged sites with Quests")
ITEM_COUNT_SITE_DIV = Const(3, "EL §5.5 ovl35:011f: sites/3 (idiv)")
ITEM_COUNT_ROLL = Const((1, 5, -3), "EL §5.5 ovl35:0109 push 0xfffd0005, push 1")
ITEM_COUNT_ADD = Const(8, "EL §5.5 ovl35:012c")
ITEM_COUNT_CAP = Const(22, "EL §5.5 ovl35:0131 cmp si, 0x16")
FIRST_SCATTERED_ITEM = Const(8, "EL §5.5 ovl35:0139: items 8..total-1")
SPECIAL_CAP_NUM = Const(2, "EL §5.5 ovl35:000d: cap = (2*sites)/10")
SPECIAL_CAP_DEN = Const(10, "EL §5.5 ovl35:0013")
SPECIAL_K_ROLL = Const((2, 3, 1), "EL §5.5 ovl35:0048 push 0x10003, push 2; k = min(roll, cap)")
SITE_PICK_ROLL_ADD = Const(-1, "EL §9.3 ovl35:0173 rnd(1, sites, -1)")
CAPITAL_NEAR_MAX = Const(14, "EL §5.5 ovl35:0328 cmp ax, 0xe / jg: distance <= 14 is 'within 15'")
GUARDIAN_ROLL = Const((1, 9, 0), "EL §5.5 ovl35:04ba push 9 (dword), push 1")
ALLY_TYPES_FLAGGED = Const((25, 23, 27, 19), "EL §5.5 DS:0c9a, ovl35:0403 rnd(1,4,-1)")
ALLY_TYPES_NO_CAPITAL = Const((24, 20, 26), "EL §5.5 DS:0c9e (4 bytes, rnd(1,3,-1) at ovl35:048c)")
ALLY_TYPES_NEAR_CAPITAL = Const((22, 20), "EL §5.5 DS:0ca2, ovl35:04a3 rnd(1,2,-1)")
KINDS_FLAGGED = Const((5, 5, 4), "EL §5.5 DS:0ca4, ovl35:02b2 rnd(1,3,-1)")
KINDS_NO_CAPITAL = Const((3, 4, 5, 3, 4), "EL §5.5 DS:0ca7, ovl35:033b rnd(1,5,-1)")
KINDS_NEAR_CAPITAL = Const((3, 4, 5), "EL §5.5 DS:0cac, ovl35:0352 rnd(1,3,-1)")
ITM_NAME_LEN = Const(19, "EL §9.3 ovl35:04ef: name = 20 bytes, [19] = 0, cut at the first ' '")

# ---------------------------------------------------------------- cities (EL §9.4)
QUICK_START_ROLL = Const((1, 10, -1), "EL §9.4 ovl53:0973: anchor = capital if roll <= 4")
QUICK_START_CAPITAL_MAX = Const(4, "EL §9.4 ovl53:0983 cmp ax, 4 / jg")
NEAREST_START = Const(1000, "ovl62:04fa initial best distance (EL §9.4)")
NAVY_TYPE = Const(5, "EL §9.4 ovl53:0a92: Navy slots emptied")
PERTURB_ROLL = Const((1, 100, 0), "EL §9.4 ovl53:0bf8.. push 0x64 (dword), push 1")
PERTURB_STRENGTH = Const((10, 60, 9, 1), "EL §9.4 ovl53:0c03..0c7d: r<10, r<60 +1 cap 9 else -1 floor 1")
PERTURB_MOVES = Const((20, 10, 60, 95, 2, 6),
                      "EL §9.4 ovl53:0c9f..0d95: r<20; <10 +4, <60 +2, <95 -2, else -4, floor 2; then at least 6")
PERTURB_COST = Const((10, 60), "EL §9.4 ovl53:0d95..0e11: r<10; r<60 -c/4 else +c/4")
PERTURB_TIME = Const((10, 60, 1), "EL §9.4 ovl53:0e1a..0e88: r<10; r<60 -1 floor 1 else +1")
DEFENCE_FEW, DEFENCE_MANY = Const(1, "EL §6.1 ovl44:0930"), Const(2, "EL §6.1 ovl44:0930")
DEFENCE_MANY_FROM = Const(3, "EL §6.1 ovl44:0930: 1 with < 3 slots filled, else 2; EL §9.4 ovl53:0a41")
CITY_TILE_BASE_LOW = Const((0x62, 6), "EL §9.4 ovl39:0000: base 0x62 + 2o for o < 6")
CITY_TILE_BASE_HIGH = Const(0x80, "EL §9.4 ovl39:0000: base 0x80 + 2(o-6) for o >= 6; o = 0x0f -> -1")

# ---------------------------------------------------------------- explored map, territories (EL §9.5)
EXPLORED_RADIUS = Const((-2, 3), "EL §9.5 ovl64:113b: x-2..x+3 x y-2..y+3, not clipped")
ROAD_SEEN_INIT = Const(0x20, "EL §9.5 ovl64:113b: road layer |= 0x20 (bit 5 = seen, model.ids.ROAD_SEEN)")
ROAD_CLEAR_AT_EXPLORE = Const(0x80, "EL §9.5 ovl64:113b: road layer &= 0x7f")
TERRITORY_TIE_ROLL = Const((1, 100, 0), "EL §9.5 ovl29:024d: no computer side: one human is unmarked")
TERRITORY_ANCHOR_ROLL = Const((1, 10, -1), "EL §9.5 ovl29:02d6: anchor = capital if roll <= 4")
TERRITORY_CAPITAL_MAX = Const(4, "EL §9.5 ovl29:010b")

# ---------------------------------------------------------------- garrisons (EL §9.5)
GARRISON_KINDS = Const((1, 6, 2, 3), "EL §9.5 DS:0d60 (words)")
GARRISON_OWNED_KIND = Const(3, "EL §9.5 ovl39:00cc: owned city n = 3")
GARRISON_KIND_ROLL = Const((1, 4, -2), "EL §9.5 ovl39:0174: n = min(rnd(1,4,NeutralCities-2), 3)")
FALLBACK_TYPE = Const(11, "EL §9.5 ovl39:00cc: Scouts, strength 1, owner 0x0f")
FALLBACK_STRENGTH = Const(1, "EL §9.5 ovl39:00cc")
SCORE_A = Const((0, 10, 10, 5, 5, 5, 10), "EL §9.5 DS:0a10 (words), ovl29:103d")
SCORE_B = Const((0, 4, 10, 10, 10, 10, 1), "EL §9.5 DS:0a1e (words)")
SCORE_C = Const((0, 1, 1, 1, 1, 1, 10), "EL §9.5 DS:0a2c (words)")
SCORE_ENHANCED = Const(2, "EL §9.5 ovl29:103d: +2 with Enhanced[0x110], cap 9")
SCORE_STRENGTH_CAP = Const(9, "EL §9.5 ovl29:103d")
SCORE_CANCEL_CITY = Const(2, "EL §9.5 ovl29:103d: S += 2 when w15 == 1")
SCORE_WEAK = Const(3, "EL §9.5 ovl29:103d: kind != 6 and S < 3 -> time + 1")
SCORE_TIME_CAP = Const(10, "EL §9.5 ovl29:103d")
SCORE_FLYER_KIND = Const(4, "EL §9.5 ovl29:103d: kind 4 skips non-flyers")
ENHANCED_BONUS = Const((2, 9), "EL §6.3 ovl43:0dd7; at set-up the current player's flag (EL §9.5)")
NO_PRODUCTION = Const(0xFF, "EL §9.5 ovl39:0381: city +0x2c = 0xff, +0x2d = 0")
QUEST_WORD_10F3 = Const(0xFFFF, "EL §9.5 ovl30:0000: 0x10f3[p] = -1 (meaning [U])")

# ---------------------------------------------------------------- infamy, relations, difficulty
INFAMY_ROLL = Const((1, 8, 0), "EL §6.6 ovl53:0275 push 8 (dword), push 1")
HUMAN_INFAMY_BONUS = Const(400, "EL §6.6 ovl53:02b7 add 0x190 when SCN 0x116 != 0 and human")
RELATION_DIPLOMACY = Const(0, "EL §9.6 ovl00:11bd: current and proposal 0 with Diplomacy")
RELATION_NO_DIPLOMACY = Const(2, "EL §9.6 ovl00:11bd: current and proposal 2 without")
RELATION_KEEP = Const(0xC0, "EL §9.6: bits 4-5 cleared, 6-7 kept")
DIFF_OPTION_WEIGHTS = Const((4, 4, 3, 4, -1, 1),
                            "EL §6.9 ovl57:0bab: NeutralCities, Diplomacy, Quests, HiddenMap, ViewEnemies, ViewProduction")
DIFF_OPTION_CAP = Const(20, "EL §6.9 ovl57:0bab (0x13 < opt -> 0x14)")
DIFF_AI_FULL = Const(80, "EL §6.9 ovl57:0bab")
DIFF_AI_ROUND_FROM = Const(78, "EL §6.9 ovl57:0bab (0x4d < ai -> 0x50)")

# The run-time Active neutral rule (ovl39:025a) is rules.turn.active_neutrals (R28 closed).
