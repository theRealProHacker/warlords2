"""ovl25 frame (ai.md §6, §6.0, §6.18, §5.14, §9) as warlords2.ai.base: the computer turn's phase
order and rnd order, the strict / permissive handling of phases not written yet, pre_turn,
hero_city, after_raze, and the hooks the rules code resolves into warlords2.ai."""
import logging
import re
from pathlib import Path

import pytest

from warlords2.ai import base as B
from warlords2.ai import state as AS
from warlords2.ai import util as U
from warlords2.model import commands as C
from warlords2.model.ids import Control, Relation
from warlords2.model.options import GameOptions
from warlords2.model.state import SCN_ARMY_HIGH
from warlords2.rules import city as CT
from warlords2.rules import combat, engine
from warlords2.rules import diplomacy as D
from warlords2.rules import heroes as H
from warlords2.rules import movement as M
from warlords2.rules import ruins as RU
from warlords2.rules import setup as S
from warlords2.rules import turn as T
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.engine import NotImplementedCommand

from movekit import add_army, add_city, flat_state, scenario_state, type_with

pytestmark = pytest.mark.gamedata
COMP, HUMAN = Control.COMPUTER, Control.HUMAN
LOG = []


class Rec:
    def __init__(self, rng, script=None):
        self.rng, self.calls, self.script = rng, [], list(script or [])

    def rnd(self, d, s, a):
        self.calls.append((d, s, a))
        LOG.append(("rnd", (d, s, a)))
        return self.script.pop(0) if self.script else self.rng.rnd(d, s, a)

    def state(self):
        return {"calls": list(self.calls), **self.rng.state()}


def _phase(name):
    def f(state, *args):
        LOG.append((name, args, state.ai.turn_active, state.players[state.current].control))
        state.rng.rnd(1, 7, 0)
        return [name]
    return f


for _i, (_n, _, _, _) in enumerate(B.PHASES):
    globals()["ph%d" % _i] = _phase(_n)


@pytest.fixture
def phases(monkeypatch):
    """Every phase target replaced by a recorder here (same names, same order)."""
    monkeypatch.setattr(B, "PHASES", tuple((n, ms, "test_ai_base:ph%d" % i, a)
                                           for i, (n, ms, _, a) in enumerate(B.PHASES)))
    LOG.clear()
    return LOG


def computer_side(game, options=GameOptions(), seed=3):
    st = scenario_state(game, "ERYTHEA", seed=seed, options=options)
    st.current = 3
    st.ai.allocated = 1
    st.rng = Rec(st.rng)
    return st


def penalty_case(st, p, b):
    """current(p, b) war, p proposes peace, b proposes neutral: rnd(1,10,0) + 10 (ovl00:1063)."""
    D.set_current(st, p, b, Relation.WAR)
    D.set_proposal(st, p, b, Relation.PEACE)
    D.set_proposal(st, b, p, Relation.NEUTRAL)


def test_phases_run_in_the_ovl25_order_then_the_penalty(game, phases):
    """ovl25:0000: the 19 phases in call order (move Search and update hide with Hidden Map),
    evaluate with the side, DS:0836 = 1 during them and 0 after; the penalty ovl00:1063 draws
    after the last phase; relation[cur][cur] bits 0-3 cleared first."""
    st = computer_side(game, GameOptions(hidden_map=1))
    p = st.current
    st.relations[p][p] = 0xFF
    penalty_case(st, p, 5)
    ev = B.computer_turn(st)
    names = [n for n, *_ in B.PHASES]
    assert [e[0] for e in phases if e[0] != "rnd"] == names
    assert ev == names
    assert all(e[2] == 1 for e in phases if e[0] != "rnd")
    assert [e[1] for e in phases if e[0] == "evaluate"] == [(p,)]
    assert phases[-1] == ("rnd", (1, 10, 0)) and phases[-2] == ("rnd", (1, 7, 0))
    assert st.ai.turn_active == 0 and st.relations[p][p] == 0xF0


def test_without_hidden_map_search_and_update_hide_are_not_called(game, phases):
    """ovl25:0150 / 028a: SCN 0x124 == 0 -> no ovl22:0284, no ovl21:0c1c."""
    st = computer_side(game)
    B.computer_turn(st)
    called = [e[0] for e in phases if e[0] != "rnd"]
    assert called == [n for n, *_ in B.PHASES if n not in ("move Search", "update hide")]


