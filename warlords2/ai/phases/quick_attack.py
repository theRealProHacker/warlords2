"""ovl26: the quick-attack phase and the AI callbacks of the rules code (ai.md §6.11, §6.11a).

* `quick_attack` = ovl26:04ba (ovl25:0272), `quick_attack_city` = 053f;
* `captured` = ovl26:0000 (the move executor 0a8b:0416, rules.movement HOOKS ai_captured);
* `after_battle` = ovl26:038d (last step of the AI's battle ovl36:124a(x, y, 1) at 16a3,
  rules.combat HOOKS ai_after_battle);
* `sage` = ovl26:0080 (ovl34:015a, rules.ruins HOOKS ai_sage).
"""
from __future__ import annotations

from ...model import events as E
from ...model.ids import Control, Relation, Terrain
from ...rules import city as CT
from ...rules import economy as EC
from ...rules import movement as M
from ...rules.bonuses import s8
from ...rules.economy import add_gold, s16
from ...rules.constants import turn as KT
from ...rules.heroes import turn
from ...rules.present import present
from ...rules.setup import distance
from ..state import block
from ..tables import is_neighbour
from ..util import order_stack, select_square, win_odds

NO = -1
NEUTRAL = 0x0F
ROLES_QUICK = (5, 8, 6, 4, 14, 7)        # DS:0932 (-1 terminated), read from the EXE
ROLE_SOURCE, ROLE_STAGING = 6, 7
CF_UNSEEN = 0x01
QUICK_MIN_ARMIES = 4                     # ovl26:0526 (jb 4)
STAGING_MIN_ARMIES = 12                  # ovl26:05a0 (jae 0xc)
POOR_GOLD = 40                           # ovl26:05bd (jge 0x28)
ODDS_POOR, ODDS = 65, 85                 # ovl26:05e7 / 05ec
MIN_MOVES = 8                            # ovl26:05f2 push 8 (12c9 minmoves)
SMALL, MEDIUM = 4, 6                     # ovl26:0764, 0770
NEAR_SMALL, NEAR_MEDIUM = 25, 15         # ovl26:076a, 0776 (unsigned bytes)
TURNS_START = 100                        # ovl26:0554
KIND_CITY = 1
PLUNDER_TURNS = 10                       # ovl26:0042 (jl 0xa)
PLUNDER_SACK = 200                       # ovl26:005f (jl 0xc8)
SAGE_GEM = (3, 500, 500)                 # ovl26:0088 push dword 0x1f401f4, push 3
SAGE_JITTER = (1, 11, -6)                # ovl26:029c push dword 0xfffa000b, push 1
SAGE_NEAR, SAGE_CLUSTER = 20, 4          # ovl26:01c8 (jge 0x14), 022e (jl 4)
SAGE_FAR = 1000                          # ovl26:0163
SAGE_MAX_X, SAGE_MAX_Y = 0x6F, 0x9B      # ovl26:02e6 / 02f7
QUESTS_OCCUPY, QUESTS_RAZE = 4, 5        # quest types (EL §5.7)
QUEST_EVENT_RAZE, QUEST_EVENT_OCCUPY = 2, 4    # ovl01:1ded first word (ovl26:04a3 / 04ad)


def _owner(state, c: int) -> int:
    return s8(state.cities[c].owner)


def _intact(state, c: int) -> bool:
    city = state.cities[c]
    return state.world.terrain(city.x, city.y) == Terrain.CITY


def _income(state, p: int) -> int:
    """DS:5dca[p], the cache of ovl62:0372 (read at ovl26:05d1)."""
    return EC.cached_income(state, p)


def _upkeep(state, p: int) -> int:
    """DS:5dda[p], the cache of ovl62:02bf (read at ovl26:05e1)."""
    return EC.cached_upkeep(state, p)


