"""ovl20: the neutral phase (taking neutral cities) and the explorer moves (ai.md §6.10).

Every function works on the side on turn (SCN 0x110 = `state.current`) and its AI block
(DS:40ee = `ai.state.block(state)`).  Army fields are re-read after every call that can move
or free an army (the executor 0a8b:0001, the searches), as the listing re-reads them.

Shared with other phases (ai.md §9): `nearest_foreign_army` 0a3e (ovl22, ovl24, ovl28),
`explore` 0e4b (ovl22, ovl24, ovl28), `neutral_neighbours` 01f6 (ovl22:05ff), `pick_neutral`
0935, `nearest_city` 0981 (ovl22:0c5b), `mark_explore_cities` 02ff (production, ovl25:06d4).

Cross-phase calls go through `importlib.import_module` at call time (hero: ovl28:056d /
063c; move: ovl22:15c3 and ovl34:0000 on the current selection; clean_city: ovl24:023f;
diplomacy: ovl18:0851; evaluate: ovl21:0b95).

DS:40c0 (source city of the last neutral chain) and DS:07c6 (its last target) are written by
06c7 and kept across calls, turns and sides (they are not saved): `state.ai.neutral_source` /
`neutral_last` (model.ai.AiProcess; DS:07c6 is initialised data, 0xffff in the EXE image, file
offset 0x2000 + 0x31250 + 0x7c6; DS:40c0 reads 0).
"""
from __future__ import annotations

import importlib

from ...model.ids import HERO_TYPE, MAP_H, MAP_OWNER_MASK, MAP_W, NO_OWNER, ROAD_PIECE_MASK, ROAD_SEEN, Terrain
from ...rules import movement as M
from ...rules import pathfinding as P
from ...rules.bonuses import s8
from ...rules.constants import movement as KM
from ...rules.economy import s16
from ...rules.heroes import turn
from ...rules.selection import select_army_stack
from .. import util as U
from ..state import block

STACK = 8                                    # list[8] of army indices
NB_SLOTS = 6                                 # neighbour slots per city (DS:40ea)
NB_DIST_OFF = 600                            # NB[600 + c*6 + i]: distance byte (ovl20:02b6 +0x258)
NB_NEAR_SLOTS, NB_NEAR_DIST = 2, 20          # ovl20:02a3 cmp dx, 2 / 02b6 cmp 0x14 (jae)
SENT_MAX = 3                                 # ovl20:096a / 079b: signed byte < 3
NO_CITY = 0xFF                               # 0935 / 01f6 empty id
PASSES = 10                                  # ovl20:00ad
ROLE_NEW, ROLE_EXPLORE, ROLE_EXPAND, ROLE_BUILD_UP, ROLE_INTERIOR = 1, 2, 3, 4, 5   # ai.md §3.2
EARLY_TURNS = 5                              # ovl20:017d cmp ax, 5 (jg)
FLY_ONLY_TURNS = 10                          # ovl20:0199 cmp ax, 0xa (jle)
ARMY_NEAR, ARMY_CLOSE = 15, 5                # ovl20:040d / 041b (keep rules), 0b84 / 0b92
CLOSE_KEEP = 2                               # ovl20:0420
MEM_ROW_CITY_WIPED = 5                       # AI[+0x40c] = memory row (0x40c - 0x3bc) / 0x10
MEM_KEEP_MAX = 2                             # ovl20:0452 / 0bc9
PER_GROUP_NEUTRAL, PER_GROUP = 8, 1          # ovl20:0402 / 0407
CHAIN_P0, CHAIN_BEST0 = 100, 1000            # ovl20:06cf / 0745
CHAIN_ODDS = 75                              # ovl20:07dc
CHAIN_ROLL = (1, 10, 0)                      # ovl20:07e2
CHAIN_FAR = ((40, 10), (50, 30))             # ovl20:0807 / 0816: unsigned byte d > 40: +10, > 50: +30
CHAIN_SENT_W = 10                            # ovl20:0801
CHAIN_STOP_NEAR = 10                         # ovl20:0929
ORDER_FLAG_RETARGET = 0x80                   # army +0xc: move #1 runs ovl22:05ff (ai.md A.1)
FLAG_EXPLORER, FLAG_DONE = 0x20, 0x40        # army +0xc
FLAG_ABOARD = 0x1000
KIND_CITY, KIND_KEEP = 1, 4                  # ovl29:0ae7 kinds
NEAREST_ARMY0, NEAREST_CITY0 = 1000, 10000   # ovl20:0a46 / 0989
EXPLORE_STEP = 5                             # ovl20:0e98: steps = moves / 5 + 1
EXPLORE_MIN_MOVES, EXPLORE_GO_ON = 2, 4      # ovl20:0f37 / 0f0d
ATTACK_RANGE = 2                             # ovl20:1158 cmp ax, 2 (jg)
NEED_HIGH, NEED_LOW, NEED_EARLY = 75, 50, 40 # ovl20:127d / 124b / 1278
WEAK_STRENGTH = 3                            # ovl20:1228 cmp byte +8, 3 (jg)
NEUTRAL_SHARE = 10                           # ovl20:123e count / 10
EARLY_CAP = 10                               # ovl20:125a
FLAGGED_ROLL = (1, 10, 0)                    # ovl20:171c
FLAGGED0 = 10000                             # ovl20:1684
WINDOW = 5                                   # ovl20:1822: x in [a.x - 5, a.x + 4]
BOAT_ROLL = (1, 4, -1)                       # ovl20:182f
FRONTIER_ROLL = (1, 10, 0)                   # ovl20:1b2c
NEAR_CITY = 4                                # ovl20:1c23 cmp [bp-6], 4 (jge)
MODE_FLY = 2                                 # DS:5dfc
MASK_HILLS = 1                               # DS:5dfa bit 0
FLY_DIST = 2                                 # ovl20:1bed
MIN_UNSEEN = 2                               # ovl20:1a8f
B_BOAT_WATER, B_LAND, B_ROAD = 200, 100, 200 # ovl20:1b01 / 1ae5
BOAT_HOME_CAP, BOAT_HOME_W = 50, 10          # ovl20:1b5c / 1b6a
WET = (Terrain.WATER, Terrain.SHORE)         # ovl20:1aca / 1acf
SITE_KIND_TEMPLE, SITE_KIND_ALLIES = 1, 5