def test_move_search_runs_a_human_side_as_computer(game, phases):
    """ovl25:0109..0172: SCN 0x0d0[cur] == 0 -> 1 around move Search, restored after."""
    st = computer_side(game, GameOptions(hidden_map=1))
    st.players[st.current].control = HUMAN
    B.computer_turn(st)
    ctl = {e[0]: e[3] for e in phases if e[0] != "rnd"}
    assert ctl["move Search"] == COMP and ctl["move Explore"] == HUMAN == ctl["move Hero"]
    assert st.players[st.current].control == HUMAN


MISSING = "test_ai_base:not_written"                  # a module function that does not exist


def _missing(monkeypatch, names):
    """The phases `names` (None: all) point at a function that does not exist."""
    monkeypatch.setattr(B, "PHASES", tuple((n, ms, MISSING if names is None or n in names else t, a)
                                           for n, ms, t, a in B.PHASES))


def test_strict_mode_refuses_before_any_change(game, monkeypatch):
    """A phase module not written yet: NotImplementedCommand naming the first missing phase in
    call order, nothing changed."""
    _missing(monkeypatch, ("Diplomacy", "assault"))
    st = computer_side(game)
    st.relations[3][3] = 0xFF
    h = st.hash()
    with allowing_unverified(False):
        with pytest.raises(NotImplementedCommand) as e:
            B.computer_turn(st)
    assert (e.value.milestone, e.value.target) == ("M8b4", MISSING)
    assert st.hash() == h


def test_strict_end_turn_checks_the_phases_up_front(game, monkeypatch):
    """rules.turn._require asks computer_turn.require: End Turn into a computer side refuses
    before anything changes."""
    _missing(monkeypatch, ("production",))
    ctl = [COMP] * 8
    ctl[0] = HUMAN
    st = scenario_state(game, "DRAGON", seed=3, controls=tuple(ctl))
    st.ai.allocated = 1
    h = st.hash()
    with allowing_unverified(False):
        with pytest.raises(NotImplementedCommand) as e:
            engine.apply(st, C.EndTurn())
    assert (e.value.milestone, e.value.target) == ("M8b2", MISSING) and st.hash() == h


def test_permissive_mode_logs_and_skips_missing_phases(game, caplog, monkeypatch):
    """--allow-unverified: each missing phase logged and skipped; the frame (pre_turn, the
    penalty) still runs."""
    _missing(monkeypatch, None)
    st = computer_side(game)
    penalty_case(st, 3, 6)
    st.ai[3].solidarity = 1
    with allowing_unverified(True), caplog.at_level(logging.WARNING):
        assert B.computer_turn(st) == []
    assert st.rng.calls == [(1, 10, 0)] and st.ai.solidarity[3] == 1
    assert sum("computer phase" in r.message for r in caplog.records) == 17


def test_blocks_not_set_up(game, caplog):
    """No card source at new game (DS:0832 == 0): strict refuses, permissive skips the turn."""
    st = computer_side(game)
    st.ai.allocated = 0
    with allowing_unverified(False), pytest.raises((ValueError, NotImplementedCommand)):
        B.computer_turn(st)
    with allowing_unverified(True), caplog.at_level(logging.WARNING):
        assert B.computer_turn(st) == [] and st.rng.calls == []


@pytest.mark.parametrize("turn,qs_hm,before,after", [
    (4, False, 13, 4), (5, False, 11, 8), (0, False, 13, 4), (5, False, 6, 6),
    (1, True, 6, 13), (2, True, 6, 11), (3, True, 6, 6), (5, True, 13, 8),
])
def test_pre_turn_roles(game, turn, qs_hm, before, after):
    """ovl25:0386: roles 13 / 11 -> 4 before max(turn, 1) 5, else 8; Quick Start + Hidden Map:
    13 on turn 1, 11 while < 3; bit 2 of the city flags cleared; own cities only; DS:40f2."""
    o = GameOptions(quick_start=1, hidden_map=1) if qs_hm else GameOptions()
    st = computer_side(game, o)
    st.turn = turn
    own = next(c for c, x in enumerate(st.cities) if x.owner == 3)
    other = next(c for c, x in enumerate(st.cities) if x.owner != 3)
    b = st.ai[3]
    b.role[own] = b.role[other] = before
    b.city_flags[own] = b.city_flags[other] = 0xFF
    b.solidarity = 7
    B.pre_turn(st)
    assert b.role[own] == after and b.role[other] == before
    assert b.city_flags[own] == 0xFB and b.city_flags[other] == 0xFF
    assert st.ai.solidarity[3] == 7 and st.rng.calls == []


