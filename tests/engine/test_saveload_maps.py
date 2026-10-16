"""M11 package E: rules.saveload for random maps (ovl49).

* a random-map game (SCN 0x120) saves RANDOM.SPC then RANDOM.CTY (0bbe / 0c46) and its load
  hands them back to be written over those files (0728 / 07a9);
* the map file (RMAPTEMP / RMAP<n>, 11f3 = 0a46(NULL, 1, ...)): no AI blocks;
* Load Map 0414(e, 0, 1): no AI read, no path-cache clear, the 256 overview dice always;
* the rest of 12f2: recounts, cost map, SCN 0x120 = DS:28c8 (Q2), the Setup screen, music
  mode 0 at 13b7 without a die;
* the Save Map gate 1214.

The text blocks here are made-up bytes (no game data in tracked files).
"""
import json
import threading

import pytest

from dataclasses import replace

from movekit import _cards, _inputs, scenario_state
from test_saveload import Tally, do_load, file_of, mid_turn, record, reference_load
from warlords2.model import serialize
from warlords2.model.ai import AiProcess
from warlords2.model.ids import Control
from warlords2.model.music import MusicWords
from warlords2.model.newgame import NewGameConfig
from warlords2.model.options import GameOptions
from warlords2.model.world import Sign
from warlords2.rules import descriptions as D
from warlords2.rules import setup as S
from warlords2.rules import economy as EC
from warlords2.rules import pathfinding as P
from warlords2.rules import present as PR
from warlords2.rules import saveload as SL
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.rng import Rng

pytestmark = pytest.mark.gamedata

RANDOM, LOADED = 0x120, 0x130
TEXTS = {"SPC": b"1|Temple|of the deep|\r\n\x00\xff", "CTY": b"0|A city|by the sea|x|\r\n\x01"}
OVERVIEW = [(1, 3, 1)] * 256


def jsonish(d):
    return json.loads(json.dumps(d))


def random_game(game):
    s = mid_turn(game)
    s.flags[RANDOM] = 1
    return s


class Points:
    """The present points reached, with SCN 0x120 as it is at each."""

    def __init__(self, state=None):
        self.state, self.got = state, []

    def __enter__(self):
        PR.attach(threading.current_thread(),
                  lambda p, i: self.got.append((p, i, self.state.flags.get(RANDOM) if self.state else None)))
        return self

    def __exit__(self, *a):
        PR.detach(threading.current_thread())

    def names(self):
        return [p for p, _, _ in self.got]


# ------------------------------------------------------------------------- random-game saves


def test_random_game_save_holds_spc_then_cty(game):
    s = random_game(game)
    saved = SL.saved_part(s, record(game), random_texts=TEXTS)
    assert saved["kind"] == "game"
    assert saved["random_texts"] == [["SPC", TEXTS["SPC"].hex()], ["CTY", TEXTS["CTY"].hex()]]
    assert jsonish(saved) == saved                      # plain data


def test_other_games_hold_no_texts_and_ignore_them(game):
    s = mid_turn(game)
    assert not s.flags.get(RANDOM)
    a = SL.saved_part(s, record(game))
    b = SL.saved_part(s, record(game), random_texts=TEXTS)
    assert a == b and "random_texts" not in a


@pytest.mark.parametrize("texts", [None, {}, {"SPC": TEXTS["SPC"]}, {"CTY": TEXTS["CTY"]},
                                   {"SPC": "text", "CTY": TEXTS["CTY"]}])
def test_random_game_save_needs_both_files(game, texts):
    s = random_game(game)
    with pytest.raises(ValueError):
        SL.saved_part(s, record(game), random_texts=texts)


