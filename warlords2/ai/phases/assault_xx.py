"""ovl27 (without 0e04 = ai/phases/diplomacy.py `choose_enemy`): creating task forces and
choosing their sources (ai.md §6.13, §6.16a).

* `assault_xx` = ovl27:0000, the "assault XX" phase (ovl25:02a5);
* `refresh_sources` = ovl27:0aed, the first step of production (ovl25:06d4);
* the helpers 01bb .. 0b72 under their ai.md §9 names.

Task force k is `block(state).task_forces[k]` (AI[+0x24c + 0x5c k], `model.ai.TaskForce`).
The 600-byte work table of 01bb (DS:4102, three word arrays R / D / F of 100 entries) is a
local `_Graph`; its allocation (0d28:011f) is taken as always succeeding.
"""
from __future__ import annotations

from ...model.ids import Relation
from ...rules import diplomacy as D
from ...rules.bonuses import s8
from ...rules.economy import s16
from ...rules.setup import distance
from ..state import block
from ..tables import is_neighbour
from ..util import can_build_decent

ROLES_STAGING = (5, 8, 6, 4, 14)          # DS:0940 / DS:094c (-1 terminated), read from the EXE
ROLE_INTERIOR, ROLE_SOURCE, ROLE_STAGING, ROLE_FULL = 5, 6, 7, 8
CF_UNSEEN = 0x01
CF_MEDIUM, CF_FLYER, CF_FAST, CF_GROUPS = 0x08, 0x40, 0x80, 0xC8      # ovl27:0c7c..0cf0
TF_RAZE, TF_SACK, TF_PILLAGE = 1, 2, 4                                # ovl27:075b, 07b6, 07ee
TF_FAST, TF_MEDIUM, TF_FLYER, TF_GROUPS = 0x08, 0x10, 0x20, 0x38      # ovl27:0ba1..0ce1
MOVES_MEDIUM, MOVES_FAST = 12, 16                                     # ovl27:0baa, 0bc5
N_CITIES = 100                                                        # R / D / F: 100 words each
START = 10000                                                         # ovl27:024d, 031c, 040e
FAR_TARGET = 100                                                      # ovl27:03e6, 04c6
SEED_MIN = 3                                                          # ovl27:00a6 (jge 3)
STYLE_ROLL = (1, 1000, 0)                                             # ovl27:0736 (push dword 0x3e8)
TIE_ROLL = (1, 2, -1)                                                 # ovl27:055f (push dword 0xffff0002)
POOR = 100                                                            # ovl27:0776
STR_START = 100                                                       # ovl27:0d2e
NO = -1


def _owner(state, c: int) -> int:
    return s8(state.cities[c].owner)


def _set_role(b, c: int, v: int) -> None:
    if not 0 <= c < N_CITIES:
        raise RuntimeError("role byte AI[+0x56 + %d] outside the role array" % c)
    b.role[c] = v


def source_ok(state, c: int, also6: int) -> int:
    """ovl27:0a7a(c, also6): 0 when c is the staging city of an active task force (k =
    AI[+0x24a]-1..0); else 1 for role 8 or 5, or role 6 when `also6`; else 0.
    Evidence: asm ovl27:0a7a..0aec."""
    b = block(state)
    for k in range(s16(b.n_task_forces) - 1, -1, -1):
        tf = b.task_forces[k]
        if tf.age != 0 and s16(tf.staging) == c:
            return 0
    r = b.role[c]
    if r in (ROLE_FULL, ROLE_INTERIOR):
        return 1
    return int(bool(also6) and r == ROLE_SOURCE)


def is_staging(state, c: int) -> int:
    """ovl27:07f8(c): 1 when c is the staging city of an active task force (k = AI[+0x24a]-1..0).
    Evidence: asm ovl27:07f8..083d."""
    b = block(state)
    for k in range(s16(b.n_task_forces) - 1, -1, -1):
        tf = b.task_forces[k]
        if tf.age != 0 and s16(tf.staging) == c:
            return 1
    return 0


