"""The city screen (ovl45): popup type 2 with the strategic map on its left and the pages City Info
(mode 0, `ui.dialogs.city_info`), Build (1), Production (2) and Vectoring (3) on its right, the tab
strip 193-196 and Done; the Build Production dialog (ovl44:0978, JOIN screen 23).  Mode 4 (a
site, ovl45:0cdf) is M7b's and not drawn here.

Evidence (asm ovl45, ovl44, ovl63, ovl17, ovl16; DGROUP tables and texts read from the user's EXE;
DS:0e92 mode, 0e94 vector action, 0e96 See All, 0e98 city, 0e9a / 0e9c its square, 0e9e the chosen
type, 0e86 the build slot are the dialog's fields of the same names below):

Open ovl45:0000(mode, x, y): DS:0e94 = 0; mode 0: the nearest city of any owner ovl62:04fa(x, y,
0x0e, 1) (strictly nearest by 0a8b:0acc from 1000, first in table order; with Hidden Map only
cities with one of their four squares passing ovl64:15ff), nothing unless one of its four
squares passes ovl64:15ff(1); modes 1-3: the nearest own city ovl62:04fa(x, y, SCN 0x110, 1), and
DS:0e9e = its current type while +0x2d > 0, else -1.  The same mode and city while the screen is
up (DS:166a) only refreshes the buttons (ovl45:03a9), except mode 1.  Else: 06de(1) (popup 2 on
the first open: ovl17:0000(2)), the map ovl45:1a9b, JOIN screen 6 (every button hidden until
03a9 makes it live), DS:166a = 1, 03a9; with SCN 0x12e: byte 0x134 bit 1 clear -> set, FILE.DAT
(25, 1) through ovl61:168d; bit 5 clear and the side owns 2 or more cities (DS:5dea) -> set,
(25, 6).  No city found: nothing opens (the EXE reads city record -1 first; for mode 0 also its
squares).

Popup 2 (ovl17:0000): marble (DS:2a8c = 224, 0, 256, 312) at (304, 60), the frame of the whole
rectangle (80, 60, 480, 312) (`Kit.draw_popup`'s outline and shadow); the map goes to (80, 60)
(ovl17:08c7 = 0x50 while popup 2 is on top, ovl63:0000 / 04d3).

Buttons ovl45:03a9: area 14 enabled in mode 0 only; tabs 193-196: the mode's tab pressed (state
0), the others normal; 194-196 disabled when the side owns no city (DS:5dea) or the city is not
SCN 0x110's.  Mode 2: 197-200 and 201 normal, 202 (Stop) normal while +0x2d > 0 else disabled,
192 hidden; other modes: 192 normal, 201, 202, 197-200 hidden.  Mode 3: DS:0e96 set -> 216
normal, 212 hidden, else 212 normal, 216 hidden; n = ovl44:0410(city) incoming sources;
DS:0e94 0: 210 (normal while +0x2d > 0), 211 (normal while n > 0), 214 and 215 hidden; 1: 214
normal, 211 normal while n > 0 else disabled (05df..05f1), 210 and 215 hidden; 2: 210, 215 normal, 214 and 211 hidden.  Other modes: 210-212
hidden.  Mode 1: 203, 205, 204 normal, else hidden.  Dispatch 07be:04d8 (table 07be:0b0c):
192 / 201 -> ovl45:02e1 close; 193 / 194 / 195 / 196 -> ovl45:0000(0 / 1 / 2 / 3, DS:0e9a,
DS:0e9c); 197-200 -> ovl44:00c8(id - 197); 202 -> ovl44:0185; 203 -> ovl45:2013 rename
(`rename_city`); 204 -> ovl44:0978 Build Production; 205 -> ovl32:0000 raze (`raze_confirm`);
210-212 / 214-216 -> ovl44:050e(id - 210 / id - 214).  Keys 07be:0064 with DS:166a set
(`ui.keys`): Esc / Return press the first live button of DS:1514 / DS:155c (192 / 201);
'A'..'Z' nothing; every other key the chord: 07be:03ef returns 1 for every key while DS:166a
is set, so the switch 07be:0337 is never reached ('b' / 'c' / 'p' / 'v', which open the pages
from the main map, 07be:019a / 01b5 / 0210 / 024d, chord here), and Del (07be:03ef ->
07be:0e26(0)) finds the zero record 0 of the screen's table and chords too.  A left press on
a disabled or pressed button chords (07be:0e7b).  The same holds on the Build Production
screen and on the rename / raze boxes outside the editor.

Close ovl45:02e1: ovl17:069c, ovl61:011f(1, 1, 1) (screen 0, the palette refresh ovl61:0174, map,
overview, stack palette); with SCN 0x12e: byte 0x134 bit 2 clear -> set, page (25, 2).

Map ovl45:1a9b: modes 0 / 1 ovl63:0000(1, 1, NULL) (the strategic bitmap with Hidden Map through
the seen mask over colour 0, then the city markers ovl63:0ed7) and ovl63:0ed7(NULL, city) (the
markers again, each city's marker followed by the colour-15 box of the open city: lines of 10 at
(2x - 2, 2y - 2), (2x - 2, 2y + 8) and columns of 10 at 2x - 2, 2x + 8), then ovl63:04d3(NULL);
modes 2 / 3 ovl44:08e4: ovl63:08df(NULL, city, -2), or in mode 3 with DS:0e96 set
ovl63:1817(NULL, city), then 04d3.  ovl63:04d3 copies the buffer DS:6795 to the popup; with
Hidden Map it first draws colour-3 lines over its top row, left column and bottom row.
ovl63:08df(rect, city, filter): the bitmap (seen mask with Hidden Map), then each city of SCN 0x110,
skipped when filter is -1 and ovl44:0410 counts 4 or more sources for it, or filter >= 0 and that
count + filter exceeds 4, unless it is the open city: ATRANS2 marker DS:2c76[k] (k = 0 producing,
3 idle; 4 / 6 for the open city) at ((2x - 2) & ~7, 2y - 1), the copy pre-shifted by (2x - 2) & 7
(7 -> 6), through its mask; then for the open city: vectoring to the standard (+0x33 = -2) ->
the standard ovl63:1f5f(sx, sy, 1) and a colour-7 line from (2x + 2, 2y + 2) to (2 sx, 2 sy);
vectoring to a city -> its marker k = 1 (producing) / 5 and a colour-7 line between the two
centres; every source of ovl44:0410(city) marker 2 and a colour-8 line; finally the standard
ovl63:1f5f(sx, sy, 0) when it is on the map and was not drawn.  ovl63:1817 (See All): every own
city once (k 0 / 3; 2 while vectoring; 1 / 5 while it has sources), its vector (destination
marker 1 / 5 and a colour-7 line, or the standard flag), its sources (marker 2, colour-8 lines),
each drawn city remembered; the standard (flag 1 when some city vectors to it, with colour-8
lines from each such city, else 0); the box of the open city in colour 15, lines of 11 at
(2x - 3, 2y - 2) and (2x - 3, 2y + 9), columns at 2x - 3 and 2x + 8.  ovl63:1f5f(x, y, k):
ATRANS2 DS:2cae[k] at (max(0, (2x - 2) & ~7), max(0, 2y - 6)).  Lines 1133:00b8: the points are
put in order (y first, then x), nothing for a single point, the major axis steps one pixel at a
time and the error is added before each pixel, so a 45-degree line starts one step in.

Pages ovl45:06de (`draw_page`): 0 `city_info.draw`; 1 (ovl45:1769) its header and STRING
(119, 0..1), (120, 0..1), (121, 0..1) at DS:0fa8 + 4 i; 2 (ovl45:0ef8): name, the crown
ovl64:0bf7(p, 4) at (0x138, 0x6e), STRING (117, 0) right-aligned at DS:0f8c + (8, 0), the current
type's icon (ring 1) at DS:0f90 and "%dt" (DS:0fc4) of +0x2d or "-" (DS:0fc8): vectoring ->
+ STRING (117, 1) at DS:0f98 and the destination's name, (117, 2) for the standard on the map,
(117, 3) without it, at DS:0f9c; else at DS:0f94; the filled slots packed at DS:0f78[k], ring
SCN 0x110 + 2 for the chosen type, else 1; for a chosen type ovl16:0000(DS:0f88, type, 1, the
slot's time, cost, strength, moves): BIGARMY.PCK DS:05fe opaque at (x, y + 10), the type's name
and "Time: %d" (DS:060e), "Cost: %d" (0617), "Strength: %d" (0620), "Move: %d" (062d) at
x + DS:060a, y + 10 / 0x28 / 0x3c / 0x50 / 0x64; 3 (ovl45:12b7): name, STRING (154, 0)
right-aligned at (0x168, 0x6d), the current icon at (0x170, 0x67) with (154, 1) % +0x2d or "-"
(DS:0fca) at (0x198, 0x6d); the outgoing armies of the city (home city, owner SCN 0x110, off the
map at x -1 with the vector destination of the city's target, or x -2) by transit state 0x65 at
(0x1b0, 0x67) and others at (0x1d8, 0x67), the last army record in table order (scanned from the
end) winning; the incoming armies of every source (home = the source, x -1, destination = this
city, owner SCN 0x110) in the rows "Next turn" (not 0x65, y 0x95) and "Turn after" (0x65, y
0xb6) at x 0x190 + 0x28 i, at most 4 each (owner SCN 0x110), labels (154, 2) / (154, 3)
right-aligned at (0x188, 0x9b) / (0x188, 0xbc); then ovl44:0638(0), (1): the marble under
(368, 221, 188, 40) / (368, 272, 188, 40) restored, STRING (155, 2..3) with DS:0e94 1, else
(155, 0..1) at (0x170, 0xdd) / (0x170, 0xf1); (156, 2..3) with DS:0e94 2, else (156, 0..1) at
(0x170, 0x110) / (0x170, 0x124).  The EXE draws the pages and the map only at these calls, so
what they show is kept until the next one (an ovl45:0000 for the same city only refreshes the
buttons): the dialog keeps its picture in `canvas`.

Map clicks: area 6 (80, 60, 224, 312) on every poll while a button is held (0726:030e): square
((px - 80) / 2, (py - 60) / 2) -> ovl45:1afa(x, y, button): a right press (no panel up) opens
ovl46:1201(pointer, 0) + 10e1 with STRING (122, 0 / 1) in modes 0 / 1, (122, 4 / 5) in mode 2,
(122, 6 / 7) in mode 3; a left one: modes 0 / 1 -> ovl45:0000(mode, x, y); mode 2 ->
ovl44:028b; mode 3 -> ovl44:072e.  ovl44:028b(x, y, b): b = 1 without Shift (BIOS 0x417 & 3)
and DS:0e94 = 0: the nearest own city ovl62:04fa(x, y, SCN 0x110, 0) if not the open one ->
ovl45:0000(2, x, y), then 03a9; else nothing unless +0x2d > 0; the target ovl62:0651(x, y) (nearest
own city, or SCN 0x110 + 100 when the standard is nearer); the city itself switches vectoring off;
a target with 4 or more sources (ovl44:0410) is refused (03a9 only); else vectoring on to the
target (`SetVector`); redraw 06de(0), 1a9b, 03a9.  ovl44:072e(x, y, b): b = 1 with Shift ->
028b, DS:0e94 = 0; else target = ovl62:0651, its source count m, the open city's sources (n, list);
DS:0e94 2 with n > 0, n + m <= 4 and the target not among the sources: every source to the target
(`RedirectVectors`, whose refusal is the EXE's doing nothing; the EXE also compares the four list
words past n, stack garbage, not modelled); DS:0e94 1 -> 028b(x, y, b); then ovl45:0000(3) on the open city (DS:0e94 1 or a
standard target) or the target, ovl44:08e4, 0638(0), 0638(1), 03a9.  ovl44:050e(n): n 2 toggles
DS:0e96 and redraws the map (08e4); n 0: DS:0e94 0 -> 1 (map 08df(-1), 0638(0)), 1 -> 0 (08e4,
0638(0)), 2 -> 1 (08df(-1), 0638(0), 0638(1)); n 1: 0 -> 2 (08df(n), 0638(1)), 1 -> 2 (08df(n),
0638(0), 0638(1)), 2 -> 0 (08e4, 0638(1)); then 03a9.

Production ovl44:00c8(i): a filled slot -> DS:0e9e = its type; then 00ff: +0x2c = DS:0e9e, +0x2d =
the time of slot ovl44:0000(DS:0e9e) (`SetProduction` of that slot; an empty slot clicked runs
00ff with the remembered DS:0e9e: `ChooseProduction(city, DS:0e9e)`, also for -1); redraw 06de(0), 1a9b, 03a9.  Stop ovl44:0185:
`SetProduction(city, -1)`, DS:0e9e = -1, redraw.

Build Production ovl44:0978: DS:0e86 = from slot 4 down the first k with slot k empty and k - 1
filled, else 0; popup type 0x0b, ovl44:09da(0), JOIN screen 23, ovl44:0dae.  09da: SetFont(1, 15,
0, 3) STRING (112, 0) centred at (320, 64); ovl64:0bf7(SCN 0x110, 0) at (0x58, 0x40) and (0x200,
0x40); SetFont(2, 15, 0, 3): (112, 1) % (side name, city name) centred at (320, 104), (112, 2) % gold
centred at (0x160, 0x16d), (112, 3) centred at (0xb0, 0x15c); slots i at (0x68 + 40 i, 0x172):
ovl64:08be(type, SCN 0x110, ring SCN 0x110 + 2), empty ones type -1 ring 1; the rectangle
(0x66 + 40 i, 0x170, 0x25, 0x23) outlined in colour 3 and again one pixel up and left, for
DS:0e86 in 0 and then 9; the offered types (records 0..27 of ARMYTYPE with w4 >= 0, ovl44:1128)
k at (0x58 + 0x78 (k % 4), 0x88 + 0x1f (k / 4)), ring 1, greyed when in a slot or gold < w4,
"%d gp" (DS:0e8c) of w4 at (0x80 + 0x78 (k % 4), 0x8e + 0x1f (k / 4)).  Buttons 0dae: 396
normal; 397-400 normal when slot 3 is filled, else disabled; 401 + k for the offered types:
disabled when in a slot or gold < w4, else normal; the rest hidden.  396 -> ovl44:0eca:
ovl44:1544 (the leading filled slots stably sorted by |w4|, `SortSlots`, on every close), close, ovl45:0000(1) (DS:0e9a,
DS:0e9c); 397-400 -> ovl44:1112(i): DS:0e86 = i, redraw; 401 + k -> ovl44:0ee3(k):
`BuyProduction(city, type, DS:0e86)`, then DS:0e86 + 1 when it is below 3 and that slot is
empty (10c8..10e7); redraw.

The tutorial tails ovl45:025d..02da (open) and 02f9..0336 (close) are the command
`ScreenTutorial`; the engine writes the bits of SCN byte 0x134 and returns the pages.  HLP
selectors 1-4 (ovl15:00df: slot word2 - 1 of DS:0e98, filled -> ovl46:032a at the pointer) and
5-24 (ovl44:11f4(1, word2 - 5): the k-th offered type) open their own panels.
"""
from __future__ import annotations