def test_random_game_round_trip_writes_the_texts_back(game):
    """Same run, in a game: the load transform as for any game (the flag is part of the SCN),
    plus the two files to write back, byte for byte."""
    s = random_game(game)
    rec = record(game)
    ref = reference_load(s)
    saved = jsonish(SL.saved_part(s, rec, random_texts=TEXTS))
    res = do_load(game, saved, SL.run_part(s.copy()), live_record=rec)
    assert res.random_texts == TEXTS
    assert list(res.random_texts) == ["SPC", "CTY"]
    assert res.state.hash() == ref.hash() and res.state.flags[RANDOM] == 1


def test_other_game_load_writes_no_texts(game):
    s = mid_turn(game)
    rec = record(game)
    res = do_load(game, file_of(s, rec), SL.run_part(s.copy()), live_record=rec)
    assert res.random_texts is None


@pytest.mark.parametrize("bad", [None, [], [["CTY", "00"], ["SPC", "00"]], [["SPC", "zz"], ["CTY", "00"]],
                                 [["SPC", "00"]], "SPC"])
def test_random_game_file_without_its_texts_is_refused(game, bad):
    s = random_game(game)
    saved = jsonish(SL.saved_part(s, record(game), random_texts=TEXTS))
    if bad is None:
        del saved["random_texts"]
    else:
        saved["random_texts"] = bad
    with pytest.raises(ValueError):
        SL.load(saved, SL.run_part(s.copy()), live_record=record(game))


def test_failed_open_of_a_random_game_writes_nothing(game):
    s = random_game(game)
    res = SL.load(None, where="game", live_record=record(game), live=s)
    assert res.random_texts is None and res.state is s


# ------------------------------------------------------------------------- the map file


def test_map_part_has_no_ai_and_no_texts(game):
    s = mid_turn(game)                                  # SCN 0x120 = 0, as at 11f3
    m = SL.map_part(s, record(game), random_texts=TEXTS)
    assert m["kind"] == "map" and "random_texts" not in m
    assert set(m["state"]) == set(SL.SAVED_FIELDS) - {"ai"} == set(SL.MAP_FIELDS)
    g = SL.saved_part(s, record(game))
    assert {k: g["state"][k] for k in SL.MAP_FIELDS} == m["state"]
    assert jsonish(m) == m


def test_map_part_keeps_the_0bbe_test(game):
    s = random_game(game)
    with pytest.raises(ValueError):
        SL.map_part(s, record(game))
    assert SL.map_part(s, record(game), random_texts=TEXTS)["random_texts"][0][0] == "SPC"


def test_kinds_are_not_interchangeable(game):
    s = mid_turn(game)
    rec = record(game)
    run = SL.run_part(s.copy())
    with pytest.raises(ValueError):
        SL.load(SL.map_part(s, rec), run, live_record=rec)
    with pytest.raises(ValueError):
        SL.load_map(SL.saved_part(s, rec), run)
    with pytest.raises(ValueError):
        SL.load({**SL.saved_part(s, rec), "kind": "other"}, run, live_record=rec)
    old = SL.saved_part(s, rec)                         # an M10b file has no kind: a game
    del old["kind"]
    assert SL.load(old, run, live_record=rec).state.flags[LOADED] == 1


# ------------------------------------------------------------------------- Load Map 0414(e, 0, 1)


def snapshot(game, seed=4):
    """A run's last game (mid-turn) and a map snapshot taken in it (SCN 0x120 = 0)."""
    s = mid_turn(game, seed)
    return s, jsonish(SL.map_part(s, record(game)))


def test_load_map_fresh_run_rolls_only_the_overview(game):
    """Fresh run (DS:0832 = 0): no AI read, so no 0519 dice (a game load would draw them);
    the 256 rnd(1, 3, 1) and nothing else."""
    s, m = snapshot(game)
    rng = Tally(9)
    proc = AiProcess()
    run = SL.fresh_run_part(rng, s.army_types, process=proc)
    res = SL.load_map(m, run)
    assert rng.calls == OVERVIEW and res.rebuilt
    assert proc.allocated == 0 and res.state.ai.proc is proc and res.state.ai.allocated == 0
    assert len(res.state.overview_mountain_rolls) == 256


