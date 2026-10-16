"""Same scenario + options + seed + command list -> same state hash; engine dispatch."""
import importlib
from functools import lru_cache

import pytest

from warlords2.formats.gamedir import GameDir
from warlords2.formats.scenario import load_scenario
from warlords2.formats.tables import parse_armytypes
from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import Control
from warlords2.model.newgame import NewGameConfig
from warlords2.model.options import GameOptions
from warlords2.model.serialize import dump, load
from warlords2.rules import engine
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.setup import new_game

OPTS = GameOptions(neutral_cities=1, diplomacy=1, quests=1, quick_start=1)


@lru_cache(maxsize=None)
def _inputs(root, name):
    gd = GameDir(root)
    return load_scenario(gd, name), parse_armytypes(gd.read("TERRAIN0/ARMYTYPE.DAT"))


def fresh(root, name, seed):
    sc, at = _inputs(root, name)
    c = NewGameConfig(name, (Control.HUMAN,) + (Control.COMPUTER,) * 7, (2,) * 8, (0,) * 8, (0,) * 8,
                      None, OPTS, 0, seed)
    with allowing_unverified(False):
        return new_game(sc, c, at)


def run(state, cmds):
    for cmd in cmds:
        engine.apply(state, cmd)
    return state.hash()


@pytest.mark.gamedata
@pytest.mark.parametrize("name", ["TUTORIA", "ERYTHEA", "RANDOM"])
def test_same_seed_same_hash(game, name):
    a, b = fresh(game, name, 1234), fresh(game, name, 1234)
    assert run(a, []) == run(b, [])
    assert fresh(game, name, 1235).hash() != a.hash()


@pytest.mark.gamedata
def test_dump_load_mid_sequence_keeps_hash(game):
    a = fresh(game, "DRAGON", 5)
    for _ in range(100):
        a.rng.rnd(1, 100, 0)
    b = load(dump(a))
    assert a.hash() == b.hash()
    assert [a.rng.rnd(3, 6, 0) for _ in range(20)] == [b.rng.rnd(3, 6, 0) for _ in range(20)]


def test_dispatch_covers_closed_command_list():
    assert set(engine.DISPATCH) == set(C.COMMANDS) and len(C.COMMANDS) == 54
    for milestone, target in engine.DISPATCH.values():
        mod, fn = target.split(":")
        assert mod.startswith("warlords2.rules.") and fn.isidentifier() and milestone


def test_event_list_closed():
    assert len(E.EVENTS) == 51 and set(engine.ANSWERS) == set(E.PENDING)


@pytest.mark.gamedata
def test_unimplemented_command_names_milestone_and_changes_nothing(game):
    st = fresh(game, "TUTORIA", 3)
    h = st.hash()
    for cmd, ms in ((C.EndTurn(), "M8a"), (C.Move((0,), (1, 1)), "M4b"), (C.Search((0,)), "M7a")):
        mod = engine.DISPATCH[type(cmd)][1].split(":")[0]
        try:
            importlib.import_module(mod)
            continue                      # implemented by its milestone meanwhile
        except ModuleNotFoundError:
            pass
        with pytest.raises(engine.NotImplementedCommand) as e:
            engine.apply(st, cmd)
        assert e.value.milestone == ms and isinstance(e.value, NotImplementedError)
        assert isinstance(e.value, engine.IllegalCommand)
        assert not engine.legal(st, cmd)
    assert st.hash() == h


@pytest.mark.gamedata
def test_pending_question_gates_commands(game):
    st = fresh(game, "TUTORIA", 3)
    st.pending = E.CityCaptured({"city": 0})
    with pytest.raises(engine.IllegalCommand, match="pending"):
        engine.apply(st, C.EndTurn())
    with pytest.raises(engine.IllegalCommand):
        engine.apply(st, C.AcceptHero(True))
    st.pending = None
    with pytest.raises(engine.IllegalCommand, match="no pending"):
        engine.apply(st, C.CaptureChoice("occupy"))
