"""rules.quests: assignment (ovl01:0d7a), the per-event check (ovl01:1ded), rewards
(ovl01:1909 / 1c02) (M7a).  Expected values from out/asm/ovl01.asm."""
import collections

import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, NO_OWNER, Control, ItemState, ItemType, SiteKind, Terrain
from warlords2.rules import combat, engine
from warlords2.rules import quests as Q
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.rng import Rng

from test_bonuses import put, set_terrain
from test_city import add_city
from test_heroes import dice, hero, mk
from test_ruins import site
from test_combat import WIN, hooks, script  # noqa: F401 (hooks is a fixture)


def qstate(**opts):
    st = mk(**opts)
    h = hero(st, 0, 20, 20)
    st.selection.selected = st.selection.hero = h.id
    st.selection.moving = [h.id]
    return st, h


def quest(st, h, qtype, target=0, amount=0, progress=0):
    q = st.players[0].quest
    q.active, q.type, q.hero, q.target, q.amount, q.progress = 1, qtype, h.id, target, amount, progress
    return q


def battle_work(st, attackers, defenders, d_alive, owner=1, d_types=None):
    bw = st.battle_work
    bw.attackers, bw.defenders, bw.d_alive, bw.owner = list(attackers), list(defenders), list(d_alive), owner
    types = list(d_types) if d_types else [1] * len(defenders)
    bw.d_types[:len(types)] = types


# ----------------------------------------------------------------------------- assignment


def test_human_quest_type_table():
    """DS:00a0 = 0,1,2,3,4,5,6,4,5,6 indexed by rnd(1,10,-1)."""
    st, h = qstate()
    for face, qtype in ((7, 6), (10, 6), (9, 5)):
        if qtype == 5:
            ci = add_city(st, 30, 30, 1)
            dice(st, [face, 1])
        else:
            dice(st, [face, 1, 1, 1])
        Q.assign(st, computer=False)
        assert st.players[0].quest.type == qtype


def test_computer_quest_order_4_then_3_then_6():
    """ovl01:0dd1..0e0b: rnd(1,5,-1) != 0 -> 4 (else 5), then 3, then 6."""
    st, h = qstate()
    for p in range(1, 8):
        st.players[p].alive = 0
    dice(st, [2, 1], cycle=True)                         # 4: no city; 3: no live side; 6
    src = st.rng.src
    ev = Q.assign(st, computer=True)
    q = st.players[0].quest
    assert q.type == 6 and ev[0].info["attempts"] == 3 and src.sides[0] == 5


def test_kill_hero_quest_picks_the_kth_enemy_hero_from_the_top():
    st, h = qstate()
    e1 = hero(st, 1, 40, 40)
    e2 = hero(st, 2, 41, 40)
    dice(st, [1, 1])                                     # type 0, k = 1: highest index
    Q.assign(st, computer=False)
    assert st.players[0].quest.target == e2.id
    dice(st, [1, 2])
    Q.assign(st, computer=False)
    assert st.players[0].quest.target == e1.id


def test_item_quest_needs_a_non_special_item_in_a_site_nearby_and_reveals_it():
    st, h = qstate(hidden_map=1)
    st.world.roads = [0] * len(st.world.roads)
    si = site(st, 40, 40, SiteKind.ITEM_RUIN, item=10, shown=0)
    st.items[10].state, st.items[10].holder = int(ItemState.IN_SITE), si
    st.items[11].type = int(ItemType.FLIGHT)            # special: never a quest item
    st.items[11].state, st.items[11].holder = int(ItemState.IN_SITE), si
    far = site(st, 90, 90, SiteKind.ITEM_RUIN, item=12, shown=0)
    st.items[12].state, st.items[12].holder = int(ItemState.IN_SITE), far
    dice(st, [2, 1])
    Q.assign(st, computer=False)
    assert st.players[0].quest.target == 10 and st.sites[si].shown_mask & 1
    assert st.world.roads[40 * 112 + 40] & 0x20


def test_kill_side_quest_and_city_quests():
    st, h = qstate()
    dice(st, [4, 1, 2, 5])                               # type 3: side 0 (own), side 1; 15 kills
    Q.assign(st, computer=False)
    q = st.players[0].quest
    assert (q.type, q.target, q.amount, q.progress) == (3, 1, 15, 0)
    near = add_city(st, 30, 20, 1)
    add_city(st, 100, 150, 1)
    dice(st, [5, 2, 1])                                  # type 4: city 1 too far, city 0 near
    Q.assign(st, computer=False)
    assert (q.type, q.target) == (4, near)
    st.flags[0x15B] = 1
    dice(st, [5, 7, 1, 1, 1])                            # 4 refused, then 6
    Q.assign(st, computer=False)
    assert q.type == 6


