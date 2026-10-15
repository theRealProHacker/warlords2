"""History > City / Events / Gold / Winners (menu 530..533, keys 'h' 'e' 'j' 'y') and History >
Triumphs (534, 'l'): ovl41:0000(mode), mode 0 / 1 / 2 / 3 / 4 (07be:01e3 / 01d2 / 01f0 / 0270 /
01f8 -> 07be:0272).

Evidence (asm ovl41, ovl63, ovl17, res_0726, res_1133; FPU code re-decoded from the int 34h..3Dh
emulator calls, 0x9b 0xd8+n / fwait):
* ovl41:0000(mode): DS:0dc4 = mode; mode 4 -> ovl41:09eb (Triumphs, no turn test).  Else t =
  ovl61:225b(); t <= 1 -> ovl61:1160(STRING (0x5d, 0), (0x5d, 1)) and return (the menu items
  are off on turn 1, `ui.game_menus`, and their keys swallowed); else DS:443c = min(t, 0xc9)
  (= N + 1, N records), DS:443e = r = N (the last record); ovl41:0096(1, 1); DS:166a = 1;
  ovl53:056a(0x13); ovl41:084e.  The records are CURRENT.HST as read at the first open
  (ovl41:1009); here `state.history[r - 1]` (rules.history), taken at the open.
* ovl41:0096(full, step), the redraw:
  - full with DS:166a set (a mode switch): ovl17:07e4(0, 0, 0, 0x10f) restores the title band,
    and for a mode other than 1 ovl17:07e4(0, 0x54, 0, 0x1e) the graph area; full with DS:166a
    clear: popup 0x0a (marble at (32, 60, 576, 312)), the data read (1009);
  - full: SetFont(1, 15, 0, 3), STRING (0x5b, mode) centred at (432, 64); then SetFont(2, 15, 0, 3);
  - full or step: ovl17:070b(0x10, 0x122, 0x50, 0x14) and "Turn %d" (DS:0dde) of r centred at
    (312, 350);
  - full: mode 1 -> ovl41:18da(1) (the bar), else ovl41:034a (the graph);
  - mode 1 (full or step): ovl41:16ba (the event list), and on a step 18da(0);
  - other modes (full or step): the cursor x = 300 + r * 292 / N (DS:0dc6 / 0dca, 32-bit idiv),
    colour 13 from y 148 to 296 through 1133:0095 with the save buffer DS:4430 (each pixel read
    before it is plotted, 1133:01fe..021d); the line STRING (0x5c, mode) % (r, the viewing side's
    value) or, mode 3, % (r, the name of the first side with the strictly greatest score, start
    side 0 / value 0) after ovl17:070b(0, 0x102, 0x150, 0x14), centred at (432, 318);
  - full: ovl63:0000(0, 0, NULL): the overview bitmap DS:6795 rebuilt without city markers
    (fog with Hidden Map; its colour-4 edge lines lie where 04d3 draws colour 3 and are not
    kept here);
  - full or step: ovl63:12d3(NULL, owners of record r) onto the same bitmap, then ovl63:04d3(NULL):
    with Hidden Map the colour-3 lines at the top, left and bottom, and the bitmap to the screen
    at (ovl17:08c7() = 0x20 for a popup that is not type 2, 0x3c).  A step does not rebuild the
    bitmap: the new record's markers are drawn over the old ones (`bitmap` is kept).
* ovl63:12d3(rect, owners): nothing with Hidden Map while a computer side moves (as
  `minimap.frozen`); per city i at (x, y) (with Hidden Map only when one of its four squares
  has road-layer bit 0x20): owner byte 0x0f -> marker 8, 0xff (or any byte negative as a signed
  char) -> marker 8 plus colour-0 lines (2x, 2y)-(2x+5, 2y+5) and (2x, 2y+6)-(2x+5, 2y)
  (1133:00b8), else marker o; ATRANS2 DS:2c2e[k] masked at (((2x - 1) >> 3) * 8, 2y - 1)
  pre-shifted by (2x - 1) & 7 (as ovl63:0ed7).
* ovl41:034a, the graph: accessor and floor: mode 0 cities (+0x22, 10), 2 gold (+0x02, 500),
  3 score (+0x12, 100); ymax = max(floor, every value of records 1..N, all 8 sides) (signed);
  axes colour 0: 1133:0344 v(299, 149, 140), 02fe h(299, 288, 292), h(295, 149, 4),
  h(295, 219, 4), h(295, 288, 4), v(299, 288, 4), v(445, 288, 4), v(590, 288, 4); colour 15:
  v(300, 150, 140), h(300, 289, 292), h(296, 150, 4), h(296, 220, 4), h(296, 289, 4),
  v(300, 289, 4), v(446, 289, 4), v(591, 289, 4); labels: right-aligned DS:0de9 at (292, 282) and
  ymax (DS:0de6) at (292, 144), centred DS:0dee at (300, 298), right-aligned N (DS:0deb) at
  (600, 298), centred DS:0df0 at (446, 298); lines: prev[p] = (301, 288); for r = 1..N,
  x = 300 + r * 292 / N, p = 0..7 (every side): y = 289 - ftol(140 * (float)(v / ymax)) (fild,
  fild, fdivp, fstp dword, fild 140, fmul dword, 0000:1b57 chop), SetColour(SCN 0x0a0[p]),
  1133:0095(prev, (x, y)) (Bresenham 1133:00b8, `production.line`).
* ovl41:18da(full), the Events bar: full: 14d0:02e5((272, 319, 320, 17), 4, 2), the same inset
  by one, colour-0 outline 116d:01fd of (274, 321, 316, 13); always s = min(r * 314 / N, 314),
  fill (275, 322, s, 11) in SCN 0x0a0[p] (116d:0288); s < 306 -> fill (275 + s, 322, 314 - s, 11)
  in SCN 0x0b0[p] (else the tail keeps what was there).
* ovl41:16ba, the event list: ovl17:070b(0, 0x54, 0x160, 0xaf); SetFont(2, 15, 0, 3); for entry
  i < the record's event count: ATRANS2 (picture 9) masked (0x70 + 16 (side / 4), 0x5e + 14
  (side % 4), 16, 14) at (264, 150 + 17 i); ovl41:1516(kind, a, b, name) left-aligned at
  (280, 149 + 17 i); kinds 9, 10, 8 also the shield of side b at (280 + (width >> 3 << 3) + 16,
  150 + 17 i) (11e2:0a8e).
* ovl41:1516 into DS:5c38 (jump table cs:16a4 on the sign-extended kind byte, unsigned compare
  with 10; a and b signed words; names looked up now: city 2c04:1581 + 0x41 c, side 2c04:0000 +
  0x14 s, item 2c04:0ce9 + 0x1d i): STRING (0x5e, k) with 0: k0 (name, city a); 1: a == -1 k1
  (name), a == -2 k2 (name), else k3 (name, city a); 2: k4 (name); 3: k5 (name); 4: k6 (side a);
  5: a == -1 k7 (name, city b), else k8 (side a, city b); 6: k9 (name, X), X = k13 / k14 / k15
  for a = 100 / 101 / 102, else item a; 7: k10 (side a); 8: k16 (side a, side b); 9: k11 (side a,
  side b); 10: k12 (side a, side b); any other kind writes nothing (the buffer keeps its text).
  0000:4944 reads only the arguments its format names (`hero_offer.sprintf`).
* ovl41:084e: 0x160 + i pressed (0) for i == mode else normal (1); 0x165 disabled (2) when
  r == 1, 0x166 when r == N; mode 1 -> area 11 on, 10 off, else 10 on, 11 off; 0x164 normal.
* JOIN screen 0x13 (BUTTON.DAT ids 0x160..0x166, AREA.DAT areas 10 (300, 150, 292, 160) and
  11 (275, 322, 314, 11), group mask 0).  07be:04d8: 0x160..0x163 -> 07be:09a8 -> ovl41:08e2(i):
  DS:0dc4 = i, 0096(1, 1), 084e; 0x164 -> ovl41:09cf: 10bf (frees the data), ovl17:069c,
  ovl61:011f(0, 0, 0); 0x165 / 0x166 -> ovl41:0908(-1 / +1).
* ovl41:0908(d): d != 0: r += d; d == 0 (an area): the pointer (12bf:0af4), f = (float)((mx -
  300) / 292.0) (mode != 1) or ((mx - 275) / 314.0) (mode 1) (fild, fild, fsubp, fild, fdivp,
  fstp dword), r' = ftol(N * f) + 1; r' == r -> return; r = r'.  Then for a mode other than 1
  SetColour(-1) and 1133:0095 over the old cursor with the buffer (the saved pixels back);
  0096(0, 1); 084e.
* 0726:0009 (each main-loop pass) polls the enabled areas with the pointer inside while a mouse
  button is held: buttons == 2 (right only) -> ovl46:1201(pointer, 0) + ovl46:10e1(DS:11fc,
  DS:120c) for area 10, (DS:1223, DS:1233) for area 11, DS:1174 = 1 (the panel until the release,
  `info.Panel`); any other held state -> ovl41:0908(0), every pass (dragging scrubs).
* ovl41:09eb (Triumphs): DS:4422 = SCN 0x110; 0a21(1); DS:166a = 1; ovl53:056a(0x14); 0cfa.
  0a21(full): full with DS:166a set: ovl17:070b(0x40, 0x75, 0x170, 0xa8); full with it clear:
  popup 0, SetFont(1, 15, 0, 3), STRING (0x50, 0) centred at (320, 64); the sides i = 0..7:
  BUTTON.PCK (picture 4) opaque (400, 40 if i == DS:4422 else 0, 48, 40) at (128 + 48 i, 109),
  BSHIELD (picture 38) masked (32 i, 0, 32, 36) at (136 + 48 i, 111); ovl64:08be(type, DS:4422,
  x 104, y, ring 1, mode 0) for types 4, 25, 28, 5, 29 at y 168, 203, 238, 273, 308;
  SetFont(2, 15, 0, 3); g = 0x51 when SCN 0x110 == DS:4422 else 0x56; for f = 0..4 the word w at
  2c04:1163 + 0x50 SCN 0x110 + 0xa DS:4422 + 2 f (`rules.history.stat_word`), w > 0 (signed) ->
  STRING (g + f, 0 if w == 1 else 1) % w left-aligned at (144, 177 + 35 f).
  0cfa: 0x168 + i pressed for i == DS:4422 else normal; 0x167 normal.  JOIN screen 0x14:
  0x168 + i -> ovl41:0d33(i): DS:4422 = i, 0a21(1), 0cfa; 0x167 -> ovl41:0d49: ovl17:069c,
  ovl61:011f(0, 0, 0).
* Keys: DS:166a is set, so only `keys.popup_key`: Esc / Return press 0x164 / 0x167 (both lists
  DS:1514 and DS:155c hold them); a right press on a button shows its help.  No sound, wait or
  palette effect in ovl41.
The EXE draws only at these calls; the popup's picture is kept in `canvas`, the overview
bitmap in `bitmap`, the cursor's saved pixels in `saved` (DS:4430).
"""
from __future__ import annotations

