"""M11 package P: the RANDOM overlay (`persist.randomdir`, register X55) and the map slots,
RMAPTEMP and the map files of `persist.maps` (ovl49:0d61 / 0e42 / 1029 / 1116 / 11f3 / 1214 /
128a / 12f2 / 13c2 / 1463), through real files in a temporary user directory, plus the
random-game save / load write-back wired into `persist.saves`.

The RANDOM.* and text bytes written here are made up (no game data in tracked files)."""
import json
import os
import struct
import sys

import pytest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "engine"))

from test_saveload import Tally, mid_turn, record  # noqa: E402

from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.formats.scenario import parse_sgn  # noqa: E402
from warlords2.model.ai import AiProcess  # noqa: E402
from warlords2.persist import maps as PM  # noqa: E402
from warlords2.persist import randomdir as RD  # noqa: E402
from warlords2.persist import saves as PS  # noqa: E402
from warlords2.persist.userdir import UserDir  # noqa: E402
from warlords2.rules import descriptions as D  # noqa: E402
from warlords2.rules import saveload as SL  # noqa: E402
from warlords2.rules.constants import allowing_unverified  # noqa: E402

pytestmark = pytest.mark.gamedata

RANDOM, LOADED = 0x120, 0x130
TEXTS = {"SPC": b"#001|made up|site|\r\n\x00\xff", "CTY": b"#000|made up|city|x|\r\n\x01"}


def sgn(*signs):
    out = struct.pack("<H", len(signs))
    for x, y, a, b in signs:
        out += struct.pack("<HH", x, y) + a.ljust(50, b"\0") + b.ljust(50, b"\0")
    return out


GENERATED = {"SGN": sgn((3, 4, b"aa", b"bb")), "MAP": b"\x01\x02" * 8, "RD": b"\x03" * 5,
             "CTY": TEXTS["CTY"], "SPC": TEXTS["SPC"], "SCN": b"\x07" * 9}


def jsonish(d):
    return json.loads(json.dumps(d))


@pytest.fixture
def user(tmp_path, game):
    return UserDir(tmp_path / "user", game)


@pytest.fixture
def gd(game):
    return GameDir(game)                           # one per test: the overlay is per instance


@pytest.fixture
def rd(user, gd):
    r = RD.RandomDir(user, gd)
    r.attach()
    return r


@pytest.fixture(scope="module")
def base(game):
    """A run's last game (mid-turn, SCN 0x120 = 0, as at 11f3) and its record."""
    return mid_turn(game), record(game)


def game_bytes(game, rel):
    return GameDir(game).read(rel)


def maps(user, gd, policy=None, **kw):
    return PM.Maps(user, gd, policy=policy, **kw)


def carry_of(state, rec):
    c = PS.RunCarry()
    c.enter(state, rec)
    return c


# ------------------------------------------------------------------------- the overlay


def test_overlay_serves_nothing_until_written(user, gd, rd, game):
    for name, rel in rd.rels.items():
        assert rd.serve(rel) is None
        assert gd.read(rel) == game_bytes(game, rel)
        assert rd.read(name) == game_bytes(game, rel)
    assert not (user.root / "RANDOM").exists()


def test_overlay_wins_for_every_reader_spelling(user, gd, rd, game):
    assert rd.write_files(GENERATED) == []
    for name, data in GENERATED.items():
        p = rd.user_path(name)
        assert p.read_bytes() == data
        for rel in (rd.rels[name], rd.rels[name].lower(), "random\\\\random." + name.lower(),
                    "./Random/Random." + name.capitalize()):
            assert gd.path(rel) == p and gd.read(rel) == data
    for other in ("RANDOM/RANDOM.ITM", "RANDOM/RANDOM.DAT", "ERYTHEA/ERYTHEA.SCN", "DATA/FILE.DAT"):
        assert gd.read(other) == game_bytes(game, other)  # never served
    assert gd.path("RANDOM").is_dir() and gd.path("RANDOM") != user.root / "RANDOM"


