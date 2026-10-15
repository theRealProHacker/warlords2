"""ovl24: the clean city phase (ai.md §6.9) and the army deletion helpers the other phases use.

* `clean_cities` = ovl24:01f1, the phase (ovl25:0221); `clean_city(state, c, force)` = 023f,
  also called with force = 1 by the hero (ovl28:0129), assault (ovl19:0289, 02c1, 1394, 17e6)
  and neutral (ovl20:0111) phases.  No caller reads 023f's return value (1, or 0 for an index
  out of range), so `clean_city` returns the events of what it called.
* `defenders_wanted` 0a3d, `garrison_order` 0b5c, `delete_army` 015e, `delete_selection` 0000
  (ovl19:1117), `delete_list` 00ca (ovl22:0f30), `redraw` 10a1.

The army and map writes of 023f are made here as the listing makes them (ovl24 writes the
records directly), with the engine's representation; the deletion goes through the engine's
0b62:03be (`rules.movement.remove_army`) and ovl36:16cd (`rules.heroes.hero_died`), whose side
effects are those of the original routines.

Cross-phase calls (ai.md §9 names, imported when called so that each module can be replaced in
tests): ovl28:0427 `hero.pick_up`, ovl28:17db `hero.share_items`, ovl20:0a3e
`neutral.nearest_foreign_army`, ovl20:0e4b `neutral.explore`.

DS:5dca / DS:5dda (income / upkeep of the side on turn) are caches in the original (refreshed
by ovl62:0372 / 02bf only at the turn-start settlement ovl68:082a, after battles ovl36:0cba,
captures ovl36:10c6, razes ovl32:00a1 and a few dialogs); `_income` / `_upkeep` read the
engine's copies of these caches, `rules.economy.cached_income` / `cached_upkeep`, so the
disbands of 023f do not change them within the phase.
"""
from __future__ import annotations

from ...model.ids import HERO_TYPE, MAP_ARMY, MAP_W, Control, Relation, Terrain
from ...model.state import SCN_ARMY_HIGH
from ...rules import diplomacy as D
from ...rules import economy as EC
from ...rules import movement as M
from ...rules.bonuses import s8
from ...rules.economy import s16
from ...rules.heroes import hero_died, turn
from ...rules.mapwords import refresh_map
from ...rules.present import present
from ..state import block

