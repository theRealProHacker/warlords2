"""rules.turn: main-loop pass ovl61:2123, computer turn ovl68:0000, human turn ovl68:0259 /
04bd, End Turn ovl61:2074, side rotation ovl61:17f6, turn order ovl61:1732; and the boarding /
landing stop of rules.movement (0a8b:0cf2 -> 0d1a).

Steps of M8b1 (AI) and M9a (diplomacy, victory, history) are stubbed through the HOOKS
mechanism by `stubs` to pin the order of the steps; the multi-round fuzz stubs only the M8b
steps (`ai_stubs`) and runs the real M9a ones; everything else is the real engine."""
import collections
import dataclasses
import importlib
import inspect
import logging
import random
import re

import pytest

from movekit import W, add_army, corridor, flat_state, paint, scenario_state, type_with
from test_fuzz import invariants
from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import Control, Terrain
from warlords2.model.options import GameOptions
from warlords2.model.state import SCN_ROUND_COMPLETE, SCN_TURN_ORDER, SCN_TURN_POS
from warlords2.rules import city as CT
from warlords2.rules import economy as EC
from warlords2.rules import engine
from warlords2.rules import heroes as H
from warlords2.rules import movement as M
from warlords2.rules import pathfinding as P
from warlords2.rules import quests as Q
from warlords2.rules import ruins as RU
from warlords2.rules import selection as S
from warlords2.rules import turn as T
from warlords2.rules import visibility as V
from warlords2.rules.engine import IllegalCommand, NotImplementedCommand

pytestmark = pytest.mark.gamedata
HUMAN, COMP = Control.HUMAN, Control.COMPUTER
CALLS = []


# ----------------------------------------------------------------------------- hook stubs

def _marks(state):
    CALLS.append("ovl00:0cc7")


def _resolve(state, a):
    CALLS.append("ovl00:0db3")
    return []


def _penalty(state):
    CALLS.append("ovl00:1063")
    return []


def _ai(state):
    """Random moves for the computer side (stand-in for ovl25:0000), on a die of its own so the
    game's dice see only the engine's rolls."""
    CALLS.append("ovl25:0000")
    r = random.Random(state.turn * 8 + state.current)
    for ci, c in enumerate(state.cities):
        if c.owner == state.current and c.turns_left == 0:
            slots = [k for k, s in enumerate(c.slots) if s.type >= 0 and s.type != 0xFF]
            if slots:
                CT.set_production(state, C.SetProduction(ci, r.choice(slots)))
    own = [a for a in state.armies if a.owner == state.current and a.y >= 0]
    for a in r.sample(own, min(3, len(own))):
        if a.owner != state.current or a.y < 0:
            continue
        dest = (max(0, min(111, a.x + r.randint(-6, 6))), max(0, min(155, a.y + r.randint(-6, 6))))
        try:
            M.move(state, C.Move((a.id,), dest))
        except IllegalCommand:
            pass
    return []


def _eliminate(state):
    CALLS.append("ovl61:18ab")
    return []


def _end_check(state):
    CALLS.append("ovl61:1aed")
    return []


def _history(state):
    CALLS.append("ovl41:0d60")
    return []


def _screen(state):
    CALLS.append("screen")
    return []


def _ai_city(state, city):
    return city


STUBS = {"diplomacy_marks": "_marks", "diplomacy_resolve": "_resolve", "diplomacy_penalty": "_penalty",
         "ai_turn": "_ai", "eliminate": "_eliminate", "end_check": "_end_check",
         "history_round": "_history", "victory_screen": "_screen", "surrender_screen": "_screen"}


@pytest.fixture
def ai_stubs(monkeypatch):
    """Only the M8b steps stubbed (computer moves, the computer's hero city); M9a is real."""
    ms, _, doc, addr = T.HOOKS["ai_turn"]
    monkeypatch.setitem(T.HOOKS, "ai_turn", (ms, "test_turn:_ai", doc, addr))
    ms, _, doc, addr = H.HOOKS["ai_hero_city"]
    monkeypatch.setitem(H.HOOKS, "ai_hero_city", (ms, "test_turn:_ai_city", doc, addr))
    CALLS.clear()
    yield CALLS


