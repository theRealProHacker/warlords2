"""Tests for warlords2.formats.xmi (XMIDI parser, MIDPAK.AD reader) and
warlords2.audio.music_render (AIL OPL driver model, renderers, the WAV cache) against the
user's game copy (docs/formats/music.md).

Needs the game data (`gamedata` marker, tests/conftest.py).  The cache tests read
out/music/ (git-ignored) and skip when it has not been rendered.
"""
import json
import struct
import wave

import pytest

from warlords2.audio import music_render as rm
from warlords2.formats.gamedir import GameDir
from warlords2.formats.tables import StringTable
from warlords2.formats.xmi import QUANT_RATE, XmiError, _vlq, parse_ad, parse_xmi, sequence_ticks

pytestmark = pytest.mark.gamedata

MUSIC_GROUPS = range(8, 20)                    # FILE.DAT groups ovl58:0000 reads (sound.md §2)


@pytest.fixture(scope="module")
def gd(game):
    return GameDir(game)


def rd(gd, *parts):
    return gd.read("/".join(parts))


def xmi_paths(gd):
    return sorted(p for d in ("SOUND", "START") for p in gd.path(d).iterdir()
                  if p.suffix.upper() == ".XMI")


@pytest.fixture(scope="module")
def bank(gd):
    return parse_ad(rd(gd, "MIDPAK.AD"))


@pytest.fixture(scope="module")
def parsed(gd):
    return {p.name.upper(): parse_xmi(p.read_bytes()) for p in xmi_paths(gd)}


@pytest.fixture(scope="module")
def music_entries(gd):
    """(group, index, name) of every FILE.DAT entry of the music groups."""
    files = StringTable(gd.read("DATA/FILE.DAT"))
    return [(g, i, n) for g in MUSIC_GROUPS for i, n in enumerate(files.groups[g])]


def test_all_xmi_files_present(parsed):
    names = set(parsed)
    for p in "MRS":
        assert p + "STARTUP.XMI" in names and p + "ANIM.XMI" in names
        for i in range(24):
            assert "%sINT%d.XMI" % (p, i) in names
    assert len(names) == 3 * 26


def test_xmi_structure_fully_consumed(parsed):
    for name, x in parsed.items():
        assert x.seq_count == 1 and len(x.sequences) == 1, name
        s = x.sequences[0]
        # parser stops at End-Of-Track; only an IFF word-alignment pad may follow
        tail = s.evnt_size - s.consumed
        assert tail == (s.consumed & 1), name
        assert s.events[-1].status == 0xFF and s.events[-1].meta_type == 0x2F, name
        assert s.zero_intervals == 0, name
        assert s.rbrn is None, name


def test_xmi_event_sanity(parsed):
    for name, x in parsed.items():
        s = x.sequences[0]
        notes = s.notes()
        assert 50 <= len(notes) <= 2000, name
        assert 15 * QUANT_RATE < s.end_tick < 300 * QUANT_RATE, name
        ticks = [e.tick for e in s.events]
        assert ticks == sorted(ticks), name
        for e in notes:
            assert 1 <= e.duration <= s.end_tick, name
            assert 1 <= e.data[1] <= 127, name
        # these files use only program change, CC 0/1/7, notes and tempo/time-signature metas
        kinds = {e.kind for e in s.events if e.status < 0xF0}
        assert kinds <= {0x90, 0xB0, 0xC0}, name
        ccs = {e.data[0] for e in s.events if e.kind == 0xB0}
        assert ccs <= {0, 1, 7}, name
        metas = {e.meta_type for e in s.events if e.status == 0xFF}
        assert metas <= {0x51, 0x58, 0x2F}, name
        assert s.loop_points() == [], name
        # program changes are all announced in TIMB (bank 0), drums as (note, 127)
        timb = set(s.timbres)
        for e in s.events:
            if e.kind == 0xC0 and e.channel != rm.RHYTHM_CHANNEL:
                assert (e.data[0], 0) in timb, name
        drum_notes = {e.data[0] for e in notes if e.channel == rm.RHYTHM_CHANNEL}
        assert {(n, 127) for n in drum_notes} <= timb, name


def test_known_identities(gd):
    assert rd(gd, "SOUND", "MINT21.XMI") == rd(gd, "SOUND", "SINT21.XMI")
    assert rd(gd, "START", "MANIM.XMI") == rd(gd, "START", "SANIM.XMI")
    # the "Sound Canvas" driver is byte-identical to the MT-32 driver
    assert rd(gd, "MT32MPU.ADV") == rd(gd, "SC32MPU.ADV")


