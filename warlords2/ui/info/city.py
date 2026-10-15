"""Right-click on a city (map square or overview): the city panel; the army-type panel of the
production screens; the side's shield / crown pictures they share.

Evidence (asm ovl46, ovl64; DGROUP words read from the user's EXE):
* ovl46:0000 with the right button on a City square (or a Site square a city covers), after
  ovl46:1201(x, y, 1); the overview's right press 0726:0186 -> ovl46:1201(pointer, 0); both then
  call ovl46:0c73(city) (`registry.right_click("city")`, called with the city index and the
  place the panel is put around).  ovl46:0c73 on the 256x75 POPUP.PCK panel (L, T, w, h =
  DS:4488 / 4490 / 4492, set by ovl46:1201):
  - SetFont(2, SCN 0x0a0[s], SCN 0x0b0[s], 3) with s = the owner, SCN 0x110 for owner 0x0f;
    the name centred at (L + w / 2 - 8, T + 0x0b) (ovl59:00d6);
  - terrain SCN 0x710[tile] of the city's square not 10 (razed): DS:10d8 centred at
    (L + w / 2 - 8, T + 0x23), nothing else but the crown below;
  - else, for an owner below 8, its shield ovl64:0bf7(owner, 3) at (L + 0x18, T + 0x0a) and
    (L + w - 0x30, T + 0x0a); ABITS (0997:0129, opaque) DS:1030 at (L, T) + DS:1040 and
    DS:1038 at (L, T) + (DS:1044, DS:1042), each with "%d" (DS:10df / DS:10e2) of the income
    (+0x2a) / defence (+0x14) left-aligned at the icon + (0x20, -3), still in the side's
    colours;
  - the first side p (0..7) whose first capital (player record +0x0e / +0x10, SCN
    0x193 / 0x195 + 0x14 p) is the city's x, y: its crown ovl64:0bf7(p, 4), for a razed city
    at (L + w / 2 - 0x18, T + 0x2c), else at (L + 0x10, T + 0x0a) and (L + w - 0x38, T + 0x0a).
* ovl64:0bf7(side, mode, dst, x, y): side 0x0f -> 8; mode 0 SHIELDS.PCK (40 s, 0, 40, 40),
  1 (40 s, 0x41, 40, 40), 2 (40 s, 0x28, 40, 25), 3 (40 s + 0x18, 0x2e, 16, 16), all opaque
  ([DS:69d4]); mode 4 BSHIELD.PCK (32 s, 0x24, 32, 23) through its mask ([DS:69c8], picture 38).
* ovl46:032a(type, time, strength, cost, moves, x, y): the 240x128 POPUP3.PCK panel around
  (x, y) (ovl46:1486, `ui.info.LARGE`) through its mask; SetFont(2, 15, 0, 3); the type's name
  (ovl44:14f4) centred at (L + 0x70, T + 8); ovl64:08be(type, SCN 0x110, ring 1) at
  (L + 0x60, T + 0x1f); "Strength: %d" (DS:107c) right-aligned (ovl59:0103) at
  (L + 0x68, T + 0x42), "Movement: %d" (DS:1089, moves) left at (L + 0x78, T + 0x42), "Time: %d"
  (DS:1096) right at (L + 0x68, T + 0x56), "Cost: %d" (DS:109f) left at (L + 0x78, T + 0x56);
  the type's movement icon (DS:45c4..45c6: flies, w17 and w18, w17, w18; ABITS 32x10 opaque) at
  (L + 0x60, T + 0x67).  Its callers are the city-info slots (ovl45:1c35, with SCN 0x110 set
  to the city's owner around the call), HLP selectors 1-4 (ovl15:00df) and 5-24 (ovl44:11f4).
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17
from ...assets.text import printf
from ...model.ids import NEUTRAL_OWNER, Terrain
from ...rules.bonuses import s8
from .. import registry
from ..typename import type_name
from ..widgets import blit_opaque, kit, text_centred
from . import LARGE, POPUP, POPUP3, Panel, panel_rect

SHIELDS, BSHIELD, ABITS = 5, 38, 8              # FILE.DAT group-3 pictures
SHIELD_RECT = {0: (0, 40, 40), 1: (0x41, 40, 40), 2: (0x28, 40, 25)}   # mode -> sy, w, h (ovl64:0c1a..0c74)
SMALL_SHIELD = (0x18, 0x2E, 16, 16)             # mode 3: sx + 40 s, sy, w, h (ovl64:0c7b..0c95)
CROWN = (0x24, 32, 0x17)                        # mode 4: sy, w, h at sx = 32 s (ovl64:0c9c..0cc4)
NEUTRAL_CELL = 8                                # ovl64:0c02: side 0x0f -> 8
SCN_INK, SCN_SHADOW = 0xA0, 0xB0
SCN_FIRST_CAPITAL, PLAYER_REC = 0x193, 0x14     # player record +0x0e / +0x10 (ovl46:0edf..0f22)
SIDES = 8
RAZED = 0x10D8
INCOME_ICON, DEFENCE_ICON = 0x1030, 0x1038      # ABITS rectangles
INCOME_AT, DEFENCE_X = 0x1040, 0x1044           # (dx, dy) / dx; dy is DS:1042 for both
INCOME_FMT, DEFENCE_FMT = 0x10DF, 0x10E2
NUMBER_DX, NUMBER_DY = 0x20, -3
NAME_DX, NAME_Y, RAZED_Y = -8, 0x0B, 0x23
SHIELD_L, SHIELD_R, SHIELD_Y = 0x18, 0x30, 0x0A
CROWN_L, CROWN_R, CROWN_Y = 0x10, 0x38, 0x0A
RAZED_CROWN_DX, RAZED_CROWN_Y = -0x18, 0x2C
INK, SHADOW = 15, 0
TYPE_NAME_AT, TYPE_ICON_AT, TYPE_KIND_AT = (0x70, 8), (0x60, 0x1F), (0x60, 0x67)
TYPE_STATS = ((0x107C, "strength", 0x68, 0x42, True), (0x1089, "moves", 0x78, 0x42, False),
              (0x1096, "time", 0x68, 0x56, True), (0x109F, "cost", 0x78, 0x56, False))
KIND_SIZE = (32, 10)


def shield(fb: pygame.Surface, k, side: int, mode: int, x: int, y: int) -> None:
    """ovl64:0bf7(side, mode, dst, x, y)."""
    s = NEUTRAL_CELL if side == NEUTRAL_OWNER else side
    if mode in SHIELD_RECT:
        sy, w, h = SHIELD_RECT[mode]
        blit_opaque(fb, k.picture(SHIELDS), (x, y), (40 * s, sy, w, h))
    elif mode == 3:
        dx, sy, w, h = SMALL_SHIELD
        blit_opaque(fb, k.picture(SHIELDS), (x, y), (40 * s + dx, sy, w, h))
    elif mode == 4:
        sy, w, h = CROWN
        fb.blit(k.picture(BSHIELD), (x, y), (32 * s, sy, w, h))


def first_capital(state, p: int) -> tuple[int, int]:
    """Player record +0x0e / +0x10 of side p (SCN 0x193 + 0x14 p, 0x195 + 0x14 p)."""
    from ...rules.economy import s16
    base = SCN_FIRST_CAPITAL + PLAYER_REC * p
    return s16(state.flags.get(base, 0)), s16(state.flags.get(base + 2, 0))


def capital_of(state, city) -> int:
    """The first side 0..7 whose first capital is this city's square, else -1 (ovl46:0edf,
    ovl45:0c2a, ovl45:0f89)."""
    for p in range(SIDES):
        if first_capital(state, p) == (city.x, city.y):
            return p
    return -1


def intact(state, city) -> bool:
    """SCN 0x710[tile] of the city's top-left square is 10 (City); razed cities show ruins."""
    return state.world.terrain(city.x, city.y) == Terrain.CITY


