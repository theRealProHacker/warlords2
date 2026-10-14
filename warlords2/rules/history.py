"""History: the per-round record (History menu: City, Events, Gold, Winners), the battle
statistics (History > Triumphs) and the battle entries of the news records.

Sources (re-read by M9a from out/asm/; EL = docs/research/exe_logic.md):

* round record        ovl41:0d60 (round end ovl61:1837), events from the news ovl41:132f,
                      news cleared ovl41:1225
* battle statistics   ovl36:1aff (first step of the after-battle ovl36:0a6b)
* battle news         ovl36:0a78..0afa (kind 5), ovl36:0b6a..0ba6 / 0c23..0c5f (kind 1)
* news record         ovl41:1244 = rules.heroes.news

The original appends each record to the history file FILE.DAT (6, 0) (created at turn 2 with
a 4-byte header holding the file length); here the records are `state.history` (own format,
X12), one dict per record in file order:

  {"gold": [8] player record +0, "score": [8] winning score 0..100 (rules.reports.scores),
   "cities": [8] DS:5dea, "owners": [one per city record] owner byte, 0xff when the city is not
   intact, "events": [[side, kind, a, b, name], ...] at most 10}

Record k (0-based) is written at the end of round k + 1, when the turn counter has become
k + 2 (the history viewer ovl41:034a counts the records from 1).  The file's length word and
the pad byte after an odd number of cities carry no information and are not kept.
The battle statistics are the 8 x 8 table of 5 words at 2c04:1163 (row = the side that made
the loss, column = the side that suffered it; the diagonal = all losses of a side), kept in
`state.flags` as SCN words like rules/ruins.py's ruin losses.
"""
from __future__ import annotations

from ..model.ids import HERO_TYPE, NO_OWNER, Terrain
from . import heroes as H
from .bonuses import carried_items
from .constants import history as K
from .economy import city_count, s16
from .movement import type_flag
from .reports import scores

N_SIDES = 8


# ------------------------------------------------------------------------------- per round


def news_events(state) -> list:
    """The news entries a record keeps: every side's first entry, then second entries while
    fewer than 10 are taken, listed by side (first, then second entry).
    Evidence: asm ovl41:132f..1515: flag0[p] = count >= 1 (counted, 136e..1399); flag1[p] =
    count >= 2 while the count < 10 (13a2..13d2); flag0 without flag1 -> count 1 (13db..1415);
    output per side, entry 0 then 1 where flagged: +0 side, +1 kind, +2 a, +4 b, +6 the name
    (1424..14fc); returns the number taken."""
    first = [len(state.news[p]) >= 1 for p in range(N_SIDES)]
    n = sum(first)
    second = []
    for p in range(N_SIDES):
        take = len(state.news[p]) >= 2 and n < K.EVENTS_MAX.value
        n += take
        second.append(take)
    out = []
    for p in range(N_SIDES):
        for si, flagged in enumerate((first[p], second[p])):
            if flagged:
                out.append([p] + list(state.news[p][si]))
    return out


def record_round(state) -> list:
    """The history record at the end of a round, from the round that ends with turn 2 up to
    the one that ends with turn 0xc9 (200 records); then the news records are emptied.
    Evidence: asm ovl41:0d60..1008: t = ovl61:225b(); t == 2 -> the file is created (0d73..0db5);
    t >= 0xca -> return without writing or clearing (0db7..0dc1); per city 0xff when 2c04:0710[tile
    at x, y] != 10, else owner byte +0x15 (0e58..0ec5); gold words (0ec7..0eeb); ovl42:0947 scores
    (0ef3); ovl62:03f9 (0efb); ovl41:132f events (0f0d); written in the order length, gold,
    scores, DS:5dea, owners, event count, events (0f60..0fcf); ovl41:1225: news count bytes = 0
    (1002, 1225..1243)."""
    t = H.turn(state)
    if t >= K.END_TURN.value:
        return []
    if t == K.FIRST_TURN.value:
        state.history.clear()
    owners = [c.owner & 0xFF if state.world.terrain(c.x, c.y) == Terrain.CITY else 0xFF
              for c in state.cities]
    state.history.append({
        "gold": [s16(p.gold) for p in state.players],
        "score": scores(state),
        "cities": [city_count(state, p) for p in range(N_SIDES)],
        "owners": owners,
        "events": news_events(state),
    })
    for p in range(N_SIDES):
        state.news[p] = []
    return []


# ------------------------------------------------------------------------------- per battle


def stat_word(r: int, c: int, field: int) -> int:
    """SCN offset of field `field` of cell (row r, column c) of the battle statistics.
    Evidence: asm ovl36:1b5c..1b73: 2c04:1163 + 0x50 * r + 0xa * c + field."""
    base, row, col = K.STATS.value
    return base + row * r + col * c + field


