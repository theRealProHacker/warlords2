"""ovl24 (ai.md §6.9) as warlords2.ai.phases.clean_city, pinned to the listing: the 023f scan,
the rnd(1,6,-1) gate, roles, disbanding, flyer exploring, the 8-per-square placement, 0a3d,
the 0b5c garrison order, and the deletion helpers 015e / 0000 / 00ca."""
import pytest

from warlords2.ai.phases import clean_city as CC
from warlords2.model.ids import MAP_ARMY, MAP_W, Relation
from warlords2.model.options import GameOptions
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import diplomacy as D

from movekit import add_army, add_city, flat_state

pytestmark = pytest.mark.gamedata

HERO, BATS, PEGASI, LINF, HINF, CATA = 28, 15, 8, 2, 1, 10
SCOUTS, ARCHONS, DEVILS, DRAGONS = 11, 19, 27, 25
DWARVES, ARCHERS, WORMS, HCAV = 3, 6, 20, 4


class Rec:
    """rng stand-in: records every draw; scripted results first, then the real dice."""
    def __init__(self, rng, script=None):
        self.rng, self.calls, self.script = rng, [], list(script or [])

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.script.pop(0) if self.script else self.rng.rnd(d, s, a)


def high(st):
    st.flags[SCN_ARMY_HIGH] = len(st.armies)


def make(game, options=GameOptions(), script=None):
    st = flat_state(game, options=options)
    st.ai.allocated = 1
    st.ai.neighbours.ids = [0xFF] * 600
    st.rng = Rec(st.rng, script)
    return st


@pytest.fixture
def calls(monkeypatch):
    log = []
    monkeypatch.setattr(CC, "_pick_up", lambda st, x, y: log.append(("pick_up", x, y, st.selection.hero)) or [])
    monkeypatch.setattr(CC, "_share_items", lambda st, h: log.append(("share", list(h))) or [])
    monkeypatch.setattr(CC, "_nearest_foreign_army", lambda st, x, y, s: log.append(("0a3e", x, y, s)) or 1000)
    monkeypatch.setattr(CC, "_explore", lambda st, a, c: log.append(("explore", a, c)) or [])
    return log


def armies(st, types, x, y, owner=0):
    out = [add_army(st, t, x, y, owner) for t in types]
    high(st)
    return out


# ------------------------------------------------------------------------------- 01f1

def test_clean_cities_scans_own_unprocessed_cities_downwards(game, monkeypatch):
    """01f1: c = count-1..0, owner byte == SCN 0x110, AI[+0x11e+c] bit 2 clear -> 023f(c, 0)."""
    st = make(game)
    for i, o in enumerate((0, 1, 0, 0)):
        add_city(st, 10 + 4 * i, 10, o)
    st.ai[0].city_flags[2] = 4
    seen = []
    monkeypatch.setattr(CC, "clean_city", lambda s, c, f=0: seen.append((c, f)) or [])
    CC.clean_cities(st)
    assert seen == [(3, 0), (0, 0)]


# ------------------------------------------------------------------------------- 023f

def test_out_of_range_city_does_nothing(game, calls):
    st = make(game)
    assert CC.clean_city(st, 0) == [] and CC.clean_city(st, -1) == []
    assert st.rng.calls == []


