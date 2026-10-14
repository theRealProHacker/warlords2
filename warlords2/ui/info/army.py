"""Army panels: the stack on a map square, one army of the stack palette, and the right press
on the bottom-left area.

Evidence (asm ovl46, ovl66, ovl15):
* Map stack ovl46:0bad(x, y) after ovl46:1201(x, y, 1) (POPUP.PCK 256x75 on the square): the
  square list 0b62:007d sorted by 0b62:09ec (`rules.selection.square_list`), icons only:
  y = top + 16, x0 = ((left + 128 - n * 24 / 2 - 16 + 4) >> 3) << 3, then 24 px apart, each
  ovl64:08be(type +4, owner +5, ring 0, mode 0) - the army's own sheet through the army mask.
* Army panel ovl46:0626(type, +6, +8, +0xb, +7, +0xa, x, y) (nothing for type -1): 240x128 around
  (x, y) (ovl46:1486), POPUP3.PCK from (0, 0) (DS:1050) through its mask; SetFont(2, 15, 0, 3);
  title centred at (L + 112, T + 8): the hero's name (2c04:0223 + 20 * (+0xa)) for type 0x1c,
  else the type's name (ovl44:14f4); ovl64:08be(type, SCN 0x110, ring 1) at (L + 96, T + 31);
  for a non-hero with +0xa = n medals, the first n of the ABITS 8x8 rectangles DS:2fa6, 2fae,
  2fb6, 2fbe at (L + 128, T + 36), (L + 88, T + 36), (L + 128, T + 45), (L + 88, T + 45);
  "Strength: %d" (DS:10a8, +8) right-aligned (ovl59:0103) at (L + 104, T + 66), "Movement: %d"
  (DS:10b5, +6) left-aligned (ovl59:00bf) at (L + 120, T + 66), "Remain: %d" (DS:10c2, +7) right
  at (L + 104, T + 86), "Upkeep: %d" (DS:10cd, +0xb) left at (L + 120, T + 86); the ABITS 32x10
  movement icon at (L + 96, T + 103) from the type's DS:45c4 bytes: flies (184, 30), else w17
  and w18 (216, 30), else w17 (248, 30), else w18 (152, 30), else none.  The ABITS blits are
  opaque ([DS:69d4], DS:57e2 = ABITS's bitmap slot).
* Right press over area 9 (16, 408, 360, 56), 0726:02ad -> ovl66:0ad9(pointer, (px - 16) / 90):
  with the stack palette (DS:30f8 = 0) slot (px - 16) / 40: px < 336 and slot < DS:30f6 ->
  the army panel of DS:6862[slot] at the pointer; px < 336 else -> ovl46:1201(pointer, 0) with
  DS:3142 / DS:314e; px >= 336 -> DS:3169 / DS:3177.  With the info area (DS:30f8 != 0): index
  0..3 -> DS:31a1 / "%d" DS:318d (cities DS:5dea), DS:31c4 / DS:31b2 (gold 2c04:0185), DS:31e4 /
  DS:31d2 (income DS:5dca), DS:3201 / DS:31f0 (upkeep DS:5dda) through ovl46:10e1.
* HLP selectors 37-44 (ovl15:01e2 -> ovl66:1747(word2 - 37, x, y)): slot < DS:30f6 -> the army
  panel of that palette slot at the pointer, else 1201(pointer, 0) with DS:3222 / DS:322e.
"""
from __future__ import annotations

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17
from ...assets.text import printf
from ...model.ids import HERO_TYPE
from .. import registry
from ...rules.bonuses import s8
from ..palettes import ABITS, blit_opaque, kind_of, painter_for
from ..widgets import kit
from . import LARGE, POPUP, POPUP3, Panel, panel_rect, two_lines

ROW_Y, STEP = 16, 24
INK, SHADOW = 15, 0
TITLE_AT, ICON_AT = (112, 8), (96, 31)
MEDALS = (0x2FA6, 0x2FAE, 0x2FB6, 0x2FBE)
MEDAL_AT = ((128, 36), (88, 36), (128, 45), (88, 45))
STATS = ((0x10A8, "strength", 104, 66, True), (0x10B5, "allowance", 120, 66, False),
         (0x10C2, "moves_left", 104, 86, True), (0x10CD, "upkeep", 120, 86, False))
KIND_AT, KIND_SIZE = (96, 103), (32, 10)
SELECT_TEXTS, GROUP_TEXTS, SELECTOR_TEXTS = (0x3142, 0x314E), (0x3169, 0x3177), (0x3222, 0x322E)
STATUS_TEXTS = ((0x31A1, 0x318D), (0x31C4, 0x31B2), (0x31E4, 0x31D2), (0x3201, 0x31F0))
AREA_X, SLOT_W, STATUS_W, GROUP_X = 16, 40, 90, 336
SELECTORS = range(37, 45)