# DS:0814 / DS:081c: the four city squares (x, y offsets), read from the EXE image
SQ_DX = (1, 0, 0, 1)                               # DS:0814
SQ_DY = (0, 0, 1, 1)                               # DS:081c
GARRISON_QUOTA = (0, 0, 0, 0, 3, 3, 4, 5, 5, 6, 7, 7, 7)   # DS:0824 (bytes, n < 13)
QUOTA_MAX = 8                                      # ovl24:0b74 (n >= 13)
CF_CLEANED, CF_W13, CF_HERO = 0x04, 0x10, 0x20     # AI[+0x11e + c] bits (ovl24:02d8, 0514..053a)
CF_HERO_W13 = CF_W13 | CF_HERO                     # ovl24:0514 and 0xcf
ORDER_KIND_MASK, ORDER_CITY = 0x0F, 1              # army +0xe (ovl24:03c3, 03c6)
ORDER_KEEP_HIGH = 0xF0                             # ovl24:03ee
ORDER_KEEP_KIND = 0x8F                             # ovl24:09bb (sub bits 4-6 cleared)
H_SLOTS, L_SLOTS = 8, 32                           # ovl24:02b6 / 02de: H[8], L[32], G[32]
MANY_ARMIES, MAX_ARMIES = 16, 24                   # ovl24:0540 (> 16), 072a (> 24)
ORDERED_MAX, ROLE_STAGING = 2, 7                   # ovl24:054e (> 2), 055b
LEAVE_ROLL = (1, 6, -1)                            # ovl24:0584..058c
ROLE_BUILD_UP, ROLE_INTERIOR, ROLE_FULL = 4, 5, 8  # ovl24:05d7..05e1, 05ff, 0615, 0623
ROLE_EXPLORE, ROLE_EXPAND, ROLE_FLYER = 2, 3, 11   # ovl24:08a9 / 08b7, 07df
FEW_ARMIES = 2                                     # ovl24:05f2, 077f (n < 2)
POOR_GOLD = 300                                    # ovl24:065f (gold < 0x12c)
OLD_CITY = 10                                      # ovl24:06a7 (age > 10, unsigned)
SURPLUS_ADD = 4                                    # ovl24:06b5 (heroes + w13s + 4)
FOE_NEAR = 10                                      # ovl24:06e7 (0a3e > 10)
EARLY_TURNS = 3                                    # ovl24:0775 / 081c (max(turn, 1) < 3)
EXPLORERS_MAX = 5                                  # ovl24:07ed (AI[+0x24] < 5, signed)
FLYER_KEEP = 2                                     # ovl24:0803 (2 - (n - flyers))
F_EXPLORING = 0x20                                 # army +0xc (ovl24:0879)
F_DONE = 0x40                                      # army +0xc (ovl24:09d7 and 0xffbf)
STACK = 8                                          # ovl24:08c1 / 0a00: 8 armies per square
WANT_WAR, WANT_MANY, WANT_ONE, WANT_NONE = 8, 4, 3, 2   # ovl24:0b36, 0b43, 0b50, 0a4f
# ovl24:0b5c bonuses and `taken` bits, in the order of the elif chain (0d69..0e7c)
BONUS_HERO, BONUS_FLY, BONUS_W15_2, BONUS_W15_3 = 1000, 900, 800, 700
BONUS_W13, BONUS_W15_1, BONUS_W17, BONUS_W18 = 600, 500, 400, 300
T_HERO, T_W15_2, T_W15_3, T_W15_1 = 0x01, 0x02, 0x04, 0x08
T_FLY, T_W17, T_W18, T_W13 = 0x10, 0x20, 0x40, 0x80
T_ALL = 0xFFF                                      # ovl24:0e82
S_HERO_TAKEN, S_W13_TAKEN = 1, 2                   # ovl24:0e9d, 0ec2
TF_MEDIUM, TF_FAST, TF_FLYER = 0x10, 0x08, 0x20    # TF +0x5a bits (ovl24:0c72, 0c8d, 0cbb)
MV_MEDIUM, MV_FAST = 12, 16                        # ovl24:0c7b, 0c96
AIR_FLYERS = ((4, 16), (3, 8))                     # ovl24:0c1e..0c32: f >= 4 and n <= 16, f >= 3 and n <= 8
STRONG_FLYER = 4                                   # ovl24:0bfd (strength >= 4)
AGE_DIV, AGE_BASE = 3, 3                           # ovl24:0ce1..0ce7: v = 3 - age / 3


# ------------------------------------------------------------------------------- cross-phase calls

def _pick_up(state, x: int, y: int) -> list:
    """ovl28:0427(x, y) (ai/phases/hero.py `pick_up`, M8b3)."""
    from .hero import pick_up
    return pick_up(state, x, y) or []


def _share_items(state, heroes: list) -> list:
    """ovl28:17db(H) (ai/phases/hero.py `share_items`, M8b3); H = 8 army ids, -1 padded."""
    from .hero import share_items
    return share_items(state, heroes) or []


def _nearest_foreign_army(state, x: int, y: int, side: int) -> int:
    """ovl20:0a3e(x, y, side) (ai/phases/neutral.py `nearest_foreign_army`, M8b3)."""
    from .neutral import nearest_foreign_army
    return nearest_foreign_army(state, x, y, side)


def _explore(state, a: int, c: int) -> list:
    """ovl20:0e4b(a, c) (ai/phases/neutral.py `explore`, M8b3)."""
    from .neutral import explore
    return explore(state, a, c) or []


# ------------------------------------------------------------------------------- helpers

def _income(state) -> int:
    """DS:5dca[SCN 0x110], the cache of ovl62:0372 as last refreshed (rules.economy)."""
    return EC.cached_income(state, state.current)


def _upkeep(state) -> int:
    """DS:5dda[SCN 0x110], the cache of ovl62:02bf as last refreshed (rules.economy)."""
    return EC.cached_upkeep(state, state.current)


def _records(state):
    """Army record indices SCN 0x181 - 1 .. 0 (ovl24:031d, `mov ax, si; dec si; or ax, ax`)."""
    return range(min(state.flags.get(SCN_ARMY_HIGH, 0), len(state.armies)) - 1, -1, -1)


