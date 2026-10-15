"""Lossless JSON-compatible dump / load of a GameState (own format, plan register X12).

The RNG object lives in `rules.rng` (a higher layer); the dump records its class as a
"module:Class" string with the state from its `.state()`, and `load` resolves that class
through importlib and calls `Class.from_state(...)`.
"""
from __future__ import annotations

import copy
import importlib
from dataclasses import fields, is_dataclass
from typing import Any

from .ai import AiState
from .army import Army, ArmyType
from .city import City, Slot
from .hero import HeroSlot
from .item import Item
from .options import GameOptions
from .player import Player, Quest
from .site import Site
from .state import BattleWork, GameState, Monster, PathSlot, Selection
from .world import Sign, World

FORMAT = 10                       # 3: GameState.selection; 4: hero_names, news, battle_work;
#                                   5: battle_work zero start, d_types 32 bytes; 6: advisor_*;
#                                   7: ai blocks, Army.order, BattleWork.attack_cost,
#                                   Selection count / moves / group / mode / mask (DS:4160 and
#                                   the selection words are not among the EXE save's blocks, ovl49:0a46
#                                   writes (and 0414 reads): DS:5d64[0x54], SCN, map + armies, roads,
#                                   explored layer, text files, AI; this format is a snapshot and keeps
#                                   them - the save file is rules.saveload.saved_part); 8: the whole AI state (model/ai.py
#                                   AiState: blocks of ai.md §3.1, neighbour table, DS:0832 /
#                                   0836 / 40f2 words); 9: the AI's process words (DS:0832,
#                                   0836, 40f2, 40ee, the raze result: model.ai.AiProcess) are
#                                   no longer saved - ovl29:0da9 saves only the blocks and the
#                                   neighbour table, so a load starts a fresh AiProcess;
#                                   10: GameState.dist_table (the search field DS:3f86, a heap
#                                   buffer like the cost map and the path cache)


def _plain(v: Any) -> Any:
    if type(v) is list and all(type(x) is int for x in v):     # the 17472-entry map layers
        return list(v)
    if is_dataclass(v):
        return {f.name: _plain(getattr(v, f.name)) for f in fields(v)}
    if isinstance(v, (list, tuple)):
        return [_plain(x) for x in v]
    if isinstance(v, dict):
        return {str(k): _plain(x) for k, x in v.items()}
    return v


plain = _plain                    # the dump's form of one value (rules.saveload)


def _rng_dump(rng) -> dict:
    cls = type(rng)
    return {"class": "%s:%s" % (cls.__module__, cls.__qualname__), "state": rng.state()}


def _rng_load(d: dict):
    mod, name = d["class"].split(":")
    return getattr(importlib.import_module(mod), name).from_state(d["state"])


def dump(state: GameState, rng: bool = True) -> dict:
    out = {f.name: _plain(getattr(state, f.name)) for f in fields(state)
           if f.name not in ("rng", "pending", "flags")}
    out["format"] = FORMAT
    out["rng"] = _rng_dump(state.rng) if rng else None
    out["pending"] = None if state.pending is None else {
        "event": type(state.pending).__name__, "fields": _plain(state.pending)}
    out["flags"] = {str(k): v for k, v in state.flags.items()}
    return out


def _tuples(d: dict, *names: str) -> dict:
    return {**d, **{n: tuple(d[n]) for n in names}}


