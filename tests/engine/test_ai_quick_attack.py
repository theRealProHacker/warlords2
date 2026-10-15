"""ovl26 quick attack and AI callbacks (ai.md §6.11, §6.11a) as
warlords2.ai.phases.quick_attack, pinned to the listing: the city filter, the per-neighbour
15c5 order (i = 5..0), danger and turn ties, the early plunder of human cities, the quest-city
bookkeeping after a battle, and the sage (rnd(3,500,500) first, then rnd(1,11,-6) x then y and
the map view's four draws)."""
from dataclasses import replace

import pytest

from warlords2.ai import base as B
from warlords2.ai.phases import assault as A
from warlords2.ai.phases import assault_xx as XX
from warlords2.ai.phases import quick_attack as QA
from warlords2.model.city import Slot
from warlords2.model.ids import Control, Relation
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import combat, ruins
from warlords2.rules import diplomacy as D
from warlords2.rules import movement as M
from warlords2.rules import quests as Q

from movekit import add_army, add_city as _add_city, flat_state, type_with

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


def mk(game, **opts):
    st = flat_state(game)
    st.options = replace(st.options, **opts)
    st.ai.allocated = 1
    for p in st.players:
        p.alive, p.control, p.level = 1, Control.COMPUTER, 1
    st.rng = Rec(st.rng)
    st.relations = [[0] * 8 for _ in range(8)]
    st.ai.neighbours.ids = [0xFF] * 600
    st.ai.neighbours.dists = [0] * 600
    b = st.ai[0]
    b.simulations, b.quest_city = 10, -1
    for k in range(4):
        XX.reset_tf(st, k)
    st.players[0].gold = 1000
    return st


def link(st, a, b, d, slot=None):
    nb = st.ai.neighbours
    i = nb.ids[a * 6:a * 6 + 6].index(0xFF) if slot is None else slot
    nb.ids[a * 6 + i], nb.dists[a * 6 + i] = b, d


def test_quick_attack_filters(game, monkeypatch):
    """04ba: AI[+0x48] != 0 -> nothing; else own cities (count-1..0) with a DS:0932 role and
    AI[+0x182 + c] >= 4 (unsigned byte)."""
    st = mk(game)
    cs = [add_city(st, 10 + 5 * i, 10, 0) for i in range(4)]
    b = st.ai[0]
    for c, role, n in zip(cs, (5, 3, 7, 14), (4, 9, 4, 3)):
        b.role[c], b.armies_here[c] = role, n
    add_city(st, 50, 10, 2)
    seen = []
    monkeypatch.setattr(QA, "quick_attack_city", lambda st_, c: (seen.append(c), [])[1])
    QA.quick_attack(st)
    assert seen == [cs[2], cs[0]]
    b.no_quick_attack = 1
    seen.clear()
    QA.quick_attack(st)
    assert seen == []


def qa_state(game, n=4, moves=12):
    st = mk(game)
    t = type_with(st, flag16=0)
    c = add_city(st, 10, 10, 0)
    ids = [add_army(st, t, 11, 10, 0, moves=moves).id for _ in range(n)]
    st.flags[SCN_ARMY_HIGH] = len(st.armies)
    st.ai[0].role[c] = 5
    st.ai[0].armies_here[c] = n
    return st, c, ids


def test_quick_attack_city_order_danger_and_ties(game, monkeypatch):
    """053f: 15c5 per eligible neighbour i = 5..0 (skipping unseen, own, razed, AI[+0x46], a
    side not at war); p == 0 near -> danger, nothing moves; p >= 85: fewest turns (d / max(DS:5e00
    - 2, 1) + 1), then higher p; 0ae7(L, 1, best, 0) and 0001 on the leader's goto."""
    st, c, ids = qa_state(game)
    n0 = add_city(st, 30, 10, 0x0F)              # slot 0: d 30 -> turns 4
    n1 = add_city(st, 30, 20, 4)                 # slot 1: peace with 4: skipped
    n2 = add_city(st, 10, 30, 0x0F)              # slot 2: d 20 -> turns 3
    n3 = add_city(st, 20, 30, 0x0F)              # slot 3: d 20 -> turns 3
    n4 = add_city(st, 40, 30, 0)                 # slot 4: own
    n5 = add_city(st, 50, 30, 0x0F)              # slot 5: unseen
    for i, (x, d) in enumerate(((n0, 30), (n1, 5), (n2, 20), (n3, 20), (n4, 5), (n5, 5))):
        link(st, c, x, d, i)
    st.ai[0].city_flags[n5] = 1
    odds = {n0: 100, n2: 90, n3: 85}
    calls = []
    monkeypatch.setattr(QA, "win_odds", lambda st_, x, y: (calls.append(st_.city_at(x, y)),
                                                            odds[st_.city_at(x, y)])[1])
    moved = []
    monkeypatch.setattr(M, "execute_move", lambda st_, x, y, k=0: (moved.append(
        (st_.armies[st_.selection.selected].vector_dest, (x, y))), (0, []))[1])
    QA.quick_attack_city(st, c)
    assert calls == [n3, n2, n0]
    assert moved == [(n2, (11, 30))]             # 0c7e: (10, 30) one step toward (11, 10)
    D.set_current(st, 0, 4, Relation.WAR)
    odds[n1] = 0                                 # p 0 at d 5 with 4 armies (< 6, < 15): danger
    moved.clear()
    calls.clear()
    QA.quick_attack_city(st, c)
    assert calls == [n3, n2, n1, n0] and moved == []