def drop_source(state, s: int) -> None:
    """ovl27:083e(s): every active task force (k = AI[+0x24a]-1..0) loses s from its sources
    (slots 3..0 -> -1), and for each such hit s's vectoring word +0x31 = 0.
    Evidence: asm ovl27:083e..08b9 (0879 == s, 0891 -1, 08a2 word +0x31 = 0)."""
    b = block(state)
    for k in range(s16(b.n_task_forces) - 1, -1, -1):
        tf = b.task_forces[k]
        if tf.age == 0:
            continue
        for i in range(3, -1, -1):
            if s16(tf.sources[i]) == s:
                tf.sources[i] = NO
                state.cities[s].vectoring = 0


def reset_tf(state, k: int) -> None:
    """ovl27:08ba(k): age = 0, enemy = staging = -1, flags = min moves = 0, sources[3..0] = -1,
    for i = 5..0 nb_counts / dists / former / targets = -1, leaders[3..0] = -1 (the words
    +0x1a..+0x25 and +0x52..+0x57 are not written).
    Evidence: asm ovl27:08ba..09c9."""
    tf = block(state).task_forces[k]
    tf.age = 0
    tf.enemy = tf.staging = NO
    tf.flags = tf.min_moves = 0
    for i in range(3, -1, -1):
        tf.sources[i] = NO
    for i in range(5, -1, -1):
        tf.nb_counts[i] = tf.dists[i] = tf.former[i] = tf.targets[i] = NO
    for i in range(3, -1, -1):
        tf.leaders[i] = NO


def count_enemy_nb(state, k: int) -> None:
    """ovl27:09ca(k): for i = 0..5 with a target t != -1: nb_counts[i] = the number of t's six
    neighbours (ovl25:0656, 5..0) owned (signed byte) by the task force's enemy; an empty
    target leaves its word.
    Evidence: asm ovl27:09ca..0a79 (09de enemy, 0a02 -1 -> skip, 0a19 0656, 0a44 cwde ==,
    0a68 write)."""
    tf = block(state).task_forces[k]
    enemy = s16(tf.enemy)
    for i in range(6):
        t = s16(tf.targets[i])
        if t == NO:
            continue
        n = 0
        _, ids, _ = is_neighbour(state, t, 0)
        for j in range(5, -1, -1):
            if ids[j] != 0xFF and _owner(state, ids[j]) == enemy:
                n += 1
        tf.nb_counts[i] = n


def enemy_core(state, enemy: int) -> int:
    """ovl27:04d2(enemy): the enemy city (count-1..0, owner signed == enemy) with the most
    neighbours owned by the enemy (n = 1 + those, ovl25:0656 5..0); n > best wins, a tie draws
    rnd(1,2,-1) and wins when it is not 0; -1 when the enemy has no city.
    Evidence: asm ovl27:04d2..0589 (04da 0, 04df -1, 0500 cwde, 0513 0656, 051b di = 1,
    0555 jg, 055a ==, 055f rnd, 056f != 0)."""
    best, bn = NO, 0
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) != enemy:
            continue
        _, ids, _ = is_neighbour(state, c, 0)
        n = 1
        for i in range(5, -1, -1):
            if ids[i] != 0xFF and _owner(state, ids[i]) == enemy:
                n += 1
        if n > bn or (n == bn and state.rng.rnd(*TIE_ROLL) != 0):
            bn, best = n, c
    return best


class _Graph:
    """The DS:4102 table: R[c] reached, D[c] distance (R + 100 words), F[c] done (R + 200)."""

    def __init__(self):
        self.R = [0] * N_CITIES
        self.D = [0] * N_CITIES
        self.F = [0] * N_CITIES


