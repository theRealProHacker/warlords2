"""Report > Army / City / Gold / Production / Winning (menu 510..514, keys 'a' 'k' 'g' 'n' 'w'):
one screen with five pages (ovl42, ovl43).

Evidence (asm ovl42:0000..0973, ovl43:07e5..0bfe, res_07be; DS values read from the user's EXE):
* res_07be:0190 / 01f4 / 01df / 0204 / 0263 push the mode 0..4 and call ovl42:0000 (its only
  caller): DS:0df6 = mode, ovl42:0030(1), DS:166a = 1, ovl53:056a(7) (JOIN screen 7), ovl42:026c.
* ovl42:0030: first entry (DS:166a == 0) ovl17:0000(2), the map popup; a page switch restores
  the MARBLE bands ovl17:07e4(0, 0, 0, 0x110) and (0, 0x58, 0, 0x1e).  Here every frame is drawn
  whole: every element that changes lies inside those bands or is redrawn by itself.
  SetFont(1, 15, 0, 3) STRING (0x49, mode) centred at DS:0df8; SetFont(2, 15, 0, 3) STRING
  (0x4a, mode) centred at DS:0dfc; si = ovl42:02fb (`rules.reports.report`); ovl42:05ff (bars, or
  the production list in mode 3); SetFont(2, SCN 0x0a0[p], SCN 0x0b0[p], 3); the map and the
  sentence by mode (jump table 0262), centred at DS:0e00:
  0 (0143): ovl63:0000(1, 1, NULL), ovl63:158d(NULL, -1, -1, 0, 1) (army markers, city squares
    skipped), ovl63:04d3; si == 1 ? (0x4b, 0) : sprintf((0x4b, 1), si);
  1 (019f): ovl63:0000(1, 1, NULL); si == 1 ? (0x4c, 0) : sprintf((0x4c, 1), si);
  2 (01c3): ovl63:0000(1, 1, NULL), ovl62:0372 / 02bf; sprintf((0x4d, 0), si);
  3 (01e4): ovl63:0000(0, 1, NULL), ovl63:1817(NULL, -1) (See All), ovl63:04d3;
    si == 1 ? sprintf((0x4e, 1), si) : sprintf((0x4e, 0), si);
  4 (0222): ovl63:0000(1, 1, NULL); (0x4f, si) unformatted (ovl59:04f0 clamps).
  Modes 1, 2 and 4 run no ovl63:04d3: the Hidden Map edge lines keep ovl63:0000's colour 4.
* Bars ovl42:05ff (modes 0, 1, 2, 4): SHIELDS.PCK (picture 5); every side s with DS:4440[s] == 0
  (alive): y = DS:0e10[s], L = 1 when the scale DS:0e40 <= 0, else max(1, v * 240 / scale) (32-bit
  idiv, v < 0 clamped to 0 first); L / 8 cells (sx, sy, 8, 8) from DS:0e20[s] opaque at
  (312 + 8 i, y), then (sx, sy, L % 8, 8) when the rest > 0; the bevel 14d0:02e5((311, y - 1,
  L + 2, 10), 0, 1).  Axis colour 1: hline (312, 196, 240), ticks (312, 190, 6), (372, 192, 4),
  (432, 190, 6), (492, 192, 4), (552, 190, 6); colour 0 the same one pixel up and left.  SetFont(2,
  15, 0, 3): "%d" DS:0e43 of the scale right-aligned at DS:0e0c, "%d" DS:0e46 of scale / 2
  (toward 0) centred at DS:0e08, DS:0e49 centred at DS:0e04.
* Production list ovl43:0805 (mode 3, on every ovl42:0030): rows = min(count, 5), first = 0,
  last = min(count - 1, 4); ovl43:086e: SetFont(2, ink, shadow, 3) of the side, then per row i,
  entry e = first + i: SetFont(2, 15, 0, 3), "%d" DS:0e64 of e + 1 left at (312, 176 + 30 i);
  ovl64:08be(type, SCN 0x110, .., 328, 170 + 30 i, ring 1); the text left at (368, 176 + 30 i):
  kind 0 with dest >= 100 sprintf(DS:0e67, DS:0e6e), kind 0 sprintf(DS:0e77, name of city dest),
  kind 1 sprintf(DS:0e7e, name of city), kind 2 the city's name (0955..0a05).
* Buttons (dispatcher 07be:04d8): 218..222 -> ovl42:02d7 -> ovl42:0000(id - 218); 223 ->
  ovl42:02e4: ovl17:069c, ovl61:011f(0, 0, 0); 208 ovl43:0b29 (first, last -= 5; while first < 0
  both ++; last = min(last, count - 1); rows = last - first + 1); 206 ovl43:0abd (first--, last--);
  207 ovl43:0af5 (first++, last++); 209 ovl43:0b91 (first, last += 5; while last >= count and
  first > 0 both --; last = min(last, count - 1); rows again); each then redraws the list and
  ovl42:026c.  ovl42:026c: 218 + i pressed (state 0) for the page, else normal; mode 3: ovl43:0a33
  (207 / 209 normal if count - 1 > last else disabled; 206 / 208 normal if first > 0 else
  disabled), else 206..209 hidden (08a9:03b3); 223 normal.
* Keys: DS:166a set, `ui.keys.popup_input`: 223 is in DS:1514 and DS:155c (Esc and Return
  close), 'A'..'Z' ignored, other keys chord; a press on the pressed page button or a disabled
  one chords (07be:0e26).  No sound, wait or palette change besides the close's refresh.
The page routine's state writes (Gold / Winning: the income and upkeep caches ovl62:0372 /
02bf; Army: the army bits of ovl63:158d) are the engine command `ReportPage(mode)`, issued on
every ovl42:0000 (opening and each page button) through `host.command`, as `QuestPage`; then the
values come from `rules.reports.report` once per page (ovl42:02fb at each ovl42:0030).
Rows past 100 entries (aliased slots, plan X40) whose city or type byte lies outside the tables:
the EXE reads other memory; `rules.constants.history.REPORT_ROW_OUTSIDE` (raises unless allowed,
then the name / icon is left out).
"""
from __future__ import annotations

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from ...rules import reports as R
from ...rules.constants import history as KH
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..layout import DISABLED, NORMAL, PRESSED
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from .hero_offer import bevel, raw, sprintf
from .quest import EDGE_0000, army_markers, map_page

