"""M10b package E: rules.saveload, the engine side of Save / Load / New Game (ovl49).

The EXE is not hash-identical across a save + load (the load clears the path cache and the
selection pointers, sets SCN 0x130, recounts the caches, rebuilds the map words and the cost
map), so the round trips compare with a hand-written load transform (`reference_load`), and
the one case where the EXE does match an uninterrupted run (a game loaded before, saved and
loaded again at once) is checked separately.
"""
import json
import logging
import random
import threading

import pytest

from movekit import _cards, scenario_state
from test_turn import _answer, _human_cmd
from warlords2.formats.gamedir import GameDir
from warlords2.model import commands as C
from warlords2.model import serialize
from warlords2.model.ai import AiProcess
from warlords2.model.ids import MAP_ARMY, MAP_W
from warlords2.model.state import ReportEntry, cleared_path_cache
from warlords2.rules import economy as EC
from warlords2.rules import engine
from warlords2.rules import pathfinding as P
from warlords2.rules import present as PR
from warlords2.rules import saveload as SL
from warlords2.rules import turn as T
from warlords2.rules.constants import allowing_unverified
from warlords2.rules.engine import IllegalCommand
from warlords2.rules.mapwords import refresh_map
from warlords2.rules.movement import FREE
from warlords2.rules.rng import Rng
from warlords2.rules.ruins import site_tiles

pytestmark = pytest.mark.gamedata

SCN_LOADED = 0x130


class Tally(Rng):
    """The game's dice, each roll's (dice, sides, add) recorded."""

    def __init__(self, seed):
        super().__init__(seed)
        self.calls = []

    def rnd(self, *a):
        self.__dict__.setdefault("calls", []).append(a)      # also after from_state
        return super().rnd(*a)


def record(game, name="TUTORIA"):
    return next(r for r in GameDir(game).scenarios() if r["str_3c"].upper() == name)


def _step(st, r):
    cmd = _answer(st, r) if st.pending is not None else _human_cmd(st, r)
    try:
        engine.apply(st, cmd)
    except IllegalCommand:
        pass


def play(st, seed, steps, end_every=8):
    """`steps` random human commands (answers first), an End Turn every `end_every` (the
    computer sides play their real AI turns); the hash after each step."""
    r = random.Random(seed)
    out = []
    with allowing_unverified():
        for i in range(steps):
            if i % end_every == end_every - 1 and st.pending is None:
                engine.apply(st, C.EndTurn())
            else:
                _step(st, r)
            out.append(st.hash())
    return out


def mid_turn(game, seed=4):
    """TUTORIA (side 0 human, side 7 computer with its real AI) two rounds in, then mid-turn
    with a selected stack, a filled path cache, a search field, caches made stale."""
    logging.disable(logging.WARNING)
    st = scenario_state(game, "TUTORIA", seed=seed)
    with allowing_unverified():
        T.run(st)
    play(st, seed, 23)
    while st.pending is not None:
        with allowing_unverified():
            engine.apply(st, _answer(st, random.Random(seed)))
    own = next(a for a in st.armies if a.owner == st.current and a.y >= 0)
    with allowing_unverified():
        engine.apply(st, C.SelectStack(own.x, own.y))
    st.income_cache[:] = [7] * 8                # stale DGROUP words the load recounts
    st.upkeep_cache[:] = [3] * 8
    st.city_counts[:] = [1] * 8
    st.flags[SCN_LOADED] = 0
    st.production_report[:] = [ReportEntry(2, 1, 0, -1, 0)]
    assert st.selection.selected >= 0 and any(p.valid for p in st.path_cache) and st.dist_table
    return st


def file_of(st, rec):
    """The save file, as bytes would carry it (JSON)."""
    return json.loads(json.dumps(SL.saved_part(st, rec)))


def reference_load(s):
    """The load transform written out by hand: the game as it was saved, the run's words, the
    selection pointers null, SCN 0x130 = 1, the path cache cleared, then 03f9 / 02bf / 0372,
    09f2, ovl62:0000, 0d9e (ovl49:0414, 02d3)."""
    c = s.copy()
    c.selection.selected, c.selection.hero, c.selection.moving = -1, -1, []
    c.flags[SCN_LOADED] = 1
    c.path_cache = cleared_path_cache()
    EC.refresh_cities(c)
    EC.refresh_upkeep(c)
    EC.refresh_income(c)
    site_tiles(c, c.current)
    refresh_map(c)
    P.rebuild_cost_map(c)
    return c


