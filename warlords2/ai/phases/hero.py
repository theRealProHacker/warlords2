"""ovl28: the computer's move Hero phase and its hooks (ai.md §6.2).

Functions named after their address (ai.md §9): `move_hero` 0000, `pick_up` 0427,
`site_at` 056d, `temple_ordinal` 0600, `blessing_flag` 063c, `hero_table` 065d,
`go_site_or_item` 07ea, `go_city` 0b75, `quest_city` 0cf3, `choose` 0efc, `score_sites` 0fda,
`score_items` 11f8, `score_cities` 1348, `site_ok` 1637, `item_ok` 1736, `share_items` 17db,
`hand_out` 1a3d.

Conventions: `cur` = SCN 0x110 (`state.current`), `AI` = the side's block (DS:40ee,
`ai.state.block`), `N` = SCN 0x181 (army high-water mark), `T` = ovl61:225b
(`rules.heroes.turn`).  The hero table S lives in 0000's frame (bp-0x48) and is passed by far
pointer; here it is a `HeroTable`.  Loops written `for i = n-1..0` are the Borland
`mov ax, i; dec i; or ax, ax; jne body` loops.  Functions that reach the move executor
(0a8b:0001) return its events; where the original also returns a value they return
(value, events).

Not modelled because they change no game state: the debug sprintf 0000:4944 into DS:5c88 (no
reader of the text) and ovl29:170c (centres the view and shows the move for a human side only,
ai.md §5.15; the hero phase runs for computer sides).

Cross-phase calls go through `importlib.import_module` at call time (ovl20 `neutral`, ovl24
`clean_city`), so a test can put a stand-in into sys.modules.
"""
from __future__ import annotations

import importlib
from dataclasses import dataclass, field

from ...model.ids import HERO_TYPE, MAP_EXPLORED, MAP_W, NO_OWNER, ItemState, ItemType, Terrain
from ...rules import movement as M
from ...rules.bonuses import s8
from ...rules.heroes import turn
from ...rules.pathfinding import distance
from ...rules.selection import selection_step
from .. import util as U
from ..state import block

N_HEROES = 6                      # S+0x00 .. +0x0a, 065d 0667 (dx = 6) / 06cc (cmp si, 6)
N_ITEMS = 22                      # items 21..0: 0427 0471, 11f8 1239 (si = 0x16), 17db 17f9
LIST = 8                          # ovl29:13b2 / 12c9 list of 8 words
KIND_MASK, INDEX_MASK = 0x0F, 0x7F                # army +0xe low nibble, +0xf >> 1
ORDER_NONE, ORDER_CITY, ORDER_ITEM, ORDER_SITE, ORDER_KEEP = 0, 1, 2, 3, 4
QUEST_OCCUPY, QUEST_RAZE = 4, 5                   # 0000 0071 / 008b, 0cf3 0d1a / 0d34
TEMPLE = 1                                        # site +0x18 kind 1
MIN_MOVES = 4                                     # 0000 0406: moves left (signed byte) >= 4
ROUNDS = 2                                        # 0000 03f6
EXPLORE_TURNS, EXPLORE_MOVES = 10, 8              # 0000 0377 (T < 10), 037c (12c9 minmoves 8)
GROUP_ALLOWANCE = 12                              # 07ea 08a8, 0b75 0c04, 1348 13b4: 13b2 minallow
FAR_THREAT = 100                                  # 07ea 095a: no city -> threat distance 100
THREAT = 15                                       # 07ea 09d7 / 0a2b (cmp 0xf)
SMALL_GROUP = 3                                   # 07ea 0a25 / 0a3a
ITEM_OFFSET = 1000                                # 07ea 0870 (add di, 0x3e8), 0ad1
ARRIVED = 4                                       # 07ea 0b35 / 0b64: 0a8b:0001 status 4
STAY_THREAT = ((5, 15), (None, 10))               # 0b75 0cb1..0cbb: T > 5 -> 15, else 10
QUEST_NEED_TURN = 8                               # 0cf3 0da1
QUEST_ODDS = 75                                   # 0cf3 0e7b
QUEST_MINMOVES = 8                                # 0cf3 0db1
ROLL = (1, 20, 0)                                 # 0efc 0f05..0f0a (push dword 0x14, push 1)
SCORE_BASE = 100                                  # 0efc 0f15 / 0f3c / 0f90 / 0fbb
CITY_GARRISON_MAX = 4                             # 0efc 0f78 (jbe)
CHOICE_TEMPLE, CHOICE_ITEM, CHOICE_SITE, CHOICE_CITY = 1, 2, 3, 4
SITE_LIM = (5, 25)                                # 0fda 101e / 1023: city order -> 5, else 25
ITEM_LIM = (5, 15)                                # 11f8 122e / 1233
START_DIST = 100                                  # 0fda 0ff7 / 1001, 11f8 1212
CITY_START_DIST = 20                              # 1348 1365
CITY_ODDS = ((3, 95), (None, 75))                 # 1348 141f..142a: n < 3 -> 95, else 75
CURRENT_BONUS = 20                                # 1348 1565
WAR = 2                                           # 1348 14d3: relation & 3 == 2
SITE_TURNS, SITE_SPECIAL = (2, 3), 12             # 1637 169f..16a1 (2 T + 3), 16b8 (+12)
# DS:0958: blessing flags of temples #1..#4 (army +0xc bits), then for ordinal 4 the word at
# DS:0960, the bytes "Sc" of "Scan dist %d, ..." (EXE file offset 0x2000 + 0x31250 + 0x958:
# 02 00 04 00 08 00 10 00 53 63).
BLESSING = (0x0002, 0x0004, 0x0008, 0x0010, 0x6353)
TEMPLE_MAX = 4                                    # 0600 0624 (cmp cx, 4)
# 17db item classes (jump table 1a2d, item type 1..8 -> case)
B_TYPES = (1, 2, 8)                               # 1896: battle / command items
F_TYPE, M_TYPE, G_TYPE = 5, 6, 7                  # 189b, 18a0, 18a5
EMPTY = 0xFF


