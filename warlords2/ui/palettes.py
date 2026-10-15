"""The bottom-left info area / stack palette and the action palette of the game screen.

Pictures: 8 = ABITS.PCK, 25 = MARBLE.PCK, 4 = BUTTON.PCK, 43 = MENUBUTT.PCK, the army sheets
a0..a8 (16 + player) and ASHADOW.PCK (42).  Rectangles and points are read from the EXE where
it keeps them in DGROUP.  Opaque copies are 0997:0129 / [DS:2a74] / [DS:69d4], masked ones
[DS:2a68] / [DS:69c8]; `14d0:0002(3)` + `116d:0288` fill a rectangle with colour 3.

Army icon ovl64:08be(type, player, dst, x, y, .., moves +0x16, strength +0x18, ring +0x1a,
mode +0x1c, greyed +0x1e) (asm ovl64:08be..0be3): player 0xf -> 8; a ring r != 0 is ABITS
((r - 1) * 32, 0, 32, 30) at (x, y) (+20 in mode 1); a type >= 0 is the cell (t % 16 * 32,
t / 16 * 30, 32, 29) of a<player> through the army mask DS:4ee5, or of ASHADOW through its mask
DS:521f when greyed, at the same place; mode 2 draws "%02d" of the moves (DS:2f44) at
(x + 8, y + 31), each character the ABITS rectangle DS:2cd6 + 8 * code, 8 px apart (only the
fourth of its four lines is drawn in mode 2, asm 0997..0a1e).  Modes 0 and 2 only are used here.

Info area ovl66:05a3 (no selected stack, DS:30f8 = 1): the marble strip ovl61:0aeb (MARBLE
(0, 60, 360, 66) at (16, 403)), SetFont(2, 15, 0, 3), four ABITS 40x20 icons and left-aligned
(ovl59:00bf) "%d" (DS:3128) / "%dgp" numbers: cities DS:5dea[p], gold 2c04:0185 + 0x14 p,
income DS:5dca[p], upkeep DS:5dda[p] (`GameState.city_counts` / `income_cache` / `upkeep_cache`,
written where rules/economy.py lists, so they can be stale).  The numbers are pixels the EXE
draws only when ovl66:0356 runs (05a3 is its no-selection branch): the commands that end in it
(`rules.selection.redraw_palette`, counted in `GameState.palette_draws`), ovl61:011f(x, y, 1)
and ovl61:0000(x, 0) (`states.game.Game.palette_drawn`).  ovl61:011f(0, 0, 0), the close of
the reports, the history, the item and diplomacy dialogs, ..., skips it (0140 / 014b / 0162),
so the area keeps what it showed (`Painter.info`), e.g. the upkeep from before Report > Gold
refreshed DS:5dda.

Stack palette ovl66:0356 (a selected stack): when the info area was showing, the marble strip
first (DS:30f8 != 0 -> ovl61:0aeb); slot i of the palette (DS:6862, count DS:30f6) at DS:2fc6[i]
through 08be(type, SCN 0x110, ring (SCN 0x110 + DS:6852[i]) % 8 + 2, mode 2, greyed =
DS:6842[i] == 0); under it the mark DS:6832[i] at DS:30c2[i]: 0 -> ABITS DS:30b2 (cross), 1 ->
DS:30ba (tick), -1 -> colour-3 fill (32x16).  Empty slots: 08be(type -1, ring 1) and colour-3
fills of DS:2fe6 + 8 i and of the mark.  The "Grp" button art: ABITS (288, 19, 32, 19) when
ovl66:0567 holds, else (288, 0, 32, 19), at DS:30f2.  Right end ovl66:070d: "Group" ABITS
(0, 30, 32, 8) at (344, 420), "Move" (32, 30, 32, 8) at (344, 428), "%02d" (DS:313d) of DS:5e00
(the lowest moves of the selected palette armies, 0c8c:0912, from 100), character i at the
point DS:303e + 4 i ((352, 436), (360, 436); the table has two entries, so the third
character of "100" - no palette army selected - lands on the next words, DS:3046 = (184, 30),
in the map view, asm ovl66:07c0..07fc), and at DS:306e the first of: flying stack (0c8c:07fa
over the selected slots; its all-fly flag starts at 1, so with none selected it says fly)
(184, 30), every selected army aboard (the flag starts at 1) (424, 30), a selected forest
and a selected hills army (DS:45c5 / 45c6 of the type) (216, 30), forest (248, 30), hills
(152, 30), else a colour-3 fill (32x10).

Marks ovl66:17e7 (after every palette button and the palette build): [0] = 0; i > 0: -1 when
DS:6852[i] equals [i - 1], else 0; when the selected slots are exactly the palette group of the
first selected slot f, [f] = 1.  ovl66:0567: a selected stack and (one palette army or all
selected).

Button states ovl61:0174 (after every order; it ends with the menu refresh ovl61:0519,
`ui.game_menus`, before the shortcut buttons ovl14:00aa): 173 Move when DS:5e62 and DS:2ea6 > DS:2ea8 (path
marks left); 174 Next when ovl67:09e7 (an own army on the map awake and not done); 175 with that
and DS:5e62; 176, 177, 178, 186 with DS:5e62; 187 with DS:5e62 and a goto; 188 and 320-327
always; 224 + i / 232 + i live for i < DS:30f6, else hidden; with DS:5e62, 241 live and 240
hidden when 0567 holds, else the other way; without DS:5e62 177, 178, 240, 241 disabled.
Diplomacy: option off (SCN 0x11c) -> 183 disabled, 184 / 185 hidden; else 2c04:153b[9 p] bit 4
clear -> 183, bit 4 without bit 5 -> 184, both -> 185 live, the other two hidden.
Shortcut buttons 179-182 (ovl14:00aa): live when the menu action UDB.CUR[i] is enabled
(1372:0f9f), else disabled; their art (ovl14:030a) is copied into BUTTON.PCK from MENUBUTT.PCK:
the UDB.DAT record's large rectangle to (32, 28), (96, 28), (32, 56), (96, 56) (normal + pressed
cells) and its small one to (32, 0), (64, 0), (96, 0), (128, 0) (disabled); an empty slot (id 0)
takes DS:049e / DS:04a6.  The record is the one with the slot's id ([I]: the lookup ovl14:050b
is not traced).  A press runs that menu action (ovl14:0072).
"""
from __future__ import annotations

