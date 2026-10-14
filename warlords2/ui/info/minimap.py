"""Right-click on the overview map.

Evidence: area 1 of the dispatcher, res_0726:0186: square ((px - 400) / 2, (py - 30) / 2); a
press that is not the left button finds the nearest city ovl62:04fa(x, y, 0xe, 1) (any owner,
trunc(sqrt(dx^2 + dy^2)) by 0a8b:0acc strictly below the best so far from 1000, first found
wins; with Hidden Map only cities with one of their four squares passing ovl64:15ff), then,
when the clicked square passes ovl64:15ff(1, x, y), opens ovl46:1201(pointer, 0) (POPUP.PCK
256x75 around the pointer) and draws the city's info ovl46:0c73(city), which is M6b's
(`registry.right_click("city")`, called with the city index and the pointer).  It shows no
terrain or army.  Not established: what happens with no city found (-1; no guard in
0186..021f or at the start of 0c73) - nothing opens here then.
"""
from __future__ import annotations

from ...rules.pathfinding import distance
from .. import registry
from ..widgets import kit
from . import POPUP, Panel, panel_rect, visible

FAR = 1000


def nearest_city(state, sp, view_origin, x: int, y: int) -> int:
    best, found = FAR, -1
    for i, c in enumerate(state.cities):
        if state.options.hidden_map and not any(visible(state, sp, view_origin, c.x + dx, c.y + dy)
                                                for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1))):
            continue
        d = distance((x, y), (c.x, c.y))
        if d < best:
            best, found = d, i
    return found


@registry.dialog("info/minimap")
def minimap_panel(host, city, pos, on_close=None):
    """The frame of ovl46:1201(pointer, 0); its city lines are ovl46:0c73's (M6b)."""
    k = kit(host.app)
    return Panel(k, host.app.input, panel_rect(pos), POPUP, lambda fb, left, top: None, on_close)


@registry.right_click("minimap")
def minimap(host, square, pos):
    st, sp, origin = host.state, host.sprites, host.view.origin
    c = nearest_city(st, sp, origin, *square)
    if c < 0 or not visible(st, sp, origin, *square):
        return None
    city = registry.right_click_handler("city")
    if city is not None:
        return city(host, c, pos)
    return registry.open_dialog("info/minimap", host, city=c, pos=pos)