def test_scan_counts_and_drops_the_order_to_this_city(game, calls):
    """Box test on the 2x2 squares (signed); +0x182 += 1 per army; an order kind 1 to c is
    dropped (+0xe &= 0xf0, +0xf bits 1-7 = 0) before `ordered` counts kind != 0; flags 0x20 /
    0x10 for a hero / a w13; the last hero (lowest index) is DS:5e5e and picks up, > 1 hero ->
    17db(H) with H in scan order; bit 2 set; the placement then clears bits 4-6."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 9
    a = armies(st, (LINF, HERO, HERO, ARCHONS), 21, 21)
    armies(st, (LINF,), 22, 20)                                   # outside the box
    a[0].order, a[0].vector_dest = 0x31, c                         # kind 1 to c: dropped
    a[3].order, a[3].vector_dest = 0x01, c + 1                      # kind 1 elsewhere: kept
    CC.clean_city(st, c, 1)
    blk = st.ai[0]
    assert blk.armies_here[c] == 4
    assert (a[0].order, a[0].vector_dest) == (0x00, 0) and (a[3].order, a[3].vector_dest) == (0x01, c + 1)
    assert blk.city_flags[c] & 0x34 == 0x34
    assert calls[0] == ("pick_up", 21, 21, a[1].id)
    assert calls[1] == ("share", [a[2].id, a[1].id] + [-1] * 6)


def test_more_than_two_orders_leave_the_city_alone(game, calls):
    """ordered > 2 and role != 7 -> return 1 before the roll and the placement."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 4
    a = armies(st, (LINF,) * 3, 20, 20)
    for x in a:
        x.order, x.goto = 0x03, (50, 50)
    CC.clean_city(st, c, 0)
    assert st.rng.calls == [] and st.ai[0].role[c] == 4 and a[0].goto == (50, 50)
    st.ai[0].role[c] = 7
    CC.clean_city(st, c, 1)
    assert a[0].goto == (-1, -1)


@pytest.mark.parametrize("roll, bit3, placed", [(1, False, False), (0, False, True), (5, True, True)])
def test_unchanged_count_rolls_one_in_six(game, calls, roll, bit3, placed):
    """Not forced, no hero, AI[+0x182+c] == old: rnd(1,6,-1) != 0 and no army bit on square 3
    (x+1, y+1) -> leave (5/6)."""
    st = make(game, script=[roll])
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 9
    a = armies(st, (LINF, LINF), 20, 20)
    st.ai[0].armies_here[c] = 2
    st.world.flags[21 * MAP_W + 21] = MAP_ARMY if bit3 else 0
    a[0].goto = (40, 40)
    CC.clean_city(st, c, 0)
    assert st.rng.calls == [(1, 6, -1)]
    assert (a[0].goto == (-1, -1)) is placed


def test_no_roll_when_forced_with_a_hero_or_a_changed_count(game, calls):
    st = make(game)
    c = add_city(st, 20, 20, 0)
    armies(st, (LINF,), 20, 20)
    st.ai[0].armies_here[c] = 1
    CC.clean_city(st, c, 1)                                         # forced
    st.ai[0].armies_here[c] = 7
    CC.clean_city(st, c, 0)                                         # count changed
    armies(st, (HERO,), 21, 20)
    st.ai[0].armies_here[c] = 2
    CC.clean_city(st, c, 0)                                         # a hero
    assert st.rng.calls == []


