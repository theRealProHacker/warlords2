"""View -> Stack (menu 529, key 's'): the large stack dialog.

Evidence (asm ovl66; button ids from the jump table 07be:0b0c, tables and strings from DGROUP,
read from the user's EXE):
* open 07be:0235 -> ovl66:0c9c: nothing without DS:5e62; the palette arrays DS:6862 (armies),
  DS:6852 (palette index), DS:6842 (selected), DS:6832 (marks), DS:6830 and the count DS:30f6
  are copied to DS:6810 / 6800 / 67f0 / 67e0 / 67de / 3126; ovl66:0e85(1, 0, -1) draws,
  DS:166a = 1, ovl53:056a(0x12) screen 18 (BUTTON.DAT 332 OK, 333 Cancel, 334 Group All,
  335 Ungroup All, 336 + i Select Army, 344 + i Select Group), ovl66:1425 button states;
* ovl66:1425: 332 / 333 normal; 334 / 335 normal when DS:30f6 > 1, else disabled; 336 + i and
  344 + i normal for i < DS:30f6, else disabled (they have no picture);
* the buttons edit the live palette arrays and redraw (ovl66:0e85(0, 0, -1) / (0, 0, 0)), with
  no apply step: 336 + i -> ovl66:157d(i) (Select Army: an unselected army takes the index of
  the first selected one and is selected; a selected one leaves for the lowest unused index and
  is deselected unless it is alone in its index; then the sort ovl66:17e7(1)); 344 + i ->
  ovl66:166f(i) (exactly the armies of i's index selected; 17e7(0)); 334 -> ovl66:16c5 (every
  index 0 and selected; 17e7(1)); 335 -> ovl66:1704 (index i, only slot 0 selected; 17e7(1));
  ovl66:17e7 is `rules.selection.sort_palette` (with 1) plus the marks (`ui.palettes.marks`);
* 332 -> ovl66:14d3: close (ovl17:069c), ovl61:0000(0, 0) (DS:166a = 0, the game screen and
  ovl61:0174), the apply step ovl66:000a(0) (`rules.selection.apply_palette`) and the palette
  ovl66:0356; 333 -> ovl66:14fd: the copies put back, close, ovl61:0000(0, 0);
* keys (07be:0064 with DS:166a set, `ui.keys`): Esc / Return press the first normal button of
  the lists DS:1514 / DS:155c, on this screen 333 / 332; 'A'..'Z' nothing; every other key,
  Del included, the chord (07be:03ef returns 1, so the key table cs:0337 is never reached);
  a left press on a disabled button chords (07be:0e7b);
* drawing ovl66:0e85(full, first, last): full -> popup type 0 (ovl17:0000(0)), STACK.PCK
  (picture 46) rectangle DS:30fa masked (0997:027e) at DS:3102, SetFont(2, 15, 0, 3) and
  the DS:320d format with SCN 0x112 left-aligned (ovl59:00bf) at (480, 66); the strengths
  ovl66:1b9c; for i < DS:30f6 the mark DS:6832[i] != -1 as ABITS DS:30b2 + 8 * mark (opaque,
  0997:0129) at DS:3106[i] + (-32, 5) (a -1 mark is the marble, ovl17:070b(0, 35 + 30 i, 32, 30)
  when not full); rows i = 0..7 (`first` is always 0, so all eight): for i < DS:30f6
  ovl64:08be(army +4, SCN 0x110, at DS:3106[i], ring (SCN 0x110 + DS:6852[i]) % 8 + 2, mode 0,
  greyed = not selected); a non-hero whose DS:45c8 byte (w13) is 0 gets its +0xa medals, medal
  k the ABITS rectangle DS:2fa6 + 8 k at (x + 32 + k / 2 * 8, y + 8 + k % 2 * 9); the hero's
  name (2c04:0223 + 0x14 * +0xa) or the type name (ovl44:14f4) at (x + 48, y + 5); "%d"
  (DS:3217) of +8 (+ ovl38:0d1a battle items for a hero), at most 9, at (x + 168, y + 5);
  for a selected army DS:321a of its stack strength at (x + 184, y + 5); "%d"
  (DS:321f) of +7 at (x + 232, y + 5); at (x + 256, y + 8) the ABITS movement cell: flies
  (DS:45c4, or a hero with a flight item, ovl35:08b4) DS:3046, aboard (+0xc & 0x1000)
  DS:3066, w17 and w18 DS:305e, w17 DS:3056, w18 DS:304e, else none; the bonus text
  ovl66:1a07(type, army) at (x + 304, y + 5); for i >= DS:30f6 ovl64:08be(-1, ring 1).  The
  partial restores of a redraw (ovl17:070b of the marble) cover everything a redraw changes,
  so the dialog is drawn whole every frame;
* stack strengths ovl66:1b9c (selected armies only): class c = ovl38:0000 of DS:5e62's square;
  over the selected armies not aboard: a hero adds DS:0ce4[min(+8 + battle items, 9)] +
  ovl38:0d71 command items; any other army raises the running maximum of its w[9 + c]
  (each increase added); the sum is capped at SCN 0x112 (signed); then each selected army:
  aboard 4, else +8 (+ battle items for a hero, + w[5 + c] otherwise), at most 9, plus the sum;
* bonus text ovl66:1a07(type, army) into DS:5c88 from STRING group 0xa3 (`bonus_text`).
* right press over a shown button (any state, 08a9:0756): its HLP record (ovl15:0000); 336-343
  carry selectors 37-44,
  ovl66:1747(i) on the edited arrays: the army panel of palette slot i (ovl46:0626) or
  the DS:3222 / DS:322e texts.

Engine: the dialog edits a copy of the state's palette (`work`) with the engine's own sort;
OK sends the three arrays as they are (`SetPalette`, rules.selection.set_palette: ovl66:000a).
Select Army on an unselected army with none selected reads an uninitialised register in
ovl66:157d (si); that press is logged and ignored.
"""
from __future__ import annotations

