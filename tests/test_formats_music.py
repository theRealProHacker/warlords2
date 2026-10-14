"""Tests for tools/render_music.py (XMIDI parser, MIDPAK.AD reader, AIL OPL driver model,
renderers) against the user's game copy.  Skipped when the original files are missing.
"""
import glob
import os
import struct
import sys

import pytest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
GAME = os.path.join(ROOT, "original", "game", "Warlrd2")

pytestmark = pytest.mark.skipif(
    not os.path.exists(os.path.join(GAME, "MIDPAK.AD")),
    reason="original game files not available",
)

sys.path.insert(0, os.path.join(ROOT, "tools"))
import render_music as rm  # noqa: E402


def rd(*parts):
    return open(os.path.join(GAME, *parts), "rb").read()


def xmi_paths():
    return sorted(glob.glob(os.path.join(GAME, "SOUND", "*.XMI")) +
                  glob.glob(os.path.join(GAME, "START", "*.XMI")))


@pytest.fixture(scope="module")
def bank():
    return rm.parse_ad(rd("MIDPAK.AD"))


@pytest.fixture(scope="module")
def parsed():
    return {os.path.basename(p): rm.parse_xmi(open(p, "rb").read()) for p in xmi_paths()}


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
        assert 15 * rm.QUANT_RATE < s.end_tick < 300 * rm.QUANT_RATE, name
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


def test_known_identities():
    assert rd("SOUND", "MINT21.XMI") == rd("SOUND", "SINT21.XMI")
    assert rd("START", "MANIM.XMI") == rd("START", "SANIM.XMI")
    # the "Sound Canvas" driver is byte-identical to the MT-32 driver
    assert rd("MT32MPU.ADV") == rd("SC32MPU.ADV")


def test_midpak_ad(bank, parsed):
    assert len(bank.index) == 256
    assert bank.index_end == 256 * 6 + 2
    assert sum(1 for _, b, _ in bank.index if b == 0) == 128
    assert sum(1 for _, b, _ in bank.index if b == 127) == 128
    for (p, b), t in bank.timbres.items():
        assert struct.unpack("<H", t[:2])[0] == 14
    assert bank.data_end == bank.index_end + 256 * 14
    raw = rd("MIDPAK.AD")
    assert raw[bank.data_end:] == bytes(len(raw) - bank.data_end)   # zero padding
    # every timbre requested by any variant is in the bank
    for name, x in parsed.items():
        for pb in x.sequences[0].timbres:
            assert bank.get(*pb) is not None, (name, pb)


def test_driver_tables_match_sbfm_adv():
    adv = rd("SBFM.ADV")
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
        dt, i = rm._vlq(d, i)
        tick += dt
        st = d[i]
        if st == 0xFF:
            ln, j = rm._vlq(d, i + 2)
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
    expected = sum(1 for e in s.notes() if e.tick < 6 * rm.QUANT_RATE)
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
    sf2 = os.path.join(ROOT, "out", "cache", "soundfonts", rm.SOUNDFONT_NAME)
    if not os.path.exists(sf2):
        pytest.skip("SoundFont not cached (run render_music.py --variant gm once)")
    s = parsed["RINT2.XMI"].sequences[0]
    pcm, info = rm.render_gm(s, sf2, max_seconds=4.0)
    assert pcm.ndim == 2 and pcm.shape[1] == 2
    assert len(pcm) >= 4 * rm.DEFAULT_RATE
    assert info["notes_dispatched"] == sum(1 for e in s.notes() if e.tick < 4 * rm.QUANT_RATE)
    st = rm.audio_stats(pcm)
    assert st["clipped_samples"] == 0 and st["rms_dbfs"] > -50