def test_midpak_ad(gd, bank, parsed):
    assert len(bank.index) == 256
    assert bank.index_end == 256 * 6 + 2
    assert sum(1 for _, b, _ in bank.index if b == 0) == 128
    assert sum(1 for _, b, _ in bank.index if b == 127) == 128
    for (p, b), t in bank.timbres.items():
        assert struct.unpack("<H", t[:2])[0] == 14
    assert bank.data_end == bank.index_end + 256 * 14
    raw = rd(gd, "MIDPAK.AD")
    assert raw[bank.data_end:] == bytes(len(raw) - bank.data_end)   # zero padding
    # every timbre requested by any variant is in the bank
    for name, x in parsed.items():
        for pb in x.sequences[0].timbres:
            assert bank.get(*pb) is not None, (name, pb)


def test_driver_tables_match_sbfm_adv(gd):
    adv = rd(gd, "SBFM.ADV")
    assert bytes(rm.VEL_GRAPH) in adv
    assert struct.pack("<192H", *rm.FREQ_TABLE) in adv
    init = bytes(v for _, v in rm._array0_init())
    assert init in adv


def test_driver_pitch(bank):
    regs = {}
    drv = rm.AilOplDriver(lambda r, v: regs.__setitem__(r, v), {(0, 0): bank.get(0, 0)})
    drv.send(0xC1, 0, 0)
    for note in (36, 60, 69, 84):
        drv.send(0x91, note, 100)
        v = next(s for s in drv.slots if s.status == rm.KEYON).voice
        f = regs[0xA0 + v] | ((regs[0xB0 + v] & 3) << 8)
        blk = (regs[0xB0 + v] >> 2) & 7
        assert regs[0xB0 + v] & 0x20
        hz = f * 49716 / 2 ** (20 - blk)
        assert hz == pytest.approx(440 * 2 ** ((note - 69) / 12), rel=2e-3)
        drv.send(0x81, note, 0)
        assert not regs[0xB0 + v] & 0x20


def test_smf_conversion(parsed):
    s = parsed["SINT0.XMI"].sequences[0]
    mid = rm.xmi_to_smf(s)
    assert mid[:4] == b"MThd"
    fmt, ntrk, div = struct.unpack(">HHH", mid[8:14])
    assert (fmt, ntrk, div) == (0, 1, 60)
    trk_len = struct.unpack(">I", mid[18:22])[0]
    assert 22 + trk_len == len(mid)
    # walk the track and count note-ons / note-offs
    d, i, ons, offs, tick = mid[22:], 0, 0, 0, 0
    while i < len(d):
        dt, i = _vlq(d, i)
        tick += dt
        st = d[i]
        if st == 0xFF:
            ln, j = _vlq(d, i + 2)
            i = j + ln
        elif st & 0xF0 in (0xC0, 0xD0):
            i += 2
        else:
            ons += st & 0xF0 == 0x90
            offs += st & 0xF0 == 0x80
            i += 3
    assert ons == offs == len(s.notes())
    assert tick >= s.end_tick


def test_opl_render_short(parsed, bank):
    np = pytest.importorskip("numpy")
    pytest.importorskip("pyopl")
    s = parsed["SSTARTUP.XMI"].sequences[0]
    pcm, info = rm.render_opl(s, bank, max_seconds=6.0)
    assert pcm.dtype == np.int16 and pcm.ndim == 1
    assert info["sequence_samples"] == 6 * rm.DEFAULT_RATE
    assert 6 * rm.DEFAULT_RATE <= len(pcm) <= 10 * rm.DEFAULT_RATE
    expected = sum(1 for e in s.notes() if e.tick < 6 * QUANT_RATE)
    assert info["notes_dispatched"] == info["note_on"] == expected
    assert info["note_on_no_timbre"] == 0 and info["queue_overflows"] == 0
    st = rm.audio_stats(pcm[:6 * rm.DEFAULT_RATE])   # the sequence part, without the tail
    assert st["clipped_samples"] == 0
    assert st["rms_dbfs"] is not None and st["rms_dbfs"] > -45
    assert st["silent_seconds"] == 0
    # energy spread over a real spectrum, not a DC offset or a single tone
    spec = np.abs(np.fft.rfft(pcm[:rm.DEFAULT_RATE * 4].astype(float)))
    freqs = np.fft.rfftfreq(rm.DEFAULT_RATE * 4, 1 / rm.DEFAULT_RATE)
    band = lambda lo, hi: spec[(freqs >= lo) & (freqs < hi)].sum()  # noqa: E731
    assert band(60, 1000) > 0.05 * spec.sum()
    assert band(1000, 8000) > 0.01 * spec.sum()


