"""The game's dice roller with a seeded generator (EL §2; plan register X06).

The roller is `rnd(dice, sides, add)` of ovl59:02bf.  The die source is either Python's
`random.Random` (default: distribution-equivalent, uniform 1..sides) or `BorlandRand`,
the C library generator of the executable, which reproduces the original sequence exactly
except for the x87 rounding caveat noted on `BorlandRand.die`.
"""
from __future__ import annotations

import random

from .constants import Const

LCG_MUL = Const(0x015A4E35, "EL §2 0000:200a rand(): seed = seed*0x015A4E35 + 1")
LCG_ADD = Const(1, "EL §2 0000:200a")
RAND_MAX = Const(0x7FFF, "EL §2 0000:200a: result (seed >> 16) & 0x7fff")
DIE_DIVISOR = Const(32767.0, "EL §2 ovl59:02f5..031e; float constant at DS:2690 (bytes 00 fe ff 46)")


class PyDice:
    """Uniform 1..sides from random.Random."""

    def __init__(self, seed: int):
        self.r = random.Random(seed)

    def die(self, sides: int) -> int:
        """Uniform 1..sides.
        Evidence: distribution of the ovl59:02f5 die (EL §2); sequence not the original's (X06)."""
        return self.r.randint(1, sides)

    def state(self) -> dict:
        """Serialisable generator state.
        Evidence: plan §1.3 serialisation; no game rule."""
        v, internal, gauss = self.r.getstate()
        return {"source": "python", "version": v, "internal": list(internal), "gauss": gauss}

    def set_state(self, d: dict) -> None:
        """Restore `state()` output.
        Evidence: plan §1.3 serialisation; no game rule."""
        self.r.setstate((d["version"], tuple(d["internal"]), d["gauss"]))


class BorlandRand:
    """Borland C++ rand()/srand() as linked into WARLORD2.EXE (EL §2)."""

    def __init__(self, seed: int):
        self.seed = seed & 0xFFFF            # srand(s): seed = s, high word 0 (0000:1ff9)

    def rand(self) -> int:
        """Next 15-bit value.
        Evidence: EL §2, 0000:200a."""
        self.seed = (self.seed * LCG_MUL.value + LCG_ADD.value) & 0xFFFFFFFF
        return (self.seed >> 16) & RAND_MAX.value

    def die(self, sides: int) -> int:
        """trunc(rand() / 32767.0 * sides + 1) (ovl59:02f5..031e); 0000:1b57 truncates
        (rounding control set to chop before fistp).  The EXE evaluates this on the x87 in
        extended precision, here in double: results can differ where rand()*sides is a
        multiple of 32767 (plan register X27).
        Evidence: EL §2, ovl59:02f5..031e and 0000:1b57."""
        return int(self.rand() / DIE_DIVISOR.value * sides + 1)

    def state(self) -> dict:
        """Serialisable generator state.
        Evidence: plan §1.3 serialisation; no game rule."""
        return {"source": "borland", "seed": self.seed}

    def set_state(self, d: dict) -> None:
        """Restore `state()` output.
        Evidence: plan §1.3 serialisation; no game rule."""
        self.seed = d["seed"]


_SOURCES = {"python": PyDice, "borland": BorlandRand}


class Rng:
    def __init__(self, seed: int, source: str = "python"):
        if source not in _SOURCES:
            raise ValueError("unknown die source %r (python, borland)" % (source,))
        self.src = _SOURCES[source](seed)

    def rnd(self, dice: int, sides: int, add: int) -> int:
        """`add` + sum of `dice` dice of 1..sides, clamped to [dice+add, dice*sides+add];
        `sides == 0` returns `add` without rolling.
        Evidence: EL §2, ovl59:02bf."""
        if sides == 0:
            return add
        total = sum(self.src.die(sides) for _ in range(dice)) + add
        return max(dice + add, min(total, dice * sides + add))

    def state(self) -> dict:
        """Serialisable state of the die source.
        Evidence: plan §1.3 serialisation; no game rule."""
        return self.src.state()

    @classmethod
    def from_state(cls, d: dict) -> Rng:
        """Rebuild an Rng from `state()` output.
        Evidence: plan §1.3 serialisation; no game rule."""
        r = cls.__new__(cls)
        r.src = _SOURCES[d["source"]].__new__(_SOURCES[d["source"]])
        if d["source"] == "python":
            r.src.r = random.Random()
        r.src.set_state(d)
        return r