from fractions import Fraction

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...model.ids import MAP_W, ROAD_SEEN
from ...rules.bonuses import s8
from ...rules.economy import s16
from ...rules.heroes import turn
from ...rules.history import stat_word
from .. import registry
from ..dialog import Dialog
from ..info import POPUP as PANEL_PICTURE, Panel, panel_rect, two_lines
from ..keys import code_of, left_press, popup_key, right_help
from ..layout import DISABLED, NORMAL, PRESSED
from ..menubar import with_codes
from ..minimap import frozen
from ..palettes import painter_for
from ..screen import IDENTITY
from ..widgets import MARBLE, ButtonRow, blit_opaque, kit, picture_blit, text_centred
from .hero_offer import bevel, bitmap, raw, sprintf
from .production import hline, line, vline

# ---------------------------------------------------------------- screen ids
POPUP, SCREEN = 0x0A, 0x13
MODE_IDS = range(0x160, 0x164)
CLOSE, PREV, NEXT = 0x164, 0x165, 0x166
AREA_GRAPH, AREA_BAR = 10, 11
T_POPUP, T_SCREEN, T_CLOSE = 0, 0x14, 0x167
SIDE_IDS = range(0x168, 0x170)
CITY, EVENTS, GOLD, WINNERS, TRIUMPHS = range(5)