def test_quick_attack_city_threshold_and_small_groups(game, monkeypatch):
    """thr 65 when gold < 40 and income < upkeep, else 85; fewer than 4 armies on a role 6 / 7
    city -> nothing; role 7 uses the corner square and needs AI[+0x182] >= 12; 12c9 needs
    8 moves left."""
    st, c, ids = qa_state(game)
    n0 = add_city(st, 30, 10, 0x0F)
    link(st, c, n0, 10)
    monkeypatch.setattr(QA, "win_odds", lambda st_, x, y: 70)
    moved = []
    monkeypatch.setattr(M, "execute_move", lambda st_, x, y, k=0: (moved.append((x, y)), (0, []))[1])
    QA.quick_attack_city(st, c)
    assert moved == []                           # 70 < 85
    st.players[0].gold = 39
    monkeypatch.setattr(QA, "_income", lambda st_, p: 0)
    monkeypatch.setattr(QA, "_upkeep", lambda st_, p: 1)
    QA.quick_attack_city(st, c)
    assert len(moved) == 1                       # 70 >= 65
    st.ai[0].role[c] = 7
    st.ai[0].armies_here[c] = 11
    moved.clear()
    QA.quick_attack_city(st, c)
    assert moved == []
    for i in ids:
        st.armies[i].moves_left = 7
    st.ai[0].role[c] = 5
    QA.quick_attack_city(st, c)
    assert moved == []                           # nobody with 8 moves left


def test_captured_plunders_human_cities_early(game, monkeypatch):
    """ovl26:0000(c, prev): computer side, prev human, AI[+0x42] != 0, turn < 10, c not the
    quest city: sack value >= 200 -> 199c, else 1864(c, 0)."""
    st = mk(game)
    c = add_city(st, 10, 10, 0)
    st.cities[c].slots = [Slot(19, 1, 1, 1, 1), Slot(19, 1, 1, 1, 1), Slot(), Slot()]
    st.players[3].control = Control.HUMAN
    st.turn = 9
    got = []
    monkeypatch.setattr(A, "sack", lambda st_, ci: (got.append(("sack", ci)), [])[1])
    monkeypatch.setattr(A, "capture_choice", lambda st_, ci, f: (got.append(("1864", ci, f)), (-1, []))[1])
    assert QA.captured(st, c, 3) == [] and got == []             # AI[+0x42] == 0
    st.ai[0].plunder_early = 1
    QA.captured(st, c, 3)
    assert got == [("sack", c)]
    st.cities[c].slots[1] = Slot(11, 1, 1, 1, 1)                 # value 5 < 200
    QA.captured(st, c, 3)
    assert got[-1] == ("1864", c, 0)
    got.clear()
    st.turn = 10
    QA.captured(st, c, 3)
    QA.captured(st, c, 4)
    assert got == []


