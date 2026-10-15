"""ovl19: the assault phase - running the task forces - and the computer's capture choice
(ai.md §6.5).

* `assault` = ovl19:0000 (ovl25:01aa); the helpers 00ca .. 16fd under their ai.md §9 names;
* `capture_choice` = ovl19:1864 (also called by ovl26:0000 and ovl26:038d), `sack` = 199c,
  `pillage` = 1a2a.

Raze contract (ai.md §9): 1864's raze branch is ovl32:016b (`rules.city.raze`), the infamy
draw and ovl29:1851 = `ai.base.after_raze`, run exactly once by 1864 itself; its result (the
next target city or -1) is read back from `state.ai.raze_target`.

Every function that moves armies returns its value together with the events, as
`(value, events)`; `assault` returns the events.  The lists L are the 8-entry army lists the
original keeps on its stack (-1 = empty); the callee writes into the caller's list, as there.
"""
from __future__ import annotations

from ...model import events as E
from ...model.ids import HERO_TYPE, MAP_ARMY, MAP_H, MAP_OWNER_MASK, MAP_W, ROAD_SEEN, Terrain
from ...rules import city as CT
from ...rules import movement as M
from ...rules import pathfinding as P
from ...rules.bonuses import s8
from ...rules.economy import add_gold, s16
from ...rules.selection import selection_step
from ...rules.present import present
from ...rules.setup import distance
from ..state import block
from ..tables import is_neighbour
from ..util import (DMAP_LIMIT, count_square, nearest_ring, order_stack, select_square,
                    select_square_order, win_odds)
from . import assault_xx as XX
from .clean_city import redraw
from .diplomacy import capital_city, city_record, first_capital

NO = -1
NEUTRAL = 0x0F
STACK = 8
ROLE_STAGING, ROLE_FULL = 7, 8
CF_UNSEEN = 0x01
TF_RAZE, TF_SACK, TF_PILLAGE = 1, 2, 4
ABOARD = 0x1000                                   # army +0xc (ovl19:0c80)
KIND_CITY, KIND_KEEP = 1, 4                       # order kinds (ovl29:0c7e)
SKIRMISH_FLAGS = 0x20                             # ovl19:0e3a push dword 0x200000
NO_PATH = 1                                       # 0a8b:0001 status 1 (ovl19:1110)
STAGING_START = 1000                              # ovl19:02fd, 0f7b
NEAR_START, NEAR_RANGE, ODDS = 1000, 50, 75       # ovl19:0b61, 0ba2, 0bd6 / 081d / 0dbc
LAUNCH_ROLL = (1, 4, 0)                           # ovl19:07d2 (push dword 4, push 1)
LAUNCH_TURNS, LAUNCH_NOW, LAUNCH_MANY = 10, 100, 8    # ovl19:07f3, 081a, 0823
SKIRMISH_COUNT, SKIRMISH_STR = 2, 10              # ovl19:0dc1 (jle 2), 0dc7 (jg 0xa)
NO_SKIRMISH_TERRAIN = (Terrain.CITY, 3, 2)        # ovl19:0d42..0d52
TF_CLOSE = (10, 20, 30, 50)                       # ovl19:141c..143b (unsigned bytes)
REAR_DANGER = 25                                  # ovl19:17d1 (jae 0x19)
REAR_MIN = 3                                      # ovl19:1824 (jle 3)
OCCUPY_RANGE, OCCUPY_MIN = 45, 3                  # ovl19:18c8 (jae 0x2d), 18d8 (jl 3)
SACK_MIN = 400                                    # ovl19:18e4 (jl 0x190)
RAZE_ROLL, RAZE_ADD = (1, 15, 0), 10              # ovl19:1944 / 1951
SACK_ROLL, SACK_ADD = (1, 10, 0), 5               # ovl19:19e9 / 19f6
PILLAGE_ROLL = (1, 5, 0)                          # ovl19:1a85
RAZED_FMT, SACKED_FMT, PILLAGED_FMT = 0x0788, 0x079B, 0x07AF   # DS sprintf formats, ovl19:1901 / 19c7 / 1a4c
CANCEL_TF, CANCEL_OLDEST, CANCEL_DONE = 0, 2, 3   # 066d's (unused) reasons at 01ba, 065f, 1542
CANCEL_NO_STAGING = 1                             # ovl19:0406


# ------------------------------------------------------------------------------- helpers

def _tf(state, k: int):
    b = block(state)
    if not 0 <= k < len(b.task_forces):
        raise RuntimeError("task force %d outside the four records" % k)
    return b.task_forces[k]


def _owner(state, c: int) -> int:
    return s8(state.cities[c].owner)


def _intact(state, c: int) -> bool:
    city = state.cities[c]
    return state.world.terrain(city.x, city.y) == Terrain.CITY


def _set_role(b, c: int, v: int) -> None:
    if not 0 <= c < len(b.role):
        raise RuntimeError("role byte AI[+0x56 + %d] outside the role array" % c)
    b.role[c] = v