import logging

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17
from ...assets.text import printf
from ...model import commands as C
from ...model.army import NO_TYPE
from ...model.ids import HERO_TYPE
from ...rules.bonuses import battle_class, battle_items, command_items, s8
from ...rules.movement import carried_count, type_flag
from .. import registry
from ..dialog import Dialog
from ..keys import code_of, left_press, popup_key
from ..layout import DISABLED, NORMAL
from ..menubar import with_codes
from ..palettes import ABITS, leader, marks, painter_for
from ..typename import type_name
from ..widgets import ButtonRow, blit_opaque, kit

log = logging.getLogger(__name__)

POPUP, SCREEN, STACK_PCK = 0, 18, 46
OK, CANCEL, GROUP_ALL, UNGROUP_ALL = 332, 333, 334, 335
SELECT_ARMY, SELECT_GROUP = 336, 344
SLOTS = 8
HEADER_SRC, HEADER_AT = 0x30FA, 0x3102
MAX_FMT, MAX_AT = 0x320D, (0x1E0, 0x42)
ROW_AT = 0x3106                                  # 8 (x, y)
STR_FMT, STACK_FMT, MOVES_FMT = 0x3217, 0x321A, 0x321F
MARK_SRC, MARK_DX, MARK_DY = 0x30B2, -0x20, 5
MEDAL_SRC, MEDAL_DX, MEDAL_DY, MEDAL_STEP_X, MEDAL_STEP_Y = 0x2FA6, 0x20, 8, 8, 9
NAME_DX, STR_DX, STACK_DX, MOVES_DX, KIND_DX, BONUS_DX, TEXT_DY = 0x30, 0xA8, 0xB8, 0xE8, 0x100, 0x130, 5
KIND_DY = 8
KIND_FLY, KIND_BOAT, KIND_BOTH, KIND_FOREST, KIND_HILLS = 0x3046, 0x3066, 0x305E, 0x3056, 0x304E
HERO_TABLE = 0x0CE4                              # words, DS:0ce4
HERO_CAP, STRENGTH_CAP, BOAT = 9, 9, 4           # ovl66:1c40, 1e10, 1d79
SCN_CAP = 0x112
INK, SHADOW = 15, 0
ABOARD = 0x1000
FLIGHT_ITEM = 5                                  # ovl35:08b4 counts item type 5
SELECTOR_TEXTS = (0x3222, 0x322E)                # ovl66:17d6 / 17da
SELECTORS = range(37, 45)
# STRING group 0xa3 (ovl66:1a07)
BONUS_GROUP = 0xA3
B_NONE, B_BOAT, B_HERO, B_CANCEL_HERO, B_CANCEL_STACK, B_SPECIAL, B_CANCEL_CITY, B_ENEMY = range(8)
B_STACK_HILLS, B_STR_HILLS, B_TO_STACK = 8, 12, 16
HERO_BONUS_CAP = 6                               # ovl66:1aac