def _phase(name: str):
    return importlib.import_module("warlords2.ai.phases." + name)


def _src(state) -> int:
    """DS:40c0."""
    return state.ai.neutral_source


def _last(state) -> int:
    """DS:07c6."""
    return state.ai.neutral_last


def _cur(state) -> int:
    return state.current


def _terrain(state, x: int, y: int) -> int:
    return int(state.world.terrain(x, y))


def _intact(state, c: int) -> bool:
    """terrain(city corner) == 10: 2c04:0710[map byte of (c.x, c.y)] (e.g. ovl20:0285)."""
    city = state.cities[c]
    return _terrain(state, city.x, city.y) == Terrain.CITY


def _dist(x1, y1, x2, y2) -> int:
    return P.distance((x1, y1), (x2, y2))


def _seen(state, x: int, y: int) -> int:
    """19d9:[y*0x70 + x] >> 5 & 1."""
    return state.world.roads[y * MAP_W + x] & ROAD_SEEN


def _on_map(x: int, y: int) -> bool:
    return 0 <= x < MAP_W and 0 <= y < MAP_H


def _flies(state, a) -> int:
    """DS:45c4 + 6 * type (type byte sign-extended): low byte of w16."""
    return M.type_flag(state, s8(a.type_id), "flag16")


def _w13(state, a) -> int:
    """DS:45c8 + 6 * type: low byte of w13."""
    return M.type_flag(state, s8(a.type_id), "special")


def _owner_is_cur_byte(state, a) -> bool:
    return (a.owner & 0xFF) == (state.current & 0xFF)


def _city_xy(state, c: int) -> tuple[int, int]:
    """x / y words of city record c (2c04:157d + 0x41 c).  Record -1 lies in the relation
    matrix: x = word 2c04:153c, y = word 2c04:153e (ai.md §10.2)."""
    if 0 <= c < len(state.cities):
        return state.cities[c].x, state.cities[c].y
    if c == -1:
        r = state.relations[0]
        return s16((r[1] & 0xFF) | (r[2] & 0xFF) << 8), s16((r[3] & 0xFF) | (r[4] & 0xFF) << 8)
    raise RuntimeError("city record %d beyond the live table" % c)


# ------------------------------------------------------------------------------- the phase


def neutral(state) -> list:
    """ovl20:0000: sent[c] = number of own armies (owner cwde == SCN 0x110) with order kind 1
    and order index < count (unsigned), records SCN 0x181 - 1 .. 0 (byte counters); then
    passes 0..9 of 00b5 until one returns 0.
    Evidence: asm ovl20:0000..00b4 (0007..0015 sent[99..0] = 0, 001c..0094 scan: 002d owner
    cwde, 0049 +0xe & 0xf == 1, 0060..0071 (+0xf >> 1) & 0x7f jae 0x157b, 008c inc byte;
    0096..00b0 si = 0..9, 00a8 je)."""
    sent = [0] * 100
    p = state.current
    for a in U._scan(state):
        if s8(a.owner) != p or a.order & 0x0F != KIND_CITY:
            continue
        k = a.vector_dest & 0x7F
        if k < len(state.cities):
            sent[k] = (sent[k] + 1) & 0xFF
    events: list = []
    for pass_ in range(PASSES):
        n, ev = neutral_pass(state, pass_, sent)
        events += ev
        if n == 0:
            break
    return events


def neutral_pass(state, pass_: int, sent) -> tuple[int, list]:
    """ovl20:00b5(pass, sent): for own cities c = count-1..0 (owner cwde == SCN 0x110): with
    pass != 0 only role 1 (taken in the previous pass); role 1 -> clean city ovl24:023f(c, 1)
    and role 3; no neutral neighbour (01f6 == 0): role 3 or 2 -> 4, then skipped unless Quick
    Start is off, role 5 and max(turn, 1) <= 5; n += 1; 03aa(c, sent) != 0 -> explorers
    0b19(c, max(turn, 1) > 10) and role 2; else role 4 when 0935(c, sent) == 0xff, else 3.
    Returns (n, events).
    Evidence: asm ovl20:00b5..01f5 (00c4 loop, 00d6..00e6 owner cwde, 00eb..00fe pass / role 1,
    0101..0124 023f(c, 1), role 3, 012f 01f6(c, ids, null), 0139..0159 role 3 / 2 -> 4,
    0163 SCN 0x128, 0171 role 5, 0178..0180 ovl61:225b jg 5, 0182 n += 1, 018a 03aa,
    0194..01b5 0b19 / role 2, 01c3 0935, 01c9..01e1 roles)."""
    b = block(state)
    p = state.current
    n = 0
    events: list = []
    for c in range(len(state.cities) - 1, -1, -1):
        if s8(state.cities[c].owner) != p:
            continue
        if pass_ != 0 and b.role[c] != ROLE_NEW:
            continue
        if b.role[c] == ROLE_NEW:
            events += list(_phase("clean_city").clean_city(state, c, 1) or [])
            b.role[c] = ROLE_EXPAND
        if neutral_neighbours(state, c)[0] == 0:
            if b.role[c] in (ROLE_EXPAND, ROLE_EXPLORE):
                b.role[c] = ROLE_BUILD_UP
            if state.options.quick_start or b.role[c] != ROLE_INTERIOR or turn(state) > EARLY_TURNS:
                continue
        n += 1
        r, ev = send_group(state, c, sent)
        events += ev
        if r:
            events += send_explorers(state, c, int(turn(state) > FLY_ONLY_TURNS))
            b.role[c] = ROLE_EXPLORE
        elif pick_neutral(state, c, sent) == NO_CITY:
            b.role[c] = ROLE_BUILD_UP
        else:
            b.role[c] = ROLE_EXPAND
    return n, events


