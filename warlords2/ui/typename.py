"""The army type name buffer DS:4468 of ovl44:14f4 (register X36 c).

Evidence (asm ovl44:14f4..153f): 14f4(t) loads the 29 ARMYTYPE records (ovl44:1128), scans
them for the record whose id word (+0) equals t and copies that record's name (+2) into
DS:4468 (0000:4a70, 1512..152e); it returns DS:4468 in every case.  The callers pass the
type byte sign-extended (mov al, [+4]; cwde), so for type byte 0xff (t = -1) nothing matches
and the buffer keeps the name of the last successful look-up anywhere in the program.  Nothing
else writes DS:4468 (the only references are ovl44:1526 / 153f); in the EXE image it is zeros
(an empty name), read here at run time.

The callers the UI draws (each updates the buffer when it looks a name up):
ovl46:044c (type panel ovl46:032a), ovl46:0774 (army panel ovl46:0626, not for a hero),
ovl16:0070 (production details), ovl36:254b (medal), ovl66:113e (stack dialog rows, not for a
hero), ovl34:06b2 / 06f7 (allies joining at a site), ovl01:0755 (quest of type 2),
ovl01:1821 (type 0x13, ally reward).  The buffer belongs to the running program (not to the
game state): kept on the `Kit` (one per program), it starts as the image's bytes and survives loading a game.
"""
from __future__ import annotations

from ..assets.exe import ds_str

NAME_BUF = 0x4468                 # DS:4468, 20 bytes


def type_name(k, state, t: int) -> str:
    """ovl44:14f4(cwde(t)) with `k` the Kit: the record's name, which is also left in DS:4468; for an id no
    record has (type byte 0xff) what DS:4468 already holds."""
    from ..rules.bonuses import s8
    t = s8(t)
    buf = getattr(k, "type_name_buf", None)
    if buf is None:
        buf = ds_str(k.exe, NAME_BUF)
    for rec in state.army_types:
        if rec.type_id == t:
            buf = rec.name
            break
    k.type_name_buf = buf
    return buf