@pytest.fixture
def stubs(monkeypatch):
    for name, fn in STUBS.items():
        ms, _, doc, addr = T.HOOKS[name]
        monkeypatch.setitem(T.HOOKS, name, (ms, "test_turn:" + fn, doc, addr))
    ms, _, doc, addr = H.HOOKS["ai_hero_city"]
    monkeypatch.setitem(H.HOOKS, "ai_hero_city", (ms, "test_turn:_ai_city", doc, addr))
    CALLS.clear()
    yield CALLS


def trace(monkeypatch, *targets):
    """Record calls of (module, name, label) in CALLS, keeping the real behaviour."""
    for mod, name, label in targets:
        f = getattr(mod, name)

        def wrap(*a, _f=f, _l=label, **k):
            CALLS.append(_l)
            return _f(*a, **k)
        monkeypatch.setattr(mod, name, wrap)


def two_humans(game, seed=3, options=GameOptions()):
    """DRAGON: sides 0, 2, 3, 6, 7 live; 0 and 2 human."""
    ctl = [COMP] * 8
    ctl[0] = ctl[2] = HUMAN
    return scenario_state(game, "DRAGON", seed=seed, options=options, controls=tuple(ctl))


# ----------------------------------------------------------------------------- HOOKS


SIG = re.compile(r"^f\(([^)]*)\)")


@pytest.mark.parametrize("name", list(T.HOOKS))
def test_hook_signature(name):
    """Each hook documents f(state, ...) with its address; an existing target takes exactly those
    parameters (a missing one is checked against a stub built from the documentation)."""
    milestone, target, doc, addr = T.HOOKS[name]
    params = [p.strip() for p in SIG.match(doc).group(1).split(",")]
    assert params[0] == "state" and milestone in ("M8b1", "M9a") and re.search(r"ovl\d\d:[0-9a-f]{4}", addr)
    mod, fn = target.split(":")
    try:
        f = getattr(importlib.import_module(mod), fn, None)
    except ModuleNotFoundError:
        f = None
    if f is None:
        ns = {}
        exec("def stub(%s): pass" % ", ".join(params), ns)
        f = ns["stub"]
    assert list(inspect.signature(f).parameters) == params


def test_strict_end_turn_raises_before_any_change(game):
    """Without --allow-unverified a missing M8b1 / M9a step refuses End Turn, state untouched."""
    st = two_humans(game)
    h = st.hash()
    with pytest.raises(NotImplementedCommand) as e:
        engine.apply(st, C.EndTurn())
    assert e.value.milestone in ("M8b1", "M9a")
    with pytest.raises(NotImplementedCommand):
        T.run(st)
    assert st.hash() == h


# ----------------------------------------------------------------------------- turn order


class Dice:
    def __init__(self, values):
        self.values, self.calls = list(values), []

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.values.pop(0)


def test_turn_order_identity_and_random_swaps(game):
    """ovl61:1732: order[i] = i; Random Turns: 20 x (a = rnd(1,8,-1), b = rnd(1,8,-1)) swaps."""
    st = scenario_state(game, "DRAGON")
    st.flags[SCN_TURN_POS] = 5
    T.turn_order(st)
    assert [st.flags[SCN_TURN_ORDER + 2 * i] for i in range(8)] == list(range(8))
    assert st.flags[SCN_TURN_POS] == 0
    st.options = dataclasses.replace(st.options, random_turns=1)
    st.rng = Dice([0, 7] + [3, 3] * 18 + [1, 2])
    T.turn_order(st)
    assert st.rng.calls == [(1, 8, -1)] * 40
    assert [st.flags[SCN_TURN_ORDER + 2 * i] for i in range(8)] == [7, 2, 1, 3, 4, 5, 6, 0]


