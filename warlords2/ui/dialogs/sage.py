"""A sage (SageOffered, answered by SageChoice): the visit, the sage's menu (show a place, the gem,
the map view), the list of places, and the close.

Evidence (asm ovl34, ovl51, read from the user's EXE):
* ovl34:0aa0 (human): ovl34:1610 (the list, `rules.ruins.sage_entries`, names: DS:0c84 for the
  gold entry -1, DS:0c89 for the allies entry -2, else the item's name), ovl58:0000(6) music
  (M10c), ovl34:175b(-1) (the "Searching" pop-up, `search_result.Searching`), sprintf((58, 0),
  hero name) at the first line slot, ovl58:01a9(0) (`audio.effects`), ovl59:0000(10) (10 ticks),
  ovl17:069c, ovl34:146f;
* ovl34:146f: popup type 2 (the map popup) with ovl63:05e4(NULL, site): the base map and the
  markers of the sites shown to the side, the sage's site boxed (`hero_offer.site_markers`);
  SetFont(1, 15, 0, 3) DS:0c7c centred at (432, 62); SetFont(2, 15, 0, 3) (63, 0..4) centred at
  x 432, y 120, 140, 160, 180, 200; DS:4126 = 240 (the next ovl34:15d5 line, + 20 each);
  ovl53:056a(10): 282 removed, 279 normal iff the list is not empty else disabled, 280 normal,
  area 15 off, 281 normal iff Hidden Map (SCN 0x124) else disabled (1554..15ad);
* 280 -> ovl34:0b1a (gem, `SageChoice("gem")`): 15d5((59, 0)), 15d5(sprintf((59, 1), gold));
  ovl17:070b(8, 0x116, 0xf0, 0x17): the marble of the popup over the button row (312, 338, 240,
  23); 279..281 removed, 282 normal (0b5b..0bbf);
* 279 -> ovl34:0bf5: 282 removed, 279..281 disabled; ovl51:0000(ovl34:0e85, DS:0c76, 0): the list
  pop-up (`SageList`); OK -> 0e85(row's entry), Cancel -> 0e85(-1): the menu's buttons again;
  an entry -> `SageChoice("show_site", index)`: item: 15d5(sprintf((62, 0), item name)),
  15d5((62, 1)); -1: (62, 2), (62, 1); -2: (62, 3), (62, 1); then 15d5(sprintf((62, 7), site name))
  (0eff..1236); the overview again without markers (ovl63:0000(0, 1, NULL), 1200), where seen:
  ovl62:0806(site, 8), ovl62:0868(site, 8), ovl62:0a3f(hero, site, 8), then ovl63:1f5f(hero, 1)
  (123f..1292); the row erased, 279..281 removed, 282 normal (12b1..12da);
* 281 -> ovl34:0c50: 279..281 disabled, area 15 on, 15d5((60, 0)), (60, 1), (60, 2); a left press
  on area 15 (res_0726:036f..038c) gives the square ((px - 0x50) / 2, (py - 0x3c) / 2) ->
  `SageChoice("map_view", square)`; a right press the panel ovl46:1201 + 10e1(DS:11aa, DS:11b9);
  ovl34:0cd6 then (human): a colour-15 outline (2 x0 + 80, 2 y0 + 60, 2 w, 2 h) for ovl59:0000(10),
  the overview again (ovl63:0000(1, 1, NULL), with the city markers), the row erased, 279..281
  removed, area 15 off, 282 normal (0dfe..0e74);
* 282 -> ovl34:0bcf: ovl17:069c, ovl63:0000(1, 1, NULL), ovl61:0000(0, 0) (the game screen).
  Before a choice nothing of the Escape / Return lists is live (the chord, 07be:032c);
* ovl51:0000(callback, title, first): popup type 3 ((96, 50) 200x200), SetFont(2, 15, 0, 3) the
  title centred at DS:15c2; colour 3 on DS:15a6 with bevel(4, 2); rows 0..4 (DS:4830, -1 past
  the list) at DS:15ae + 4 i, ink 15 for the chosen row DS:483a, else 2 (ovl51:00f3); screen 2:
  114..118 the rows (018b: choose a filled row), 119 page up (0286: all rows - min(first, 5)),
  120 page down (02be: + min(count - last - 1, 5)), 121 one up (01f5), 122 one down (023e),
  123 OK (01ab: callback(entry of the chosen row)), 124 Cancel (01d4: callback(-1)); 0301: with
  at most 5 entries 119..122 removed, else 119 / 121 disabled while the first row is <= 0 and
  120 / 122 while count - 1 <= last row or the last row < 0; Return -> 123, Escape -> 124.
Deviation: ovl58:01a9(0) waits for the sample's end (155e:0736) before the 10-tick wait; here the
`SageOffered` event sound starts it and nothing waits for the length `audio.effects.play` returns.
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from ...model import events as E
from ...model.ids import Control
from .. import registry
from ..animate import frames
from ..dialog import Dialog
from ..keys import code_of, hand_on, left_press, popup_input, popup_key, right_help
from ..menubar import with_codes
from ..layout import DISABLED, NORMAL
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from .hero_offer import (answer, bevel, box_mark, line_mark, map_popup, raw, seen, site_markers, sprintf,
                         square_mark, wait)
from .search_result import Searching

SCREEN = 10
SHOW, GEM, MAP, CLOSE = 279, 280, 281, 282
AREA = (80, 60, 224, 312)
TITLE, TITLE_AT = 0x0C7C, (432, 62)
G_VISIT, G_GEM, G_MAP, G_SHOW, G_MENU = 58, 59, 60, 62, 63
MENU_Y, LINE_Y0, LINE_STEP, CX = (120, 140, 160, 180, 200), 240, 20, 432
GOLD_NAME, ALLIES_NAME, LIST_TITLE = 0x0C84, 0x0C89, 0x0C76
ROW_ERASE = (8, 0x116, 0xF0, 0x17)               # ovl17:070b args (popup-relative, + DS:2a8c)
MAP_SHIFT = 224
MARK = 8
VIEW_BOX = 15
VISIT_TICKS = 10
REVEAL_TEXTS = (0x11AA, 0x11B9)
INK, SHADOW = 15, 0
GOLD_ENTRY, ALLIES_ENTRY = -1, -2


def entry_name(k, state, e: int) -> str:
    if e == GOLD_ENTRY:
        return ds_str(k.exe, GOLD_NAME)
    if e == ALLIES_ENTRY:
        return ds_str(k.exe, ALLIES_NAME)
    return state.items[e].name


class Sage(Dialog):
    def __init__(self, host, offer, on_close=None):
        super().__init__(on_close)
        self.host, self.offer = host, offer
        k = self.k = kit(host.app)
        st = host.state
        self.site = offer.info["site"]
        self.entries = list(offer.info["entries"])
        from .save_load import list_names
        list_names(host.app, [entry_name(k, host.state, e) for e in self.entries])   # ovl34:1610 (1735)
        hero = st.armies[st.selection.hero]
        self.hero = hero.id
        self.visit = Searching(host)
        self.visit.line(sprintf(raw(k, G_VISIT, 0), st.heroes[hero.hero_slot].name))
        self.visit_left = frames(host.app, VISIT_TICKS)
        self.lines: list[str] = []
        self.erased = False
        self.view_box = None                              # (rect, frames left)
        self.after = None                                 # "show" (site, entry) or "map"
        self.picking = False
        lay = k.layouts.screen(SCREEN)
        self.all = {b.id: b for b in lay.buttons}
        self.menu_buttons()

    def menu_buttons(self) -> None:
        """ovl34:146f (1554..15ad) / 0e85(-1)."""
        st = self.host.state
        self.row = ButtonRow([self.all[i] for i in (SHOW, GEM, MAP)], self.k.picture)
        self.row.state[SHOW] = NORMAL if self.entries else DISABLED
        self.row.state[GEM] = NORMAL
        self.row.state[MAP] = NORMAL if st.options.hidden_map else DISABLED

    def disable(self) -> None:
        for i in (SHOW, GEM, MAP):
            self.row.state[i] = DISABLED

    def done(self) -> None:
        """The row erased, 279..281 removed, 282 normal."""
        self.erased = True
        self.picking = False
        self.row = ButtonRow([self.all[CLOSE]], self.k.picture)

    def add(self, s: str) -> None:
        """ovl34:15d5."""
        self.lines.append(s)

    def update(self, events, dt) -> None:
        if self.visit_left > 0:
            self.visit_left -= 1
            return
        if self.view_box is not None:
            rect, n = self.view_box
            self.view_box = (rect, n - 1) if n > 1 else None
            if self.view_box is None:
                self.done()
            return
        for n, (e, code) in enumerate(with_codes(events, self.host.app.input)):
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                if right_help(self.host, self.row, e.pos):
                    pass
                elif self.picking and _inside(AREA, e.pos):
                    registry.open_dialog("info/text", self.host, title=ds_str(self.k.exe, REVEAL_TEXTS[0]),
                                         text=ds_str(self.k.exe, REVEAL_TEXTS[1]), pos=e.pos)
                return
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and self.picking and _inside(AREA, e.pos):
                return self.map_view(((e.pos[0] - AREA[0]) // 2, (e.pos[1] - AREA[1]) // 2))
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                left_press(self.host.app, self.row, e)                    # 07be:0e26(1)
                continue
            if e.type == pygame.KEYDOWN:
                hit = popup_key(self.host.app, self.row, code_of(e, code), self.k.exe)
            else:
                hit = self.row.event(e)
            if hit is not None:
                self.press(hit)
                return hand_on(self, events[n + 1:], dt)          # e.g. to the list SHOW opened

    def press(self, id: int) -> None:
        k = self.k
        if id == GEM:                                     # ovl34:0b1a
            ev = answer(self.host, C.SageChoice("gem"))
            if ev is None:
                return
            gold = next(e.info["gem"] for e in ev if isinstance(e, E.SiteSearched) and "gem" in e.info)
            self.add(raw(k, G_GEM, 0))
            self.add(sprintf(raw(k, G_GEM, 1), gold))
            self.done()
        elif id == SHOW:                                  # ovl34:0bf5
            self.disable()
            names = [entry_name(k, self.host.state, e) for e in self.entries]
            from .save_load import run_carry
            registry.open_dialog("sage_list", self.host, title=ds_str(k.exe, LIST_TITLE), names=names,
                                 on_close=self.picked, buffer=run_carry(self.host.app))
        elif id == MAP:                                   # ovl34:0c50
            self.disable()
            self.picking = True
            for i in range(3):
                self.add(raw(k, G_MAP, i))
        elif id == CLOSE:                                 # ovl34:0bcf
            self.close(None)

    def picked(self, row) -> None:
        """ovl34:0e85(entry)."""
        if row is None or row < 0:
            return self.menu_buttons()
        k, st = self.k, self.host.state
        e = self.entries[row]
        ev = answer(self.host, C.SageChoice("show_site", row))
        if ev is None:
            return self.menu_buttons()
        si = next(x.info["site"] for x in ev if isinstance(x, E.SiteSearched) and x.info.get("shown"))
        if e == GOLD_ENTRY:
            self.add(raw(k, G_SHOW, 2))
        elif e == ALLIES_ENTRY:
            self.add(raw(k, G_SHOW, 3))
        else:
            self.add(sprintf(raw(k, G_SHOW, 0), st.items[e].name))
        self.add(raw(k, G_SHOW, 1))
        self.add(sprintf(raw(k, G_SHOW, 7), st.sites[si].name))
        self.after = ("show", si)
        self.done()

    def map_view(self, square) -> None:
        ev = answer(self.host, C.SageChoice("map_view", square))
        if ev is None:
            return
        x0, y0, w, h = next(x.info["map_view"] for x in ev if isinstance(x, E.SiteSearched) and "map_view" in x.info)
        self.picking = False
        self.after = ("map", None)
        self.view_box = ((2 * x0 + AREA[0], 2 * y0 + AREA[1], 2 * w, 2 * h), frames(self.host.app, VISIT_TICKS))

    def marks(self, buf) -> None:
        st = self.host.state
        if self.after is None or (self.after[0] == "map" and self.view_box is not None):
            site_markers(self.k, buf, st, self.site)
        elif self.after[0] == "show":
            s = st.sites[self.after[1]]
            h = st.armies[self.hero]
            if seen(st, s.x, s.y):
                square_mark(buf, s.x, s.y, MARK)
                box_mark(buf, s.x, s.y, MARK)
                line_mark(buf, (h.x, h.y), (s.x, s.y), MARK)

    def draw(self, fb) -> None:
        if self.visit_left > 0:
            return self.visit.draw(fb)
        k, st = self.k, self.host.state
        cities = self.after is not None and self.after[0] == "map" and self.view_box is None
        hero = st.armies[self.hero]
        markers = [(hero.x, hero.y, 1)] if self.after is not None and self.after[0] == "show" else []
        map_popup(fb, self.host, markers, cities=cities, draw=self.marks)
        text_centred(fb, k.fonts[CHANCE36], *TITLE_AT, ds_str(k.exe, TITLE), INK, SHADOW)
        f = k.fonts[CHANCE17]
        for i, y in enumerate(MENU_Y):
            text_centred(fb, f, CX, y, raw(k, G_MENU, i), INK, SHADOW)
        for i, s in enumerate(self.lines):
            text_centred(fb, f, CX, LINE_Y0 + LINE_STEP * i, s, INK, SHADOW)
        if self.erased:
            px, py = k.popup_pos[2]
            dx, dy, w, h = ROW_ERASE
            blit_opaque(fb, k.picture(25), (px + MAP_SHIFT + dx, py + dy), (MAP_SHIFT + dx, dy, w, h))
        if self.view_box is not None:
            pygame.draw.rect(fb, VIEW_BOX, self.view_box[0], 1)
        self.row.draw(fb)


class SageList(Dialog):
    """ovl51:0000 .. 0301.  `names` gives the count DS:482e; with `buffer` (the run's DS:483c,
    `persist.saves.RunCarry`) every row holding an entry >= 0 draws `buffer.name(entry)`, also
    past the count (ovl51:00f3 tests only the row word), as the EXE draws what an earlier
    list left there; without one only entries < count are drawn."""
    SCREEN, ROWS = 2, 5
    ROW_IDS, PAGE_UP, PAGE_DOWN, ONE_UP, ONE_DOWN, OK, CANCEL = range(114, 119), 119, 120, 121, 122, 123, 124
    POPUP, TITLE_AT, BOX, ROWS_AT = 3, 0x15C2, 0x15A6, 0x15AE
    CHOSEN, OTHER = 15, 2

    def __init__(self, host, title: str, names: list[str], first: int = 0, on_close=None, buffer=None):
        super().__init__(on_close)
        self.host, self.title, self.names = host, title, list(names)
        self.buffer = buffer
        k = self.k = kit(host.app)
        n = len(names)
        self.rows = [i if i < n else -1 for i in range(self.ROWS)]
        self.sel = first
        while self.sel > self.ROWS - 1:
            self.sel -= 1
            self.rows = [r + 1 for r in self.rows]
        self.title_at = ds_words(k.exe, self.TITLE_AT, 2)
        self.box = ds_words(k.exe, self.BOX, 4)
        self.rows_at = [ds_words(k.exe, self.ROWS_AT + 4 * i, 2) for i in range(self.ROWS)]
        self.layout = k.layouts.screen(self.SCREEN)
        self.states()

    def states(self) -> None:
        """ovl51:0301."""
        n = len(self.names)
        keep = [b for b in self.layout.buttons
                if not (n <= self.ROWS and b.id in (self.PAGE_UP, self.PAGE_DOWN, self.ONE_UP, self.ONE_DOWN))]
        self.row = ButtonRow(keep, self.k.picture)
        s = self.row.state
        if n > self.ROWS:
            top = DISABLED if self.rows[0] <= 0 else NORMAL
            bottom = DISABLED if n - 1 <= self.rows[-1] or self.rows[-1] < 0 else NORMAL
            s[self.PAGE_UP] = s[self.ONE_UP] = top
            s[self.PAGE_DOWN] = s[self.ONE_DOWN] = bottom

    def update(self, events, dt) -> None:
        rest = popup_input(self, events, lambda: self.row, self.k.exe,
                           lambda id: self.press(id) or self.stack is None or self.stack.top is not self)
        hand_on(self, rest, dt)

    def press(self, id: int) -> None:
        n, r = len(self.names), self.rows
        if id in self.ROW_IDS:
            i = id - self.ROW_IDS.start
            if r[i] >= 0:
                self.sel = i
        elif id == self.ONE_UP:                            # 01f5
            self.rows = [r[0] - 1] + r[:-1]
            self.sel = min(self.sel + 1, self.ROWS - 1)
        elif id == self.ONE_DOWN:                          # 023e
            self.rows = r[1:] + [r[-1] + 1]
            self.sel = max(self.sel - 1, 0)
        elif id == self.PAGE_UP:                           # 0286
            d = min(r[0], 5)
            self.rows = [x - d for x in r]
        elif id == self.PAGE_DOWN:                         # 02be
            d = min(n - r[-1] - 1, 5)
            self.rows = [x + d for x in r]
        elif id == self.OK:
            return self.close(self.rows[self.sel])
        elif id == self.CANCEL:
            return self.close(-1)
        self.states()

    def draw(self, fb) -> None:
        k = self.k
        f = k.fonts[CHANCE17]
        k.draw_popup(fb, self.POPUP)
        text_centred(fb, f, *self.title_at, self.title, INK, SHADOW)
        fb.fill(3, self.box)
        bevel(fb, self.box, 4, 2)
        for i, (e, at) in enumerate(zip(self.rows, self.rows_at)):
            if self.buffer is not None and e >= 0:
                f.draw(fb, *at, self.buffer.name(e), self.CHOSEN if i == self.sel else self.OTHER, SHADOW)
            elif 0 <= e < len(self.names):
                f.draw(fb, *at, self.names[e], self.CHOSEN if i == self.sel else self.OTHER, SHADOW)
        self.row.draw(fb)


def _inside(rect, pos) -> bool:
    x, y, w, h = rect
    return x <= pos[0] < x + w and y <= pos[1] < y + h


@registry.dialog("sage")
def sage(host, offer, on_close=None):
    return Sage(host, offer, on_close)


@registry.dialog("sage_list")
def sage_list(host, title: str, names: list[str], first: int = 0, on_close=None, buffer=None):
    return SageList(host, title, names, first, on_close, buffer)


@registry.event_view(E.SageOffered)
def _sage(host, ev):
    if host.state.players[host.state.current].control != Control.HUMAN:
        return None
    return wait(registry.open_dialog("sage", host, offer=ev))
