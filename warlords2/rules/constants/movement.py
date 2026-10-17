"""Numbers of movement, pathfinding and visibility (rules/movement.py, pathfinding.py,
visibility.py).

EL = docs/research/exe_logic.md.  "asm" = the capstone listing of WARLORD2.EXE
(tools/re/disasm.py), "decomp" = out/rea/decomp/ (Ghidra, one file per linear address);
both were read by the M4b implementer at the addresses given.  DS:xxxx tables were read from
WARLORD2.EXE at file offset 0x33250 + xxxx (tests/engine/test_movement.py re-reads them).
Addresses in 0555 / 0a8b / 0b62 / 0c8c are resident code (load-relative segment).
"""
from __future__ import annotations

from . import Const

# ---------------------------------------------------------------- cost map (0555:0d9e)
TERRAIN_COST = Const((1, 1, 1, 2, 4, 6, 0, 2, 5, 2, 1, 2),
                     "EL §4.1 DS:1274 (words, low bytes read at asm 0555:0e91)")
ALT_TERRAIN_COST = Const((1, 1, 3, 3, 4, 5, 7, 2, 5, 2, 1, 7),
                         "EL §4.1 DS:01e0; used only when the cost map is built for side 0xE "
                         "(asm 0555:0e46), whose one caller is ovl12:00e3 (road builder of the "
                         "random-map generator, called from ovl02:0199): not a movement rule (X20)")
ALT_TABLE_SIDE = Const(0x0E, "asm 0555:0dc9 / 0e46: side 14 selects DS:01e0 and DS:00e0 = 1")
ROAD_COST = Const(1, "asm 0555:0e57..0e5e: road piece (19d9 & 0x1f) != 0 -> cost 1")
CM_COST = Const(0x07, "asm 0555:19e4 (c = costmap & 7)")
CM_WATER = Const(0x08, "asm 0555:0f13 (cases Bridge, Water, Shore)")
CM_CROSSING = Const(0x10, "asm 0555:0f07 (Bridge), 0f52 (port bit 0x80 of the map word)")
CM_HILLS = Const(0x20, "asm 0555:0f2f (Hills)")
CM_WOODS = Const(0x40, "asm 0555:0f21 (Forest)")
CM_CITY = Const(0x80, "asm 0555:0ef9 (every City tile)")
# jump table 0555:1089 indexed by terrain-1: Bridge 0eff (0x10, then 0x08), Water/Shore 0f0b,
# Forest 0f19, Hills 0f27, Mountains..Tower 0f33 (none), City 0eb2.
TERRAIN_FLAGS = Const({1: 0x18, 2: 0x08, 3: 0x08, 4: 0x40, 5: 0x20},
                      "jump table 0555:1089 = 0eff,0f0b,0f0b,0f19,0f27,0f33x4,0eb2")
COAST_FLAGS = Const(0x18, "asm 0555:0eed / 102a..1051: own coastal city tile, razed coastal city")
COAST_WALK = Const((0, 2, 2, 4, 4, 4, 6, 6, 6, 0, 0, 0),
                   "DS:01f8 (words up to -1), walked by 0555:109d with 0a8b:0b4d")
COAST_TERRAIN = Const((1, 2, 3), "0555:109d: Bridge, Water or Shore on the ring -> coastal")
ENEMY_CITY_PATCH_COST = Const(1, "DS:1288, written by 0555:0bde to the 4 tiles of a target city")

# ---------------------------------------------------------------- directions
DIR_DX = Const((0, 1, 1, 1, 0, -1, -1, -1), "DS:2b16, used by 0a8b:0b4d; same as DS:0222")
DIR_DY = Const((-1, -1, 0, 1, 1, 1, 0, -1), "DS:2b04, used by 0a8b:0b4d; same as DS:0232")
NO_DIRECTION = Const(0xFF, "0a8b:0ae4 returns 0xff for equal points; 0xff ends a path buffer")