def test_next_side_skips_dead_and_ends_the_round(game, stubs):
    """ovl61:17f6: next live side in order; position 8 sets 0x118; the next advance increments the
    turn, reshuffles (Random Turns: 40 dice), clears 0x118 and runs elimination, end states,
    Active neutrals and history in that order."""
    st = scenario_state(game, "DRAGON", options=GameOptions(random_turns=1))
    for i in range(8):
        st.flags[SCN_TURN_ORDER + 2 * i] = i
    st.flags[SCN_TURN_POS], st.flags[SCN_ROUND_COMPLETE], st.turn = 3, 0, 4
    T.next_side(st)                                          # order[3] = 3 alive
    assert st.current == 3 and st.flags[SCN_TURN_POS] == 4
    T.next_side(st)                                          # 4, 5 dead -> 6
    assert st.current == 6 and st.flags[SCN_TURN_POS] == 7 and not st.flags[SCN_ROUND_COMPLETE]
    T.next_side(st)
    assert st.current == 7 and st.flags[SCN_ROUND_COMPLETE] == 1 and st.turn == 4
    st.rng = Dice([1, 1] * 20)                               # 20 swaps of position 0 with itself
    CALLS.clear()
    T.next_side(st)
    assert st.turn == 5 and st.rng.calls == [(1, 8, -1)] * 40 and st.current == 0
    assert st.flags[SCN_TURN_POS] == 1 and st.flags[SCN_ROUND_COMPLETE] == 0
    assert CALLS == ["ovl61:18ab", "ovl61:1aed", "ovl41:0d60"]


# ----------------------------------------------------------------------------- turn starts


def test_main_loop_pass_order(game, stubs, monkeypatch):
    """ovl61:217d..21b6 before every side's turn."""
    st = two_humans(game)
    trace(monkeypatch, (RU, "site_tiles", "ovl35:09f2"), (T, "refresh_map", "ovl62:0000"),
          (P, "rebuild_cost_map", "0555:0d9e"), (T, "land_in_cities", "ovl68:089d"),
          (T, "update_capital", "ovl36:10d7"), (T, "lift_hidden_map", "ovl64:175c"))
    T.pass_top(st)
    assert CALLS == ["ovl35:09f2", "ovl62:0000", "0555:0d9e", "ovl00:0cc7", "ovl68:089d",
                     "ovl36:10d7", "ovl64:175c"]


HUMAN_STEPS = ((S, "group_cleanup", "0b62:0d85"), (M, "refresh_moves", "ovl68:05fb"),
               (S, "fortify_marks", "ovl67:0000"), (EC, "settle", "ovl68:0827"),
               (S, "clear_turn_flags", "ovl67:0113"), (T, "centre_view", "ovl64:0629"),
               (M, "sink", "0b62:0ea0"), (Q, "check", "ovl01:1ded"), (T, "advice", "ovl58:026f"),
               (H, "promote_all", "ovl47:0579"), (H, "human_offer", "ovl47:0000"),
               (CT, "deliver", "ovl43:0000"), (CT, "restart_production", "ovl43:06bd"),
               (V, "load_view", "ovl64:0d39"))


def test_human_turn_order_turn_2(game, stubs, monkeypatch):
    """ovl68:0259 then ovl68:04bd(0) without an offer: production after the hero code; the
    TurnStarted announcement after the settlement (turn screen ovl68:03a9)."""
    st = two_humans(game)
    st.turn = 2
    st.players[0].gold = 0                                   # no hero offer (price > gold)
    trace(monkeypatch, *HUMAN_STEPS)
    ev = T.human_turn(st)
    assert CALLS == ["ovl00:0db3", "ovl64:0d39", "0b62:0d85", "ovl68:05fb", "ovl67:0000",
                     "ovl68:0827", "ovl67:0113", "ovl64:0629", "0b62:0ea0", "ovl01:1ded",
                     "ovl58:026f", "ovl47:0579", "ovl47:0000", "ovl43:0000", "ovl43:06bd"]
    names = [type(e).__name__ for e in ev]
    assert names.index("IncomeSettled") < names.index("TurnStarted")
    assert st.flags[0x159] == 1 and st.pending is None


