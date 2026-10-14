"""Numbers of the history records, the battle statistics and the report values
(rules/history.py, rules/reports.py).

"asm" = the capstone listing out/asm/ovlNN.asm, re-read by the M9a implementer at the
addresses given.  SCN offsets are 2c04 offsets (the segment is the SCN image, EL §7).
"""
from __future__ import annotations

from . import Const

# ---------------------------------------------------------------- per-round record (ovl41:0d60)
FIRST_TURN = Const(2, "asm ovl41:0d69..0db5: ovl61:225b() == 2 -> the history file FILE.DAT (6, 0) "
                      "is created with the 4-byte header 4, then the record is written")
END_TURN = Const(0xCA, "asm ovl41:0db7..0dc1: ovl61:225b() >= 0xca -> nothing (records of turns "
                       "2..0xc9 = 200 records, README's 200, R12)")
EVENTS_MAX = Const(10, "asm ovl41:13b5: second news entries only while fewer than 10 are taken")

# ---------------------------------------------------------------- battle news (ovl36:0a6b)
NEWS_HERO_KILLED = Const(1, "asm ovl36:0b89..0ba1 / 0c42..0c5a: ovl41:1244(side, 1, city at x, y, 0, "
                            "hero name) for each dead hero of either side")
NEWS_BATTLE = Const(5, "asm ovl36:0aee..0af5: ovl41:1244(a, 5, -1 / a, city, hero name / \"\")")
BATTLE_ARMIES = Const(8, "asm ovl36:0a8a..0a99: attackers + defenders >= 8")
BATTLE_DEFENDERS = Const(4, "asm ovl36:0a9b..0aa0: defenders >= 4")
BATTLE_NEWS_NO_HERO = Const(-1, "asm ovl36:0ad2: push -1 when DS:5e5e (the group's hero) is set")

# ---------------------------------------------------------------- statistics (ovl36:1aff)
STATS = Const((0x1163, 0x50, 0x0A), "asm ovl36:1b5c..1b73: word 2c04:1163 + 0x50 * row + 0xa * column "
                                     "+ field; the 8 x 8 table ends at 0x13e3 (the news records)")
STAT_UNIT, STAT_SPECIAL, STAT_HERO, STAT_ABOARD, STAT_STANDARD = (
    Const(0, "asm ovl36:1c6c / 1dd0: a lost unit of no other kind (+0x1163)"),
    Const(2, "asm ovl36:1c15 / 1d79: a lost unit whose type flag DS:45c8 (ARMYTYPE w13) is set (+0x1165)"),
    Const(4, "asm ovl36:1bbc / 1d20: a lost hero (+0x1167)"),
    Const(6, "asm ovl36:1b73 / 1cd7: a lost unit that was aboard (+0x1169), counted besides its kind"),
    Const(8, "asm ovl36:1e58 / 1ede: a standard (item < 8) carried by a hero of the losing side (+0x116b)"))
STANDARDS = Const(8, "asm ovl36:1e36 / 1ebc: carried item index < 8")

# ---------------------------------------------------------------- report values (ovl42:02fb)
REPORT_ARMIES, REPORT_CITIES, REPORT_GOLD, REPORT_PRODUCTION, REPORT_WINNING = (
    Const(0, "jump table ovl42:05f5 case 035b: armies per owner"),
    Const(1, "case 03fd: DS:5dea after ovl62:03f9"),
    Const(2, "case 0453: player record +0 (gold)"),
    Const(3, "case 04b8: ovl43:07e5 (the production report list)"),
    Const(4, "case 04c2: the winning score"))
SCORE_INCOME = Const(5, "asm ovl42:052d: income DS:5dca * 5")
SCORE_DIV = Const(30, "asm ovl42:053c: idiv 0x1e")
SCORE_RANGE = Const((1, 500), "asm ovl42:054e..056f: > 0x1f4 -> 0x1f4, < 1 -> 1")
SCORE_SCALE = Const(5, "asm ovl42:05b1: every score idiv 5 after the rank")
SCORE_TOP = Const(100, "asm ovl42:05e9: DS:0e40 = 0x64 (the bar scale of the winning report)")
