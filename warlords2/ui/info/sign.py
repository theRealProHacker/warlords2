"""Right-click on a signpost square (terrain type 9): the wooden sign.

Evidence: ovl46:0000 sends terrain type 9 to ovl46:0a1c(x, y) (before the port test and
without ovl46:1201): 131a(x, y, 1) places 256x75 on the square, picture 0x24 (POPUP2.PCK)
from (0, 0) through its mask; the lines come from ovl13:0000(x, y), which reads CURRENT.SGN
(u16 count, 104-byte records x, y, line1[50], line2[50]) until x and y match - the scenario's
signs as the game holds them (`World.signs`).  No match leaves both lines empty, and two empty
lines become line 1 = sprintf(DS:03c2, x, y).  One SetFont(2, 15, 0, 3) (ovl46:0b49) for
both lines, centred at (left + 120, top + 11) and (left + 120, top + 35).
Not established: what is shown when CURRENT.SGN cannot be opened (ovl13:0000 leaves the
buffers unwritten); signs are always in memory here.
"""
from __future__ import annotations

from ...assets.exe import ds_str
from ...assets.text import printf
from .. import registry
from ..widgets import kit
from . import POPUP2, TEXT_INK, Panel, panel_rect, two_lines

NO_TEXT = 0x03C2


def lines(k, world, x: int, y: int) -> tuple[str, str]:
    for s in world.signs:
        if (s.x, s.y) == (x, y):
            l1, l2 = s.line1, s.line2
            break
    else:
        l1 = l2 = ""
    if not l1 and not l2:
        l1 = printf(ds_str(k.exe, NO_TEXT), x, y)
    return l1, l2


@registry.dialog("info/sign")
def sign_panel(host, square, centre, on_close=None):
    k = kit(host.app)
    return Panel(k, host.app.input, panel_rect(centre), POPUP2,
                 two_lines(k, *lines(k, host.state.world, *square), title_ink=TEXT_INK), on_close)


@registry.right_click("sign")
def sign(host, square, centre):
    return registry.open_dialog("info/sign", host, square=square, centre=centre)
