"""The pre-game screens' common host (Game Start `menu`, Game Setup `setup`) and Quit.

Chord (ovl58:0b5f, `audio.effects.chord`) sites of the input dispatch:
* 07be:0e7b: a left press on a button that is disabled (state 2) or already pressed
  (state 0) (08a9:012c -> 07be:0e26, state from 08a9:05ab); the button ignores it;
* 07be:032c: a key the key dispatch 07be:0064 does not handle: not taken by the menu bar,
  not 'A'..'Z' (ignored at 07be:00bd), not ^W (07be:0430) and not one of the 46 codes of
  its switch table 07be:0337 (`KEY_CASES`).  Esc and Return first look for a live button
  of the lists DS:1514 / DS:155c (07be:00cc / 0104); no screen here has one, so they chord.
  Not modelled: the early exits on DS:166c / 1172 / 1174 / 1176 / 3700 (07be:006f..00a2).

Quit (menu id 505) is ovl49:0000 (07be:02ea): before a game (DS:2a86 = 0, set by
ovl61:0000) it calls ovl49:0072 at once, in a game it opens the confirmation ovl56:0088
with STRING (44, 0..4), whose yes is ovl49:0072 (stub 307f:007a).  ovl49:0072: the talking
face ovl58:026f(4), then the exit (0a4c:02b5).
"""
from __future__ import annotations

from typing import TYPE_CHECKING, Callable

import pygame

from ..audio import effects, voice
from ..model.newgame import NewGameConfig
from ..rules.rng import Rng
from ..ui import registry
from ..ui.layout import NORMAL
from ..ui.menubar import TitleBar, title_bar, with_codes
from ..ui.widgets import ButtonRow, draw_pointer, kit
from .base import BaseState

if TYPE_CHECKING:
    from ..ui.widgets import Kit

KEY_CASES = frozenset((0x08, 0x09, 0x11, 0x20, 0x2C, 0x2E, 0x35, 0x3D, 0x3F, *range(0x61, 0x7B),
                       0x112, 0x116, 0x11F, 0x126, 0x12C, 0x12D, 0x131, 0x132, 0x147, 0x14F, 0x153))
CTRL_W = 0x17
UPPER = range(0x41, 0x5B)
QUIT_SPEECH, QUIT_TEXT = 4, 44


def unbound_key(code: int) -> bool:
    """07be:0064 falls through to the chord at 07be:032c (the menu bar asked first)."""
    return code not in KEY_CASES and code != CTRL_W and code not in UPPER


def face(host, speech: int, roll: Callable[[int, int, int], int], then: Callable[[], None]) -> None:
    """ovl58:026f(speech): nothing when the talking advisor is off (ovl58:0293), else the
    face, whose rnd(1, 30, 10) (ovl58:094c) `roll` draws; `then()` follows the face."""
    if not voice.talking(host.app):
        return then()
    registry.open_dialog("voice_face", host, speech=speech, blink=roll(*voice.BLINK_ROLL),
                         on_close=lambda r: then())


@registry.action(registry.MENU_ID["quit"])
def quit_game(host) -> None:
    """ovl49:0000.  In a game the face's roll would come from the game's dice; it is drawn
    from a fresh Rng of the seed here (the game ends with it)."""
    def leave() -> None:
        host.app.running = False                         # 0a4c:02b5
    if isinstance(host, ScreenHost):
        return face(host, QUIT_SPEECH, host.roll, leave)
    text = kit(host.app).text.group(QUIT_TEXT)
    rng = Rng(host.app.cfg.seed, NewGameConfig.rng)
    registry.open_dialog("confirm", host, title=text[0], lines=text[1:5],
                         on_close=lambda yes: yes and face(host, QUIT_SPEECH, rng.rnd, leave))


