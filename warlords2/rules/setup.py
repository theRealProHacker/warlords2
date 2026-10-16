"""New game: scenario image + setup choices -> GameState, and the Difficulty Rating.

The sequence of the original, EL = docs/research/exe_logic.md §9:

1. scenario load ovl57:0194: SCN image verbatim (EL §7); city runtime bytes reset
   (ovl29:0000); ovl63:232b's 256 rnd(1,3,1) draws (overview mountain colours); inactive sides renamed, level 3 (§9.1);
2. Begin ovl57:0cfe: side words, options (§6.9), AI parameter blocks ovl25:0519 (via the
   `ai_setup` hook, `ai.cards.setup_all`), turn order ovl61:1732 and first side ovl61:17f6 (§9.1);
3. new game ovl53:0000 (§9.2): word resets; sites and items ovl35:0000 (§5.5, §9.3); army
   table cleared; cities ovl53:07ca (§9.4); explored map ovl64:113b, AI territories
   ovl30:0000 (first the AI neighbour table ovl29:0398, hook `ai_neighbours`), garrisons
   ovl39:00cc (§9.5); view words; map bit clears; infamy (§6.6);
   relations ovl00:11bd (§9.6); ovl13:0103 (ovl53:026c) copies DS:5da0's .SGN over CURRENT.SGN.

`loaded_state` is step 1 (the memory after the loader: a random map's RMAPTEMP snapshot, the
state a Setup screen shows), `begin` steps 2-3 on such a memory (also Load Map's), `new_game`
both in a row with the Setup screen's dice replayed between them.

Not modelled, because they hold no engine state: ovl48:0000 (per-type flag table derived
from ARMYTYPE; read through `rules.movement.type_flag`), ovl63:2200 (fog drawing), ovl68:0952
(shield strip).  Left out as unknown [U]: the 9x9 tables of ovl64:1931 / DS:5ed4.
The map owner nibble and army bit are not written here; ovl62:0000 rebuilds them at the
top of every main-loop pass (§9.2): the turn sequence calls `rules.mapwords.refresh_map` and
then `rules.pathfinding.rebuild_cost_map` (ovl61:2183 / 2194) before the first command.
"""
from __future__ import annotations

import importlib
import logging
from math import isqrt

from ..model.army import ArmyType
from ..model.city import City, Slot
from ..model.hero import HeroSlot
from ..model.ids import (EMPTY_SLOT, HERO_TYPE, LEVEL_OFF, MAP_ARMY, MAP_EXPLORED, MAP_FORTIFIED,
                         MAP_H, MAP_W, N_HERO_SLOTS, N_ITEMS, N_PLAYERS, NEUTRAL_OWNER, NO_OWNER,
                         ROAD_STANDARD, Control, ItemState, ItemType, SiteKind, Terrain)
from ..model.item import Item
from ..model.options import SCN_WORD, GameOptions
from ..model.player import Player
from ..model.site import Site
from ..model.state import (SCN_ARMY_HIGH, SCN_CURRENT_PLAYER, SCN_HUMAN_INFAMY, SCN_ROUND_COMPLETE,
                           SCN_TURN_ORDER, SCN_TURN_POS, GameState, Monster)
from ..model.world import Sign, World
from .constants import setup as K
from .movement import FREE, alloc_army, type_flag
from .pathfinding import cost_map
from .rng import Rng

SCN_OPTIONS_ZEROED = 0x130          # EL §6.9: zeroed at ovl57:0e34 (0ea7)
SCN_RANDOM_FLAG = 0x120             # ovl57:007f: = DS:28c8 at every ovl57:0000 entry
SCN_WORD_10F3 = 0x10F3              # 2c04:10f3[p], meaning [U]; writers: EL §9.5 ovl30:0000 (-1),
                                    # asm ovl61:1f54 (surrender declined: the side on turn)
PLAYER_REC = 0x183                  # player record base in the SCN (scenario.md), stride 0x14
PLAYER_REC_LEN = 0x14

log = logging.getLogger(__name__)

# name -> (milestone, "module:function", what it must do, EXE address); rules code does not
# import the AI package, it resolves these by name (as rules.turn / rules.combat do).
HOOKS = {
    "ai_setup": ("M8b1", "warlords2.ai.cards:setup_all",
                 "f(state, cards) -> None: the eight AI blocks at Begin (ovl21:084d / 0d7b, rnd; "
                 "cards(level, number) -> the .CRD bytes)", "ovl25:0519 at ovl57:0eae"),
    "ai_neighbours": ("M8b1", "warlords2.ai.tables:build_neighbours",
                      "f(state) -> None: the AI neighbour table, with the cost map for side 0 "
                      "(no rnd)", "ovl29:0398 at ovl29:012b (ovl30:0000 -> ovl29:010b)"),
}


def _hook(name):
    milestone, target, _, _ = HOOKS[name]
    mod, fn = target.split(":")
    try:
        module = importlib.import_module(mod)
    except ModuleNotFoundError as e:
        if not (e.name and mod.startswith(e.name)):
            raise
        return None
    return getattr(module, fn, None)


def _rec(p: int, off: int) -> int:
    return PLAYER_REC + PLAYER_REC_LEN * p + off


def unused_side_name(exe: bytes) -> str:
    """The name the loader gives a side that does not take part, read from WARLORD2.EXE.
    Evidence: EL §9.1 ovl57:0194 (DS:256f)."""
    o = K.DGROUP_FILE_OFFSET.value + K.UNUSED_NAME_DS.value
    return exe[o:exe.index(b"\0", o)].decode("cp437")


