"""ovl27 task-force creation and sources (ai.md §6.13, §6.16a) as
warlords2.ai.phases.assault_xx, pinned to the listing: the graph distances, the staging and
target choice (with the AI[+0x11d] read), tie draws, the style draws, the source slots and the
rnd order of the phase (0e04's 8 draws, 04d2's tie draws, 06a0's up to 3 draws)."""
from dataclasses import replace

import pytest

from warlords2.ai.phases import assault_xx as XX
from warlords2.ai.phases import diplomacy as DP
from warlords2.ai.phases import evaluate as EV
from warlords2.model.city import Slot
from warlords2.model.ids import Control, Relation
from warlords2.rules import diplomacy as D

from movekit import add_city as _add_city, flat_state, type_with

pytestmark = pytest.mark.gamedata


class Rec:
    def __init__(self, rng, script=None):
        self.rng, self.calls, self.script = rng, [], list(script or [])

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.script.pop(0) if self.script else self.rng.rnd(d, s, a)


def add_city(st, x, y, owner):
    c = _add_city(st, x, y, owner)
    st.cities[c].slots = [Slot() for _ in range(4)]
    st.cities[c].owner2 = 0x0F
    return c


def mk(game):
    st = flat_state(game)
    st.ai.allocated = 1
    for p in st.players:
        p.alive, p.control, p.level = 1, Control.COMPUTER, 1
    st.rng = Rec(st.rng)
    st.ai.neighbours.ids = [0xFF] * 600
    st.ai.neighbours.dists = [0] * 600
    st.ai[0].n_task_forces = 4
    for k in range(4):
        XX.reset_tf(st, k)
    return st


def link(st, a, b, d):
    """a and b neighbours of each other at NB distance d (first free slots)."""
    nb = st.ai.neighbours
    for x, y in ((a, b), (b, a)):
        i = nb.ids[x * 6:x * 6 + 6].index(0xFF)
        nb.ids[x * 6 + i], nb.dists[x * 6 + i] = y, d


def test_reset_tf_leaves_the_untraced_words(game):
    """08ba: age 0, enemy / staging -1, flags / +0x58 0, the six- and four-word arrays -1; the
    words +0x1a..+0x25 / +0x52.. are not written."""
    st = mk(game)
    tf = st.ai[0].task_forces[1]
    tf.w1a[2], tf.w52[0], tf.age, tf.flags = 7, 9, 5, 0x21
    XX.reset_tf(st, 1)
    assert (tf.age, tf.enemy, tf.staging, tf.flags, tf.min_moves) == (0, -1, -1, 0, 0)
    assert tf.sources == [-1] * 4 and tf.leaders == [-1] * 4
    assert tf.targets == tf.dists == tf.nb_counts == tf.former == [-1] * 6
    assert tf.w1a[2] == 7 and tf.w52[0] == 9


def test_source_ok_and_is_staging(game):
    """0a7a / 07f8 look at active task forces k < AI[+0x24a] only."""
    st = mk(game)
    c = add_city(st, 10, 10, 0)
    b = st.ai[0]
    b.role[c] = 8
    assert XX.source_ok(st, c, 0) == 1
    b.role[c] = 6
    assert XX.source_ok(st, c, 0) == 0 and XX.source_ok(st, c, 1) == 1
    b.task_forces[3].age, b.task_forces[3].staging = 1, c
    assert XX.is_staging(st, c) == 1 and XX.source_ok(st, c, 1) == 0
    b.n_task_forces = 3
    assert XX.is_staging(st, c) == 0 and XX.source_ok(st, c, 1) == 1


def test_drop_source_and_count_enemy_nb(game):
    """083e: s leaves the sources of every active task force and its vectoring word is
    cleared; 09ca: per target the neighbours owned by the enemy, empty targets untouched."""
    st = mk(game)
    s = add_city(st, 10, 10, 0)
    t = add_city(st, 20, 10, 4)
    n1, n2 = add_city(st, 30, 10, 4), add_city(st, 40, 10, 2)
    link(st, t, n1, 10)
    link(st, t, n2, 10)
    tf = st.ai[0].task_forces[0]
    tf.age, tf.enemy, tf.sources = 1, 4, [s, -1, s, -1]
    st.cities[s].vectoring = 1
    XX.drop_source(st, s)
    assert tf.sources == [-1] * 4 and st.cities[s].vectoring == 0
    tf.targets = [-1, t, -1, -1, -1, -1]
    tf.nb_counts = [7] * 6
    XX.count_enemy_nb(st, 0)
    assert tf.nb_counts == [7, 1, 7, 7, 7, 7]


