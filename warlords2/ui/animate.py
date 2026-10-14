"""Event animator: presents the events of an applied command one after the other.

The engine applies a command at once; what the original shows while it runs (a stack walking
square by square, ...) is replayed here from the events.  For each event in order the sound
handlers (`registry.event_sounds`) run when its presentation starts, then every registered view
(`registry.event_view`) as `fn(host, event)`; a view returns an iterator (one item per logical
frame it keeps the screen) or None.  While anything is playing the host draws `scene` (a copy of
the state as it was before the command, which the views move along; the real state is never
touched) and takes no input.

Timing: the original's waits count BIOS timer ticks (INT 1Ah, 65536 / 1193182 s; ovl59:0000, the
step wait of 0a8b:04c8, the selection-frame phase 077b:011f, the double click 0b62:0405);
`frames` / `ticks_at` are the one place they meet logical frames at --tick-hz
(`ui.widgets.tick_frames`, register X05).
"""
from __future__ import annotations

from collections import deque
from fractions import Fraction

from ..audio.voice import TICK_HZ
from . import registry
from .widgets import tick_frames


def frames(app, ticks: int, elapsed: int = 0) -> int:
    """Logical frames of a wait of `ticks` BIOS ticks that begins `elapsed` ticks into its
    sequence."""
    return tick_frames(ticks, app.cfg.tick_hz, elapsed)


def ticks_at(app, frame: int) -> int:
    """BIOS ticks passed by logical frame `frame` (frame 0 on a tick boundary)."""
    return int(frame * Fraction(TICK_HZ) / app.cfg.tick_hz)


def wait(app, ticks: int, elapsed: int = 0):
    """A view's pause of `ticks` BIOS ticks (at least one frame)."""
    for _ in range(max(1, frames(app, ticks, elapsed))):
        yield None


class Animator:
    def __init__(self, host):
        self.host = host
        self.queue: deque = deque()
        self.views: list = []
        self.scene = None

    @property
    def busy(self) -> bool:
        return bool(self.queue or self.views)

    def play(self, events, before) -> None:
        """Queue the events of one command; `before` is a copy of the state before it."""
        if not self.busy:
            self.scene = before
        self.queue.extend(events)
        self.step()

    def step(self) -> None:
        """Advance one logical frame."""
        while True:
            while self.views:
                try:
                    next(self.views[0])
                    return
                except StopIteration:
                    self.views.pop(0)
            if not self.queue:
                self.scene = None
                return
            ev = self.queue.popleft()
            for fn in registry.event_sounds(type(ev)):
                fn(self.host, ev)
            for fn in registry.event_views(type(ev)):
                it = fn(self.host, ev)
                if it is not None:
                    self.views.append(iter(it))
