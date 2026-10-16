"""View > Ruins (menu 528, key '.') and a left click with the site cursor: the site screen,
ovl45:0000 in mode 4 (the city screen's frame; modes 0 / 2 are M6b's "production").

Evidence (asm ovl45, ovl62, ovl63, read from the user's EXE):
* key table 07be:0337 '.' -> 07be:0281 -> ovl45:0000(4, SCN 0x17d, SCN 0x17f); a left click with
  cursor 7 (ovl46:0106..014c) -> ovl45:0000(0 when a city holds the square, else 4, x, y);
* ovl45:0014..009d: s = ovl62:06fd(x, y, 1): the nearest site (0a8b:0acc, strict < from 1000)
  whose +0x1d has bit p and, with Hidden Map, whose square passes ovl64:15ff; nothing when s < 0
  or its square fails ovl64:15ff; the same site already up -> only the buttons; else DS:0e92 = 4,
  ovl45:06de(1), 1a9b, ovl53:056a(6), DS:166a = 1, 03a9;
* 0258..02da (the shared tail, with SCN 0x12e): SCN byte 0x134 bit 1 clear -> set, FILE.DAT (25, 1);
  bit 0x20 clear and the side's cities DS:5dea[p] >= 2 -> set, (25, 6), through ovl61:168d;
* ovl45:06de -> 0cdf (mode 4): popup type 2 (the map popup); SetFont(1, 15, 0, 3) the site's name
  centred at (432, 62); bevel 14d0:02e5(DS:0edc, 4, 2); colour-0 outline DS:0ed4; SPECBITS
  (picture 6) source DS:0ee8 + 8 k opaque at DS:0ee4, k = 0 for a temple, else s % 5 + 1
  (0d34..0d72); SetFont(2, 15, 0, 3) STRING (113, kind) left at DS:0eb4, (114, explored map bit
  0x4000) left at DS:0eb8; colour 2 on DS:0f50 with a colour-0 outline; the legend: ATRANS2
  DS:0f28 + 8 i masked at DS:0f58 + 4 i and (115, i) left at DS:0f68 + 4 i, i = 0..3 (0e4d..0ea2);
  ovl45:1f06(2, s, ...): the three lines after "#nnn" (DS:0ffe "%03d") of FILE.DAT (0x16, 1)
  formatted with the scenario's name ('|' ends a line, 8000 bytes read, ovl45:1e02) left at
  DS:0ec8, + 4 per line (0ec4..0ef3);
* ovl45:1a9b -> 1adb: ovl63:05e4(NULL, s) (the base map with the shown sites, s boxed,
  `hero_offer.site_markers`), ovl63:04d3;
* ovl45:03a9 in mode 4: only 192 (close) normal; area 14 off; area 6 = the map (80, 60, 224, 312):
  a left press -> ovl45:1afa -> ovl45:0000(4, (px - 80) / 2, (py - 60) / 2); a right press ->
  ovl46:1201 + 10e1((122, 2), (122, 3));
* keys: the shared tail sets DS:166a = 1 (0248) for every mode, so the pop-up rules of
  07be:0064 apply as on the city screen (`ui.keys.popup_key`: 'A'..'Z' ignored, Esc / Return
  press the first live button of DS:1514 / DS:155c, 0x181 nothing, every other code the chord);
* 192 -> 07be:0746 -> ovl45:02e1: ovl17:069c, ovl61:011f(1, 1, 1); with SCN 0x12e and byte 0x134
  bit 2 clear: set, FILE.DAT (25, 2).
Both tutorial tails are the command `ScreenTutorial` (`production.screen_tutorial`): the engine
writes the bits of SCN byte 0x134 and returns the pages, shown one after the other.
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...model.ids import MAP_EXPLORED, MAP_W, SiteKind
from ...rules.setup import distance
from .. import registry
from ..dialog import Dialog
from ..info import visible
from ..keys import code_of, left_press, popup_key, right_help
from ..menubar import with_codes
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from .hero_offer import bevel, map_popup, outline, raw, site_markers
from .production import screen_tutorial

SCREEN, CLOSE = 6, 192
MAP_AREA = (80, 60, 224, 312)
NAME_AT = (432, 62)
FRAME_BEVEL, FRAME, PIC_AT, PICS = 0x0EDC, 0x0ED4, 0x0EE4, 0x0EE8
SPECBITS, ATRANS = 6, 9
KIND_AT, STATE_AT = 0x0EB4, 0x0EB8
G_KIND, G_STATE, G_LEGEND, G_PANEL = 113, 114, 115, 122
BOX, BOX_COLOUR = 0x0F50, 2
LEGEND_ICONS, LEGEND_AT, LEGEND_TEXT = 0x0F28, 0x0F58, 0x0F68
TEXT_AT, TEXT_FILE, TEXT_MARK, TEXT_LIMIT = 0x0EC8, (0x16, 1), 0x0FFE, 8000
START = 1000
INK, SHADOW = 15, 0


def nearest_site(host, x: int, y: int) -> int:
    """ovl62:06fd(x, y, 1)."""
    st = host.state
    best, idx = START, -1
    for i, s in enumerate(st.sites):
        if not s.shown_mask & (1 << st.current):
            continue
        if st.options.hidden_map and not visible(st, host.sprites, host.view.origin, s.x, s.y):
            continue
        d = distance(x, y, s.x, s.y)
        if d < best:
            best, idx = d, i
    return idx


def site_text(k, scenario: str, s: int) -> list[str]:
    """ovl45:1e02 / 1f06."""
    fmt = k.files.get(*TEXT_FILE)
    data = k.store.read(fmt.replace("%s", scenario, 1).replace("%s", scenario, 1))[:TEXT_LIMIT]
    data = data.replace(b"|", b"\0")
    mark = b"#" + (ds_str(k.exe, TEXT_MARK) % s).encode("cp437") + b"\0"
    i = data.find(mark)
    if i < 0:
        return []
    parts = data[i + len(mark):].split(b"\0")
    return [p.decode("cp437") for p in parts[:3]]


class Ruins(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, host, site: int, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        self.row = ButtonRow([k.layouts.screen(SCREEN).button(CLOSE)], k.picture)
        self.show(site)

    def show(self, s: int) -> None:
        self.site = s
        cfg = getattr(self.host, "config", None)
        self.text = site_text(self.k, cfg.scenario, s) if cfg is not None else []

    def update(self, events, dt) -> None:
        for e, code in with_codes(events, self.host.app.input):
            if self.stack is None or self.stack.top is not self:
                return
            if e.type == pygame.KEYDOWN:                    # 07be:0064, DS:166a = 1 (0248)
                if popup_key(self.host.app, self.row, code_of(e, code), self.k.exe) == CLOSE:
                    return self.finish()
                continue
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and self.row.at(e.pos):
                left_press(self.host.app, self.row, e)      # 07be:0e26(1)
                continue
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                if right_help(self.host, self.row, e.pos):
                    pass
                elif _inside(MAP_AREA, e.pos):
                    registry.open_dialog("info/text", self.host, title=raw(self.k, G_PANEL, 2),
                                         text=raw(self.k, G_PANEL, 3), pos=e.pos)
                return
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and _inside(MAP_AREA, e.pos):
                s = nearest_site(self.host, (e.pos[0] - MAP_AREA[0]) // 2, (e.pos[1] - MAP_AREA[1]) // 2)
                st = self.host.state
                if s >= 0 and visible(st, self.host.sprites, self.host.view.origin, st.sites[s].x, st.sites[s].y):
                    if s != self.site:
                        self.show(s)
                    screen_tutorial(self.host, False)          # ovl45:0000(4) again
                return
            if self.row.event(e) == CLOSE:
                return self.finish()

    def finish(self) -> None:
        """192 -> 07be:0746 -> ovl45:02e1."""
        self.close(None)
        screen_tutorial(self.host, True)                       # ovl45:02f9..0336

    def draw(self, fb) -> None:
        k, st = self.k, self.host.state
        exe = k.exe
        s = st.sites[self.site]
        map_popup(fb, self.host, cities=False, draw=lambda buf: site_markers(k, buf, st, self.site))
        text_centred(fb, k.fonts[CHANCE36], *NAME_AT, s.name, INK, SHADOW)
        bevel(fb, ds_words(exe, FRAME_BEVEL, 4), 4, 2)
        outline(fb, ds_words(exe, FRAME, 4))
        n = 0 if s.kind == SiteKind.TEMPLE else self.site % 5 + 1
        blit_opaque(fb, k.picture(SPECBITS), ds_words(exe, PIC_AT, 2), ds_words(exe, PICS + 8 * n, 4))
        f = k.fonts[CHANCE17]
        explored = int(bool(st.world.flags[s.y * MAP_W + s.x] & MAP_EXPLORED))
        f.draw(fb, *ds_words(exe, KIND_AT, 2), raw(k, G_KIND, s.kind), INK, SHADOW)
        f.draw(fb, *ds_words(exe, STATE_AT, 2), raw(k, G_STATE, explored), INK, SHADOW)
        box = ds_words(exe, BOX, 4)
        fb.fill(BOX_COLOUR, box)
        outline(fb, box)
        atrans = k.picture(ATRANS)
        for i in range(4):
            fb.blit(atrans, ds_words(exe, LEGEND_AT + 4 * i, 2), ds_words(exe, LEGEND_ICONS + 8 * i, 4))
            f.draw(fb, *ds_words(exe, LEGEND_TEXT + 4 * i, 2), raw(k, G_LEGEND, i), INK, SHADOW)
        for i, line in enumerate(self.text):
            f.draw(fb, *ds_words(exe, TEXT_AT + 4 * i, 2), line, INK, SHADOW)
        self.row.draw(fb)


def _inside(rect, pos) -> bool:
    x, y, w, h = rect
    return x <= pos[0] < x + w and y <= pos[1] < y + h


@registry.dialog("ruins")
def ruins(host, site: int, on_close=None):
    return Ruins(host, site, on_close)


def open_at(host, x: int, y: int):
    """ovl45:0000(4, x, y)."""
    st = getattr(host, "state", None)
    if st is None:
        return None
    s = nearest_site(host, x, y)
    if s < 0 or not visible(st, host.sprites, host.view.origin, st.sites[s].x, st.sites[s].y):
        return None
    d = registry.open_dialog("ruins", host, site=s, on_close=lambda _: host.settings_closed())
    screen_tutorial(host, False)                       # ovl45:025d..02da
    return d


@registry.action(registry.MENU_ID["ruins"])
def open_ruins(host):
    """07be:0281 -> ovl45:0000(4, SCN 0x17d, SCN 0x17f)."""
    st = getattr(host, "state", None)
    if st is None:
        return None
    return open_at(host, st.flags.get(0x17D, 0), st.flags.get(0x17F, 0))


@registry.left_click("site")
def site_click(host, square, mode):
    """ovl46:0106..014c: mode 0 (a city holds the square) -> ovl45:0000(0, x, y), the city screen
    (M6b's "production"); mode 4 -> the site screen."""
    if mode == 4:
        return open_at(host, *square)
    if registry.has_dialog("production"):
        return registry.open_dialog("production", host, mode=mode, square=tuple(square))
    return None
