"""ovl64:1298 at its battle call sites (ovl36:0d35 after a won battle, ovl36:0f31 per taken city
square) with Hidden Map, and the documented signatures of the remaining HOOKS entries."""
import importlib
import inspect
import re

import pytest

from warlords2.model import commands as C
from warlords2.model.ids import MAP_W, Terrain
from warlords2.rules import city as CT
from warlords2.rules import combat, engine

from test_army_table import _stub_hooks
from test_bonuses import atype, default_types, mk_state, put
from test_city import add_city
from test_combat import Script

SEEN = 0x20


def _hidden(types=None):
    st = mk_state(types, hidden_map=1)
    st.world.roads = [0] * len(st.world.roads)
    return st


def _seen(st):
    return {(i % MAP_W, i // MAP_W) for i, r in enumerate(st.world.roads) if r & SEEN}


def _box(x, y, r):
    return {(i, j) for i in range(x - r, x + r + 1) for j in range(y - r, y + r + 1)}


@pytest.mark.parametrize("flyer,radius", [(False, 1), (True, 2)])
def test_won_field_battle_reveals_target(monkeypatch, flyer, radius):
    """ovl36:0d35: (DS:41e9, DS:41e1) = the target square; radius 2 when the attacking stack's
    mode (DS:5dfc, set at selection) is flying."""
    types = default_types()
    types[6] = atype(6, flag16=1)
    st = _hidden(types)
    a = put(st, 6 if flyer else 1, 0, 4, 5, strength=9)
    put(st, 2, 1, 5, 5, strength=1)
    _stub_hooks(monkeypatch)
    st.rng.src = Script([20, 1], cycle=True)
    engine.apply(st, C.Attack((a,), 5, 5))
    assert _seen(st) == _box(5, 5, radius)


def test_lost_battle_reveals_nothing(monkeypatch):
    st = _hidden()
    a = put(st, 1, 0, 4, 5, strength=1)
    put(st, 2, 1, 5, 5, strength=9)
    _stub_hooks(monkeypatch)
    st.rng.src = Script([1, 20], cycle=True)
    engine.apply(st, C.Attack((a,), 5, 5))
    assert _seen(st) == set()


def test_taken_city_reveals_every_square(monkeypatch):
    """ovl36:0d35 at the city's top-left square, then ovl36:0f31 once per city square, each
    with radius 2 (the square is a City)."""
    st = _hidden(default_types())
    ci = add_city(st, 10, 10, 1, ())
    st.world.terrain_of_tile[12:] = [int(Terrain.CITY)] * 244   # the owner's city graphics (ovl39:0000)
    a = put(st, 1, 0, 9, 11, strength=9)
    put(st, 2, 1, 10, 10, strength=1)
    _stub_hooks(monkeypatch)
    st.rng.src = Script([20, 1], cycle=True)
    engine.apply(st, C.Attack((a,), 10, 10))
    assert st.cities[ci].owner == 0
    want = set().union(*(_box(10 + dx, 10 + dy, 2) for dx in (0, 1) for dy in (0, 1)))
    assert _seen(st) == want


def test_take_city_without_hidden_map_reveals_nothing():
    st = mk_state(default_types())
    ci = add_city(st, 10, 10, 1, ())
    roads = list(st.world.roads)
    CT.take_city(st, ci, 0, 1, True)
    assert st.world.roads == roads


# ----------------------------------------------------------------------------- HOOKS signatures

SIG = re.compile(r"^f\(([^)]*)\)")


def _documented(doc):
    m = SIG.match(doc)
    assert m, doc
    return [p.strip() for p in m.group(1).split(",")]


@pytest.mark.parametrize("module,name", [(m, n) for m in (combat, CT) for n in m.HOOKS])
def test_hook_signature(module, name):
    """Every remaining hook documents f(state, ...); a target that exists takes exactly those
    parameters (a missing one is checked against a stub built from the documentation)."""
    milestone, target, doc, _ = module.HOOKS[name]
    params = _documented(doc)
    assert params[0] == "state" and len(set(params)) == len(params)
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
    assert "reveal" not in module.HOOKS