def test_after_battle_quest_city(game, monkeypatch):
    """ovl26:038d(x, y): Quests on, an active occupy (4) / raze (5) quest whose hero fought and
    whose target is the city at (x, y): AI[+0x4a] += 1, AI[+0x46] = -1; raze -> 1864(city, 1)
    then ovl01:1ded(2, ...); occupy -> ovl01:1ded(4, ...)."""
    st = mk(game, quests=1)
    c = add_city(st, 10, 10, 0)
    q = st.players[0].quest
    q.active, q.type, q.hero, q.target = 1, 5, 7, c
    st.battle_work.attackers = [3, 7]
    st.ai[0].quest_city = c
    got = []
    monkeypatch.setattr(A, "capture_choice", lambda st_, ci, f: (got.append(("1864", ci, f)), (-1, []))[1])
    monkeypatch.setattr(Q, "check", lambda st_, w: (got.append(("1ded", tuple(w))), (0, []))[1])
    QA.after_battle(st, 11, 11)
    assert got == [("1864", c, 1), ("1ded", (2, 0, 0, 0, 0))]
    assert st.ai[0].quest_city == -1 and st.ai[0].quest_battles == 1
    q.type = 4
    got.clear()
    QA.after_battle(st, 10, 10)
    assert got == [("1ded", (4, 0, 0, 0, 0))]
    st.battle_work.attackers = [3]
    got.clear()
    QA.after_battle(st, 10, 10)
    assert got == []


def sage_state(game, hidden):
    st = mk(game, hidden_map=hidden)
    own = add_city(st, 10, 10, 0)
    cl = [add_city(st, 20 + 3 * i, 10, 0x0F) for i in range(4)]
    link(st, cl[0], own, 10)
    for c in cl:
        st.ai[0].city_flags[c] = 1
    return st, own, cl


def test_sage_gold_without_hidden_map(game):
    """0080: rnd(3,500,500) is always drawn first; without Hidden Map the gold is added."""
    st, own, cl = sage_state(game, 0)
    st.rng.script = [700]
    gold = st.players[0].gold
    QA.sage(st, 3)
    assert st.rng.calls == [(3, 500, 500)] and st.players[0].gold == gold + 700


def test_sage_map_view_on_the_cluster(game, monkeypatch):
    """With Hidden Map and a cluster of >= 4 unseen neutral cities within 20 of a candidate
    next to us: x = corner + rnd(1,11,-6), y likewise (raised to 0, cut to 111 / 155), then
    ovl34:0cd6; no gold."""
    st, own, cl = sage_state(game, 1)
    shown = []
    monkeypatch.setattr(ruins, "map_view", lambda st_, x, y: (shown.append((x, y)), [])[1])
    st.rng.script = [700, -5, 4]
    gold = st.players[0].gold
    QA.sage(st, 3)
    assert st.rng.calls == [(3, 500, 500), (1, 11, -6), (1, 11, -6)]
    assert shown == [(st.cities[cl[0]].x - 5, 14)] and st.players[0].gold == gold
    st.ai[0].city_flags[cl[3]] = 0               # only 3 left: no cluster -> gold
    st.rng.calls.clear()
    st.rng.script = [700]
    QA.sage(st, 3)
    assert st.rng.calls == [(3, 500, 500)] and st.players[0].gold == gold + 700


def test_hooks_resolve_to_this_module():
    """rules.combat ai_after_battle, rules.movement ai_captured, rules.ruins ai_sage."""
    assert combat._hook("ai_after_battle") is QA.after_battle
    assert M._hook("ai_captured") is QA.captured
    assert ruins._hook("ai_sage") is QA.sage
    assert B.PHASES[11][2] == "warlords2.ai.phases.quick_attack:quick_attack"


def _mover(monkeypatch):
    moved = []
    monkeypatch.setattr(M, "execute_move", lambda st_, x, y, k=0: (moved.append(
        st_.armies[st_.selection.selected].vector_dest), (0, []))[1])
    return moved


def test_quick_attack_city_staging_uses_the_corner(game, monkeypatch):
    """055e..058c: x = c.x + 1, except role 7, which takes the armies on the corner (c.x, y)."""
    st, c, ids = qa_state(game)
    for i in ids:
        st.armies[i].x = 10                      # on the corner, not on x + 1
    n0 = add_city(st, 30, 10, 0x0F)
    link(st, c, n0, 10)
    monkeypatch.setattr(QA, "win_odds", lambda st_, x, y: 90)
    moved = _mover(monkeypatch)
    QA.quick_attack_city(st, c)
    assert moved == []                           # role 5: nobody on (11, 10)
    st.ai[0].role[c], st.ai[0].armies_here[c] = 7, 12
    QA.quick_attack_city(st, c)
    assert moved == [n0]


def test_quick_attack_city_threshold_is_inclusive(game, monkeypatch):
    """0787 `jl thr`: p == 85 is enough."""
    st, c, ids = qa_state(game)
    n0 = add_city(st, 30, 10, 0x0F)
    link(st, c, n0, 10)
    monkeypatch.setattr(QA, "win_odds", lambda st_, x, y: 85)
    moved = _mover(monkeypatch)
    QA.quick_attack_city(st, c)
    assert moved == [n0]