def neutral_neighbours(state, c: int) -> tuple[int, list[int], list[int]]:
    """ovl20:01f6(c, ids, dists): for i = 0..5: ids[i] = 0xff, dists[i] = 0; the neighbour
    t = NB[c*6+i] (byte) is kept when t != 0xff, t != AI[+0x46] (word compare), terrain at its
    corner == 10, owner byte == 0x0f, and (none kept yet, or i < 2, or the NB distance byte
    < 20 unsigned); kept: ids[i] = t, dists[i] = NB[600+c*6+i].  Returns (kept, ids, dists).
    Evidence: asm ovl20:01f6..02fe (0202..021e clear, 0222..023c NB id, 0243 +0x46, 0256..0285
    terrain, 0297 owner 0xf, 029f..02bc di / i < 2 / jae 0x14, 02be..02ec writes, 02ef inc)."""
    nb = state.ai.neighbours
    qc = s16(block(state).quest_city)
    ids, dists = [NO_CITY] * NB_SLOTS, [0] * NB_SLOTS
    kept = 0
    for i in range(NB_SLOTS):
        t = nb.ids[c * NB_SLOTS + i] & 0xFF
        if t == NO_CITY or qc == t:
            continue
        if not _intact(state, t) or (state.cities[t].owner & 0xFF) != NO_OWNER:
            continue
        d = nb.dists[c * NB_SLOTS + i] & 0xFF
        if kept and i >= NB_NEAR_SLOTS and d >= NB_NEAR_DIST:
            continue
        ids[i], dists[i] = t, d
        kept += 1
    return kept, ids, dists


def mark_explore_cities(state) -> None:
    """ovl20:02ff (from production, Hidden Map only): every own city (owner byte) with role 3
    whose 01f6 neighbours (ids) include no neutral (owner byte 0x0f) city with AI flag bit 0
    clear gets role 2; a city with no 01f6 neighbour at all is left.  Cities count-1..0.
    Evidence: asm ovl20:02ff..03a9 (030c loop, 031e owner byte, 0335 role 3, 0346 01f6 == 0 ->
    next, 0350..038b slots 5..0: 0xff, 036d owner 0xf, 037b bit 0, 038d..0397 role 2)."""
    b = block(state)
    for c in range(len(state.cities) - 1, -1, -1):
        if not _owner_is_cur_byte(state, state.cities[c]) or b.role[c] != ROLE_EXPAND:
            continue
        n, ids, _ = neutral_neighbours(state, c)
        if n == 0:
            continue
        open_ = 0
        for i in range(NB_SLOTS - 1, -1, -1):
            t = ids[i]
            if t == NO_CITY:
                continue
            if (state.cities[t].owner & 0xFF) == NO_OWNER and not b.city_flags[t] & 1:
                open_ = 1
        if not open_:
            b.role[c] = ROLE_EXPLORE


def _keep(state, th: int) -> int:
    """03aa / 0b19: (th < 15) + (2 if th < 5) + (AI[+0x48] != 0) + min(sum of AI[+0x40c + 2p],
    p = 7..0 (signed words), 2)."""
    b = block(state)
    k = (1 if th < ARMY_NEAR else 0) + (CLOSE_KEEP if th < ARMY_CLOSE else 0)
    if b.no_quick_attack:
        k += 1
    m = 0
    for p in range(7, -1, -1):
        m = s16(m + s16(b.memory[MEM_ROW_CITY_WIPED][p]))
    return k + (m if m <= MEM_KEEP_MAX else MEM_KEEP_MAX)


def _sort_allowance(state, g: list) -> list:
    """03aa 056e..05fb / 0b19 0d0d..0d9a: repeatedly the slot (7..0) with the largest allowance
    (+6, signed byte) strictly above the best so far (from 0): the highest slot wins ties, an
    army with allowance <= 0 is never taken."""
    g = list(g)
    out = []
    while True:
        si, best = -1, 0
        for k in range(STACK - 1, -1, -1):
            if g[k] == -1:
                continue
            v = s8(state.armies[g[k]].allowance)
            if v > best:
                si, best = k, v
        if si == -1:
            return out
        out.append(g[si])
        g[si] = -1


def send_group(state, c: int, sent) -> tuple[int, list]:
    """ovl20:03aa(c, sent): send groups from city c on neutral chains.  th = 0a3e(c.x, c.y,
    -1); keep = `_keep`; ret = Hidden Map != 0; per = 8 with Neutral Cities (SCN 0x11a) != 0,
    else 1.  G = own armies (owner byte) exactly on (c.x, c.y) with sub 0, not done (0x40),
    order kind 0, records SCN 0x181-1..0, the first `keep` skipped, at most 8; none -> 0.
    Sorted by allowance (`_sort_allowance`); then repeatedly the next `per` of them form a
    group (none left -> return ret); with keep == 0 and Hidden Map a 0a3e(c, -1) < 15 stops
    (return ret); 06c7(c, len, sent, group, &ret).  Returns (ret, events).
    Evidence: asm ovl20:03aa..06c6 (03b2..03d9 0a3e, 03e3 0x124, 03fa 0x11a, 040d..0434 keep,
    0435..045e memory row +0x40c, 0463..0488 lists, 0491..0562 scan (04ad owner byte, 04c1
    sub, 04dd 0x40, 04f0 kind, 0506..053c x / y, 053e keep, 0556 8), 0565..056b none -> 0,
    056e..05fb sort, 05fe..065d group, 065f none -> ret, 0663..06a1 keep == 0 / 0x124 / 0a3e
    < 15, 06a3..06bd 06c7)."""
    city = state.cities[c]
    th = nearest_foreign_army(state, city.x, city.y, -1)
    ret = [1 if state.options.hidden_map else 0]
    per = PER_GROUP_NEUTRAL if state.options.neutral_cities else PER_GROUP
    keep = _keep(state, th)
    skip = keep
    g = []
    for a in U._scan(state):
        if not _owner_is_cur_byte(state, a) or (a.order >> 4) & 7 or a.flags & FLAG_DONE:
            continue
        if a.order & 0x0F or a.x != city.x or a.y != city.y:
            continue
        if skip:
            skip -= 1
            continue
        g.append(a.id)
        if len(g) >= STACK:
            break
    if not g:
        return 0, []
    order = _sort_allowance(state, g + [-1] * (STACK - len(g)))
    events: list = []
    while True:
        group, order = order[:per], order[per:]
        if not group:
            return ret[0], events
        if keep == 0 and state.options.hidden_map:
            if nearest_foreign_army(state, city.x, city.y, -1) < ARMY_NEAR:
                return ret[0], events
        events += neutral_chain(state, c, len(group), sent, group + [-1] * (STACK - len(group)), ret)
        # 06c7 writes into G; 05fe..0618 resets it before the next group