def hero_entry(exe, i: int) -> int:
    """DS:0ce4[i] as the EXE reads it (no bound: ovl66:1a9a indexes it with +8 + items)."""
    return ds_words(exe, HERO_TABLE + 2 * i, 1)[0]


def s16(v: int) -> int:
    v &= 0xFFFF
    return v - 0x10000 if v & 0x8000 else v


def _w(t, name):
    return getattr(t, name)


STACK_WORDS = ("stack_bonus_city", "stack_bonus_open", "stack_bonus_woods", "stack_bonus_hills")
OWN_WORDS = ("str_bonus_city", "str_bonus_open", "str_bonus_woods", "str_bonus_hills")


def bonus_text(k, state, type_id: int, army=None) -> str | None:
    """ovl66:1a07(type, army): STRING (0xa3, n), "%d" filled.  None where the original reads
    uninitialised stack (a hero type without an army: ovl66:1a70..1a7a skip both the record
    fetch and the hero branch).  Type byte 0xff: ovl44:14ac (1a68) copies nothing into the
    call's own buffer [bp-0x40], which holds stack contents interrupts may have overwritten
    (not determinable); `NO_TYPE`'s zeros stand in (X36 c)."""
    S = lambda n, *a: k.text.S(BONUS_GROUP, n, *a)
    if army is not None and army.flags & ABOARD:
        return S(B_BOAT)
    if type_id == HERO_TYPE:
        if army is None:
            return None
        v = hero_entry(k.exe, s8(army.strength) + battle_items(state, army)) + command_items(state, army)
        return S(B_HERO, min(v, HERO_BONUS_CAP))
    t = state.army_type(type_id)
    if t.cancel_mode == 2:
        return S(B_CANCEL_HERO)
    if t.cancel_mode == 3:
        return S(B_CANCEL_STACK)
    if t.special:
        return S(B_SPECIAL, t.stack_bonus_open)                  # ovl66:1ad6 pushes w10
    if t.stack_bonus_hills and t.stack_bonus_woods and t.stack_bonus_open and t.stack_bonus_city:
        return S(B_TO_STACK, t.stack_bonus_city)
    if t.cancel_mode == 1:
        return S(B_CANCEL_CITY)
    if t.enemy_stack_mod:
        return S(B_ENEMY, t.enemy_stack_mod)
    order = (t.stack_bonus_hills, t.stack_bonus_woods, t.stack_bonus_open, t.stack_bonus_city,
             t.str_bonus_hills, t.str_bonus_woods, t.str_bonus_open, t.str_bonus_city)
    for n, v in enumerate(order):
        if v:
            return S(B_STACK_HILLS + n, v)
    return S(B_NONE)


def _fetch(state, t: int, buf):
    """ovl44:14ac(t, buf): the record with id t, or `buf` unchanged when none has it (type
    byte 0xff, X36)."""
    rec = state.army_type(t)
    return buf if rec is NO_TYPE else rec


