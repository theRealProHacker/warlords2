"""M11 R0: the random-map core (rules/randmap/__init__.py, buffer.py), the roller fix G1 and
the scripted-dice harness (tests/engine/randmapkit.py)."""
import random
import sys

import pytest

from randmapkit import DiceMismatch, RecordingRng, ScriptedRng, blank_work
from warlords2.rules import randmap as RM
from warlords2.rules.constants import Const
from warlords2.rules.constants import randmap as K
from warlords2.rules.randmap.buffer import Buffer, MapWords, OutOfImage, Region, Roads
from warlords2.rules.rng import BorlandRand, Rng

W, H, GRID = 0x70, 0x9C, 0x6120


# --------------------------------------------------------------------------- G1: ovl59:02bf


class Fixed(BorlandRand):
    """BorlandRand whose rand() returns the given values in turn (and counts the draws)."""

    def __init__(self, values):
        super().__init__(1)
        self.values = list(values)
        self.draws = 0

    def rand(self):
        self.draws += 1
        return self.values.pop(0)


def fixed_rng(values):
    r = Rng(1, "borland")
    r.src = Fixed(values)
    return r


@pytest.mark.parametrize("sides", [-1, -2, -5, -100])
def test_negative_sides_borland_one_draw_per_die(sides):
    r = fixed_rng([1234, 32767, 5])
    assert r.rnd(3, sides, 4) == 3 + 4          # every die <= 0 -> below dice + add -> dice + add
    assert r.src.draws == 3 and not r.src.values


@pytest.mark.parametrize("dice,sides,add", [(1, -1, 0), (1, -6, 3), (2, -3, -1), (3, -50, 7)])
def test_negative_sides_all_zero_draws_fall_to_the_upper_bound(dice, sides, add):
    # rand() == 0 for every die: each die is 1, total == dice, so 0329 does not fire and
    # 033c's upper test sets dice * sides + add (ovl59:0329..034e).
    r = fixed_rng([0] * dice)
    assert r.rnd(dice, sides, add) == dice * sides + add
    assert r.src.draws == dice


def test_negative_sides_one_nonzero_draw_is_the_lower_bound():
    r = fixed_rng([0, 1])
    assert r.rnd(2, -4, 1) == 2 + 1


@pytest.mark.parametrize("source", ["python", "borland"])
@pytest.mark.parametrize("sides", [0, -1, -7])
def test_zero_dice_returns_add(source, sides):
    r, ref = Rng(9, source), Rng(9, source)
    assert r.rnd(0, sides, 5) == 5
    assert r.rnd(0, 6, -2) == -2
    assert [r.rnd(1, 50, 0) for _ in range(10)] == [ref.rnd(1, 50, 0) for _ in range(10)]


@pytest.mark.parametrize("source", ["python", "borland"])
def test_zero_sides_draws_nothing(source):
    r, ref = Rng(4, source), Rng(4, source)
    assert r.rnd(1, 0, 0) == 0 and r.rnd(5, 0, -3) == -3
    assert [r.rnd(1, 9, 0) for _ in range(10)] == [ref.rnd(1, 9, 0) for _ in range(10)]


def test_negative_sides_python_one_draw_per_die():
    r = Rng(21, "python")
    ref = random.Random(21)
    vals = [r.rnd(2, -3, 1) for _ in range(200)]
    want = []
    for _ in range(200):
        dies = [int(ref.randint(0, 0x7FFF) / 32767.0 * -3 + 1) for _ in range(2)]
        t = sum(dies) + 1
        want.append(3 if 3 > t else (-6 + 1 if -6 + 1 < t else t))
    assert vals == want
    assert set(vals) <= {3, -5}
    assert r.rnd(1, 1000, 0) == ref.randint(1, 1000)        # the stream continues in step


@pytest.mark.parametrize("source", ["python", "borland"])
def test_positive_sides_unchanged(source):
    """For sides > 0 the if / else clamp equals the old max / min one."""
    r, ref = Rng(77, source), Rng(77, source)
    for dice, sides, add in [(1, 6, 0), (3, 6, -2), (2, 1, 0), (1, 100, 0), (3, 50, 20), (1, 7, -1)]:
        for _ in range(300):
            total = sum(ref.src.die(sides) for _ in range(dice)) + add
            assert r.rnd(dice, sides, add) == max(dice + add, min(total, dice * sides + add))


def test_overflow_die_still_clamped():
    r = fixed_rng([32767, 32767])
    assert r.rnd(2, 6, 1) == 13


