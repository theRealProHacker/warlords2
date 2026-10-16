"""The human side's hero offer (ovl47:0d5c), answered by AcceptHero / NameHero; plus the helpers the
other M7b dialogs share (the map popup type 2, answering a command from a dialog, waiting).

Evidence (asm ovl47, read from the user's EXE; positions are DGROUP words):
* opened by ovl68:04bd after the offer check ovl47:0000 (here: `states.phases.turn_start` opens
  "hero_offer" with the pending HeroOffered); the name and sex were drawn by ovl47:0c67 at 0dc7
  (`info["name"]`, `info["female"]`, DS:44d2 / DS:44d0), the city is DS:44ec, the price DS:1110;
* 0d70 DS:166a = 1; 0d78 ovl17:0000(2): popup type 2 (DS:06b8 = (80, 60, 480, 312)): MARBLE with
  source and destination x shifted right by DS:2a8c = 224 (ovl17:01ef..01fd), then the common
  outline and shadow on the whole rectangle (ovl17:05dd..067a, DS:06a8 re-read at 05f7), and
  the overview in the left 224 px: 0d87 ovl63:0000(1, 1, NULL) (bitmap and city markers,
  `ui.minimap.Minimap.compose`), 0db3 ovl63:1f5f(city x, city y, 1): ATRANS2 cell DS:2cae + 8 * 1
  through its mask into the bitmap at (max(0, ((2x - 6 + 4) >> 3) << 3), max(0, 2y - 6))
  (ovl63:1f6a..1fe2), 0dbe ovl63:04d3(NULL): with Hidden Map (SCN 0x124) three colour-3 lines on
  the bitmap ((0, 0) 224 across, (0, 0) 312 down, (0, 311) 224 across; 0546..0589), then the
  bitmap to (popup x (ovl17:08c7), 0x3c) (058c..05aa);
* 0dca..1012 the four lines, STRING group 0x61 = 97 (sprintf, 0000:4944): turn 1 indices 0-3,
  later 4-7, + 8 for a heroine (DS:44d0); turn 1: line 4 gets the city name (2c04:1581 + 0x41 c);
  later: line 1 the city name, line 2 the price, line 3 the side's gold (2c04:0185 + 0x14 p);
* 1021 SetFont(1, 15, 0, 3), STRING (0x5f, 0) centred at DS:1126; 1043..1074 picture 0x21 MHERO
  (male) / 0x22 FHERO, source DS:1112, opaque (0997:0129) to DS:111a; 107e..1088 colour 0 outline
  DS:111e (116d:01fd); 109c..10e7 SetFont(2, 15, 14, 3), the lines centred at DS:112a .. DS:1136;
  10fb SetFont(2, 15, 0, 3), the name box ovl59:0058(DS:113a, DS:113e, name); 111b colour-0
  outline DS:1142; 112d..1184 ABITS (picture 8) ticks, source DS:0ad4[k] (k = 0 ticked): male at
  DS:114a with k = female != 0, female at DS:114e with k = female == 0; 1187..11b6 STRING (0x62,
  0) / (0x62, 1) right-aligned (ovl59:0103) at DS:1152 / DS:1156; 11c0 ovl53:056a(12): JOIN screen
  12 (287 accept, 288 decline, 289 rename = the name box, 290 male, 291 female); 11c8 ovl47:120c;
* 11d5..1207: with SCN 0x12e set and SCN byte 0x134 bit 0 clear: bit 0 set, the tutorial page
  FILE.DAT (25, 0) through ovl61:168d (push dword 0x19 at 11f5) over the dialog: the engine
  records it (rules.heroes.human_offer, a TurnCue after the HeroOffered, `ui.tutorial`); the
  turn start holds the events after HeroOffered until the dialog is up, so the page opens over
  the fully drawn dialog, as in the original;
* ovl47:120c: 287 and 289 normal; the sex of DS:44d0 pressed, the other normal; 288 disabled
  when ovl61:225b() == 1, else normal (so on turn 1 accept is the only answer);
* 07be:08c6 287 -> ovl47:127e: ovl47:031b(DS:44d2, DS:44d0), ovl17:069c, ovl61:011f(1, 0, 1),
  ovl68:04bd(1); 07be:08ce 288 -> ovl47:12af: ovl17:069c, ovl61:011f(0, 0, 0), ovl68:04bd(1);
  07be:08d6 289 -> ovl47:12ce: ovl56:03a6(DS:113a rect, DS:44d2, 15, DS:1140 - 0x20 = 176)
  (`hero_name`), then ovl47:120c; 07be:08de / 08e2 290 / 291 -> ovl47:12f9(0 / 1): DS:44d0 =
  the argument, the picture and the four lines again in the new wording, the ticks, 120c (the
  drawn name stays).  The dialog is not modal in the EXE (0d5c returns; the button dispatcher
  calls back); here it is a Dialog on the game's stack.  No key handling in these routines;
with DS:166a set a key goes through 07be:0064 (`ui.keys.popup_key`), a left press on a pressed
button chords (07be:0e7b).
Accept with the drawn name and sex is AcceptHero(True); with a name or sex the player changed it
is NameHero(name, female).  Both go through `Game.answer`, which plays the events of
rules.turn.resume(state, 1) in the turn-start phase.

"""
from __future__ import annotations

