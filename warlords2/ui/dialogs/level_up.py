"""A hero's promotion at the start of its side's turn (HeroPromoted, ovl47:0672).

Evidence (asm ovl47):
* ovl47:0579 (from ovl68:050e for a human, ovl68:01a9 for a computer side) calls
  ovl47:0672(army, group, popup type): level 0 -> 1 with (101, 0x10), 1 -> 2 with (102, 0x11),
  2 -> 3 with (103, 0x12) (05f7 / 0626 / 0655; push dword 0x100065 = group, type); the event
  carries the group;
* after the engine part (level, 0b62:0005 strength, allowance + 2) a computer side returns at
  0723 (ovl25:09ab) and nothing is shown;
* human: ovl58:0000(7) music (M10c), 12bf:07a5; ovl17:0000(type) (types 0x10..0x12 -> pictures
  56..58 LEVEL2..LEVEL4, ovl17:052b..0544, popup (160, 90) 320x200 opaque with the common frame);
  f = 0, or 6 for a heroine (2c04:0593[s], 0745..0754); SetFont(1, 15, 0, 3), STRING (group, f)
  centred at (320, 93) (0757..0781); SetFont(2, 15, 0, 3) (0789..0795), centred at x 320: the
  hero's name (2c04:0223 + 0x14 s) at y 140 (079d..07af), (group, f + 1) at 160, f + 2 at 180,
  f + 3 at 200, f + 4 at 232 (07b7..082f), and sprintf((group, f + 5), level + 1, strength,
  strength gain, allowance, 2) at 252 (083d..089a, the values after the promotion);
* 08a8..08b8: pointer on, DS:166a = 1, ovl59:0142 waits for mask 0xd4 (a mouse release or a
  key), DS:166a = 0; 08be ovl17:069c closes.
"""
from __future__ import annotations

from ...assets.fonts import CHANCE17, CHANCE36
from ...model import events as E
from ...model.ids import Control
from ...rules.bonuses import s8
from .. import registry
from ..dialog import Dialog
from ..widgets import POPUP_PICTURE, is_dismiss, kit, text_centred
from .hero_offer import raw, sprintf, wait
from ...assets.store import cache_load

FIRST_GROUP, FIRST_POPUP = 101, 0x10
FEMALE_OFFSET = 6
INK, SHADOW = 15, 0
CX, TITLE_Y, NAME_Y = 320, 93, 140
LINE_Y = (160, 180, 200, 232, 252)


class LevelUp(Dialog):
    event_loop = False                 # ovl47:0672 waits in ovl59:0142
    def __init__(self, k, state, ev, on_close=None):
        super().__init__(on_close)
        self.k = k
        info = ev.info
        a = state.armies[info["army"]]
        h = state.heroes[info["slot"]]
        self.popup = FIRST_POPUP + info["group"] - FIRST_GROUP
        cache_load(k, POPUP_PICTURE[self.popup])       # ovl17:0000 (X44)
        f = FEMALE_OFFSET if info["female"] else 0
        g = info["group"]
        self.title = sprintf(raw(k, g, f))
        self.name = h.name
        last = sprintf(raw(k, g, f + 5), (info["level"] & 3) + 1, s8(a.strength), info["strength"],
                       a.allowance, info["moves"])
        self.lines = [sprintf(raw(k, g, f + i)) for i in range(1, 5)] + [last]

    def update(self, events, dt) -> None:
        if any(is_dismiss(e) for e in events):
            self.close(None)

    def draw(self, fb) -> None:
        k = self.k
        k.draw_popup(fb, self.popup)
        text_centred(fb, k.fonts[CHANCE36], CX, TITLE_Y, self.title, INK, SHADOW)
        f = k.fonts[CHANCE17]
        text_centred(fb, f, CX, NAME_Y, self.name, INK, SHADOW)
        for y, s in zip(LINE_Y, self.lines):
            text_centred(fb, f, CX, y, s, INK, SHADOW)


@registry.dialog("level_up")
def level_up(host, event, on_close=None):
    return LevelUp(kit(host.app), host.state, event, on_close)


@registry.event_view(E.HeroPromoted)
def _promoted(host, ev):
    st = host.state
    if st.players[st.armies[ev.info["army"]].owner].control != Control.HUMAN:     # ovl47:0723
        return None
    return wait(registry.open_dialog("level_up", host, event=ev))
