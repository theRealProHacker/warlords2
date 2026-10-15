"""Hero > Levels (menu 520, key 'u'): the side's heroes with level, experience and what they need.

Evidence (asm ovl47:1652..1a71, close ovl47:1a7a; key table 07be:0337 'u' -> 07be:0245):
* 12bf:07a5; ovl17:0000(0): popup type 0 (MARBLE (0, 0, 480, 320) at (80, 60)); DS:166a = 1;
  ovl53:056a(0x1c): JOIN screen 28 (button 469); 08a9:066e(469, 1);
* SetFont(1, 15, 0, 3), STRING (104, 0) centred at (320, 63) (1685..16ac); SetFont(2, SCN
  0x0a0[p], SCN 0x0b0[p], 3) (16b4..16e4), headings at y 105: (104, 1) left at 128, (104, 2) left
  at 272, (104, 3) / (104, 4) / (104, 5) / (104, 6) centred at 392 / 440 / 488 / 536 (16ec..1798);
* SetFont(2, 15, 0, 3) (17a0); rows for levels 3, 2, 1, 0 (17b4, 1a1d), each over the army
  records SCN 0x181 - 1 .. 0 (17bc, 1a10): a hero (type 0x1c) of SCN 0x110 whose slot level
  (2c04:05e3[s] & 3) is the one of the pass; row r at y0 = 128 + 30 r, text at y0 + 6:
  ovl64:08be(0x1c, p, ring R) at (88, y0), R = p + 2 for level 3, else 1 (183c..187b); the name
  left at 128 (1883); the level name STRING (99 or 100 for a heroine, level) left at 272
  (18a3..18ec); centred: exp "%d" (DS:115d) at 392, needs DS:1160 / 1163 / 1166 "%d" with
  15 / 30 / 60 for levels 0 / 1 / 2, DS:1169 for level 3 (jump table ovl47:1a72) at 440,
  strength (+8, DS:116b) at 488, movement allowance (+6, DS:116e) at 536 (18f4..1a07);
* empty rings ovl64:08be(-1, p, ring 1) at (88, 128 + 30 i) for i = heroes .. 5 (1a2a..1a67);
* 469 (07be:0a73) -> ovl47:1a7a: ovl17:069c, ovl61:011f(0, 0, 0) (DS:166a = 0, screen 0, the
  palette refresh ovl61:0174).  Keys: none in these routines; DS:166a is set, so a key goes
  through 07be:0064 (`ui.keys.popup_key`): 469 is in DS:1514 and DS:155c, so Esc and Return
  close, 'A'..'Z' nothing, any other key the chord.
"""
from __future__ import annotations

from ...assets.exe import ds_str
from ...assets.fonts import CHANCE17, CHANCE36
from ...model.ids import HERO_TYPE
from ...rules.bonuses import s8
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..palettes import painter_for
from ..widgets import ButtonRow, kit, text_centred
from .hero_offer import raw, sprintf

POPUP, SCREEN, CLOSE = 0, 28, 469
GROUP = 104
LEVEL_NAMES, LEVEL_NAMES_F = 99, 100
HEAD_Y, ROW_Y, ROW_STEP, TEXT_DY = 105, 128, 30, 6
HEADS = ((1, 128, "left"), (2, 272, "left"), (3, 392, "centre"), (4, 440, "centre"),
         (5, 488, "centre"), (6, 536, "centre"))
ICON_X, NAME_X, LEVEL_X, EXP_X, NEEDS_X, STR_X, MOVE_X = 88, 128, 272, 392, 440, 488, 536
FMT_EXP, NEEDS, NO_NEEDS, FMT_STR, FMT_MOVE = 0x115D, ((0x1160, 15), (0x1163, 30), (0x1166, 60)), 0x1169, 0x116B, 0x116E
TOP_LEVEL, SLOTS = 3, 6
SCN_INK, SCN_SHADOW = 0xA0, 0xB0
INK, SHADOW = 15, 0


def rows(state) -> list:
    """(army, slot) in the order of ovl47:17b4..1a27."""
    out = []
    for level in range(TOP_LEVEL, -1, -1):
        for a in reversed(state.armies):
            if a.type_id == HERO_TYPE and s8(a.owner) == state.current \
                    and state.heroes[s8(a.hero_slot)].level == level:
                out.append((a, state.heroes[s8(a.hero_slot)]))
    return out


class HeroLevels(Dialog):
    def __init__(self, host, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        self.painter = painter_for(host)
        self.row = ButtonRow([k.layouts.screen(SCREEN).button(CLOSE)], k.picture)

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> bool:
        if id == CLOSE:
            self.close(None)
            return True
        return False

    def draw(self, fb) -> None:
        k, st = self.k, self.host.state
        exe = k.exe
        p = st.current
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], 320, 63, raw(k, GROUP, 0), INK, SHADOW)
        f = k.fonts[CHANCE17]
        ink, shadow = st.flags.get(SCN_INK + 2 * p, 0), st.flags.get(SCN_SHADOW + 2 * p, 0)
        for i, x, how in HEADS:
            s = raw(k, GROUP, i)
            f.draw(fb, x - (int(f.width(s) / 2) if how == "centre" else 0), HEAD_Y, s, ink, shadow)
        n = 0
        for n, (a, h) in enumerate(rows(st), 1):
            y0 = ROW_Y + ROW_STEP * (n - 1)
            ty = y0 + TEXT_DY
            self.painter.army(fb, HERO_TYPE, p, ICON_X, y0, ring=p + 2 if h.level == TOP_LEVEL else 1)
            f.draw(fb, NAME_X, ty, h.name, INK, SHADOW)
            f.draw(fb, LEVEL_X, ty, raw(k, LEVEL_NAMES_F if h.female else LEVEL_NAMES, h.level), INK, SHADOW)
            needs = sprintf(ds_str(exe, NEEDS[h.level][0]), NEEDS[h.level][1]) if h.level < TOP_LEVEL \
                else ds_str(exe, NO_NEEDS)
            for x, s in ((EXP_X, sprintf(ds_str(exe, FMT_EXP), h.exp)), (NEEDS_X, needs),
                         (STR_X, sprintf(ds_str(exe, FMT_STR), s8(a.strength))),
                         (MOVE_X, sprintf(ds_str(exe, FMT_MOVE), a.allowance))):
                text_centred(fb, f, x, ty, s, INK, SHADOW)
        for i in range(n, SLOTS):
            self.painter.army(fb, -1, p, ICON_X, ROW_Y + ROW_STEP * i, ring=1)
        self.row.draw(fb)


@registry.dialog("hero_levels")
def hero_levels(host, on_close=None):
    return HeroLevels(host, on_close)


@registry.action(registry.MENU_ID["hero_levels"])
def open_hero_levels(host):
    """07be:0245 -> ovl47:1652; closed through 469 -> ovl47:1a7a -> ovl61:011f(0, 0, 0)."""
    if getattr(host, "state", None) is None:
        return None
    return registry.open_dialog("hero_levels", host, on_close=lambda _: host.settings_closed())