def test_enemy_core_draws_only_on_ties(game):
    """04d2: the enemy city with the most enemy neighbours (n = 1 + them); a tie draws
    rnd(1,2,-1) and takes the later-scanned city when it is not 0."""
    st = mk(game)
    a = add_city(st, 10, 10, 4)
    b = add_city(st, 20, 10, 4)
    c = add_city(st, 30, 10, 4)
    link(st, b, c, 5)                          # b and c: n = 2, a: n = 1
    st.rng.script = [0]
    assert XX.enemy_core(st, 4) == c           # scan c (n 2), b (tie: 0 -> keep c), a (1)
    assert st.rng.calls == [(1, 2, -1)]
    st.rng.script = [1]
    assert XX.enemy_core(st, 4) == b
    assert XX.enemy_core(st, 5) == -1


def test_graph_dist_relaxes_until_stable(game):
    """058a: graph distances over the neighbour table, passes over count-1..0; a done city is
    never revisited, so c3 keeps 30 + 5 from c2's first (longer) distance: 35, not 25."""
    st = mk(game)
    cs = [add_city(st, 10 + 5 * i, 10, 0) for i in range(4)]
    link(st, cs[0], cs[1], 10)
    link(st, cs[1], cs[2], 10)
    link(st, cs[0], cs[2], 30)
    link(st, cs[2], cs[3], 5)
    g = XX._Graph()
    XX.graph_dist(st, g, cs[0])
    assert [g.D[c] for c in cs] == [0, 10, 20, 35] and all(g.R[c] for c in cs)


def test_pick_staging_and_targets(game):
    """01bb: staging = the own city with a DS:0940 role nearest (graph) to the enemy core;
    targets = the enemy's unflagged reached cities, nearest first (03ff)."""
    st = mk(game)
    own_far = add_city(st, 10, 10, 0)
    own = add_city(st, 20, 10, 0)
    e1 = add_city(st, 30, 10, 4)
    e2 = add_city(st, 40, 10, 4)
    link(st, own_far, own, 10)
    link(st, own, e1, 12)
    link(st, e1, e2, 8)
    b = st.ai[0]
    b.role[own_far] = b.role[own] = 5
    ids, dists = [0] * 6, [0] * 6
    st.rng.script = [1]                        # e1 / e2 tie (n = 2 each): e1 scanned later wins
    assert XX.pick_staging(st, 0, 4, ids, dists) == own
    assert ids == [e1, e2, -1, -1, -1, -1] and dists == [12, 20, -1, -1, -1, -1]
    b.role[own] = 3                            # not a DS:0940 role
    st.rng.script = [1]
    assert XX.pick_staging(st, 0, 4, ids, dists) == own_far
    assert dists[:2] == [22, 30]


def test_pick_staging_unreachable_fallback(game):
    """No own candidate reached: the core, if not flagged unseen, is target 0 at distance 100
    and the straight-line nearest candidate is the staging city."""
    st = mk(game)
    a = add_city(st, 10, 10, 0)
    bb = add_city(st, 60, 10, 0)
    e = add_city(st, 30, 10, 4)
    st.ai[0].role[a] = st.ai[0].role[bb] = 8
    ids, dists = [0] * 6, [0] * 6
    assert XX.pick_staging(st, 0, 4, ids, dists) == a
    assert ids[0] == e and dists[0] == 100 and ids[1:] == [-1] * 5
    st.ai[0].city_flags[e] = 1
    assert XX.pick_staging(st, 0, 4, ids, dists) == -1


def test_pick_targets_reads_ai_11d(game):
    """03ff: nothing found -> the fallback tests AI[+0x11e + (-1)] = AI[+0x11d], which is the
    +0xba byte (age) of city 99, not the core's flag."""
    st = mk(game)
    e = add_city(st, 30, 10, 4)
    g = XX._Graph()
    ids, dists = [-1] * 6, [-1] * 6
    st.ai[0].city_flags[e] = 1                 # the core is unseen: not a target itself
    assert XX.pick_targets(st, g, e, 4, ids, dists) == 1 and ids[0] == e and dists[0] == 100
    st.ai[0].age[99] = 1
    ids, dists = [-1] * 6, [-1] * 6
    assert XX.pick_targets(st, g, e, 4, ids, dists) == 0 and ids[0] == -1


