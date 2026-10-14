"""Modal dialogs as an in-state stack (docs/plan.md section 2.3).

Dialogs are not pgsm states.  Input goes to the top dialog only; the host state draws
itself, then the stack bottom-up.  A dialog returns a value through `close(result)`,
which calls `on_close(result)` (where the answering command or `request` is issued).
"""
from __future__ import annotations

from typing import Any, Callable

import pygame


class Dialog:
    def __init__(self, on_close: Callable[[Any], None] | None = None):
        self.on_close = on_close
        self.stack: DialogStack | None = None

    def update(self, events: list[pygame.event.Event], dt: float) -> None:
        """Called only while this dialog is on top."""

    def draw(self, fb: pygame.Surface) -> None:
        """Draw onto the indexed framebuffer."""

    def close(self, result: Any = None) -> None:
        """Leave the stack and report `result`; closing a closed dialog does nothing."""
        if self.stack is None:
            return
        self.stack.remove(self)
        if self.on_close:
            self.on_close(result)


class DialogStack:
    def __init__(self):
        self._items: list[Dialog] = []

    def __len__(self) -> int:
        return len(self._items)

    def __iter__(self):
        return iter(list(self._items))

    @property
    def top(self) -> Dialog | None:
        return self._items[-1] if self._items else None

    def push(self, d: Dialog) -> Dialog:
        d.stack = self
        self._items.append(d)
        return d

    def remove(self, d: Dialog) -> None:
        self._items.remove(d)
        d.stack = None

    def update(self, events: list[pygame.event.Event], dt: float) -> None:
        if self._items:
            self._items[-1].update(events, dt)

    def draw(self, fb: pygame.Surface) -> None:
        for d in list(self._items):
            d.draw(fb)
