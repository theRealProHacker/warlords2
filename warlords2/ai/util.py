"""ovl29: the shared AI utilities (ai.md §5), and ovl21:0a85 (shared by ovl19, ovl22, ovl29).

Every function works on the side on turn (SCN 0x110 = `state.current`) and its block
(DS:40ee = `ai.state.block(state)`).  The city / army record writes are the AI's own: ovl29
writes the records directly (no ovl44 dialog checks), so the writes are made here as the
listing makes them, with the engine's representation (`model.city.City`, `model.army.Army`).

The distance table T that ovl21:0a85 and ovl29:1885 read is the field the last 0555:000a
search left in DS:3f86 (`state.dist_table`: the last on-map 1ab9 or path search); the
engine's `rules.pathfinding.distance_map` returns it, also for a centre off the map, and the
callers here pass that result on (`dm`).
"""
from __future__ import annotations

from ..model.city import Slot
from ..model.ids import (HERO_TYPE, MAP_H, MAP_W, N_SLOTS, NO_OWNER, ROAD_SEEN, Control, Relation,
                         Terrain)
from ..model.state import SCN_ARMY_HIGH
from ..rules import movement as M
from ..rules import pathfinding as P
from ..rules.bonuses import s8
from ..rules.city import defence_of, slot_of
from ..rules.combat import simulate_selection
from ..rules.diplomacy import current as relation
from ..rules.economy import add_gold, s16
from ..rules.engine import IllegalCommand
from ..rules.heroes import turn
from ..rules.selection import _fo, _free_group_id
from ..rules.setup import _choose_production, _nearest_city
from .state import block

# ovl21:0a85 ring walk: DS:07d8 directions (-1 ends), 0a8b:0b4d steps DS:2b16 (dx) / DS:2b04 (dy)
RING_DIRS = (0, 2, 2, 4, 4, 4, 6, 6, 6, 0, 0, 0)   # DS:07d8 (13 words, the 13th = -1)
DIR_DX = (0, 1, 1, 1, 0, -1, -1, -1, 0)            # DS:2b16
DIR_DY = (-1, -1, 0, 1, 1, 1, 0, -1, 0)            # DS:2b04
RING_CAP, RING_CAP_FLAG = 100, 1000                # ovl21:0a90..0a9e
NEAREST_START = 1000                               # ovl29:0a34
PRODUCTION_MARGIN = 30                             # ovl29:0e87 (+0x1e), 11d5 at 1259
EARLY_TURNS = 5                                    # ovl29:0ea8: refuse only when max(turn,1) > 5
NO_VECTOR_SOURCE = 100                             # ovl29:0f5b cmp si, 0x64
VECTOR_FAR = (-2, -2)                              # ovl29:0fa8 / 0fb9
CITY_FLAG_UNSEEN, CITY_FLAG_FLYING_SLOT = 0x01, 0x02   # AI[+0x11e + c] bits (ai.md §3.1)
ORDER_KIND_MASK, ORDER_INDEX_MASK = 0x0F, 0x7F     # ovl29:0bdf, 0bfa
FLAGS_CLEAR = 0xFF5F                               # ovl29:0c4d: +0xc &= ~0xa0
KIND_KEEP, KIND_CITY, KIND_ITEM, KIND_SITE = 4, 1, 2, 3   # ovl29:0c94..0d32
STRENGTH_START = 10                                # ovl29:1afc
W15_BONUS = 2                                      # ovl29:1b4f / 1ac0 (+2 when w15 == 1)
DECENT = ((11, 3), (7, 2))                         # ovl29:1ac7..1ae1: AI[+2] > n and strength < s -> 0
DRY_KIND = 3                                       # ovl29:1a5d
DMAP_LIMIT = 15                                    # ovl29:1827 / 186b
WIN_P = 50                                         # ovl29:180f / 1a01
OWN_P, OWN_D = 15, 20                              # ovl29:19d2 / 19d5
SCORE_NEAR, SCORE_FAR, SCORE_NONE = (400, 10), (100, 5), -2   # ovl29:1a0c..1a29
FAR_P = 10                                         # ovl29:1a1a
HUMAN_ROLL = (1, 4, -1)                            # ovl29:17f4
SIMS_MIN = 1                                       # ovl29:15d3
WIN_PERCENT = 100                                  # ovl29:161b imul 0x64
N_TYPES = 29                                       # ovl29:12b8, ovl44:141b (0x1d)