# --------------------------------------------------------------------------- the harness


def test_scripted_rng_checks_parameters_and_ranges():
    s = ScriptedRng([(3, -2, 1), (1, 16, 0, 5), (0, 0, 0)])
    assert s.rnd(1, 3, -2) == 1 and s.rnd(1, 16, 0) == 5
    with pytest.raises(DiceMismatch, match="call 2"):
        s.rnd(1, 0, 1)
    assert s.rnd(1, 0, 0) == 0
    s.assert_done()
    with pytest.raises(DiceMismatch, match="after the script"):
        s.rnd(1, 3, -2)
    with pytest.raises(DiceMismatch, match="cannot return"):
        ScriptedRng([(6, 0, 7)])
    with pytest.raises(DiceMismatch, match="cannot return"):
        ScriptedRng([(0, 3, 2)])                        # sides 0 returns add
    with pytest.raises(DiceMismatch, match="cannot return"):
        ScriptedRng([(-3, 1, 0)])                       # negative: dice + add or dice * sides + add
    ScriptedRng([(-3, 1, 2), (-3, 1, -2)])
    with pytest.raises(DiceMismatch, match="not made"):
        ScriptedRng([(3, 0, 1)]).assert_done()


def test_recording_rng():
    r = RecordingRng(Rng(3))
    v = r.rnd(2, 6, 1)
    assert r.calls == [(2, 6, 1, v)]


# --------------------------------------------------------------------------- the buffer


def test_buffer_size_and_grid_flat_index():
    b = Buffer()
    assert b.size == 0xA560 == len(b.data)
    b.set_grid(5, 7, 9)
    assert b.data[GRID + 7 * W + 5] == 9 and b.grid(5, 7) == 9
    b.data[GRID + 3 * W + W - 1] = 4                    # last square of row 3
    assert b.grid(-1, 4) == 4                           # x = -1 wraps to the previous row
    b.data[GRID + 4 * W] = 6
    assert b.grid(W, 3) == 6                            # x = 0x70 is the next row's first
    b.data[0x60B0 + 6] = 11
    assert b.grid(6, -1) == 11                          # row -1 is RANDOM.DAT scratch
    assert b.cell(0, 0) == GRID and b.cell(W - 1, H - 1) == 0xA55F


def test_out_of_buffer_stand_in():
    b = Buffer(bytes(range(256)) * 200)
    assert b.data[0xA55F] == 0xA55F & 0xFF               # file longer than the buffer: cut
    assert b.grid(0, H) == 0 and b.oob_reads == 1        # past 0xa560: 0
    assert b.byte(-1) == 0 and b.oob_reads == 2          # before the buffer: 0 (no wrap)
    before = bytes(b.data)
    b.set_grid(3, H, 7)
    b.set_byte(-5, 7)
    assert bytes(b.data) == before and b.oob_writes == 2
    assert b.word(0xA55F) == b.data[0xA55F]             # high byte past the end reads 0
    b.set_word(0xA55F, 0x1234)
    assert b.data[0xA55F] == 0x34 and b.oob_writes == 3
    b.strict = True
    with pytest.raises(OutOfImage):
        b.grid(0, H)
    with pytest.raises(OutOfImage):
        b.set_byte(0xA560, 1)


def test_short_file_padded_with_zeros():
    b = Buffer(b"\x01\x02")
    assert b.data[:3] == b"\x01\x02\x00" and b.size == 0xA560


def test_words_bytes_points_strings():
    r = Region(16)
    r.set_word(2, -2)
    assert r.data[2:4] == b"\xfe\xff" and r.word(2) == -2 and r.uword(2) == 0xFFFE
    r.set_word(4, 0x18000)                               # mod 0x10000
    assert r.uword(4) == 0x8000 and r.word(4) == -0x8000
    r.set_byte(6, 0x1FF)
    assert r.byte(6) == 0xFF and r.sbyte(6) == -1
    r.set_point(8, 3, -4)
    assert r.point(8) == (3, -4)
    r.set_cstr(12, b"ab")
    assert r.cstr(12) == b"ab" and r.data[14] == 0 and r.cstr(12, 1) == b"a"


