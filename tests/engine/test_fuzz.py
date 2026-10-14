"""Engine fuzz (from the engine review): random Move / Attack on shipped scenarios, with the
army-table, map-bit and serialisation invariants after every command, twice per run for
determinism.  Reduced to a few scenarios and steps so it stays well under 30 s."""
import collections
import logging
import random

import pytest

from warlords2.model import commands as C
from warlords2.model.ids import MAP_W, Control, Terrain
from warlords2.model.newgame import NewGameConfig
from warlords2.model.options import GameOptions
from warlords2.model.serialize import dump, load
from warlords2.rules import engine
from warlords2.rules import movement as M
from warlords2.rules import pathfinding as P
from warlords2.rules import setup as S
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.engine import IllegalCommand, NotImplementedCommand
from warlords2.rules.mapwords import refresh_map

from movekit import _inputs

OPTS = [GameOptions(), GameOptions(neutral_cities=1, diplomacy=1, quests=1, quick_start=1),
        GameOptions(neutral_cities=2, hidden_map=1, random_turns=1, intense_combat=1)]
FREE = 0xFF


def build(game, name, seed, opts):
    sc, at, kw = _inputs(game, name)
    cfg = NewGameConfig(name, (Control.HUMAN,) + (Control.COMPUTER,) * 7, (1,) * 8, (0,) * 8,
                        (0,) * 8, None, opts, 0, seed)
    return S.new_game(sc, cfg, list(at), **kw)


def invariants(st, where):
    errs = []
    if [a.id for a in st.armies] != list(range(len(st.armies))):
        errs.append("index != id")
    sq = collections.Counter((a.x, a.y) for a in st.armies if a.y >= 0 and a.owner != FREE)
    errs += ["square %r holds %d" % (k, n) for k, n in sq.items() if n > 8]
    errs += ["gold < 0 p%d" % p.index for p in st.players if p.gold < 0]
    for a in st.armies:
        if (a.owner == FREE) != (a.type_id == FREE) or (a.owner == FREE and a.y >= 0):
            errs.append("free record %r" % a)
        if a.y >= 0 and not st.world.flags[a.y * MAP_W + a.x] & 0x10:
            errs.append("army %d without map bit" % a.id)
    d = dump(st)
    if dump(load(d)) != d:
        errs.append("round trip differs")
    return ["%s: %s" % (where, e) for e in errs]


def random_cmd(st, r):
    by = collections.defaultdict(list)
    for a in st.armies:
        if a.owner == st.current and a.y >= 0:
            by[(a.x, a.y)].append(a.id)
    if not by:
        return None
    pos = r.choice(sorted(by))
    ids = by[pos]
    grp = tuple(r.sample(ids, r.randint(1, len(ids))))
    if r.random() < 0.35:
        cand = []
        for dx in (-1, 0, 1):
            for dy in (-1, 0, 1):
                x, y = pos[0] + dx, pos[1] + dy
                if (dx or dy) and 0 <= x < 112 and 0 <= y < 156:
                    f = st.world.flags[y * MAP_W + x]
                    if f & 0xF != st.current and (f & 0x10 or st.world.terrain(x, y) == Terrain.CITY):
                        cand.append((x, y))
        if cand:
            return C.Attack(grp, *r.choice(cand))
    foreign = [(c.x, c.y) for c in st.cities if c.owner != st.current]
    if foreign and r.random() < 0.5:                 # head for the nearest foreign city
        return C.Move(grp, min(foreign, key=lambda c: P.distance(pos, c)))
    return C.Move(grp, (max(0, min(111, pos[0] + r.randint(-25, 25))),
                        max(0, min(155, pos[1] + r.randint(-25, 25)))))


def play(game, name, seed, opts, steps):
    with allowing_unverified():
        st = build(game, name, seed, opts)
        r = random.Random(seed * 7919 + 1)
        alive = [p.index for p in st.players if p.alive]
        refresh_map(st)                           # first main-loop pass (ovl61:2183 / 2194)
        P.rebuild_cost_map(st)
        errs, counts = invariants(st, "%s/%d start" % (name, seed)), collections.Counter()
        for k in range(steps):
            st.pending = None
            if k % 15 == 0:                       # next side; the main-loop pass rebuilds (ovl61)
                st.current = alive[(alive.index(st.current) + 1) % len(alive)] if st.current in alive else alive[0]
                refresh_map(st)                   # ovl61:2183
                P.rebuild_cost_map(st)            # ovl61:2194
                M.refresh_moves(st, st.current)
            cmd = random_cmd(st, r)
            if cmd is None:
                continue
            try:
                engine.apply(st, cmd)
                counts[type(cmd).__name__] += 1
            except NotImplementedCommand:
                counts["notimpl"] += 1
            except IllegalCommand:
                counts["illegal"] += 1
            errs += invariants(st, "%s/%d step %d %s" % (name, seed, k, type(cmd).__name__))
            if errs:
                break
    return st, errs, counts


@pytest.mark.parametrize("name,seed", [("DRAGON", 1), ("ISLADIA", 5), ("TUTORIA", 9)])
def test_fuzz(game, name, seed):
    logging.disable(logging.WARNING)
    try:
        st, errs, counts = play(game, name, seed, OPTS[seed % 3], 120)
        st2, _, _ = play(game, name, seed, OPTS[seed % 3], 120)
    finally:
        logging.disable(logging.NOTSET)
    assert errs == []
    assert counts["Move"] + counts["Attack"] > 0
    assert st.hash() == st2.hash()