def do_load(game, saved, run, where="game", live_record=None, live=None):
    cards = _cards(game)
    from warlords2.ai.cards import load_draws
    res = SL.load(saved, run, where=where, live_record=live_record, live=live,
                  ai_read=lambda st: load_draws(st, cards, run.process if run else None))
    with allowing_unverified():
        SL.after_load(res.state, res.rebuilt, where)
    return res


# ------------------------------------------------------------------------- the two parts


def test_saved_and_run_fields_partition_the_state(game):
    st = scenario_state(game, "TUTORIA")
    keys = set(serialize.dump(st))
    assert not set(SL.SAVED_FIELDS) & set(SL.RUN_FIELDS)
    assert set(SL.SAVED_FIELDS) | set(SL.RUN_FIELDS) | {"format", "rng", "pending"} == keys


def test_saved_part_holds_nothing_of_the_run(game):
    """Dice, caches, selection words, battle arrays, search field, path cache, overview rolls,
    army types, production report and AI process words are not in the file."""
    st = mid_turn(game)
    rec = record(game)
    before = json.dumps(SL.saved_part(st, rec), sort_keys=True)
    st.rng.rnd(1, 100, 0)
    st.battle_work.attack_cost = 9
    st.battle_work.a_types[3] = 5
    st.dist_table[5] = 77
    st.selection.count, st.selection.mask, st.selection.selected = 5, 3, -1
    st.income_cache[0] = st.upkeep_cache[0] = st.city_counts[0] = 99
    st.cost_map[0] ^= 1
    st.path_cache = cleared_path_cache()
    st.overview_mountain_rolls[0] = 3 - st.overview_mountain_rolls[0] % 3
    st.army_types = st.army_types[1:]
    st.reveal_at_first_human_turn = 1
    st.advisor_talking = 1
    st.production_report.clear()
    st.ai.proc.solidarity[1], st.ai.proc.raze_target = 5, 3
    assert json.dumps(SL.saved_part(st, rec), sort_keys=True) == before
    st.players[0].gold += 1                    # SCN
    assert json.dumps(SL.saved_part(st, rec), sort_keys=True) != before
    saved = SL.saved_part(st, rec)
    assert saved["record"] == rec and saved["record"] is not rec


def test_saved_part_refuses_a_pending_question(game):
    st = scenario_state(game, "TUTORIA")
    st.pending = object()
    with pytest.raises(ValueError):
        SL.saved_part(st, record(game))


def test_merge_refuses_another_format(game):
    st = scenario_state(game, "TUTORIA")
    saved = SL.saved_part(st, record(game))
    with pytest.raises(ValueError):
        SL.merge({**saved, "format": 99}, SL.run_part(st))
    with pytest.raises(ValueError):
        SL.merge({**saved, "state_format": 0}, SL.run_part(st))


# ------------------------------------------------------------------------- round trips


def test_same_run_load_is_the_load_transform_and_continues_alike(game):
    """§8.1: a mid-turn save loaded in the same run (in a game, same scenario) is the reference
    load transform, and N commands with End Turns into the computer side's real AI turns give
    the same hashes from both."""
    s = mid_turn(game)
    rec = record(game)
    ref = reference_load(s)
    live = s.copy()
    res = do_load(game, file_of(s, rec), SL.run_part(live), live_record=rec)
    st = res.state
    assert not res.rebuilt and res.record == rec
    assert st.hash() == ref.hash()
    assert st.ai.proc is live.ai.proc and st.ai.proc.blocks is st.ai.blocks
    assert st.ai.proc.dump() == ref.ai.proc.dump()
    assert st.production_report is live.production_report and len(st.production_report) == 1
    assert play(st, 9, 40) == play(ref, 9, 40)


def test_load_differs_from_the_live_game_where_the_exe_does(game):
    s = mid_turn(game)
    rec = record(game)
    st = do_load(game, file_of(s, rec), SL.run_part(s.copy()), live_record=rec).state
    assert st.hash() != s.hash()
    assert s.flags[SCN_LOADED] == 0 and st.flags[SCN_LOADED] == 1
    assert s.selection.selected >= 0 and (st.selection.selected, st.selection.hero, st.selection.moving) == (-1, -1, [])
    assert (st.selection.count, st.selection.moves, st.selection.mask, st.selection.palette) == (
        s.selection.count, s.selection.moves, s.selection.mask, s.selection.palette)   # kept words
    assert any(p.valid for p in s.path_cache) and st.path_cache == cleared_path_cache()
    assert st.city_counts == [EC.city_count(st, p) for p in range(8)] != s.city_counts
    assert st.income_cache != s.income_cache and st.upkeep_cache != s.upkeep_cache
    assert st.dist_table == s.dist_table and st.battle_work == s.battle_work
    assert st.rng.state() == s.rng.state()           # same-run, same scenario: no dice


