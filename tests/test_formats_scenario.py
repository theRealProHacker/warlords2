"""Scenario/map format tests (warlords2.formats.scenario and the tools/dump_scenario.py
CLI) against the user's local Warlords II copy.

Needs the game data (`gamedata` marker, tests/conftest.py).
"""
import importlib.util
import struct
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parent.parent

pytestmark = pytest.mark.gamedata

_spec = importlib.util.spec_from_file_location("dump_scenario", ROOT / "tools" / "dump_scenario.py")
dump_scenario = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(dump_scenario)

from warlords2.formats import scenario as ds  # noqa: E402
from warlords2.formats.gamedir import GameDir  # noqa: E402
from warlords2.formats.tables import parse_armytypes  # noqa: E402

BUNDLED = ["TUTORIA", "DRAGON", "SORCERY", "ERYTHEA", "HADESHA", "ISLADIA"]
ALL = BUNDLED + ["RANDOM"]


@pytest.fixture(scope="module")
def root(game):
    return Path(game)


@pytest.fixture(scope="module")
def scenarios(root):
    return {n: ds.load_scenario(GameDir(root), n) for n in ALL}


@pytest.fixture(scope="module")
def armytype(root):
    return parse_armytypes((root / "TERRAIN0" / "ARMYTYPE.DAT").read_bytes())


@pytest.mark.parametrize("name", ALL)
def test_fixed_file_sizes(root, name):
    d = root / name
    assert (d / f"{name}.MAP").stat().st_size == ds.MAP_SIZE == 112 * 156 * 2
    assert (d / f"{name}.RD").stat().st_size == ds.RD_SIZE == 112 * 156
    assert (d / f"{name}.SCN").stat().st_size == ds.SCN_SIZE
    # SCN regions tile the file exactly: the city table ends at EOF.
    assert 0x157D + 100 * 65 == ds.SCN_SIZE
    assert 0x811 + 40 * 31 == 0xCE9 and 0xCE9 + 22 * 29 == 0xF67
    assert 0xF67 + 10 * 16 == 0x1007 and 0x183 + 8 * 20 == 0x223
    assert 0x60B + 9 * 29 == 0x710 and 0x710 + 255 == 0x80F


@pytest.mark.parametrize("name", ALL)
def test_text_files_consumed_exactly(name, scenarios):
    sc = scenarios[name]
    for ext in ("CTY", "SPC"):
        used, size = sc["consumed"][ext]
        assert used == size
    # parse_sgn / parse_itm raise unless count*record == file size
    assert len(sc["items"]) == 39
    assert [e["index"] for e in sc["city_descriptions"]] == list(range(len(sc["city_descriptions"])))
    assert [e["index"] for e in sc["site_descriptions"]] == list(range(len(sc["site_descriptions"])))


@pytest.mark.parametrize("name", ALL)
def test_cities_match_map(name, scenarios):
    sc = scenarios[name]
    scn, tiles, terrain = sc["scn"], sc["_raw"]["tiles"], sc["_raw"]["terrain"]
    assert 0 < scn["city_count"] <= 100
    assert len(scn["cities"]) == scn["city_count"]
    covered = set()
    for c in scn["cities"]:
        assert c["name"] and 0 <= c["x"] < 111 and 0 <= c["y"] < 155
        tl = tiles[c["y"] * 112 + c["x"]] & 0xFF
        assert tl in ds.CITY_TL_TILES, (c["name"], tl)
        block = [tiles[(c["y"] + dy) * 112 + c["x"] + dx] & 0xFF for dy in (0, 1) for dx in (0, 1)]
        assert block == [tl, tl + 1, tl + 16, tl + 17]
        for dy in (0, 1):
            for dx in (0, 1):
                covered.add((c["y"] + dy) * 112 + c["x"] + dx)
        assert c["owner"] == ds.NEUTRAL or name == "TUTORIA" or c["owner"] < 8
        assert len(c["production"]) <= 4          # one HADESHA city produces nothing
        assert c["runtime_tail_hex"].strip("0") == ""
        if tl != 96:                                # coloured block = that player's capital
            assert c["map_tile_owner"] == c["capital_of"]
    # every city-terrain tile on the map belongs to exactly one listed city
    assert covered == {i for i, t in enumerate(terrain) if t == 10}
    assert len(covered) == 4 * scn["city_count"]
    # descriptions: one per city
    assert len(sc["city_descriptions"]) == scn["city_count"]


@pytest.mark.parametrize("name", ALL)
def test_sites_signs_ports_match_map(name, scenarios):
    sc = scenarios[name]
    scn, tiles, terrain = sc["scn"], sc["_raw"]["tiles"], sc["_raw"]["terrain"]
    assert len(scn["sites"]) == scn["site_count"] <= 40
    site_pos = set()
    for s in scn["sites"]:
        assert s["type"] in (1, 2) and s["name"]
        i = s["y"] * 112 + s["x"]
        assert tiles[i] & 0xFF in (10, 11, 12) and terrain[i] == 11
        site_pos.add(i)
    assert site_pos == {i for i, t in enumerate(tiles) if t & 0xFF in (10, 11, 12)}
    sign_pos = {g["y"] * 112 + g["x"] for g in sc["signs"]}
    assert sign_pos == {i for i, t in enumerate(tiles) if t & 0xFF == 0}
    assert len(sign_pos) == len(sc["signs"])
    for p in sc["ports"]:
        assert terrain[p["y"] * 112 + p["x"]] == 3      # ports are flagged shore tiles
    assert all(t >> 8 in (0, 0x80) for t in tiles)
    assert len(sc["site_descriptions"]) >= scn["site_count"]


