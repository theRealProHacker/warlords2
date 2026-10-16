"""Report > Diplomacy (menu 515, key 'd'): who is at peace or war with whom, and the rating.

Evidence (asm ovl00:0000..0345; key table 07be:0337 'd' -> 07be:01ca -> ovl00:0000, the only
caller; the Action dialog's Report button 371 -> 07be:09ce -> ovl00:0a48):
* ovl00:0000: SCN 0x11c (Diplomacy) == 0 -> nothing (0008); else 12bf:07a5, the draw 0039,
  DS:166a = 1, ovl53:056a(0x15) (JOIN screen 21), 02ec: 08a9:066e(368, 1), (369, 1) (both
  normal), ovl59:0a1b, 12bf:0757.  Menu 515 is switched off with Diplomacy off as well
  (ovl61:0519, `ui.game_menus`).
* ovl00:0039: DS:166a == 0 -> ovl17:0000(0x0b) (popup type 11) (0041..004f);
  SetFont(1, 15, 0, 3), STRING (107, 0) centred at (320, 64) (0050..007c);
  colour 1: vline(88, 139, 232), vline(120 + 32 i, 110, 261) i = 0..8, hline(120, 110, 256),
  hline(88, 139 + 29 i, 288) i = 0..8 (007f..00e6);
  for every live side p (2c04:0137[p]): ovl64:0bf7(p, 3, 128 + 32 p, 117) and (p, 3, 96,
  146 + 29 p) (00e8..0135);
  cells si = 0..7 (column), di = 0..7 (row) (0137..0218): si == di -> picture 47 (384, 29,
  32, 29) at (120 + 32 si, 139 + 29 di), dead or alive (the test 0141 comes first); else both
  live (014e, 015f) and current = byte 2c04:153b[8 si + di] & 3: 2 -> (384, 0), 0 -> (320, 0),
  1 and 3 nothing (017b..01b4), all through 0997:0129 (opaque);
  colour 0, outline (392, 110, 160, 262) (021b..0243); SetFont(2, 15, 0, 3), STRING (109, 0)
  centred at (472, 116) (0246..0272); ovl00:0aed (`rules.diplomacy.rating`): for rank i the
  shield (side, 3, 400, 146 + 29 i) and STRING (106, title) left at (432, 146 + 29 i)
  (0275..02e6).
* 368 (07be:09b6) -> ovl00:030d: ovl17:069c, ovl61:011f(0, 0, 0).  369 (07be:09be) ->
  ovl00:0324: 07a5, ovl17:07e4(0, 0, 0, 0) (the popup's contents cleared, the frame kept),
  ovl00:0346 (the Action dialog, no new frame as DS:166a is set), 0757.
* Keys (07be:0064 with DS:166a set, `ui.keys`): Esc and Return press 368 (DS:1514 and
  DS:155c both hold it); right press: the button help.  No sound, wait or palette change.
"""
from __future__ import annotations

from ...assets.fonts import CHANCE17, CHANCE36
from ...rules import diplomacy as D
from .. import registry
from ..dialog import Dialog
from ..info.city import shield
from ..keys import popup_input
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from .hero_offer import outline, raw
from ...assets.store import cache_load

POPUP, SCREEN = 11, 21
DONE, ACTION = 368, 369
DIPLOM = 47                                       # FILE.DAT group-3 picture (DIPLOM.PCK)
TITLE, PANEL_TITLE, RATING_TITLES = 107, 109, 106
INK, SHADOW, GRID, PANEL = 15, 0, 1, 0
N = 8
COL_X, ROW_Y, CELL_W, CELL_H = 120, 139, 32, 29
HEAD_X, HEAD_Y = 96, 117                          # row shields at x 96, column shields at y 117
DIAGONAL, WAR_ICON, PEACE_ICON = (384, 29), (384, 0), (320, 0)
PANEL_RECT, PANEL_TITLE_POS = (392, 110, 160, 262), (472, 116)
RANK_SHIELD_X, RANK_TEXT_X, RANK_Y = 400, 432, 146


