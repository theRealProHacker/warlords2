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
from warlords2.rules import diplomacy as D
from warlords2.rules import economy as EC
from warlords2.rules import engine
from warlords2.rules import heroes as H
from warlords2.rules import movement as M
from warlords2.rules import music as MU
from warlords2.rules import pathfinding as P
from warlords2.rules import quests as Q
from warlords2.rules import ruins as RU
from warlords2.rules import selection as S
from warlords2.rules import turn as T
from warlords2.rules import visibility as V
from warlords2.rules.mapwords import refresh_map
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
    game's dice see only the engine's rolls; it ends, as ovl25:0000 does, with the refused-proposal
    infamy of the computer side (ovl00:1063 at ovl25:0379)."""
    CALLS.append("ovl25:0000")
    try:
        return _ai_moves(state)
    finally:
        D.penalty(state)


def _ai_moves(state):
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


STUB_EVENTS = {}


def _end_check(state):
    CALLS.append("ovl61:1aed")
    return list(STUB_EVENTS.get("end_check", []))


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


def _one_phase_missing(monkeypatch, name="production"):
    """ai.base.PHASES with phase `name` pointing at a function that does not exist (a phase
    not written yet)."""
    from warlords2.ai import base as AB
    monkeypatch.setattr(AB, "PHASES", tuple((n, ms, "test_turn:not_written" if n == name else t, a)
                                            for n, ms, t, a in AB.PHASES))


def test_strict_end_turn_raises_before_any_change(game, monkeypatch):
    """Without --allow-unverified a missing M8b1 / M9a step refuses End Turn, state untouched."""
    _one_phase_missing(monkeypatch)
    st = two_humans(game)
    h = st.hash()
    with pytest.raises(NotImplementedCommand) as e:
        engine.apply(st, C.EndTurn())
    assert e.value.milestone in ("M8b1", "M8b2", "M8b3", "M8b4", "M9a")
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
               (H, "promote_all", "ovl47:0579"), (H, "human_offer_check", "ovl47:0000"),
               (CT, "deliver", "ovl43:0000"), (CT, "restart_production", "ovl43:06bd"),
               (V, "load_view", "ovl64:0d39"))


def test_human_turn_order_turn_2(game, stubs, monkeypatch):
    """ovl68:0259 then ovl68:04bd(0) without an offer: production after the hero code; the
    TurnStarted announcement after the settlement (turn screen ovl68:03a9)."""
    st = two_humans(game)
    st.turn = 2
    st.players[0].gold = 0                                   # no hero offer (price > gold)
    trace(monkeypatch, *HUMAN_STEPS, (MU, "play", "ovl58:0000"))
    ev = T.human_turn(st)
    assert CALLS == ["ovl00:0db3", "ovl64:0d39", "0b62:0d85", "ovl68:05fb", "ovl67:0000",
                     "ovl68:0827", "ovl67:0113", "ovl64:0629", "0b62:0ea0", "ovl01:1ded",
                     "ovl58:026f", "ovl47:0579", "ovl47:0000", "ovl58:0000", "ovl43:0000",
                     "ovl43:06bd"]
    names = [type(e).__name__ for e in ev]
    assert names.index("IncomeSettled") < names.index("TurnStarted")
    assert st.flags[0x159] == 1 and st.pending is None


@pytest.mark.parametrize("hidden, humans, draws", [(0, 2, 2), (1, 2, 1), (1, 1, 2)])
def test_human_turn_palette_draws(game, stubs, monkeypatch, hidden, humans, draws):
    """ovl68:03a4 draws the palette (ovl66:0356) after the centring 039c unless Hidden Map is on
    with more than one live human (di = 0 at 02e6); ovl68:05a8 always, after production.  A
    selection left over (DS:5e62 set) gets 0356's words: DS:2bda clear -> DS:5dfe = 1."""
    ctl = [COMP] * 8
    ctl[0] = HUMAN
    if humans == 2:
        ctl[2] = HUMAN
    st = scenario_state(game, "DRAGON", seed=3, options=GameOptions(hidden_map=hidden), controls=tuple(ctl))
    st.turn, st.players[0].gold = 2, 0
    a = next(a for a in st.armies if a.owner == 0 and a.x >= 0)
    sel = st.selection
    sel.selected, sel.moving, sel.group, sel.count, sel.moves = a.id, [a.id], 0, 5, 0
    trace(monkeypatch, *HUMAN_STEPS, (S, "redraw_palette", "ovl66:0356"))
    T.human_turn(st)
    calls = [c for c in CALLS if c in ("ovl64:0629", "ovl66:0356", "0b62:0ea0", "ovl43:06bd")]
    first = ["ovl64:0629", "ovl66:0356"] if draws == 2 else ["ovl64:0629"]
    assert calls == first + ["0b62:0ea0", "ovl43:06bd", "ovl66:0356"]
    assert sel.count == 1 and sel.moves == S.palette_moves(st)


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
    assert ev[-2].info == {"kind": "info_bar"}                  # ovl68:05a8 before the page
    assert [e.info for e in T.resume(st, 2) if isinstance(e, E.TurnCue)] == [{"kind": "info_bar"}]