# ---------------------------------------------------------------- DGROUP data (read from the EXE)
GRAPH_RECT, BAR_FRAME, BAR_FILL = 0x0DC6, 0x0DCE, 0x0DD6
FMT_TURN, FMT_MAX, ZERO_Y, FMT_N, ZERO_X, TURNS = 0x0DDE, 0x0DE6, 0x0DE9, 0x0DEB, 0x0DEE, 0x0DF0
PANEL_TEXT = {AREA_GRAPH: (0x11FC, 0x120C), AREA_BAR: (0x1223, 0x1233)}
MAP_SHIFT = 0x2A8C                               # DS:2a8c = 224 (types 2 and 0x0a)
SHIFTED = (2, 0x0A)                              # ovl17:075a..0762 / 0833..083b

# ---------------------------------------------------------------- STRING.DAT groups
G_TITLE, G_STAT, G_EARLY, G_EVENT = 0x5B, 0x5C, 0x5D, 0x5E
G_TRIUMPHS, G_OWN, G_OTHER = 0x50, 0x51, 0x56
EV_SITE_WORDS = {100: 13, 101: 14, 102: 15}      # ovl41:15e8..160c

# ---------------------------------------------------------------- numbers of ovl41
MAX_TURN = 0xC9                                  # ovl41:004f
ACCESSOR = {CITY: ("cities", 10), GOLD: ("gold", 500), WINNERS: ("score", 100)}   # 034a
INK, SHADOW = 15, 0
SCN_SIDE_NAME, SCN_INK, SCN_SHADOW = 0x000, 0xA0, 0xB0
TITLE_AT, TURN_AT, STAT_AT = (432, 64), (312, 350), (432, 318)
CURSOR_COLOUR, CURSOR_DY0, CURSOR_DY1 = 13, -2, 6  # 01fb..020e: y - 2 .. y + h + 6
FILL_TAIL = 8                                    # 19b8: dda - 8
LIST_TEXT_X, LIST_TEXT_Y, LIST_SHIELD_X, LIST_SHIELD_Y, LIST_STEP = 0x118, 0x95, 0x108, 0x96, 0x11
SHIELD_SRC, SHIELD_SIZE = (0x70, 0x5E), (16, 14)  # 1740..175b
SECOND_SHIELD_KINDS, SECOND_SHIELD_GAP = (8, 9, 10), 16
ATRANS = 9
X_COLOUR = 0                                     # 151b
NEUTRAL, RAZED = 0x0F, 0xFF                      # owner bytes: marker 8 / marker 8 and the X
HIDDEN_LINE = 3                                  # ovl63:0546
POPUP_MAP_X, POPUP_MAP_Y = 0x20, 0x3C            # ovl17:08f1, ovl63:058f
BUTTONS_PCK, BSHIELD = 4, 38
T_TITLE_AT = (320, 64)
T_CELL_SRC, T_CELL = (400, 40), (48, 40)         # 0a8f..0aa3: (400, 40 / 0, 48, 40)
T_CELL_AT, T_SHIELD_AT, T_STEP, T_SHIELD = (128, 109), (136, 111), 48, (32, 36)
T_TYPES = (4, 25, 28, 5, 29)
T_ICON_X, T_ICON_Y, T_TEXT_X, T_TEXT_Y, T_ROW = 104, 168, 144, 177, 35
T_RESTORE = (0x40, 0x75, 0x170, 0xA8)