def test_where_the_exe_matches_an_uninterrupted_run(game):
    """§8.2: a game that was loaded (SCN 0x130 = 1, path cache empty, caches fresh, no stale
    map or cost bytes, selection null), saved at once and loaded again in the same run is the
    same game: same hash, and the same hashes on from there.  In the EXE only with the music
    off: after_load's ovl58:0000(1) (040c) may draw an ovl59:052f die (register X32)."""
    s = mid_turn(game)
    rec = record(game)
    s1 = do_load(game, file_of(s, rec), SL.run_part(s.copy()), live_record=rec).state
    keep = s1.copy()
    s2 = do_load(game, file_of(s1, rec), SL.run_part(s1.copy()), live_record=rec).state
    assert s2.hash() == s1.hash() == keep.hash()
    assert play(s2, 5, 30) == play(keep, 5, 30)


# ------------------------------------------------------------------------- fresh run (D4, D5)


def fresh_load(game, saved, seed=77, where="game_start"):
    s = scenario_state(game, "TUTORIA")
    run = SL.fresh_run_part(Tally(seed), s.army_types, advisor_groups={3: 2})
    return do_load(game, saved, run, where=where, live_record=None), run


def test_fresh_run_load_draws_the_ai_then_256_overview_dice(game):
    """DS:0832 == 0: the first ovl25:056c of 0dff runs 0519 with its dice on the loaded SCN,
    then ovl63:232b rolls 256 rnd(1, 3, 1) (the compare string is "" off the game screen)."""
    s = mid_turn(game)
    saved = file_of(s, record(game))
    res, run = fresh_load(game, saved)
    st = res.state
    calls = st.rng.calls
    probe = SL.merge(saved, SL.fresh_run_part(Tally(77), s.army_types))
    from warlords2.ai.cards import setup_all
    probe.ai.blocks = [type(b)() for b in probe.ai.blocks]
    setup_all(probe, _cards(game))
    n_ai = len(probe.rng.calls)
    assert n_ai > 0 and res.rebuilt
    assert calls[:n_ai] == probe.rng.calls
    assert calls[n_ai:] == [(1, 3, 1)] * 256
    check = Rng(77)
    for a in calls[:n_ai]:
        check.rnd(*a)
    assert st.overview_mountain_rolls == [check.rnd(1, 3, 1) for _ in range(256)]
    assert st.ai.allocated == 1 and st.ai.proc is not s.ai.proc
    assert st.ai.blocks[0] == SL.merge(saved, SL.run_part(s)).ai.blocks[0]   # the file's blocks
    assert (st.battle_work, st.dist_table, st.reveal_at_first_human_turn, len(st.production_report)) == (
        type(st.battle_work)(), [], 0, 0)
    assert st.advisor_groups == {3: 2} and st.army_types == s.army_types


def test_two_fresh_loads_of_one_file_are_one_game(game):
    saved = file_of(mid_turn(game), record(game))
    a, _ = fresh_load(game, saved)
    b, _ = fresh_load(game, saved)
    assert a.state.hash() == b.state.hash()
    assert play(a.state, 3, 20) == play(b.state, 3, 20)


def test_load_in_a_run_that_had_a_game_draws_no_ai_dice(game):
    s = mid_turn(game)
    rec = record(game)
    live = s.copy()
    live.rng = Tally(5)
    res = do_load(game, file_of(s, rec), SL.run_part(live), where="game", live_record=rec)
    assert res.state.rng is live.rng and live.rng.calls == []


def test_load_from_the_game_start_screen_rebuilds_the_overview(game):
    """In a run that had a game: no AI dice, but the 256 overview dice (compare string "")."""
    s = mid_turn(game)
    rec = record(game)
    live = s.copy()
    live.rng = Tally(5)
    res = do_load(game, file_of(s, rec), SL.run_part(live), where="game_start", live_record=rec)
    assert res.rebuilt and live.rng.calls == [(1, 3, 1)] * 256