def _army(state, i: int):
    if not 0 <= i < len(state.armies):
        raise RuntimeError("army %d outside the army table" % i)
    return state.armies[i]


def _idiv(a: int, b: int) -> int:
    q = abs(a) // abs(b)
    return q if (a < 0) == (b < 0) else -q


def _abs16(v: int) -> int:
    v = s16(v)
    return v if v == -0x8000 else abs(v)


def _clean_city(state, c: int, force: int) -> list:
    """ovl24:023f(c, force) (ai/phases/clean_city.py `clean_city`, M8b2)."""
    from .clean_city import clean_city
    return list(clean_city(state, c, force) or [])


def _delete_selection(state, redraw: int) -> list:
    """ovl24:0000(redraw) (ai/phases/clean_city.py `delete_selection`, M8b2)."""
    from .clean_city import delete_selection
    return list(delete_selection(state, redraw) or [])


def _execute_leader(state) -> tuple[int, list]:
    """0a8b:0001(DS:5e62 goto x, goto y, 0) (`rules.movement.execute_move`).  A null DS:5e62
    (every attacker died) makes 0001 return 0 at once; the goto read through the null pointer
    is not used then."""
    lead = M._record(state, state.selection.selected)
    if lead is None:
        return M.execute_move(state, -1, -1, 0)
    x, y = lead.goto
    return M.execute_move(state, x, y, 0)


def _turns(dist: int, moves: int) -> int:
    """dist / max(DS:5e00 - 2, 1) + 1 (idiv), as ovl19:0781..07a3 and ovl26:078c..07ae."""
    m = s16(moves - 2)
    return _idiv(s16(dist), m if m >= 1 else 1) + 1


# ------------------------------------------------------------------------------- the phase

def assault(state) -> list:
    """ovl19:0000: nothing while AI[+0] == 0; ovl21:01b3; every own city (count-1..0, signed
    owner) with role 7 -> 8; for k = 0 while k < AI[+0x24a] (re-read, signed): an active task
    force puts role 7 back on its staging city (no owner test) and runs 00ca(k); a 1 ages it.
    Evidence: asm ovl19:0000..00c9 (0008 +0, 0011 01b3, 001b..005b roles, 005d..00c5 loop:
    0078 active, 0092..009b role 7, 00a3 00ca, 00b6 inc age)."""
    from .evaluate import tf_groups
    b = block(state)
    p = state.current
    if b.turns_with_cities == 0:
        return []
    tf_groups(state)
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) == p and b.role[c] == ROLE_STAGING:
            b.role[c] = ROLE_FULL
    events: list = []
    k = 0
    while s16(b.n_task_forces) > k:
        tf = _tf(state, k)
        if tf.age != 0:
            _set_role(b, s16(tf.staging), ROLE_STAGING)
            r, ev = run_tf(state, k)
            events += ev
            if r:
                tf.age = s16(tf.age + 1)
        k += 1
    return events


def run_tf(state, k: int) -> tuple[int, list]:
    """ovl19:00ca(k): one task force's turn.  Our first capital held by another side and no
    active task force (k' = AI[+0x24a]-1..0) against that side -> 0607 (drop the oldest), 0.
    041c(k) == 0 -> 066d(k, 0), 0.  1579(k).  When another active task force shares the
    staging city, or the staging city is no longer ours: 02ed(k) == 0 -> 0.  0996(k) (the
    launched groups); inactive -> 0; ovl24:023f(staging, 1); 06e9(k) (launch) and staging >= 0
    -> ovl24:023f(staging, 1) again; inactive -> 0; 16fd(k); 1.
    Evidence: asm ovl19:00ca..02ec (00e7..0103 ovl62:044a, 010d..0139 owner, 013b..019d hit,
    01a6 0607, 01af 041c, 01ba 066d(k, 0), 01c7 1579, 01ce..021c shared, 0222..024a owner, 024f
    02ed, 025d 0996, 026c, 0289 023f, 0294 06e9, 02a7 jl, 02c1 023f, 02d4, 02e2 16fd)."""
    b = block(state)
    p = state.current
    tf = _tf(state, k)
    events: list = []
    rc = city_record(state, capital_city(state, p))
    co = s8(rc.owner)
    if rc.owner != NEUTRAL and co != p:
        hit = False
        for kk in range(s16(b.n_task_forces) - 1, -1, -1):
            t2 = _tf(state, kk)
            if t2.age != 0 and co == s16(t2.enemy):
                hit = True
        if not hit:
            cancel_oldest(state)
            return 0, events
    if refresh_targets(state, k) == 0:
        cancel_tf(state, k, CANCEL_TF)
        return 0, events
    extend_targets(state, k)
    shared = False
    for kk in range(s16(b.n_task_forces) - 1, -1, -1):
        t2 = _tf(state, kk)
        if t2.age != 0 and kk != k and s16(t2.staging) == s16(tf.staging):
            shared = True
    if shared or _owner(state, s16(tf.staging)) != p:
        if not move_staging(state, k):
            return 0, events
    events += move_groups(state, k)
    if tf.age == 0:
        return 0, events
    events += _clean_city(state, s16(tf.staging), 1)
    r, ev = launch(state, k)
    events += ev
    if r and s16(tf.staging) >= 0:
        events += _clean_city(state, s16(tf.staging), 1)
    if tf.age == 0:
        return 0, events
    events += bring_rear(state, k)
    return 1, events


