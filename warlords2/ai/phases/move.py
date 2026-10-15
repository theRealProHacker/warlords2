"""ovl22: the computer's move phases (ai.md §6.6, §9): move #1 / move #2, move Search, move
Explore, rescue, last rescue, specials, and the callback ovl22:15c3 that the move executor
0a8b:0001 calls when a hero arrives on its site (rules.movement HOOKS ai_search_on_arrival).
ovl23 (debug text, ai.md §6.6a) draws nothing during a computer turn and is not modelled.

No rnd() is drawn in ovl22 itself: the draws come through the callees (ovl29:15c5 battle
simulations, the move executor 0a8b:0001 with its battles / re-target / searches, ovl20:0e4b
exploring, ovl34:0000 searching, ovl01:0d7a quests).

Conventions.  The army records are scanned from SCN 0x181 - 1 down to 0 (Borland `mov ax, i;
dec i; or ax, ax; jne body` loops); freed records (owner 0xff) stay in the scan as in the
original.  DS:5e3e[0..7] is `state.selection.moving` (slot s = list index, null = -1 or past the
end), DS:5e62 `selection.selected`, DS:5e5e `selection.hero`, DS:5dfe `selection.count`,
DS:5dfc / 5dfa `selection.mode` / `mask`.  Army +0xe is `Army.order`, +0xf bits 1-7
`Army.vector_dest` (`+0xf &= 1` is vector_dest = 0), +0x12 / +0x14 `Army.goto`.  Every army
record is re-read after a call that can move, kill or free armies.

Cross-phase calls go through `_phase(name)` (importlib at call time):
* neutral (ovl20): explore(state, i, c) -> list (0e4b), neutral_neighbours(state, c) ->
  (count, ids[6], dists[6]) (01f6), nearest_city(state, x, y, side) -> int (0981)
* clean_city (ovl24): delete_army(state, i, redraw) -> list (015e), delete_list(state, ids,
  redraw) -> list (00ca)
* diplomacy (ovl18): may_attack_city(state, c) -> int (0851)
"""
from __future__ import annotations

import importlib

from ...model import commands as C
from ...model.ids import HERO_TYPE, MAP_EXPLORED, MAP_W, SiteKind, Terrain
from ...model.state import SCN_ARMY_HIGH
from ...rules import movement as M
from ...rules import pathfinding as P
from ...rules import quests as Q
from ...rules import ruins as R
from ...rules import selection as S
from ...rules.bonuses import s8
from ...rules.diplomacy import current as relation
from ...rules.economy import s16
from ...rules.heroes import turn
from .. import util as U
from ..state import block

# army +0xc flag bits used by the AI (ai.md A.1)
F_EXPLORER = 0x20        # ovl22:0331, 03e4, 0c10, 17e1
F_DONE = 0x40            # ovl22:01ba, 1724
F_RETARGET = 0x80        # ovl22:01cc, 0c10
F_SITE_MISSION = 0x100   # ovl22:04aa, 04c0, 1521
F_VISITED = 0x200        # ovl22:004a, 006d, 0081
ORDER_LOW_KEEP = 0xF0    # +0xe &= 0xf0 (order kind cleared)
ORDER_SUB_CLEAR = 0x8F   # ovl22:0ab7 +0xe &= 0x8f (bits 4-6 cleared)
FLAGS_LAST_RESCUE = 0xFF5F   # ovl22:0c10 (clears 0x20 and 0x80)
KIND_NONE, KIND_CITY, KIND_SITE = 0, 1, 3
MIN_MOVES = 2            # ovl22:005b / 0091
EXPLORE_MOVES = 3        # ovl22:0549
ROLE_STAGING = 7         # ai.md §3.2
ROLE_FLYER_WANTED = 13   # ovl22:1194
CITY_FLAG_UNSEEN = 0x01  # AI[+0x11e + c] bit 0
CITY_FLAG_HERO = 0x20    # AI[+0x11e + c] bit 5 (ovl24:023f)
FLYERS_KEPT = 7          # ovl22:03a7 AI[+0x24] > 7
WEAK_FLYER = 4           # ovl22:03b8 strength < 4
RETARGET_P_START = 100   # ovl22:0623
RETARGET_P_MIN = 75      # ovl22:06f2
RETARGET_D_START = 1000  # ovl22:0694
HIDDEN_TURNS = 10        # ovl22:07b6
WEAK_STRENGTH, WEAK_ALLOWANCE = 3, 8   # ovl22:0cac, 0cbe
SQUARE_MOVES = 8         # ovl22:0cf9 12c9(..., 8), 0d5d
LIM_PER_HALF_STRENGTH = 10   # ovl22:0ea3
LIM_HERO = 50            # ovl22:0ea8
LIM_NEAR_ADD = 10        # ovl22:0eb0
PICK_START = 1000        # ovl22:0f54
PICK_BIG_N = 4           # ovl22:0f59
PICK_P_MIN = 75          # ovl22:109a
PICK_STAGING_ADD, PICK_OWN_ADD, PICK_BIG_ADD = 10, 30, 100   # ovl22:10af, 10b4, 10bf
SITE_NEAR, SITE_FAR = 15, 40           # ovl22:11ae, 11b3
SITE_NEAR_BONUS, SITE_FAR_BONUS = 200, 50   # ovl22:1431, 144b
CITY_NEAR_BONUS = 100    # ovl22:14e5
STAGING_PULL = 80        # ovl22:14da
CITY_MIN_DIST = 2        # ovl22:158d
WAR = 2                  # relation bits & 3 == 2 (ovl22:102c)
NEUTRAL = 0x0F
SITE_RESULT_NONE, SITE_RESULT_DONE = 0, 2   # ovl22:15c3 return values (1631, 17fc)
HERO_EXPLORE_NO_HERO, HERO_EXPLORE_NO_FLYER = 0, 1   # ovl22:11a6 (15bd, 1243)


