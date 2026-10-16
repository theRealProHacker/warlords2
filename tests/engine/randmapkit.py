"""Scripted dice for the random-map generator tests (M11, packages R0-R3).

`ScriptedRng(script)` stands in for `rules.rng.Rng`: every `rnd(dice, sides, add)` call must
match the next script entry, and returns its value.  An entry is

* `(sides, add, value)` for a one-die call rnd(1, sides, add), or
* `(dice, sides, add, value)` for any call (e.g. the gold roll rnd(3, 50, 20)).

A mismatch, an extra call or a value the real roller cannot return raises `DiceMismatch`
naming the call's index; `assert_done()` checks the script was used up.  A call with
sides == 0 is still a call of ovl59:02bf (ovl02:04ae always makes five), so it has an entry
too; its value must be `add` (the roller returns add without a draw).  `calls` records
(dice, sides, add, value) of every call made.

`RecordingRng(rng)` wraps a real roller and records the same tuples, for order checks over
whole runs.

Usage (R1-R3):

    from randmapkit import ScriptedRng, blank_work
    w = blank_work(ScriptedRng([(3, -2, 1), (16, 0, 5), (3, -2, -1), (16, 0, 2), (100, 0, 50)]))
    ...
    w.rng.assert_done()
"""
from __future__ import annotations

from warlords2.rules.randmap import RandomRun, Work
from warlords2.rules.randmap.buffer import Buffer


class DiceMismatch(AssertionError):
    pass


def _possible(dice: int, sides: int, add: int, value: int) -> bool:
    """Can ovl59:02bf(dice, sides, add) return `value`?  (rules.rng.Rng.rnd semantics.)"""
    if sides == 0:
        return value == add
    if sides > 0:
        return dice + add <= value <= dice * sides + add
    return value in (dice + add, dice * sides + add)


class ScriptedRng:
    def __init__(self, script):
        self.script = [tuple(e) if len(e) == 4 else (1, *e) for e in script]
        for i, e in enumerate(self.script):
            if len(e) != 4:
                raise ValueError("script entry %d: %r" % (i, e))
            if not _possible(*e):
                raise DiceMismatch("script entry %d: rnd%r cannot return %r" % (i, e[:3], e[3]))
        self.calls: list[tuple[int, int, int, int]] = []

    def rnd(self, dice: int, sides: int, add: int) -> int:
        i = len(self.calls)
        if i >= len(self.script):
            raise DiceMismatch("call %d: rnd(%d, %d, %d) after the script ended" % (i, dice, sides, add))
        e = self.script[i]
        if e[:3] != (dice, sides, add):
            raise DiceMismatch("call %d: rnd(%d, %d, %d), script expects rnd%r"
                               % (i, dice, sides, add, e[:3]))
        self.calls.append(e)
        return e[3]

    @property
    def left(self) -> int:
        return len(self.script) - len(self.calls)

    def assert_done(self) -> None:
        if self.left:
            raise DiceMismatch("%d scripted calls not made, next rnd%r"
                               % (self.left, self.script[len(self.calls)][:3]))


class RecordingRng:
    def __init__(self, rng):
        self.rng = rng
        self.calls: list[tuple[int, int, int, int]] = []

    def rnd(self, dice: int, sides: int, add: int) -> int:
        v = self.rng.rnd(dice, sides, add)
        self.calls.append((dice, sides, add, v))
        return v

    def state(self):
        return self.rng.state()


def _no_files(rel):
    raise FileNotFoundError(rel)


def blank_work(rng, data: bytes | None = None, run: RandomRun | None = None, read=_no_files) -> Work:
    """A `Work` over a zero (or `data`) buffer: for hand-built grids and header words."""
    return Work(Buffer(data), rng, run or RandomRun(), read)