SCREEN = 7
PAGES, N_PAGES, CLOSE = 218, 5, 223
UP, DOWN, PAGE_UP, PAGE_DOWN = 206, 207, 208, 209
PAGING = (PAGE_UP, UP, DOWN, PAGE_DOWN)               # 026c hides 0xd0, 0xce, 0xcf, 0xd1
ARMY, CITY, GOLD, PRODUCTION, WINNING = range(5)
TITLE, SUBTITLE = 0x49, 0x4A
SENTENCE = (0x4B, 0x4C, 0x4D, 0x4E, 0x4F)
TITLE_AT, SUBTITLE_AT, SENTENCE_AT = 0x0DF8, 0x0DFC, 0x0E00
ZERO_AT, HALF_AT, FULL_AT = 0x0E04, 0x0E08, 0x0E0C
BAR_Y, BAR_SRC = 0x0E10, 0x0E20
FMT_FULL, FMT_HALF, ZERO = 0x0E43, 0x0E46, 0x0E49
ROW_FMT, STD_FMT, STD_WORD, TO_FMT, MADE_FMT = 0x0E64, 0x0E67, 0x0E6E, 0x0E77, 0x0E7E
SCN_INK, SCN_SHADOW = 0xA0, 0xB0
INK, SHADOW = 15, 0
SHIELDS = 5
BAR_X, BAR_H, BAR_LEN, CELL = 312, 8, 240, 8          # ovl42:067e / 0679, 06b0, 06d5
FRAME_DARK, FRAME_LIGHT = 0, 1                        # 14d0:02e5(rect, 0, 1)
AXIS = (1, 0)                                         # 14d0:0002(1) then (0)
AXIS_LINE = (312, 196, 240)
TICKS = ((312, 190, 6), (372, 192, 4), (432, 190, 6), (492, 192, 4), (552, 190, 6))
ROWS = 5
NUM_X, ICON_X, TEXT_X = 312, 328, 368
TEXT_Y, ICON_Y, ROW_STEP = 176, 170, 30
STANDARD = KH.ENTRY_STANDARD.value                    # dest >= 100: the side's standard (096f)


# ------------------------------------------------------------------ pure parts