def test_kill_type_quest_tries_five_ally_types():
    st, h = qstate()
    put(st, 27, 1, 50, 50)
    dice(st, [3, 1, 2, 3, 4, 5, 7, 1, 1, 1])             # 5 types missing -> new attempt -> 6
    Q.assign(st, computer=False)
    assert st.players[0].quest.type == 6
    dice(st, [3, 8])                                     # ALLY_TYPES[7] = 27
    Q.assign(st, computer=False)
    assert (st.players[0].quest.type, st.players[0].quest.target) == (2, 27)


# ----------------------------------------------------------------------------- check


def test_check_without_quest_and_dead_hero():
    st, h = qstate()
    assert Q.check(st, (-1, 0, 0, 0, 0)) == (0, [])
    quest(st, h, 6, amount=100)
    h.owner = 0xFF
    r, ev = Q.check(st, (-1, 0, 0, 0, 0))
    assert r == 0 and ev[0].info["reason"] == "hero" and st.players[0].quest.active == 0


def test_kill_n_armies_counts_dead_defenders_of_the_target_side():
    st, h = qstate()
    q = quest(st, h, 3, target=1, amount=3)
    battle_work(st, [h.id], [50, 51], [0, 0], owner=1, d_types=[1, 1])
    assert Q.check(st, (0, 0, 0, 0, 0))[0] == 0 and q.progress == 2
    st.players[0].gold = 0
    dice(st, [1, 1])
    r, ev = Q.check(st, (0, 0, 0, 0, 0))
    assert r == 1 and q.active == 0 and st.players[0].gold == 1002
    assert st.heroes[h.hero_slot].exp == 10


def test_battle_check_needs_the_hero_among_the_attackers():
    st, h = qstate()
    q = quest(st, h, 0, target=77)
    battle_work(st, [h.id + 1], [77], [0])
    assert Q.check(st, (0, 0, 0, 0, 0))[0] == 0 and q.active == 1
    battle_work(st, [h.id], [77], [0])
    dice(st, [1, 1])
    assert Q.check(st, (0, 0, 0, 0, 0))[0] == 1


def test_kill_type_reads_only_the_dead_defenders_slots():
    """Event 0, type 2: DS:4254[i] of each dead defender i; a stale byte past the count is not
    looked at."""
    st, h = qstate()
    quest(st, h, 2, target=23)
    battle_work(st, [h.id], [77], [0], d_types=[5, 23])
    assert Q.check(st, (0, 0, 0, 0, 0))[0] == 0
    battle_work(st, [h.id], [77], [0], d_types=[23])
    dice(st, [1, 1])
    assert Q.check(st, (0, 0, 0, 0, 0))[0] == 1


def test_kill_type_after_a_real_battle_sees_the_setup_type(hooks):
    """The battle frees the killed defender (type 0xff) before the quest check, which still
    reads its set-up type: rules.combat records DS:4254 at ovl38:008b."""
    st, h = qstate()
    d = put(st, 5, 1, 21, 20)
    quest(st, h, 2, target=5)
    hooks(st)
    script(st, WIN, cycle=True)
    engine.apply(st, C.Attack((h.id,), 21, 20))
    assert st.armies[d].type_id == 0xFF and st.battle_work.d_types[0] == 5
    assert st.battle_work.d_alive == [0]
    dice(st, [1, 1])
    assert Q.check(st, (0, 0, 0, 0, 0))[0] == 1


def test_occupy_quest_success_and_failures():
    st, h = qstate()
    ci = add_city(st, 30, 30, 0)
    q = quest(st, h, 4, target=ci)
    battle_work(st, [h.id], [], [])
    dice(st, [1, 1])
    assert Q.check(st, (4, 0, 0, 0x4D, 0x3005))[0] == 1
    q = quest(st, h, 4, target=ci)
    battle_work(st, [], [], [])
    r, ev = Q.check(st, (4, 0, 0, 0x4D, 0x3005))
    assert r == 0 and ev[0].info["reason"] == "without_hero" and q.active == 0
    q = quest(st, h, 5, target=ci)
    assert Q.check(st, (4, 0, 0, 0, 0))[1][0].info["reason"] == "occupied"
    q = quest(st, h, 4, target=ci)
    assert Q.check(st, (1, 0, 500, 0, 0))[1][0].info["reason"] == "plundered"


def test_turn_start_failures():
    st, h = qstate()
    ci = add_city(st, 30, 30, 1)
    quest(st, h, 4, target=ci)
    assert Q.check(st, (-1, 0, 0, 0, 0)) == (0, [])
    set_terrain(st, 30, 30, Terrain.PLAIN)
    assert Q.check(st, (-1, 0, 0, 0, 0))[1][0].info["reason"] == "razed"
    set_terrain(st, 30, 30, Terrain.CITY)
    st.cities[ci].owner = 0
    quest(st, h, 5, target=ci)
    assert Q.check(st, (-1, 0, 0, 0, 0))[1][0].info["reason"] == "owned"
    quest(st, h, 3, target=4)
    st.players[4].alive = 0
    assert Q.check(st, (-1, 0, 0, 0, 0))[1][0].info["reason"] == "side_dead"
    quest(st, h, 1, target=9)
    assert Q.check(st, (-1, 0, 0, 0, 0))[1][0].info["reason"] == "item_lost"
    other = put(st, 1, 1, 60, 60)
    quest(st, h, 0, target=other)
    assert Q.check(st, (-1, 0, 0, 0, 0))[1][0].info["reason"] == "hero_target_dead"