def stack_strengths(k, state, sel) -> dict:
    """ovl66:1b9c: {palette slot: strength} for the selected slots.  Its one record buffer
    [bp-0x50] serves both loops (fetch 1c1a for a selected non-hero not aboard, 1d5d for a
    selected non-hero before the aboard test), so an army of type byte 0xff uses the record
    fetched last in that call; before the first fetch the buffer is stack contents that
    interrupts may have overwritten (not determinable): `NO_TYPE`'s zeros stand in."""
    lead = leader(state)
    c = battle_class(state, lead.x, lead.y)
    total, best = 0, [0, 0, 0, 0]
    buf = NO_TYPE
    for i, aid in enumerate(sel.palette):
        a = state.armies[aid]
        if not sel.palette_selected[i] or a.flags & ABOARD:
            continue
        if a.type_id == HERO_TYPE:
            v = min(s8(a.strength) + battle_items(state, a), HERO_CAP)
            total += hero_entry(k.exe, v) + command_items(state, a)
            continue
        buf = _fetch(state, a.type_id, buf)
        w = _w(buf, STACK_WORDS[c])
        if w and w > best[c]:
            total += w - best[c]
            best[c] = w
    cap = s16(state.flags[SCN_CAP])
    if cap < total:                                          # ovl66:1cff (signed)
        total = cap
    out = {}
    for i, aid in enumerate(sel.palette):
        if not sel.palette_selected[i]:
            continue
        a = state.armies[aid]
        if a.type_id != HERO_TYPE:
            buf = _fetch(state, a.type_id, buf)
        v = s8(a.strength)
        if a.flags & ABOARD:
            v = BOAT
        elif a.type_id == HERO_TYPE:
            v += battle_items(state, a)
        else:
            v += _w(buf, OWN_WORDS[c])
        out[i] = min(v, STRENGTH_CAP) + total
    return out


def select_army(sel, c: int) -> bool:
    """ovl66:157d(c) without its sort; False when no army is selected for an unselected c."""
    if not sel.palette_selected[c]:
        first = next((i for i, s in enumerate(sel.palette_selected) if s), None)
        if first is None:
            return False
        sel.palette_group[c] = sel.palette_group[first]
        sel.palette_selected[c] = 1
        return True
    counts = [0] * SLOTS
    for g in sel.palette_group:
        counts[g] += 1
    if counts[sel.palette_group[c]] != 1:
        sel.palette_selected[c] = 0
        sel.palette_group[c] = next(g for g in range(SLOTS) if counts[g] == 0)
    return True


def _arrays(sel):
    return list(sel.palette), list(sel.palette_group), list(sel.palette_selected)


