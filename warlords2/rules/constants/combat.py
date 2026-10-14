"""Numbers of the strength pipeline and the battle (rules/bonuses.py, rules/combat.py).

EL = docs/research/exe_logic.md.  "decomp" = the Ghidra decompilation in out/rea/decomp/
(one file per function, linear address), "asm" = the capstone listing out/asm/ovlNN.asm; both
were re-read by the M5a implementer at the addresses given.  DS:xxxx tables were read from
WARLORD2.EXE at file offset 0x33250 + xxxx.
"""
from __future__ import annotations

from . import Const, Unverified

# ---------------------------------------------------------------- battle class (ovl38:0000)
# asm ovl38:0050: fortified square (map high byte bit 0x20) -> class 0; else jump table
# ovl38:007b for terrain 4..11 = 006c, 0071, 0071, 0076, 0076, 0076, 006a, 006a; default 0076.
BATTLE_CLASS_BY_TERRAIN = Const(
    {4: 2, 5: 3, 6: 3, 7: 1, 8: 1, 9: 1, 10: 0, 11: 0},
    "asm ovl38:005b..007b: Forest 2, Hills/Mountains 3, Plain/Marsh/Tower 1, City/Site 0")
BATTLE_CLASS_DEFAULT = Const(1, "asm ovl38:0076 (terrain < 4 or > 11)")
BATTLE_CLASS_FORTIFIED = Const(0, "asm ovl38:0050..0056: map bit 0x20 -> 0")

# ---------------------------------------------------------------- strength pipeline (ovl38:008b)
HERO_TABLE = Const((0, 0, 0, 0, 1, 1, 1, 2, 2, 3),
                   "EL §3.3 HEROTAB DS:0ce4 (read from the EXE); indexed at asm ovl38:085c")
HERO_BEST_CAP = Const(9, "asm ovl38:077f..0784: best hero strength + battle items capped at 9")
UNIT_CAP = Const(15, "decomp 06a6ab (ovl38:0a08..0d19): strength < 16 kept, else 15")
ABOARD_STRENGTH = Const(4, "decomp 06a6ab: aboard (flag 0x1000) on terrain 2/3 -> 4, no bonuses")
ABOARD_TERRAIN = Const((2, 3), "decomp 06a6ab: tile type 2 (Water) or 3 (Shore)")
FORTIFIED_BONUS = Const(1, "decomp 06a6ab: first tile word bit 0x2000 -> city bonus 1")
SITE_TERRAIN = Const(11, "decomp 06a6ab: tile type 11 -> city bonus 2")
SITE_BONUS = Const(2, "decomp 06a6ab")
NO_OWNER_DIVISOR = Const(2, "decomp 06a6ab: owner nibble 0xf -> city bonus / 2 (C division)")
CANCEL_CITY, CANCEL_HERO, CANCEL_STACK = (
    Const(1, "decomp 06a6ab: w15 == 1 on side A only (asm ovl38:078d)"),
    Const(2, "decomp 06a6ab: w15 == 2 (asm ovl38:0798, 08c8)"),
    Const(3, "decomp 06a6ab: w15 == 3 (asm ovl38:07a3, 08d3)"))
CANCEL_PLUS_ONE = Unverified(
    "+1 of cancel modes 2/3", "T2b", 0,
    "EL §3.3 [U]; ovl38:008b..0d19 re-read by M5a: no +1 is added anywhere in the battle set-up, "
    "so the battle uses only the cancel.  Not read by the battle code; kept for the display "
    "texts (ovl66:1aba..1b05) and the register row")

# ---------------------------------------------------------------- fight order (ovl38:008b)
FIGHT_ORDER_ROWS = Const(9, "EL §3.2 SCN 0x60b, 9 rows x 29; defender row = min(owner nibble, 8)")
FLYER_SHIFT = Const(80, "decomp 06a6ab: order value + 'P' (0x50), signed byte")
FLYER_SHIFT_TERRAIN = Const((2, 3, 6), "decomp 06a6ab: target tile type 2, 3 or 6")

# ---------------------------------------------------------------- battle loop (ovl36:08a6)
DIE = Const(20, "EL §3.4 asm ovl36:092c mov ax, 0x14")
DIE_INTENSE = Const(24, "EL §3.4 asm ovl36:0927 mov ax, 0x18 when 2c04:0126 (Intense Combat)")
HITS_START = Const(1, "asm ovl38:06ed/0712: DS:4274[i] = DS:427c[i] = 1; a unit dies below 0")
MIN_DUEL_STRENGTH = Const(1, "asm ovl36:08ed..0912: max(1, strength) at the start of each duel")
ROLL_LIMIT = Const(10000, "asm ovl36:0961..096a: counter before increment > 0x2710 forces the roll")
FORCED_ROLLS = Const((0, 100), "asm ovl36:096c/0971: defender roll 0, attacker roll 100")

# ---------------------------------------------------------------- attack (ovl36:0000, 0522)
ATTACK_COST_MIN = Const(2, "EL §3.1 decomp 067a70 (ovl36:0205): DS:4160 = max(2, DS:1274[t])")
MOVES_NEEDED = Const(1, "decomp 067a70: stack moves (DS:5e00) or army +7 < 1 -> refused")
OWNER_BITS = Const((1, 2, 4, 8, 16, 32, 64, 128), "DS:0cbe (read from the EXE): city +0x30 |= DS:0cbe[p] (asm ovl36:02a9)")
CITY_TILE_DX = Const((0, 1, 0, 1), "DS:0d46 (read from the EXE), city 2x2 offsets")
CITY_TILE_DY = Const((0, 0, 1, 1), "DS:0d4e (read from the EXE)")

# ---------------------------------------------------------------- after the battle (ovl36:0a6b)
EXP_CITY = Const(2, "asm ovl36:0be9..0bf1: surviving attacking hero +2 when the first tile is terrain 10")
EXP_FIELD = Const(1, "asm ovl36:0bf5")
EXP_DEFENDER = Const(1, "asm ovl36:0c8e..0c95: a surviving defender i +1 when DS:424c[i] == 0x1c, "
                    "i.e. the ATTACKER type array (8 bytes, past the attacker count the previous "
                    "set-up's bytes), then DS:4254[i - 8] (state.battle_work)")

# ---------------------------------------------------------------- advisor (ovl36:1f19, 2065)
ADVISOR_RUNS = Const(19, "asm ovl36:2094 cmp di, 0x13: 19 simulated battles (ovl36:124a mode 0)")
ADVISOR_DIVISOR = Const(2, "asm ovl36:2099..20a0: verdict = attacker-survivor runs / 2 (0..9)")
