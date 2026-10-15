"""Present points: where the original draws or waits during a main-loop run (docs/plan.md M8b1
UI; EL addition "M8b UI").

The engine calls `present(point, **info)` at the places where the EXE draws the screen or waits
(the computer turn's announcement and progress bar, a computer stack's step, the AI's battle,
the timed messages, ...).  Without a presenter it does nothing and returns None, so the engine,
its tests and every replay run exactly as before.  `states.runner.Runner` runs a main-loop run on
its own thread and attaches a presenter for that thread only: the engine thread then waits in
`present` until the user interface has drawn the point from the state as it is at that moment
(read only) and lets it go on.  The user interface never runs while the engine runs and vice
versa, so neither needs a lock.

A presenter's return value is the answer of a point that reads the hardware (ovl25:045e: Alt or
Shift held); with no presenter that answer is None (no key held).  `info` carries only what the
state does not hold (texts, the gates the routine computed, the battle's duel list); the drawing
reads the rest from the state.
"""
from __future__ import annotations

import threading
from typing import Any, Callable

_presenters: dict[threading.Thread, Callable[[str, dict], Any]] = {}


def present(point: str, **info) -> Any:
    """A drawing / waiting point of the original (no-op without a presenter on this thread).
    Evidence: no game rule; the points are the EXE's draw and wait calls named at each caller."""
    fn = _presenters.get(threading.current_thread()) if _presenters else None
    if fn is None:
        return None
    return fn(point, info)


def attach(thread: threading.Thread, fn: Callable[[str, dict], Any]) -> None:
    """Present the points `thread` reaches through `fn(point, info)`.
    Evidence: no game rule (presentation plumbing)."""
    _presenters[thread] = fn


def detach(thread: threading.Thread) -> None:
    """Stop presenting the points of `thread`.
    Evidence: no game rule (presentation plumbing)."""
    _presenters.pop(thread, None)
