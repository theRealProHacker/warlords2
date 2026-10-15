"""Rename City (city screen Build page, button 203): the input box of ovl56:0000
(`ui.text_input.InputBox`, shared with the Save Game description, register X52).

Evidence (asm ovl45:2013 / 204d / 206f, ovl56; texts and positions read from the user's EXE):
* ovl45:2013: ovl56:0000(DS:1003, DS:100f, DS:1025, the city's name, ok 3064:0070 = ovl45:204d,
  cancel 3064:0075 = ovl45:206f, 1, 15, 0x80);
* ovl56:0000: DS:166a = 1, DS:58d0 = 0 (input variant), DS:58ce = 1 (Cancel live), DS:58d4 = 15
  (the editor's length limit), DS:58d2 = 0x80 (its width limit); the name copied to DS:58d8;
  ovl56:00e2 draws popup type 1, SetFont(1, 15, 0, 3) the title centred at DS:2368, SetFont(2,
  15, 0, 3) the two lines centred at the points of DS:2318 + 16 * 4 (two lines below the title:
  si = 2 + 2), and the field ovl59:0058(DS:236c, DS:58d8): colour 3, bevel 14d0:02e5(4, 2), the
  text opaque at (x + 3, y + 2); JOIN screen 5; ovl56:02c7: 189 and 190 normal, 191 normal;
* 191 (the field) -> ovl56:037c -> 03a6(DS:236c, DS:58d8, 15, 0x80): the field's inside (x + 1,
  y + 1, w - 2, h - 2) in colour 3, typing from empty at (x + 3, y + 2), the cursor DS:2375 at
  text width + 5 (its ink alternates 15 / 9 each time the key poll ovl59:020d returns: on a key,
  or when its poll count (1000 / 20000) or a time test on 0000:1bf0 (emulated floating point,
  not decoded) ends; drawn steady in 15 here); Return keeps the typed text (also when empty), Escape the old one; Backspace;
  characters 0x20..0x7a while fewer than 14 are typed and the text before the new character is
  narrower than 0x80 px;
* 189 -> ovl56:0312(1): close, ok(DS:58d8) = ovl45:204d: the name copied into the city
  (`RenameCity`), ovl45:0393; 190 -> ovl56:0312(0): close, cancel = ovl45:206f -> ovl45:0393
  (ovl45:0000(1, DS:0e9a, DS:0e9c), the Build page again);
* keys outside the editor (07be:0064 with DS:166a set, `ui.keys`): Esc presses 190, Return 189
  (DS:1514 / DS:155c); 'A'..'Z' nothing; every other key the chord.
"""
from __future__ import annotations

from ...assets.exe import ds_str
from ...model import commands as C
from .. import registry
from ..text_input import FIELD, NO, POPUP, SCREEN, YES, InputBox  # noqa: F401
from ..widgets import kit

TITLE, LINE1, LINE2 = 0x1003, 0x100F, 0x1025
NAME_LEN, NAME_WIDTH = 15, 0x80


class RenameCity(InputBox):
    def __init__(self, k, screen, on_close=None):
        exe = k.exe
        super().__init__(k, ds_str(exe, TITLE), [ds_str(exe, LINE1), ds_str(exe, LINE2)], screen.city.name,
                         NAME_LEN, NAME_WIDTH, True, on_close)
        self.screen = screen

    @property
    def name(self) -> str:                               # DS:58d8
        return self.text

    @property
    def host(self):
        return self.screen.host

    def answer(self, yes: bool) -> None:
        """ovl56:0312 -> ovl45:204d / 206f."""
        from .production import BUILD
        scr = self.screen
        self.close(yes)
        if yes:
            scr.command(C.RenameCity(scr.ci, self.text))
        scr.reopen(BUILD)


@registry.dialog("rename_city")
def rename_city(host, screen, on_close=None):
    return RenameCity(kit(host.app), screen, on_close)
