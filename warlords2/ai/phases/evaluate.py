"""ovl21 (without 084d / 0d7b = ai/cards.py and 0a85 = ai/util.py `nearest_ring`): the evaluate
phase, the task-force capability classification and the Hidden-Map unseen bits (ai.md §6.8).

* `evaluate(state, side)` = ovl21:0000 (ovl25:0205, the caller pushes SCN 0x110),
* `tf_groups` = ovl21:01b3 (called by assault ovl19:0011 and assault XX ovl27:01b2),
* `flying_slot_bits` = 09cf, `refresh_unseen` = 0b55, `clear_unseen` = 0b95 (also called by
  ovl20:10a8), `update_hide` = 0c1c (the "update hide" phase, Hidden Map only, ovl25:0292).
ovl21:0c92..0cd7 are unreachable (ai.md §6.8) and left out.  No rnd anywhere here.

The per-type bytes DS:45c4 + 6t (flies, w16) and DS:45c9 + 6t (w15) are the army type's
`flag16` and `cancel_mode` words (`rules.movement.type_flag`).
"""
from __future__ import annotations

from ...model.ids import MAP_H, MAP_W, NO_OWNER, ROAD_SEEN, Terrain
from ...rules import movement as M
from ...rules.bonuses import s8
from ...rules.economy import s16
from ..state import block

ROLE_NONE, ROLE_NEW, ROLE_EXPLORE, ROLE_EXPAND = 0, 1, 2, 3     # ai.md §3.2
ROLE_INTERIOR, ROLE_STAGING, ROLE_FULL, ROLE_FLYER = 5, 7, 8, 11
CF_UNSEEN, CF_FLYING_SLOT = 0x01, 0x02                          # AI[+0x11e + c]
CF_TF_MEDIUM, CF_TF_FLYER, CF_TF_FAST = 0x08, 0x40, 0x80        # ovl21:068c, 040a, 0527
CF_KEEP_B = 0x37                                                # ovl21:024a (& 0x37)
EXPLORERS_MAX = 5                                               # ovl21:0155 (jge 5)
TF_FAST, TF_MEDIUM, TF_FLYER = 0x08, 0x10, 0x20                 # TF +0x5a bits (ovl21:07e3, 07b9, 081f)
SAMPLE = 8                                                      # ovl21:01fe (8 words at bp-0x24)
STRENGTH_START = 100                                            # ovl21:0315
MIN_STRENGTH_CAP = 4                                            # ovl21:0347
W15_BONUS = 2                                                   # ovl21:02b0
FLYER_STRENGTH = 4                                              # ovl21:03ea (jle 4)
FAST_MOVES, MEDIUM_MOVES = 16, 12                               # ovl21:0507, 064f
GROUP_KEEP = 4                                                  # ovl21:041e..042e (> 3: r = n - 4)
MANY = 7                                                        # ovl21:053b, 069c (> 7)
MIN_MOVES_DEFAULT = 8                                           # ovl21:075b
MIN_MOVES = {0: 12, 1: 12, 2: 16, 3: 12}                        # ovl21:0779, 0830, 07f4, 0830
UNSEEN_BOX = (-1, 2)                                            # ovl21:0bc6..0bcb: x0-1..x0+2


def _neutral_neighbours(state, c: int):
    """ovl20:01f6 (ai/phases/neutral.py `neutral_neighbours`, M8b3) -> (count, ids, dists)."""
    from .neutral import neutral_neighbours
    return neutral_neighbours(state, c)


def _source_ok(state, c: int, also6: int) -> int:
    """ovl27:0a7a (ai/phases/assault_xx.py `source_ok`)."""
    from .assault_xx import source_ok
    return source_ok(state, c, also6)


def _intact(state, c: int) -> bool:
    city = state.cities[c]
    return state.world.terrain(city.x, city.y) == Terrain.CITY


def _slot_type(city, s: int) -> int:
    return s8(city.slots[s].type)


