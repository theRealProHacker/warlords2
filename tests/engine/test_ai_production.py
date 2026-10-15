"""ovl25:06d4 production (ai.md §6.16) as warlords2.ai.phases.production, pinned to the
listing: call order, vectoring reset, the in-progress skip, the poor-side return, the role
switch (table ovl25:0847) and no rnd."""
import pytest

from warlords2.ai.phases import production as PR
from warlords2.model.city import Slot
from warlords2.model.options import GameOptions

from movekit import add_city, flat_state

pytestmark = pytest.mark.gamedata


class NoDice:
    def rnd(self, *a):
        raise AssertionError("production draws no rnd: %r" % (a,))


def make(game, options=GameOptions()):
    st = flat_state(game, options=options)
    st.ai.allocated = 1
    st.rng = NoDice()
    return st


@pytest.fixture
def log(monkeypatch):
    out = []
    monkeypatch.setattr(PR, "_refresh_sources", lambda st: out.append("0aed") or [])
    monkeypatch.setattr(PR, "_mark_explore_cities", lambda st: out.append("02ff") or [])
    monkeypatch.setattr(PR, "choose_production", lambda st, c, k, v, d: out.append(("103d", c, k, v, d)) or 1)
    monkeypatch.setattr(PR, "buy_flying_slot", lambda st, c: out.append(("11d5", c)))
    return out


def test_order_and_hidden_map(game, log):
    """ovl27:0aed first, then ovl20:02ff only with Hidden Map, then cities count-1..0 owned
    (owner byte) by the side on turn."""
    st = make(game)
    for i, o in enumerate((0, 1, 0)):
        add_city(st, 10 + 4 * i, 10, o)
    PR.production(st)
    assert log == ["0aed", ("103d", 2, 3, -1, 0), ("103d", 0, 3, -1, 0)]
    log.clear()
    st2 = make(game, GameOptions(hidden_map=1))
    PR.production(st2)
    assert log == ["0aed", "02ff"]


def test_vectoring_reset_and_partly_done_kept(game, log):
    """+0x31 = 0, +0x33 = +0x35 = -1 for every own city, also one whose production is partly
    done (0fd5 != 0), which is then skipped."""
    st = make(game)
    c = add_city(st, 10, 10, 0)
    city = st.cities[c]
    city.slots = [Slot(2, 3, 2, 12, 4)] + [Slot() for _ in range(3)]
    city.current, city.turns_left = 2, 2
    city.vectoring, city.vector_to = 1, (40, 40)
    PR.production(st)
    assert (city.vectoring, city.vector_to) == (0, (-1, -1))
    assert log == ["0aed"]


def test_poor_side_ends_the_phase(game, log, monkeypatch):
    """gold < 40 and income < upkeep (signed) -> return: later (lower) cities untouched, also
    their vectoring."""
    st = make(game)
    a, b = add_city(st, 10, 10, 0), add_city(st, 20, 10, 0)
    st.cities[a].vectoring = 1
    st.players[0].gold = 39
    monkeypatch.setattr(PR, "_income", lambda s: 4)
    monkeypatch.setattr(PR, "_upkeep", lambda s: 5)
    PR.production(st)
    assert log == ["0aed"] and st.cities[a].vectoring == 1 and st.cities[b].vectoring == 0
    monkeypatch.setattr(PR, "_income", lambda s: 5)
    PR.production(st)
    assert ("103d", a, 3, -1, 0) in log
    st.players[0].gold = 40
    monkeypatch.setattr(PR, "_income", lambda s: 4)
    log.clear()
    PR.production(st)
    assert len(log) == 3


@pytest.mark.parametrize("role, flag, nc, want", [
    (0, 0, 0, 3), (1, 0, 0, 3), (2, 0, 0, "buy4"), (2, 2, 0, 4), (13, 0, 0, "buy4"), (13, 2, 0, 4),
    (11, 0, 0, 4), (3, 0, 0, 1), (3, 0, 1, 2), (4, 0, 0, 2), (5, 0, 0, 3), (6, 0, 0, 3), (7, 0, 0, 3),
    (8, 0, 0, None), (9, 0, 0, 3), (10, 0, 0, 3), (12, 0, 0, 3), (14, 0, 0, 3), (200, 0, 0, 3)])