def test_more_than_16_armies_forget_the_old_count(game, calls):
    """n > 16 -> old = 0 and ordered = 0: no roll even with an unchanged count."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    armies(st, (LINF,) * 17, 20, 20)
    st.ai[0].armies_here[c] = 17
    CC.clean_city(st, c, 0)
    assert st.rng.calls == []


@pytest.mark.parametrize("n, want, role", [(1, 2, 4), (2, 3, 5), (3, 3, 8)])
def test_roles_4_5_8_by_garrison(game, calls, monkeypatch, n, want, role):
    st = make(game)
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 8
    armies(st, (LINF,) * n, 20, 20)
    monkeypatch.setattr(CC, "defenders_wanted", lambda s, cc: want)
    CC.clean_city(st, c, 1)
    assert st.ai[0].role[c] == role


def test_role_4_for_fewer_than_two_unless_quick_start_early(game, calls):
    """(no Quick Start or turn >= 3) and n < 2 -> role 4, whatever the role was."""
    st = make(game, GameOptions(quick_start=1))
    c = add_city(st, 20, 20, 0)
    armies(st, (LINF,), 20, 20)
    st.ai[0].role[c] = 7
    st.turn = 2
    CC.clean_city(st, c, 1)
    assert st.ai[0].role[c] == 7
    st.turn = 3
    CC.clean_city(st, c, 1)
    assert st.ai[0].role[c] == 4


def test_placement_eight_per_square_keepers_on_square_0(game, calls, monkeypatch):
    """k keepers on square 0 = (x+1, y) counted in +0x1e6, then 8 per square 1, 2, 3; each army:
    goto -1, +0x11 = 0, +0xe &= 0x8f, +0x10 = c, flags &= ~0x40; army bits on the squares used."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 9
    a = armies(st, (LINF,) * 12, 20, 20)
    for x in a:
        x.order, x.group, x.flags, x.goto = 0xF0, 3, 0x41, (1, 1)
    monkeypatch.setattr(CC, "garrison_order", lambda s, cc, n, L, G: (G.__setitem__(slice(0, n), L[:n]), 3)[1])
    CC.clean_city(st, c, 1)
    order = [a[11 - i] for i in range(12)]                         # L is in scan order (high index first)
    assert [(x.x, x.y) for x in order] == [(21, 20)] * 3 + [(20, 20)] * 8 + [(20, 21)]
    assert st.ai[0].keepers[c] == 3
    assert all(x.order == 0x80 and x.group == 0 and x.flags == 0x01 and x.transit == c
               and x.goto == (-1, -1) for x in a)
    f = st.world.flags
    assert f[20 * MAP_W + 21] & MAP_ARMY and f[21 * MAP_W + 20] & MAP_ARMY
    assert not f[21 * MAP_W + 21] & MAP_ARMY


def test_roles_2_and_3_start_on_square_1(game, calls):
    st = make(game)
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 3
    a = armies(st, (LINF,) * 5, 21, 21)
    CC.clean_city(st, c, 1)
    assert {(x.x, x.y) for x in a} == {(20, 20)} and st.ai[0].keepers[c] == 0


def test_disband_surplus_when_poor(game, calls, monkeypatch):
    """Not forced, gold < 300, income < 2 upkeep, role != 7, age > 10, heroes + w13s + 4 < n
    and 0a3e(c, -1) > 10 -> G[heroes + w13s + 4 ..] deleted (no redraw)."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    blk = st.ai[0]
    blk.role[c], blk.age[c] = 9, 11
    a = armies(st, (LINF,) * 7, 20, 20)
    st.players[0].gold = 299
    monkeypatch.setattr(CC, "_income", lambda s: 9)
    monkeypatch.setattr(CC, "_upkeep", lambda s: 5)
    CC.clean_city(st, c, 0)
    assert sum(1 for x in a if x.owner == 0xFF) == 3
    assert calls[-1] == ("0a3e", 20, 20, -1)


@pytest.mark.parametrize("change", ["force", "gold", "income", "role", "age", "count", "foe"])
def test_disband_conditions(game, calls, monkeypatch, change):
    st = make(game)
    c = add_city(st, 20, 20, 0)
    blk = st.ai[0]
    blk.role[c], blk.age[c] = 9, 11
    a = armies(st, (LINF,) * (4 if change == "count" else 7), 20, 20)
    st.players[0].gold = 300 if change == "gold" else 0
    monkeypatch.setattr(CC, "_income", lambda s: 10 if change == "income" else 9)
    monkeypatch.setattr(CC, "_upkeep", lambda s: 5)
    if change == "role":
        blk.role[c] = 7
    if change == "age":
        blk.age[c] = 10
    if change == "foe":
        monkeypatch.setattr(CC, "_nearest_foreign_army", lambda s, x, y, sd: 10)
    st.rng = Rec(st.rng.rng, [0])
    CC.clean_city(st, c, 1 if change == "force" else 0)
    assert all(x.owner == 0 for x in a)


def test_more_than_24_armies_and_more_than_32(game, calls):
    """Beyond 32 in the scan: deleted at once (lowest record indices, scanned last); then
    G[24..n-1] deleted."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 9
    a = armies(st, (LINF,) * 34, 20, 20)
    CC.clean_city(st, c, 1)
    assert a[0].owner == a[1].owner == 0xFF
    assert sum(1 for x in a if x.owner == 0) == 24
    assert st.ai[0].armies_here[c] == 34


