"""ovl19 assault and capture choice (ai.md §6.5) as warlords2.ai.phases.assault, pinned to the
listing: target slots, leaders, launch scoring with its rnd order (15c5 then rnd(1,4,0) per
target), the skirmish scan, the march / capture flow, the raze contract (one ovl29:1851 per
raze); and an integration run on a real scenario (deterministic across two runs)."""
from dataclasses import replace

import pytest

from warlords2.ai import base as B
from warlords2.ai.cards import card_reader
from warlords2.ai.phases import assault as A
from warlords2.ai.phases import assault_xx as XX
from warlords2.ai.phases import evaluate as EV
from warlords2.formats.gamedir import GameDir
from warlords2.model.city import Slot
from warlords2.model.ids import Control, Relation
from warlords2.model.newgame import NewGameConfig
from warlords2.model.options import GameOptions
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import diplomacy as D
from warlords2.rules import movement as M
from warlords2.rules import pathfinding as P
from warlords2.rules import setup as S
from warlords2.rules.bonuses import s8
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.mapwords import refresh_map

import movekit
from movekit import add_army, add_city as _add_city, flat_state, type_with

pytestmark = pytest.mark.gamedata


class Rec:
    def __init__(self, rng, script=None):
        self.rng, self.calls, self.script = rng, [], list(script or [])

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.script.pop(0) if self.script else self.rng.rnd(d, s, a)

    def state(self):
        return self.rng.state()


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
    b = st.ai[0]
    b.n_task_forces, b.simulations, b.quest_city = 4, 10, -1
    for k in range(4):
        XX.reset_tf(st, k)
    return st


def link(st, a, b, d):
    nb = st.ai.neighbours
    for x, y in ((a, b), (b, a)):
        i = nb.ids[x * 6:x * 6 + 6].index(0xFF)
        nb.ids[x * 6 + i], nb.dists[x * 6 + i] = y, d


def high(st):
    st.flags[SCN_ARMY_HIGH] = len(st.armies)


def active(st, k, enemy, staging, targets=(), dists=()):
    tf = st.ai[0].task_forces[k]
    tf.age, tf.enemy, tf.staging = 1, enemy, staging
    for i, (t, d) in enumerate(zip(targets, dists)):
        tf.targets[i], tf.dists[i] = t, d
    return tf


# ------------------------------------------------------------------------------- 041c, 0607, 066d


def test_refresh_targets_slots(game):
    """041c: stale targets (AI[+0x46], no longer the enemy's) -> -1; new enemy neighbours of the
    staging city (NB i = 5..0, unflagged, not present) are counted even when not stored; the
    slot is the highest empty one, else the largest distance (> from 0), replaced only when
    the NB distance is smaller."""
    st = mk(game)
    s = add_city(st, 10, 10, 0)
    t = [add_city(st, 20 + 5 * i, 10, 4) for i in range(8)]
    tf = active(st, 0, 4, s, t[:6], [5, 9, 7, 9, 3, 4])
    st.cities[t[1]].owner = 2                     # lost by the enemy
    st.ai[0].quest_city = t[2]
    link(st, s, t[6], 8)                          # NB slot 0
    link(st, s, t[7], 6)                          # NB slot 1, scanned first (5..0)
    n = A.refresh_targets(st, 0)
    assert n == 6                                 # 4 kept + 2 new
    assert tf.targets == [t[0], t[6], t[7], t[3], t[4], t[5]]
    assert tf.dists == [5, 8, 6, 9, 3, 4]


def test_refresh_targets_full_list_replaces_largest_distance(game):
    st = mk(game)
    s = add_city(st, 10, 10, 0)
    t = [add_city(st, 20 + 5 * i, 10, 4) for i in range(7)]
    tf = active(st, 0, 4, s, t[:6], [5, 9, 7, 9, 3, 4])
    link(st, s, t[6], 9)                          # not < 9: counted, not stored
    assert A.refresh_targets(st, 0) == 7 and t[6] not in tf.targets
    st.ai.neighbours.dists[s * 6] = 8             # < 9: replaces the highest slot with 9 (3)
    A.refresh_targets(st, 0)
    assert tf.targets[3] == t[6] and tf.dists[3] == 8 and tf.targets[1] == t[1]