def _header_flags(scn: dict) -> dict[int, int]:
    """SCN header words not modelled elsewhere, keyed by SCN offset (scenario.md)."""
    f: dict[int, int] = {}
    for p, pl in enumerate(scn["players"]):
        f[0xA0 + 2 * p] = pl["w_a0"]
        f[0xB0 + 2 * p] = pl["w_b0"]
        f[0x100 + p] = pl["b_100"]            # bytes
        f[0x108 + p] = pl["b_108"]
        f[SCN_TURN_ORDER + 2 * p] = pl["turn_order"]
        f[_rec(p, 0)] = pl["id"]
        f[_rec(p, 4)] = pl["gold"] >> 16      # parse_scn joins +2/+4; gold is the word at +2
        tail = bytes.fromhex(pl["rec_tail_hex"])
        for i in range(0, 10, 2):
            f[_rec(p, 10 + i)] = tail[i] | tail[i + 1] << 8
    g = scn["globals"]
    for i, w in enumerate(g["words_110_to_132"]):
        f[0x110 + 2 * i] = w
    f[0x134] = g["byte_134"]                  # byte
    for i, w in enumerate(g["words_157_to_161"]):
        f[0x157 + 2 * i] = w
    for i, w in enumerate(g["words_173_to_181"]):
        f[0x173 + 2 * i] = w
    return f


def _city(c: dict) -> City:
    """City record after the load reset ovl29:0000 (EL §9.1): +0x2c..+0x40 = 0, +0x2f = +0x15.
    Every slot keeps the file's five bytes (+0x16 / +0x1a / +0x1e / +0x22 / +0x26 + slot): the
    new game rewrites only the statistics of filled slots (EL §9.4), so an empty slot keeps the
    file's time byte, which ovl44:00ff reads (`rules.city.choose_production` with type -1)."""
    raw = c.get("slot_bytes")
    if raw is not None:
        slots = [Slot(EMPTY_SLOT if b[0] == 0xFF else b[0], *b[1:]) for b in raw]
    else:
        slots = [Slot() for _ in range(4)]
        for s in c["production"]:
            slots[s["slot"]] = Slot(s["army_id"], s["turns"], s["strength"], s["moves"], s["cost"])
    return City(c["index"], c["x"], c["y"], c["name"], owner=c["owner"], owner2=c["owner"],
                defence=c["level_14"], slots=slots, income=c["income"], current=0, turns_left=0,
                attacked_by=0, vectoring=0, vector_to=(0, 0), tail=[0] * 11)


def distance(x1: int, y1: int, x2: int, y2: int) -> int:
    """trunc(sqrt(dx^2 + dy^2)) = integer square root.
    Evidence: EL §9.7 0a8b:0acc -> 1012:1199 (0000:1a6a sqrt, 0000:1b57 chop)."""
    return isqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)


def _special(item_type: int, value: int) -> bool:
    """ovl35:08f4 (EL §9.3)."""
    return (item_type in (ItemType.DOUBLE_MOVE, ItemType.FLIGHT, ItemType.STANDARD)
            or (item_type == ItemType.COMMAND and value >= 2))


def _pick(rng: Rng, n: int, ok, what: str) -> int:
    """rnd(1, n, -1) until ok(i).  The original loops for ever when nothing qualifies (EL §9.3)."""
    if not any(ok(i) for i in range(n)):
        raise RuntimeError("no %s qualifies; the original would loop for ever here" % what)
    while True:
        i = rng.rnd(1, n, K.SITE_PICK_ROLL_ADD.value)
        if ok(i):
            return i