@pytest.mark.parametrize("script,gold,flags,calls", [
    ([10], 500, 1, 1),                         # 10 < 11 + 10
    ([999, 5], 500, 2, 2),
    ([999, 999, 5], 500, 4, 3),
    ([999, 999, 999], 500, 0, 3),
    ([999, 25], 50, 2, 2),                     # gold < 100: + AI[+0x36] before the 2nd draw
])
def test_style_draws(game, script, gold, flags, calls):
    """06a0: base = AI[+2]*AI[+0x2c] + the bonus of the side's level (+0x32 for level 1);
    rnd(1,1000,0) < weight + base sets the flag and ends; gold < 100 adds AI[+0x36] after
    the first draw."""
    st = mk(game)
    b = st.ai[0]
    b.own_cities, b.tf_city_mult, b.tf_bonus_l1 = 2, 3, 4          # base 10
    b.tf_odds_1, b.tf_odds_2, b.tf_odds_4, b.tf_bonus_poor = 11, 10, 10, 10
    st.players[0].gold = gold
    st.rng.script = list(script)
    XX.style(st, 0)
    assert st.ai[0].task_forces[0].flags == flags
    assert st.rng.calls == [(1, 1000, 0)] * calls


def test_style_skips_zero_weights(game):
    """A zero weight draws nothing."""
    st = mk(game)
    b = st.ai[0]
    b.tf_odds_1, b.tf_odds_2, b.tf_odds_4 = 0, 0, 5
    st.rng.script = [1]
    XX.style(st, 2)
    assert st.rng.calls == [(1, 1000, 0)] and b.task_forces[2].flags == 4


def phase_state(game):
    st = mk(game)
    st.options = replace(st.options, diplomacy=1)
    st.turn = 20
    b = st.ai[0]
    b.turns_with_cities = 5
    own = add_city(st, 10, 10, 0)
    e = add_city(st, 20, 10, 4)
    link(st, own, e, 15)
    b.role[own] = 8
    st.flags[0x193], st.flags[0x195] = 10, 10
    b.memory[2][4] = 3
    return st, own, e


def test_assault_xx_creates_a_task_force(game, monkeypatch):
    """0000: k = the lowest inactive slot; rnd order 0e04 (8), 04d2 (none here), 06a0; age 1,
    enemy, staging (role 7), war proposal, sources dropped, 09ca, ovl21:01b3."""
    st, own, e = phase_state(game)
    calls = []
    monkeypatch.setattr(EV, "tf_groups", lambda s: calls.append("01b3"))
    b = st.ai[0]
    b.task_forces[1].age, b.task_forces[1].enemy = 2, 4   # one active: n >= 3 cities with role 5 / 8 needed
    for i in range(2):
        b.role[add_city(st, 10 + 3 * i, 40, 0)] = 5
    b.tf_odds_1 = 1000
    st.rng.script = [1] * 8 + [3]
    XX.assault_xx(st)
    tf = b.task_forces[0]
    assert (tf.age, tf.enemy, tf.staging, tf.targets[0], tf.dists[0], tf.flags) == (1, 4, own, e, 15, 1)
    assert b.role[own] == 7 and D.proposal(st, 0, 4) == Relation.WAR and calls == ["01b3"]
    assert st.rng.calls == [(1, 10, 0)] * 8 + [(1, 1000, 0)]
    assert tf.nb_counts[0] == 0


def test_assault_xx_preconditions(game, monkeypatch):
    """Nothing while AI[+0] == 0; act < AI[+0x24a] (signed); n roles 5/8 != 0; with an active
    task force n >= 3 is needed; no enemy -> the reset slot stays empty."""
    st, own, e = phase_state(game)
    monkeypatch.setattr(EV, "tf_groups", lambda s: None)
    b = st.ai[0]
    b.task_forces[3].age = 1
    XX.assault_xx(st)                          # act 1, n 1 < 3
    assert st.rng.calls == []
    b.task_forces[3].age = 0
    b.turns_with_cities = 0
    XX.assault_xx(st)
    assert st.rng.calls == []
    b.turns_with_cities = 1
    b.memory[2][4] = 0                         # 0e04 finds nobody
    st.turn = 2
    XX.assault_xx(st)
    assert st.rng.calls == [(1, 10, 0)] * 8 and b.task_forces[0].age == 0