def test_cancel_oldest_highest_index_on_ties(game):
    """0607: the largest age, strict > scanning k = AI[+0x24a]-1..0; 066d puts role 8 on the
    staging city and the sources and resets the record."""
    st = mk(game)
    c = [add_city(st, 10 + 5 * i, 10, 0) for i in range(3)]
    for k, age in ((0, 3), (2, 3), (1, 2)):
        active(st, k, 4, c[k]).age = age
    st.ai[0].task_forces[2].sources = [c[0], -1, -1, -1]
    A.cancel_oldest(st)
    b = st.ai[0]
    assert b.task_forces[2].age == 0 and b.task_forces[0].age == 3
    assert b.role[c[2]] == 8 and b.role[c[0]] == 8 and b.task_forces[2].staging == -1


def test_move_staging(game):
    """02ed: the nearest own neighbour (NB 5..0, strict, from 1000) that is not a staging city;
    none -> 066d(k, 1)."""
    st = mk(game)
    s = add_city(st, 10, 10, 2)
    a = add_city(st, 20, 10, 0)
    b_ = add_city(st, 10, 20, 0)
    o = add_city(st, 13, 10, 3)
    for x in (a, b_, o):
        link(st, s, x, 10)
    tf = active(st, 0, 4, s)
    active(st, 1, 4, a)
    assert A.move_staging(st, 0) == 1 and tf.staging == b_
    tf.staging = s
    st.cities[b_].owner = 5
    assert A.move_staging(st, 0) == 0 and tf.age == 0


def test_extend_targets(game):
    """1579: with exactly one target T: T's enemy neighbours fill the empty slots without a
    distance; an own neighbour that is not a staging city becomes the staging city unless the
    staging city already is T's neighbour."""
    st = mk(game)
    s = add_city(st, 5, 10, 0)
    T = add_city(st, 20, 10, 4)
    e = add_city(st, 30, 10, 4)
    o = add_city(st, 20, 20, 0)
    link(st, T, e, 7)
    link(st, T, o, 7)
    tf = active(st, 0, 4, s, [-1, -1, T], [-1, -1, 12])
    tf.dists[0] = 33
    A.extend_targets(st, 0)
    assert tf.targets[:3] == [e, -1, T] and tf.dists[0] == 33 and tf.staging == o
    tf.targets = [-1, -1, T, -1, -1, -1]
    tf.staging = s
    link(st, T, s, 7)
    A.extend_targets(st, 0)
    assert tf.staging == s


# ------------------------------------------------------------------------------- 08b2, 1251


def test_record_and_check_leaders(game):
    """08b2: only the highest free slot; the first hero scanning 7..0 wins at once, else the
    strongest (signed byte, strict >: the highest list slot on ties).  1251: a leader not
    owned or without group k + 1 is removed."""
    st = mk(game)
    t = type_with(st, flag16=0)
    a, b_, c = (add_army(st, t, 5, 5) for _ in range(3))
    a.strength = b_.strength = 6
    c.strength = 0x90                              # signed: -112
    tf = st.ai[0].task_forces[1]
    tf.leaders = [5, -1, -1, 7]
    A.record_leader(st, 1, [a.id, b_.id, c.id, -1, -1, -1, -1, -1])
    assert tf.leaders == [5, -1, b_.id, 7]
    hero = add_army(st, 28, 5, 5)
    A.record_leader(st, 1, [hero.id, a.id, b_.id, -1, -1, -1, -1, -1])
    assert tf.leaders == [5, hero.id, b_.id, 7]
    for x in (hero, b_):
        x.order = 2 << 4
    st.armies.append(type(a)(**{**a.__dict__, "id": 5, "owner": 0xFF}))
    tf.leaders = [-1, hero.id, b_.id, -1]
    b_.order = 3 << 4
    A.check_leaders(st, 1)
    assert tf.leaders == [-1, hero.id, -1, -1]


# ------------------------------------------------------------------------------- 1864, 199c, 1a2a


def slot_city(st, x, y, owner, types):
    c = add_city(st, x, y, owner)
    st.cities[c].slots = [Slot(t, 1, 1, 1, 1) for t in types] + [Slot()] * (4 - len(types))
    return c


