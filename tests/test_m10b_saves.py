"""M10b package P: the slot table, the save files and the load sequence of `persist.saves`
(ovl49:0e25 / 0e5f / 0f4c / 093b / 0995 / 0a46 / 026b / 02d3 / 0414), through real files in a
temporary user directory.  The engine transform itself is tests/engine/test_saveload.py's."""
import json
import os
import sys

import pytest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "engine"))

from movekit import _cards, scenario_state  # noqa: E402
from test_saveload import Tally, mid_turn, play, record, reference_load  # noqa: E402

from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.model.state import SCN_TERRAIN_SET, cleared_path_cache  # noqa: E402
from warlords2.persist import saves as PS  # noqa: E402
from warlords2.persist.userdir import UserDir  # noqa: E402
from warlords2.rules import saveload as SL  # noqa: E402
from warlords2.rules.constants import allowing_unverified  # noqa: E402

pytestmark = pytest.mark.gamedata

SCN_LOADED = 0x130


@pytest.fixture
def user(tmp_path, game):
    return UserDir(tmp_path / "user", game)


def saves(user, game, policy=None):
    return PS.Saves(user, GameDir(game), policy=policy)


def game_table(game):
    sv = GameDir(game)
    return PS.SlotTable.from_bytes(sv.path("DATA/SAVEINFO.DAT").read_bytes())


def in_game(game, state, rec):
    c = PS.RunCarry()
    c.enter(state, rec)
    return c


def finish(sv, res, where="game"):
    with allowing_unverified():
        sv.finish_load(res, where)
    return res.state


# ------------------------------------------------------------------------- the slot table


def test_slot_lines_are_the_exe_format_and_swap_spaces():
    t = PS.SlotTable()
    t.used[3], t.desc[3] = True, "ab c_d"
    data = t.to_bytes()
    lines = data.split(b"\n\r")
    assert lines[3] == b"107ab_c_d" and lines[0] == b"001" and len(lines) == 11 and lines[10] == b""
    back = PS.SlotTable.from_bytes(data)
    assert back.used == t.used
    assert back.desc[3] == "ab c d"            # a typed '_' comes back as a space (0f03)
    assert back.desc[:3] == [""] * 3


def test_the_games_slot_file_parses_and_rewrites_identically(game):
    raw = GameDir(game).path("DATA/SAVEINFO.DAT").read_bytes()
    t = PS.SlotTable.from_bytes(raw)
    assert len(t.desc) == PS.N_SLOTS and all(len(d) < PS.DESC_BUF for d in t.desc)
    assert t.to_bytes() == raw
    assert t.any_used() == sum(1 for line in raw.split(b"\n\r") if line[:1] == b"1")


@pytest.mark.parametrize("policy", PS.SEED_POLICIES)
def test_seed_policies_x46(user, game, policy):
    g = game_table(game)
    blank = next(d for u, d in zip(g.used, g.desc) if not u)
    if policy == "copy_if_file":
        p = user.path("SAVE/SAVE1.DAT")
        p.write_text("{}")
    t = saves(user, game, policy).table
    if policy == "copy":
        assert t == g and t.any_used() == g.any_used() > 0
    elif policy == "copy_if_file":
        assert t.desc == g.desc and t.used == [i == 1 and g.used[1] for i in range(10)]
    else:
        assert t == PS.SlotTable(desc=[blank] * 10) and t.any_used() == 0
    assert not (user.root / "DATA").exists()      # nothing written before a save


def test_default_policy_is_pending_empty():
    assert PS.SEED_POLICY == "empty"


def test_user_table_wins_over_the_seed(user, game):
    t = PS.SlotTable()
    t.used[7], t.desc[7] = True, "mine"
    user.path("DATA/SAVEINFO.DAT").write_bytes(t.to_bytes())
    assert saves(user, game, "copy").table == t


# ------------------------------------------------------------------------- save