import numpy as np
import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...assets.text import printf
from ...model import commands as C
from ...model import events as E
from ...model.ids import MAP_H, MAP_W, ROAD_SEEN
from ...rules.bonuses import s8
from ...rules.pathfinding import distance
from .. import registry
from ..dialog import Dialog
from ..info import POPUP as PANEL_PICTURE, Panel, panel_rect, two_lines, visible
from ..info.city import capital_of, shield
from ..keys import code_of, left_press, popup_input, popup_key, right_help
from ..layout import DISABLED, NORMAL, PRESSED
from ..menubar import with_codes
from ..screen import IDENTITY
from ..typename import type_name
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from . import city_info
from ...assets.store import cache_load


# ------------------------------------------------------------------ ids and modes
INFO, BUILD, PRODUCTION, VECTOR, SITE = 0, 1, 2, 3, 4
POPUP, SCREEN = 2, 6
DONE, INFO_TAB, BUILD_TAB, PROD_TAB, VECTOR_TAB = 192, 193, 194, 195, 196
SLOTS = (197, 198, 199, 200)
DONE2, STOP, RENAME, BUILD_PROD, RAZE = 201, 202, 203, 204, 205
VECTOR_NEW, VECTOR_MOVE, SEE_ALL = 210, 211, 212
VECTOR_NEW_ON, VECTOR_MOVE_ON, SEE_ALL_ON = 214, 215, 216
TABS = (INFO_TAB, BUILD_TAB, PROD_TAB, VECTOR_TAB)
AREA_MAP, AREA_SLOTS = 6, 14
ANY_OWNER = 0x0E                                  # ovl62:04fa owner filter "any"
FAR = 1000                                        # ovl62:04fa best distance at start
STANDARD_DEST = 100                               # ovl62:0651: SCN 0x110 + 100
MAX_SOURCES = 4                                   # ovl44:028b (0361), ovl63:08df (0a12 / 0a43)
SCN_VIEW_CX, SCN_VIEW_CY = 0x17D, 0x17F
# ------------------------------------------------------------------ popup 2 and the map
MAP_SHIFT = 0x2A8C                                # DS:2a8c = 224: popup 2's map width
MAP_RECT = (80, 60, 224, 312)                     # area 6; ovl17:08c7 = 0x50, ovl63:04d3 y + 0x3c
MARBLE = 25
MAP_MARKS = 0x2C76                                # ovl63:08df / 1817: 7 x (sx, sy, w, h)
STANDARD_MARKS = 0x2CAE                           # ovl63:1f5f: 2 x (sx, sy, w, h)
CITY_MARKS = 0x2C2E                               # ovl63:0ed7: 9 x (sx, sy, w, h), owner 0xf -> 8
HIDDEN_EDGE = 3                                   # ovl63:04d3 colour
BOX_COLOUR, BOX_LEN, SEE_ALL_BOX_LEN = 15, 10, 11
OUT_LINE, IN_LINE = 7, 8                          # 14d0:0002 before 1133:00b8
M_PRODUCING, M_DEST, M_SOURCE, M_IDLE, M_OPEN, M_DEST_IDLE, M_OPEN_IDLE = 0, 1, 2, 3, 4, 5, 6
FILTER_NONE, FILTER_NEW = -2, -1
# ------------------------------------------------------------------ pages
NAME_AT = (0x1B0, 0x3E)
INK, SHADOW = 15, 0
BUILD_LABELS, BUILD_TEXTS = 0x0FA8, ((119, 0), (119, 1), (120, 0), (120, 1), (121, 0), (121, 1))
PROD_CROWN_AT = (0x138, 0x6E)
PROD_SLOT_AT, PROD_DETAIL_AT, CURRENT_LABEL_AT, CURRENT_ICON_AT = 0x0F78, 0x0F88, 0x0F8C, 0x0F90
CURRENT_TEXT_AT, VECTOR_TEXT_AT = 0x0F94, (0x0F98, 0x0F9C)
CURRENT_LABEL_DX = 8
TURNS_FMT, NO_TURNS, NO_TURNS_V = 0x0FC4, 0x0FC8, 0x0FCA
PROD_TEXT, VECTOR_TEXT, ACTION_TEXT = 117, 154, (155, 156)
BIGARMY, BIGARMY_RECT, DETAIL_DX = 30, 0x05FE, 0x060A
DETAIL_FMTS = ((0x060E, "time", 0x28), (0x0617, "cost", 0x3C), (0x0620, "strength", 0x50), (0x062D, "moves", 0x64))
DETAIL_Y = 10
V_LABEL_AT, V_ICON_AT, V_TEXT_AT = (0x168, 0x6D), (0x170, 0x67), (0x198, 0x6D)
V_OUT_AT = ((0x1B0, 0x67), (0x1D8, 0x67))
V_ROW_X, V_ROW_DX, V_ROWS_Y = 0x190, 0x28, (0x95, 0xB6)
V_ROW_LABELS = (((154, 2), (0x188, 0x9B)), ((154, 3), (0x188, 0xBC)))
ACTION_RECTS = ((0x170, 0xDD, 0xBC, 0x28), (0x170, 0x110, 0xBC, 0x28))   # (368, 221) / (368, 272)
ACTION_LINE_DY = 0x14
ROW_MAX = 4
JUST_MADE = 0x65                                  # army +0x10
MAP_HELP = {INFO: 0, BUILD: 0, PRODUCTION: 4, VECTOR: 6}   # STRING 122 index of the title
# ------------------------------------------------------------------ Build Production
BUILD_POPUP, BUILD_SCREEN = 0x0B, 23
BUILD_DONE, REPLACE, OFFER = 396, (397, 398, 399, 400), range(401, 421)
BUILD_TITLE = 112
B_TITLE_AT, B_SHIELDS_AT, B_CITY_AT, B_GOLD_AT, B_CURRENT_AT = (320, 64), ((0x58, 0x40), (0x200, 0x40)), (320, 104), \
    (0x160, 0x16D), (0xB0, 0x15C)