def test_overlay_falls_through_per_file(user, gd, rd, game):
    """A random-game load writes only SPC / CTY: the other four stay the game's."""
    rd.write_texts({"CTY": TEXTS["CTY"]})
    assert gd.read("RANDOM/RANDOM.CTY") == TEXTS["CTY"]
    assert gd.read("RANDOM/RANDOM.SPC") == game_bytes(game, "RANDOM/RANDOM.SPC")
    assert rd.texts() == {"SPC": game_bytes(game, "RANDOM/RANDOM.SPC"), "CTY": TEXTS["CTY"]}
    assert list(rd.texts()) == ["SPC", "CTY"]


def test_overlay_is_off_without_attach(user, game):
    g = GameDir(game)
    r = RD.RandomDir(user, g)
    r.write_files(GENERATED)
    assert g.read("RANDOM/RANDOM.SCN") == game_bytes(game, "RANDOM/RANDOM.SCN")
    assert r.read("SCN") == GENERATED["SCN"]           # its own reads see the user's file
    r.attach()
    assert g.read("RANDOM/RANDOM.SCN") == GENERATED["SCN"]


def test_write_files_order_and_failures(user, gd, rd, monkeypatch):
    order = []
    real = RD.RandomDir._write
    monkeypatch.setattr(RD.RandomDir, "_write", lambda self, n, d: order.append(n) or real(self, n, d))
    rd.write_files(dict(reversed(list(GENERATED.items()))))
    assert order == ["SGN", "MAP", "RD", "CTY", "SPC", "SCN"]  # ovl09's order (prep §2.4)
    with pytest.raises(KeyError):
        rd.write_files({"ITM": b""})


def failing(monkeypatch, bad):
    """`_write` fails for the names in `bad`; returns the names written, in order."""
    done = []
    real = RD.RandomDir._write

    def w(self, n, d):
        if n in bad:
            return False
        done.append(n)
        return real(self, n, d)
    monkeypatch.setattr(RD.RandomDir, "_write", w)
    return done


@pytest.mark.parametrize("bad", ["MAP", "RD", "CTY", "SPC"])
def test_failed_create_of_map_rd_cty_spc_ends_the_run(user, gd, rd, monkeypatch, bad):
    """ovl09:027c -> ovl52:0000 (exit): the files after it are never written."""
    done = failing(monkeypatch, {bad})
    with pytest.raises(RD.FatalCreate) as e:
        rd.write_files(GENERATED)
    order = ["SGN", "MAP", "RD", "CTY", "SPC", "SCN"]
    assert done == order[:order.index(bad)]
    assert (e.value.name, e.value.error) == (bad, (1, 0))
    assert e.value.file == rd.names[bad] and e.value.file.upper().endswith("RANDOM." + bad)


def test_failed_create_of_scn_prints_and_of_sgn_is_silent(user, gd, rd, monkeypatch):
    done = failing(monkeypatch, {"SGN", "SCN"})
    assert rd.write_files(GENERATED) == [((0, 0), rd.names["SCN"])]
    assert done == ["MAP", "RD", "CTY", "SPC"]


def test_failed_create_of_sgn_alone_says_nothing(user, gd, rd, monkeypatch):
    done = failing(monkeypatch, {"SGN"})
    assert rd.write_files(GENERATED) == [] and done == ["MAP", "RD", "CTY", "SPC", "SCN"]


def test_failed_create_keeps_the_user_file(user, gd, rd, game):
    user.path("RANDOM").write_text("")                # a file where the directory goes
    with pytest.raises(RD.FatalCreate):
        rd.write_files(GENERATED)
    assert rd.write_files({"SGN": GENERATED["SGN"], "SCN": GENERATED["SCN"]}) == [((0, 0), rd.names["SCN"])]
    assert rd.write_texts(TEXTS) == ["SPC", "CTY"]
    assert gd.read("RANDOM/RANDOM.SCN") == game_bytes(game, "RANDOM/RANDOM.SCN")