def test_map_words_and_roads():
    m = MapWords()
    assert m.size == 0x8880
    m.set_at(3, 2, 0x1234)
    off = (2 * W + 3) * 2
    assert m.data[off:off + 2] == b"\x34\x12" and m.lo(3, 2) == 0x34 and m.hi(3, 2) == 0x12
    m.set_lo(3, 2, 0x99)
    m.set_hi(4, 2, 0x80)
    assert m.at(3, 2) == 0x1299 and m.at(4, 2) == 0x8000
    rd = Roads()
    assert rd.size == 0x4440
    rd.set_at(W - 1, H - 1, 0x21)
    assert rd.data[0x443F] == 0x21 and rd.at(W - 1, H - 1) == 0x21
    assert rd.at(0, H) == 0 and rd.oob_reads == 1


# Synthetic fixture: the generic clockwise 8-neighbour order written into a test buffer (the
# assertions do not depend on the order); not game data.
DIRS = [(0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1), (-1, 0), (-1, 1)]


def dir_buffer():
    b = Buffer()
    for k, (dx, dy) in enumerate(DIRS):
        b.set_point(0xBC + 4 * k, dx, dy)
    return b


def test_nb8_reads_the_direction_table_and_bounds():
    b = dir_buffer()
    b.set_grid(11, 21, 7)
    for dx in (-1, 0, 1):
        for dy in (-1, 0, 1):
            assert b.nb8(11 + dx, 21 + dy, 7) == (0 if dx == dy == 0 else 1)
    assert b.nb8(11, 21, 7) == 0 and b.nb8(13, 21, 7) == 0
    assert b.nb8(10, 20, 6) == 0
    # the table is read from the buffer: with every direction (0, 1) only the square above sees it
    for k in range(8):
        b.set_point(0xBC + 4 * k, 0, 1)
    assert b.nb8(11, 20, 7) == 1 and b.nb8(10, 20, 7) == 0


def test_nb8_ignores_off_map_squares_and_compares_signed():
    b = dir_buffer()
    b.data[GRID + 0 * W + W - 1] = 7                     # (0x6f, 0): flat neighbour of (0, 1) at x - 1
    assert b.nb8(0, 1, 7) == 0                           # (-1, 0) is off the map: not tested
    assert b.nb8(W - 2, 1, 7) == 1
    b.set_grid(50, 50, 0xFF)
    assert b.nb8(51, 50, -1) == 1 and b.nb8(51, 50, 0xFFFF) == 1   # cbw: the byte is -1
    assert b.nb8(51, 50, 0xFF) == 0
    b.data[GRID - W + 5] = 7                             # row -1 (scratch) is not on the map
    assert b.nb8(5, 0, 7) == 0
    assert b.oob_reads == 0


# --------------------------------------------------------------------------- ovl02 helpers


