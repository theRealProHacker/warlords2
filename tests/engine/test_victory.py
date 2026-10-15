"""rules.victory: elimination ovl61:18ab, end states ovl61:1aed, the surrender offer ovl61:1f68
and its buttons ovl61:1e4e / 1ecd, the victory screen ovl61:1fbd / 2004, Resign ovl49:1608
(EL §6.7).

Unit cases use the in-memory state of test_bonuses; the flows through the turn start use a
shipped scenario with the M8b steps stubbed (test_turn.ai_stubs)."""
import pytest

from movekit import scenario_state
from test_bonuses import city, mk_state, put
from test_turn import ai_stubs  # noqa: F401 (fixture)
from warlords2.formats.tables import StringTable
from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, MAP_W, ROAD_SEEN, Control, Terrain
from warlords2.model.options import GameOptions
from warlords2.model.state import SCN_SURRENDER_OFFERED, SCN_VICTORY
from warlords2.rules import diplomacy as D, economy as EC, engine, heroes as H, turn as T, victory as V
from warlords2.rules.constants import diplomacy as K
from warlords2.rules.engine import IllegalCommand

HUMAN, COMP = Control.HUMAN, Control.COMPUTER


class Dice:
    def __init__(self, *values):
        self.values, self.calls = list(values), []

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        return self.values.pop(0)


def sides(st, alive, control=None):
    for p in st.players:
        p.alive = int(p.index in alive)
        if control is not None:
            p.control = control.get(p.index, COMP)


# ----------------------------------------------------------------------------- elimination


def test_side_without_cities_is_eliminated_whatever_its_armies(monkeypatch):
    """ovl61:18ab: live side, DS:5dea == 0: armies 0x181-1..0 deleted (heroes first through
    ovl36:16cd with 0x110 = p), news (p, 4, p, 0), text STRING (11, rnd(1,5,-1)), alive 0,
    gold 0, relations both ways current 1 / proposal 1 with bits 4-7 kept."""
    st = mk_state()
    sides(st, range(4))
    city(st, 10, 10, 0, 1)
    city(st, 20, 20, 2, 1)
    u = put(st, 1, 1, 5, 5)
    h = put(st, HERO_TYPE, 1, 6, 6)
    put(st, 1, 3, 30, 30)
    st.relations[1][2] = 0x40 | (2 << 2) | 2
    st.relations[3][1] = 0x10
    died = []
    monkeypatch.setattr(H, "hero_died", lambda s, aid, x, y: died.append((aid, x, y, s.current)) or [])
    st.rng = Dice(2, 0)
    ev = V.eliminate(st)
    assert died == [(h, 6, 6, 1)] and st.current == 0
    assert all(st.armies[i].owner == 0xFF for i in (u, h, 2))
    assert st.rng.calls == [(1, 5, -1), (1, 5, -1)]
    out = [e.info["player"] for e in ev if isinstance(e, E.PlayerEliminated)]
    msgs = [(m.group, m.index, m.args) for m in ev if isinstance(m, E.Msg)]
    assert out == [1, 3] and msgs == [(11, 2, ("p1",)), (11, 0, ("p3",))]
    assert [p.alive for p in st.players[:4]] == [1, 0, 1, 0] and st.players[1].gold == 0
    assert st.players[0].gold == 1000
    assert st.news[1] == [[4, 1, 0, ""]]
    assert st.relations[1][2] == 0x40 | 0b0101 and st.relations[3][1] == 0x10 | 0b0101
    assert all(D.current(st, 1, q) == 1 == D.proposal(st, q, 1) for q in range(8))


def test_elimination_message_waits_unless_only_computers_remain():
    """ovl61:1a2d..1a52: a computer side's text is timed (ovl61:11d1) only when no human lives."""
    st = mk_state()
    sides(st, (1, 2), {})
    city(st, 10, 10, 2, 1)
    ev = V.eliminate(st)
    assert [e.info["timed"] for e in ev if isinstance(e, E.PlayerEliminated)] == [True]


@pytest.mark.gamedata
def test_elimination_text_count_matches_string_dat(game):
    """ovl59:052f rolls over the entry count of STRING.DAT group 11."""
    from pathlib import Path
    tab = StringTable((Path(game) / "DATA" / "STRING.DAT").read_bytes())
    group, n = K.ELIMINATED_MSG.value
    tab.get(group, n - 1)
    with pytest.raises(Exception):
        tab.get(group, n)


# ----------------------------------------------------------------------------- end states


def test_no_side_alive():
    """ovl61:1c06: STRING 12 and the program ends."""
    st = mk_state()
    sides(st, ())
    assert [type(e) for e in V.check(st)] == [E.NoPlayersLeft]


def test_dead_humans_become_computers_and_the_war_goes_on():
    """ovl61:1b79..1ba7: a dead human -> d0 = 1; no live human and one was seen -> STRING 13,
    once (next round the side is a computer)."""
    st = mk_state()
    sides(st, (2, 3), {0: HUMAN, 1: HUMAN})
    st.players[1].alive = 0
    ev = V.check(st)
    assert [type(e) for e in ev] == [E.NoHumansLeft] and ev[0].info["switched"] == [1, 0]
    assert st.players[0].control == st.players[1].control == COMP
    assert V.check(st) == [] and not st.flags.get(SCN_VICTORY)


