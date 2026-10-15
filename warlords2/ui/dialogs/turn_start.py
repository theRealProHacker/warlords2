"""The "Turn %d" pop-up at a human side's turn start, and the presentation of the other turn-start
cues (the talking advisor's remark, the turn-1 production screen).

Evidence (asm ovl68:03a9..0444, inside ovl68:0259):
* ovl17:0000(6): popup type 6 (picture 28, rectangle DS:06a8 + 6*8) with the type's extra frame
  (ovl17:0200..04e7), drawn into the picture at its (0, 0): outlines (0, 0, w, h) and (10, 10,
  w - 20, h - 20) in SCN 0x0b0[0x110] (1012:0bb7 / 0f08 lines), then the bands (1, 1, w - 2, 9),
  (1, 1, 9, h - 2), (1, h - 10, w - 2, 9), (w - 10, 1, 9, h - 2) filled with SCN 0x0a0[0x110]
  (14d0:0497); then the common outline and shadow of every popup (`Kit.draw_popup`);
* ovl50:06ae(1, 15, 0, 3) = SetFont(1, 15, 0, 3); the side's name (SCN 0x000 + 0x14 p) centred
  at (320, 0x55) (ovl59:00d6), "Turn %d" (DS:3263, read from the EXE) with ovl61:225b() =
  max(turn, 1) centred at (320, 0x82);
* ovl58:0b93 turn sound (`audio.effects`, on TurnStarted), ovl59:01f1 (input flushed: the
  dialog sees only later events), DS:166a = 1 while ovl59:0142 waits for mask 0xd4 (a mouse
  release or a key, `is_dismiss`), then ovl17:069c closes it; 155e:0736 waits for the end of
  the turn sample (`audio.effects.length`, counted in logical frames from the start of the
  sample with the pop-up), and only then does the turn start go on (ovl68:0444: with the map
  held back, `Game.turn_popup_closed`).
DS:166a set = the frame freeze of a modal pop-up (08a9:0086 skips the selection frame, 07be:00a9
the menu keys, 08a9:08cc the arrow pointer): here the dialog stack, which stops the phase and
the menu keys (`states.game.dialog_pointer`).

The other cues (`TurnCue`, rules/turn.py): "advice" -> the talking advisor's face ovl58:026f(5)
(`voice_face` with the remark's FILE.DAT entry and blink roll); "city_screen" -> the production
screen ovl45:0000(2, capital) of turn 1, M6b's dialog "production" when registered (until then
logged and left out); "info_bar" -> ovl66:0356 at ovl68:05a8 (`Game.info_bar_drawn`).  The
tutorial pages are `ui.tutorial`.
"""
from __future__ import annotations

import logging

import pygame

from ...assets.exe import ds_str
from ...assets.fonts import CHANCE36
from ...model import events as E
from .. import registry
from ..dialog import Dialog
from ..widgets import is_dismiss, kit, text_centred

log = logging.getLogger(__name__)

POPUP = 6
NAME_AT, TURN_AT = (0x140, 0x55), (0x140, 0x82)
TURN_FMT = 0x3263
INK, SHADOW = 15, 0
SCN_INK, SCN_SHADOW = 0xA0, 0xB0                 # SCN words [p]: the side's colours
FRAME_INSET, BAND = 10, 9
ADVICE_SPEECH = 5                                # ovl58:026f(5) at ovl68:04ab
PRODUCTION_OWN = 2                               # ovl45:0000(2, x, y) at ovl68:0588


def side_frame(fb: pygame.Surface, k, state, t: int = POPUP) -> None:
    """ovl17:0200..04e7: the frame of popup type 6 in the colours of the side on turn."""
    x, y, w, h = k.popup_rect[t]
    p = state.current
    line = state.flags.get(SCN_SHADOW + 2 * p, 0)
    fill = state.flags.get(SCN_INK + 2 * p, 0)
    for rx, ry, rw, rh in ((0, 0, w, h), (FRAME_INSET, FRAME_INSET, w - 2 * FRAME_INSET, h - 2 * FRAME_INSET)):
        pygame.draw.rect(fb, line, (x + rx, y + ry, rw, rh), 1)
    for rx, ry, rw, rh in ((1, 1, w - 2, BAND), (1, 1, BAND, h - 2), (1, h - 1 - BAND, w - 2, BAND),
                           (w - 1 - BAND, 1, BAND, h - 2)):
        fb.fill(fill, (x + rx, y + ry, rw, rh))


def turn_number(state) -> int:
    """ovl61:225b: max(SCN 0x135, 1)."""
    return max(state.turn, 1)


class TurnStart(Dialog):
    def __init__(self, k, state, on_close=None):
        super().__init__(on_close)
        self.kit = k
        self.name = state.players[state.current].name
        self.turn = ds_str(k.exe, TURN_FMT) % turn_number(state)
        self.state = state

    def update(self, events, dt) -> None:
        if any(is_dismiss(e) for e in events):
            self.close(None)

    def draw(self, fb) -> None:
        k = self.kit
        x, y, w, h = k.popup_rect[POPUP]
        k.draw_popup(fb, POPUP)
        side_frame(fb, k, self.state)
        font = k.fonts[CHANCE36]
        text_centred(fb, font, *NAME_AT, self.name, INK, SHADOW)
        text_centred(fb, font, *TURN_AT, self.turn, INK, SHADOW)


@registry.dialog("turn_start")
def turn_start(host, on_close=None):
    return TurnStart(kit(host.app), host.state, on_close)


def _wait(host, d):
    while d.stack is not None:
        yield None


@registry.event_view(E.TurnStarted)
def _announce(host, ev):
    """ovl68:03a9..0444 for a human side (the computer turn's announcement ovl68:011a is a
    message box of M8b1's computer phase)."""
    if not ev.info.get("human"):
        return None
    from ...audio import effects
    n = effects.length(host.app, "turn")           # ovl58:0b93 started it this frame
    d = registry.open_dialog("turn_start", host)
    return _popup(host, d, n)


def _popup(host, d, sample: int):
    k = 0
    while d.stack is not None:
        k += 1
        yield None
    for _ in range(sample - k):                    # 155e:0736
        yield None
    fn = getattr(host, "turn_popup_closed", None)
    if fn is not None:
        fn()


@registry.event_view(E.TurnCue)
def _cue(host, ev):
    kind = ev.info.get("kind")
    if kind == "advice":
        d = registry.open_dialog("voice_face", host, speech=ADVICE_SPEECH, blink=ev.info["blink"],
                                 file=tuple(ev.info["file"]))
        return _wait(host, d)
    if kind == "info_bar":
        fn = getattr(host, "info_bar_drawn", None)
        if fn is not None:
            fn()
        return None
    if kind == "city_screen":
        if registry.has_dialog("production"):
            d = registry.open_dialog("production", host, city=ev.info["city"], mode=PRODUCTION_OWN)
            return _wait(host, d)
        log.warning("turn 1 production screen ovl45:0000(2, capital) of city %s: dialog 'production' "
                    "(M6b) not implemented; not shown", ev.info["city"])
    return None
