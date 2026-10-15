"""rules.pathfinding._Search.flood (0555:0373) is written for speed; `_plain_flood` below is the
plain version it replaced, line for line from the listing.  Both must give the same distance
fields, CX / radius registers, paths, path cache, cost maps, map flags and neighbour tables
(ovl29:0398, the heaviest user: one or two distance maps per city at new game)."""
import random

import pytest

from warlords2.ai import tables as AT
from warlords2.model.options import GameOptions
from warlords2.model.serialize import dump, load
from warlords2.rules import pathfinding as P
from warlords2.rules.constants import movement as K

from movekit import scenario_state

pytestmark = pytest.mark.gamedata

W, H = P.W, P.H
MODES = ((0, 0), (1, 0), (1, 3), (1, 8), (2, 0))


def _plain_flood(self, pass_no: int) -> int:
    """0555:0373 as it was written before the fast version (the reference)."""
    sx, sy = self.src
    dx, dy = self.dst
    dmap = bool(self.mask & K.MASK_DISTANCE_MAP.value)
    if dmap:
        margin = self.limit
        self.radius = 0
    else:
        margin = K.PASS_MARGIN.value[pass_no]
        if pass_no == 0:
            self.radius = 0
    self.cx = dy
    xlo, xhi = max(min(dx, sx) - margin, 0), min(max(dx, sx) + margin, W - 1)
    ylo, yhi = max(min(dy, sy) - margin, 0), min(max(dy, sy) + margin, H - 1)
    dist, cm, mode, mask = self.dist, self.cm, self.mode, self.mask
    blocked = K.BLOCKED.value
    water, cross = K.CM_WATER.value, K.CM_CROSSING.value
    going, result = True, 1
    while going:
        if dmap and self.radius == margin:
            return result
        r = self.radius
        expanded = False
        for x in range(max(dx - r, 0, xlo), min(dx + r, W - 1, xhi) + 1):
            for y in range(max(dy - r, 0, ylo), min(dy + r, H - 1, yhi) + 1):
                i = y * W + x
                v = dist[i]
                if v >= 1:
                    continue
                expanded = True
                d = -v
                dist[i] = d
                b1 = cm[i]
                for nx, ny in P._neighbours(x, y):
                    j = ny * W + nx
                    if dist[j] == blocked:
                        continue
                    b2 = cm[j]
                    c = b2 & K.CM_COST.value
                    self.cx = c
                    if (nx, ny) == (sx, sy):
                        if (mode == K.MODE_LAND.value and not b1 & cross and not b2 & cross
                                and (b2 & water) != (b1 & water)):
                            continue
                        c = 1
                    elif mode == K.MODE_FLY.value:
                        if b2 & water and not b2 & cross:
                            c = K.FLY_COST.value
                        else:
                            c = c if (c or 2) <= 2 and c else K.FLY_COST.value
                    elif mode == K.MODE_SHIP.value:
                        if not b2 & water and not b2 & K.CM_CITY.value:
                            dist[j] = blocked
                            continue
                    else:
                        if not b1 & cross and not b2 & cross and (b2 & water) != (b1 & water):
                            continue
                        if mask and c > 2 and ((mask & K.MASK_HILLS.value and b2 & K.CM_HILLS.value)
                                               or (mask & K.MASK_WOODS.value and b2 & K.CM_WOODS.value)):
                            c = K.BONUS_COST.value
                        if (not b1 & water or b1 & cross) and b2 & water and not b2 & cross:
                            c += self.penalty
                    self.cx = c
                    if abs(dist[j]) > d + c:
                        dist[j] = -d - c
                if (x, y) == (sx, sy) and not dmap:
                    going = False
        self.radius += 1
        if not expanded:
            going, result = False, 0
    return result


FAST = P._Search.flood


@pytest.fixture
def plain(monkeypatch):
    """Run the block with the reference flood."""
    def use(on: bool):
        monkeypatch.setattr(P._Search, "flood", _plain_flood if on else FAST)
    return use


def test_neighbour_table_matches_the_plain_flood(game, plain):
    """The table ovl29:0398 makes (with the cost map and map flags it leaves) on ERYTHEA,
    ISLADIA and TUTORIA, with and without Hidden Map: identical with either flood."""
    for name in ("ERYTHEA", "ISLADIA", "TUTORIA"):
        for opts in (GameOptions(), GameOptions(hidden_map=1)):
            st = scenario_state(game, name, options=opts)
            out = []
            for on in (True, False):
                s = load(dump(st))
                plain(on)
                AT.build_neighbours(s)
                out.append((s.ai.neighbours, s.cost_map, s.world.flags))
            assert out[0] == out[1], (name, opts.hidden_map)


def test_distance_maps_and_registers_match_the_plain_flood(game, plain):
    """Distance maps 0555:1ab9 from random squares, modes 0 / 1 / 2 with masks 0 / 3 / 8:
    same fields, and the same CX / radius left behind."""
    st = scenario_state(game, "ERYTHEA")
    R = random.Random(5)
    pts = [(R.randrange(W), R.randrange(H)) for _ in range(6)]
    for (x, y) in pts:
        for mode, mask in MODES:
            got = []
            for on in (True, False):
                plain(on)
                dm = P.distance_map(st, 15, x, y, mode, mask)
                got.append(dm.field)
            assert got[0] == got[1], ((x, y), mode, mask)
    for (x, y) in pts[:3]:
        regs = []
        for on in (True, False):
            plain(on)
            s = P._Search(st, (x, y), (x, y), 1, K.MASK_DISTANCE_MAP.value, limit=15)
            s.dist[y * W + x] = K.START_MARK.value
            r = s.flood(0)
            s.restore()
            regs.append((r, s.cx, s.radius, s.dist))
        assert regs[0] == regs[1]


def test_find_path_and_cache_match_the_plain_flood(game, plain):
    """find_path (0555:000a, both passes, backtrace) and the path cache it fills."""
    st = scenario_state(game, "ERYTHEA")
    R = random.Random(9)
    qs = [((R.randrange(W), R.randrange(H)), (R.randrange(W), R.randrange(H)), R.choice(MODES))
          for _ in range(40)]
    out = []
    for on in (True, False):
        plain(on)
        s = load(dump(st))
        P.rebuild_cost_map(s)
        P.clear_cache(s)
        out.append([P.find_path(s, a, b, m, k) for a, b, (m, k) in qs] + [s.path_cache])
    assert out[0] == out[1]
    assert sum(1 for p in out[0][:-1] if p) > 5
