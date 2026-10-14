"""Numbers of diplomacy, elimination and the end of the game (rules/diplomacy.py,
rules/victory.py).

EL = docs/research/exe_logic.md §6.6-6.7.  "asm" = the capstone listing out/asm/ovlNN.asm,
re-read by the M9a implementer at the addresses given.  DS:xxxx bytes were read from
WARLORD2.EXE at file offset 0x33250 + xxxx.  Dice are (dice, sides, add) as pushed to
ovl59:02bf (a `push dword` carries sides and add).  News kinds are the first argument after the
side of ovl41:1244 (rules.heroes.news).
"""
from __future__ import annotations

from . import Const

# ---------------------------------------------------------------- relation byte 2c04:153b[a*8+b]
CURRENT_MASK = Const(0x03, "asm ovl00:0ddf / 0e58: bits 0-1 = the current state")
PROPOSAL_SHIFT = Const(2, "asm ovl00:0df3 (shr 2, and 3) / 0ee0..0ee9 (and 0xf3, shl 2): bits 2-3 = "
                          "the proposal")
MARK_PENDING = Const(0x10, "asm ovl00:0cec / 0d8d: byte [p][p] bit 4 = some side's proposal to p "
                           "differs from its current state")
MARK_FRIENDLY = Const(0x20, "asm ovl00:0cfb / 0da9: byte [p][p] bit 5 = every such proposal is more "
                            "peaceful than the current state")
PEACE, NEUTRAL, WAR = (Const(0, "asm ovl00:101b: proposal 0 reached -> 'peace' news (kind 10)"),
                       Const(1, "asm ovl61:1a8f / 1aa5: the value written on elimination"),
                       Const(2, "asm ovl00:0f05: proposal 2 reached -> 'war' news (kind 9)"))

# ---------------------------------------------------------------- resolution (ovl00:0db3)
NEWS_WAR = Const(9, "asm ovl00:0f0d..0f15: ovl41:1244(a, 9, a, b, NULL)")
NEWS_PEACE = Const(10, "asm ovl00:101f..1027: ovl41:1244(a, 10, a, b, NULL)")
MSG_PEACE = Const((111, 0), "asm ovl00:1051 / 0f47..0f49: ovl59:04f0(0x6f, 0) formatted with b's name")
MSG_WAR = Const((111, 1), "asm ovl00:0f45..0f49: ovl59:04f0(0x6f, 1) formatted with b's name")

# ---------------------------------------------------------------- refused proposals (ovl00:1063)
PENALTY_PEACE_FROM_NEUTRAL = Const(((1, 2, 0), 1), "asm ovl00:1100..1117 -> 1194..11a1: proposal 0, "
                                                   "current 1: rnd(1,2,0) + 1")
PENALTY_PEACE_FROM_WAR = Const(((1, 10, 0), 10), "asm ovl00:1134..115a: proposal 0, current 2: "
                                                 "rnd(1,10,0) + 10")
PENALTY_NEUTRAL_FROM_WAR = Const(((1, 2, 0), 1), "asm ovl00:115f..11a1: proposal 1, current 2: "
                                                 "rnd(1,2,0) + 1")

# ---------------------------------------------------------------- treachery (ovl36:20a8)
TREACHERY_FROM_PEACE = Const(((1, 100, 0), 100), "asm ovl36:20ee..20ff: current 0: rnd(1,100,0) + 100")
TREACHERY_FROM_NEUTRAL = Const(((1, 15, 0), 10), "asm ovl36:2120..2132: current 1: rnd(1,15,0) + 10")
NEWS_TREACHERY = Const(8, "asm ovl36:2240..2257: ovl41:1244(p, 8, p, other, NULL)")
MSG_TREACHERY = Const((111, 2), "asm ovl36:2216: push 0x2006f -> ovl59:04f0(0x6f, 2)")

# ---------------------------------------------------------------- rating (ovl00:0aed)
RATING_GROUP = Const(106, "asm ovl00:02c2: ovl59:04f0(0x6a, title) on the Diplomatic Report")
RATING_TABLE = Const({1: (0,), 2: (0, 7), 3: (0, 3, 7), 4: (0, 1, 5, 7), 5: (0, 1, 3, 5, 7),
                      6: (0, 1, 3, 5, 6, 7), 7: (0, 1, 3, 4, 5, 6, 7), 8: (0, 1, 2, 3, 4, 5, 6, 7)},
                     "jump table ovl00:0cb7 (cases ovl00:0bb9..0c82) indexed by live sides - 1: "
                     "title of rank i (least infamy first)")

# ---------------------------------------------------------------- elimination (ovl61:18ab)
NEWS_ELIMINATED = Const(4, "asm ovl61:19e3..19f1: ovl41:1244(p, 4, p, 0, DS:2b00 = \"\")")
ELIMINATED_MSG = Const((11, 5), "asm ovl61:1a06: push 0xffff000b -> ovl59:04f0(11, -1): ovl59:052f "
                                "rolls rnd(1, n, -1) over the n = 5 entries of STRING.DAT group 11 "
                                "(count checked against the data by tests/engine/test_victory.py)")

# ---------------------------------------------------------------- end states (ovl61:1aed)
MSG_NO_PLAYERS = Const(12, "asm ovl61:1c0a..1c4f: STRING 12 entries 0-3, then 0a4c:02b5 (exit)")
MSG_NO_HUMANS = Const(13, "asm ovl61:1c6f..1cb4: STRING 13 entries 0-3")
MSG_WINNER = Const((15, 0), "asm ovl61:1d51: ovl59:04f0(0xf, 0) formatted with the winner's name")
NEWS_VICTORY = Const(7, "asm ovl61:1cfc / 1d8e / 1ea6: ovl41:1244(p, 7, p, 0, \"\")")
SURRENDER_SHARE_DIV = Const(2, "asm ovl61:1e11..1e1e: cities[h] > records / 2 (signed)")
SURRENDER_MARGIN_DIV = Const(8, "asm ovl61:1e25..1e3c: cities[h] > best computer + records / 8")
WIN_SHARE_DIV = Const(2, "asm ovl61:1cd7..1ce3: cities[h] > intact cities / 2 (signed)")

# ---------------------------------------------------------------- surrender and victory screens
SCN_ENEMY = Const(0x10F3, "asm ovl61:1f54: declining the surrender writes 2c04:10f3 + 2c = the current "
                          "side for every live c (when a live human exists)")
