"""ovl18 diplomacy and ovl27:0e04 enemy choice (ai.md §6.1, §6.1a) as
warlords2.ai.phases.diplomacy, pinned to the listing: loop orders, signed compares, ties, the
record -1 read and the rnd order (8 x rnd(1,10,0), p = 7..0, before anything else)."""
from dataclasses import replace

import pytest

from warlords2.ai.phases import assault as A
from warlords2.ai.phases import diplomacy as DP
from warlords2.model.ids import Control, Relation
from warlords2.rules import diplomacy as D

from movekit import add_city, flat_state

pytestmark = pytest.mark.gamedata
COMP, HUMAN = Control.COMPUTER, Control.HUMAN


class Rec:
    def __init__(self, rng, script=None):
        self.rng, self.calls, self.script = rng, [], list(script or [])

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.script.pop(0) if self.script else self.rng.rnd(d, s, a)


def mk(game, **opts):
    st = flat_state(game)
    st.options = replace(st.options, **opts)
    st.ai.allocated = 1
    for p in st.players:
        p.alive, p.control, p.level, p.infamy = 1, COMP, 1, 0
    st.relations = [[0] * 8 for _ in range(8)]
    st.turn = 20
    st.rng = Rec(st.rng)
    st.ai.neighbours.ids = [0xFF] * 600
    st.ai.neighbours.dists = [0] * 600
    return st


def capital(st, p, c):
    city = st.cities[c]
    st.flags[0x193 + 0x14 * p], st.flags[0x195 + 0x14 * p] = city.x, city.y


def nb(st, c, ids, dists=None):
    dists = dists or [10] * len(ids)
    for i, (d, v) in enumerate(zip(ids, dists)):
        st.ai.neighbours.ids[c * 6 + i] = d
        st.ai.neighbours.dists[c * 6 + i] = v


# ------------------------------------------------------------------------------- 0917


def test_claim_city_nearest_unclaimed_under_40_highest_index_on_ties(game):
    """0917: intact cities whose claim (+0x2f) is 0x0f or a dead side's; dist < 40 and strict <
    from 10000 scanning count-1..0, so the higher index wins a tie."""
    st = mk(game)
    c0 = add_city(st, 10, 10, 0)
    a = add_city(st, 20, 10, 0x0F)            # d = 10
    b = add_city(st, 10, 20, 0x0F)            # d = 10, the same
    c = add_city(st, 13, 10, 0x0F)            # d = 3 but claimed by an alive side
    capital(st, 0, c0)
    for i in (a, b):
        st.cities[i].owner2 = 0x0F
    st.cities[c].owner2 = 5
    st.cities[c0].owner2 = 0
    DP.claim_city(st)
    assert (st.cities[a].owner2, st.cities[b].owner2) == (0x0F, 0)
    st.players[5].alive = 0                    # a dead claimer's city counts again
    DP.claim_city(st)
    assert st.cities[c].owner2 == 0


def test_claim_city_range_and_record_minus_one(game):
    """d must be < 40 (0a30 jge 0x28).  No city on the capital square: ovl62:044a = -1 and the
    record -1 is the relation matrix: x = word [0][1..2], y = word [0][3..4] (ai.md §6.1)."""
    st = mk(game)
    far = add_city(st, 50, 10, 0x0F)
    near = add_city(st, 89, 10, 0x0F)
    for i in (far, near):
        st.cities[i].owner2 = 0x0F
    st.flags[0x193], st.flags[0x195] = 0, 0    # no city there
    st.relations[0][1], st.relations[0][2] = 90, 0       # x = 90
    st.relations[0][3], st.relations[0][4] = 10, 0       # y = 10
    DP.claim_city(st)
    assert st.cities[near].owner2 == 0 and st.cities[far].owner2 == 0x0F
    st.relations[0][1] = 50 + 40               # x = 90 -> 40 away from far: not < 40
    DP.claim_city(st)
    assert st.cities[far].owner2 == 0x0F


# ------------------------------------------------------------------------------- 0851 / 0a6e