def test_signs_come_from_the_overlay_x63(user, gd, rd, game):
    assert rd.signs() == parse_sgn(game_bytes(game, "RANDOM/RANDOM.SGN"))
    rd.write_files({"SGN": GENERATED["SGN"]})
    assert [(s["x"], s["y"], s["line1"], s["line2"]) for s in rd.signs()] == [(3, 4, "aa", "bb")]


def test_texts_missing_refuse_the_save_x65(user, game, tmp_path):
    r = RD.RandomDir(user, GameDir(game))
    r.gd = GameDir(tmp_path / "nogame")                # a game copy without RANDOM.SPC / .CTY
    with pytest.raises(ValueError):
        r.texts()
    r._write("SPC", b"s")
    r._write("CTY", b"c")
    assert r.texts() == {"SPC": b"s", "CTY": b"c"}


# ------------------------------------------------------------------------- the slot table


def game_table(game):
    return PS.SlotTable.from_bytes(game_bytes(game, "DATA/MAPINFO.DAT"))


@pytest.mark.parametrize("policy", PS.SEED_POLICIES)
def test_map_seed_policies_x57(user, gd, game, policy):
    g = game_table(game)
    blank = next(d for u, d in zip(g.used, g.desc) if not u)
    if policy == "copy_if_file":
        user.path("SAVE/RMAP1.DAT").write_text("{}")
    t = maps(user, gd, policy).table
    if policy == "empty":
        assert t == PS.SlotTable(desc=[blank] * 10)
    else:
        assert t.desc == g.desc and t.used == [False] * 10    # the game's lines are all unused
    if policy == "copy":                               # 1029 past the 5 lines: slot 4's leftovers
        assert t.desc[5:] == [g.desc[4][:2]] * 5 and len(g.desc[4]) > 2
    assert t.any_used() == 0 and not (user.root / "DATA").exists()


def test_short_table_keeps_the_stack_leftovers():
    """0e5f / 1029 at the end of the file: bp-5, bp-4 and the buffer keep the last line's
    values ('_' already turned into ' '), the NUL at buf[2] cuts the text, n stays."""
    t = PS.SlotTable.from_bytes(b"003ab\r\n010Abc_Defgh\r\n")
    assert t.desc == ["ab", "Abc Defgh"] + ["Ab"] * 8 and t.used == [False] * 10
    t = PS.SlotTable.from_bytes(b"106Ab_cd\r\n")
    assert t.desc == ["Ab cd"] + ["Ab"] * 9 and t.used == [True] * 10
    t = PS.SlotTable.from_bytes(b"106Ab_cd\r\n0")       # a slot read in part: its own byte
    assert t.used == [True, False] + [False] * 8 and t.desc[1] == "Ab"
    assert PS.SlotTable.from_bytes(b"") == PS.SlotTable()


def test_default_map_policy_is_empty():
    assert PM.SEED_POLICY == "empty"


def test_map_table_is_its_own_file(user, gd, game):
    """MAPINFO.DAT (FILE.DAT (5, 0)), not SAVEINFO.DAT: a game-slot table changes nothing."""
    t = PS.SlotTable()
    t.used[2], t.desc[2] = True, "game slot"
    user.path("DATA/SAVEINFO.DAT").write_bytes(t.to_bytes())
    m = maps(user, gd)
    assert m.any_used() == 0 and m.table_rel() == "DATA/MAPINFO.DAT"
    t.used[6], t.desc[6] = True, "a map"
    user.path("DATA/MAPINFO.DAT").write_bytes(t.to_bytes())
    m = maps(user, gd, "copy")
    assert m.table == t and m.any_used() == 2


# ------------------------------------------------------------------------- RMAPTEMP and Save Map