def graph_dist(state, g: _Graph, src: int) -> None:
    """ovl27:058a(src, unused): R = D = F = 0 for c = count-1..0, R[src] = 1; repeat: every city
    c = count-1..0 reached and not done is done now (its D read first); its neighbours n
    (ovl25:0656, i = 5..0, n != 0xff) get nd = D[c] + the NB distance byte: not reached ->
    reached with D = nd, else D = min(D, nd) (signed); until a pass marks nothing.
    Evidence: asm ovl27:058a..069f (0597 loop, 05c9 R[src] = 1, 05ce changed = 0, 05e0..0690
    pass, 0603 D read, 060b F = 1, 061f 0656, 0627..0687 i = 5..0, 064f..0670, 0693 repeat)."""
    for c in range(len(state.cities) - 1, -1, -1):
        g.R[c] = g.D[c] = g.F[c] = 0
    g.R[src] = 1
    changed = True
    while changed:
        changed = False
        for c in range(len(state.cities) - 1, -1, -1):
            if not g.R[c] or g.F[c]:
                continue
            changed = True
            dc = g.D[c]
            g.F[c] = 1
            _, ids, dists = is_neighbour(state, c, 0)
            for i in range(5, -1, -1):
                n = ids[i]
                if n == 0xFF:
                    continue
                nd = s16(dc + (dists[i] & 0xFF))
                if not g.R[n]:
                    g.R[n] = 1
                    g.D[n] = nd
                elif g.D[n] > nd:
                    g.D[n] = nd


def _role_in(b, c: int, roles) -> bool:
    return b.role[c] in roles


def pick_targets(state, g: _Graph, e: int, enemy: int, ids: list, dists: list) -> int:
    """ovl27:03ff(e, enemy, ids, dists): for i = 0..5: t = the enemy city (count-1..0, owner
    signed == enemy) not flagged unseen and reached, with the smallest D (strict, from 10000);
    none -> stop; ids[i] = t, dists[i] = D[t], R[t] = 0.  None at all and AI[+0x11e + (-1)]
    (= AI[+0x11d], the +0xba byte of city 99: the loop register is -1) without bit 0 ->
    ids[0] = e, dists[0] = 100, count 1.  Returns the count.
    Evidence: asm ovl27:03ff..04d1 (040e 10000, 041b loop, 0432 cwde, 043d bit 0, 044f R, 045a
    jge, 046b -1 -> 04a4, 0470..0495 writes, 04a4..04cb the fallback with dx = -1)."""
    b = block(state)
    cnt = 0
    for i in range(6):
        best, bd = NO, START
        for c in range(len(state.cities) - 1, -1, -1):
            if _owner(state, c) != enemy or b.city_flags[c] & CF_UNSEEN or not g.R[c]:
                continue
            if g.D[c] < bd:
                bd, best = g.D[c], c
        if best == NO:
            break
        ids[i], dists[i] = best, bd
        g.R[best] = 0
        cnt += 1
    if cnt == 0 and not b.age[N_CITIES - 1] & CF_UNSEEN:
        ids[0], dists[0] = e, FAR_TARGET
        cnt += 1
    return cnt


def pick_staging(state, k: int, enemy: int, ids: list, dists: list) -> int:
    """ovl27:01bb(k, enemy, ids, dists): ids[5..0] = dists[5..0] = -1; e = 04d2(enemy) (-1 ->
    -1); graph distances from e (058a); s = the own city (count-1..0) with a role of DS:0940
    {5, 8, 6, 4, 14} that e reaches, smallest D (strict, from 10000).  None: if e is not
    flagged unseen, s = the own city with a role of DS:094c (the same list) nearest to e in a
    straight line (0a8b:0acc, strict, from 10000), and when found ids[0] = e, dists[0] = 100.
    Found: graph distances from s, and 03ff(e, enemy, ids, dists) == 0 -> s = -1.  Returns s.
    `k` is not read.
    Evidence: asm ovl27:01bb..03fe (01c8..01ed clear 5..0, 01fa alloc, 0227 04d2, 023f
    058a(e), 024d..02ce, 02d0 found -> 02d6 058a(s, enemy), 02f2 03ff, 0307 bit 0, 031c..03d2,
    03dd..03e6, 03eb free)."""
    for i in range(5, -1, -1):
        dists[i] = NO
        ids[i] = NO
    e = enemy_core(state, enemy)
    if e == NO:
        return NO
    b = block(state)
    p = state.current
    g = _Graph()
    graph_dist(state, g, e)
    s, bd = NO, START
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) != p or not _role_in(b, c, ROLES_STAGING):
            continue
        if g.R[c] and g.D[c] < bd:
            bd, s = g.D[c], c
    if s != NO:
        graph_dist(state, g, s)
        if pick_targets(state, g, e, enemy, ids, dists) == 0:
            s = NO
        return s
    if b.city_flags[e] & CF_UNSEEN:
        return NO
    ec = state.cities[e]
    s, bd = NO, START
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) != p or not _role_in(b, c, ROLES_STAGING):
            continue
        city = state.cities[c]
        d = distance(city.x, city.y, ec.x, ec.y)
        if d < bd:
            s, bd = c, d
    if s != NO:
        ids[0], dists[0] = e, FAR_TARGET
    return s