def test_role_switch(game, log, role, flag, nc, want):
    """Table ovl25:0847; role 8 writes +0x2d = 0 (ovl25:081f) and starts nothing.  The city's
    production has just started (+0x2d = 3 = the slot's time, so 0fd5 = 0): only role 8 clears
    it (103d is a stand-in here)."""
    st = make(game, GameOptions(neutral_cities=nc))
    c = add_city(st, 10, 10, 0)
    st.ai[0].role[c], st.ai[0].city_flags[c] = role, flag
    st.cities[c].slots = [Slot(2, 3, 2, 12, 4)] + [Slot() for _ in range(3)]
    st.cities[c].current, st.cities[c].turns_left = 2, 3        # 0fd5 = 0: +0x2d == slot time
    PR.production(st)
    if want is None:
        assert log == ["0aed"] and st.cities[c].turns_left == 0
    elif want == "buy4":
        assert log == ["0aed", ("11d5", c), ("103d", c, 4, -1, 0)]
        assert st.cities[c].turns_left == 3
    else:
        assert log == ["0aed", ("103d", c, want, -1, 0)]
        assert st.cities[c].turns_left == 3


def test_poor_side_returns_after_a_partly_done_city(game, log, monkeypatch):
    """06d4: the 0fd5 test comes before the gold / income test: a partly-done city (highest
    index, scanned first) has its vectoring reset and is skipped; the next city is reset and
    then ends the phase; the lowest city is not reached."""
    st = make(game)
    lo, mid, hi = add_city(st, 10, 10, 0), add_city(st, 20, 10, 0), add_city(st, 30, 10, 0)
    for c in (lo, mid, hi):
        st.cities[c].vectoring = 1
    city = st.cities[hi]
    city.slots = [Slot(2, 3, 2, 12, 4)] + [Slot() for _ in range(3)]
    city.current, city.turns_left = 2, 2                        # 0fd5 = 1: partly done
    st.players[0].gold = 0
    monkeypatch.setattr(PR, "_income", lambda s: 0)
    monkeypatch.setattr(PR, "_upkeep", lambda s: 1)
    PR.production(st)
    assert log == ["0aed"]
    assert [st.cities[c].vectoring for c in (lo, mid, hi)] == [1, 0, 0]


def test_flying_slot_price_plus_30_wraps_to_16_bits(game, monkeypatch):
    """ovl29:11d5 (role 2 / 13, real buy_flying_slot): price + 30 is a word add (1259), so a
    price of 32740 gives -32766 and any gold (signed) >= that buys the slot."""
    st = make(game)
    monkeypatch.setattr(PR, "_refresh_sources", lambda st: [])
    monkeypatch.setattr(PR, "choose_production", lambda st, c, k, v, d: 1)
    c = add_city(st, 10, 10, 0)
    st.cities[c].slots = [Slot(2, 1, 2, 12, 3)] + [Slot() for _ in range(3)]
    st.cities[c].current, st.cities[c].turns_left = 0xFF, 0
    st.ai[0].role[c] = 2
    from warlords2.ai import util as U
    flyer = next(t for t in range(29) if U.M.type_flag(st, t, "flag16")
                 and not U.M.type_flag(st, t, "special"))
    from dataclasses import replace
    st.army_types = [replace(t, buy_price=32740) if t.type_id == flyer else t for t in st.army_types]
    st.players[0].gold = 0
    PR.production(st)
    assert st.cities[c].slots[1].type == flyer and st.ai[0].city_flags[c] & 2
    assert st.players[0].gold == (0 - 32740)


def test_real_choice_starts_production(game, monkeypatch):
    """103d(c, kind, -1, 0) with the real scoring: +0x2c / +0x2d set, vectoring off."""
    st = make(game)
    monkeypatch.setattr(PR, "_refresh_sources", lambda st: [])
    c = add_city(st, 10, 10, 0)
    st.cities[c].slots = [Slot(2, 1, 2, 12, 3), Slot(8, 3, 5, 20, 12)] + [Slot() for _ in range(2)]
    st.cities[c].current, st.cities[c].turns_left = 0xFF, 0
    st.ai[0].role[c] = 11                                   # kind 4: flyers only
    PR.production(st)
    assert (st.cities[c].current, st.cities[c].turns_left) == (8, 3)


