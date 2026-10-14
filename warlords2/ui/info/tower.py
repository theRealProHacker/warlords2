"""Right-click on a fortified square holding another side's stack: the Tower panel.

Evidence: ovl46:0000 (asm 01e8..): with the army bit set and the stack shown (View Enemies
SCN 0x12a on, own stack, or fortified bit 0x20 set), a fortified square whose owner nibble is
not SCN 0x110 shows ovl46:1201(x, y, 1) and ovl46:10e1(STRING (130, 0), STRING (130, 1)) and
no army icons, whatever View Enemies says.
"""
from __future__ import annotations

from .. import registry
from ..widgets import kit
from . import POPUP, Panel, panel_rect, two_lines

TOWER = 130


@registry.dialog("info/tower")
def tower_panel(host, centre, on_close=None):
    k = kit(host.app)
    return Panel(k, host.app.input, panel_rect(centre), POPUP,
                 two_lines(k, k.text.S(TOWER, 0), k.text.S(TOWER, 1)), on_close)


@registry.right_click("tower")
def tower(host, square, centre):
    return registry.open_dialog("info/tower", host, centre=centre)