def test_save_writes_the_table_then_the_file_and_round_trips(user, game):
    s = mid_turn(game)
    rec = record(game)
    sv = saves(user, game)
    carry = in_game(game, s, rec)
    names, first = sv.save_list(carry)
    assert names == sv.table.desc and first == 0 and carry.names == names
    assert sv.choose_save(carry, 4) == sv.table.desc[4]
    assert (carry.slot, carry.row) == (4, 4)
    before = s.hash()
    assert sv.write_game(carry, "first save", s)
    assert s.hash() == before                          # the save changes no game state
    assert sv.game_path(4).name == "SAVE4.DAT"
    assert sv.read_game(4) == json.loads(json.dumps(SL.saved_part(s, rec)))
    again = saves(user, game)                          # the next start-up reads the table
    assert again.table.used == [i == 4 for i in range(10)] and again.table.desc[4] == "first save"
    assert again.any_used() == 1


def test_failed_open_on_save_keeps_the_slot_marked(user, game):
    """0a46 writes the table before it opens the file: a failed open leaves the slot used."""
    s = scenario_state(game, "TUTORIA")
    sv = saves(user, game)
    carry = in_game(game, s, record(game))
    user.path("SAVE").write_text("")                    # a file where the directory goes
    sv.choose_save(carry, 2)
    assert sv.write_game(carry, "lost", s) is False
    t = saves(user, game).table
    assert t.used[2] and t.desc[2] == "lost" and t.any_used() == 1
    assert sv.read_game(2) is None


def test_save_refuses_a_pending_question_before_writing(user, game):
    s = scenario_state(game, "TUTORIA")
    s.pending = object()
    sv = saves(user, game)
    carry = in_game(game, s, record(game))
    sv.choose_save(carry, 1)
    with pytest.raises(ValueError):
        sv.write_game(carry, "x", s)
    assert not sv.table.used[1] and not (user.root / "DATA").exists()
    assert not sv.game_path(1).exists()


def test_cancel_of_the_save_list_keeps_the_words(user, game):
    sv = saves(user, game)
    carry = PS.RunCarry(slot=3, row=3)
    assert sv.choose_save(carry, -1) is None and (carry.slot, carry.row) == (3, 3)


# ------------------------------------------------------------------------- load


def test_same_run_load_through_files_is_the_load_transform(user, game):
    s = mid_turn(game)
    rec = record(game)
    ref = reference_load(s)
    sv = saves(user, game)
    carry = in_game(game, s.copy(), rec)
    live = carry.game
    sv.choose_save(carry, 0)
    sv.write_game(carry, "a", live)
    count, first = sv.load_list(carry)
    assert (count, first) == (1, 0)
    n = sv.choose_load(carry, 0)
    res = sv.load_game(carry, n, where="game")
    st = finish(sv, res)
    assert not res.rebuilt and st.hash() == ref.hash()
    assert carry.game is st and carry.record == rec
    assert st.rng is live.rng and st.ai.proc is live.ai.proc
    assert st.production_report is live.production_report
    assert play(st, 9, 30) == play(ref, 9, 30)


def test_load_list_uses_the_entry_as_the_slot_d1(user, game):
    """X45: used slots 1 and 2; the second row shows slot 2's description but opens SAVE1, the
    first row opens SAVE0 (missing: the failed open)."""
    a = scenario_state(game, "TUTORIA", seed=1)
    b = mid_turn(game)
    rec = record(game)
    sv = saves(user, game)
    carry = in_game(game, a, rec)
    sv.choose_save(carry, 1)
    sv.write_game(carry, "game a", a)
    sv.choose_save(carry, 2)
    sv.write_game(carry, "game b", b)
    count, first = sv.load_list(carry)
    assert count == 2 and first == 2                   # DS:128e as the Save list left it
    assert [carry.name(e) for e in range(count)] == ["game a", "game b"]
    n = sv.choose_load(carry, 1)
    assert n == 1 and (carry.slot, carry.row) == (1, 1)
    res = sv.load_game(carry, n)
    st = finish(sv, res)
    assert st.players[0].gold == a.players[0].gold and st.turn == a.turn
    assert st.hash() == reference_load(a).hash()
    assert sv.read_game(sv.choose_load(carry, 0)) is None