def test_load_map_keeps_the_path_cache_and_the_ai_blocks(game):
    """Same run: the path cache stays (0555:0350 is inside the skipped ovl29:0dff) and the AI
    heap blocks are the run's; SCN 0x130 = 1; the snapshot's blocks for the rest."""
    s, m = snapshot(game)
    live = s.copy()
    live.ai.proc.allocated = 1
    blocks = serialize.plain(live.ai.blocks)
    assert any(p.valid for p in live.path_cache)
    cache = serialize.plain(live.path_cache)
    run = SL.run_part(live)
    res = SL.load_map(m, run, live_record=record(game))
    st = res.state
    assert serialize.plain(st.path_cache) == cache
    assert serialize.plain(st.ai.blocks) == blocks and st.ai.proc is live.ai.proc
    assert st.ai.allocated == 1
    assert st.flags[LOADED] == 1 and st.flags.get(RANDOM, 0) == 0
    assert res.record == m["record"] and res.random_texts is None
    assert st.selection.selected == -1 and st.selection.moving == []
    d = serialize.dump(st, rng=False)
    for k in SL.MAP_FIELDS:
        if k != "flags":
            assert d[k] == m["state"][k], k


def test_load_map_rebuilds_even_with_the_same_compare_string(game):
    """rebuild 1: 232b without the strcmp, also where a game load would not rebuild (in a
    game with the same +0x44 field)."""
    s, m = snapshot(game)
    rec = record(game)
    live = s.copy()
    live.rng = Tally(3)
    res = SL.load_map(m, SL.run_part(live), live_record=rec)
    assert live.rng.calls == OVERVIEW and res.rebuilt
    assert not SL.needs_rebuild(m["record"], rec, "game")


def test_failed_map_open_rolls_on_the_live_game(game):
    s = mid_turn(game)
    s.rng = Tally(5)
    res = SL.load_map(None, live=s, live_record=None)
    assert res.state is s and s.rng.calls == OVERVIEW and res.rebuilt
    assert s.flags[LOADED] == 0                         # 08b1: no SCN 0x130
    assert all(a.x == -1 and a.owner == 0x0F for a in s.armies[:10])
    with pytest.raises(ValueError):
        SL.load_map(None)


def test_load_map_needs_the_run(game):
    s, m = snapshot(game)
    with pytest.raises(ValueError):
        SL.load_map(m)


# ------------------------------------------------------------------------- the rest of 12f2


def loaded_map(game, music=None, rng=None):
    s, m = snapshot(game)
    live = s.copy()
    if rng is not None:
        live.rng = rng
    if music is not None:
        live.music = music
    res = SL.load_map(m, SL.run_part(live))
    st = res.state
    st.income_cache[:] = [7] * 8                        # stale words the recounts rewrite
    st.upkeep_cache[:] = [3] * 8
    st.city_counts[:] = [1] * 8
    st.cost_map[:] = [0] * len(st.cost_map)
    return st


def test_after_load_map_recounts_without_dice_or_points(game):
    rng = Tally(2)
    st = loaded_map(game, rng=rng)
    n = len(rng.calls)
    ref = st.copy()
    EC.refresh_cities(ref)
    EC.refresh_upkeep(ref)
    EC.refresh_income(ref)
    P.rebuild_cost_map(ref)
    flag = st.flags.get(RANDOM, 0)
    tiles = list(st.world.tiles)
    with Points(st) as pts:
        assert SL.after_load_map(st) is None
    assert (st.city_counts, st.upkeep_cache, st.income_cache) == (ref.city_counts, ref.upkeep_cache, ref.income_cache)
    assert st.cost_map == ref.cost_map
    assert pts.names() == [] and len(rng.calls) == n
    assert st.flags.get(RANDOM, 0) == flag              # 007f is ovl57:0000's (map_setup_entry)
    assert st.world.tiles == tiles                      # no ovl62:0000 / 09f2