B_SLOT_X, B_SLOT_DX, B_SLOT_Y = 0x68, 40, 0x172
B_FRAME = (0x66, 0x170, 0x25, 0x23)
B_FRAME_INK, B_FRAME_SHADE, B_FRAME_ON = 0, 3, 9
B_LIST_X, B_LIST_DX, B_LIST_Y, B_LIST_DY, B_COLS = 0x58, 0x78, 0x88, 0x1F, 4
B_PRICE_X, B_PRICE_Y, B_PRICE_FMT = 0x80, 0x8E, 0x0E8C


def _pt(exe, off):
    return ds_words(exe, off, 2)


def _rects(exe, off, n):
    return [ds_words(exe, off + 8 * i, 4) for i in range(n)]


def s16(v: int) -> int:
    v &= 0xFFFF
    return v - 0x10000 if v & 0x8000 else v


# ------------------------------------------------------------------ engine look-ups


def nearest_city(host, x: int, y: int, owner: int, hidden: bool) -> int:
    """ovl62:04fa(x, y, owner, hidden)."""
    st = host.state
    best, found = FAR, -1
    for i, c in enumerate(st.cities):
        if hidden and st.options.hidden_map and not any(
                visible(st, host.sprites, host.view.origin, c.x + dx, c.y + dy)
                for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1))):
            continue
        d = distance((x, y), (c.x, c.y))
        if d < best and (owner == ANY_OWNER or (c.owner & 0xFF) == owner):
            best, found = d, i
    return found


def target_of(host, x: int, y: int) -> int:
    """ovl62:0651(x, y): the nearest own city, or SCN 0x110 + 100 when the side's standard
    (ovl47:0b47) is strictly nearer."""
    from ...rules.vectoring import standard_square
    st = host.state
    p = st.current
    ci = nearest_city(host, x, y, p, False)
    std = standard_square(st, p)
    if std is not None and ci >= 0:
        c = st.cities[ci]
        if distance((x, y), std) < distance((x, y), (c.x, c.y)):
            return p + STANDARD_DEST
    return ci


def sources(state, dest: int) -> list[int]:
    """ovl44:0410(dest): the cities vectoring to dest in table order (to the standard: own cities
    with target x -2; to a city: any owner, target = its square)."""
    if dest == -2 or dest >= STANDARD_DEST:
        return [i for i, c in enumerate(state.cities)
                if c.vectoring and (c.owner & 0xFF) == state.current and s16(c.vector_to[0]) == -2]
    d = state.cities[dest]
    return [i for i, c in enumerate(state.cities)
            if c.vectoring and (s16(c.vector_to[0]), s16(c.vector_to[1])) == (d.x, d.y)]


def owned(state) -> int:
    """ovl45:0447: DS:5dea[SCN 0x110], the stored city count (`rules.economy.cached_cities`),
    not a fresh count."""
    from ...rules.economy import cached_cities
    return cached_cities(state, state.current)


