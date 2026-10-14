"""Right press on the map frame around the view (area 13 of the dispatcher).

Evidence: res_0726:026d: a left press there starts the map drag (ovl61:0e04, DS:1176); any
other button opens ovl46:1201(pointer, 0) (POPUP.PCK 256x75 around the pointer) with
ovl46:10e1(DS:117c, DS:118c) (0726:0294..02aa, 045c) and sets DS:1174.
"""
from __future__ import annotations

from ...assets.exe import ds_str
from .. import registry
from ..widgets import kit

TITLE, TEXT = 0x117C, 0x118C


@registry.right_click("frame")
def frame(host, _id, pos):
    exe = kit(host.app).exe
    return registry.open_dialog("info/text", host, title=ds_str(exe, TITLE), text=ds_str(exe, TEXT), pos=pos)