def test_stale_rows_show_the_save_lists_names(user, game):
    sv = saves(user, game, "copy")
    carry = PS.RunCarry()
    sv.save_list(carry)
    sv.table.used = [i in (6, 8) for i in range(10)]
    sv.table.desc[6], sv.table.desc[8] = "six", "eight"
    count, _ = sv.load_list(carry)
    assert count == 2 and carry.names[:2] == ["six", "eight"]
    assert carry.name(5) == game_table(game).desc[5]   # left by the Save list
    assert carry.name(40) == ""
    assert sv.choose_load(carry, -1) is None


def test_failed_open_runs_on_the_live_game_d3(user, game):
    s = mid_turn(game)
    rec = record(game)
    sv = saves(user, game)
    carry = in_game(game, s, rec)
    paths = list(s.path_cache)
    rng = s.rng.state()
    res = sv.load_game(carry, 5)
    assert res.state is s and not res.rebuilt and res.record is rec
    assert all((a.owner, a.x, a.y) == (0x0F, -1, -1) for a in s.armies[:10])
    assert (s.selection.selected, s.selection.hero, s.selection.moving) == (-1, -1, [])
    assert s.flags[SCN_LOADED] == 0 and s.path_cache == paths != cleared_path_cache()
    assert s.rng.state() == rng
    finish(sv, res)
    assert carry.game is s


def test_failed_open_without_a_game_raises_before_anything(user, game):
    sv = saves(user, game)
    carry = PS.RunCarry()
    with pytest.raises(PS.NoGameInMemory):
        sv.load_game(carry, 0, where="game_start")
    assert carry.game is None and carry.record is None


def _fresh(sv, carry, n, seed):
    from warlords2.model.ai import AiProcess
    proc = AiProcess()
    return sv.load_game(carry, n, where="game_start", rng=Tally(seed), process=proc,
                        advisor={"advisor_groups": {3: 2}}), proc


def test_fresh_run_load_draws_the_ai_then_the_overview(user, game):
    s = mid_turn(game)
    rec = record(game)
    sv = saves(user, game)
    sv.choose_save(in_game(game, s, rec), 0)
    sv.write_game(in_game(game, s, rec), "x", s)
    res, proc = _fresh(sv, PS.RunCarry(), 0, 77)
    st = res.state
    calls = st.rng.calls
    probe = SL.merge(sv.read_game(0), SL.fresh_run_part(Tally(77), s.army_types))
    from warlords2.ai.cards import setup_all
    probe.ai.blocks = [type(b)() for b in probe.ai.blocks]
    setup_all(probe, _cards(game))
    n_ai = len(probe.rng.calls)
    assert res.rebuilt and n_ai > 0
    assert calls[:n_ai] == probe.rng.calls and calls[n_ai:] == [(1, 3, 1)] * 256
    assert st.ai.proc is proc and proc.allocated == 1
    assert st.army_types == s.army_types and st.advisor_groups == {3: 2}
    assert len(st.production_report) == 0 and st.dist_table == []
    finish(sv, res, "game_start")
    res2, _ = _fresh(sv, PS.RunCarry(), 0, 77)
    finish(sv, res2, "game_start")
    assert st.hash() == res2.state.hash()


def test_same_run_load_from_the_game_start_screen(user, game):
    """A run that had a game (carry.game): no AI dice (DS:0832 set), the 256 overview dice."""
    s = mid_turn(game)
    rec = record(game)
    sv = saves(user, game)
    carry = in_game(game, s.copy(), rec)
    carry.game.rng = Tally(5)
    sv.choose_save(carry, 0)
    sv.write_game(carry, "x", s)
    res = sv.load_game(carry, 0, where="game_start")
    assert res.rebuilt and res.state.rng.calls == [(1, 3, 1)] * 256