def stack_content(k, painter, armies):
    def content(fb, left, top):
        n = len(armies)
        x = (left + 128 - n * STEP // 2 - 16 + 4) >> 3 << 3
        for a in armies:
            painter.army(fb, a.type_id, a.owner, x, top + ROW_Y)
            x += STEP
    return content


@registry.dialog("info/army")
def stack_panel(host, square, centre, on_close=None):
    from ...rules.selection import square_list
    k = kit(host.app)
    armies = square_list(host.state, *square)
    return Panel(k, host.app.input, panel_rect(centre), POPUP, stack_content(k, painter_for(host), armies), on_close)


@registry.right_click("army")
def stack(host, square, centre):
    return registry.open_dialog("info/army", host, square=square, centre=centre)


def kind_cell(state, type_id: int):
    """ovl46:0626's icon from the type's DS:45c4 bytes (no boat case)."""
    from ...rules.movement import type_flag
    return kind_of(type_flag(state, type_id, "flag16"), False, type_flag(state, type_id, "flag17"),
                   type_flag(state, type_id, "flag18"))


def army_content(k, painter, state, a):
    exe = k.exe
    f = k.fonts[CHANCE17]

    def content(fb, left, top):
        if a.type_id == HERO_TYPE:
            title = state.heroes[a.hero_slot].name
        else:
            title = state.army_type(a.type_id).name
        w = f.width(title)
        f.draw(fb, left + TITLE_AT[0] - int(w / 2), top + TITLE_AT[1], title, INK, SHADOW)
        painter.army(fb, a.type_id, state.current, left + ICON_AT[0], top + ICON_AT[1], ring=1)
        if a.type_id != HERO_TYPE:
            abits = k.picture(ABITS)
            for off, (dx, dy) in list(zip(MEDALS, MEDAL_AT))[:max(0, a.medals)]:
                blit_opaque(fb, abits, (left + dx, top + dy), ds_words(exe, off, 4))
        for off, field, dx, dy, right in STATS:
            s = printf(ds_str(exe, off), s8(getattr(a, field)) if field == "moves_left" else getattr(a, field))
            x = left + dx - (f.width(s) if right else 0)
            f.draw(fb, x, top + dy, s, INK, SHADOW)
        cell = kind_cell(state, a.type_id)
        if cell is not None:
            blit_opaque(fb, k.picture(ABITS), (left + KIND_AT[0], top + KIND_AT[1]), (*cell, *KIND_SIZE))
    return content


@registry.dialog("info/army_unit")
def army_panel(host, army, pos, on_close=None):
    k = kit(host.app)
    a = host.state.armies[army]
    return Panel(k, host.app.input, panel_rect(pos, LARGE), POPUP3,
                 army_content(k, painter_for(host), host.state, a), on_close)


def _texts(host, pos, offs, *args):
    k = kit(host.app)
    title, text = ds_str(k.exe, offs[0]), printf(ds_str(k.exe, offs[1]), *args)
    return registry.open_dialog("info/text", host, title=title, text=text, pos=pos)


@registry.dialog("info/text")
def text_panel(host, title, text, pos, on_close=None):
    """ovl46:1201(pointer, 0) + ovl46:10e1(title, text)."""
    k = kit(host.app)
    return Panel(k, host.app.input, panel_rect(pos), POPUP, two_lines(k, title, text), on_close)


def palette_slot(host, slot: int, pos, texts):
    """ovl66:0ad9 / 1747 for a palette slot."""
    sel = host.state.selection
    if slot < len(sel.palette):
        return registry.open_dialog("info/army_unit", host, army=sel.palette[slot], pos=pos)
    return _texts(host, pos, texts)


@registry.right_click("palette")
def palette(host, _id, pos):
    """ovl66:0ad9: a right press over area 9."""
    from ...rules import economy
    from ..palettes import leader
    st = host.state
    if leader(st) is not None:                         # the stack palette is showing (DS:30f8 = 0)
        if pos[0] < GROUP_X:
            return palette_slot(host, (pos[0] - AREA_X) // SLOT_W, pos, SELECT_TEXTS)
        return _texts(host, pos, GROUP_TEXTS)
    i = (pos[0] - AREA_X) // STATUS_W
    if not 0 <= i < len(STATUS_TEXTS):
        return None
    p = st.current
    value = (economy.city_count(st, p), st.players[p].gold, economy.income(st, p), economy.upkeep(st, p))[i]
    return _texts(host, pos, STATUS_TEXTS[i], value)


@registry.help_selector(SELECTORS)
def palette_help(host, record, word2):
    """ovl15:01e2 -> ovl66:1747(word2 - 37): opens its own panel, no HLP popup."""
    palette_slot(host, word2 - SELECTORS.start, host.app.input.pos, SELECTOR_TEXTS)
    return None