@pytest.mark.parametrize("rel,flag,wars,expect", [
    (Relation.WAR, 0, (), 1),
    (Relation.NEUTRAL, 0, (), 0), (Relation.NEUTRAL, 1, (), 1),
    (Relation.PEACE, 1, (), 1), (Relation.PEACE, 0, (), 0),
    (Relation.PEACE, 1, (4,), 0),             # at war with someone else
    (3, 1, (), 0),
])
def test_may_attack_city(game, rel, flag, wars, expect):
    """0851: neutral owner -> 1; else by current(cur, owner): 2 -> 1, 1 -> AI[+0xc] & 1, 0 ->
    no war at all (or only with the owner) and AI[+0xc] & 1, 3 -> 0."""
    st = mk(game)
    c = add_city(st, 10, 10, 3)
    n = add_city(st, 20, 10, 0x0F)
    st.ai[0].flags = flag
    D.set_current(st, 0, 3, rel)
    for w in wars:
        D.set_current(st, 0, w, Relation.WAR)
    assert DP.may_attack_city(st, c) == expect
    assert DP.may_attack_city(st, n) == 1


def test_ally_vs_human(game):
    """0a6e(q): Diplomacy, AI[+0x38], the side on turn a computer, and an alive human h with
    current(q, h) == war and DS:40f2[h] != 0."""
    st = mk(game, diplomacy=1)
    st.players[6].control = HUMAN
    st.ai[0].solidarity = 1
    D.set_current(st, 2, 6, Relation.WAR)
    assert DP.ally_vs_human(st, 2) == 0        # DS:40f2[6] == 0
    st.ai.solidarity[6] = 1
    assert DP.ally_vs_human(st, 2) == 1
    assert DP.ally_vs_human(st, 3) == 0
    st.ai[0].solidarity = 0
    assert DP.ally_vs_human(st, 2) == 0
    st.ai[0].solidarity = 1
    st.players[0].control = HUMAN
    assert DP.ally_vs_human(st, 2) == 0


# ------------------------------------------------------------------------------- 0e04


def enemy_setup(game):
    st = mk(game)
    own = add_city(st, 10, 10, 0)
    capital(st, 0, own)
    a = add_city(st, 30, 10, 2)
    b = add_city(st, 50, 10, 5)
    for p, c in ((2, a), (5, b)):
        capital(st, p, c)
    for c in range(len(st.cities)):
        st.cities[c].owner2 = 0x0F
    return st, own, a, b


def test_choose_enemy_draws_first_and_scores(game):
    """0e04: rnd(1,10,0) for p = 7..0 before any other read; score = r10 + 2*mem3ec + ... and
    the strict best (highest index on ties); battles fought (mem3dc / 3fc) gate turn < 8."""
    st, own, a, b = enemy_setup(game)
    m = st.ai[0].memory
    m[2][2] = 1                                # side 2 fought us: + 1
    m[2][5] = 1
    st.rng.script = [1, 1, 3, 1, 1, 3, 1, 1]   # p = 7..0: r10[5] = 3, r10[2] = 3
    assert DP.choose_enemy(st) == 5            # tie 4 / 4: the higher index (scan 7..0)
    assert st.rng.calls == [(1, 10, 0)] * 8
    st.rng.calls.clear()
    st.rng.script = [1, 1, 1, 1, 1, 2, 1, 1]   # r10[2] = 2 > r10[5] = 1
    assert DP.choose_enemy(st) == 2
    st.turn = 7
    m[2][2] = m[2][5] = 0                      # no battle: nobody before turn 8
    st.rng.script = [5] * 8
    assert DP.choose_enemy(st) == -1


def test_choose_enemy_capital_holder_and_seen(game):
    """The holder of our first capital gets + 20 and overrides the choice unless tf_on[k] ==
    holder for some k < AI[+0x24a] (the count array indexed by k, as coded); a side with no seen
    city is never chosen."""
    st, own, a, b = enemy_setup(game)
    st.cities[own].owner = 5                   # our capital lost to 5
    extra = add_city(st, 70, 10, 0)            # we still hold a city
    st.cities[extra].owner2 = 0x0F
    st.ai[0].memory[2][2] = 50
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 5
    st.ai[0].n_task_forces = 2
    tf = st.ai[0].task_forces[0]
    tf.age, tf.enemy = 1, 2                    # tf_on[2] = 1, tf_on[0..1] = 0 -> no hit on 5
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 5
    st.ai[0].city_flags[own] = st.ai[0].city_flags[b] = 1    # none of 5's cities seen
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == -1


