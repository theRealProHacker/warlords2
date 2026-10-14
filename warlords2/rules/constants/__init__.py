"""Rule constants with their evidence (docs/plan.md section 0, "Nothing silently defaulted").

`Const(value, evidence)` is a verified number.  `Unverified(name, row, provisional,
evidence)` is a value or behaviour that is not verified: reading `.value` raises
`UnverifiedError` unless unverified values were allowed (`--allow-unverified`, via
`set_allow_unverified(True)`), in which case each read logs a warning and returns
`provisional`.  `row` names the plan section-5 register row that has to close.

The allow switch is a process-wide policy set once at start-up (or by a test with
`allowing_unverified()`); it is not game state.
"""
from __future__ import annotations

import logging
from contextlib import contextmanager
from dataclasses import dataclass
from typing import Any

log = logging.getLogger(__name__)
_allow = False


class UnverifiedError(RuntimeError):
    pass


@dataclass(frozen=True)
class Const:
    value: Any
    evidence: str


@dataclass(frozen=True)
class Unverified:
    name: str
    row: str
    provisional: Any = None
    evidence: str = ""

    @property
    def value(self) -> Any:
        """The provisional value, only when unverified values are allowed.
        Evidence: plan §0 "Nothing silently defaulted"; no game rule."""
        if not _allow:
            raise UnverifiedError("%s is unverified (register row %s); run with --allow-unverified"
                                  % (self.name, self.row))
        log.warning("using unverified %s (row %s): %r", self.name, self.row, self.provisional)
        return self.provisional


def set_allow_unverified(on: bool) -> None:
    """Allow (or forbid) reading Unverified values.
    Evidence: plan §0 "Nothing silently defaulted" / §3.2 --allow-unverified; no game rule."""
    global _allow
    _allow = bool(on)


def unverified_allowed() -> bool:
    """Evidence: plan §0 / §3.2; no game rule."""
    return _allow


@contextmanager
def allowing_unverified(on: bool = True):
    """Temporarily allow Unverified values (tests).
    Evidence: plan §0 / §3.2; no game rule."""
    global _allow
    old, _allow = _allow, bool(on)
    try:
        yield
    finally:
        _allow = old