def move_staging(state, k: int) -> int:
    """ovl19:02ed(k): the new staging city = the nearest (0a8b:0acc from it to the staging
    city, strict, from 1000) of the staging city's neighbours (ovl25:0656, i = 5..0) owned by
    the side (signed byte) that are not a staging city (ovl27:07f8); none -> 066d(k, 1), 0;
    else set, 1.  No intact test.
    Evidence: asm ovl19:02ed..041b (02f8 -1, 02fd 1000, 0302..033f staging x / y, 035e 0656,
    0366..03e9 i = 5..0, 0396 cwde ==, 039e 07f8, 03cc dist(n.x, n.y, s.x, s.y), 03d6 jge,
    03ff write, 040b 066d(k, 1))."""
    p = state.current
    tf = _tf(state, k)
    st = s16(tf.staging)
    sc = state.cities[st]
    best, bd = NO, STAGING_START
    _, ids, _ = is_neighbour(state, st, 0)
    for i in range(5, -1, -1):
        n = ids[i]
        if n == 0xFF or _owner(state, n) != p or XX.is_staging(state, n):
            continue
        nc = state.cities[n]
        d = distance(nc.x, nc.y, sc.x, sc.y)
        if d < bd:
            bd, best = d, n
    if best != NO:
        tf.staging = best
        return 1
    cancel_tf(state, k, CANCEL_NO_STAGING)
    return 0


def refresh_targets(state, k: int) -> int:
    """ovl19:041c(k): for i = 0..5: a target that is AI[+0x46] or no longer owned by the enemy
    (signed byte) -> -1, else counted.  Then for each neighbour t of the staging city (NB slot
    i = 5..0) owned by the enemy, not flagged unseen and not yet a target: counted; slot = the
    highest empty target slot (j = 5..0), else the one with the largest distance word (strict
    > from 0, signed: the highest j on ties); stored (t, NB distance byte) when the slot is
    empty or that byte < its distance.  Returns the count.
    Evidence: asm ovl19:041c..0606 (0452..04b1 first loop, 04c2 0656, 04ca..05fb i = 5..0,
    050b..0535 present, 053e count, 0541..05ab slot, 05b2..05c0, 05c2..05f1 writes)."""
    b = block(state)
    tf = _tf(state, k)
    enemy, st = s16(tf.enemy), s16(tf.staging)
    n = 0
    for i in range(6):
        t = s16(tf.targets[i])
        if t == NO:
            continue
        if s16(b.quest_city) != t and _owner(state, t) == enemy:
            n += 1
        else:
            tf.targets[i] = NO
    _, ids, dists = is_neighbour(state, st, 0)
    for i in range(5, -1, -1):
        t = ids[i]
        if t == 0xFF or _owner(state, t) != enemy or b.city_flags[t] & CF_UNSEEN:
            continue
        if any(s16(tf.targets[j]) == t for j in range(5, -1, -1)):
            continue
        n += 1
        slot, worst = NO, 0
        for j in range(5, -1, -1):
            if s16(tf.targets[j]) == NO:
                slot, worst = j, NO
                break
            if s16(tf.dists[j]) > worst:
                slot, worst = j, s16(tf.dists[j])
        if slot == NO:
            continue
        d = dists[i] & 0xFF
        if worst == NO or d < worst:
            tf.targets[slot] = t
            tf.dists[slot] = d
    return n


def cancel_oldest(state) -> None:
    """ovl19:0607(): 066d(k, 2) on the active task force with the largest age (strict >, from
    -1, k = AI[+0x24a]-1..0: the highest index wins ties); nothing when none is active.
    Evidence: asm ovl19:0607..066c."""
    b = block(state)
    pick, age = NO, NO
    for k in range(s16(b.n_task_forces) - 1, -1, -1):
        tf = _tf(state, k)
        if tf.age != 0 and s16(tf.age) > age:
            age, pick = s16(tf.age), k
    if pick != NO:
        cancel_tf(state, pick, CANCEL_OLDEST)


def cancel_tf(state, k: int, reason: int = 0) -> None:
    """ovl19:066d(k, reason): role 8 on the staging city and on every source (3..0); then
    ovl27:08ba(k).  `reason` is not read.
    Evidence: asm ovl19:066d..06e8 (068f role 8, 0694..06dd sources, 06e0 08ba)."""
    b = block(state)
    tf = _tf(state, k)
    _set_role(b, s16(tf.staging), ROLE_FULL)
    for i in range(3, -1, -1):
        s = s16(tf.sources[i])
        if s != NO:
            _set_role(b, s, ROLE_FULL)
    XX.reset_tf(state, k)


