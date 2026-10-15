"""The city screen's City Info page (ovl45:0000 mode 0, button 193, View -> Cities, key 'c'):
name, shields, income / defence / owner, the four production slots or the city picture, the
capital's crown and the three description lines of the scenario's .CTY file; the right press on
its slot row.  The screen itself (popup, map, buttons, the other pages) is
`ui.dialogs.production`.

Evidence (asm ovl45; positions and formats from DGROUP, read from the user's EXE):
* draw ovl45:0727 (case 0 of ovl45:06de): SetFont(1, 15, 0, 3), the name centred at
  (0x1b0, 0x3e); ovl64:0bf7(owner, 0) at DS:0ea0 and DS:0ea4; SetFont(2, 15, 0, 3);
  STRING (116, 0) % income (+0x2a) at DS:0ea8, (116, 1) % defence (+0x14) at DS:0eac, both 0 when
  the city's square is not City terrain (SCN 0x710[tile] != 10: razed); at DS:0eb0 (116, 2) for a
  razed city, (116, 3) for owner 0x0f, else (116, 4) % the owner's name (SCN 0x000 + 0x14 p);
  all left-aligned (ovl59:00bf);
* (SCN 0x132 = `GameOptions.view_production`, whose name reads the wrong way: the Options
  dialog labels a nonzero word with the off text DS:25a5 and 0 with the on text DS:25a9,
  ovl57:1567..1583, so 1 = View Production off = others' slots hidden.)
* an intact city with SCN 0x132 (`GameOptions.view_production`) 0 or owned by SCN 0x110: the four
  slots ovl64:08be(slot type, owner, ring 1) at DS:0f18[i] (slot index, also the empty ones:
  the ring alone); otherwise (razed, or another side's city with SCN 0x132 set) the picture:
  colour-0 outline (0x137, 0xa9, 0xf2, 0x58) (116d:01fd), bevel 14d0:02e5((0x136, 0xa8, 0xf4,
  0x5a), 4, 2), CITYBACK.PCK (0, 0, 240, 86) opaque at (0x138, 0xaa), and the city's four map
  tiles ovl64:0860 (scenery sheet tile / 0x60, cell (tile % 16, tile % 96 / 16) * 40, opaque)
  at (0x188, 0xb0) (x, y), (0x188, 0xd8) (x, y + 1), (0x1b0, 0xb0) (x + 1, y), (0x1b0, 0xd8)
  (x + 1, y + 1);
* then the crown ovl64:0bf7(p, 4) at (0x198, 0xaa) for the first side whose first capital is
  the city's square; then ovl45:1f06(1, city): the scenario's FILE.DAT (22, 0) file
  ("%s\\%s.CTY" with the scenario name DS:5da0 twice, ovl45:1e02), 8000 bytes read, every '|'
  made NUL, the first '#' whose following C string is "%03d" of the city index (DS:0ffe);
  the three C strings after the next three NULs are the lines, drawn left-aligned at
  DS:0ec8[i].  A city with no entry leaves the three stack buffers unset (garbage in the EXE);
  here they are empty.
* area 14 (AREA.DAT group 3, enabled in this mode only, 08a9:07ed(14) at ovl45:03ca) with the
  right button (0726:02ea) -> ovl45:1c35(pointer): nothing while a panel is up (DS:1174);
  slot = (px - 0x134) / 0x38 (truncated) clamped to 0..4; an intact city with SCN 0x132 0 or
  owned by SCN 0x110: a filled slot -> ovl46:032a(type, time, strength, cost, moves, pointer)
  with SCN 0x110 set to the city's owner around the call (`ui.info.city`), an empty one ->
  ovl46:1201(pointer, 0) + ovl46:10e1(city name, DS:0fcc); otherwise ovl46:10e1(city name,
  DS:0fe7).
"""
from __future__ import annotations

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...assets.sprites import tile_cell
from ...model.ids import MAP_W, NEUTRAL_OWNER
from ...rules.bonuses import s8
from .. import registry
from ..info import POPUP, Panel, panel_rect, two_lines
from ..info.city import capital_of, intact, shield
from ..widgets import blit_opaque, text_centred

NAME_AT = (0x1B0, 0x3E)
SHIELDS_AT = (0x0EA0, 0x0EA4)
LINES_AT = (0x0EA8, 0x0EAC, 0x0EB0)
SLOTS_AT = 0x0F18
DESCRIPTION_AT = 0x0EC8
CITY_TEXT = 116                                  # STRING group: income, defence, razed, neutral, owner
INK, SHADOW = 15, 0
PICTURE_FRAME, PICTURE_BEVEL = (0x137, 0xA9, 0xF2, 0x58), (0x136, 0xA8, 0xF4, 0x5A)
CITYBACK, CITYBACK_SRC, CITYBACK_AT = 55, (0, 0, 0xF0, 0x56), (0x138, 0xAA)
TILES_AT = (((0x188, 0xB0), (0, 0)), ((0x188, 0xD8), (0, 1)), ((0x1B0, 0xB0), (1, 0)), ((0x1B0, 0xD8), (1, 1)))
SHEETS = 2                                       # ovl64:0860: tile / 0x60 picks the slot DS:5133 + 0x3b n
CROWN_AT = (0x198, 0xAA)
CTY_FILE, CTY_LIMIT, CTY_SEP, CTY_MARK, CTY_NUMBER = (22, 0), 0x1F40, 0x7C, 0x23, 0x0FFE
CTY_LINES = 3
SLOT_X0, SLOT_PITCH, SLOT_MAX = 0x134, 0x38, 4  # ovl45:1c4a..1c62
NO_PRODUCTION_TEXT, PICTURE_TEXT = 0x0FCC, 0x0FE7
ENC = "cp437"


