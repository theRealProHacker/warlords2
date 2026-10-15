"""Game > Shortcuts (menu 499, Alt-U): the editor of the four shortcut buttons 179-182.

Evidence (asm ovl14; key table 07be:0337 0x116 -> 07be:02d2 -> ovl14:0000; buttons 07be:04d8
294 -> 08fc ovl14:0032, 295-315 -> 0904 ovl14:0053(id - 0x127), 316-319 -> 0912
ovl14:00e9(id - 0x13c); DGROUP words and strings read from the user's EXE):
* State: DS:3fa2[4] the UDB.CUR menu ids, DS:3faa[4] their UDB.DAT record index (-1 = none;
  0579: the first record whose id word matches), DS:055a the slot being edited, which nothing
  resets (not ovl14:0000 either): it belongs to the program (`Kit.shortcut_slot`).  UDB.CUR is
  read once at start-up (ovl14:02fb -> 0427); only this editor writes it, so the ids read from
  the file (`ui.palettes.shortcut_ids`) are DS:3fa2.
* 0000: popup 0 ((80, 60) 480x320, marble), JOIN screen 14 (ovl53:056a(0x0e)), 014a(0),
  DS:166a = 1, 0101 (294, 295..315, 316..319 normal).
* 014a(di) (di = 0 the full draw, 1 the redraw after a press, which leaves the texts as drawn;
  here every frame is the full picture, which is what the screen shows either way):
  SetFont(1, 15, 0, 3) DS:055c centred at DS:0552; SetFont(2, 15, 0, 3); records si = 0..20 read
  by 04ac (record si of UDB.DAT; past the count it returns without filling the buffer, which
  keeps the last record read): the large rectangle with its width halved (cdq / sar), the source
  x + half the width for the record DS:3faa[DS:055a] (01b4..01c0: the right, "chosen" half),
  MENUBUTT.PCK (picture 0x2b) copied opaque (0997:0129) to DS:04ce + 4 si; the name (+2)
  left-aligned (ovl59:00bf) at (x + 0x28, y + 5); DS:056b centred at DS:0556; slots si = 0..3:
  DS:3faa[si] >= 0 -> that record's large rectangle and DS:3fa2[si] = its id (0279), else
  DS:049e and DS:3fa2[si] = 0 (0297); the width halved; the copy to DS:0522 + 4 si; for
  si == DS:055a a colour-9 outline (116d:01fd) of DS:0532 + 8 si.  116d:01fd draws the rows y and
  y + h - 1 and the columns x and x + w - 1 of its rectangle (1133:02fe / 0344), and
  DS:0532 + 8 si is the slot's own 32x29 copy rectangle, so the next copy erases the frame of a
  slot left: no old frame stays.
* Buttons (BUTTON.DAT screen 14): 294 Done; 295..315 invisible 152x30 over the records, whose
  third column BUTTON.DAT puts at x 300 (not 400, the art's column): it overlaps the second and
  the hit test 08a9:0756 takes the last record (`ButtonRow.at`), as here; 316..319 the slots.
  295 + r -> 0053(r): DS:3faa[DS:055a] = r, 014a(1), 0101.  316 + k -> 00e9(k): DS:055a = k.
  294 -> 0032: 047b writes DS:3fa2 (8 bytes) to UDB\\UDB.CUR, 030a rebuilds the bar art,
  ovl17:069c, ovl61:011f(0, 0, 0).  No cancel; Esc and Return press 294 (`ui.keys` lists).
  Here UDB.CUR goes to the user directory (`app.user`, read first by `shortcut_ids`) and the
  human phase's palette reads it again (`ActionPalette.reload_shortcuts`).
* HLP selectors 33..36 (the records of 179..182): ovl15:01ae..01e0: ovl14:03f8(word2 - 33)
  copies the name of the UDB.DAT record with id DS:3fa2[slot] (050b scans all records; with no
  match the buffer keeps the last record read, the file's last) into DS:5c38; ovl46:1201,
  ovl46:1158(DS:05e6, DS:5c38): title DS:05e6, text the name.
"""
from __future__ import annotations

import struct

import pygame

from ...assets.exe import ds_str, ds_words
from ...assets.fonts import CHANCE17, CHANCE36
from ...formats.tables import parse_udb
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..palettes import shortcut_ids
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from .hero_offer import outline

POPUP, SCREEN, MENUBUTT = 0, 14, 0x2B
DONE = 294
RECORDS, SLOTS = range(295, 316), range(316, 320)
N_RECORDS, N_SLOTS = 21, 4                               # ovl14:0210 cmp si, 0x15; 02ea cmp si, 4
TITLE, TITLE_AT, SUB, SUB_AT = 0x055C, 0x0552, 0x056B, 0x0556
RECORD_AT, SLOT_AT, SLOT_FRAME, EMPTY = 0x04CE, 0x0522, 0x0532, 0x049E
CURRENT = 0x055A                                         # DS:055a in the image
NAME_DX, NAME_DY = 0x28, 5                               # ovl14:0203 / 01f6
FRAME = 9                                                # ovl14:02cf
INK, SHADOW = 15, 0
HELP_SELECTORS = range(33, 37)                           # ovl15:01ae cmp dx, 0x21 / 0x24
HELP_TITLE = 0x05E6
CUR_FILE = "UDB/UDB.CUR"