def test_capture_choice_occupy_sack_raze(game, monkeypatch):
    """1864: not forced and >= 3 own neighbours at NB distance < 45 -> -1 (occupy, no rnd);
    sack value >= 400 -> 199c; else raze with rnd(1,15,0) + 10 infamy and ovl29:1851 run once,
    its result returned."""
    st = mk(game)
    expensive, cheap = 19, 11                     # |w4| 2500 and 10 (sack value = |w4| / 2)
    c = slot_city(st, 20, 20, 0, [cheap, cheap])
    for i in range(3):
        link(st, c, add_city(st, 40 + 4 * i, 10, 0), 44)
    assert A.capture_choice(st, c, 0) == (-1, []) and st.rng.calls == []
    raze_calls = []
    monkeypatch.setattr(B, "after_raze", lambda s, ci: (raze_calls.append(ci),
                                                        setattr(s.ai, "raze_target", 7)))
    st.rng.script = [4]
    inf = st.players[0].infamy
    r, ev = A.capture_choice(st, c, 1)
    assert r == 7 and raze_calls == [c] and st.rng.calls == [(1, 15, 0)]
    assert st.players[0].infamy == inf + 14 and st.cities[c].owner == 0x0F
    c2 = slot_city(st, 60, 20, 0, [expensive] * 4)
    assert CT_sack(st, c2) >= 400
    st.rng.calls.clear()
    st.rng.script = [1]
    gold = st.players[0].gold
    r, ev = A.capture_choice(st, c2, 1)
    assert r == -1 and st.rng.calls == [(1, 10, 0)] and st.players[0].gold > gold
    assert raze_calls == [c]


def CT_sack(st, c):
    from warlords2.rules import city as CT
    return CT.sack_value(st, c)


def test_sack_falls_back_to_pillage(game):
    """199c with sack value 0 (fewer than 2 slots) -> 1a2a: gold, last slot emptied, rnd(1,5,0);
    1a2a with value 0 draws nothing."""
    st = mk(game)
    t = st.army_types[3].type_id
    c = slot_city(st, 20, 20, 0, [t])
    st.rng.script = [2]
    gold, inf = st.players[0].gold, st.players[0].infamy
    ev = A.sack(st, c)
    assert st.rng.calls == [(1, 5, 0)] and st.players[0].infamy == inf + 2
    assert st.players[0].gold > gold and st.cities[c].slots[0].type & 0xFF == 0xFF and ev
    assert A.pillage(st, c) == [] and st.rng.calls == [(1, 5, 0)]


# ------------------------------------------------------------------------------- 06e9, 0c32, 0f1b


def army_city(game, n_armies=3, moves=20):
    st = mk(game)
    t = type_with(st, flag16=0)
    s = add_city(st, 10, 10, 0)
    ids = [add_army(st, t, 11, 10, 0, moves=moves).id for _ in range(n_armies)]
    high(st)
    return st, s, t, ids


def test_launch_rnd_order_and_scoring(game, monkeypatch):
    """06e9: per target i = 0..5: 15c5 then rnd(1,4,0); s = max(10 - turns, 0) + p + nb + r
    (+ 100 at one turn); needs p > 75 or n >= 8; then 08b2, group bits k + 1, 0f1b(k, L, best)."""
    st, s, t, ids = army_city(game)
    t1, t2, t3 = (add_city(st, 30 + 10 * i, 10, 4) for i in range(3))
    tf = active(st, 2, 4, s, [t1, -1, t2, t3], [18, -1, 36, 1])
    tf.nb_counts = [0, 0, 5, 0, 0, 0]
    log = []
    odds = {t1: 80, t2: 90, t3: 70}

    def wo(st_, x, y):
        c = st_.city_at(x, y)
        log.append(("15c5", c))
        st_.rng.rnd(9, 9, 9)                       # stands for the simulations' dice
        return odds[c]
    monkeypatch.setattr(A, "win_odds", wo)
    marched = []
    monkeypatch.setattr(A, "attack_city", lambda st_, k, L, c: (marched.append((k, list(L), c)), (1, []))[1])
    st.rng.script = [9, 4, 9, 1, 9, 3]
    r, _ = A.launch(st, 2)
    assert r == 1
    assert st.rng.calls == [(9, 9, 9), (1, 4, 0)] * 3
    assert [c for _, c in log] == [t1, t2, t3]
    # DS:5e00 = 20 -> 18: t1 turns 2: 8 + 80 + 0 + 4 = 92; t2 turns 3: 7 + 90 + 5 + 1 = 103;
    # t3 (p 70 <= 75, 3 armies < 8) is not eligible.
    assert marched == [(2, ids[::-1] + [-1] * 5, t2)]   # 12c9 scans the records 0x181-1..0
    assert all((st.armies[i].order >> 4) & 7 == 3 for i in ids)
    assert tf.leaders[3] in ids


def test_launch_without_keepers(game):
    """06e9: no own army on square 0 (staging x + 1, y) -> 0 without a draw."""
    st, s, t, ids = army_city(game)
    for i in ids:
        st.armies[i].x = 10
    active(st, 0, 4, s, [s], [5])
    assert A.launch(st, 0) == (0, []) and st.rng.calls == []