def test_write_temp_is_the_map_part(user, gd, base):
    s, rec = base
    m = maps(user, gd)
    assert m.write_temp(s, rec)
    assert m.temp_path().name == "RMAPTEMP.DAT" and m.temp_path().parent.name == "SAVE"
    assert m.read_temp() == jsonish(SL.map_part(s, rec))
    assert m.any_used() == 0                           # 11f3 writes no slot table
    assert not (user.root / "DATA").exists()


def test_write_temp_of_a_random_state_takes_the_overlay_texts(user, gd, rd, base):
    s, rec = base
    st = s.copy()
    st.flags[RANDOM] = 1
    rd.write_texts(TEXTS)
    with pytest.raises(ValueError):
        maps(user, gd).write_temp(st, rec)             # no reader: the 0bbe test refuses
    m = maps(user, gd, random_texts=rd.texts)
    assert m.write_temp(st, rec)
    assert m.read_temp()["random_texts"] == [["SPC", TEXTS["SPC"].hex()], ["CTY", TEXTS["CTY"].hex()]]


@pytest.mark.parametrize("flags,game_start,ok", [
    ({RANDOM: 1}, False, True), ({RANDOM: 1, LOADED: 1}, False, False), ({}, False, False),
    ({RANDOM: 1}, True, False)])
def test_save_list_gate_1214(user, gd, flags, game_start, ok):
    m = maps(user, gd)
    carry = PS.RunCarry(map_row=7, names=["x"] * 12)
    got = m.save_list(carry, flags, game_start)
    if ok:
        assert got == (m.table.desc, 0)                # first row 0, not DS:1290
        assert carry.names == m.table.desc + ["x", "x"]
    else:
        assert got is None and carry.names == ["x"] * 12


def test_save_map_copies_rmaptemp_byte_for_byte(user, gd, base):
    s, rec = base
    m = maps(user, gd)
    m.write_temp(s, rec)
    carry = PS.RunCarry(map_row=0)
    assert m.choose_save(carry, -1) is None and (carry.slot, carry.map_row) == (0, 0)
    assert m.choose_save(carry, 3) == m.table.desc[3]
    assert (carry.slot, carry.map_row, carry.row) == (3, 3, 0)
    assert m.save_map(carry, "my map")
    assert m.map_path(3).name == "RMAP3.DAT"
    assert m.map_path(3).read_bytes() == m.temp_path().read_bytes()
    again = maps(user, gd)                             # the next start-up reads MAPINFO.DAT
    assert again.table.used == [i == 3 for i in range(10)] and again.table.desc[3] == "my map"
    assert again.any_used() == 1
    raw = (user.root / "DATA/MAPINFO.DAT").read_bytes()
    assert raw == again.table.to_bytes() and raw.count(b"\n\r") == 10   # 1116: all ten lines
    assert raw.split(b"\n\r")[3] == b"107my_map"


def test_save_map_without_rmaptemp_marks_the_slot_and_copies_nothing(user, gd):
    m = maps(user, gd)
    m.map_path(4).parent.mkdir(parents=True)
    m.map_path(4).write_bytes(b"old")
    carry = PS.RunCarry()
    m.choose_save(carry, 4)
    assert m.save_map(carry, "lost") is False
    assert m.map_path(4).read_bytes() == b"old"        # 0d61: a missing source opens nothing
    assert maps(user, gd).table.used[4]


def test_save_map_refuses_what_the_box_cannot_type(user, gd):
    m = maps(user, gd)
    carry = PS.RunCarry()
    m.choose_save(carry, 1)
    with pytest.raises(ValueError):
        m.save_map(carry, "x" * (PS.DESC_MAX + 1))
    assert not m.table.used[1]
    with pytest.raises(ValueError):
        m.choose_save(carry, 10)


