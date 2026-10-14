"""rules.history and rules.reports: the per-round record ovl41:0d60 with its events ovl41:132f,
the battle statistics ovl36:1aff and battle news ovl36:0a78 / 0b6a / 0c23, the report values
ovl42:02fb and the winning score (README: 200 turns of history, R12)."""
from types import SimpleNamespace

import pytest

from test_bonuses import atype, city, default_types, give, mk_state, put
from warlords2.model.hero import HeroSlot
from warlords2.model.ids import HERO_TYPE, MAP_W, Terrain
from warlords2.rules import heroes as H, history as HI, reports as R
from warlords2.rules.constants import history as K


# ----------------------------------------------------------------------------- per round


def test_record_contents_and_news_cleared():
    """ovl41:0d60: owners 0xff for a city whose square is not terrain 10, else +0x15; gold
    words; scores (ovl42:0947); DS:5dea; events; then every news count = 0 (ovl41:1225)."""
    st = mk_state()
    st.turn = 2
    st.history.append({"stale": 1})
    city(st, 10, 10, 3, 1)
    city(st, 20, 20, 0xF, 1)
    city(st, 30, 30, 5, 1)
    st.world.tiles[30 * MAP_W + 30] = int(Terrain.PLAIN)      # not intact; DS:5dea still counts it
    st.players[2].gold = -5
    H.news(st, 1, 4, 1, 0, "")
    assert HI.record_round(st) == []
    rec, = st.history                                          # turn 2: the file is new
    assert rec["owners"] == [3, 0xF, 0xFF]
    assert rec["gold"] == [1000, 1000, -5, 1000, 1000, 1000, 1000, 1000]
    assert rec["cities"] == [0, 0, 0, 1, 0, 1, 0, 0] and rec["score"] == R.scores(st)
    assert rec["events"] == [[1, 4, 1, 0, ""]] and st.news == [[]] * 8


def test_two_hundred_records_then_nothing():
    """ovl41:0db7: from turn 0xca on nothing is written and the news are kept."""
    st = mk_state()
    for t in range(2, 0xD2):
        st.turn = t
        HI.record_round(st)
    assert len(st.history) == 200
    H.news(st, 0, 3, 0, 0, "x")
    st.turn = 0xCA
    HI.record_round(st)
    assert len(st.history) == 200 and st.news[0] == [[3, 0, 0, "x"]]


def test_events_first_entries_then_seconds_up_to_ten():
    """ovl41:132f: every side's first entry counts; second entries while < 10; listed by side,
    first then second."""
    st = mk_state()
    for p in range(8):
        H.news(st, p, 5, p, 0, "")
        H.news(st, p, 6, p, 1, "")
    ev = HI.news_events(st)
    assert len(ev) == 10
    assert [(e[0], e[1]) for e in ev] == [(0, 5), (0, 6), (1, 5), (1, 6)] + [(p, 5) for p in range(2, 8)]


# ----------------------------------------------------------------------------- battle


def battle(st, attackers, defenders, a_alive, d_alive, a_aboard=None, d_aboard=None, x=5, y=5,
           owner=1):
    bw = st.battle_work
    for i, aid in enumerate(attackers):
        bw.a_types[i] = st.armies[aid].type_id
    for i, aid in enumerate(defenders):
        bw.d_types[i] = st.armies[aid].type_id
    setup = SimpleNamespace(attacker=0, owner=owner, attackers=attackers, defenders=defenders,
                            a_aboard=a_aboard or [0] * len(attackers),
                            d_aboard=d_aboard or [0] * len(defenders), x=x, y=y)
    won = any(a_alive) and not any(d_alive)
    return SimpleNamespace(setup=setup, a_alive=a_alive, d_alive=d_alive, attacker_won=won)


def stat(st, r, c, field):
    return st.flags.get(HI.stat_word(r, c, field), 0)


