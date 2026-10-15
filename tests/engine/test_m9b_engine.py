"""M9b engine package E: the production report list (ovl43:0000 / 07e5), signposts (ovl13),
the end-state present points of ovl61:1aed, the victory button 0x1e3 (ovl61:2004) and the
shield-strip present points (ovl68:0952 at ovl61:183f and ovl68:0374)."""
import threading

import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import Control, Terrain
from warlords2.model.options import GameOptions
from warlords2.model.serialize import dump, load, restore, snapshot
from warlords2.model.state import SCN_ROUND_COMPLETE, SCN_VICTORY, ProductionReport, ReportEntry
from warlords2.model.world import Sign
from warlords2.rules import city as CT
from warlords2.rules import engine
from warlords2.rules import present as PR
from warlords2.rules import reports as R
from warlords2.rules import signs as SG
from warlords2.rules import turn as T
from warlords2.rules import victory as V
from warlords2.rules.constants import UnverifiedError, allowing_unverified
from warlords2.rules.engine import IllegalCommand

from movekit import scenario_state
from test_bonuses import mk_state, put, set_terrain
from test_city import add_city, mk
from test_turn import ai_stubs, stubs  # noqa: F401 (fixtures)
from test_vectoring import running, standard

HUMAN, COMP = Control.HUMAN, Control.COMPUTER


@pytest.fixture
def points():
    got = []
    me = threading.current_thread()
    PR.attach(me, lambda name, info: got.append((name, dict(info))))
    yield got
    PR.detach(me)


# ----------------------------------------------------------------------------- E1 production list


def _three_cities():
    """a vectors to b, b builds in place, s vectors to side 0's standard (on the map)."""
    st = mk()
    st.players[0].gold = 500
    a = add_city(st, 10, 10, 0, (4,))
    b = add_city(st, 30, 30, 0, (4,))
    s = add_city(st, 50, 50, 0, (4,))
    for ci in (a, b, s):
        running(st, ci).turns_left = 9           # not due until `_due`
    standard(st, 0, 40, 40)
    engine.apply(st, C.SetVector(a, b))
    engine.apply(st, C.SetVector(s, 100))
    return st, a, b, s


def _due(st, *cities):
    for ci in cities:
        st.cities[ci].turns_left = 1


def test_production_list_order_kinds_and_reset():
    """ovl43:0000: count = 0 (0016); arrivals of the army loop from the top index down (kind 0:
    type +4, home +9, dest = +0xf >> 1 before it is cleared: the city, or 100 + p for the
    standard), then cities ascending (kind 1 vectoring, dest = target city or 100 + p; kind 2
    placed, dest -1; type = the new record's +4)."""
    st, a, b, s = _three_cities()
    _due(st, a, b, s)
    CT.deliver(st)
    made = [ReportEntry(1, 4, a, b, 0), ReportEntry(2, 4, b, -1, 1), ReportEntry(1, 4, s, 100, 2)]
    assert st.production_report == made
    _due(st, a, b, s)
    CT.deliver(st)                               # 0x65 -> 0x66: no arrival; count reset
    assert st.production_report == [ReportEntry(1, 4, a, b, 3), ReportEntry(2, 4, b, -1, 4),
                                     ReportEntry(1, 4, s, 100, 5)]
    _due(st, a)
    CT.deliver(st)                               # the turn-1 units arrive: army 2, then army 0
    assert st.production_report == [ReportEntry(0, 4, s, 100, 2), ReportEntry(0, 4, a, b, 0),
                                     ReportEntry(1, 4, a, b, 6)]
    assert (st.armies[2].x, st.armies[2].y, st.armies[2].vector_dest) == (40, 40, 0)
    assert R.report(st, 3)["own"] == 3


def test_production_list_skips_stalled_cities():
    """No unit (gold <= 0 at 0557, or no room and no vectoring at 057b..0590) -> no entry."""
    st, a, b, s = _three_cities()
    st.production_report.append(ReportEntry(2, 1, 0, -1))
    st.players[0].gold = 0
    _due(st, a, b, s)
    ev = CT.deliver(st)
    assert st.production_report == [] and sum(isinstance(e, E.ProductionStalled) for e in ev) == 3