def _abs16(v: int) -> int:
    """cwd; xor ax, dx; sub ax, dx on a word: abs(-32768) stays -32768."""
    v = s16(v)
    return v if v == -0x8000 else abs(v)


def nearest_ring(state, c: int, dm, flag: int = 0) -> tuple[int, int, int]:
    """ovl21:0a85(c, &x, &y, T, flag): walk the 12 squares around city c's 2x2 block from the
    square above the corner, clockwise (DS:07d8 directions, steps cumulative); return (best, x,
    y) = the smallest |T| below the cap (100, or 1000 with `flag`) and the first square in walk
    order having it, else (cap, -1, -1).  A step off the map ends the whole walk.
    Evidence: asm ovl21:0a85..0b54 (0a90 cap, 0ac6..0ad2 *px = *py = -1, 0ad9 -1 ends, 0af2
    0a8b:0b4d, 0b11..0b19 |T[x][y]| < best strict); 0a8b:0b4d..0b99 (x < 0, y < 0, x == 0x70,
    y == 0x9c -> 0); tables read from the EXE image (ai.md §6.8)."""
    best = RING_CAP_FLAG if flag else RING_CAP
    city = state.cities[c]
    x, y = city.x, city.y
    px = py = -1
    for d in RING_DIRS:
        nx, ny = x + DIR_DX[d], y + DIR_DY[d]
        if nx < 0 or ny < 0 or nx == MAP_W or ny == MAP_H:
            break
        x, y = nx, ny
        v = _abs16(dm.value(x, y))
        if v < best:
            best, px, py = v, x, y
    return best, px, py


def nearest_claimed_city(state, x: int, y: int, claim: int) -> int:
    """ovl29:0a27(x, y, claim): the nearest intact city (terrain 10 at its corner) whose claim
    byte +0x2f equals `claim`, scanned count-1..0 with a strict `<` from 1000 (the highest index
    wins ties); -1 when none.
    Evidence: asm ovl29:0a27..0ae6 (0a7f terrain 2c04:0710, 0a91 +0x2f == arg, 0ac1 0a8b:0acc,
    0acb jge); the same loop as rules.setup._nearest_city(reverse=True)."""
    return _nearest_city(state, x, y, lambda c: (c.owner2 & 0xFF) == claim
                         and state.world.terrain(c.x, c.y) == Terrain.CITY, reverse=True)


def step_toward(ax: int, ay: int, x: int, y: int) -> tuple[int, int]:
    """ovl29:0d88(ax, ay, &x, &y): each coordinate below the army's goes up by one.
    Evidence: asm ovl29:0d88..0da8 (signed jge)."""
    return (x + 1 if x < ax else x), (y + 1 if y < ay else y)


def goto_for_order(state, a, kind: int, idx: int) -> None:
    """ovl29:0c7e(army, kind, idx): the goto (+0x12 / +0x14) of an order.  Kind 4 leaves it;
    kind 1 = city idx: an own city -> (x + 1, y + 1), another -> (x, y) moved toward the army by
    0d88; kind 2 = item idx's map square (+0x19 / +0x1b); kind 3 = site idx's square; any other
    kind -> (-1, -1); a -1 coordinate becomes the army's own.
    Evidence: asm ovl29:0c7e..0d87 (0c94 kind 4 -> return, 0ca1..0d05 city, 0d0c item +0x1d·idx
    + 0xd02 / 0xd04, 0d34 site +0x1f·idx + 0x811 / 0x813, 0d58..0d82)."""
    if kind == KIND_KEEP:
        return
    x = y = -1
    if kind == KIND_CITY:
        c = state.cities[idx]
        x, y = c.x, c.y
        if s8(c.owner) == state.current:
            x, y = x + 1, y + 1
        else:
            x, y = step_toward(a.x, a.y, x, y)
    elif kind == KIND_ITEM:
        it = state.items[idx]
        x, y = it.x, it.y
    elif kind == KIND_SITE:
        s = state.sites[idx]
        x, y = s.x, s.y
    a.goto = (a.x if x == -1 else x, a.y if y == -1 else y)