def neutral_chain(state, src: int, n: int, sent, group: list, ret: list) -> list:
    """ovl20:06c7(src, n, sent, group, &ret): a chain of neutral captures by `group` (list[8],
    changed in place), starting at city src; `ret` is a one-element list (the caller's word,
    written 0 for every unflagged candidate).  p = 100 once (not reset per candidate or per
    link); from = src.  Each link: entries whose owner (cwde) is not SCN 0x110 become -1; with
    Neutral Cities (SCN 0x11a) on 14d3(group) (a member killed in an earlier link leaves its
    slot null in DS:5e3e, rules.movement.select_list; the next 15c5's set-up copies the null
    slot, plan register X38); 01f6(from) == 0 -> return; candidates i = 5..0
    (t = ids[i] != 0xff, AI flag bit 0 clear): ret = 0; skip when sent[t] >= 3 (signed byte);
    with Neutral Cities p = 15c5(t.x, t.y); p >= 75 (signed): s = rnd(1,10,0) + d_i (unsigned
    byte) + 10 sent[t] + (10 if d_i > 40) + (30 if d_i > 50) + 100 - p, best when s < bs
    (signed strict, from 1000; slots scanned 5..0, so the highest slot wins ties).  No best: with
    Hidden Map, DS:40c0 == src and DS:07c6 != -1: 0ae7(group, 1, DS:07c6, 0x80) (no move);
    return.  Else sent[best] += n (byte), DS:07c6 = best, DS:40c0 = src, 0ae7(group, 1, best,
    0x80), 0a8b:0001(leader goto, 0); stop unless owner(best) (cwde) == SCN 0x110 and AI[+0x48]
    == 0; from = best; stop when 0a3e(best, -1) < 10.
    Evidence: asm ovl20:06c7..0934 (06cf p = 100, 06d4 from, 06da..0727 drop, 072e..073f 14d3,
    0742..0762 01f6, 0765..0845 loop: 0773 0xff, 0782 bit 0, 0790 *ret = 0, 079b jl 3, 07a9..07d9
    15c5, 07dc jl 0x4b, 07e7 rnd, 07ef..082b s, 082d jge, 0848..0887 none, 088a..089a sent,
    08a3..08aa DS:07c6 / 40c0, 08b7 0ae7, 08cd 0001, 08df..08ef owner cwde, 08f5 +0x48, 08fc
    from, 0923..092e 0a3e < 10)."""
    b = block(state)
    p = CHAIN_P0
    frm = src
    events: list = []
    neutral = bool(state.options.neutral_cities)
    while True:
        for k in range(STACK - 1, -1, -1):
            if group[k] != -1 and s8(state.armies[group[k]].owner) != state.current:
                group[k] = -1
        if neutral:
            U.select_list(state, group)
        best, bs = -1, CHAIN_BEST0
        cnt, ids, dists = neutral_neighbours(state, frm)
        if cnt == 0:
            return events
        for i in range(NB_SLOTS - 1, -1, -1):
            t = ids[i]
            if t == NO_CITY or b.city_flags[t] & 1:
                continue
            ret[0] = 0
            if s8(sent[t]) >= SENT_MAX:
                continue
            if neutral:
                p = U.win_odds(state, state.cities[t].x, state.cities[t].y)
            if p < CHAIN_ODDS:
                continue
            d = dists[i] & 0xFF
            s = state.rng.rnd(*CHAIN_ROLL) + d + s8(sent[t]) * CHAIN_SENT_W
            for lim, add in CHAIN_FAR:
                if d > lim:
                    s += add
            s += CHAIN_P0 - p
            s = s16(s)
            if s < bs:
                bs, best = s, t
        if best == -1:
            if state.options.hidden_map and _src(state) == src and _last(state) != -1:
                U.order_stack(state, group, KIND_CITY, _last(state), ORDER_FLAG_RETARGET)
            return events
        sent[best] = (sent[best] + n) & 0xFF
        state.ai.neutral_last = best
        state.ai.neutral_source = src
        U.order_stack(state, group, KIND_CITY, best, ORDER_FLAG_RETARGET)
        events += _move_leader(state)
        if s8(state.cities[best].owner) != state.current or b.no_quick_attack:
            return events
        frm = best
        bc = state.cities[best]
        if nearest_foreign_army(state, bc.x, bc.y, -1) < CHAIN_STOP_NEAR:
            return events


def _move_leader(state) -> list:
    """0a8b:0001(DS:5e62 +0x12, +0x14, 0): the executor with the leader's goto."""
    lead = M._record(state, state.selection.selected)
    if lead is None:
        return []
    return M.execute_move(state, lead.goto[0], lead.goto[1], 0)[1]


def _move_leader_status(state) -> tuple[int, list]:
    lead = M._record(state, state.selection.selected)
    if lead is None:
        return 0, []
    return M.execute_move(state, lead.goto[0], lead.goto[1], 0)


def pick_neutral(state, c: int, sent) -> int:
    """ovl20:0935(c, sent): 01f6(c) == 0 -> 0xff; else the first neighbour id in slots 5..0
    (not 0xff) with sent[id] < 3 (signed byte); none -> 0xff.
    Evidence: asm ovl20:0935..0980 (094a 01f6, 0950 je, 0954..0979 si = 5..0, 0960 0xff,
    096a cmp byte 3 jge, 0970 return id, 097b 0xff)."""
    n, ids, _ = neutral_neighbours(state, c)
    if n == 0:
        return NO_CITY
    for i in range(NB_SLOTS - 1, -1, -1):
        t = ids[i]
        if t != NO_CITY and s8(sent[t]) < SENT_MAX:
            return t
    return NO_CITY


