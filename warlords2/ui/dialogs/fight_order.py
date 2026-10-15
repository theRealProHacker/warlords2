"""The Fight Order dialog (Order menu item 1, menu action 506, key 'i': 07be:01e8 -> ovl38:0de1),
and the HLP dynamic selectors 45-71 of its slot buttons (ovl15:01fb..0212 -> ovl38:1475).

Evidence (asm ovl38:0de1..14d5; button ids from the jump table 07be:0b0c, cases 07be:0a3e..0a6c):
* open ovl38:0de1: popup type 0x0b (ovl17:0000, marble at DS:06a8 + 0x0b * 8); DS:0d56 = -1 (no
  slot chosen); a 29-byte copy of the side's row SCN 0x60b + 29 * SCN 0x110 (0d28:01d5, DS:0d58);
  DS:166a = 1; ovl38:0e4a(0) draw; ovl53:056a(0x1a) screen 26 (BUTTON.DAT: 425 OK, 426 Cancel,
  427 Reset, 428 / 429 the two arrows, 430 + n the slot buttons n = 0..26, all on FORDER.PCK but
  the slots, which have no picture); ovl38:1067 button states;
* ovl38:0e4a(redraw): with redraw 0, SetFont(1, 15, 0, 3) STRING (0x7f, 0) centred at (320, 64)
  (ovl59:00d6); the side's shield ovl64:0bf7(SCN 0x110, mode 0) at (88, 64) and (512, 64)
  (SHIELDS.PCK (40 p, 0, 40, 40), opaque, side 15 -> 8); SetFont(2, 15, 0, 3): STRING (0x7f, 1)
  with the side's name (SCN 0x000 + 0x14 p) centred at (320, 104), (0x7f, 2) / (0x7f, 3) /
  (0x7f, 4) centred at (320, 348) / (320, 368) / (320, 388).  Always: for slot n = 0..26 the
  type t = the first type whose row byte equals n (0x1d when none), ovl64:08be(t, SCN 0x110,
  x = n % 4 * 120 + 88, y = n / 4 * 31 + 128, ring SCN 0x110 + 2 for the chosen slot DS:0d56,
  else 1, mode 0); with redraw 0 also "%d." (DS:0d5c) of n + 1 left-aligned (ovl59:00bf) at
  (x + 40, y + 6).  So the row values 27 and 28 (the hero and the type 5 of the shipped rows)
  have no slot;
* ovl38:1067 states (08a9:066e, 1 normal, 2 disabled): 425, 427, 426 normal; 428 disabled
  without a chosen slot or at slot 0, 429 without one or at slot 26; 430..456 normal;
* 430 + n -> ovl38:1379(n): n == DS:0d56 -> DS:0d56 = -1; DS:0d56 < 0 -> DS:0d56 = n; else the
  row bytes of the types holding DS:0d56 and n are swapped and DS:0d56 = -1;
* 428 -> ovl38:11af: the types holding DS:0d56 and DS:0d56 - 1 swap their bytes, DS:0d56 - 1;
  429 -> ovl38:1294: the same with DS:0d56 + 1, DS:0d56 + 1;
* 427 Reset -> ovl38:116a: the row = the neutral row SCN 0x6f3 (29 bytes), DS:0d56 = -1;
* each of these then ovl38:0e4a(1) and ovl38:1067;
* 425 OK -> ovl38:10fa: the copy freed, ovl17:069c close, ovl61:0000(0, 0) (DS:166a = 0, screen
  0, the map redrawn, the palette refresh ovl61:0174; no main-loop pass);
* 426 Cancel -> ovl38:111c: the row = the copy, then as OK.
The original edits the SCN row in place at every swap and reset; here every edit is the command
`SetFightOrder(row)` at once (rules.combat.set_fight_order: a permutation of the current row or of
row 8), and Cancel is one more `SetFightOrder(copy)`; OK sends nothing.

Keys while it is open (07be:0064 with DS:166a set, `ui.keys`): Esc / Return press the first
live button of DS:1514 / DS:155c, i.e. 426 Cancel / 425 OK; 'A'..'Z' nothing; every other key
(Del, the arrows, 'i', ...) the chord: 07be:03ef returns 1 for every key while DS:166a is set,
so the key table cs:0337 is never reached.  A left press on a disabled arrow chords
(07be:0e7b).

Help: a right press over a shown button (any state, 08a9:0756) runs ovl15:0000(id)
(`popup_help.button_help`): 425-429 have static HLP records; 430..456 carry word2 45..71, which
ovl15:01fb..0212 sends to ovl38:1475(word2 - 45, pointer x, pointer y): when no panel is up
(DS:1174 == 0) the type t whose row byte equals n (0x1d when none) gets its record by
ovl44:14ac and the army-type panel ovl46:032a(t, w1, w0, w2, w3, x, y), i.e. time w1,
strength w0, cost w2, moves w3 (`ui.info.city`'s "info/army_type", the same panel as the
production slots' selectors 1-4, ovl15:0181); then ovl15:0189 sets DS:1174.
"""
from __future__ import annotations