def test_flyers_sent_exploring_under_hidden_map(game, calls):
    """Role 11, AI[+0x24] < 5: m = flyers less the shortfall below 2 others; per flyer of G in
    G order: AI[+0x24] += 1, flags |= 0x20, ovl20:0e4b(a, -1), not placed."""
    st = make(game, GameOptions(hidden_map=1))
    c = add_city(st, 20, 20, 0)
    blk = st.ai[0]
    blk.role[c], blk.explorers = 11, 1
    armies(st, (PEGASI, BATS, PEGASI, LINF), 20, 20)
    CC.clean_city(st, c, 1)
    sent = [e for e in calls if e[0] == "explore"]
    assert len(sent) == 2 and all(e[2] == -1 for e in sent)       # 3 flyers - (2 - 1)
    assert blk.explorers == 3
    for e in sent:
        assert st.armies[e[1]].flags & 0x20


def test_flyers_quick_start_early_send_one(game, calls):
    st = make(game, GameOptions(hidden_map=1, quick_start=1))
    st.turn = 2
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 11
    armies(st, (PEGASI, PEGASI, PEGASI, LINF, LINF), 20, 20)
    CC.clean_city(st, c, 1)
    assert sum(1 for e in calls if e[0] == "explore") == 1


def test_foreign_army_in_the_city_is_deleted_and_still_counted(game, calls):
    """039e..04a6: no owner test before the box test; a foreign army is deleted (015e(a, 1)) but
    counted, enters L and is placed (the freed record gets the city square again)."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c] = 9
    a = armies(st, (LINF,), 20, 20) + armies(st, (LINF,), 21, 20, owner=1)
    CC.clean_city(st, c, 1)
    assert st.ai[0].armies_here[c] == 2
    assert a[1].owner == 0xFF and a[1].type_id == 0xFF and a[1].x >= 20


# ------------------------------------------------------------------------------- 0a3d

def test_defenders_wanted(game):
    st = make(game)
    cs = [add_city(st, 10 + 4 * i, 10, o) for i, o in enumerate((0, 1, 2, 0x0F, 0))]
    ids = st.ai.neighbours.ids
    D.set_current(st, 0, 1, Relation.PEACE)
    D.set_current(st, 0, 2, Relation.PEACE)
    assert CC.defenders_wanted(st, 0) == 2
    ids[0:6] = [cs[3], cs[4], 0xFF, 0xFF, 0xFF, 0xFF]                # neutral, own: not counted
    assert CC.defenders_wanted(st, 0) == 2
    ids[2] = cs[1]
    assert CC.defenders_wanted(st, 0) == 3
    ids[3] = cs[2]
    assert CC.defenders_wanted(st, 0) == 4
    D.set_current(st, 0, 2, Relation.WAR)                          # relation[cur][owner]
    D.set_current(st, 2, 0, Relation.PEACE)
    assert CC.defenders_wanted(st, 0) == 8
    D.set_current(st, 0, 2, Relation.PEACE)
    D.set_current(st, 2, 0, Relation.WAR)                          # the other direction: not read
    assert CC.defenders_wanted(st, 0) == 4


# ------------------------------------------------------------------------------- 0b5c

def order(st, c, types, role=9, age=9):
    st.ai[0].role[c], st.ai[0].age[c] = role, age
    a = armies(st, types, 20, 20)
    L = [x.id for x in a] + [-1] * (32 - len(a))
    G = [-1] * 32
    k = CC.garrison_order(st, c, len(a), L, G)
    return k, [st.armies[i].type_id for i in G if i != -1], L


def test_garrison_quota_and_bonus_chain(game):
    """quota DS:0824[n]: n = 6 -> 4.  Hero 1000, flyer 900, w15 2 (800), w15 3 (700), w13
    (600), w15 1 (500), w17 (400), w18 (300), each once (its `taken` bit); once taken, a hero
    scores 1; beyond the quota taken = 0xfff: no bonus (and every hero scores 1, every w13
    type 2)."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    k, g, L = order(st, c, (LINF, CATA, SCOUTS, HERO, PEGASI, HINF))
    assert k == 4 and g == [HERO, PEGASI, CATA, SCOUTS, HINF, LINF]
    assert all(i == -1 for i in L)