def test_choose_enemy_peace_and_task_force_share(game):
    """Zeroed: prop(cur, p) peace while we propose war to someone alive; others > 1 and
    cities[p] / 4 < tf_on[p]."""
    st, own, a, b = enemy_setup(game)
    m = st.ai[0].memory
    m[2][2] = 30
    m[2][5] = 1
    D.set_proposal(st, 0, 5, Relation.WAR)     # war proposed to 5, peace to 2
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 5
    D.set_proposal(st, 0, 5, Relation.PEACE)
    st.ai[0].n_task_forces = 1
    st.ai[0].task_forces[0].age, st.ai[0].task_forces[0].enemy = 1, 2
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 5            # 1 / 4 = 0 < tf_on[2] = 1


# ------------------------------------------------------------------------------- 0000


def test_diplomacy_without_option_only_claims(game):
    """ovl18:0000: 0917 runs, then SCN 0x11c == 0 ends the phase: no rnd, proposals kept."""
    st, own, a, b = enemy_setup(game)
    D.set_proposal(st, 0, 2, Relation.WAR)
    assert DP.diplomacy(st) == []
    assert st.rng.calls == [] and D.proposal(st, 0, 2) == Relation.WAR


def test_diplomacy_resets_and_declares(game):
    """0e04 runs before the reset and reads the proposals as they stand (a war proposal to 3
    zeroes every side at peace: no enemy); every proposal restarts at peace; C: war on the
    enemy; D: on every active task force's enemy (k = 3..0, all four)."""
    st, own, a, b = enemy_setup(game)
    st.options = replace(st.options, diplomacy=1)
    st.ai[0].memory[2][2] = 1
    D.set_proposal(st, 0, 3, Relation.WAR)
    st.ai[0].task_forces[3].age, st.ai[0].task_forces[3].enemy = 1, 5
    st.rng.script = [1, 1, 1, 1, 1, 9, 1, 1]
    DP.diplomacy(st)
    assert st.rng.calls == [(1, 10, 0)] * 8
    assert [D.proposal(st, 0, q) for q in range(8)] == [0, 0, 0, 0, 0, 2, 0, 0]
    D.set_proposal(st, 0, 5, Relation.PEACE)   # no war proposal left for 0e04 to see
    st.rng.script = [1, 1, 1, 1, 1, 9, 1, 1]  # r10[2] = 9
    DP.diplomacy(st)
    assert [D.proposal(st, 0, q) for q in range(8)] == [0, 0, 2, 0, 0, 2, 0, 0]


def test_diplomacy_territory_and_memory_steps(game):
    """A: DS:4090[p] (our cities claimed by p + p's cities claimed by us) >= 2*(peace_in -
    war_in) + 4 -> neutral; B: mem3ec + 4 mem40c + 2 mem3bc >= t + 5 -> at least neutral."""
    st, own, a, b = enemy_setup(game)
    st.options = replace(st.options, diplomacy=1)
    for i in range(4):
        c = add_city(st, 10 + 3 * i, 30, 0)
        st.cities[c].owner2 = 2                # our cities in 2's territory
    t3 = add_city(st, 10, 50, 3)
    st.cities[t3].owner2 = 0x0F
    D.set_proposal(st, 2, 0, Relation.WAR)     # war_in[2]: t = -2 -> 4 >= 2
    m = st.ai[0].memory
    m[3][3] = 1                                # mem3ec[3] = 1, + 2 * mem3bc[3] = 2 -> 3
    m[0][3] = 1
    D.set_proposal(st, 3, 0, Relation.WAR)     # t = -2: 3 >= 3
    m[1][5] = 100                              # the enemy is 5
    st.rng.script = [1] * 8
    DP.diplomacy(st)
    assert [D.proposal(st, 0, q) for q in range(8)] == [0, 0, 1, 1, 0, 2, 0, 0]
    D.set_proposal(st, 3, 0, Relation.PEACE)   # t = 2 -> 3 < 7: back to peace
    st.rng.script = [1] * 8
    DP.diplomacy(st)
    assert D.proposal(st, 0, 3) == Relation.PEACE


def test_diplomacy_leader_and_cancel(game):
    """E: a human side with a share above AI[+0x44] leads: war on it and the enemy, peace with
    the others; I: an active task force whose enemy is at peace now is cancelled (066d)."""
    st, own, a, b = enemy_setup(game)
    st.options = replace(st.options, diplomacy=1)
    st.players[2].control = HUMAN
    st.ai[0].leader_share = 10
    for i in range(3):
        add_city(st, 10 + 3 * i, 40, 2)
    tf = st.ai[0].task_forces[1]
    tf.age, tf.enemy, tf.staging = 3, 5, own
    tf.sources = [-1] * 4
    st.ai[0].memory[1][2] = 5                  # the enemy is 2
    st.rng.script = [1] * 8
    DP.diplomacy(st)
    assert D.proposal(st, 0, 2) == Relation.WAR
    assert D.proposal(st, 0, 5) == Relation.PEACE    # E overwrote D's war
    assert tf.age == 0 and st.ai[0].role[own] == 8   # step I


