"""XMIDI music files (`SOUND/[MRS]*.XMI`, `START/[MRS]ANIM.XMI`) and the AIL timbre bank
`MIDPAK.AD`.

Format: docs/formats/music.md §2 (XMI) and §4 (MIDPAK.AD).  `parse_xmi` decodes the event
stream the way AIL's `serve_driver` walks it (120 intervals per second, note-ons with a
duration, no note-offs); `sequence_ticks` is the sequence length in those intervals, i.e.
how long MIDPAK reports the sequence as playing.  Rendering is `audio.music_render`.
"""
from __future__ import annotations

import struct
from dataclasses import dataclass, field

QUANT_RATE = 120          # AIL services XMIDI sequences at 120 intervals/second
CC_FOR_LOOP = 116         # XMIDI FOR / NEXT loop controllers (ail.inc)
CC_NEXT_LOOP = 117


class XmiError(ValueError):
    pass


# ============================================================================ XMI


@dataclass
class XmiEvent:
    tick: int                 # 120 Hz interval at which the driver dispatches it
    offset: int               # byte offset inside the EVNT chunk
    status: int               # MIDI status byte (0x80..0xFF)
    data: bytes               # channel data bytes / meta or sysex payload
    meta_type: int | None = None
    duration: int | None = None   # note-on only: duration in 120 Hz intervals

    @property
    def kind(self) -> int:
        return self.status & 0xF0

    @property
    def channel(self) -> int:
        return self.status & 0x0F


@dataclass
class XmiSequence:
    timbres: list[tuple[int, int]]   # TIMB entries: (patch, bank)
    events: list[XmiEvent]
    evnt_size: int
    consumed: int                    # EVNT bytes up to and including End-Of-Track
    end_tick: int                    # tick of the End-Of-Track meta event
    zero_intervals: int = 0          # interval bytes of value 0 (driver: 1 tick)
    rbrn: bytes | None = None        # branch table, if present

    def notes(self):
        return [e for e in self.events if e.kind == 0x90]

    def loop_points(self):
        """(FOR tick, NEXT tick) pairs of XMIDI FOR/NEXT controllers 116/117."""
        fors, out = [], []
        for e in self.events:
            if e.kind == 0xB0 and e.data[0] == CC_FOR_LOOP:
                fors.append(e)
            elif e.kind == 0xB0 and e.data[0] == CC_NEXT_LOOP and e.data[1] >= 64 and fors:
                f = fors.pop()
                out.append({"for_tick": f.tick, "next_tick": e.tick, "count": f.data[1],
                            "for_s": f.tick / QUANT_RATE, "next_s": e.tick / QUANT_RATE})
        return out


@dataclass
class XmiFile:
    seq_count: int
    sequences: list[XmiSequence]


def _chunks(data, start, end):
    o = start
    while o < end:
        if o + 8 > end:
            raise XmiError("truncated chunk header at %d" % o)
        cid = data[o:o + 4]
        size = struct.unpack(">I", data[o + 4:o + 8])[0]
        body = o + 8
        if body + size > end:
            raise XmiError("chunk %r at %d overruns its container" % (cid, o))
        yield cid, body, size
        o = body + size + (size & 1)
    if o != end and not (o == end + 1):
        raise XmiError("chunk list does not end at container end")


def _vlq(data, i):
    v = 0
    while True:
        if i >= len(data):
            raise XmiError("truncated variable-length number")
        c = data[i]
        i += 1
        v = (v << 7) | (c & 0x7F)
        if c < 0x80:
            return v, i


def parse_events(evnt: bytes) -> tuple[list[XmiEvent], int, int, int]:
    """Decode an EVNT chunk the way AIL's serve_driver walks it.

    Returns (events, consumed_bytes, end_tick, zero_interval_count).  A byte < 0x80 in
    status position is an interval count; the driver waits max(n, 1) ticks per byte.
    Note-on (9x) carries a velocity and a MIDI-style variable-length duration in ticks.
    No running status.  Parsing stops after FF 2F.
    """
    events = []
    i = tick = zeros = 0
    n = len(evnt)
    while True:
        if i >= n:
            raise XmiError("EVNT ended without End-Of-Track")
        b = evnt[i]
        if b < 0x80:
            if b == 0:
                zeros += 1
            tick += max(b, 1)
            i += 1
            continue
        off = i
        hi = b & 0xF0
        if b == 0xFF:
            if i + 2 > n:
                raise XmiError("truncated meta event")
            mtype = evnt[i + 1]
            ln, j = _vlq(evnt, i + 2)
            if j + ln > n:
                raise XmiError("meta event overruns EVNT")
            events.append(XmiEvent(tick, off, b, bytes(evnt[j:j + ln]), meta_type=mtype))
            i = j + ln
            if mtype == 0x2F:
                return events, i, tick, zeros
            continue
        if b in (0xF0, 0xF7):
            ln, j = _vlq(evnt, i + 1)
            if j + ln > n:
                raise XmiError("sysex overruns EVNT")
            events.append(XmiEvent(tick, off, b, bytes(evnt[j:j + ln])))
            i = j + ln
            continue
        if hi >= 0xF0:
            raise XmiError("unsupported system message %02x at %d" % (b, off))
        nd = 1 if hi in (0xC0, 0xD0) else 2
        data = bytes(evnt[i + 1:i + 1 + nd])
        if len(data) != nd or any(x >= 0x80 for x in data):
            raise XmiError("bad data bytes for status %02x at %d" % (b, off))
        i += 1 + nd
        dur = None
        if hi == 0x90:
            dur, i = _vlq(evnt, i)
        events.append(XmiEvent(tick, off, b, data, duration=dur))