def test_clear_grid_sets_water_and_masks_roads():
    w = blank_work(None, data=bytes([0x55]) * 0xA560)
    w.roads.data[:] = bytes(range(256)) * (0x4440 // 256) + bytes(range(0x4440 % 256))
    old_roads = bytes(w.roads.data)
    RM.clear_grid(w)
    assert w.buf.data[GRID:] == bytes([2]) * (W * H)
    assert w.buf.data[:GRID] == bytes([0x55]) * GRID
    assert bytes(w.roads.data) == bytes(b & 0xE0 for b in old_roads)


@pytest.mark.parametrize("xy,want", [((5, 6), (5, 6)), ((0, 0), (0, 0)), ((-3, -1), (0, 0)),
                                     ((0x70, 0x9C), (0x6F, 0x9B)), ((0x6F, 0x9B), (0x6F, 0x9B)),
                                     ((500, -500), (0x6F, 0)), ((0xFFFF, 1), (0, 1))])
def test_clamp(xy, want):
    assert RM.clamp(*xy) == want


def jitter_script(a1, d1, a2, d2, edge_roll, step=16):
    return [(3, -2, a1), (step, 0, d1 if step else 0), (3, -2, a2), (step, 0, d2 if step else 0),
            (100, 0, edge_roll)]


def test_jitter_call_order_and_move():
    s = ScriptedRng(jitter_script(1, 5, -1, 3, 50))
    assert RM.jitter(s, 40, 60, 16, 1) == (45, 57)
    s.assert_done()


def test_jitter_step_zero_still_five_calls():
    s = ScriptedRng(jitter_script(1, 0, -1, 0, 99, step=0))
    assert RM.jitter(s, 40, 60, 0, 0) == (40, 60)
    s.assert_done()


@pytest.mark.parametrize("xy,want", [
    ((3, 70), (0, 70)),          # x nearest the west edge
    ((50, 2), (50, 0)),          # y nearest the north edge
    ((108, 70), (0x6F, 70)),     # east
    ((50, 150), (50, 0x9B)),     # south
    ((4, 4), (0, 0)),            # tie x / y: both snap
    ((107, 151), (0x6F, 0x9B)),  # tie east / south (ex = ey = 4)
    ((55, 77), (0, 77)),         # dx 55 < ex 56 < dy 77 < ey 78: west only
    ((56, 77), (0x6F, 77)),      # ex 55 < dx 56
])
def test_jitter_edge_snap(xy, want):
    s = ScriptedRng(jitter_script(0, 1, 0, 1, 29))
    assert RM.jitter(s, *xy, 16, 1) == want
    s.assert_done()


def test_jitter_snap_needs_roll_below_30_and_edge_flag():
    assert RM.jitter(ScriptedRng(jitter_script(0, 1, 0, 1, 30)), 3, 70, 16, 1) == (3, 70)
    assert RM.jitter(ScriptedRng(jitter_script(0, 1, 0, 1, 1)), 3, 70, 16, 0) == (3, 70)


def test_jitter_snaps_on_the_moved_point_then_clamps():
    # (60, 10) moves to (5, 10): dx 5 is the minimum (before the move dy 10 was)
    s = ScriptedRng([(3, -2, -1), (60, 0, 55), (3, -2, 0), (60, 0, 1), (100, 0, 10)])
    assert RM.jitter(s, 60, 10, 60, 1) == (0, 10)
    s = ScriptedRng(jitter_script(-1, 9, -1, 9, 99))
    assert RM.jitter(s, 3, 5, 16, 1) == (0, 0)       # no snap; the clamp


# --------------------------------------------------------------------------- ovl57:10e8 / ovl02:0000


def test_map_id_six_dice():
    s = ScriptedRng([(90, 0, 1), (90, 0, 90), (90, 0, 0x41 - 0x20), (90, 0, 2), (90, 0, 60),
                     (90, 0, 33)])
    assert RM.map_id(s) == "!zA\"\\A"
    s.assert_done()


def test_slider_args_roll_only_for_seven_and_ignore_the_question_mark():
    run = RM.RandomRun(sliders=[7, 0, 7, 6], shown=[0, 0, 0, 0])
    s = ScriptedRng([(7, -1, 4), (7, -1, 0)])
    assert RM.slider_args(run, s) == [4, 0, 0, 6]
    s.assert_done()
    run = RM.RandomRun(sliders=[1, 2, 3, 4], shown=[0, 1, 0, 1])
    s = ScriptedRng([])
    assert RM.slider_args(run, s) == [1, 2, 3, 4]


def slider_buffer():
    """Header words 100.. and tables with distinct entries: table t, index i -> t * 10 + i."""
    b = Buffer()
    for off, v in [(0x2A, 100), (0x34, 200), (0x36, 300), (0x38, 400), (0x3A, 500), (0x3C, 600)]:
        b.set_word(off, v)
    for t, off in enumerate((0x44, 0x52, 0x60, 0x6E), 1):
        for i in range(7):
            b.set_word(off + 2 * i, t * 10 + i)
    return b


def test_apply_sliders_mapping():
    b = slider_buffer()
    RM.apply_sliders(b, [1, 2, 3, 4])            # p0 -> T52 (2x), p1 -> T44 (1x), p2 -> T6e (4x), p3 -> T60 (3x)
    assert b.word(0x2A) == 100 + 43              # T6e[p2 = 3]
    assert b.word(0x3C) == 600 + 34              # T60[p3 = 4]
    assert b.word(0x34) == 200 + 12 and b.word(0x36) == 300 + 12    # T44[p1 = 2]
    assert b.word(0x38) == 400 + 21 and b.word(0x3A) == 500 + 21    # T52[p0 = 1]


def test_apply_sliders_16_bit():
    b = slider_buffer()
    b.set_word(0x2A, 0x7FFF)
    b.set_word(0x6E, 1)
    RM.apply_sliders(b, [0, 0, 0, 0])
    assert b.word(0x2A) == -0x8000


def test_apply_sliders_index_past_the_table_reads_the_next_words():
    b = slider_buffer()
    b.set_word(0x6E + 14, 9)                     # T6e[7] = word +0x7c
    RM.apply_sliders(b, [0, 0, 7, 0])
    assert b.word(0x2A) == 109


def test_missing_random_dat():
    def read(rel):
        raise FileNotFoundError(rel)
    with pytest.raises(RM.RandomDataMissing):
        RM.load_buffer(read)
    with pytest.raises(FileNotFoundError):
        RM.finish(RM.random_begin(read, ScriptedRng([(90, 0, 1)] * 6), RM.RandomRun()))


def test_load_buffer_reads_the_named_file():
    seen = []

    def read(rel):
        seen.append(rel)
        return b"\x07" * 10
    b = RM.load_buffer(read)
    assert seen == ["RANDOM/RANDOM.DAT"] and b.data[:11] == b"\x07" * 10 + b"\0"


def test_tries_raises_hang(monkeypatch):
    monkeypatch.setattr(K, "HANG_TRIES", Const(3, "test"))
    assert list(zip(range(2), RM.tries("x"))) == [(0, 0), (1, 1)]
    with pytest.raises(RM.GeneratorHang, match="ovl11:0331") as e:
        for _ in RM.tries("ovl11:0331"):
            pass
    assert e.value.site == "ovl11:0331"
    assert issubclass(RM.GeneratorHang, RuntimeError)


# --------------------------------------------------------------------------- the pipeline


STAGE_NAMES = [("files", "template"), ("land", "continent"), ("ridges", "ridges"),
               ("ridges", "cuts"), ("rivers", "rivers"), ("forest", "forests"),
               ("marsh", "marshes"), ("cities", "place_cities"), ("cities", "place_sites"),
               ("roads", "roads"), ("files", "finish")]


class FakeModule:
    pass


def install_fakes(monkeypatch, log, extra=None):
    """Fake stage modules: each stage logs its name, rolls one marker die and (extra) yields."""
    mods = {}
    for module, func in STAGE_NAMES:
        mod = mods.setdefault(module, FakeModule())

        def stage(work, name=func):
            log.append(name)
            work.rng.rnd(1, 1000, len(log))
            if extra and name in extra:
                return extra[name](work)
            return None
        setattr(mod, func, stage)
    for module, mod in mods.items():
        monkeypatch.setitem(sys.modules, "warlords2.rules.randmap." + module, mod)


def test_pipeline_order_and_percentages(monkeypatch):
    log = []

    def sites(work):
        log.append("pct")
        yield 71
        yield 72

    def finish(work):
        work.files["SGN"] = b"s"
        work.files["SCN"] = b"c"
        return ()

    install_fakes(monkeypatch, log, {"place_sites": sites, "finish": finish})
    seen = []

    def clear(work, real=RM.clear_grid):
        log.append("clear_grid")
        real(work)
    monkeypatch.setattr(RM, "PIPELINE", tuple(
        (p, tuple(clear if c is RM.clear_grid else c for c in calls)) for p, calls in RM.PIPELINE))
    w = blank_work(RecordingRng(Rng(5)))
    for pct in RM.pipeline(w):
        seen.append((pct, len(log)))
    assert [p for p, _ in seen] == [0, 10, 20, 30, 40, 50, 60, 70, 71, 72, 80, 90, 100]
    assert log == ["template", "clear_grid", "continent", "ridges", "cuts", "rivers", "forests",
                   "marshes", "place_cities", "place_sites", "pct", "roads", "finish"]
    # each percentage is drawn before its stage: 0 before template, 10 before ridges ...
    assert seen[0] == (0, 0) and seen[1] == (10, 3) and seen[-1] == (100, 13)
    assert w.buf.grid(0, 0) == 2


def test_missing_stage_raises_not_implemented(monkeypatch):
    monkeypatch.setitem(sys.modules, "warlords2.rules.randmap.files", None)
    with pytest.raises(NotImplementedError, match="ovl09:1001"):
        list(RM.pipeline(blank_work(None)))
    monkeypatch.setitem(sys.modules, "warlords2.rules.randmap.files", FakeModule())
    with pytest.raises(NotImplementedError, match="ovl09:1001.*R3"):
        list(RM.pipeline(blank_work(None)))


def synthetic_dat():
    return bytes(slider_buffer().data)


def test_random_begin_dice_order(monkeypatch):
    log = []

    def finish(work):
        for ext, _ in K.FILES.value:
            work.files[ext] = ext.encode()
        return None
    install_fakes(monkeypatch, log, {"finish": finish})
    run = RM.RandomRun(sliders=[7, 1, 2, 3])
    script = [(90, 0, v) for v in (40, 41, 42, 43, 44, 45)] + [(7, -1, 5)]
    script += [(1, 1000, i, i + 1) for i in range(1, 12)]
    s = ScriptedRng(script)
    pcts = []
    gen = RM.random_begin(lambda rel: synthetic_dat(), s, run, roads=b"\xff" * 0x4440)
    while True:
        try:
            pcts.append(next(gen))
        except StopIteration as stop:
            g = stop.value
            break
    s.assert_done()
    assert pcts == list(K.PROGRESS.value)
    assert g.id == "HIJKLM"
    assert list(g.files) == ["SGN", "MAP", "RD", "CTY", "SPC", "SCN"]
    assert g.work.buf.word(0x38) == 400 + 25          # the rolled 5 reached ovl02:0000 as p0
    assert g.work.buf.word(0x34) == 200 + 11
    assert g.work.roads.data[0] == 0xE0               # the run's road bits kept by 036b
    assert run.rotor == -1


def test_finish_returns_the_value():
    def gen():
        yield 1
        return "done"
    assert RM.finish(gen()) == "done"


# --------------------------------------------------------------------------- run memory


def test_random_run_defaults_and_run_carry():
    from warlords2.persist.saves import RunCarry
    r = RM.RandomRun()
    assert (r.rotor, r.random, r.terrain_set, r.allies) == (-1, 0, 0, 0)
    assert r.sliders == [3, 3, 2, 3] and r.shown == [1, 1, 1, 1]
    a, b = RunCarry(), RunCarry()
    assert a.random_map == r and a.random_map is not b.random_map
    a.random_map.sliders[0] = 6
    assert b.random_map.sliders[0] == 3


@pytest.mark.gamedata
def test_run_words_are_the_exe_image(game):
    from warlords2.assets.exe import ds_words
    from warlords2.formats.gamedir import EXE_NAME, GameDir
    exe = GameDir(game).read(EXE_NAME)
    r = RM.RandomRun()
    assert ds_words(exe, 0x02D4, 1) == (r.rotor,)
    assert ds_words(exe, 0x28C8, 3) == (r.random, r.terrain_set, r.allies)
    assert list(ds_words(exe, 0x28D0, 4)) == r.sliders
    assert list(ds_words(exe, 0x28D8, 4)) == r.shown


@pytest.mark.gamedata
def test_users_random_dat(game):
    from warlords2.formats.gamedir import GameDir
    gd = GameDir(game)
    b = RM.load_buffer(gd.read)
    assert len(gd.read("RANDOM/RANDOM.DAT")) == b.size
    # every slider raises its words monotonically with the position 0..6
    for target, table, i in K.SLIDER_ADDS.value:
        vals = []
        for p in range(7):
            c = RM.load_buffer(gd.read)
            args = [0, 0, 0, 0]
            args[i] = p
            RM.apply_sliders(c, args)
            vals.append(c.word(target))
        assert vals == sorted(vals) and vals[0] < vals[-1], hex(target)


def test_random_begin_hands_the_run_memory_through(monkeypatch):
    # the host's pathfinder memory (the previous game's) goes into the generation and comes out
    # in Generated.work (0555:0d9e clears the cache only at its allocation); army file / switch
    monkeypatch.setattr(RM, "load_buffer", lambda read: Buffer())
    monkeypatch.setattr(RM, "pipeline", lambda w: iter(()))
    pf = RM.PathRun()
    rng = ScriptedRng([(0x5A, 0, 1)] * 6)
    g = RM.finish(RM.random_begin(lambda rel: b"", rng, RM.RandomRun(), pathfinder=pf,
                                  army_file=b"A", army_set=1))
    rng.assert_done()
    assert g.work.pathfinder is pf and (g.work.army_file, g.work.army_set) == (b"A", 1)
    g = RM.finish(RM.random_begin(lambda rel: b"", ScriptedRng([(0x5A, 0, 1)] * 6), RM.RandomRun()))
    assert g.work.pathfinder is None and g.work.army_file is None and g.work.army_set == 0


def test_roads_pathfinder_keeps_the_hosts_memory():
    from warlords2.rules.randmap import roads as R
    w = blank_work(ScriptedRng([]))
    assert w.pathfinder is None
    fresh = R.pathfinder(w)
    assert w.pathfinder is fresh and R.pathfinder(w) is fresh
    pf = RM.PathRun()
    w2 = RM.Work(Buffer(), ScriptedRng([]), RM.RandomRun(), lambda rel: b"", pathfinder=pf)
    assert R.pathfinder(w2) is pf
