"""The Military Advisor: a click with the question-mark cursor (Shift over an attack target).

Evidence (asm ovl36:1f19..2064; positions are immediates of the asm):
* ovl46:0162 (cursor 9) -> ovl36:1f19(x, y): nothing with the Military Advisor option off
  (SCN 0x12c == 0); else popup type 12 (DS:06a8: (176, 60, 288, 300), marble), SetFont(1, 15,
  0, 3) STRING (0x7b, 0) centred at (0x140, 0x43); screen 25 (BUTTON.DAT: 424), DS:166a = 1;
  advisor.pck (picture 48) (0, 0, 0x80, 0x82) opaque (0997:0129) at (0x100, 0x75); 424 normal;
  r = ovl36:2065(x, y) (`rules.combat.odds`: 19 trial battles of the current selection on the
  game's dice, count / 2); SetFont(2, 15, 0, 3) (0x7c, rnd) at (0x140, 0x102), (0x7d, rnd) at
  (0x140, 0x116) - ovl59:04f0 index -1 = ovl59:02bf(1, n, -1) on the game's dice, after the
  trials -, and (0x7e, r) at (0x140, 0x12a): the verdict is the group entry r itself, 0..9
  (closes R27b: no thresholds, `odds` counts the 19 trials with an attacker survivor, signed
  DS:4132 > 0, and halves).  The pop-up stays; 424 (07be:0a36 -> ovl36:2050) closes it
  (ovl17:069c) and ovl61:0000(0, 0) redraws the game screen (the palette refresh here).
  Return and Esc press 424 (DS:155c / DS:1514 hold it); 'A'..'Z' nothing; every other key,
  Del included, the chord (07be:0064 with DS:166a set, `ui.keys`).  A right press over 424
  opens its HLP record (ovl15:0000).
* The trial set-up ovl38:008b takes the selection (`rules.combat.selection_group`).

The trials and the two text rolls are the engine's: the click issues `Advise(x, y)`
(rules.advisor.advise; nothing comes back with the option off, no dice then) and the pop-up
draws its `Advised` event (verdict, texts).
"""
from __future__ import annotations

from ...assets.fonts import CHANCE17, CHANCE36
from ...model import commands as C
from ...model import events as E
from .. import registry
from ..dialog import Dialog
from ..keys import popup_input
from ..widgets import ButtonRow, blit_opaque, kit, text_centred
from ...assets.store import cache_load

POPUP, SCREEN, CLOSE = 12, 25, 424
PICTURE, PICTURE_SRC, PICTURE_AT = 48, (0, 0, 0x80, 0x82), (0x100, 0x75)
TITLE, ADDRESS, LEAD, VERDICT = 0x7B, 0x7C, 0x7D, 0x7E
X, TITLE_Y, ADDRESS_Y, LEAD_Y, VERDICT_Y = 0x140, 0x43, 0x102, 0x116, 0x12A
INK, SHADOW = 15, 0


class Advisor(Dialog):
    event_loop = True                  # buttons by 07be:04d8 / 0064 from the event loop 08a9:000e (its 0081 polls 155e:02ab)
    def __init__(self, host, event, on_close=None):
        super().__init__(on_close)
        self.host = host
        k = self.k = kit(host.app)
        cache_load(k, 48)                               # ADVISOR.PCK: ovl36:1fb5 0129 (X44)
        self.row = ButtonRow([b for b in k.layouts.screen(SCREEN).buttons if b.id == CLOSE], k.picture)
        info = event.info
        self.verdict = info["verdict"]                               # ovl36:1fd3
        texts = info["texts"]                                        # ovl36:1ff0 / 200e
        T = k.text
        self.title = T.S(TITLE, 0)
        self.lines = [(ADDRESS_Y, T.S(ADDRESS, texts[0])),
                      (LEAD_Y, T.S(LEAD, texts[1])),
                      (VERDICT_Y, T.S(VERDICT, self.verdict))]

    def update(self, events, dt) -> None:
        popup_input(self, events, self.row, self.k.exe, self.press)

    def press(self, id: int) -> None:
        if id == CLOSE:
            self.close(self.verdict)                                 # ovl36:2050
            refresh = getattr(getattr(self.host, "phase", None), "refresh", None)
            if refresh is not None:
                refresh()

    def draw(self, fb) -> None:
        k = self.k
        k.draw_popup(fb, POPUP)
        text_centred(fb, k.fonts[CHANCE36], X, TITLE_Y, self.title, INK, SHADOW)
        blit_opaque(fb, k.picture(PICTURE), PICTURE_AT, PICTURE_SRC)
        self.row.draw(fb)
        f = k.fonts[CHANCE17]
        for y, s in self.lines:
            text_centred(fb, f, X, y, s, INK, SHADOW)


@registry.dialog("advisor")
def advisor(host, event, on_close=None):
    return Advisor(host, event, on_close)


@registry.left_click("advisor")
def advise(host, square, mode):
    """ovl46:0162 -> ovl36:1f19(x, y): the command `Advise`; its `Advised` event opens the pop-up
    (no event with the Military Advisor option off, SCN 0x12c)."""
    cmd = C.Advise(square[0], square[1])
    apply = getattr(getattr(host, "phase", None), "apply", None)
    events = apply(cmd) if apply is not None else host.command(cmd)
    ev = next((e for e in events or () if isinstance(e, E.Advised)), None)
    if ev is None:
        return None
    return registry.open_dialog("advisor", host, event=ev)