import logging

import pygame

from ...assets.exe import ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...assets.text import _CONV, printf
from ...model import commands as C
from .. import registry
from ..dialog import Dialog
from ..keys import hand_on, popup_input
from ..layout import DISABLED, NORMAL, PRESSED
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from ...assets.store import cache_load

log = logging.getLogger(__name__)

POPUP, SCREEN = 2, 12
ACCEPT, DECLINE, RENAME, MALE, FEMALE = 287, 288, 289, 290, 291
GROUP, TITLE, SEX_LABELS = 0x61, (0x5F, 0), 0x62
FEMALE_OFFSET, LATER_OFFSET = 8, 4
TITLE_AT, LINES_AT = 0x1126, (0x112A, 0x112E, 0x1132, 0x1136)
PIC_SRC, PIC_AT, PIC_FRAME = 0x1112, 0x111A, 0x111E
NAME_BOX, NAME_FRAME = 0x113A, 0x1142
MALE_AT, FEMALE_AT, MALE_LABEL, FEMALE_LABEL = 0x114A, 0x114E, 0x1152, 0x1156
MHERO, FHERO = 0x21, 0x22
ABITS, TICKS = 8, 0x0AD4
INK, SHADOW, LINE_SHADOW, PAPER, OUTLINE = 15, 0, 14, 3, 0
NAME_MAX, NAME_WIDTH = 15, 176                   # ovl47:12d8, 12d1..12d7

# popup type 2 (ovl17:0000 01ef..01fd, ovl63:04d3)
MAP_SHIFT = 0x2A8C                               # DS:2a8c = 224
MAP_TOP = 0x3C                                   # ovl63:058f
MARKER = 0x2CAE                                  # ovl63:1faa: DS:2cae + 8 kind (sx, sy, w, h)
MARKER_DX, MARKER_ROUND, MARKER_DY = -6, 4, -6   # ovl63:1f6a..1f8f
HIDDEN_LINE = 3                                  # ovl63:0546
ATRANS = 9                                       # ovl63:1f94 0997:034a(9)


def sprintf(fmt: str, *args) -> str:
    """0000:4944 with the arguments the format reads (C ignores the rest)."""
    n = sum(1 for m in _CONV.finditer(fmt) if m.group(1) != "%")
    return printf(fmt, *args[:n])


def raw(k, group: int, index: int) -> str:
    """STRING.DAT (group, index) unformatted (ovl59:04f0 clamps the index to the group)."""
    g = k.text.group(group)
    return g[min(index, len(g) - 1)]


def bevel(fb: pygame.Surface, rect, a: int, b: int) -> None:
    """14d0:02e5(rect, a, b): top and left in a, right and bottom in b; the higher colour
    number is drawn second (it wins the corners)."""
    x, y, w, h = rect
    lines = {a: ((x, y, w, 1), (x, y, 1, h)), b: ((x + w - 1, y, 1, h), (x, y + h - 1, w, 1))}
    for c in sorted((a, b)):
        for r in lines[c]:
            fb.fill(c, r)


def name_box(fb: pygame.Surface, font, rect, text: str) -> None:
    """ovl59:0058(x, y, w, h, text) with the font set: colour 3, bevel 4 / 2, the text opaque
    at (x + 3, y + 2) (as `setup_side`)."""
    x, y, w, h = rect
    fb.fill(PAPER, rect)
    bevel(fb, rect, 4, 2)
    font.draw(fb, x + 3, y + 2, text, INK, SHADOW, PAPER)


