"""View > Items (menu 523, key 't'): the fourteen items 8..21 with their effects (ovl35:0c21).

Evidence (asm ovl35, read from the user's EXE; key table 07be:0337 't' -> 07be:023d):
* ovl35:0c21: 12bf:07a5, ovl17:0000(4) (popup type 4, (120, 50) 400x360, marble), DS:166a = 1,
  ovl53:056a(0x23): screen 35; ovl35:0c50; ovl35:0f0c: 496 and 495 normal;
* ovl35:0c50: the items 8..21, whatever their state (0c5f..0c78), insertion-sorted by type
  (+0x14, signed) then value (+0x15) (0c7a..0d64); SetFont(1, 15, 0, 3) STRING (166, 0) centred at
  (320, 52); SetFont(2, 15, 0, 3) (167, 0) centred at (320, 382) (0d67..0dc3); SetFont(2, 7, 0, 3)
  (0dcb); row i at y 90 + 20 i: the name right-aligned at x 304 (0e06); the category di by type
  1 -> 1, 2 -> 2, 5 -> 3, 6 -> 4, 7 -> 5, any other type keeps the previous row's (di starts at 0,
  0c58; 0e22..0eaf); sprintf((167, di), signed value) left at x 336 (0ef7);
* 495 -> 07be:0afe -> ovl35:0f2d: ovl17:069c, ovl61:011f(0, 0, 0); 496 -> 07be:0b05 -> ovl35:0f4e:
  ovl61:168d(FILE.DAT (0x45, 0), the HITEM help page), then 0f0c.
Keys (07be:0064 with DS:166a set, `ui.keys.popup_key`): 495 is in DS:1514 and DS:155c, so Esc
and Return close, 'A'..'Z' nothing, any other key the chord.
"""
from __future__ import annotations

from ...assets.fonts import CHANCE17, CHANCE36
from ...rules.bonuses import s8
from .. import registry
from ..dialog import Dialog
from ..gfxpage import GfxPages
from ..keys import popup_input
from ..widgets import ButtonRow, kit, text_centred
from .hero_offer import raw, sprintf

POPUP, SCREEN = 4, 35
CLOSE, HELP = 495, 496
FIRST, LAST = 8, 22
G_TITLE, G_TEXT = 166, 167
TITLE_AT, FOOT_AT = (320, 52), (320, 382)
NAME_X, TEXT_X, ROW_Y, ROW_STEP = 304, 336, 90, 20
CATEGORY = {1: 1, 2: 2, 5: 3, 6: 4, 7: 5}
ROW_INK, INK, SHADOW = 7, 15, 0
HELP_FILE = (0x45, 0)


def listed(state) -> list[int]:
    """ovl35:0c5f..0d64."""
    out = []
    for i in range(FIRST, min(LAST, len(state.items))):
        it = state.items[i]
        key = (s8(it.type), s8(it.value))
        j = len(out)
        while j > 0 and key < (s8(state.items[out[j - 1]].type), s8(state.items[out[j - 1]].value)):
            j -= 1
        out.insert(j, i)
    return out


class Items(Dialog):
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        lay = k.layouts.screen(SCREEN)
        self.row = ButtonRow([lay.button(HELP), lay.button(CLOSE)], k.picture)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        if id == CLOSE:
            self.close(None)
            return True
        if id == HELP:                                    # ovl35:0f4e -> ovl61:168d
            k = self.k
            self.host.dialogs.push(GfxPages(k, [k.store.read(k.files.get(*HELP_FILE))]))
            return True
        return False

    def draw(self, fb) -> None:
        k, st = self.k, self.host.state
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], *TITLE_AT, raw(k, G_TITLE, 0), INK, SHADOW)
        f = k.fonts[CHANCE17]
        text_centred(fb, f, *FOOT_AT, raw(k, G_TEXT, 0), INK, SHADOW)
        di = 0
        for r, i in enumerate(listed(st)):
            it = st.items[i]
            y = ROW_Y + ROW_STEP * r
            f.draw(fb, NAME_X - f.width(it.name), y, it.name, ROW_INK, SHADOW)
            di = CATEGORY.get(s8(it.type), di)
            f.draw(fb, TEXT_X, y, sprintf(raw(k, G_TEXT, di), s8(it.value)), ROW_INK, SHADOW)
        self.row.draw(fb)


@registry.dialog("items")
def items(host, on_close=None):
    return Items(host, on_close)


@registry.action(registry.MENU_ID["items"])
def open_items(host):
    """07be:023d -> ovl35:0c21."""
    if getattr(host, "state", None) is None:
        return None
    return registry.open_dialog("items", host, on_close=lambda _: host.settings_closed())
