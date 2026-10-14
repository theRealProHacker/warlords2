"""model.serialize: lossless dump/load; GameState.hash/copy."""
import json
from functools import lru_cache

import pytest

from warlords2.formats.gamedir import GameDir
from warlords2.formats.scenario import SCENARIOS, load_scenario
from warlords2.formats.tables import parse_armytypes
from warlords2.model import events as E
from warlords2.model.ids import Control
from warlords2.model.newgame import NewGameConfig
from warlords2.model.options import GameOptions
from warlords2.model.serialize import dump, load
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.rng import Rng
from warlords2.rules.setup import new_game

pytestmark = pytest.mark.gamedata


@lru_cache(maxsize=None)
def state_for(root, name, seed=1):
    gd = GameDir(root)
    c = NewGameConfig(name, (Control.HUMAN,) * 2 + (Control.COMPUTER,) * 6, (0,) * 8, (0,) * 8,
                      (0, 1) * 4, None, GameOptions(quick_start=1, diplomacy=1), 1, seed)
    with allowing_unverified(False):
        return new_game(load_scenario(gd, name), c, parse_armytypes(gd.read("TERRAIN0/ARMYTYP2.DAT")))


@pytest.mark.parametrize("name", SCENARIOS)
def test_round_trip_keeps_hash(game, name):
    st = state_for(game, name)
    d = json.loads(json.dumps(dump(st)))          # survives real JSON
    st2 = load(d)
    assert st2.hash() == st.hash()
    assert dump(st2) == dump(st)


def test_copy_is_independent(game):
    st = state_for(game, "ERYTHEA")
    h = st.hash()
    cp = st.copy()
    cp.players[0].gold += 1
    cp.world.tiles[0] ^= 1
    cp.rng.rnd(1, 6, 0)
    assert st.hash() == h and cp.hash() != h


def test_rng_continues_after_load(game):
    st = state_for(game, "SORCERY").copy()
    st2 = load(dump(st))
    assert [st.rng.rnd(2, 100, 0) for _ in range(30)] == [st2.rng.rnd(2, 100, 0) for _ in range(30)]


def test_borland_rng_and_pending_round_trip(game):
    st = state_for(game, "TUTORIA").copy()
    st.rng = Rng(7, "borland")
    st.pending = E.CityCaptured({"city": 3})
    st2 = load(json.loads(json.dumps(dump(st))))
    assert st2.pending == st.pending and type(st2.rng.src).__name__ == "BorlandRand"
    assert st2.hash() == st.hash()
    assert [st.rng.rnd(1, 20, 0) for _ in range(10)] == [st2.rng.rnd(1, 20, 0) for _ in range(10)]