def test_info_bar_cue_only_where_ovl68_05a8_is_reached(game, stubs):
    """ovl68:04bd: the hero offer (0531 -> 05f7) and the turn-1 production screen (0588 -> 05f7)
    return before ovl66:0356 at 05a8; later turns reach it after production."""
    st = two_humans(game)
    ev = T.human_turn(st)                                       # turn 1: the offer is pending
    assert not any(isinstance(e, E.TurnCue) and e.info["kind"] == "info_bar" for e in ev)
    ev = engine.apply(st, C.AcceptHero(True))                   # 04bd(1) on turn 1: production screen
    assert [e.info["kind"] for e in ev if isinstance(e, E.TurnCue)] == ["city_screen"]


def test_run_one_computer_side_per_call_is_one_run(game, stubs):
    """max_sides=1 stops before the next computer side's pass top, so runs continued call by
    call give the state and the events of one uninterrupted run (DRAGON: computers 0, 2, 3,
    then the human 6)."""
    ctl = [COMP] * 8
    ctl[6] = HUMAN
    a = scenario_state(game, "DRAGON", seed=3, controls=tuple(ctl))
    b = scenario_state(game, "DRAGON", seed=3, controls=tuple(ctl))
    whole = T.run(a)
    assert a.current == 6
    parts, runs = [], 0
    while runs < 10 and not any(isinstance(e, E.TurnStarted) and e.info["human"] for e in parts):
        ev = T.run(b, max_sides=1)
        assert sum(isinstance(e, E.TurnEnded) for e in ev) <= 1
        parts += ev
        runs += 1
    assert runs == 3 and a.hash() == b.hash() and [type(e) for e in parts] == [type(e) for e in whole]


def test_speech_and_view_commands(game):
    """SetSpeech: ovl33:0576(2) (DS:26c8); SetView: the view words of ovl65:0227; both legal
    with a question pending (engine.ANYTIME)."""
    st = two_humans(game)
    engine.apply(st, C.SetSpeech(True))
    assert st.advisor_talking == 1
    engine.apply(st, C.SetSpeech(False))
    assert st.advisor_talking == 0
    engine.apply(st, C.SetView(2, 155))                         # top 151 capped at 0x93
    assert [st.flags[o] for o in (0x17D, 0x17F, 0x177, 0x175, 0x17B, 0x179)] == [2, 155, 0, 0x93, 8, 0x93 + 8]
    engine.apply(st, C.SetView(110, 10))
    assert [st.flags[o] for o in (0x177, 0x175, 0x17B, 0x179)] == [0x67, 6, 0x67 + 8, 14]
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetView(112, 0))
    T.human_turn(st)
    assert st.pending is not None
    engine.apply(st, C.SetView(50, 50))
    assert st.flags[0x17D] == 50


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


def test_end_turn_refused_for_a_dead_side_and_noop_after_victory(game, stubs):
    st = two_humans(game)
    st.current = 1                                           # not alive in DRAGON
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.EndTurn())
    st.current = 0
    st.flags[0x15B] = 1
    h = st.hash()
    assert engine.apply(st, C.EndTurn()) == [] and st.hash() == h


