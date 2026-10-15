"""Income, upkeep and the per-turn gold settlement (EL §6.3).

Sources (re-read by M6a from out/asm/ and out/rea/decomp/):

* city count   ovl62:03f9 (L 0x828e9): cities whose signed owner byte +0x15 < 8, per owner
* income       ovl62:0372 (L 0x82862): sum of city +0x2a per owner, plus cities[p] * ovl35:07cf(p)
* gold items   ovl35:07cf (L 0x672cf): values of type-7 items carried by p's heroes
* upkeep       ovl62:02bf (L 0x827af): army +0xb over p's armies with x, y >= 0; aboard -> max(4, .)
* settlement   ovl68:0827 (L 0x8d037): gold[0x110] += income - upkeep; below 0 -> 0

The original keeps the results in DGROUP word arrays indexed by side: DS:5dca[8] income (written
only by ovl62:0372), DS:5dda[8] upkeep (only ovl62:02bf), DS:5dea[8] city count (only
ovl62:03f9).  All three are kept here too (`GameState.income_cache` / `upkeep_cache` /
`city_counts`): `refresh_income` / `refresh_upkeep` / `refresh_cities` rewrite all eight words and
run at the original's call sites only; the readers (`cached_income` / `cached_upkeep` /
`cached_cities`) see stale values in between (units produced by ovl43:0000 after the settlement,
AI disbands ovl24:015e, purchases, boarding, items taken by a search; for the city count the
burning of Resign and the raze of a captured city, both ovl32:016b without 03f9):

* 0372 + 02bf  ovl68:0827 settlement (082a / 082f; both turn kinds), ovl68:0259 human turn
               start (0303 / 0308), ovl36:0a6b after a battle (0cba / 0cbf, after the
               casualties), the take-over tail (10c6 / 10cb), ovl32:0061 own raze (00a1 / 00a6),
               the reports ovl42:01c3 (Gold) and 04c2 (Winning / history score), the loads
               ovl49:0366 / 1374 (no load path yet: M10b), ovl68:022c (no caller)
* 02bf only    0b62:089a Disband (yes)
* 0372 only    ovl40:0b30 the hero item dialog's close (rules/heroes.py take / drop)
* 03f9         ovl32:009c own raze, ovl36:0cb5 after a battle, 10c1 the take-over tail, 1149
               ovl36:10d7 (the pass top's capital, more than one live side), ovl41:0efb the
               history round, ovl42:0343 every report page (ovl42:02fb, also the history
               scores ovl42:0947), ovl47:007b the computer hero offer, ovl61:18b3 elimination,
               1afa the end states, ovl68:0158 / 01c7 the computer turn, 02fe the human turn
               start; ovl49:0361 / 136f the loads (M10b), ovl68:0234 (ovl68:022c, no caller)

Readers: ovl68:0840 / 0850 (settlement), ovl25:0781 / 0791 (AI production), ovl24:0680 / 0686
(AI clean city), ovl26:05d1 / 05e1 (AI quick attack), ovl42:0529 / 0536 (score), ovl66:0695 /
06e4 (info area) and ovl66:0c38 / 0c64 (its right-press texts); all index SCN 0x110 except
ovl42 (every side).  DS:5dea: ovl62:03e1 (0372's gold items), ovl36:0da0 / 0dc5 (the loot),
11c2 (the capital), ovl01:191d (quest reward), ovl42:0405 (Report > City), ovl41:0f95 (the
history record), ovl45:02b6 / 0447 (the city screen), ovl47:008c / 0168 / 0194 (hero offer),
ovl49:151c (Resign), ovl58:02b7.. (the advisor), ovl61:0745 / 0886 (the menus), 1915
(elimination), 1cdf / 1df3.. (end states), ovl66:05f0 / 0bd8 (info area), ovl68:0161 (the
computer turn).
Gold is a signed 16-bit word in the original (`s16`).
"""
from __future__ import annotations

from ..model import events as E
from ..model.ids import HERO_TYPE
from ..model.state import SCN_ARMY_HIGH
from .bonuses import ABOARD_FLAG, carried_items, s8
from .constants import city as K

N_SIDES = 8


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
    """Number of cities owned by p as ovl62:03f9 counts them now (what it writes to DS:5dea[p];
    the readers of the word use `cached_cities`).
    Evidence: asm ovl62:03f9..0449."""
    return sum(1 for c in state.cities if owns(c, p))


def refresh_cities(state) -> None:
    """ovl62:03f9: rewrite the city counts DS:5dea of all eight sides.
    Evidence: asm ovl62:03f9..0449: DS:5dea[0..7] = 0 (0404); cities 0..count-1 with signed
    owner byte < 8 increment DS:5dea[owner] (0437)."""
    state.city_counts[:] = [city_count(state, p) for p in range(N_SIDES)]