def test_gm_render_short(parsed):
    np = pytest.importorskip("numpy")
    pytest.importorskip("tinysoundfont")
    sf2 = rm.REPO_ROOT / "out" / "cache" / "soundfonts" / rm.SOUNDFONT_NAME
    if not sf2.is_file():
        pytest.skip("SoundFont not cached (run %s --variant gm once)" % rm.COMMAND)
    s = parsed["RINT2.XMI"].sequences[0]
    pcm, info = rm.render_gm(s, str(sf2), max_seconds=4.0)
    assert pcm.ndim == 2 and pcm.shape[1] == 2
    assert len(pcm) >= 4 * rm.DEFAULT_RATE
    assert info["notes_dispatched"] == sum(1 for e in s.notes() if e.tick < 4 * QUANT_RATE)
    st = rm.audio_stats(pcm)
    assert st["clipped_samples"] == 0 and st["rms_dbfs"] > -50


# ------------------------------------------------------------- container, lengths


def test_xmi_rejects_corruption(gd):
    data = rd(gd, "SOUND", "SSTARTUP.XMI")
    with pytest.raises(XmiError):
        parse_xmi(data[:-1])
    with pytest.raises(XmiError):
        parse_xmi(data + b"\0")
    assert issubclass(XmiError, ValueError)


def test_sequence_ticks(gd, parsed):
    for p in xmi_paths(gd):
        assert sequence_ticks(p.read_bytes()) == parsed[p.name.upper()].sequences[0].end_tick
    # the lengths the mode-2 rule depends on (end_tick / 120 s, X32)
    ticks = {n: sequence_ticks(rd(gd, "SOUND", n + ".XMI")) for n in
             ("SINT2", "SINT3", "SINT5", "SINT7", "SINT13", "SINT11", "RINT2", "RINT7")}
    assert ticks == {"SINT2": 16626, "SINT3": 14408, "SINT5": 24748, "SINT7": 19242,
                     "SINT13": 24474, "SINT11": 27955, "RINT2": 16592, "RINT7": 20169}
    group10 = [sequence_ticks(rd(gd, "SOUND", "S%s.XMI" % n)) / QUANT_RATE for n in
               ("INT0", "INT4", "INT6", "INT9", "INT10", "INT16", "INT17", "INT23")]
    assert (round(min(group10), 1), round(max(group10), 1)) == (116.5, 276.7)


def test_file_dat_music_entries_are_tracks(gd, music_entries):
    assert len(music_entries) == 26
    # every SOUND track is used: STARTUP and INT0..INT23 (INT12 twice in group 9)
    names = {n.upper().removesuffix(".XMI") for _, _, n in music_entries}
    assert names == set(rm.TRACK_NAMES) - {"ANIM"}
    for g, i, name in music_entries:
        base = name.upper().removesuffix(".XMI")
        assert base in rm.TRACK_NAMES, (g, i, name)
        for v in rm.VARIANTS:
            assert gd.path(rm.track_source(base, v)).is_file(), (g, i, name, v)
    assert rm.stem("INT12", "opl") == "SINT12" and rm.stem("STARTUP", "gm") == "RSTARTUP"
    assert rm.track_source("ANIM", "opl") == "START/SANIM.XMI"


# ------------------------------------------------------------------- the cache


def _fake_cache(gd, tmp_path, name="INT22", variant="opl"):
    st = rm.stem(name, variant)
    (tmp_path / (st + ".wav")).write_bytes(b"")
    e = {"variant": variant, "wav": st + ".wav", "source": rm.track_source(name, variant),
         "source_sha256": rm.sha256(gd.read(rm.track_source(name, variant))),
         "renderer_version": rm.RENDERER_VERSION,
         "midpak_ad_sha256": rm.sha256(gd.read(rm.AD_FILE))}
    return st, {"tracks": {st: e}}