def test_quick_attack_city_full_tie_keeps_the_first(game, monkeypatch):
    """07b1..07be: equal turns and equal p (`jle`) keep the first found (slot 5 before 4)."""
    st, c, ids = qa_state(game)
    a = add_city(st, 30, 10, 0x0F)
    b = add_city(st, 10, 30, 0x0F)
    link(st, c, a, 20, 4)
    link(st, c, b, 20, 5)
    monkeypatch.setattr(QA, "win_odds", lambda st_, x, y: 90)
    moved = _mover(monkeypatch)
    QA.quick_attack_city(st, c)
    assert moved == [b]


@pytest.mark.parametrize("value, want", [(200, "sack"), (199, "1864")])
def test_captured_sack_value_boundary(game, monkeypatch, value, want):
    """005f `jl 0xc8`: a sack value of exactly 200 sacks."""
    from warlords2.rules import city as CT
    st = mk(game)
    c = add_city(st, 10, 10, 0)
    st.players[3].control = Control.HUMAN
    st.ai[0].plunder_early = 1
    st.turn = 2
    got = []
    monkeypatch.setattr(CT, "sack_value", lambda st_, ci: value)
    monkeypatch.setattr(A, "sack", lambda st_, ci: (got.append("sack"), [])[1])
    monkeypatch.setattr(A, "capture_choice", lambda st_, ci, f: (got.append("1864"), (-1, []))[1])
    QA.captured(st, c, 3)
    assert got == [want]


def test_after_battle_other_city_is_not_the_quest(game, monkeypatch):
    """0463: the quest's target (+6) must be the city at (x, y); another city -> nothing."""
    st = mk(game, quests=1)
    c = add_city(st, 10, 10, 0)
    other = add_city(st, 30, 10, 0)
    q = st.players[0].quest
    q.active, q.type, q.hero, q.target = 1, 4, 7, other
    st.battle_work.attackers = [7]
    st.ai[0].quest_city = other
    got = []
    monkeypatch.setattr(Q, "check", lambda st_, w: (got.append(tuple(w)), (0, []))[1])
    QA.after_battle(st, 10, 10)
    assert got == [] and st.ai[0].quest_city == other and st.ai[0].quest_battles == 0


def _cluster(st, own_xy, cand, extra):
    """Unseen neutral cities: `cand` (linked to an own city, created in this order, so the last
    is scanned first) and `extra` (not linked)."""
    own = add_city(st, *own_xy, 0)
    out = []
    for xy in extra + cand:
        c = add_city(st, *xy, 0x0F)
        st.ai[0].city_flags[c] = 1
        out.append(c)
    for c in out[len(extra):]:
        link(st, c, own, 10)
    return out[len(extra):]


def _view(monkeypatch):
    shown = []
    monkeypatch.setattr(ruins, "map_view", lambda st_, x, y: (shown.append((x, y)), [])[1])
    return shown


def test_sage_equal_clusters_keep_the_first(game, monkeypatch):
    """021c `jle`: equal n and equal distance to our nearest city keep the first candidate."""
    st = mk(game, hidden_map=1)
    a, b = _cluster(st, (24, 40), [(20, 10), (28, 10)], [(24, 6), (24, 14)])   # both d 30, n 4
    shown = _view(monkeypatch)
    st.rng.script = [700, 0, 0]
    QA.sage(st, 3)
    assert shown == [(28, 10)]                   # b (higher index) scanned first


def test_sage_equal_clusters_prefer_the_farther(game, monkeypatch):
    """01fe..0208: d = the distance to our nearest city (running min); equal n -> the larger d."""
    st = mk(game, hidden_map=1)
    b, a = _cluster(st, (20, 40), [(28, 10), (20, 10)], [(24, 6), (24, 14)])   # a d 30 first, b d 31
    shown = _view(monkeypatch)
    st.rng.script = [700, 0, 0]
    QA.sage(st, 3)
    assert shown == [(28, 10)]


def test_sage_view_clamped_to_111(game, monkeypatch):
    """02e6 `jge 0x6f`: x is cut to 111."""
    st = mk(game, hidden_map=1)
    _cluster(st, (90, 30), [(110, 10)], [(105, 10), (100, 10), (108, 14)])
    shown = _view(monkeypatch)
    st.rng.script = [700, 5, 0]
    QA.sage(st, 3)
    assert shown == [(111, 10)]