# ---------------------------------------------------------------- search (0555:000a .. 117b)
UNVISITED = Const(30000, "asm 0555:09bd (0x7530)")
BLOCKED = Const(0x7531, "EL §4.3; asm 0555:0a05")
START_MARK = Const(-1, "asm 0555:0168: destination cell = 0xffff")
LANDING_PENALTY = Const(10, "asm 0555:093b: DS:3f6e = 10 for mode 1")
LANDING_PENALTY_WATER = Const(20, "asm 0555:0969..097b: 20 when the destination tile is Water/Shore")
PASS_MARGIN = Const((6, 50), "decomp 0158c3 (0555:0373): box margin 6 (pass 0), 50 (pass 1)")
PASSES = Const(2, "asm 0555:0183: pass 0, then pass 1 while no path")
# DS:00e2 start index per edge case, DS:00f6 dx / DS:0162 dy lists ended by -10.
NEIGHBOUR_START = Const((0, 9, 13, 19, 23, 29, 35, 39, 45, 49), "DS:00e2")
NEIGHBOUR_DX = Const((-1, 0, 1, 1, 1, 0, -1, -1, -10, 1, 1, 0, -10, 1, 1, 0, -1, -1, -10, 0, -1, -1,
                      -10, 0, 1, 1, 1, 0, -10, -1, 0, 0, -1, -1, -10, 0, 1, 1, -10, -1, 0, 1, 1,
                      -1, -10, -1, 0, -1, -10, 0, 1, 0, -1, -10), "DS:00f6")
NEIGHBOUR_DY = Const((-1, -1, -1, 0, 1, 1, 1, 0, -10, 0, 1, 1, -10, 0, 1, 1, 1, 0, -10, 1, 1, 0,
                      -10, -1, -1, 0, 1, 1, -10, -1, -1, 1, 1, 0, -10, -1, -1, 0, -10, -1, -1, -1,
                      0, 0, -10, -1, -1, 0, -10, -1, 0, 1, 0, -10), "DS:0162")
NEIGHBOUR_END = Const(-10, "asm 0555:0856")
BACKTRACE_ORDER = Const((0, 7, 1, 6, 2, 5, 3, 4), "DS:0212 (offsets added to the octant, mod 8)")
BACKTRACE_ENTRY_DI = Const(1, "asm 0555:017c: DI = result of 0555:0373 (= 1) when 117b is called")
PATH_MAX = Const(0xC6, "asm 0555:139d: at most 198 direction codes")
ADJACENT_DISTANCE = Const(
    1, "asm 0555:00bf: 0555:020e (direct step) when 0a8b:0acc(src, dst) == 1; 0acc = "
       "trunc(sqrt(dx*dx+dy*dy)) (EL §9.7), which is 1 exactly for the 8 neighbours")

# ---------------------------------------------------------------- path cache (0555:1508 .. 16f0)
CACHE_FAR = Const(15, "asm 0555:00a0 / 01b6: distance >= 15 -> slots 1..19, else slot 0")
CACHE_VALID = Const(2, "asm 0555:164e (hit) and 17eb (store): validity word = 2")
CACHE_NO_DISTANCE = Const(10000, "asm 0555:16fd: best stored distance starts at 0x2710")

# ---------------------------------------------------------------- reach (0555:18be, 19e4)
REACH_STEPS = Const(100, "asm 0555:18be: at most 100 steps examined, buffer of 100")
REACH_CUM_CAP = Const(0xFF, "decomp 016e0e: cumulative cost stored as min(cum, 255)")
STOPPED_STEP_COST = Const(0x80, "0555:19e4: cost after a water/land step without crossing flag")
FLY_CHEAP = Const(1, "0555:19e4 mode 2: costmap & 7 == 1 and not plain water")
FLY_COST = Const(2, "0555:19e4 mode 2: everything else")
BONUS_COST = Const(2, "0555:19e4 mode 1: c > 2 on a hills/woods tile with the matching bonus")

# ---------------------------------------------------------------- stack (0c8c:0529, 0a8b:07f9)
MODE_SHIP, MODE_LAND, MODE_FLY = (Const(0, "EL §4.2 0c8c:0529"), Const(1, "EL §4.2"),
                                  Const(2, "EL §4.2"))