import pygame

from ..assets.exe import ds_str, ds_words
from ..assets.fonts import CHANCE17
from ..assets.text import printf
from ..formats.tables import parse_udb
from ..model.ids import HERO_TYPE
from ..rules.bonuses import s8
from . import registry
from .game_menus import refresh_menus
from .layout import DISABLED, NORMAL
from .widgets import ButtonRow, blit_opaque, kit

ABITS, MARBLE, BUTTON_PCK, MENUBUTT, ASHADOW = 8, 25, 4, 43, 42
ARMY_SHEET0 = 16
FILL = 3
INK, SHADOW = 15, 0
SCREEN = 0                                    # JOIN screen of the game frame

STRIP_SRC, STRIP_AT = (0, 60, 360, 66), (16, 403)          # ovl61:0aeb
ICON_W, ICON_H, ICON_PITCH = 32, 29, 30
RING_W, RING_H = 32, 30
DIGIT_DX, MOVES_AT = 8, (8, 31)
DIGITS = 0x2CD6                               # 8 bytes per character code
MOVES_FMT = 0x2F44
SLOT_AT, MARK_AT, CLEAR_RECT = 0x2FC6, 0x30C2, 0x2FE6
MARK_SRC = 0x30B2                             # cross, tick (4 words each)
MARK_W, MARK_H = 32, 16
GRP_AT, GRP_GREEN, GRP_RED = 0x30F2, (288, 19, 32, 19), (288, 0, 32, 19)
GROUP_LABEL, MOVE_LABEL = ((0, 30, 32, 8), (344, 420)), ((32, 30, 32, 8), (344, 428))
GROUP_MOVES_AT, GROUP_MOVES_FMT = 0x303E, 0x313D          # character points, "%02d"
KIND_AT, KIND_W, KIND_H = 0x306E, 32, 10
KIND_FLY, KIND_BOAT, KIND_BOTH, KIND_FOREST, KIND_HILLS = (184, 30), (424, 30), (216, 30), (248, 30), (152, 30)
ABOARD = 0x1000
INFO = (((344, 0), (32, 425), (72, 425)), ((344, 20), (120, 425), (144, 425)),
        ((384, 0), (200, 425), (232, 425)), ((384, 20), (280, 425), (320, 425)))
INFO_ICON = (40, 20)
INFO_FMTS = (0x3128, 0x312B, 0x3130, 0x3135)

