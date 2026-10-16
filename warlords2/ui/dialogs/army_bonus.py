"""View -> Army Bonus (menu 522, key 'o'): the army types of the side in fight order, six rows.

Evidence (asm ovl66; button ids from the jump table 07be:0b0c, tables and strings from DGROUP,
read from the user's EXE):
* open 07be:0208 -> ovl66:1e3b: DS:67d8 (first row) = 0; a 0x3a-byte table (0d28:01d5) gets
  table[signed byte SCN 0x60b + 0x1d * SCN 0x110 + t] = t for t = 0..0x1c (the types in the
  side's fight order); popup type 0 (ovl17:0000(0)), DS:166a = 1, ovl53:056a(0x22) screen 34
  (BUTTON.DAT 490 Done, 491 Up, 492 Down, 493 Page Up, 494 Page Down), ovl66:1fd2(0) draws,
  ovl66:1f51 button states;
* ovl66:1f51: 490 normal; 491 and 493 disabled while DS:67d8 <= 0, else normal; 492 and 494
  disabled while DS:67d8 + 6 >= 0x1b, else normal (so rows 27 and 28 of the table never show);
* 491 -> ovl66:1ed3 (DS:67d8 - 1), 492 -> 1ee9 (+ 1), 493 -> 1eff (- 6, at least 0), 494 ->
  1f26 (+ 6, at most 0x15), each then 1fd2(1) and 1f51; 490 -> ovl66:1eaf: the table freed,
  ovl17:069c, ovl61:011f(0, 0, 0) (DS:166a = 0, the palette refresh ovl61:0174);
* keys (07be:0064 with DS:166a set, `ui.keys`): Esc / Return press the first normal button of
  DS:1514 / DS:155c, here 490; 'A'..'Z' nothing; every other key, Del included, the chord; a
  left press on a disabled button chords (07be:0e7b); a right press over a shown button (any
  state, 08a9:0756) opens its HLP record;
* ovl66:1fd2(redraw): not redraw -> SetFont(1, 15, 0, 3), STRING (0xa4, 0) centred
  (ovl59:00d6) at (320, 62); the bevel 14d0:02e5((124, 146, 434, 186), 4, 2); colour 0
  (14d0:0002) outline 116d:01fd of (125, 147, 432, 184); STACK.PCK (picture 46) rectangle
  (188, 0, 216, 22) masked (0997:027e) at (256, 125).  Redraw -> ovl17:070b(48, 88, 424, 182)
  (the marble inside the outline).  Then SetFont(2, 15, 0, 3) and rows i = 0..5 of type
  t = table[DS:67d8 + i]: ovl64:08be(t, SCN 0x110, (128, 148 + 30 i), ring SCN 0x110 + 2,
  mode 0); the type record (ovl44:14ac): name at (168, 153 + 30 i), "%d" (DS:3249) of w0
  (strength) at (280, ..), "%d" (DS:324c) of w3 (moves) at (328, ..), all left-aligned
  (ovl59:00bf); at (352, 156 + 30 i) the ABITS movement cell (opaque 0997:0129): DS:45c4
  (flies) DS:3046, w17 and w18 DS:305e, w17 DS:3056, w18 DS:304e, else none; the bonus text
  ovl66:1a07(t, NULL) at (400, 154 + 30 i) (`ui.dialogs.stack.bonus_text`).  Drawn whole
  every frame here (the restore covers every pixel a scroll changes).
* The hero type (0x1c) with no army: ovl66:1a07 skips its record fetch and its hero branch
  (1a5d..1a7a) and tests uninitialised stack words (bp-0x0c..-0x20, what the frames of the
  calls before it left); that text is not determinable from the code and is not drawn
  (logged).  With the shipped fight orders the hero's table row is 27, which never shows.
* No Bonus detail button exists on screen 34 (BUTTON.DAT has 490-494 only; MAN p.28 fig 8.1).
"""
from __future__ import annotations

import logging

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...assets.text import printf
from ...rules.bonuses import s8
from ...rules.movement import type_flag
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..layout import DISABLED, NORMAL
from ..palettes import ABITS, painter_for
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from .setup_side import bevel
from .stack import KIND_BOTH, KIND_FLY, KIND_FOREST, KIND_HILLS, STACK_PCK, bonus_text
from ...assets.store import cache_load

log = logging.getLogger(__name__)

POPUP, SCREEN = 0, 34
DONE, UP, DOWN, PAGE_UP, PAGE_DOWN = 490, 491, 492, 493, 494
TYPES, ROWS, PAGE, LAST_FIRST, SHOWN_END = 0x1D, 6, 6, 0x15, 0x1B
TITLE, TITLE_AT = (0xA4, 0), (0x140, 0x3E)
BOX, BEVEL_A, BEVEL_B, OUTLINE_INK = (0x7C, 0x92, 0x1B2, 0xBA), 4, 2, 0
HEADER_SRC, HEADER_AT = (0xBC, 0, 0xD8, 0x16), (0x100, 0x7D)
ICON_X, ROW_Y, ROW_STEP = 0x80, 0x94, 0x1E
NAME_AT, STR_AT, MOVES_AT = (0xA8, 0x99), (0x118, 0x99), (0x148, 0x99)
KIND_AT, BONUS_AT = (0x160, 0x9C), (0x190, 0x9A)
STR_FMT, MOVES_FMT = 0x3249, 0x324C
RING_BASE = 2
INK, SHADOW = 15, 0