def test_end_turn_of_a_side_made_computer_in_its_turn(game, stubs):
    """ovl61:2074 does not test SCN 0x0D0: a side switched to computer by Settings (ovl33:04cc)
    during its own turn still ends it; from the next round its turn is a computer turn."""
    st = two_humans(game)
    T.run(st)
    engine.apply(st, C.AcceptHero(True))
    engine.apply(st, C.SetControl(0, int(COMP)))
    ev = engine.apply(st, C.EndTurn())
    assert st.current == 2 and [e.info["player"] for e in ev if isinstance(e, E.TurnEnded)][0] == 0


def test_settings_commands_toggle_live_sides_only(game):
    """ovl33:04cc / 0508 / 053f write SCN 0x0d0 / 0x0f0 / 0x147 of a live side; a dead side has
    no buttons (ovl33:0067 -> 08a9:03b3)."""
    st = two_humans(game)
    assert engine.apply(st, C.SetControl(3, int(HUMAN))) == [] and st.players[3].control == HUMAN
    engine.apply(st, C.SetEnhance(3, True))
    engine.apply(st, C.SetObserve(0, True))                   # live for a human too (ovl33:00ec)
    assert st.players[3].enhanced == 1 and st.players[0].shown == 1
    for cmd in (C.SetControl(1, int(COMP)), C.SetEnhance(1, True), C.SetObserve(8, True),
                C.SetControl(0, 5)):
        with pytest.raises(IllegalCommand):
            engine.apply(st, cmd)


def test_strict_mode_runs_a_game_without_computer_sides(game, monkeypatch):
    """The AI hook (ovl68:01e3) is only reachable with a live computer side: two humans and no
    computer play in strict mode, even with a phase not written; making a side computer makes
    the loop refuse again."""
    _one_phase_missing(monkeypatch)
    ctl = [COMP] * 8
    ctl[0] = ctl[2] = ctl[3] = ctl[6] = ctl[7] = HUMAN
    st = scenario_state(game, "DRAGON", seed=3, controls=tuple(ctl))
    T.run(st)
    engine.apply(st, C.AcceptHero(True))
    engine.apply(st, C.EndTurn())
    assert st.current == 2
    engine.apply(st, C.AcceptHero(True))
    engine.apply(st, C.SetControl(3, int(COMP)))
    h = st.hash()
    with pytest.raises(NotImplementedCommand) as e:
        engine.apply(st, C.EndTurn())
    assert e.value.milestone in ("M8b2", "M8b3", "M8b4") and st.hash() == h


def test_computer_turn_ends_with_its_penalty(game, ai_stubs):
    """ovl25:0379: the computer side's refused de-escalation (peace proposed at war, war proposed
    back) draws rnd(1, 10, 0) + 10 infamy at the end of its AI turn."""
    st = two_humans(game)
    st.current = 3
    for b in range(8):
        if b != 3 and st.players[b].alive:
            D.set_current(st, 3, b, 2)
            D.set_current(st, b, 3, 2)
            D.set_proposal(st, 3, b, 0)
            D.set_proposal(st, b, 3, 2)
    before = st.players[3].infamy
    T.computer_turn(st)
    assert ai_stubs[-1] == "ovl25:0000"
    assert 4 * 11 <= st.players[3].infamy - before <= 4 * 20       # sides 0, 2, 6, 7


def test_round_end_stops_after_no_players_left(game, stubs, monkeypatch):
    """ovl61:1aed quits the program after the 'no players' message (0a4c:02b5 at ovl61:1c55):
    neither Active neutrals nor the history follow."""
    st = two_humans(game)
    st.flags[SCN_ROUND_COMPLETE] = 1
    monkeypatch.setitem(STUB_EVENTS, "end_check", [E.NoPlayersLeft({"msg": (12, 2)})])
    monkeypatch.setattr(T, "active_neutrals", lambda s: CALLS.append("ovl39:025a") or [])
    CALLS.clear()
    ev = T.next_side(st)
    assert isinstance(ev[-1], E.NoPlayersLeft) and "ovl39:025a" not in CALLS and "ovl41:0d60" not in CALLS


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


def _human_cmd(st, r, endings=False):
    if endings and st.current == 0 and r.random() < (1 if endings == "resign0" else 0.02):
        return C.Resign(r.random() < 0.5)            # side 0 only: with no human left the
        #                                              computers play on and run() never returns
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


def _answer(st, r, endings=False):
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
        return C.AcceptSurrender(endings and r.random() < 0.5)
    if isinstance(p, E.Victory):
        return C.CloseVictory()                         # button 0x1e3, ovl61:2004
    raise AssertionError("unexpected question %r" % p)