def launch(state, k: int) -> tuple[int, list]:
    """ovl19:06e9(k): send a group from the staging city.  n = 12c9(staging.x + 1, staging.y,
    L, 0) (the keepers' square 0; selected by 14d3); 0 -> 0.  For i = 0..5 with a target t:
    turns = dists[i] / max(DS:5e00 - 2, 1) + 1; p = 15c5(t) (rnd); r = rnd(1,4,0); s = (10 -
    turns, or 0 when turns > 10) + p + nb_counts[i] + r, + 100 when turns == 1 (16-bit); the
    best s (strict > from -1) among targets with p > 75 or n >= 8.  None -> 0.  08b2(k, L);
    every army of L gets task force k + 1 in +0xe bits 4-6; 0f1b(k, L, best); 1.
    Evidence: asm ovl19:06e9..08b1 (0735 12c9(x + 1, y, L, 0), 0749..083b i = 0..5, 0781..07a4
    turns, 07c7 15c5, 07d7 rnd, 07f3..0812 s, 0814 + 0x64, 081d jg 0x4b, 0823 jl 8, 0829 jle,
    0851 08b2, 0857..0898 L 7..0: & 0x8f | (k + 1 & 7) << 4, 08a5 0f1b)."""
    tf = _tf(state, k)
    sc = state.cities[s16(tf.staging)]
    n, L = select_square(state, sc.x + 1, sc.y, 0)
    if n == 0:
        return 0, []
    best, bs = NO, NO
    for i in range(6):
        t = s16(tf.targets[i])
        if t == NO:
            continue
        turns = _turns(tf.dists[i], state.selection.moves)
        tc = state.cities[t]
        pw = win_odds(state, tc.x, tc.y)
        r = state.rng.rnd(*LAUNCH_ROLL)
        s = s16(LAUNCH_TURNS - turns) if LAUNCH_TURNS >= turns else 0
        s = s16(s + pw + s16(tf.nb_counts[i]) + r)
        if turns == 1:
            s = s16(s + LAUNCH_NOW)
        if (pw > ODDS or n >= LAUNCH_MANY) and s > bs:
            bs, best = s, t
    if best == NO:
        return 0, []
    record_leader(state, k, L)
    for i in range(STACK - 1, -1, -1):
        if L[i] != NO:
            a = _army(state, L[i])
            a.order = (a.order & 0x8F) | ((((k + 1) & 7) << 4) & 0xFF)
    _, events = attack_city(state, k, L, best)
    return 1, events


def record_leader(state, k: int, L: list) -> None:
    """ovl19:08b2(k, L): the highest free leader slot j (3..0) gets the first hero of L scanning
    7..0, else its strongest army (signed byte +8, strict > from -1: the highest slot on ties;
    a hero met later in the scan still wins); only that one slot is looked at.
    Evidence: asm ovl19:08b2..0995 (08bd..08da j, 08df..0969 scan: 090f type 0x1c -> 0923
    break, 0939..0961 strength jle; 096b..0981 write; 0986 return)."""
    tf = _tf(state, k)
    for j in range(3, -1, -1):
        if s16(tf.leaders[j]) != NO:
            continue
        si, best = NO, NO
        for i in range(STACK - 1, -1, -1):
            if L[i] == NO:
                continue
            a = _army(state, L[i])
            if a.type_id & 0xFF == HERO_TYPE:
                si = L[i]
                break
            v = s8(a.strength)
            if v > best:
                si, best = L[i], v
        if si != NO:
            tf.leaders[j] = si
        return


def check_leaders(state, k: int) -> None:
    """ovl19:1251(k): a leader (j = 3..0) no longer owned by the side (signed byte) or no longer
    carrying group k + 1 in +0xe bits 4-6 is removed (-1).
    Evidence: asm ovl19:1251..134b (128e -1, 12b9 cwde ==, 12cb..12e5 group, 1337 -1)."""
    p = state.current
    tf = _tf(state, k)
    for j in range(3, -1, -1):
        a = s16(tf.leaders[j])
        if a == NO:
            continue
        rec = _army(state, a)
        if not (s8(rec.owner) == p and (rec.order >> 4) & 7 == k + 1):
            tf.leaders[j] = NO