def order_stack(state, ids, kind: int, idx: int, flags: int) -> int:
    """ovl29:0ae7(list[8], kind, idx, flags): select the listed armies and give them an order.
    No entry (every word -1) -> 0, nothing written.  Group id = 0b62:0cde() when more than one;
    per slot i = 0..7: a -1 entry makes DS:5e3e[i] null in place (0b59..0b64: a hole when a
    live entry follows); else DS:5e3e[i] = the army, and it becomes the leader DS:5e62 when its
    fight-order byte (row of the side on turn, signed) beats the best so far (strict > from
    -1: the first of the highest; DS:5e62 is not reset, so with no byte above -1 it keeps
    its previous value, null after ovl29:14d3 with slot 0 empty); with kind != -1: +0xe =
    (+0xe & 0xf0) | kind, +0xf bits 1-7 = idx, +0x11 = group id, goto by 0c7e; +0xc &= ~0xa0,
    |= flags; then 0c8c:0529 (the selection step, `rules.movement.set_selection`, which keeps
    the slots as they are); returns 1.
    Evidence: asm ovl29:0ae7..0c7d (0afe 0b62:0024(SCN 0x110), 0b13..0b29 count, 0b39 0cde,
    0b46..0c6a loop: 0b54 -1 -> 0b59..0b64 null, 0b80..0b86 DS:5e3e[i], 0b9d..0bd3 signed
    byte jle, 0bdc..0c40 order bytes and 0c7e, 0c4d..0c64 flags; 0c72 0c8c:0529)."""
    ids = list(ids)[:M.K.STACK_MAX.value]
    live = [i for i in ids if i != -1]
    if not live:
        return 0
    p = state.current
    gid = _free_group_id(state) if len(live) > 1 else 0
    leader, best = state.selection.selected, -1
    for aid in live:
        a = state.armies[aid]
        v = _fo(state, p, a)
        if v > best:
            best, leader = v, aid
        if kind != -1:
            a.order = (a.order & 0xF0) | (kind & ORDER_KIND_MASK)
            a.vector_dest = idx & ORDER_INDEX_MASK
            a.group = gid & 0xFF
            goto_for_order(state, a, kind, idx)
        a.flags &= FLAGS_CLEAR
        if flags:
            a.flags |= flags
    M.set_selection(state, leader, ids)
    return 1


def production_in_progress(state, c: int) -> int:
    """ovl29:0fd5(c): 1 when +0x2d != 0 and +0x2d differs from the time byte of the slot of the
    current type (ovl44:0000(c, +0x2c)), i.e. production started and partly done.
    Evidence: asm ovl29:0fd5..103c (0fe9 +0x2d, 1009 ovl44:0000, 1030 byte compare)."""
    city = state.cities[c]
    if s8(city.turns_left) == 0:
        return 0
    s = slot_of(city, s8(city.current))
    return int((city.turns_left & 0xFF) != (city.slots[s].time & 0xFF))


def set_vector(state, c: int, dest: int) -> None:
    """ovl29:0f10(c, dest): no production under way (0fd5 == 0) -> vectoring off (+0x31 = 0,
    target (-1, -1)); else +0x31 = 1 and the target = dest's corner, or (-2, -2) when the
    *source* index c >= 100 (0f5b tests si = c, not dest; never true for a city).  Intentional
    differences from the human vectoring (rules.vectoring): no 4-source cap and no stop rule,
    0f10 writes the words directly.  +0x31 is written as a word (0f30 / 0fca), so +0x32 is
    zeroed too; model.city holds no +0x32 byte, so that half is not kept.
    Evidence: asm ovl29:0f10..0fd4 (0f1e 0fd5, 0f30..0f52 off, 0f5b cmp si (= c), 0x64,
    0f60..0f97 dest x / y, 0fa8..0fb9 -2, 0fca +0x31 = 1)."""
    city = state.cities[c]
    if not production_in_progress(state, c):
        city.vectoring = 0
        city.vector_to = (-1, -1)
        return
    if c < NO_VECTOR_SOURCE:
        d = state.cities[dest]
        city.vector_to = (d.x, d.y)
    else:
        city.vector_to = VECTOR_FAR
    city.vectoring = 1