def evaluate(state, side: int) -> list:
    """ovl21:0000(side): 09cf; 0b55; AI[+2..+8] = 0 (+0 is kept); per city c = count-1..0: not
    intact (terrain at the corner != 10) -> role = 0, age = 0; owned by `side` (signed byte vs
    the word) -> AI[+2] += 1, age += 1 (byte, wraps), role 0 -> 1; else AI[+8] += 1 when the
    unseen bit is set (tested before the role is zeroed), role = age = 0, AI[+6] (neutral, owner
    byte 0x0f) or AI[+4] (another side) += 1.  No own city -> return (AI[+0] not counted).
    Then per city c = count-1..0 (no owner test): role 8 with AI[+8] != 0, AI[+0x24] < 5
    (signed) and the flying-slot bit -> 11; role 1 -> 3 when ovl20:01f6(c) finds a neutral
    neighbour, else 5.  AI[+0] += 1.  No rnd.
    Evidence: asm ovl21:0000..01b2 (0006 09cf, 000b 0b55, 000f..0021 words, 002a loop 011c,
    006b terrain 10, 0079..0084 role / age, 009d cwde == [bp+6], 00a8 bit 0 -> 00b4 +8, 00be..00c9,
    00d9 0x0f -> 00e5 +6 / 00ef +4, 00f9 +2, 00ff inc byte, 010a 0 -> 1, 012a +2 == 0 ->
    return, 0136 loop 01a1, 0143..016c 8 -> 11, 0177..019d 01f6(c, 0, 0) -> 3 / 5, 01ac
    inc +0)."""
    b = block(state)
    flying_slot_bits(state)
    refresh_unseen(state)
    b.unseen_cities = b.neutral_cities = b.enemy_cities = b.own_cities = 0
    for c in range(len(state.cities) - 1, -1, -1):
        if not _intact(state, c):
            b.role[c] = ROLE_NONE
            b.age[c] = 0
            continue
        city = state.cities[c]
        if s8(city.owner) == side:
            b.own_cities = s16(b.own_cities + 1)
            b.age[c] = (b.age[c] + 1) & 0xFF
            if b.role[c] == ROLE_NONE:
                b.role[c] = ROLE_NEW
            continue
        if b.city_flags[c] & CF_UNSEEN:
            b.unseen_cities = s16(b.unseen_cities + 1)
        b.role[c] = ROLE_NONE
        b.age[c] = 0
        if city.owner & 0xFF == NO_OWNER:
            b.neutral_cities = s16(b.neutral_cities + 1)
        else:
            b.enemy_cities = s16(b.enemy_cities + 1)
    if b.own_cities == 0:
        return []
    for c in range(len(state.cities) - 1, -1, -1):
        if (b.role[c] == ROLE_FULL and b.unseen_cities != 0 and s16(b.explorers) < EXPLORERS_MAX
                and b.city_flags[c] & CF_FLYING_SLOT):
            b.role[c] = ROLE_FLYER
        if b.role[c] == ROLE_NEW:
            n, _, _ = _neutral_neighbours(state, c)
            b.role[c] = ROLE_EXPAND if n != 0 else ROLE_INTERIOR
    b.turns_with_cities = s16(b.turns_with_cities + 1)
    return []


def flying_slot_bits(state) -> None:
    """ovl21:09cf(): for every intact city c = count-1..0 (any owner): AI flag bit 1 = some slot
    s = 3..0 holds a type (signed byte != -1) whose flies byte DS:45c4[6t] is set.  Razed cities
    keep their bit.
    Evidence: asm ovl21:09cf..0a84 (09db loop, 0a1c terrain 10, 0a2c &= 0xfd, 0a32..0a62 slots:
    cwde, cmp 0xffff, 45c4 + 6t, 0a68 |= 2)."""
    b = block(state)
    for c in range(len(state.cities) - 1, -1, -1):
        if not _intact(state, c):
            continue
        b.city_flags[c] &= ~CF_FLYING_SLOT & 0xFF
        city = state.cities[c]
        f = 0
        for s in range(3, -1, -1):
            t = _slot_type(city, s)
            if t != -1 and M.type_flag(state, t, "flag16"):
                f = 1
        if f:
            b.city_flags[c] |= CF_FLYING_SLOT


def clear_unseen(state, c: int) -> None:
    """ovl21:0b95(c): clear AI flag bit 0 of city c when any square x0-1..x0+2 x y0-1..y0+2 of
    the 4x4 block around its corner has the road-layer bit 0x20 (explored).  The original reads
    without a bounds check (19d9:[y*0x70 + x], 16-bit offsets): x = -1 / 0x70 read the
    neighbouring row's byte, which the linear index reproduces; y = -1 wraps to 19d9:ff90 + x
    (unknown memory), refused here (cities never stand on row 0).
    Evidence: asm ovl21:0b95..0c1b (0bc6 / 0bcb loops inclusive, 0bd8 bit 0x20, 0c12 &= 0xfe)."""
    city = state.cities[c]
    roads = state.world.roads
    seen = 0
    for x in range(city.x + UNSEEN_BOX[0], city.x + UNSEEN_BOX[1] + 1):
        for y in range(city.y + UNSEEN_BOX[0], city.y + UNSEEN_BOX[1] + 1):
            i = y * MAP_W + x
            if y < 0 or not 0 <= i < MAP_W * MAP_H:
                raise RuntimeError("ovl21:0b95 reads outside the road layer at (%d, %d)" % (x, y))
            if roads[i] & ROAD_SEEN:
                seen = 1
    if seen:
        block(state).city_flags[c] &= ~CF_UNSEEN & 0xFF