def outline(fb: pygame.Surface, rect, colour: int = OUTLINE) -> None:
    """116d:01fd: one-pixel outline of (x, y, w, h)."""
    pygame.draw.rect(fb, colour, rect, 1)


def map_popup(fb: pygame.Surface, host, markers=(), cities: bool = True, draw=None) -> tuple[int, int]:
    """ovl17:0000(2), the overview ovl63:0000(cities, 1, NULL) (the city markers ovl63:0ed7 only
    with the first argument set), the markers ovl63:1f5f(x, y, kind) in the order given and
    ovl63:04d3(NULL); returns the popup origin."""
    k = kit(host.app)
    x, y, w, h = k.popup_rect[POPUP]
    shift = ds_words(k.exe, MAP_SHIFT, 1)[0]
    blit_opaque(fb, k.picture(25), (x + shift, y), (shift, 0, w - shift, h))
    pygame.draw.rect(fb, 0, (x - 1, y - 1, w + 2, h + 2), 1)
    fb.fill(0, (x + 1, y + h + 1, w + 2, 2))
    fb.fill(0, (x + w + 1, y + 1, 2, h + 2))
    st = host.state
    mm = host.minimap
    if cities:
        mm.compose(st)
        buf = mm.buf.copy()
    else:
        buf = bitmap(mm, st)
    if draw is not None:
        draw(buf)
    atrans = k.picture(ATRANS)
    for mx, my, kind in markers:
        src = ds_words(k.exe, MARKER + 8 * kind, 4)
        sx = max(0, ((2 * mx + MARKER_DX + MARKER_ROUND) >> 3) << 3)
        sy = max(0, 2 * my + MARKER_DY)
        buf.blit(atrans, (sx, sy), src)
    bw, bh = buf.get_size()
    if st.options.hidden_map:
        buf.fill(HIDDEN_LINE, (0, 0, bw, 1))
        buf.fill(HIDDEN_LINE, (0, 0, 1, bh))
        buf.fill(HIDDEN_LINE, (0, bh - 1, bw, 1))
    px, _ = k.popup_pos[POPUP]
    fb.blit(buf, (px, MAP_TOP))
    return k.popup_pos[POPUP]


def bitmap(mm, state) -> pygame.Surface:
    """ovl63:0000's bitmap copy without the city markers (`Minimap.compose`'s first part)."""
    import numpy as np
    from ...model.ids import MAP_H, MAP_W, ROAD_SEEN
    from ..screen import IDENTITY
    px = mm.pixels
    if state.options.hidden_map:
        seen = (np.array(state.world.roads, np.uint8).reshape(MAP_H, MAP_W).T & ROAD_SEEN) != 0
        px = np.where(np.repeat(np.repeat(seen, 2, 0), 2, 1), px, 0).astype(np.uint8)
    buf = pygame.Surface(px.shape, depth=8)
    buf.set_palette(IDENTITY)
    pygame.surfarray.blit_array(buf, px)
    return buf


# ---------------------------------------------------------------- marks on the overview bitmap
# (DS:6795, 2 px per square; every call is followed by ovl63:04d3, here `map_popup` blits the
# bitmap after `draw` adds them)

SITE_ICONS = 0x0F28                              # ovl63:080c: DS:0f28 + 8 k, k 0 plain, 1 explored, 2 temple, 3 special
SITE_BOX = 15                                    # ovl63:0865..08b7


def seen(state, x: int, y: int) -> bool:
    """ovl62:0806 / 08cd / 0a3f test: Hidden Map off, or the road layer's seen bit 0x20."""
    from ...model.ids import MAP_W, ROAD_SEEN
    return not state.options.hidden_map or bool(state.world.roads[y * MAP_W + x] & ROAD_SEEN)


def square_mark(buf, x: int, y: int, c: int) -> None:
    """ovl62:08cd(x, y, c) (07bf / 0806 / 0899 for a city, site, army): 4x4 of colour c at
    (2x, 2y) with colour-0 edges (2x-1, 2y-1, 6) / (2x, 2y+4, 4) across and (2x-1, 2y-1, 5) /
    (2x+4, 2y-1, 5) down (ovl62:090b..0992)."""
    buf.fill(c, (2 * x, 2 * y, 4, 4))
    buf.fill(0, (2 * x - 1, 2 * y - 1, 6, 1))
    buf.fill(0, (2 * x, 2 * y + 4, 4, 1))
    buf.fill(0, (2 * x - 1, 2 * y - 1, 1, 5))
    buf.fill(0, (2 * x + 4, 2 * y - 1, 1, 5))


