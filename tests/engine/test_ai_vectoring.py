"""ovl25:085f vectoring (ai.md §6.17a) as warlords2.ai.phases.vectoring, pinned to the
listing: task forces AI[+0x24a]-1..0, staging tests, sources 3..0 with role 6, no rnd."""
import pytest

from warlords2.ai.phases import vectoring as V
from warlords2.model.city import Slot

from movekit import add_city, flat_state

pytestmark = pytest.mark.gamedata


class NoDice:
    def rnd(self, *a):
        raise AssertionError("vectoring draws no rnd: %r" % (a,))


@pytest.fixture
def st(game):
    s = flat_state(game)
    s.ai.allocated = 1
    s.rng = NoDice()
    for i, o in enumerate((0, 0, 0, 1, 0, 0)):
        add_city(s, 10 + 4 * i, 10, o)
    return s


def tf(st, k, staging, sources, age=1):
    t = st.ai[0].task_forces[k]
    t.age, t.staging, t.sources = age, staging, list(sources)
    return t


def test_order_roles_and_sources(st, monkeypatch):
    """k = n-1..0; inactive (+0 == 0), staging -1 and a staging city of another side are skipped;
    role 7 for the staging city; sources j = 3..0 not -1 with role 6 -> 0f10(source, staging)."""
    seen = []
    monkeypatch.setattr(V, "set_vector", lambda s, src, dst: seen.append((src, dst)))
    blk = st.ai[0]
    blk.n_task_forces = 3
    blk.role[1] = blk.role[2] = blk.role[5] = 6
    tf(st, 0, 0, [1, -1, 2, 5])
    tf(st, 1, 3, [5, -1, -1, -1])                    # staging of side 1: skipped
    tf(st, 2, 4, [5, 4, -1, -1], age=0)              # inactive
    tf(st, 3, 4, [5, -1, -1, -1])                    # k = 3 >= n: not read
    V.vectoring(st)
    assert seen == [(5, 0), (2, 0), (1, 0)]
    assert blk.role[0] == 7 and blk.role[3] == 0 and blk.role[4] == 0


def test_source_not_role_6_and_staging_minus_one(st, monkeypatch):
    seen = []
    monkeypatch.setattr(V, "set_vector", lambda s, src, dst: seen.append((src, dst)))
    blk = st.ai[0]
    blk.n_task_forces = 2
    blk.role[1] = 8
    tf(st, 0, -1, [1, -1, -1, -1])
    tf(st, 1, 0, [1, -1, -1, -1])
    V.vectoring(st)
    assert seen == [] and blk.role[0] == 7


def test_real_set_vector(st):
    """0f10: only a city with a production under way (0fd5) gets vectoring to the staging
    corner; another one has it switched off."""
    blk = st.ai[0]
    blk.n_task_forces = 1
    blk.role[1] = blk.role[2] = 6
    tf(st, 0, 0, [1, 2, -1, -1])
    c1, c2 = st.cities[1], st.cities[2]
    for c in (c1, c2):
        c.slots = [Slot(2, 3, 2, 12, 4)] + [Slot() for _ in range(3)]
        c.current = 2
    c1.turns_left, c2.turns_left = 2, 3              # c2: time == turns left, not under way
    c2.vectoring, c2.vector_to = 1, (9, 9)
    V.vectoring(st)
    assert (c1.vectoring, c1.vector_to) == (1, (st.cities[0].x, st.cities[0].y))
    assert (c2.vectoring, c2.vector_to) == (0, (-1, -1))


def test_bad_task_force_count_refused(st):
    st.ai[0].n_task_forces = 5
    with pytest.raises(RuntimeError):
        V.vectoring(st)
