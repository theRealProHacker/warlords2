"""Setup Side: rename a side and pick its computer leader (Game Setup screen, the
Character box 133-140 or the portrait 149-156 of a side).

Evidence (WARLORD2.EXE ovl57 unless noted; `sides` is the Game Setup screen's SCN image):
* open ovl57:16ea(p): nothing for a side that does not take part (SCN 0x137); keeps the
  card (DS:5956) and the name (DS:5964) for Cancel; for a computer side (0x0D0 = 1) the
  leader list ovl51:03d9(7, level) = CARDS\\<K|L|W>nnn.DSC for n = 0, 1, ... while the
  file exists (at most 30; first line, at most 0x28 bytes, ovl51:0636: the letter is
  DS:5c88[level], a copy of DS:15c6 "KLW", the name DS:15ca, the test ovl59:0375 an
  open); for a side that is off (level 3) that letter is the string's NUL, the name
  ends at "CARDS\\", the open fails and the list is empty (no leaders); five visible
  rows hold list indices (row i = i, -1 past the end), moved down by card - 4 when the
  card is 5 or more; the chosen leader (DS:5958) is the card; popup type 4, JOIN screen 27;
* page ovl57:180b: "Setup Side" (EXE DS:25b3) SetFont(1, 15, 0, 3) centred at (320, 55);
  two frames, (138, 107, 368, 67) and (138, 194, 368, 165): the outline in the side's
  colour 0x0B0, then twice in colour 0x0A0, each one pixel up and left; SetFont(2, 0x0A0,
  0x0B0, 3): "Side Name" (DS:25c8) at (160, 96) and "Leader" (DS:25d9) at (160, 181), each
  on colour 3 (width x 17); the side's shield (ovl64:0bf7 mode 0: SHIELDS.PCK
  (40 p, 0, 40, 40), opaque, side 15 -> 8) at (144, 122), (456, 122) and (144, 202);
  SetFont(2, 15, 0, 3): "Retype the name of this side" (DS:25e0) centred at (320, 116);
  the name box ovl59:0058 at (229, 138, 188, 22): colour 3, bevel 14d0:02e5(4, 2), the
  name opaque at (232, 140); colour 0 lines (196, 218, 72) and (384, 218, 96); "Name"
  (DS:25fd) at (196, 203), "Description" (DS:2602) at (384, 203);
* list ovl57:1be6: bevel (188, 248, 188, 102) colours 4 / 2, colour 3 inside; for a
  computer side each filled row's leader at (196, 252 + 19 i), ink 15 for the chosen
  one, else 5 / 7 / 9 for level 0 / 1 / 2;
* description ovl57:1d0f: a human side shows "N/A" (DS:260e, DS:2612) at (196, 224)
  and (384, 224) in ink 15; a computer side the chosen leader at (192, 224) and lines
  1-6 of its .DSC file (ovl57:20dc: lines end at CR, a line exists while a CR follows it;
  the name ovl57:21c1 from DS:2616 "KLW" and DS:261a, so for level 3 again no file and
  no lines) at (384, 224 + 20 k), ink by level as above;
* buttons ovl57:1ae4: rows 464-468 disabled when empty; 457-459 normal; for a human
  side 460-463 disabled; else 460 / 462 disabled while the first row holds index < 1,
  461 / 463 normal only while 0 < last row < count - 1;
* dispatch 07be:04d8: 457 -> ovl57:2024 (OK), 458 -> ovl57:1fd7 (Cancel: name and card
  back), 459 -> ovl57:1f8a (retype the name), 460 / 461 -> ovl57:1ed1(-1 / +1) (rows
  move one, indices outside the list become -1), 462 / 463 -> ovl57:1f23(-1 / +1)
  (first row moves by -min(first, 5) / min(count - last - 1, 5), the others follow it),
  464-468 -> ovl57:1e8a(i) (a filled row's leader becomes the card);
* retype ovl56:03a6(box, name, 15, 128): the field starts empty, inner rectangle
  colour 3, text at (232, 140) in SetFont(2, 15, 0, 3), the cursor glyph DS:2375 at
  text width + 5 (blinking 15 / 9 per key poll; drawn steady here, X05); Return keeps
  the typed text (also when empty), Escape keeps the old name; Backspace; characters
  0x20-0x7a while fewer than 14 are typed and the text typed so far (before the new
  character, ovl56:0495..04cf) is narrower than 128 px.
"""
from __future__ import annotations