def test_skirmish_scan_and_orders(game, monkeypatch):
    """0c32: x outer, y inner over [a - range, a + range); candidates need the army bit, the
    enemy's nibble, no city / water terrain, |map| <= DS:5e00 - 1 and the explored bit; the
    best p > 75 with (> 2 armies and strength > 10, or a hero); after the attack the
    survivors get order city c back."""
    st, s, t, ids = army_city(game)
    foe = add_army(st, t, 13, 12, 4)
    add_army(st, t, 12, 13, 4)
    high(st)
    for x, y in ((13, 12), (12, 13)):
        st.world.roads[y * 112 + x] |= 0x20
    for i in ids:
        st.armies[i].order, st.armies[i].vector_dest = 1, s
    M.select_list(st, ids)
    from warlords2.rules.selection import selection_step
    selection_step(st)
    dm = P.distance_map(st, 15, 11, 10, st.selection.mode, st.selection.mask)
    seen = []
    monkeypatch.setattr(A, "count_square", lambda st_, x, y: (3, 12, 0))
    monkeypatch.setattr(A, "win_odds", lambda st_, x, y: (seen.append((x, y)), 80)[1])
    moved = []

    def ex(st_, x, y, keep=0):
        moved.append((x, y, st_.armies[st_.selection.selected].goto))
        st_.armies[ids[1]].owner = 0xFF            # one of the group died
        return 0, []
    monkeypatch.setattr(M, "execute_move", ex)
    L = ids + [-1] * 5
    r, _ = A.skirmish(st, 0, L, 4, 15, dm)
    assert r == 2 and seen == [(12, 13), (13, 12)]  # x = 12 before x = 13
    assert moved == [(12, 13, (12, 13))]            # first of the equal p values (strict >)
    assert L == [ids[0], -1, ids[2]] + [-1] * 5
    assert st.armies[ids[0]].order & 0xF == 1 and st.armies[ids[0]].vector_dest == s
    assert foe.x == 13


def test_attack_city_capture_flags(game, monkeypatch):
    """0f1b: the march takes the city (owner now ours, was not): sack with flag 2 unless it is
    our first capital, then 134c; flag 1 with >= 2 targets: 1864 decides (here occupy -> 1)."""
    st, s, t, ids = army_city(game)
    expensive = 19
    tgt = slot_city(st, 30, 10, 4, [expensive] * 3)
    other = add_city(st, 50, 10, 4)
    link(st, tgt, other, 10)                       # tn = 3 > to = 0: tgt is the new staging city
    tf = active(st, 0, 4, s, [tgt, other], [10, 20])
    tf.flags = 2
    cleaned = []
    monkeypatch.setattr("warlords2.ai.phases.clean_city.clean_city",
                        lambda st_, c, f=0: (cleaned.append((c, f)), [])[1])

    def ex(st_, x, y, keep=0):
        st_.cities[tgt].owner = 0
        return 0, []
    monkeypatch.setattr(M, "execute_move", ex)
    gold = st.players[0].gold
    st.rng.script = [3]
    r, _ = A.attack_city(st, 0, ids + [-1] * 5, tgt)
    assert r == 1 and st.rng.calls == [(1, 10, 0)] and st.players[0].gold > gold
    assert cleaned == [(tgt, 1)] and tgt not in tf.targets and tf.former[0] == tgt
    assert tf.staging == tgt and st.ai[0].role[tgt] == 7
    st.cities[tgt].owner = 4
    st.flags[0x193], st.flags[0x195] = 30, 10      # our first capital: no sack
    st.rng.calls.clear()
    r, _ = A.attack_city(st, 0, ids + [-1] * 5, tgt)
    assert r == 1 and st.rng.calls == []


def test_attack_city_no_path_deletes_and_retargets_razed(game, monkeypatch):
    """0f1b: c razed -> the nearest intact target (dist from L[0], strict, lowest i on ties);
    0001 status 1 -> ovl24:0000(1), 1251, 3."""
    st, s, t, ids = army_city(game)
    razed = add_city(st, 20, 10, 0x0F)
    for dx in (0, 1):
        for dy in (0, 1):
            st.world.tiles[(10 + dy) * 112 + 20 + dx] = 7
    a1 = add_city(st, 31, 10, 4)                   # dist 20
    a2 = add_city(st, 11, 30, 4)                   # dist 20: lower i wins
    tf = active(st, 0, 4, s, [razed, a2, a1], [1, 2, 3])
    goto = []

    def ex(st_, x, y, keep=0):
        goto.append(st_.armies[st_.selection.selected].vector_dest)
        return 1, []
    monkeypatch.setattr(M, "execute_move", ex)
    deleted = []
    monkeypatch.setattr("warlords2.ai.phases.clean_city.delete_selection",
                        lambda st_, r: (deleted.append(r), [])[1])
    assert A.attack_city(st, 0, ids + [-1] * 5, razed) == (3, [])
    assert goto == [a2] and deleted == [1]


