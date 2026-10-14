"""Tests for warlords2.formats.tables (through the tools/dump_tables.py driver) and the
tools/dump_sound.py CLI against the user's game copy.

Game text is never written here (docs/plan.md section 0): strings are checked by SHA-256
digest of their cp437 bytes, lengths and counts.
"""
import hashlib
import os
import struct
import sys
import wave

import pytest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

pytestmark = pytest.mark.gamedata

sys.path.insert(0, os.path.join(ROOT, "tools"))
import dump_sound  # noqa: E402
import dump_tables as dt  # noqa: E402

from warlords2.formats import tables as ft  # noqa: E402


def rd(game, *parts):
    return open(os.path.join(game, *parts), "rb").read()


def sha(*texts):
    """Digest of game text: the strings joined by newlines, encoded as the game stores them."""
    return hashlib.sha256("\n".join(texts).encode(ft.ENC)).hexdigest()


@pytest.fixture(scope="module")
def tables(game):
    return dt.dump_all(game)


# ----------------------------------------------------------------- army types


def test_armytype_shape(tables):
    a = tables["armytype"]
    assert len(a) == 29
    assert sorted(r["type_id"] for r in a) == list(range(29))
    assert all(len(r["raw_words"]) == 20 for r in a)
    assert sha(*(r["name"] for r in a)) == "35344c50b9b93a0992b3bf41dd2b61480cf44ba9074948469ef271b126ea934c"
    by = {r["type_id"]: r for r in a}
    key = ("strength", "turns", "cost", "moves", "buy_price")
    assert tuple(by[11][k] for k in key) == (1, 1, 2, 16, 10)
    assert tuple(by[10][k] for k in key) == (2, 4, 16, 16, 500)
    assert by[25]["strength"] == 9 and by[25]["moves"] == 22
    assert by[25]["buy_price"] == -3000
    assert a[28]["type_id"] == 28 and by[28]["strength"] == 5
    assert by[18]["enemy_stack_mod"] == -1
    assert by[10]["cancel_mode"] == 1
    assert by[19]["cancel_mode"] == 2 and by[27]["cancel_mode"] == 3
    assert by[4]["str_bonus_open"] == 2
    assert [r["type_id"] for r in a if r["flag19"]] == [5]
    assert [r["type_id"] for r in a if r["flag16"]] == [15, 8, 9, 19, 25]
    assert sum(r["special"] for r in a) == 8


def test_armytyp2_differs_only_in_names(tables):
    a, b = tables["armytype"], tables["armytyp2"]
    assert [x["type_id"] for x, y in zip(a, b) if x != y] == [24, 26, 27, 19]
    assert all(x["name"] != y["name"] for x, y in zip(a, b) if x != y)
    assert sha(*(r["name"] for r in b)) == "7d1bfaeea0da8a1e695a87ff40b3cb39f812979e8d5aa72153599c1cbe411e45"
    for x, y in zip(a, b):
        assert x["raw_words"] == y["raw_words"] and x["type_id"] == y["type_id"]


# ----------------------------------------------------------------- string tables


def test_string_tables(tables):
    s, f, e = tables["strings"], tables["files"], tables["errors"]
    assert (len(s), len(f), len(e)) == (169, 89, 3)

    def get(t, g, i):
        return t[g]["strings"][i]["text"]

    assert sha(get(s, 0, 0)) == "b9ed35fdb5c32bf746a101dbb00f2960075166d417cc549ddefd9d5607fcb3be"
    assert len(s[4]["strings"]) == 10                   # the ten game options
    assert sha(*(x["text"] for x in s[4]["strings"])) == (
        "ccf8b74adcf1e7327c1958745d8ebbb7d30af65284bcb39089cd07fa108f8a3e")
    assert len(s[163]["strings"]) == 17
    assert sha(get(s, 163, 1)) == "f46fbacc2f8f9b23858a688b740645017915b859d54ae45b4240ce1b86cf979a"
    assert sha(get(s, 168, 2)) == "7e03a491b063e878aac0ebaf893bc4f3ffd780848bfef8a1fe6d3cffd9d5390d"
    assert "ARMYTYPE.DAT" in get(f, 21, 0) and "ARMYTYP2.DAT" in get(f, 21, 1)
    assert len(f[3]["strings"]) == 79
    assert get(f, 36, 0).endswith("TERRAIN.DAT")
    assert sha(get(e, 2, 0)) == "aca6527d0f54d7530041f82733291e5feb8d95a66d2ebb0ad195e97e5898ba1e"
    # whole tables, so any change of text anywhere shows
    assert sha(*(x["text"] for grp in s for x in grp["strings"])) == (
        "825073a79789afce44f4149dec9f2d1f8fe589e3e4afaf9e0d5e6adcb37b98e2")
    # every group/index pair is numbered consecutively
    for t in (s, f, e):
        for g, grp in enumerate(t):
            assert grp["group"] == g
            assert [x["index"] for x in grp["strings"]] == list(range(len(grp["strings"])))