def box_mark(buf, x: int, y: int, c: int) -> None:
    """ovl62:099e(x, y, c) (0837 / 0868 / 08b3): an 8x8 outline from (2x-2, 2y-2) (09d7..0a33)."""
    buf.fill(c, (2 * x - 2, 2 * y - 2, 8, 1))
    buf.fill(c, (2 * x - 2, 2 * y + 5, 8, 1))
    buf.fill(c, (2 * x - 2, 2 * y - 2, 1, 8))
    buf.fill(c, (2 * x + 5, 2 * y - 2, 1, 8))


def line_mark(buf, a, b, c: int) -> None:
    """ovl62:0a3f(ax, ay, bx, by, c): a line from (2ax-2, 2ay-2) to (2bx-2, 2by-2) (1133:00b8)."""
    pygame.draw.line(buf, c, (2 * a[0] - 2, 2 * a[1] - 2), (2 * b[0] - 2, 2 * b[1] - 2))


def site_markers(k, buf, state, chosen: int) -> None:
    """ovl63:05e4(NULL, chosen): every site shown to the side (+0x1d bit p; with Hidden Map its
    square seen): ATRANS2 icon DS:0f28 + 8 k masked at (((2x - 1 + 4) >> 3) << 3, 2y - 1), k = 2
    temple, 1 explored (map 0x4000), 3 special (+0x1b), else 0 (0785..0856); the chosen site
    gets a colour-15 box: 12 across at Y and Y + 9, 10 down at X and X + 11 (0865..08b7)."""
    from ...model.ids import MAP_EXPLORED, MAP_W, SiteKind
    atrans = None
    for i, s in enumerate(state.sites):
        if not s.shown_mask & (1 << state.current):
            continue
        if state.options.hidden_map and not seen(state, s.x, s.y):
            continue
        if s.kind == SiteKind.TEMPLE:
            n = 2
        elif state.world.flags[s.y * MAP_W + s.x] & MAP_EXPLORED:
            n = 1
        else:
            n = 3 if s.flag_1b else 0
        X, Y = ((2 * s.x - 1 + 4) >> 3) << 3, 2 * s.y - 1
        if atrans is None:
            atrans = k.picture(ATRANS)
        buf.blit(atrans, (X, Y), ds_words(k.exe, SITE_ICONS + 8 * n, 4))
        if i == chosen:
            buf.fill(SITE_BOX, (X, Y, 12, 1))
            buf.fill(SITE_BOX, (X, Y + 9, 12, 1))
            buf.fill(SITE_BOX, (X, Y, 1, 10))
            buf.fill(SITE_BOX, (X + 11, Y, 1, 10))


def human_phase(host):
    """The host's phase when it is the human command loop (`states.phases.human.Human`, also
    its "over" subclass after the victory: ovl61:2236..2252 ends only the main loop, the
    command loop 07be:0064 / 04d8 goes on and none of its handlers tests a victory flag),
    else None."""
    from ...states.phases.human import Human
    phase = getattr(host, "phase", None)
    return phase if isinstance(phase, Human) else None


def answer(host, cmd):
    """The command of a dialog button: through the human phase (`Human.apply`, which plays the
    events and refreshes the palette) while it is current, else `Game.answer` (the turn-start
    phase plays them).  None when the engine refused it."""
    phase = human_phase(host)
    if phase is not None:
        return phase.apply(cmd)
    return host.answer(cmd)


def wait(d):
    """A view's iterator that keeps the screen until dialog `d` has closed."""
    while d.stack is not None:
        yield None


def ticks(k):
    return [ds_words(k.exe, TICKS + 8 * i, 4) for i in range(2)]


