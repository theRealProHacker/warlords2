"""The Diplomatic Action dialog (action palette 183 / 184 / 185, the Report's 369): the other
sides' state towards the side on turn, their proposals to it, and its own proposals to them.

Evidence (asm ovl00:0346..0aec; 07be:04d8 jump table cs:0b0c: 183 / 184 / 185 -> 07be:054a ->
ovl00:0346; 370 -> 09c6, 371 -> 09ce, 372.. -> 09d6 / 09e0 / 09ea -> ovl00:0a69):
* ovl00:0346: SCN 0x11c == 0 -> nothing (0354); else 12bf:07a5, 0382(0), DS:166a = 1,
  ovl53:056a(0x16) (JOIN screen 22), 09d4, ovl59:0a1b, 12bf:0757.  09d4: 08a9:066e(id, 1) for
  370, 371 and 372 + i, 380 + i, 388 + i, i = 0..6 (all normal).
* ovl00:0382(redraw): DS:166a == 0 -> ovl17:0000(0x0b) (popup type 11); redraw == 0 only
  (0399..04f0): SetFont(1, 15, 0, 3), STRING (108, 0) centred at (320, 64); ovl64:0bf7(me, 0,
  96, 111) (me = SCN 0x110); SetFont(2, 15, 0, 3); the side's name (2c04:0000 + 0x14 me) left at
  (144, 122); STRING (110, i) left at (104, y) for y = 165, 205, 251, 271, 291, 311, 331.
* Always (04f3..09c6), si = 0..7 without me, di = the column (counts only si != me), x = 272 +
  40 di; every cell 40 x 40; "empty" = colour 0 outline (x, y, 40, 40), colour 2 fill (x + 1,
  y + 1, 38, 38); pictures from picture 47 through 0997:0129 (opaque):
  - ovl64:0bf7(si, 0, x, 111), dead sides too (0509..0520);
  - y 151: si dead -> empty; else (120 c + 80, 45), c = byte 2c04:153b[8 si + me] & 3;
  - y 191: si dead, or (byte >> 2) & 3 == byte & 3 -> empty; else (120 prop + 80, 45);
  - y 245 / 285 / 325 (buttons 372 + di / 380 + di / 388 + di): si dead -> empty; else my
    proposal q = (byte 2c04:153b[8 me + si] >> 2) & 3: q == 0 -> (40, 45) else (0, 45);
    q == 1 -> (160, 45) else (120, 45); q == 2 -> (280, 45) else (240, 45).
  The cell buttons have picture 0 (BUTTON.DAT), so the button system draws nothing for them.
* 370 -> ovl00:0a31: ovl17:069c, ovl61:011f(0, 0, 0).  371 -> ovl00:0a48: 07a5,
  ovl17:07e4(0, 0, 0, 0), ovl00:0000 (the Report, no new frame), 0757.
* ovl00:0a69(relation, b), relation 0 / 1 / 2 for 372.. / 380.. / 388.., b = id - base: a human
  side (SCN 0x0d0[me] == 0) with me <= b -> b + 1 (0a80..0a94); proposal bits of [me][b] =
  relation (`C.Propose`, rules.diplomacy.propose); human: 07a5, 0382(1), 09d4, 0757.  No alive
  test: a dead side's column takes the proposal and stays empty.  No main-loop pass and no
  palette refresh between (`host.command`).
* Keys (07be:0064 with DS:166a set, `ui.keys`): Esc and Return press 370; right press: the
  button help.  No sound, wait or palette change.
"""
from __future__ import annotations

from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from ...rules import diplomacy as D
from .. import registry
from ..dialog import Dialog
from ..info.city import shield
from ..keys import popup_input
from ..layout import NORMAL
from ..palettes import DIPLOMACY
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from .diplomacy_report import POPUP, switch
from .hero_offer import outline, raw