def test_diplomacy_solidarity_and_greatest(game):
    """F: a computer with AI[+0x38] at war with a non-computer makes peace with every alive
    computer whose DS:40f2 is set, itself included (no p != cur test); G: "I am the Greatest"
    and a computer allied against humans -> peace with all alive computers."""
    st, own, a, b = enemy_setup(game)
    st.options = replace(st.options, diplomacy=1)
    st.ai[0].solidarity = 1
    st.players[6].control = HUMAN
    D.set_current(st, 0, 6, Relation.WAR)
    st.ai.solidarity[5] = st.ai.solidarity[0] = 1
    st.ai[0].memory[2][5] = 1
    D.set_proposal(st, 0, 0, Relation.WAR)
    st.rng.script = [1, 1, 9, 1, 1, 1, 1, 1]    # enemy 5
    DP.diplomacy(st)
    assert D.proposal(st, 0, 5) == Relation.PEACE and D.proposal(st, 0, 0) == Relation.PEACE
    st2, *_ = enemy_setup(game)
    st2.options = replace(st2.options, diplomacy=1)
    st2.flags[0x116] = 1
    st2.players[6].control = HUMAN
    D.set_current(st2, 2, 6, Relation.WAR)     # 2 is allied against the humans
    st2.ai[0].memory[1][2] = 50
    st2.rng.script = [1] * 8
    assert DP.choose_enemy(st2) == 5           # 2's score is zeroed (0e04, 13b7..14d9)
    st2.flags[0x116] = 0
    st2.rng.script = [1] * 8
    assert DP.choose_enemy(st2) == 2
    st2.flags[0x116] = 1
    D.set_proposal(st2, 0, 2, Relation.WAR)
    st2.rng.script = [1] * 8
    DP.diplomacy(st2)
    assert D.proposal(st2, 0, 2) == Relation.PEACE


def test_cancel_tf_from_diplomacy_is_assault_066d(game):
    """Step I calls ovl19:066d(k, 20): the module function is assault.cancel_tf."""
    assert A.cancel_tf.__module__ == "warlords2.ai.phases.assault"


# ------------------------------------------------------------------------------- review M8b4: 0e04


@pytest.mark.parametrize("control, level, field", [
    (HUMAN, 1, "enemy_bonus_human"), (COMP, 2, "enemy_bonus_l2"),
    (COMP, 1, "enemy_bonus_l1"), (COMP, 0, "enemy_bonus_l0")])
def test_choose_enemy_level_bonus_of_the_side_on_turn(game, control, level, field):
    """1242..12f0: the bonus is chosen by the side on turn (0x0d0 / 0x0c0 [cur]), not by the
    scored side: here the scored sides are computers of level 3 (no bonus of their own).  A
    bonus of -1 on r10 = 1 leaves 0, not > 0: no enemy; the other three fields are not read."""
    st, own, a, b = enemy_setup(game)
    st.players[0].control, st.players[0].level = control, level
    for q in range(1, 8):
        st.players[q].level = 3
    setattr(st.ai[0], field, -1)
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == -1
    setattr(st.ai[0], field, 0)
    for other in ("enemy_bonus_human", "enemy_bonus_l2", "enemy_bonus_l1", "enemy_bonus_l0"):
        if other != field:
            setattr(st.ai[0], other, -1)
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 5


def test_choose_enemy_greatest_zeroes_all_when_the_side_on_turn_is_allied(game):
    """13b7..14d9: with "I am the Greatest", every alive computer's score is zeroed when vs[cur]
    or vs[p]: the side on turn at war with a human zeroes sides that are not."""
    st, own, a, b = enemy_setup(game)
    st.flags[0x116] = 1
    st.players[6].control = HUMAN
    D.set_current(st, 0, 6, Relation.WAR)
    st.ai[0].memory[1][2] = 5
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == -1
    st.flags[0x116] = 0
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 2