def test_human_turn_1_offer_then_city_screen(game, stubs, monkeypatch):
    """Turn 1: the free hero's dialog stops the sequence (ovl68:0531 return); its answer runs
    ovl68:04bd(1), which on turn 1 opens the capital's production screen and returns before
    production (ovl68:0553..0590)."""
    st = two_humans(game)
    ev = T.human_turn(st)
    assert isinstance(st.pending, E.HeroOffered) and st.pending.info["resume"] == 1
    trace(monkeypatch, (CT, "deliver", "ovl43:0000"))
    ev = engine.apply(st, C.AcceptHero(True))
    cue = ev[-1]
    assert isinstance(cue, E.TurnCue) and cue.info["kind"] == "city_screen"
    assert cue.info["city"] == st.city_at(*st.players[0].capital)
    assert any(isinstance(e, E.HeroJoined) for e in ev) and "ovl43:0000" not in CALLS


def test_tutorial_page_on_turn_2_once(game, stubs):
    """ovl68:05b2..05f4: SCN 0x12e and turn 2 -> byte 0x134 |= 0x40 and FILE.DAT (25, 7), once."""
    st = two_humans(game)
    st.flags[0x12E], st.turn, st.players[0].gold = 1, 2, 0
    ev = T.resume(st, 2)
    assert ev[-1].info == {"kind": "tutorial", "file": (25, 7)} and st.flags[0x134] & 0x40
    assert not any(isinstance(e, E.TurnCue) for e in T.resume(st, 2))


def test_computer_turn_order(game, stubs, monkeypatch):
    """ovl68:0000 with Hidden Map: view load, announcement, diplomacy, offer, levels, settlement,
    production (no restart), group cleanup, refresh, fortify, flag clear, quest check, AI,
    selection cleared, view stored."""
    st = scenario_state(game, "DRAGON", options=GameOptions(hidden_map=1))
    st.current, st.turn = 2, 3
    st.selection.selected = 5
    trace(monkeypatch, *HUMAN_STEPS, (H, "computer_offer", "ovl47:0000/0301"), (V, "store_view", "ovl64:0e68"))
    ev = T.computer_turn(st)
    assert CALLS == ["ovl64:0d39", "ovl00:0db3", "ovl47:0000/0301", "ovl47:0579", "ovl68:0827",
                     "ovl43:0000", "0b62:0d85", "ovl68:05fb", "ovl67:0000", "ovl67:0113",
                     "ovl01:1ded", "ovl25:0000", "ovl64:0e68"]
    assert isinstance(ev[0], E.TurnStarted) and isinstance(ev[-1], E.TurnEnded)
    assert st.selection.selected == -1 and st.flags[0x159] == st.players[2].shown


def test_computer_side_without_cities_is_skipped(game, stubs, monkeypatch):
    """ovl68:0158..0198: after the diplomacy step a side with no city does nothing more."""
    st = scenario_state(game, "DRAGON")
    st.current = 2
    for c in st.cities:
        if c.owner == 2:
            c.owner = 0x0F
    gold = st.players[2].gold
    trace(monkeypatch, *HUMAN_STEPS)
    ev = T.computer_turn(st)
    assert CALLS == ["ovl00:0db3"] and st.players[2].gold == gold
    assert [type(e) for e in ev] == [E.TurnStarted, E.TurnEnded]


def test_human_reveal_at_first_turn_and_view(game, stubs):
    """ovl68:026d: DS:16a6 -> cleared, every live side shown; ovl64:0629 centres the view."""
    st = two_humans(game, options=GameOptions(hidden_map=1))
    st.reveal_at_first_human_turn = 1
    for p in st.players:
        p.shown = 0
    T.human_turn(st)
    assert st.reveal_at_first_human_turn == 0
    assert [p.shown for p in st.players] == [int(bool(p.alive)) for p in st.players]
    x, y = st.players[0].capital
    assert (st.flags[0x17D], st.flags[0x17F]) == (min(max(x, 4), 107), min(max(y, 4), 151))
    assert st.flags[0x177] == st.flags[0x17D] - 4 and st.flags[0x179] == st.flags[0x17F] + 4


