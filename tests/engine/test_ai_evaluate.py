"""ovl21 evaluate / update hide / task-force classification (ai.md §6.8) as
warlords2.ai.phases.evaluate, pinned to the listing (scan orders, signed compares, the
phase-B sample rule, group trimming, no rnd)."""
from dataclasses import replace

import pytest

from warlords2.ai.phases import evaluate as EV
from warlords2.model.city import Slot
from warlords2.model.ids import Control, Terrain

from movekit import add_city as _add_city, flat_state, type_with

pytestmark = pytest.mark.gamedata


class NoRnd:
    def rnd(self, *a):
        raise AssertionError("ovl21 draws no rnd")


def add_city(st, x, y, owner):
    """movekit.add_city with the four empty production slots every real city has."""
    c = _add_city(st, x, y, owner)
    st.cities[c].slots = [Slot() for _ in range(4)]
    return c


def mk(game, **opts):
    st = flat_state(game)
    st.options = replace(st.options, **opts)
    st.ai.allocated = 1
    for p in st.players:
        p.alive, p.control = 1, Control.COMPUTER
    st.rng = NoRnd()
    st.ai.neighbours.ids = [0xFF] * 600
    st.ai.neighbours.dists = [0] * 600
    return st


def raze_tiles(st, c):
    city = st.cities[c]
    for dx in (0, 1):
        for dy in (0, 1):
            st.world.tiles[(city.y + dy) * 112 + city.x + dx] = int(Terrain.PLAIN)


def test_evaluate_counts_roles_and_ages(game):
    """0000: +2/+4/+6/+8 recounted (+0 kept and counted up only with an own city); razed ->
    role / age 0; own: age + 1 (byte wraps), role 0 -> 1 -> 3 / 5 by ovl20:01f6; foreign:
    role / age 0, +8 counts the unseen ones."""
    st = mk(game)
    own = add_city(st, 10, 10, 0)
    own2 = add_city(st, 30, 10, 0)
    neu = add_city(st, 13, 10, 0x0F)
    foe = add_city(st, 50, 10, 4)
    raz = add_city(st, 70, 10, 0)
    raze_tiles(st, raz)
    b = st.ai[0]
    b.turns_with_cities = 7
    b.age[own], b.age[own2] = 255, 3
    b.role[own2] = 8
    b.role[foe] = b.age[foe] = 6
    b.role[raz] = 5
    b.city_flags[foe] = b.city_flags[neu] = 1
    st.ai.neighbours.ids[own * 6] = neu
    st.ai.neighbours.dists[own * 6] = 30
    EV.evaluate(st, 0)
    assert (b.own_cities, b.enemy_cities, b.neutral_cities, b.unseen_cities) == (2, 1, 1, 2)
    assert b.turns_with_cities == 8
    assert (b.age[own], b.age[own2], b.age[foe], b.age[raz]) == (0, 4, 0, 0)
    assert (b.role[own], b.role[own2], b.role[foe], b.role[raz]) == (3, 8, 0, 0)
    b.role[own] = 0
    st.ai.neighbours.ids[own * 6] = 0xFF
    EV.evaluate(st, 0)
    assert b.role[own] == 5


def test_evaluate_without_cities_keeps_turn_count(game):
    """012a: AI[+2] == 0 returns before the second loop and before AI[+0] += 1."""
    st = mk(game)
    add_city(st, 10, 10, 3)
    st.ai[0].turns_with_cities = 4
    EV.evaluate(st, 0)
    assert st.ai[0].turns_with_cities == 4 and st.ai[0].own_cities == 0


def test_evaluate_role_8_to_11(game):
    """0143: role 8 with unseen cities left, AI[+0x24] < 5 (signed) and the flying-slot bit
    (refreshed by 09cf first) -> 11."""
    st = mk(game)
    own = add_city(st, 10, 10, 0)
    foe = add_city(st, 50, 10, 4)
    flyer = type_with(st, flag16=1)
    walker = type_with(st, flag16=0)
    b = st.ai[0]
    b.city_flags[foe] = 1
    b.role[own] = 8
    st.cities[own].slots = [Slot(walker, 1, 2, 10, 1), Slot(), Slot(), Slot()]
    EV.evaluate(st, 0)
    assert b.role[own] == 8
    st.cities[own].slots[3] = Slot(flyer, 1, 2, 10, 1)
    b.explorers = 5
    EV.evaluate(st, 0)
    assert b.role[own] == 8 and b.city_flags[own] & 2
    b.explorers = -1
    EV.evaluate(st, 0)
    assert b.role[own] == 11