MASK_HILLS = Const(1, "EL §4.2: any member with w18")
MASK_WOODS = Const(2, "EL §4.2: any member with w17")
MASK_ABOARD = Const(8, "EL §4.2: any member aboard")
MASK_DISTANCE_MAP = Const(0x10, "asm 0555:1af6 (1ab9 ors it in); tested at 0555:007f (no cache / adjacent "
                                  "step), 0190 (no backtrace / store), 0373:03c0 (R = DS:3f70, r = 0), "
                                  "04ee (stop at r == R), 086e (no start stop)")
ABOARD = Const(0x1000, "EL §7 army +0xc flag")
BOAT_EMBARKED = Const(1, "asm 0a8b:078b: DS:5dc4 = 1 when the move put armies aboard")
BOAT_LANDED = Const(2, "asm 0a8b:06e2: DS:5dc4 = 2 when the move took the stack off its boats")
STACK_MAX = Const(8, "0a8b:0981: group size + armies on the square must be <= 8; 0b62:007d counts <= 8")
MIN_MOVES = Const(2, "decomp 01b0a9 (0a8b:07f9): fewer than 2 points left -> status 2")
EMBARK_TERRAIN = Const((2, 3), "decomp 01ad78 (0a8b:04c8): Water or Shore at the end of a land move")
LAND_KEEP_TERRAIN = Const((1, 2, 3), "decomp 01ad78: aboard stays on Bridge, Water, Shore")
SINK_TERRAIN = Const(2, "decomp 01c4c0 (0b62:0ea0): Water, or any square with the port bit")
# status codes of 0a8b:07f9 ([bp-0xa])
STOP_NONE, STOP_MOVES, STOP_STACK, STOP_EDGE, STOP_CITY = (
    Const(0, "0a8b:07f9"), Const(2, "0a8b:0a79.."), Const(3, "0a8b:0955"),
    Const(4, "0a8b:08a3"), Const(5, "0a8b:08fd"))
STATUS_NO_PATH = Const(1, "asm 0a8b:0cb1: 0a8b:0c4f returns 1 when 0555:000a found no path")
STATUS_ARRIVED = Const(4, "asm 0a8b:0096: 0a8b:0001 sets 4 when the leader stands on its goto after "
                          "0c4f (and clears the goto, 009b..00a2)")

# ---------------------------------------------------------------- army table (0b62:0309, 03be)
ARMY_TABLE = Const(1000, "asm 0b62:0346: the allocator scans records 0..999 (cmp cx, 0x3e8); none "
                         "free -> NULL")
ALLOC_FLAGS = Const(1, "asm 0b62:0386..038c: +0xc = 0, then |= 1")
ALLOC_TRANSIT = Const(0xFF, "asm 0b62:03a0: +0x10 = 0xff")
ALLOC_ORDER_KEEP = Const(0xF0, "asm 0b62:0396..039b: +0xe &= 0xf0, |= 0 (order kind cleared)")
FREE_ORDER_KEEP = Const(0x80, "asm 0b62:03d9 (+0xe &= 0x8f) and 03f0..03f5 (&= 0xf0, | 0): bit 7 kept")

# ---------------------------------------------------------------- move executor (0a8b:0001, 0254)
SELECT_MOVES_START = Const(100, "asm 0c8c:0560: DS:5e00 = 0x64 before the signed min over DS:5e3e (05d3..05db)")
ORDER_KIND_MASK = Const(0x0F, "asm 0a8b:0020..0027: k = army +0xe & 0xf")
ORDER_CITY_MASK = Const(0x7F, "asm 0a8b:0014..001d / 0141..014a: c = (+0xf >> 1) & 0x7f; 034c..0351 "
                              "(t & 0x7f) << 1")
ORDER_SITE = Const(3, "asm 0a8b:0150..0156: status 4 searches a site only with k == 3")
ORDER_CITY = Const(1, "asm 0a8b:0363..0368: redirect sets +0xe = (+0xe & 0xf0) | 1")
ARRIVED_ORDER_KEEP = Const(0x80, "asm 0a8b:01ec / 01f5: +0xe &= 0xf0, then &= 0x8f")
ORDER_CLEAR_KEEP = Const(0xF0, "asm 0a8b:0457 / 0363: +0xe &= 0xf0 (and +0xf &= 1 at 0460 / 0371)")
NEUTRAL_OWNER = Const(0x0F, "asm 0a8b:0285: cmp byte city +0x15, 0xf")
ROLE_NEW_CITY = Const(1, "asm 0a8b:02fe: AI +0x56 + c = 1 after a neutral order city is taken")