def test_needs_rebuild():
    tut, dra = {"str_44": "Tutoria"}, {"str_44": "Dragon"}
    assert not SL.needs_rebuild(tut, tut, "game")
    assert SL.needs_rebuild(tut, dra, "game")
    assert SL.needs_rebuild(tut, tut, "game_start") and SL.needs_rebuild(tut, tut, "setup")
    assert not SL.needs_rebuild({"str_44": ""}, tut, "setup")     # strcmp("", "") == 0
    assert SL.needs_rebuild(tut, tut, "game", rebuild=True)
    with pytest.raises(ValueError):
        SL.needs_rebuild(tut, tut, "menu")


# ------------------------------------------------------------------------- failed open (D3)


def test_failed_open_keeps_the_wipe_on_the_live_game(game):
    """0414 jumps from the failed open to 08b1: records 0..9 owner 0x0f at (-1, -1), the
    selection pointers null and ovl64:113b's explored layer stay; no SCN 0x130, no AI read, no
    path-cache clear, no rebuild in a game; then 02d3's recounts run on that game."""
    s = mid_turn(game)
    rec = record(game)
    ten = [(a.type_id, a.strength, a.home_city) for a in s.armies[:10]]
    ten += [(0, 0, 0)] * (10 - len(ten))                 # records never used: the BSS image
    cache = [p for p in s.path_cache]
    rng = s.rng.state()
    res = do_load(game, None, None, where="game", live_record=rec, live=s)
    assert res.state is s and not res.rebuilt and res.record is rec
    assert [(a.owner, a.x, a.y) for a in s.armies[:10]] == [(0x0F, -1, -1)] * 10
    assert [(a.type_id, a.strength, a.home_city) for a in s.armies[:10]] == ten
    assert (s.selection.selected, s.selection.hero, s.selection.moving) == (-1, -1, [])
    assert s.flags[SCN_LOADED] == 0 and s.path_cache == cache and s.rng.state() == rng
    from warlords2.rules.setup import _explored_map
    probe = s.copy()
    _explored_map(probe)
    assert s.world.explored == probe.world.explored and s.world.roads == probe.world.roads
    assert s.city_counts == [EC.city_count(s, p) for p in range(8)]
    assert all(not s.world.flags[a.y * MAP_W + a.x] & MAP_ARMY or any(
        b.x == a.x and b.y == a.y and b.owner != FREE for b in s.armies[10:]) for a in s.armies[:10] if a.y >= 0)


def test_failed_open_on_a_small_army_table_adds_the_bss_records(game):
    s = scenario_state(game, "TUTORIA")
    del s.armies[3:]
    SL.wipe(s)
    assert len(s.armies) == 10 and [a.id for a in s.armies] == list(range(10))
    assert all((a.owner, a.x, a.y) == (0x0F, -1, -1) for a in s.armies)


def test_failed_open_off_the_game_screen_rebuilds_from_the_live_record(game):
    s = mid_turn(game)
    s.rng = Tally(2)
    res = SL.load(None, where="game_start", live_record=record(game), live=s)
    assert res.rebuilt and s.rng.calls == [(1, 3, 1)] * 256
    with pytest.raises(ValueError):
        SL.load(None, where="game", live_record=record(game))


# ------------------------------------------------------------------------- after_load order


def test_after_load_runs_02d3_in_order(game, monkeypatch):
    s = scenario_state(game, "TUTORIA")
    log = []
    for mod, name in ((EC, "refresh_cities"), (EC, "refresh_upkeep"), (EC, "refresh_income"),
                      (SL, "site_tiles"), (SL, "refresh_map"), (P, "rebuild_cost_map"),
                      (SL, "redraw_palette")):
        real = getattr(mod, name)
        monkeypatch.setattr(mod, name, lambda *a, _n=name, _r=real: (log.append(_n), _r(*a))[1])
    PR.attach(threading.current_thread(), lambda point, info: log.append((point, info.get("at"))))
    try:
        SL.after_load(s, True, "game")
        game_log, log[:] = list(log), []
        SL.after_load(s, False, "game_start")
    finally:
        PR.detach(threading.current_thread())
    tail = ["refresh_cities", "refresh_upkeep", "refresh_income", "site_tiles", "refresh_map",
            "rebuild_cost_map", ("game_screen", "ovl49:039f"), "redraw_palette",
            ("strip", "ovl49:03b0"), ("strip", "ovl49:03bb"), ("message", None),
            ("map", "ovl49:0400"), ("frame_off", "ovl49:0405"), ("music", "ovl49:040c")]
    assert game_log == [("load_blank", "ovl49:0344")] + tail
    assert log == [("view_setup", "ovl49:035c")] + tail