def test_flying_slot_bits_any_owner_intact_only(game):
    """09cf: every intact city, any owner; a razed city keeps its old bit; type 0xff is empty."""
    st = mk(game)
    flyer = type_with(st, flag16=1)
    a = add_city(st, 10, 10, 5)
    r = add_city(st, 30, 10, 0)
    st.cities[a].slots = [Slot(), Slot(), Slot(flyer, 1, 1, 1, 1), Slot()]
    st.cities[r].slots = [Slot()] * 4
    raze_tiles(st, r)
    st.ai[0].city_flags[r] = 2
    EV.flying_slot_bits(st)
    assert st.ai[0].city_flags[a] == 2 and st.ai[0].city_flags[r] == 2


def test_clear_unseen_box_and_hidden_map(game):
    """0b95: a 0x20 road-layer bit anywhere in x0-1..x0+2 x y0-1..y0+2 clears bit 0; 0b55 only
    with Hidden Map, only for flagged cities."""
    st = mk(game)
    c = add_city(st, 10, 10, 0x0F)
    st.ai[0].city_flags[c] = 1
    st.world.roads[13 * 112 + 12] = 0x20         # (x0+2, y0+3): outside
    EV.clear_unseen(st, c)
    assert st.ai[0].city_flags[c] == 1
    st.world.roads[12 * 112 + 12] = 0x20         # (x0+2, y0+2): inside
    EV.refresh_unseen(st)
    assert st.ai[0].city_flags[c] == 1           # no Hidden Map: 0b55 does nothing
    st.options = replace(st.options, hidden_map=1)
    EV.refresh_unseen(st)
    assert st.ai[0].city_flags[c] == 0


def test_update_hide_role_2_to_3(game):
    """0c1c: role 2 -> 3 when a 01f6 neighbour is seen (bit 0 clear)."""
    st = mk(game, hidden_map=1)
    c = add_city(st, 10, 10, 0)
    n = add_city(st, 20, 10, 0x0F)
    b = st.ai[0]
    b.role[c] = 2
    b.city_flags[n] = 1
    st.ai.neighbours.ids[c * 6 + 4] = n
    st.ai.neighbours.dists[c * 6 + 4] = 10
    EV.update_hide(st)
    assert b.role[c] == 2
    st.world.roads[10 * 112 + 21] = 0x20
    EV.update_hide(st)
    assert b.role[c] == 3


# ------------------------------------------------------------------------------- 01b3


def slots(st, c, *specs):
    st.cities[c].slots = [Slot(t, 1, s, m, 1) for t, s, m in specs] + [Slot()] * (4 - len(specs))


def tf_state(game, n_active):
    st = mk(game)
    b = st.ai[0]
    b.n_task_forces = 4
    for k in range(n_active):
        b.task_forces[k].age = 1
        b.task_forces[k].staging = -1
    return st


def test_tf_groups_sample_threshold(game, monkeypatch):
    """B / C: the sample takes the 1a4d slot's effective strength of every own city without
    role 7; AI[+0x3a] = min(4, smallest)."""
    st = tf_state(game, 0)
    t = type_with(st, flag16=0, cancel_mode=0)
    cs = [add_city(st, 10 + 3 * i, 10, 0) for i in range(3)]
    for c, s in zip(cs, (5, 3, 9)):
        slots(st, c, (t, s, 10))
    st.ai[0].role[cs[2]] = 7
    monkeypatch.setattr("warlords2.ai.util.can_build_decent", lambda st_, c: (1, 0))
    EV.tf_groups(st)
    assert st.ai[0].min_member_strength == 3
    st.ai[0].role[cs[1]] = 7
    EV.tf_groups(st)
    assert st.ai[0].min_member_strength == 4


