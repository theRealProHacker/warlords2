"""A medal for a unit after a won battle (MedalAwarded, the tail of ovl36:2274).

Evidence (asm ovl36:24a5..2670):
* shown only when SCN 0x0d0[DS:41fa] == 0 (the attacking side is human; 24a5..24ba);
  m = medals - 1 (24bd..24c6); ovl58:0000(8) music (M10c); 12bf:07a5;
* ovl17:0000(0x18 + m): MEDAL0..MEDAL3 (pictures 64..67, ovl17:0571..0594), popup (160, 90)
  320x200 opaque with the common frame (24d5..24dd);
* ovl64:08be(unit type, unit owner, ring 0, mode 0) at (176, 155) (24e3..2508);
* SetFont(2, 15, 0, 3) (2510); left-aligned (ovl59:00bf): STRING (158, -1) at (216, 155)
  (push 0xffff009e at 2524: ovl59:052f, a random member), sprintf((159, 0), the type's name
  ovl44:14f4) at (216, 175), (160, -1) at (176, 195), (161, m) at (176, 215), (162, 0) for a
  strength gain / (162, 1) for movement at (176, 245), sprintf((162, 2), v - 1, v) at
  (176, 265) with v the new strength (+8) or allowance (+6) (25c4..2645);
* 2653..2668: pointer on, ovl61:10fb(NULL): DS:166a = 1, ovl59:0142 (mask 0xd4: a mouse release
  or a key), DS:166a = 0, input flushed (ovl59:01f1); ovl17:069c; ovl58:0000(1).

The two random lines (ovl59:052f -> rnd(1, members, -1), first for group 158, then 160) are the
engine's rolls: MedalAwarded info "text_rolls" (rules.heroes.award_medal), present when the
attacker DS:41fa (`battle_work.attacker`) is human, the only case the pop-up shows.
"""
from __future__ import annotations

from ...assets.fonts import CHANCE17
from ...model import events as E
from ...model.ids import Control
from ...rules.bonuses import s8
from .. import registry
from ..dialog import Dialog
from ..palettes import painter_for
from ..typename import type_name
from ..widgets import POPUP_PICTURE, is_dismiss, kit
from .hero_offer import raw, sprintf, wait
from ...assets.store import cache_load

FIRST_POPUP = 0x18
ICON_AT = (176, 155)
G_PRAISE, G_UNIT, G_AWARDED, G_MEDAL, G_GAIN = 158, 159, 160, 161, 162
GAIN_STRENGTH, GAIN_MOVES, GAIN_FROM_TO = 0, 1, 2
LINES = ((216, 155), (216, 175), (176, 195), (176, 215), (176, 245), (176, 265))
INK, SHADOW = 15, 0


class Medal(Dialog):
    event_loop = False                 # ovl36:2274's pop-up waits in ovl61:10fb (ovl59:0142)
    def __init__(self, host, ev, on_close=None):
        super().__init__(on_close)
        k = self.k = kit(host.app)
        self.painter = painter_for(host)
        st = host.state
        info = ev.info
        a = st.armies[info["army"]]
        self.type, self.owner = a.type_id, a.owner
        m = info["medals"] - 1
        self.popup = FIRST_POPUP + m
        cache_load(k, POPUP_PICTURE[self.popup])       # ovl17:0000 (X44)
        strength = info["gain"] == "strength"
        v = s8(a.strength) if strength else a.allowance
        picks = info["text_rolls"]                     # ovl36:2524 / 2581
        self.lines = [raw(k, G_PRAISE, picks[0]),
                      sprintf(raw(k, G_UNIT, 0), type_name(k, st, a.type_id)),     # ovl36:254b
                      raw(k, G_AWARDED, picks[1]),
                      raw(k, G_MEDAL, m),
                      raw(k, G_GAIN, GAIN_STRENGTH if strength else GAIN_MOVES),
                      sprintf(raw(k, G_GAIN, GAIN_FROM_TO), v - 1, v)]

    def update(self, events, dt) -> None:
        if any(is_dismiss(e) for e in events):
            self.close(None)

    def draw(self, fb) -> None:
        k = self.k
        k.draw_popup(fb, self.popup)
        self.painter.army(fb, self.type, self.owner, *ICON_AT)
        f = k.fonts[CHANCE17]
        for (x, y), s in zip(LINES, self.lines):
            f.draw(fb, x, y, s, INK, SHADOW)


@registry.dialog("medal")
def medal(host, event, on_close=None):
    return Medal(host, event, on_close)


@registry.event_view(E.MedalAwarded)
def _medal(host, ev):
    st = host.state
    side = s8(st.battle_work.attacker)                 # DS:41fa (ovl36:24a5..24ba)
    if not 0 <= side < len(st.players) or st.players[side].control != Control.HUMAN:
        return None
    return wait(registry.open_dialog("medal", host, event=ev))