def _phase(name: str):
    return importlib.import_module("warlords2.ai.phases." + name)


def _high(state) -> int:
    """SCN 0x181 (army high-water mark), bounded by the table."""
    return min(state.flags.get(SCN_ARMY_HIGH, 0), len(state.armies))


def _indices(state):
    """Army record indices SCN 0x181 - 1 .. 0 (the bound read once, as each loop reads it)."""
    return range(_high(state) - 1, -1, -1)


def _own_byte(state, a) -> bool:
    """`mov al, +5; cmp al, byte SCN 0x110` (byte compare)."""
    return (a.owner & 0xFF) == (state.current & 0xFF)


def _own_word(state, a) -> bool:
    """`mov al, +5; cwde; cmp ax, word SCN 0x110` (signed byte against the word)."""
    return s8(a.owner) == state.current


def _flies(state, type_id: int) -> bool:
    """DS:45c4 + 6 * cwde(type) != 0 (low byte of ARMYTYPE w16)."""
    return bool(M.type_flag(state, type_id, "flag16"))


def _w13(state, type_id: int) -> bool:
    """DS:45c8 + 6 * cwde(type) != 0 (low byte of ARMYTYPE w13)."""
    return bool(M.type_flag(state, type_id, "special"))


def _terrain(state, x: int, y: int) -> int:
    """SCN 0x710[low byte of map word 1e1d:(y * 0xe0 + 2x)]."""
    return int(state.world.terrain(x, y))


def _city(state, c: int):
    """City record c (2c04:157d + 0x41 c); an index past the table would read another record in
    the original, which no traced state produces: refused."""
    if not 0 <= c < len(state.cities):
        raise RuntimeError("ovl22: city %d beyond the city table (%d cities)" % (c, len(state.cities)))
    return state.cities[c]


def _city_intact(state, c: int) -> bool:
    """terrain(city c's corner) == 10."""
    city = _city(state, c)
    return _terrain(state, city.x, city.y) == Terrain.CITY


def _slot_records(state):
    """DS:5e3e[0..7] as (slot, record or None)."""
    mv = state.selection.moving
    for s in range(M.K.STACK_MAX.value):
        aid = mv[s] if s < len(mv) else -1
        yield s, M._record(state, aid)


def _clear_order(a, done: bool = False, goto: bool = True) -> None:
    a.order &= ORDER_LOW_KEEP
    a.vector_dest = 0
    if goto:
        a.goto = (-1, -1)
    if done:
        a.flags |= F_DONE


def _leader(state):
    lead = M._record(state, state.selection.selected)
    if lead is None:
        raise RuntimeError("ovl22: no leader DS:5e62")
    return lead


def _execute_leader_goto(state) -> list:
    """0a8b:0001(DS:5e62.+0x12, DS:5e62.+0x14, 0)."""
    lead = _leader(state)
    _, events = M.execute_move(state, lead.goto[0], lead.goto[1], 0)
    return events