def test_hero_city_rolls_and_ties(game):
    """ovl25:0919: own cities count-1..0; rnd(1,100,100) role 7, rnd(1,100,50) role 2,
    rnd(1,100,0) role 3, no draw otherwise; strict > from 0; c0 when nothing scores."""
    st = flat_state(game)
    cs = [add_city(st, 5 + 4 * i, 5, 0) for i in range(5)]
    add_city(st, 40, 40, 2)
    b = st.ai[0]
    b.role[cs[0]], b.role[cs[1]], b.role[cs[2]], b.role[cs[3]], b.role[cs[4]] = 7, 2, 3, 5, 3
    b.role[5] = 7
    st.rng = Rec(st.rng, [40, 90, 60, 150])          # drawn for c4, c2, c1, c0
    assert B.hero_city(st, 9) == cs[0]
    assert st.rng.calls == [(1, 100, 0), (1, 100, 0), (1, 100, 50), (1, 100, 100)]
    st.rng = Rec(st.rng, [70, 70, 60, 120])          # c4 70, c2 70 (tie: c4 stays), c1 60, c0 120
    assert B.hero_city(st, 9) == cs[0]
    st.rng = Rec(st.rng, [70, 70, 60, 50])
    assert B.hero_city(st, 9) == cs[4]
    for c in cs:
        b.role[c] = 5
    st.rng = Rec(st.rng)
    assert B.hero_city(st, 9) == 9 and st.rng.calls == []


def test_hero_city_reads_the_block_ds40ee_points_at(game, phases):
    """ovl25:0919 reads the roles through DS:40ee, which only ovl25:0000 (0091 / 0095: the side
    on turn) and ovl25:0519 (p = 7..0: block 0 last) write.  0919 runs at ovl68:019b (ovl47),
    before ovl25:0000 at ovl68:01e3, so it sees block 0 after Begin, then the block of the last
    side that ran ovl25:0000 - never reset."""
    from warlords2.ai import cards as AC
    from warlords2.formats.gamedir import GameDir
    st = computer_side(game)
    AC.setup_all(st, AC.card_reader(GameDir(game)))
    assert st.ai.locked == 0
    own5 = [c for c, x in enumerate(st.cities) if x.owner == 5]
    own3 = [c for c, x in enumerate(st.cities) if x.owner == 3]
    for p in range(8):
        for c in own5 + own3:
            st.ai[p].role[c] = 0                      # no draw with these roles
    for c in own5:
        st.ai[3].role[c] = 7
    for c in own3:
        st.ai[0].role[c] = 2
    st.rng = Rec(st.rng)
    st.current = 3                                   # side 3's hero, right after Begin: block 0
    H_ = B.hero_city(st, 99)
    assert st.rng.calls == [(1, 100, 50)] * len(own3) and H_ in own3
    B.computer_turn(st)                              # side 3 runs ovl25:0000: DS:40ee = block 3
    assert st.ai.locked == 3 and st.ai.turn_active == 0
    st.current = 5                                   # side 5's hero before its own turn: block 3
    st.rng = Rec(st.rng)
    assert B.hero_city(st, 99) in own5
    assert st.rng.calls == [(1, 100, 100)] * len(own5)
    st.current = 3                                   # side 3 again: block 3 has no role for it
    st.rng = Rec(st.rng)
    assert B.hero_city(st, 99) == 99 and st.rng.calls == []