def _over(st):
    """The game is over for the fuzz: victory acknowledged or flagged (End Turn does nothing
    then, ovl61:2074), or no live human left."""
    return st.flags.get(0x15B, 0) or not any(p.alive and p.control == HUMAN for p in st.players)


def play(game, seed, rounds, opts, endings=False, prep=None):
    st = two_humans(game, seed=seed, options=opts)
    if prep is not None:
        prep(st)
    r = random.Random(seed)
    log, errs, counts = [], [], collections.Counter()
    log += [type(e).__name__ for e in T.run(st)]
    start = st.turn
    while st.turn < start + rounds and not errs and not _over(st):
        for _ in range(r.randint(4, 14)):
            cmd = _answer(st, r, endings) if st.pending is not None else _human_cmd(st, r, endings)
            try:
                ev = engine.apply(st, cmd)
                counts[type(cmd).__name__ + (str(cmd.yes) if isinstance(cmd, C.AcceptSurrender) else "")] += 1
                log += [type(e).__name__ for e in ev]
            except IllegalCommand:
                counts["illegal"] += 1
            errs += invariants(st, "%d turn %d p%d %s" % (seed, st.turn, st.current, type(cmd).__name__))
        while st.pending is not None:
            cmd = _answer(st, r, endings)
            counts[type(cmd).__name__ + (str(cmd.yes) if isinstance(cmd, C.AcceptSurrender) else "")] += 1
            log += [type(e).__name__ for e in engine.apply(st, cmd)]
        if _over(st):
            break
        ev = engine.apply(st, C.EndTurn())
        counts["EndTurn"] += 1
        log += [type(e).__name__ for e in ev]
        errs += invariants(st, "%d after EndTurn turn %d" % (seed, st.turn))
        if _over(st):
            break
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


# 24 replaced 22 when Begin got its ovl25:0519 card draws (M8b1 review B2): 22 no longer resigns
@pytest.mark.parametrize("seed", [21, 24, 23])
def test_fuzz_with_resign_and_surrender_answers(game, ai_stubs, seed):
    """The same fuzz with Resign sometimes and the surrender offer accepted half the time (strict
    mode, real M9a steps): deterministic and the invariants hold until the game is over."""
    logging.disable(logging.WARNING)
    try:
        opts = GameOptions(neutral_cities=2, quests=1, diplomacy=1)
        st, log, errs, counts = play(game, seed, 12, opts, endings=True)
        st2, log2, _, _ = play(game, seed, 12, opts, endings=True)
    finally:
        logging.disable(logging.NOTSET)
    assert errs == []
    assert st.hash() == st2.hash() and log == log2
    assert counts["Resign"] > 0 and "Resigned" in log


def _give_side_2_most_cities(st):
    """Side 2 owns three quarters of the city records: once side 0 has resigned and is out
    (round end), side 2 is the one human with more than half the cities and well ahead of every
    computer, so ovl61:1aed offers the surrender (0x15d) and the next turn start asks."""
    n = len(st.cities)
    keep = st.city_at(*st.players[0].capital)              # side 0 keeps a city to resign
    for i in range(n):
        if i != keep and sum(1 for c in st.cities if c.owner == 2) < n * 3 // 4:
            st.cities[i].owner = 2
    refresh_map(st)


@pytest.mark.parametrize("seed,yes", [(31, True), (35, False)])
def test_fuzz_surrender_offer_accepted_or_declined(game, ai_stubs, seed, yes):
    """Side 0 resigns at once; the surrender offer to side 2 is answered yes or no at random
    (AcceptSurrender, ovl61:1e4e / 1ecd); deterministic, invariants hold."""
    logging.disable(logging.WARNING)
    try:
        args = (game, seed, 6, GameOptions(diplomacy=1))
        kw = dict(endings="resign0", prep=_give_side_2_most_cities)
        st, log, errs, counts = play(*args, **kw)
        st2, log2, _, _ = play(*args, **kw)
    finally:
        logging.disable(logging.NOTSET)
    assert errs == [] and st.hash() == st2.hash() and log == log2
    assert "Resigned" in log and "SurrenderOffered" in log
    assert counts["AcceptSurrender%s" % yes] == 1 and bool(st.flags.get(0x15B, 0)) == yes