def _flag(state, a, word: str) -> int:
    """The DS:45c4 + 6 * cwde(type) byte (`word` as in rules.movement.type_flag); type 0xff
    reads DS:45be.. (model.army NO_TYPE: 0)."""
    return M.type_flag(state, s8(a.type_id), word)


def _hero(a) -> bool:
    return a.type_id & 0xFF == HERO_TYPE


def _square(x: int, y: int) -> int:
    return y * MAP_W + x


# ------------------------------------------------------------------------------- deletion

def redraw(state, x: int, y: int) -> bool:
    """ovl24:10a1(x, y): redraw the map view (ovl64:006c) when the side on turn is shown (SCN
    0x147[cur] != 0) or human (0x0d0[cur] != 1), and (x, y) lies in the view rectangle (0x177 <=
    x <= 0x17b, 0x175 <= y <= 0x179).  Display only: no game state; returns whether it draws
    (present point "map").
    Evidence: asm ovl24:10a1..1109."""
    p = state.current
    pl = state.players[p]
    if not pl.shown and pl.control == Control.COMPUTER:
        return False
    v = state.flags
    drawn = (v.get(0x177, 0) <= x <= v.get(0x17B, 0)) and (v.get(0x175, 0) <= y <= v.get(0x179, 0))
    if drawn:
        present("map", at="ovl24:1103")
    return drawn


def delete_army(state, i: int, redraw_it: int) -> list:
    """ovl24:015e(a, redraw): x, y = the record's square (read first); a hero (type byte 0x1c)
    dies there (ovl36:16cd, `rules.heroes.hero_died`); the record is freed (0b62:03be,
    `rules.movement.remove_army`); with `redraw_it` 10a1(x, y).  No ownership test.
    Evidence: asm ovl24:015e..01f0 (0169..018e x / y, 019b type 0x1c, 01b9 ovl36:16cd(&a, x, y),
    01d3 0b62:03be, 01db..01e7 10a1)."""
    a = state.armies[i]
    x, y = a.x, a.y
    events = []
    if _hero(a):
        events += hero_died(state, i, x, y)
    M.remove_army(state, a)
    if redraw_it:
        redraw(state, x, y)
    return events


def delete_selection(state, redraw_it: int) -> list:
    """ovl24:0000(redraw): every army of DS:5e3e[0..7] in slot order is deleted by 015e(a, 0)
    (its index found by scanning the records SCN 0x181 - 1..0; its square read first) and the
    slot cleared; then DS:5e5e = DS:5e62 = null (DS:2bda, 5dfe, 5e00 are not written); with
    `redraw_it` 10a1 on the last army's square; ovl62:0000 (`rules.mapwords.refresh_map`).
    `Selection.moving` is DS:5e3e: `rules.movement.select_list` / `set_selection` write it for a
    single army too, so the caller ovl19:1117 (after 0ae7) has every member there.
    Evidence: asm ovl24:0000..00c9 (0015..0022 null slot, 0029..0057 scan, 0059..0072 x / y,
    0075..0082 015e, 0085..0090 slot = 0, 009f..00a6 5e5e / 5e62, 00aa..00be 10a1, 00c1
    ovl62:0000)."""
    sel = state.selection
    events = []
    last = None
    for aid in list(sel.moving):
        if aid == -1:                                     # null slot (0015..0022)
            continue
        a = state.armies[aid]
        last = (a.x, a.y)
        events += delete_army(state, aid, 0)
    sel.moving = []
    sel.hero = sel.selected = -1
    if redraw_it and last is not None and last[0] != -1:
        redraw(state, *last)
    refresh_map(state)
    return events


def delete_list(state, ids, redraw_it: int) -> list:
    """ovl24:00ca(list[8], redraw): the entries 7..0 that are not -1 are deleted by 015e(a, 0),
    each square read first; with `redraw_it` 10a1 on the last one's square (entry with the lowest
    slot); ovl62:0000.  The list itself is not changed.
    Evidence: asm ovl24:00ca..015d (00da si = 8, 00e8 -1, 0102..011e x / y, 0131 015e, 013e..0152
    10a1, 0155 ovl62:0000)."""
    ids = list(ids)
    events = []
    last = None
    for k in range(STACK - 1, -1, -1):
        if ids[k] == -1:
            continue
        a = state.armies[ids[k]]
        last = (a.x, a.y)
        events += delete_army(state, ids[k], 0)
    if redraw_it and last is not None and last[0] != -1:
        redraw(state, *last)
    refresh_map(state)
    return events