@pytest.mark.parametrize("flag", [0, 1])
def test_map_setup_entry_plays_003a_then_sets_the_flag(game, flag):
    """ovl57:0000(0, 1, 0, 1): music mode 0 at 003a (no die), then 007f SCN 0x120 = DS:28c8."""
    rng = Tally(2)
    words = MusicWords(on=1, driver=1, mode=1, playing=1)   # a game's mode 1 plays
    st = loaded_map(game, music=words, rng=rng)
    st.flags[RANDOM] = 1 - flag                         # whatever the file held
    n = len(rng.calls)
    with Points(st) as pts:
        ev = SL.map_setup_entry(st, flag)
    assert st.flags[RANDOM] == flag and len(rng.calls) == n
    assert [e.info["mode"] for e in ev] == [0] and ev[0].info["site"] == "ovl57:003a"
    assert [(p, i["at"], a) for p, i, a in pts.got] == [("music", "ovl57:003a", 1 - flag)]  # before 007f
    assert dict((p, i) for p, i, _ in pts.got)["music"]["events"] == ev


def test_map_setup_done_13b7_returns_at_once(game):
    """After 003a's mode 0, 13b7 draws no die and starts nothing; frame_off first."""
    rng = Tally(2)
    words = MusicWords(on=1, driver=1, mode=1, playing=1)
    st = loaded_map(game, music=words, rng=rng)
    SL.after_load_map(st)
    SL.map_setup_entry(st, 1)
    starts, n = words.starts, len(rng.calls)
    with Points(st) as pts:
        assert SL.map_setup_done(st) == []
    assert words.starts == starts and len(rng.calls) == n and words.mode == 0
    assert [(p, i["at"]) for p, i, _ in pts.got] == [("frame_off", "ovl49:13b2"), ("music", "ovl49:13b9")]
    # without 003a (a mode 1 still playing), 13b7 would start mode 0 itself, attributed there
    st2 = loaded_map(game, music=MusicWords(on=1, driver=1, mode=1, playing=1))
    ev = SL.map_setup_done(st2)
    assert [e.info["site"] for e in ev] == ["ovl49:13b7"]


def test_map_load_then_begin_carry_keeps_the_recounts(game):
    """The recounted caches are the run's memory a later Begin keeps (begin_carry)."""
    st = loaded_map(game)
    with allowing_unverified():
        SL.after_load_map(st)
    run = SL.run_part(st)
    other = scenario_state(game, "TUTORIA", seed=8)
    SL.begin_carry(other, run)
    assert other.income_cache == st.income_cache and other.city_counts == st.city_counts
    assert serialize.plain(other.path_cache) == serialize.plain(st.path_cache)


# ------------------------------------------------------------------------- the Save Map gate


@pytest.mark.parametrize("loaded,rnd,game_start,ok", [
    (0, 1, False, True), (1, 1, False, False), (0, 0, False, False), (0, 1, True, False),
    (0, 2, False, True), (0, 0, True, False)])
def test_save_map_gate(loaded, rnd, game_start, ok):
    assert SL.save_map_allowed({LOADED: loaded, RANDOM: rnd}, game_start) is ok


def test_save_map_gate_after_a_map_load(game):
    st = loaded_map(game)
    SL.after_load_map(st)
    SL.map_setup_entry(st, 1)
    assert not SL.save_map_allowed(st.flags, False)     # SCN 0x130 = 1 after any load
    assert SL.save_map_allowed({}, False) is False


# ------------------------------------------------------------------------- the description buffer (X64)


class Reads:
    """A file reader that counts its calls."""

    def __init__(self, data):
        self.data, self.n = data, 0

    def __call__(self):
        self.n += 1
        return self.data


CTY_A = b"#001|Alpha one|Alpha two|Alpha three|\r\n#002|Beta|b2|b3|\r\n"
CTY_B = b"#001|Other|o2|o3|\r\n"