def load(d: dict, rng: Any = None) -> GameState:
    if d.get("format") != FORMAT:
        raise ValueError("unknown state format %r" % d.get("format"))
    w = d["world"]
    world = World(list(w["tiles"]), list(w["flags"]), list(w["roads"]), list(w["terrain_of_tile"]),
                  [Sign(**s) for s in w["signs"]], list(w["explored"]))
    players = [Player(**{**_tuples(p, "capital"), "quest": Quest(**p["quest"])}) for p in d["players"]]
    cities = [City(**{**_tuples(c, "vector_to"), "slots": [Slot(**s) for s in c["slots"]]})
              for c in d["cities"]]
    pending = None
    if d["pending"] is not None:
        from . import events
        cls = getattr(events, d["pending"]["event"])
        pending = cls(**d["pending"]["fields"])
    return GameState(
        world=world, players=players, cities=cities,
        sites=[Site(**s) for s in d["sites"]],
        items=[Item(**i) for i in d["items"]],
        armies=[Army(**_tuples(a, "goto")) for a in d["armies"]],
        heroes=[HeroSlot(**h) for h in d["heroes"]],
        monsters=[Monster(**m) for m in d["monsters"]],
        army_types=[ArmyType(**t) for t in d["army_types"]],
        fight_order=[list(r) for r in d["fight_order"]],
        options=GameOptions(**d["options"]),
        turn=d["turn"], current=d["current"],
        relations=[list(r) for r in d["relations"]],
        rng=_rng_load(d["rng"]) if rng is None else rng,
        history=list(d["history"]),
        pending=pending,
        flags={int(k): v for k, v in d["flags"].items()},
        reveal_at_first_human_turn=d["reveal_at_first_human_turn"],
        overview_mountain_rolls=list(d["overview_mountain_rolls"]),
        cost_map=list(d["cost_map"]),
        path_cache=[PathSlot(**_tuples(p, "src", "dst")) for p in d["path_cache"]],
        dist_table=list(d["dist_table"]),
        selection=Selection(**{k: list(v) if isinstance(v, list) else v
                               for k, v in _tuples(d["selection"], "next_ref").items()}),
        hero_names=[[list(e) for e in side] for side in d["hero_names"]],
        news=[[list(e) for e in side] for side in d["news"]],
        battle_work=BattleWork(**{k: list(v) if isinstance(v, list) else v
                                  for k, v in d["battle_work"].items()}),
        advisor_talking=d["advisor_talking"], advisor_digital=d["advisor_digital"],
        advisor_groups={int(k): v for k, v in d["advisor_groups"].items()},
        ai=AiState.from_dict(d["ai"]),
        income_cache=list(d["income_cache"]), upkeep_cache=list(d["upkeep_cache"]),
        city_counts=list(d["city_counts"]),
    )


def _assign(dst: Any, src: Any) -> Any:
    """`src`'s content put into `dst` where both are the same kind of container or dataclass,
    keeping `dst`'s identity (and that of the objects inside it); returns what to store."""
    if is_dataclass(dst) and type(dst) is type(src) and not dst.__dataclass_params__.frozen:
        for f in fields(dst):
            setattr(dst, f.name, _assign(getattr(dst, f.name), getattr(src, f.name)))
        return dst
    if type(dst) is list and type(src) is list:
        n = min(len(dst), len(src))
        dst[:n] = [_assign(dst[i], src[i]) for i in range(n)]
        del dst[n:]
        dst.extend(src[n:])
        return dst
    if type(dst) is dict and type(src) is dict:
        dst.clear()
        dst.update(src)
        return dst
    return src


def snapshot(state: GameState) -> tuple:
    """A copy of `state` and its AI process words (model.ai.AiProcess) for `restore`.  An RNG
    that cannot be serialised (a test stand-in die source) is deep-copied instead."""
    words = state.ai.proc.dump()
    try:
        return dump(state), None, words
    except AttributeError:
        return dump(state, rng=False), copy.deepcopy(state.rng), words


def restore(state: GameState, snap: tuple) -> None:
    """Put `state` back to `snap` (from `snapshot`), in place: the GameState, its lists and the
    records in them keep their identity, so references held into the state stay valid; the
    AI process object stays the same one, its words are put back."""
    d, rng, words = snap
    proc = state.ai.proc
    _assign(state, load(d, rng=rng))
    for k, v in words.items():
        setattr(proc, k, list(v) if isinstance(v, list) else v)
    proc.blocks = state.ai.blocks