import pygame

from ...assets.exe import ds_str
from ...assets.fonts import CHANCE17, CHANCE36
from ...model.ids import Control
from .. import registry
from ..dialog import Dialog
from ..layout import DISABLED, NORMAL
from ..widgets import ButtonRow, blit_opaque, kit, text_centred

POPUP, SCREEN, ROWS = 4, 27, 5
OK, CANCEL, RETYPE = 457, 458, 459
ONE_UP, ONE_DOWN, PAGE_UP, PAGE_DOWN = 460, 461, 462, 463
ROW_IDS = range(464, 469)
MAX_CARDS = 30
LIST_LETTERS, LIST_FMT = 0x15C6, 0x15CA         # ovl51:063f, 065c
LETTERS, CARD_FMT, DSC = 0x2616, 0x261A, 0x262E
TITLE, SIDE_NAME, LEADER, RETYPE_TEXT, NAME, DESCRIPTION, NA_1, NA_2, CURSOR = (
    0x25B3, 0x25C8, 0x25D9, 0x25E0, 0x25FD, 0x2602, 0x260E, 0x2612, 0x2375)
FRAMES = ((138, 107, 368, 67), (138, 194, 368, 165))
SHIELDS, SHIELDS_AT = 5, ((144, 122), (456, 122), (144, 202))
BOX, LIST_BOX = (229, 138, 188, 22), (188, 248, 188, 102)
LEVEL_INK = {0: 5, 1: 7, 2: 9}
INK, SHADOW, PAPER = 15, 0, 3
NAME_LEN, NAME_WIDTH = 15, 128
NEUTRAL_SIDE, NEUTRAL_SHIELD = 15, 8
COMPUTER, HUMAN = Control.COMPUTER, Control.HUMAN
# per-side SCN words (2c04:OFF + 2p, EL §6.1), shared with states/setup
OFF_A0, OFF_B0, OFF_LEVEL, OFF_CONTROL, OFF_CARD, OFF_ENH, OFF_ALIVE = 0xA0, 0xB0, 0xC0, 0xD0, 0xE0, 0xF0, 0x137


def _card_name(exe: bytes, letters: int, fmt: str, level: int, card: int) -> str | None:
    """sprintf(fmt, letters[level], card): None when the letter is the NUL after "KLW" (the
    name then ends before the number, at the directory, and no such file opens)."""
    abc = ds_str(exe, letters)
    if not 0 <= level < len(abc):
        return None
    return fmt.replace("%c", abc[level]).replace("%03d", "%03d" % card)


def _exists(k, rel: str | None) -> bool:
    """ovl59:0375: the file opens."""
    return rel is not None and k.store.gd.path(rel.replace("\\", "/")).is_file()


def card_file(exe: bytes, level: int, card: int, ext: str) -> str | None:
    """ovl57:21c1: CARDS\\%c%03d.%s with the letter of the level (DS:2616)."""
    name = _card_name(exe, LETTERS, ds_str(exe, CARD_FMT), level, card)
    return None if name is None else name.replace("%s", ext)


def leader_names(k, level: int) -> list[str]:
    """ovl51:03d9 case 7 (ovl51:0636): names from DS:15ca with the letter DS:5c88[level]."""
    out = []
    for n in range(MAX_CARDS):
        rel = _card_name(k.exe, LIST_LETTERS, ds_str(k.exe, LIST_FMT), level, n)
        if not _exists(k, rel):
            break
        head = k.store.read(rel)[:0x28]
        out.append(head.split(b"\r")[0].decode("cp437"))
    return out


def description_line(k, level: int, card: int, n: int) -> str:
    """ovl57:20dc(n): line n of the leader's .DSC file, or ''."""
    rel = card_file(k.exe, level, card, ds_str(k.exe, DSC))
    if not _exists(k, rel):
        return ""
    data = k.store.read(rel)
    starts, i = [0], 0
    while i < len(data) and len(starts) < 9:
        if data[i] == 0x0D:
            starts.append(i + 2)
            i += 2
        i += 1
    if n >= len(starts) - 1:
        return ""
    return data[starts[n]:].split(b"\r")[0].decode("cp437")