def style(state, k: int) -> None:
    """ovl27:06a0(k): base = AI[+2] * AI[+0x2c] (16-bit imul) + AI[+0x2e] (side on turn human)
    / +0x30 / +0x32 / +0x34 (its level 2 / 1 / 0); flags = 0; AI[+0x26] != 0 and rnd(1,1000,0)
    < AI[+0x26] + base -> flag 1, done; gold (signed word) < 100 -> base += AI[+0x36];
    AI[+0x28] != 0 and rnd < +0x28 + base -> flag 2, done; AI[+0x2a] != 0 and rnd < +0x2a +
    base -> flag 4.  Up to three draws, each only for a non-zero weight.
    Evidence: asm ovl27:06a0..07f7 (06b9 level, 06c2 imul, 06dd 0x0d0, 06ef..0715, 0724
    flags = 0, 072f..0761, 0769..0782 gold < 0x64, 078a..07bc, 07c2..07ee; jge = signed)."""
    b = block(state)
    pl = state.players[state.current]
    tf = b.task_forces[k]
    base = s16(s16(b.own_cities) * s16(b.tf_city_mult))
    if pl.control == 0:
        base = s16(base + b.tf_bonus_human)
    elif pl.level == 2:
        base = s16(base + b.tf_bonus_l2)
    elif pl.level == 1:
        base = s16(base + b.tf_bonus_l1)
    elif pl.level == 0:
        base = s16(base + b.tf_bonus_l0)
    tf.flags = 0
    if s16(b.tf_odds_1) != 0 and state.rng.rnd(*STYLE_ROLL) < s16(b.tf_odds_1 + base):
        tf.flags |= TF_RAZE
        return
    if s16(pl.gold) < POOR:
        base = s16(base + b.tf_bonus_poor)
    if s16(b.tf_odds_2) != 0 and state.rng.rnd(*STYLE_ROLL) < s16(b.tf_odds_2 + base):
        tf.flags |= TF_SACK
        return
    if s16(b.tf_odds_4) != 0 and state.rng.rnd(*STYLE_ROLL) < s16(b.tf_odds_4 + base):
        tf.flags |= TF_PILLAGE


def assault_xx(state) -> list:
    """ovl27:0000: the "assault XX" phase (ai.md §6.13).  Nothing while AI[+0] == 0.  n = own
    cities with role 5 or 8; act = active task forces among all four; when AI[+0x24a] > act
    (signed), n != 0 and (act == 0 or n >= 3): k = the lowest inactive index < AI[+0x24a]; 08ba;
    enemy = ovl27:0e04 (8 rnd); -1 -> done; s = 01bb(k, enemy, targets, dists); -1 -> 08ba,
    done; age 1, enemy, staging s, role[s] = 7; 06a0 (rnd); proposal (side, enemy) = war;
    083e(s); 09ca(k); ovl21:01b3.
    Evidence: asm ovl27:0000..01ba (0012 +0, 0024..0069 n (cwde ==, roles 5 / 8), 006b..0089
    act (dx = 3..0), 008b jg, 0099, 00a2..00aa, 00af..00d4 k, 00e1 08ba, 00e9 0e04, 0123 01bb,
    0134 08ba, 0145..0176, 017e 06a0, 0196..019c & 0xf3 | 8, 01a7 083e, 01ae 09ca, 01b2 01b3)."""
    from .diplomacy import choose_enemy
    from .evaluate import tf_groups
    b = block(state)
    p = state.current
    if b.turns_with_cities == 0:
        return []
    n = 0
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) == p and b.role[c] in (ROLE_INTERIOR, ROLE_FULL):
            n += 1
    act = sum(1 for k in range(3, -1, -1) if b.task_forces[k].age != 0)
    if not (s16(b.n_task_forces) > act and n != 0 and (act == 0 or n >= SEED_MIN)):
        return []
    k = NO
    for d in range(s16(b.n_task_forces) - 1, -1, -1):
        if b.task_forces[d].age == 0:
            k = d
    if k == NO:
        return []
    reset_tf(state, k)
    enemy = choose_enemy(state, 0)
    if enemy == NO:
        return []
    tf = b.task_forces[k]
    s = pick_staging(state, k, enemy, tf.targets, tf.dists)
    if s == NO:
        reset_tf(state, k)
        return []
    tf.age = 1
    tf.enemy = enemy
    tf.staging = s
    _set_role(b, s, ROLE_STAGING)
    style(state, k)
    D.set_proposal(state, p, enemy, Relation.WAR)
    drop_source(state, s)
    count_enemy_nb(state, k)
    tf_groups(state)
    return []