@dataclass
class HeroTable:
    """The hero table S (0000's frame bp-0x48, ai.md §6.2)."""
    heroes: list[int] = field(default_factory=lambda: [-1] * N_HEROES)     # +0x00 + 2j
    city: list[int] = field(default_factory=lambda: [-1] * N_HEROES)       # +0x0c + 2j
    site: list[int] = field(default_factory=lambda: [-1] * N_HEROES)       # +0x18 + 2j (write-only)
    fly: list[int] = field(default_factory=lambda: [0] * N_HEROES)         # +0x24 + 2j (write-only)
    temple: int = -1              # +0x30 quest temple
    temple_dist: int = 100        # +0x32
    site_t: int = -1              # +0x34 site
    site_dist: int = 100          # +0x36
    city_t: int = -1              # +0x38 enemy city
    city_dist: int = -1           # +0x3a
    item: int = -1                # +0x3c item
    item_dist: int = 100          # +0x3e


def _phase(name: str):
    return importlib.import_module("warlords2.ai.phases." + name)


def _army(state, i: int):
    return state.armies[i]


def _own_hero(state, a) -> bool:
    """`mov al, [+5]; cwde; cmp ax, SCN 0x110` and `cmp byte [+4], 0x1c` (0000 00e5..0104,
    03cc..03e8, 065d 06a2..06c1)."""
    return s8(a.owner) == state.current and a.type_id & 0xFF == HERO_TYPE