def move_groups(state, k: int) -> list:
    """ovl19:0996(k): for every leader slot j = 3..0, repeatedly: 1251(k); no leader -> next j;
    n = 13b2(leader square, L, its group, its order kind, 0) (selected by 14d3); 0 -> next j;
    0c8c:0529; the distance map 0555:1ab9(15, leader square, DS:5dfc, DS:5dfa); r = 0b49(k, L,
    enemy, 15); r == 0: the order city of the first non-empty L entry scanning 7..0 when its
    kind is 1 -> 0f1b(k, L, that city); next j; r == 1 or 3 -> next j; r == 2 -> again.
    Evidence: asm ovl19:0996..0b48 (09a1 range 15, 09a6..0b3d j loop, 09ae repeat flag, 09b6
    1251, 09cc -1, 09ee..0a3c 13b2(x, y, L, (+0xe >> 4) & 7, +0xe & 0xf, 0), 0a4b 0529, 0a79
    1ab9, 0a9c 0b49, 0aa5..0ab3, 0ab5..0b11 scan, 0b21 0f1b, 0b27 flag 0)."""
    tf = _tf(state, k)
    events: list = []
    for j in range(3, -1, -1):
        while True:
            check_leaders(state, k)
            a = s16(tf.leaders[j])
            if a == NO:
                break
            A = _army(state, a)
            n, L = select_square_order(state, A.x, A.y, (A.order >> 4) & 7, A.order & 0x0F, 0)
            if n == 0:
                break
            selection_step(state)
            sel = state.selection
            dm = P.distance_map(state, DMAP_LIMIT, A.x, A.y, sel.mode, sel.mask)
            if dm.field is None:
                raise RuntimeError("ovl19:0996: no search has written the table DS:3f86 yet")
            r, ev = near_city(state, k, L, s16(tf.enemy), DMAP_LIMIT, dm)
            events += ev
            if r == 0:
                c = NO
                for i in range(STACK - 1, -1, -1):
                    if L[i] == NO:
                        continue
                    m = _army(state, L[i])
                    if m.order & 0x0F == KIND_CITY:
                        c = m.vector_dest & 0x7F
                    break
                if c != NO:
                    _, ev = attack_city(state, k, L, c)
                    events += ev
                break
            if r in (1, 3):
                break
    return events


def near_city(state, k: int, L: list, enemy: int, rng: int, dm) -> tuple[int, list]:
    """ovl19:0b49(k, L, enemy, range): near = the enemy city (count-1..0, owner signed ==
    enemy, no intact or flag test) whose ring distance d (ovl21:0a85, flag 0; unreachable
    gives 100) is < 50 and < DS:5e00 (signed), with p = 15c5(city) > 75 (drawn only for those),
    smallest d (strict, from 1000).  r = 0c32(k, L, enemy, range); r != 0 and near != -1 ->
    r = 0f1b(k, L, near).  Returns r.
    Evidence: asm ovl19:0b49..0c31 (0b51 1b0a, 0b5c -1, 0b61 1000, 0b82 cwde ==, 0b98 0a85,
    0ba2 jge 0x32, 0ba7 jge DS:5e00, 0bcb 15c5, 0bd6 jle 0x4b, 0bdc jge, 0c01 0c32, 0c1f 0f1b,
    0c27 1b2e)."""
    events: list = []
    near, bd = NO, NEAR_START
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) != enemy:
            continue
        d, _, _ = nearest_ring(state, c, dm, 0)
        if d < NEAR_RANGE and d < s16(state.selection.moves):
            city = state.cities[c]
            pw = win_odds(state, city.x, city.y)
            if pw > ODDS and d < bd:
                near, bd = c, d
    r, ev = skirmish(state, k, L, enemy, rng, dm)
    events += ev
    if r != 0 and near != NO:
        r, ev = attack_city(state, k, L, near)
        events += ev
    return r, events


def skirmish(state, k: int, L: list, enemy: int, rng: int, dm) -> tuple[int, list]:
    """ovl19:0c32(k, L, enemy, range, map): attack an enemy stack in the open.  a = L[0]; aboard
    (+0xc & 0x1000) -> 0.  Over x = a.x - range .. a.x + range - 1 (outer), y likewise (inner),
    on the map: army bit, owner nibble == enemy, terrain not 10 / 3 / 2, |map| <= DS:5e00 - 1
    (signed), road-layer bit 0x20; then 1626(x, y) and p = 15c5(x, y) (rnd); the best p (strict
    > from 0) with p > 75 and (more than 2 armies of strength sum > 10, or a hero).  None -> 0.
    c = a's order city when its kind is 1, else -1 (read now); 0ae7(L, 4, 0, 0x20); the
    leader's goto = target; 0a8b:0001(target, 0); every L entry no longer owned (signed byte)
    becomes -1, the others get order kind 1 / city c when c != -1; 2.
    Evidence: asm ovl19:0c32..0f1a (0c3a..0c83 a, x, y, aboard, 0c9a, 0ca3..0df8 loops, 0cb5..
    0cd1 bounds, 0ce5 bit 0x10, 0d08 & 0xf ==, 0d27..0d55 terrain, 0d5a..0d7a |T| jg DS:5e00-1,
    0d88 road bit 0x20, 0da8 1626, 0db2 15c5, 0dbc..0dde, 0e06..0e38 c, 0e46 0ae7, 0e4e..0e5c
    goto, 0e66 0001, 0e6e..0f0a L, 0f0f 2)."""
    p = state.current
    a = _army(state, L[0])
    ax, ay = a.x, a.y
    if a.flags & ABOARD:
        return 0, []
    w = state.world
    tx = ty = NO
    best = 0
    lim = s16(state.selection.moves) - 1
    for x in range(ax - rng, ax + rng):
        for y in range(ay - rng, ay + rng):
            if x < 0 or y < 0 or x >= MAP_W or y >= MAP_H:
                continue
            f = w.flags[y * MAP_W + x]
            if not f & MAP_ARMY or f & MAP_OWNER_MASK != enemy:
                continue
            if int(w.terrain(x, y)) in NO_SKIRMISH_TERRAIN:
                continue
            if _abs16(dm.value(x, y)) > lim:
                continue
            if not w.roads[y * MAP_W + x] & ROAD_SEEN:
                continue
            cnt, st, heroes = count_square(state, x, y)
            pw = win_odds(state, x, y)
            if pw > ODDS and ((cnt > SKIRMISH_COUNT and st > SKIRMISH_STR) or heroes != 0) \
                    and pw > best:
                tx, ty, best = x, y, pw
    if tx == NO:
        return 0, []
    a = _army(state, L[0])
    c = (a.vector_dest & 0x7F) if a.order & 0x0F == KIND_CITY else NO
    order_stack(state, L, KIND_KEEP, 0, SKIRMISH_FLAGS)
    lead = _army(state, state.selection.selected)
    lead.goto = (tx, ty)
    _, events = M.execute_move(state, tx, ty, 0)
    for i in range(STACK):
        if L[i] == NO:
            continue
        m = _army(state, L[i])
        if s8(m.owner) != p:
            L[i] = NO
            continue
        if c != NO:
            m.order = (m.order & 0xF0) | KIND_CITY
            m.vector_dest = c & 0x7F
    return 2, events