# ------------------------------------------------------------------------------- integration

def _stub(state, *args):
    return []


def run_game(game, monkeypatch, seed, rounds=3):
    """A real ERYTHEA game (side 0 human, the others computer, AI blocks from the game's cards,
    Quick Start, Hidden Map) played for `rounds` End Turns with only the four M8b2 phases real:
    every other phase of ovl25:0000 and the cross-phase calls of these four are stubs."""
    from warlords2.ai import base as B
    from warlords2.ai import cards as AC
    from warlords2.ai.phases import clean_city as CC
    from warlords2.formats.gamedir import GameDir
    from warlords2.model import commands as C
    from warlords2.model import events as E
    from warlords2.rules import engine
    from warlords2.model.ids import Control
    from warlords2.model.newgame import NewGameConfig
    from warlords2.rules import movement as M
    from warlords2.rules import setup as S
    from warlords2.rules import turn as T
    from warlords2.rules.constants import allowing_unverified
    from warlords2.rules.mapwords import refresh_map
    from warlords2.rules import pathfinding as P
    from movekit import _inputs

    mine = {"clean city", "rebuilding", "production", "vectoring"}
    monkeypatch.setattr(B, "PHASES", tuple(
        (n, ms, t if n in mine else "test_ai_production:_stub", a) for n, ms, t, a in B.PHASES))
    monkeypatch.setattr(PR, "_refresh_sources", _stub)
    monkeypatch.setattr(PR, "_mark_explore_cities", _stub)
    monkeypatch.setattr(CC, "_pick_up", M.pick_up)
    monkeypatch.setattr(CC, "_share_items", _stub)
    monkeypatch.setattr(CC, "_nearest_foreign_army", lambda st, x, y, s: 1000)
    explored = []
    monkeypatch.setattr(CC, "_explore", lambda st, a, c: explored.append((st.current, a, c)) or [])

    sc, at, kw = _inputs(game, "ERYTHEA")
    opts = GameOptions(neutral_cities=1, quick_start=1, hidden_map=1)
    cfg = NewGameConfig("ERYTHEA", (Control.HUMAN,) + (Control.COMPUTER,) * 7, (1,) * 8,
                        (0,) * 8, (0,) * 8, None, opts, 0, seed)
    with allowing_unverified():
        st = S.new_game(sc, cfg, list(at), cards=AC.card_reader(GameDir(game)), **kw)
    refresh_map(st)
    P.rebuild_cost_map(st)
    draws = []
    real = st.rng.rnd

    def rnd(d, s, a):
        draws.append((st.current, d, s, a))
        return real(d, s, a)
    st.rng.rnd = rnd
    with allowing_unverified():
        T.run(st)
        for _ in range(rounds):
            while st.pending is not None:                  # the human's hero offer
                assert isinstance(st.pending, E.HeroOffered), st.pending
                engine.apply(st, C.AcceptHero(bool(st.pending.info["free"])))
            engine.apply(st, C.EndTurn())
    return st, draws, explored


def test_economy_phases_on_a_real_game_are_deterministic(game, monkeypatch):
    st1, d1, e1 = run_game(game, monkeypatch, seed=7)
    st2, d2, e2 = run_game(game, monkeypatch, seed=7)
    assert st1.hash() == st2.hash() and d1 == d2 and e1 == e2
    assert (1, 6, -1) in {x[1:] for x in d1}                          # 023f's roll was reached
    comp = [p for p in range(1, 8) if st1.players[p].alive]
    owned = [(p, c) for p in comp for c, city in enumerate(st1.cities) if city.owner == p]
    assert owned
    assert any(st1.ai[p].armies_here[c] for p, c in owned)            # 023f counted the garrisons
    assert any(st1.ai[p].city_flags[c] & 4 for p, c in owned)         # cleaned this turn
    assert any(st1.cities[c].current not in (0xFF, -1) for _, c in owned)