def nearest_city(state, x: int, y: int, side: int) -> int:
    """ovl20:0981(x, y, side): the smallest dist (0a8b:0acc) from (x, y) to an intact city
    (terrain 10 at its corner) whose owner byte (cwde) == side, any owner for side == -1;
    cities count-1..0, strict <, start 10000.  Returns the distance.
    Evidence: asm ovl20:0981..0a3d (0989 0x2710, 0993 loop, 09d4 terrain 0xa, 09dc..09f5 side /
    cwde, 0a1b dist, 0a25 jge)."""
    best = NEAREST_CITY0
    for c in range(len(state.cities) - 1, -1, -1):
        if not _intact(state, c):
            continue
        city = state.cities[c]
        if side != -1 and s8(city.owner) != side:
            continue
        d = _dist(x, y, city.x, city.y)
        if d < best:
            best = d
    return best


def nearest_foreign_army(state, x: int, y: int, side: int) -> int:
    """ovl20:0a3e(x, y, side): the smallest dist (start 1000, strict <) from (x, y) to an army
    record i = SCN 0x181-1..0 whose owner byte != 0x0f and, for side == -1, owner byte != SCN
    0x110 (byte), else owner (cwde) == side; under Hidden Map only when ovl29:16ae(a.x, a.y).
    No x != -1 test: a freed record (owner 0xff, x = y = -1) counts for side == -1 as an army
    at (-1, -1) (third review).
    Evidence: asm ovl20:0a3e..0b18 (0a46 0x3e8, 0a4e loop, 0a60 owner 0xf, 0a7e / 0a8e x / y,
    0a96..0acc side, 0ad3..0aeb 0x124 / 16ae, 0af9 dist, 0b03 jge)."""
    best = NEAREST_ARMY0
    cur = state.current & 0xFF
    for a in U._scan(state):
        o = a.owner & 0xFF
        if o == NO_OWNER:
            continue
        if side == -1:
            if o == cur:
                continue
        elif s8(o) != side:
            continue
        if state.options.hidden_map and not U.seen_near(state, a.x, a.y):
            continue
        d = _dist(x, y, a.x, a.y)
        if d < best:
            best = d
    return best


def send_explorers(state, c: int, fly_only: int) -> list:
    """ovl20:0b19(c, fly_only): explorers from city c.  th = 0a3e(c.x, c.y, -1), keep as in
    03aa; tf = any task force k = 3..0 active (AI[+0x24c + 0x5c k] != 0).  E = own armies
    (owner byte) exactly on (c.x, c.y), sub 0, not done (0x40), not a hero when tf, order kind
    0, flyers only (DS:45c4) with fly_only; the first `keep` skipped; at most 8; sorted by
    allowance as in 03aa.  For each army a in that order: with keep == 0 and Hidden Map a
    0a3e(c, -1) < 15 stops; 0e4b(a, c).
    Evidence: asm ovl20:0b19..0e4a (0b4c 0a3e, 0b5b..0b82 tf, 0b84..0bd7 keep, 0bda lists,
    0c06..0d01 scan: 0c22 owner byte, 0c36 sub, 0c52 0x40, 0c68..0c74 hero / tf, 0c83 kind,
    0c8f..0caf fly_only, 0cbb..0cd7 x / y, 0cd9 keep, 0cf4 8; 0d04 none; 0d0d..0d9a sort,
    0d9d..0def next, 0df9..0e36 keep / 0x124 / 0a3e < 15, 0e3e 0e4b)."""
    city = state.cities[c]
    b = block(state)
    th = nearest_foreign_army(state, city.x, city.y, -1)
    tf = 0
    for k in range(3, -1, -1):
        if b.task_forces[k].age != 0:
            tf = 1
    keep = _keep(state, th)
    skip = keep
    e = []
    for a in U._scan(state):
        if not _owner_is_cur_byte(state, a) or (a.order >> 4) & 7 or a.flags & FLAG_DONE:
            continue
        if (a.type_id & 0xFF) == HERO_TYPE and tf:
            continue
        if a.order & 0x0F:
            continue
        if fly_only and not _flies(state, a):
            continue
        if a.x != city.x or a.y != city.y:
            continue
        if skip:
            skip -= 1
            continue
        e.append(a.id)
        if len(e) >= STACK:
            break
    if not e:
        return []
    events: list = []
    for i in _sort_allowance(state, e + [-1] * (STACK - len(e))):
        if keep == 0 and state.options.hidden_map:
            if nearest_foreign_army(state, city.x, city.y, -1) < ARMY_NEAR:
                return events
        events += explore(state, i, c)
    return events


# ------------------------------------------------------------------------------- exploring


def explore(state, i: int, c: int) -> list:
    """ovl20:0e4b(i, c): army i explores alone.  0ae7([i], 4, 0, 0x20) (order kind 4, flag
    0x20 explorer); steps = moves_left (signed byte) idiv 5 + 1; while moves_left >= 2: (x0, y0)
    = its square; 0f46(i, c); stop when the square is unchanged, moves_left < 4, steps == 0 or
    flag 0x20 is clear; steps -= 1.
    Evidence: asm ovl20:0e4b..0f45 (0e56..0e70 list, 0e80 0ae7(list, 4, 0, 0x200000 -> flags
    0x20), 0e92..0e9f steps, 0ea4..0ecc x0 / y0, 0ed5 0f46, 0edb..0f01 unchanged, 0f0d jl 4,
    0f15 di, 0f23 0x20, 0f2c dec, 0f37 jl 2)."""
    U.order_stack(state, [i] + [-1] * (STACK - 1), KIND_KEEP, 0, FLAG_EXPLORER)
    a = state.armies[i]
    m = s8(a.moves_left)
    steps = int(m / EXPLORE_STEP) + 1
    events: list = []
    while s8(state.armies[i].moves_left) >= EXPLORE_MIN_MOVES:
        a = state.armies[i]
        x0, y0 = a.x, a.y
        events += explore_step(state, i, c)
        a = state.armies[i]
        if a.x == x0 and a.y == y0:
            break
        if s8(a.moves_left) < EXPLORE_GO_ON or steps == 0 or not a.flags & FLAG_EXPLORER:
            break
        steps -= 1
    return events


