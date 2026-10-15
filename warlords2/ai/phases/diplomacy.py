"""ovl18 (+ ovl27:0e04): the computer side's diplomacy (ai.md §6.1, §6.1a).

* `diplomacy` = ovl18:0000, the phase (ovl25:00db): it claims one city (0917) and, with
  Diplomacy on, rewrites the side's proposals (relation bits 2-3 of 2c04:153b[cur*8 + p]); the
  rules code resolves them (rules.diplomacy.resolve at each side's turn start ovl00:0db3, the
  refused de-escalation penalty ovl00:1063 at the end of this turn).
* `claim_city` = ovl18:0917, `may_attack_city` = ovl18:0851 (called by ovl20:10a8, ovl22:05ff),
  `ally_vs_human` = ovl18:0a6e, `choose_enemy` = ovl27:0e04 (also called by assault XX,
  ovl27:00e9).

DGROUP words: DS:408e (the enemy) and DS:4090 / 40a0 / 40b0 (per-side counts) are written and
read only inside one call of ovl18:0000 (ai.md §3.3), so they are locals here.  DS:40f2[p] is
`state.ai.solidarity[p]`.

The side's first capital (player record +0x10 / +0x12, SCN 0x193 / 0x195 + 0x14 p) is the
square these functions look up with ovl62:044a; when no city covers it, ovl62:044a returns -1
and the code reads the city record -1, which lies in the relation matrix (`city_record`).
"""
from __future__ import annotations

from ...model.ids import Control, Relation, Terrain
from ...rules import diplomacy as D
from ...rules.bonuses import s8
from ...rules.economy import s16
from ...rules.heroes import turn
from ...rules.setup import distance
from ..state import block
from ..tables import is_neighbour

NEUTRAL = 0x0F                    # owner / claim byte of nobody
SIDES = 8
CITY_FLAG_UNSEEN = 0x01           # AI[+0x11e + c] bit 0
SCN_FIRST_CAPITAL_X, SCN_FIRST_CAPITAL_Y, PLAYER_REC = 0x193, 0x195, 0x14
SCN_GREATEST = 0x116              # "I am the Greatest" (X29)
CLAIM_START, CLAIM_RANGE = 10000, 40                 # ovl18:0924, 0a30
STEP_A_NEUTRAL, STEP_A_WAR = 4, 8                    # ovl18:0276, 02a7
STEP_B_NEUTRAL, STEP_B_WAR = 5, 10                   # ovl18:0341, 03b9
SHARE_COMPUTER = 50                                  # ovl18:04bb
ENEMY_ROLL = (1, 10, 0)                              # ovl27:0ecc (push dword 0xa, push 1)
CAPITAL_LOST_BONUS = 20                              # ovl27:10ce
TOOK_CAPITAL, MINE_IN, BORDER = 15, 4, 6             # ovl27:1182, 119a, 11b2
INFAMY_DIV, CITIES_DIV = 8, 4                        # ovl27:130b, 1343
EARLY_QUICK, EARLY = 4, 8                            # ovl27:1505 / 150a
TF_SHARE_DIV = 4                                     # ovl27:15b5


class CityRecord:
    """The words / bytes of a city record the AI reads: x (+0), y (+2), owner (+0x15)."""

    def __init__(self, x: int, y: int, owner: int):
        self.x, self.y, self.owner = x, y, owner