def test_report_mode_3_values_and_entries():
    """ovl42:02fb case 3 (04b8): si = ovl43:07e5 (count); DS:4450 stay 0, scale DS:0e40 0."""
    st, a, b, s = _three_cities()
    st.players[5].alive = 0
    _due(st, b)
    CT.deliver(st)
    r = R.report(st, 3)
    assert r == {"values": [0] * 8, "dead": [0, 0, 0, 0, 0, 1, 0, 0], "scale": 0, "own": 1,
                 "entries": [ReportEntry(2, 4, b, -1, 0)]}
    r["entries"][0].city = 99                    # a copy
    assert R.production_list(st)[0].city == b


def test_production_list_is_not_saved_but_copied():
    """Heap block DS:4464, not in the save: dump / hash do not see it, a load starts empty,
    GameState.copy and a refused command keep it."""
    st, a, b, s = _three_cities()
    _due(st, b)
    h, d = st.hash(), dump(st)
    st2 = st.copy()
    CT.deliver(st2)
    assert st2.production_report and st.production_report == []
    st.production_report[:] = st2.production_report
    assert dump(st) == d and st.hash() == h
    assert load(dump(st)).production_report == []
    assert st.copy().production_report == st.production_report
    keep = list(st.production_report)
    snap = snapshot(st)
    restore(st, snap)
    assert st.production_report == keep


def test_refused_command_puts_the_list_back(monkeypatch):
    st = mk()
    st.production_report.append(ReportEntry(2, 1, 0, -1))

    def bad(state, cmd):
        state.production_report.clear()
        raise IllegalCommand("no")
    monkeypatch.setattr(SG, "edit_sign", bad)
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.EditSign(0, "", ""))
    assert st.production_report == [ReportEntry(2, 1, 0, -1)]


@pytest.mark.gamedata
def test_human_and_computer_turn_starts_refill_the_list(game, ai_stubs):  # noqa: F811
    """ovl43:0000 runs on every side's turn start (human ovl68:0597, computer ovl68:01b3); the
    block holds the last run's list."""
    st = scenario_state(game, "DRAGON", seed=3, controls=(HUMAN,) + (COMP,) * 7)
    st.turn = 3
    p = st.current
    c = next(i for i, c in enumerate(st.cities) if c.owner == p)
    engine.apply(st, C.SetProduction(c, 0))
    st.cities[c].turns_left = 1
    st.players[p].gold = 500
    T.resume(st, 2)
    assert [(e.kind, e.city) for e in st.production_report] == [(2, c)]
    st.current = q = next(i for i, pl in enumerate(st.players) if pl.alive and i != p)
    T.computer_turn(st)
    assert all(e.city >= 0 and st.cities[e.city].owner == q for e in st.production_report)


def _block(n, **kw):
    rep = ProductionReport()
    for i in range(n):
        rep.append(ReportEntry(kw.get("kind", 2), 3, i % 7, -1, None))
    return rep


def test_block_bytes_up_to_100_entries():
    """ovl43:076d: 0x321 bytes; slot i: kind +i, type +0x64 + i, city +0xc8 + i, dest +0x12c + i,
    far pointer +0x190 + 4 i (segment word at +2 first, then the offset), count +0x320."""
    rep = ProductionReport()
    rep.append(ReportEntry(0, -1, 5, 104, 3))
    d = rep.data
    assert len(d) == 0x321 and d[0x320] == 1
    assert (d[0], d[0x64], d[0xc8], d[0x12c]) == (0, 0xFF, 5, 104)
    assert d[0x190:0x194] == (0x8880 + 0x16 * 3).to_bytes(2, "little") + (0x1E1D).to_bytes(2, "little")
    assert list(rep) == [ReportEntry(0, -1, 5, 104, 3)]
    rep.clear()                                    # ovl43:0016: only the count
    assert list(rep) == [] and d[0x12c] == 104