def attack_city(state, k: int, L: list, c: int) -> tuple[int, list]:
    """ovl19:0f1b(k, L, c): march on / attack city c.  L[0] != -1 and c not intact: c = the
    intact target nearest to L[0] (dist computed for every target, strict, from 1000: the
    lowest i on ties) when there is one.  Loop: nt = the targets; L entries not owned (signed
    byte) -> -1; was = owner(c); 0ae7(L, 1, c, 0); r = 0a8b:0001(leader goto, 0); r == 1
    (no path) -> ovl24:0000(1) (the selection is deleted), 1251, 3; 1251; c not ours, or it
    was ours -> 3; capital = c's corner is our first capital (player record +0x10 / +0x12);
    not capital, nt >= 2 and flag 1 -> c = 1864(c, 0): -1 -> 1, else the next target in the
    same loop (no retarget); else (not capital) sack (flag 2) or pillage (flag 4); 134c(k, c);
    1.  A -1 entry of L before a live one (a member killed by 0c32's skirmish or in an earlier
    pass) becomes a null slot of DS:5e3e in 0ae7 (`ai.util.order_stack`), which the march's
    battle set-up copies (plan register X38).  When 1864 razes, 0001 has left DS:5e62 null
    (keep = 0): 1851 then scores on the previous search table (`ai.base.after_raze`).
    Evidence: asm ovl19:0f1b..1250 (0f2c, 0f70 terrain, 0f7b..1052 retarget: 0ff3 dist before
    103d terrain, 1063..1088 nt, 108a..10d1 drop, 10de was, 10f2 0ae7, 1108 0001, 1110 == 1,
    1117 ovl24:0000(1), 1122 / 1131 1251, 1135..115e, 1160..11b6 capital, 11b8..11d4, 11dd
    1864, 11e6 -1, 11f1..1232 sack / pillage, 123e 134c, 1244 1)."""
    p = state.current
    tf = _tf(state, k)
    events: list = []
    if L[0] != NO and not _intact(state, c):
        a0 = _army(state, L[0])
        best, pick = STAGING_START, NO
        for i in range(6):
            t = s16(tf.targets[i])
            if t == NO:
                continue
            tc = state.cities[t]
            d = distance(a0.x, a0.y, tc.x, tc.y)
            if d < best and _intact(state, t):
                pick, best = t, d
        if pick != NO:
            c = pick
    fx, fy = first_capital(state, p)
    while True:
        nt = sum(1 for i in range(6) if s16(tf.targets[i]) != NO)
        for i in range(STACK):
            if L[i] != NO and s8(_army(state, L[i]).owner) != p:
                L[i] = NO
        was = _owner(state, c)
        order_stack(state, L, KIND_CITY, c, 0)
        r, ev = _execute_leader(state)
        events += ev
        if r == NO_PATH:
            events += _delete_selection(state, 1)
            check_leaders(state, k)
            return 3, events
        check_leaders(state, k)
        if _owner(state, c) != p or p == was:
            return 3, events
        city = state.cities[c]
        capital = city.x == fx and city.y == fy
        if not capital and nt > 1 and tf.flags & TF_RAZE:
            c, ev = capture_choice(state, c, 0)
            events += ev
            if c != NO:
                continue
            return 1, events
        if not capital and tf.flags & TF_SACK:
            events += sack(state, c)
        elif not capital and tf.flags & TF_PILLAGE:
            events += pillage(state, c)
        _, ev = after_capture(state, k, c)
        events += ev
        return 1, events


