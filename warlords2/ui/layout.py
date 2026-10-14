"""Screen layouts from DATA/JOIN.DAT, AREA.DAT and BUTTON.DAT (docs/formats/tables.md
section 6; loader ovl53:02cd, screen activation ovl53:056a).

Activating screen n finds the JOIN record with `screen == n`; it names one BUTTON.DAT
group and one AREA.DAT group.  Records are kept as decoded by `formats.tables` plus
the rectangle as (x, y, w, h).  Record 0 of every group is all zero and is dropped.

Button image states (Evidence: EXE 0771:0001 blits the source pair at record
+0x13 + 4 * state, state = byte +4): 0 = pressed, 1 = normal, 2 = disabled.  The
reference captures agree (SHOT 00, SHOT 09: mean error per channel below 0.3 at the
buttons' screen rectangles for the normal, chosen and greyed buttons shown there).
The remaining BUTTON bytes 2-5 and 12-18 stay open (register G5); AREA `mask` bit i
enables area record i (ovl53:056a, tables.md section 6).
"""
from __future__ import annotations

from dataclasses import dataclass

from ..formats.tables import parse_area, parse_button, parse_join

Rect = tuple[int, int, int, int]

PRESSED, NORMAL, DISABLED = 0, 1, 2           # index of the source pair per state


@dataclass(frozen=True)
class Button:
    id: int
    rect: Rect
    sources: tuple[tuple[int, int], tuple[int, int], tuple[int, int]]
    picture: int                              # FILE.DAT group-3 index; 0 = no picture

    def contains(self, pos: tuple[int, int]) -> bool:
        x, y, w, h = self.rect
        return x <= pos[0] < x + w and y <= pos[1] < y + h

    def source(self, state: int) -> Rect:
        sx, sy = self.sources[state]
        return sx, sy, self.rect[2], self.rect[3]


@dataclass(frozen=True)
class Area:
    id: int
    rect: Rect

    def contains(self, pos: tuple[int, int]) -> bool:
        x, y, w, h = self.rect
        return x <= pos[0] < x + w and y <= pos[1] < y + h


@dataclass(frozen=True)
class ScreenLayout:
    screen: int
    buttons: tuple[Button, ...]
    areas: tuple[Area, ...]
    area_mask: int                            # AREA.DAT group `mask`: bit i enables area i

    def button(self, id: int) -> Button:
        for b in self.buttons:
            if b.id == id:
                return b
        raise KeyError(id)

    def area(self, id: int) -> Area:
        for a in self.areas:
            if a.id == id:
                return a
        raise KeyError(id)


class Layouts:
    def __init__(self, join: bytes, area: bytes, button: bytes):
        self.join = {r["screen"]: r for r in parse_join(join)}
        self.area_groups = {g["id"]: g for g in parse_area(area)}
        self.button_groups = {g["id"]: g for g in parse_button(button)}

    def screen(self, n: int) -> ScreenLayout:
        j = self.join[n]
        bg = self.button_groups[j["button_group"]]["buttons"]
        ag = self.area_groups[j["area_group"]]
        buttons = tuple(
            Button(r["id"], (r["x"], r["y"], r["w"], r["h"]),
                   tuple(zip(r["src_xy"][0::2], r["src_xy"][1::2])), r["pck_index"])
            for r in bg if r["id"])
        areas = tuple(Area(r["id"], (r["x"], r["y"], r["w"], r["h"])) for r in ag["areas"] if r["id"])
        return ScreenLayout(n, buttons, areas, ag["mask"])

    def find_button(self, id: int) -> tuple[int, Button]:
        """(screen, button) of the first screen whose group holds this button id (no id
        has two different rectangles in the shipped BUTTON.DAT)."""
        for n in sorted(self.join):
            for b in self.screen(n).buttons:
                if b.id == id:
                    return n, b
        raise KeyError(id)