def holder_setup(game):
    """Our first capital held by side 1; we keep another city."""
    st, own, a, b = enemy_setup(game)
    st.cities[own].owner = 1
    capital(st, 1, own)                        # else 1's capital is record -1: took[1]
    extra = add_city(st, 70, 10, 0)
    st.cities[extra].owner2 = 0x0F
    return st


@pytest.mark.parametrize("mem2, enemy", [(15, 1), (30, 2)])
def test_choose_enemy_capital_holder_hit_and_bonus(game, mem2, enemy):
    """1086..10ce: the holder of our first capital gets + 20; 1661..1694: its override is
    skipped when tf_on[k] == holder for some k < AI[+0x24a] - the count array indexed by k: a
    task force against side 0 gives tf_on[0] = 1 == holder 1 (no task force is against 1).
    Then the best score wins: holder 1 + 20 = 21 against side 2 at 1 + mem3cc."""
    st = holder_setup(game)
    b = st.ai[0]
    b.n_task_forces = 1
    b.task_forces[0].age, b.task_forces[0].enemy = 1, 0
    b.memory[1][2] = mem2
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == enemy


def test_choose_enemy_capital_holder_override_counts_only_k_below_n(game):
    """1661..1694 scans k = AI[+0x24a]-1..0: with one task force (against side 3) tf_on[3] = 1
    equals the holder but k = 3 is not scanned, so the holder 1 overrides side 2's better
    score."""
    st = holder_setup(game)
    b = st.ai[0]
    b.n_task_forces = 1
    b.task_forces[0].age, b.task_forces[0].enemy = 1, 3
    b.memory[1][2] = 30
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 1


def test_choose_enemy_took_capital_weighs_15(game):
    """10d2..1154 / 1182: took[q] when we own q's first capital: + 15 (16 beats 1 + 14)."""
    st, own, a, b = enemy_setup(game)
    st.cities[a].owner = 0                     # 2's first capital is ours
    a2 = add_city(st, 30, 30, 2)
    st.cities[a2].owner2 = 0x0F
    st.ai[0].memory[1][5] = 14
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 2


def test_choose_enemy_mem3bc_weighs_4(game):
    """4 * mem3bc (heroes killed): 1 + 4 beats 1 + 3 mem3cc; with weight 3 the tie would go to
    the higher index 5."""
    st, own, a, b = enemy_setup(game)
    st.ai[0].memory[0][2] = 1
    st.ai[0].memory[1][5] = 3
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 2


def test_choose_enemy_seen_zeroing_needs_no_task_force(game):
    """14db..15e0: seen[p] == 0 zeroes only while no task force is active (ntf == 0).  With one
    (against the cityless side 3) the unseen side 2 keeps its best score, and the final seen
    test (16ae..16c4) then gives -1 rather than side 5."""
    st, own, a, b = enemy_setup(game)
    st.ai[0].city_flags[a] = 1
    st.ai[0].memory[1][2] = 50
    st.ai[0].memory[1][5] = 1
    st.ai[0].n_task_forces = 1
    st.ai[0].task_forces[0].age, st.ai[0].task_forces[0].enemy = 1, 3
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == -1
    st.ai[0].task_forces[0].age = 0
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 5


@pytest.mark.parametrize("quick, t, enemy", [(0, 8, 2), (0, 7, -1), (1, 4, 2), (1, 3, -1)])
def test_choose_enemy_early_boundary(game, quick, t, enemy):
    """1505 / 150a: max(turn, 1) < 4 (Quick Start) / 8 with no battle (mem3dc + mem3fc == 0)
    zeroes; the boundary turn itself does not."""
    st, own, a, b = enemy_setup(game)
    st.options = replace(st.options, quick_start=quick)
    st.turn = t
    st.ai[0].memory[1][2] = 5
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == enemy


def test_choose_enemy_border_counts_only_for_the_side_on_turn(game):
    """0f00..1039: border[] is indexed by the owner of the scanned city (always cur), so a
    neighbour of ours that is 2's but claimed by us adds 6 to score[cur], which is zeroed
    (15e8): dead in the original too.  Side 2 keeps 1, side 5 has 1 + 3."""
    st, own, a, b = enemy_setup(game)
    x = add_city(st, 12, 14, 2)
    st.cities[x].owner2 = 0
    nb(st, own, [x])
    st.ai[0].memory[1][5] = 3
    st.rng.script = [1] * 8
    assert DP.choose_enemy(st) == 5


