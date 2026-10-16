"""Numbers of the random-map generator (rules/randmap, ovl02..ovl12, M11).

The RANDOM.DAT offsets are the generator's work buffer (far ptr DS:3f8a, read whole from the
game's RANDOM\\RANDOM.DAT by ovl02:0000 at every generation); the values behind them are game
data, read at run time, never copied here.  M11 = the M11 RE notes (asm of ovl02..ovl12, ovl57,
ovl60; values of the EXE image read with `warlords2.assets.exe`).
"""
from __future__ import annotations

from ...model.ids import Terrain
from . import Const

# ---------------------------------------------------------------- the work buffer (ovl02:0000)
DAT_FILE = Const("RANDOM/RANDOM.DAT", "asm ovl02:0042..0048: 070b:0006(DS:0262, mode 2); "
                                      "a failed open prints DS:0274 and exits (005a..0062)")
DAT_SIZE = Const(0xA560, "asm ovl02:001d farmalloc(0xa560); 006a read 0xa560 bytes")
GRID = Const(0x6120, "asm ovl02:0383, ovl03:11dc: grid byte es:[bx + 0x6120], bx = y * 0x70 + x")
GRID_W = Const(0x70, "asm ovl02:0378 imul 0x70, 03a3 cmp dx, 0x70; ovl02:0492 x < 0x70")
GRID_H = Const(0x9C, "asm ovl02:039c cmp cx, 0x9c; ovl02:04a0 y < 0x9c")
DIR8 = Const(0xBC, "asm ovl03:1199 / 11a2 (117d), 1211 / 121a (11f5): 8 (dx, dy) word pairs at "
                   "+0xbc / +0xbe, k = 0..7 (S, SE, E, NE, N, NW, W, SW in the shipped file)")
N_DIRS = Const(8, "asm ovl03:11ea / 1265: cmp cx, 8")

# Header words the sliders adjust and the stage that reads each (M11 §2.1 table).
CITY_COUNT = Const(0x2A, "asm ovl02:0095 += T6e[p2]; read by ovl11:0000 (loop bound)")
MOUNTAIN_SEEDS = Const(0x34, "asm ovl02:00ce += T44[p1]; read by ovl04 (type-2 ridge seeds)")
HILL_SEEDS = Const(0x36, "asm ovl02:00bb += T44[p1]; read by ovl04 (type-1 ridge seeds)")
WIDE_RIVERS = Const(0x38, "asm ovl02:00e0 += T52[p0]; read by ovl06:0000")
NARROW_RIVERS = Const(0x3A, "asm ovl02:00f2 += T52[p0]; read by ovl06:0000")
FOREST_DENSITY = Const(0x3C, "asm ovl02:00a8 += T60[p3]; read by ovl05 (per 100 land squares)")
# (target word, table offset, slider index) in the order ovl02:0082..00f2 adds them; table
# word = buffer word at table + 2 * slider value (shl ax, 1; es:[bx + table]).
SLIDER_ADDS = Const(((0x2A, 0x6E, 2), (0x3C, 0x60, 3), (0x36, 0x44, 1), (0x34, 0x44, 1),
                     (0x38, 0x52, 0), (0x3A, 0x52, 0)),
                    "asm ovl02:0082..00f2: p0 = [bp+6] (di), p1 = [bp+8], p2 = [bp+0xa], "
                    "p3 = [bp+0xc]; 16-bit adds into the buffer words")

CTY_LEN = Const(0x1064, "M11 A5: city text length word (write cursor into +0x1f56); A4 027c "
                        "writes RANDOM.CTY with this length")
SPC_LEN = Const(0x1066, "M11 A5: site text length word (write cursor into +0x3e96); A4 027c "
                        "writes RANDOM.SPC with this length")
CTY_TEXT = Const(0x1F56, "M11 A4 / A5: city description text (RANDOM.CTY)")
SPC_TEXT = Const(0x3E96, "M11 A4 / A5: site description text (RANDOM.SPC)")