MOVE, NEXT, QUIT_NEXT, DEFEND, CENTRE, DESELECT = 173, 174, 175, 176, 177, 178
SHORTCUTS = (179, 180, 181, 182)
DIPLOMACY = (183, 184, 185)
PATH, CANCEL_PATH, HELP = 186, 187, 188
SCROLL = range(320, 328)
SELECT_ARMY, SELECT_GROUP = range(224, 232), range(232, 240)
GROUP_ALL, UNGROUP_ALL = 240, 241
SELF_PROPOSAL, ALL_HOSTILE = 0x10, 0x20       # 2c04:153b[9 p] bits (ovl00:0cc7)
SHORTCUT_LARGE_AT = ((32, 28), (96, 28), (32, 56), (96, 56))
SHORTCUT_SMALL_AT = ((32, 0), (64, 0), (96, 0), (128, 0))
EMPTY_LARGE, EMPTY_SMALL = 0x049E, 0x04A6


def _rect(exe, off):
    return ds_words(exe, off, 4)


def _live(state, aid):
    a = state.armies[aid] if 0 <= aid < len(state.armies) else None
    return a if a is not None and a.owner != 0xFF else None


def leader(state):
    """DS:5e62 as a live army of the side whose turn it is, else None."""
    a = _live(state, state.selection.selected)
    return a if a is not None and a.owner == state.current and a.x >= 0 else None


def palette_count(state) -> int:
    """DS:30f6 (the length of the last palette built)."""
    return len(state.selection.palette)


def marks(sel) -> list[int]:
    """DS:6832 as ovl66:17e7 leaves it."""
    g, chosen = sel.palette_group, sel.palette_selected
    out = [0 if i == 0 or g[i] != g[i - 1] else -1 for i in range(len(g))]
    f = next((i for i, c in enumerate(chosen) if c), None)
    if f is not None and all(bool(c) == (gi == g[f]) for c, gi in zip(chosen, g)):
        out[f] = 1
    return out


def one_group(state) -> bool:
    """ovl66:0567."""
    sel = state.selection
    return leader(state) is not None and (len(sel.palette) == 1 or all(sel.palette_selected))


def lowest_moves(state) -> int:
    """The number ovl66:070d prints (0773): DS:5e00 (`Selection.moves`), which the draw has
    just recomputed through 0c8c:0912 (0750); the engine stores that write at every draw the
    commands end in (`rules.selection.redraw_palette`), so the stored word is the printed one."""
    return state.selection.moves


def selected_armies(state) -> list:
    sel = state.selection
    return [a for a in (_live(state, i) for i, c in zip(sel.palette, sel.palette_selected) if c) if a]


def kind_of(flies: bool, aboard: bool, forest: bool, hills: bool):
    """The ABITS movement-kind cell (ovl66:070d, ovl46:0626), or None for the fill."""
    if flies:
        return KIND_FLY
    if aboard:
        return KIND_BOAT
    if forest and hills:
        return KIND_BOTH
    return KIND_FOREST if forest else KIND_HILLS if hills else None


def kind_cell(state):
    """ovl66:070d: the movement-kind cell of the selected palette armies, or None."""
    from ..rules.movement import stack_flies_07fa, type_flag
    group = selected_armies(state)
    return kind_of(stack_flies_07fa(state, group), all(a.flags & ABOARD for a in group),
                   any(type_flag(state, a.type_id, "flag17") for a in group),
                   any(type_flag(state, a.type_id, "flag18") for a in group))


