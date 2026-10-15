"""ovl25:0af2 / 0bd1 / 0c83: the rebuilding phase (ai.md §6.17), the 16th phase of ovl25:0000
(at 02dd): when the side has enough heroes or few cities and at least 500 gold, it buys a
production slot of its card's type (AI[+0x10] / +0x12) for the city that needs one most.

The purchase ovl44:1299 is `ai.util.fill_slot`, shared with ovl29:11d5
(`ai.util.buy_flying_slot`).
"""
from __future__ import annotations

from ...rules.economy import s16
from ..state import block
from ..util import PRODUCTION_MARGIN, can_build_decent, fill_slot, weakest_slot

QUOTA_DIV, QUOTA_MIN = 80, 5                     # ovl25:0b0b (idiv 0x50), 0b11 (cmp 5)
HEROES_ENOUGH = 5                                # ovl25:0b3a (AI[+0x0e] >= 5)
MIN_GOLD, RICH_GOLD = 500, 2000                  # ovl25:0b60 / 0bb9 (0x1f4), 0b7b (0x7d0)
ROLE_EXPLORE, ROLE_EXPAND, ROLE_BUILD_UP, ROLE_INTERIOR = 2, 3, 4, 5
ROLE_FULL, ROLE_REBUILD = 8, 14                  # ovl25:0d3f (= 8), 0d1d (= 0xe)
YOUNG_CITY, YOUNG_SUB = 4, 4                     # ovl25:0d4e (age < 4, unsigned), 0d56 (sub = 4)


def buy_slot(state, t: int, c: int) -> int:
    """ovl25:0bd1(t, c): ovl44:1128 (open ARMYTYPE); r = ovl44:138f(t, ...) = the production
    record of type t, price = its w4 (+0x1e); price + 30 (word); gold (signed) > that (strict,
    `jle` skips): s = ovl29:1ae9(c), ovl44:1299(c, s, r) (gold -= price), AI[+0x16] += 1, +0x2d =
    0 (byte), +0x31 = 0 (word), role[c] = 5, and 1 is returned; else 0.  ovl44:11e2 (close).
    s = -1 (every slot at strength 10 or more) would make 1299 write the slot -1 bytes (the
    city's owner byte and slot 3): refused, as `ai.util.buy_flying_slot` does.
    Evidence: asm ovl25:0bd1..0c82 (0bde ovl44:1128, 0bff ovl44:138f(t, &bp-2, &bp-4, &bp-6,
    &bp-8 = price, &bp-0xa), 0c0a add 0x1e, 0c20..0c28 gold jle, 0c2e ovl29:1ae9, 0c3c
    ovl44:1299(c, s, r), 0c48 inc +0x16, 0c56 +0x2d, 0c66 +0x31, 0c73 role 5, 0c78 ovl44:11e2)."""
    p = state.current
    rec = state.army_type(t)
    limit = s16(s16(rec.buy_price) + PRODUCTION_MARGIN)
    if not s16(state.players[p].gold) > limit:
        return 0
    s = weakest_slot(state, c)
    if s == -1:
        raise RuntimeError("ovl25:0bd1: no slot below strength 10 in city %d; ovl44:1299 would "
                           "write slot -1 (the owner byte)" % c)
    fill_slot(state, c, s, rec)                         # 0c3c ovl44:1299(c, s, r)
    blk = block(state)
    blk.slots_bought = s16(blk.slots_bought + 1)
    city = state.cities[c]
    city.turns_left = 0
    city.vectoring = 0
    blk.role[c] = ROLE_INTERIOR
    return 1


def rebuild_city(state, t: int) -> int:
    """ovl25:0c83(t): the own city that most needs a decent slot, -1 when none.  For c =
    count-1..0 owned by the side on turn (owner byte): a loop over its four slots compares their
    type with t and discards the result; by role (switch on role - 2, table ovl25:0daf): 2 / 3
    with age (AI[+0xba+c], unsigned byte) < 4 -> skip, else sub = 4 and as 4 / 5: a candidate
    when ovl29:1a4d(c) == 0; 8: 1a4d == 0 -> role 14 and a candidate; 14: 1a4d != 0 -> role 8,
    else a candidate; any other role -> skip.  A candidate with age - sub > the best so far
    (signed, from -1; strict, so the highest index wins ties) becomes the best.  1a4d is a dry
    run of 103d (no rnd).
    Evidence: asm ovl25:0c83..0dae (0c8b / 0c90 -1, 0c9a SCN 0x157b, 0cac..0cbb owner byte,
    0cc0..0cdf slot loop, 0ce1..0d00 switch, 0d05 role 8, 0d27 role 14, 0d48 roles 2 / 3, 0d5b
    roles 4 / 5, 0d6f..0d9b compare (jle), 0da8 return)."""
    p = state.current
    blk = block(state)
    best, bv = -1, -1
    for c in range(len(state.cities) - 1, -1, -1):
        if state.cities[c].owner & 0xFF != p & 0xFF:
            continue
        cand = 0
        sub = 0
        role = blk.role[c]
        if role in (ROLE_EXPLORE, ROLE_EXPAND):
            if blk.age[c] & 0xFF < YOUNG_CITY:
                continue
            sub = YOUNG_SUB
            cand = int(not can_build_decent(state, c)[0])
        elif role in (ROLE_BUILD_UP, ROLE_INTERIOR):
            cand = int(not can_build_decent(state, c)[0])
        elif role == ROLE_FULL:
            if not can_build_decent(state, c)[0]:
                blk.role[c] = ROLE_REBUILD
                cand = 1
        elif role == ROLE_REBUILD:
            if can_build_decent(state, c)[0]:
                blk.role[c] = ROLE_FULL
            else:
                cand = 1
        else:
            continue
        if not cand:
            continue
        v = (blk.age[c] & 0xFF) - sub
        if v > bv:
            best, bv = c, v
    return best


def rebuilding(state) -> list:
    """ovl25:0af2, the rebuilding phase: n = AI[+0x0a] * count (16-bit product, cwd) idiv 80,
    at least 5; when AI[+0x0e] >= 5 or n * AI[+0x0e] (16-bit) >= AI[+0x02] (signed), and gold
    >= 500: t = AI[+0x12] when gold > 2000 else AI[+0x10]; c = 0c83(t); c != -1 and gold >= 500
    -> 0bd1(t, c).  No rnd.
    Evidence: asm ovl25:0af2..0bd0 (0afd..0b33 n: imul, cwd (printed cdq), idiv 0x50, jge 5;
    0b36..0b4b AI[+0x0e] jge 5, imul, cmp AI[+0x02] jge; 0b60 gold jl 0x1f4; 0b7b jle 0x7d0;
    0b9b 0c83; 0ba2 -1; 0bb9 gold jl 0x1f4; 0bc8 0bd1(t, c))."""
    p = state.current
    blk = block(state)
    prod = s16(s16(blk.rebuild_quota) * len(state.cities))
    n = abs(prod) // QUOTA_DIV * (1 if prod >= 0 else -1)          # idiv truncates
    if n < QUOTA_MIN:
        n = QUOTA_MIN
    heroes = s16(blk.hero_count)
    if not (heroes >= HEROES_ENOUGH or s16(n * heroes) >= s16(blk.own_cities)):
        return []
    gold = s16(state.players[p].gold)
    if gold < MIN_GOLD:
        return []
    t = s16(blk.buy_high) if gold > RICH_GOLD else s16(blk.buy_low)
    c = rebuild_city(state, t)
    if c == -1:
        return []
    if s16(state.players[p].gold) < MIN_GOLD:
        return []
    buy_slot(state, t, c)
    return []