def bar_length(v: int, scale: int) -> int:
    """ovl42:0683..06cb."""
    if scale <= 0:
        return 1
    return max(1, max(v, 0) * BAR_LEN // scale)


def bar_cells(length: int) -> list[tuple[int, int]]:
    """(x offset, width) of the SHIELDS cells of a bar (06d0..0767)."""
    full, rest = divmod(length, CELL)
    out = [(CELL * i, CELL) for i in range(full)]
    if rest > 0:
        out.append((CELL * full, rest))
    return out


def sentence_entry(mode: int, own: int) -> tuple[int, int, bool]:
    """(STRING group, index, formatted with `own`) of the page's sentence (jump table 0262)."""
    g = SENTENCE[mode]
    if mode in (ARMY, CITY):
        return (g, 0, False) if own == 1 else (g, 1, True)
    if mode == GOLD:
        return g, 0, True
    if mode == PRODUCTION:
        return (g, 1, True) if own == 1 else (g, 0, True)
    return g, own, False


def paging_start(count: int) -> tuple[int, int, int]:
    """ovl43:0805: (first, last, rows)."""
    return 0, min(count - 1, ROWS - 1), min(count, ROWS)


def paging_step(id: int, count: int, first: int, last: int, rows: int) -> tuple[int, int, int]:
    """206 / 207 / 208 / 209 (ovl43:0abd / 0af5 / 0b29 / 0b91)."""
    if id == UP:
        return first - 1, last - 1, rows
    if id == DOWN:
        return first + 1, last + 1, rows
    if id == PAGE_UP:
        first, last = first - ROWS, last - ROWS
        while first < 0:
            first, last = first + 1, last + 1
    elif id == PAGE_DOWN:
        first, last = first + ROWS, last + ROWS
        while last >= count and first > 0:
            first, last = first - 1, last - 1
    else:
        raise ValueError(id)
    last = min(last, count - 1)
    return first, last, last - first + 1


def paging_states(count: int, first: int, last: int) -> dict[int, int]:
    """ovl43:0a33."""
    more = NORMAL if count - 1 > last else DISABLED
    back = NORMAL if first > 0 else DISABLED
    return {DOWN: more, PAGE_DOWN: more, UP: back, PAGE_UP: back}


def _inside(i: int, n: int) -> bool:
    """A row byte inside its table; outside it the EXE reads other memory (X40)."""
    if 0 <= i < n:
        return True
    KH.REPORT_ROW_OUTSIDE.value                          # raises unless allowed
    return False


def entry_text(exe: bytes, state, e) -> str:
    """ovl43:0955..0a05."""
    def name(c):
        return state.cities[c].name if _inside(c, len(state.cities)) else ""
    if e.kind == KH.ENTRY_ARRIVED.value:
        if e.dest >= STANDARD:
            return sprintf(ds_str(exe, STD_FMT), ds_str(exe, STD_WORD))
        return sprintf(ds_str(exe, TO_FMT), name(e.dest))
    if e.kind == KH.ENTRY_VECTORED.value:
        return sprintf(ds_str(exe, MADE_FMT), name(e.city))
    return name(e.city)


# ------------------------------------------------------------------ the screen


class Reports(Dialog):
    def __init__(self, host, mode: int, on_close=None):
        super().__init__(on_close)
        self.host = host
        self.k = kit(host.app)
        self.layout = self.k.layouts.screen(SCREEN)
        self.row = ButtonRow([], self.k.picture)
        self.enter(mode)

    def enter(self, mode: int) -> None:
        """ovl42:0000(mode): the values (ovl42:02fb), the list's paging (ovl43:0805) and the
        button states (ovl53:056a(7) clears them, ovl42:026c sets them)."""
        self.mode = mode
        self.host.command(C.ReportPage(mode))
        self.values = R.report(self.host.state, mode)
        self.entries = self.values.get("entries", [])
        self.first, self.last, self.rows = paging_start(len(self.entries))
        self.buttons()

    def buttons(self) -> None:
        """ovl42:026c (with ovl43:0a33 in mode 3)."""
        lay = self.layout
        ids = [PAGES + i for i in range(N_PAGES)]
        if self.mode == PRODUCTION:
            ids += list(PAGING)
        ids.append(CLOSE)
        self.row = ButtonRow([lay.button(i) for i in ids], self.k.picture)
        for i in range(N_PAGES):
            self.row.state[PAGES + i] = PRESSED if i == self.mode else NORMAL
        if self.mode == PRODUCTION:
            self.row.state.update(paging_states(len(self.entries), self.first, self.last))

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        if id == CLOSE:                                    # ovl42:02e4
            self.close(None)
            return True
        if PAGES <= id < PAGES + N_PAGES:                  # ovl42:02d7
            self.enter(id - PAGES)
            return True
        if id in PAGING and self.mode == PRODUCTION:
            self.first, self.last, self.rows = paging_step(id, len(self.entries), self.first,
                                                           self.last, self.rows)
            self.buttons()
            return True
        return False

    # -------------------------------------------------------------- drawing

    def draw(self, fb) -> None:
        k, st, exe = self.k, self.host.state, self.k.exe
        mode, own = self.mode, self.values["own"]
        if mode == ARMY:
            map_page(fb, self.host, True, lambda buf: army_markers(k, buf, st, -1, -1, skip_city=True))
        elif mode == PRODUCTION:
            map_page(fb, self.host, False, self.see_all)
        else:
            map_page(fb, self.host, True, edge=EDGE_0000)
        text_centred(fb, k.fonts[CHANCE36], *ds_words(exe, TITLE_AT, 2), raw(k, TITLE, mode), INK, SHADOW)
        f = k.fonts[CHANCE17]
        text_centred(fb, f, *ds_words(exe, SUBTITLE_AT, 2), raw(k, SUBTITLE, mode), INK, SHADOW)
        if mode == PRODUCTION:
            self.draw_list(fb)
        else:
            self.draw_bars(fb)
        g, i, fmt = sentence_entry(mode, own)
        s = sprintf(raw(k, g, i), own) if fmt else raw(k, g, i)
        p = st.current
        text_centred(fb, f, *ds_words(exe, SENTENCE_AT, 2), s,
                     st.flags.get(SCN_INK + 2 * p, 0), st.flags.get(SCN_SHADOW + 2 * p, 0))
        self.row.draw(fb)

    def see_all(self, buf) -> None:
        """ovl63:1817(NULL, -1) and ovl63:04d3 into the bitmap (`production.MapPainter`)."""
        from .production import MapPainter
        painter = getattr(self, "_painter", None)
        if painter is None:
            painter = self._painter = MapPainter(self.host)
        painter.see_all(self.host.state, -1)
        buf.blit(painter.buf, (0, 0))

    def draw_bars(self, fb) -> None:
        k, exe = self.k, self.k.exe
        v = self.values
        pic = k.picture(SHIELDS)
        ys = ds_words(exe, BAR_Y, 8)
        src = ds_words(exe, BAR_SRC, 16)
        for s in range(8):
            if v["dead"][s]:
                continue
            y = ys[s]
            n = bar_length(v["values"][s], v["scale"])
            sx, sy = src[2 * s], src[2 * s + 1]
            for dx, w in bar_cells(n):
                blit_opaque(fb, pic, (BAR_X + dx, y), (sx, sy, w, BAR_H))
            bevel(fb, (BAR_X - 1, y - 1, n + 2, BAR_H + 2), FRAME_DARK, FRAME_LIGHT)
        for d, colour in zip((0, 1), AXIS):
            x, y, n = AXIS_LINE
            fb.fill(colour, (x - d, y - d, n, 1))
            for x, y, n in TICKS:
                fb.fill(colour, (x - d, y - d, 1, n))
        f = k.fonts[CHANCE17]
        scale = v["scale"]
        full = sprintf(ds_str(exe, FMT_FULL), scale)
        fx, fy = ds_words(exe, FULL_AT, 2)
        f.draw(fb, fx - f.width(full), fy, full, INK, SHADOW)
        text_centred(fb, f, *ds_words(exe, HALF_AT, 2), sprintf(ds_str(exe, FMT_HALF), int(scale / 2)), INK, SHADOW)
        text_centred(fb, f, *ds_words(exe, ZERO_AT, 2), ds_str(exe, ZERO), INK, SHADOW)

    def draw_list(self, fb) -> None:
        """ovl43:086e."""
        from ..palettes import painter_for
        k, st, exe = self.k, self.host.state, self.k.exe
        f = k.fonts[CHANCE17]
        painter = painter_for(self.host)
        for i in range(self.rows):
            e = self.entries[self.first + i]
            ty = TEXT_Y + ROW_STEP * i
            f.draw(fb, NUM_X, ty, sprintf(ds_str(exe, ROW_FMT), self.first + i + 1), INK, SHADOW)
            t = e.type if _inside(e.type, len(st.army_types)) else -1     # -1: the ring alone
            painter.army(fb, t, st.current, ICON_X, ICON_Y + ROW_STEP * i, ring=1)
            f.draw(fb, TEXT_X, ty, entry_text(exe, st, e), INK, SHADOW)


@registry.dialog("reports")
def reports(host, mode: int = ARMY, on_close=None):
    return Reports(host, mode, on_close)


def _open(mode: int):
    def run(host):
        """07be case -> ovl42:0000(mode); closed through 223 -> ovl42:02e4 -> ovl61:011f(0, 0, 0)."""
        if getattr(host, "state", None) is None:
            return None
        return registry.open_dialog("reports", host, mode=mode, on_close=lambda _: host.settings_closed())
    return run


for _mode, _name in enumerate(("report_army", "report_city", "report_gold", "report_production",
                               "report_winning")):
    registry.action(registry.MENU_ID[_name])(_open(_mode))