# ---------------------------------------------------------------- per-turn points (ovl68:05fb)
CARRY_MAX = Const(2, "EL §4.4 ovl68:05fb (moves_left < 3 ? moves_left : 2)")
ABOARD_ALLOWANCE = Const(20, "EL §4.4 (0x14)")
MOVES_CAP = Const(99, "EL §4.4 ('c' < moves_left -> 99)")

# ---------------------------------------------------------------- visibility (ovl64)
EXPLORED = Const(0x20, "road-layer byte 19d9 bit 5: tested by 0555:08bf and ovl64:1298, set by "
                       "ovl64:1298, loaded per side by ovl64:0d39 (model.ids.ROAD_SEEN; EL §4.1 corrected)")
REVEAL_RADIUS = Const(1, "asm ovl64:12f9..133a: box x-1..x+1, y-1..y+1")
REVEAL_RADIUS_WIDE = Const(2, "asm ovl64:12e5..12f2: radius 2 for a flying stack (DS:5dfc == 2) "
                              "or on a City tile")
ROAD_PORT_VIEW = Const(0x80, "ovl64:0e68 copies road-layer bit 5 into bit 7 when exactly one "
                             "human side lives and it is that side's turn (113b clears it)")
HOLE_PATTERN = Const(
    (255, 255, 255, 255, 255, 255, 255, 10, 255, 255, 255, 255, 255, 255, 255, 10, 255, 255, 255,
     255, 255, 255, 255, 10, 255, 255, 255, 255, 3, 3, 3, 12, 255, 255, 255, 255, 255, 255, 255, 10,
     255, 255, 255, 255, 255, 255, 255, 10, 255, 255, 255, 255, 255, 255, 255, 10, 255, 255, 255,
     255, 3, 3, 3, 12, 255, 255, 255, 255, 255, 255, 255, 10, 255, 255, 255, 255, 255, 255, 255, 10,
     255, 255, 255, 255, 255, 255, 255, 10, 255, 255, 255, 255, 3, 3, 3, 12, 255, 255, 255, 255,
     255, 255, 255, 10, 255, 255, 255, 255, 255, 255, 255, 10, 4, 4, 4, 4, 4, 4, 4, 13, 4, 4, 4, 4,
     8, 8, 8, 9, 255, 255, 255, 255, 255, 255, 255, 10, 255, 255, 255, 255, 255, 255, 255, 10, 255,
     255, 255, 255, 255, 255, 255, 10, 255, 255, 255, 255, 3, 3, 3, 12, 255, 255, 255, 255, 255,
     255, 255, 10, 255, 255, 255, 255, 255, 255, 255, 10, 255, 255, 255, 255, 255, 255, 255, 10,
     255, 255, 255, 255, 3, 3, 3, 12, 255, 11, 255, 11, 255, 11, 255, 1, 255, 11, 255, 11, 255, 11,
     255, 1, 255, 11, 255, 11, 255, 11, 255, 1, 255, 11, 255, 11, 3, 6, 3, 2, 255, 11, 255, 11, 255,
     11, 255, 1, 255, 11, 255, 11, 255, 11, 255, 1, 4, 5, 4, 5, 4, 5, 4, 0, 4, 5, 4, 5, 8, 7, 8, 14),
    "DS:2d56 (256 bytes): fog-edge piece per neighbour mask; 0xff = none -> ovl64:1558 reveals")
FOG_FULL = Const(0x0E, "DS:2d56[0xff] (its only 0x0e): all 8 neighbours unseen or off the map; "
                       "asm ovl67:08e8 (cmp [bx + 0x2d56], 0xe), ovl64:00c1 / 0123")
HOLE_DX = Const((0, 1, 1, 1, 0, -1, -1, -1), "DS:2eda, ovl64:0f6f")
HOLE_DY = Const((-1, -1, 0, 1, 1, 1, 0, -1), "DS:2eea, ovl64:0f6f")
HOLE_PASSES = Const(2, "decomp 087258 (ovl64:1558): two full scans, x outer, y inner")