def _cities(st, owners, razed=()):
    for i, o in enumerate(owners):
        city(st, 4 * i, 40, o, 1)
    for i in razed:
        st.world.tiles[40 * MAP_W + 4 * i] = int(Terrain.PLAIN)


@pytest.mark.parametrize("owners,razed,win", [
    ([0, 0, 0, 0xF, 0xF], (), True),       # 3 > 5 // 2
    ([0, 0, 0xF, 0xF], (), False),         # 2 == 4 // 2
    ([0, 0, 0xF, 0xF, 0xF], (3, 4), True), # only intact cities count: 2 > 3 // 2
])
def test_last_human_without_computers_wins_with_more_than_half(owners, razed, win):
    """ovl61:1cba..1d04: one live human, no live computer, DS:5dea[h] > n / 2 with n the cities
    whose square is terrain 10 -> 0x15b = 1, news (h, 7, h, 0)."""
    st = mk_state()
    sides(st, (0,), {0: HUMAN})
    _cities(st, owners, razed)
    V.check(st)
    assert bool(st.flags.get(SCN_VICTORY)) == win
    assert (st.news[0] == [[7, 0, 0, ""]]) == win


def test_last_computer_is_declared_winner_and_becomes_human():
    """ovl61:1d07..1d96: no live human, one live computer -> 0x15b, STRING (15, 0) with its name,
    d0 = 0, news kind 7."""
    st = mk_state()
    sides(st, (5,), {})
    ev = V.check(st)
    assert st.flags[SCN_VICTORY] == 1 and st.players[5].control == HUMAN
    assert [(m.group, m.index, m.args) for m in ev if isinstance(m, E.Msg)] == [(15, 0, ("p5",))]
    assert st.news[5] == [[7, 5, 0, ""]]


@pytest.mark.parametrize("mine,best,offered", [(9, 6, True), (9, 7, False), (8, 0, False), (9, 0, True)])
def test_surrender_offer_threshold(mine, best, offered):
    """ovl61:1d99..1e43, 16 city records: offer when cities[h] > 16 / 2 and > best computer +
    16 / 8; razed records count (2c04:157b)."""
    st = mk_state()
    sides(st, (0, 1, 2), {0: HUMAN})
    owners = [0] * mine + [1] * best + [0xF] * (16 - mine - best)
    _cities(st, owners, razed=(15,))
    V.check(st)
    assert bool(st.flags.get(SCN_SURRENDER_OFFERED)) == offered and not st.flags.get(SCN_VICTORY)


def test_no_second_offer_and_nothing_after_victory():
    st = mk_state()
    sides(st, (0, 1), {0: HUMAN})
    _cities(st, [0] * 12)
    st.flags[SCN_SURRENDER_OFFERED] = 1
    st.flags[0x15F] = 1
    V.check(st)
    assert st.flags[SCN_SURRENDER_OFFERED] == 1 and not st.flags.get(SCN_VICTORY)
    st2 = mk_state()
    sides(st2, (0,), {0: HUMAN})
    _cities(st2, [0] * 3)
    st2.flags[SCN_VICTORY] = 1
    V.check(st2)
    assert st2.news[0] == []


# ----------------------------------------------------------------------------- the screens


def dragon(game, hidden=0):
    ctl = [COMP] * 8
    ctl[0] = HUMAN
    st = scenario_state(game, "DRAGON", seed=4, options=GameOptions(hidden_map=hidden), controls=tuple(ctl))
    st.turn = 3
    st.players[0].gold = 0                     # no hero offer in the turn start
    return st


@pytest.mark.gamedata
def test_surrender_offer_accepted_ends_in_victory(game, ai_stubs):
    """ovl68:04bd: 0x15d and not 0x15f -> ovl61:1f68 (0x15f = 1, question pending); button
    0x1e5 -> ovl61:1e4e: live computers alive = 0, 0x15b = 1, news (p, 7, p, 0), ovl61:1fbd
    (0x157 = 1, the screen pending); its button 0x1e3 (CloseVictory) -> ovl61:2004: Hidden Map off
    (2026), ovl68:04bd(0)."""
    st = dragon(game, hidden=1)
    st.flags[SCN_SURRENDER_OFFERED] = 1
    ev = T.resume(st, 0)
    assert ev == [st.pending] and isinstance(st.pending, E.SurrenderOffered) and st.flags[0x15F] == 1
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.EndTurn())
    computers = [p.index for p in st.players if p.alive and p.control == COMP]
    ev = engine.apply(st, C.AcceptSurrender(True))
    assert ev == [st.pending] and isinstance(ev[0], E.Victory) and ev[0].info["player"] == 0
    assert not any(st.players[p].alive for p in computers) and st.players[0].alive
    assert st.flags[SCN_VICTORY] == 1 and st.flags[0x157] == 1
    assert st.options.hidden_map                         # still on while the screen is up
    assert st.news[0][-1] == [7, 0, 0, ""]
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.EndTurn())                    # the screen waits for its button
    ev = engine.apply(st, C.CloseVictory())
    assert not st.options.hidden_map and st.pending is None and not any(isinstance(e, E.Victory) for e in ev)
    assert T.loop_over(st)
    assert engine.apply(st, C.EndTurn()) == []           # ovl61:2074: nothing after 0x15b
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.CloseVictory())               # no screen up