def test_advice_rolls_only_when_talking(game, stubs):
    """ovl58:0293: nothing without the talking advisor; with it the remark draws the pick and,
    for a face, the blink rnd(1,30,10) (ovl58:094c)."""
    st = two_humans(game)
    st.turn = 7
    st.rng = Dice([])
    assert T.advice(st) == []
    st.advisor_talking, st.advisor_digital = 1, 1
    st.advisor_groups = {g: 3 for g in range(40, 89)}
    st.flags[0x108] = EC.city_count(st, 0) // 5 * 5        # neither winning nor losing
    st.players[0].gold = 50
    st.rng = Dice([2, 17])
    ev = T.advice(st)
    assert st.rng.calls == [(1, 3, -1), (1, 30, 10)]
    assert ev[0].info == {"kind": "advice", "file": (54, 2), "blink": 17}


# ----------------------------------------------------------------------------- main-loop helpers


def test_land_in_cities(game):
    """ovl68:089d: the side's armies standing in a city lose the aboard flag."""
    st = scenario_state(game, "DRAGON")
    c = st.cities[0]
    a = next(a for a in st.armies if a.owner == st.current and a.y >= 0)
    a.flags |= 0x1000
    a.x, a.y = c.x + 1, c.y + 1
    T.land_in_cities(st)
    assert not a.flags & 0x1000


def test_update_capital(game):
    """ovl36:10d7: first capital while own and intact, else the own city nearest the current one."""
    st = scenario_state(game, "DRAGON")
    p = st.current
    first = st.players[p].capital
    ci = st.city_at(*first)
    st.cities[ci].owner = 3
    T.update_capital(st, p)                                  # no own city: unchanged
    assert st.players[p].capital == first
    for k in (5, 9):
        st.cities[k].owner = p
    T.update_capital(st, p)
    want = min((5, 9), key=lambda k: (P.distance(first, (st.cities[k].x, st.cities[k].y)), k))
    assert st.players[p].capital == (st.cities[want].x, st.cities[want].y)
    st.cities[ci].owner = p
    T.update_capital(st, p)
    assert st.players[p].capital == first


def test_lift_hidden_map(game):
    """ovl64:175c: all intact cities explored by every live side -> Hidden Map off, STRING (18, 0)."""
    st = scenario_state(game, "DRAGON", options=GameOptions(hidden_map=1))
    assert T.lift_hidden_map(st) == [] and st.options.hidden_map
    st.world.explored = [0xFF] * len(st.world.explored)
    assert T.lift_hidden_map(st) == [E.Msg(group=18, index=0)] and not st.options.hidden_map


def test_active_neutrals_produce_and_choose(game, stubs):
    """ovl39:025a: an attacked neutral city counts down, makes the unit at 0 (moves 0), then
    chooses a kind-2 production when it holds < 4 armies."""
    st = scenario_state(game, "DRAGON", options=GameOptions(neutral_cities=2))
    ci = next(i for i, c in enumerate(st.cities) if c.owner == 0x0F and any(s.type >= 0 for s in c.slots))
    c = st.cities[ci]
    t = next(s.type for s in c.slots if s.type >= 0)
    c.attacked_by, c.current, c.turns_left = 1, t, 1
    n = len([a for a in st.armies if a.owner != 0xFF])
    ev = T.active_neutrals(st)
    made = [e for e in ev if isinstance(e, E.Produced) and e.info["city"] == ci]
    assert len(made) == 1 and st.armies[made[0].info["army"]].moves_left == 0
    assert len([a for a in st.armies if a.owner != 0xFF]) >= n + 1
    if len(M.armies_at(st, c.x, c.y)) < 4:
        assert c.turns_left == c.slots[CT.slot_of(c, c.current)].time


# ----------------------------------------------------------------------------- End Turn