def test_after_load_present_infos(game):
    s = scenario_state(game, "TUTORIA")
    got = {}
    PR.attach(threading.current_thread(), lambda point, info: got.setdefault(point, []).append(info))
    try:
        SL.after_load(s, False, "game_start")
    finally:
        PR.detach(threading.current_thread())
    assert got["message"] == [{"group": 47, "index": 1, "args": (s.players[s.current].name,), "wait": None}]
    assert [i["args"] for i in got["strip"]] == [(1, 0), (0, 0)]
    assert got["music"][0]["mode"] == 1 and got["game_screen"][0]["from_game_start"] is True


def test_income_reads_the_fresh_city_counts(game, monkeypatch):
    """0372 after 03f9: the income adds DS:5dea[p] * gold items, the count as just recounted."""
    s = scenario_state(game, "TUTORIA")
    monkeypatch.setattr(EC, "gold_items", lambda st, p: 10)
    s.city_counts[:] = [0] * 8
    SL.after_load(s, False)
    assert s.income_cache == [EC.s16(sum(c.income for c in s.cities if EC.owns(c, p))
                                     + EC.city_count(s, p) * 10) for p in range(8)]


# ------------------------------------------------------------------------- New Game (D6)


def test_new_game_frees_every_army_then_game_start_then_0519(game):
    s = mid_turn(game)
    s.rng = Tally(1)
    s.world.explored[0], s.world.roads[0] = 0, s.world.roads[0] ^ 0x20 | 0x80   # undone by 113b
    log = []
    PR.attach(threading.current_thread(), lambda point, info: log.append(point))
    try:
        from warlords2.ai.cards import setup_all
        SL.new_game(s, ai_setup=lambda st: (log.append("0519"), setup_all(st, _cards(game))))
    finally:
        PR.detach(threading.current_thread())
    assert log == ["frame_off", "game_start", "0519"]
    assert all((a.owner, a.type_id, a.x, a.y, a.moves_left) == (FREE, 0xFF, -1, -1, 0) for a in s.armies)
    assert not any(f & MAP_ARMY for f in s.world.flags)
    assert s.rng.calls and s.ai.allocated == 1
    from warlords2.rules.setup import _explored_map
    probe = s.copy()
    _explored_map(probe)
    assert s.world.explored == probe.world.explored and s.world.roads == probe.world.roads


def test_new_game_then_load_takes_the_run_part_of_the_abandoned_game(game):
    """After New Game the old game is the run's memory: a load from the Game Start screen keeps
    its dice stream and AI process (no 0519 again: DS:0832 is 1) and rebuilds the overview."""
    s = mid_turn(game)
    saved = file_of(s, record(game))
    old = s.copy()
    old.rng = Tally(8)
    SL.new_game(old)
    res = do_load(game, saved, SL.run_part(old), where="game_start", live_record=record(game, "ERYTHEA"))
    assert res.rebuilt and old.rng.calls == [(1, 3, 1)] * 256 and res.state.ai.proc is old.ai.proc


def test_fresh_run_part_is_independent_of_its_inputs(game):
    s = scenario_state(game, "TUTORIA")
    types = list(s.army_types)
    run = SL.fresh_run_part(Rng(1), types)
    types.clear()
    assert run.fields["army_types"] and run.process is None and len(run.production_report) == 0
    assert run.fields["path_cache"] == serialize.plain(cleared_path_cache())
    assert isinstance(AiProcess(), AiProcess)


def test_fresh_run_load_attaches_the_apps_process(game):
    s = mid_turn(game)
    proc = AiProcess()
    run = SL.fresh_run_part(Tally(3), s.army_types, process=proc)
    res = do_load(game, file_of(s, record(game)), run, where="game_start")
    assert res.state.ai.proc is proc and proc.allocated == 1 and proc.blocks is res.state.ai.blocks
    assert res.state.rng.calls[-256:] == [(1, 3, 1)] * 256 and len(res.state.rng.calls) > 256


# ------------------------------------------------------------------------- Begin in a run (S1)