from ...assets.exe import ds_str
from ...assets.fonts import CHANCE17, CHANCE36
from ...assets.text import printf
from ...model import commands as C
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..info import Panel
from ..layout import DISABLED, NORMAL
from ..palettes import blit_opaque, painter_for
from ..widgets import ButtonRow, kit, text_centred

POPUP, SCREEN = 0x0B, 0x1A                      # ovl38:0de4, 0e3b
OK, CANCEL, RESET, UP, DOWN, SLOT = 425, 426, 427, 428, 429, 430     # 07be:0a3e..0a66
SLOTS = 27                                      # ovl38:0f91..1059, 10dd..10f5 (si < 0x1b)
TYPES = 29                                      # ovl38:0e28 (row bytes, cmp dx, 0x1d)
NO_TYPE = 0x1D                                  # the type index a slot gets when no byte matches
NEUTRAL_ROW = 8                                 # SCN 0x6f3 = 0x60b + 8 * 29 (ovl38:1177)
TEXT_GROUP = 0x7F                               # STRING.DAT group (ovl38:0e75..0f5f)
TITLE_AT, SUB_AT = (0x140, 0x40), (0x140, 0x68)
LINES_AT = ((0x140, 0x15C), (0x140, 0x170), (0x140, 0x184))          # (0x7f, 2..4)
SHIELDS, SHIELDS_AT, SHIELD = 5, ((0x58, 0x40), (0x200, 0x40)), 40   # ovl64:0bf7 mode 0
NEUTRAL_SIDE, NEUTRAL_SHIELD = 15, 8
SLOT_X0, SLOT_DX, SLOT_Y0, SLOT_DY, PER_ROW = 0x58, 0x78, 0x80, 0x1F, 4   # ovl38:0fe1..0ff8
NUMBER_AT, NUMBER_FMT = (0x28, 6), 0x0D5C       # ovl38:1017..104d: (x + 40, y + 6), "%d."
RING_PLAIN, RING_CHOSEN = 1, 2                  # ovl38:0fbe..0fd9: 1, or SCN 0x110 + 2
INK, SHADOW = 15, 0
SELECTORS = range(45, 72)                       # ovl15:01fb..0203


def slot_xy(n: int) -> tuple[int, int]:
    return n % PER_ROW * SLOT_DX + SLOT_X0, n // PER_ROW * SLOT_DY + SLOT_Y0


def type_at(row, n: int) -> int:
    """The first type whose row byte equals n, else 0x1d (ovl38:0f96..0fbc, 1379, 1475)."""
    for t in range(TYPES):
        if row[t] == n:
            return t
    return NO_TYPE


def swapped(row, a: int, b: int) -> list:
    """The row with the bytes of the types holding positions a and b exchanged (ovl38:1216..127c).
    Every shipped row holds 0..28 once, so both types exist."""
    row = list(row)
    ta, tb = type_at(row, a), type_at(row, b)
    if NO_TYPE in (ta, tb):
        raise RuntimeError("fight-order row without position %d or %d: ovl38 reads past the row" % (a, b))
    row[ta], row[tb] = row[tb], row[ta]
    return row