class Painter:
    """The pictures the bottom-left area draws with."""

    def __init__(self, k, sprites):
        self.k, self.sp = k, sprites
        self.group_moves_at = [ds_words(k.exe, GROUP_MOVES_AT + 4 * i, 2) for i in range(4)]   # "-128" at most
        self.abits = k.picture(ABITS)
        self.marble = k.picture(MARBLE)
        exe = k.exe
        self.digits = {chr(c): _rect(exe, DIGITS + 8 * c) for c in range(32, 127)}   # "%02d" may give "-"
        self.slot_at = [ds_words(exe, SLOT_AT + 4 * i, 2) for i in range(8)]
        self.mark_at = [ds_words(exe, MARK_AT + 4 * i, 2) for i in range(8)]
        self.clear = [_rect(exe, CLEAR_RECT + 8 * i) for i in range(8)]
        self.mark_src = (_rect(exe, MARK_SRC), _rect(exe, MARK_SRC + 8))
        self.grp_at = ds_words(exe, GRP_AT, 2)
        self.kind_at = ds_words(exe, KIND_AT, 2)
        self.moves_fmt = ds_str(exe, MOVES_FMT)
        self.group_fmt = ds_str(exe, GROUP_MOVES_FMT)
        self.info_fmts = [ds_str(exe, o) for o in INFO_FMTS]
        self.info: tuple | None = None            # the numbers ovl66:05a3 drew last

    def palette_drawn(self, state) -> None:
        """ovl66:0356 ran: the info area's numbers as they are now (`info_values`)."""
        self.info = info_values(state)

    def number(self, fb, x: int, y: int, text: str) -> None:
        """ABITS digits, 8 px apart (ovl64:09bf..0a1c, ovl66:070d)."""
        for ch in text:
            blit_opaque(fb, self.abits, (x, y), self.digits[ch])
            x += DIGIT_DX

    def army(self, fb, type_id: int, player: int, x: int, y: int, ring: int = 0,
             greyed: bool = False, moves: int | None = None) -> None:
        """ovl64:08be in mode 0 (moves None) or mode 2."""
        if ring:
            blit_opaque(fb, self.abits, (x, y), ((ring - 1) * RING_W, 0, RING_W, RING_H))
        if type_id >= 0:
            src = (type_id % 16 * ICON_W, type_id // 16 * ICON_PITCH, ICON_W, ICON_H)
            sheet = self.sp.ashadow if greyed else self.sp.armies[min(player, 8)]
            fb.blit(sheet, (x, y), src)
        if moves is not None:
            self.number(fb, x + MOVES_AT[0], y + MOVES_AT[1], printf(self.moves_fmt, moves))

    def strip(self, fb) -> None:
        blit_opaque(fb, self.marble, STRIP_AT, STRIP_SRC)

    def info_area(self, fb, state) -> None:
        """ovl66:05a3 as the last ovl66:0356 drew it (the numbers of `palette_drawn`; before the
        first one, the state's)."""
        if self.info is None:
            self.info = info_values(state)
        values = self.info
        self.strip(fb)
        f = self.k.fonts[CHANCE17]
        for (src, at, text_at), fmt, v in zip(INFO, self.info_fmts, values):
            blit_opaque(fb, self.abits, at, (*src, *INFO_ICON))
            f.draw(fb, *text_at, printf(fmt, v), INK, SHADOW)

    def stack_palette(self, fb, state) -> None:
        """ovl66:0356 + 070d (the marble strip under it: the info area showed before)."""
        sel, p = state.selection, state.current
        self.strip(fb)
        mk = marks(sel)
        for i in range(8):
            x, y = self.slot_at[i]
            mx, my = self.mark_at[i]
            if i < len(sel.palette):
                a = state.armies[sel.palette[i]]
                self.army(fb, a.type_id, p, x, y, ring=(p + sel.palette_group[i]) % 8 + 2,
                          greyed=not sel.palette_selected[i], moves=s8(a.moves_left))
                if mk[i] >= 0:
                    blit_opaque(fb, self.abits, (mx, my), self.mark_src[mk[i]])
                else:
                    fb.fill(FILL, (mx, my, MARK_W, MARK_H))
            else:
                self.army(fb, -1, p, x, y, ring=1)
                fb.fill(FILL, self.clear[i])
                fb.fill(FILL, (mx, my, MARK_W, MARK_H))
        blit_opaque(fb, self.abits, self.grp_at, GRP_GREEN if one_group(state) else GRP_RED)
        for src, at in (GROUP_LABEL, MOVE_LABEL):
            blit_opaque(fb, self.abits, at, src)
        for at, ch in zip(self.group_moves_at, printf(self.group_fmt, lowest_moves(state))):
            blit_opaque(fb, self.abits, at, self.digits[ch])
        cell = kind_cell(state)
        if cell is None:
            fb.fill(FILL, (*self.kind_at, KIND_W, KIND_H))
        else:
            blit_opaque(fb, self.abits, self.kind_at, (*cell, KIND_W, KIND_H))

    def draw(self, fb, state) -> None:
        if leader(state) is None:
            self.info_area(fb, state)
        else:
            self.stack_palette(fb, state)


def info_values(state) -> tuple:
    """What ovl66:05a3 prints for the side on turn: DS:5dea[p], gold, DS:5dca[p], DS:5dda[p]
    (asm ovl66:05f0, 0645, 0695, 06e4)."""
    from ..rules import economy
    p = state.current
    return (economy.cached_cities(state, p), state.players[p].gold, economy.cached_income(state, p),
            economy.cached_upkeep(state, p))


def painter_for(host) -> Painter:
    """The host's Painter (the human phase sets it), made once when there is none."""
    p = getattr(host, "painter", None)
    if p is None:
        p = host.painter = Painter(kit(host.app), host.sprites)
    return p


# --------------------------------------------------------------------------- action palette


def next_exists(state) -> bool:
    """ovl67:09e7: an own army on the map with bit 0 (awake) and without 0x40 (done)."""
    return any(a.owner == state.current and a.x >= 0 and a.flags & 0x01 and not a.flags & 0x40
               for a in state.armies)


def shortcut_ids(app) -> list[int]:
    """UDB.CUR: the four menu action ids of the shortcut slots (the user-dir copy when there
    is one, else the game's own file)."""
    import struct
    p = app.user.root / "UDB/UDB.CUR"                     # a read: no directory made
    data = p.read_bytes() if p.is_file() else app.assets.read("UDB/UDB.CUR")
    return list(struct.unpack_from("<4H", data))


def shortcut_sheet(k, ids: list[int]) -> pygame.Surface:
    """BUTTON.PCK with the shortcut art copied in (ovl14:030a)."""
    sheet = k.picture(BUTTON_PCK).copy()
    src = k.picture(MENUBUTT)
    recs = {r["button_id"]: r for r in parse_udb(k.store.read("UDB/UDB.DAT"))}
    for i, b in enumerate(ids):
        r = recs.get(b)
        large = tuple(r["rect_large"]) if r and b else _rect(k.exe, EMPTY_LARGE)
        small = tuple(r["rect_small"]) if r and b else _rect(k.exe, EMPTY_SMALL)
        blit_opaque(sheet, src, SHORTCUT_LARGE_AT[i], large)
        blit_opaque(sheet, src, SHORTCUT_SMALL_AT[i], small)
    return sheet


class ActionPalette:
    """The live buttons of the game screen (JOIN screen 0) with ovl61:0174's states."""

    def __init__(self, host):
        self.host = host
        k = kit(host.app)
        self.k = k
        self.all = list(k.layouts.screen(SCREEN).buttons)
        self.row = ButtonRow(self.all, k.picture)
        self.reload_shortcuts()
        self.hidden: set[int] = set()

    def reload_shortcuts(self) -> None:
        """UDB.CUR read again and the bar art rebuilt (ovl14:0032 after the shortcut editor's
        Done: 047b writes UDB.CUR, 030a copies the art); the button states stay."""
        k = self.k
        self.shortcuts = shortcut_ids(self.host.app)
        sheet = shortcut_sheet(k, self.shortcuts)
        self.row.picture = lambda n: sheet if n == BUTTON_PCK else k.picture(n)

    def refresh(self, state, marks_left: bool) -> None:
        """ovl61:0174."""
        st, hidden = self.row.state, set()
        lead = leader(state) is not None
        nxt = next_exists(state)

        def put(id, on):
            if self.row.held is None or self.row.held.id != id:      # a held button stays pressed
                st[id] = NORMAL if on else DISABLED

        put(MOVE, lead and marks_left)
        put(NEXT, nxt)
        put(QUIT_NEXT, nxt and lead)
        for id in (DEFEND, CENTRE, DESELECT, PATH):
            put(id, lead)
        a = leader(state)
        put(CANCEL_PATH, a is not None and a.goto[0] >= 0 and a.goto[1] >= 0)
        put(HELP, True)
        for id in SCROLL:
            put(id, True)
        n = palette_count(state)
        for i in range(8):
            for base in (SELECT_ARMY, SELECT_GROUP):
                if i < n:
                    put(base[i], True)
                else:
                    hidden.add(base[i])
        if lead:
            on, off = (UNGROUP_ALL, GROUP_ALL) if one_group(state) else (GROUP_ALL, UNGROUP_ALL)
            put(on, True)
            hidden.add(off)
        else:
            put(GROUP_ALL, False)
            put(UNGROUP_ALL, False)
        if not state.options.diplomacy:
            put(DIPLOMACY[0], False)
            hidden |= {DIPLOMACY[1], DIPLOMACY[2]}
        else:
            b = state.relations[state.current][state.current]
            show = DIPLOMACY[0] if not b & SELF_PROPOSAL else DIPLOMACY[2] if b & ALL_HOSTILE else DIPLOMACY[1]
            put(show, True)
            hidden |= set(DIPLOMACY) - {show}
        bar = self.host.bar.bar
        refresh_menus(bar, self.host.app, state, leader(state))          # ovl61:040d -> 0519
        for id, action in zip(SHORTCUTS, self.shortcuts):
            a = bar.by_id.get(action)
            put(id, a is not None and bar.item_enabled(a.menu, a.item))
        self.hidden = hidden
        self.row.buttons = [b for b in self.all if b.id not in hidden]

    def draw(self, fb) -> None:
        self.row.draw(fb)
