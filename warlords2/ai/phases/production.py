"""ovl25:06d4: the production phase (ai.md §6.16), the 18th phase of ovl25:0000 (at 0313).

It starts with ovl27:0aed (task-force sources, `assault_xx.refresh_sources`, M8b4) and, under
Hidden Map, ovl20:02ff (`neutral.mark_explore_cities`, M8b3); both are imported when called so
that tests can replace them.  The city record writes (+0x2d, +0x31, +0x33 / +0x35) are made
here as the listing makes them.

DS:5dca / DS:5dda (income / upkeep of the side on turn) are caches in the original, refreshed
by ovl62:0372 / 02bf at the turn-start settlement (ovl68:082a / 082f), after battles (ovl36:0cba)
and captures (ovl36:10c6) and after a raze (ovl32:00a1), not after the AI's own purchases or
disbands.  `_income` / `_upkeep` read the engine's copies of these caches,
`rules.economy.cached_income` / `cached_upkeep` (DS:5dca / DS:5dda, refreshed at the same call
sites), so a purchase or disband earlier in this phase does not change them.
"""
from __future__ import annotations

from ...rules import economy as EC
from ...rules.economy import s16
from ..state import block
from ..util import buy_flying_slot, choose_production, production_in_progress

POOR_GOLD = 40                                    # ovl25:076d (gold < 0x28)
CF_FLYING_SLOT = 0x02                             # AI[+0x11e + c] bit 1 (ovl25:07c4 / 07e7)
ROLE_EXPLORE, ROLE_EXPAND, ROLE_BUILD_UP = 2, 3, 4
ROLE_FULL, ROLE_FLYER, ROLE_FLYER_WANTED = 8, 11, 13
KIND_DEFAULT, KIND_FLYER = 3, 4                   # ovl25:0829 push 3, 07d6 push 4
KIND_EXPAND_NEUTRAL, KIND_EXPAND = 2, 1           # ovl25:080f push 2, 0805 push 1
KIND_BUILD_UP = 2                                 # ovl25:0809 (case role 4)
NO_VECTOR = -1                                    # ovl25:0829 push 0xffff (dword 0x0000ffff: vec = -1, dry = 0)
VECTOR_OFF = (-1, -1)                             # ovl25:0735 / 0746 (+0x33 = +0x35 = 0xffff)


def _refresh_sources(state) -> list:
    """ovl27:0aed (ai/phases/assault_xx.py `refresh_sources`, M8b4)."""
    from .assault_xx import refresh_sources
    return refresh_sources(state) or []


def _mark_explore_cities(state) -> list:
    """ovl20:02ff (ai/phases/neutral.py `mark_explore_cities`, M8b3)."""
    from .neutral import mark_explore_cities
    return mark_explore_cities(state) or []


def _income(state) -> int:
    """DS:5dca[SCN 0x110], the cache of ovl62:0372 as last refreshed (rules.economy)."""
    return EC.cached_income(state, state.current)


def _upkeep(state) -> int:
    """DS:5dda[SCN 0x110], the cache of ovl62:02bf as last refreshed (rules.economy)."""
    return EC.cached_upkeep(state, state.current)


def production_kind(state, c: int) -> int | None:
    """The switch on role - 2 (ovl25:07a0..07b2, table ovl25:0847, unsigned `ja` to the default):
    role 2 / 13: buy a flying slot first (ovl29:11d5) unless AI[+0x11e+c] bit 1 -> kind 4;
    11 -> 4; 3 -> 2 with Neutral Cities (SCN 0x11a != 0) else 1; 4 -> 2; 8 -> +0x2d = 0 and no
    production (None); every other role (0, 1, 5, 6, 7, 9, 10, 12, 14..255) -> 3.
    Evidence: asm ovl25:079a..0829 (cases 07b7 role 13, 07da role 2, 07f0 role 3, 0809 role 4,
    0813 roles 5..7, 0815 role 8, 0827 role 11, 0829 default)."""
    role = block(state).role[c]
    if role in (ROLE_EXPLORE, ROLE_FLYER_WANTED):
        if not block(state).city_flags[c] & CF_FLYING_SLOT:
            buy_flying_slot(state, c)
        return KIND_FLYER
    if role == ROLE_FLYER:
        return KIND_FLYER
    if role == ROLE_EXPAND:
        return KIND_EXPAND_NEUTRAL if state.options.neutral_cities else KIND_EXPAND
    if role == ROLE_BUILD_UP:
        return KIND_BUILD_UP
    if role == ROLE_FULL:
        state.cities[c].turns_left = 0
        return None
    return KIND_DEFAULT


def production(state) -> list:
    """ovl25:06d4, the production phase: ovl27:0aed; with Hidden Map (SCN 0x124) ovl20:02ff;
    then for every city c = count-1..0 whose owner byte is the side on turn's: vectoring off
    (+0x31 = 0, +0x33 = +0x35 = -1); a production partly done (ovl29:0fd5) is kept; gold < 40
    and income DS:5dca < upkeep DS:5dda (both signed words) end the whole phase; else the kind
    of the city's role (`production_kind`) and ovl29:103d(c, kind, -1, 0), which picks and
    starts the slot type (refused by 0e5a when unaffordable after turn 5) with vectoring off.
    No rnd.
    Evidence: asm ovl25:06d4..0846 (06d8 ovl27:0aed, 06e2 SCN 0x124, 06ea ovl20:02ff, 06f4 SCN
    0x157b and 083a..0841 the loop c = count-1..0, 0706..0717 owner byte, 0724..0746 +0x31 /
    +0x33 / +0x35, 074e ovl29:0fd5, 0760..0797 gold < 0x28 (jge) and DS:5dca < DS:5dda (jge)
    -> 0844 return, 079a..07b2 switch, 0829..0837 ovl29:103d(c, kind, 0xffff, 0))."""
    events: list = []
    events += _refresh_sources(state)
    if state.options.hidden_map:
        events += _mark_explore_cities(state)
    p = state.current
    for c in range(len(state.cities) - 1, -1, -1):
        city = state.cities[c]
        if city.owner & 0xFF != p & 0xFF:
            continue
        city.vectoring = 0
        city.vector_to = VECTOR_OFF
        if production_in_progress(state, c):
            continue
        if s16(state.players[p].gold) < POOR_GOLD and s16(_income(state)) < s16(_upkeep(state)):
            return events
        kind = production_kind(state, c)
        if kind is None:
            continue
        choose_production(state, c, kind, NO_VECTOR, 0)
    return events