# ------------------------------------------------------------------------------- 0000, 00ca


def test_assault_roles_and_capital_loss(game, monkeypatch):
    """0000: own role 7 -> 8, then each active task force puts 7 on its staging city; 00ca:
    our first capital held by a side no task force fights -> 0607 (the oldest goes)."""
    st = mk(game)
    monkeypatch.setattr(EV, "tf_groups", lambda s: 0)
    b = st.ai[0]
    b.turns_with_cities = 3
    cap = add_city(st, 10, 10, 5)
    st.flags[0x193], st.flags[0x195] = 10, 10
    s1 = add_city(st, 30, 10, 0)
    old = add_city(st, 50, 10, 0)
    b.role[old] = 7
    active(st, 0, 4, s1).age = 4
    A.assault(st)
    assert b.task_forces[0].age == 0 and b.role[s1] == 8 and b.role[old] == 8
    active(st, 1, 5, s1).age = 2                  # now a task force fights the holder
    monkeypatch.setattr(A, "refresh_targets", lambda st_, k: 0)
    A.assault(st)
    assert b.task_forces[1].age == 0 and b.role[s1] == 8   # 041c == 0 -> 066d
    assert cap >= 0


# ------------------------------------------------------------------------------- integration


def real_game(game, seed=11):
    sc, at, kw = movekit._inputs(game, "ERYTHEA")
    opts = GameOptions(diplomacy=1, quests=1)
    cfg = NewGameConfig("ERYTHEA", (Control.COMPUTER,) * 8, (1,) * 8, (0,) * 8, (0,) * 8,
                        None, opts, 0, seed)
    with allowing_unverified():
        st = S.new_game(sc, cfg, list(at), cards=card_reader(GameDir(game)), **kw)
    refresh_map(st)
    P.rebuild_cost_map(st)
    return st


PHASES = B.PHASES
MINE = ("diplomacy", "assault", "evaluate", "quick_attack", "assault_xx")


def noop(state, *args):
    return []


def run_side(game, monkeypatch, seed=11, turns=4):
    """Side p of a real ERYTHEA game, at turn 12, holding its capital and three of its NB
    neighbours (role 8), battle memory against the owner of the nearest foreign city, and a
    stack on every city's square 0; the other phases (M8b2 / M8b3) are stubbed.
    Computer turns of p with the real executor and battles."""
    st = real_game(game, seed)
    phases = tuple((n, ms, t if t.split(":")[0].rsplit(".", 1)[1] in MINE else
                    "test_ai_assault:noop", a) for n, ms, t, a in PHASES)
    monkeypatch.setattr(B, "PHASES", phases)
    p = 1
    st.current = p
    st.turn = 12
    nb = st.ai.neighbours
    cap = st.city_at(*st.players[p].capital)
    mine = [cap] + [n for n in nb.ids[cap * 6:cap * 6 + 6] if n != 0xFF][:3]
    for c in mine:
        S._set_city_owner(st, c, p)
        city = st.cities[c]
        for dx in (0, 1):
            for dy in (0, 1):
                i = (city.y + dy) * 112 + city.x + dx
                st.world.flags[i] = (st.world.flags[i] & 0xF0) | p
    foreign = [c for c in range(len(st.cities)) if s8(st.cities[c].owner) not in (p, -1, 15)
               and st.cities[c].owner != 0x0F]
    tc = st.cities[mine[0]]
    enemy_city = min(foreign, key=lambda c: S.distance(tc.x, tc.y, st.cities[c].x, st.cities[c].y))
    enemy = st.cities[enemy_city].owner
    st.ai[p].memory[2][enemy] = 2
    st.ai[p].memory[1][enemy] = 30
    for c in mine:
        st.ai[p].role[c] = 8                       # what clean city (stubbed) leaves on full cities
    t = max((a for a in st.army_types[:28] if not a.flag16 and a.moves >= 12),
            key=lambda a: a.strength)
    for c in mine:
        city = st.cities[c]
        for _ in range(4):
            a = M.alloc_army(st)
            a.type_id, a.owner, a.x, a.y = t.type_id, p, city.x + 1, city.y
            a.allowance, a.moves_left, a.strength = t.moves, t.moves, t.strength
            a.flags, a.order, a.goto = 0, 0, (-1, -1)
            st.world.flags[city.y * 112 + city.x + 1] |= 0x10
    refresh_map(st)
    P.rebuild_cost_map(st)
    st.rng = Rec(st.rng)
    log = []
    for turn in range(12, 12 + turns):
        st.turn = turn
        st.current = p
        for a in st.armies:
            if s8(a.owner) == p:
                a.moves_left = a.allowance
                a.flags &= ~0x40
        with allowing_unverified():
            ev = B.computer_turn(st)
        tfs = [(k, x.age, x.enemy, x.staging, tuple(x.targets)) for k, x in
               enumerate(st.ai[p].task_forces) if x.age]
        log.append((turn, st.hash(), tfs, len(st.rng.calls), tuple(type(e).__name__ for e in ev)))
    return st, log, enemy, p