# ------------------------------------------------------------------------------- garrison

def defenders_wanted(state, c: int) -> int:
    """ovl24:0a3d(c): over c's six neighbours (ovl25:0656(c, 0, ids, dists): the NB row) that
    are not empty (0xff), not neutral (owner byte 0x0f), not the side on turn's (cwde) and
    intact (terrain 10 at the corner): any whose relation[cur][owner] & 3 is war -> 8, else two
    or more -> 4, one -> 3, none -> 2.  Neighbours 5..0.
    Evidence: asm ovl24:0a3d..0b5b (0a63 ovl25:0656, 0a6b di = 6, 0a78 0xff, 0a8a 0x0f, 0aa7
    cur, 0ab8..0aed terrain 2c04:0710 == 0xa, 0aef count, 0b07..0b23 2c04:153b + cur * 8 +
    owner, 0b30..0b50)."""
    p = state.current
    ids = state.ai.neighbours.ids
    n = war = 0
    for i in range(5, -1, -1):
        t = ids[c * 6 + i] & 0xFF
        if t == 0xFF:
            continue
        city = state.cities[t]
        if city.owner & 0xFF == 0x0F:
            continue
        o = s8(city.owner)
        if o == p:
            continue
        if state.world.terrain(city.x, city.y) != Terrain.CITY:
            continue
        n += 1
        if D.current(state, p, o) == Relation.WAR:
            war += 1
    if war:
        return WANT_WAR
    if n > 1:
        return WANT_MANY
    if n:
        return WANT_ONE
    return WANT_NONE


