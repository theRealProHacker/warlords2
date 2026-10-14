"""Input state built from events only (docs/plan.md section 1.4).

Buttons come from MOUSEBUTTONDOWN/UP, modifiers from KEYDOWN/KEYUP of the modifier keys,
text from KEYDOWN.unicode without control characters.  Never `event.buttons`, `event.mod`, `pygame.key.get_mods()` or
`pygame.mouse.get_pressed()`: scripted events posted into the queue carry no such state.
Window pixels become logical 640x480 pixels by integer division by the window scale; a
motion's `rel` is the change of the logical position (`event.rel` is never read: scripted
motions may lack it, and window deltas divided by the scale are not logical deltas).
Losing the window focus releases every held button, key and modifier, since their UP
events go to another window.
"""
from __future__ import annotations

import unicodedata

import pygame

MODIFIERS = {
    pygame.K_LALT: "alt", pygame.K_RALT: "alt",
    pygame.K_LSHIFT: "shift", pygame.K_RSHIFT: "shift",
    pygame.K_LCTRL: "ctrl", pygame.K_RCTRL: "ctrl",
}
MOUSE_EVENTS = (pygame.MOUSEBUTTONDOWN, pygame.MOUSEBUTTONUP, pygame.MOUSEMOTION)


class Input:
    def __init__(self, scale: int):
        self.scale = scale
        self.pos = (0, 0)                  # logical px
        self.buttons: set[int] = set()     # held mouse buttons (1 left, 2 middle, 3 right)
        self.keys: set[int] = set()        # held keys
        self.drag_start: tuple[int, int] | None = None   # logical px of the first held button
        self.text = ""                     # typed this frame
        self._mods: set[int] = set()       # held modifier keys (left and right counted apart)

    def _held(self, kind: str) -> bool:
        return any(MODIFIERS[k] == kind for k in self._mods)

    @property
    def alt(self) -> bool:
        return self._held("alt")

    @property
    def shift(self) -> bool:
        return self._held("shift")

    @property
    def ctrl(self) -> bool:
        return self._held("ctrl")

    @property
    def dragging(self) -> bool:
        return self.drag_start is not None and self.pos != self.drag_start

    def logical(self, pos: tuple[int, int]) -> tuple[int, int]:
        return pos[0] // self.scale, pos[1] // self.scale

    def feed(self, events: list[pygame.event.Event]) -> list[pygame.event.Event]:
        """Update the state from this frame's events; returns them with mouse positions
        (and motion deltas) in logical px, for the states."""
        self.text = ""
        out = []
        for e in events:
            if e.type in MOUSE_EVENTS:
                pos = self.logical(e.pos)
                d = dict(e.dict, pos=pos)
                if e.type == pygame.MOUSEMOTION:
                    d["rel"] = (pos[0] - self.pos[0], pos[1] - self.pos[1])
                e = pygame.event.Event(e.type, d)
                self.pos = e.pos
                if e.type == pygame.MOUSEBUTTONDOWN:
                    if not self.buttons:
                        self.drag_start = e.pos
                    self.buttons.add(e.button)
                elif e.type == pygame.MOUSEBUTTONUP:
                    self.buttons.discard(e.button)
                    if not self.buttons:
                        self.drag_start = None
            elif e.type == pygame.KEYDOWN:
                self.keys.add(e.key)
                if e.key in MODIFIERS:
                    self._mods.add(e.key)
                self.text += "".join(c for c in getattr(e, "unicode", "")
                                     if unicodedata.category(c) != "Cc")
            elif e.type == pygame.KEYUP:
                self.keys.discard(e.key)
                self._mods.discard(e.key)
            elif e.type == pygame.WINDOWFOCUSLOST:
                self.buttons.clear()
                self.keys.clear()
                self._mods.clear()
                self.drag_start = None
            out.append(e)
        return out
