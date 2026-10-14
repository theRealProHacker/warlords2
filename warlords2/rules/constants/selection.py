"""Numbers of the stack palette, the order commands and the turn-start army bookkeeping
(rules/selection.py).

"asm" = the capstone listing (out/asm/ovl66.asm, ovl67.asm, res_0b62.asm, res_0c8c.asm),
re-read at the addresses given.  Army record offsets are those of EL §7 (+0xc flags word,
+0x11 group byte, +0x12/+0x14 goto).
"""
from __future__ import annotations

from . import Const

# ---------------------------------------------------------------- army +0xc bits
AWAKE = Const(0x01, "asm ovl66:009f / ovl67:0983 / 09b2 set it on the selected or woken stack; "
                    "ovl67:03c5 / 03ee (Defend) clear it; ovl67:0041 (fortify) and ovl67:0472 / "
                    "061e (Next, Move All) test it; 0b62:038c sets it on a new army")
DONE = Const(0x40, "asm ovl67:0915 / 0939 (Quit & Next, 01fd status 2) set it; ovl67:0147 clears "
                   "it at turn start; ovl67:0482 / 062e skip armies that have it")
VISITED = Const(0x200, "asm ovl67:0805 (stack selected by ovl67:06eb), 0c8c:04e2 (Move All) set "
                       "it; ovl67:0154 (turn start) and ovl67:05a8 (Next cycle reset) clear it")

# ---------------------------------------------------------------- army +0x11
GROUP_ALONE = Const(0, "asm ovl66:0281 (single run), 0b62:0e84 (one-member group dissolved)")
GROUP_DEFENDED = Const(1, "asm ovl67:03ca / 03fc (Defend); ovl66:0294 (asleep run of 2 or more)")
GROUP_FIRST_ID = Const(2, "asm 0b62:0dec (cleanup counts ids >= 2), ovl66:0108..011d (ids 0 and "
                          "1 are not reused)")
GROUP_ID_END = Const(0xFF, "asm 0b62:0cfa / 0d7b / 0e92: ids below 0xff only")
FREE_ID_SLOT1_TAKEN = Const(
    True,
    "asm 0b62:0cde: the used-id table on the stack (bp-0x1fe, 255 words) is zeroed from index 2 "
    "(0ce5..0cfe) but the search starts at index 1 (0d61); word 1 is set only when an own army "
    "on the map has +0x11 == 1, otherwise it holds whatever an earlier, deeper call left there. "
    "Modelled as taken (the search returns ids >= 2), the only reading consistent with +0x11 = 1 "
    "meaning a defended run; the original may return 1 when that stack word happens to be 0")

# ---------------------------------------------------------------- Next (ovl67:040e, 05c4)
NEXT_NONE = Const(10000, "asm ovl67:041e / 0423 / 05cf: best distance starts at 0x2710")
NEXT_HERE = Const(9000, "asm ovl67:04c6..04ca / 0672..0676: distance 0 counts as 0x2328")

# ---------------------------------------------------------------- fortify (ovl67:0000)
FORTIFY_TERRAIN = Const((7, 4, 5, 1, 8, 9),
                        "asm ovl67:00b8..00d4: Plain, Forest, Hills, Bridge, Marsh, Tower; else a "
                        "road piece (19d9 & 0x1f, 00d6..00ec)")

# ---------------------------------------------------------------- palette (ovl66:0963)
PALETTE_SLOTS = Const(8, "asm ovl66:0049 / 09cb / 0a16 / 0e6e: 8 palette slots and index counters")