def test_string_table_class(tables, game):
    st = ft.StringTable(rd(game, "DATA", "STRING.DAT"))
    assert len(st.groups) == 169
    for grp in tables["strings"]:
        for x in grp["strings"]:
            assert st.get(grp["group"], x["index"]) == x["text"]


def test_string_table_is_fully_covered(game):
    """Header + pointer lists + strings account for every byte of STRING.DAT."""
    d = rd(game, "DATA", "STRING.DAT")
    n = struct.unpack_from("<H", d, 0)[0] // 4
    used = bytearray(len(d))
    for g in range(n):
        off, cnt = struct.unpack_from("<HH", d, 4 * g)
        used[4 * g:4 * g + 4] = b"\1" * 4
        for p in struct.unpack_from("<%dH" % cnt, d, off):
            end = d.index(b"\0", p) + 1
            used[p:end] = b"\1" * (end - p)
        used[off:off + 2 * cnt] = b"\1" * (2 * cnt)
    assert all(used)


# ----------------------------------------------------------------- layout tables


def test_join_area_button(tables, game):
    j, a, b = tables["join"], tables["area"], tables["button"]
    assert len(j) == 36 and sorted(x["screen"] for x in j) == list(range(36))
    assert len(a) == 7 and [g["id"] for g in a] == list(range(7))
    assert len(b) == 36 and [g["id"] for g in b] == list(range(36))
    assert {x["button_group"] for x in j} <= {g["id"] for g in b}
    assert {x["area_group"] for x in j} <= {g["id"] for g in a}
    assert sum(len(g["areas"]) for g in a) + 7 == len(rd(game, "DATA", "AREA.DAT")) // 14
    assert sum(len(g["buttons"]) for g in b) + 36 == len(rd(game, "DATA", "BUTTON.DAT")) // 33
    assert a[1]["areas"][1] == {"id": 3, "unk1": 0, "x": 0, "y": 0, "w": 640, "h": 18, "unk6": 0}
    first = b[0]["buttons"][1]
    assert (first["id"], first["x"], first["y"], first["w"], first["h"], first["pck_index"]) == (
        173, 408, 367, 24, 22, 4)


def test_udb(tables):
    u = tables["udb"]
    assert len(u["buttons"]) == 21
    names = {x["button_id"]: x["name"] for x in u["buttons"]}
    assert sha(names[535]) == "aeb087b59a30966b1f94dfc10773a1b4f64b7cd155818de78bf18b6ba46afcee"
    assert sha(names[507]) == "550ff3b5560c632b90da0090f2fbe18a38d9322551be3d00b6a2182e783dfcc5"
    assert len(u["current"]) == 4 and set(u["current"]) <= set(names)
    assert all(x["rect_large"][2:] == [64, 29] and x["rect_small"][2:] == [32, 29] for x in u["buttons"])


def test_help(tables):
    h = tables["help"]
    assert len(h) == 388
    assert h[0]["id"] == 100
    assert sha(h[0]["title"], h[0]["text"]) == "63427df125aba949dfe52c9d0f008a390d67f721a24c1f68450d3076a03525e8"
    by = {x["id"]: x for x in h}
    assert sha(by[286]["title"]) == "0899debca9cae7f361fa356007629f1a6f55a1e81be4e00e7d12df0dd810b4e0"
    assert sha(by[328]["text"]) == "4178b7d0bf5ba33e7968d60b3ef87d03d1909676b27dbda8ab2241ad73fabf1b"
    assert sha(*(t for x in h for t in (x["title"], x["text"]))) == (
        "63b4446752fd0534bb492b54a7e4232c7a79aaea839012c57f1eac59152e1874")
    assert all(len(x["title"]) < 50 and len(x["text"]) < 50 for x in h)
    # help ids live in the same id space as BUTTON.DAT ids
    bids = {x["id"] for g in tables["button"] for x in g["buttons"]}
    assert len(bids & set(by)) > 370


# ----------------------------------------------------------------- misc


def test_terrain_scenario_options(tables, game):
    t = tables["terrain"]
    assert len(t) == 1 and t[0]["word0"] == 0 and len(t[0]["label"]) == 24
    assert sha(t[0]["label"]) == "3f6a35af7e4216fd1b59f8149324ae0c2b21af6bffbba10c691b55ec46ca3efd"
    sc = tables["scenario"]
    assert [x["dir"] for x in sc] == ["Tutoria", "Dragon", "Sorcery", "Erythea", "Hadesha", "Isladia"]

    def counts(x):
        return [x["cities"], x["sites"], x["players"], x["w_52"]]

    assert counts(sc[0]) == [6, 6, 2, 0] and counts(sc[3]) == [80, 40, 8, 0]
    for x in sc:
        assert os.path.isdir(os.path.join(game, x["dir"].upper()))
        assert x["str_3c"] == x["dir"] == x["str_44"]
    assert len(tables["options"]["options_dat"]) == 10
    assert len(tables["options"]["options_snd"]) == 3 and tables["options"]["options_snd"].isdigit()