def test_garrison_ties_highest_index_and_age_quota(game):
    """v = 3 - age / 3 > 0, v < n and n - quota < v -> quota = n - v."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    k, g, _ = order(st, c, (LINF, LINF, LINF), age=0)               # quota 0; v = 3 not < n
    assert k == 0
    st2 = make(game)
    c2 = add_city(st2, 20, 20, 0)
    k, g, _ = order(st2, c2, (LINF,) * 5, age=3)                     # quota 3, v = 2: 5 - 3 not < 2
    assert k == 3
    st3 = make(game)
    c3 = add_city(st3, 20, 20, 0)
    k, g, _ = order(st3, c3, (LINF,) * 5, age=0)                     # v = 3: 5 - 3 < 3 -> quota 2
    assert k == 2


def test_garrison_tie_takes_the_highest_index(game):
    """Equal scores: strict >, i = n-1..0, so the highest L index is taken first."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    st.ai[0].role[c], st.ai[0].age[c] = 9, 9
    a = armies(st, (LINF,) * 4, 20, 20)
    L = [x.id for x in a] + [-1] * 28
    G = [-1] * 32
    CC.garrison_order(st, c, 4, L, G)
    assert G[:4] == [a[3].id, a[2].id, a[1].id, a[0].id]


def test_garrison_staging_air_and_min_moves(game):
    """Role 7: a TF staged here with flag 0x20 -> air: non-flying non-heroes go to pool B; flag
    0x10 -> minmv = 12: allowance < 12 -> pool B, no bonus."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    tf = st.ai[0].task_forces[2]
    tf.age, tf.staging, tf.flags = 1, c, 0x30
    k, g, _ = order(st, c, (HINF, PEGASI, LINF, DRAGONS), role=7, age=9)
    # quota 3; Dragons 9 + 900 (A); Light Inf. pool B (air, not flying); Pegasi A (fly taken:
    # 5); Heavy Inf. allowance 8 < 12: B, no bonus; then B's best (3 > 2); beyond the quota
    # taken = 0xfff; k = min(3, 2 taken from A)
    assert g == [DRAGONS, PEGASI, HINF, LINF] and k == 2


def order_s(st, c, types, strength):
    """`order` with strength bytes changed: {index: value}."""
    st.ai[0].role[c], st.ai[0].age[c] = 9, 9
    a = armies(st, types, 20, 20)
    for i, v in strength.items():
        a[i].strength = v
    L = [x.id for x in a] + [-1] * (32 - len(a))
    G = [-1] * 32
    k = CC.garrison_order(st, c, len(a), L, G)
    return k, [st.armies[i].type_id for i in G if i != -1]


def test_garrison_bonus_800_and_taken_w13_scores_2(game):
    """0dd2..0de2: Archons (flying, w15 2, w13) get 800 only once T_FLY is taken without T_W13:
    Pegasi of strength 9 (909) beat Archons (908); then Archons 808 beat Devils 708; once
    Archons took T_W13 every w13 type scores 2 (0ea0..0ec2: Devils below Dwarves 303 (w18 only,
    0e7c) and below Heavy Inf. 3, which beats Dwarves without the 300).  n = 5: quota 3."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    k, g = order_s(st, c, (DWARVES, HINF, DEVILS, ARCHONS, PEGASI), {4: 9})
    assert g == [PEGASI, ARCHONS, DWARVES, HINF, DEVILS] and k == 3