def test_battle_statistics_cells():
    """ovl36:1aff: losses of a in cells (a, a) and (d, a), of d in (d, d) and (a, d); field +6
    aboard besides +4 hero / +2 special type (DS:45c8 = ARMYTYPE w13) / +0 other."""
    types = default_types()
    types[3] = atype(3, special=1)
    st = mk_state(types=types)
    a1, a2, a3 = put(st, 1, 0, 4, 5), put(st, 3, 0, 4, 5), put(st, 1, 0, 4, 5)
    d1, d2 = put(st, 1, 1, 5, 5), put(st, HERO_TYPE, 1, 5, 5)
    b = battle(st, [a1, a2, a3], [d1, d2], [0, 0, 1], [0, 0], a_aboard=[1, 0, 0])
    HI.record_battle(st, b)
    assert [stat(st, 0, 0, f) for f in (0, 2, 4, 6)] == [1, 1, 0, 1]
    assert [stat(st, 1, 0, f) for f in (0, 2, 4, 6)] == [1, 1, 0, 1]
    assert [stat(st, 1, 1, f) for f in (0, 2, 4, 6)] == [1, 0, 1, 0]
    assert [stat(st, 0, 1, f) for f in (0, 2, 4, 6)] == [1, 0, 1, 0]
    assert HI.stat_word(7, 7, 10) == 0x13E3                      # the table ends at the news


def test_neutral_defender_counts_only_the_attackers_own_cells():
    st = mk_state()
    a1 = put(st, 1, 0, 4, 5)
    d1 = put(st, 1, 0xF, 5, 5)
    HI.record_battle(st, battle(st, [a1], [d1], [0], [1], owner=0xF))
    assert stat(st, 0, 0, 0) == 1 and len([k for k in st.flags if 0x1163 <= k < 0x13E3]) == 1


@pytest.mark.parametrize("won", [True, False])
def test_standards_of_the_losing_heroes(won):
    """ovl36:1e05..1f13: won -> each defender hero's carried items < 8 count +8 in (a, d) and
    (d, d); lost -> each attacker hero's in (d, a) and (a, a)."""
    st = mk_state()
    ha = put(st, HERO_TYPE, 0, 4, 5)
    hd = put(st, HERO_TYPE, 1, 5, 5)
    for aid in (ha, hd):
        give(st, aid, 1, 1)                                     # item index 0 or 1: a standard
    st.items.append(st.items[0].__class__("i", 1, 1, 3, hd, 0, 0))
    b = battle(st, [ha], [hd], [1] if won else [0], [0] if won else [1])
    HI.record_battle(st, b)
    if won:
        assert stat(st, 0, 1, 8) == stat(st, 1, 1, 8) == 2 and stat(st, 0, 0, 8) == 0
    else:
        assert stat(st, 1, 0, 8) == stat(st, 0, 0, 8) == 1 and stat(st, 1, 1, 8) == 0


def _heroes(st):
    st.heroes = [HeroSlot(1, 0, "h%d" % i, 1, 0) for i in range(40)]


@pytest.mark.parametrize("n_a,n_d,won,news", [(4, 4, True, True), (5, 3, True, False), (3, 4, True, False),
                                              (4, 4, False, False)])
def test_great_battle_news_at_a_city(n_a, n_d, won, news):
    """ovl36:0a78..0afa: target in a city, attackers + defenders >= 8, defenders >= 4, won ->
    news (a, 5, -1, city, hero name) with DS:5e5e set, else (a, 5, a, city, "")."""
    st = mk_state()
    _heroes(st)
    city(st, 20, 20, 2, 1)
    ci = city(st, 10, 10, 1, 1)
    att = [put(st, 1, 0, 9, 10) for _ in range(n_a)]
    dfn = [put(st, 1, 1, 10, 10) for _ in range(n_d)]
    b = battle(st, att, dfn, [1] * n_a if won else [0] * n_a, [0] * n_d if won else [1] * n_d, x=10, y=10)
    HI.record_battle(st, b)
    assert st.news[0] == ([[5, 0, ci, ""]] if news else [])
    st.news[0] = []
    hero = put(st, HERO_TYPE, 0, 9, 10)
    st.armies[hero].hero_slot = 7
    st.selection.hero = hero
    HI.record_battle(st, b)
    assert st.news[0] == ([[5, 0xFFFF, ci, "h7"]] if news else [])


