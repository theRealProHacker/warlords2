"""Shared UI pieces: the resource kit, popup windows, BUTTON.DAT buttons, text helpers.

Popup windows (Evidence: EXE ovl17:0000 open, ovl17:069c close, ovl17:08f6 origin):
the EXE keeps up to three popups; each has a type indexing the position table DS:0638
(x, y) and the rectangle table DS:06a8 (x, y, w, h), both read from the user's EXE.
The picture per type is chosen by code in ovl17:0000:

    6 -> 28 city, 7 -> 32 victory, 9 -> 44 temple, 0x0d -> 69 scroll2, 0x17 -> 70 bscroll,
    0x10-0x13 -> 56-59, 0x14 -> 12, 0x15 -> 14, 0x16 -> 13, 0x18-0x1b -> 64-67,
    every other type -> 25 marble.

Types 0x0d and 0x17 are blitted keyed and get no frame; the others are an opaque copy of
the picture's (0, 0, w, h) with a colour-0 outline on (x-1, y-1, w+2, h+2) and a 2-px
drop shadow: lines at y+h+1 and y+h+2 from x+1 (length w+2), at x+w+1 and x+w+2 from
y+1 (length h+2).  Type 6 has extra frame code (not reproduced; M6b's).  Type 2 is
not drawn here: ovl17:0000 (01ef) shifts the source x and the destination x right by
DS:2a8c (224) and shrinks the width by as much, and after the frame (067d) calls
ovl63:0000(0, 1, NULL), which draws the strategic map into the left DS:2a8c pixels; that
map is M3's, so `draw_popup(2)` raises.  Closing restores the screen; here the host
repaints every frame, so closing is just not drawing.

Buttons (Evidence: EXE 0771:0001 blits the source pair at record +0x13 + 4 * state for
state byte +4, as `ui.layout`; 08a9:02f1 / 07be:0e26 / 08a9:0189): state 0 = pressed,
1 = normal, 2 = disabled.  A
left press on a normal button shows it pressed while the pointer stays over it (normal
when dragged off); the release over it runs the button; pressed or disabled buttons
reject the press.  Overlapping buttons: the later record wins (hit test 08a9:0756
walks the records from last to first).
"""
from __future__ import annotations

import math
from fractions import Fraction

import pygame

from ..assets.exe import ds_words
from ..audio.voice import TICK_HZ
from . import registry
from .layout import NORMAL, PRESSED, Button, Layouts

POPUP_POS, POPUP_RECT, N_POPUP = 0x0638, 0x06A8, 0x1C
MARBLE = 25
POPUP_PICTURE = {6: 28, 7: 32, 9: 44, 0x0D: 69, 0x10: 56, 0x11: 57, 0x12: 58, 0x13: 59,
                 0x14: 12, 0x15: 14, 0x16: 13, 0x17: 70, 0x18: 64, 0x19: 65, 0x1A: 66, 0x1B: 67}
KEYED_POPUPS = (0x0D, 0x17)
MAP_POPUP = 2


def read_popup_tables(exe: bytes) -> tuple[list[tuple[int, int]], list[tuple[int, int, int, int]]]:
    pos = [ds_words(exe, POPUP_POS + 4 * t, 2) for t in range(N_POPUP)]
    rect = [ds_words(exe, POPUP_RECT + 8 * t, 4) for t in range(N_POPUP)]
    return pos, rect


class Kit:
    """Fonts, text, layouts, pointers, menu tables and popups of one game directory.
    Built on the main thread (pictures), once per AssetStore (`kit`)."""

    def __init__(self, store):
        from ..assets.cursors import Cursors
        from ..assets.fonts import Fonts
        from ..assets.text import Text
        from .menubar import check_menu_ids, read_menu_tables
        exe = store.read("WARLORD2.EXE")
        self.store, self.exe = store, exe
        self.fonts = Fonts(store.read)
        self.text = Text(store.read("DATA/STRING.DAT"), store.read("HELP/WARLORD2.HLP"))
        self.files = _file_table(store)
        self.layouts = Layouts(store.read("DATA/JOIN.DAT"), store.read("DATA/AREA.DAT"),
                               store.read("DATA/BUTTON.DAT"))
        self.cursors = Cursors(store.read("STAND.PCK"), exe)
        self.menus, self.menu_actions = read_menu_tables(exe)
        check_menu_ids(self.menu_actions)
        self.popup_pos, self.popup_rect = read_popup_tables(exe)

    def picture(self, index: int, scenario: str | None = None) -> pygame.Surface:
        """FILE.DAT group-3 picture by index, keyed as the EXE picture table says."""
        return self.store.picture(self.store.pictures[index].name, scenario)

    def draw_popup(self, fb: pygame.Surface, t: int) -> tuple[int, int]:
        """Draw popup type t (ovl17:0000); returns its origin (ovl17:08f6)."""
        if t == MAP_POPUP:
            raise NotImplementedError("popup type 2 (ovl17:0000 at 01ef / 067d) needs the strategic "
                                      "map of ovl63:0000 in its left DS:2a8c pixels (M3)")
        x, y, w, h = self.popup_rect[t]
        pic = self.picture(POPUP_PICTURE.get(t, MARBLE))
        if t in KEYED_POPUPS:
            fb.blit(pic, (x, y))
            return self.popup_pos[t]
        blit_opaque(fb, pic, (x, y), (0, 0, w, h))
        pygame.draw.rect(fb, 0, (x - 1, y - 1, w + 2, h + 2), 1)
        fb.fill(0, (x + 1, y + h + 1, w + 2, 2))
        fb.fill(0, (x + w + 1, y + 1, 2, h + 2))
        return self.popup_pos[t]