def test_copy_file(tmp_path):
    a, b = tmp_path / "a", tmp_path / "d" / "b"
    data = bytes(range(256)) * 300                     # more than one 30000-byte chunk
    a.write_bytes(data)
    assert PM.copy_file(a, b) and b.read_bytes() == data
    assert not PM.copy_file(tmp_path / "none", b) and b.read_bytes() == data


# ------------------------------------------------------------------------- Load Map


def saved_slots(user, gd, base, slots):
    """Save Map into each slot of `slots`, each from a different RMAPTEMP (mid_turn states
    whose turn differs)."""
    s, rec = base
    m = maps(user, gd)
    carry = PS.RunCarry()
    for k, n in enumerate(slots):
        st = s.copy()
        st.flags[0x21] = 100 + k                        # a different snapshot each time
        m.write_temp(st, rec)
        m.choose_save(carry, n)
        m.save_map(carry, "map %d" % n)
    return m


def test_load_list_compacts_and_starts_at_the_map_row(user, gd, base):
    m = saved_slots(user, gd, base, [2, 5])
    carry = PS.RunCarry(map_row=1, row=4, names=["o"] * 4)
    assert m.load_list(carry) == (2, 1)                # first = DS:1290, not DS:128e
    assert carry.names == ["map 2", "map 5", "o", "o"]  # entries past the count keep their names


def test_load_map_entry_is_the_file_x57(user, gd, base):
    """Used slots 2 and 5: the row of slot 5 (entry 1) opens RMAP1, which does not exist: the
    failed open runs on the live game; entry 0 opens RMAP0 (missing too)."""
    s, rec = base
    m = saved_slots(user, gd, base, [2, 5])
    live = s.copy()
    live.rng = Tally(5)
    carry = carry_of(live, rec)
    assert m.choose_load(carry, -1) is None
    assert m.choose_load(carry, 1) == 1 and (carry.slot, carry.map_row) == (1, 1)
    assert m.read_map(1) is None and m.read_map(5) is not None
    temp = m.temp_path().read_bytes()
    res = m.load_map(carry, 1)
    assert res.state is live and live.flags.get(LOADED, 0) == 0   # 08b1: no SCN 0x130
    assert live.rng.calls == [(1, 3, 1)] * 256
    m.finish_load(res, 1)
    assert m.temp_path().read_bytes() == temp          # 0d61 from a missing RMAP1: nothing
    with pytest.raises(PS.NoGameInMemory):
        m.load_map(PS.RunCarry(), 1)


def test_load_map_is_the_engine_load_and_copies_back(user, gd, base):
    """A same-run Load Map through the files = `rules.saveload.load_map` on the snapshot; then
    0d61 RMAP<e> -> RMAPTEMP and `after_load_map`."""
    s, rec = base
    m = saved_slots(user, gd, base, [0, 6])
    saved6 = m.read_map(6)
    assert saved6["kind"] == "map" and saved6["state"]["flags"]["33"] == 101
    live = s.copy()
    ref = SL.load_map(jsonish(saved6), SL.run_part(live.copy()), live_record=rec)
    with allowing_unverified():
        SL.after_load_map(ref.state)
    carry = carry_of(live, rec)
    res = m.load_map(carry, 6)
    assert res.rebuilt and res.record == saved6["record"] and res.random_texts is None
    assert res.state.flags[LOADED] == 1
    assert carry.game is res.state and carry.record == res.record
    m.write_temp(s, rec)                               # RMAPTEMP holds something else now
    assert m.temp_path().read_bytes() != m.map_path(6).read_bytes()
    with allowing_unverified():
        m.finish_load(res, 6)
    assert m.temp_path().read_bytes() == m.map_path(6).read_bytes()
    assert res.state.hash() == ref.state.hash()