def garrison_order(state, c: int, n: int, L: list, G: list) -> int:
    """ovl24:0b5c(c, n, L, G): move the n entries of L (army ids, -1 = none) into G in garrison
    order and return k = min(quota, number taken from pool A) - the "keepers".
    quota = DS:0824[n] (n < 13) else 8; with role 7 (task-force staging): f = flyers (a weak one,
    strength < 4, only while f == 0), h = heroes over L[n-1..0]; f += h when both; air = (f >= 4
    and n <= 16) or (f >= 3 and n <= 8); for TF j = 3..0 active with staging c: minmv = 12 / 16 /
    TF +0x58 by flags 0x10 / 8, air = 1 by flag 0x20 (the lowest j decides minmv).  v = 3 -
    age / 3: 0 < v < n and n - quota < v -> quota = n - v.  Then repeatedly over i = n-1..0: s =
    strength (signed byte) + the first bonus of the chain (hero 1000 unless taken, allowance <
    minmv none, flyer 900, air none, w15 2 / 3 800 / 700, w13 600, w15 1 500, w17 400, w18 300,
    each unless its `taken` bit is set) while g < quota, else taken = 0xfff; a taken hero scores
    1, a taken w13 2; allowance < minmv or (air, not flying, not hero) -> pool B, else A; best
    strict > per pool (the highest i wins ties).  Neither pool -> done; the chosen one (A first)
    sets its `taken` bits (hero: 1 only) unless taken == 0xfff; A -> G[g++], k += 1; else B ->
    G[g++]; L[i] = -1.
    Evidence: asm ovl24:0b5c..10a0 (0b64..0b77 quota, 0b90..0c34 role 7, 0c39..0cd0 TFs,
    0cd3..0d01 v, 0d04..0f2d scan, 0f30..0f3c done, 0f3f..1026 taken, 1029..108d pools,
    1090..109a min)."""
    blk = block(state)
    quota = GARRISON_QUOTA[n] if n < len(GARRISON_QUOTA) else QUOTA_MAX
    taken = 0
    minmv = 0
    air = 0
    g = k = 0
    if blk.role[c] == ROLE_STAGING:
        f = h = 0
        for i in range(n - 1, -1, -1):
            if L[i] == -1:
                continue
            a = state.armies[L[i]]
            if _hero(a):
                h += 1
            elif _flag(state, a, "flag16"):
                if s8(a.strength) >= STRONG_FLYER or f == 0:
                    f += 1
        if f and h:
            f += h
        if any(f >= ff and n <= nn for ff, nn in AIR_FLYERS):
            air = 1
        for j in range(3, -1, -1):
            tf = blk.task_forces[j]
            if s16(tf.age) == 0 or s16(tf.staging) != c:
                continue
            if tf.flags & TF_MEDIUM:
                minmv = MV_MEDIUM
            elif tf.flags & TF_FAST:
                minmv = MV_FAST
            else:
                minmv = s16(tf.min_moves)
            if tf.flags & TF_FLYER:
                air = 1
    v = AGE_BASE - (blk.age[c] & 0xFF) // AGE_DIV
    if 0 < v < n and n - quota < v:
        quota = n - v
    while True:
        bA = bB = iA = iB = -1
        for i in range(n - 1, -1, -1):
            if L[i] == -1:
                continue
            a = state.armies[L[i]]
            s = s8(a.strength)
            hero = _hero(a)
            flies = _flag(state, a, "flag16")
            w13 = _flag(state, a, "special")
            if g >= quota:
                taken = T_ALL
            else:
                w15 = s8(_flag(state, a, "cancel_mode"))
                if not taken & T_HERO and hero:
                    s += BONUS_HERO
                elif s8(a.allowance) < minmv:
                    pass
                elif not taken & T_FLY and flies:
                    s += BONUS_FLY
                elif air:
                    pass
                elif not taken & T_W15_2 and w15 == 2:
                    s += BONUS_W15_2
                elif not taken & T_W15_3 and w15 == 3:
                    s += BONUS_W15_3
                elif not taken & T_W13 and w13:
                    s += BONUS_W13
                elif not taken & T_W15_1 and w15 == 1:
                    s += BONUS_W15_1
                elif not taken & T_W17 and _flag(state, a, "flag17"):
                    s += BONUS_W17
                elif not taken & T_W18 and _flag(state, a, "flag18"):
                    s += BONUS_W18
            if taken & T_HERO and hero:
                s = S_HERO_TAKEN
            if taken & T_W13 and w13:
                s = S_W13_TAKEN
            if s8(a.allowance) < minmv or (air and not flies and not hero):
                if s > bB:
                    bB, iB = s, i
            elif s > bA:
                bA, iA = s, i
        if iB == -1 and iA == -1:
            break
        if taken != T_ALL:
            ch = state.armies[L[iA] if iA != -1 else L[iB]]
            if _hero(ch):
                taken |= T_HERO
            else:
                w15 = s8(_flag(state, ch, "cancel_mode"))
                if w15 == 2:
                    taken |= T_W15_2
                if w15 == 3:
                    taken |= T_W15_3
                if _flag(state, ch, "flag16"):
                    taken |= T_FLY
                if _flag(state, ch, "special"):
                    taken |= T_W13
                if w15 == 1:
                    taken |= T_W15_1
                if _flag(state, ch, "flag17"):
                    taken |= T_W17
                if _flag(state, ch, "flag18"):
                    taken |= T_W18
        if iA != -1:
            G[g] = L[iA]
            L[iA] = -1
            k += 1
        else:
            G[g] = L[iB]
            L[iB] = -1
        g += 1
    return k if quota >= k else quota


# ------------------------------------------------------------------------------- the phase