def test_raze_quest():
    st, h = qstate()
    ci = add_city(st, 20, 20, NO_OWNER)
    set_terrain(st, 20, 20, Terrain.PLAIN)              # razed: ruin tiles
    quest(st, h, 5, target=ci)
    battle_work(st, [h.id], [], [])
    dice(st, [1, 1])
    assert Q.check(st, (2, 0, 0, 0, 0))[0] == 1
    quest(st, h, 4, target=ci)
    assert Q.check(st, (2, 0, 0, 0, 0))[1][0].info["reason"] == "razed_target"


def test_pillage_gold_quest_and_item_quest():
    st, h = qstate()
    q = quest(st, h, 6, amount=900)
    battle_work(st, [h.id], [], [])
    assert Q.check(st, (1, 0, 600, 0, 0))[0] == 0 and q.progress == 600
    dice(st, [1, 1])
    assert Q.check(st, (1, 0, 300, 0, 0))[0] == 1
    q = quest(st, h, 1, target=9)
    st.items[9].state, st.items[9].holder = int(ItemState.CARRIED), h.id
    dice(st, [1, 1])
    assert Q.check(st, (3, 0, 0, 0, 0))[0] == 1 and st.items[9].state == ItemState.NOT_IN_PLAY


# ----------------------------------------------------------------------------- rewards


def test_reward_allies_when_few_cities_late():
    """ovl01:1909: cities < 10 and turn > 15 -> rnd(1,3,5) allies (type 0x13)."""
    st, h = qstate()
    st.turn = 16
    dice(st, [3])
    assert Q.reward(st) == ("allies", 8)
    dice(st, [1] * 30, cycle=True)
    ev = Q.apply_reward(st, "allies", 2)
    assert sum(1 for a in st.armies if a.type_id == 19) == 2 and st.heroes[h.hero_slot].exp == 10


def test_reward_gold_below_100_gold():
    st, h = qstate()
    st.players[0].gold = 99
    dice(st, [1, 1])
    assert Q.reward(st) == ("gold", 1002)


def test_reward_item_site_allies_or_gold():
    st, h = qstate()
    for i in range(22):
        st.items[i].state = int(ItemState.CARRIED)
    st.items[15].state = int(ItemState.NOT_IN_PLAY)     # battle item: not special
    st.items[3].state = int(ItemState.NOT_IN_PLAY)      # another side's standard: not eligible
    st.items[0].state = int(ItemState.NOT_IN_PLAY)      # own standard (type 8): eligible
    dice(st, [1, 1])
    assert Q.reward(st) == ("item", 0)
    dice(st, [2, 1, 3])                                  # no item, then allies 1 -> rnd(1,3,2)
    assert Q.reward(st) == ("allies", 5)
    st.items[0].state = int(ItemState.CARRIED)
    near = site(st, 25, 25, SiteKind.GOLD_RUIN, flag=1, shown=0)
    site(st, 60, 25, SiteKind.GOLD_RUIN, flag=1, shown=0)
    dice(st, [2])
    assert Q.reward(st) == ("site", near)
    dice(st, [3, 2, 1, 1])
    assert Q.reward(st) == ("gold", 1002)


def test_after_battle_skips_capture_only_for_computers():
    st, h = qstate()
    ci = add_city(st, 30, 30, 0)
    s = combat.Setup(30, 30, 0, 1, 10, 0, ci, [(30, 30)], False, [h.id], [], [], [], [5], [],
                     [], [], None, None, 0, 0, 0)
    b = combat.Battle(s, True, True, [True], [], [], [], [])
    battle_work(st, [h.id], [], [])
    quest(st, h, 3, target=1, amount=99)
    assert Q.after_battle(st, b, True) == (0, [])
    quest(st, h, 4, target=ci)
    dice(st, [1, 1])
    assert Q.check(st, (4, 0, 0, 0x4D, 0x3005))[0] == 1
    st.players[0].control = Control.COMPUTER
    d = put(st, 1, 1, 30, 30)
    s2 = combat.Setup(30, 30, 0, 1, 10, 0, ci, [(30, 30)], False, [h.id], [d], [], [], [5], [1],
                      [], [], None, None, 0, 0, 0)
    b2 = combat.Battle(s2, True, False, [True], [False], [], [], [])
    battle_work(st, [h.id], [d], [0], owner=1)
    for captured, skip in ((True, 1), (False, 0)):
        quest(st, h, 3, target=1, amount=1)
        dice(st, [1, 1, 1])
        assert Q.after_battle(st, b2, captured)[0] == skip