def _point(exe, off):
    return ds_words(exe, off, 2)


def shows_slots(state, c) -> bool:
    """Intact and (SCN 0x132 == 0 or owned by SCN 0x110): ovl45:09ca..09fe, ovl45:1ca2..1cd6."""
    return intact(state, c) and (not state.options.view_production or (c.owner & 0xFF) == state.current)


def description(k, scenario: str, index: int) -> list[str]:
    """ovl45:1e02 / 1f06(1, index): the three lines of the city's .CTY entry."""
    rel = k.files.get(*CTY_FILE)
    rel = rel.replace("%s", scenario, 2).replace("\\", "/")
    try:
        data = bytearray(k.store.read(rel)[:CTY_LIMIT])
    except FileNotFoundError:
        return [""] * CTY_LINES
    data = data.replace(bytes([CTY_SEP]), b"\0")
    key = (ds_str(k.exe, CTY_NUMBER) % index).encode(ENC)
    for i, b in enumerate(data):
        if b != CTY_MARK:
            continue
        end = data.find(b"\0", i + 1)
        if (data[i + 1:] if end < 0 else data[i + 1:end]) != key:
            continue
        out, j = [], i
        while len(out) < CTY_LINES and j < len(data):
            if data[j] == 0:
                e = data.find(b"\0", j + 1)
                out.append(bytes(data[j + 1:] if e < 0 else data[j + 1:e]).decode(ENC))
            j += 1
        return out + [""] * (CTY_LINES - len(out))
    return [""] * CTY_LINES


def owner_line(k, state, c) -> str:
    if not intact(state, c):
        return k.text.S(CITY_TEXT, 2)
    owner = c.owner & 0xFF
    if owner == NEUTRAL_OWNER:
        return k.text.S(CITY_TEXT, 3)
    return k.text.S(CITY_TEXT, 4, state.players[owner].name)


def draw_header(scr, fb) -> None:
    """The lines ovl45:0727 and ovl45:1769 share: name, two shields, income / defence / owner."""
    k, st, c = scr.kit, scr.state, scr.city
    exe = k.exe
    text_centred(fb, k.fonts[CHANCE36], *NAME_AT, c.name, INK, SHADOW)
    for off in SHIELDS_AT:
        shield(fb, k, c.owner & 0xFF, 0, *_point(exe, off))
    f = k.fonts[CHANCE17]
    whole = intact(st, c)
    texts = (k.text.S(CITY_TEXT, 0, c.income if whole else 0), k.text.S(CITY_TEXT, 1, c.defence if whole else 0),
             owner_line(k, st, c))
    for off, s in zip(LINES_AT, texts):
        f.draw(fb, *_point(exe, off), s, INK, SHADOW)


def draw_picture(scr, fb) -> None:
    from .setup_side import bevel
    import pygame
    k, c, w = scr.kit, scr.city, scr.state.world
    pygame.draw.rect(fb, 0, PICTURE_FRAME, 1)
    bevel(fb, PICTURE_BEVEL, 4, 2)
    blit_opaque(fb, k.picture(CITYBACK), CITYBACK_AT, CITYBACK_SRC)
    for at, (dx, dy) in TILES_AT:
        tile = w.tiles[(c.y + dy) * MAP_W + c.x + dx] & 0xFF
        if tile // 0x60 >= SHEETS:
            raise NotImplementedError(f"tile {tile:#x}: ovl64:0860 reads picture slot {tile // 0x60} "
                                      "(DS:5133 + 0x3b n is not a scenery bitmap)")
        sheet, src = tile_cell(tile)
        blit_opaque(fb, scr.sprites.scenery[sheet], at, src)


def draw(scr, fb) -> None:
    """ovl45:0727."""
    k, st, c = scr.kit, scr.state, scr.city
    exe = k.exe
    draw_header(scr, fb)
    if shows_slots(st, c):
        for i in range(4):
            scr.painter.army(fb, s8(c.slots[i].type), c.owner & 0xFF, *_point(exe, SLOTS_AT + 4 * i), ring=1)
    else:
        draw_picture(scr, fb)
    p = capital_of(st, c)
    if p >= 0:
        shield(fb, k, p, 4, *CROWN_AT)
    f = k.fonts[CHANCE17]
    for i, s in enumerate(scr.description(1)):
        f.draw(fb, *_point(exe, DESCRIPTION_AT + 4 * i), s, INK, SHADOW)


def slot_press(scr, pos) -> None:
    """ovl45:1c35(pointer): the right press over area 14."""
    host, k, st, c = scr.host, scr.kit, scr.state, scr.city
    slot = min(max(int((pos[0] - SLOT_X0) / SLOT_PITCH), 0), SLOT_MAX)
    if shows_slots(st, c):
        s = c.slots[slot] if slot < 4 else None
        if s is not None and s8(s.type) >= 0:
            registry.open_dialog("info/army_type", host, type_id=s8(s.type), time=s.time, strength=s.strength,
                                 cost=s.cost, moves=s.moves, pos=pos, player=c.owner & 0xFF)
            return
        text = NO_PRODUCTION_TEXT
    else:
        text = PICTURE_TEXT
    host.dialogs.push(Panel(k, host.app.input, panel_rect(pos), POPUP, two_lines(k, c.name, ds_str(k.exe, text))))