def test_integration_real_scenario_deterministic(game, monkeypatch):
    """Two runs of the same set-up give the same states, draws and events.  The task force is
    created by assault XX on the first turn against the side diplomacy made the enemy, war is
    proposed; assault launches a group from the staging city (06e9, task-force bits in +0xe,
    a leader), marches it over several turns (0996 / 0f1b with the real executor, boats
    included) and it fights."""
    st1, log1, enemy, p = run_side(game, monkeypatch, turns=9)
    st2, log2, _, _ = run_side(game, monkeypatch, turns=9)
    assert log1 == log2
    assert st1.rng.calls == st2.rng.calls
    first = log1[0][2]
    assert first and first[0][1] == 1 and first[0][2] == enemy
    assert D.proposal(st1, p, enemy) == Relation.WAR
    assert [x[1] for _, _, tfs, _, _ in log1[:7] for x in tfs] == [1, 2, 3, 4, 5, 6, 7]
    assert any("Embarked" in ev for *_, ev in log1)
    assert any("BattleStarted" in ev for *_, ev in log1)


# ------------------------------------------------------------------------------- 0f1b raze, null leader


def test_raze_after_real_move_uses_previous_table(game, monkeypatch):
    """0f1b with flag 1, >= 2 targets, not our first capital, < 3 own neighbours, sack value
    < 400: 1864 razes after the real 0a8b:0001(keep = 0), whose 0b62:08b3 left DS:5e62 null.
    ovl29:1851 reads x = 0x174 (int 0's offset) through it: 0555:1ab9 returns before T, so
    1885 scores on the table of the march's last search and the kept DS:5e3e / 5e00; the
    loop marches on to that city, razes it too and stops (-1)."""
    st, s, t, ids = army_city(game, n_armies=3, moves=100)
    tgt = add_city(st, 30, 10, 4)                  # no slots: sack value 0 -> raze
    other = add_city(st, 80, 60, 4)                # second target, far off: unreachable
    near = add_city(st, 10, 13, 0x0F)              # by the march's start, > 15 from tgt
    tf = active(st, 0, 4, s, [tgt, other], [10, 20])
    tf.flags = 1
    monkeypatch.setattr("warlords2.ai.phases.clean_city.clean_city", lambda st_, c, f=0: [])
    seen = []
    real = B.after_raze

    def spy(st_, c):
        sel = st_.selection
        table = st_.dist_table
        seen.append((c, sel.selected, list(sel.moving), sel.group, sel.moves))
        real(st_, c)
        assert st_.dist_table is table             # 1ab9 off the map: T untouched
        seen[-1] += (st_.ai.raze_target, table)
    monkeypatch.setattr(B, "after_raze", spy)
    r, ev = A.attack_city(st, 0, ids + [-1] * 5, tgt)
    assert r == 1
    assert [x[0] for x in seen] == [tgt, near] and [x[5] for x in seen] == [near, -1]
    assert all(x[1] == -1 for x in seen)          # DS:5e62 null at every 1851
    assert all(x[3] == 1 and sorted(x[2]) == sorted(ids) for x in seen)   # DS:5e3e kept
    assert st.cities[tgt].owner == st.cities[near].owner == 0x0F
    assert [c for c in st.rng.calls if c == (1, 15, 0)] == [(1, 15, 0)] * 2
    # the city is out of reach of a fresh 15-ring map around the razed city (what a 1ab9 on the
    # map would have scored) but reached in the march's table
    from warlords2.ai.util import nearest_ring
    fresh = P.distance_map(st, 15, 30, 10, 1, 0)
    assert nearest_ring(st, near, fresh, 0)[1] == -1
    assert nearest_ring(st, near, P.DistanceMap(0, seen[0][6]), 0)[1] != -1


# ------------------------------------------------------------------------------- 0996, 0b49