def _inc(state, r: int, c: int, field: int) -> None:
    k = stat_word(r, c, field)
    state.flags[k] = (state.flags.get(k, 0) + 1) & 0xFFFF


def _losses(state, side: int, other: int, armies: list, alive: list, types: list,
            aboard: list) -> None:
    """One side's losses (asm ovl36:1b43..1c96 attacker, 1ca7..1dfa defender): cell (side, side)
    when side is not neutral, cell (other, side) when neither is."""
    own = side != NO_OWNER
    both = own and other != NO_OWNER
    for i in range(len(armies)):
        if alive[i]:
            continue
        t = types[i]
        if aboard[i]:
            field = K.STAT_ABOARD.value
            if own:
                _inc(state, side, side, field)
            if both:
                _inc(state, other, side, field)
        if t == HERO_TYPE:
            field = K.STAT_HERO.value
        elif type_flag(state, t, "special"):
            field = K.STAT_SPECIAL.value
        else:
            field = K.STAT_UNIT.value
        if own:
            _inc(state, side, side, field)
        if both:
            _inc(state, other, side, field)


def _standards(state, loser: int, winner: int, armies: list, types: list) -> None:
    """Standards (items < 8) carried by the losing side's heroes (asm ovl36:1e0c..1e8d defenders,
    1e92..1f13 attackers): cell (winner, loser) when neither is neutral, cell (loser, loser)
    when the loser is not."""
    both = loser != NO_OWNER and winner != NO_OWNER
    for i, aid in enumerate(armies):
        if types[i] != HERO_TYPE:
            continue
        for item in carried_items(state, state.armies[aid]):
            if item >= K.STANDARDS.value:
                continue
            if both:
                _inc(state, winner, loser, K.STAT_STANDARD.value)
            if loser != NO_OWNER:
                _inc(state, loser, loser, K.STAT_STANDARD.value)


def record_battle(state, battle) -> list:
    """The history steps at the start of the after-battle (rules.combat HOOKS["history"]):
    the battle statistics, a news entry for a great battle won at a city, and one for every
    hero killed (written here, before the casualties are removed, in the original's order).
    Evidence: statistics asm ovl36:1aff..1f18: a = DS:41fa, d = DS:41fb (0x0f = neutral); the
    losses of each side (`_losses`); won = an attacker alive and no defender alive (dx,
    1c93 / 1df7); won -> the defenders' standards, else the attackers' (`_standards`).
    News asm ovl36:0a78..0afa: city at the target (ovl62:044a) >= 0, attackers + defenders >= 8,
    defenders >= 4 and the battle won (argument [bp+6] == 1): ovl41:1244(a, 5, -1, city, name of
    the hero DS:5e5e) or, without a hero, (a, 5, a, city, DS:0d12 = "").  Then ovl36:0b61..0c12:
    each dead attacker of type 0x1c: ovl41:1244(a, 1, city, 0, its name) before ovl36:16cd; the
    same for the defenders with d (0c1a..0cb2)."""
    s = battle.setup
    bw = state.battle_work
    a, d = s.attacker, s.owner
    n_a, n_d = len(s.attackers), len(s.defenders)
    _losses(state, a, d, s.attackers, battle.a_alive, bw.a_types, s.a_aboard)
    _losses(state, d, a, s.defenders, battle.d_alive, bw.d_types, s.d_aboard)
    if any(battle.a_alive) and not any(battle.d_alive):
        _standards(state, d, a, s.defenders, bw.d_types)
    else:
        _standards(state, a, d, s.attackers, bw.a_types)
    city = state.city_at(s.x, s.y)
    if city >= 0 and n_a + n_d >= K.BATTLE_ARMIES.value and n_d >= K.BATTLE_DEFENDERS.value \
            and battle.attacker_won:
        hero = state.armies[state.selection.hero] if state.selection.hero >= 0 else None
        if hero is not None:
            H.news(state, a, K.NEWS_BATTLE.value, K.BATTLE_NEWS_NO_HERO.value, city, H.hero_name(state, hero))
        else:
            H.news(state, a, K.NEWS_BATTLE.value, a, city, "")
    for side, armies, alive, types in ((a, s.attackers, battle.a_alive, bw.a_types),
                                       (d, s.defenders, battle.d_alive, bw.d_types)):
        for i, aid in enumerate(armies):
            if alive[i] or types[i] != HERO_TYPE:
                continue
            if not 0 <= side < N_SIDES:
                raise RuntimeError("news of side %d: the original writes past the eight records" % side)
            H.news(state, side, K.NEWS_HERO_KILLED.value, city, 0, H.hero_name(state, state.armies[aid]))
    return []
