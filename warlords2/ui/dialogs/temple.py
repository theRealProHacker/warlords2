"""The temple menu of a human hero's search (ovl01:0000; bless ovl01:0132, quest ovl01:011b).

Evidence (asm ovl01, read from the user's EXE):
* opened by ovl34:018f (Search with a hero on an unexplored temple, `SiteSearched` with
  "temple_menu"); ovl58:0000(5) music (M10c); the site under DS:5e62 (ovl62:04b5);
* ovl17:0000(9): popup type 9 (TEMPLE.PCK, picture 44, opaque, framed) (002b); SetFont(2, 7, 6, 1)
  (0031); sprintf((19, 0), site name) centred at (320, 270), (19, 1) at (320, 290), (19, 2) at
  (320, 310) (0064..00b3); ovl53:056a(15) (00bb), DS:166a = 1;
* 328 normal (00c9); 329 normal only with Quests on (SCN 0x11e), no active quest (2c04:1103 +
  0xc p) and a hero in the stack (DS:5e5e), else disabled (00d7..0109);
* 328 -> 07be:0920 -> ovl01:0132: ovl34:08a1 (the blessing and its two-line message, shown over
  the temple, `search_result`), then ovl17:069c and ovl61:0000(0, 0); 329 -> 07be:0928 ->
  ovl01:011b: ovl01:0d7a(0) (the assignment), ovl17:069c, then the quest page ovl01:0167
  (`quest`, on QuestAssigned).
Keys (07be:0064 with DS:166a set, `ui.keys.popup_key`): neither button is in DS:1514 / DS:155c,
so every key but 'A'..'Z' chords; a left press on 329 disabled chords (07be:0e7b).
"""
from __future__ import annotations

from ...assets.fonts import CHANCE17
from ...model import commands as C
from ...model import events as E
from ...model.ids import Control
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..layout import DISABLED, NORMAL
from ..widgets import ButtonRow, kit, text_centred
from .hero_offer import answer, raw, sprintf, wait
from .search_result import SHOWN, blessing_lines

POPUP, SCREEN = 9, 15
BLESS, QUEST = 328, 329
GROUP = 19
LINES = ((320, 270), (320, 290), (320, 310))
INK, SHADOW = 7, 6


class Temple(Dialog):
    def __init__(self, host, site: int, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        st = host.state
        name = st.sites[site].name
        self.lines = [sprintf(raw(k, GROUP, 0), name), raw(k, GROUP, 1), raw(k, GROUP, 2)]
        lay = k.layouts.screen(SCREEN)
        self.row = ButtonRow([lay.button(BLESS), lay.button(QUEST)], k.picture)
        ok = st.options.quests and not st.players[st.current].quest.active and st.selection.hero >= 0
        self.row.state[BLESS] = NORMAL
        self.row.state[QUEST] = NORMAL if ok else DISABLED

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, hit: int) -> bool:
        if hit == BLESS:                                   # ovl01:0132
            ev = answer(self.host, C.TempleChoice("bless"))
            b = next((x for x in ev or () if isinstance(x, E.Blessed)), None)
            if b is None:
                self.close(None)
                return True
            SHOWN.add(id(b))
            registry.open_dialog("message", self.host, lines=blessing_lines(self.k, b),
                                 on_close=lambda _: self.close(None))
            return True
        if hit == QUEST:                                  # ovl01:011b
            self.close(None)
            answer(self.host, C.TempleChoice("quest"))
            return True
        return False

    def draw(self, fb) -> None:
        k = self.k
        k.draw_popup(fb, POPUP)
        f = k.fonts[CHANCE17]
        for (x, y), s in zip(LINES, self.lines):
            text_centred(fb, f, x, y, s, INK, SHADOW)
        self.row.draw(fb)


@registry.dialog("temple")
def temple(host, site: int, on_close=None):
    return Temple(host, site, on_close)


@registry.event_view(E.SiteSearched)
def _temple(host, ev):
    if not ev.info.get("temple_menu") or host.state.players[host.state.current].control != Control.HUMAN:
        return None
    return wait(registry.open_dialog("temple", host, site=ev.info["site"]))
