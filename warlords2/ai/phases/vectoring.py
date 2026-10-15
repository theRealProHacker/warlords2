"""ovl25:085f: the vectoring phase (ai.md §6.17a), the last phase of ovl25:0000 (at 032e)."""
from __future__ import annotations

from ...rules.bonuses import s8
from ...rules.economy import s16
from ..state import block
from ..util import set_vector

ROLE_SOURCE, ROLE_STAGING = 6, 7                 # ovl25:08f0 (cmp 6), 08c0 (= 7)
N_SOURCES = 4                                    # ovl25:08c5 [bp-2] = 4 (j = 3..0)


def _check_city(state, c: int, what: str) -> None:
    """The original indexes the 100-entry city table and AI role bytes (+0x56 + c) with any
    word; a value outside them would read other memory, which the engine cannot reproduce:
    refused.  The check here (0 <= c < city count) is narrower than the original's tables:
    the original would read an index count..99 from the unused records of its tables.
    Unreachable: the staging and source words only ever hold an own city's index or -1
    (ovl27:08ba resets them to -1)."""
    if not 0 <= c < len(state.cities):
        raise RuntimeError("ovl25:085f: task-force %s city %d out of range" % (what, c))


def vectoring(state) -> list:
    """ovl25:085f, the vectoring phase: for task force k = AI[+0x24a]-1..0 that is active (word
    +0 != 0) with a staging city s (+4) != -1 owned by the side on turn (cwde owner == SCN
    0x110): role[s] = 7, and every source j = 3..0 (+6 + 2j) that is not -1 and has role 6 is
    vectored to s (ovl29:0f10(source, s): only while a production is under way).  No rnd.
    Evidence: asm ovl25:085f..0918 (0867 AI[+0x24a], 090b..0912 loop k = n-1..0, 087e +0x24c,
    0894..089c +0x250 == -1, 08a8..08b8 owner cwde, 08c0 role 7, 08c5..0909 j = 3..0 over
    +0x252 + 2j, 08e5 0xffff, 08f0 role 6, 08f9 ovl29:0f10(dx, di))."""
    p = state.current
    blk = block(state)
    n = s16(blk.n_task_forces)
    if not 0 <= n <= len(blk.task_forces):
        raise RuntimeError("ovl25:085f: AI[+0x24a] = %d task forces; the original would read "
                           "past the four records" % n)
    for k in range(n - 1, -1, -1):
        tf = blk.task_forces[k]
        if s16(tf.age) == 0:
            continue
        s = s16(tf.staging)
        if s == -1:
            continue
        _check_city(state, s, "staging")
        if s8(state.cities[s].owner) != p:
            continue
        blk.role[s] = ROLE_STAGING
        for j in range(N_SOURCES - 1, -1, -1):
            src = s16(tf.sources[j])
            if src == -1:
                continue
            _check_city(state, src, "source")
            if blk.role[src] != ROLE_SOURCE:
                continue
            set_vector(state, src, s)
    return []
