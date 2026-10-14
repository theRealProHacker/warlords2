"""Tutorial pop-up pages TUTORIA\\T*.GFX (rendering only; when they show is M8a's).

Evidence: the file is FILE.DAT group 25, index n (0 THERO .. 10 TFRESULT); every call
site goes through ovl61:168d: popup type 0x0e + the page's #D number (0 -> type 0x0e at
(256, 40); THERO, TPROD, TPROD2 carry #D001 -> type 0x0f at (32, 40)), script origin =
the popup position, dismissed by a key or a mouse release (ovl61:10fb).
"""
from __future__ import annotations

from .. import registry
from ..gfxpage import GfxPages
from ..widgets import kit

TUTORIAL_GROUP = 25


@registry.dialog("tutorial_page")
def tutorial_page(host, index: int, on_close=None):
    k = kit(host.app)
    return GfxPages(k, [k.store.read(k.files.get(TUTORIAL_GROUP, index))], on_close=on_close)