class FightOrder(Dialog):
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        st = host.state
        self.side = st.current
        self.copy = list(st.fight_order[self.side])                  # DS:0d58 (ovl38:0df2..0e2b)
        self.chosen = -1                                              # DS:0d56
        self.painter = painter_for(host)
        self.texts = k.text.group(TEXT_GROUP)[:5]                      # ovl59:04f0 (0x7f, 0..4)
        self.number_fmt = ds_str(k.exe, NUMBER_FMT)
        layout = k.layouts.screen(SCREEN)
        self.row = ButtonRow(layout.buttons, k.picture)
        self.states()

    @property
    def order(self) -> list:
        return self.host.state.fight_order[self.side]

    # ovl38:1067
    def states(self) -> None:
        s = self.row.state
        s[OK] = s[RESET] = s[CANCEL] = NORMAL
        c = self.chosen
        s[UP] = DISABLED if c <= 0 else NORMAL
        s[DOWN] = DISABLED if c < 0 or c == SLOTS - 1 else NORMAL
        for n in range(SLOTS):
            s[SLOT + n] = NORMAL

    def set_row(self, row) -> None:
        self.host.command(C.SetFightOrder(tuple(row)))

    def press(self, id: int) -> None:
        """07be:0a3e..0a6c."""
        st = self.host.state
        if id == OK:                                                   # ovl38:10fa
            return self.finish()
        if id == CANCEL:                                               # ovl38:111c
            if self.order != self.copy:
                self.set_row(self.copy)
            return self.finish()
        if id == RESET:                                                # ovl38:116a
            self.set_row(st.fight_order[NEUTRAL_ROW])
            self.chosen = -1
        elif id == UP and self.chosen > 0:                             # ovl38:11af
            self.set_row(swapped(self.order, self.chosen, self.chosen - 1))
            self.chosen -= 1
        elif id == DOWN and 0 <= self.chosen < SLOTS - 1:              # ovl38:1294
            self.set_row(swapped(self.order, self.chosen, self.chosen + 1))
            self.chosen += 1
        elif SLOT <= id < SLOT + SLOTS:                                # ovl38:1379
            n = id - SLOT
            if self.chosen == n:
                self.chosen = -1
            elif self.chosen < 0:
                self.chosen = n
            else:
                self.set_row(swapped(self.order, self.chosen, n))
                self.chosen = -1
        self.states()

    def finish(self) -> None:
        """ovl17:069c, then ovl61:0000(0, 0): its palette refresh ovl61:0174."""
        self.close(None)
        refresh = getattr(getattr(self.host, "phase", None), "refresh", None)
        if refresh is not None:
            refresh()

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    # ovl38:0e4a
    def draw(self, fb) -> None:
        k, st = self.k, self.host.state
        p = self.side
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *TITLE_AT, self.texts[0], INK, SHADOW)
        shields = k.picture(SHIELDS)
        cell = NEUTRAL_SHIELD if p == NEUTRAL_SIDE else p
        for at in SHIELDS_AT:
            blit_opaque(fb, shields, at, (SHIELD * cell, 0, SHIELD, SHIELD))
        f = k.fonts[CHANCE17]
        text_centred(fb, f, *SUB_AT, printf(self.texts[1], st.players[p].name), INK, SHADOW)
        for at, s in zip(LINES_AT, self.texts[2:]):
            text_centred(fb, f, *at, s, INK, SHADOW)
        row = self.order
        for n in range(SLOTS):
            x, y = slot_xy(n)
            ring = p + RING_CHOSEN if n == self.chosen else RING_PLAIN
            self.painter.army(fb, type_at(row, n), p, x, y, ring=ring)
            f.draw(fb, x + NUMBER_AT[0], y + NUMBER_AT[1], printf(self.number_fmt, n + 1), INK, SHADOW)
        self.row.draw(fb)


@registry.dialog("fight_order")
def fight_order(host, on_close=None):
    return FightOrder(host, on_close)


@registry.action(registry.MENU_ID["fight_order"])
def open_fight_order(host):
    """07be:01e8 -> ovl38:0de1."""
    if getattr(host, "state", None) is None:
        return None
    return registry.open_dialog("fight_order", host)


@registry.help_selector(SELECTORS)
def slot_help(host, record, word2):
    """ovl15:01fb..0212 -> ovl38:1475(word2 - 45, pointer): opens its own panel, no HLP popup."""
    if any(isinstance(d, Panel) for d in host.dialogs):              # DS:1174 set (ovl38:147c)
        return None
    st = host.state
    t = type_at(st.fight_order[st.current], word2 - SELECTORS.start)
    if t == NO_TYPE:
        raise RuntimeError("ovl38:1475: no type at slot %d; ovl44:14ac leaves the record unset" % (word2 - 45))
    rec = st.army_type(t)                                            # ovl44:14ac
    registry.open_dialog("info/army_type", host, type_id=t, time=rec.turns, strength=rec.strength,
                         cost=rec.cost, moves=rec.moves, pos=host.app.input.pos)
    return None