def _file_table(store):
    from ..formats.tables import StringTable
    return StringTable(store.read("DATA/FILE.DAT"))


def kit(app) -> Kit:
    """The Kit of an app's AssetStore, built on first use and kept as `app.kit`."""
    k = getattr(app, "kit", None)
    if k is None:
        k = app.kit = Kit(app.assets)
    return k


def tick_frames(ticks: int, tick_hz: int, elapsed: int = 0) -> int:
    """Logical frames of an ovl59:0000(ticks) wait at `tick_hz` frames per second.

    A tick is the BIOS timer's, 65536 / 1193182 s (`audio.voice.TICK_HZ`, register X05).
    The waits of one sequence are counted from its start, taken to be on a tick boundary
    (as `audio.voice.Speech`): frame k lies at k * TICK_HZ / tick_hz ticks, and a wait that
    begins `elapsed` ticks into the sequence ends on the first frame at or past
    `elapsed + ticks`.  Chained waits pass the ticks before them as `elapsed`, so the
    fractions add up and a sequence always takes the same frames."""
    per_tick = Fraction(tick_hz) / TICK_HZ
    return math.ceil((elapsed + ticks) * per_tick) - math.ceil(elapsed * per_tick)


def blit_opaque(fb: pygame.Surface, pic: pygame.Surface, dest, src=None) -> None:
    """0997:0129: opaque copy of `src` of a picture (its colour key ignored)."""
    key = pic.get_colorkey()
    pic.set_colorkey(None)
    fb.blit(pic, dest, src)
    if key is not None:
        pic.set_colorkey(key)


def draw_pointer(app, fb: pygame.Surface, dialogs) -> None:
    """The mouse pointer on top of the state and its dialogs (12bf:098d), unless a dialog
    on the stack hides it (`hides_pointer`, ui/dialogs/popup_help)."""
    if not any(getattr(d, "hides_pointer", False) for d in dialogs):
        kit(app).cursors.draw(fb, app.input.pos)


def draw_button(fb: pygame.Surface, b: Button, state: int, picture) -> None:
    """`picture(index)` returns the FILE.DAT group-3 picture surface."""
    if b.picture:
        fb.blit(picture(b.picture), b.rect[:2], b.source(state))
    deco = registry.decor(b.id)
    if deco:
        deco(fb, b, state)


def text_centred(fb: pygame.Surface, font, cx: int, y: int, text: str, ink: int, shadow: int) -> None:
    """ovl59:00d6: draw at cx - width/2 (signed, truncating), transparent."""
    w = font.width(text)
    font.draw(fb, cx - int(w / 2), y, text, ink, shadow)


class ButtonRow:
    """Live buttons of one dialog with their states; press / release as 08a9:02f1."""

    def __init__(self, buttons: list[Button], picture):
        self.buttons = list(buttons)
        self.picture = picture
        self.state = {b.id: NORMAL for b in self.buttons}
        self.held: Button | None = None

    def draw(self, fb: pygame.Surface) -> None:
        for b in self.buttons:
            draw_button(fb, b, self.state[b.id], self.picture)

    def at(self, pos: tuple[int, int]) -> Button | None:
        for b in reversed(self.buttons):
            if b.contains(pos):
                return b
        return None

    def event(self, e: pygame.event.Event) -> int | None:
        """Feed a mouse event; returns the id of a button released over, else None."""
        if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
            b = self.at(e.pos)
            if b and self.state[b.id] == NORMAL:
                self.held = b
                self.state[b.id] = PRESSED
        elif e.type == pygame.MOUSEMOTION and self.held:
            self.state[self.held.id] = PRESSED if self.held.contains(e.pos) else NORMAL
        elif e.type == pygame.MOUSEBUTTONUP and e.button == 1 and self.held:
            b, self.held = self.held, None
            self.state[b.id] = NORMAL
            if b.contains(e.pos):
                return b.id
        return None


# events that end a "press any key" wait (ovl61:10fb: mask 0xd4 = left release, right
# release, key; bit 6's source is not known).  A modifier alone yields no getch code.
def is_dismiss(e: pygame.event.Event) -> bool:
    from .input import MODIFIERS
    return ((e.type == pygame.MOUSEBUTTONUP and e.button in (1, 3))
            or (e.type == pygame.KEYDOWN and e.key not in MODIFIERS))