def parse_xmi(data: bytes) -> XmiFile:
    """Parse an XMIDI file: FORM XDIR { INFO } + CAT XMID { FORM XMID { TIMB, [RBRN], EVNT } }."""
    seq_count = None
    seqs = []

    def form_xmid(body, size):
        timb, evnt, rbrn = None, None, None
        for cid, b2, s2 in _chunks(data, body + 4, body + size):
            if cid == b"TIMB":
                cnt = struct.unpack("<H", data[b2:b2 + 2])[0]
                if 2 + 2 * cnt != s2:
                    raise XmiError("TIMB size mismatch")
                timb = [(data[b2 + 2 + 2 * k], data[b2 + 3 + 2 * k]) for k in range(cnt)]
            elif cid == b"EVNT":
                evnt = data[b2:b2 + s2]
            elif cid == b"RBRN":
                rbrn = data[b2:b2 + s2]
            else:
                raise XmiError("unexpected chunk %r in FORM XMID" % cid)
        if evnt is None:
            raise XmiError("FORM XMID without EVNT")
        events, consumed, end_tick, zeros = parse_events(evnt)
        tail = evnt[consumed:]
        if tail not in (b"", b"\x00"):
            raise XmiError("%d unexpected bytes after End-Of-Track" % len(tail))
        seqs.append(XmiSequence(timb or [], events, len(evnt), consumed, end_tick,
                                zeros, rbrn))

    for cid, body, size in _chunks(data, 0, len(data)):
        kind = data[body:body + 4]
        if cid == b"FORM" and kind == b"XDIR":
            for c2, b2, s2 in _chunks(data, body + 4, body + size):
                if c2 == b"INFO":
                    seq_count = struct.unpack("<H", data[b2:b2 + 2])[0]
        elif cid == b"CAT " and kind == b"XMID":
            for c2, b2, s2 in _chunks(data, body + 4, body + size):
                if c2 != b"FORM" or data[b2:b2 + 4] != b"XMID":
                    raise XmiError("CAT XMID contains %r" % c2)
                form_xmid(b2, s2)
        elif cid == b"FORM" and kind == b"XMID":
            form_xmid(body, size)
        else:
            raise XmiError("unexpected top-level chunk %r %r" % (cid, kind))
    if not seqs:
        raise XmiError("no FORM XMID found")
    if seq_count is not None and seq_count != len(seqs):
        raise XmiError("XDIR INFO says %d sequences, found %d" % (seq_count, len(seqs)))
    return XmiFile(seq_count if seq_count is not None else len(seqs), seqs)


# ===================================================================== MIDPAK.AD


@dataclass
class AdBank:
    """AIL global timbre library (.AD)."""
    index: list[tuple[int, int, int]]          # (patch, bank, offset) in file order
    timbres: dict[tuple[int, int], bytes] = field(default_factory=dict)  # first match wins
    index_end: int = 0                         # offset just past the FFFF terminator
    data_end: int = 0                          # end of the last timbre record

    def get(self, patch, bank):
        return self.timbres.get((patch, bank))


def parse_ad(data: bytes) -> AdBank:
    """Index of 6-byte entries {u8 patch, u8 bank, u32 LE offset} ended by a 0xFFFF
    word; each record is {u16 LE length (incl. itself), payload}.  A 14-byte record is
    an AIL .BNK-style OPL2 timbre: transpose, then modulator AVEKM, KSLTL, AD, SR, WS,
    FB/C, then carrier AVEKM, KSLTL, AD, SR, WS."""
    index = []
    o = 0
    while True:
        if o + 2 > len(data):
            raise XmiError("AD index not terminated")
        if data[o] == 0xFF and data[o + 1] == 0xFF:
            o += 2
            break
        if o + 6 > len(data):
            raise XmiError("truncated AD index")
        p, b = data[o], data[o + 1]
        off = struct.unpack("<I", data[o + 2:o + 6])[0]
        index.append((p, b, off))
        o += 6
    bank = AdBank(index, index_end=o)
    for p, b, off in index:
        if off + 2 > len(data):
            raise XmiError("AD record offset out of range")
        ln = struct.unpack("<H", data[off:off + 2])[0]
        if ln < 2 or off + ln > len(data):
            raise XmiError("bad AD record length")
        bank.timbres.setdefault((p, b), bytes(data[off:off + ln]))
        bank.data_end = max(bank.data_end, off + ln)
    return bank


def sequence_ticks(data: bytes) -> int:
    """Length of an XMI file's (only) sequence in 120 Hz intervals: the tick of its
    End-Of-Track event.  The sequence plays for `sequence_ticks(data) / QUANT_RATE`
    seconds (a render's WAV adds a release tail after that)."""
    return parse_xmi(data).sequences[0].end_tick