def test_description_buffer_is_keyed_by_kind_only():
    c = D.DescCache()
    a, b = Reads(CTY_A), Reads(CTY_B)
    assert D.lines(c, D.CTY, 2, a) == ["Beta", "b2", "b3"] and a.n == 1
    assert D.lines(c, D.CTY, 1, b) == ["Alpha one", "Alpha two", "Alpha three"] and b.n == 0
    assert c.kind == D.CTY and c.allocated == 1 and len(c.buffer) == 0x1F40
    assert D.lines(c, D.CTY, 7, a) is None             # no entry: the caller's buffers stay


def test_description_buffer_reread_keeps_the_stale_tail():
    """Another kind re-reads into the start of the same buffer: a shorter file leaves the end
    of the longer one (already '|' -> 0)."""
    c = D.DescCache()
    D.lines(c, D.CTY, 1, Reads(CTY_A))
    D.lines(c, D.SPC, 1, Reads(CTY_B))
    assert c.kind == D.SPC
    assert D.lines(c, D.SPC, 1, Reads(b"")) == ["Other", "o2", "o3"]
    assert D.lines(c, D.SPC, 2, Reads(b"")) == ["Beta", "b2", "b3"]   # from the CTY's tail
    assert bytes(c.buffer[:len(CTY_B)]) == CTY_B.replace(b"|", b"\0")


def test_description_buffer_failed_open_and_drop():
    c = D.DescCache()
    assert D.load(c, D.CTY, Reads(CTY_A)) is True
    with pytest.raises(D.FatalOpen) as e:               # 1e8e: ovl52:0000 ends the run
        D.load(c, D.SPC, Reads(None))
    assert (e.value.kind, e.value.error) == (D.SPC, (1, 0)) and c.kind == D.SPC
    assert D.lines(c, D.SPC, 1, Reads(None)) == ["Alpha one", "Alpha two", "Alpha three"]  # kind set: no reopen
    D.drop(c)
    assert (c.kind, c.allocated, c.buffer) == (0, 0, None)
    r = Reads(CTY_B)
    assert D.lines(c, D.CTY, 1, r) == ["Other", "o2", "o3"] and r.n == 1
    D.drop(None)                                        # not modelled by the caller
    with pytest.raises(ValueError):
        D.load(c, 3, r)


def test_description_buffer_reads_at_most_8000_bytes():
    c = D.DescCache()
    D.load(c, D.CTY, Reads(b"#001|x|y|z|" + b"a" * 9000))
    assert len(c.buffer) == 0x1F40 and c.buffer[-1] == ord("a")


def cached():
    c = D.DescCache()
    D.load(c, D.CTY, Reads(CTY_A))
    return c


def test_random_game_load_drops_the_buffer(game):
    s = random_game(game)
    rec = record(game)
    saved = jsonish(SL.saved_part(s, rec, random_texts=TEXTS))
    c = cached()
    SL.load(saved, SL.run_part(s.copy()), live_record=rec, descriptions=c)
    assert c.kind == 0 and c.buffer is None
    c = cached()                                        # failed open: the live SCN 0x120
    SL.load(None, live=random_game(game), live_record=rec, descriptions=c)
    assert c.kind == 0


def test_other_loads_keep_the_buffer(game):
    s, m = snapshot(game)
    rec = record(game)
    c = cached()
    SL.load(file_of(s, rec), SL.run_part(s.copy()), live_record=rec, descriptions=c)
    assert c.kind == D.CTY
    SL.load_map(m, SL.run_part(s.copy()), descriptions=c)      # a map file's SCN 0x120 is 0
    assert c.kind == D.CTY and c.buffer is not None


def test_new_game_drops_the_buffer(game):
    st = scenario_state(game, "TUTORIA")
    c = cached()
    SL.new_game(st, descriptions=c)
    assert c.kind == 0 and c.allocated == 0