def _rel_byte(state, idx: int) -> int:
    """Byte 2c04:153b[idx] of the relation matrix (row-major 8 x 8)."""
    if not 0 <= idx < SIDES * SIDES:
        raise RuntimeError("relation byte %d outside the matrix" % idx)
    return state.relations[idx // SIDES][idx % SIDES] & 0xFF


def city_record(state, c: int) -> CityRecord:
    """City record c (2c04:157d + 0x41 c).  c = -1 (ovl62:044a found no city) is 2c04:153c, inside
    the relation matrix: x = word 2c04:153c (bytes [0][1], [0][2]), y = word 2c04:153e ([0][3],
    [0][4]), owner = byte 2c04:1551 ([2][6]).  Any other index outside the table raises.
    Evidence: address arithmetic 0x157d - 0x41 = 0x153c, + 0x15 = 0x1551 (ai.md §6.1)."""
    if 0 <= c < len(state.cities):
        city = state.cities[c]
        return CityRecord(city.x, city.y, city.owner & 0xFF)
    if c == -1:
        x = s16(_rel_byte(state, 1) | _rel_byte(state, 2) << 8)
        y = s16(_rel_byte(state, 3) | _rel_byte(state, 4) << 8)
        return CityRecord(x, y, _rel_byte(state, 2 * SIDES + 6))
    raise RuntimeError("city record %d outside the city table" % c)


def first_capital(state, p: int) -> tuple[int, int]:
    """Player record +0x10 / +0x12 of side p (SCN 0x193 / 0x195 + 0x14 p), signed words.
    Evidence: asm ovl18:092e..0952, ovl27:0e21..0e45, ovl19:00da..00fe (push es:[0x195 + 0x14 p],
    es:[0x193 + 0x14 p])."""
    base = PLAYER_REC * p
    return (s16(state.flags.get(SCN_FIRST_CAPITAL_X + base, 0)),
            s16(state.flags.get(SCN_FIRST_CAPITAL_Y + base, 0)))


def capital_city(state, p: int) -> int:
    """ovl62:044a(first capital of p): the city covering that square, or -1.
    Evidence: asm ovl18:0957, ovl27:0e4a / 1118, ovl19:0103 (lcall ovl62:044a on those words)."""
    return state.city_at(*first_capital(state, p))


def _side(v: int) -> int:
    """An owner / claim value used as an index into the eight-side arrays of the original."""
    if not 0 <= v < SIDES:
        raise RuntimeError("side index %d outside the 8-entry arrays (the original reads other "
                           "locals there)" % v)
    return v


def _alive(state, p: int) -> bool:
    return state.players[_side(p)].alive != 0


def _control(state, p: int) -> int:
    return state.players[_side(p)].control


def _intact(state, c: int) -> bool:
    city = state.cities[c]
    return state.world.terrain(city.x, city.y) == Terrain.CITY


def _clear_proposal(state, p: int, q: int) -> None:
    """byte 2c04:153b[p*8 + q] &= 0xf3 (proposal peace)."""
    D.set_proposal(state, p, q, Relation.PEACE)


def claim_city(state) -> None:
    """ovl18:0917(): c0 = ovl62:044a(first capital of the side on turn); over the intact cities
    c = count-1..0 whose claim byte (+0x2f, unsigned) is not the side's and is 0x0f or a dead
    side's: d = dist(c, record c0); the smallest d < 40 (strict, from 10000: the highest index
    wins ties) gets claim byte = the side.  No rnd.
    Evidence: asm ovl18:0917..0a6d (091f -1, 0924 10000, 093b..0957 ovl62:044a(0x193 + 0x14 cur,
    0x195 + ...), 0967 SCN 0x157b loop, 09a8 terrain 10, 09bd..09d0 claim byte == cur word,
    09d2 0x0f, 09e0 0x137[claim] != 0 -> skip, 09e8..0a26 0a8b:0acc(c.x, c.y, c0.x, c0.y),
    0a30 < 40, 0a35 < best, 0a65 byte write)."""
    p = state.current
    r0 = city_record(state, capital_city(state, p))
    best, bd = -1, CLAIM_START
    for c in range(len(state.cities) - 1, -1, -1):
        if not _intact(state, c):
            continue
        city = state.cities[c]
        cl = city.owner2 & 0xFF
        if cl == p:
            continue
        if cl != NEUTRAL and _alive(state, cl):
            continue
        d = distance(city.x, city.y, r0.x, r0.y)
        if d < CLAIM_RANGE and d < bd:
            bd, best = d, c
    if best != -1:
        state.cities[best].owner2 = p & 0xFF


def may_attack_city(state, c: int) -> int:
    """ovl18:0851(c): may the side on turn attack city c?  Owner 0x0f -> 1.  Else with n = the
    alive sides s (7..0) whose current relation cur -> s is war, `last` the last of them found,
    and r = current(cur, owner): 2 -> 1; 1 -> AI[+0x0c] & 1; 0 -> (n == 0 or (n == 1 and last
    == owner)) and AI[+0x0c] & 1; 3 -> 0.
    Evidence: asm ovl18:0851..0916 (0865 owner cwde, 086d 0x0f, 0878..08b8 loop 7..0 with
    0x137, relation & 3 == 2, [bp-2] = s, cx += 1; 08ba..08e4 switch on relation[cur*8 + owner]
    & 3; 08e6 / 0903 test AI[+0xc] & 1; 08f5..0901 n tests)."""
    p = state.current
    o = s8(state.cities[c].owner)
    if o == NEUTRAL:
        return 1
    n, last = 0, None
    for s in range(SIDES - 1, -1, -1):
        if _alive(state, s) and _rel_byte(state, p * SIDES + s) & 3 == Relation.WAR:
            last, n = s, n + 1                            # `last` is read only when n == 1
    r = _rel_byte(state, p * SIDES + o) & 3
    flag = block(state).flags & 1
    if r == Relation.WAR:
        return 1
    if r == Relation.NEUTRAL:
        return int(bool(flag))
    if r == Relation.PEACE:
        return int((n == 0 or (n == 1 and last == o)) and bool(flag))
    return 0


def ally_vs_human(state, q: int) -> int:
    """ovl18:0a6e(q): 1 when Diplomacy is on, AI[+0x38] != 0, the side on turn is a computer
    (SCN 0x0d0 != 0), and some alive human h (0x0d0 == 0, h = 7..0) has current(q, h) == war
    and DS:40f2[h] != 0; else 0.
    Evidence: asm ovl18:0a6e..0afd (0a78 SCN 0x11c, 0a84 +0x38, 0a9c 0x0d0[cur], 0aa4..0af8
    loop: 0x137, 0x0d0 == 0, relation[q*8 + h] & 3 == 2, DS:40f2[h])."""
    p = state.current
    if not state.options.diplomacy or block(state).solidarity == 0:
        return 0
    if _control(state, p) == Control.HUMAN:
        return 0
    r = 0
    for h in range(SIDES - 1, -1, -1):
        if (_alive(state, h) and _control(state, h) == Control.HUMAN
                and _rel_byte(state, q * SIDES + h) & 3 == Relation.WAR
                and state.ai.solidarity[h] != 0):
            r = 1
    return r


def _allied_vs_human(state) -> list[int]:
    """vs[s] = 1 for each alive computer s (0x0d0 != 0) at war (current) with an alive side whose
    0x0d0 != 1 (ovl18:06b8..074e, ovl27:13db..1478: the same loops)."""
    vs = [0] * SIDES
    for s in range(SIDES - 1, -1, -1):
        if not _alive(state, s) or _control(state, s) == Control.HUMAN:
            continue
        for h in range(SIDES - 1, -1, -1):
            if (_alive(state, h) and _control(state, h) != Control.COMPUTER
                    and _rel_byte(state, s * SIDES + h) & 3 == Relation.WAR):
                vs[s] = 1
    return vs


def choose_enemy(state, arg: int = 0) -> int:
    """ovl27:0e04(arg): the side to make war on, or -1 (ai.md §6.1a).  `arg` is not read.
    Draws rnd(1,10,0) for p = 7..0 first (8 draws), interleaved with clearing the arrays.
    Per foreign-owned city c = count-1..0 (owner != 0x0f): cities[owner] += 1, seen[owner] += 1
    unless AI flag bit 0; for own cities: mine_in[claim] += 1 (claim != 0x0f), and border[cur]
    += 1 per neighbour n (ovl25:0656, i = 5..0) not own with claim(n) == cur (indexed by the
    city's owner, i.e. cur).  tf_on[enemy] += 1 per active task force (k = AI[+0x24a]-1..0).
    score[owner(capital)] += 20 when our first capital is held by another side.  others =
    sides p != cur with cities; took_cap[p] when we own p's first capital.  score[p] += r10 +
    15 took + 4 mine_in + 6 border + 4 mem3bc + mem3cc + mem3dc + 2 (mem3ec + mem3fc + mem40c) +
    the level bonus (AI[+0x18] when the side on turn is human, else +0x1e / +0x1a / +0x1c for
    level 2 / 1 / 0) + |infamy[cur] - infamy[p]| / 8 + |cities[cur] - cities[p]| / 4 (16-bit
    abs, idiv).  Zeroed: allied computers against humans ("I am the Greatest", computer side
    only); ovl18:0a6e(p); prop(cur, p) == peace while some alive p' != cur has prop war;
    seen[p] == 0 without an active task force; max(turn, 1) < 4 (Quick Start) / 8 and mem3dc +
    mem3fc == 0; others > 1 and cities[p] / 4 < tf_on[p]; score[cur].  enemy = the strictly
    best score > 0 among sides with cities (7..0: the highest index wins ties); the capital's
    holder overrides unless tf_on[k] == holder for some k < AI[+0x24a] (as coded: the count
    array indexed by k); -1 when the enemy has no seen city.
    Evidence: asm ovl27:0e04..16cf (0e17 -1, 0e21..0e4a capital, 0e66 infamy, 0e6e..0ef8 clear
    + rnd, 0f00..1039 cities, 103e..1084 task forces, 1086..10ce capital + 20, 10d2..1154
    others / took, 1156..135d scores (1242..12f0 level), 1360..13b0 any war, 13b7..14d9 0x116,
    14db..15e0 zeroing, 15e8 score[cur], 15fc..1630 best, 1632..16ab capital holder, 16ae..16c4
    seen)."""
    p = state.current
    b = block(state)
    cap = capital_city(state, p)
    inf = s16(state.players[p].infamy)
    seen, score, cities, took, border, mine_in, tf_on, r10 = ([0] * SIDES for _ in range(8))
    for q in range(SIDES - 1, -1, -1):
        r10[q] = state.rng.rnd(*ENEMY_ROLL)
    for c in range(len(state.cities) - 1, -1, -1):
        city = state.cities[c]
        if city.owner & 0xFF == NEUTRAL:
            continue
        o = _side(s8(city.owner))
        cities[o] += 1
        if not b.city_flags[c] & CITY_FLAG_UNSEEN:
            seen[o] += 1
        if o != p:
            continue
        if city.owner2 & 0xFF != NEUTRAL:
            mine_in[_side(city.owner2 & 0xFF)] += 1
        _, ids, _ = is_neighbour(state, c, 0)
        for i in range(5, -1, -1):
            n = ids[i]
            if n == 0xFF:
                continue
            nc = state.cities[n]
            if s8(nc.owner) != p and (nc.owner2 & 0xFF) == p:
                border[o] += 1
    ntf = 0
    for k in range(s16(b.n_task_forces) - 1, -1, -1):
        tf = b.task_forces[k]
        if tf.age != 0:
            tf_on[_side(s16(tf.enemy))] += 1
            ntf += 1
    rc = city_record(state, cap)
    co = s8(rc.owner)
    if rc.owner != NEUTRAL and co != p:
        score[_side(co)] += CAPITAL_LOST_BONUS
    others = 0
    for q in range(SIDES - 1, -1, -1):
        if cities[q] == 0:
            continue
        if q != p:
            others += 1
        if s8(city_record(state, capital_city(state, q)).owner) == p:
            took[q] = 1
    m = b.memory
    pl = state.players[p]
    for q in range(SIDES - 1, -1, -1):
        v = (score[q] + r10[q] + TOOK_CAPITAL * took[q] + MINE_IN * mine_in[q] + BORDER * border[q]
             + 4 * s16(m[0][q]) + s16(m[1][q]) + s16(m[2][q])
             + 2 * s16(m[3][q]) + 2 * s16(m[4][q]) + 2 * s16(m[5][q]))
        if pl.control == Control.HUMAN:
            v += s16(b.enemy_bonus_human)
        elif pl.level == 2:
            v += s16(b.enemy_bonus_l2)
        elif pl.level == 1:
            v += s16(b.enemy_bonus_l1)
        elif pl.level == 0:
            v += s16(b.enemy_bonus_l0)
        v += _idiv(_abs16(inf - s16(state.players[q].infamy)), INFAMY_DIV)
        v += _idiv(_abs16(cities[p] - cities[q]), CITIES_DIV)
        score[q] = s16(v)
    any_war = 0
    for q in range(SIDES - 1, -1, -1):
        if _alive(state, q) and q != p and D.proposal(state, p, q) == Relation.WAR:
            any_war = 1
    if state.flags.get(SCN_GREATEST, 0) and pl.control != Control.HUMAN:
        vs = _allied_vs_human(state)
        for q in range(SIDES - 1, -1, -1):
            if _alive(state, q) and _control(state, q) != Control.HUMAN and (vs[p] or vs[q]):
                score[q] = 0
    early = EARLY_QUICK if state.options.quick_start else EARLY
    for q in range(SIDES - 1, -1, -1):
        met = s16(m[2][q] + m[4][q])
        if ally_vs_human(state, q):
            score[q] = 0
        if any_war and D.proposal(state, p, q) == Relation.PEACE:
            score[q] = 0
        if ntf == 0 and seen[q] == 0:
            score[q] = 0
        if turn(state) < early and met == 0:
            score[q] = 0
        if others > 1 and _idiv(cities[q], TF_SHARE_DIV) < tf_on[q]:
            score[q] = 0
    score[p] = 0
    enemy, best = -1, 0
    for q in range(SIDES - 1, -1, -1):
        if cities[q] != 0 and score[q] > best:
            best, enemy = score[q], q
    if rc.owner != NEUTRAL and co != p:
        hit = any(co == tf_on[k] for k in range(s16(b.n_task_forces) - 1, -1, -1))
        if not hit:
            enemy = co
    if enemy != -1 and seen[_side(enemy)] == 0:
        enemy = -1
    return enemy


def _abs16(v: int) -> int:
    """cdq / xor / sub on a word: abs, with abs(-32768) = -32768."""
    v = s16(v)
    return v if v == -0x8000 else abs(v)


def _idiv(a: int, b: int) -> int:
    """Signed division truncating toward zero (idiv)."""
    q = abs(a) // abs(b)
    return q if (a < 0) == (b < 0) else -q


def diplomacy(state) -> list:
    """ovl18:0000: the Diplomacy phase (ai.md §6.1).  claim_city (0917) always; with Diplomacy on:
    enemy = choose_enemy (ovl27:0e04, 8 rnd); for p = 7..0 the side's proposal to p restarts at
    peace; per-side counts over the cities (count-1..0); steps A (territory conflict: neutral
    when DS:4090[p] >= 2 (peace_in - war_in) + 4; war at + 8 unreachable), B (battle memory
    mem3ec + 4 mem40c + 2 mem3bc >= t + 5 -> at least neutral; war at t + 10 unreachable), C
    (war on the enemy), D (war on every active task force's enemy, k = 3..0), E (a side with
    more cities than the best so far and a share above AI[+0x44] (human) / 50 (computer) is the
    leader: war on it and the enemy, peace with the rest), F (computer with AI[+0x38]: peace
    with computers that 0a6e flags, and with every alive computer whose DS:40f2 is set when the
    side is at war with a non-computer - prop(cur, cur) included), G ("I am the Greatest",
    computer side: peace with allied computers), H (peace with sides without unflagged cities),
    I (a task force whose enemy is now at peace is cancelled: ovl19:066d(k, 20)).  Returns no
    events (the proposals are resolved by the rules code).
    Evidence: asm ovl18:0000..0850 (0019 0x0d0[cur] -> [bp-4], 002d 0917, 0035 SCN 0x11c, 0042
    ovl27:0e04 -> DS:408e, 004b..0108 per-side clear (0065 & 0xf3), 010b..022d city counts,
    0230..02d7 A, 02da..03e7 B (036a jbe 1 -> max), 03ea..0411 C, 0413..045f D (k = 3..0, all
    four), 0461..055c E, 055e..069d F, 069f..07be G, 07c0..07ef H, 07f1..084b I)."""
    from . import assault
    p = state.current
    b = block(state)
    human = state.players[p].control == Control.HUMAN
    claim_city(state)
    if not state.options.diplomacy:
        return []
    events: list = []
    enemy = choose_enemy(state, 0)                    # DS:408e
    n4090, n40a0, n40b0 = [0] * SIDES, [0] * SIDES, [0] * SIDES
    peace_in, war_in = [0] * SIDES, [0] * SIDES
    for q in range(SIDES - 1, -1, -1):
        _clear_proposal(state, p, q)
        pq = D.proposal(state, q, p)
        if pq == Relation.PEACE:
            peace_in[q] = 1
        elif pq == Relation.WAR:
            war_in[q] = 1
    total = 0
    for c in range(len(state.cities) - 1, -1, -1):
        if _intact(state, c):
            total += 1
        city = state.cities[c]
        if city.owner & 0xFF == NEUTRAL:
            continue
        o = _side(s8(city.owner))
        n40a0[o] += 1
        if not b.city_flags[c] & CITY_FLAG_UNSEEN:
            n40b0[o] += 1
        cl = city.owner2 & 0xFF
        if o == p:
            if cl != NEUTRAL:
                n4090[_side(cl)] += 1
        elif cl == p:
            n4090[o] += 1
    for q in range(SIDES - 1, -1, -1):                # A
        if q == p or not _alive(state, q):
            continue
        t = 2 * (peace_in[q] - war_in[q])
        if n4090[q] >= t + STEP_A_NEUTRAL:
            D.set_proposal(state, p, q, Relation.NEUTRAL)
        elif n4090[q] >= t + STEP_A_WAR:
            D.set_proposal(state, p, q, Relation.WAR)
    m = b.memory
    for q in range(SIDES - 1, -1, -1):                # B
        if q == p or not _alive(state, q):
            continue
        v = s16(s16(m[3][q]) + 4 * s16(m[5][q]) + 2 * s16(m[0][q]))
        t = 2 * (peace_in[q] - war_in[q])
        if t + STEP_B_NEUTRAL <= v:
            cur = D.proposal(state, p, q)                 # 0 or 1 here: A writes only neutral
            D.set_proposal(state, p, q, cur if cur > Relation.NEUTRAL else Relation.NEUTRAL)
        elif t + STEP_B_WAR <= v:
            D.set_proposal(state, p, q, Relation.WAR)
    if enemy != -1:                                   # C
        D.set_proposal(state, p, enemy, Relation.WAR)
    for k in range(3, -1, -1):                        # D
        tf = b.task_forces[k]
        if tf.age != 0:
            D.set_proposal(state, p, _side(s16(tf.enemy)), Relation.WAR)
    best, leader = 0, -1                              # E
    for q in range(SIDES - 1, -1, -1):
        if not _alive(state, q):
            continue
        share = _idiv(s16(n40a0[q] * 100), total if total >= 1 else 1)
        thr = s16(b.leader_share) if _control(state, q) == Control.HUMAN else SHARE_COMPUTER
        if n40a0[q] > best and share > thr:
            best, leader = n40a0[q], q
    if leader != -1 and leader != p:
        for q in range(SIDES - 1, -1, -1):
            if not _alive(state, q):
                continue
            if q == leader or q == enemy:
                D.set_proposal(state, p, q, Relation.WAR)
            else:
                _clear_proposal(state, p, q)
    if not human and b.solidarity != 0:               # F
        for q in range(SIDES - 1, -1, -1):
            if (_alive(state, q) and _control(state, q) != Control.HUMAN and q != p
                    and D.proposal(state, p, q) != Relation.PEACE and ally_vs_human(state, q)):
                _clear_proposal(state, p, q)
        at_war = 0
        for q in range(SIDES - 1, -1, -1):
            if (_alive(state, q) and _control(state, q) != Control.COMPUTER
                    and _rel_byte(state, p * SIDES + q) & 3 == Relation.WAR):
                at_war = 1
        if at_war:
            for q in range(SIDES - 1, -1, -1):
                if (_alive(state, q) and _control(state, q) == Control.COMPUTER
                        and state.ai.solidarity[q] != 0):
                    _clear_proposal(state, p, q)
    if not human and state.flags.get(SCN_GREATEST, 0):   # G
        vs = _allied_vs_human(state)
        for q in range(SIDES - 1, -1, -1):
            if (_alive(state, q) and _control(state, q) != Control.HUMAN
                    and (vs[p] or vs[q])):
                _clear_proposal(state, p, q)
    for q in range(SIDES - 1, -1, -1):                # H
        if n40b0[q] == 0:
            _clear_proposal(state, p, q)
    for k in range(3, -1, -1):                        # I
        tf = b.task_forces[k]
        if tf.age != 0 and D.proposal(state, p, _side(s16(tf.enemy))) == Relation.PEACE:
            assault.cancel_tf(state, k, 20)
    return events