def clean_city(state, c: int, force: int = 0) -> list:
    """ovl24:023f(c, force): gather and re-stack the side on turn's armies in city c.
    Out of range (c < 0 or c >= count) -> nothing.  old = AI[+0x182+c]; AI[+0x11e+c] |= 4;
    AI[+0x182+c] = 0; scan the records 0x181-1..0 inside the 2x2 box (signed, no owner or x test
    first): a foreign one is deleted (015e(a, 1)) and still counted (the freed record: type /
    owner 0xff, order kind 0, flags of type -1 = 0, and it enters L); per army AI[+0x182+c] += 1
    (byte); an order "go to city c" is dropped (+0xe &= 0xf0, +0xf &= 1); ordered += order kind
    != 0; heroes (up to 8) into H, the last one remembered; flyers, w13s counted; the first 32
    into L, the rest deleted (015e(a, 0)).  The last hero becomes DS:5e5e and picks up
    (ovl28:0427 on its square); more than one hero: ovl28:17db(H).  Flags 0x30 cleared, 0x20 with
    a hero, 0x10 with a w13.  n > 16 -> old = ordered = 0.  ordered > 2 and role != 7 -> done.
    Not forced, no hero and AI[+0x182+c] == old: rnd(1,6,-1) != 0 and no army bit on square 3
    -> done.  AI[+0x1e6+c] = 0; roles 4/5/8 -> 4 (n < 2), 5 (n < 0a3d(c)), else 8; k =
    0b5c(c, n, L, G); not forced, gold < 300, income < 2 * upkeep, role != 7, age > 10, heroes +
    w13s + 4 < n and 0a3e(c, -1) > 10 -> G[heroes + w13s + 4 ..] deleted; n > 24 -> G[24 ..]
    deleted; (no Quick Start or turn >= 3) and n < 2 -> role 4; army bit cleared on the four
    squares (3..0); Hidden Map, role 11 and AI[+0x24] < 5: up to m flyers of G (in G order) go
    exploring (AI[+0x24] += 1, flags |= 0x20, ovl20:0e4b(a, -1), G[i] = -1), m = flyers less the
    shortfall below 2 non-flyers, 1 with Quick Start before turn 3; then G is stacked 8 per
    square from square 1 (roles 2, 3) or square 0 with k keepers (k == 0: square 1), each placed
    army: x, y, goto -1, +0x11 = 0, +0xe &= 0x8f, +0x10 = c, flags &= ~0x40, army bit; keepers
    on square 0 counted in AI[+0x1e6+c]; 10a1(c).
    Evidence: asm ovl24:023f..0a3c: 0248..0298 locals, 029d..02b3 range, 02b6..0304 H / L / G,
    02d8 |= 4, 030d = 0, 031d..04b0 scan (0325..0380 box, 0383..03a5 owner / 015e(a, 1), 03af
    inc, 03be..03fb order, 0401..0417 ordered, 041a..0446 heroes, 0449..0484 flies / w13,
    0487..04a6 L / 015e(a, 0)), 04b3..04f6 5e5e and ovl28:0427, 04f9..050a ovl28:17db,
    050d..053d flags, 0540..054b, 054e..0562, 0565..05ba rnd and square 3 (es:[y*0xe0 + x*2 +
    0xe3] bit 4), 05bd..0625 roles, 0628..063e 0b5c, 0644..0728 disband, 072a..0766 > 24,
    0768..078c role 4, 0791..07c6 bits, 07c8..08a0 flyers, 08a2..0a0b placement, 0a0e..0a33
    10a1."""
    if c < 0 or len(state.cities) <= c:
        return []
    p = state.current
    blk = block(state)
    city = state.cities[c]
    cx, cy = city.x, city.y
    old = blk.armies_here[c] & 0xFF
    H = [-1] * H_SLOTS
    L = [-1] * L_SLOTS
    G = [-1] * L_SLOTS
    blk.city_flags[c] |= CF_CLEANED
    blk.armies_here[c] = 0
    n = heroes = flyers = w13s = ordered = 0
    lasthero = -1
    events: list = []
    for i in _records(state):
        a = state.armies[i]
        if not (cx <= a.x <= cx + 1 and cy <= a.y <= cy + 1):
            continue
        if a.owner & 0xFF != p & 0xFF:
            events += delete_army(state, i, 1)
        blk.armies_here[c] = (blk.armies_here[c] + 1) & 0xFF
        if a.order & ORDER_KIND_MASK == ORDER_CITY and a.vector_dest & 0x7F == c:
            a.order &= ORDER_KEEP_HIGH
            a.vector_dest = 0
        if a.order & ORDER_KIND_MASK:
            ordered += 1
        if _hero(a) and heroes < H_SLOTS:
            H[heroes] = i
            heroes += 1
            lasthero = i
        if _flag(state, a, "flag16"):
            flyers += 1
        if _flag(state, a, "special"):
            w13s += 1
        if n >= L_SLOTS:
            events += delete_army(state, i, 0)
        else:
            L[n] = i
            n += 1
    if lasthero != -1:
        state.selection.hero = lasthero
        h = state.armies[lasthero]
        events += _pick_up(state, h.x, h.y)
    if heroes > 1:
        events += _share_items(state, H)
    blk.city_flags[c] &= ~CF_HERO_W13 & 0xFF
    if heroes:
        blk.city_flags[c] |= CF_HERO
    if w13s:
        blk.city_flags[c] |= CF_W13
    if n > MANY_ARMIES:
        old = ordered = 0
    if ordered > ORDERED_MAX and blk.role[c] != ROLE_STAGING:
        return events
    if not force and heroes == 0 and blk.armies_here[c] & 0xFF == old:
        if state.rng.rnd(*LEAVE_ROLL) != 0:
            if not state.world.flags[_square(cx + 1, cy + 1)] & MAP_ARMY:
                return events
    blk.keepers[c] = 0
    if blk.role[c] in (ROLE_BUILD_UP, ROLE_INTERIOR, ROLE_FULL):
        need = defenders_wanted(state, c)
        if n < FEW_ARMIES:
            blk.role[c] = ROLE_BUILD_UP
        elif n < need:
            blk.role[c] = ROLE_INTERIOR
        else:
            blk.role[c] = ROLE_FULL
    k = garrison_order(state, c, n, L, G)
    if (not force and s16(state.players[p].gold) < POOR_GOLD
            and s16(_income(state)) < s16(2 * _upkeep(state))
            and blk.role[c] != ROLE_STAGING and blk.age[c] & 0xFF > OLD_CITY
            and heroes + w13s + SURPLUS_ADD < n
            and _nearest_foreign_army(state, cx, cy, -1) > FOE_NEAR):
        for i in range(heroes + w13s + SURPLUS_ADD, n):
            if G[i] != -1:
                aid, G[i] = G[i], -1
                events += delete_army(state, aid, 0)
    if n > MAX_ARMIES:
        for i in range(MAX_ARMIES, n):
            if G[i] != -1:
                aid, G[i] = G[i], -1
                events += delete_army(state, aid, 0)
    if (not state.options.quick_start or turn(state) >= EARLY_TURNS) and n < FEW_ARMIES:
        blk.role[c] = ROLE_BUILD_UP
    for q in range(3, -1, -1):
        state.world.flags[_square(cx + SQ_DX[q], cy + SQ_DY[q])] &= ~MAP_ARMY & 0xFF
    if state.options.hidden_map and blk.role[c] == ROLE_FLYER and s16(blk.explorers) < EXPLORERS_MAX:
        m = flyers
        short = FLYER_KEEP - (n - flyers)
        if short > 0:
            m -= short
        if state.options.quick_start and turn(state) < EARLY_TURNS:
            m = 1
        for i in range(n):
            if m <= 0 or G[i] == -1:
                continue
            a = state.armies[G[i]]
            if not _flag(state, a, "flag16"):
                continue
            blk.explorers = s16(blk.explorers + 1)
            a.flags |= F_EXPLORING
            events += _explore(state, G[i], -1)
            G[i] = -1
            m -= 1
    if blk.role[c] in (ROLE_EXPAND, ROLE_EXPLORE):
        sq, left = 1, STACK
    else:
        sq = 0 if k else 1
        left = k if k else STACK
    for i in range(n):
        if G[i] == -1:
            continue
        a = state.armies[G[i]]
        if sq == 0:
            blk.keepers[c] = (blk.keepers[c] + 1) & 0xFF
        G[i] = -1
        x, y = cx + SQ_DX[sq], cy + SQ_DY[sq]
        a.x, a.y = x, y
        a.goto = (-1, -1)
        a.group = 0
        a.order &= ORDER_KEEP_KIND
        a.transit = c & 0xFF
        a.flags &= ~F_DONE & 0xFFFF
        state.world.flags[_square(x, y)] |= MAP_ARMY
        left -= 1
        if left == 0:
            sq += 1
            left = STACK
    redraw(state, cx, cy)
    return events


def clean_cities(state) -> list:
    """ovl24:01f1, the clean city phase (ovl25:0221): for every city c = count-1..0 whose owner
    byte is the side on turn's and whose AI[+0x11e+c] bit 2 (cleaned this turn) is clear:
    023f(c, 0).
    Evidence: asm ovl24:01f1..023e (01fa SCN 0x157b, 020b..0215 owner byte, 0222 test 4, 022a
    push 0)."""
    events: list = []
    p = state.current
    blk = block(state)
    for c in range(len(state.cities) - 1, -1, -1):
        if state.cities[c].owner & 0xFF != p & 0xFF:
            continue
        if blk.city_flags[c] & CF_CLEANED:
            continue
        events += clean_city(state, c, 0)
    return events