# ---------------------------------------------------------------- arithmetic of the FPU code


def _round_bits(q: Fraction, bits: int) -> Fraction:
    """q rounded to `bits` significant bits, to nearest, ties to even (the FPU's rounding)."""
    if q == 0:
        return q
    a = abs(q)
    e = a.numerator.bit_length() - a.denominator.bit_length()
    if a < Fraction(2) ** e:
        e -= 1
    scale = Fraction(2) ** (bits - 1 - e)
    r = Fraction(round(a * scale)) / scale
    return r if q > 0 else -r


def f32_div(a: int, b: int) -> Fraction:
    """fild a; fild b; fdivp (64-bit mantissa); fstp dword (24-bit)."""
    return _round_bits(_round_bits(Fraction(a, b), 64), 24)


def chop(q: Fraction) -> int:
    """0000:1b57 (__ftol): truncation toward zero."""
    return int(q)


def line_y(v: int, ymax: int, bottom: int, height: int) -> int:
    """034a 079d..07d2: bottom - ftol(height * (float)(v / ymax))."""
    return bottom - chop(height * f32_div(v, ymax))


def record_at(x0: int, width: int, n: int, mx: int) -> int:
    """0908 092f..0983: ftol(N * (float)((mx - x0) / width)) + 1."""
    return chop(n * f32_div(mx - x0, width)) + 1


# ---------------------------------------------------------------- shared drawing


def restore(cv, k, t: int, dx: int, dy: int, w: int, h: int) -> None:
    """ovl17:070b(dx, dy, w, h): the popup picture's (shift + dx, dy, w, h) back at the popup
    position + (shift + dx, dy); shift DS:2a8c for types 2 / 0x0a."""
    px, py = k.popup_pos[t]
    shift = ds_words(k.exe, MAP_SHIFT, 1)[0] if t in SHIFTED else 0
    picture_blit(cv, k.picture(MARBLE), (px + shift + dx, py + dy), (shift + dx, dy, w, h))


def restore_inset(cv, k, t: int, left: int, top: int, right: int, bottom: int) -> None:
    """ovl17:07e4(l, t, r, b): the popup picture inset by the margins (07e4 = 070b with
    w = W - shift - l - r, h = H - t - b)."""
    _, _, w, h = k.popup_rect[t]
    shift = ds_words(k.exe, MAP_SHIFT, 1)[0] if t in SHIFTED else 0
    restore(cv, k, t, left, top, w - shift - left - right, h - top - bottom)


def text_right(fb, font, x: int, y: int, s: str, ink: int, shadow: int) -> None:
    """ovl59:0103."""
    font.draw(fb, x - font.width(s), y, s, ink, shadow)


def frame(fb, k, t: int) -> None:
    """The outline and shadow of ovl17:0000 (kept on the screen in the EXE)."""
    x, y, w, h = k.popup_rect[t]
    pygame.draw.rect(fb, 0, (x - 1, y - 1, w + 2, h + 2), 1)
    fb.fill(0, (x + 1, y + h + 1, w + 2, 2))
    fb.fill(0, (x + w + 1, y + 1, 2, h + 2))


def new_canvas() -> pygame.Surface:
    cv = pygame.Surface((640, 480), depth=8)
    cv.set_palette(IDENTITY)
    return cv


def side_name(state, s: int) -> str:
    return state.players[s].name


def event_text(state, k, kind: int, a: int, b: int, name: str, previous: str) -> str:
    """ovl41:1516: the text of a news entry (a, b as signed words); a kind outside 0..10
    leaves the buffer DS:5c38 as it was (`previous`)."""
    a, b, kind = s16(a), s16(b), s8(kind)

    def fmt(i, *args):
        return sprintf(raw(k, G_EVENT, i), *args)

    city = lambda c: state.cities[c].name          # noqa: E731
    side = lambda s: side_name(state, s)           # noqa: E731
    if kind == 0:
        return fmt(0, name, city(a))
    if kind == 1:
        return fmt(1, name) if a == -1 else fmt(2, name) if a == -2 else fmt(3, name, city(a))
    if kind == 2:
        return fmt(4, name)
    if kind == 3:
        return fmt(5, name)
    if kind == 4:
        return fmt(6, side(a))
    if kind == 5:
        return fmt(7, name, city(b)) if a == -1 else fmt(8, side(a), city(b))
    if kind == 6:
        x = raw(k, G_EVENT, EV_SITE_WORDS[a]) if a in EV_SITE_WORDS else state.items[a].name
        return fmt(9, name, x)
    if kind == 7:
        return fmt(10, side(a))
    if kind == 8:
        return fmt(16, side(a), side(b))
    if kind == 9:
        return fmt(11, side(a), side(b))
    if kind == 10:
        return fmt(12, side(a), side(b))
    return previous