def type_order(state) -> list[int]:
    """ovl66:1e5b..1e88: table[s8(fight order byte of t)] = t."""
    row = state.fight_order[state.current]
    out = [None] * TYPES
    for t in range(TYPES):
        v = s8(row[t])
        if not 0 <= v < TYPES:
            raise RuntimeError("fight-order byte %d of type %d: ovl66:1e81 writes outside its table" % (v, t))
        out[v] = t
    if None in out:
        raise RuntimeError("fight-order row is no permutation: ovl66:1e3b leaves table words unset")
    return out


class ArmyBonus(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        cache_load(k, 46)                               # STACK.PCK: ovl66:20a0 027e (X44)
        exe = k.exe
        self.order = type_order(host.state)
        self.first = 0                                  # DS:67d8
        self.title = k.text.S(*TITLE)
        self.fmts = (ds_str(exe, STR_FMT), ds_str(exe, MOVES_FMT))
        self.kind = {n: ds_words(exe, o, 4) for n, o in (("fly", KIND_FLY), ("both", KIND_BOTH),
                     ("forest", KIND_FOREST), ("hills", KIND_HILLS))}
        self.painter = painter_for(host)
        self.row = ButtonRow(list(k.layouts.screen(SCREEN).buttons), k.picture)
        self.warned = False
        self.states()

    def states(self) -> None:
        """ovl66:1f51."""
        st = self.row.state
        st[DONE] = NORMAL
        st[UP] = st[PAGE_UP] = DISABLED if self.first <= 0 else NORMAL
        st[DOWN] = st[PAGE_DOWN] = DISABLED if self.first + ROWS >= SHOWN_END else NORMAL

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> None:
        """07be:0adb..0af7."""
        if id == DONE:                                  # ovl66:1eaf
            self.close(None)
            refresh = getattr(getattr(self.host, "phase", None), "refresh", None)
            if refresh is not None:
                refresh()
            return
        if id == UP:
            self.first -= 1
        elif id == DOWN:
            self.first += 1
        elif id == PAGE_UP:
            self.first = max(self.first - PAGE, 0)
        elif id == PAGE_DOWN:
            self.first = min(self.first + PAGE, LAST_FIRST)
        self.states()

    def draw(self, fb) -> None:
        k, st = self.k, self.host.state
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *TITLE_AT, self.title, INK, SHADOW)
        bevel(fb, BOX, BEVEL_A, BEVEL_B)
        x, y, w, h = BOX
        pygame.draw.rect(fb, OUTLINE_INK, (x + 1, y + 1, w - 2, h - 2), 1)
        fb.blit(k.picture(STACK_PCK), HEADER_AT, HEADER_SRC)
        f = k.fonts[CHANCE17]
        abits = k.picture(ABITS)
        p = st.current
        for i in range(ROWS):
            t = self.order[self.first + i]
            dy = i * ROW_STEP
            self.painter.army(fb, t, p, ICON_X, ROW_Y + dy, ring=p + RING_BASE)
            rec = st.army_type(t)
            f.draw(fb, NAME_AT[0], NAME_AT[1] + dy, rec.name, INK, SHADOW)
            f.draw(fb, STR_AT[0], STR_AT[1] + dy, printf(self.fmts[0], rec.strength), INK, SHADOW)
            f.draw(fb, MOVES_AT[0], MOVES_AT[1] + dy, printf(self.fmts[1], rec.moves), INK, SHADOW)
            cell = self.kind_cell(st, t)
            if cell is not None:
                blit_opaque(fb, abits, (KIND_AT[0], KIND_AT[1] + dy), cell)
            text = bonus_text(k, st, t)
            if text is None:
                if not self.warned:
                    log.warning("ovl66:1a07(hero type, NULL) reads uninitialised stack; its bonus text is not drawn")
                    self.warned = True
            else:
                f.draw(fb, BONUS_AT[0], BONUS_AT[1] + dy, text, INK, SHADOW)
        self.row.draw(fb)

    def kind_cell(self, st, t):
        """ovl66:21b6..2211 (no boat case)."""
        if type_flag(st, t, "flag16"):
            return self.kind["fly"]
        forest, hills = type_flag(st, t, "flag17"), type_flag(st, t, "flag18")
        if forest and hills:
            return self.kind["both"]
        if forest:
            return self.kind["forest"]
        return self.kind["hills"] if hills else None


@registry.dialog("army_bonus")
def army_bonus(host, on_close=None):
    return ArmyBonus(host, on_close)


@registry.action(registry.MENU_ID["army_bonus"])
def open_army_bonus(host):
    """07be:0208 -> ovl66:1e3b."""
    if getattr(host, "state", None) is None:
        return None
    return registry.open_dialog("army_bonus", host)