def test_fresh_run_army_types_use_the_saved_terrain_set(user, game):
    s = scenario_state(game, "TUTORIA")
    rec = record(game)
    sv = saves(user, game)
    saved = SL.saved_part(s, rec)
    assert sv.army_types(saved) == s.army_types
    saved["state"]["flags"][str(SCN_TERRAIN_SET)] = 1
    with pytest.raises(FileNotFoundError, match="TERRAIN1"):
        sv.army_types(saved)


def test_foreign_file_is_refused(user, game):
    sv = saves(user, game)
    user.path("SAVE/SAVE3.DAT").write_text(json.dumps({"envelope": 99}))
    with pytest.raises(ValueError):
        sv.read_game(3)


# ------------------------------------------------------------------------- review fixes


def test_length_field_is_read_as_sscanf_d():
    """0e5f: sscanf "%d" of the two bytes (junk after the digits ignored, a sign, leading
    blanks); n + 1 bytes over the buffer, the NUL at buf[n - 1] when it lies inside."""
    t = PS.SlotTable.from_bytes(b"103ab\n\r15xabcd\n\r1 3ab\n\r000Z0-1")
    assert t.desc[:5] == ["ab", "abcd", "ab", "Z0", "-1"]
    assert t.used[:5] == [True, True, True, False, False]


def test_unreadable_length_keeps_the_previous_n_and_n_below_minus_one_stops():
    t = PS.SlotTable.from_bytes(b"103ab\n\r1xxcd\n\r1-5ef")
    assert t.desc[:3] == ["ab", "cd", ""] and t.used[:3] == [True, True, False]


def test_description_longer_than_the_editor_allows_is_refused(user, game):
    s = scenario_state(game, "TUTORIA")
    sv = saves(user, game)
    carry = in_game(game, s, record(game))
    sv.choose_save(carry, 1)
    with pytest.raises(ValueError):
        sv.write_game(carry, "x" * 15, s)
    assert not sv.table.used[1] and not (user.root / "DATA").exists()
    assert sv.write_game(carry, "x" * 14, s)
    assert saves(user, game).table.desc[1] == "x" * 14


@pytest.mark.parametrize("text", ["", "{", '{"envelope": 1}', '{"envelope": 1, "saved": 3}',
                                  '{"envelope": 1, "saved": {}}', "[1]"])
def test_malformed_files_raise_value_error(user, game, text):
    sv = saves(user, game)
    user.path("SAVE/SAVE3.DAT").write_text(text)
    with pytest.raises(ValueError):
        sv.read_game(3)


def test_non_utf8_file_raises_value_error(user, game):
    sv = saves(user, game)
    user.path("SAVE/SAVE3.DAT").write_bytes(b"\xff\xfe\x00")
    with pytest.raises(ValueError):
        sv.read_game(3)


@pytest.mark.parametrize("n", [-2, 10])
def test_numbers_outside_the_slots_are_refused(user, game, n):
    sv = saves(user, game)
    user.path("SAVE/SAVE9.DAT").write_text("{}")       # -1 must not wrap to SAVE9
    carry = PS.RunCarry()
    with pytest.raises(ValueError):
        sv.choose_load(carry, n)
    with pytest.raises(ValueError):
        sv.read_game(n)
    with pytest.raises(ValueError):
        sv.read_game(-1)
    if n > 0:
        with pytest.raises(ValueError):
            sv.choose_save(carry, n)
    assert (carry.slot, carry.row) == (0, 0)


def test_same_run_load_refuses_another_dice_stream(user, game):
    from warlords2.rules.rng import Rng
    s = scenario_state(game, "TUTORIA")
    sv = saves(user, game)
    carry = in_game(game, s, record(game))
    sv.choose_save(carry, 0)
    sv.write_game(carry, "x", s)
    with pytest.raises(ValueError):
        sv.load_game(carry, 0, rng=Rng(1))
    assert carry.game is s
    res = sv.load_game(carry, 0, rng=s.rng)
    assert res.state.rng is s.rng