class HeroOffer(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, host, offer, on_close=None):
        super().__init__(on_close)
        self.host, self.offer = host, offer
        k = self.k = kit(host.app)
        exe = k.exe
        info = offer.info
        self.drawn = (info["name"], int(info["female"]))
        self.name, self.female = self.drawn
        self.free = bool(info["free"])
        self.w = {o: ds_words(exe, o, 2) for o in (TITLE_AT, *LINES_AT, PIC_AT, MALE_AT, FEMALE_AT,
                                                     MALE_LABEL, FEMALE_LABEL)}
        self.pic_src = ds_words(exe, PIC_SRC, 4)
        self.pic_frame = ds_words(exe, PIC_FRAME, 4)
        self.box = ds_words(exe, NAME_BOX, 4)
        self.box_frame = ds_words(exe, NAME_FRAME, 4)
        self.ticks = ticks(k)
        lay = k.layouts.screen(SCREEN)
        self.row = ButtonRow(list(lay.buttons), k.picture)
        cache_load(k, FHERO if self.female else MHERO, *(b.picture for b in self.row.buttons))   # ovl47:1074, buttons (X44)
        self.states()

    def states(self) -> None:
        """ovl47:120c."""
        s = self.row.state
        s[ACCEPT] = s[RENAME] = NORMAL
        s[MALE], s[FEMALE] = (NORMAL, PRESSED) if self.female else (PRESSED, NORMAL)
        s[DECLINE] = DISABLED if self.free else NORMAL

    def lines(self) -> list[str]:
        st = self.host.state
        info = self.offer.info
        base = (0 if self.free else LATER_OFFSET) + (FEMALE_OFFSET if self.female else 0)
        city = st.cities[info["city"]].name
        if self.free:
            args = ((), (), (), (city,))
        else:
            from ...rules.economy import s16
            args = ((city,), (info["price"],), (s16(st.players[st.current].gold),), ())
        return [sprintf(raw(self.k, GROUP, base + i), *a) for i, a in enumerate(args)]

    def update(self, events, dt) -> None:
        rest = popup_input(self, events, lambda: self.row, self.k.exe,
                           lambda id: self.press(id) or self.stack is None or self.stack.top is not self)
        hand_on(self, rest, dt)                         # e.g. keys typed after Rename to hero_name

    def press(self, id: int) -> None:
        if id == ACCEPT:
            cmd = C.AcceptHero(True) if (self.name, self.female) == self.drawn else C.NameHero(self.name, bool(self.female))
            self.finish(cmd)
        elif id == DECLINE:
            self.finish(C.AcceptHero(False))
        elif id == RENAME:
            registry.open_dialog("hero_name", self.host, rect=self.box, old=self.name,
                                 max_len=NAME_MAX, max_width=NAME_WIDTH, on_close=self.renamed)
        elif id in (MALE, FEMALE):                          # ovl47:12f9
            self.female = int(id == FEMALE)
            cache_load(self.k, FHERO if self.female else MHERO)   # ovl47:133c 0129 (X44)
        self.states()

    def renamed(self, name) -> None:
        if name is not None:
            self.name = name
        self.states()

    def finish(self, cmd) -> None:
        """ovl47:127e / 12af: the popup closes, then the turn goes on (ovl68:04bd(1))."""
        stack = self.stack
        self.close(cmd)
        if self.host.answer(cmd) is None and stack is not None:
            stack.push(self)                                # refused: the question stays

    def draw(self, fb) -> None:
        k, w = self.k, self.w
        st = self.host.state
        c = st.cities[self.offer.info["city"]]
        map_popup(fb, self.host, [(c.x, c.y, 1)])
        text_centred(fb, k.fonts[CHANCE36], *w[TITLE_AT], k.text.S(*TITLE), INK, SHADOW)
        blit_opaque(fb, k.picture(FHERO if self.female else MHERO), w[PIC_AT], self.pic_src)
        outline(fb, self.pic_frame)
        f = k.fonts[CHANCE17]
        for at, s in zip(LINES_AT, self.lines()):
            text_centred(fb, f, *w[at], s, INK, LINE_SHADOW)
        name_box(fb, f, self.box, self.name)
        outline(fb, self.box_frame)
        abits = k.picture(ABITS)
        blit_opaque(fb, abits, w[MALE_AT], self.ticks[0 if not self.female else 1])
        blit_opaque(fb, abits, w[FEMALE_AT], self.ticks[0 if self.female else 1])
        for at, i in ((MALE_LABEL, 0), (FEMALE_LABEL, 1)):
            s = k.text.S(SEX_LABELS, i)
            f.draw(fb, w[at][0] - f.width(s), w[at][1], s, INK, SHADOW)
        self.row.draw(fb)


@registry.dialog("hero_offer")
def hero_offer(host, offer, on_close=None):
    return HeroOffer(host, offer, on_close)