def set_production(state, c: int, type_id: int, vec: int, dest: int) -> int:
    """ovl29:0e5a(c, type, vec, dest): s = ovl44:0000(c, type); refuse (0) when the slot's cost
    (signed byte) + 30 > gold (signed) and max(turn, 1) > 5; else +0x2c = type, +0x2d = slot
    s's time, vectoring by 0f10(c, dest) when vec != 0, else +0x31 = 0 (a word: +0x32 too, not
    modelled); returns 1.  With vec != 0 the vectoring always ends off: 0e5a has just set
    +0x2d to the slot's time, so 0fd5 finds production not under way (+0x2d == the slot time,
    or 0) and 0f10 clears +0x31 and the target - as coded.
    Evidence: asm ovl29:0e5a..0f0f (0e69 ovl44:0000, 0e81..0e9c cost + 0x1e vs gold jle,
    0ea3 ovl61:225b > 5, 0ebe +0x2c, 0edf +0x2d, 0ee4 vec, 0f02 word +0x31 = 0)."""
    city = state.cities[c]
    s = slot_of(city, type_id)
    p = state.current
    if (s8(city.slots[s].cost) + PRODUCTION_MARGIN > s16(state.players[p].gold)
            and turn(state) > EARLY_TURNS):
        return 0
    city.current = type_id & 0xFF
    city.turns_left = city.slots[s].time
    if vec:
        set_vector(state, c, dest)
    else:
        city.vectoring = 0
    return 1


def choose_production(state, c: int, kind: int, vec: int, dry: int) -> int:
    """ovl29:103d(c, kind, vec, dry): the slot type scored best for `kind` (EL §9.5, the
    scoring `rules.setup._choose_production`); with `dry` the type (-1 none) is returned and
    nothing set; else no pick -> 0, a pick -> 0e5a(c, pick, vec != -1, vec) (its refusal is
    not looked at) and 1.
    Evidence: asm ovl29:103d..11d4 (1052..119b slots 3..0, 119e dry, 11a9 none, 11b3..11c8
    0e5a with (0, 0) for vec == -1, 11ce ax = 1)."""
    pick = _choose_production(state, state.cities[c], kind)
    if dry:
        return pick
    if pick == -1:
        return 0
    if vec == -1:
        set_production(state, c, pick, 0, 0)
    else:
        set_production(state, c, pick, 1, vec)
    return 1


def weakest_slot(state, c: int) -> int:
    """ovl29:1ae9(c): the first empty slot (type byte 0xff) of 0..3; else the slot with the
    lowest effective strength (signed strength byte, + 2 when the type's w15 byte is 1), strict
    `<` from 10 (the first wins ties); -1 when every slot is at 10 or more.
    Evidence: asm ovl29:1ae9..1b70 (1b11 0xff -> return, 1b29..1b52 strength + w15, 1b55 jge)."""
    best, bv = -1, STRENGTH_START
    for k, s in enumerate(state.cities[c].slots[:N_SLOTS]):
        if s.type & 0xFF == 0xFF:
            return k
        v = s8(s.strength)
        if M.type_flag(state, s8(s.type), "cancel_mode") == 1:
            v += W15_BONUS
        if v < bv:
            best, bv = k, v
    return best


def fill_slot(state, c: int, s: int, rec) -> None:
    """ovl44:1299(c, s, r): slot s of city c = production record r's type (+0), time (+0x18),
    cost (+0x1a), strength (+0x16) and moves (+0x1c) bytes; defence = ovl44:0930(c); gold of
    the side on turn (SCN 0x110) -= the record's w4 (+0x1e, a word sub).  The ARMYTYPE open /
    close around it (ovl44:1128 / 11e2) is file access.  Callers: ovl29:11d5
    (`buy_flying_slot`) and ovl25:0bd1 (`ai.phases.rebuilding.buy_slot`).
    Evidence: asm ovl44:1299..138e (12a5 1128, 12a8..12c3 type, 12c8..12e4 time, 12e9..1305
    cost, 130a..1326 strength, 132b..1347 moves, 134e 0930 -> 135c, 1366..1382 gold, 1388
    11e2)."""
    city = state.cities[c]
    city.slots[s] = Slot(rec.type_id, rec.turns, rec.strength, rec.moves, rec.cost)
    city.defence = defence_of(city)
    add_gold(state, state.current, -s16(rec.buy_price))