def test_end_turn_runs_computers_until_the_next_human(game, stubs):
    """ovl61:2074 -> 17f6 -> 2123: the computer sides between the two humans play, then the
    second human's turn starts; the view of side 0 is stored (ovl64:0e68)."""
    st = two_humans(game, options=GameOptions(hidden_map=1))
    T.run(st)
    engine.apply(st, C.AcceptHero(True))
    st.world.roads[5] |= 0x20
    CALLS.clear()
    ev = engine.apply(st, C.EndTurn())
    assert st.world.explored[5] & 1
    assert st.current == 2 and isinstance(st.pending, E.HeroOffered)
    assert CALLS[0] == "ovl00:1063"
    started = [e.info["player"] for e in ev if isinstance(e, E.TurnStarted)]
    ended = [e.info["player"] for e in ev if isinstance(e, E.TurnEnded)]
    assert ended[0] == 0 and started[-1] == 2
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.EndTurn())                        # the offer is pending


def test_end_turn_refused_for_a_computer_side_and_noop_after_victory(game, stubs):
    st = two_humans(game)
    st.current = 3
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.EndTurn())
    st.current = 0
    st.flags[0x15B] = 1
    h = st.hash()
    assert engine.apply(st, C.EndTurn()) == [] and st.hash() == h


# ----------------------------------------------------------------------------- embark / land


def test_boarding_and_landing_end_the_move(game):
    """0a8b:0cf2..0cfe -> 0d1a: DS:5dc4 1 after boarding, 2 after landing: the boarded / landed
    armies keep 0 moves and the status is 2, so a human stack is marked done and deselected
    (0c8c:02a9..02bc)."""
    st = flat_state(game)
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    for x in range(14, 30):
        paint(st, x, 10, Terrain.WATER)
    paint(st, 13, 10, Terrain.PLAIN, port=True)
    paint(st, 30, 10, Terrain.PLAIN, port=True)
    paint(st, 31, 10, Terrain.PLAIN)
    corridor(st, 10, 10, 32)
    a = add_army(st, foot, 10, 10, moves=30)
    ev = engine.apply(st, C.Move((a.id,), (20, 10)))
    assert (a.x, a.y) == (14, 10) and a.flags & 0x1000 and a.moves_left == 0
    assert ev[0].info["status"] == 2 and a.flags & 0x40 and st.selection.selected == -1
    a.moves_left = 30
    ev = engine.apply(st, C.Move((a.id,), (31, 10)))
    assert (a.x, a.y) == (31, 10) and not a.flags & 0x1000 and a.moves_left == 0
    assert ev[0].info["status"] == 2 and any(isinstance(e, E.Landed) for e in ev)


def test_sailing_on_keeps_the_moves(game):
    """No boarding or landing (aboard, water to water): DS:5dc4 stays 0, the moves are paid only."""
    st = flat_state(game)
    foot = type_with(st, flag16=0, flag17=0, flag18=0, flag19=0)
    for x in range(14, 30):
        paint(st, x, 10, Terrain.WATER)
    corridor(st, 10, 14, 30)
    a = add_army(st, foot, 15, 10, moves=30, flags=0x1000)
    ev = engine.apply(st, C.Move((a.id,), (20, 10)))
    assert (a.x, a.y) == (20, 10) and a.moves_left == 25 and ev[0].info["status"] != 2


# ----------------------------------------------------------------------------- fuzz


def _human_cmd(st, r):
    by = collections.defaultdict(list)
    for a in st.armies:
        if a.owner == st.current and a.y >= 0:
            by[(a.x, a.y)].append(a.id)
    if not by or r.random() < 0.15:
        return r.choice([C.Next(), C.Deselect(), C.MoveAll()])
    if st.options.diplomacy and r.random() < 0.1:
        return C.Propose(r.randrange(8), r.randrange(3))
    own = [i for i, c in enumerate(st.cities) if c.owner == st.current]
    if own and r.random() < 0.15:
        ci = r.choice(own)
        if r.random() < 0.3 and len(own) > 1:
            return C.SetVector(ci, r.choice(own))
        return C.SetProduction(ci, r.randrange(4))
    pos = r.choice(sorted(by))
    ids = by[pos]
    grp = tuple(r.sample(ids, r.randint(1, len(ids))))
    k = r.random()
    if k < 0.1:
        return C.Defend(grp)
    if k < 0.3:
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (-1, -1)):
            x, y = pos[0] + dx, pos[1] + dy
            if 0 <= x < 112 and 0 <= y < 156:
                f = st.world.flags[y * W + x]
                if f & 0xF != st.current and (f & 0x10 or st.world.terrain(x, y) == Terrain.CITY):
                    return C.Attack(grp, x, y)
    foreign = [(c.x, c.y) for c in st.cities if c.owner != st.current]
    if foreign and k < 0.6:
        return C.Move(grp, min(foreign, key=lambda c: P.distance(pos, c)))
    return C.Move(grp, (max(0, min(111, pos[0] + r.randint(-12, 12))),
                        max(0, min(155, pos[1] + r.randint(-12, 12)))))