class Stack(Dialog):
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        from ...rules.selection import sort_palette
        self._sort = sort_palette
        self.host = host
        k = self.k = kit(host.app)
        exe = k.exe
        self.work = host.state.copy()                      # DS:6862.. edited, the real ones kept
        self.start = _arrays(host.state.selection)
        self.font = k.fonts[CHANCE17]
        self.header = (ds_words(exe, HEADER_SRC, 4), ds_words(exe, HEADER_AT, 2))
        self.max_fmt = ds_str(exe, MAX_FMT)
        self.rows = [ds_words(exe, ROW_AT + 4 * i, 2) for i in range(SLOTS)]
        self.fmts = [ds_str(exe, o) for o in (STR_FMT, STACK_FMT, MOVES_FMT)]
        self.kind = {n: ds_words(exe, o, 4) for n, o in (("fly", KIND_FLY), ("boat", KIND_BOAT),
                     ("both", KIND_BOTH), ("forest", KIND_FOREST), ("hills", KIND_HILLS))}
        self.mark_src = (ds_words(exe, MARK_SRC, 4), ds_words(exe, MARK_SRC + 8, 4))
        self.painter = painter_for(host)
        layout = k.layouts.screen(SCREEN)
        self.row = ButtonRow(list(layout.buttons), k.picture)
        self.names = None                                  # the rows' names of the last 0e85
        self.states()

    @property
    def sel(self):
        return self.work.selection

    def states(self) -> None:
        """ovl66:1425."""
        n = len(self.sel.palette)
        st = self.row.state
        st[OK] = st[CANCEL] = NORMAL
        st[GROUP_ALL] = st[UNGROUP_ALL] = NORMAL if n > 1 else DISABLED
        for i in range(SLOTS):
            st[SELECT_ARMY + i] = st[SELECT_GROUP + i] = NORMAL if i < n else DISABLED

    # ---------------------------------------------------------------- input
    def update(self, events, dt) -> None:
        app = self.host.app
        for e, code in with_codes(events, app.input):
            hit = None
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                self.help(e.pos)
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                left_press(app, self.row, e)
            elif e.type in (pygame.MOUSEBUTTONUP, pygame.MOUSEMOTION):
                hit = self.row.event(e)
            elif e.type == pygame.KEYDOWN:
                hit = popup_key(app, self.row, code_of(e, code), self.k.exe)
            if hit is not None:
                self.press(hit)
            if self.stack is None or self.stack.top is not self:
                return

    def help(self, pos) -> None:
        """ovl15:0000 on the button under the pointer; 336-343 -> ovl66:1747 on the edited arrays."""
        b = self.row.at(pos)                             # 08a9:0756: any state
        if b is None or self.row.held is not None:       # 08a9:0143: DS:166c skips ovl15:0000
            return
        rec = self.k.text.hlp(b.id)
        if rec is not None and rec["word2"] in SELECTORS:
            i = rec["word2"] - SELECTORS.start
            if i < len(self.sel.palette):
                registry.open_dialog("info/army_unit", self.host, army=self.sel.palette[i], pos=pos)
            else:
                registry.open_dialog("info/text", self.host, title=ds_str(self.k.exe, SELECTOR_TEXTS[0]),
                                     text=ds_str(self.k.exe, SELECTOR_TEXTS[1]), pos=pos)
            return
        fn = registry.right_click_handler("button")
        if fn is not None:
            fn(self.host, b.id, pos)

    def press(self, id: int) -> None:
        """07be:0940..0974."""
        sel = self.sel
        if id == OK:
            self.close(None)
            self.apply()
            return
        if id == CANCEL:
            self.close(None)
            refresh = getattr(getattr(self.host, "phase", None), "refresh", None)
            if refresh is not None:
                refresh()                                    # ovl61:0000(0, 0) -> 0174
            return
        if SELECT_ARMY <= id < SELECT_ARMY + SLOTS:
            if not select_army(sel, id - SELECT_ARMY):
                log.warning("ovl66:157d: Select Army with no army selected reads an uninitialised "
                            "register; ignored")
                return
            self._sort(self.work)
        elif SELECT_GROUP <= id < SELECT_GROUP + SLOTS:
            g = sel.palette_group[id - SELECT_GROUP]       # ovl66:166f, 17e7(0)
            sel.palette_selected = [int(x == g) for x in sel.palette_group]
        elif id == GROUP_ALL:                              # ovl66:16c5
            sel.palette_group = [0] * len(sel.palette)
            sel.palette_selected = [1] * len(sel.palette)
            self._sort(self.work)
        elif id == UNGROUP_ALL:                            # ovl66:1704
            sel.palette_group = list(range(len(sel.palette)))
            sel.palette_selected = [1] + [0] * (len(sel.palette) - 1)
            self._sort(self.work)
        self.names = None                                  # ovl66:0e85(0, 0, ...) redraws
        self.states()

    # ---------------------------------------------------------------- OK
    def apply(self) -> None:
        """ovl66:14d3: the edited arrays DS:6862 / 6852 / 6842, in palette order as the buttons
        left them, to the apply step ovl66:000a (`SetPalette`)."""
        sel = self.sel
        cmd = C.SetPalette(tuple(sel.palette), tuple(sel.palette_group), tuple(sel.palette_selected))
        phase = getattr(self.host, "phase", None)
        if phase is not None and hasattr(phase, "apply"):
            phase.apply(cmd)
        else:
            self.host.apply(cmd)

    # ---------------------------------------------------------------- drawing
    def draw(self, fb) -> None:
        k, st, sel = self.k, self.work, self.sel
        exe = k.exe
        f = self.font
        k.draw_popup(fb, POPUP)
        src, at = self.header
        fb.blit(k.picture(STACK_PCK), at, src)
        f.draw(fb, *MAX_AT, printf(self.max_fmt, st.flags[SCN_CAP]), INK, SHADOW)
        strengths = stack_strengths(k, st, sel)
        abits = k.picture(ABITS)
        mk = marks(sel)
        n = len(sel.palette)
        for i in range(n):
            if mk[i] != -1:
                x, y = self.rows[i]
                blit_opaque(fb, abits, (x + MARK_DX, y + MARK_DY), self.mark_src[mk[i]])
        p = st.current
        if self.names is None:
            self.names = self.row_names()
        names = self.names
        for i in range(SLOTS):
            x, y = self.rows[i]
            if i >= n:
                self.painter.army(fb, -1, p, x, y, ring=1)
                continue
            a = st.armies[sel.palette[i]]
            self.painter.army(fb, a.type_id, p, x, y, ring=(p + sel.palette_group[i]) % 8 + 2,
                              greyed=not sel.palette_selected[i])
            hero = a.type_id == HERO_TYPE
            if not hero and type_flag(st, a.type_id, "special") == 0:
                for m in range(s8(a.medals)):
                    blit_opaque(fb, abits, (x + MEDAL_DX + m // 2 * MEDAL_STEP_X,
                                            y + MEDAL_DY + m % 2 * MEDAL_STEP_Y),
                                ds_words(exe, MEDAL_SRC + 8 * m, 4))
            f.draw(fb, x + NAME_DX, y + TEXT_DY, names[i], INK, SHADOW)
            v = s8(a.strength) + (battle_items(st, a) if hero else 0)
            f.draw(fb, x + STR_DX, y + TEXT_DY, printf(self.fmts[0], min(v, STRENGTH_CAP)), INK, SHADOW)
            if sel.palette_selected[i]:
                f.draw(fb, x + STACK_DX, y + TEXT_DY, printf(self.fmts[1], strengths[i]), INK, SHADOW)
            f.draw(fb, x + MOVES_DX, y + TEXT_DY, printf(self.fmts[2], s8(a.moves_left)), INK, SHADOW)
            cell = self.kind_cell(st, a)
            if cell is not None:
                blit_opaque(fb, abits, (x + KIND_DX, y + KIND_DY), cell)
            text = bonus_text(k, st, a.type_id, a)
            f.draw(fb, x + BONUS_DX, y + TEXT_DY, text, INK, SHADOW)
        self.row.draw(fb)

    def row_names(self) -> list:
        """The names ovl66:0e85 draws (1106..1145): a hero's (2c04:0223 + 0x14 * +0xa), else
        ovl44:14f4(+4), in row order, so a type 0xff row shows DS:4468 as the rows above (or
        the last look-up before) left it (`ui.typename`).  The EXE draws only at the open and
        after an edit button, so the names are taken then and kept between frames."""
        from ...rules.heroes import hero_name
        st = self.work
        out = []
        for aid in self.sel.palette:
            a = st.armies[aid]
            out.append(hero_name(st, a) if a.type_id == HERO_TYPE else type_name(self.k, st, a.type_id))
        return out

    def kind_cell(self, st, a):
        """ovl66:129a..137d."""
        t = a.type_id
        if type_flag(st, t, "flag16") or (t == HERO_TYPE and carried_count(st, a, FLIGHT_ITEM)):
            return self.kind["fly"]
        if a.flags & ABOARD:
            return self.kind["boat"]
        forest, hills = type_flag(st, t, "flag17"), type_flag(st, t, "flag18")
        if forest and hills:
            return self.kind["both"]
        if forest:
            return self.kind["forest"]
        if hills:
            return self.kind["hills"]
        return None


@registry.dialog("stack")
def stack(host, on_close=None):
    return Stack(host, on_close)


@registry.action(registry.MENU_ID["stack"])
def open_stack(host):
    """07be:0235 -> ovl66:0c9c (nothing without DS:5e62)."""
    st = getattr(host, "state", None)
    if st is None or leader(st) is None:
        return None
    return registry.open_dialog("stack", host)
