"""rules.rng: the ovl59:02bf roller semantics and the Borland generator (EL §2)."""
import pytest

from warlords2.rules.rng import BorlandRand, Rng


@pytest.mark.parametrize("source", ["python", "borland"])
def test_sides_zero_returns_add_without_rolling(source):
    r, ref = Rng(5, source), Rng(5, source)
    assert r.rnd(3, 0, 7) == 7 and r.rnd(1, 0, -2) == -2
    assert [r.rnd(1, 100, 0) for _ in range(20)] == [ref.rnd(1, 100, 0) for _ in range(20)]


@pytest.mark.parametrize("source", ["python", "borland"])
def test_range_and_clamp(source):
    r = Rng(11, source)
    assert {r.rnd(2, 1, 0) for _ in range(50)} == {2}
    vals = [r.rnd(3, 6, -2) for _ in range(5000)]
    assert min(vals) >= 3 + -2 and max(vals) <= 18 - 2
    assert {r.rnd(1, 7, -1) for _ in range(3000)} == set(range(7))      # rnd(1,N,-1) = 0..N-1


def test_clamp_catches_borland_overflow_die():
    class Max(BorlandRand):
        def rand(self):
            return 32767                    # gives die = sides + 1 before the clamp
    r = Rng(1, "borland")
    r.src = Max(1)
    assert r.src.die(6) == 7
    assert r.rnd(1, 6, 0) == 6 and r.rnd(2, 6, 1) == 13


def test_borland_rand_seed_1():
    seed, expect = 1, []
    for _ in range(10):
        seed = (seed * 22695477 + 1) % 2 ** 32           # 0x015A4E35 = 22695477
        expect.append((seed >> 16) & 0x7FFF)
    b = BorlandRand(1)
    assert [b.rand() for _ in range(10)] == expect
    assert expect[0] == 346


def test_borland_die_formula():
    b, ref = BorlandRand(77), BorlandRand(77)
    for sides in (2, 6, 20, 100, 600):
        assert b.die(sides) == int(ref.rand() / 32767.0 * sides + 1)


def test_srand_uses_low_word():
    assert [BorlandRand(0x10005).rand() for _ in range(3)] == [BorlandRand(5).rand() for _ in range(3)]


@pytest.mark.parametrize("source", ["python", "borland"])
def test_state_round_trip(source):
    r = Rng(42, source)
    r.rnd(5, 10, 0)
    r2 = Rng.from_state(r.state())
    assert [r.rnd(1, 1000, 0) for _ in range(50)] == [r2.rnd(1, 1000, 0) for _ in range(50)]


def test_python_dice_uniform():
    r = Rng(3)
    n, sides = 60000, 6
    counts = [0] * sides
    for _ in range(n):
        counts[r.rnd(1, sides, -1)] += 1
    chi2 = sum((c - n / sides) ** 2 / (n / sides) for c in counts)
    assert chi2 < 20.52                  # chi-square, 5 df, p = 0.001