def after_capture(state, k: int, c: int) -> tuple[int, list]:
    """ovl19:134c(k, c): after taking c.  c == staging -> 0.  ovl24:023f(c, 1); c leaves the
    targets (first match, i = 0..5).  tn / to = over c's / the staging city's neighbours (i =
    0..5) owned by the enemy: [d < 10] + [d < 20] + [d < 30] + [d < 50] (NB distance bytes,
    unsigned).  new = c when tn > to, else the staging city; added to the former staging
    cities (first empty slot) unless present.  tn == to == 0 -> 066d(k, 3), 0.  Else staging =
    new, role[c] = 7, 16fd(k), 1.
    Evidence: asm ovl19:134c..1578 (1382 == staging, 1394 023f(c, 1), 139c..13d9, 13db..1444
    tn, 1446..14af to, 14b1..14bd done, 14c2..14d2 jle, 14d4..14fb present, 1501..153a store,
    1546 066d(k, 3), 155a staging, 1566 role 7, 156e 16fd)."""
    b = block(state)
    tf = _tf(state, k)
    st, enemy = s16(tf.staging), s16(tf.enemy)
    if st == c:
        return 0, []
    events = _clean_city(state, c, 1)
    for i in range(6):
        if s16(tf.targets[i]) == c:
            tf.targets[i] = NO
            break

    def closeness(x):
        _, ids, dists = is_neighbour(state, x, 0)
        n = 0
        for i in range(6):
            if ids[i] != 0xFF and _owner(state, ids[i]) == enemy:
                d = dists[i] & 0xFF
                n += sum(1 for lim in TF_CLOSE if d < lim)
        return n

    tn = closeness(c)
    to = closeness(st)
    done = tn == 0 and to == 0
    new = c if tn > to else st
    if not any(s16(tf.former[i]) == new for i in range(6)):
        for i in range(6):
            if s16(tf.former[i]) == NO:
                tf.former[i] = new
                break
    if done:
        cancel_tf(state, k, CANCEL_DONE)
        return 0, events
    tf.staging = new
    _set_role(b, c, ROLE_STAGING)
    events += bring_rear(state, k)
    return 1, events


def extend_targets(state, k: int) -> None:
    """ovl19:1579(k): only with exactly one target T (the last non-empty slot): T's neighbours
    (i = 0..5) not flagged unseen: the enemy's go into the first empty target slot (the distance
    word is not written); own ones: the staging city among them -> found; else the first that
    is not a staging city (ovl27:07f8) is remembered; not found and one remembered -> it becomes
    the staging city.
    Evidence: asm ovl19:1579..16fc (15b6..15f1 count / last, 15f3 == 1, 160a 0656, 1612..16d5
    i = 0..5, 1637 bit 0, 1652 enemy -> 1657..168a, 16a9 cur -> 16b0 found, 16bb 07f8, 16c5
    first, 16da..16f4)."""
    p = state.current
    tf = _tf(state, k)
    st, enemy = s16(tf.staging), s16(tf.enemy)
    cnt, T = 0, NO
    for i in range(6):
        if s16(tf.targets[i]) != NO:
            T = s16(tf.targets[i])
            cnt += 1
    if cnt != 1:
        return
    b = block(state)
    found, newst = False, NO
    _, ids, _ = is_neighbour(state, T, 0)
    for i in range(6):
        n = ids[i]
        if n == 0xFF or b.city_flags[n] & CF_UNSEEN:
            continue
        o = _owner(state, n)
        if o == enemy:
            for j in range(6):
                if s16(tf.targets[j]) == NO:
                    tf.targets[j] = n
                    break
        elif o == p:
            if st == n:
                found = True
            if not XX.is_staging(state, n) and newst == NO:
                newst = n
    if not found and newst != NO:
        tf.staging = newst


def bring_rear(state, k: int) -> list:
    """ovl19:16fd(k): for each former staging city v (i = 0..5; not -1, not the staging city,
    owned by the side) none of whose neighbours (5..0) owned by another side (not 0x0f, not
    ours) lies at NB distance < 25: ovl24:023f(v, 1); n = 13b2(v.x + 1, v.y, L, 0, 0, +0x58);
    n > 3 -> 0ae7(L, 1, staging, 0) and 0a8b:0001(leader goto, 0).
    Evidence: asm ovl19:16fd..1863 (1711 staging, 1725 +0x58, 1748 former, 174f / 1757 / 1774,
    178b 0656, 1795..17dd count (jae 0x19), 17e6 023f, 17ee..1819 13b2 (push +0x58, push dword
    0), 1824 jle 3, 1836 0ae7, 184c 0001)."""
    p = state.current
    tf = _tf(state, k)
    st, mn = s16(tf.staging), s16(tf.min_moves)
    events: list = []
    for i in range(6):
        v = s16(tf.former[i])
        if v == NO or v == st or _owner(state, v) != p:
            continue
        _, ids, dists = is_neighbour(state, v, 0)
        danger = 0
        for j in range(5, -1, -1):
            n = ids[j]
            if n == 0xFF:
                continue
            o = state.cities[n].owner & 0xFF
            if o != NEUTRAL and s8(o) != p and dists[j] & 0xFF < REAR_DANGER:
                danger += 1
        if danger:
            continue
        events += _clean_city(state, v, 1)
        vc = state.cities[v]
        n, L = select_square_order(state, vc.x + 1, vc.y, 0, 0, mn)
        if n > REAR_MIN:
            order_stack(state, L, KIND_CITY, st, 0)
            _, ev = _execute_leader(state)
            events += ev
    return events


