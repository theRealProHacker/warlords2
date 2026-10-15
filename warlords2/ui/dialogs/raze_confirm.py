"""Raze City (city screen Build page, button 205): the confirmation and its answers.

Evidence (asm ovl32, ovl56; texts read from the user's EXE):
* ovl32:0000: DS:4124 = 0, DS:4122 / 4120 = DS:0e9a / 0e9c; sprintf(DS:0a6c, city name);
  ovl56:0088(DS:0a75, DS:0a7f, DS:0a95, that line, DS:0a9d, yes 300b:0025, no 300b:002a): the
  four-line confirmation box (`ui.dialogs.confirm`, popup 1, JOIN screen 5);
* yes ovl32:0061 (`RazeOwnCity`: infamy rnd(1, 25, 0) + 25, ovl32:00fe -> 016b the raze, the
  recounts ovl62:03f9 / 02bf / 0372); ovl32:00fe also redraws the overview (ovl63:0000(1, 1,
  NULL), here the game frame's) and, with DS:4124 set (never here), shows "%s is in ruins!";
  then ovl45:0000(0, DS:0e9a, DS:0e9c): City Info of the razed city;
* no ovl32:00d3: ovl45:0000(1, DS:0e9a, DS:0e9c), the Build page again;
* keys (07be:0064 with DS:166a set, `ui.keys`): Esc presses 190 (no), Return 189 (yes): the
  first live normal button of DS:1514 / DS:155c; 'A'..'Z' nothing; every other key the chord.
"""
from __future__ import annotations

from ...assets.exe import ds_str
from ...assets.text import printf
from ...model import commands as C
from .. import registry
from ..widgets import kit
from .confirm import Confirm

TITLE, LINE1, LINE2, LINE3_FMT, LINE4 = 0x0A75, 0x0A7F, 0x0A95, 0x0A6C, 0x0A9D


class RazeConfirm(Confirm):
    def __init__(self, k, screen, on_close=None):
        exe = k.exe
        name = screen.city.name
        lines = [ds_str(exe, LINE1), ds_str(exe, LINE2), printf(ds_str(exe, LINE3_FMT), name),
                 ds_str(exe, LINE4)]
        super().__init__(k, ds_str(exe, TITLE), lines, on_close)
        self.screen = screen

    @property
    def host(self):
        return self.screen.host


def answered(screen, yes: bool) -> None:
    """ovl32:0061 / ovl32:00d3."""
    from .production import BUILD, INFO
    if yes:
        screen.command(C.RazeOwnCity(screen.ci))
        screen.reopen(INFO)
    else:
        screen.reopen(BUILD)


@registry.dialog("raze_confirm")
def raze_confirm(host, screen, on_close=None):
    def done(yes):
        answered(screen, bool(yes))
        if on_close:
            on_close(yes)
    return RazeConfirm(kit(host.app), screen, done)
