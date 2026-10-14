"""Right-click on a map square without a shown stack, city, site or sign: the terrain panel.

Evidence: ovl46:0000 (asm 0181..0316).  The terrain type is SCN 0x710[tile], taken as 0
(Road) when the road layer has a piece (19d9 & 0x1f); a port square (map bit 0x80) shows the
two EXE strings DS:1058 / DS:105d, any other square STRING (128, type) as the title and
(129, type) as the text, through ovl46:1201(x, y, 1) and ovl46:10e1.  Nothing else (no
movement cost) is shown.
"""
from __future__ import annotations

from ...assets.exe import ds_str
from ...model.ids import MAP_PORT, MAP_W, ROAD_PIECE_MASK, Terrain
from .. import registry
from ..widgets import kit
from . import POPUP, Panel, panel_rect, two_lines

PORT_TITLE, PORT_TEXT = 0x1058, 0x105D
NAMES, TEXTS = 128, 129


def terrain_type(world, x: int, y: int) -> int:
    """ovl46:0000's type: SCN 0x710[tile], Road (0) when the road layer is set."""
    i = y * MAP_W + x
    return int(Terrain.ROAD) if world.roads[i] & ROAD_PIECE_MASK else world.terrain_of_tile[world.tiles[i] & 0xFF]


def texts(k, world, x: int, y: int) -> tuple[str, str]:
    if world.flags[y * MAP_W + x] & MAP_PORT:
        return ds_str(k.exe, PORT_TITLE), ds_str(k.exe, PORT_TEXT)
    t = terrain_type(world, x, y)
    return k.text.S(NAMES, t), k.text.S(TEXTS, t)


@registry.dialog("info/terrain")
def terrain_panel(host, square, centre, on_close=None):
    k = kit(host.app)
    return Panel(k, host.app.input, panel_rect(centre), POPUP, two_lines(k, *texts(k, host.state.world, *square)),
                 on_close)


@registry.right_click("terrain")
def terrain(host, square, centre):
    return registry.open_dialog("info/terrain", host, square=square, centre=centre)