def test_101st_entry_aliases_the_block():
    """No bound check: entry 100 writes its kind over type[0] (+0x64) and its pointer's offset
    word over +0x320..0x321, so the count becomes the offset's low byte (army 111: 1e1d:920a ->
    10) and its type / city / dest land in slot 10; the other pointer bytes lie past the block."""
    rep = _block(100)
    assert len(rep) == 100 and rep[99] == ReportEntry(2, 3, 99 % 7, -1, None)
    rep.append(ReportEntry(1, 7, 4, 2, 111))
    assert len(rep.data) == 0x321 and rep.count == 11
    assert rep[0] == ReportEntry(2, 1, 0, -1, None)                # type[0] = the kind byte 1
    assert rep[10] == ReportEntry(2, 7, 4, 2, None)               # old kind, new fields
    rep2 = _block(100)
    rep2.append(ReportEntry(2, 7, 4, 2, 0))                        # 1e1d:8880 -> count 0x80
    assert rep2.count == -127 and list(rep2) == []                 # fields before the block
    assert rep2.data[0x48] == 4 and rep2.data[0xac] == 2           # city, dest at -128
    rep3 = _block(100)
    rep3.append(ReportEntry(2, 7, 4, 9, 93))                       # 1e1d:907e -> count 126
    assert rep3.count == 127 and rep3.data[0x64 + 126] == 7        # type over city[26]
    assert rep3.data[0xc8 + 126] == 4 and rep3.data[0x12c + 126] == 9
    assert rep3[26].city == 7 and rep3[26].dest == 4               # aliased slot 26
    rep3.append(ReportEntry(1, 8, 5, 6, 94))                       # pointer past the block
    assert rep3.count == -128 and rep3.data[127] == 1 and len(rep3.data) == 0x321