def bevel(fb: pygame.Surface, rect, a: int, b: int) -> None:
    """14d0:02e5(rect, a, b) with b < a: right and bottom in b, then top and left in a."""
    x, y, w, h = rect
    fb.fill(b, (x + w - 1, y, 1, h))
    fb.fill(b, (x, y + h - 1, w, 1))
    fb.fill(a, (x, y, w, 1))
    fb.fill(a, (x, y, 1, h))


class SetupSide(Dialog):
    def __init__(self, k, sides, p: int, host, on_close=None):
        super().__init__(on_close)
        self.kit, self.sides, self.p, self.host = k, sides, p, host
        self.saved = (sides.name(p), sides.get(OFF_CARD, p))      # DS:5964, DS:5956
        self.computer = sides.get(OFF_CONTROL, p) == COMPUTER
        self.level = sides.get(OFF_LEVEL, p)
        self.names = leader_names(k, self.level) if self.computer else []
        self.rows = [-1] * ROWS
        if self.computer:
            self.rows = [i if i < len(self.names) else -1 for i in range(ROWS)]
            card = sides.get(OFF_CARD, p)
            if card >= ROWS:
                self.rows = [r + card - (ROWS - 1) for r in self.rows]
        self.typing: str | None = None
        self._lines: dict[int, list[str]] = {}
        self.buttons = ButtonRow(list(k.layouts.screen(SCREEN).buttons), k.picture)
        self._states()

    @property
    def chosen(self) -> int:                    # DS:5958
        return self.sides.get(OFF_CARD, self.p)

    def _states(self) -> None:
        """ovl57:1ae4."""
        st, n = self.buttons.state, len(self.names)
        for i, id in enumerate(ROW_IDS):
            st[id] = DISABLED if self.rows[i] < 0 else NORMAL
        st[OK] = st[CANCEL] = st[RETYPE] = NORMAL
        if not self.computer:
            up = down = DISABLED
        else:
            up = DISABLED if self.rows[0] < 1 else NORMAL
            down = NORMAL if 0 < self.rows[-1] < n - 1 else DISABLED
        st[ONE_UP] = st[PAGE_UP] = up
        st[ONE_DOWN] = st[PAGE_DOWN] = down

    def press(self, id: int) -> None:
        n = len(self.names)
        if id == OK:
            return self.close(True)
        if id == CANCEL:
            self.sides.set_name(self.p, self.saved[0])
            self.sides.set(OFF_CARD, self.p, self.saved[1])
            return self.close(False)
        if id == RETYPE:
            self.typing = ""
        elif id in (ONE_UP, ONE_DOWN):                          # ovl57:1ed1
            d = -1 if id == ONE_UP else 1
            self.rows = [r + d if 0 <= r + d < n else -1 for r in self.rows]
        elif id in (PAGE_UP, PAGE_DOWN):                        # ovl57:1f23
            if id == PAGE_UP:
                step = -min(self.rows[0], ROWS)
            else:
                step = min(n - self.rows[-1] - 1, ROWS)
            first = self.rows[0] + step
            self.rows = [first + i for i in range(ROWS)]
        elif id in ROW_IDS:                                     # ovl57:1e8a
            r = self.rows[id - ROW_IDS[0]]
            if r >= 0:
                self.sides.set(OFF_CARD, self.p, r)
        self._states()

    def _type(self, events) -> None:
        """ovl56:03a6."""
        f = self.kit.fonts[CHANCE17]
        for e in events:
            if e.type != pygame.KEYDOWN:
                continue
            if e.key in (pygame.K_RETURN, pygame.K_KP_ENTER):
                self.sides.set_name(self.p, self.typing)
                self.typing = None
                return
            if e.key == pygame.K_ESCAPE:
                self.typing = None
                return
            if e.key == pygame.K_BACKSPACE:
                self.typing = self.typing[:-1]
                continue
            u = getattr(e, "unicode", "")
            if len(u) == 1 and 0x20 <= ord(u) < 0x7B:
                if len(self.typing) < NAME_LEN - 1 and f.width(self.typing) < NAME_WIDTH:
                    self.typing += u

    def update(self, events, dt) -> None:
        if self.typing is not None:
            return self._type(events)
        for e in events:
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                b = self.buttons.at(e.pos)
                if b:
                    registry.right_click_handler("button")(self.host, b.id, e.pos)
                    return
            hit = self.buttons.event(e)
            if hit is not None:
                self.press(hit)
                if self.stack is None or self.typing is not None:
                    return

    def draw(self, fb: pygame.Surface) -> None:
        k, exe, p = self.kit, self.kit.exe, self.p
        f, big = k.fonts[CHANCE17], k.fonts[CHANCE36]
        a0, b0 = self.sides.get(OFF_A0, p), self.sides.get(OFF_B0, p)
        k.draw_popup(fb, POPUP)
        text_centred(fb, big, 320, 55, ds_str(exe, TITLE), INK, SHADOW)
        for x, y, w, h in FRAMES:
            for i, c in enumerate((b0, a0, a0)):
                pygame.draw.rect(fb, c, (x - i, y - i, w, h), 1)
        for ds, y in ((SIDE_NAME, 96), (LEADER, 181)):
            s = ds_str(exe, ds)
            fb.fill(PAPER, (160, y, f.width(s), 17))
            f.draw(fb, 160, y, s, a0, b0)
        shields = k.picture(SHIELDS)
        cell = NEUTRAL_SHIELD if p == NEUTRAL_SIDE else p
        for at in SHIELDS_AT:
            blit_opaque(fb, shields, at, (40 * cell, 0, 40, 40))
        text_centred(fb, f, 320, 116, ds_str(exe, RETYPE_TEXT), INK, SHADOW)
        x, y, w, h = BOX
        if self.typing is None:                                  # ovl59:0058
            fb.fill(PAPER, BOX)
            bevel(fb, BOX, 4, 2)
            f.draw(fb, x + 3, y + 2, self.sides.name(p), INK, SHADOW, PAPER)
        else:                                                    # ovl56:03a6
            fb.fill(PAPER, (x + 1, y + 1, w - 2, h - 2))
            f.draw(fb, x + 3, y + 2, self.typing, INK, SHADOW)
            f.draw(fb, x + f.width(self.typing) + 5, y + 2, ds_str(exe, CURSOR), INK, SHADOW)
        fb.fill(0, (196, 218, 72, 1))
        fb.fill(0, (384, 218, 96, 1))
        f.draw(fb, 196, 203, ds_str(exe, NAME), INK, SHADOW)
        f.draw(fb, 384, 203, ds_str(exe, DESCRIPTION), INK, SHADOW)
        bevel(fb, LIST_BOX, 4, 2)                               # ovl57:1be6
        lx, ly, lw, lh = LIST_BOX
        fb.fill(PAPER, (lx + 1, ly + 1, lw - 2, lh - 2))
        level_ink = LEVEL_INK.get(self.level, INK)
        if self.computer:
            for i, r in enumerate(self.rows):
                if r < 0:
                    break
                ink = INK if r == self.chosen else level_ink
                f.draw(fb, 196, 252 + 19 * i, self.names[r], ink, SHADOW)
            card = self.chosen                                   # ovl57:1d0f
            if 0 <= card < len(self.names):
                f.draw(fb, 192, 224, self.names[card], level_ink, SHADOW)
            if card not in self._lines:
                self._lines[card] = [description_line(k, self.level, card, n) for n in range(1, 7)]
            for n, line in enumerate(self._lines[card]):
                f.draw(fb, 384, 224 + 20 * n, line, level_ink, SHADOW)
        else:
            f.draw(fb, 196, 224, ds_str(exe, NA_1), INK, SHADOW)
            f.draw(fb, 384, 224, ds_str(exe, NA_2), INK, SHADOW)
        self.buttons.draw(fb)


@registry.dialog("setup_side")
def setup_side(host, sides, side: int, on_close=None):
    return SetupSide(kit(host.app), sides, side, host, on_close)