def test_tf_groups_full_sample_replaces_below_previous(game, monkeypatch):
    """Once the 8 words are full, v replaces the smallest entry below the previous city's v
    (strict, 7..0), not the smallest overall - here 1 survives because the previous v is 1."""
    st = tf_state(game, 0)
    t = type_with(st, flag16=0, cancel_mode=0)
    vals = [1, 9, 9, 9, 9, 9, 9, 9, 1, 2]       # scanned count-1..0: reversed below
    cs = [add_city(st, 3 + 3 * i, 10, 0) for i in range(len(vals))]
    for c, v in zip(cs, reversed(vals)):
        slots(st, c, (t, v, 10))
    monkeypatch.setattr("warlords2.ai.util.can_build_decent", lambda st_, c: (1, 0))
    EV.tf_groups(st)
    # 8 values fill the sample; 9th (v = 1, prev 9): smallest below 9 is the 1 -> 1 stays 1;
    # 10th (v = 2, prev 1): nothing below 1 -> not inserted: minimum stays 1.
    assert st.ai[0].min_member_strength == 1


def test_tf_groups_flyer_fast_medium_and_parameters(game, monkeypatch):
    """D (4 active): flying slot of strength > 4 -> 0x40; with <= 3 such cities every one is
    released in E (and re-tested: fast) and flag 0x20 stays off (+0x58 8).  E: moves >= 16 ->
    0x80 (6 cities: F releases the first 2 met in scan order count-1..0 and makes them medium,
    4 keep it; TF 2 flag 8, +0x58 16).  F/G: 3 medium cities (<= 3): all trimmed, no flag."""
    st = tf_state(game, 4)
    fly = type_with(st, flag16=1, cancel_mode=0)
    walk = type_with(st, flag16=0, cancel_mode=0)
    monkeypatch.setattr("warlords2.ai.util.can_build_decent", lambda st_, c: (1, 0))
    b = st.ai[0]
    flyc = add_city(st, 3, 3, 0)
    slots(st, flyc, (fly, 5, 20))
    fast = [add_city(st, 3 + 3 * i, 20, 0) for i in range(5)]
    for c in fast:
        slots(st, c, (walk, 4, 16))
    med = add_city(st, 3, 40, 0)
    slots(st, med, (walk, 4, 12))
    for c in [flyc] + fast + [med]:
        b.role[c] = 8
    EV.flying_slot_bits(st)
    EV.tf_groups(st)
    assert b.n_flyer_cities == 1 and not b.city_flags[flyc] & 0x40
    assert b.city_flags[flyc] & 0x80            # released, then fast (16 moves, w15 no, 5 >= 4)
    assert b.n_fast_cities == 6
    kept = [c for c in [flyc] + fast if b.city_flags[c] & 0x80]
    assert kept == [flyc] + fast[:3] and b.n_medium_cities == 3
    tfs = b.task_forces
    assert (tfs[2].flags & 8, tfs[2].min_moves) == (8, 16)
    assert (tfs[3].flags & 0x20, tfs[3].min_moves) == (0, 8)
    assert tfs[1].flags & 0x10 == 0 and tfs[0].min_moves == 8
    assert b.city_flags[med] & 8 == 0           # one medium city: trimmed by G (r = 1)


def test_tf_groups_full_sample_takes_the_smallest_below(game, monkeypatch):
    """B, full sample: v replaces the *smallest* entry below the previous city's v (the running
    minimum of 02e0..02ee, cx = the last entry taken), not the first one met from slot 7 down:
    sample 3, 1, 9 x 6 (slots 7..0), then v = 4 after v = 9 replaces the 1 -> minimum 3."""
    st = tf_state(game, 0)
    t = type_with(st, flag16=0, cancel_mode=0)
    scan = [3, 1, 9, 9, 9, 9, 9, 9, 4]             # in scan order (count-1..0)
    cs = [add_city(st, 3 + 3 * i, 10, 0) for i in range(len(scan))]
    for c, v in zip(cs, reversed(scan)):
        slots(st, c, (t, v, 10))
    monkeypatch.setattr("warlords2.ai.util.can_build_decent", lambda st_, c: (1, 0))
    EV.tf_groups(st)
    assert st.ai[0].min_member_strength == 3