def explore_step(state, i: int, c: int) -> list:
    """ovl20:0f46(i, c): one exploring move.  found = 177f(i, &x, &y, &kind, &kx, &ky); found:
    kind 1 -> 10a8(i, kx, ky), kind 2 -> 12eb(i, kx, ky), each ending the step when it returns
    non-zero; else (and kind 0) 1581(i, x, y).  Not found: a flyer with 164e(i, &x, &y) ->
    1581(i, x, y); else c != -1 and t = 0935(c, zeros) != 0xff -> 1581(i, t.x, t.y); else the
    army's order is cleared (+0xe &= 0xf0, +0xf &= 1), flag 0x20 cleared, goto (-1, -1), +0x11 = 0.
    Evidence: asm ovl20:0f46..10a7 (0f6d 177f, 0f73 found, 0f77..0fb2 kinds, 0fbe 1581,
    0fc7..0ff8 flies / 164e, 0ffa..1044 zeros / 0935 / city x, y, 1047..109e clear)."""
    events: list = []
    found, x, y, kind, kx, ky = frontier(state, i)
    if found:
        if kind == 1:
            r, ev = explore_attack(state, i, kx, ky)
            events += ev
            if r:
                return events
        elif kind == 2:
            r, ev = explore_site(state, i, kx, ky)
            events += ev
            if r:
                return events
        elif kind != 0:
            return events
        return events + explore_move(state, i, x, y)
    a = state.armies[i]
    if _flies(state, a):
        ok, fx, fy = flagged_city(state, i)
        if ok:
            return events + explore_move(state, i, fx, fy)
    if c != -1:
        t = pick_neutral(state, c, [0] * 100)
        if t != NO_CITY:
            return events + explore_move(state, i, state.cities[t].x, state.cities[t].y)
    a.order &= 0xF0
    a.vector_dest = 0
    a.flags &= ~FLAG_EXPLORER & 0xFFFF
    a.goto = (-1, -1)
    a.group = 0
    return events


def explore_attack(state, i: int, x: int, y: int) -> tuple[int, list]:
    """ovl20:10a8(i, x, y): attack a city met while exploring.  c = the first city in
    count-1..0 that is intact, owner (cwde) != SCN 0x110, != AI[+0x46], dist(c, (x, y)) <= 2,
    ovl18:0851(c) != 0, and whose AI flag bit 0 is clear after `if bit 0: ovl21:0b95(c)`; none
    -> 0.  0ae7([i], 4, 0, 0x20); p = 15c5(c.x, c.y); need = 75, but for a non-hero with
    strength (+8, signed) <= 3: 50 when AI[+0x06] < count idiv 10, else 40 when AI[+0x02] <=
    min(max(turn,1) / 2, 10), else 75.  p < need -> 0.  Else flag 0x20 cleared, 0ae7([i], 1,
    c, 0x80), 0a8b:0001(leader goto, 0), 1.  Returns (result, events).
    Evidence: asm ovl20:10a8..12ea (10ba loop, 10fb terrain, 1110 owner cwde, 1126 +0x46, 1150
    dist jg 2, 115e ovl18:0851, 1173..118e bit 0 / 0b95 / bit 0, 1190 pick, 119f none, 11aa..11d7
    0ae7(4, 0, 0x20), 11ff 15c5, 1215 hero, 1228 jg 3, 1230..1249 +6 vs count / 10, 1250..1276
    turn / 2 (cdq sub sar), min 10, jl +2, 1280 jge, 1288..12b3 list / & 0xffdf, 12c6 0ae7(1,
    c, 0x80), 12dc 0001, 12e4 1)."""
    b = block(state)
    pick = -1
    for c in range(len(state.cities) - 1, -1, -1):
        if not _intact(state, c):
            continue
        city = state.cities[c]
        if s8(city.owner) == state.current or s16(b.quest_city) == c:
            continue
        if _dist(city.x, city.y, x, y) > ATTACK_RANGE:
            continue
        if not _phase("diplomacy").may_attack_city(state, c):
            continue
        if b.city_flags[c] & 1:
            _phase("evaluate").clear_unseen(state, c)
        if b.city_flags[c] & 1:
            continue
        pick = c
        break
    if pick == -1:
        return 0, []
    lst = [i] + [-1] * (STACK - 1)
    U.order_stack(state, lst, KIND_KEEP, 0, FLAG_EXPLORER)
    city = state.cities[pick]
    p = U.win_odds(state, city.x, city.y)
    a = state.armies[i]
    need = NEED_HIGH
    if (a.type_id & 0xFF) != HERO_TYPE and s8(a.strength) <= WEAK_STRENGTH:
        if s16(b.neutral_cities) < int(len(state.cities) / NEUTRAL_SHARE):
            need = NEED_LOW
        else:
            half = int(turn(state) / 2)
            if s16(b.own_cities) <= (half if half <= EARLY_CAP else EARLY_CAP):
                need = NEED_EARLY
    if p < need:
        return 0, []
    a.flags &= ~FLAG_EXPLORER & 0xFFFF
    U.order_stack(state, lst, KIND_CITY, pick, ORDER_FLAG_RETARGET)
    return 1, _move_leader(state)


