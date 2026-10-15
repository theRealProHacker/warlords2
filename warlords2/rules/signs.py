"""Signposts: the sign under the selected stack and editing its two lines (Order > Signpost).

Source (read by M9b from out/asm/ovl13.asm): key 'x' / menu 519 -> 07be:0268 -> ovl13:01a4 opens
the editor for the sign at the selected stack's square; its buttons are 422 / 423 (the line
editors ovl13:03dd / 0432: ovl56:03a6 starts empty, Return stores the typed line, Esc keeps it) and 421 OK (ovl13:0486), which
writes the whole sign buffer back to CURRENT.SGN, the game's live copy of the scenario's signs.
Here `World.signs` is that copy (file order = record index: formats.scenario.parse_sgn keeps it,
rules.setup copies it), saved with the game; `EditSign` is the OK press with both lines.
Not modelled (presentation only): the dialog ovl13:02d7, the editor ovl56:03a6, the file I/O.
"""
from __future__ import annotations

from ..model import commands as C
from ..model.ids import MAP_H, MAP_W
from .constants import signs as K
from .engine import IllegalCommand


def sign_at(state) -> int | None:
    """Index in `World.signs` of the sign the Signpost dialog opens for, or None when it opens none.
    Evidence: asm ovl13:01ae..02ad: DS:5e62 (the selected stack) null -> return (01b6); terrain
    SCN 0x710[tile byte at the stack record's +0 x, +2 y] != 9 -> return (01e9); CURRENT.SGN read whole
    (01ee..0234); records 0 .. count-1 scanned for x == +0, y == +2 of DS:5e62, the first match
    ends the scan (0258..0295, di = 1); none -> the buffer freed, return (029b..02a8); DS:3f9a =
    the index (02aa..02ad).  A selected record off the map has no tile here (the EXE would read
    outside the map): None."""
    aid = state.selection.selected
    if not 0 <= aid < len(state.armies):
        return None
    a = state.armies[aid]
    if not (0 <= a.x < MAP_W and 0 <= a.y < MAP_H):
        return None
    if state.world.terrain(a.x, a.y) != K.SIGN_TERRAIN.value:
        return None
    return next((i for i, s in enumerate(state.world.signs) if (s.x, s.y) == (a.x, a.y)), None)


def _line(text, old: str) -> str:
    if text == old:
        return text                             # Esc (ovl56:045b) keeps the line as it was
    lo, hi = K.TYPED_CHARS.value
    if not isinstance(text, str) or len(text) > K.TYPED_MAX.value \
            or any(not lo <= ord(ch) <= hi for ch in text):
        raise IllegalCommand("a typed sign line has at most %d characters 0x%02x..0x%02x"
                             % (K.TYPED_MAX.value, lo, hi))
    return text


def edit_sign(state, cmd: C.EditSign) -> list:
    """Both lines of the sign under the selected stack, as the dialog's OK writes them.  Only the
    sign the dialog opens for (`sign_at`) can be edited.  Each line is either the line as it is
    (never edited, or edited and left with Esc) or a typed one: at most 29 characters, each
    0x20..0x7a, also empty (Return with nothing typed).  The editor's width limit (< 216 px of
    font slot 2 before each key) is the UI's: the engine has no font.
    Evidence: asm ovl13:03dd / 0432: ovl56:03a6(rect, record +4 / +0x36 of entry DS:3f9a, 0x1e,
    0xd8) (03fc..0423, 0451..0478); ovl56: the field starts empty (03d2..03eb: zeroed, then
    strcpy of DS:2374 = ""; si = 0 at 043b); Return (044c -> 0575) copies the typed buffer over
    the record, also an empty one; Esc (0455..046c) copies the record into the buffer first, so
    0575 leaves it unchanged; a key is typed only when 0x20 <= key <= 0x7a (047f..048e), si <
    0x1e - 1 (04c1..04c7) and the width of the text so far < 0xd8 (04b6..04cf).  ovl13:0486..04d4
    (button 421): CURRENT.SGN opened (mode 9) and the whole buffer written (070b:004e at 04a8),
    the buffer freed, ovl17:069c, ovl61:0000(0, 0) (redraw only).  No other field changes and
    nothing is rolled."""
    i = sign_at(state)
    if i is None or cmd.sign != i:
        raise IllegalCommand("sign %r is not the sign under the selected stack (%r)" % (cmd.sign, i))
    s = state.world.signs[i]
    line1, line2 = _line(cmd.line1, s.line1), _line(cmd.line2, s.line2)
    s.line1, s.line2 = line1, line2
    return []