def refresh_sources(state) -> list:
    """ovl27:0aed (first step of production): every own city (count-1..0) with role 6 gets role
    8 and vectoring word +0x31 = 0; then 0b72(k) for every active task force k = 3..0.
    Evidence: asm ovl27:0aed..0b71 (0afd cwde ==, 0b1f role 6, 0b2c 8, 0b3b word = 0, 0b49..0b6d
    k = 3..0)."""
    b = block(state)
    p = state.current
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) == p and b.role[c] == ROLE_SOURCE:
            b.role[c] = ROLE_FULL
            state.cities[c].vectoring = 0
    for k in range(3, -1, -1):
        if b.task_forces[k].age != 0:
            pick_sources(state, k)
    return []


def pick_sources(state, k: int) -> None:
    """ovl27:0b72(k): the four source cities of task force k.  mv = 12 with flag 0x10, else 16
    with flag 8, else +0x58.  sources[3..0] = -1.  For every own city c = count-1..0 with
    0a7a(c, 0): flag 0x10 needs city bit 8, 8 needs 0x80, 0x20 needs 0x40, none of 0x38 needs
    none of 0xc8; ovl29:1a4d(c, &slot) must pass and the slot's moves (signed byte) >= mv; j =
    the first empty source slot (0..3), else the one with the lowest strength (strict, from
    100); taken when the slot is empty or the city's slot strength (signed byte, no w15 bonus)
    >= that lowest.  Then role 6 for every source.
    Evidence: asm ovl27:0b72..0e03 (0ba1..0bdc mv, 0bdf..0c1c clear 3..0, 0c23 loop, 0c40
    cwde, 0c4e 0a7a(c, 0), 0c66..0cf6 flags, 0d01 1a4d, 0d1d +0x22 moves jge, 0d2b..0d70 j,
    0d80..0d9c, 0da7..0dc6 writes, 0dd3..0dfe role 6 for i = 0..3)."""
    b = block(state)
    p = state.current
    tf = b.task_forces[k]
    fl = tf.flags
    if fl & TF_MEDIUM:
        mv = MOVES_MEDIUM
    elif fl & TF_FAST:
        mv = MOVES_FAST
    else:
        mv = s16(tf.min_moves)
    st = [NO] * 4
    for i in range(3, -1, -1):
        tf.sources[i] = NO
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) != p or not source_ok(state, c, 0):
            continue
        cf = b.city_flags[c]
        if fl & TF_MEDIUM and not cf & CF_MEDIUM:
            continue
        if fl & TF_FAST and not cf & CF_FAST:
            continue
        if fl & TF_FLYER and not cf & CF_FLYER:
            continue
        if not fl & TF_GROUPS and cf & CF_GROUPS:
            continue
        ok, slot = can_build_decent(state, c)
        if not ok:
            continue
        sl = state.cities[c].slots[slot]
        if s8(sl.moves) < mv:
            continue
        j, lim = NO, STR_START
        for i in range(4):
            if s16(tf.sources[i]) == NO:
                j = i
                break
            if st[i] < lim:
                j, lim = i, st[i]
        if j == NO:
            continue
        if s16(tf.sources[j]) != NO and s8(sl.strength) < lim:
            continue
        tf.sources[j] = c
        st[j] = s8(sl.strength)
    for i in range(4):
        if s16(tf.sources[i]) != NO:
            _set_role(b, s16(tf.sources[i]), ROLE_SOURCE)