def explore_site(state, i: int, x: int, y: int) -> tuple[int, list]:
    """ovl20:12eb(i, x, y): visit a site met while exploring.  s, kind = ovl28:056d(x, y);
    0 when s == -1, the army is aboard (0x1000), kind 1 and the army's flags have
    ovl28:063c(s), it is neither a hero nor at a temple, or the owner nibble of (x, y) is
    neither 0x0f nor SCN 0x110.  0ae7([i], 4, 0, 0); leader goto = (x, y); r = 0a8b:0001(x, y,
    0); r == 1 -> 0.  On (x, y): DS:5e62 = the army; a hero searches with ovl22:15c3(i, s),
    another army with ovl34:0000; kind 5 (056d's value): every own army (owner byte) j =
    SCN 0x181-1..0 with order kind 0, w13 type and on (x, y) gets flag 0x20.  Not on it: kind 1
    and aboard -> flags |= 063c(s); flags |= 0x40.  Then flags |= 0x20, +0xe &= 0xf0, +0xf &= 1,
    goto (-1, -1), 1.  Returns (result, events).
    Evidence: asm ovl20:12eb..1580 (1302 056d, 130d / 131d, 132b..1349 063c, 1355..1361,
    1375..138c owner nibble, 138e..13ba 0ae7(4, 0, 0), 13bd..13c8 goto, 13d6 0001, 13de == 1,
    13f0..1409 position, 140b..1446 not there, 145d..1463 DS:5e62, 1470..1486 15c3 / ovl34:0000,
    148b kind 5, 1499..151d scan, 152d..157a tail)."""
    hero_mod = _phase("hero")
    s, kind = hero_mod.site_at(state, x, y)
    a = state.armies[i]
    if s == -1 or a.flags & FLAG_ABOARD:
        return 0, []
    if kind == SITE_KIND_TEMPLE and a.flags & (hero_mod.blessing_flag(state, s) & 0xFFFF):
        return 0, []
    if (a.type_id & 0xFF) != HERO_TYPE and kind != SITE_KIND_TEMPLE:
        return 0, []
    o = state.world.flags[y * MAP_W + x] & MAP_OWNER_MASK
    if o != NO_OWNER and o != state.current:
        return 0, []
    U.order_stack(state, [i] + [-1] * (STACK - 1), KIND_KEEP, 0, 0)
    lead = state.armies[state.selection.selected]
    lead.goto = (x, y)
    r, events = M.execute_move(state, x, y, 0)
    if r == 1:
        return 0, events
    a = state.armies[i]
    if a.x == x and a.y == y:
        state.selection.selected = i
        if (a.type_id & 0xFF) == HERO_TYPE:
            events += list(_phase("move").search_on_arrival(state, i, s) or [])
        else:
            events += list(_phase("move").search_command(state) or [])
        if kind == SITE_KIND_ALLIES:
            for b in U._scan(state):
                if (_owner_is_cur_byte(state, b) and not b.order & 0x0F and _w13(state, b)
                        and b.x == x and b.y == y):
                    b.flags |= FLAG_EXPLORER
    else:
        if kind == SITE_KIND_TEMPLE and a.flags & FLAG_ABOARD:
            a.flags = (a.flags | hero_mod.blessing_flag(state, s)) & 0xFFFF
        a.flags |= FLAG_DONE
    a = state.armies[i]
    a.flags |= FLAG_EXPLORER
    a.order &= 0xF0
    a.vector_dest = 0
    a.goto = (-1, -1)
    return 1, events


def explore_move(state, i: int, x: int, y: int) -> list:
    """ovl20:1581(i, x, y): goto = (x, y); ovl67:06eb(army) selects the army and the own armies
    on its square with the same non-zero +0x11 (rules.selection.select_army_stack); an explorer
    has +0x11 = 0 (0ae7 with one entry gives group id 0, and 1581's own tail writes 0), so it
    is selected alone, and 0529 copies its goto to itself; r = 0a8b:0001(leader goto, 0); r ==
    1 -> flag 0x20 cleared, +0xe &= 0xf0, +0xf &= 1; then flags |= 0x40, goto (-1, -1), +0x11
    = 0 on army i.
    Evidence: asm ovl20:1581..164d (1595 / 15a4 goto, 15bb ovl67:06eb, 15c5..15d1 0001 with
    DS:5e62's goto, 15d9 == 1, 15e8..1602 clear, 1612 0x40, 1625 / 1636 goto, 1645 +0x11)."""
    a = state.armies[i]
    a.goto = (x, y)
    events = list(select_army_stack(state, a) or [])
    r, ev = _move_leader_status(state)
    events += ev
    a = state.armies[i]
    if r == 1:
        a.flags &= ~FLAG_EXPLORER & 0xFFFF
        a.order &= 0xF0
        a.vector_dest = 0
    a.flags |= FLAG_DONE
    a.goto = (-1, -1)
    a.group = 0
    return events


def flagged_city(state, i: int) -> tuple[int, int, int]:
    """ovl20:164e(i, &x, &y): over cities c = count-1..0 that are intact and carry AI flag bit
    0 (any owner): v = dist(c, army) + rnd(1,10,0) (one draw per such city, after the dist);
    the smallest, strict < from 10000 (the highest index wins ties); returns (1, c.x - 1,
    c.y - 1), or (0, -, -) when none.
    Evidence: asm ovl20:164e..177e (1666..1681 army x / y, 1684 0x2710, 1693 loop, 16d4
    terrain, 16e2..16ec bit 0, 1712 dist, 1721 rnd, 172b jge, 1740..1778 x - 1 / y - 1)."""
    a = state.armies[i]
    ax, ay = a.x, a.y
    b = block(state)
    best, pick = FLAGGED0, -1
    for c in range(len(state.cities) - 1, -1, -1):
        if not _intact(state, c) or not b.city_flags[c] & 1:
            continue
        city = state.cities[c]
        v = _dist(city.x, city.y, ax, ay) + state.rng.rnd(*FLAGGED_ROLL)
        if v < best:
            best, pick = v, c
    if pick == -1:
        return 0, -1, -1
    city = state.cities[pick]
    return 1, city.x - 1, city.y - 1


