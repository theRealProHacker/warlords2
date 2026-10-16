"""Base of every pgsm state and the no-op loading state (docs/plan.md section 2.1).

pgsm runs `on_init`/`on_exit`/`on_enter` on a new thread, so hooks only assign plain
fields (no surface, mixer or file access) and must leave the state drawable: a newly
entered state is drawn once before its first `update`.  Transitions are recorded with
`request(name, **kw)` (hooks and dialog callbacks call it too) and performed by
`update` as its last statement, so pgsm's `exit()` only ever runs on the main thread,
at most once per frame (S9d).  Subclasses override `step` and `paint`, never `update`
or `draw`.
"""
from __future__ import annotations

from typing import TYPE_CHECKING, Any

import pygame
from StateManager import State

from ..ui.dialog import DialogStack

if TYPE_CHECKING:
    from ..app import App


def event_loop_idle(dialogs) -> bool:
    """No dialog, or the top one waits in the event loop 08a9:000e (`Dialog.event_loop`), whose
    idle pass 0081 polls the music (155e:02ab) before the DS:166a test at 0086."""
    top = dialogs.top
    return top is None or bool(getattr(top, "event_loop", False))


def music_poll(app, where: str) -> None:
    p = getattr(app, "music_player", None)
    if p is not None:
        p.poll(where)


class NoLoading:
    """pgsm loading state that does nothing: the default `LoadingState()` needs a display
    and `SysFont` (S9a), and pgsm calls it as `update(dt, state)` (S9b)."""

    def update(self, dt: float, state: State) -> None:
        pass

    def draw(self, s: pygame.Surface) -> None:
        pass


class BaseState(State):
    def __init__(self, app: App):
        self.app = app
        self.dialogs = DialogStack()
        self._request: tuple[str, dict[str, Any]] | None = None

    def on_enter(self, frm: str, **kw) -> None:
        pass

    def on_exit(self, to: str) -> None:
        pass

    def request(self, name: str, **kw) -> None:
        """Ask for a transition at the end of this frame's update; one per frame.

        Only the current state may ask.  pgsm makes the target current before it runs
        the old state's `on_exit`, so a request from a leaving state's `on_exit` raises
        here instead of firing on its next visit; `update`, dialog callbacks and the
        target's `on_enter` are all current.  A same-object transition (`game -> game`)
        cannot be told apart: its `on_exit` request is the next frame's transition."""
        if self.manager.current_state() is not self:
            raise RuntimeError(f"transition request {name!r} from {type(self).__name__}, "
                               f"which is not the current state")
        if self._request is not None:
            raise RuntimeError(f"second transition request in one frame: {self._request[0]!r}, then {name!r}")
        self._request = (name, kw)

    def update(self, events: list[pygame.event.Event], dt: float) -> None:
        if self.music_idle():
            music_poll(self.app, "idle")
        if self.dialogs:
            self.dialogs.update(events, dt)
        else:
            self.step(events, dt)
        if self._request is not None:
            name, kw = self._request
            self._request = None
            target = self.manager[name] if name in self.manager.states else None
            if isinstance(target, BaseState):
                target._request = None          # nothing left over from an earlier visit
            self.exit(name, **kw)

    def draw(self, s: pygame.Surface) -> None:
        self.paint(s)
        self.dialogs.draw(s)

    def music_idle(self) -> bool:
        """This frame is an idle pass of the event loop 08a9:0081, where the music poller
        155e:02ab runs (M10c, `audio.music`): never by default."""
        return False

    def step(self, events: list[pygame.event.Event], dt: float) -> None:
        """Per-frame logic while no dialog is open."""

    def paint(self, fb: pygame.Surface) -> None:
        """Draw the state onto the indexed framebuffer (the dialogs follow)."""