@pytest.mark.parametrize("strength, flyers", [(4, 0), (5, 1)])
def test_tf_groups_flyer_needs_strength_above_4(game, monkeypatch, strength, flyers):
    """D: a flying slot counts only with strength > 4 (03ea `jle 4`)."""
    st = tf_state(game, 4)
    fly = type_with(st, flag16=1, cancel_mode=0)
    monkeypatch.setattr("warlords2.ai.util.can_build_decent", lambda st_, c: (1, 0))
    c = add_city(st, 10, 10, 0)
    slots(st, c, (fly, strength, 20))
    st.ai[0].role[c] = 8
    EV.flying_slot_bits(st)
    EV.tf_groups(st)
    assert st.ai[0].n_flyer_cities == flyers


def test_tf_groups_four_flyer_cities_are_kept(game, monkeypatch):
    """E: with exactly 4 flyer cities the surplus r is 0 (041e: n > 3 -> n - 4), so every 0x40
    city is skipped (0495..0499) - neither released nor tested for fast; TF 3 gets flag 0x20 and
    +0x58 12.  With 5, only the first met in scan order (count-1..0) is released (and counted
    fast)."""
    st = tf_state(game, 4)
    fly = type_with(st, flag16=1, cancel_mode=0)
    monkeypatch.setattr("warlords2.ai.util.can_build_decent", lambda st_, c: (1, 0))
    b = st.ai[0]
    cs = [add_city(st, 3 + 3 * i, 10, 0) for i in range(4)]
    for c in cs:
        slots(st, c, (fly, 5, 20))
        b.role[c] = 8
    EV.flying_slot_bits(st)
    EV.tf_groups(st)
    assert b.n_flyer_cities == 4 and b.n_fast_cities == 0
    assert all(b.city_flags[c] & 0xC0 == 0x40 for c in cs)
    assert (b.task_forces[3].flags & 0x20, b.task_forces[3].min_moves) == (0x20, 12)
    c5 = add_city(st, 30, 10, 0)
    slots(st, c5, (fly, 5, 20))
    b.role[c5] = 8
    EV.flying_slot_bits(st)
    EV.tf_groups(st)
    assert b.n_flyer_cities == 5 and b.n_fast_cities == 1
    assert b.city_flags[c5] & 0x40 == 0          # released in E (then fast; F releases it again)
    assert all(b.city_flags[c] & 0xC0 == 0x40 for c in cs)


def test_tf_groups_many_fast_cities_medium_needs_16(game, monkeypatch):
    """F with more than 7 fast cities (053b): a slot with 12 <= moves < 16 is counted (+0x12)
    but does not make the city medium (065a..066f); the 4 released fast cities (16 moves) do."""
    st = tf_state(game, 3)
    walk = type_with(st, flag16=0, cancel_mode=0)
    monkeypatch.setattr("warlords2.ai.util.can_build_decent", lambda st_, c: (1, 0))
    b = st.ai[0]
    med = add_city(st, 3, 40, 0)                   # index 0: scanned last
    fast = [add_city(st, 3 + 3 * i, 20, 0) for i in range(8)]
    slots(st, med, (walk, 4, 12))
    for c in fast:
        slots(st, c, (walk, 4, 16))
    for c in [med] + fast:
        b.role[c] = 8
    EV.tf_groups(st)
    assert b.n_fast_cities == 8
    assert b.n_medium_cities == 4 and b.city_flags[med] & 8 == 0
    assert [c for c in fast if b.city_flags[c] & 8] == fast[4:]
    assert b.task_forces[0].min_moves == 8          # 5 medium slots: not > 7


@pytest.mark.parametrize("n_slots, mv0", [(8, 12), (7, 8)])
def test_tf_groups_task_force_0_by_medium_slots(game, monkeypatch, n_slots, mv0):
    """H, TF 0: +0x58 = 12 when F counted more than 7 qualifying slots (069c `jle 7`), else 8;
    the count is per slot, not per city."""
    st = tf_state(game, 2)
    walk = type_with(st, flag16=0, cancel_mode=0)
    monkeypatch.setattr("warlords2.ai.util.can_build_decent", lambda st_, c: (1, 0))
    b = st.ai[0]
    a, c = add_city(st, 10, 10, 0), add_city(st, 20, 10, 0)
    slots(st, a, *[(walk, 4, 12)] * 4)
    slots(st, c, *[(walk, 4, 12)] * (n_slots - 4))
    b.role[a] = b.role[c] = 8
    EV.tf_groups(st)
    assert b.task_forces[0].min_moves == mv0