def frontier(state, i: int) -> tuple[int, int, int, int, int, int]:
    """ovl20:177f(i, &x, &y, &kind, &kx, &ky): the unexplored square to head for, in the 10x10
    window x = a.x-5 .. a.x+4 (outer), y = a.y-5 .. a.y+4 (inner).  home = city a.+9 (signed;
    record -1 = relation bytes); boat = aboard (0x1000); kind = 0; rnd(1,4,-1) first, always:
    0 and a on a City square that is coastal (0555:109d) and no hero -> boat = 1.  Per square
    on the map: a City square with owner nibble != SCN 0x110 -> 1bab; terrain 11 -> 1c9d; a
    City square is skipped; without DS:5dfc == 2, a Hills square without road and without
    DS:5dfa bit 0 is skipped; a seen square is skipped; without DS:5dfc == 2, terrain cost
    (DS:1274) 0 is skipped; u = unseen squares of its 3x3 on the map (itself included), u < 2
    skipped; b: boat -> 200 on Water / Shore, else 0; not boat -> 0 on Water / Shore, else 100
    unless Hills, + 200 with a road piece; d1 = dist(sq, a), d2 = dist(sq, home), then
    rnd(1,10,0); s = r + 2 d1 + d2 + 10 u + b, + 10 min(d2, 50) when boat and b != 0; best
    when s > best (signed, from 0; the first in scan order wins ties).  Returns (found, x, y,
    kind, kx, ky); x / y / kx / ky are -1 where 177f leaves its outputs unwritten.
    Evidence: asm ovl20:177f..1baa (17a0..17fc a / home, 17ff best, 180f aboard, 1822 5, 182a
    kind, 1837 rnd(1,4,-1), 1843..1891 boat, 1896..1b9f loops, 18a8..18c4 map, 18e6..1926 city /
    owner / 1bab, 194b / 1966 1c9d, 198b city skip, 1996..19e4 5dfc / road / 5dfa / hills,
    19e7..1a02 seen, 1a05..1a3c cost, 1a3f..1a95 u, 1a98..1b01 b, 1b0e / 1b21 dists, 1b31 rnd,
    1b39..1b6d s, 1b6f jge, 1b74..1b83 best)."""
    a = state.armies[i]
    ax, ay = a.x, a.y
    hx, hy = _city_xy(state, s8(a.home_city))
    aboard = 1 if a.flags & FLAG_ABOARD else 0
    boat = aboard
    out = {"kind": 0, "kx": -1, "ky": -1}
    best, found, fx, fy = 0, 0, -1, -1
    if state.rng.rnd(*BOAT_ROLL) == 0:
        if (_on_map(ax, ay) and _terrain(state, ax, ay) == Terrain.CITY and P.coastal(state, ax, ay)
                and (a.type_id & 0xFF) != HERO_TYPE):
            boat = 1
    sel = state.selection
    w = state.world
    for x in range(ax - WINDOW, ax + WINDOW):
        for y in range(ay - WINDOW, ay + WINDOW):
            if not _on_map(x, y):
                continue
            t = _terrain(state, x, y)
            if t == Terrain.CITY and (w.flags[y * MAP_W + x] & MAP_OWNER_MASK) != state.current:
                frontier_city(state, i, x, y, out)
            if t == Terrain.SITE:
                frontier_site(state, i, x, y, out)
            if t == Terrain.CITY:
                continue
            road = w.roads[y * MAP_W + x] & ROAD_PIECE_MASK
            if sel.mode != MODE_FLY and not road and not sel.mask & MASK_HILLS and t == Terrain.HILLS:
                continue
            if _seen(state, x, y):
                continue
            if sel.mode != MODE_FLY and KM.TERRAIN_COST.value[t] == 0:
                continue
            u = 0
            for xx in range(x - 1, x + 2):
                for yy in range(y - 1, y + 2):
                    if _on_map(xx, yy) and not _seen(state, xx, yy):
                        u += 1
            if u < MIN_UNSEEN:
                continue
            bonus = 0
            if boat:
                if t in WET:
                    bonus += B_BOAT_WATER
            elif t not in WET:
                if t != Terrain.HILLS:
                    bonus += B_LAND
                if road:
                    bonus += B_ROAD
            d1 = _dist(x, y, ax, ay)
            d2 = _dist(x, y, hx, hy)
            s = state.rng.rnd(*FRONTIER_ROLL) + 2 * d1 + d2 + 10 * u + bonus
            if boat and bonus:
                s += 10 * (d2 if d2 <= BOAT_HOME_CAP else BOAT_HOME_CAP)
            s = s16(s)
            if best < s:
                best, fx, fy, found = s, x, y, 1
    return found, fx, fy, out["kind"], out["kx"], out["ky"]


def frontier_city(state, i: int, x: int, y: int, out: dict) -> None:
    """ovl20:1bab(i, x, y, &kind, &kx, &ky): a foreign City square met by 177f.  d = 2 with
    DS:5dfc == 2, else dist(army, (x, y)); d >= 4 -> nothing; aboard and not 0555:109d(x, y)
    -> nothing; else for every seen square of the 3x3 around (x, y) on the map kind = 1,
    (kx, ky) = (x, y) (overwrites an earlier kind 1 or 2).
    Evidence: asm ovl20:1bab..1c9c (1be6..1c02 d, 1c10 aboard, 1c23 jge 4, 1c29..1c3b 109d,
    1c3d..1c97 3x3: 1c66 seen, 1c75..1c86 writes)."""
    a = state.armies[i]
    d = FLY_DIST if state.selection.mode == MODE_FLY else _dist(a.x, a.y, x, y)
    if d >= NEAR_CITY:
        return
    if a.flags & FLAG_ABOARD and not P.coastal(state, x, y):
        return
    for xx in range(x - 1, x + 2):
        for yy in range(y - 1, y + 2):
            if _on_map(xx, yy) and _seen(state, xx, yy):
                out["kind"], out["kx"], out["ky"] = 1, x, y


def frontier_site(state, i: int, x: int, y: int, out: dict) -> None:
    """ovl20:1c9d(i, x, y, &kind, &kx, &ky): a site square (terrain 11) met by 177f: only while
    kind == 0 and the army is not aboard, a seen square in the 3x3 around it gives kind = 2,
    (kx, ky) = (x, y).
    Evidence: asm ovl20:1c9d..1d37 (1cb6 aboard, 1cc9 kind == 0, 1cd2 aboard, 1cd8..1d32 3x3,
    1d01 seen, 1d10..1d21 writes)."""
    a = state.armies[i]
    if out["kind"] != 0 or a.flags & FLAG_ABOARD:
        return
    for xx in range(x - 1, x + 2):
        for yy in range(y - 1, y + 2):
            if _on_map(xx, yy) and _seen(state, xx, yy):
                out["kind"], out["kx"], out["ky"] = 2, x, y