def test_garrison_bonus_700_for_w15_3(game):
    """0de5..0df5: Devils (w15 3, w13) 708 beat Giant Worms of strength 9 (609, w13): the 700
    comes before the w13 600; then the Worms score 2 (T_W13 taken) below Catapults 502 and
    Heavy Inf. 3.  n = 4: quota 3."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    k, g = order_s(st, c, (CATA, WORMS, DEVILS, HINF), {1: 9})
    assert g == [DEVILS, CATA, HINF, WORMS] and k == 3


def test_garrison_bonus_600_for_w13(game):
    """w13 (600) ranks above w15 1 (500) and w17 (400): Giant Worms 607, Catapults 502, Archers
    403, Heavy Inf. 3.  n = 4: quota 3."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    k, g, _ = order(st, c, (WORMS, CATA, ARCHERS, HINF))
    assert g == [WORMS, CATA, ARCHERS, HINF] and k == 3


def staged(game, types, strength=None, tfs=()):
    """0b5c on a role-7 city (age 9: v = 0) with `types`; `strength` = {index: value};
    `tfs` = [(j, age, staging is this city, flags, +0x58)].  Returns k (the pool-A count capped
    by the quota) and the garrison order."""
    st = make(game)
    c = add_city(st, 20, 20, 0)
    other = add_city(st, 40, 40, 0)
    for j, age, here, flags, mv in tfs:
        tf = st.ai[0].task_forces[j]
        tf.age, tf.staging, tf.flags, tf.min_moves = age, c if here else other, flags, mv
    st.ai[0].role[c], st.ai[0].age[c] = 7, 9
    a = armies(st, types, 20, 20)
    for i, v in (strength or {}).items():
        a[i].strength = v
    L = [x.id for x in a] + [-1] * (32 - len(a))
    G = [-1] * 32
    k = CC.garrison_order(st, c, len(a), L, G)
    return k, [st.armies[i].type_id for i in G if i != -1]


@pytest.mark.parametrize("types, strength, k", [
    # L[n-1] is counted first: the first Giant Bats (strength 1) counts (f == 0), the second
    # not: f = 3 -> air (n <= 8): only the four flyers are keepers
    ((PEGASI, PEGASI, LINF, LINF, LINF, LINF, BATS, BATS), None, 4),
    # Pegasi first: f = 2, both Bats skipped (f != 0): no air, quota 5
    ((BATS, BATS, PEGASI, PEGASI, LINF, LINF, LINF, LINF), None, 5),
    # strength 4 is strong (0bfd jge 4): f = 3 -> air
    ((BATS, PEGASI, PEGASI, LINF, LINF, LINF, LINF, LINF), {0: 4}, 3),
    # f += h when both: 2 + 1 = 3 -> air; the hero is a keeper
    ((HERO, PEGASI, PEGASI, LINF, LINF, LINF, LINF, LINF), None, 3),
    # no flyer: heroes are not added (0c11 or si, si): no air
    ((HERO, HERO, HERO, LINF, LINF, LINF, LINF, LINF), None, 5),
])
def test_garrison_staging_flyer_count(game, types, strength, k):
    """0b90..0c34: f counts flyers over L[n-1..0], one of strength < 4 only while f == 0; f += h
    when f and h are both non-zero; air -> non-flying non-heroes go to pool B."""
    assert staged(game, types, strength)[0] == k


@pytest.mark.parametrize("flyers, n, k", [
    (4, 16, 4), (4, 17, 8),            # f >= 4 and n <= 16 (0c1e jl, 0c27 jle)
    (3, 16, 8),                        # f = 3 needs n <= 8
    (3, 8, 3), (3, 9, 6),              # f >= 3 and n <= 8 (0c2c jl, 0c32 jg)
    (2, 8, 5),
])
def test_garrison_air_thresholds(game, flyers, n, k):
    """air = (f >= 4 and n <= 16) or (f >= 3 and n <= 8): with air only the flyers are kept
    (pool A), else the quota DS:0824[n] / 8."""
    assert staged(game, (PEGASI,) * flyers + (LINF,) * (n - flyers))[0] == k