class ScreenHost(BaseState):
    """A pre-game screen: its own drawing, the live buttons of one JOIN screen,
    the shared menu bar, the dialog stack and the pointer on top.

    While no dialog is open: a right press over a live button opens its help
    (`registry.right_click("button")`, ovl15:0000); a left press on a title opens its
    menu; the buttons take the mouse and a release over one runs `on_button`; keys go to
    the menu bar.  Events after the one that opened a dialog wait for the next frame.

    Entry (pgsm runs `on_enter` on its hook thread, so it only sets `entering`): the first
    `_kit` after it, from `paint` or `step`, runs `enter_screen` (state and button set-up
    only); the first `step` then runs `start_screen` (dialogs, loads), which `paint` never
    does."""

    screen_id: int = 0

    def __init__(self, app):
        super().__init__(app)
        self.bar: TitleBar | None = None
        self.buttons: ButtonRow | None = None
        self.hidden: set[int] = set()
        self.entering = self.starting = False

    def on_enter(self, frm: str, **kw) -> None:
        self.entering = self.starting = True

    def _kit(self) -> Kit:
        """Pictures and tables are built on first use, on the main thread (also from paint:
        building them opens no dialog and starts no load)."""
        k = kit(self.app)
        if self.bar is None:
            self.bar = title_bar(self.app)
            self.buttons = ButtonRow(list(k.layouts.screen(self.screen_id).buttons), k.picture)
            self._all = list(self.buttons.buttons)
        if self.entering:
            self.entering = False
            self.enter_screen(k)
        return k

    def enter_screen(self, k: Kit) -> None:
        """Entry set-up without dialogs or loads (may run from `paint`)."""

    def start_screen(self, k: Kit) -> None:
        """Entry dialogs and loads, run by the first `step` after `on_enter`."""

    def roll(self, dice: int, sides: int, add: int) -> int:
        """ovl59:02bf, the EXE's one roller, from this screen's dice."""
        raise NotImplementedError

    def face(self, speech: int, then: Callable[[], None]) -> None:
        """ovl58:026f(speech) rolling from this screen's dice, then `then()`."""
        face(self, speech, self.roll, then)

    def set_button(self, id: int, state: int) -> None:
        """08a9:066e: the button is live with this state."""
        self.hidden.discard(id)
        self.buttons.state[id] = state
        self._sync()

    def hide_button(self, id: int) -> None:
        """08a9:03b3: the button is neither drawn nor hit."""
        self.hidden.add(id)
        self._sync()

    def _sync(self) -> None:
        self.buttons.buttons = [b for b in self._all if b.id not in self.hidden]

    def step(self, events, dt):
        k = self._kit()
        if self.starting:
            self.starting = False
            self.start_screen(k)
            if self.dialogs:
                return
        for e, code in with_codes(events, self.app.input):
            if self.dialogs:
                return
            if e.type == pygame.MOUSEBUTTONDOWN and e.button == 3:
                b = self.buttons.at(e.pos)
                if b:
                    registry.right_click_handler("button")(self, b.id, e.pos)
            elif e.type == pygame.MOUSEBUTTONDOWN and e.button == 1 and self.bar.bar.press(self, e.pos):
                continue
            elif e.type in (pygame.MOUSEBUTTONDOWN, pygame.MOUSEBUTTONUP, pygame.MOUSEMOTION):
                if e.type == pygame.MOUSEBUTTONDOWN and e.button == 1:
                    b = self.buttons.at(e.pos)
                    if b and self.buttons.state[b.id] != NORMAL:
                        effects.chord(self.app)                  # 07be:0e7b
                hit = self.buttons.event(e)
                if hit is not None:
                    self.on_button(hit)
            elif code is not None:
                if not self.bar.bar.key(self, code) and unbound_key(code):
                    effects.chord(self.app)                      # 07be:032c

    def on_button(self, id: int) -> None:
        registry.run_action(id, self)

    def draw(self, s):
        """BaseState.draw, then the pointer above the dialogs."""
        super().draw(s)
        draw_pointer(self.app, s, self.dialogs)