def hline(fb, x, y, n, colour) -> None:
    """1133:02fe(x, y, n)."""
    fb.fill(colour, (x, y, n, 1))


def vline(fb, x, y, n, colour) -> None:
    """1133:0344(x, y, n)."""
    fb.fill(colour, (x, y, 1, n))


def cell_icon(state, a: int, b: int):
    """The picture-47 source corner of cell (column a, row b), or None (ovl00:0141..01b4)."""
    if a == b:
        return DIAGONAL
    pl = state.players
    if not (pl[a].alive and pl[b].alive):
        return None
    cur = D.current(state, a, b)
    return WAR_ICON if cur == D.K.WAR.value else PEACE_ICON if cur == D.K.PEACE.value else None


def switch(dialog: Dialog, to: str) -> Dialog:
    """ovl17:07e4 then the other screen: the dialog leaves the stack without its close path
    (no ovl61:011f) and the other one takes its place and its close path."""
    host, on_close = dialog.host, dialog.on_close
    dialog.on_close = None
    dialog.close(None)
    return registry.open_dialog(to, host, on_close=on_close)


class DiplomacyReport(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        cache_load(k, DIPLOM)                           # ovl00:0201 0129, buttons of screen 21 (X44)
        lay = k.layouts.screen(SCREEN)
        self.row = ButtonRow([lay.button(DONE), lay.button(ACTION)], k.picture)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        if id == DONE:
            self.close(None)
            return True
        if id == ACTION:
            switch(self, "diplomacy_action")
            return True
        return False

    def draw(self, fb) -> None:
        k, st = self.k, self.host.state
        f36, f17 = k.fonts[CHANCE36], k.fonts[CHANCE17]
        k.draw_popup(fb, POPUP)
        text_centred(fb, f36, 320, 64, raw(k, TITLE, 0), INK, SHADOW)
        vline(fb, HEAD_X - 8, ROW_Y, CELL_H * N, GRID)
        for i in range(N + 1):
            vline(fb, COL_X + CELL_W * i, 110, 261, GRID)
        hline(fb, COL_X, 110, CELL_W * N, GRID)
        for i in range(N + 1):
            hline(fb, HEAD_X - 8, ROW_Y + CELL_H * i, 288, GRID)
        for p in range(N):
            if st.players[p].alive:
                shield(fb, k, p, 3, COL_X + 8 + CELL_W * p, HEAD_Y)
                shield(fb, k, p, 3, HEAD_X, ROW_Y + 7 + CELL_H * p)
        pic = k.picture(DIPLOM)
        for a in range(N):
            for b in range(N):
                src = cell_icon(st, a, b)
                if src is not None:
                    blit_opaque(fb, pic, (COL_X + CELL_W * a, ROW_Y + CELL_H * b), (*src, CELL_W, CELL_H))
        outline(fb, PANEL_RECT, PANEL)
        text_centred(fb, f17, *PANEL_TITLE_POS, raw(k, PANEL_TITLE, 0), INK, SHADOW)
        for i, (side, title) in enumerate(D.rating(st)):
            y = RANK_Y + CELL_H * i
            shield(fb, k, side, 3, RANK_SHIELD_X, y)
            f17.draw(fb, RANK_TEXT_X, y, raw(k, RATING_TITLES, title), INK, SHADOW)
        self.row.draw(fb)


@registry.dialog("diplomacy_report")
def diplomacy_report(host, on_close=None):
    return DiplomacyReport(host, on_close)


@registry.action(registry.MENU_ID["report_diplomacy"])
def open_diplomacy_report(host):
    """07be:01ca -> ovl00:0000; closed through 368 -> ovl00:030d -> ovl61:011f(0, 0, 0)."""
    st = getattr(host, "state", None)
    if st is None or not st.options.diplomacy:                     # ovl00:0008
        return None
    return registry.open_dialog("diplomacy_report", host, on_close=lambda _: host.settings_closed())