# ------------------------------------------------------------------------- loaded_state / begin


def cfg_for(name, seed=1, **kw):
    return NewGameConfig(name, (Control.HUMAN,) + (Control.COMPUTER,) * 7, (1,) * 8, (0,) * 8,
                         (0,) * 8, None, GameOptions(), 0, seed, **kw)


@pytest.mark.parametrize("name", ["TUTORIA", "ERYTHEA", "RANDOM"])
def test_new_game_is_begin_of_loaded_state(game, name):
    sc, at, kw = _inputs(game, name)
    cfg = cfg_for(name, 5, setup_rolls=((1, 30, 10), (1, 4, 0)), greatest=1)
    with allowing_unverified():
        a = S.new_game(sc, cfg, list(at), cards=_cards(game), **kw)
        rng = Rng(5)
        st = S.loaded_state(sc, list(at), rng=rng, **kw)
        for r in cfg.setup_rolls:
            rng.rnd(*r)
        b = S.begin(st, replace(cfg, setup_rolls=()), itm=sc["items"], signs=sc["signs"],
                    cards=_cards(game))
    assert a.hash() == b.hash() and a.rng.state() == b.rng.state()


@pytest.mark.parametrize("flag", [0, 1])
def test_new_game_sets_scn_0x120_from_the_random_flag(game, flag):
    sc, at, kw = _inputs(game, "TUTORIA")
    with allowing_unverified():
        st = S.new_game(sc, cfg_for("TUTORIA", random_flag=flag), list(at), **kw)
    assert st.flags[RANDOM] == flag and st.flags[LOADED] == 0


def test_loaded_state_is_the_loader_only(game):
    """256 dice and nothing else; the side words of the SCN; no Begin writes; CURRENT.SGN /
    .HST as passed."""
    sc, at, kw = _inputs(game, "TUTORIA")
    rng = Tally(4)
    signs = [Sign(1, 2, "a", "b")]
    st = S.loaded_state(sc, list(at), rng=rng, signs=signs, history=[{"x": 1}], **kw)
    assert rng.calls == OVERVIEW and st.overview_mountain_rolls and st.rng is rng
    assert st.world.signs == signs and st.history == [{"x": 1}]
    assert st.relations == [[0] * 8 for _ in range(8)] and all(p.infamy == 0 for p in st.players)
    pl = sc["scn"]["players"]
    assert [p.control for p in st.players] == [q["computer_d0"] for q in pl]
    assert all(p.level == 3 for p, q in zip(st.players, pl) if not q["active"])
    assert S.loaded_state(sc, list(at), rng=Rng(1), **kw).world.signs[0].line1 == sc["signs"][0]["line1"]


def test_begin_refuses_a_replay(game):
    sc, at, kw = _inputs(game, "TUTORIA")
    st = S.loaded_state(sc, list(at), rng=Rng(1), **kw)
    for bad in (dict(rng_state=Rng(1).state()), dict(setup_rolls=((1, 30, 10),))):
        with pytest.raises(ValueError):
            S.begin(st, cfg_for("TUTORIA", **bad), itm=sc["items"])
    with pytest.raises(ValueError):                     # no side plays
        S.begin(st, replace(cfg_for("TUTORIA"), levels=(3,) * 8), itm=sc["items"])