def buy_flying_slot(state, c: int) -> None:
    """ovl29:11d5(c): buy a flying production slot.  s = 1ae9(c); for t = 0..28 whose per-type
    flies byte (DS:45c4 + 6t) is set and w13 byte (DS:45c8 + 6t) is 0: the production record r
    of t (ovl44:138f) with price = its w4 (+0x1e); when gold (signed) >= price + 30:
    ovl44:1299(c, s, r) (`fill_slot`: gold -= price), AI[+0x11e + c] |= 2, +0x2d = 0, +0x31 =
    0 (word), and stop.  A loop over the city's four slots at 1214..1232 compares their types
    with t and discards the result.  s = -1 (every slot at strength 10 or more, with the w15 bonus) would make 1299
    write slot -1: the type into the byte before +0x16 (the owner byte +0x15) and the other
    fields one byte before slot 0's (slot 3's bytes of the previous field).  Unreachable with
    the stock ARMYTYPE / ARMYTYP2 tables: only type 10 has w15 == 1 (strength 4) and set-up
    caps slot strengths at 9; refused here [I: a modded table could reach it].
    Evidence: asm ovl29:11d5..12c8 (11e3 1ae9, 11f4..1211 flags, 124e ovl44:138f(t, &time,
    &strength, &cost, &price, &moves), 1259 + 0x1e, 1274 jl, 1280 ovl44:1299, 128e..12ae);
    ovl44:138f..142b (record whose word +0 == t), ovl44:1299..138e."""
    s = weakest_slot(state, c)
    p = state.current
    for t in range(N_TYPES):
        if not M.type_flag(state, t, "flag16") or M.type_flag(state, t, "special"):
            continue
        rec = state.army_type(t)
        if s16(state.players[p].gold) < s16(s16(rec.buy_price) + PRODUCTION_MARGIN):   # 1259: word add, wraps
            continue
        if s == -1:
            raise RuntimeError("ovl29:11d5: no slot below strength 10 in city %d; ovl44:1299 would "
                               "write slot -1 (the owner byte)" % c)
        fill_slot(state, c, s, rec)                     # 1280 ovl44:1299(c, s, r)
        city = state.cities[c]
        block(state).city_flags[c] |= CITY_FLAG_FLYING_SLOT
        city.turns_left = 0
        city.vectoring = 0
        return


def _scan(state):
    """Army records SCN 0x181 - 1 .. 0 (the AI square scans)."""
    for i in range(min(state.flags.get(SCN_ARMY_HIGH, 0), len(state.armies)) - 1, -1, -1):
        yield state.armies[i]


def _own(state, a) -> bool:
    return (a.owner & 0xFF) == (state.current & 0xFF)


def select_list(state, ids) -> None:
    """ovl29:14d3(list): `rules.movement.select_list` (the selection words without 0c8c:0529).
    Evidence: asm ovl29:14d3..15c4 (see rules.movement.select_list)."""
    M.select_list(state, ids)


def _finish(state, out: list) -> tuple[int, list]:
    n = len(out)
    if n:
        M.select_list(state, out + [-1] * (M.K.STACK_MAX.value - n))
    return n, out + [-1] * (M.K.STACK_MAX.value - n)


def select_square(state, x: int, y: int, minmoves: int = 0) -> tuple[int, list]:
    """ovl29:12c9(x, y, out, minmoves): up to 8 armies of the side on turn on (x, y) (owner
    byte == SCN 0x110 low byte), records SCN 0x181 - 1 .. 0, with moves left (signed) >=
    minmoves when minmoves != 0; when any, 14d3 selects them.  Returns (count, the 8-entry list
    padded with -1) - the list is what 12c9 copies to `out`.
    Evidence: asm ovl29:12c9..13b1 (12d4 list = -1, 12f5 SCN 0x181, 1306 owner, 1321 / 1335 x /
    y words, 133f..1355 +7 jl, 1364 8 found, 1370..137b 14d3, 1381..13aa copy)."""
    out = []
    for a in _scan(state):
        if not _own(state, a) or a.x != x or a.y != y:
            continue
        if minmoves and s8(a.moves_left) < minmoves:
            continue
        out.append(a.id)
        if len(out) >= M.K.STACK_MAX.value:
            break
    return _finish(state, out)