def _flag_sites(sites: list[Site], quests_on: bool, rng: Rng) -> None:
    """ovl35:091e (EL §9.3)."""
    num, den = K.SITE_FLAG_FRACTION.value
    for s in sites:
        s.flag_1b, s.shown_mask = 0, K.SITE_SHOWN_INIT.value
    for _ in range(len(sites) * num // den):
        i = _pick(rng, len(sites), lambda j: sites[j].kind != SiteKind.TEMPLE and not sites[j].flag_1b,
                  "unflagged non-temple site")
        sites[i].flag_1b = 1
        if quests_on:
            sites[i].shown_mask = 0


def _redraw_items(items: list[Item], itm: list[dict] | None, cap: int, rng: Rng) -> None:
    """ovl35:04ef(cap) (EL §9.3); nothing changes when the .ITM file did not open (ovl35:0529)."""
    if itm is None:
        return
    first = K.FIRST_SCATTERED_ITEM.value
    picked: list[int] = []
    for si in range(first, N_ITEMS):
        want_special = si < cap + first
        a = _pick(rng, len(itm), lambda j: j not in picked
                  and _special(itm[j]["type"], itm[j]["bonus"]) == want_special, ".ITM entry")
        picked.append(a)
        items[si].name, items[si].type, items[si].value = itm[a]["name"], itm[a]["type"], itm[a]["bonus"]


def scatter_sites_and_items(sites: list[Site], items: list[Item], players: list[Player],
                            itm: list[dict] | None, world: World | None, quests_on: bool,
                            rng: Rng) -> tuple[int, int]:
    """ovl35:0000: site flags, item redraw, item placement, site kinds, guardians/allies.
    `itm` is the parsed .ITM list (None: the file did not open).  Returns (total, k).
    Evidence: EL §5.5 and §9.3 ovl35:0000, 091e, 04ef, 08f4."""
    n = len(sites)
    first = K.FIRST_SCATTERED_ITEM.value
    cap = K.SPECIAL_CAP_NUM.value * n // K.SPECIAL_CAP_DEN.value
    _flag_sites(sites, quests_on, rng)
    _redraw_items(items, itm, cap, rng)
    k = min(rng.rnd(*K.SPECIAL_K_ROLL.value), cap)
    used = [s.kind == SiteKind.TEMPLE for s in sites]
    if world is not None:                                   # ovl35:009b
        for s in sites:
            world.flags[s.y * MAP_W + s.x] &= ~MAP_EXPLORED & 0xFF
    total = min(K.ITEM_COUNT_CAP.value,
                n // K.ITEM_COUNT_SITE_DIV.value + rng.rnd(*K.ITEM_COUNT_ROLL.value) + K.ITEM_COUNT_ADD.value)
    for i in range(first, total):
        if i < k + first or i >= cap + first:
            sp = _special(items[i].type, items[i].value)
            j = _pick(rng, n, lambda j, sp=sp: not used[j] and bool(sites[j].flag_1b) == sp,
                      "site for item %d" % i)
            items[i].state, items[i].holder = ItemState.IN_SITE, j
            sites[j].kind, sites[j].item = SiteKind.ITEM_RUIN, i
            used[j] = True
        else:
            items[i].state = ItemState.NOT_IN_PLAY
    for i in range(total, N_ITEMS):                         # ovl35:0265..0282
        items[i].state = ItemState.NOT_IN_PLAY

    near_max = K.CAPITAL_NEAR_MAX.value

    def near_capital(s: Site) -> bool:
        return any(p.alive and distance(p.capital[0], p.capital[1], s.x, s.y) <= near_max for p in players)

    def draw(table) -> int:
        return table[rng.rnd(1, len(table), -1)]

    for i, s in enumerate(sites):
        if used[i]:
            continue
        if s.flag_1b:
            s.kind = draw(K.KINDS_FLAGGED.value)
        elif not near_capital(s):
            s.kind = draw(K.KINDS_NO_CAPITAL.value)
        else:
            s.kind = draw(K.KINDS_NEAR_CAPITAL.value)
        s.item = 0
        used[i] = True
    for s in sites:
        if s.kind == SiteKind.TEMPLE:
            s.guardian_or_ally = 0
        elif s.kind == SiteKind.ALLIES_RUIN:
            if s.flag_1b:
                s.guardian_or_ally = draw(K.ALLY_TYPES_FLAGGED.value)
            elif not near_capital(s):
                s.guardian_or_ally = draw(K.ALLY_TYPES_NO_CAPITAL.value)
            else:
                s.guardian_or_ally = draw(K.ALLY_TYPES_NEAR_CAPITAL.value)
        else:
            s.guardian_or_ally = rng.rnd(*K.GUARDIAN_ROLL.value)
    return total, k


def _set_city_owner(state: GameState, ci: int, owner: int) -> None:
    """City +0x15 and its four tile graphics (ovl39:0000, EL §9.4)."""
    c = state.cities[ci]
    c.owner = owner
    o = -1 if owner == NO_OWNER else owner
    low, split = K.CITY_TILE_BASE_LOW.value
    base = low + 2 * o if o < split else K.CITY_TILE_BASE_HIGH.value + 2 * (o - split)
    w = state.world
    for dx, dy, add in ((0, 0, 0), (1, 0, 1), (0, 1, 0x10), (1, 1, 0x11)):
        w.tiles[(c.y + dy) * MAP_W + c.x + dx] = (base + add) & 0xFF


def _nearest_city(state: GameState, x: int, y: int, ok, reverse: bool) -> int:
    """Nearest city passing ok(c), strict <: first in scan order on ties (ovl62:04fa scans
    forward, ovl29:0a27 backward; EL §9.4, §9.5)."""
    best, idx = K.NEAREST_START.value, -1
    order = range(len(state.cities) - 1, -1, -1) if reverse else range(len(state.cities))
    for i in order:
        c = state.cities[i]
        d = distance(x, y, c.x, c.y)
        if d < best and ok(c):
            best, idx = d, i
    return idx


def _next_side(players: list[Player], q: int, marked) -> int:
    q = (q + 1) % N_PLAYERS
    while not marked(q):
        q = (q + 1) % N_PLAYERS
    return q


def _cities(state: GameState) -> None:
    """ovl53:07ca (EL §9.4): capitals, Quick Start, production slots, defence."""
    players = state.players
    anchor = {p.index: p.capital for p in players}
    last = -1
    for p in reversed(players):
        alive = bool(p.alive)
        state.flags[_rec(p.index, 0x10)], state.flags[_rec(p.index, 0x12)] = (
            p.capital if alive else (0xFFFF, 0xFFFF))
        ci = state.city_at(*p.capital)
        if ci < 0:
            continue
        _set_city_owner(state, ci, p.index if alive else NO_OWNER)
        if alive:
            last = p.index
    if last != -1 and state.options.quick_start:
        unowned = lambda c: c.owner == NO_OWNER                    # noqa: E731
        ci = _nearest_city(state, *anchor[last], unowned, reverse=False)
        while ci >= 0:
            _set_city_owner(state, ci, last)
            r = state.rng.rnd(*K.QUICK_START_ROLL.value)
            c = state.cities[ci]
            anchor[last] = players[last].capital if r <= K.QUICK_START_CAPITAL_MAX.value else (c.x, c.y)
            last = _next_side(players, last, lambda q: players[q].alive)
            ci = _nearest_city(state, *anchor[last], unowned, reverse=False)
    _slot_setup(state)
    for c in state.cities:
        filled = sum(1 for s in c.slots if s.type >= 0)
        c.defence = K.DEFENCE_MANY.value if filled >= K.DEFENCE_MANY_FROM.value else K.DEFENCE_FEW.value


def _slot_setup(state: GameState) -> None:
    """ovl53:0a75 with ovl44:1544 (EL §9.4)."""
    rnd = state.rng.rnd
    for c in state.cities:
        t = [EMPTY_SLOT if s.type == K.NAVY_TYPE.value else s.type for s in c.slots]
        for d in range(4):                            # one pass, type bytes only
            if t[d] == EMPTY_SLOT:
                t[d:3] = t[d + 1:4]
                t[3] = EMPTY_SLOT
        for s, x in zip(c.slots, t):
            s.type = x
    for tid in range(len(state.army_types)):
        a = state.army_type(tid)
        for c in state.cities:
            for s in c.slots:
                if s.type == tid:
                    s.strength, s.time, s.moves, s.cost = a.strength, a.turns, a.moves, a.cost
    for c in state.cities:
        n = 0
        while n < 4 and c.slots[n].type >= 0:
            n += 1
        c.slots[:n] = sorted(c.slots[:n], key=lambda s: abs(state.army_type(s.type).buy_price))
    roll = K.PERTURB_ROLL.value
    s_thr, s_up, s_cap, s_floor = K.PERTURB_STRENGTH.value
    m_thr, m4, m2, m_2, m_floor, m_min = K.PERTURB_MOVES.value
    c_thr, c_down = K.PERTURB_COST.value
    t_thr, t_down, t_floor = K.PERTURB_TIME.value
    for c in state.cities:
        for s in c.slots:
            if s.type < 0:
                break
            if rnd(*roll) < s_thr:
                s.strength = min(s.strength + 1, s_cap) if rnd(*roll) < s_up else max(s.strength - 1, s_floor)
            if rnd(*roll) < m_thr:
                r = rnd(*roll)
                if r < m4:
                    s.moves += 4
                elif r < m2:
                    s.moves += 2
                elif r < m_2:
                    s.moves = max(s.moves - 2, m_floor)
                else:
                    s.moves = max(s.moves - 4, m_floor)
            s.moves = max(s.moves, m_min)
            if rnd(*roll) < c_thr:
                s.cost = s.cost - s.cost // 4 if rnd(*roll) < c_down else s.cost + s.cost // 4
            if rnd(*roll) < t_thr:
                s.time = max(s.time - 1, t_floor) if rnd(*roll) < t_down else s.time + 1


def _explored_map(state: GameState) -> None:
    """ovl64:113b (EL §9.5).  Squares the original writes outside the 112x156 buffer (it does
    not clip) land in other DGROUP data, which is not modelled; they are dropped here."""
    w = state.world
    size = MAP_W * MAP_H
    w.explored = [0 if state.options.hidden_map else 0xFF] * size
    w.roads = [(r | K.ROAD_SEEN_INIT.value) & (~K.ROAD_CLEAR_AT_EXPLORE.value & 0xFF) for r in w.roads]
    lo, hi = K.EXPLORED_RADIUS.value
    for p in range(N_PLAYERS):
        for c in state.cities:
            if c.owner != p:
                continue
            for y in range(c.y + lo, c.y + hi + 1):
                for x in range(c.x + lo, c.x + hi + 1):
                    i = x + MAP_W * y
                    if 0 <= i < size:
                        w.explored[i] |= 1 << p


explored_map = _explored_map        # public name (rules.saveload: the load's ovl64:113b)


def _territories(state: GameState) -> None:
    """ovl30:0000 -> ovl29:010b (EL §9.5): AI territory byte city +0x2f, 0x10f3[p] = -1.
    ovl29:010b starts with ovl29:0398 (call at ovl29:012b), the AI neighbour table (HOOKS
    ai_neighbours, ai.tables.build_neighbours), which sets SCN 0x110 = 0 for its run, builds
    the cost map for side 0 (asm ovl29:03f2..0402) and searches it from every city; that cost
    map is what is left here (ovl61:2194 rebuilds it before the first command)."""
    build = _hook("ai_neighbours")
    if build is None:
        log.warning("AI neighbour table (%s) not available; only the cost map is built",
                    HOOKS["ai_neighbours"][1])
        state.cost_map = cost_map(state, 0)
    else:
        build(state)
    players, rng = state.players, state.rng
    mark = [False] * N_PLAYERS
    anchor = {}
    humans = comps = 0
    for p in reversed(players):
        if not p.alive:
            continue
        if p.control == Control.HUMAN:
            humans += 1
        else:
            mark[p.index] = True
            comps += 1
        anchor[p.index] = p.capital
        ci = state.city_at(*p.capital)
        if ci >= 0:
            state.cities[ci].owner2 = p.index
    if comps == 0 and humans > 0:
        best, br = -1, 0
        for p in reversed(players):
            if p.alive:
                mark[p.index] = True
                r = rng.rnd(*K.TERRITORY_TIE_ROLL.value)
                if best == -1 or r > br:
                    best, br = p.index, r
        mark[best] = False
    if any(mark):
        q = max(i for i in range(N_PLAYERS) if mark[i])
        free = lambda c: (c.owner2 == NO_OWNER                      # noqa: E731
                          and state.world.terrain(c.x, c.y) == Terrain.CITY)
        while True:
            ci = _nearest_city(state, *anchor[q], free, reverse=True)
            if ci < 0:
                break
            c = state.cities[ci]
            c.owner2 = q
            r = rng.rnd(*K.TERRITORY_ANCHOR_ROLL.value)
            anchor[q] = players[q].capital if r <= K.TERRITORY_CAPITAL_MAX.value else (c.x, c.y)
            q = _next_side(players, q, lambda i: mark[i])
    for p in players:
        p.infamy = 0
        state.flags[SCN_WORD_10F3 + 2 * p.index] = K.QUEST_WORD_10F3.value


def _choose_production(state: GameState, c: City, kind: int) -> int:
    """ovl29:103d (EL §9.5): best slot type for this kind, -1 if none scores."""
    A, B, Cc = K.SCORE_A.value, K.SCORE_B.value, K.SCORE_C.value
    enh = K.SCORE_ENHANCED.value if state.players[state.current].enhanced else 0
    best, pick = 0, -1
    for s in reversed(c.slots):
        if s.type < 0:
            continue
        time = s.time
        S = min(s.strength + enh, K.SCORE_STRENGTH_CAP.value)
        if type_flag(state, s.type, "cancel_mode") == 1:             # DS:45c9[6t]
            S += K.SCORE_CANCEL_CITY.value
        if kind != 6 and S < K.SCORE_WEAK.value:
            time += 1
        time = min(time, K.SCORE_TIME_CAP.value)
        if type_flag(state, s.type, "flag16") == 0 and kind == K.SCORE_FLYER_KIND.value:
            continue
        score = (10 - time) * A[kind] + S * B[kind] + int(s.moves * Cc[kind] / 2)
        if score > best:
            best, pick = score, s.type
    return pick


def _garrisons(state: GameState) -> None:
    """ovl39:00cc (EL §9.5): one army per intact city, scanned from the last city down."""
    kinds = K.GARRISON_KINDS.value
    nc = state.options.neutral_cities
    enh_bonus, enh_cap = K.ENHANCED_BONUS.value
    enhanced = state.players[state.current].enhanced
    for ci in range(len(state.cities) - 1, -1, -1):
        c = state.cities[ci]
        if state.world.terrain(c.x, c.y) != Terrain.CITY:
            continue
        pick = -1
        if c.owner != NEUTRAL_OWNER:
            pick = _choose_production(state, c, kinds[K.GARRISON_OWNED_KIND.value])
        elif nc != 0:
            d, sides, add = K.GARRISON_KIND_ROLL.value
            n = min(state.rng.rnd(d, sides, nc + add), 3)
            pick = _choose_production(state, c, kinds[n])
        a = alloc_army(state)                            # 0b62:0309 (never None: <= 100 cities)
        a.x, a.y = c.x, c.y
        if pick < 0:                                     # fallback, also in an owned city
            a.owner, a.type_id, a.strength = NEUTRAL_OWNER, K.FALLBACK_TYPE.value, K.FALLBACK_STRENGTH.value
            continue
        slot = next(s for s in c.slots if s.type == pick)          # ovl44:0000
        a.type_id, a.owner, a.allowance = pick, c.owner, slot.moves  # ovl43:0dd7 (EL §6.3)
        a.strength = min(slot.strength + enh_bonus, enh_cap) if enhanced else slot.strength
        a.home_city, a.upkeep = ci, slot.cost // 2
        a.moves_left = 0                                 # ovl39:0381
        c.current, c.turns_left, c.vectoring = K.NO_PRODUCTION.value, 0, 0
        state.world.flags[c.y * MAP_W + c.x] |= MAP_ARMY


def _turn_order(state: GameState) -> None:
    """ovl61:1732 then ovl61:17f6 at new game (EL §9.1)."""
    order = list(range(N_PLAYERS))
    if state.options.random_turns:
        for _ in range(K.RANDOM_TURN_SWAPS.value):
            a = state.rng.rnd(*K.TURN_SWAP_ROLL.value)
            b = state.rng.rnd(*K.TURN_SWAP_ROLL.value)
            order[a], order[b] = order[b], order[a]
    for i, p in enumerate(order):
        state.flags[SCN_TURN_ORDER + 2 * i] = p
    if state.flags[SCN_ROUND_COMPLETE]:
        raise ValueError("SCN 0x118 set: not a scenario start (EL §9.1)")
    pos = 0
    while True:
        state.current = order[pos]
        pos += 1
        if pos >= N_PLAYERS:
            state.flags[SCN_ROUND_COMPLETE] = 1
        if state.players[state.current].alive:
            break
        if pos >= N_PLAYERS:
            raise ValueError("no live side")
    state.flags[SCN_TURN_POS] = pos


def _check_types(armytypes) -> list:
    types = [t if isinstance(t, ArmyType) else ArmyType.from_record(t) for t in armytypes]
    if sorted(t.type_id for t in types) != list(range(len(types))) or HERO_TYPE >= len(types):
        raise ValueError("army table must hold type ids 0..%d" % HERO_TYPE)
    return types


def _check_cfg(cfg, alive) -> None:
    for name in ("controls", "levels", "cards", "enhanced"):
        if len(getattr(cfg, name)) != N_PLAYERS:
            raise ValueError("NewGameConfig.%s needs %d entries" % (name, N_PLAYERS))
    if not any(a and lv != LEVEL_OFF for a, lv in zip(alive, cfg.levels)):
        raise ValueError("no side plays (ovl57:0cfe returns to the setup screen)")


def _signs(signs) -> list:
    return [s if isinstance(s, Sign) else Sign(s["x"], s["y"], s["line1"], s["line2"]) for s in signs]


def loaded_state(sc: dict, armytypes: list, *, rng, unused_name: str | None = None,
                 hero_names: list | None = None, run=None, signs=None, history=None) -> GameState:
    """The memory after the scenario loader ovl57:0194 (EL §9.1), before the Game Setup screen
    and Begin: the SCN image of `sc` (`formats.scenario.load_scenario`) with the sides that do
    not take part renamed (`unused_name`, DS:256f; None keeps the file's name) and at level 3,
    the map words and road layer of its .MAP / .RD, the overview bitmap: ovl63:232b's 256
    rnd(1, 3, 1) drawn from `rng` (the run's one stream, which the state keeps).
    What the loader does not read stays as the run has it: `run` (`rules.saveload.run_part` of
    the run's last game, None = a fresh run) gives the run memory a Begin keeps
    (`rules.saveload.begin_carry`: the army table, caches, path cache, ...); `signs` is
    CURRENT.SGN as it is on disk (the loader reads no .SGN: ovl57:0194 reads SCN 0285, MAP 0386,
    RD 03fa only), i.e. the run's last game's `world.signs`; `history` is CURRENT.HST as on
    disk (the last game's `history`).  None for either takes the scenario's own .SGN / an empty
    history: a stand-in for a fresh run, whose CURRENT.SGN / .HST are whatever files the game
    directory holds [unverified]; Begin replaces the signs (`begin`: ovl13:0103 copies the
    scenario's .SGN) but not the history: CURRENT.HST is created anew only at turn 2 (ovl41,
    open mode 9; `rules.history` clears `state.history` there), so up to then the History
    menu shows the file as it is ([] here for `new_game`: the pre-M11 stand-in for the
    previous game's file; after Load Map the map file's block, which 0414 wrote to disk).  The explored layer is a zero one (the loader does
    not write it; every path from here resets it before a read: Begin's ovl64:113b at
    ovl53:0135, a load's 0414 at 05d4).  Players: control / level / card / enhanced as the SCN
    words 0xd0 / 0xc0 / 0xe0 / 0xf0 hold them (level 3 for an unused side); options are the
    defaults (the option words are Begin's, ovl57:0e34).  SCN 0x120 is the file's (ovl57:007f
    sets it after the loader returns: `new_game`, `rules.saveload.map_setup_entry`).
    `armytypes`: the run's army table (loaded once per run).  `hero_names`: as `new_game`.
    Evidence: EL §9.1 ovl57:0194 (0285 / 0386 / 03fa reads, 02dd..031a unused sides, ovl29:0000,
    ovl63:232b); asm ovl57:0194..0322 (no .SGN / .HST open), ovl53:0135 / ovl49:05d4 ovl64:113b."""
    scn = sc["scn"]
    if scn["runtime_nonzero"]["223_60b"] or scn["runtime_nonzero"]["101b_157b"]:
        raise ValueError("SCN runtime regions 0x223-0x60a / 0x101b-0x157a are not zero; "
                         "this is a saved game, not a scenario")
    if hero_names is not None and len(hero_names) != N_PLAYERS:
        raise ValueError("hero_names needs %d lists" % N_PLAYERS)
    types = _check_types(armytypes)
    count, roll = K.LOADER_TILE_ROLLS.value
    mountain_rolls = [rng.rnd(*roll) for _ in range(count)]         # ovl63:232b / 2479
    raw = sc["_raw"]
    world = World(tiles=[t & 0xFF for t in raw["tiles"]], flags=[t >> 8 for t in raw["tiles"]],
                  roads=list(raw["roads"]), terrain_of_tile=list(scn["tile_terrain"]),
                  signs=_signs(sc["signs"] if signs is None else signs))
    players = []
    for p, pl in enumerate(scn["players"]):
        alive = int(pl["active"])
        name = pl["name"] if alive or unused_name is None else unused_name
        players.append(Player(
            index=p, name=name, control=int(pl["computer_d0"]),
            level=int(pl["control_c0"]) if alive else LEVEL_OFF,
            card=int(pl["w_e0"]), enhanced=int(pl["w_f0"]), alive=alive,
            gold=pl["gold"] & 0xFFFF, capital=(pl["capital_x"], pl["capital_y"]),
            shown=pl["w_147"]))
    flags = _header_flags(scn)
    state = GameState(
        world=world, players=players, cities=[_city(c) for c in scn["cities"]],
        sites=[Site(s["x"], s["y"], s["name"], s["type"], s["b_19"], s["b_1a"], s["w_1b"], s["w_1d"])
               for s in scn["sites"]],
        items=[Item(i["name"], i["type"], i["bonus"], i["b_16"], i["w_17"], i["w_19"], i["w_1b"])
               for i in scn["item_table"]],
        armies=[], heroes=[HeroSlot() for _ in range(N_HERO_SLOTS)],
        monsters=[Monster(m["name"], m["strength"]) for m in scn["monsters"]],
        army_types=types,
        fight_order=[list(pl["fight_order"]) for pl in scn["players"]] + [list(scn["neutral_fight_order"])],
        options=GameOptions(), turn=scn["globals"]["word_135"], current=flags.pop(SCN_CURRENT_PLAYER),
        relations=[[0] * N_PLAYERS for _ in range(N_PLAYERS)], rng=rng, flags=flags,
        overview_mountain_rolls=mountain_rolls,
        hero_names=[[[int(f), str(n)] for f, n in side] for side in hero_names or []])
    if history is not None:
        state.history = list(history)
    if run is not None:                             # the run's memory (EL §10.7)
        from .saveload import begin_carry
        begin_carry(state, run)
    return state


def begin(state: GameState, cfg, *, itm: list | None, signs=None, cards=None, process=None) -> GameState:
    """Begin (ovl57:0cfe -> ovl25:0519, ovl61:0000, ovl53:0000) on the memory `state` (a
    `loaded_state`, or Load Map's `rules.saveload.load_map` state), in place; returns it.
    Begin never re-reads the scenario: every SCN word it does not write stays as `state` has it
    (SCN 0x120 included: ovl57:007f wrote it at the Setup screen's entry), SCN 0x130 = 0
    (ovl57:0ea7), the overview bitmap stays (Begin runs no ovl63:232b).
    `cfg` (`model.newgame.NewGameConfig`): the Setup screen's choices (names, controls, levels,
    cards, enhanced, greatest, options), written first as the screen wrote them into the SCN.
    Its dice fields (seed, rng, setup_rolls, rng_state) are `new_game`'s: `begin` continues
    `state.rng` as it is and refuses a cfg that would have it replay (rng_state or setup_rolls
    set: ValueError), so a host that rolled the Setup screen's dice live on the stream cannot
    roll them twice.  `itm`: the parsed "%s\\%s.itm" of DS:5da0 then DS:5d78 (record +0x3c, then
    +0x14 "dir") that ovl35:04ef reads (None: the open failed); the host builds that name from
    the record (equal to +0x3c twice for every shipped record and for a random map, whose
    ovl57:11e2..11f6 copies "random" into both).  `signs`: the parsed %s\\%s.SGN of DS:5da0 that ovl13:0103
    (ovl53:026c) copies over CURRENT.SGN (`world.signs`); None: that open failed, CURRENT.SGN
    stays (`state.world.signs`).  After Load Map DS:5da0 is "random", so the signs are
    RANDOM\\RANDOM.SGN as the last generation left it, not the map file's (quirk Q3, register
    X63): the host passes them from its RANDOM overlay.  `cards` / `process`: as `new_game`
    (`process` None: the AI process the state already has attached, e.g. Load Map's).
    `state.history` stays (CURRENT.HST is recreated at turn 2, not at Begin).
    Evidence: EL §9.1 / §9.2; asm ovl57:0cfe..0eda (0d4c..0e1b side words, 0e34..0ea0 options,
    0ea7 SCN 0x130 = 0, 0eae ovl25:0519), ovl53:0000..0290 (026c ovl13:0103, 0271 infamy),
    ovl13:0103..01a0 (open of "%s\\%s.sgn" with DS:5da0, jl 01a0 on failure; copy to
    "current.sgn"), ovl35:04f8..0509 (sprintf "%s\\%s.itm" with DS:5da0, DS:5d78)."""
    if cfg.rng_state is not None or cfg.setup_rolls:
        raise ValueError("begin continues state.rng: the replay of rng_state / setup_rolls is "
                         "new_game's (pass a cfg without them)")
    players, flags, world, rng = state.players, state.flags, state.world, state.rng
    _check_cfg(cfg, [p.alive for p in players])
    # the Setup screen's writes into the SCN (ovl57:0634 .. 0ee8)
    for p, pl in enumerate(players):
        if cfg.names is not None:
            pl.name = cfg.names[p]
        pl.control = int(cfg.controls[p])
        pl.level = int(cfg.levels[p]) if pl.alive else LEVEL_OFF
        pl.card, pl.enhanced = int(cfg.cards[p]), int(cfg.enhanced[p])
    if cfg.greatest is not None:                    # the setup screen's 2c04:0116 (ovl57:0ee8)
        flags[SCN_HUMAN_INFAMY] = cfg.greatest
    state.options = cfg.options

    # Begin, ovl57:0cfe (EL §9.1)
    for p in players:
        if not p.alive:
            p.control, p.level = Control.COMPUTER, 0
        if p.level == LEVEL_OFF:
            p.alive, p.control, p.level = 0, Control.COMPUTER, 0
            ci = state.city_at(*p.capital)
            if ci >= 0:
                state.cities[ci].owner = NO_OWNER                  # byte only, tiles untouched
        if p.control == Control.HUMAN:
            p.level = K.HUMAN_LEVEL.value
    opts: GameOptions = cfg.options                 # EL §6.9 ovl57:0e34
    for off, w in zip(SCN_WORD, opts.to_words()):
        flags[off] = w
    flags[SCN_OPTIONS_ZEROED] = 0                   # ovl57:0ea7
    if process is not None:                         # the run's AI words and heap blocks
        state.ai.attach(process, carry=True)
    if cards is not None:                           # ovl25:0519 at ovl57:0eae
        setup = _hook("ai_setup")
        if setup is None:
            raise RuntimeError("AI set-up %s missing" % HOOKS["ai_setup"][1])
        setup(state, cards)
    _turn_order(state)                              # ovl61:0000 -> 1732, 17f6

    # new game, ovl53:0000 (EL §9.2)
    for off, w in K.NEW_GAME_WORDS.value.items():
        if off == 0x135:
            state.turn = w
        else:
            flags[off] = w
    humans = sum(1 for p in players if p.control == Control.HUMAN)
    shown = 0 if opts.hidden_map and humans >= 1 else 1
    if opts.hidden_map and humans == 1:             # ovl53:006f..007c, else DS:16a6 is kept
        state.reveal_at_first_human_turn = 1
    for p in players:
        p.shown = shown
        if not p.alive:
            p.gold = 0
    scatter_sites_and_items(state.sites, state.items, players, itm, world, bool(opts.quests), rng)
    for a in state.armies:                          # ovl53:00c1..00fe, records 999..0
        a.owner, a.x, a.y = FREE, -1, -1
    sel = state.selection                           # ovl53:0100..0120: the pointers only
    sel.selected, sel.hero, sel.moving = -1, -1, []
    _cities(state)
    _explored_map(state)
    _territories(state)
    _garrisons(state)
    view = state.current
    if opts.hidden_map:
        view = next((p.index for p in players if p.control == Control.HUMAN), view)
    m = K.VIEW_MARGIN.value
    vx = min(max(players[view].capital[0], K.VIEW_X.value[0]), K.VIEW_X.value[1])
    vy = min(max(players[view].capital[1], K.VIEW_Y.value[0]), K.VIEW_Y.value[1])
    flags.update({0x17D: vx, 0x17F: vy, 0x177: vx - m, 0x17B: vx + m, 0x175: vy - m, 0x179: vy + m})
    world.flags = [f & ~MAP_FORTIFIED & 0xFF for f in world.flags]
    world.roads = [r & ~ROAD_STANDARD & 0xFF for r in world.roads]
    if signs is not None:                           # ovl53:026c ovl13:0103 (CURRENT.SGN)
        world.signs = _signs(signs)
    for p in players:                               # EL §6.6 ovl53:0271
        p.infamy = rng.rnd(*K.INFAMY_ROLL.value)
        if flags[SCN_HUMAN_INFAMY] and p.control == Control.HUMAN:
            p.infamy += K.HUMAN_INFAMY_BONUS.value
    v = K.RELATION_DIPLOMACY.value if opts.diplomacy else K.RELATION_NO_DIPLOMACY.value
    keep = K.RELATION_KEEP.value                    # ovl00:11bd (EL §9.6)
    state.relations = [[(b & keep) | v << 2 | v for b in row] for row in state.relations]
    return state


def new_game(sc: dict, cfg, armytypes: list, *, unused_name: str | None = None,
             hero_names: list | None = None, cards=None, process=None, run=None,
             pathfinder=None) -> GameState:
    """A started game from a loaded scenario (`formats.scenario.load_scenario`), the Game
    Setup choices (`model.newgame.NewGameConfig`) and the army table chosen by
    `cfg.army_set` (`formats.tables.parse_armytypes` records or ArmyType): `begin(loaded_state(
    ...))` with the Setup screen's dice replayed in between and SCN 0x120 = `cfg.random_flag`
    (ovl57:007f, DS:28c8).  `unused_name`
    comes from `unused_side_name(exe bytes)`; without it (and without cfg.names) a side that
    does not take part keeps the scenario file's name, which differs from the original's.
    `hero_names` is the eight sides' name lists of the scenario's terrain set, from
    `rules.heroes.load_hero_names(gd, SCN 0x161)` (TERRAIN<0x161>/HERONAM<p>.DAT); it becomes
    `state.hero_names`.  The original reads the side's file each time it draws a hero name
    (ovl47:0c67: FILE.DAT group 20 entry SCN 0x110 formatted with SCN 0x161, read, then
    rnd(1,100,0)), with no die before the read, so caching the files here changes no order;
    without it the table stays empty and a hero offer raises ValueError.
    `cards(level, number) -> bytes` reads a computer side's .CRD file (`ai.cards.card_reader`);
    with it Begin builds the AI blocks where the original does (ovl25:0519, HOOKS ai_setup), so
    its dice (3 per side, 5 more per live computer side, sides 7..0) come in the original order.
    Without it (None) the blocks are left unset (`state.ai.allocated` 0), no dice are drawn
    there, and a computer turn is refused (ai.base.computer_turn).
    `process` is the run's `model.ai.AiProcess` (DS:0832, 0836, 40f2, 40ee and the AI heap
    blocks, which outlive a game in the original); the caller keeps it for the whole run and
    hands it to every new game, which starts its blocks from the previous game's
    (`AiState.attach`).  None: a fresh run.
    The dice (the rule for the normal path): a fresh stream from `cfg.rng_state` (the run's
    one ovl59:02bf stream as the setup screen's loader found it, before ovl63:2479), else from
    `cfg.seed` with `cfg.rng`; the loader's 256 rolls, then `cfg.setup_rolls` (the Setup
    screen's rolls: quotation, Random Characters) replayed, then Begin's.  Load Map has no
    loader before the Setup screen: its host calls `begin` on the loaded state instead, which
    continues the live stream (no replay, no second 256).
    The signs and items Begin reads are the scenario's own (`sc["signs"]`, `sc["items"]`):
    the .sgn is "%s\\%s.sgn" of DS:5da0 twice (ovl13:0103), the .itm "%s\\%s.itm" of DS:5da0
    then DS:5d78 (record +0x3c, +0x14; ovl35:04f8..0509), which `load_scenario(gd, name)`'s
    name twice equals for every shipped record (+0x14 == +0x3c) and for "random".
    `run` is `rules.saveload.run_part` of the run's previous game (None: the first Begin of a
    run, the EXE image's values): the new game keeps that game's run memory as the EXE does
    (`rules.saveload.begin_carry`: path cache, search field, battle arrays, selection words,
    caches, DS:16a6, army type table, report block, the army records but owner / x / y), and
    `run.process` stands in for `process` when that is None.
    `pathfinder` (a `rules.randmap.PathRun`, None: not given): the pathfinder's run memory when
    a random-map generation ran after the run's last game (`rules.randmap.Generated.work.
    pathfinder`): its path cache DS:3f7e and search field DS:3f86 replace `run`'s before Begin,
    as the generator's road searches left them (register X62; the first 0555 call of the new
    game is ovl29:0402, a 0d9e without 0350).
    Evidence: EL §9 (set-up sequence), §5.2, §5.5, §6.6, §6.9, §7, §10.7; asm ovl57:007f;
    0555:0da6..0dae (0350 only at the allocation and in the load ovl29:0e51)."""
    from dataclasses import replace
    _check_cfg(cfg, [p["active"] for p in sc["scn"]["players"]])
    rng = Rng(cfg.seed, cfg.rng) if cfg.rng_state is None else Rng.from_state(cfg.rng_state)
    state = loaded_state(sc, armytypes, rng=rng, unused_name=unused_name, hero_names=hero_names,
                         run=run)
    if pathfinder is not None:                      # the generator's road searches (X62)
        state.path_cache, state.dist_table = pathfinder.path_cache, list(pathfinder.dist_table)
    for r in cfg.setup_rolls:                       # the setup screen's rolls (ovl57:0fe8, 20af)
        rng.rnd(*r)
    state.flags[SCN_RANDOM_FLAG] = int(cfg.random_flag)   # ovl57:007f = DS:28c8
    if process is None and run is not None:
        process = run.process
    return begin(state, replace(cfg, rng_state=None, setup_rolls=()), itm=sc["items"],
                 signs=sc["signs"], cards=cards, process=process)


def difficulty_rating(options: GameOptions, levels) -> int:
    """Difficulty Rating % of the setup screen.  `levels` has one entry per side: the level
    0..2 for a living computer side, LEVEL_OFF (3) for every other side.
    Evidence: EL §6.9 ovl57:0bab (sums over sides with 0x137 != 0, 0x0D0 == 1, 0x0C0 != 3)."""
    w = K.DIFF_OPTION_WEIGHTS.value
    o = options
    opt = (w[0] * o.neutral_cities + w[1] * o.diplomacy + w[2] * o.quests + w[3] * o.hidden_map
           + w[4] * o.view_enemies + w[5] * o.view_production)
    opt = min(opt, K.DIFF_OPTION_CAP.value)
    used = [lv for lv in levels if lv != LEVEL_OFF]
    full = K.DIFF_AI_FULL.value
    ai = full if not used else sum(lv + 1 for lv in used) * full // (3 * len(used))
    if ai >= K.DIFF_AI_ROUND_FROM.value:
        ai = full
    return ai + opt