def test_begin_keeps_scn_0x120_and_the_overview_and_takes_the_signs(game):
    sc, at, kw = _inputs(game, "TUTORIA")
    rng = Tally(6)
    st = S.loaded_state(sc, list(at), rng=rng, **kw)
    st.flags[RANDOM] = 1
    st.flags[LOADED] = 1
    st.history = [{"kept": 1}]                          # CURRENT.HST: recreated at turn 2 only
    rolls = list(st.overview_mountain_rolls)
    n = len(rng.calls)
    new = [Sign(5, 6, "new", "sign")]
    with allowing_unverified():
        S.begin(st, cfg_for("TUTORIA"), itm=sc["items"], signs=new)
    assert st.flags[RANDOM] == 1 and st.flags[LOADED] == 0
    assert st.overview_mountain_rolls == rolls
    assert rng.calls[n:n + 256] != OVERVIEW                # Begin runs no ovl63:232b
    assert st.world.signs == new and st.history == [{"kept": 1}]
    old = S.loaded_state(sc, list(at), rng=Rng(6), signs=[Sign(9, 9, "kept", "x")], **kw)
    with allowing_unverified():
        S.begin(old, cfg_for("TUTORIA"), itm=sc["items"], signs=None)   # ovl13:0103's open failed
    assert old.world.signs == [Sign(9, 9, "kept", "x")]


def test_generate_snapshot_load_map_begin(game, tmp_path):
    """The random-map flow on the engine side: the loader's state of a (here the shipped)
    RANDOM scenario snapshotted (11f3, SCN 0x120 still 0), Load Map in a fresh run (256 dice),
    the Setup entry (0x120 = DS:28c8), Begin on the loaded state: Begin's dice only, the
    overview kept, the signs from the RANDOM overlay (Q3), Save Map on again in the game."""
    sc, at, kw = _inputs(game, "RANDOM")
    gen = S.loaded_state(sc, list(at), rng=Rng(2), signs=[Sign(0, 0, "last", "game")], **kw)
    rec = {**record(game, "ERYTHEA"), "str_3c": "random", "str_44": "abcdef"}
    m = jsonish(SL.map_part(gen, rec))
    assert m["state"]["flags"][str(RANDOM)] == 0 and "random_texts" not in m
    rng = Tally(11)
    res = SL.load_map(m, SL.fresh_run_part(rng, gen.army_types, process=AiProcess()))
    st = res.state
    assert rng.calls == OVERVIEW and st.world.signs == [Sign(0, 0, "last", "game")]
    rolls = list(st.overview_mountain_rolls)
    SL.after_load_map(st)
    SL.map_setup_entry(st, 1)
    assert not SL.save_map_allowed(st.flags, False)
    SL.map_setup_done(st)
    overlay_signs = sc["signs"]                         # RANDOM\RANDOM.SGN as on disk
    with allowing_unverified():
        S.begin(st, cfg_for("RANDOM"), itm=sc["items"], signs=overlay_signs, cards=_cards(game))
    assert len(rng.calls) > 256 and rng.calls[256:512] != OVERVIEW     # no second 256
    assert st.overview_mountain_rolls == rolls
    assert st.world.signs[0].line1 == overlay_signs[0]["line1"]
    assert st.flags[RANDOM] == 1 and st.flags[LOADED] == 0
    assert SL.save_map_allowed(st.flags, False)          # ovl57:0ea7 cleared 0x130


# ------------------------------------------------------------------------- persist: the reader


def test_write_game_reads_the_random_texts(game, tmp_path):
    from warlords2.formats.gamedir import GameDir
    from warlords2.persist import saves as PS
    from warlords2.persist.userdir import UserDir
    s = random_game(game)
    carry = PS.RunCarry(record=record(game))
    calls = []
    sv = PS.Saves(UserDir(tmp_path / "u", game), GameDir(game),
                  random_texts=lambda: calls.append(1) or TEXTS)
    assert sv.write_game(carry, "rnd", s)
    saved = sv.read_game(0)
    assert saved["random_texts"][1] == ["CTY", TEXTS["CTY"].hex()] and calls == [1]
    sv.write_game(carry, "plain", mid_turn(game))       # SCN 0x120 = 0: not read
    assert calls == [1]
    with pytest.raises(ValueError):
        PS.Saves(UserDir(tmp_path / "v", game), GameDir(game)).write_game(carry, "x", s)
    assert isinstance(carry.descriptions, D.DescCache)
