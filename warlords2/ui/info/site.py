"""Right click on a site square without a city (ovl46:0000 with button 2 -> ovl46:0fd7).

Evidence (asm ovl46, read from the user's EXE):
* ovl46:0000 (0181..030c): with no army shown on the square and terrain 11 without a city
  (ovl62:044a < 0): ovl46:1201(x, y, 1) (POPUP.PCK 256x75 around the square's centre, `ui.info`),
  s = ovl62:04b5(x, y), ovl46:0fd7(s), DS:1174 = 1 (closed when no button is held);
* ovl46:0fd7(s): SetFont(2, SCN 0x0a0[p], SCN 0x0b0[p], 3) (the side's colours, 0fdf..100f), the
  site's name (2c04:0815 + 0x1f s) centred at (L + 120, T + 11); SetFont(2, 15, 0, 3) (1044); a
  temple (kind 1): DS:10e5 centred at (L + 120, T + 35); else by the map word bit 0x4000 of the
  square: clear DS:10f9 at (L + 120, T + 35), set DS:1105 at (L + 120, T + 33) (10d1..10db).
"""
from __future__ import annotations

from ...assets.exe import ds_str
from ...assets.fonts import CHANCE17
from ...model.ids import MAP_EXPLORED, MAP_W, SiteKind
from .. import registry
from ..widgets import kit, text_centred
from . import POPUP, Panel, panel_rect

TEXT_X, TITLE_Y, TEXT_Y, EXPLORED_Y = 120, 11, 35, 33
TEMPLE, UNEXPLORED, EXPLORED = 0x10E5, 0x10F9, 0x1105
SCN_INK, SCN_SHADOW = 0xA0, 0xB0
INK, SHADOW = 15, 0


def site_content(k, state, si: int):
    s = state.sites[si]
    p = state.current
    ink, shadow = state.flags.get(SCN_INK + 2 * p, 0), state.flags.get(SCN_SHADOW + 2 * p, 0)
    if s.kind == SiteKind.TEMPLE:
        text, y = ds_str(k.exe, TEMPLE), TEXT_Y
    elif state.world.flags[s.y * MAP_W + s.x] & MAP_EXPLORED:
        text, y = ds_str(k.exe, EXPLORED), EXPLORED_Y
    else:
        text, y = ds_str(k.exe, UNEXPLORED), TEXT_Y

    def content(fb, left, top):
        f = k.fonts[CHANCE17]
        text_centred(fb, f, left + TEXT_X, top + TITLE_Y, s.name, ink, shadow)
        text_centred(fb, f, left + TEXT_X, top + y, text, INK, SHADOW)
    return content


@registry.dialog("info/site")
def site_panel(host, site: int, centre, on_close=None):
    k = kit(host.app)
    return Panel(k, host.app.input, panel_rect(centre), POPUP, site_content(k, host.state, site), on_close)


@registry.right_click("site")
def site(host, site: int, centre):
    if site < 0:
        return None
    return registry.open_dialog("info/site", host, site=site, centre=centre)
