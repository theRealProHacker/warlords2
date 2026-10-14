"""Game text from the user's data files: STRING.DAT and the right-click help table.

Source code never holds game text (docs/plan.md section 0): text is addressed as
`(group, index)` into `DATA/STRING.DAT` (docs/formats/tables.md section 5) or by button
id into `HELP/WARLORD2.HLP` (section 8), and filled with the C printf conversions the
strings use (`%d`, `%s`, `%lu`, `%%` are the only ones in STRING.DAT).

The getter `ovl59:04f0` clamps the index to count-1 and treats a negative index as
"pick one of the group at random" (tables.md section 5); the clamp is reproduced, the
random pick is not (it needs the engine's Rng, so callers choose the index).
"""
from __future__ import annotations

import re

from ..formats.tables import StringTable, parse_help

_CONV = re.compile(r"%(%|-?\d*l?[dsu])")


def printf(fmt: str, *args) -> str:
    """C printf with the conversions found in the game's tables."""
    it = iter(args)

    def conv(m: re.Match) -> str:
        spec = m.group(1)
        if spec == "%":
            return "%"
        v = next(it)
        return ("%" + spec.replace("l", "")) % ((int(v),) if spec[-1] in "du" else (str(v),))

    out = _CONV.sub(conv, fmt)
    if next(it, None) is not None:
        raise TypeError(f"too many arguments for {fmt!r}")
    return out


class Text:
    """STRING.DAT and WARLORD2.HLP of one game directory."""

    def __init__(self, string_dat: bytes, hlp: bytes):
        self.strings = StringTable(string_dat)
        self.help = {}
        for r in parse_help(hlp):
            self.help.setdefault(r["id"], r)       # id 421 occurs twice: the reader stops at the first

    def S(self, group: int, index: int, *args) -> str:
        """STRING.DAT (group, index) with printf arguments; index clamped like ovl59:04f0."""
        g = self.strings.groups[group]
        if index < 0:
            raise ValueError("random pick (negative index) is the caller's job")
        return printf(g[min(index, len(g) - 1)], *args)

    def group(self, group: int) -> list[str]:
        return list(self.strings.groups[group])

    def hlp(self, button_id: int) -> dict | None:
        """The first HLP record with this id (ovl15:0000 reads records until the id
        matches), or None."""
        return self.help.get(button_id)