SCREEN = 22
DONE, REPORT = 370, 371
CELL_BASE = (372, 380, 388)                       # peace, neutral, war (ovl00:0a69 relation 0 / 1 / 2)
N, COLUMNS = 8, 7
DIPLOM = 47
TITLE, LABELS = 108, 110
INK, SHADOW, EDGE, GROUND = 15, 0, 0, 2
SHIELD_POS, NAME_POS = (96, 111), (144, 122)
LABEL_X, LABEL_Y = 104, (165, 205, 251, 271, 291, 311, 331)
COL_X, COL_W, SHIELD_Y = 272, 40, 111
STATE_Y, OFFER_Y, BUTTON_Y = 151, 191, (245, 285, 325)
ICON_Y, ICON_X, ICON_STEP = 45, 80, 120           # state / proposal icon: (120 s + 80, 45)
BUTTON_SRC = ((0, 40), (120, 160), (240, 280))    # per relation: (up, down) x at y 45


def cell_ids() -> list[int]:
    return [base + i for base in CELL_BASE for i in range(COLUMNS)]


def columns(me: int) -> list[int]:
    """The sides of the columns: 0..7 without the side on turn (ovl00:04f3..09c8)."""
    return [s for s in range(N) if s != me]


def target(id: int, me: int) -> tuple[int, int]:
    """(other side, relation) of a cell button: ovl00:0a69 with b = id - base, b + 1 from the
    own column on (a human side)."""
    relation, b = divmod(id - CELL_BASE[0], CELL_BASE[1] - CELL_BASE[0])
    return b + (b >= me), relation


def cells(state, si: int):
    """{y: picture-47 source corner or None (empty)} of side si's column (ovl00:0523..09c3)."""
    me = state.current
    if not state.players[si].alive:
        return {y: None for y in (STATE_Y, OFFER_Y, *BUTTON_Y)}
    cur, prop = D.current(state, si, me), D.proposal(state, si, me)
    mine = D.proposal(state, me, si)
    out = {STATE_Y: (ICON_STEP * cur + ICON_X, ICON_Y),
           OFFER_Y: None if prop == cur else (ICON_STEP * prop + ICON_X, ICON_Y)}
    for rel, y in enumerate(BUTTON_Y):
        out[y] = (BUTTON_SRC[rel][mine == rel], ICON_Y)
    return out


class DiplomacyAction(Dialog):
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        lay = k.layouts.screen(SCREEN)
        self.row = ButtonRow([lay.button(i) for i in (DONE, REPORT, *cell_ids())], k.picture)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        if id == DONE:
            self.close(None)
            return True
        if id == REPORT:
            switch(self, "diplomacy_report")
            return True
        if id in cell_ids():
            other, relation = target(id, self.host.state.current)
            self.host.command(C.Propose(other, relation))
            self.row.state = {b.id: NORMAL for b in self.row.buttons}     # 09d4
        return False

    def draw(self, fb) -> None:
        k, st = self.k, self.host.state
        me = st.current
        f17 = k.fonts[CHANCE17]
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], 320, 64, raw(k, TITLE, 0), INK, SHADOW)
        shield(fb, k, me, 0, *SHIELD_POS)
        f17.draw(fb, *NAME_POS, st.players[me].name, INK, SHADOW)
        for i, y in enumerate(LABEL_Y):
            f17.draw(fb, LABEL_X, y, raw(k, LABELS, i), INK, SHADOW)
        pic = k.picture(DIPLOM)
        for di, si in enumerate(columns(me)):
            x = COL_X + COL_W * di
            shield(fb, k, si, 0, x, SHIELD_Y)
            for y, src in cells(st, si).items():
                if src is None:
                    outline(fb, (x, y, COL_W, COL_W), EDGE)
                    fb.fill(GROUND, (x + 1, y + 1, COL_W - 2, COL_W - 2))
                else:
                    blit_opaque(fb, pic, (x, y), (*src, COL_W, COL_W))
        self.row.draw(fb)


@registry.dialog("diplomacy_action")
def diplomacy_action(host, on_close=None):
    return DiplomacyAction(host, on_close)


def open_diplomacy_action(host):
    """07be:054a -> ovl00:0346; closed through 370 -> ovl00:0a31 -> ovl61:011f(0, 0, 0)."""
    st = getattr(host, "state", None)
    if st is None or not st.options.diplomacy:                     # ovl00:034e
        return None
    return registry.open_dialog("diplomacy_action", host, on_close=lambda _: host.settings_closed())


for _id in DIPLOMACY:
    registry.action(_id)(open_diplomacy_action)