def screen_tutorial(host, close: bool) -> None:
    """The tutorial tail of ovl45:0000 (close False: 025d..02da) or ovl45:02e1 (close True:
    02f9..0336): the command `ScreenTutorial` (the engine tests and sets the bits of SCN byte
    0x134) and its pages FILE.DAT (25, n) one after the other, each through ovl61:168d."""
    events = host.command(C.ScreenTutorial(close)) or []
    pages = [e.info["file"][1] for e in events
             if isinstance(e, E.TurnCue) and e.info.get("kind") == "tutorial"]

    def next_page(_=None):
        if pages:
            registry.open_dialog("tutorial_page", host, index=pages.pop(0), on_close=next_page)
    next_page()


def line(buf: pygame.Surface, x0: int, y0: int, x1: int, y1: int, colour: int) -> None:
    """1133:00b8."""
    if (x0, y0) == (x1, y1):
        return
    if y0 > y1:
        x0, y0, x1, y1 = x1, y1, x0, y0
    if x0 > x1:
        x0, y0, x1, y1 = x1, y1, x0, y0
    dx, dy = x1 - x0, y1 - y0
    sx = (dx > 0) - (dx < 0)
    sy = (dy > 0) - (dy < 0)
    ax, ay = abs(dx), abs(dy)
    x, y, e = x0, y0, 0
    w, h = buf.get_size()
    if ax >= ay:
        for _ in range(ax + 1):
            e += ay
            if e >= ax:
                e -= ax
                y += sy
            if 0 <= x < w and 0 <= y < h:
                buf.set_at((x, y), colour)
            x += sx
    else:
        for _ in range(ay + 1):
            e += ax
            if e >= ay:
                e -= ay
                x += sx
            if 0 <= x < w and 0 <= y < h:
                buf.set_at((x, y), colour)
            y += sy


def hline(buf, x, y, n, colour) -> None:
    buf.fill(colour, (x, y, n, 1))


def vline(buf, x, y, n, colour) -> None:
    buf.fill(colour, (x, y, 1, n))


# ------------------------------------------------------------------ the map pictures


class MapPainter:
    """ovl63:0000 / 0ed7 / 04d3 / 08df / 1817 / 1f5f into a 224x312 buffer (DS:6795)."""

    def __init__(self, host):
        self.host = host
        exe = kit(host.app).exe
        self.marks = _rects(exe, MAP_MARKS, 7)
        self.standards = _rects(exe, STANDARD_MARKS, 2)
        self.city_marks = _rects(exe, CITY_MARKS, 9)
        self.buf = pygame.Surface(MAP_RECT[2:], depth=8)
        self.buf.set_palette(IDENTITY)

    @property
    def atrans(self):
        return self.host.sprites.atrans

    def base(self, state) -> None:
        """The strategic bitmap DS:581d, with Hidden Map through the seen mask over colour 0."""
        px = self.host.minimap.pixels
        if state.options.hidden_map:
            w = state.world
            seen = (np.array(w.roads, np.uint8).reshape(MAP_H, MAP_W).T & ROAD_SEEN) != 0
            px = np.where(np.repeat(np.repeat(seen, 2, 0), 2, 1), px, 0).astype(np.uint8)
        pygame.surfarray.blit_array(self.buf, px)

    def edges(self, state) -> None:
        """ovl63:04d3(NULL) before its copy."""
        if state.options.hidden_map:
            w, h = MAP_RECT[2:]
            hline(self.buf, 0, 0, w, HIDDEN_EDGE)
            vline(self.buf, 0, 0, h, HIDDEN_EDGE)
            hline(self.buf, 0, h - 1, w, HIDDEN_EDGE)

    def overview(self, state, open_city: int) -> None:
        """ovl63:0000(1, 1, NULL) + ovl63:0ed7(NULL, open_city) + ovl63:04d3(NULL)."""
        from ..info.city import intact
        self.base(state)
        w = state.world
        hidden = bool(state.options.hidden_map)
        for i, c in enumerate(state.cities):
            if hidden and not any(w.roads[(c.y + dy) * MAP_W + c.x + dx] & ROAD_SEEN
                                  for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1))):
                continue
            u, v = 2 * c.x - 1, 2 * c.y - 1
            if intact(state, c):
                o = c.owner & 0xFF
                sx, sy, mw, mh = self.city_marks[o if o < 8 else 8]
                self.buf.blit(self.atrans, ((u >> 3) << 3, v), (sx, sy + (u & 7) * mh, mw, mh))
            if i == open_city:
                hline(self.buf, u - 1, v - 1, BOX_LEN, BOX_COLOUR)
                hline(self.buf, u - 1, v + 9, BOX_LEN, BOX_COLOUR)
                vline(self.buf, u - 1, v - 1, BOX_LEN, BOX_COLOUR)
                vline(self.buf, u + 9, v - 1, BOX_LEN, BOX_COLOUR)
        self.edges(state)

    def mark(self, c, k: int) -> tuple[int, int]:
        """One city's ovl63:08df / 1817 marker; returns its line point (2x + 2, 2y + 2)."""
        di, y = 2 * c.x - 2, 2 * c.y - 1
        shift = di & 7
        if shift == 7:
            shift = 6
        sx, sy, w, h = self.marks[k]
        self.buf.blit(self.atrans, ((di >> 3) << 3, y), (sx, sy + shift * h, w, h))
        return di + 4, y + 3

    def standard(self, x: int, y: int, k: int) -> None:
        """ovl63:1f5f(x, y, k)."""
        si = max(0, ((2 * x - 2) >> 3) << 3)
        yy = max(0, 2 * y - 6)
        self.buf.blit(self.atrans, (si, yy), self.standards[k])

    def production(self, state, ci: int, filt: int) -> None:
        """ovl63:08df(NULL, ci, filt) + ovl63:04d3(NULL)."""
        from ...rules.vectoring import standard_square
        self.base(state)
        p = state.current
        here = None
        for i, c in enumerate(state.cities):
            if (c.owner & 0xFF) != p:
                continue
            if filt == FILTER_NEW and len(sources(state, i)) + 1 > MAX_SOURCES and i != ci:
                continue
            if filt >= 0 and len(sources(state, i)) + filt > MAX_SOURCES and i != ci:
                continue
            k = M_PRODUCING if s8(c.turns_left) > 0 else M_IDLE
            if ci >= 0 and i == ci:
                k = M_OPEN if k == M_PRODUCING else M_OPEN_IDLE
            pt = self.mark(c, k)
            if ci >= 0 and i == ci:
                here = pt
        flag = False
        std = standard_square(state, p)
        if ci >= 0:
            c = state.cities[ci]
            to = (s16(c.vector_to[0]), s16(c.vector_to[1]))
            if c.vectoring and to[0] == -2:
                flag = True
                if std is not None:
                    self.standard(*std, 1)
                    line(self.buf, *here, 2 * std[0], 2 * std[1], OUT_LINE)
            if c.vectoring and to[0] != -2:
                d = state.city_at(*to)
                if d >= 0:
                    dc = state.cities[d]
                    pt = self.mark(dc, M_DEST if s8(dc.turns_left) > 0 else M_DEST_IDLE)
                    line(self.buf, *here, *pt, OUT_LINE)
            for s in sources(state, ci):
                pt = self.mark(state.cities[s], M_SOURCE)
                line(self.buf, *here, *pt, IN_LINE)
        if std is not None and not flag:
            self.standard(*std, 0)
        self.edges(state)

    def see_all(self, state, ci: int) -> None:
        """ovl63:1817(NULL, ci) + ovl63:04d3(NULL)."""
        from ...rules.vectoring import standard_square
        self.base(state)
        p = state.current
        done = [False] * len(state.cities)
        flag = 0
        for i, c in enumerate(state.cities):
            if (c.owner & 0xFF) != p or done[i]:
                continue
            done[i] = True
            srcs = sources(state, i)
            k = M_PRODUCING if s8(c.turns_left) > 0 else M_IDLE
            if c.vectoring:
                k = M_SOURCE
            if srcs:
                k = M_DEST if s8(c.turns_left) > 0 else M_DEST_IDLE
            here = self.mark(c, k)
            to = (s16(c.vector_to[0]), s16(c.vector_to[1]))
            if c.vectoring and to[0] == -2:
                flag = 2
            if c.vectoring and to[0] != -2:
                d = state.city_at(*to)
                if d >= 0:
                    done[d] = True
                    dc = state.cities[d]
                    pt = self.mark(dc, M_DEST if s8(dc.turns_left) > 0 else M_DEST_IDLE)
                    line(self.buf, *pt, *here, OUT_LINE)
            for s in srcs:
                done[s] = True
                pt = self.mark(state.cities[s], M_SOURCE)
                line(self.buf, *pt, *here, IN_LINE)
        std = standard_square(state, p)
        if std is not None and flag == 0:
            flag = 1
        if std is not None:
            self.standard(*std, 1 if flag == 2 else 0)
            if flag == 2:
                for c in state.cities:
                    if c.vectoring and s16(c.vector_to[0]) == -2 and (c.owner & 0xFF) == p:
                        line(self.buf, 2 * c.x + 2, 2 * c.y + 2, 2 * std[0], 2 * std[1], IN_LINE)
        if ci >= 0:
            c = state.cities[ci]
            di, y = 2 * c.x - 2, 2 * c.y - 1
            hline(self.buf, di - 1, y - 1, SEE_ALL_BOX_LEN, BOX_COLOUR)
            hline(self.buf, di - 1, y + 10, SEE_ALL_BOX_LEN, BOX_COLOUR)
            vline(self.buf, di - 1, y - 1, SEE_ALL_BOX_LEN, BOX_COLOUR)
            vline(self.buf, di + 10, y - 1, SEE_ALL_BOX_LEN, BOX_COLOUR)
        self.edges(state)