def _halve(v: int) -> int:
    """cwde; cdq; sub ax, dx; sar ax, 1: signed division by 2 truncating toward 0."""
    return -((-v) // 2) if v < 0 else v // 2


# ------------------------------------------------------------------------------- move #1 / #2


def move(state) -> list:
    """ovl22:0000 (move #1 and move #2): every own army on the map loses 0x200 and gets it back
    when its moves left (signed byte) are < 2; then repeatedly ovl67:05c4 (nearest awake own
    army without 0x40 / 0x200 to DS:3250 / 3252) until none: it gets 0x200; no goto (x < 0) or
    moves < 2 -> next; ovl67:06eb selects its stack; its order (k = +0xe & 0xf, c = +0xf >> 1)
    is invalid when k == 0, or k == 1 with c >= count (unsigned), c == AI[+0x46] or city c's
    corner not intact -> every DS:5e3e member loses its order and goto and gets 0x40, next;
    with flag 0x80 05ff decides (0 -> next); then, k / c re-read from the army, an own order
    city -> the leader's goto = (c.x + 1, c.y + 1); 0a8b:0001(leader's goto, 0).  Returns 1 in
    the original (the events here).
    Evidence: asm ovl22:0000..0283 (0013..0079 first loop: 0027 byte owner, 0038 x != -1, 004a
    &= 0xfdff, 005b jge 2, 006d |= 0x200; 026c ovl67:05c4, 027e return 1; 0081 |= 0x200, 0087
    goto x jge 0, 0091 +7 jge 2, 009f ovl67:06eb; 00b1 k == 0, 00d2 c < count jb, 00f8 c ==
    AI[+0x46], 0110..0162 terrain 10; 0164..01c4 DS:5e3e[7..0]: +0xe &= 0xf0, +0xf &= 1, +0x14 /
    +0x12 = -1, +0xc |= 0x40; 01cc test 0x80 -> 01d6 05ff; 01e0..0210 a's k / c and cwde owner ==
    SCN 0x110; 0226..0252 leader +0x12 / +0x14 = corner + 1; 0264 0a8b:0001)."""
    events: list = []
    blk = block(state)
    for i in _indices(state):
        a = state.armies[i]
        if _own_byte(state, a) and a.x != -1:
            a.flags &= ~F_VISITED & 0xFFFF
            if s8(a.moves_left) < MIN_MOVES:
                a.flags |= F_VISITED
    while True:
        a = S.search_move_all(state)                       # ovl67:05c4
        if a is None:
            return events
        a.flags |= F_VISITED
        if s16(a.goto[0]) < 0 or s8(a.moves_left) < MIN_MOVES:
            continue
        events += S.select_army_stack(state, a)            # ovl67:06eb
        k, c = a.order & 0x0F, a.vector_dest & 0x7F
        invalid = (k == KIND_NONE
                   or (k == KIND_CITY and c >= len(state.cities))
                   or (k == KIND_CITY and c == s16(blk.quest_city))
                   or (k == KIND_CITY and not _city_intact(state, c)))
        if invalid:
            for _, m in reversed(list(_slot_records(state))):
                if m is not None:
                    _clear_order(m, done=True)
            continue
        if a.flags & F_RETARGET:
            r, ev = retarget(state)
            events += ev
            if r == 0:
                continue
        k, c = a.order & 0x0F, a.vector_dest & 0x7F
        if k == KIND_CITY and s8(_city(state, c).owner) == state.current:
            city = state.cities[c]
            lead = _leader(state)
            lead.goto = (city.x + 1, city.y + 1)
        events += _execute_leader_goto(state)


# ------------------------------------------------------------------------------- move Search


def search(state) -> list:
    """ovl22:0284 move Search (only with Hidden Map, ai.md §6): t7 = an own city (cwde owner ==
    SCN 0x110) with role 7; AI[+0x22] = AI[+0x24] = 0; pass 0 the heroes, pass 1 the others,
    each over records SCN 0x181 - 1 .. 0 that are own (byte), on the map (x != -1) and
    explorers (0x20): a hero while t7, or a flyer when AI[+0x24] > 7 (signed word) and its
    strength (signed byte) < 4, is released (+0xe &= 0xf0, +0xf &= 1, 0x20 cleared); else
    ovl20:0e4b(i, -1), and if the army still is own (cwde) AI[+0x24] += 1 for a flyer, else
    AI[+0x22] += 1.
    Evidence: asm ovl22:0284..0457 (028c..02d0 t7, 02d6 / 02dc words, 02e2 / 044b..0451 passes,
    02ec SCN 0x181 per pass, 0308 owner byte, 031c x, 0331 0x20, 0347 / 0360 hero by pass, 0379
    hero and t7, 039c flies, 03a7 jle 7, 03b8 jge 4, 03ca..03e4 release, 03ef ovl20:0e4b,
    0401..0411 cwde owner, 0428 flies, 0433 / 043d inc)."""
    events: list = []
    blk = block(state)
    t7 = 0
    for c in range(len(state.cities) - 1, -1, -1):
        if s8(state.cities[c].owner) == state.current and blk.role[c] == ROLE_STAGING:
            t7 = 1
    blk.w22 = 0
    blk.explorers = 0
    for pass_ in (0, 1):
        for i in _indices(state):
            a = state.armies[i]
            if not _own_byte(state, a) or a.x == -1 or not a.flags & F_EXPLORER:
                continue
            hero = (a.type_id & 0xFF) == HERO_TYPE
            if (hero and pass_ != 0) or (not hero and pass_ == 0):
                continue
            if (hero and t7) or (_flies(state, a.type_id) and s16(blk.explorers) > FLYERS_KEPT
                                 and s8(a.strength) < WEAK_FLYER):
                a.order &= ORDER_LOW_KEEP
                a.vector_dest = 0
                a.flags &= ~F_EXPLORER & 0xFFFF
                continue
            events += _phase("neutral").explore(state, i, -1)
            a = state.armies[i]
            if _own_word(state, a):
                if _flies(state, a.type_id):
                    blk.explorers = s16(blk.explorers + 1)
                else:
                    blk.w22 = s16(blk.w22 + 1)
    return events


# ------------------------------------------------------------------------------- move Explore


def explore(state) -> list:
    """ovl22:0458 move Explore: for records SCN 0x181 - 1 .. 0 own (byte), on the map, with 0x100:
    0x100 is cleared; a hero then repeats, while `again`: n = 13b2(its square, its sub, its kind,
    0) (selects them) -> 0 ends; moves left < 3 (signed) ends; r = 11a6(list); r 0 or 1 ->
    again = 0; when the hero still stands where it stood and its moves left < its allowance
    (signed bytes) the loop ends.
    Evidence: asm ovl22:0458..05fe (0477 owner byte, 0495 x, 04aa 0x100, 04c0 &= 0xfeff, 04d1
    type 0x1c, 04dc di = 1, 05ea test, 04e2..0530 13b2(x, y, &list, (+0xe >> 4) & 7, +0xe & 0xf,
    0), 053a n, 0549 jge 3, 0554..057c x0 / y0, 0586 11a6, 058c..059c r 0 / 1 -> di = 0,
    05a2..05e8 position and +7 jl +6)."""
    events: list = []
    for i in _indices(state):
        a = state.armies[i]
        if not _own_byte(state, a) or a.x == -1 or not a.flags & F_SITE_MISSION:
            continue
        a.flags &= ~F_SITE_MISSION & 0xFFFF
        if (a.type_id & 0xFF) != HERO_TYPE:
            continue
        again = 1
        while again:
            a = state.armies[i]
            n, lst = U.select_square_order(state, a.x, a.y, (a.order >> 4) & 7, a.order & 0x0F, 0)
            if n == 0:
                break
            if s8(a.moves_left) < EXPLORE_MOVES:
                break
            x0, y0 = a.x, a.y
            r, ev = hero_explore(state, lst)
            events += ev
            if r in (HERO_EXPLORE_NO_HERO, HERO_EXPLORE_NO_FLYER):
                again = 0
            a = state.armies[i]
            if a.x == x0 and a.y == y0 and s8(a.moves_left) < s8(a.allowance):
                break
    return events


# ------------------------------------------------------------------------------- re-target


def retarget(state) -> tuple[int, list]:
    """ovl22:05ff, called by move #1 / #2 for an army with flag 0x80, on the stack 06eb selected:
    L = DS:5e62, c = L's order city, (x0, y0) = L's square, p = 100; f = ovl18:0851(c);
    here = ovl62:044a(x0, y0).  c not own (cwde owner != SCN 0x110): f != 0 -> 1; else every
    DS:5e3e member (slots 0..7) loses its order and goto (no 0x40) -> 0.  c own: the neighbour
    list of `here` (ovl20:01f6) when here >= 0 and it has one, else that of c; for i = 5..0
    with a neighbour d (byte != 0xff) not flagged unseen: with Neutral Cities on p = 15c5(d)
    (p is not reset per candidate, so with it off every candidate passes at 100); p < 75 ->
    skip; dd = dist(x0, y0, d) strictly below the best (from 1000) -> d.  Found: every member
    gets order kind 1, city d and its goto by 0c7e -> 1.  None: no Hidden Map, or max(turn, 1)
    >= 10 -> 1; else for each slot s = 0..7 the army DS:5e3e[s] (re-read after every explore,
    which reselects) is looked up among records SCN 0x181 - 1 .. 0 and sent exploring
    (ovl20:0e4b(j, -1)) -> 0.  Returns (result, events).
    Evidence: asm ovl22:05ff..0887 (0607..0620 L, 0623 p, 0629 ovl18:0851, 0638 ovl62:044a,
    0642..065c owner cwde, 0661..0687 01f6(here) / 01f6(c), 068f / 0694 starts, 0699 si = 6
    loop, 06a6 0xff, 06b4 bit 0, 06c1 SCN 0x11a, 06e7 15c5, 06f2 jl 0x4b, 071c 0a8b:0acc, 0726
    jge, 073b..079c order loop with 0c7e, 07a6 SCN 0x124, 07b1 ovl61:225b jl 10, 07be..0821
    explore loop (07d9..0804 record search), 0823 return 0, 0827 f -> 0881, 082d..087d clear,
    0881 return 1).
    c is the leader's (DS:5e62 after 06eb, the member with the highest fight-order byte), not
    the moving army's that move #1 checked against the city count; `_city` refuses c >= count
    (the original reads past the city table) [I: unreached, a stack 06eb selects shares one
    +0x11 group id, which only ovl29:0ae7 hands out, together with one order for the whole
    list, so the leader's order city is the army's]."""
    events: list = []
    blk = block(state)
    lead = _leader(state)
    c = lead.vector_dest & 0x7F
    x0, y0 = lead.x, lead.y
    p = RETARGET_P_START
    f = _phase("diplomacy").may_attack_city(state, c)
    here = state.city_at(x0, y0)                           # ovl62:044a
    if s8(_city(state, c).owner) != state.current:
        if f != 0:
            return 1, events
        for _, m in _slot_records(state):
            if m is not None:
                _clear_order(m)
        return 0, events
    nb = _phase("neutral")
    ids = None
    if here >= 0:
        cnt, ids, _ = nb.neutral_neighbours(state, here)
        if cnt == 0:
            ids = None
    if ids is None:
        _, ids, _ = nb.neutral_neighbours(state, c)
    best, bd = -1, RETARGET_D_START
    for i in range(5, -1, -1):
        d = ids[i] & 0xFF
        if d == 0xFF:
            continue
        if blk.city_flags[d] & CITY_FLAG_UNSEEN:
            continue
        city = _city(state, d)
        if state.options.neutral_cities != 0:
            p = U.win_odds(state, city.x, city.y)
        if p < RETARGET_P_MIN:
            continue
        dd = P.distance((x0, y0), (city.x, city.y))
        if dd < bd:
            bd, best = dd, d
    if best != -1:
        for _, m in _slot_records(state):
            if m is not None:
                m.order = (m.order & ORDER_LOW_KEEP) | KIND_CITY
                m.vector_dest = best & 0x7F
                U.goto_for_order(state, m, KIND_CITY, best)
        return 1, events
    if not state.options.hidden_map:
        return 1, events
    if turn(state) >= HIDDEN_TURNS:
        return 1, events
    for s in range(M.K.STACK_MAX.value):
        mv = state.selection.moving
        aid = mv[s] if s < len(mv) else -1
        if M._record(state, aid) is None:
            continue
        j = aid if aid < _high(state) else -1
        if j != -1:
            events += nb.explore(state, j, -1)
    return 0, events


# ------------------------------------------------------------------------------- rescue


def rescue(state) -> list:
    """ovl22:0888 rescue: for records SCN 0x181 - 1 .. 0 own (byte), on the map, with moves left
    >= allowance (signed bytes): when moves left == allowance + 2 (words after cwde), the square
    is not a City, the order is kind 1 and that city's corner is not intact (razed), every own
    army j (N - 1 .. 0, the army itself included) on the same square with kind 1 and the same
    city gets +0xe &= 0xf0 then &= 0x8f (+0xf kept).  Then an army that is not an explorer
    (0x20), has no order kind and is not on a City square goes to 0c5b.
    Evidence: asm ovl22:0888..0b4c (08a7 owner byte, 08c5 x, 08e9 jge, 0903..091a cwde +6 + 2,
    095f terrain 10, 097c kind 1, 09e3 city terrain 10, 09ee c, 0a0a..0ac4 inner loop: 0a26 owner
    byte, 0a49 / 0a69 x / y, 0a82 kind 1, 0a9b c, 0aaa / 0ab7; 0ad1 0x20, 0ae9 kind, 0b30
    terrain, 0b3b 0c5b)."""
    events: list = []
    for i in _indices(state):
        a = state.armies[i]
        if not _own_byte(state, a) or a.x == -1:
            continue
        if s8(a.moves_left) < s8(a.allowance):
            continue
        if (s8(a.moves_left) == s8(a.allowance) + 2
                and _terrain(state, a.x, a.y) != Terrain.CITY
                and a.order & 0x0F == KIND_CITY
                and not _city_intact(state, a.vector_dest & 0x7F)):
            c = a.vector_dest & 0x7F
            for j in _indices(state):
                b = state.armies[j]
                if (_own_byte(state, b) and b.x == a.x and b.y == a.y
                        and b.order & 0x0F == KIND_CITY and b.vector_dest & 0x7F == c):
                    b.order &= ORDER_LOW_KEEP
                    b.order &= ORDER_SUB_CLEAR
        if a.flags & F_EXPLORER:
            continue
        if a.order & 0x0F != KIND_NONE:
            continue
        if _terrain(state, a.x, a.y) == Terrain.CITY:
            continue
        events += send_to_city(state, i)
    return events


def last_rescue(state) -> list:
    """ovl22:0b4d last rescue: for records SCN 0x181 - 1 .. 0 own (cwde owner == word), on the
    map, with moves left == allowance + 2 (cwde words) and not on a City square: +0xc &= 0xff5f
    (0x20 and 0x80 cleared), +0xe &= 0xf0, goto (-1, -1) (+0x14 first), then 0c5b.
    Evidence: asm ovl22:0b4d..0c5a (0b68..0b73 cwde owner, 0b87 x, 0b9c..0bb7 +7 == +6 + 2,
    0bfe terrain 10, 0c10 &= 0xff5f, 0c1e &= 0xf0, 0c31 / 0c42 goto, 0c4a 0c5b)."""
    events: list = []
    for i in _indices(state):
        a = state.armies[i]
        if not _own_word(state, a) or a.x == -1:
            continue
        if s8(a.moves_left) != s8(a.allowance) + 2:
            continue
        if _terrain(state, a.x, a.y) == Terrain.CITY:
            continue
        a.flags &= FLAGS_LAST_RESCUE
        a.order &= ORDER_LOW_KEEP
        a.goto = (-1, -1)
        events += send_to_city(state, i)
    return events


def send_to_city(state, i: int) -> list:
    """ovl22:0c5b(i): send army i and its square-mates to a city.  near = ovl20:0981(a.x, a.y,
    cur); weak = strength < 3 or allowance < 8 (signed bytes); a walker (not flying) that is weak
    is disbanded (ovl24:015e(i, 1)).  n = 12c9(a's square, list, 8) (own armies with >= 8 moves
    left, selected); none -> return.  Entries with moves < 8 are dropped (never after 12c9's
    filter).  With flyers, heroes and other armies all present the others (walkers) are dropped.
    A changed list is selected again (ovl29:14d3).  n < 2 and weak -> disband army i.  Then
    0c8c:0529; lim = 10 * (a's strength / 2, truncating) without a stack hero DS:5e5e, else 50;
    lim = near + 10 when that is smaller; distance map 0555:1ab9(lim, a's square, DS:5dfc,
    DS:5dfa); t = 0f3c(n) with the 12c9 count; t -> ovl29:0ae7(list, 1, t, 0) and 0a8b:0001(the
    leader's goto, 0); none -> ovl24:00ca(list, 1) disbands the list.
    The dropped walkers leave holes (-1) in the list, which ovl29:14d3 and 0ae7 copy slot by
    slot into DS:5e3e (`Selection.moving` keeps them): with slot 0 dropped DS:5e62 is null
    after 14d3, 0529 then takes the first hero by slot and writes interrupt-vector words into
    the members' goto (not modelled: 0ae7 or 00ca follows, rules.selection.selection_step), and
    0f3c's 15c5 simulations copy DS:5e3e[0..DS:5dfe-1] with the null slot (plan register X38).
    00ca gets the list with its holes.
    Evidence: asm ovl22:0c5b..0f3b (0c97 ovl20:0981(x, y, SCN 0x110), 0ca2..0cc6 weak, 0cc9..0cf6
    flies / disband, 0d25 12c9, 0d32, 0d37..0d7b moves filter, 0d7d..0de3 counts, 0de5..0e56 drop
    walkers, 0e58..0e61 14d3, 0e69..0e7e n < 2 (jge) and weak, 0e81 0529, 0e86..0ea8 lim, 0ead..0ec1
    min, 0ec3..0eea 1ab9, 0ef2..0ef7 0f3c([bp-2]), 0f0c 0ae7, 0f22 0001, 0f30 ovl24:00ca)."""
    events: list = []
    a = state.armies[i]
    near = _phase("neutral").nearest_city(state, a.x, a.y, state.current)
    weak = s8(a.strength) < WEAK_STRENGTH or s8(a.allowance) < WEAK_ALLOWANCE
    if not _flies(state, a.type_id) and weak:
        return events + _phase("clean_city").delete_army(state, i, 1)
    n, lst = U.select_square(state, a.x, a.y, SQUARE_MOVES)
    if n == 0:
        return events
    changed = 0
    for s in range(7, -1, -1):
        if lst[s] != -1 and s8(state.armies[lst[s]].moves_left) < SQUARE_MOVES:
            lst[s] = -1
            changed = 1
    nf = nh = no = 0
    for s in range(7, -1, -1):
        if lst[s] == -1:
            continue
        b = state.armies[lst[s]]
        if _flies(state, b.type_id):
            nf += 1
        elif (b.type_id & 0xFF) == HERO_TYPE:
            nh += 1
        else:
            no += 1
    if nf and nh and no:
        for s in range(7, -1, -1):
            if lst[s] == -1:
                continue
            b = state.armies[lst[s]]
            if not _flies(state, b.type_id) and (b.type_id & 0xFF) != HERO_TYPE:
                lst[s] = -1
                changed = 1
    if changed:
        U.select_list(state, lst)
    if n < 2 and weak:
        return events + _phase("clean_city").delete_army(state, i, 1)
    S.selection_step(state)                               # 0c8c:0529
    sel = state.selection
    if M._record(state, sel.hero) is None:
        lim = _halve(s8(a.strength)) * LIM_PER_HALF_STRENGTH
    else:
        lim = LIM_HERO
    if near + LIM_NEAR_ADD < lim:
        lim = near + LIM_NEAR_ADD
    dm = P.distance_map(state, lim, a.x, a.y, sel.mode, sel.mask)
    t = pick_city(state, n, dm)
    if t != -1:
        U.order_stack(state, lst, KIND_CITY, t, 0)
        events += _execute_leader_goto(state)
    else:
        events += _phase("clean_city").delete_list(state, lst, 1)
    return events


def pick_city(state, n: int, dm) -> int:
    """ovl22:0f3c(n): the target city from the distance table `dm` (the 0555:1ab9 result 0c5b
    just made; the original locks the table 0555:1b0a and reads it).  For c = count-1..0 with
    an intact corner, not flagged unseen, not AI[+0x46], owned by neutral, cur, or a side cur is
    at war with (relation[cur][owner] & 3 == 2): d = ovl21:0a85(c, T, 0) (skip when x == -1);
    a foreign city needs 15c5 >= 75 (signed) and scores d; an own city scores d + 10 (role 7)
    or d + 30, + 100 when n >= 4; the lowest score (strict <, from 1000) wins, so the highest
    index wins ties.  -1 when none.
    Evidence: asm ovl22:0f3c..10e2 (0f44 1b0a, 0f4f / 0f54 starts, 0f59 jl 4, 0f6e loop, 0faf
    terrain 10, 0fc0 bit 0, 0fcf +0x46, 0fe2..102f owner 0xf / cwde == cur / relation, 1045
    ovl21:0a85(c, &x, &y, T, 0), 104f x == -1, 106a own, 108f 15c5, 109a jge 0x4b, 10a8..10bf own
    score, 10c2 jge, 10d7 1b2e)."""
    blk = block(state)
    best, bv = -1, PICK_START
    big = n >= PICK_BIG_N
    for c in range(len(state.cities) - 1, -1, -1):
        city = state.cities[c]
        if _terrain(state, city.x, city.y) != Terrain.CITY:
            continue
        if blk.city_flags[c] & CITY_FLAG_UNSEEN:
            continue
        if s16(blk.quest_city) == c:
            continue
        o = s8(city.owner)
        if (city.owner & 0xFF) != NEUTRAL and o != state.current \
                and relation(state, state.current, o) != WAR:
            continue
        d, x, _ = U.nearest_ring(state, c, dm, 0)
        if x == -1:
            continue
        if o != state.current:
            if U.win_odds(state, city.x, city.y) < PICK_P_MIN:
                continue
            v = d
        else:
            v = d + (PICK_STAGING_ADD if blk.role[c] == ROLE_STAGING else PICK_OWN_ADD)
            if big:
                v += PICK_BIG_ADD
        if v < bv:
            best, bv = c, v
    return best


# ------------------------------------------------------------------------------- specials


def specials(state) -> list:
    """ovl22:10e3 specials: for own cities (byte owner) c = count-1..0 with AI flag 0x20 (a hero
    in the city, ovl24:023f) and role != 7: n = 13b2(c.x + 1, c.y, list, 0, 0, 0); n -> r =
    11a6(list); r == 1 (a hero but no flyer) and no production under way (ovl29:0fd5 == 0) ->
    role 13.
    Evidence: asm ovl22:10e3..11a5 (10f7..1110 owner byte, 1115..1125 & 0x20, 112d role 7,
    1134..115e 13b2(x + 1, y, &list, 0, 0, 0), 1171 11a6, 1177 r == 1, 1184 0fd5, 1194 role 0xd)."""
    events: list = []
    blk = block(state)
    for c in range(len(state.cities) - 1, -1, -1):
        city = state.cities[c]
        if (city.owner & 0xFF) != (state.current & 0xFF):
            continue
        if not blk.city_flags[c] & CITY_FLAG_HERO:
            continue
        if blk.role[c] == ROLE_STAGING:
            continue
        n, lst = U.select_square_order(state, city.x + 1, city.y, 0, 0, 0)
        if n == 0:
            continue
        r, ev = hero_explore(state, lst)
        events += ev
        if r == HERO_EXPLORE_NO_FLYER and U.production_in_progress(state, c) == 0:
            blk.role[c] = ROLE_FLYER_WANTED
    return events


# ------------------------------------------------------------------------------- hero + flyer


def hero_explore(state, lst) -> tuple[int, list]:
    """ovl22:11a6(list): the first hero and the first flyer of the 8-slot `list` (modified in
    place, as the original's far list); no hero -> 0, no flyer -> 1.  list = [hero, flyer, -1..];
    both lose their order kind and index.  Sites s = nsites-1..0 not targeted by another own hero
    with kind 3 and index s (records N-1..0), with a seen square around (16ae), terrain 11, not a
    temple, not searched (map 0x4000): d = dist(hero, site); d < 15 and 215 - d > best, else
    d < 40 and 90 - d > best (signed, `jle` keeps the earlier candidate).  Then own cities (byte)
    count-1..0 on the same best: d = dist(hero, city) (- 80 for role 7); d < 15 and 115 - d,
    else d < 40 and 40 - d.  A site -> 0ae7(list, 3, site, 0x100), 0001(leader's goto), return
    15c3(hero, site) (0 or 2); else a city farther than 2 -> 0ae7(list, 1, city, 0) and 0001;
    return 0.  Returns (result, events).
    `list[s] == -1` reads army[-1]'s type (a map byte); a match would assign -1 to a variable
    that already is -1, so such entries are skipped.
    Evidence: asm ovl22:11a6..15c2 (11ae / 11b3 limits, 11b8..11c6 -1s, 11c8..1234 scan (11e5
    type 0x1c, 121d flies), 1236 / 123e returns, 1249..1271 hero square, 1274..1292 list,
    1296..12e0 +0xe / +0xf, 12ea site loop: 1320..1393 other hero, 13a4 16ae, 13d4 terrain 0xb,
    13e9 kind 1, 1404..1411 0x40, 141f dist, 1429..1460 scores; 1472 city loop: 148e owner byte,
    14c3 dist, 14d3 sub 0x50, 14dd..150e scores; 151b site -> 152d 0ae7, 1543 0001, 1551 15c3;
    1559 city, 1585 dist, 158d jle 2, 159d 0ae7, 15b3 0001; 15bd return 0)."""
    events: list = []
    hero = flyer = -1
    for s in range(M.K.STACK_MAX.value):
        e = lst[s]
        if e == -1:
            continue
        if hero == -1 and (state.armies[e].type_id & 0xFF) == HERO_TYPE:
            hero = e
        if flyer == -1 and _flies(state, state.armies[e].type_id):
            flyer = e
    if hero == -1:
        return HERO_EXPLORE_NO_HERO, events
    if flyer == -1:
        return HERO_EXPLORE_NO_FLYER, events
    h, f = state.armies[hero], state.armies[flyer]
    hx, hy = h.x, h.y
    for s in range(M.K.STACK_MAX.value):
        lst[s] = -1
    lst[0], lst[1] = hero, flyer
    f.order &= ORDER_LOW_KEEP
    h.order &= ORDER_LOW_KEEP
    f.vector_dest = 0
    h.vector_dest = 0
    bs, site, city_t = -1, -1, -1
    for s in range(len(state.sites) - 1, -1, -1):
        st = state.sites[s]
        sx, sy = st.x, st.y
        taken = False
        for j in _indices(state):
            b = state.armies[j]
            if (_own_byte(state, b) and j != hero and (b.type_id & 0xFF) == HERO_TYPE
                    and b.order & 0x0F == KIND_SITE and b.vector_dest & 0x7F == s):
                taken = True
                break
        if taken:
            continue
        if not U.seen_near(state, sx, sy):
            continue
        if _terrain(state, sx, sy) != Terrain.SITE:
            continue
        if st.kind == SiteKind.TEMPLE:
            continue
        if state.world.flags[sy * MAP_W + sx] & MAP_EXPLORED:
            continue
        d = P.distance((hx, hy), (sx, sy))
        if d < SITE_NEAR and SITE_NEAR + SITE_NEAR_BONUS - d > bs:
            bs, site = SITE_NEAR + SITE_NEAR_BONUS - d, s
        elif d < SITE_FAR and SITE_FAR + SITE_FAR_BONUS - d > bs:
            bs, site = SITE_FAR + SITE_FAR_BONUS - d, s
    for c in range(len(state.cities) - 1, -1, -1):
        city = state.cities[c]
        if (city.owner & 0xFF) != (state.current & 0xFF):
            continue
        d = P.distance((hx, hy), (city.x, city.y))
        if block(state).role[c] == ROLE_STAGING:
            d -= STAGING_PULL
        if d < SITE_NEAR and SITE_NEAR + CITY_NEAR_BONUS - d > bs:
            bs, city_t = SITE_NEAR + CITY_NEAR_BONUS - d, c
        elif d < SITE_FAR and SITE_FAR - d > bs:
            bs, city_t = SITE_FAR - d, c
    if site != -1:
        U.order_stack(state, lst, KIND_SITE, site, F_SITE_MISSION)
        events += _execute_leader_goto(state)
        r, ev = search_on_arrival_result(state, hero, site)
        return r, events + ev
    if city_t != -1:
        city = state.cities[city_t]
        if P.distance((hx, hy), (city.x, city.y)) > CITY_MIN_DIST:
            U.order_stack(state, lst, KIND_CITY, city_t, 0)
            events += _execute_leader_goto(state)
    return HERO_EXPLORE_NO_HERO, events


# ------------------------------------------------------------------------------- search on arrival


def search_on_arrival_result(state, i: int, s: int) -> tuple[int, list]:
    """ovl22:15c3(i, s): army i searches site s when it stands on it with moves left != 0
    (else 0).  Not terrain 11 -> 2; a searched non-temple (map 0x4000) -> 2; DS:5e62 = army i;
    ovl34:0000 (`search_command`); site kind (read after the search) 1 with Quests on and no
    active quest of cur -> ovl01:0d7a(1); army i not a hero (re-read: a hero killed by the
    guardian is a freed record) -> 0; 0x40 cleared on DS:5e3e[k] for k < DS:5dfe (signed);
    no Hidden Map or the kind (read now) not 5 -> 2; else every own army (records N-1..0, byte
    owner) with order kind 0 and a w13 type on the site's square gets 0x20 and ovl20:0e4b(j, -1);
    -> 2.  Returns (result, events).
    Evidence: asm ovl22:15c3..1802 (15d1..15f2 site x / y, 1604 / 1618 position, 1627 cwde +7,
    1631 return 0, 1657 terrain 0xb, 166c kind 1, 1687..1694 0x40, 16a7 / 16ad DS:5e62, 16b0
    ovl34:0000, 16bf kind 1, 16cc SCN 0x11e, 16e3 quest +0, 16ed ovl01:0d7a(1), 16fd type 0x1c,
    1708..172e loop (signed jl DS:5dfe), 1735 SCN 0x124, 174a kind 5, 175a..17f9 allies: 1776
    owner byte, 178c kind, 17a8 DS:45c8, 17be / 17d2 square, 17e1 |= 0x20, 17ea 0e4b; 17fc 2)."""
    events: list = []
    st = state.sites[s]
    sx, sy = st.x, st.y
    a = state.armies[i]
    if a.x != sx or a.y != sy or s8(a.moves_left) == 0:
        return SITE_RESULT_NONE, events
    if _terrain(state, sx, sy) != Terrain.SITE:
        return SITE_RESULT_DONE, events
    if st.kind != SiteKind.TEMPLE and state.world.flags[sy * MAP_W + sx] & MAP_EXPLORED:
        return SITE_RESULT_DONE, events
    state.selection.selected = i                          # DS:5e62 = &army[i]
    events += search_command(state)
    st = state.sites[s]
    if (st.kind == SiteKind.TEMPLE and state.options.quests != 0
            and state.players[state.current].quest.active == 0):
        events += Q.assign(state, computer=True)
    a = state.armies[i]
    if (a.type_id & 0xFF) != HERO_TYPE:
        return SITE_RESULT_NONE, events
    sel = state.selection
    for k in range(s16(sel.count)):
        if k >= M.K.STACK_MAX.value:
            break
        m = M._record(state, sel.moving[k] if k < len(sel.moving) else -1)
        if m is not None:
            m.flags &= ~F_DONE & 0xFFFF
    if not state.options.hidden_map:
        return SITE_RESULT_DONE, events
    if state.sites[s].kind != SiteKind.ALLIES_RUIN:
        return SITE_RESULT_DONE, events
    for j in _indices(state):
        b = state.armies[j]
        if (_own_byte(state, b) and b.order & 0x0F == KIND_NONE and _w13(state, b.type_id)
                and b.x == sx and b.y == sy):
            b.flags |= F_EXPLORER
            events += _phase("neutral").explore(state, j, -1)
    return SITE_RESULT_DONE, events


def search_on_arrival(state, i: int, s: int) -> list:
    """ovl22:15c3(i, s) for the move executor 0a8b:0001 (rules.movement HOOKS
    ai_search_on_arrival), which discards the result: the events of `search_on_arrival_result`.
    Evidence: asm 0a8b:01c8 (the call; ax is not read afterwards)."""
    return search_on_arrival_result(state, i, s)[1]


# ------------------------------------------------------------------------------- ovl34:0000


def search_command(state) -> list:
    """ovl34:0000, the Search command, on the current selection as the AI made it:
    `rules.ruins.search_selection` (the sage hook required as part of End Turn).
    Evidence: asm ovl22:16b0 / ovl20:12eb -> ovl34:0000 (see `rules.ruins.search_selection`)."""
    return R.search_selection(state, C.EndTurn)
