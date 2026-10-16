"""ovl10 of WARLORD2.EXE: the random map's sides (M11 R2).

Its only caller is ovl09:0014 (stage 90, package R3's `files.finish`) at ovl09:0029, between
ovl11:05e3 (`cities.city_table`) and ovl11:0ce0 (`cities.city_details`):
`sides(work)` = ovl10:0000 = the capitals ovl11:0689 (`cities.choose_capitals`: starting
positions, the quadrant region codes, capital owners and tiles), then the side names (0014),
then the starting gold (006b).  The Game Start allies toggle DS:28cc is read by ovl11:10ef (in
0ce0, `cities.city_details`) and ovl11:174c (in 161d, `cities.production`), not here.  No file
access, no screen work.
"""
from __future__ import annotations

from ..constants import randmap as K
from . import cities as C
from .buffer import s16


def side_names(work) -> None:
    """ovl10:0014: for p in 0..7: k = rnd(1, 5, -1); strcpy(SCN + 0x14 p, RANDOM.DAT +0x764 +
    0x64 p + 0x14 k) (five candidate names per side).
    Evidence: asm ovl10:0014..006a (die 0027; 0000:4a70 strcpy)."""
    base, per_side, size = K.SIDE_NAMES.value
    for p in range(K.N_SIDES.value):
        k = work.rng.rnd(1, 5, -1)
        work.scn.set_cstr(K.PLAYER_LEN.value * p, work.buf.cstr(s16(base + per_side * p + size * k)))


def starting_gold(work) -> None:
    """ovl10:006b: for p in 0..7: SCN word 0x185 + 0x14 p (player record +2, gold) =
    rnd(3, 50, 20).
    Evidence: asm ovl10:006b..009a (die 007b)."""
    for p in range(K.N_SIDES.value):
        work.scn.set_word(K.SCN_PLAYER.value + K.PLAYER_LEN.value * p + K.P_GOLD.value,
                          work.rng.rnd(3, 50, 20))


def sides(work) -> None:
    """ovl10:0000 (stage 90, from ovl09:0029): ovl11:0689 `cities.choose_capitals`, then
    `side_names`, then `starting_gold`.
    Evidence: asm ovl10:0000..0013."""
    C.choose_capitals(work)
    side_names(work)
    starting_gold(work)