# ------------------------------------------------------------------------------- capture

def capture_choice(state, c: int, forced: int) -> tuple[int, list]:
    """ovl19:1864(c, forced): what the computer does with a city it took.  v = ovl31:07d0(c)
    (sack value); not forced and >= 3 of c's neighbours (5..0) ours (signed byte) at NB
    distance < 45 (unsigned) -> -1 (occupy); v >= 400 -> 199c(c) (sack), -1; else raze:
    ovl32:016b(c.x, c.y, 1), infamy += rnd(1,15,0) + 10, then ovl29:1851 (`ai.base.after_raze`,
    once), whose result (the next target city or -1) is returned.  Present points: the line
    DS:0788 with the city's name through ovl36:16b3 before the raze ("city_line"), the map
    redraw ovl24:10a1(city x, y) after the infamy (`clean_city.redraw`).
    Evidence: asm ovl19:1864..199b (1870 07d0, 1879 forced, 1891 0656, 1899..18d6 count, 18d8
    jl 3, 18e4 jl 0x190, 18ee 199c, 193c ovl32:016b, 1949 rnd, 1951 + 0xa, 1965 infamy word,
    1988 ovl24:10a1, 1990 ovl29:1851, 1995 ax)."""
    from ..base import after_raze
    p = state.current
    v = CT.sack_value(state, c)
    if not forced:
        _, ids, dists = is_neighbour(state, c, 0)
        n = 0
        for i in range(5, -1, -1):
            if ids[i] != 0xFF and _owner(state, ids[i]) == p and dists[i] & 0xFF < OCCUPY_RANGE:
                n += 1
        if n >= OCCUPY_MIN:
            return NO, []
    if v >= SACK_MIN:
        return NO, sack(state, c)
    present("city_line", fmt=RAZED_FMT, city=c)              # 18f4..1914 -> ovl36:16b3
    events = CT.raze(state, c)
    events[-1].info["infamy"] = CT._infamy(state, RAZE_ROLL, RAZE_ADD)
    city = state.cities[c]
    redraw(state, city.x, city.y)                             # ovl24:10a1 at 1988
    after_raze(state, c)
    return state.ai.raze_target, events


def sack(state, c: int) -> list:
    """ovl19:199c(c): v = ovl31:07d0(c); 0 -> 1a2a(c) (pillage); else ovl31:0941 (slots 1 ..
    emptied), infamy += rnd(1,10,0) + 5, gold += v (word); the line DS:079b with the city's
    name through ovl36:16b3 first (present point "city_line").
    Evidence: asm ovl19:199c..1a29 (19a5 07d0, 19ad 0 -> 19b4 1a2a, 19da 16b3, 19e3 0941, 19ee rnd, 19f6
    + 5, 1a0a infamy, 1a21 gold)."""
    p = state.current
    v = CT.sack_value(state, c)
    if v == 0:
        return pillage(state, c)
    present("city_line", fmt=SACKED_FMT, city=c)              # 19ba..19da -> ovl36:16b3
    CT._sack_slots(state.cities[c])
    inf = CT._infamy(state, SACK_ROLL, SACK_ADD)
    add_gold(state, p, v)
    return [E.CitySacked({"city": c, "player": p, "gold": v, "infamy": inf})]


def pillage(state, c: int) -> list:
    """ovl19:1a2a(c): v = ovl31:0834(c); 0 -> nothing; else gold += v (word), ovl31:0886 (the
    last filled slot emptied), infamy += rnd(1,5,0); the line DS:07af with the city's name
    through ovl36:16b3 first (present point "city_line").
    Evidence: asm ovl19:1a2a..1aab (1a33 0834, 1a3b 0 -> return, 1a5f 16b3, 1a79 gold, 1a7f 0886, 1a8a
    rnd, 1aa3 infamy)."""
    p = state.current
    v = CT.pillage_value(state, c)
    if v == 0:
        return []
    present("city_line", fmt=PILLAGED_FMT, city=c)            # 1a3f..1a5f -> ovl36:16b3
    add_gold(state, p, v)
    CT._pillage_slots(state.cities[c])
    inf = CT._infamy(state, PILLAGE_ROLL)
    return [E.CityPillaged({"city": c, "player": p, "gold": v, "infamy": inf})]