def history_markers(sp, buf, state, owners) -> None:
    """ovl63:12d3(NULL, owners) onto the overview bitmap (`sp` = the game's Sprites: ATRANS2
    and the table DS:2c2e)."""
    if frozen(state):
        return
    w = state.world
    hidden = bool(state.options.hidden_map)
    for i, c in enumerate(state.cities):
        x, y = c.x, c.y
        if hidden and not any(w.roads[(y + dy) * MAP_W + x + dx] & ROAD_SEEN
                              for dx in (0, 1) for dy in (0, 1)):
            continue
        u = 2 * x - 1
        o = owners[i]
        mark = -1 if o == RAZED else NEUTRAL if o == NEUTRAL else s8(o)
        buf.blit(sp.atrans, ((u >> 3) << 3, 2 * y - 1), sp.city_mark(mark if mark >= 0 else NEUTRAL, u & 7))
        if mark < 0:
            line(buf, 2 * x, 2 * y, 2 * x + 5, 2 * y + 5, X_COLOUR)
            line(buf, 2 * x, 2 * y + 6, 2 * x + 5, 2 * y, X_COLOUR)


# ---------------------------------------------------------------- the history screen


class History(Dialog):
    """JOIN screen 0x13 over popup 0x0a (modes 0..3)."""

    def __init__(self, host, mode: int, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        st = host.state
        self.n1 = min(turn(st), MAX_TURN)                  # DS:443c
        self.n = self.n1 - 1
        # The EXE walks CURRENT.HST without a bound (ovl41:10eb..1224): with fewer records it
        # reads past the data block (garbage); unreachable here, records are written every round
        # from turn 2 (rules.history.record_round) and saved (model.serialize).
        if len(st.history) < self.n:
            raise RuntimeError("history: %d records for turn %d; the EXE would read past CURRENT.HST"
                               % (len(st.history), turn(st)))
        self.records = list(st.history[:self.n])           # the file as of opening (ovl41:1009)
        self.r = self.n                                    # DS:443e
        self.mode = mode
        lay = k.layouts.screen(SCREEN)
        self.row = ButtonRow(list(lay.buttons), k.picture)
        self.area_rects = {a.id: a.rect for a in lay.areas}
        self.areas = {AREA_GRAPH: False, AREA_BAR: False}
        self.gx, self.gy, self.gw, self.gh = ds_words(k.exe, GRAPH_RECT, 4)
        self.bar_frame = ds_words(k.exe, BAR_FRAME, 4)
        self.bx, self.by, self.bw, self.bh = ds_words(k.exe, BAR_FILL, 4)
        self.canvas = new_canvas()
        self.bitmap = None                                 # DS:6795
        self.cursor = None                                 # DS:4428..442e
        self.saved: list[int] = []                         # DS:4430
        self.opened = False                                # DS:166a
        self.redraw(True, True)
        self.opened = True
        self.buttons()

    # -------------------------------------------------------------- data
    @property
    def text(self) -> str:
        """DS:5c38, the event text buffer: static DGROUP, so it keeps the last text across
        opens; kept per App (like `App.capture_tutorial_shown`), "" at the start of a run."""
        return getattr(self.host.app, "history_event_text", "")

    @text.setter
    def text(self, s: str) -> None:
        self.host.app.history_event_text = s

    def record(self, r: int) -> dict:
        return self.records[r - 1]

    def ink(self, p: int) -> int:
        return self.host.state.flags.get(SCN_INK + 2 * p, 0)

    # -------------------------------------------------------------- drawing (ovl41:0096)
    def redraw(self, full: bool, step: bool) -> None:
        k, cv, st = self.k, self.canvas, self.host.state
        if full:
            if self.opened:
                restore_inset(cv, k, POPUP, 0, 0, 0, 0x10F)
                if self.mode != EVENTS:
                    restore_inset(cv, k, POPUP, 0, 0x54, 0, 0x1E)
            else:
                k.draw_popup(cv, POPUP)
            text_centred(cv, k.fonts[CHANCE36], *TITLE_AT, raw(k, G_TITLE, self.mode), INK, SHADOW)
        f = k.fonts[CHANCE17]
        if full or step:
            restore(cv, k, POPUP, 0x10, 0x122, 0x50, 0x14)
            text_centred(cv, f, *TURN_AT, sprintf(ds_str(k.exe, FMT_TURN), self.r), INK, SHADOW)
        if full:
            if self.mode == EVENTS:
                self.bar(True)
            else:
                self.graph()
        if (full or step) and self.mode == EVENTS:
            self.event_list()
            if not full:
                self.bar(False)
        elif full or step:
            self.cursor_draw()
            self.stat_line()
        if full:
            self.bitmap = bitmap(self.host.minimap, st)    # ovl63:0000(0, 0, NULL)
        if full or step:
            history_markers(self.host.sprites, self.bitmap, st, self.record(self.r)["owners"])
            self.blit_map()

    def blit_map(self) -> None:
        """ovl63:04d3(NULL)."""
        buf = self.bitmap
        if self.host.state.options.hidden_map:
            bw, bh = buf.get_size()
            buf.fill(HIDDEN_LINE, (0, 0, bw, 1))
            buf.fill(HIDDEN_LINE, (0, 0, 1, bh))
            buf.fill(HIDDEN_LINE, (0, bh - 1, bw, 1))
        self.canvas.blit(buf, (POPUP_MAP_X, POPUP_MAP_Y))

    def values(self, r: int) -> list[int]:
        return [s16(v) for v in self.record(r)[ACCESSOR[self.mode][0]]]

    def graph(self) -> None:
        """ovl41:034a."""
        k, cv = self.k, self.canvas
        x, y, w, h = self.gx, self.gy, self.gw, self.gh
        ymax = ACCESSOR[self.mode][1]
        for r in range(1, self.n + 1):
            for v in self.values(r):
                ymax = max(ymax, v)
        for c, d in ((0, -1), (15, 0)):
            vline(cv, x + d, y + d, h, c)
            hline(cv, x + d, y + h - 1 + d, w, c)
            hline(cv, x - 4 + d, y + d, 4, c)
            hline(cv, x - 4 + d, y + h // 2 + d, 4, c)
            hline(cv, x - 4 + d, y + h - 1 + d, 4, c)
            vline(cv, x + d, y + h - 1 + d, 4, c)
            vline(cv, x + w // 2 + d, y + h - 1 + d, 4, c)
            vline(cv, x + w - 1 + d, y + h - 1 + d, 4, c)
        f = k.fonts[CHANCE17]
        exe = k.exe
        text_right(cv, f, x - 8, y + h - 8, ds_str(exe, ZERO_Y), INK, SHADOW)
        text_right(cv, f, x - 8, y - 6, sprintf(ds_str(exe, FMT_MAX), ymax), INK, SHADOW)
        text_centred(cv, f, x, y + h + 8, ds_str(exe, ZERO_X), INK, SHADOW)
        text_right(cv, f, x + w + 8, y + h + 8, sprintf(ds_str(exe, FMT_N), self.n), INK, SHADOW)
        text_centred(cv, f, x + w // 2, y + h + 8, ds_str(exe, TURNS), INK, SHADOW)
        prev = [(x + 1, y + h - 2)] * 8
        for r in range(1, self.n + 1):
            px = x + r * w // self.n
            for p, v in enumerate(self.values(r)):
                py = line_y(v, ymax, y + h - 1, h)
                line(cv, *prev[p], px, py, self.ink(p))
                prev[p] = (px, py)

    def cursor_draw(self) -> None:
        """0096 01ce..022d: the colour-13 line, its pixels saved first."""
        x = self.gx + self.r * self.gw // self.n
        y0, y1 = self.gy + CURSOR_DY0, self.gy + self.gh + CURSOR_DY1
        self.cursor = (x, y0, x, y1)
        self.saved = [self.canvas.get_at_mapped((x, y)) for y in range(y0, y1 + 1)]
        self.canvas.fill(CURSOR_COLOUR, (x, y0, 1, y1 - y0 + 1))

    def cursor_restore(self) -> None:
        """0908 099d..09b4: SetColour(-1), the saved pixels back."""
        x, y0, _, y1 = self.cursor
        for y, c in zip(range(y0, y1 + 1), self.saved):
            self.canvas.set_at((x, y), c)

    def stat_text(self) -> str:
        """0096 0230..02db: the line under the graph."""
        k, st = self.k, self.host.state
        if self.mode == WINNERS:
            best = value = 0
            for p, v in enumerate(self.values(self.r)):
                if v > value:
                    best, value = p, v
            return sprintf(raw(k, G_STAT, WINNERS), self.r, side_name(st, best))
        return sprintf(raw(k, G_STAT, self.mode), self.r, self.values(self.r)[st.current])

    def stat_line(self) -> None:
        """0096 02de..0302."""
        k = self.k
        restore(self.canvas, k, POPUP, 0, 0x102, 0x150, 0x14)
        text_centred(self.canvas, k.fonts[CHANCE17], *STAT_AT, self.stat_text(), INK, SHADOW)

    def bar(self, full: bool) -> None:
        """ovl41:18da."""
        cv, st = self.canvas, self.host.state
        if full:
            x, y, w, h = self.bar_frame
            bevel(cv, (x, y, w, h), 4, 2)
            bevel(cv, (x + 1, y + 1, w - 2, h - 2), 4, 2)
            pygame.draw.rect(cv, 0, (x + 2, y + 2, w - 4, h - 4), 1)
        s = min(self.r * self.bw // self.n, self.bw)
        p = st.current
        cv.fill(self.ink(p), (self.bx, self.by, s, self.bh))
        if s < self.bw - FILL_TAIL:
            cv.fill(st.flags.get(SCN_SHADOW + 2 * p, 0), (self.bx + s, self.by, self.bw - s, self.bh))

    def event_list(self) -> None:
        """ovl41:16ba."""
        k, cv, st = self.k, self.canvas, self.host.state
        restore(cv, k, POPUP, 0, 0x54, 0x160, 0xAF)
        f = k.fonts[CHANCE17]
        pic = k.picture(ATRANS)
        for i, (side, kind, a, b, name) in enumerate(self.record(self.r)["events"]):
            sy = LIST_SHIELD_Y + LIST_STEP * i
            cv.blit(pic, (LIST_SHIELD_X, sy), shield_src(side))
            self.text = event_text(st, k, kind, a, b, name, self.text)
            f.draw(cv, LIST_TEXT_X, LIST_TEXT_Y + LIST_STEP * i, self.text, INK, SHADOW)
            if s8(kind) in SECOND_SHIELD_KINDS:
                x2 = LIST_TEXT_X + (f.width(self.text) >> 3 << 3) + SECOND_SHIELD_GAP
                cv.blit(pic, (x2, sy), shield_src(s16(b)))

    # -------------------------------------------------------------- state (ovl41:084e)
    def buttons(self) -> None:
        st = self.row.state
        for i, id in enumerate(MODE_IDS):
            st[id] = PRESSED if i == self.mode else NORMAL
        st[PREV] = DISABLED if self.r == 1 else NORMAL
        st[NEXT] = DISABLED if self.r == self.n else NORMAL
        self.areas[AREA_GRAPH] = self.mode != EVENTS
        self.areas[AREA_BAR] = self.mode == EVENTS
        st[CLOSE] = NORMAL

    def switch(self, mode: int) -> None:
        """ovl41:08e2."""
        self.mode = mode
        self.redraw(True, True)
        self.buttons()

    def step(self, d: int, pos=None) -> None:
        """ovl41:0908(d)."""
        if d == 0:
            if self.mode != EVENTS:
                r = record_at(self.gx, self.gw, self.n, pos[0])
            else:
                r = record_at(self.bx, self.bw, self.n, pos[0])
            if r == self.r:
                return
            self.r = r
        else:
            self.r += d
        if self.mode != EVENTS:
            self.cursor_restore()
        self.redraw(False, True)
        self.buttons()

    def press(self, id: int) -> None:
        """07be:04d8."""
        if id in MODE_IDS:
            self.switch(id - MODE_IDS.start)
        elif id == CLOSE:
            self.close(None)
        elif id == PREV:
            self.step(-1)
        elif id == NEXT:
            self.step(1)

    # -------------------------------------------------------------- input
    def area_at(self, pos) -> int | None:
        for a, on in self.areas.items():
            x, y, w, h = self.area_rects[a]
            if on and x <= pos[0] < x + w and y <= pos[1] < y + h:
                return a
        return None

    def poll(self, pos, buttons) -> None:
        """0726:0009 on an enabled area under the pointer while a button is held."""
        a = self.area_at(pos)
        if a is None or not buttons:
            return
        if buttons == {3}:
            k = self.k
            title, text = (ds_str(k.exe, o) for o in PANEL_TEXT[a])
            self.host.dialogs.push(Panel(k, self.host.app.input, panel_rect(pos), PANEL_PICTURE,
                                         two_lines(k, title, text)))
        else:
            self.step(0, pos)

    def update(self, events, dt) -> None:
        inp = self.host.app.input
        polled = False
        held = held_before(events, inp.buttons)
        for e, code in with_codes(events, inp):
            if self.stack is None or self.stack.top is not self:
                return
            if e.type == pygame.MOUSEBUTTONDOWN:
                held.add(e.button)
            elif e.type == pygame.MOUSEBUTTONUP:
                held.discard(e.button)
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                if right_help(self.host, self.row, e.pos):            # 08a9:0143 (DS:166c)
                    pass
                elif self.area_at(e.pos) is not None and self.row.held is None:
                    polled = True
                    self.poll(e.pos, set(held))                       # mask 2 only: the panel
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                if self.row.at(e.pos) is not None:
                    left_press(self.host.app, self.row, e)
                elif self.area_at(e.pos) is not None and self.row.held is None:
                    polled = True
                    self.poll(e.pos, set(held))
            elif e.type in (pygame.MOUSEBUTTONUP, pygame.MOUSEMOTION):
                hit = self.row.event(e)
                if hit is not None:
                    self.press(hit)
            elif e.type == pygame.KEYDOWN:
                hit = popup_key(self.host.app, self.row, code_of(e, code), self.k.exe)
                if hit is not None:
                    self.press(hit)
        if (not polled and self.stack is not None and self.stack.top is self and inp.buttons
                and self.row.held is None):
            self.poll(inp.pos, set(inp.buttons))

    def draw(self, fb) -> None:
        x, y, w, h = self.k.popup_rect[POPUP]
        fb.blit(self.canvas, (x, y), (x, y, w, h))
        frame(fb, self.k, POPUP)
        self.row.draw(fb)


def held_before(events, now) -> set:
    """The mouse buttons held before this frame's events (`now` is after them)."""
    held = set(now)
    for e in reversed(events):
        if e.type == pygame.MOUSEBUTTONDOWN:
            held.discard(e.button)
        elif e.type == pygame.MOUSEBUTTONUP:
            held.add(e.button)
    return held


def shield_src(side: int) -> tuple[int, int, int, int]:
    """ovl41:1740..175e: ATRANS2 (0x70 + 16 (side / 4), 0x5e + 14 (side % 4), 16, 14), C
    division (toward zero)."""
    q, m = int(side / 4), side - 4 * int(side / 4)
    w, h = SHIELD_SIZE
    return SHIELD_SRC[0] + w * q, SHIELD_SRC[1] + h * m, w, h


# ---------------------------------------------------------------- Triumphs


class Triumphs(Dialog):
    """JOIN screen 0x14 over popup 0 (ovl41:09eb)."""

    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        self.painter = painter_for(host)
        self.sel = host.state.current                      # DS:4422
        self.row = ButtonRow(list(k.layouts.screen(T_SCREEN).buttons), k.picture)
        self.canvas = new_canvas()
        self.opened = False
        self.page()
        self.opened = True
        self.buttons()

    def page(self) -> None:
        """ovl41:0a21(1)."""
        k, cv = self.k, self.canvas
        if self.opened:
            restore(cv, k, T_POPUP, *T_RESTORE)
        else:
            k.draw_popup(cv, T_POPUP)
            text_centred(cv, k.fonts[CHANCE36], *T_TITLE_AT, raw(k, G_TRIUMPHS, 0), INK, SHADOW)
        cells, shields = k.picture(BUTTONS_PCK), k.picture(BSHIELD)
        cw, ch = T_CELL
        sw, sh = T_SHIELD
        for i in range(8):
            blit_opaque(cv, cells, (T_CELL_AT[0] + T_STEP * i, T_CELL_AT[1]),
                        (T_CELL_SRC[0], T_CELL_SRC[1] if i == self.sel else 0, cw, ch))
            cv.blit(shields, (T_SHIELD_AT[0] + T_STEP * i, T_SHIELD_AT[1]), (sw * i, 0, sw, sh))
        for f, t in enumerate(T_TYPES):
            self.painter.army(cv, t, self.sel, T_ICON_X, T_ICON_Y + T_ROW * f, ring=1)
        font = k.fonts[CHANCE17]
        for y, text in self.stat_lines():
            font.draw(cv, T_TEXT_X, y, text, INK, SHADOW)

    def stat_lines(self) -> list[tuple[int, str]]:
        """0a21 0bfb..0cef: (y, text) of each count above 0."""
        k, st = self.k, self.host.state
        p = st.current
        g = G_OWN if p == self.sel else G_OTHER
        out = []
        for f in range(len(T_TYPES)):
            w = s16(st.flags.get(stat_word(p, self.sel, 2 * f), 0))
            if w > 0:
                out.append((T_TEXT_Y + T_ROW * f, sprintf(raw(k, g + f, 0 if w == 1 else 1), w)))
        return out

    def buttons(self) -> None:
        """ovl41:0cfa."""
        for i, id in enumerate(SIDE_IDS):
            self.row.state[id] = PRESSED if i == self.sel else NORMAL
        self.row.state[T_CLOSE] = NORMAL

    def press(self, id: int) -> None:
        if id in SIDE_IDS:
            self.sel = id - SIDE_IDS.start                 # ovl41:0d33
            self.page()
            self.buttons()
        elif id == T_CLOSE:
            self.close(None)                               # ovl41:0d49

    def update(self, events, dt) -> None:
        inp = self.host.app.input
        for e, code in with_codes(events, inp):
            if self.stack is None or self.stack.top is not self:
                return
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                right_help(self.host, self.row, e.pos)                        # 08a9:0143
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                left_press(self.host.app, self.row, e)
            elif e.type in (pygame.MOUSEBUTTONUP, pygame.MOUSEMOTION):
                hit = self.row.event(e)
                if hit is not None:
                    self.press(hit)
            elif e.type == pygame.KEYDOWN:
                hit = popup_key(self.host.app, self.row, code_of(e, code), self.k.exe)
                if hit is not None:
                    self.press(hit)

    def draw(self, fb) -> None:
        x, y, w, h = self.k.popup_rect[T_POPUP]
        fb.blit(self.canvas, (x, y), (x, y, w, h))
        frame(fb, self.k, T_POPUP)
        self.row.draw(fb)


# ---------------------------------------------------------------- registration


@registry.dialog("history")
def history(host, mode: int = CITY, on_close=None):
    return History(host, mode, on_close)


@registry.dialog("triumphs")
def triumphs(host, on_close=None):
    return Triumphs(host, on_close)


def open_history(host, mode: int):
    """ovl41:0000(mode); closed through 0x164 / 0x167 -> ovl61:011f(0, 0, 0)."""
    if getattr(host, "state", None) is None:
        return None
    done = lambda _: host.settings_closed()                 # noqa: E731
    if mode == TRIUMPHS:
        return registry.open_dialog("triumphs", host, on_close=done)
    if turn(host.state) <= 1:
        k = kit(host.app)
        return registry.open_dialog("message", host, lines=[raw(k, G_EARLY, 0), raw(k, G_EARLY, 1)])
    return registry.open_dialog("history", host, mode=mode, on_close=done)


for _name, _mode in (("history_city", CITY), ("history_events", EVENTS), ("history_gold", GOLD),
                     ("history_winners", WINNERS), ("history_triumphs", TRIUMPHS)):
    registry.action(registry.MENU_ID[_name])(lambda host, _m=_mode: open_history(host, _m))