def records(k) -> list[dict]:
    return parse_udb(k.store.read("UDB/UDB.DAT"))


def index_of(recs, id: int) -> int:
    """ovl14:0579: the first record with this id, else -1."""
    return next((i for i, r in enumerate(recs) if r["button_id"] == id), -1)


def half(rect) -> tuple[int, int, int, int]:
    """The width halved (cdq / sub / sar: towards zero)."""
    x, y, w, h = rect
    return x, y, int(w / 2), h


def current_slot(k) -> int:
    """DS:055a: the image's word until the editor sets it (the program's, not the game's)."""
    v = getattr(k, "shortcut_slot", None)
    return ds_words(k.exe, CURRENT, 1)[0] if v is None else v


class Shortcuts(Dialog):
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        exe = k.exe
        self.recs = records(k)
        self.slots = [index_of(self.recs, i) for i in shortcut_ids(host.app)]     # DS:3faa
        self.record_at = [ds_words(exe, RECORD_AT + 4 * i, 2) for i in range(N_RECORDS)]
        self.slot_at = [ds_words(exe, SLOT_AT + 4 * i, 2) for i in range(N_SLOTS)]
        self.slot_frame = [ds_words(exe, SLOT_FRAME + 8 * i, 4) for i in range(N_SLOTS)]
        self.empty = ds_words(exe, EMPTY, 4)
        self.row = ButtonRow(list(k.layouts.screen(SCREEN).buttons), k.picture)

    @property
    def cur(self) -> int:
        return current_slot(self.k)

    def ids(self) -> list[int]:
        """DS:3fa2 as 014a leaves it (0279 / 0297)."""
        return [self.recs[s]["button_id"] if s >= 0 else 0 for s in self.slots]

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        if id == DONE:
            self.done()
            return True
        if id in RECORDS:                                    # ovl14:0053
            self.slots[self.cur] = id - RECORDS.start
        elif id in SLOTS:                                    # ovl14:00e9
            self.k.shortcut_slot = id - SLOTS.start
        return False

    def done(self) -> None:
        """ovl14:0032: 047b (UDB.CUR), 030a (the bar art), ovl17:069c, ovl61:011f(0, 0, 0)."""
        host = self.host
        host.app.user.path(CUR_FILE).write_bytes(struct.pack("<4H", *self.ids()))
        pal = getattr(getattr(host, "phase", None), "palette", None)
        if pal is not None and hasattr(pal, "reload_shortcuts"):
            pal.reload_shortcuts()
        self.close(None)
        host.settings_closed()

    def draw(self, fb: pygame.Surface) -> None:
        k = self.k
        exe = k.exe
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *ds_words(exe, TITLE_AT, 2), ds_str(exe, TITLE), INK, SHADOW)
        f = k.fonts[CHANCE17]
        art = k.picture(MENUBUTT)
        chosen = self.slots[self.cur] if 0 <= self.cur < N_SLOTS else None
        rec = None
        for si in range(N_RECORDS):
            if si < len(self.recs):
                rec = self.recs[si]                          # 04ac; past the count the last stays
            if rec is None:
                continue
            x, y, w, h = half(rec["rect_large"])
            if si == chosen:
                x += w
            at = self.record_at[si]
            blit_opaque(fb, art, at, (x, y, w, h))
            f.draw(fb, at[0] + NAME_DX, at[1] + NAME_DY, rec["name"], INK, SHADOW)
        text_centred(fb, f, *ds_words(exe, SUB_AT, 2), ds_str(exe, SUB), INK, SHADOW)
        for si, s in enumerate(self.slots):
            src = self.recs[s]["rect_large"] if s >= 0 else self.empty
            blit_opaque(fb, art, self.slot_at[si], half(src))
            if si == self.cur:
                outline(fb, self.slot_frame[si], FRAME)
        self.row.draw(fb)


@registry.dialog("shortcuts")
def shortcuts(host, on_close=None):
    return Shortcuts(host, on_close)


@registry.action(registry.MENU_ID["shortcuts"])
def open_shortcuts(host):
    """07be:02d2 -> ovl14:0000."""
    if getattr(host, "state", None) is None:
        return None
    return registry.open_dialog("shortcuts", host)


@registry.help_selector(HELP_SELECTORS)
def shortcut_help(host, record, word2):
    """ovl15:01ae..01e0 -> ovl14:03f8(word2 - 33) and ovl46:1158(DS:05e6, the name)."""
    k = kit(host.app)
    pal = getattr(getattr(host, "phase", None), "palette", None)
    ids = getattr(pal, "shortcuts", None) or shortcut_ids(host.app)
    recs = records(k)
    if not recs:
        return None
    id = ids[word2 - HELP_SELECTORS.start]
    rec = next((r for r in recs if r["button_id"] == id), recs[-1])     # 050b: no match -> the last read
    return ds_str(k.exe, HELP_TITLE), rec["name"]
