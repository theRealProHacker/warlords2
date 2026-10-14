"""Mouse and keyboard help pages, and the item help page.

Evidence:
* button 188 (action palette) -> 07be:04d8 -> ovl61:104e: HMOUSE.GFX, then
  HKEYS.GFX, each through ovl61:16f5 (popup type 4 at (120, 50), script origin
  (120, 50)), each dismissed by a key or a mouse release; no paging, no buttons.  The
  two file names are read from the EXE (DS:2ae1, DS:2af1).
* command 496 -> 07be:0b05 (a case of 07be:04d8) -> ovl35:0f4e: HELP\\HITEM.GFX (FILE.DAT group 69) through
  ovl61:168d (popup type 0x0e + #D, origin = the popup's position).
"""
from __future__ import annotations

from ...assets.exe import ds_str
from .. import registry
from ..gfxpage import HELP_POPUP, GfxPages
from ..widgets import kit

HELP_FILES = (0x2AE1, 0x2AF1)
HITEM_FILE = (69, 0)                        # FILE.DAT (group, index)


def help_files(k) -> list[str]:
    return [ds_str(k.exe, o) for o in HELP_FILES]


@registry.dialog("help_page")
def help_page(host, on_close=None):
    k = kit(host.app)
    return GfxPages(k, [k.store.read(n) for n in help_files(k)], popup=HELP_POPUP, on_close=on_close)


@registry.dialog("help_items")
def help_items(host, on_close=None):
    k = kit(host.app)
    return GfxPages(k, [k.store.read(k.files.get(*HITEM_FILE))], on_close=on_close)


@registry.action(188)
def show_help(host):
    registry.open_dialog("help_page", host)


@registry.action(496)
def show_item_help(host):
    registry.open_dialog("help_items", host)