@pytest.mark.parametrize("tfs, k", [
    ([(1, 1, True, 0x08, 0)], 2),                            # flag 8: minmv 16
    ([(1, 1, True, 0x00, 13)], 2),                           # +0x58 = 13
    ([(1, 1, True, 0x00, 17)], 0),                           # +0x58 = 17: nobody
    ([(3, 1, True, 0x10, 0), (0, 1, True, 0x00, 17)], 0),    # j = 3..0: TF 0 decides
    ([(3, 1, True, 0x00, 17), (0, 1, True, 0x08, 0)], 2),
    ([(1, 0, True, 0x08, 0)], 3),                            # inactive (+0 == 0)
    ([(1, 1, False, 0x08, 0)], 3),                           # staged elsewhere
])
def test_garrison_task_force_min_moves(game, tfs, k):
    """0c39..0cd0: for TF j = 3..0 active (+0 != 0) with staging == c: minmv = 12 (flag 0x10) /
    16 (flag 8) / +0x58, the last write (lowest j) wins; allowance < minmv -> pool B.  Heavy
    Cav. 16, Light Inf. 12, Heavy Inf. 8, Heavy Cav. 16; n = 4: quota 3."""
    assert staged(game, (HCAV, LINF, HINF, HCAV), tfs=tfs)[0] == k


# ------------------------------------------------------------------------------- deletion

def test_delete_army_hero_dies_first(game):
    st = make(game)
    a = armies(st, (HERO, LINF), 30, 30)
    ev = CC.delete_army(st, a[0].id, 1)
    assert any(type(e).__name__ == "HeroDied" for e in ev)
    assert a[0].owner == 0xFF and a[0].x == -1
    assert CC.delete_army(st, a[1].id, 0) == [] and a[1].owner == 0xFF


def test_delete_list_and_selection(game):
    st = make(game)
    a = armies(st, (LINF,) * 4, 30, 30)
    CC.delete_list(st, [a[0].id, -1, a[2].id] + [-1] * 5, 1)
    assert [x.owner for x in a] == [0xFF, 0, 0xFF, 0]
    assert st.world.flags[30 * MAP_W + 30] & MAP_ARMY                 # ovl62:0000: two left
    st.selection.selected, st.selection.moving, st.selection.hero = a[1].id, [a[1].id, a[3].id], a[1].id
    st.selection.count, st.selection.group = 2, 1
    CC.delete_selection(st, 0)
    assert a[1].owner == a[3].owner == 0xFF
    sel = st.selection
    assert (sel.selected, sel.hero, sel.moving, sel.count, sel.group) == (-1, -1, [], 2, 1)
    assert not st.world.flags[30 * MAP_W + 30] & MAP_ARMY


# ------------------------------------------------------------------------------- §8 rnd order

def test_phase_rnd_order(game, calls):
    """ai.md §8.3 clean city: per own unprocessed city count-1..0 the rnd(1,6,-1) (not forced,
    no hero, count unchanged), then under Hidden Map for role 11 the 0e4b explorers of that
    city, before the next city's roll."""
    st = make(game, GameOptions(hidden_map=1), script=[0, 0, 0])
    log = calls

    class Shared(Rec):
        def rnd(self, d, s, a):
            log.append(("rnd", d, s, a))
            return super().rnd(d, s, a)
    st.rng = Shared(st.rng.rng, [0, 0, 0])
    cs = [add_city(st, 10 + 10 * i, 10, 0) for i in range(3)]
    blk = st.ai[0]
    for c in cs:
        blk.role[c] = 9
    blk.role[cs[1]] = 11
    armies(st, (LINF, LINF), 10, 10)
    fl = armies(st, (PEGASI, LINF, LINF), 20, 10)
    armies(st, (LINF, LINF), 30, 10)
    blk.armies_here[cs[0]], blk.armies_here[cs[1]], blk.armies_here[cs[2]] = 2, 3, 2
    CC.clean_cities(st)
    assert [e[0] for e in log] == ["rnd", "rnd", "explore", "rnd"]
    assert log[2] == ("explore", fl[0].id, -1)
    assert all(e[1:] == (1, 6, -1) for e in log if e[0] == "rnd")