def _terrain(state, x: int, y: int) -> int:
    if not (0 <= x < MAP_W and 0 <= y < len(state.world.tiles) // MAP_W):
        raise RuntimeError("ovl28: map read at (%d, %d) off the map" % (x, y))
    return int(state.world.terrain(x, y))


def _explored(state, x: int, y: int) -> bool:
    """Bit 6 of the map word's high byte (0x4000, `es:[bx + 1]; shr 6; and 1`)."""
    return bool(state.world.flags[y * MAP_W + x] & MAP_EXPLORED)


def _flies(state, a) -> bool:
    """DS:45c4 + 6 * type (cwde) != 0 (07ea 098f..099a)."""
    return bool(M.type_flag(state, a.type_id, "flag16"))


def _city_owner(state, c: int) -> int:
    """City record c +0x15 (2c04:1592 + 0x41 c) as a byte; record -1 is 2c04:1551, the relation
    byte [2][6] (ai.md §6.1, §10.2)."""
    if c == -1:
        return state.relations[2][6] & 0xFF
    return state.cities[c].owner & 0xFF


def _move_leader(state):
    """0a8b:0001(DS:5e62.goto, 0) -> (status, events)."""
    lead = state.armies[state.selection.selected]
    return M.execute_move(state, lead.goto[0], lead.goto[1], 0)


# ------------------------------------------------------------------------------- 0000


def move_hero(state) -> list:
    """ovl28:0000 move Hero: AI[+0x46] = the quest city of an active occupy / raze quest (Quests
    on), else -1; the hero table (065d); for j = 5..0 (ascending army index) each own hero:
    clean city 023f(its city, 1); the quest hero marches on the quest city (0cf3) and is done
    when that moved it; a hero with a site order either goes on (1637 still ok: 07ea(j, 3, S,
    1)) or the site orders on its square are cleared; then up to two rounds while it has >= 4
    moves: 0fda, 11f8, 1348, the choice 0efc and its move (1 nothing, 2 / 3 07ea, 4 0b75), and
    with choice 0 after a move under Hidden Map before turn 10, when exactly one own army with
    >= 8 moves stands on the hero's square, it explores (ovl20:0e4b(h, -1)).  The rounds end when
    the hero is no longer an own hero.
    Evidence: asm ovl28:0000..041e (000d..002f task-force test, result [bp-4] never read; 0031
    AI +0x46 = -1; 0040..00ae SCN 0x11e / Q +0 / +2 in (4, 5) / +6; 00b9 065d; 00bf / 0411 j =
    5..0; 00d3..0104 h, owner cwde, type; 0118..0129 S +0x0c signed >= 0 -> ovl24:023f(c, 1);
    0136..0180 Quests, Q +0, Q +4 == h, 0cf3; 018d..01e8 kind 3, 1637, S +0x34, 07ea(j, 3, &S,
    1) result dropped; 01eb..02c9 clear loop N-1..0 (owner, x, y, kind == the hero's kind re-read
    each time; +0xe &= 0xf0, +0xf &= 1, +0x14 / +0x12 = -1); 02cc..02d4 go / rounds / moved;
    02dc..0311 rounds += 1, 0fda, 11f8, 1348, 0efc; 031a..0324 table 041f; 0329 -> 03c0; 032c /
    0348 moved = 1, 07ea / 0b75 -> go; 035f..03b8 moved, SCN 0x124, ovl61:225b < 10, 12c9(x, y,
    &L, 8) == 1, ovl20:0e4b(h, -1); 03c0 go = 0; 03c2..03f0 own hero test; 03f2..040c go,
    rounds < 2, +7 >= 4 signed)."""
    events: list = []
    p = state.current
    b = block(state)
    b.quest_city = -1
    q = state.players[p].quest
    if state.options.quests and q.active != 0 and q.type in (QUEST_OCCUPY, QUEST_RAZE):
        b.quest_city = q.target
    S = hero_table(state)
    for j in range(N_HEROES - 1, -1, -1):
        h = S.heroes[j]
        if h == -1 or not _own_hero(state, _army(state, h)):
            continue
        if S.city[j] >= 0:
            events += list(_phase("clean_city").clean_city(state, S.city[j], 1) or [])
        q = state.players[p].quest
        if state.options.quests and q.active != 0 and q.hero == h:
            r, ev = quest_city(state, j, S)
            events += ev
            if r != 0:
                continue
        a = _army(state, h)
        if a.order & KIND_MASK == ORDER_SITE:
            s = a.vector_dest & INDEX_MASK
            if site_ok(state, s, h):
                S.site_t = s
                _, ev = go_site_or_item(state, j, ORDER_SITE, S, 1)
                events += ev
            else:
                for o in U._scan(state):
                    a = _army(state, h)
                    if (s8(o.owner) == p and o.x == a.x and o.y == a.y
                            and o.order & KIND_MASK == a.order & KIND_MASK):
                        o.order &= 0xF0
                        o.vector_dest = 0
                        o.goto = (-1, -1)
        go, rounds, moved = 1, 0, 0
        while go and rounds < ROUNDS and s8(_army(state, h).moves_left) >= MIN_MOVES:
            rounds += 1
            score_sites(state, j, S)
            score_items(state, j, S)
            score_cities(state, j, S)
            c = choose(state, j, S)
            if c == CHOICE_TEMPLE:
                go = 0
            elif c in (CHOICE_ITEM, CHOICE_SITE):
                moved = 1
                go, ev = go_site_or_item(state, j, c, S, 0)
                events += ev
            elif c == CHOICE_CITY:
                moved = 1
                go, ev = go_city(state, j, S, 0)
                events += ev
            else:
                if moved and state.options.hidden_map and turn(state) < EXPLORE_TURNS:
                    a = _army(state, h)
                    n, _ = U.select_square(state, a.x, a.y, EXPLORE_MOVES)
                    if n == 1:
                        events += list(_phase("neutral").explore(state, h, -1) or [])
                go = 0
            if not _own_hero(state, _army(state, h)):
                go = 0
    return events


# ------------------------------------------------------------------------------- 0427 .. 065d


def pick_up(state, x: int, y: int) -> list:
    """ovl28:0427(x, y): the selected hero DS:5e5e picks up the items lying on (x, y) (on a City
    square: in the 2x2 block x..x+1, y..y+1).  This is `rules.movement.pick_up`, which the move
    executor already calls; re-exported under the ai.md §9 name for ovl24:023f.
    Evidence: asm ovl28:0427..056c (see rules.movement.pick_up; the holder is the index of the
    record DS:5e5e among N-1..0, 051c..055a, i.e. the hero's id)."""
    return M.pick_up(state, x, y)


def site_at(state, x: int, y: int) -> tuple[int, int | None]:
    """ovl28:056d(x, y, &kind): -1 unless (x, y) is terrain 11 holding a site s (ovl62:04b5);
    then *kind = site +0x18 (sign-extended); -1 when the kind is not a temple and the square's
    explored bit (0x4000) is set; else s.  Returns (s or -1, kind or None when not written).
    Evidence: asm ovl28:056d..05ff (059a..05a7 terrain != 0xb, 05b0..05bc ovl62:04b5 jl, 05c8..05d1
    cbw kind -> *kind, 05d4 == 1, 05eb..05f8 bit 6 of the high byte)."""
    if _terrain(state, x, y) != Terrain.SITE:
        return -1, None
    s = state.site_at(x, y)
    if s < 0:
        return -1, None
    kind = s8(state.sites[s].kind)
    if kind != TEMPLE and _explored(state, x, y):
        return -1, kind
    return s, kind


def temple_ordinal(state, s: int) -> int:
    """ovl28:0600(s): k = number of temples (kind 1) before site s in table order, counting up to
    4; -1 when s >= the number of sites (signed).
    Evidence: asm ovl28:0600..063b (0605..062b i = 0 while SCN 0x80f > i, 0609 i == s -> k,
    061c byte kind == 1 and 0624 k < 4 -> k += 1)."""
    k = 0
    for i in range(len(state.sites)):
        if i == s:
            return k
        if state.sites[i].kind & 0xFF == TEMPLE and k < TEMPLE_MAX:
            k += 1
    return -1


def blessing_flag(state, s: int) -> int:
    """ovl28:063c(s): -1 when 0600(s) is -1, else the word DS:0958[k] (0x02, 0x04, 0x08, 0x10;
    k = 4, the fifth and later temples, reads 0x6353 from the string after the table).
    Evidence: asm ovl28:063c..065c; EXE bytes at DS:0958 (`BLESSING`)."""
    k = temple_ordinal(state, s)
    return -1 if k == -1 else BLESSING[k]


def hero_table(state) -> HeroTable:
    """ovl28:065d(&S): S[0..5] = -1; AI[+0x0e] = 0; for a = N-1..0 every own hero (owner cwde ==
    cur, type 0x1c) up to six: S[n] = a, S.site / S.city = -1, S.fly = 0; terrain 10 under it ->
    S.city = ovl62:044a(x, y), terrain 11 -> S.site = ovl62:04b5(x, y); a flight item
    (ovl35:08b4) -> S.fly = 1; n += 1, AI[+0x0e] += 1.  So S holds the heroes with the highest
    army indices, highest first.
    Evidence: asm ovl28:065d..07e9 (0667..067f, 0681..0685 AI +0x0e = 0, 0690 / 07dc a = N-1..0,
    06a2..06c1, 06cc cmp si, 6, 06dd S[n] = a, 0711..071c, 0742 / 074e, 0785 / 0791, 07b8..07cd,
    07d3 / 07d8)."""
    S = HeroTable()
    b = block(state)
    b.hero_count = 0
    n = 0
    for a in U._scan(state):
        if not _own_hero(state, a):
            continue
        if n >= N_HEROES:
            continue
        S.heroes[n] = a.id
        S.site[n] = S.city[n] = -1
        S.fly[n] = 0
        t = _terrain(state, a.x, a.y)
        if t == Terrain.CITY:
            S.city[n] = state.city_at(a.x, a.y)
        elif t == Terrain.SITE:
            S.site[n] = state.site_at(a.x, a.y)
        if M.carried_count(state, a, ItemType.FLIGHT) != 0:
            S.fly[n] = 1
        n += 1
        b.hero_count = (b.hero_count + 1) & 0xFFFF
    return S


# ------------------------------------------------------------------------------- moves


def go_site_or_item(state, j: int, kind: int, S: HeroTable, unused: int = 0) -> tuple[int, list]:
    """ovl28:07ea(j, kind, S, unused): move hero j's group to site S+0x34 (kind 3) or item
    S+0x3c (kind 2).  The group = own armies on the hero's square with the hero's order byte and
    allowance >= 12 (ovl29:13b2, which selects them); none -> 0.  In a city (S.city[j] != -1):
    th = ovl20:0a3e(x, y, -1); the flyer in the lowest list slot goes with the hero alone (n = 2),
    else with th >= 15 the hero alone (n = 1), each selected by 14d3; then, when the city's
    counted armies AI[+0x182+c] equal n, n < 3 and th < 15 -> 0 (stay); with n == 3 the hero
    alone is selected (n kept).  0c8c:0529; t == -1 -> 0; an item: 0ae7(L, 4, 0, 0) and the
    leader's goto = the item's square; a site: 0ae7(L, 3, t, 0); then 0a8b:0001(leader goto, 0);
    returns 1 when that reached the path end (status 4).
    Evidence: asm ovl28:07ea..0b74 (07f2 r = 0; 0804..0838 kind 3 site S +0x34; 083e..0870 item
    S +0x3c, t + 0x3e8; 089d dist (debug only); 08a8..0908 13b2(x, y, &L, sub, kind, 12), n = 0
    -> 0b6e; 090f..0958 S +0x0c, ovl20:0a3e(x, y, -1) else 0x64; 0968..09a9 slots 7..0, last
    write wins; 09ab..09d5 [h, f], n = 2; 09d7..09fa th jl 0xf, [h], n = 1; 09ff 14d3;
    0a0c..0a31 AI +0x182 + c byte == n, n < 3, th < 0xf -> 0; 0a34..0a67 n == 3 -> [h], 14d3;
    0a6a 0c8c:0529; 0ab0 ovl29:170c (view); 0ab8 t == -1; 0ad1 t >= 0x3e8; 0ae1 0ae7(L, 4, 0,
    0); 0aeb..0b1f leader +0x12 / +0x14 = item +0x19 / +0x1b; 0b46 0ae7(L, 3, t, 0); 0b2d /
    0b5c 0a8b:0001; 0b35 / 0b64 == 4 -> 1)."""
    h = S.heroes[j]
    a = _army(state, h)
    if kind == ORDER_SITE:
        t = S.site_t
    else:
        if S.item == -1:
            raise RuntimeError("ovl28:07ea: item order without an item (S+0x3c == -1)")
        t = S.item + ITEM_OFFSET
    n, L = U.select_square_order(state, a.x, a.y, (a.order >> 4) & 7, a.order & KIND_MASK,
                                 GROUP_ALLOWANCE)
    if n == 0:
        return 0, []
    c = S.city[j]
    th = _phase("neutral").nearest_foreign_army(state, a.x, a.y, -1) if c != -1 else FAR_THREAT
    if c != -1:
        f = -1
        for k in range(LIST - 1, -1, -1):
            e = L[k]
            if e != -1 and _flies(state, _army(state, e)):
                f = e
        if f != -1:
            L = [h, f] + [-1] * (LIST - 2)
            n = 2
            U.select_list(state, L)
        elif th >= THREAT:
            L = [h] + [-1] * (LIST - 1)
            n = 1
            U.select_list(state, L)
    if c != -1 and block(state).armies_here[c] & 0xFF == n and n < SMALL_GROUP and th < THREAT:
        return 0, []
    if c != -1 and n == SMALL_GROUP:
        L = [h] + [-1] * (LIST - 1)
        U.select_list(state, L)
    selection_step(state)                                  # 0c8c:0529
    if t == -1:
        return 0, []
    if t >= ITEM_OFFSET:
        U.order_stack(state, L, ORDER_KEEP, 0, 0)
        it = state.items[t - ITEM_OFFSET]
        lead = state.armies[state.selection.selected]
        lead.goto = (it.x, it.y)
    else:
        U.order_stack(state, L, ORDER_SITE, t, 0)
    r, events = _move_leader(state)
    return int(r == ARRIVED), events


def go_city(state, j: int, S: HeroTable, unused: int = 0) -> tuple[int, list]:
    """ovl28:0b75(j, S, unused): move hero j's group (13b2, allowance >= 12, selected) on city
    S+0x38 with order kind 1 (0ae7(L, 1, c, 0)) and 0a8b:0001; returns 0 always.  No group -> 0.
    Stays (0) when the hero stands in a city hc whose counted armies AI[+0x182+hc] equal **j**
    (the uninitialised local [bp-2] holds 0efc's saved DI, which is 0000's j, ai.md §6.2) and an
    enemy army is nearer than 15 (T > 5) / 10 (ovl20:0a3e(x, y, -1)).
    Evidence: asm ovl28:0b75..0cf2 (0b80 di = 0; 0b8e..0bcb c = S +0x38, hc = S +0x0c; 0bf9 dist
    never read; 0c04..0c5c 13b2(.., 12), `or ax, ax`, n not stored; 0c61..0c78 hc != -1, byte
    AI +0x182 + hc == [bp-2]; 0ca1 0a3e; 0cac..0cc1 ovl61:225b > 5 ? 15 : 10, jg -> 0ced;
    0ccf 0ae7(L, 1, c, 0); 0ce5 0a8b:0001; 0ced ax = di)."""
    h = S.heroes[j]
    a = _army(state, h)
    c, hc = S.city_t, S.city[j]
    n, L = U.select_square_order(state, a.x, a.y, (a.order >> 4) & 7, a.order & KIND_MASK,
                                 GROUP_ALLOWANCE)
    if n == 0:
        return 0, []
    if hc != -1 and block(state).armies_here[hc] & 0xFF == j:
        th = _phase("neutral").nearest_foreign_army(state, a.x, a.y, -1)
        lim = STAY_THREAT[0][1] if turn(state) > STAY_THREAT[0][0] else STAY_THREAT[1][1]
        if lim > th:
            return 0, []
    U.order_stack(state, L, ORDER_CITY, c, 0)
    _, events = _move_leader(state)
    return 0, events


def quest_city(state, j: int, S: HeroTable) -> tuple[int, list]:
    """ovl28:0cf3(j, S): march on the quest city.  Only for quest types 4 / 5; c = Q +6; not when
    AI[+0x11e+c] bit 0; need = 1 when c is neutral (owner 0xf) or T < 8, else 2 own armies with
    >= 8 moves left on the hero's square (ovl29:12c9, which selects them); unless the hero already
    has order "city c", the win odds 15c5(c) must be >= 75; then 0ae7(L, 1, c, 0), 0a8b:0001 and
    1 (whatever the move did).  Q +0 / +4 are tested by the caller.
    Evidence: asm ovl28:0cf3..0efb (0d1a / 0d34 Q +2 in (4, 5) else 0; 0d53 Q +6; 0d82 AI +0x11e
    + c & 1 -> 0; 0d94..0dae owner byte == 0xf or ovl61:225b < 8 -> 1, else 2; 0db1..0de5 12c9(x,
    y, &L, 8) jge; 0df7..0e1a kind == 1 and +0xf >> 1 == c skips the odds; 0e47 dist (debug);
    0e70..0e81 15c5 jge 0x4b; 0ec5 ovl29:170c (view); 0ed7 0ae7(L, 1, c, 0); 0eed 0a8b:0001;
    0ef5 1)."""
    h = S.heroes[j]
    a = _army(state, h)
    q = state.players[state.current].quest
    if q.type not in (QUEST_OCCUPY, QUEST_RAZE):
        return 0, []
    c = q.target
    if block(state).city_flags[c] & U.CITY_FLAG_UNSEEN:
        return 0, []
    city = state.cities[c]
    need = 1 if city.owner & 0xFF == NO_OWNER or turn(state) < QUEST_NEED_TURN else 2
    n, L = U.select_square(state, a.x, a.y, QUEST_MINMOVES)
    if n < need:
        return 0, []
    if not (a.order & KIND_MASK == ORDER_CITY and a.vector_dest & INDEX_MASK == c):
        if U.win_odds(state, city.x, city.y) < QUEST_ODDS:
            return 0, []
    U.order_stack(state, L, ORDER_CITY, c, 0)
    _, events = _move_leader(state)
    return 1, events


# ------------------------------------------------------------------------------- scores


def choose(state, j: int, S: HeroTable) -> int:
    """ovl28:0efc(j, S): v = 100 - distance + rnd(1,20,0) per option, the draw made before the
    option's -1 test: quest temple (1, taken whenever it exists), site (3), then - unless the
    hero stands in a city with at most 4 counted armies (AI[+0x182+c], unsigned) - city (4) and
    item (2); an option replaces the best only when strictly better.  Returns 0 (none) .. 4.
    So 2 draws in such a city, else 4.
    Evidence: asm ovl28:0efc..0fd9 (0f01 / 0f03 c = best = 0; 0f0a rnd; 0f15..0f1e 100 - S +0x32
    + r; 0f20..0f2a S +0x30 != -1 -> 1; 0f31..0f55 S +0x34, `cmp si, cx; jge`; 0f61..0f7e S +0x0c
    != -1 and AI +0x182 + c <= 4 (jbe) -> return; 0f85..0fa9 S +0x3a / +0x38 -> 4; 0fb0..0fd1 S
    +0x3e / +0x3c -> 2)."""
    rnd = state.rng.rnd
    c = best = 0
    v = SCORE_BASE - S.temple_dist + rnd(*ROLL)
    if S.temple != -1:
        c, best = CHOICE_TEMPLE, v
    v = SCORE_BASE - S.site_dist + rnd(*ROLL)
    if S.site_t != -1 and best < v:
        c, best = CHOICE_SITE, v
    hc = S.city[j]
    if hc != -1 and block(state).armies_here[hc] & 0xFF <= CITY_GARRISON_MAX:
        return c
    v = SCORE_BASE - S.city_dist + rnd(*ROLL)
    if S.city_t != -1 and best < v:
        c, best = CHOICE_CITY, v
    v = SCORE_BASE - S.item_dist + rnd(*ROLL)
    if S.item != -1 and best < v:
        c = CHOICE_ITEM
    return c


def score_sites(state, j: int, S: HeroTable) -> None:
    """ovl28:0fda(j, S): for sites s = 0..count-1 worth visiting (1637): d = dist(site, hero);
    a temple is the quest temple candidate when Quests is on, the side has no active quest, d <
    lim and d < the best so far (and then also a site candidate); otherwise a temple whose
    blessing flag (063c) the hero already has is skipped; a non-temple ordered (kind 3) for
    another hero of S is not a candidate.  Site candidate: d <= lim and d < best (first lowest
    wins).  lim = 5 when the hero has a city order, else 25.  S+0x30..+0x36 written.
    Evidence: asm ovl28:0fda..11f7 (0ff2..1001; 1011..1026 lim; 1029 / 11c6..11d2 s ascending
    while SCN 0x80f > s; 1052 ok = 1; 105d 1637 == 0 -> next; 1097 dist; 10ab kind == 1; 10b8
    SCN 0x11e, 10cf Q +0 == 0, 10d7 jge lim, 10dc jge best -> 10ea; 10e1..10e7 bt, btd, -> 116d;
    10ec..1102 +0xc & 063c(s) -> next; 1105..116b k = 5..0, k != j, S[k] != -1, kind 3 and
    +0xf >> 1 == s -> ok = 0; 116d..1180 ok, jg lim, jge best; 11d5..11f0)."""
    h = S.heroes[j]
    a = _army(state, h)
    p = state.current
    bs, bsd, bt, btd = -1, START_DIST, -1, START_DIST
    lim = SITE_LIM[0] if a.order & KIND_MASK == ORDER_CITY else SITE_LIM[1]
    for s in range(len(state.sites)):
        ok = 1
        if not site_ok(state, s, h):
            continue
        site = state.sites[s]
        d = distance((site.x, site.y), (a.x, a.y))
        if site.kind & 0xFF == TEMPLE:
            q = state.players[p].quest
            if state.options.quests and q.active == 0 and d < lim and d < btd:
                bt, btd = s, d
            elif a.flags & blessing_flag(state, s) & 0xFFFF:
                continue
        else:
            for k in range(N_HEROES - 1, -1, -1):
                if k == j or S.heroes[k] == -1:
                    continue
                o = _army(state, S.heroes[k])
                if o.order & KIND_MASK == ORDER_SITE and o.vector_dest & INDEX_MASK == s:
                    ok = 0
        if ok and d <= lim and d < bsd:
            bs, bsd = s, d
    S.temple, S.temple_dist, S.site_t, S.site_dist = bt, btd, bs, bsd


def score_items(state, j: int, S: HeroTable) -> None:
    """ovl28:11f8(j, S): for items it = 21..0 worth fetching (1736) and not item-ordered (kind 2)
    for another hero of S: d = dist(item, hero), d <= lim and d < best (strict: the highest index
    wins ties); lim = 5 with a city order, else 15.  S+0x3c / +0x3e written.
    Evidence: asm ovl28:11f8..1347 (120d / 1212; 1221..1236 lim; 1239 / 1329 it = 21..0; 126b
    1736; 1276..12dc k = 5..0, kind == 2, +0xf >> 1 == it -> ok = 0; 130f dist; 1319 jg, 131e jge;
    1333..1340)."""
    h = S.heroes[j]
    a = _army(state, h)
    bi, bd = -1, START_DIST
    lim = ITEM_LIM[0] if a.order & KIND_MASK == ORDER_CITY else ITEM_LIM[1]
    for it in range(N_ITEMS - 1, -1, -1):
        ok = 1
        if not item_ok(state, it):
            continue
        for k in range(N_HEROES - 1, -1, -1):
            if k == j or S.heroes[k] == -1:
                continue
            o = _army(state, S.heroes[k])
            if o.order & KIND_MASK == ORDER_ITEM and o.vector_dest & INDEX_MASK == it:
                ok = 0
        if ok:
            item = state.items[it]
            d = distance((item.x, item.y), (a.x, a.y))
            if d <= lim and d < bd:
                bi, bd = it, d
    S.item, S.item_dist = bi, bd


def score_cities(state, j: int, S: HeroTable) -> None:
    """ovl28:1348(j, S): S+0x38 = S+0x3a = -1; the group = own armies on the hero's square with
    its order byte and allowance >= 12 (13b2, selected); none -> done.  thr = 95 for n < 3, else
    75.  For c = count-1..0: intact (terrain 10 at the corner), not AI flag bit 0, not neutral,
    at war (relation[cur][owner] & 3 == 2); d = dist(c, hero); farther than the running best
    distance (start 20) only for the hero's current order city; p = 15c5(c) (+20 for the order
    city); p >= thr; taken when p > best p, or p == best p and d < best d.
    Evidence: asm ovl28:1348..1636 (1360..136a; 136f..1379; 1388..13af order city; 13b4..141c
    13b2(.., 12), 0 -> return; 141f..142d; 1435 / 1618 c = count-1..0; 1476; 1487; 149c; 14b1..14d6
    2c04:153b[cur * 8 + owner cwde] & 3 == 2; 1520 dist; 152b jle, 1530 == oc; 1556 15c5; 1560..1565
    +20; 15f5 jl; 15fa jg / 15ff jne / 1607 jge; 160c..1615; 1622..162f)."""
    h = S.heroes[j]
    a = _army(state, h)
    p = state.current
    blk = block(state)
    bc, bd, bp = -1, CITY_START_DIST, 0
    S.city_dist = S.city_t = -1
    oc = a.vector_dest & INDEX_MASK if a.order & KIND_MASK == ORDER_CITY else -1
    n, _ = U.select_square_order(state, a.x, a.y, (a.order >> 4) & 7, a.order & KIND_MASK,
                                 GROUP_ALLOWANCE)
    if n == 0:
        return
    thr = CITY_ODDS[0][1] if n < CITY_ODDS[0][0] else CITY_ODDS[1][1]
    for c in range(len(state.cities) - 1, -1, -1):
        city = state.cities[c]
        if _terrain(state, city.x, city.y) != Terrain.CITY:
            continue
        if blk.city_flags[c] & U.CITY_FLAG_UNSEEN:
            continue
        if city.owner & 0xFF == NO_OWNER:
            continue
        if M._relation_bits(state, p, s8(city.owner)) != WAR:
            continue
        d = distance((city.x, city.y), (a.x, a.y))
        if d > bd and c != oc:
            continue
        pw = U.win_odds(state, city.x, city.y)
        if c == oc:
            pw += CURRENT_BONUS
        if pw < thr:
            continue
        if pw > bp or (pw == bp and d < bd):
            bd, bc, bp = d, c, pw
    S.city_t, S.city_dist = bc, bd


def site_ok(state, s: int, a: int) -> int:
    """ovl28:1637(s, a): site s is worth visiting for army a: dist < 2 T + 3 (+12 when the
    site's +0x1b word is set), a seen square in the 3x3 around it (ovl29:16ae), terrain 11; a
    temple always, another site only when its explored bit is clear.
    Evidence: asm ovl28:1637..1735 (168f dist; 169a..16b8 ovl61:225b * 2 + 3, word +0x1b (2c04:082c)
    != 0 -> + 0xc; 16bb jl; 16c8 16ae; 16f4 terrain != 0xb; 1706 kind == 1 -> 1; 1720..172d
    bit 6 of the high byte -> 0)."""
    site = state.sites[s]
    x, y = site.x, site.y
    o = _army(state, a)
    d = distance((x, y), (o.x, o.y))
    lim = SITE_TURNS[0] * turn(state) + SITE_TURNS[1]
    if site.flag_1b & 0xFFFF:
        lim += SITE_SPECIAL
    if not d < lim:
        return 0
    if not U.seen_near(state, x, y):
        return 0
    if _terrain(state, x, y) != Terrain.SITE:
        return 0
    if site.kind & 0xFF == TEMPLE:
        return 1
    return 0 if _explored(state, x, y) else 1


def item_ok(state, it: int) -> int:
    """ovl28:1736(it): item it lies on the map (state 1), a seen square in the 3x3 around it
    (16ae), and on a City square the city (ovl62:044a) is the side's own (owner cwde == cur).
    Evidence: asm ovl28:1736..17da (1769 state byte 2c04:0cff == 1; 1777 16ae; 17a2 terrain 10;
    17ac ovl62:044a; 17c2..17cd owner cwde == SCN 0x110)."""
    item = state.items[it]
    if item.state != ItemState.ON_MAP:
        return 0
    if not U.seen_near(state, item.x, item.y):
        return 0
    if _terrain(state, item.x, item.y) == Terrain.CITY:
        if s8(_city_owner(state, state.city_at(item.x, item.y))) != state.current:
            return 0
    return 1


# ------------------------------------------------------------------------------- 17db / 1a3d


def _carried(state, aid: int) -> list[int]:
    """ovl51:03d9(2, 0L, army): the items 0..21 with state 3 whose holder is the army's index
    (DS:4bfc[0..DS:482e-1]); ai.md §6.2."""
    return [i for i in range(min(N_ITEMS, len(state.items)))
            if state.items[i].state == ItemState.CARRIED and state.items[i].holder == aid]


def _type_of(state, it: int) -> int:
    """Item `it`'s type byte (cbw).  An empty row byte 0xff is item -1 in the original (the dead
    0xff test, ai.md §6.2); its type byte 2c04:0ce0 is 0 in every shipped scenario and never
    written in play, so it matches no type: returned as 0 here."""
    if it == -1:
        return 0
    return s8(state.items[it].type)


def share_items(state, H) -> None:
    """ovl28:17db(H): spread the items of the heroes H (8 army indices, -1 empty) of one city:
    count per hero the battle / command items B (types 1, 2, 8), flight F (5), movement M (6),
    G (7); hand out M, F, G (1a3d with types 6, 5, 7, in that order); then repeat until a pass
    moves nothing: for each hero k with B[k] != 0 the first other hero r with the fewest B
    strictly below B[k] gets k's first battle item still in k's row (the row entry becomes 0xff,
    holder = H[r], B[k] -= 1, B[r] += 1, AI[+0x4c] += 1).  Receivers' rows are not extended.
    Evidence: asm ovl28:17db..1a2c (17e4..181a init: counters 0, rows 0xff; 181c..18b6 per hero
    ovl51:03d9(2, 0L, &army), rows from DS:4bfc, switch on type - 1 via table 1a2d; 18bb..1903
    1a3d(H, M, I, 6), (H, F, I, 5), (H, G, I, 7); 1906..1a26 B pass: 1918..1932 H != -1, B
    cbw != 0; 1940..196c lowest strictly below; 196e r == -1; 1977..1a12 e = 0..21, cbw row
    byte, 199e / 19ad / 19bc types 1 / 2 / 8, 19d1..1a0c; 1a20 repeat while a hand-over)."""
    from ...rules.bonuses import list_names
    H = list(H)[:LIST] + [-1] * (LIST - len(list(H)[:LIST]))
    G, F, Mv, B = ([0] * LIST for _ in range(4))
    I = [[EMPTY] * N_ITEMS for _ in range(LIST)]
    for k in range(LIST):
        if H[k] == -1:
            continue
        items = _carried(state, H[k])
        list_names(state, [state.items[i].name for i in items])      # ovl28:184d: into DS:483c
        for m, it in enumerate(items):
            I[k][m] = it & 0xFF
            t = state.items[it].type & 0xFF
            if t in B_TYPES:
                B[k] = s8(B[k] + 1)
            elif t == F_TYPE:
                F[k] = s8(F[k] + 1)
            elif t == M_TYPE:
                Mv[k] = s8(Mv[k] + 1)
            elif t == G_TYPE:
                G[k] = s8(G[k] + 1)
    hand_out(state, H, Mv, I, M_TYPE)
    hand_out(state, H, F, I, F_TYPE)
    hand_out(state, H, G, I, G_TYPE)
    blk = block(state)
    stable = 0
    while not stable:
        stable = 1
        for k in range(LIST):
            if H[k] == -1 or B[k] == 0:
                continue
            lo, r = B[k], -1
            for m in range(LIST):
                if m != k and H[m] != -1 and B[m] < lo:
                    lo, r = B[m], m
            if r == -1:
                continue
            for e in range(N_ITEMS):
                it = s8(I[k][e])
                if _type_of(state, it) in B_TYPES:
                    I[k][e] = EMPTY
                    stable = 0
                    blk.item_handovers = (blk.item_handovers + 1) & 0xFFFF
                    state.items[it].holder = H[r]
                    B[k] = s8(B[k] - 1)
                    B[r] = s8(B[r] + 1)
                    break


def hand_out(state, H, cnt, I, type_: int) -> None:
    """ovl28:1a3d(H, cnt, I, type): repeat until a pass moves nothing: every hero g with
    cnt[g] >= 2 (signed byte, tested once per g) gives one item of `type` from its row to every
    other hero r with cnt[r] == 0, while its row holds one (row entry 0xff, holder = H[r],
    cnt[g] -= 1, cnt[r] += 1, AI[+0x4c] += 1).  `cnt` and `I` are updated in place.
    Evidence: asm ovl28:1a3d..1b33 (1a4a stable = 1; 1a52..1a6f H[g] != -1, cnt jl 2; 1a77..1a9e
    r != g, H[r] != -1, cnt[r] == 0; 1aa0..1b15 e = 0..21, cbw row byte (0xff test dead), type
    byte cbw == type; 1ad2..1b0f; 1b29 repeat)."""
    blk = block(state)
    stable = 0
    while not stable:
        stable = 1
        for g in range(LIST):
            if H[g] == -1 or s8(cnt[g]) < 2:
                continue
            for r in range(LIST):
                if r == g or H[r] == -1 or cnt[r] != 0:
                    continue
                for e in range(N_ITEMS):
                    it = s8(I[g][e])
                    if _type_of(state, it) == type_:
                        stable = 0
                        I[g][e] = EMPTY
                        blk.item_handovers = (blk.item_handovers + 1) & 0xFFFF
                        state.items[it].holder = H[r]
                        cnt[g] = s8(cnt[g] - 1)
                        cnt[r] = s8(cnt[r] + 1)
                        break
