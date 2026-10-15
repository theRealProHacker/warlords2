"""The scenario list of the Game Start screen (New Scenario, button 100).

Evidence (WARLORD2.EXE ovl60):
* ovl60:058d / 0725: every SCENARIO.DAT record (ovl60:06c8, 84 bytes each) in file
  order; popup type 0x13 (NEWSCEN.PCK, ovl17:0000); seven visible rows holding record
  indices (-1 = empty), scrolled so that the current scenario (DS:28ce) is on a row; the
  selection (DS:2a49) starts at the current scenario; JOIN screen 29;
* ovl60:0d45 rows: when the first visible index differs from the one drawn last
  (DS:2a4b, -1 in the EXE image, kept across openings) colour 0 over (112, 153, 136, 140);
  each row's title (record +0) left at (112, 153 + 20 i), SetFont(2, 15, 0, 3) for the
  selected row (DS:5ce6), SetFont(2, 5, 0, 3) for the others;
* ovl60:0996 details of the selection, SetFont(2, 5, 0, 3): title centred at (416, 101),
  text (+0x1c) centred at (416, 174), cities (+0x4c, "%d" DS:2a7c) right-aligned at
  (368, 234), sites (+0x4e, DS:2a7f) left at (472, 234), sides (+0x50, DS:2a82) centred
  at (416, 254);
* ovl60:0a86 buttons: rows 476-482 normal; 470 / 472 disabled while the first row holds
  index < 1, 471 / 473 disabled while the last row is empty or holds the last record;
  474 (OK), 475 (Cancel) normal;
* dispatch 07be:04d8: 476-482 -> ovl60:0b40(row) (a filled row becomes the selection);
  470 / 472 -> ovl60:0ba0 (rows move down one record, the selected row follows, clamped
  to row 6); 471 / 473 -> ovl60:0c11 (rows move up, clamped to row 0); 474 -> ovl60:0b7e
  (close with the selection), 475 -> ovl60:0b90 (close, nothing chosen).
Input (DS:166a = 1, ovl60:08b1; `ui.keys.popup_input`): Return presses 474 (DS:155c), Esc 475
(DS:1514), 'A'..'Z' nothing, any other key the chord; a left press on a disabled arrow chords
(07be:0e7b).
The dialog closes with the chosen record index, or None.  Texts and formats come from the
data files and the EXE.
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_str, ds_word
from ...assets.fonts import CHANCE17
from ...assets.text import printf
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..layout import DISABLED, NORMAL
from ..widgets import ButtonRow, kit, text_centred

POPUP, SCREEN, ROWS = 0x13, 29, 7
ROW_IDS = range(476, 483)
UP, DOWN, OK, CANCEL = (470, 472), (471, 473), 474, 475
LIST_RECT, ROW_X, ROW_Y, ROW_DY = (112, 153, 136, 140), 112, 153, 20
SELECTED_INK, INK, SHADOW = 15, 5, 0
LAST_TOP = 0x2A4B
FMT_CITIES, FMT_SITES, FMT_SIDES = 0x2A7C, 0x2A7F, 0x2A82
TITLE_AT, TEXT_AT, CITIES_AT, SITES_AT, SIDES_AT = (416, 101), (416, 174), (368, 234), (472, 234), (416, 254)


class ScenarioSelect(Dialog):
    def __init__(self, k, records: list[dict], current: int, host, on_close=None):
        super().__init__(on_close)
        self.kit, self.records, self.host = k, records, host
        n = len(records)
        self.rows = [i if i < n else -1 for i in range(ROWS)]
        self.row = current                       # DS:5ce6
        while self.row >= ROWS:                  # ovl60:0725
            self.row -= 1
            self.rows = [r + 1 for r in self.rows]
        self.selected = current                  # DS:2a49
        app = host.app
        from .save_load import list_names
        list_names(app, [r["dir"] for r in records])     # ovl60:05b5..05c4: record +0x14 into DS:483c
        last = getattr(app, "scenario_list_top", None)
        if last is None:
            last = ds_word(k.exe, LAST_TOP)
        self.cleared = self.rows[0] != last
        app.scenario_list_top = self.rows[0]
        lay = k.layouts.screen(SCREEN)
        self.buttons = ButtonRow(list(lay.buttons), k.picture)
        self.fmts = [ds_str(k.exe, o) for o in (FMT_CITIES, FMT_SITES, FMT_SIDES)]
        self._states()

    def _states(self) -> None:
        """ovl60:0a86."""
        st = self.buttons.state
        for id in ROW_IDS:
            st[id] = NORMAL
        last = self.rows[-1]
        down = DISABLED if last >= len(self.records) - 1 or last < 0 else NORMAL
        up = DISABLED if self.rows[0] < 1 else NORMAL
        for id in UP:
            st[id] = up
        for id in DOWN:
            st[id] = down
        st[OK] = st[CANCEL] = NORMAL

    def _scrolled(self) -> None:
        if self.rows[0] != self.host.app.scenario_list_top:
            self.cleared = True
            self.host.app.scenario_list_top = self.rows[0]

    def press(self, id: int) -> None:
        if id in ROW_IDS:                                       # ovl60:0b40
            i = id - ROW_IDS[0]
            if self.rows[i] >= 0:
                self.row, self.selected = i, self.rows[i]
        elif id in UP:                                          # ovl60:0ba0
            self.rows = [self.rows[0] - 1] + self.rows[:-1]
            self.row += 1
            if self.row > ROWS - 1:
                self.row = ROWS - 1
                self.selected = self.rows[-1]
            self._scrolled()
        elif id in DOWN:                                        # ovl60:0c11
            self.rows = self.rows[1:] + [self.rows[-1] + 1]
            self.row -= 1
            if self.row < 0:
                self.row = 0
                self.selected = self.rows[0]
            self._scrolled()
        elif id == OK:
            return self.close(self.selected)
        elif id == CANCEL:
            return self.close(None)
        self._states()

    def update(self, events, dt) -> None:
        popup_input(self, events, self.buttons, self.kit.exe, self.press)

    def draw(self, fb: pygame.Surface) -> None:
        k, f = self.kit, self.kit.fonts[CHANCE17]
        k.draw_popup(fb, POPUP)
        self.buttons.draw(fb)
        if self.cleared:
            fb.fill(0, LIST_RECT)
        for i, r in enumerate(self.rows):
            if r >= 0:
                ink = SELECTED_INK if i == self.row else INK
                f.draw(fb, ROW_X, ROW_Y + ROW_DY * i, self.records[r]["title"], ink, SHADOW)
        rec = self.records[self.selected]
        text_centred(fb, f, *TITLE_AT, rec["title"], INK, SHADOW)
        text_centred(fb, f, *TEXT_AT, rec["description"], INK, SHADOW)
        s = printf(self.fmts[0], rec["cities"])
        f.draw(fb, CITIES_AT[0] - f.width(s), CITIES_AT[1], s, INK, SHADOW)
        f.draw(fb, *SITES_AT, printf(self.fmts[1], rec["sites"]), INK, SHADOW)
        text_centred(fb, f, *SIDES_AT, printf(self.fmts[2], rec["players"]), INK, SHADOW)


@registry.dialog("scenario_select")
def scenario_select(host, records: list[dict], current: int, on_close=None):
    return ScenarioSelect(kit(host.app), records, current, host, on_close)