def _group(st, k, ids, kind=1, city=0):
    for i in ids:
        st.armies[i].order = (((k + 1) & 7) << 4) | kind
        st.armies[i].vector_dest = city


def test_move_groups_repeats_on_two_and_reads_the_top_entry_only(game, monkeypatch):
    """0996: per leader slot j = 3..0, r == 2 -> the same slot again (1251 and 13b2 re-run);
    r == 0 -> 0f1b on the order city of the first non-empty L entry scanning 7..0 (the highest
    slot), only when its kind is 1; r == 1 / 3 -> next slot."""
    st, s, t, ids = army_city(game)
    tgt, tgt2 = add_city(st, 30, 10, 4), add_city(st, 30, 20, 4)
    tf = active(st, 0, 4, s, [tgt, tgt2], [10, 10])
    _group(st, 0, ids, 1, tgt)
    st.armies[ids[0]].vector_dest = tgt2                   # 13b2 scans down: ids[0] is the top slot
    tf.leaders = [-1, -1, ids[1], -1]
    script = iter([2, 2, 0])
    calls, marched = [], []
    monkeypatch.setattr(A, "near_city", lambda st_, k, L, e, rng, dm: (calls.append(list(L)), (next(script), []))[1])
    monkeypatch.setattr(A, "attack_city", lambda st_, k, L, c: (marched.append(c), (1, []))[1])
    A.move_groups(st, 0)
    assert len(calls) == 3 and calls[-1][:3] == [ids[2], ids[1], ids[0]] and marched == [tgt2]
    for i in ids:
        st.armies[i].order = (1 << 4) | 4                  # kind 4: no march
    calls.clear(), marched.clear()
    script = iter([0, 1])
    A.move_groups(st, 0)
    assert len(calls) == 1 and marched == []
    script = iter([1, 3])
    tf.leaders = [ids[2], -1, ids[1], -1]
    calls.clear()
    A.move_groups(st, 0)
    assert len(calls) == 2                                  # 1 and 3 go on to the next slot


def test_near_city_range_moves_and_odds(game, monkeypatch):
    """0b49: enemy cities count-1..0 with ring distance < 50 and < DS:5e00 (signed) get a 15c5,
    the others none; p > 75; the smallest d (strict: the highest index on ties); 0c32's r != 0
    and a near city -> 0f1b(near), whose result is returned."""
    st, s, t, ids = army_city(game, moves=30)
    far = add_city(st, 40, 10, 4)                          # outside the 15 rings: d = 100
    c1 = add_city(st, 14, 10, 4)                           # d 2
    c2 = add_city(st, 14, 13, 4)                           # same d, higher index: wins the tie
    M.select_list(st, ids + [-1] * 5)
    from warlords2.rules.selection import selection_step
    selection_step(st)
    st.selection.moves = 20
    dm = P.distance_map(st, 15, 11, 10, st.selection.mode, st.selection.mask)
    sims = []
    monkeypatch.setattr(A, "win_odds", lambda st_, x, y: (sims.append(st_.city_at(x, y)), 80)[1])
    monkeypatch.setattr(A, "skirmish", lambda *a: (2, []))
    marched = []
    monkeypatch.setattr(A, "attack_city", lambda st_, k, L, c: (marched.append(c), (3, []))[1])
    assert A.near_city(st, 0, ids + [-1] * 5, 4, 15, dm)[0] == 3
    from warlords2.ai.util import nearest_ring
    assert nearest_ring(st, c1, dm)[0] == nearest_ring(st, c2, dm)[0]          # a tie
    assert sims == [c2, c1] and marched == [c2] and far not in sims
    st.selection.moves = nearest_ring(st, c1, dm)[0]        # d < DS:5e00 fails: no 15c5
    sims.clear(), marched.clear()
    assert A.near_city(st, 0, ids + [-1] * 5, 4, 15, dm)[0] == 2 and sims == [] and marched == []
    st.selection.moves = 20
    monkeypatch.setattr(A, "skirmish", lambda *a: (0, []))
    marched.clear()
    assert A.near_city(st, 0, ids + [-1] * 5, 4, 15, dm)[0] == 0 and marched == []


# ------------------------------------------------------------------------------- 00ca, 134c, 16fd