def test_fresh_run_load_map_rolls_only_the_overview(user, gd, base):
    s, rec = base
    m = saved_slots(user, gd, base, [0])
    with pytest.raises(ValueError):
        m.load_map(PS.RunCarry(), 0, rng=Tally(9), process=AiProcess())   # no `saves`
    m = maps(user, gd, saves=PS.Saves(user, gd))
    proc = AiProcess()
    res = m.load_map(PS.RunCarry(), 0, rng=Tally(9), process=proc)
    assert res.state.rng.calls == [(1, 3, 1)] * 256 and proc.allocated == 0
    assert res.state.army_types == s.army_types


def test_map_files_are_not_games_and_vice_versa(user, gd, base):
    s, rec = base
    m = maps(user, gd)
    p = m.map_path(2)
    p.parent.mkdir(parents=True)
    p.write_text(json.dumps({"envelope": PS.ENVELOPE, "saved": jsonish(SL.saved_part(s, rec))}))
    with pytest.raises(ValueError):
        m.read_map(2)
    p.write_text("not json")
    with pytest.raises(ValueError):
        m.read_map(2)
    p.write_bytes(b"\xff\xfe")
    with pytest.raises(ValueError):
        m.read_map(2)


def test_load_map_refuses_another_dice_stream(user, gd, base):
    s, rec = base
    m = saved_slots(user, gd, base, [0])
    with pytest.raises(ValueError):
        m.load_map(carry_of(s.copy(), rec), 0, rng=Tally(1))


# ------------------------------------------------------------------------- random-game save / load


def test_random_game_round_trip_writes_the_texts_back(user, gd, rd, base, game):
    """Save of a random-map game reads RANDOM.SPC / .CTY through the overlay (0bbe / 0c46);
    its load writes them back over the overlay (0728 / 07a9) and drops the description buffer
    (ovl45:1de4)."""
    s, rec = base
    st = s.copy()
    st.flags[RANDOM] = 1
    rd.write_texts(TEXTS)
    sv = PS.Saves(user, gd, random_texts=rd.texts, random_write=rd.write_texts)
    carry = carry_of(st, rec)
    sv.choose_save(carry, 2)
    assert sv.write_game(carry, "rnd", st)
    assert sv.read_game(2)["random_texts"] == [["SPC", TEXTS["SPC"].hex()], ["CTY", TEXTS["CTY"].hex()]]
    rd.write_texts({"SPC": b"newer spc", "CTY": b"newer cty"})   # a later generation
    D.load(carry.descriptions, D.CTY, lambda: b"#000|q|")
    assert carry.descriptions.kind == D.CTY
    res = sv.load_game(carry, 2)
    assert res.random_texts == TEXTS
    assert {n: gd.read(rd.rels[n]) for n in ("SPC", "CTY")} == TEXTS
    assert carry.descriptions.kind == 0 and carry.descriptions.buffer is None
    assert res.state.flags[RANDOM] == 1


def test_non_random_load_leaves_the_overlay(user, gd, rd, base):
    s, rec = base
    rd.write_texts(TEXTS)
    sv = PS.Saves(user, gd, random_texts=rd.texts, random_write=rd.write_texts)
    carry = carry_of(s.copy(), rec)
    sv.choose_save(carry, 0)
    sv.write_game(carry, "plain", s)
    assert "random_texts" not in sv.read_game(0)
    rd.write_texts({"SPC": b"a", "CTY": b"b"})
    res = sv.load_game(carry, 0)
    assert res.random_texts is None and rd.texts() == {"SPC": b"a", "CTY": b"b"}


def test_random_save_without_overlay_files_takes_the_games(user, gd, rd, base, game):
    s, rec = base
    st = s.copy()
    st.flags[RANDOM] = 1
    sv = PS.Saves(user, gd, random_texts=rd.texts, random_write=rd.write_texts)
    carry = carry_of(st, rec)
    sv.choose_save(carry, 1)
    sv.write_game(carry, "rnd", st)
    blocks = dict(sv.read_game(1)["random_texts"])
    assert blocks == {n: game_bytes(game, "RANDOM/RANDOM." + n).hex() for n in ("SPC", "CTY")}