def test_refresh_and_pick_sources(game, monkeypatch):
    """0aed: own role 6 -> 8 and vectoring off; 0b72 for k = 3..0: mv by the TF flags, group bits
    must match, slot moves >= mv, the first empty slot else the weakest (strict, from 100),
    replaced only by an equal or stronger raw slot strength; role 6 on the sources."""
    st = mk(game)
    t = type_with(st, flag16=0, cancel_mode=0)
    cs = [add_city(st, 3 + 3 * i, 10, 0) for i in range(6)]
    strengths = [3, 5, 2, 6, 4, 9]
    b = st.ai[0]
    for c, s in zip(cs, strengths):
        st.cities[c].slots[0] = Slot(t, 1, s, 16, 1)
        b.role[c] = 8
    b.role[cs[5]] = 6
    st.cities[cs[5]].vectoring = 1
    b.city_flags[cs[4]] = 0x80                  # reserved for the fast group: not for TF 0
    monkeypatch.setattr(XX, "can_build_decent", lambda st_, c: (1, 0))
    tf = b.task_forces[0]
    tf.age, tf.staging, tf.min_moves = 1, -1, 16
    XX.refresh_sources(st)
    assert b.role[cs[5]] == 6 and st.cities[cs[5]].vectoring == 0
    # scan 5..0: 9 -> s0, (4 reserved), 6 -> s1, 2 -> s2, 5 -> s3, 3 replaces the 2 (slot 2)
    assert tf.sources == [cs[5], cs[3], cs[0], cs[1]]
    assert [b.role[c] for c in cs] == [6, 6, 8, 6, 8, 6]
    tf.flags = 8                                # fast task force: only bit-0x80 cities
    XX.pick_sources(st, 0)
    assert tf.sources == [cs[4], -1, -1, -1]


def test_choose_enemy_is_ovl27_0e04():
    """assault XX calls ovl27:0e04, which lives in diplomacy.py (ai.md §9)."""
    assert DP.choose_enemy.__module__ == "warlords2.ai.phases.diplomacy"


# ------------------------------------------------------------------------------- review M8b4


def test_assault_xx_tie_draw_between_0e04_and_06a0(game, monkeypatch):
    """0000: the draws come as 0e04 (8 x rnd(1,10,0)), then 04d2's tie draw rnd(1,2,-1) inside
    01bb, then 06a0's rnd(1,1000,0).  Two enemy cities with n = 1: the later-scanned e wins the
    tie on a non-zero draw."""
    st, own, e = phase_state(game)
    monkeypatch.setattr(EV, "tf_groups", lambda s: None)
    e2 = add_city(st, 60, 10, 4)
    b = st.ai[0]
    b.tf_odds_1 = 1000
    st.rng.script = [1] * 8 + [1, 3]
    XX.assault_xx(st)
    assert st.rng.calls == [(1, 10, 0)] * 8 + [(1, 2, -1)] + [(1, 1000, 0)]
    tf = b.task_forces[0]
    assert (tf.age, tf.staging, tf.targets[0]) == (1, own, e) and e2 not in tf.targets


def test_assault_xx_no_staging_resets_the_slot_again(game, monkeypatch):
    """0000 0123..0134: 01bb == -1 -> 08ba(k) a second time and done: no 06a0 draw, no war
    proposal, no staging role."""
    st, own, e = phase_state(game)
    monkeypatch.setattr(EV, "tf_groups", lambda s: None)
    calls = []
    real = XX.reset_tf
    monkeypatch.setattr(XX, "reset_tf", lambda s, k: calls.append(k) or real(s, k))
    monkeypatch.setattr(XX, "pick_staging", lambda s, k, en, ids, ds: -1)
    b = st.ai[0]
    b.tf_odds_1 = 1000
    D.set_proposal(st, 0, 4, Relation.NEUTRAL)
    st.rng.script = [1] * 8
    XX.assault_xx(st)
    assert calls == [0, 0]
    assert st.rng.calls == [(1, 10, 0)] * 8
    assert b.task_forces[0].age == 0 and b.role[own] == 8 and D.proposal(st, 0, 4) == Relation.NEUTRAL


