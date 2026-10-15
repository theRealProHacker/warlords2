"""ovl25:09d7, the battle memory (ai.md §6.19), as warlords2.ai.base.record_battle: reached by
the human attack (ovl36:02c7) and the computer battle (ovl36:1502) through combat HOOKS
"ai_memory"; the AI blocks are GameState.ai (model/ai.py), saved with the game."""
from warlords2.ai.base import record_battle
from warlords2.model import commands as C
from warlords2.model.ids import HERO_TYPE, NO_OWNER
from warlords2.model.serialize import dump, load
from warlords2.rules import combat, engine
from warlords2.rules.rng import Rng

from test_bonuses import city, mk_state, put
from test_combat import WIN, Hooks, script


def col(st, d, a):
    return [st.ai[d].memory[r][a] for r in range(7)]


def untouched_except(st, keep):
    return all(col(st, p, q) == [0] * 7 for p in range(8) for q in range(8) if (p, q) != keep)


def test_hook_resolves_so_a_strict_human_attack_runs():
    """combat HOOKS ai_memory -> warlords2.ai.base:record_battle (ovl36:02c7)."""
    assert combat._hook("ai_memory") is record_battle
    st = mk_state()
    a = put(st, 1, 0, 4, 5)
    put(st, 2, 1, 5, 5)
    script(st, WIN, cycle=True)
    engine.apply(st, C.Attack((a,), 5, 5))                  # no NotImplementedCommand
    assert col(st, 1, 0) == [0, 1, 1, 1, 0, 0, 0] and untouched_except(st, (1, 0))


def test_field_battle_counts_dead_and_dead_heroes():
    """0a4f..0ae1 on the set-up arrays before 0a6b: two of three defenders dead, one of them a
    hero -> +0x3bc 1, +0x3cc 2, +0x3dc 1, +0x3ec 0; d = owner nibble 1, a = owner of
    DS:42c6[0] = 0."""
    st = mk_state()
    a = put(st, 1, 0, 4, 5, strength=9)
    for t in (HERO_TYPE, 2, 2):
        put(st, t, 1, 5, 5, strength=5)
    b = combat.resolve(st, (a,), 5, 5)
    bw = st.battle_work
    hi = [st.armies[i].type_id for i in bw.defenders].index(HERO_TYPE)
    bw.d_alive = [0 if i in (hi, (hi + 1) % 3) else 1 for i in range(3)]   # as 08a6 leaves them
    record_battle(st, b)
    assert col(st, 1, 0) == [1, 2, 1, 0, 0, 0, 0] and untouched_except(st, (1, 0))


def test_empty_city_counts_as_wiped():
    """City square: +0x3fc += 1, +0x40c += wiped (0ad6..0ae1); no defender: dead 0 == DS:42c5
    0 -> wiped (0a93..0aa2)."""
    st = mk_state()
    city(st, 10, 10, 2, 1)
    a = put(st, 1, 0, 9, 11)
    b = combat.resolve(st, (a,), 10, 11)
    record_battle(st, b)
    assert col(st, 2, 0) == [0, 0, 1, 1, 1, 1, 0]


def test_neutral_square_is_not_recorded():
    """09f7..0a1a: owner nibble 0x0f -> return before the block is touched."""
    st = mk_state()
    a = put(st, 1, 0, 4, 5)
    put(st, 2, NO_OWNER, 5, 5)
    record_battle(st, combat.resolve(st, (a,), 5, 5))
    assert untouched_except(st, None)


def test_words_wrap_and_are_saved(monkeypatch):
    st = mk_state()
    st.ai[1].memory[2][0] = 0xFFFF
    a = put(st, 1, 0, 4, 5)
    put(st, 2, 1, 5, 5)
    record_battle(st, combat.resolve(st, (a,), 5, 5))
    assert st.ai[1].memory[2][0] == 0
    st.ai[3].memory[6][7] = 5
    st.rng = Rng(1)
    assert load(dump(st)).ai == st.ai