def city_content(k, state, ci: int):
    """ovl46:0c73(ci) into the panel at (left, top)."""
    exe = k.exe
    f = k.fonts[CHANCE17]
    c = state.cities[ci]
    w = POPUP_W

    def content(fb, left, top):
        owner = s8(c.owner) & 0xFF
        side = state.current if owner == NEUTRAL_OWNER else owner
        ink, shadow = state.flags.get(SCN_INK + 2 * side, 0), state.flags.get(SCN_SHADOW + 2 * side, 0)
        cx = left + int(w / 2) + NAME_DX
        text_centred(fb, f, cx, top + NAME_Y, c.name, ink, shadow)
        whole = intact(state, c)
        if not whole:
            text_centred(fb, f, cx, top + RAZED_Y, ds_str(exe, RAZED), ink, shadow)
        else:
            if owner < SIDES:
                shield(fb, k, owner, 3, left + SHIELD_L, top + SHIELD_Y)
                shield(fb, k, owner, 3, left + w - SHIELD_R, top + SHIELD_Y)
            abits = k.picture(ABITS)
            dx, dy = ds_words(exe, INCOME_AT, 2)
            x, y = left + dx, top + dy
            blit_opaque(fb, abits, (x, y), ds_words(exe, INCOME_ICON, 4))
            f.draw(fb, x + NUMBER_DX, y + NUMBER_DY, printf(ds_str(exe, INCOME_FMT), c.income), ink, shadow)
            x = left + ds_words(exe, DEFENCE_X, 1)[0]
            blit_opaque(fb, abits, (x, y), ds_words(exe, DEFENCE_ICON, 4))
            f.draw(fb, x + NUMBER_DX, y + NUMBER_DY, printf(ds_str(exe, DEFENCE_FMT), c.defence), ink, shadow)
        p = capital_of(state, c)
        if p >= 0:
            if not whole:
                shield(fb, k, p, 4, left + int(w / 2) + RAZED_CROWN_DX, top + RAZED_CROWN_Y)
            else:
                shield(fb, k, p, 4, left + CROWN_L, top + CROWN_Y)
                shield(fb, k, p, 4, left + w - CROWN_R, top + CROWN_Y)
    return content