@pytest.mark.parametrize("flags, cf, mm, moves, taken", [
    (0x10, 0x08, 0, 11, False), (0x10, 0x08, 0, 12, True),       # 0x10: mv 12 (0baa)
    (0x08, 0x80, 0, 15, False), (0x08, 0x80, 0, 16, True),       # 8: mv 16 (0bc5)
    (0x18, 0x88, 0, 12, True),                                   # 0x10 tested first
    (0x00, 0x00, 20, 19, False), (0x00, 0x00, 20, 20, True),     # else +0x58 (jge)
    (0x00, 0x00, 8, 0x90, False),                                # moves: signed byte
    (0x20, 0x40, 0, 30, True), (0x20, 0x00, 0, 30, False),       # flyer TF: city bit 0x40
    (0x10, 0x00, 0, 30, False), (0x08, 0x08, 0, 30, False),      # medium 0x08, fast 0x80
    (0x00, 0x08, 0, 30, False), (0x00, 0x40, 0, 30, False),      # no group: none of 0xc8
    (0x00, 0x80, 0, 30, False), (0x00, 0x30, 0, 30, True),
])
def test_pick_sources_moves_and_city_bits(game, monkeypatch, flags, cf, mm, moves, taken):
    """0b72: mv = 12 (flag 0x10) / 16 (flag 8) / +0x58; the decent slot's moves (signed byte)
    >= mv; flag 0x10 needs city bit 0x08, 8 needs 0x80, 0x20 needs 0x40, none of 0x38 needs none
    of 0xc8 (0c66..0cf6)."""
    st = mk(game)
    c = add_city(st, 10, 10, 0)
    st.cities[c].slots[0] = Slot(type_with(st, flag16=0), 1, 3, moves, 1)
    b = st.ai[0]
    b.role[c], b.city_flags[c] = 8, cf
    monkeypatch.setattr(XX, "can_build_decent", lambda st_, cc: (1, 0))
    tf = b.task_forces[0]
    tf.age, tf.flags, tf.min_moves = 1, flags, mm
    XX.pick_sources(st, 0)
    assert tf.sources == ([c] if taken else [-1]) + [-1] * 3


def test_pick_sources_equal_strength_replaces(game, monkeypatch):
    """0d80..0d9c: with the four slots full, a city whose slot strength equals the weakest
    source's (`jl` skips only a weaker one) replaces it."""
    st = mk(game)
    t = type_with(st, flag16=0, cancel_mode=0)
    cs = [add_city(st, 3 + 3 * i, 10, 0) for i in range(5)]
    b = st.ai[0]
    for c, s in zip(cs, (2, 9, 6, 5, 2)):
        st.cities[c].slots[0] = Slot(t, 1, s, 16, 1)
        b.role[c] = 8
    monkeypatch.setattr(XX, "can_build_decent", lambda st_, c: (1, 0))
    tf = b.task_forces[0]
    tf.age, tf.min_moves = 1, 8
    XX.pick_sources(st, 0)
    assert tf.sources == [cs[0], cs[3], cs[2], cs[1]]


@pytest.mark.parametrize("ntf, active, n, runs", [
    (4, 1, 2, False), (4, 1, 3, True),         # with an active task force n >= 3 (00a6 jge)
    (4, 0, 1, True),                           # none active: n != 0 is enough
    (2, 2, 3, False), (3, 2, 3, True),         # AI[+0x24a] > act (008b jg)
])
def test_assault_xx_gate(game, monkeypatch, ntf, active, n, runs):
    """0000 0024..00aa: n = own cities with role 5 / 8, act = active task forces of all four;
    the phase goes on (0e04 draws) only when AI[+0x24a] > act, n != 0 and (act == 0 or n >= 3)."""
    st, own, e = phase_state(game)
    monkeypatch.setattr(EV, "tf_groups", lambda s: None)
    b = st.ai[0]
    b.n_task_forces = ntf
    for k in range(active):
        b.task_forces[3 - k].age, b.task_forces[3 - k].enemy = 1, 4
    for i in range(n - 1):
        b.role[add_city(st, 10 + 3 * i, 40, 0)] = 5
    st.rng.script = [1] * 8
    XX.assault_xx(st)
    assert (st.rng.calls[:8] == [(1, 10, 0)] * 8) is runs