# ---------------------------------------------------------------- the pipeline ovl02:011c
CLEAR_VALUE = Const(int(Terrain.WATER), "asm ovl02:0383: grid byte = 2 (x outer 0..0x6f, y inner)")
ROAD_KEEP = Const(0xE0, "asm ovl02:0395: and byte es:[19d9:y * 0x70 + x], 0xe0")
PROGRESS = Const((0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                 "asm ovl02:011f..01af: push 0 / 0xa / 0x14 .. 0x64, call 01ff, one before each "
                 "stage call and 100 after the last")

# ---------------------------------------------------------------- memory images the stages write
SCN_SIZE = Const(0x2EE1, "M11 brief: SCN image 2c04:0000 (0x2ee1 bytes; ovl09:1001 reads it whole)")
MAP_WORDS_SIZE = Const(0x8880, "M11 §2.4: map words 1e1d:0000, 112 x 156 words (RANDOM.MAP length)")
ROADS_SIZE = Const(0x4440, "M11 §2.4: road / feature byte layer 19d9:0000 (RANDOM.RD length)")
# Files in the order the generator writes them (FILE.DAT entry), M11 §2.4.
FILES = Const((("SGN", (33, 0)), ("MAP", (30, 0)), ("RD", (31, 0)), ("CTY", (35, 0)),
               ("SPC", (34, 0)), ("SCN", (32, 0))),
              "asm ovl09:113d (SGN), 027c (MAP, RD, CTY, SPC), 10cf (SCN), called in that order "
              "from ovl09:0014")

# ---------------------------------------------------------------- the wrapper ovl57:10e8
ID_LEN = Const(6, "asm ovl57:10ef..1110: si 0..5, then NUL at [bp-0xc] (1112)")
ID_ROLL = Const((1, 0x5A, 0), "asm ovl57:10f3..10f8: ovl59:02bf(1, 0x5a, 0)")
ID_BASE = Const(0x20, "asm ovl57:1100: add ax, 0x20 (chars 0x21..0x7a)")
SLIDER_RANDOM = Const(7, "asm ovl57:119b: cmp word [0x28d0 + 2 i], 7 -> roll")
SLIDER_ROLL = Const((1, 7, -1), "asm ovl57:11a2..11aa: ovl59:02bf(1, 7, -1)")
N_SLIDERS = Const(4, "asm ovl57:11c9: cmp si, 4")

# ---------------------------------------------------------------- run words (EXE image values)
ROTOR_IMAGE = Const(-1, "EXE image DS:02d4 = 0xffff; ovl11:0a93 rolls rnd(1, 16, -1) when -1")
GAME_START_IMAGE = Const({"random": 0, "terrain_set": 0, "allies": 0, "sliders": (3, 3, 2, 3),
                          "shown": (1, 1, 1, 1)},
                         "EXE image words DS:28c8, 28ca, 28cc, 28d0[4], 28d8[4]")
DGROUP = Const(0x3125, "EL §1: load segment of DGROUP; DS:off is file offset MZ header paragraphs "
                       "* 16 + 0x3125 * 16 + off (randmap.ExeText)")

# ---------------------------------------------------------------- unbounded retries (U6)
HANG_TRIES = Const(1_000_000, "register X59: the EXE retries ovl11:0331, ovl04 / ovl05 / ovl08 "
                              "seeds and ovl09:113d without a bound; this many tries without "
                              "success raises randmap.GeneratorHang (the EXE would hang)")

# ---------------------------------------------------------------- ovl03 (randmap.land)
NV = Const(0x2C, "asm ovl03:00a7 / 034b: cmp word es:[bx + 0x2c + 2 s], 2 (vertex count of side s)")
CORNER = Const(0x7C, "asm ovl03:0bfe: es:[bx + 0x7c + 4 c] (map corner c, dword point)")
SIDE_A = Const(0x8C, "asm ovl03:00b9 / 0100: es:[bx + 0x8c + 8 s] (side s start seed)")
SIDE_B = Const(0x90, "asm ovl03:00db / 0188: es:[bx + 0x90 + 8 s] (side s end seed)")
INSET = Const(0xAC, "asm ovl03:0115 / 0122: es:[bx + 0xac / 0xae + 4 s], negated, times 10")
INSET_MUL = Const(10, "asm ovl03:011c imul ax, ax, 0xa")
START = Const(0x244, "asm ovl03:00ca / 0177: es:[bx + 0x244 + 4 s] (scratch point)")
END = Const(0x254, "asm ovl03:00ec: es:[bx + 0x254 + 4 s] (scratch point)")
CNT = Const(0xFC, "asm ovl03:0344: es:[bx + 0xfc + 2 s] (scratch vertex count)")
VERTS = Const(0x104, "asm ovl03:030e..0334: es:[bx + 0x104 + 0x50 s + 4 j] (scratch vertex list)")
VERTS_STRIDE = Const(0x50, "asm ovl03:0310 imul ax, ax, 0x50")
END_JITTER = Const((16, 1), "asm ovl03:012f / 01b7: push 0x10010 (step 16, edge 1) -> ovl02:04ae")
CENTRE = Const((0x38, 0x4E), "asm ovl03:020e / 0213: [bp-0x10] = 0x38, [bp-0xe] = 0x4e")
LAND_NEAR = Const(3, "asm ovl03:0a5c: cmp ax, 3 (cheb < 3: step straight at B)")
SWEEPS = Const(2, "asm ovl03:09aa: cmp word [bp-2], 2 (the four sweeps run twice)")
CHANNEL_ROLL = Const((1, 100, 0), "asm ovl03:0057..005c: ovl59:02bf(1, 0x64, 0)")
CHANNEL_BELOW = Const(50, "asm ovl03:0064: cmp ax, 0x32; jge (no channels)")
CHANNEL_COUNT = Const((1, 3, -1), "asm ovl03:0069..0071: ovl59:02bf(1, 3, -1)")
CHANNEL_ARGS = Const((1, 0, 1), "asm ovl03:0db2..0dba: push 0x10000; push 1 -> ovl06:005d(1, 0, 1)")
WALK_ROLL = Const((1, 3, 0), "asm ovl03:0a6f..0a74: ovl59:02bf(1, 3, 0)")
ROT_SIDES = Const(5, "asm ovl03:108b: push 0x50001 (dice 1, sides 5), add = c - 2 (1087)")
# The doubles ovl03:0dd0 compares the slope against (fcomp qword [0x292] ...).
SLOPES = Const((2.414, 0.414, -0.414, -2.414),
               "EXE image DS:0292, 029a, 02a2, 02aa (four qwords; read with assets.exe.ds_words)")

# ---------------------------------------------------------------- ovl04 / ovl07 (randmap.ridges)
SEEDS = Const(0x5DD6, "asm ovl04:0429 / 050f: es:[bx + 0x5dd6 + 0xe n] (seed record n)")
SEED_SIZE = Const(0xE, "asm ovl04:0424 imul ax, ax, 0xe")
SEED_COUNT = Const(0x611E, "asm ovl04:0007 (= 0), 046f / 0555 (inc), 0587 (cmp 1)")
SEED_X, SEED_Y, SEED_TYPE, SEED_NLINKS, SEED_LINKS = (
    Const(0, "asm ovl04:0429 (seed record +0)"), Const(2, "asm ovl04:043c (+2)"),
    Const(4, "asm ovl04:044f (+4)"), Const(6, "asm ovl04:0464 (+6)"),
    Const(8, "asm ovl04:0639 (+8, three link words)"))
MOUNTAIN_SEED = Const((2, 6), "asm ovl04:0495: type 2 (0535), grid 6 (04fb); count word +0x34")
HILL_SEED = Const((1, 5), "asm ovl04:03af: type 1 (044f), grid 5 (0415); count word +0x36")
RIDGE_COL_ROLL = Const((1, 0x70, -1), "asm ovl04:03c6 / 04ac, ovl07:004c / 0072: push 0xffff0070; push 1")
RIDGE_ROW_ROLL = Const((1, 0x9C, -1), "asm ovl04:03d8 / 04be, ovl07:005f / 0085: push 0xffff009c; push 1")
HILL_LINKS = Const((1, 2, -1), "asm ovl04:05aa..05b2: ovl59:02bf(1, 2, -1) (type 1)")
MOUNTAIN_LINKS = Const((1, 4, -1), "asm ovl04:05d0..05d8: ovl59:02bf(1, 4, -1) (type 2)")
RIDGE_FAR = Const(10000, "asm ovl04:0612: [bp-4] = 0x2710 (no nearest seed yet)")
STUB_ROLL = Const((1, 5, -10), "asm ovl04:088a / 08a2, 08f9 / 0911: push 0xfff60005; push 1")
WIDTH_ROLL = Const((1, 2, 1), "asm ovl04:08cc..08d8, 093b..0947, 0965..0971: push dword "
                              "(value, 1); push 0x20001 -> rnd(1, 2, 1), the value word stays "
                              "on the stack as 09a7's fourth argument")
HILL_LINE = Const((3, 5), "asm ovl04:098f: push 0x50003 -> 09a7(.., width 3, value 5)")
LINE_ROLL = Const((1, 3, 0), "asm ovl04:0a0f..0a14: ovl59:02bf(1, 3, 0)")
RIDGE_NEAR = Const(3, "asm ovl04:09fc: cmp ax, 3 (cheb < 3: step straight at p2)")
RIDGE_MEND_ROLL = Const((1, 10, 0), "asm ovl04:022e..0233 / 02d3..02d8: ovl59:02bf(1, 10, 0)")
RIDGE_MEND_MAX = Const(5, "asm ovl04:023b / 02e0: cmp ax, 5; jg (the second square)")
CUT_ROLLS = Const(4, "asm ovl07:004c..0095: x1, y1, x2, y2 = rnd(1, 0x70, -1) / rnd(1, 0x9c, -1)")
PASSES = Const(0x40, "asm ovl07:0015: cmp word es:[bx + 0x40], si (mode-0 cuts: mountains -> hills)")
VALLEYS = Const(0x3E, "asm ovl07:002c: cmp word es:[bx + 0x3e], si (mode-1 cuts: hills / "
                      "mountains -> land)")

# ---------------------------------------------------------------- ovl05 (randmap.forest)
PLACED = Const(0x1F52, "asm ovl05:008f (= 0), 019d / 022f / 0322 / 03a9 / 0478 (inc)")
TARGET = Const(0x1F54, "asm ovl05:008a: (n / 100) * word +0x3c (idiv, then imul low word)")
PER = Const(100, "asm ovl05:007c: mov bx, 0x64; idiv")
FOREST_COL_ROLL = Const((1, 0x70, -1), "asm ovl05:00c1..00c9: push 0xffff0070; push 1")
FOREST_ROW_ROLL = Const((1, 0x9C, -1), "asm ovl05:00d4..00dc: push 0xffff009c; push 1")
SHAPE_ROLL = Const((1, 100, 0), "asm ovl05:0102..0107: ovl59:02bf(1, 0x64, 0)")
SHAPE_BELOW = Const(65, "asm ovl05:010f: cmp ax, 0x41; jge (the large shape)")
SMALL = Const(((1, 8, 2), 4, 2), "asm ovl05:0118..0139: 8 x rnd(1, 8, 2) (push 0x20008); "
                                 "[bp-0x1e] = 4, [bp-0x20] = 2")
LARGE = Const(((1, 10, 5), 6, 4), "asm ovl05:014a..016b: 8 x rnd(1, 10, 5) (push 0x5000a); "
                                  "[bp-0x1e] = 6, [bp-0x20] = 4")
FOREST_MEND_ROLL = Const((1, 10, 0), "asm ovl05:0577..057c / 067a..067f: ovl59:02bf(1, 10, 0)")
FOREST_MEND_BELOW = Const(5, "asm ovl05:0584 / 0687: cmp ax, 5; jge (the second square)")
FOREST_MEND_SIDES = Const((5, 3, 7), "asm ovl05:04f0..0575 / 05f3..0678: hills, shore, land (test order)")

# ---------------------------------------------------------------- ovl11 / ovl10 (randmap.cities, .sides)
SCN_CITY_COUNT = Const(0x157B, "asm ovl11:0009 / 0316 / 0680: word 2c04:157b")
SCN_CITY = Const(0x157D, "asm ovl11:02f5 / 0567: city record 2c04:157d + 0x41 c")
SCN_CITY_X, SCN_CITY_Y, SCN_CITY_NAME = (
    Const(0x157D, "SCN_CITY + C_X: asm ovl12:0421 / 0942, ovl62:0546 (x word of city c)"),
    Const(0x157F, "SCN_CITY + C_Y: asm ovl12:0412 / 0933, ovl62:0537 (y word of city c)"),
    Const(0x1581, "SCN_CITY + C_NAME: asm ovl09:1362 add ax, 0x1581 (the city name)"))
CITY_LEN = Const(0x41, "asm ovl11:02ed imul bx, 0x41")
C_X, C_Y, C_NAME = (Const(0, "asm ovl11:02f5 (+0x157d)"), Const(2, "asm ovl11:030c (+0x157f)"),
                    Const(4, "asm ovl11:1608 / 1408 (+0x1581)"))
C_B20 = Const(0x14, "asm ovl11:0662 (+0x1591): rnd(1, 3, 2)")
C_OWNER = Const(0x15, "asm ovl11:0642 / 08c7 / 1112 (+0x1592)")
C_SLOT_ID = Const(0x16, "asm ovl11:1844 (+0x1593 + k)")
C_SLOT_TURNS = Const(0x1A, "asm ovl11:1866 (+0x1597 + k)")
C_SLOT_STR = Const(0x1E, "asm ovl11:18aa (+0x159b + k)")
C_SLOT_MOVES = Const(0x22, "asm ovl11:18cc (+0x159f + k)")
C_SLOT_COST = Const(0x26, "asm ovl11:1888 (+0x15a3 + k)")
C_INCOME = Const(0x2A, "asm ovl11:11a7 (+0x15a7, word)")
N_PROD_SLOTS = Const(4, "asm ovl11:1b36 cmp si, 4; ovl44:096f cmp dx, 4")
NEUTRAL = Const(0xF, "asm ovl11:0642 owner := 0xf; 1112 cmp owner, 0xf")
SCN_SITE_COUNT = Const(0x80F, "asm ovl11:004a: word 2c04:080f := 0x28")
N_SITES = Const(40, "asm ovl11:004a (0x28) and 0079 cmp si, 0x28")
SCN_SITE = Const(0x811, "asm ovl11:0073 / 00c8: site record 2c04:0811 + 0x1f s (x word); "
                        "ovl09:024e (005c)")
SCN_SITE_Y = Const(0x813, "asm ovl11:0062 / 00da: y word 2c04:0813 + 0x1f s; ovl09:005c")
SITE_LEN = Const(0x1F, "asm ovl11:0057 imul bx, 0x1f")
S_NAME = Const(4, "asm ovl11:01a9 (+0x815)")
S_KIND = Const(0x18, "asm ovl11:00fe cmp byte 2c04:0829 + 0x1f s, 1")
TEMPLE = Const(1, "asm ovl11:00fe: kind 1 -> temple branch 01cb")
SCN_PLAYER = Const(0x183, "scenario.md: player record 2c04:0183 + 0x14 p")
PLAYER_LEN = Const(0x14, "asm ovl11:06b2 imul bx, 0x14")
P_GOLD, P_CAPX, P_CAPY = (Const(2, "asm ovl10:008d (+0x185)"), Const(6, "asm ovl11:06ba (+0x189)"),
                          Const(8, "asm ovl11:06cc (+0x18b)"))
N_SIDES = Const(8, "asm ovl11:06d6 / 0880 / 08e6 cmp 8; ovl10:0063 / 0093; the 8 control words "
                   "SCN 0x0d0 the road search reads (ovl25:09ab)")
SCN_TERRAIN_SET = Const(0x161, "asm ovl44:113f push word 2c04:0161 (army file name)")
PRESET = Const(0xA84, "asm ovl11:02de inc (028c), 001e start of the 0000 loop")
RUIN_TEMPLATES_N = Const(0xED2, "asm ovl11:010f: sides of rnd(1, w, -1) at 0116")
RUIN_TEMPLATES = Const((0xED4, 20), "asm ovl11:017e..0187: + 0x14 n")
RUIN_A, RUIN_B = (Const(0xF38, "asm ovl11:015c (second roll, 014b)"),
                  Const(0xF9C, "asm ovl11:013a (first roll, 0129)"))
TEMPLE_NAMES = Const(0x1000, "asm ovl11:01e4: + 10 c")
NAME1, NAME2, NAME_GENERIC = (Const(0xA86, "asm ovl11:14ba"), Const(0xB4E, "asm ovl11:14ec"),
                              Const(0xC16, "asm ovl11:15e9"))
SUF_N8, SUF_N4, SUF_N3, SUF_N5, SUF_NONE = (
    Const(0xDA6, "asm ovl11:1534 (flag DS:02de)"), Const(0xCDE, "asm ovl11:1558 (DS:02d8)"),
    Const(0xD42, "asm ovl11:157c (DS:02d6)"), Const(0xE0A, "asm ovl11:159f (DS:02dc)"),
    Const(0xE6E, "asm ovl11:15cd (no flag, 15aa < 5)"))
NAME_SLOT = Const(10, "asm ovl11:14b1 / 152b imul ax, 0xa")
DESC_WORD1 = Const((0x1068, 0x30), "asm ovl11:13ec..13f9: + 0x30 a + 16 m")
DESC_WORD2 = Const(0x1248, "asm ovl11:13c7..13d0: + 16 b")
PHRASES_FLAG = Const((0x12E8, 0x1388, 0x1428), "asm ovl11:127d, 12a4, 12ba")
PHRASES_LOW = Const((0x16A8, 0x1748, 0x17E8), "asm ovl11:12f0, 1317, 133e (12c6 < 50)")
PHRASES_HIGH = Const((0x14C8, 0x1568, 0x1608), "asm ovl11:1361, 1388, 13af (12c6 >= 50)")
PHRASE_SLOT = Const(16, "asm ovl11:1270 shl ax, 4")
HOME_REGION = Const(0x1D62, "asm ovl11:082a: word + 2 p")
QUAD_REGION = Const(0x1D72, "asm ovl11:083a: word + 2 k := home region of p")
PROD = Const(0x1D82, "asm ovl11:1744: 29 entries of 16 bytes (+0 id, +2 chance, +4 region, "
                     "+6 kind, +8 strength, +0xa turns, +0xc cost, +0xe moves)")
PROD_N = Const(29, "asm ovl11:1725 / 18d3 cmp si, 0x1d")
PROD_LEN = Const(16, "asm ovl11:16be shl ax, 4")
SIDE_NAMES = Const((0x764, 0x64, 0x14), "asm ovl10:0034..0045: + 0x64 p + 0x14 k")
CITY_DX = Const((0, 1, 0, 1), "EXE image DS:02c4 (4 words; asm ovl11:038f add [bx + 0x2c4])")
CITY_DY = Const((0, 0, 1, 1), "EXE image DS:02cc (4 words; asm ovl11:037c add [bx + 0x2cc])")
FMT_RUIN_BASE, FMT_RUIN_TEXT, FMT_TEMPLE_NAME, FMT_TEMPLE_TEXT, FMT_CITY_TEXT, EMPTY = (
    Const(0x2E0, "asm ovl11:0166 push 0x2e0 (sprintf format, two %s)"),
    Const(0x2E5, "asm ovl11:01c6 push 0x2e5 (sprintf format: index, name)"),
    Const(0x31F, "asm ovl11:01ee push 0x31f (sprintf format, one %s)"),
    Const(0x329, "asm ovl11:0227 push 0x329 (sprintf format: index, name)"),
    Const(0x361, "asm ovl11:1413 push 0x361 (sprintf format: index, name, five %s)"),
    Const(0x381, "asm ovl11:1494 push 0x381 (strcpy source, the empty string)"))
ARMY_FILE = Const(21, "asm ovl44:1144..114a: FILE.DAT (0x15, DS:26c4) % SCN 0x161; the entry is "
                      "Work.army_set (DS:26c4, the `s` switch)")
ARMY_REC = Const(0x3E, "asm ovl44:1439 imul ax, 0x3e")
ARMY_N = Const(29, "asm ovl44:14e9 / 14a1 cmp dx, 0x1d; ovl48:0062 cmp si, 0x1d")
A_STR, A_TURNS, A_COST, A_MOVES = (Const(0x16, "asm ovl44:146a"), Const(0x18, "asm ovl44:1455"),
                                   Const(0x1A, "asm ovl44:147f"), Const(0x1C, "asm ovl44:1494"))
A_FLIES = Const(0x36, "asm ovl48:001e: DS:45c4 + 6 t = rec[bp - 8] = record + 0x36 (low byte)")
A_ALLY = Const(0x30, "asm ovl48:005a: DS:45c8 + 6 t = rec[bp - 0xe] = record + 0x30 (low byte)")
ALLY_SCAN = Const(28, "asm ovl47:1ab5 / 1ae3 cmp dx, 0x1c (types 0..27)")
ALLY_NONE = Const(0x19, "asm ovl47:1aff mov dx, 0x19")
CITY_TILE_ID = Const(0x60, "asm ovl11:0612 cmp low byte, 0x60 (neutral city top-left tile)")
CAPITAL_TILES = Const(((6, 0x80, 0x62), (1, 0x10, 0x11)),
                      "asm ovl11:09c5..0a6e: p >= 6 -> 0x80 + 2 (p - 6) else 0x62 + 2 p; low bytes "
                      "+0, +1 (x + 1), +0x10 (y + 1), +0x11")

# ---------------------------------------------------------------- ovl09:0000 / 0a4b (randmap.tiles)
TILE_BLOCKS = Const(0x464, "asm ovl09:01e2..01f1: word [buf + 0x464 + 0x40 g + 2 chk] (g = cwde grid)")
WATER_TILES = Const(0x4E4, "asm ovl09:057a: word [buf + 0x4e4 + 4 t + 2 chk] (block 2)")
FOREST_TILES = Const(0x564, "asm ovl09:06bd: word [buf + 0x564 + 4 t + 2 chk] (block 4)")
FOREST_LONE = Const(0x598, "asm ovl09:067b: word [buf + 0x598 + 2 chk]")
HILL_TILES = Const(0x5A4, "asm ovl09:0939 / 0774: word [buf + 0x5a4 + 4 t + 2 chk] (block 5); "
                          "a lone mountain takes [0x5a4 + 2 chk]")
HILL_LONE = Const(0x5D8, "asm ovl09:08f7 (0x498 + 5 << 6) and 0b1f: word [buf + 0x5d8 + 2 chk]")
MOUNTAIN_TILES = Const(0x5E4, "asm ovl09:07c9: word [buf + 0x5e4 + 4 t + 2 chk] (block 6)")
PLAIN_TILES = Const(0x624, "asm ovl09:0636 / 0898 / 0adb: word [buf + 0x624 + 2 chk] (block 7)")
MARSH_TILES = Const(0x664, "asm ovl09:0504 / 09fd: word [buf + 0x664 + i] (block 8)")
CITY_TILES = Const(0x6E4, "asm ovl09:00ee: word [buf + 0x6e4] = top-left city tile b; b + 1, "
                         "b + 0x10, b + 0x11 for the other three squares (0116..018c)")
SITE_TILES = Const(0x724, "asm ovl09:01b3: word [buf + 0x724 + 2 chk]")
FIRST_SITE_TILE = Const(0x728, "asm ovl09:024e: word [buf + 0x728] for SCN sites 0..7")
N_FIRST_SITES = Const(8, "asm ovl09:0273: cmp di, 8 (always 8, SCN 0x80f not read)")
PATTERN = Const(0x264, "asm ovl09:04de: signed byte [buf + 0x264 + mask] (mask 0..255)")
ROAD_PATTERN = Const(0x364, "asm ovl09:0ab3 / 0b4b: signed byte [buf + 0x364 + mask]")
DIR8_ROAD = Const(0xDC, "asm ovl09:0efc / 0f04: 8 (dx, dy) word pairs at +0xdc / +0xde "
                        "(N, NE, E, SE, S, SW, W, NW in the shipped file)")
WATER_SET = Const((2, 3, 1), "asm ovl09:0cfc..0d26 (0c9d: grid 2, 3 or 1)")
HILL_SET = Const((6, 5), "asm ovl09:0ea5..0ec0 (0e47: grid 6 or 5)")
TERRAIN_BRIDGE = Const(1, "asm ovl09:0f55: cmp byte SCN [0x710 + tile], 1")
ROLL_TEN = Const((1, 10, 0), "asm ovl09:061e / 0880 / 09d3 / 0ac3: ovl59:02bf(1, 10, 0)")
LONE_PLAIN_MAX = Const(5, "asm ovl09:0626 / 0888 / 0acb: cmp ax, 5; jg (1..5 -> plain)")
MARSH_PLAIN_MAX = Const(6, "asm ovl09:09db: cmp ax, 6; jg (1..6 -> entry 2 chk)")
MARSH_ROLL = Const((1, 4, 0), "asm ovl09:09ec: ovl59:02bf(1, 4, 0), entry 4 r")
HI_PORT = Const(0x7F, "asm ovl09:0543: and byte [map + 1], 0x7f on new marsh")
MARKERS = Const((((1, 10, 10), 2, 0x11), ((1, 10, 10), 1, 0x10)),
                "asm ovl09:0b7f..0c97: n = rnd(1, 10, 10) (0b87 / 0c14), per k up to 0x2710 "
                "pairs x = rnd(1, 0x70, -1), y = rnd(1, 0x9c, -1) (0ba8 / 0bba, 0c35 / 0c47) "
                "until the piece is 2 (then 0x11) / 1 (then 0x10)")
MARKER_TRIES = Const(10000, "asm ovl09:0bfa / 0c87: cmp [bp-8], 0x2710; jl")
MARKER_ROLL_X = Const((1, 0x70, -1), "asm ovl09:0ba0 push 0xffff0070")
MARKER_ROLL_Y = Const((1, 0x9C, -1), "asm ovl09:0bb2 push 0xffff009c")
ROAD_BITS = Const(0x1F, "asm ovl09:0a6e: and ax, 0x1f (road piece of the road byte); ovl09:121d: "
                        "and ax, 0x1f -> must be 0 (signs)")
TERRAIN_TABLE = Const(0x710, "asm ovl09:0f55: byte SCN [0x710 + tile] (terrain of a tile); ovl09:11df "
                             "(signs); 0555:023a / 026b (the road search)")
N_TILES = Const(256, "the tile byte indexes SCN 0x710 (0x100 entries, scenario.md)")

# ---------------------------------------------------------------- ovl12 (randmap.roads)
SLOTS_SIZE = Const(0x2BC, "asm ovl12:000c: 0d28:011f(0x2bc, 0, 0)")
# the arrays of the work block: X, Y, Z (bridge orientation), U (slot taken), A (distance to the
# nearest city), B (to the nearest taken slot), 50 words each; CU (city used), 100 bytes
SLOT_X, SLOT_Y, SLOT_Z, SLOT_U, SLOT_A, SLOT_B = (
    Const(0x0, "asm ovl12:018c: es:[bx] (X)"), Const(0x64, "asm ovl12:0188 (+0x64, Y)"),
    Const(0xC8, "asm ovl12:0183 (+0xc8, Z)"), Const(0x12C, "asm ovl12:018f (+0x12c, U)"),
    Const(0x190, "asm ovl12:017e (+0x190, A)"), Const(0x1F4, "asm ovl12:0179 (+0x1f4, B)"))
CITY_USED = Const(0x258, "asm ovl12:009d / 0e4f: byte es:[bx + 0x258 + c] (CU)")
N_WORK_SLOTS = Const(50, "asm ovl12:0168 / 01a9 / 056d / 03e3: mov cx|si, 0x32; ovl12:0752 cmp n, 0x32")
N_CITY_USED = Const(100, "asm ovl12:0092: mov dx, 0x64 (CU[99..0] = 0)")
ROADS_FAR = Const(10000, "asm ovl12:056a / 03e8 / 046c / 0918 / 098d: 0x2710 start of a minimum")
ROADS_PROGRESS = Const((0x51, 0x52, 0x53), "asm ovl12:0032 / 007d / 00aa: ovl02:01ff(0x51 / 0x52 / 0x53)")
PAIR_PROGRESS = Const((4, 10, 0x50, (1, 3, -1)),
                      "asm ovl12:00b2..00dc: si = 4; per pair while si < 10: rnd(1, 3, -1) == 0 -> "
                      "ovl02:01ff(0x50 + si), si += 1")
HI_CLEAR = Const(0x7F, "asm ovl12:0058: and byte [map + 1], 0x7f (x 0..0x6f outer, y inner)")
ROAD_SIDE = Const(0x0E, "asm ovl12:00dd: push 0x1000e -> 0555:0d9e(0x0e, 1) before every pair")
SITE_GRID = Const(0x0B, "asm ovl12:013b: cmp grid, 0xb -> road byte &= 0xe0")
BRIDGE_ROWS = Const((1, 0x9A), "asm ovl12:05c1 / 077e: di = 1 .. < 0x9a (y)")
BRIDGE_COLS = Const((1, 0x6E), "asm ovl12:05c7 / 0775: si = 1 .. < 0x6e (x)")
BRIDGE_LEFT = Const((0x26, 0x16), "asm ovl12:05e6 / 0604")
BRIDGE_RIGHT = Const((0x28, 0x18), "asm ovl12:0622 / 0643 (tile at x + 1)")
BRIDGE_TOP = Const((0x21, 0x11), "asm ovl12:0661 / 067f")
BRIDGE_BELOW = Const((0x24, 0x14), "asm ovl12:06a0 / 06be (tile at y + 1)")
BRIDGE_H = Const(0x26, "asm ovl12:06e4: h = tile == 0x26")
BRIDGE_TILES_H = Const((0x85, 0x86), "asm ovl12:07cc / 07e9 (x, x + 1)")
BRIDGE_TILES_V = Const((0x84, 0x94), "asm ovl12:085f / 087c (y, y + 1; unreachable, h == 0 never passes)")
BRIDGE_PIECE = Const(1, "asm ovl12:0827 / 083f / 08bb / 08d3: road byte (& 0xe0) | 1 on the flanks")
ROAD_LAND = Const((7, 4, 5), "asm ovl12:0a95..0abf (0a7f) and 0b26..0b6a (0ad0): grid 7, 4 or 5")
NEAR_TAKEN = Const(10, "asm ovl12:0a20: cmp B, 0xa; jl skip")
PICK_ROLL = Const((1, 15, 1), "asm ovl12:0a28 / 050e: push 0x1000f; push 1 -> rnd(1, 15, 1)")
CITY_BONUS = Const(30, "asm ovl12:0a42 / 0528: 0x1e - A, < 0 -> 0")
GRID_BRIDGE = Const(1, "asm ovl12:07fc..0810: grid := 1 on both bridge squares")
PORT_ROLL = Const((1, 2, -1), "asm ovl12:020f: push 0xffff0002; push 1 -> rnd(1, 2, -1); != 0 -> next")
PORT_TILE0 = Const(0x20, "asm ovl12:0242: sub bx, 0x20; cmp bx, 5; jbe -> table cs:03b7")
# tile - 0x20 -> (dx, dy) of the three probes at distance 1..3 (jump table cs:03b7: 0254 west,
# 0280 north, 02ab east, 0254, 02d5 south, 02ab); probes read in the order 3, 2, 1.
PORT_PROBES = Const(((-1, 0), (0, -1), (1, 0), (-1, 0), (0, 1), (1, 0)),
                    "asm ovl12:03b7 dw 0254, 0280, 02ab, 0254, 02d5, 02ab; 0254..02fc")
PORT_WATER = Const(2, "asm ovl12:026d / 0298 / 02c2 / 02ed: cmp grid, 2")
PORT_SPACING = Const(15, "asm ovl12:0310: 0565 >= 0xf")
MAX_PORTS = Const(10, "asm ovl12:03ad: cmp cnt, 0xa; jl (after the pick 03c3)")
PAIR_TRIES = Const(80, "asm ovl12:0e2d: mov si, 0x50")
PAIR_DIST = Const((30, 70), "asm ovl12:0eef / 0ef4: cmp d, 0x1e; jl / cmp d, 0x46; jg")
PAIR_ROLL = Const((1, 1000, 0), "asm ovl12:0ef9: push 0x3e8; push 1 -> rnd(1, 1000, 0)")
RING_TRIES = Const(8, "asm ovl12:0ad7: mov si, 8")
RING_ROLL = Const((1, 12, -1), "asm ovl12:0add: push 0xffff000c; push 1 -> rnd(1, 12, -1)")
RING = Const(((-1, -1), (0, -1), (1, -1), (2, -1), (2, 0), (2, 1), (2, 2), (1, 2), (0, 2),
              (-1, 2), (-1, 1), (-1, 0)),
             "DS:0382, 12 (dx, dy) words (EXE image), the ring around the 2 x 2 city")
ROAD_STEPS = Const(200, "asm ovl12:0e12: cmp si, 0xc8")
MARK_EVERY = Const(5, "asm ovl12:0df8: cmp di, 5; jle (k > 5 -> 0f4b, k = 0)")
MARK_DIST = Const(10, "asm ovl12:0f87: cmp dist, 0xa; jge skip")
ROAD_PIECE = Const(1, "asm ovl12:0de4: or byte road, 1")
WATER_GRID = Const((3, 2, 1), "asm ovl12:0ce8..0d1c / 0d9a..0dce: grid 3, 2, 1 -> no road")
VIEW_X, VIEW_Y = (Const(0x17D, "asm ovl12:0d5e: SCN view centre x, written by the debug branch "
                                "0d56..0d68"), Const(0x17F, "asm ovl12:0d68: SCN view centre y"))
SEARCH_MODE, SEARCH_MASK = (Const(1, "asm ovl12:0c49: request +0xa (mode) = 1"),
                            Const(0, "asm ovl12:0c4e: request +8 (mask) = 0"))
SCN_SIDE = Const(0x110, "asm 0555:0d40 cmp ax, es:[0x110] (the side to move, read by the search)")
SCN_HIDDEN = Const(0x124, "asm 0555:08d7 cmp es:[0x124], 0 (hidden map)")
SCN_CONTROL = Const(0x0D0, "ovl25:09ab: SCN 0x0d0 + 2 p, the control word of side p")

# ---------------------------------------------------------------- ovl09:113d (randmap.signs)
N_SIGNS = Const((1, 30, 40), "asm ovl09:114a: push 0x28001e; push 1 -> rnd(1, 30, 40) (41..70)")
SGN_REC = Const(0x68, "asm ovl09:115d / 124c: imul 0x68; buffer n * 0x68 + 2, word n first")
SIGN_ROLL_X = Const((1, 0x70, -1), "asm ovl09:119a push 0xffff0070 (site 11a2)")
SIGN_ROLL_Y = Const((1, 0x9C, -1), "asm ovl09:11ac push 0xffff009c (site 11b4)")
LINE1, LINE2 = (Const(4, "asm ovl09:127e: record +4 (0x32 bytes)"),
                Const(0x36, "asm ovl09:12d5: record +0x36 (0x32 bytes)"))
NEAR_CITY, NEAR_SIGN = (Const(10, "asm ovl09:11e7: ovl03:11f5(x, y, 0xa) must be 0"),
                        Const(9, "asm ovl09:11f9: ovl03:11f5(x, y, 9) must be 0"))
SIGN_TERRAIN = Const(7, "asm ovl09:11df: cmp byte SCN [0x710 + tile], 7")
SIGN_TILE = Const(0, "asm ovl09:1244: and byte [map], 0 (the low byte := 0)")
PHRASE_ROLL = Const((1, 10, 0), "asm ovl09:1268: rnd(1, 10, 0), always rolled (site 126d)")
PHRASE_MAX = Const(3, "asm ovl09:1275: cmp ax, 3; jg -> city line")
N_PHRASES = Const(0x18B0, "asm ovl09:127e: word [buf + 0x18b0] > k (signed jle)")
PHRASE1 = Const((0x18B2, 0x3C), "asm ovl09:1288..1294: buf + 0x18b2 + 0x3c k -> strcpy record +4")
PHRASE2 = Const((0x18D0, 0x3C), "asm ovl09:12b6..12c2: buf + 0x18d0 + 0x3c k -> strcpy record +0x36")
CITY_FORMAT = Const(0x1888, "asm ovl09:136c: sprintf(record +4, buf + 0x1888, SCN city name)")
WAY_FORMAT = Const(0x189C, "asm ovl09:139e: sprintf(record +0x36, buf + 0x189c, 2 d, direction word)")
ANY_OWNER = Const(0x0E, "asm ovl09:12ea: ovl62:04fa(x, y, 0xe, 0) (any owner, no visibility test)")
NEAREST_START = Const(1000, "asm ovl62:050a: best distance 0x3e8, strict <")
DIRECTION_WORDS = Const(0x2B7C, "asm ovl09:1393: push dword [bx + 0x2b7c], bx = 4 * ovl62:0b51(..)")

# ---------------------------------------------------------------- ovl09:1001 / 0014 (randmap.files)
TEMPLATE_NAME = Const(0x2B2, "asm ovl09:100d: strcpy(name, DS:02b2) (the default scenario directory)")
TEMPLATE_PATH = Const(0x2BA, "asm ovl09:106c: sprintf(path, DS:02ba, name, name) ('%s\\%s.scn')")
SCENARIO_DAT = Const("DATA/SCENARIO.DAT", "ovl60:06c8: FILE.DAT (0, 0), records of 0x54 bytes")
SCENARIO_REC = Const(0x54, "asm ovl60:06f5: push 0x54 (one record per read, records 0..i)")
SCENARIO_SET = Const(0x52, "asm ovl09:103a: word [rec + 0x52] == DS:28ca")
SCENARIO_DIR = Const(0x14, "asm ovl09:1047: strcpy(name, rec + 0x14)")
SCN_READ = Const(0x2EE1, "asm ovl09:10af: 070b:006d(h, 2c04:0000, 0x2ee1)")
FINISH_PROGRESS = Const((0x5C, 0x5E, 0x60, 0x62),
                 "asm ovl09:001c / 002e / 003b / 0048: ovl02:01ff(92 / 94 / 96 / 98)")
# the EXE strings ovl11 reads (`ExeText`)
TEXT_DS = (FMT_RUIN_BASE, FMT_RUIN_TEXT, FMT_TEMPLE_NAME, FMT_TEMPLE_TEXT, FMT_CITY_TEXT, EMPTY)