# ------------------------------------------------------------------------------- review M8b4: 0000


@pytest.mark.parametrize("claimed, want", [(2, Relation.NEUTRAL), (1, Relation.PEACE)])
def test_diplomacy_step_a_boundary(game, claimed, want):
    """A (0230..02d7): DS:4090[p] >= 2 (peace_in - war_in) + 4 (jl skips): with 2's war proposal
    t = -2, so exactly 2 of our cities claimed by 2 is enough."""
    st, own, a, b = enemy_setup(game)
    st.options = replace(st.options, diplomacy=1)
    for i in range(claimed):
        c = add_city(st, 10 + 3 * i, 30, 0)
        st.cities[c].owner2 = 2
    D.set_proposal(st, 2, 0, Relation.WAR)
    st.ai[0].memory[1][5] = 100                # the enemy is 5
    st.rng.script = [1] * 8
    DP.diplomacy(st)
    assert D.proposal(st, 0, 2) == want


def leader_setup(game, extra2, extra5=0, human2=True, human5=False, share=10):
    """turn 1 and no battles: no enemy.  Intact cities: ours, 2's a (+ extra2), 5's b (+
    extra5)."""
    st, own, a, b = enemy_setup(game)
    st.options = replace(st.options, diplomacy=1)
    st.turn = 1
    st.players[2].control = HUMAN if human2 else COMP
    st.players[5].control = HUMAN if human5 else COMP
    st.ai[0].leader_share = share
    for i in range(extra2):
        st.cities[add_city(st, 10 + 3 * i, 40, 2)].owner2 = 0x0F
    for i in range(extra5):
        st.cities[add_city(st, 10 + 3 * i, 60, 5)].owner2 = 0x0F
    return st


def props(st):
    return [D.proposal(st, 0, q) for q in range(8)]


@pytest.mark.parametrize("share, human, leads", [
    (50, True, False), (49, True, True),       # human: share 2 * 100 / 4 = 50 > AI[+0x44] (strict)
    (10, False, False),                        # computer: 50 > 50 fails
])
def test_diplomacy_leader_share_threshold(game, share, human, leads):
    """E (0461..055c): share = n40a0 * 100 / intact cities > AI[+0x44] for a human, > 50 for a
    computer (both strict); the leader gets war."""
    st = leader_setup(game, 1, human2=human, share=share)
    st.rng.script = [1] * 8
    DP.diplomacy(st)
    assert props(st)[2] == (Relation.WAR if leads else Relation.PEACE)


def test_diplomacy_leader_tie_keeps_the_higher_side(game):
    """E: n40a0[p] > best (strict), p = 7..0: two humans with 2 cities each (40 % > 10 %): 5,
    found first, leads."""
    st = leader_setup(game, 1, extra5=1, human5=True)
    st.rng.script = [1] * 8
    DP.diplomacy(st)
    assert props(st) == [0, 0, 0, 0, 0, 2, 0, 0]


def test_diplomacy_leader_branch_keeps_war_on_the_enemy(game):
    """E: with a leader other than the side on turn, war on the leader and on DS:408e (the
    enemy), peace with the rest."""
    st = leader_setup(game, 2)                 # 2: 3 of 5 cities
    st.turn = 20
    st.ai[0].memory[1][5] = 50                 # the enemy is 5
    st.rng.script = [1] * 8
    DP.diplomacy(st)
    assert props(st) == [0, 0, 2, 0, 0, 2, 0, 0]


def test_diplomacy_step_h_seen_cities_and_step_i_cancel(game, monkeypatch):
    """H (07c0..07ef): peace with every side without an unflagged city (DS:40b0, not the city
    count 40a0); I (07f1..084b): a task force whose enemy is now at peace -> ovl19:066d(k, 20)."""
    st, own, a, b = enemy_setup(game)
    st.options = replace(st.options, diplomacy=1)
    st.ai[0].city_flags[b] = 1                 # 5 has a city, none seen
    st.ai[0].memory[1][2] = 5                  # the enemy is 2
    tf = st.ai[0].task_forces[2]
    tf.age, tf.enemy = 1, 5                    # D: war on 5
    calls = []
    monkeypatch.setattr(A, "cancel_tf", lambda s, k, v: calls.append((k, v)))
    st.rng.script = [1] * 8
    DP.diplomacy(st)
    assert props(st) == [0, 0, 2, 0, 0, 0, 0, 0]
    assert calls == [(2, 20)]