def cached_cities(state, p: int) -> int:
    """DS:5dea[p], the city count as last written by ovl62:03f9.
    Evidence: asm (readers, grep of the listings for 0x5dea) ovl62:03e1, ovl36:0da0 / 0dc5 /
    11c2, ovl01:191d, ovl41:0f95, ovl42:0405, ovl45:02b6 / 0447, ovl47:008c / 0168 / 0194,
    ovl49:151c, ovl58:02b7 / 0330 / 0367 / 037c / 04c4 / 04fe / 0513, ovl61:0745 / 0886 / 1915
    / 1cdf / 1df3 / 1dfd / 1e1a / 1e38, ovl66:05f0 / 0bd8, ovl68:0161; written only by ovl62:03f9
    (0404 / 0437)."""
    return state.city_counts[p]


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
    """Gold income of side p as ovl62:0372 computes it.
    Evidence: asm ovl62:0372..03f8: sum of the word +0x2a over cities with owner p, then
    + DS:5dea[p] * ovl35:07cf(p) (imul, 16-bit; the stored count, 03e1)."""
    base = sum(c.income for c in state.cities if owns(c, p))
    return s16(base + s16(cached_cities(state, p) * gold_items(state, p)))


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


def refresh_income(state) -> None:
    """ovl62:0372: rewrite the income cache DS:5dca of all eight sides.
    Evidence: asm ovl62:0372..03f8: DS:5dca[0..7] = 0; cities 0..count-1 with signed owner byte
    < 8 add their word +0x2a to DS:5dca[owner]; then DS:5dca[p] += DS:5dea[p] * ovl35:07cf(p)
    for p = 0..7 (word adds, 16-bit imul), DS:5dea as 03f9 last wrote it."""
    state.income_cache[:] = [income(state, p) for p in range(N_SIDES)]


def refresh_upkeep(state) -> None:
    """ovl62:02bf: rewrite the upkeep cache DS:5dda of all eight sides.
    Evidence: asm ovl62:02bf..0371: DS:5dda[0..7] = 0; army records [0x181]-1 down to 0 with
    signed owner byte < 8, x >= 0 and y >= 0 add their signed byte +0xb (aboard: at least 4)
    to DS:5dda[owner] (word adds).  A negative owner byte would index below the array; the only
    one is 0xff of a freed record, whose x is -1 (rules.movement.remove_army)."""
    high = min(state.flags.get(SCN_ARMY_HIGH, len(state.armies)), len(state.armies))
    out = [0] * N_SIDES
    for a in state.armies[:high]:
        o = s8(a.owner)
        if o >= K.OWNER_LIMIT.value or a.x < 0 or a.y < 0:
            continue
        u = s8(a.upkeep)
        if a.flags & ABOARD_FLAG:
            u = max(u, K.ABOARD_UPKEEP_MIN.value)
        out[o] = s16(out[o] + u)
    state.upkeep_cache[:] = out


def refresh(state) -> None:
    """Both caches, in the order of the call site that runs 02bf first (ovl36:0cba, 10c6,
    ovl32:00a1, ovl49:0366) - the order does not change the values.
    Evidence: asm ovl36:0cba / 0cbf: ovl62:02bf, ovl62:0372."""
    refresh_upkeep(state)
    refresh_income(state)


def cached_income(state, p: int) -> int:
    """DS:5dca[p], the income as last refreshed.
    Evidence: asm ovl68:0840, ovl25:0781, ovl24:0686, ovl26:05d1, ovl42:0529, ovl66:0695 / 0c38
    read the word; written only by ovl62:0372 (grep of the listings)."""
    return state.income_cache[p]


def cached_upkeep(state, p: int) -> int:
    """DS:5dda[p], the upkeep as last refreshed.
    Evidence: asm ovl68:0850, ovl25:0791, ovl24:0680, ovl26:05e1, ovl42:0536, ovl66:06e4 / 0c64
    read the word; written only by ovl62:02bf (grep of the listings)."""
    return state.upkeep_cache[p]


def settle(state) -> list:
    """Credit the current side's income minus upkeep; negative gold becomes 0.  Nothing is
    disbanded for lack of money.
    Evidence: asm ovl68:0827..089c: ovl62:0372, ovl62:02bf (refresh the caches), gold[0x110] +=
    DS:5dca[0x110] - DS:5dda[0x110] (word), if gold < 0 (signed): gold = 0."""
    p = state.current
    refresh_income(state)
    refresh_upkeep(state)
    inc, upk = cached_income(state, p), cached_upkeep(state, p)
    before = s16(state.players[p].gold)
    add_gold(state, p, s16(inc - upk))
    if state.players[p].gold < 0:
        state.players[p].gold = 0
    return [E.IncomeSettled({"player": p, "income": inc, "upkeep": upk, "before": before,
                             "gold": state.players[p].gold})]