@pytest.mark.parametrize("name", ALL)
def test_map_tiles_and_roads(name, scenarios):
    sc = scenarios[name]
    tiles, roads, terrain = sc["_raw"]["tiles"], sc["_raw"]["roads"], sc["_raw"]["terrain"]
    assert len(tiles) == len(roads) == 17472
    assert max(t & 0xFF for t in tiles) <= 152
    assert set(roads) <= set(range(18))
    assert set(terrain) <= set(range(1, 12))
    # the outer ring of every world is sea (terrain 2 water / 3 shore)
    assert sum(1 for t in terrain if t in (2, 3)) > 1000
    for i, v in enumerate(roads):
        if v:
            assert terrain[i] in (4, 5, 6, 7, 8), "roads only on passable land"
    # bridges are map tiles, never road-layer entries
    assert all(roads[i] == 0 for i, t in enumerate(terrain) if t == 1)


@pytest.mark.parametrize("name", ALL)
def test_players_and_capitals(name, scenarios):
    scn = scenarios[name]["scn"]
    city_pos = {(c["x"], c["y"]) for c in scn["cities"]}
    active = [p for p in scn["players"] if p["active"]]
    assert len(active) >= 2
    for p in scn["players"]:
        assert p["id"] == p["index"] == p["turn_order"]
        assert sorted(p["fight_order"]) == list(range(29))
        if p["active"]:
            assert (p["capital_x"], p["capital_y"]) in city_pos
            assert p["name"] != "Not Used"
    assert sorted(scn["neutral_fight_order"]) == list(range(29))
    assert len({c["capital_of"] for c in scn["cities"]} - {None}) == len(active)
    assert scn["runtime_nonzero"] == {"223_60b": 0, "101b_157b": 0}
    assert scn["monsters"][0]["name"] == "" and all(m["name"] for m in scn["monsters"][1:])


def test_scenario_dat_agrees_with_scn(root, scenarios):
    recs = ds.parse_scenario_dat((root / "DATA" / "SCENARIO.DAT").read_bytes())
    assert GameDir(root).scenarios() == recs
    assert [r["dir"].upper() for r in recs] == BUNDLED
    for r in recs:
        scn = scenarios[r["dir"].upper()]["scn"]
        assert r["cities"] == scn["city_count"]
        assert r["sites"] == scn["site_count"]
        assert r["players"] == sum(1 for p in scn["players"] if p["active"])


def test_item_table_and_itm(scenarios):
    for name in ALL:
        sc = scenarios[name]
        table = sc["scn"]["item_table"]
        assert [i["type"] for i in table[:8]] == [8] * 8      # eight standards
        itm = {i["name"]: (i["type"], i["bonus"]) for i in sc["items"]}
        for i in table[8:]:
            assert itm[i["name"]] == (i["type"], i["bonus"])


def test_production_ids_are_army_ids(scenarios, armytype):
    by_id = {a["type_id"]: a for a in armytype}
    assert sorted(by_id) == list(range(29))
    for name in ALL:
        for c in scenarios[name]["scn"]["cities"]:
            for p in c["production"]:
                assert p["army_id"] in by_id and p["army_id"] != 28   # 28 = Hero
    # the generated RANDOM scenario copies stats from ARMYTYPE.DAT almost verbatim
    hit = tot = 0
    for c in scenarios["RANDOM"]["scn"]["cities"]:
        for p in c["production"]:
            a = by_id[p["army_id"]]
            tot += 1
            hit += all(p[k] == a[k] for k in ("strength", "turns", "cost", "moves"))
    assert hit / tot > 0.9


def test_shared_data_files(root):
    g = dump_scenario.load_globals(root)
    assert len(g["scenario_dat"]) == 6
    assert len(g["saveinfo"]) == 10 and len(g["mapinfo"]) == 5
    assert g["terrain_dat"][0]["label"].startswith("Terrain type")
    assert len(g["udb"]) == 21
    assert g["current_hst"]["size_matches_file"]
    assert g["current_sgn"] == ds.parse_sgn((root / "RANDOM" / "RANDOM.SGN").read_bytes())


def test_saved_random_map_consumed_exactly(root):
    raw = (root / "SAVE" / "RMAPTEMP.DAT").read_bytes()
    s = ds.parse_saved_map(raw)
    assert s["consumed"] == len(raw)
    assert len(s["blocks"]) == 2
    assert s["map"] == ds.parse_map((root / "RANDOM" / "RANDOM.MAP").read_bytes())
    assert s["rd"] == ds.parse_rd((root / "RANDOM" / "RANDOM.RD").read_bytes())
    assert s["scn"]["city_count"] == s["header"]["cities"] == 80
    assert s["signs"] is not None
    # second block is a history blob that starts with its own length, like CURRENT.HST
    b = s["blocks"][1]
    assert struct.unpack_from("<I", raw, b["offset"] + 4)[0] == b["length"]