def _many_cities(n):
    st = mk()
    st.players[0].gold = 500
    for i in range(n):
        ci = add_city(st, 3 * (i % 36), 3 * (i // 36), 0, (4,))
        running(st, ci).turns_left = 1
    return st


def test_101_units_made_restart_the_aliased_cities():
    """101 cities each make a unit (armies 0..100): entry 100's pointer 1e1d:9118 sets the count
    to 0x18 and its fields land in slot 24, so ovl43:06bd (human turn) restarts cities 0..23
    and 100 only; ovl43:07e5 says 25."""
    st = _many_cities(101)
    CT.deliver(st)
    rep = st.production_report
    assert rep.count == 25 and [e.city for e in rep] == list(range(24)) + [100]
    assert R.report(st, 3)["own"] == 25
    CT.restart_production(st)
    time = st.cities[0].slots[0].time
    assert [c.turns_left for c in st.cities] == [time] * 24 + [0] * 76 + [time]


def test_restart_of_a_city_byte_outside_the_table_is_unverified():
    """06bd with city -1 writes SCN bytes before the city table (X40)."""
    st = _many_cities(1)
    st.production_report.append(ReportEntry(2, 1, -1, -1))
    before = st.cities[0].turns_left
    with pytest.raises(UnverifiedError):
        CT.restart_production(st)
    with allowing_unverified():
        CT.restart_production(st)
    assert st.cities[0].turns_left == before


def test_negative_count_restarts_nothing_but_refreshes(monkeypatch):
    """ovl68:059c: a nonzero count calls 06bd, whose loop runs while count > si; 0760 ovl62:0000."""
    import warlords2.rules.mapwords as MW
    st = _many_cities(1)
    st.production_report.data[0x320] = 0x81
    assert R.report(st, 3)["own"] == -127 and R.report(st, 3)["entries"] == []
    calls = []
    monkeypatch.setattr(MW, "refresh_map", lambda state: calls.append(1))
    CT.restart_production(st)
    assert calls == [1] and st.cities[0].turns_left == 1
    st.production_report.clear()
    CT.restart_production(st)
    assert calls == [1]


def test_full_army_table_entry_still_counts(monkeypatch):
    """0dd7 returns NULL: the entry is still written and counted (068b) with the type read
    through 0000:0004 [U] (stand-in: the city's production byte) and a NULL pointer; 06bd
    restarts the city."""
    st = _many_cities(1)
    monkeypatch.setattr(CT, "alloc_army", lambda state: None)
    CT.deliver(st)
    assert list(st.production_report) == [ReportEntry(2, 4, 0, -1, None)]
    assert st.production_report.data[0x190:0x194] == bytes(4)
    CT.restart_production(st)
    assert st.cities[0].turns_left == st.cities[0].slots[0].time


# ----------------------------------------------------------------------------- E2 signs


def _signs():
    st = mk_state()
    st.world.signs = [Sign(5, 5, "a", "b"), Sign(7, 7, "c", "d"), Sign(7, 7, "e", "f")]
    for x in (5, 7):
        set_terrain(st, x, x, Terrain.TOWER)
    return st


def test_sign_at_follows_the_dialog_gate():
    """ovl13:01ae..02ad: DS:5e62 null -> none; terrain 9 at its square, else none; the first
    record at its x, y."""
    st = _signs()
    assert SG.sign_at(st) is None
    st.selection.selected = put(st, 1, 0, 7, 7)
    assert SG.sign_at(st) == 1
    st.selection.selected = put(st, 1, 0, 6, 6)
    assert SG.sign_at(st) is None                # no sign terrain
    set_terrain(st, 6, 6, Terrain.TOWER)
    assert SG.sign_at(st) is None                # no record there
    st.selection.selected = put(st, 1, 0, 5, 5)
    set_terrain(st, 5, 5, Terrain.PLAIN)
    assert SG.sign_at(st) is None


def test_edit_sign_writes_both_lines():
    """ovl56:03a6 starts empty: Return stores at most 29 typed keys 0x20..0x7a (also none),
    Esc keeps the line; 421 (ovl13:0486) writes the record out."""
    st = _signs()
    st.world.signs[1].line2 = "{" * 40                 # a scenario line no editor can type
    st.selection.selected = put(st, 1, 0, 7, 7)
    assert engine.DISPATCH[C.EditSign][0] == "M9b"
    typed = "".join(chr(c) for c in range(0x20, 0x20 + 29)).replace("z", "y")
    assert engine.apply(st, C.EditSign(1, typed, "{" * 40)) == []        # line 2 kept (Esc)
    assert [(s.line1, s.line2) for s in st.world.signs] == [("a", "b"), (typed, "{" * 40), ("e", "f")]
    engine.apply(st, C.EditSign(1, "z ", ""))                            # 0x7a, empty Return
    assert (st.world.signs[1].line1, st.world.signs[1].line2) == ("z ", "")


@pytest.mark.parametrize("cmd", [
    C.EditSign(2, "a", "b"), C.EditSign(0, "a", "b"), C.EditSign(1, "x" * 30, "d"),
    C.EditSign(1, "{", "d"), C.EditSign(1, "\x1f", "d"), C.EditSign(1, "c", "a\0b"),
    C.EditSign(1, "\u20ac", "d"), C.EditSign(1, None, "d"), C.EditSign(1, "c", "{" * 40)])
def test_edit_sign_refused(cmd):
    """Keys > 0x7a or < 0x20 are not typed (ovl56:047f..048e), at most 29 (04c1..04c7); only an
    unchanged line may break those rules."""
    st = _signs()
    st.selection.selected = put(st, 1, 0, 7, 7)
    before = dump(st, rng=False)
    with pytest.raises(IllegalCommand):
        engine.apply(st, cmd)
    assert dump(st, rng=False) == before


def test_edit_sign_needs_the_dialog():
    st = _signs()
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.EditSign(1, "a", "b"))


# ----------------------------------------------------------------------------- E3 end states


def _ends(alive, control):
    st = mk_state()
    for p, pl in enumerate(st.players):
        pl.alive, pl.control = int(p in alive), control.get(p, COMP)
    return st


def test_no_side_alive_two_waits_then_quit(points):
    """ovl61:1c06..1c55: 1160(S(12,0), S(12,1)), 1160(S(12,2), S(12,3)), 0a4c:02b5."""
    ev = V.check(_ends((), {}))
    assert isinstance(ev[0], E.NoPlayersLeft)
    assert points == [("no_players", {"group": 12, "index": 0, "at": "ovl61:1c28"}),
                      ("no_players", {"group": 12, "index": 2, "at": "ovl61:1c4f"}),
                      ("quit", {"at": "ovl61:1c55"})]


def test_no_human_left_two_waits(points):
    """ovl61:1c5a..1cb7: not 0x15b, no live human, a human seen: 1160 (13, 0 / 1), (13, 2 / 3)."""
    V.check(_ends((1, 2), {0: HUMAN}))
    assert points == [("no_humans", {"group": 13, "index": 0, "at": "ovl61:1c8d"}),
                      ("no_humans", {"group": 13, "index": 2, "at": "ovl61:1cb4"})]


def test_lone_computer_winner_one_wait(points):
    """ovl61:1d07..1d96: S(15, 0) with the first live side's name, ovl61:10fb, then d0 = 0."""
    st = _ends((3,), {})
    seen = []
    PR.attach(threading.current_thread(),
              lambda name, info: seen.append((name, dict(info), st.players[3].control)))
    V.check(st)
    assert seen == [("winner", {"group": 15, "index": 0, "args": ("p3",), "at": "ovl61:1d71"}, COMP)]
    assert st.players[3].control == HUMAN and st.flags[SCN_VICTORY] == 1


def test_no_end_state_presents_nothing(points):
    V.check(_ends((0, 1), {0: HUMAN}))
    assert points == []


# ----------------------------------------------------------------------------- E4 victory button


@pytest.mark.gamedata
def test_victory_screen_keeps_hidden_map_until_its_button(game, ai_stubs):  # noqa: F811
    """ovl61:1fbd sets 0x157 and leaves the screen up; only 0x1e3 -> ovl61:2004 clears Hidden Map
    (2026) and goes on with ovl68:04bd(0) (203e)."""
    ctl = [COMP] * 8
    ctl[0] = HUMAN
    st = scenario_state(game, "DRAGON", seed=4, options=GameOptions(hidden_map=1), controls=tuple(ctl))
    st.turn, st.players[0].gold = 3, 0
    st.flags[SCN_VICTORY] = 1
    ev = T.resume(st, 0)
    assert ev == [E.Victory({"player": 0})] and st.pending == ev[0] and st.options.hidden_map
    for cmd in (C.EndTurn(), C.Next(), C.AcceptSurrender(True)):
        with pytest.raises(IllegalCommand):
            engine.apply(st, cmd)
    engine.apply(st, C.SetView(10, 10))          # ANYTIME
    h = st.hash()
    assert load(dump(st)).hash() == h and isinstance(load(dump(st)).pending, E.Victory)
    rest = engine.apply(st, C.CloseVictory())
    assert st.pending is None and not st.options.hidden_map
    assert rest[-1] == E.TurnCue({"kind": "info_bar"})
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.CloseVictory())