def _answer(st, r):
    p = st.pending
    if isinstance(p, E.HeroOffered):
        return C.AcceptHero(r.random() < 0.7 or p.info["free"])
    if isinstance(p, E.CityCaptured):
        return C.CaptureChoice(r.choice(["occupy", "occupy", "pillage", "sack", "raze"]))
    if isinstance(p, E.DisbandPrompt):
        return C.ConfirmDisband(False)
    if isinstance(p, E.TreacheryPrompt):
        return C.ConfirmTreachery(r.random() < 0.5)
    if isinstance(p, E.SurrenderOffered):
        return C.AcceptSurrender(False)
    raise AssertionError("unexpected question %r" % p)


def play(game, seed, rounds, opts):
    st = two_humans(game, seed=seed, options=opts)
    r = random.Random(seed)
    log, errs, counts = [], [], collections.Counter()
    log += [type(e).__name__ for e in T.run(st)]
    start = st.turn
    while st.turn < start + rounds and not errs:
        for _ in range(r.randint(4, 14)):
            cmd = _answer(st, r) if st.pending is not None else _human_cmd(st, r)
            try:
                ev = engine.apply(st, cmd)
                counts[type(cmd).__name__] += 1
                log += [type(e).__name__ for e in ev]
            except IllegalCommand:
                counts["illegal"] += 1
            errs += invariants(st, "%d turn %d p%d %s" % (seed, st.turn, st.current, type(cmd).__name__))
        while st.pending is not None:
            log += [type(e).__name__ for e in engine.apply(st, _answer(st, r))]
        ev = engine.apply(st, C.EndTurn())
        counts["EndTurn"] += 1
        log += [type(e).__name__ for e in ev]
        errs += invariants(st, "%d after EndTurn turn %d" % (seed, st.turn))
        errs += ["current %d is not a live human" % st.current
                 for _ in [0] if st.players[st.current].control != HUMAN or not st.players[st.current].alive]
        errs += ["moves > 99" for a in st.armies if a.owner != 0xFF and M._s8(a.moves_left) > 99]
    return st, log, errs, counts


@pytest.mark.parametrize("seed,opts", [
    (11, GameOptions(neutral_cities=2, quests=1, diplomacy=1)),
    (12, GameOptions(hidden_map=1, random_turns=1, intense_combat=1)),
])
def test_multi_round_fuzz_is_deterministic(game, ai_stubs, seed, opts):
    """Several rounds of two humans and three computers, strict mode, with the real M9a steps
    (diplomacy, elimination, end states, history); only the M8b steps are stubbed."""
    logging.disable(logging.WARNING)
    try:
        st, log, errs, counts = play(game, seed, 6, opts)
        st2, log2, _, _ = play(game, seed, 6, opts)
    finally:
        logging.disable(logging.NOTSET)
    assert errs == []
    assert counts["EndTurn"] >= 12 and counts["Move"] + counts["Attack"] > 0
    assert counts["SetProduction"] > 0 and "Produced" in log
    assert st.hash() == st2.hash() and log == log2
    assert log.count("TurnStarted") >= 6 * 5
    assert len(st.history) == st.turn - 1 and all(len(r["owners"]) == len(st.cities) for r in st.history)