def test_stale_detects_changes(gd, tmp_path):
    st, m = _fake_cache(gd, tmp_path)
    assert rm.stale(m, gd, [st], tmp_path) == []
    assert rm.stale(None, gd, [st], tmp_path) == [st]
    assert rm.stale(m, gd, [st, "SINT0"], tmp_path) == ["SINT0"]
    for key, bad in (("source_sha256", "0" * 64), ("midpak_ad_sha256", "0" * 64),
                     ("renderer_version", None), ("wav", "none.wav")):
        changed = {"tracks": {st: dict(m["tracks"][st], **{key: bad})}}
        assert rm.stale(changed, gd, [st], tmp_path) == [st], key
    # an R entry does not depend on MIDPAK.AD
    rs, rmf = _fake_cache(gd, tmp_path, variant="gm")
    rmf["tracks"][rs]["midpak_ad_sha256"] = "0" * 64
    assert rm.stale(rmf, gd, [rs], tmp_path) == []


def test_load_manifest(tmp_path):
    assert rm.load_manifest(tmp_path) is None
    (tmp_path / rm.MANIFEST).write_text("{")
    assert rm.load_manifest(tmp_path) is None
    (tmp_path / rm.MANIFEST).write_text(json.dumps({"tracks": {}}))
    assert rm.load_manifest(tmp_path) == {"tracks": {}}


def test_render_skips_current_tracks(gd, tmp_path, capsys):
    pytest.importorskip("pyopl")
    pytest.importorskip("numpy")
    assert rm.render(gd, tmp_path, ("opl",), ["INT22"], max_seconds=1.0) == 0
    m = rm.load_manifest(tmp_path)
    assert m["tracks"]["SINT22"]["renderer_version"] is None     # test renders never current
    assert rm.stale(m, gd, ["SINT22"], tmp_path) == ["SINT22"]
    # an entry made current by hand is skipped
    m["tracks"]["SINT22"]["renderer_version"] = rm.RENDERER_VERSION
    (tmp_path / rm.MANIFEST).write_text(json.dumps(m))
    capsys.readouterr()
    assert rm.render(gd, tmp_path, ("opl",), ["INT22"], max_seconds=1.0) == 0
    assert "1 of 1 track(s) current already" in capsys.readouterr().out


@pytest.fixture(scope="module")
def manifest():
    m = rm.load_manifest()
    if m is None:
        pytest.skip("music cache not rendered (run %s)" % rm.COMMAND)
    return m


def test_cache_covers_every_music_entry(gd, manifest, music_entries):
    stems = []
    for v in rm.VARIANTS:
        for _, _, name in music_entries:
            stems.append(rm.stem(name.upper().removesuffix(".XMI"), v))
    assert rm.stale(manifest, gd, stems) == []
    for s in sorted(set(stems)):
        e = manifest["tracks"][s]
        ticks = sequence_ticks(gd.read(e["source"]))
        assert e["end_tick"] == ticks, s
        assert e["sequence_end_s"] == round(ticks / QUANT_RATE, 3), s
        assert e["notes_in_file"] == e["render"]["notes_dispatched"], s
        with wave.open(str(rm.DEFAULT_OUT / e["wav"])) as w:
            assert (w.getframerate(), w.getnchannels(), w.getsampwidth()) == (
                rm.DEFAULT_RATE, 1 if e["variant"] == "opl" else 2, 2), s
            # the WAV holds the whole sequence; at most the 4 s release tail follows
            seq = ticks * rm.DEFAULT_RATE // QUANT_RATE
            assert seq <= w.getnframes() <= seq + 4 * rm.DEFAULT_RATE + rm.DEFAULT_RATE // 20, s


def test_missing_gm_synth_is_a_note_unless_asked_for(gd, tmp_path, monkeypatch, capsys):
    """The bare command (no --variant) succeeds with only requirements-music.txt: a variant
    whose package is missing is skipped with a note; an explicit --variant fails."""
    import importlib.util
    real = importlib.util.find_spec
    monkeypatch.setattr(importlib.util, "find_spec",
                        lambda name, *a: None if name == "tinysoundfont" else real(name, *a))
    assert rm.render(gd, tmp_path, ("gm",), [], optional=("gm",)) == 0
    assert rm.render(gd, tmp_path, ("gm",), []) == 1
    assert "gm: skipped, missing tinysoundfont" in capsys.readouterr().out
    seen = []
    monkeypatch.setattr(rm, "render", lambda *a, **k: seen.append((a[2], k["optional"])) or 0)
    for argv in ([], ["--variant", "all"], ["--variant", "gm"], ["--variant", "opl"]):
        rm.main([str(gd.root)] + argv + ["--tracks", "INT0"])
    assert seen == [(rm.VARIANTS, ("gm",)), (rm.VARIANTS, ()), (("gm",), ()), (("opl",), ())]
