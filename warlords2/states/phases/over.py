"""After the victory: the main loop has ended for good and the side that won goes on with the
command loop.

Evidence: asm ovl61:2236..2252: SCN 0x15b and 0x157 set -> the main loop ovl61:2123 returns
(`rules.turn.loop_over`); its only callers are Begin (ovl61:0118), End Turn (211e) and the
Settings close (ovl33:0060), so nothing starts another pass.  End Turn ovl61:2074 returns at
once while SCN 0x15b is set (207c..2084) and ovl61:0519 switches menu 535 off (0910..0923,
`ui.game_menus`); every other command of the human phase works as before (the map, the
reports, the stacks).  So this is the human phase without End Turn (`Game.end_turn` runs only
in the human phase).
"""
from __future__ import annotations

from .human import Human


class Over(Human):
    name = "over"


PHASE = Over
