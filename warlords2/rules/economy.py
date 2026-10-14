"""Income, upkeep and the per-turn gold settlement (EL §6.3).

Sources (re-read by M6a from out/asm/ and out/rea/decomp/):

* city count   ovl62:03f9 (L 0x828e9): cities whose signed owner byte +0x15 < 8, per owner
* income       ovl62:0372 (L 0x82862): sum of city +0x2a per owner, plus cities[p] * ovl35:07cf(p)
* gold items   ovl35:07cf (L 0x672cf): values of type-7 items carried by p's heroes
* upkeep       ovl62:02bf (L 0x827af): army +0xb over p's armies with x, y >= 0; aboard -> max(4, .)
* settlement   ovl68:0827 (L 0x8d037): gold[0x110] += income - upkeep; below 0 -> 0

The original keeps the three results in DGROUP caches (DS:5dca income, 5dda upkeep, 5dea city
count) refreshed by these routines; every reader in M6a's paths runs right after a refresh
(turn start ovl68, capture ovl36:10c1, raze ovl32:0061), so they are computed live here.
Gold is a signed 16-bit word in the original (`s16`).
"""
from __future__ import annotations

from ..model import events as E
from ..model.ids import HERO_TYPE
from .bonuses import ABOARD_FLAG, carried_items, s8
from .constants import city as K


def s16(v: int) -> int:
    """Wrap to a signed 16-bit word.
    Evidence: the gold word 2c04:0185 + p*0x14 is added and compared signed (asm ovl68:0863..087a,
    ovl43:0557 jg, ovl36:0dc4 idiv)."""
    half = 1 << (K.GOLD_BITS.value - 1)
    return ((v + half) & ((half << 1) - 1)) - half


def add_gold(state, p: int, delta: int) -> None:
    """gold[p] += delta as a signed word, no clamp (the purchase, loot, pillage and sack writes).
    Evidence: asm ovl44:0ee3 (sub), ovl36:0e4f / 0e62, ovl31:038a / 048d (add word)."""
    pl = state.players[p]
    pl.gold = s16(s16(pl.gold) + delta)


def owns(city, p: int) -> bool:
    """Whether the city counts for side p.
    Evidence: asm ovl62:041e / 0398: signed owner byte < 8 and equal to p."""
    o = s8(city.owner)
    return o < K.OWNER_LIMIT.value and o == p


def city_count(state, p: int) -> int:
    """Number of cities owned by p (the DS:5dea count).
    Evidence: asm ovl62:03f9..0449."""
    return sum(1 for c in state.cities if owns(c, p))


def gold_items(state, p: int) -> int:
    """Sum of the values of type-7 items carried by p's heroes.
    Evidence: asm ovl35:07cf..0873: armies of owner p with type 0x1c (no position test), items listed
    by ovl51:03d9 mode 2, item +0x14 == 7 adds the signed byte +0x15."""
    total = 0
    for a in state.armies:
        if a.owner == p and a.type_id == HERO_TYPE:
            total += sum(s8(state.items[i].value) for i in carried_items(state, a)
                         if state.items[i].type == K.GOLD_ITEM.value)
    return total


def income(state, p: int) -> int:
    """Gold income of side p this turn.
    Evidence: asm ovl62:0372..03f8: sum of the word +0x2a over cities with owner p, then
    + cities[p] * ovl35:07cf(p) (imul, 16-bit)."""
    base = sum(c.income for c in state.cities if owns(c, p))
    return s16(base + s16(city_count(state, p) * gold_items(state, p)))


def upkeep(state, p: int) -> int:
    """Gold upkeep of side p this turn.
    Evidence: asm ovl62:02bf..0371: armies (index 0x181-1 down to 0) with signed owner byte == p
    (< 8), x >= 0 and y >= 0 add the signed byte +0xb; one with flag 0x1000 (aboard) adds 4 instead
    when its upkeep is <= 4."""
    total = 0
    for a in state.armies:
        if a.owner != p or a.x < 0 or a.y < 0:
            continue
        u = s8(a.upkeep)
        if a.flags & ABOARD_FLAG:
            u = max(u, K.ABOARD_UPKEEP_MIN.value)
        total += u
    return s16(total)


def settle(state) -> list:
    """Credit the current side's income minus upkeep; negative gold becomes 0.  Nothing is
    disbanded for lack of money.
    Evidence: asm ovl68:0827..089c: ovl62:0372, ovl62:02bf, gold[0x110] += income - upkeep (word),
    if gold < 0 (signed): gold = 0."""
    p = state.current
    inc, upk = income(state, p), upkeep(state, p)
    before = s16(state.players[p].gold)
    add_gold(state, p, s16(inc - upk))
    if state.players[p].gold < 0:
        state.players[p].gold = 0
    return [E.IncomeSettled({"player": p, "income": inc, "upkeep": upk, "before": before,
                             "gold": state.players[p].gold})]