def test_mapcolor(tables):
    m = tables["mapcolor"]
    assert [len(t) for t in m["tile_tables"]] == [256] * 4
    assert all(max(t) <= 15 for t in m["tile_tables"])
    assert m["word_tables"][0] == list(range(16))
    assert all(len(t) == 20 for t in m["byte_tables"])


def test_heronames(tables):
    hn = tables["heronames"]
    assert sorted(hn) == [str(i) for i in range(8)]
    assert all(len(v) >= 100 for v in hn.values())
    assert hn["0"][0]["flag"] == 0
    assert sha(hn["0"][0]["name"]) == "97be1767af718bce4938e2b79178ace64813a9e12ea25267606f3016537a7c59"
    assert all(x["flag"] in (0, 1) for v in hn.values() for x in v)
    assert not any(x["flag"] for x in hn["0"])
    female = [x["name"] for x in hn["4"] if x["flag"]]
    assert len(female) == 29
    assert sha(*female) == "1c5b2705ac3bee2cbc45ea768bb6eaac72c56ab9f2be134b572ebe443279f379"


def test_quotes_and_slot_lists(tables):
    q = tables["quotes"]
    assert q["count_field"] == len(q["quotes"]) == 19
    for x in q["quotes"]:
        assert x["length_field"] == len("|".join(x["lines"])) + 1
    for name in ("saveinfo", "mapinfo"):
        for slot in tables[name]:
            assert slot["length_field"] == len(slot["name"]) + 1 and slot["used"] in (0, 1)
    assert len(tables["saveinfo"]) == 10


def test_cards(tables):
    c = tables["cards"]
    assert len(c) == 27 and {k[0] for k in c} == set("KLW")
    for k, v in c.items():
        assert sorted(v["army_order"]) == list(range(29)), k
        assert v["army_order"][5] == 28
        assert len(v["words0"]) == 7 and len(v["words43"]) == 30
        assert v["name"]
    assert sha(c["K000"]["name"]) == "2eae95ab0e7b8a2d8eb0459fa47867fb8949a29a7e7a034956ac6b503864deaf"
    assert c["K000"]["army_order"] == c["L000"]["army_order"] == c["W000"]["army_order"]


def test_sound_config_and_voice_text(tables):
    sc = tables["sound_config"]
    assert set(sc) == {"SOUND.DAT", "SWAP.DAT", "VER102.DAT", "WAR2.INI"}
    assert sc["SOUND.DAT"]["digital_driver"].upper().endswith((".COM", "NO_SOUND"))
    vt = tables["voice_text"]
    assert len(vt) == 27
    assert all("~" in v["raw"] for v in vt.values())
    assert len(vt["VWIN05"]["lines"]) == 2
    assert sha(*vt["VWIN05"]["lines"]) == "fbc20e10f6660ecd355394a169fed737eb558a35c80092cddba86c1de4bb1d3f"


def test_dump_tables_cli(tmp_path, game):
    assert dt.main(["dump_tables.py", game, str(tmp_path)]) == 0
    names = {p.name for p in tmp_path.iterdir()}
    assert {"armytype.json", "armytyp2.json", "strings.json", "files.json", "errors.json", "help.json",
            "cards.json", "heronames.json", "mapcolor.json", "terrain.json", "area.json", "button.json",
            "join.json", "options.json", "mapinfo.json", "saveinfo.json", "scenario.json", "quotes.json",
            "udb.json", "sound_config.json", "voice_text.json"} <= names


# ----------------------------------------------------------------- sound


def test_pcm_is_unsigned_and_headerless(game):
    for src, _ in dump_sound.pcm_files(game):
        d = open(src, "rb").read()
        assert 0 < len(d) < 65536                       # DIGPAK length field is 16 bit
        assert 120 <= sum(d) / len(d) <= 134, src       # rests at mid-scale => unsigned
        assert all(112 <= b <= 144 for b in d[:4]), src  # no header bytes in front


def test_dump_sound(tmp_path, game):
    assert dump_sound.main(["dump_sound.py", game, str(tmp_path)]) == 0
    wavs = sorted(p.name for p in tmp_path.iterdir())
    assert len(wavs) == 37 and "START_DING0.wav" in wavs and "WAR.wav" in wavs
    with wave.open(str(tmp_path / "DING.wav")) as w:
        assert (w.getnchannels(), w.getsampwidth(), w.getframerate()) == (1, 1, 11000)
        assert w.readframes(w.getnframes()) == rd(game, "SOUND", "DING.8SN")


def test_xmi_is_miles_xmidi(game):
    snd = os.path.join(game, "SOUND")
    xmis = [f for f in os.listdir(snd) if f.upper().endswith(".XMI")]
    assert len(xmis) == 75 and {f[0] for f in xmis} == set("MRS")
    for f in xmis:
        d = open(os.path.join(snd, f), "rb").read()
        assert d[:4] == b"FORM" and d[8:12] == b"XDIR" and b"XMID" in d and b"EVNT" in d
        assert len(d) <= 10000                           # the game's fixed load buffer