def select_square_order(state, x: int, y: int, sub: int, kind: int, minallow: int = 0) -> tuple[int, list]:
    """ovl29:13b2(x, y, out, sub, kind, minallow): as 12c9, but an army must carry order bits
    ((+0xe >> 4) & 7) == sub and (+0xe & 0xf) == kind, and allowance +6 (signed) >= minallow when
    minallow != 0.
    Evidence: asm ovl29:13b2..14d2 (13f0 owner, 140e / 1422 x / y, 1436..1444 sub, 1450..145b
    kind, 145d..1473 +6 jl, 1482 8 found, 1491..149c 14d3, 14a2..14cb copy)."""
    out = []
    for a in _scan(state):
        if not _own(state, a) or a.x != x or a.y != y:
            continue
        if (a.order >> 4) & 7 != sub or a.order & ORDER_KIND_MASK != kind:
            continue
        if minallow and s8(a.allowance) < minallow:
            continue
        out.append(a.id)
        if len(out) >= M.K.STACK_MAX.value:
            break
    return _finish(state, out)


def win_odds(state, x: int, y: int) -> int:
    """ovl29:15c5(x, y): n = AI[+0x20] when >= 1 (signed) else 1 simulations ovl36:124a(x, y, 0)
    of the current selection against (x, y); wins = those leaving no defender (DS:412e == 0);
    returns wins * 100 idiv n with the 16-bit imul / cwd / idiv (product truncated to a signed
    word, quotient truncated toward zero).  Each simulation draws the battle dice, none when a
    side is empty.
    Evidence: asm ovl29:15c5..1625 (15d3 jge 1, 15ef..1611 loop, 15ff DS:410a, 160a word +2,
    161b..161f imul / idiv); rules.combat.simulate_selection = ovl36:124a(·, ·, 0)."""
    n = s16(block(state).simulations)
    n = n if n >= SIMS_MIN else SIMS_MIN
    wins = 0
    for _ in range(n):
        if simulate_selection(state, x, y)[1] == 0:
            wins += 1
    num = s16(wins * WIN_PERCENT)                     # imul ax, ax, 0x64 (16-bit)
    q = abs(num) // n                                 # cwd; idiv word: toward zero (n >= 1)
    return s16(-q if num < 0 else q)


def count_square(state, x: int, y: int) -> tuple[int, int, int]:
    """ovl29:1626(x, y, &n, &str, &heroes): every army record on (x, y) (any owner), records SCN
    0x181 - 1 .. 0: count, sum of the signed strength bytes, number of heroes (type 0x1c).
    Evidence: asm ovl29:1626..16ad."""
    n = st = heroes = 0
    for a in _scan(state):
        if a.x == x and a.y == y:
            n += 1
            st += s8(a.strength)
            if a.type_id & 0xFF == HERO_TYPE:
                heroes += 1
    return n, st, heroes


def seen_near(state, x: int, y: int) -> int:
    """ovl29:16ae(x, y): 1 when a map square of x-1..x+1 x y-1..y+1 (x outer, y inner) has the
    road-layer bit 0x20 (seen), else 0.
    Evidence: asm ovl29:16ae..170b (16c3..16d4 bounds, 16e2 19d9:[y*0x70 + x], shr 5 & 1)."""
    roads = state.world.roads
    for xx in range(x - 1, x + 2):
        for yy in range(y - 1, y + 2):
            if 0 <= xx < MAP_W and 0 <= yy < MAP_H and roads[yy * MAP_W + xx] & ROAD_SEEN:
                return 1
    return 0