def test_ai_process_words_are_not_saved_and_carry_over_a_second_begin(game):
    """ovl29:0da9 saves (0dff reads) the blocks and the neighbour table only: DS:0832 / 0836 / 40f2 / 40ee
    and the raze result are the run's (model.ai.AiProcess).  A second Begin in the same run
    reuses the heap blocks, so words ovl21:084d does not write keep the first game's values,
    and DS:40f2 keeps its stale copies."""
    from warlords2.ai import cards as AC
    from warlords2.formats.gamedir import GameDir
    from warlords2.model.serialize import dump, load
    from movekit import _inputs
    from warlords2.model.newgame import NewGameConfig
    cards = AC.card_reader(GameDir(game))
    sc, at, kw = _inputs(game, "ERYTHEA")
    cfg = NewGameConfig("ERYTHEA", (HUMAN,) + (COMP,) * 7, (1,) * 8, (0,) * 8, (0,) * 8, None,
                        GameOptions(), 0, 1)
    with allowing_unverified():
        a = S.new_game(sc, cfg, list(at), cards=cards, **kw)
    proc = a.ai.proc
    assert proc.allocated == 1 and proc.locked == 0 and proc.blocks is a.ai.blocks
    a.ai[4].armies_here[7] = 9                       # +0x182 + 7: 084d does not write it
    a.ai.solidarity[4], a.ai.locked, a.ai.raze_target = 1, 6, 12
    d = dump(a)
    assert "allocated" not in d["ai"] and "solidarity" not in d["ai"]
    fresh = load(d)
    assert (fresh.ai.allocated, fresh.ai.solidarity, fresh.ai.locked, fresh.ai.raze_target) == (
        0, [0] * 8, 0, -1)
    assert fresh.hash() == a.hash()                  # the hash is the save's
    c = a.copy()
    assert c.ai.proc is not proc and c.ai.proc.dump() == proc.dump()
    with allowing_unverified():
        b = S.new_game(sc, cfg, list(at), cards=cards, process=proc, **kw)
    assert b.ai.proc is proc and proc.blocks is b.ai.blocks and b.ai.blocks is not a.ai.blocks
    assert b.ai[4].armies_here[7] == 9 and b.ai.solidarity[4] == 1
    assert proc.locked == 0                          # 0519 again


def test_after_raze_runs_1885_with_flag_1(game, monkeypatch):
    """ovl29:1851: distance map 15 from the leader with DS:5dfc / 5dfa, 1885(.., 1); its result
    kept for ovl19:0f1b."""
    st = flat_state(game)
    t = type_with(st, flag16=0)
    lead = add_army(st, t, 20, 20)
    st.flags[SCN_ARMY_HIGH] = len(st.armies)
    st.selection.selected, st.selection.moving, st.selection.mode, st.selection.mask = lead.id, [lead.id], 1, 0
    seen = []
    monkeypatch.setattr(B, "best_target", lambda s, flag, dm: seen.append((flag, dm.value(20, 20))) or 4)
    B.after_raze(st, 0)
    assert st.ai.raze_target == 4 and seen[0][0] == 1 and abs(seen[0][1]) == 1


def test_state_accessors(game):
    """0a8b:0318 / 02fe and ovl25:09ab."""
    st = flat_state(game)
    st.ai[0].quest_city = 6
    assert AS.quest_city(st) == 6
    AS.set_city_role(st, 3, 0x101)
    assert st.ai[0].role[3] == 1
    st.players[0].control = HUMAN
    assert not AS.is_computer_now(st)
    st.ai.turn_active = 1
    assert AS.is_computer_now(st) and AS.ai_turn_active(st) == 1


def test_rules_hooks_resolve_into_the_ai_package():
    """Each rules hook naming warlords2.ai.* resolves (M8b1 targets), or names a phase module
    function listed in ai.md §9 (M8b2-4)."""
    assert T._hook("ai_turn") is B.computer_turn
    assert H._hook("ai_hero_city") is B.hero_city
    assert combat._hook("ai_memory") is B.record_battle
    assert CT._hook("ai_raze") is B.after_raze
    assert M._hook("ai_quest_city") is AS.quest_city and M._hook("ai_set_role") is AS.set_city_role
    assert M._hook("ai_retarget") is U.retarget
    from warlords2.ai import cards, tables
    assert S._hook("ai_setup") is cards.setup_all and S._hook("ai_neighbours") is tables.build_neighbours
    assert RU.HOOKS["ai_sage"][1] == "warlords2.ai.phases.quick_attack:sage"
    sec9 = (Path(__file__).resolve().parents[2] / "docs/research/ai.md").read_text(encoding="utf-8")
    sec9 = sec9.split("## 9. Proposed module split", 1)[1].split("## 10.", 1)[0]
    for mod in (T, H, combat, CT, M, RU, S):
        for name, (ms, target, _, _) in mod.HOOKS.items():
            if not target.startswith("warlords2.ai."):
                continue
            m, fn = target.split(":")
            if ms == "M8b1":
                assert mod._hook(name) is not None, target
            else:
                rel = m.replace("warlords2.", "").replace(".", "/") + ".py"
                assert re.search(r"`%s`[^|]*\|[^|]*\|[^|]*`%s`" % (re.escape(rel), re.escape(fn)), sec9), target
    for _, ms, target, _ in B.PHASES:
        m, fn = target.split(":")
        rel = m.replace("warlords2.", "").replace(".", "/") + ".py"
        assert re.search(r"`%s`[^|]*\|[^|]*\|[^|]*`%s`" % (re.escape(rel), re.escape(fn)), sec9), target