# ------------------------------------------------------------------ the city screen


class CityScreen(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        self.kit = k = kit(host.app)
        self.layout = k.layouts.screen(SCREEN)
        self.mode = None                   # DS:0e92
        self.action = 0                    # DS:0e94
        self.see_all = False               # DS:0e96
        self.ci = -1                       # DS:0e98
        self.square = (0, 0)               # DS:0e9a / 0e9c
        self.chosen = -1                   # DS:0e9e
        self.up = False                    # DS:166a with this popup
        self.row = ButtonRow([], k.picture)
        self.area14 = False
        self.pages = False                 # the tutorial tail of the last open still to run
        self.map = MapPainter(host)
        self.canvas = pygame.Surface((640, 480), depth=8)
        self.canvas.set_palette(IDENTITY)
        self.polled = None                 # frame of the last area-6 press

    # -------------------------------------------------------------- shorthands
    @property
    def state(self):
        return self.host.state

    @property
    def city(self):
        return self.state.cities[self.ci]

    @property
    def painter(self):
        from ..palettes import painter_for
        return painter_for(self.host)

    @property
    def sprites(self):
        return self.host.sprites

    def description(self, file: int) -> list[str]:
        """ovl45:1f06(file, city) at each draw of the page, through the run's description buffer
        (`city_info.description`, register X64: no cache of this dialog's own)."""
        fn = getattr(self.host, "scenario_dir", None)          # DS:5da0 (the game's record)
        if fn is not None:
            scen = fn()
        else:
            cfg = getattr(self.host, "config", None)
            scen = getattr(cfg, "scenario", "") if cfg is not None else ""
        return city_info.description(self.host.app, scen, self.ci)

    # -------------------------------------------------------------- ovl45:0000
    def open(self, mode: int, x: int, y: int) -> bool:
        """ovl45:0000(mode, x, y); False when no city was found (nothing opens)."""
        st = self.state
        self.action = 0
        if mode == SITE:
            raise NotImplementedError("ovl45:0000(4): the site screen (ovl45:0cdf) is M7b's")
        if mode == INFO:
            si = nearest_city(self.host, x, y, ANY_OWNER, True)
            if si < 0:
                return False
            c = st.cities[si]
            if not any(visible(st, self.sprites, self.host.view.origin, c.x + dx, c.y + dy)
                       for dx, dy in ((0, 0), (1, 0), (0, 1), (1, 1))):
                return False
            if self.mode == mode and self.ci == si and self.up:
                self.buttons()
                return True
            self.ci = si
        else:
            si = nearest_city(self.host, x, y, st.current, True)
            if self.mode == mode and self.ci == si and self.up and mode != BUILD:
                self.buttons()
                return True
            if si < 0:
                return False
            self.ci = si
            c = st.cities[si]
            self.chosen = s8(c.current) if s8(c.turns_left) > 0 else -1
        c = st.cities[self.ci]
        self.square = (c.x, c.y)
        self.mode = mode
        self.redraw()
        self.up = True
        self.buttons()
        self.pages = True
        if self.stack is not None:
            self.show_pages()
        return True

    def show_pages(self) -> None:
        """ovl45:025d..02da (`screen_tutorial`), once the screen is on the stack."""
        if self.pages:
            self.pages = False
            screen_tutorial(self.host, False)

    def reopen(self, mode: int) -> None:
        """ovl45:033b / 0393 / 0367 / 037d: ovl45:0000(mode, DS:0e9a, DS:0e9c)."""
        self.open(mode, *self.square)

    # -------------------------------------------------------------- ovl45:03a9
    def buttons(self) -> None:
        st, c, m = self.state, self.city, self.mode
        live: dict[int, int] = {}
        self.area14 = m == INFO
        tab = {INFO: INFO_TAB, BUILD: BUILD_TAB, PRODUCTION: PROD_TAB, VECTOR: VECTOR_TAB}
        states = {t: (PRESSED if tab[m] == t else NORMAL) for t in TABS}
        if owned(st) < 1 or (c.owner & 0xFF) != st.current:
            for t in (BUILD_TAB, PROD_TAB, VECTOR_TAB):
                states[t] = DISABLED
        running = s8(c.turns_left) > 0
        if m == PRODUCTION:
            for s in SLOTS:
                live[s] = NORMAL
            live[DONE2] = NORMAL
            live[STOP] = NORMAL if running else DISABLED
        else:
            live[DONE] = NORMAL
        if m == VECTOR:
            live[SEE_ALL_ON if self.see_all else SEE_ALL] = NORMAL
            n = len(sources(st, self.ci))
            if self.action == 0:
                live[VECTOR_NEW] = NORMAL if running else DISABLED
                live[VECTOR_MOVE] = NORMAL if n > 0 else DISABLED
            elif self.action == 1:
                live[VECTOR_NEW_ON] = NORMAL
                live[VECTOR_MOVE] = NORMAL if n > 0 else DISABLED
            elif self.action == 2:
                live[VECTOR_NEW] = NORMAL if running else DISABLED
                live[VECTOR_MOVE_ON] = NORMAL
        if m == BUILD:
            for b in (RENAME, RAZE, BUILD_PROD):
                live[b] = NORMAL
        live.update(states)
        held = self.row.held.id if self.row.held is not None else None
        self.row = ButtonRow([b for b in self.layout.buttons if b.id in live], self.kit.picture)
        cache_load(self.kit, *(b.picture for b in self.row.buttons))   # CITYBU buttons, 0771:0090 (X44)
        self.row.state.update(live)
        if held in live and live[held] == NORMAL:
            self.row.held = next(b for b in self.row.buttons if b.id == held)

    # -------------------------------------------------------------- drawing into the canvas
    def redraw(self) -> None:
        """06de + 1a9b."""
        self.paint_page()
        self.paint_map()

    def paint_page(self) -> None:
        """ovl45:06de: marble restored, then the page."""
        k = self.kit
        x, y, w, h = k.popup_rect[POPUP]
        shift = ds_words(k.exe, MAP_SHIFT, 1)[0]
        blit_opaque(self.canvas, k.picture(MARBLE), (x + shift, y), (shift, 0, w - shift, h))
        fb = self.canvas
        if self.mode == INFO:
            city_info.draw(self, fb)
        elif self.mode == BUILD:
            self.page_build(fb)
        elif self.mode == PRODUCTION:
            self.page_production(fb)
        elif self.mode == VECTOR:
            self.page_vector(fb)

    def paint_map(self, kind=None) -> None:
        """ovl45:1a9b (kind None), or one of ovl44's map calls: ("prod", filter) / ("seeall",)."""
        st = self.state
        if kind is None:
            if self.mode in (INFO, BUILD):
                self.map.overview(st, self.ci)
            else:
                kind = ("seeall",) if self.mode == VECTOR and self.see_all else ("prod", FILTER_NONE)
        if kind is not None:
            if kind[0] == "seeall":
                self.map.see_all(st, self.ci)
            else:
                self.map.production(st, self.ci, kind[1])
        self.canvas.blit(self.map.buf, MAP_RECT[:2])

    def map_08e4(self) -> None:
        self.paint_map(("seeall",) if self.mode == VECTOR and self.see_all else ("prod", FILTER_NONE))

    def text(self, fb, at, s, how="left", font=CHANCE17) -> None:
        f = self.kit.fonts[font]
        x, y = at
        if how == "centre":
            text_centred(fb, f, x, y, s, INK, SHADOW)
        else:
            f.draw(fb, x - (f.width(s) if how == "right" else 0), y, s, INK, SHADOW)

    def page_build(self, fb) -> None:
        """ovl45:1769."""
        exe = self.kit.exe
        city_info.draw_header(self, fb)
        for i, (g, n) in enumerate(BUILD_TEXTS):
            self.text(fb, _pt(exe, BUILD_LABELS + 4 * i), self.kit.text.S(g, n))

    def page_production(self, fb) -> None:
        """ovl45:0ef8."""
        from ...rules.vectoring import standard_square
        k, st, c = self.kit, self.state, self.city
        exe = k.exe
        owner = c.owner & 0xFF
        self.text(fb, NAME_AT, c.name, "centre", CHANCE36)
        p = capital_of(st, c)
        if p >= 0:
            shield(fb, k, p, 4, *PROD_CROWN_AT)
        lx, ly = _pt(exe, CURRENT_LABEL_AT)
        self.text(fb, (lx + CURRENT_LABEL_DX, ly), k.text.S(PROD_TEXT, 0), "right")
        if s8(c.turns_left) > 0:
            cur, line1 = s8(c.current), printf(ds_str(exe, TURNS_FMT), s8(c.turns_left))
        else:
            cur, line1 = -1, ds_str(exe, NO_TURNS)
        line2 = None
        if c.vectoring:
            line1 += k.text.S(PROD_TEXT, 1)
            to = (s16(c.vector_to[0]), s16(c.vector_to[1]))
            if to[0] == -2:
                line2 = k.text.S(PROD_TEXT, 2 if standard_square(st, st.current) is not None else 3)
            else:
                d = st.city_at(*to)
                line2 = st.cities[d].name if d >= 0 else ""
        self.painter.army(fb, cur, owner, *_pt(exe, CURRENT_ICON_AT), ring=1)
        if c.vectoring:
            self.text(fb, _pt(exe, VECTOR_TEXT_AT[0]), line1)
            self.text(fb, _pt(exe, VECTOR_TEXT_AT[1]), line2)
        else:
            self.text(fb, _pt(exe, CURRENT_TEXT_AT), line1)
        n, sel = 0, None
        for i, s in enumerate(c.slots[:4]):
            t = s8(s.type)
            if t < 0:
                continue
            if self.chosen == t:
                sel = i
            ring = st.current + 2 if self.chosen == t else 1
            self.painter.army(fb, t, owner, *_pt(exe, PROD_SLOT_AT + 4 * n), ring=ring)
            n += 1
        if self.chosen >= 0 and sel is not None:
            self.details(fb, _pt(exe, PROD_DETAIL_AT), self.chosen, c.slots[sel])

    def details(self, fb, at, type_id: int, slot) -> None:
        """ovl16:0000(dst, x, y, type, 1, time, cost, strength, moves)."""
        k = self.kit
        exe = k.exe
        x, y = at
        if type_id >= 0:
            blit_opaque(fb, k.picture(BIGARMY), (x, y + DETAIL_Y), ds_words(exe, BIGARMY_RECT, 4))
        dx = ds_words(exe, DETAIL_DX, 1)[0]
        self.text(fb, (x + dx, y + DETAIL_Y), type_name(k, self.state, type_id))     # ovl16:0070
        values = {"time": slot.time, "cost": slot.cost, "strength": slot.strength, "moves": slot.moves}
        for off, field, dy in DETAIL_FMTS:
            self.text(fb, (x + dx, y + dy), printf(ds_str(exe, off), values[field]))

    def transit(self):
        """ovl45:1305..142c (outgoing, by transit state) and 157d..1691 (incoming rows)."""
        st, c = self.state, self.city
        p = st.current
        out = [-1, -1]                                   # [state 0x65, other]
        if c.vectoring:
            to = (s16(c.vector_to[0]), s16(c.vector_to[1]))
            di = st.city_at(*to)
            for a in reversed(st.armies):
                if a.home_city != self.ci:
                    continue
                if not ((a.x == -1 and a.vector_dest == di) or a.x == -2):
                    continue
                if a.owner != p:
                    continue
                out[0 if a.transit == JUST_MADE else 1] = a.type_id
        nxt, after = [], []
        for s in sources(st, self.ci):
            for a in reversed(st.armies):
                if len(nxt) >= ROW_MAX or len(after) >= ROW_MAX:
                    break
                if a.home_city != s or a.x != -1 or a.vector_dest != self.ci or a.owner != p:
                    continue
                (after if a.transit == JUST_MADE else nxt).append(a.type_id)
        return out, nxt, after

    def page_vector(self, fb) -> None:
        """ovl45:12b7."""
        k, st, c = self.kit, self.state, self.city
        exe = k.exe
        owner = c.owner & 0xFF
        self.text(fb, NAME_AT, c.name, "centre", CHANCE36)
        out, nxt, after = self.transit()
        self.text(fb, V_LABEL_AT, k.text.S(VECTOR_TEXT, 0), "right")
        if s8(c.turns_left) > 0:
            cur, s = s8(c.current), k.text.S(VECTOR_TEXT, 1, s8(c.turns_left))
        else:
            cur, s = -1, ds_str(exe, NO_TURNS_V)
        self.painter.army(fb, cur, owner, *V_ICON_AT, ring=1)
        self.text(fb, V_TEXT_AT, s)
        for t, at in zip(out, V_OUT_AT):
            self.painter.army(fb, t, owner, *at, ring=1)
        for (g, n), at in V_ROW_LABELS:
            self.text(fb, at, k.text.S(g, n), "right")
        for row, y in zip((nxt, after), V_ROWS_Y):
            for i in range(ROW_MAX):
                t = row[i] if i < len(row) else -1
                self.painter.army(fb, t, st.current, V_ROW_X + V_ROW_DX * i, y, ring=1)
        self.paint_action(0)
        self.paint_action(1)

    def paint_action(self, n: int) -> None:
        """ovl44:0638(n)."""
        k = self.kit
        x, y, w, h = ACTION_RECTS[n]
        px, py = k.popup_rect[POPUP][:2]
        blit_opaque(self.canvas, k.picture(MARBLE), (x, y), (x - px, y - py, w, h))
        first = 2 if self.action == n + 1 else 0
        for i in range(2):
            self.text(self.canvas, (x, y + ACTION_LINE_DY * i), k.text.S(ACTION_TEXT[n], first + i))

    # -------------------------------------------------------------- input
    def update(self, events, dt) -> None:
        if self.ci < 0 or self.mode is None:
            return self.close(None)
        if self.pages:
            self.show_pages()
            if self.stack.top is not self:
                return
        inp = self.host.app.input
        pressed = False
        for e, code in with_codes(events, inp):
            if self.stack is None or self.stack.top is not self:
                return
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                if right_help(self.host, self.row, e.pos):
                    pass
                elif _inside(MAP_RECT, e.pos):
                    self.map_poll(e.pos, 2)
                elif self.area14 and _inside(self.layout.area(AREA_SLOTS).rect, e.pos):
                    city_info.slot_press(self, e.pos)
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                b = self.row.at(e.pos)
                if b is not None:
                    left_press(self.host.app, self.row, e)           # 07be:0e7b
                elif _inside(MAP_RECT, e.pos):
                    pressed = True
                    self.map_poll(e.pos, 1, _shift_at(events, e, inp))
            elif e.type in (pygame.MOUSEBUTTONUP, pygame.MOUSEMOTION):
                hit = self.row.event(e)
                if hit is not None:
                    self.press(hit)
            elif e.type == pygame.KEYDOWN:
                self.key(code_of(e, code))
        if (self.stack is not None and self.stack.top is self and not pressed and 1 in inp.buttons
                and self.row.held is None and _inside(MAP_RECT, inp.pos)):
            self.map_poll(inp.pos, 1, inp.shift)                    # 0726:0009 while held

    def key(self, code: int | None) -> None:
        """07be:0064 with DS:166a set (`ui.keys.popup_key`)."""
        hit = popup_key(self.host.app, self.row, code, self.kit.exe)
        if hit is not None:
            self.press(hit)

    def press(self, id: int) -> None:
        """07be:04d8."""
        if id in (DONE, DONE2):
            return self.finish()
        if id in TABS:
            return self.reopen(TABS.index(id))
        if id in SLOTS:
            return self.choose(id - SLOTS[0])
        if id == STOP:
            return self.stop()
        if id == RENAME:
            return registry.open_dialog("rename_city", self.host, screen=self)
        if id == RAZE:
            return registry.open_dialog("raze_confirm", self.host, screen=self)
        if id == BUILD_PROD:
            return registry.open_dialog("build_production", self.host, screen=self)
        if id in (VECTOR_NEW, VECTOR_MOVE, SEE_ALL):
            return self.vector_action(id - VECTOR_NEW)
        if id in (VECTOR_NEW_ON, VECTOR_MOVE_ON, SEE_ALL_ON):
            return self.vector_action(id - VECTOR_NEW_ON)

    def finish(self) -> None:
        """ovl45:02e1."""
        host = self.host
        self.up = False
        self.close(None)
        phase = getattr(host, "phase", None)
        anim = getattr(phase, "animator", None)
        if anim is not None and anim.scene is not None:
            anim.scene = host.state.copy()                           # ovl61:011f: map, overview,
        refresh = getattr(phase, "refresh", None)                    # info area from the state
        if refresh is not None:
            refresh()                                                # ovl61:011f -> 0174
        screen_tutorial(host, True)                                  # ovl45:02f9..0336

    # -------------------------------------------------------------- ovl44 actions
    def command(self, cmd) -> bool:
        return self.host.command(cmd) is not None

    def after_change(self) -> None:
        """06de(0), 1a9b, 03a9."""
        self.redraw()
        self.buttons()

    def choose(self, i: int) -> None:
        """ovl44:00c8(i) -> 00ff."""
        from ...rules.city import slot_of
        c = self.city
        if s8(c.slots[i].type) >= 0:
            self.chosen = s8(c.slots[i].type)
        if s8(c.slots[i].type) >= 0:
            self.command(C.SetProduction(self.ci, slot_of(c, self.chosen)))
        else:
            self.command(C.ChooseProduction(self.ci, self.chosen))  # 00ff with the remembered DS:0e9e
        self.after_change()

    def stop(self) -> None:
        """ovl44:0185."""
        self.command(C.SetProduction(self.ci, -1))
        self.chosen = -1
        self.after_change()

    def vector_set(self, x: int, y: int, button: int, shift: bool) -> None:
        """ovl44:028b(x, y, button)."""
        st = self.state
        if button == 1 and not shift and self.action == 0:
            t = nearest_city(self.host, x, y, st.current, False)
            if t != self.ci:
                self.open(PRODUCTION, x, y)
            self.buttons()
            return
        c = self.city
        if s8(c.turns_left) <= 0:
            return
        si = target_of(self.host, x, y)
        if si != self.ci and len(sources(st, si)) >= MAX_SOURCES:
            self.buttons()
            return
        self.command(C.SetVector(self.ci, si))
        self.redraw()
        self.buttons()

    def vector_click(self, x: int, y: int, button: int, shift: bool) -> None:
        """ovl44:072e(x, y, button)."""
        st = self.state
        if button == 1 and shift:
            self.vector_set(x, y, button, shift)
            self.action = 0
            return
        si = target_of(self.host, x, y)
        if self.action == 2:                                         # 0797..086b: refused = nothing
            from ...rules.engine import IllegalCommand, apply
            try:
                apply(self.state, C.RedirectVectors(self.ci, si))
            except IllegalCommand:
                pass
        if self.action == 1:
            self.vector_set(x, y, button, shift)
        dx = self.ci if (self.action == 1 or si >= STANDARD_DEST or si < 0) else si
        self.action = 0
        d = st.cities[dx]
        self.open(VECTOR, d.x, d.y)
        self.map_08e4()
        self.paint_action(0)
        self.paint_action(1)
        self.buttons()

    def vector_action(self, n: int) -> None:
        """ovl44:050e(n)."""
        if n == 2:
            self.see_all = not self.see_all
            self.map_08e4()
        elif n == 0:
            if self.action == 0:
                self.action = 1
                self.paint_map(("prod", FILTER_NEW))
                self.paint_action(0)
            elif self.action == 1:
                self.action = 0
                self.map_08e4()
                self.paint_action(0)
            else:
                self.action = 1
                self.paint_map(("prod", FILTER_NEW))
                self.paint_action(0)
                self.paint_action(1)
        elif n == 1:
            if self.action == 0:
                self.action = 2
                self.paint_map(("prod", len(sources(self.state, self.ci))))
                self.paint_action(1)
            elif self.action == 1:
                self.action = 2
                self.paint_map(("prod", len(sources(self.state, self.ci))))
                self.paint_action(0)
                self.paint_action(1)
            else:
                self.action = 0
                self.map_08e4()
                self.paint_action(1)
        self.buttons()

    def map_poll(self, pos, button: int, shift: bool = False) -> None:
        """0726:030e -> ovl45:1afa(x, y, button)."""
        x, y = int((pos[0] - MAP_RECT[0]) / 2), int((pos[1] - MAP_RECT[1]) / 2)
        if button == 2:
            n = MAP_HELP[self.mode]
            k = self.kit
            self.host.dialogs.push(Panel(k, self.host.app.input, panel_rect(pos), PANEL_PICTURE,
                                         two_lines(k, k.text.S(122, n), k.text.S(122, n + 1))))
            return
        if self.mode in (INFO, BUILD):
            self.open(self.mode, x, y)
        elif self.mode == PRODUCTION:
            self.vector_set(x, y, button, shift)
        elif self.mode == VECTOR:
            self.vector_click(x, y, button, shift)

    # -------------------------------------------------------------- frame
    def draw(self, fb) -> None:
        if self.ci < 0 or self.mode is None:
            return
        k = self.kit
        x, y, w, h = k.popup_rect[POPUP]
        fb.blit(self.canvas, (x, y), (x, y, w, h))
        pygame.draw.rect(fb, 0, (x - 1, y - 1, w + 2, h + 2), 1)
        fb.fill(0, (x + 1, y + h + 1, w + 2, 2))
        fb.fill(0, (x + w + 1, y + 1, 2, h + 2))
        self.row.draw(fb)


def _inside(rect, pos) -> bool:
    x, y, w, h = rect
    return x <= pos[0] < x + w and y <= pos[1] < y + h


def _shift_at(events, event, inp) -> bool:
    """Shift held at `event` (BIOS 0x417 & 3): the frame's modifier events rolled back."""
    from ..input import MODIFIERS
    held = {kk for kk in inp.keys if MODIFIERS.get(kk) == "shift"}
    for e in reversed(events):
        if e is event:
            break
        if e.type in (pygame.KEYDOWN, pygame.KEYUP) and MODIFIERS.get(e.key) == "shift":
            (held.discard if e.type == pygame.KEYDOWN else held.add)(e.key)
    return bool(held)


def open_city_screen(host, mode: int, x: int, y: int):
    """ovl45:0000(mode, x, y) from outside the screen: the dialog, or None when no city is found."""
    for d in host.dialogs:
        if isinstance(d, CityScreen):
            d.open(mode, x, y)
            return d
    scr = CityScreen(host)
    if not scr.open(mode, x, y):
        return None
    scr.dialog_id = "production"
    host.dialogs.push(scr)
    scr.show_pages()
    return scr


@registry.dialog("production")
def production(host, city=None, mode=PRODUCTION, square=None, on_close=None):
    """The city screen in `mode` for city index `city` (its square), or at `square` (ovl45:0000(mode,
    x, y)).  Closes at once when no city is found there."""
    scr = CityScreen(host, on_close)
    if square is None:
        c = host.state.cities[city]
        square = (c.x, c.y)
    scr.open(mode, *square)
    return scr


@registry.left_click("city")
def city_click(host, square, mode):
    """Cursor 3 on the map: ovl46:011c -> ovl45:0000(2 own / 0 other, x, y)."""
    return open_city_screen(host, mode, *square)


def _menu(mode):
    def action(host):
        st = getattr(host, "state", None)
        if st is None:
            return None
        return open_city_screen(host, mode, st.flags.get(SCN_VIEW_CX, 0), st.flags.get(SCN_VIEW_CY, 0))
    return action


registry.action(registry.MENU_ID["build"])(_menu(BUILD))
registry.action(registry.MENU_ID["production"])(_menu(PRODUCTION))
registry.action(registry.MENU_ID["vectoring"])(_menu(VECTOR))


# ------------------------------------------------------------------ Build Production


class BuildProduction(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, screen: CityScreen, on_close=None):
        super().__init__(on_close)
        self.screen = scr = screen
        self.host = scr.host
        self.kit = k = scr.kit
        self.layout = k.layouts.screen(BUILD_SCREEN)
        from ...rules.city import buy_slot
        self.slot = buy_slot(scr.city)                               # DS:0e86 (ovl44:0978)
        self.row = ButtonRow([], k.picture)
        self.buttons()

    @property
    def state(self):
        return self.host.state

    def offered(self):
        from ...rules.city import buy_offer
        return buy_offer(self.state)

    def buttons(self) -> None:
        """ovl44:0dae."""
        st, c = self.state, self.screen.city
        live = {BUILD_DONE: NORMAL}
        full = s8(c.slots[3].type) >= 0
        for b in REPLACE:
            live[b] = NORMAL if full else DISABLED
        gold = s16(st.players[st.current].gold)
        for k, t in enumerate(self.offered()[:len(OFFER)]):
            have = any(s8(s.type) == t for s in c.slots[:4])
            price = s16(st.army_type(t).buy_price)
            live[OFFER[k]] = DISABLED if have or gold < price else NORMAL
        self.row = ButtonRow([b for b in self.layout.buttons if b.id in live], self.kit.picture)
        cache_load(self.kit, *(b.picture for b in self.row.buttons))   # buttons, 0771:0090 (X44)
        self.row.state.update(live)

    def update(self, events, dt) -> None:
        popup_input(self, events, lambda: self.row, self.kit.exe, self.press)   # DS:1514 / 155c hold 396

    def press(self, id: int) -> None:
        if id == BUILD_DONE:
            return self.done()
        if id in REPLACE:
            self.slot = id - REPLACE[0]                              # ovl44:1112
            return self.buttons()
        if id in OFFER:
            return self.buy(id - OFFER.start)

    def buy(self, k: int) -> None:
        """ovl44:0ee3(k)."""
        c = self.screen.city
        t = self.offered()[k]
        if not self.screen.command(C.BuyProduction(self.screen.ci, t, self.slot)):
            return
        if self.slot < 3 and s8(c.slots[self.slot + 1].type) < 0:
            self.slot += 1
        self.buttons()

    def done(self) -> None:
        """ovl44:0eca: ovl44:1544 (`SortSlots`, on every close), close, ovl45:0393."""
        self.screen.command(C.SortSlots(self.screen.ci))
        self.close(None)
        self.screen.reopen(BUILD)

    def draw(self, fb) -> None:
        """ovl44:09da(0)."""
        k, st, c = self.kit, self.state, self.screen.city
        exe = k.exe
        p = st.current
        k.draw_popup(fb, BUILD_POPUP)
        f, big = k.fonts[CHANCE17], k.fonts[CHANCE36]
        text_centred(fb, big, *B_TITLE_AT, k.text.S(BUILD_TITLE, 0), INK, SHADOW)
        for at in B_SHIELDS_AT:
            shield(fb, k, p, 0, *at)
        text_centred(fb, f, *B_CITY_AT, k.text.S(BUILD_TITLE, 1, st.players[p].name, c.name), INK, SHADOW)
        text_centred(fb, f, *B_GOLD_AT, k.text.S(BUILD_TITLE, 2, s16(st.players[p].gold)), INK, SHADOW)
        text_centred(fb, f, *B_CURRENT_AT, k.text.S(BUILD_TITLE, 3), INK, SHADOW)
        painter = self.screen.painter
        fx, fy, fw, fh = B_FRAME
        for i in range(4):
            t = s8(c.slots[i].type)
            x = B_SLOT_X + B_SLOT_DX * i
            if t >= 0:
                painter.army(fb, t, p, x, B_SLOT_Y, ring=p + 2)
            else:
                painter.army(fb, -1, p, x, B_SLOT_Y, ring=1)
            r = (fx + B_SLOT_DX * i, fy, fw, fh)
            first, second = (B_FRAME_INK, B_FRAME_ON) if self.slot == i else (B_FRAME_SHADE, B_FRAME_SHADE)
            pygame.draw.rect(fb, first, r, 1)
            pygame.draw.rect(fb, second, (r[0] - 1, r[1] - 1, fw, fh), 1)
        gold = s16(st.players[p].gold)
        fmt = ds_str(exe, B_PRICE_FMT)
        for n, t in enumerate(self.offered()):
            price = s16(st.army_type(t).buy_price)
            have = any(s8(s.type) == t for s in c.slots[:4])
            col, row = n % B_COLS, n // B_COLS
            painter.army(fb, t, p, B_LIST_X + B_LIST_DX * col, B_LIST_Y + B_LIST_DY * row, ring=1,
                         greyed=have or gold < price)
            f.draw(fb, B_PRICE_X + B_LIST_DX * col, B_PRICE_Y + B_LIST_DY * row, printf(fmt, price), INK, SHADOW)
        self.row.draw(fb)


@registry.dialog("build_production")
def build_production(host, screen, on_close=None):
    return BuildProduction(screen, on_close)


# ------------------------------------------------------------------ help selectors 1-24


def _screen(host):
    for d in host.dialogs:
        if isinstance(d, CityScreen):
            return d
    return None


@registry.help_selector(range(1, 25))
def production_help(host, record, word2):
    """ovl15:00df: 1-4 -> slot word2 - 1 of DS:0e98 (filled: ovl46:032a at the pointer); 5-24 ->
    ovl44:11f4(1, word2 - 5): the (word2 - 5)-th offered type.  Both open their own panel."""
    from ...rules.city import buy_offer
    scr = _screen(host)
    pos = host.app.input.pos
    st = host.state
    if word2 <= 4:
        if scr is None or scr.ci < 0:
            return None
        s = st.cities[scr.ci].slots[word2 - 1]
        if s8(s.type) < 0:
            return None
        registry.open_dialog("info/army_type", host, type_id=s8(s.type), time=s.time, strength=s.strength,
                             cost=s.cost, moves=s.moves, pos=pos)
        return None
    offer = buy_offer(st)
    k = word2 - 5
    if k >= len(offer):
        return None
    t = st.army_type(offer[k])
    registry.open_dialog("info/army_type", host, type_id=t.type_id, time=t.turns, strength=t.strength,
                         cost=t.cost, moves=t.moves, pos=pos)
    return None