def refresh_unseen(state) -> None:
    """ovl21:0b55(): with Hidden Map, 0b95(c) for every city c = count-1..0 still flagged unseen.
    Evidence: asm ovl21:0b55..0b94 (0b5e SCN 0x124, 0b6b loop, bit 0 test)."""
    if not state.options.hidden_map:
        return
    b = block(state)
    for c in range(len(state.cities) - 1, -1, -1):
        if b.city_flags[c] & CF_UNSEEN:
            clear_unseen(state, c)


def update_hide(state) -> list:
    """ovl21:0c1c(): 0b55; then every city c = count-1..0 with role 2 becomes role 3 as soon as
    one of its ovl20:01f6 neighbours (ids i = 5..0) is no longer flagged unseen.
    Evidence: asm ovl21:0c1c..0c91 (0c24 0b55, 0c2d loop 0c87, 0c3a role 2, 0c4a 01f6(c, ids,
    NULL), 0c52..0c80 i = 5..0, 0c57 byte != 0xff, flag bit 0, 0c79 role 3, break)."""
    refresh_unseen(state)
    b = block(state)
    for c in range(len(state.cities) - 1, -1, -1):
        if b.role[c] != ROLE_EXPLORE:
            continue
        _, ids, _ = _neutral_neighbours(state, c)
        for i in range(5, -1, -1):
            d = ids[i] & 0xFF
            if d != 0xFF and not b.city_flags[d] & CF_UNSEEN:
                b.role[c] = ROLE_EXPAND
                break
    return []