def quick_attack(state) -> list:
    """ovl26:04ba: nothing when AI[+0x48] != 0 (card +0x2b); else 053f(c) for every own city c
    = count-1..0 (signed owner) with a role of DS:0932 {5, 8, 6, 4, 14, 7} and AI[+0x182 + c]
    >= 4 (unsigned byte).
    Evidence: asm ovl26:04ba..053e (04c2 +0x48, 04ce loop, 04ea cwde ==, 04f1..051e list,
    0526 jb 4, 0531 053f)."""
    b = block(state)
    p = state.current
    if b.no_quick_attack != 0:
        return []
    events: list = []
    for c in range(len(state.cities) - 1, -1, -1):
        if _owner(state, c) != p or b.role[c] not in ROLES_QUICK:
            continue
        if b.armies_here[c] & 0xFF < QUICK_MIN_ARMIES:
            continue
        events += quick_attack_city(state, c)
    return events


def quick_attack_city(state, c: int) -> list:
    """ovl26:053f(c): x = c.x + 1 (c.x for role 7), y = c.y; role 7 with AI[+0x182 + c] < 12 ->
    nothing.  thr = 65 when gold (signed word) < 40 and income DS:5dca < upkeep DS:5dda, else
    85.  n = 12c9(x, y, L, 8) (selected by 14d3); 0 -> nothing; n < 4 with role 6 or 7 ->
    nothing.  For the six neighbours t (ovl25:0656, i = 5..0): skip 0xff, flagged unseen, own,
    not intact, AI[+0x46], or owned by a side (not 0x0f) whose current relation from us is not
    war; p = 15c5(t) (rnd); p == 0: (n < 4 and d < 25) or (n < 6 and d < 15) -> danger; p >=
    thr: turns = d / max(DS:5e00 - 2, 1) + 1, the fewest turns wins, then the higher p.  No
    danger and a pick -> 0ae7(L, 1, pick, 0) and 0a8b:0001(leader goto, 0).
    Evidence: asm ovl26:053f..080f (055e..058c x / y, 058d..05a6 role 7, 05b0..05ef thr,
    05fd 12c9, 060f..0632, 0642 0656, 064a..07d3 i = 5..0: 065c, 066b, 068c, 06d1, 06e4, 06f7..
    072c, 0751 15c5, 0760..0785 danger, 0787 jl thr, 078c..07ae turns, 07b1..07c9, 07d6..07e0,
    07ee 0ae7, 0804 0001)."""
    b = block(state)
    p = state.current
    city = state.cities[c]
    role = b.role[c]
    x = city.x if role == ROLE_STAGING else city.x + 1
    y = city.y
    if role == ROLE_STAGING and b.armies_here[c] & 0xFF < STAGING_MIN_ARMIES:
        return []
    poor = (s16(state.players[p].gold) < POOR_GOLD
            and s16(_income(state, p)) < s16(_upkeep(state, p)))
    thr = ODDS_POOR if poor else ODDS
    n, L = select_square(state, x, y, MIN_MOVES)
    if n == 0:
        return []
    if n < SMALL and role in (ROLE_SOURCE, ROLE_STAGING):
        return []
    _, ids, dists = is_neighbour(state, c, 0)
    danger, best, bp, bt = 0, NO, 0, TURNS_START
    for i in range(5, -1, -1):
        t = ids[i]
        if t == 0xFF or b.city_flags[t] & CF_UNSEEN or _owner(state, t) == p:
            continue
        if not _intact(state, t) or s16(b.quest_city) == t:
            continue
        tc = state.cities[t]
        if tc.owner & 0xFF != NEUTRAL:
            idx = p * 8 + _owner(state, t)
            if not 0 <= idx < 64:
                raise RuntimeError("relation byte %d outside the matrix" % idx)
            if state.relations[idx // 8][idx % 8] & 3 != Relation.WAR:
                continue
        pw = win_odds(state, tc.x, tc.y) & 0xFF
        d = dists[i] & 0xFF
        if pw == 0:
            if (n < SMALL and d < NEAR_SMALL) or (n < MEDIUM and d < NEAR_MEDIUM):
                danger = 1
            continue
        if pw < thr:
            continue
        m = s16(state.selection.moves - 2)
        turns = _idiv(d, m if m >= 1 else 1) + 1
        if turns < bt or (turns == bt and pw > bp):
            best, bp, bt = t, pw, turns
    if danger or best == NO:
        return []
    order_stack(state, L, KIND_CITY, best, 0)
    lead = M._record(state, state.selection.selected)
    _, events = M.execute_move(state, lead.goto[0], lead.goto[1], 0)
    return events


def _idiv(a: int, b: int) -> int:
    q = abs(a) // abs(b)
    return q if (a < 0) == (b < 0) else -q


def captured(state, c: int, prev: int) -> list:
    """ovl26:0000(c, prev), the move executor's call after the computer took city c from side
    `prev` (0a8b:0416): with the side on turn a computer, prev a human (SCN 0x0d0 == 0),
    AI[+0x42] != 0 (card +0x61) and max(turn, 1) < 10, and c not AI[+0x46]: ovl31:07d0(c) >=
    200 -> 199c(c) (sack), else 1864(c, 0) (its result is not used); returns 1 then, else 0.
    The executor ignores the value; the events are returned.
    Evidence: asm ovl26:0000..007f (001b 0x0d0[cur] == 0 -> 0, 002a 0x0d0[prev] != 0 -> 0, 0036
    +0x42, 003d ovl61:225b jl 0xa, 004f +0x46 == c -> 0, 0056 07d0, 005f jl 0xc8, 0067 199c,
    0072 1864(c, 0), 007a 1)."""
    from .assault import capture_choice, sack
    p = state.current
    b = block(state)
    if state.players[p].control == Control.HUMAN:
        return []
    if not 0 <= prev < 8:
        raise RuntimeError("ovl26:0000: SCN 0x0d0[%d] outside the side table" % prev)
    if state.players[prev].control != Control.HUMAN or b.plunder_early == 0:
        return []
    if turn(state) >= PLUNDER_TURNS:
        return []
    if s16(b.quest_city) == c:
        return []
    if CT.sack_value(state, c) >= PLUNDER_SACK:
        return sack(state, c)
    _, events = capture_choice(state, c, 0)
    return events


def after_battle(state, x: int, y: int) -> list:
    """ovl26:038d(x, y), the last step of the AI's battle ovl36:124a(x, y, 1): with Quests on
    and an active quest of the side on turn whose hero (record +4) is among the battle's
    attackers DS:42c6[0..DS:42c4), quest type (+2) 4 or 5 and target city (+6) ==
    ovl62:044a(x, y): AI[+0x4a] += 1, AI[+0x46] = -1; type 5 -> 1864(city, 1) (forced; the
    result is not used) and ovl01:1ded(2, 0, 0, 0, 0); type 4 -> ovl01:1ded(4, 0, 0, 0, 0).
    Evidence: asm ovl26:038d..04b9 (0398 SCN 0x11e, 03b2 2c04:1103 + 0xc cur, 03bd..0404
    attackers (cwde DS:42c4, far pointers vs 1e1d:8880 + 0x16 hero), 041f / 0439 +2, 0447
    ovl62:044a(x, y), 0463 +6 == city, 046e +0x4a, 0472 +0x46, 048a type 5, 0495 1864(c, 1),
    049d..04af 1ded words, 04b4 add sp 0xa)."""
    from ...rules import quests as Q
    from .assault import capture_choice
    p = state.current
    if not state.options.quests:
        return []
    q = state.players[p].quest
    if not q.active:
        return []
    bw = state.battle_work
    if not any(aid == q.hero for aid in bw.attackers):
        return []
    if q.type not in (QUESTS_OCCUPY, QUESTS_RAZE):
        return []
    c = state.city_at(x, y)
    if s16(q.target) != c:
        return []
    b = block(state)
    b.quest_battles = s16(b.quest_battles + 1)
    b.quest_city = NO
    events: list = []
    if q.type == QUESTS_RAZE:
        _, ev = capture_choice(state, c, 1)
        events += ev
        _, ev = Q.check(state, (QUEST_EVENT_RAZE, 0, 0, 0, 0))
    else:
        _, ev = Q.check(state, (QUEST_EVENT_OCCUPY, 0, 0, 0, 0))
    events += ev
    return events


def sage(state, site: int = -1) -> list:
    """ovl26:0080(), the computer at a sage (ovl34:015a; `site` is the hook's argument, not
    read): gift = rnd(3,500,500) first.  Over the neutral cities c = count-1..0 flagged unseen
    with a neighbour (ovl25:0656, 5..0) owned by the side: n = the neutral flagged cities k
    (count-1..0, c included) with dist(c, k) < 20, d = the distance to the nearest own city
    (from 1000); n >= 4 and (n > best n, or equal and d > best d) -> c's corner.  Without
    Hidden Map or a pick: gold += gift (word).  Else x = corner x + rnd(1,11,-6), y = corner y
    + rnd(1,11,-6), each raised to 0, cut to 111 / 155; ovl34:0cd6(x, y) (the map view,
    `rules.ruins.map_view`, 4 rnd); then, when (SCN 0x159 and not DS:3254) or the side is
    human, the overview redraw ovl63:2200 + ovl63:0000(1, 1, NULL) (present point "overview").
    Evidence: asm ovl26:0080..038c (0088 rnd, 009b..00aa -1 / -1 / -1 / 0, 00b4 loop, 00c6
    0x0f, 00d1 bit 0, 00f3 0656, 00fb..0131, 013a..015b corner, 015e / 0163, 016d..0229 inner
    loop (01c8 jge 0x14, 021c jle), 022e jl 4, 0234..0276, 0288 SCN 0x124, 0293 -1, 02a4 / 02b6
    rnd, 02c0..0306 clamps, 030d ovl34:0cd6, 031a..0340 the redraw gate, 034c ovl63:2200, 0360
    ovl63:0000, 0374..0384 gold)."""
    from ...rules import ruins as RU
    p = state.current
    b = block(state)
    gift = state.rng.rnd(*SAGE_GEM)
    bx = by = NO
    bn, bd = NO, 0
    cities = state.cities
    for c in range(len(cities) - 1, -1, -1):
        city = cities[c]
        if city.owner & 0xFF != NEUTRAL or not b.city_flags[c] & CF_UNSEEN:
            continue
        _, ids, _ = is_neighbour(state, c, 0)
        if not any(ids[i] != 0xFF and _owner(state, ids[i]) == p for i in range(5, -1, -1)):
            continue
        n, d = 0, SAGE_FAR
        for k in range(len(cities) - 1, -1, -1):
            kc = cities[k]
            if kc.owner & 0xFF == NEUTRAL:
                if b.city_flags[k] & CF_UNSEEN and distance(city.x, city.y, kc.x, kc.y) < SAGE_NEAR:
                    n += 1
            elif s8(kc.owner) == p:
                dd = distance(city.x, city.y, kc.x, kc.y)
                if d > dd:
                    d = dd
        if n >= SAGE_CLUSTER and (n > bn or (n == bn and d > bd)):
            bd, bn = d, n
            bx, by = city.x, city.y
    if not state.options.hidden_map or bx == NO:
        add_gold(state, p, gift)
        return [E.SiteSearched({"site": site, "gem": gift})]
    dx = state.rng.rnd(*SAGE_JITTER)
    dy = state.rng.rnd(*SAGE_JITTER)
    x = s16(bx + dx)
    x = x if x >= 0 else 0
    y = s16(by + dy)
    y = y if y >= 0 else 0
    x = x if x < SAGE_MAX_X else SAGE_MAX_X
    y = y if y < SAGE_MAX_Y else SAGE_MAX_Y
    events = RU.map_view(state, x, y)
    viewed = state.flags.get(KT.SCN_VIEWED.value, 0)
    if (viewed and not state.ai.proc.single_view) or state.players[p].control == Control.HUMAN:
        present("overview", at="ovl26:0360")          # ovl63:2200(cur) 034c, ovl63:0000(1, 1, NULL)
    return events