def test_run_tf_shared_staging_moves_it(game, monkeypatch):
    """00ca: another active task force with the same staging city -> 02ed; 02ed == 0 -> 0
    before 0996; not shared and our staging city -> no 02ed."""
    st, s, t, ids = army_city(game)
    tgt = add_city(st, 30, 10, 4)
    link(st, s, tgt, 10)
    active(st, 0, 4, s, [tgt], [10])
    st.flags[0x193], st.flags[0x195] = 10, 10      # our first capital is s, still ours
    log = []
    monkeypatch.setattr(A, "move_staging", lambda st_, k: (log.append(("02ed", k)), 0)[1])
    monkeypatch.setattr(A, "move_groups", lambda st_, k: (log.append(("0996", k)), [])[1])
    monkeypatch.setattr(A, "launch", lambda st_, k: (0, []))
    monkeypatch.setattr(A, "bring_rear", lambda st_, k: [])
    monkeypatch.setattr("warlords2.ai.phases.clean_city.clean_city", lambda st_, c, f=0: [])
    assert A.run_tf(st, 0)[0] == 1 and log == [("0996", 0)]
    active(st, 2, 4, s, [tgt], [10])
    log.clear()
    assert A.run_tf(st, 0)[0] == 0 and log == [("02ed", 0)]
    st.ai[0].task_forces[2].age = 0                        # an inactive one does not count
    log.clear()
    assert A.run_tf(st, 0)[0] == 1 and log == [("0996", 0)]


def test_after_capture_done_cancels_with_reason_three(game, monkeypatch):
    """134c: tn == to == 0 -> 066d(k, 3) and 0; the former list still gets the staging city
    (new = staging when tn <= to); c != staging; c leaves the targets."""
    st, s, t, ids = army_city(game)
    c = add_city(st, 30, 10, 0)
    tf = active(st, 0, 4, s, [5, c], [1, 2])
    reasons = []
    monkeypatch.setattr(A, "cancel_tf", lambda st_, k, r=0: reasons.append((k, r)))
    monkeypatch.setattr("warlords2.ai.phases.clean_city.clean_city", lambda st_, cc, f=0: [])
    assert A.after_capture(st, 0, c)[0] == 0
    assert reasons == [(0, 3)] and tf.targets[:2] == [5, -1] and tf.former[0] == s
    assert tf.staging == s
    assert A.after_capture(st, 0, s)[0] == 0 and reasons == [(0, 3)]   # c == staging: nothing
    foe = add_city(st, 10, 30, 4)
    link(st, s, foe, 45)                                    # to = 1, tn = 0: not done
    monkeypatch.setattr(A, "bring_rear", lambda st_, k: ["16fd"])
    c2 = add_city(st, 30, 30, 0)
    r, ev = A.after_capture(st, 0, c2)
    assert (r, ev, reasons, tf.staging, st.ai[0].role[c2]) == (1, ["16fd"], [(0, 3)], s, 7)


def test_bring_rear_danger_and_count(game, monkeypatch):
    """16fd: a former staging city with no foreign (not neutral, not ours) neighbour at NB
    distance < 25 sends its square-0 armies with +6 >= TF min moves when more than 3: 0ae7(L,
    1, staging, 0) and 0001; a neutral neighbour at 5 does not count, a foreign one at 24 does."""
    st, s, t, ids = army_city(game, n_armies=4)
    old = add_city(st, 30, 10, 0)
    for i in ids:
        st.armies[i].x, st.armies[i].allowance = 31, 12
    neutral = add_city(st, 30, 20, 0x0F)
    foe = add_city(st, 50, 10, 3)
    link(st, old, neutral, 5)
    link(st, old, foe, 25)
    tf = active(st, 0, 4, s)
    tf.former = [s, old, -1, -1, -1, -1]
    tf.min_moves = 12
    cleaned, moved = [], []
    monkeypatch.setattr("warlords2.ai.phases.clean_city.clean_city", lambda st_, c, f=0: cleaned.append((c, f)) or [])
    monkeypatch.setattr(M, "execute_move", lambda st_, x, y, k=0: moved.append((x, y, k)) or (0, []))
    A.bring_rear(st, 0)
    assert cleaned == [(old, 1)] and moved == [(11, 11, 0)]
    assert all(st.armies[i].order & 0xF == 1 and st.armies[i].vector_dest == s for i in ids)
    st.ai.neighbours.dists[old * 6 + 1] = 24
    cleaned.clear(), moved.clear()
    A.bring_rear(st, 0)
    assert cleaned == [] and moved == []
    st.ai.neighbours.dists[old * 6 + 1] = 25
    for i in ids:
        st.armies[i].order = 0                             # 13b2 wants sub 0 / kind 0 again
    st.armies[ids[0]].allowance = 11                       # 13b2: +6 >= 12 fails for one: 3 left
    A.bring_rear(st, 0)
    assert cleaned == [(old, 1)] and moved == []