@pytest.mark.gamedata
def test_surrender_declined_and_play_goes_on(game, ai_stubs):
    """Button 0x1e6 -> ovl61:1ecd: 0x10f3[c] = 0x110 for every live c; button 0x1e4 ->
    ovl61:2046 -> ovl68:04bd(0); no second offer (0x15f)."""
    st = dragon(game)
    st.flags[SCN_SURRENDER_OFFERED] = 1
    T.resume(st, 0)
    ev = engine.apply(st, C.AcceptSurrender(False))
    assert ev[0].info == {"kind": "surrender_declined"} and st.pending is None
    live = [p.index for p in st.players if p.alive]
    assert all(st.flags[0x10F3 + 2 * c] == 0 for c in live)
    assert not st.flags.get(SCN_VICTORY) and T.resume(st, 2) == [E.TurnCue({"kind": "info_bar"})]   # ovl68:05a8
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.AcceptSurrender(True))      # nothing pending


@pytest.mark.gamedata
def test_victory_screen_at_the_winners_turn_start(game, ai_stubs):
    """ovl68:04bd: 0x15b and not 0x157 -> ovl61:1fbd once."""
    st = dragon(game)
    st.flags[SCN_VICTORY] = 1
    ev = T.resume(st, 0)
    assert ev == [st.pending] and isinstance(ev[0], E.Victory) and st.flags[0x157] == 1
    rest = engine.apply(st, C.CloseVictory())            # ovl61:2004 -> ovl68:04bd(0)
    assert rest and rest[-1] == E.TurnCue({"kind": "info_bar"}) and st.pending is None
    assert not any(isinstance(e, E.Victory) for e in T.resume(st, 0))


# ----------------------------------------------------------------------------- Resign


@pytest.mark.parametrize("graceful", [True, False])
def test_resign_burns_everything_either_way(monkeypatch, graceful):
    """ovl49:1608(0 / 1): every city with owner byte 0x110 razed by ovl32:016b (no infamy), every
    army deleted (heroes through ovl36:16cd), with Hidden Map the road bit 0x20 on every square,
    selection cleared; the side stays alive until the round end."""
    st = mk_state(hidden_map=1)
    sides(st, (0, 1))
    a = city(st, 10, 10, 0, 1)
    b = city(st, 20, 20, 1, 1)
    h = put(st, HERO_TYPE, 0, 5, 5)
    put(st, 1, 0, 6, 6)
    other = put(st, 1, 1, 7, 7)
    st.selection.selected = st.selection.hero = h
    st.selection.moving = [h]
    died = []
    monkeypatch.setattr(H, "hero_died", lambda s, aid, x, y: died.append(aid) or [])
    st.rng = Dice()
    EC.refresh_cities(st)                        # the stored count DS:5dea the gate 151c reads
    ev = engine.apply(st, C.Resign(graceful))
    assert isinstance(ev[0], E.Resigned) and ev[0].info["graceful"] == graceful
    assert st.cities[a].owner == 0xF and st.cities[b].owner == 1
    assert [x.id for x in st.armies if x.owner != 0xFF] == [other] and died == [h]
    assert all(r & ROAD_SEEN for r in st.world.roads) and st.players[0].infamy == 0
    assert (st.selection.selected, st.selection.hero, st.selection.moving) == (-1, -1, [])
    assert st.players[0].alive
    assert EC.city_count(st, 0) == 0 and EC.cached_cities(st, 0) == 1     # no 03f9 in 1608
    from warlords2.model.serialize import dump
    before = dump(st, rng=False)
    ev = engine.apply(st, C.Resign(graceful))                              # 151c passes again
    assert [type(e) for e in ev] == [E.Resigned] and dump(st, rng=False) == before
    st.rng = Dice(0)
    V.eliminate(st)                              # ovl61:18b3 recounts first
    assert not st.players[0].alive and EC.cached_cities(st, 0) == 0


def test_resign_without_cities_does_nothing():
    """ovl49:150d: DS:5dea[0x110] == 0 -> the dialog does not open; the stored word, so a city
    taken since the last ovl62:03f9 does not count yet."""
    st = mk_state()
    put(st, 1, 0, 6, 6)
    assert engine.apply(st, C.Resign(True)) == [] and st.armies[0].owner == 0
    city(st, 10, 10, 0, 1)
    assert engine.apply(st, C.Resign(True)) == [] and st.armies[0].owner == 0
    EC.refresh_cities(st)
    assert engine.apply(st, C.Resign(True)) and st.armies[0].owner == 0xFF


def test_resign_only_for_a_human_side():
    st = mk_state(current=1)
    city(st, 10, 10, 1, 1)
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.Resign(False))