def test_killed_hero_news_attackers_then_defenders():
    """ovl36:0b89..0ba1 / 0c42..0c5a: news (side, 1, city at x, y or -1, 0, name) for each dead
    hero, written before the hero-death step."""
    st = mk_state()
    _heroes(st)
    ha, hd, hd2 = put(st, HERO_TYPE, 0, 4, 5), put(st, HERO_TYPE, 1, 5, 5), put(st, HERO_TYPE, 1, 5, 5)
    st.armies[ha].hero_slot, st.armies[hd].hero_slot, st.armies[hd2].hero_slot = 1, 2, 3
    HI.record_battle(st, battle(st, [ha], [hd, hd2], [0], [0, 1]))
    assert st.news[0] == [[1, 0xFFFF, 0, "h1"]] and st.news[1] == [[1, 0xFFFF, 0, "h2"]]


# ----------------------------------------------------------------------------- reports


def test_winning_score_and_rank():
    """ovl42:04c2..05e9: (gold + 5 income + upkeep + sum(defence * income)) / 30, clamped to
    1..500, rank = sides with a higher score, then each / 5; scale 100."""
    st = mk_state()
    c = city(st, 10, 10, 0, 2)
    st.cities[c].income = 30
    u = put(st, 1, 0, 3, 3)
    st.armies[u].upkeep = 6
    st.players[0].gold = 900
    st.players[1].gold = 20000
    st.players[2].gold = 0
    v = R.report(st, K.REPORT_WINNING.value)
    raw0 = (900 + 5 * 30 + 6 + 2 * 30) // 30
    assert v["values"][0] == raw0 // 5 and v["values"][1] == 500 // 5 and v["values"][2] == 0
    assert v["own"] == 1 and v["scale"] == 100                 # only side 1 scores more
    assert R.scores(st) == v["values"]


@pytest.mark.parametrize("mode,values", [(0, [2, 1, 0, 0, 0, 0, 0, 0]), (1, [1, 0, 0, 0, 0, 0, 0, 1])])
def test_army_and_city_reports(mode, values):
    """ovl42:035b: army records with owner 0..7 (transit counts, free records do not); ovl42:03fd:
    DS:5dea; the scale is the largest value made even."""
    st = mk_state()
    put(st, 1, 0, 3, 3)
    put(st, 1, 0, -1, -1)
    put(st, 1, 1, 4, 4)
    st.armies.append(st.armies[0].__class__(3, 0xFF, 0xFF, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (-1, -1)))
    city(st, 10, 10, 0, 1)
    city(st, 20, 20, 7, 1)
    st.players[3].alive = 0
    r = R.report(st, mode)
    assert r["values"] == values and r["scale"] == 2 and r["own"] == values[0]
    assert r["dead"] == [0, 0, 0, 1, 0, 0, 0, 0]
    with pytest.raises(ValueError):
        R.report(st, K.REPORT_PRODUCTION.value)


def _no_memory(state, battle):
    return None


def test_the_attack_runs_the_history_step(monkeypatch):
    """rules.combat HOOKS["history"] is this module's record_battle (ovl36:0a75 calls ovl36:1aff
    first): a won attack on a field stack counts the defender's loss."""
    from test_combat import WIN, script
    from warlords2.model import commands as C
    from warlords2.rules import combat, engine
    ms, _, doc, addr = combat.HOOKS["ai_memory"]
    monkeypatch.setitem(combat.HOOKS, "ai_memory", (ms, "test_history:_no_memory", doc, addr))
    st = mk_state()
    a = put(st, 1, 0, 4, 5)
    put(st, 2, 1, 5, 5)
    script(st, WIN, cycle=True)
    ev = engine.apply(st, C.Attack((a,), 5, 5))
    assert ev[-1].info["attacker_won"] and ev[-1].info["skipped"] == []
    assert stat(st, 1, 1, 0) == stat(st, 0, 1, 0) == 1 and stat(st, 0, 0, 0) == 0