def tf_groups(state) -> int:
    """ovl21:01b3(): task-force capability classification (ai.md §6.8, phases A-H).
    A: active task forces (k = AI[+0x24a]-1..0); +0x3a..+0x40 = 0.  B: for every own city
    (count-1..0; flags &= 0x37) without role 7 whose ovl29:1a4d(c, &slot) passes, v = the
    slot's effective strength (signed byte, + 2 for w15 == 1) goes into an 8-word sample (the
    first empty slot from 7 down; once full, the smallest entry below the previous city's v,
    strict, highest index on ties).  C: AI[+0x3a] = min(4, the smallest non-zero sample, from
    100).  D (4 active): own ok cities (0a7a(c, 1)) with the flying-slot bit and a flying slot
    of strength > 4 -> bit 0x40, AI[+0x3c] += 1.  E (>= 3): bit 0x40 cities beyond the first 4
    are released in scan order; fast (w15 or strength >= AI[+0x3a], moves >= 16) -> bit 0x80,
    AI[+0x3e] += 1.  F (>= 2): likewise for 0x80; medium (moves >= 12, and >= 16 when more
    than 7 fast cities), counting the qualifying slots -> bit 8, AI[+0x40] += 1.  G: bit 8
    trimmed to 4 (no ok test).  H: per active k: +0x58 = 8; TF 0: 12 with more than 7
    medium slots; TF 1 / 2 / 3: flag 0x10 / 0x08 / 0x20 and +0x58 12 / 16 / 12 when that group
    kept 4 cities.  Returns 0 (ax at 0841; both callers ignore it).
    Evidence: asm ovl21:01b3..0844 (phases as ai.md §6.8; jump table cs:0845)."""
    p = state.current
    b = block(state)
    cities = state.cities
    n_tf = 0
    for k in range(s16(b.n_task_forces) - 1, -1, -1):
        if b.task_forces[k].age != 0:
            n_tf += 1
    b.n_medium_cities = b.n_fast_cities = b.n_flyer_cities = b.min_member_strength = 0
    arr = [0] * SAMPLE
    from ..util import can_build_decent
    v_prev = None
    for c in range(len(cities) - 1, -1, -1):          # B
        if s8(cities[c].owner) != p:
            continue
        b.city_flags[c] &= CF_KEEP_B
        if b.role[c] == ROLE_STAGING:
            continue
        ok, slot = can_build_decent(state, c)
        if not ok:
            continue
        lim, idx = v_prev, -1
        sl = cities[c].slots[slot]
        v = s8(sl.strength)
        if M.type_flag(state, s8(sl.type), "cancel_mode") == 1:
            v += W15_BONUS
        for i in range(SAMPLE - 1, -1, -1):
            if arr[i] == 0:
                arr[i] = v
                idx = -1
                break
            if lim is None:
                raise RuntimeError("ovl21:01b3: a full sample before any city set di")
            if arr[i] < lim:
                lim, idx = arr[i], i
        if idx != -1:
            arr[idx] = v
        v_prev = v
    m = STRENGTH_START                                # C
    for i in range(SAMPLE - 1, -1, -1):
        if arr[i] != 0 and arr[i] < m:
            m = arr[i]
    b.min_member_strength = MIN_STRENGTH_CAP if m > MIN_STRENGTH_CAP else m

    def own_ok(c):
        return s8(cities[c].owner) == p and _source_ok(state, c, 1)

    if n_tf == 4:                                     # D
        for c in range(len(cities) - 1, -1, -1):
            if not own_ok(c) or not b.city_flags[c] & CF_FLYING_SLOT:
                continue
            f = 0
            for s in range(3, -1, -1):
                t = _slot_type(cities[c], s)
                if (t >= 0 and M.type_flag(state, t, "flag16")
                        and s8(cities[c].slots[s].strength) > FLYER_STRENGTH):
                    f = 1
            if f:
                b.n_flyer_cities = s16(b.n_flyer_cities + 1)
                b.city_flags[c] |= CF_TF_FLYER
    f3c, r = _keep(b.n_flyer_cities)
    if n_tf >= 3:                                     # E
        for c in range(len(cities) - 1, -1, -1):
            if not own_ok(c):
                continue
            if b.city_flags[c] & CF_TF_FLYER:
                if r == 0:
                    continue
                b.city_flags[c] &= ~CF_TF_FLYER & 0xFF
                r -= 1
            f = 0
            for s in range(3, -1, -1):
                sl = cities[c].slots[s]
                t = s8(sl.type)
                if t < 0:
                    continue
                if ((M.type_flag(state, t, "cancel_mode") == 1
                     or s8(sl.strength) >= s16(b.min_member_strength))
                        and s8(sl.moves) >= FAST_MOVES):
                    f = 1
            if f:
                b.n_fast_cities = s16(b.n_fast_cities + 1)
                b.city_flags[c] |= CF_TF_FAST
    fast_many = s16(b.n_fast_cities) > MANY
    nslots = 0
    f3e, r = _keep(b.n_fast_cities)
    if n_tf >= 2:                                     # F
        for c in range(len(cities) - 1, -1, -1):
            if not own_ok(c):
                continue
            if b.city_flags[c] & CF_TF_FLYER:
                continue
            if b.city_flags[c] & CF_TF_FAST:
                if r == 0:
                    continue
                b.city_flags[c] &= ~CF_TF_FAST & 0xFF
                r -= 1
            f = 0
            for s in range(3, -1, -1):
                sl = cities[c].slots[s]
                t = s8(sl.type)
                if t < 0:
                    continue
                if ((M.type_flag(state, t, "cancel_mode") == 1
                     or s8(sl.strength) >= s16(b.min_member_strength))
                        and s8(sl.moves) >= MEDIUM_MOVES):
                    nslots += 1
                    if not fast_many or s8(sl.moves) >= FAST_MOVES:
                        f = 1
            if f:
                b.n_medium_cities = s16(b.n_medium_cities + 1)
                b.city_flags[c] |= CF_TF_MEDIUM
    many12 = nslots > MANY
    f40, r = _keep(b.n_medium_cities)
    for c in range(len(cities) - 1, -1, -1):          # G
        fl = b.city_flags[c]
        if (s8(cities[c].owner) == p and fl & (CF_TF_FLYER | CF_TF_FAST) == 0
                and fl & CF_TF_MEDIUM and r != 0):
            b.city_flags[c] &= ~CF_TF_MEDIUM & 0xFF
            r -= 1
    for k in range(s16(b.n_task_forces) - 1, -1, -1):   # H
        tf = b.task_forces[k]
        if tf.age == 0:
            continue
        tf.min_moves = MIN_MOVES_DEFAULT
        if not 0 <= k <= 3:
            continue
        if k == 0:
            tf.min_moves = MIN_MOVES[0] if many12 else MIN_MOVES_DEFAULT
        elif k == 1:
            tf.flags = s16(tf.flags & ~TF_MEDIUM)
            if f40:
                tf.flags |= TF_MEDIUM
                tf.min_moves = MIN_MOVES[1]
        elif k == 2:
            tf.flags = s16(tf.flags & ~TF_FAST)
            if f3e:
                tf.flags |= TF_FAST
                tf.min_moves = MIN_MOVES[2]
        else:
            tf.flags = s16(tf.flags & ~TF_FLYER)
            if f3c:
                tf.flags |= TF_FLYER
                tf.min_moves = MIN_MOVES[3]
    return 0


def _keep(n: int) -> tuple[bool, int]:
    """(n > 3, the surplus to release: n - 4 when n > 3, else n) (ovl21:041e..043c and the
    two copies at 0555, 06b0)."""
    n = s16(n)
    if n > GROUP_KEEP - 1:
        return True, n - GROUP_KEEP
    return False, n