def begin(game, run=None, name="DRAGON", seed=6, options=None, process=None):
    from movekit import _inputs
    from warlords2.model.ids import Control
    from warlords2.model.newgame import NewGameConfig
    from warlords2.model.options import GameOptions
    from warlords2.rules import setup as S
    sc, at, kw = _inputs(game, name)
    cfg = NewGameConfig(name, (Control.HUMAN,) + (Control.COMPUTER,) * 7, (1,) * 8, (0,) * 8,
                        (0,) * 8, None, options or GameOptions(), 0, seed)
    with allowing_unverified():
        return S.new_game(sc, cfg, list(at), cards=_cards(game), process=process, run=run, **kw)


def old_game(game):
    s = mid_turn(game)
    s.battle_work.attack_cost, s.battle_work.d_types[7] = 6, 4
    s.selection.count, s.selection.mask, s.selection.next_ref = 3, 8, (5, 6)
    s.reveal_at_first_human_turn = 1
    return s


def test_begin_after_a_game_keeps_the_run_memory(game):
    """No writer in the Begin path (ovl57, ovl61:0000(x, 1), ovl53:0000) for the path cache,
    the battle arrays, the selection words, the caches or DS:16a6; ovl53 nulls only the
    selection pointers and sets owner / x / y of every army record."""
    s = old_game(game)
    SL.new_game(s)
    run = SL.run_part(s)
    b = begin(game, run)
    fresh = begin(game)
    assert b.path_cache == s.path_cache and any(p.valid for p in b.path_cache)
    assert fresh.path_cache == cleared_path_cache()
    assert b.battle_work == s.battle_work != fresh.battle_work
    assert (b.selection.count, b.selection.mask, b.selection.next_ref) == (3, 8, (5, 6))
    assert (b.selection.selected, b.selection.hero, b.selection.moving) == (-1, -1, [])
    assert b.reveal_at_first_human_turn == 1 and fresh.reveal_at_first_human_turn == 0
    assert (b.income_cache, b.upkeep_cache, b.city_counts) == (s.income_cache, s.upkeep_cache, s.city_counts)
    assert b.production_report is s.production_report
    assert b.ai.proc is s.ai.proc and b.army_types == s.army_types
    assert b.overview_mountain_rolls == fresh.overview_mountain_rolls      # the loader's 232b
    assert b.hash() != fresh.hash()


def test_begin_keeps_the_army_records_but_owner_and_position(game):
    s = old_game(game)
    from dataclasses import replace
    s.armies += [replace(s.armies[0], id=i, type_id=3, strength=5, owner=7, x=-1, y=-1)
                 for i in range(len(s.armies), 90)]   # in transit in the old game
    for a in s.armies:
        a.order |= 0x30                              # task-force bits: 0b62:0309 keeps them
    olds = [(a.type_id, a.strength, a.order) for a in s.armies]
    b = begin(game, SL.run_part(s))
    assert len(b.armies) >= len(s.armies)
    garrison = {a.id for a in b.armies if a.owner != FREE}
    for a in b.armies[:len(s.armies)]:
        if a.id in garrison:
            assert a.order & 0x30 == 0x30            # reused record: bits 4-7 of the old game
        else:
            assert (a.owner, a.x, a.y) == (FREE, -1, -1)
            assert (a.type_id, a.strength, a.order) == olds[a.id]
    assert 0 < len(garrison) < 90 and len(b.armies) == 90


def test_first_begin_of_a_run_is_unchanged_by_the_carry_code(game):
    a, b = begin(game), begin(game, None)
    assert a.hash() == b.hash() and a.path_cache == cleared_path_cache() and a.dist_table
    assert (a.selection, a.battle_work) == (type(a.selection)(), type(a.battle_work)())


def test_begin_sets_ds16a6_only_with_hidden_map_and_one_human(game):
    from warlords2.model.options import GameOptions
    s = old_game(game)
    s.reveal_at_first_human_turn = 0
    b = begin(game, SL.run_part(s), options=GameOptions(hidden_map=1))
    assert b.reveal_at_first_human_turn == 1


def test_random_map_games_are_refused_until_m11(game):
    st = scenario_state(game, "TUTORIA")
    st.flags[0x120] = 1
    with pytest.raises(NotImplementedError):
        SL.saved_part(st, record(game))


def test_load_without_ai_read_leaves_ds0832_set(game):
    s = mid_turn(game)
    res = SL.load(file_of(s, record(game)), SL.fresh_run_part(Rng(1), s.army_types),
                  where="game_start")
    assert res.state.ai.allocated == 1