POPUP_W = 256                                    # DS:448c after ovl46:131a (`ui.info.SMALL`)


@registry.dialog("info/city")
def city_panel(host, city, pos, on_close=None):
    k = kit(host.app)
    return Panel(k, host.app.input, panel_rect(pos), POPUP, city_content(k, host.state, city), on_close)


@registry.right_click("city")
def city(host, city, pos):
    """ovl46:1201 + ovl46:0c73 for city index `city`, placed around `pos`."""
    return registry.open_dialog("info/city", host, city=city, pos=pos)


# --------------------------------------------------------------------------- army type panel


def type_content(k, painter, state, type_id: int, player: int, values: dict):
    """ovl46:032a's drawing; `values` holds time, strength, cost, moves."""
    from .army import kind_cell
    exe = k.exe
    f = k.fonts[CHANCE17]

    def content(fb, left, top):
        name = type_name(k, state, type_id)                          # ovl46:044c
        text_centred(fb, f, left + TYPE_NAME_AT[0], top + TYPE_NAME_AT[1], name, INK, SHADOW)
        painter.army(fb, type_id, player, left + TYPE_ICON_AT[0], top + TYPE_ICON_AT[1], ring=1)
        for off, field, dx, dy, right in TYPE_STATS:
            s = printf(ds_str(exe, off), values[field])
            f.draw(fb, left + dx - (f.width(s) if right else 0), top + dy, s, INK, SHADOW)
        cell = kind_cell(state, type_id)
        if cell is not None:
            blit_opaque(fb, k.picture(ABITS), (left + TYPE_KIND_AT[0], top + TYPE_KIND_AT[1]), (*cell, *KIND_SIZE))
    return content


@registry.dialog("info/army_type")
def army_type_panel(host, type_id, time, strength, cost, moves, pos, player=None, on_close=None):
    """ovl46:032a(type, time, strength, cost, moves, x, y); `player` is what SCN 0x110 holds
    during the call (the side on turn unless the caller swaps it, ovl45:1cf4..1d98)."""
    from ..palettes import painter_for
    k = kit(host.app)
    st = host.state
    p = st.current if player is None else player
    values = {"time": time, "strength": strength, "cost": cost, "moves": moves}
    return Panel(k, host.app.input, panel_rect(pos, LARGE), POPUP3,
                 type_content(k, painter_for(host), st, type_id, p, values), on_close)