def best_target(state, flag: int, dm) -> int:
    """ovl29:1885(x, y, flag) on the distance table `dm`: for c = count-1..0 skip an own city
    when `flag`, a city whose corner is not terrain 10, c == AI[+0x46], an unseen city (AI
    flag bit 0), a city of a side (not neutral, not own) not at war with the side on turn
    (relation[owner][cur] & 3 != 2), an unreachable one (0a85 x == -1); d = 0a85's distance;
    own city: p = 15, d += 20, else p = 15c5(c.x, c.y) (rnd); score 400 - d + 10p when p > 50
    and d < DS:5e00 (signed), else 100 - d + 5p when p > 10, else -2; the best strict >
    from -1 (the highest index wins ties; -2 never wins).  x and y are not read: their slots
    are 0a85's outputs.  Returns the city or -1.
    Evidence: asm ovl29:1885..1a4c (18af flag / owner, 190d terrain, 191c +0x46, 192b flag
    bit 0, 1940..198d owner / relation, 19a3 ovl21:0a85(c, &x, &y, T, 0), 19ad x == -1, 19c0..19d5
    own, 19f9 15c5, 1a01..1a29 score, 1a2c jle)."""
    p = state.current
    blk = block(state)
    sel_moves = s16(state.selection.moves)
    best, pick = -1, -1
    for c in range(len(state.cities) - 1, -1, -1):
        city = state.cities[c]
        o = s8(city.owner)
        if flag and o == p:
            continue
        if state.world.terrain(city.x, city.y) != Terrain.CITY:
            continue
        if s16(blk.quest_city) == c or blk.city_flags[c] & CITY_FLAG_UNSEEN:
            continue
        if (city.owner & 0xFF) != NO_OWNER and o != p and relation(state, o, p) != Relation.WAR:
            continue
        d, x, _ = nearest_ring(state, c, dm, 0)
        if x == -1:
            continue
        if o == p:
            pw, d = OWN_P, d + OWN_D
        else:
            pw = win_odds(state, city.x, city.y)
        if pw > WIN_P and d < sel_moves:
            s = SCORE_NEAR[0] - d + SCORE_NEAR[1] * pw
        elif pw > FAR_P:
            s = SCORE_FAR[0] - d + SCORE_FAR[1] * pw
        else:
            s = SCORE_NONE
        if s > best:
            best, pick = s, c
    return pick


def _leader(state):
    a = M._record(state, state.selection.selected)
    if a is None:
        raise IllegalCommand("no selected stack (DS:5e62)")
    return a


def retarget(state, city: int, x: int, y: int) -> int:
    """ovl29:1771(c, x, y), the move executor's re-target on reaching an order city (rules.movement
    HOOKS ai_retarget): p = 15c5(x, y) (rnd), then the leader's square is read; ok = owner(c)
    neutral or at war with the side on turn (relation[owner][cur] & 3 == 2); for a human owner
    (SCN 0x0d0[owner] == 0) rnd(1,4,-1) == 0 makes ok = 1 (drawn also when ok already is);
    ok and p > 50 (signed) -> c; else the distance map 0555:1ab9(15, leader, DS:5dfc, DS:5dfa)
    and r = 1885(x, y, ok): c when r == -1, else r.
    Evidence: asm ovl29:1771..1850 (1783 15c5, 178c..179a leader, 17a7..17d5 ok, 17de..1808
    human rnd, 180b..1817, 1819..1829 1ab9, 183a 1885, 1842)."""
    pw = win_odds(state, x, y)
    lead = _leader(state)
    lx, ly = lead.x, lead.y
    o = s8(state.cities[city].owner)
    ok = int(o == NO_OWNER or relation(state, o, state.current) == Relation.WAR)
    if o != NO_OWNER and state.players[o].control == Control.HUMAN:
        if state.rng.rnd(*HUMAN_ROLL) == 0:
            ok = 1
    if ok and pw > WIN_P:
        return city
    sel = state.selection
    dm = P.distance_map(state, DMAP_LIMIT, lx, ly, sel.mode, sel.mask)
    if dm.field is None:
        raise RuntimeError("ovl29:1771: no search has written the table DS:3f86 yet")
    r = best_target(state, ok, dm)
    return city if r == -1 else r


def can_build_decent(state, c: int) -> tuple[int, int | None]:
    """ovl29:1a4d(c, &slot): t = 103d(c, 3, -1, dry); none -> (0, slot untouched = None); else
    slot = ovl44:0000(c, t) and its effective strength (signed byte, + 2 when w15 == 1); 0 when
    AI[+0x02] > 11 and strength < 3, or AI[+0x02] > 7 and strength < 2; else 1.
    Evidence: asm ovl29:1a4d..1ae8 (1a61 103d(c, 3, -1, 1), 1a77 ovl44:0000, 1a94..1ac0, 1ac7
    jle 0xb / 1ad7 jle 7)."""
    t = choose_production(state, c, DRY_KIND, -1, 1)
    if t == -1:
        return 0, None
    city = state.cities[c]
    s = slot_of(city, t)
    v = s8(city.slots[s].strength)
    if M.type_flag(state, s8(city.slots[s].type), "cancel_mode") == 1:
        v += W15_BONUS
    own = s16(block(state).own_cities)
    for more, low in DECENT:
        if own > more and v < low:
            return 0, s
    return 1, s
