"""A main-loop run on its own thread, paused at every present point (`rules.present`).

The user interface calls `resume()`: the engine thread runs until its next present point and
`resume` returns that point (name, info), or None once the run has returned (`result`).  Both
threads hand over through two semaphores, so exactly one of them runs at any time: while
`resume` waits the engine runs, while the engine waits in `present` the user interface runs and
may read the state (it must not change it).  Settings commands are applied only after the run
has returned (the dialog takes no input while the engine runs on under it, `Game.update`), as
the original's dialog is used only after the loop stopped (ovl61:220b).  An exception of the
run is raised by the `resume` that would have returned its next point.

`abandon()` (the game or the app closes during a run) makes the parked engine thread leave
through `Abandoned` (a BaseException, so no engine `except Exception` keeps it) and waits for it.
"""
from __future__ import annotations

import threading

from ..rules import present as PR


class Abandoned(BaseException):
    """Raised inside the engine thread at its present point when the run is abandoned."""


class Runner:
    def __init__(self, fn):
        self.fn = fn
        self._go = threading.Semaphore(0)            # user interface -> engine
        self._back = threading.Semaphore(0)          # engine -> user interface
        self.thread = threading.Thread(target=self._main, name="engine-run", daemon=True)
        self.started = self.done = self.abandoned = False
        self.point: tuple[str, dict] | None = None
        self.reply = None
        self.result = None
        self.error: BaseException | None = None

    # ---------------------------------------------------------------- engine thread

    def _main(self) -> None:
        self._go.acquire()
        PR.attach(self.thread, self._present)
        try:
            if self.abandoned:
                raise Abandoned()
            self.result = self.fn()
        except Abandoned:
            pass
        except BaseException as e:                   # handed to the user interface
            self.error = e
        finally:
            PR.detach(self.thread)
            self.done = True
            self._back.release()

    def _present(self, point: str, info: dict):
        self.point = (point, info)
        self._back.release()
        self._go.acquire()
        if self.abandoned:
            raise Abandoned()
        reply, self.reply = self.reply, None
        return reply

    # ---------------------------------------------------------------- user interface thread

    def resume(self, reply=None) -> tuple[str, dict] | None:
        """Let the engine run to its next present point (answering the current one with
        `reply`); None when the run has returned."""
        if self.done:
            return None
        self.reply = reply
        if not self.started:
            self.started = True
            self.thread.start()
        self._go.release()
        self._back.acquire()
        if self.done:
            if self.error is not None:
                e, self.error = self.error, None
                raise e
            return None
        p, self.point = self.point, None
        return p

    def abandon(self) -> None:
        """End a parked run without going on (the game or the app is closing).  The engine code
        on the way out sees `Abandoned`: `rules.engine.apply` restores the state from before the
        command (End Turn), a bare `rules.turn.run` leaves it as the run left it."""
        if self.done:
            return
        self.abandoned = True
        if not self.started:
            self.done = True
            return
        self._go.release()
        self._back.acquire()
        self.thread.join(timeout=5)