# ----------------------------------------------------------------------------- E5 shield strip


def _history(state):
    PR.present("history_marker")
    return []


@pytest.mark.gamedata
def test_round_end_strip_after_history(game, ai_stubs, points, monkeypatch):  # noqa: F811
    """ovl61:17f6: ... ovl41:0d60 (1837), ovl68:0952(1, 0) (183f), only when a round ended."""
    ms, _, doc, addr = T.HOOKS["history_round"]
    monkeypatch.setitem(T.HOOKS, "history_round", (ms, "test_m9b_engine:_history", doc, addr))
    st = scenario_state(game, "DRAGON", seed=3)
    st.flags[SCN_ROUND_COMPLETE] = 0
    T.next_side(st)
    assert points == []
    st.flags[SCN_ROUND_COMPLETE] = 1
    T.next_side(st)
    assert [p for p in points if p[0] in ("history_marker", "strip")] == [
        ("history_marker", {}), ("strip", {"at": "ovl61:183f"})]


@pytest.mark.gamedata
def test_human_turn_strip_before_centring(game, stubs, points, monkeypatch):  # noqa: F811
    """ovl68:0374 ovl68:0952(0, 0) after ovl62:0af3 (036a), before ovl64:0629 (039c)."""
    ctl = [COMP] * 8
    ctl[0] = HUMAN
    st = scenario_state(game, "DRAGON", seed=3, controls=tuple(ctl))
    st.turn, st.players[0].gold = 2, 0
    real = T.centre_view
    monkeypatch.setattr(T, "centre_view", lambda s, x, y: (points.append(("centre", {})), real(s, x, y)))
    T.human_turn(st)
    names = [n for n, _ in points]
    assert ("strip", {"at": "ovl68:0374"}) in points and names.count("strip") == 1
    assert names.index("strip") == names.index("centre") - 1
