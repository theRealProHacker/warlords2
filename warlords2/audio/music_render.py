"""Render the XMIDI music of Warlords II to the WAV cache the game plays (M10c).

    python -m warlords2.audio.music_render [<game_dir>] [<out_dir>] [--variant opl|gm|all]
                                           [--tracks NAME ...] [--force] [--soundfont PATH]

    <game_dir>     default: the game directory of the tests and the app (WL2_DATA, else
                   original/game/Warlrd2)
    <out_dir>      default: out/music/ below the repository (git-ignored)
    --variant opl  the Sound Blaster / AdLib arrangement (S*.XMI, what the EXE loads with
                   the shipped SOUND.DAT), through an OPL2 emulator (DOSBox DBOPL, `pyopl`)
                   driven by a model of the AIL 2 Yamaha XMIDI driver (SBFM.ADV) with the
                   timbres of MIDPAK.AD
    --variant gm   the Sound Canvas arrangement (R*.XMI) as General MIDI with TinySoundFont
                   and the GeneralUser GS SoundFont (downloaded once into out/cache/soundfonts/)
    --variant all  both; the M arrangement (MT-32) is not rendered
                   (default: both, but a variant whose optional package is not installed
                   is skipped with a note; requirements-music.txt has only the opl ones, so
                   the bare command succeeds after `pip install -r requirements-music.txt`)
    --tracks       track names (STARTUP, INT0..INT23, ANIM) or file stems (SINT5); default all
    --force        render even tracks whose manifest entry is current

Writes <out_dir>/<stem>.wav (44.1 kHz, 16 bit; mono for opl, stereo for gm), <stem>.mid
(type-0 SMF, 120 ticks/s, for inspection) and merges one entry per stem into
<out_dir>/manifest.json.  An entry is current while the XMI's SHA-256 (and for opl the
MIDPAK.AD SHA-256) and RENDERER_VERSION match; `stale` is the check the player uses.
The extra packages are in requirements-music.txt; they are imported only when rendering.
Format and fidelity: docs/formats/music.md.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import struct
import sys
import urllib.request
import wave
from pathlib import Path

from ..formats.gamedir import REPO_ROOT, GameDir  # noqa: F401  (REPO_ROOT: tests)
from ..paths import default_data, default_music_cache
from ..formats.xmi import (CC_FOR_LOOP, CC_NEXT_LOOP, QUANT_RATE, AdBank, XmiEvent,
                           XmiSequence, parse_ad, parse_xmi)

MAX_NOTES = 32            # XMIDI note queue size (xmidi.asm MAX_NOTES)
DEFAULT_RATE = 44100
RENDERER_VERSION = 1      # bump when a change of this module changes the rendered files

# XMIDI / AIL controller numbers (ail.inc)
CC_MODULATION = 1
CC_PART_VOLUME = 7
CC_PANPOT = 10
CC_EXPRESSION = 11
CC_SUSTAIN = 64
CC_CHAN_LOCK = 110
CC_CHAN_PROTECT = 111
CC_VOICE_PROTECT = 112
CC_TIMBRE_PROTECT = 113
CC_PATCH_BANK_SEL = 114
CC_INDIRECT_C_PFX = 115
CC_CLEAR_BEAT_BAR = 118
CC_CALLBACK_TRIG = 119
CC_SEQ_INDEX = 120
CC_RESET_ALL_CTRLS = 121
CC_ALL_NOTES_OFF = 123
XMIDI_CONTROLLERS = range(110, 121)

RHYTHM_CHANNEL = 9        # MIDI channel 10: AIL "RBS" percussion, timbre bank 127
RHYTHM_BANK = 127


# ========================================================================== SMF


def _vlq_bytes(v):
    out = [v & 0x7F]
    v >>= 7
    while v:
        out.append(0x80 | (v & 0x7F))
        v >>= 7
    return bytes(reversed(out))


def xmi_to_smf(seq: XmiSequence) -> bytes:
    """Type-0 SMF, division 60 PPQN at 500000 us/quarter = 120 ticks/s, so 1 SMF tick =
    1 XMIDI interval.  XMIDI tempo metas are dropped (AIL does not time playback by
    them); note-ons are split into note-on/note-off with the driver's effective
    duration max(d, 1); at equal ticks note-offs precede other events (as in AIL)."""
    timed = [(0, 0, 0, b"\xff\x51\x03\x07\xa1\x20")]     # tempo 500000
    seqno = 1
    for e in seq.events:
        if e.status == 0xFF:
            if e.meta_type in (0x51, 0x2F):
                continue
            timed.append((e.tick, 1, seqno, bytes([0xFF, e.meta_type]) +
                          _vlq_bytes(len(e.data)) + e.data))
        elif e.status in (0xF0, 0xF7):
            timed.append((e.tick, 1, seqno, bytes([e.status]) + _vlq_bytes(len(e.data)) + e.data))
        elif e.kind == 0x90:
            timed.append((e.tick, 1, seqno, bytes([e.status]) + e.data))
            timed.append((e.tick + max(e.duration, 1), 0, seqno,
                          bytes([0x80 | e.channel, e.data[0], 0x40])))
        else:
            timed.append((e.tick, 1, seqno, bytes([e.status]) + e.data))
        seqno += 1
    timed.sort(key=lambda t: (t[0], t[1], t[2]))
    end = max([seq.end_tick] + [t[0] for t in timed])
    trk = bytearray()
    last = 0
    for tick, _, _, msg in timed:
        trk += _vlq_bytes(tick - last) + msg
        last = tick
    trk += _vlq_bytes(end - last) + b"\xff\x2f\x00"
    return (b"MThd" + struct.pack(">IHHH", 6, 0, 1, QUANT_RATE // 2) +
            b"MTrk" + struct.pack(">I", len(trk)) + bytes(trk))


# ==================================================================== sequencer


class XmidiSequencer:
    """The XMIDI interpreter of AIL 2 (xmidi.asm serve_driver), one call per 120 Hz
    interval: first expire queued notes (note-off), then dispatch every event up to
    the next interval byte.  `sink.send(status, d1, d2)` receives MIDI messages."""

    def __init__(self, seq: XmiSequence, sink):
        self.seq = seq
        self.sink = sink
        self.events = seq.events
        self.pos = 0
        self.tick = 0
        self.done = False
        self.queue = [None] * MAX_NOTES    # [chan, note, time]
        self.note_count = 0
        self.queue_overflows = 0
        self.notes_dispatched = 0
        self.for_stack = []                # [loop_count, event_index]
        self.loops_taken = 0

    def step(self):
        if self.done:
            return False
        if self.note_count:
            for k in range(MAX_NOTES):
                q = self.queue[k]
                if q is None:
                    continue
                q[2] -= 1
                if q[2] < 0:
                    self.queue[k] = None
                    self.note_count -= 1
                    self.sink.send(0x80 | q[0], q[1], 0)
        while self.pos < len(self.events) and self.events[self.pos].tick <= self.tick:
            e = self.events[self.pos]
            self.pos += 1
            if e.status == 0xFF:
                if e.meta_type == 0x2F:
                    self.done = True
                    break
                continue
            if e.status in (0xF0, 0xF7):
                continue
            k = e.kind
            if k == 0x90:
                self._note_on(e)
            elif k == 0xB0:
                self._control(e)
            elif k in (0xC0, 0xD0):
                self.sink.send(e.status, e.data[0], 0)
            else:
                self.sink.send(e.status, e.data[0], e.data[1])
        self.tick += 1
        return not self.done

    def _note_on(self, e):
        free = next((k for k in range(MAX_NOTES) if self.queue[k] is None), None)
        if free is None:                   # AIL overwrites entry 0 when the queue is full
            free = 0
            self.queue_overflows += 1
        else:
            self.note_count += 1
        self.queue[free] = [e.channel, e.data[0], e.duration - 1]
        self.notes_dispatched += 1
        self.sink.send(e.status, e.data[0], e.data[1])

    def _control(self, e):
        cc, val = e.data
        if cc == CC_FOR_LOOP:
            if len(self.for_stack) < 4:
                self.for_stack.append([val, self.pos])
            return
        if cc == CC_NEXT_LOOP:
            if val < 64 or not self.for_stack:
                return
            top = self.for_stack[-1]
            if top[0] == 0:
                # infinite loop: an offline render plays the body once; the loop
                # point is reported in the manifest instead
                self.for_stack.pop()
                return
            top[0] -= 1
            if top[0] == 0 or self.loops_taken >= 64:
                self.for_stack.pop()
                return
            # jump back: re-time the remaining events relative to the FOR position
            self.loops_taken += 1
            self._rewind_to(top[1])
            return
        if cc in XMIDI_CONTROLLERS:
            return
        self.sink.send(e.status, cc, val)

    def _rewind_to(self, idx):
        base = self.events[idx - 1].tick if idx > 0 else 0
        shift = self.tick - base
        self.events = self.events[:idx] + [
            XmiEvent(x.tick + shift, x.offset, x.status, x.data, x.meta_type, x.duration)
            for x in self.seq.events[idx:]]
        self.pos = idx

    def flush(self):
        """Send note-offs for every queued note (what stop_seq does)."""
        for k in range(MAX_NOTES):
            q = self.queue[k]
            if q is not None:
                self.queue[k] = None
                self.sink.send(0x80 | q[0], q[1], 0)
        self.note_count = 0


# ======================================================= AIL Yamaha (OPL2) driver

# Tables from the AIL 2 YAMAHA driver; freq_table, vel_graph, the register init
# array and the controller defaults are byte-identical in SBFM.ADV (see music.md).
FREQ_TABLE = [
    0x02b2, 0x02b4, 0x02b7, 0x02b9, 0x02bc, 0x02be, 0x02c1, 0x02c3, 0x02c6, 0x02c9,
    0x02cb, 0x02ce, 0x02d0, 0x02d3, 0x02d6, 0x02d8, 0x02db, 0x02dd, 0x02e0, 0x02e3,
    0x02e5, 0x02e8, 0x02eb, 0x02ed, 0x02f0, 0x02f3, 0x02f6, 0x02f8, 0x02fb, 0x02fe,
    0x0301, 0x0303, 0x0306, 0x0309, 0x030c, 0x030f, 0x0311, 0x0314, 0x0317, 0x031a,
    0x031d, 0x0320, 0x0323, 0x0326, 0x0329, 0x032b, 0x032e, 0x0331, 0x0334, 0x0337,
    0x033a, 0x033d, 0x0340, 0x0343, 0x0346, 0x0349, 0x034c, 0x034f, 0x0352, 0x0356,
    0x0359, 0x035c, 0x035f, 0x0362, 0x0365, 0x0368, 0x036b, 0x036f, 0x0372, 0x0375,
    0x0378, 0x037b, 0x037f, 0x0382, 0x0385, 0x0388, 0x038c, 0x038f, 0x0392, 0x0395,
    0x0399, 0x039c, 0x039f, 0x03a3, 0x03a6, 0x03a9, 0x03ad, 0x03b0, 0x03b4, 0x03b7,
    0x03bb, 0x03be, 0x03c1, 0x03c5, 0x03c8, 0x03cc, 0x03cf, 0x03d3, 0x03d7, 0x03da,
    0x03de, 0x03e1, 0x03e5, 0x03e8, 0x03ec, 0x03f0, 0x03f3, 0x03f7, 0x03fb, 0x03fe,
    0xfe01, 0xfe03, 0xfe05, 0xfe07, 0xfe08, 0xfe0a, 0xfe0c, 0xfe0e, 0xfe10, 0xfe12,
    0xfe14, 0xfe16, 0xfe18, 0xfe1a, 0xfe1c, 0xfe1e, 0xfe20, 0xfe21, 0xfe23, 0xfe25,
    0xfe27, 0xfe29, 0xfe2b, 0xfe2d, 0xfe2f, 0xfe31, 0xfe34, 0xfe36, 0xfe38, 0xfe3a,
    0xfe3c, 0xfe3e, 0xfe40, 0xfe42, 0xfe44, 0xfe46, 0xfe48, 0xfe4a, 0xfe4c, 0xfe4f,
    0xfe51, 0xfe53, 0xfe55, 0xfe57, 0xfe59, 0xfe5c, 0xfe5e, 0xfe60, 0xfe62, 0xfe64,
    0xfe67, 0xfe69, 0xfe6b, 0xfe6d, 0xfe6f, 0xfe72, 0xfe74, 0xfe76, 0xfe79, 0xfe7b,
    0xfe7d, 0xfe7f, 0xfe82, 0xfe84, 0xfe86, 0xfe89, 0xfe8b, 0xfe8d, 0xfe90, 0xfe92,
    0xfe95, 0xfe97, 0xfe99, 0xfe9c, 0xfe9e, 0xfea1, 0xfea3, 0xfea5, 0xfea8, 0xfeaa,
    0xfead, 0xfeaf,
]
VEL_GRAPH = [82, 85, 88, 91, 94, 97, 100, 103, 106, 109, 112, 115, 118, 121, 124, 127]
DEF_AV_DEPTH = 0xC0           # register BD: AM depth 4.8 dB, vibrato depth 14 cents
DEF_PITCH_RANGE = 2           # semitones
NUM_VOICES = 9
NUM_SLOTS = 16
MOD_OPS = [0, 1, 2, 8, 9, 10, 16, 17, 18]     # register offsets of operator 1 per voice
CAR_OPS = [3, 4, 5, 11, 12, 13, 19, 20, 21]   # register offsets of operator 2 per voice
P_VAL_BNK = 32767

U_AVEKM, U_KSLTL, U_ADSR, U_WS, U_FBC, U_FREQ = 0x80, 0x40, 0x20, 0x10, 0x08, 0x01
U_ALL = 0xF9
FREE, KEYON = 0, 1


def _array0_init():
    regs = {}
    regs[0x01] = 0x20                 # waveform select enable
    regs[0x04] = 0x60                 # mask timers
    for r in range(0x20, 0x36):
        regs[r] = 0x01
    for r in range(0x40, 0x56):
        regs[r] = 63
    for r in range(0x60, 0x76):
        regs[r] = 0xFF
    for r in range(0x80, 0x96):
        regs[r] = 0x0F
    regs[0xBD] = DEF_AV_DEPTH
    return [(r, regs.get(r, 0)) for r in range(0x01, 0xF6)]


def _ru(x):
    """`cmp al,1 / sbb al,-1`: increment a non-zero byte (driver's round-up)."""
    return x + 1 if x else 0


class _Slot:
    __slots__ = ("status", "voice", "channel", "note", "keynum", "transpose", "velocity",
                 "sustain", "update", "block", "kbf", "fbc", "ksl0", "ksl1", "lvl0", "lvl1",
                 "avekm0", "avekm1", "mult0", "mult1", "ad0", "ad1", "sr0", "sr1",
                 "ws0", "ws1", "fb", "scale", "timbre")

    def __init__(self):
        self.status = FREE
        self.voice = -1


class AilOplDriver:
    """Model of the AIL 2 XMIDI driver for a single YM3812 (SBFM.ADV / ADLIB.ADV
    build: 9 melodic voices, no OPL rhythm mode, mono).  16 virtual slots, circular
    voice assignment, priority-based voice stealing, velocity table, volume x
    expression x velocity scaling of the carrier (and of the modulator for additive
    timbres), modulation >= 64 -> vibrato bit, pitch wheel +-2 semitones, MIDI
    channel 10 = percussion via bank-127 timbres whose transpose byte is the fixed
    note.  `write(reg, val)` receives the OPL register writes."""

    def __init__(self, write, installed: dict[tuple[int, int], bytes]):
        self.write = write
        self.cache = dict(installed)                    # (patch, bank) -> 14-byte record
        self.slots = [_Slot() for _ in range(NUM_SLOTS)]
        self.v_channel = [-1] * NUM_VOICES
        self.rover = -1
        ch = range(16)
        self.vol = [127 for _ in ch]
        self.mod = [0 for _ in ch]
        self.pan = [64 for _ in ch]
        self.expr = [127 for _ in ch]
        self.sus = [0 for _ in ch]
        self.bank = [0 for _ in ch]
        self.vprot = [0 for _ in ch]
        self.pitch = [0x2000 for _ in ch]
        self.timbre = [None for _ in ch]
        self.program = [-1 for _ in ch]
        self.voices = [0 for _ in ch]
        self.stats = {"note_on": 0, "note_on_no_timbre": 0, "note_on_no_slot": 0,
                      "voiced": 0, "stolen": 0, "unvoiced": 0, "note_off": 0}
        for r, v in _array0_init():
            self.write(r, v)

    # ------------------------------------------------------------- hardware
    def _wop(self, op, base, val):
        self.write(base + op, val & 0xFF)

    def _update(self, s: _Slot):
        if s.voice < 0:
            return
        v = s.voice
        m, c = MOD_OPS[v], CAR_OPS[v]
        ch = s.channel
        if s.update & U_AVEKM:
            vib = 0x40 if self.mod[ch] >= 64 else 0
            self._wop(m, 0x20, s.mult0 | vib | s.avekm0)
            self._wop(c, 0x20, s.mult1 | vib | s.avekm1)
        if s.update & U_KSLTL:
            vol = _ru((self.vol[ch] * self.expr[ch] * 2) >> 8 & 0xFF)
            vol = _ru((vol * s.velocity * 2) >> 8 & 0xFF)
            l0 = s.lvl0
            if s.scale & 1:
                l0 = l0 * vol // 127
            self._wop(m, 0x40, ((~l0) & 0x3F) | s.ksl0)
            l1 = s.lvl1
            if s.scale & 2:
                l1 = l1 * vol // 127
            self._wop(c, 0x40, ((~l1) & 0x3F) | s.ksl1)
        if s.update & U_ADSR:
            self._wop(m, 0x60, s.ad0)
            self._wop(c, 0x60, s.ad1)
            self._wop(m, 0x80, s.sr0)
            self._wop(c, 0x80, s.sr1)
        if s.update & U_WS:
            self._wop(c, 0xE0, s.ws1)
            self._wop(m, 0xE0, s.ws0)
        if s.update & U_FBC:
            self.write(0xC0 + v, (s.fb & 0x0E) | (s.fbc & 1))
        if s.update & U_FREQ:
            if not s.block & 0x20:
                self.write(0xB0 + v, s.kbf & 0xDF)
            else:
                fnum = self._fnum(s)
                self.write(0xA0 + v, fnum & 0xFF)
                s.kbf = ((fnum >> 8) | s.block) & 0xFF
                self.write(0xB0 + v, s.kbf)
        s.update = 0

    def _fnum(self, s: _Slot):
        bend = ((self.pitch[s.channel] - 0x2000) >> 5) * DEF_PITCH_RANGE  # 1/256 semitone
        n = s.note + s.transpose - 24
        n += 12
        while n < 0:
            n += 12
        n += 12
        n -= 12
        while n > 95:
            n -= 12
        ax = bend & 0xFFFF
        ax = ((((ax >> 8) + n) & 0xFF) << 8) | (ax & 0xFF)
        ax = (ax + 8) & 0xFFFF
        if ax & 0x8000:
            ax -= 0x10000
        ax >>= 4                                     # 1/16 semitones
        ax -= 192
        ax += 192
        while ax < 0:
            ax += 192
        ax += 192
        ax -= 192
        while ax > 96 * 16 - 1:
            ax -= 192
        di = ax >> 4
        f = FREQ_TABLE[(di % 12) * 16 + (ax & 15)]
        block = di // 12 - 1
        if f & 0x8000:
            block += 1
            f -= 0x10000
        if block < 0:
            block = 0
            f >>= 1
        f &= 0xFFFF
        return ((((f >> 8) & 3) | (block << 2)) << 8) | (f & 0xFF)

    # ------------------------------------------------------------- voices
    def _assign(self, s: _Slot):
        for _ in range(NUM_VOICES):
            self.rover = (self.rover + 1) % NUM_VOICES
            if self.v_channel[self.rover] == -1:
                s.voice = self.rover
                self.voices[s.channel] += 1
                self.v_channel[self.rover] = s.channel
                s.update = U_ALL
                self._update(s)
                self.stats["voiced"] += 1
                return
        self._priority()
        if s.voice < 0:
            self.stats["unvoiced"] += 1

    def _release(self, s: _Slot):
        if s.voice < 0:
            return
        s.block &= 0xDF
        s.update |= U_FREQ
        self._update(s)
        self.voices[s.channel] -= 1
        self.v_channel[s.voice] = -1
        s.voice = -1
        s.status = FREE

    def _priority(self):
        pri = {}
        cnt = 0
        for k, s in enumerate(self.slots):
            if s.status == FREE:
                continue
            cnt += 1
            p = 0xFFFF if self.vprot[s.channel] >= 64 else P_VAL_BNK
            pri[k] = max(p - self.voices[s.channel], 0)
        while True:
            hi, lo = 0, 0xFFFF
            high_p = low_p = None
            for k, s in enumerate(self.slots):
                if s.status == FREE:
                    continue
                p = pri[k]
                if s.voice == -1:
                    if p >= hi:
                        hi, high_p = p, k
                elif p <= lo:
                    lo, low_p = p, k
            if hi < lo or hi == 0 or high_p is None or low_p is None:
                return
            victim = self.slots[low_p]
            voice = victim.voice
            self._release(victim)
            self.stats["stolen"] += 1
            s = self.slots[high_p]
            s.voice = voice
            self.voices[s.channel] += 1
            self.v_channel[voice] = s.channel
            s.update = U_ALL
            self._update(s)
            self.stats["voiced"] += 1
            cnt -= 1
            if cnt == 0:
                return

    # ------------------------------------------------------------- MIDI
    def _bnk_phase(self, s: _Slot, t: bytes):
        s.block = 0x20
        s.fbc = t[8] & 1
        s.fb = t[8]
        s.ksl0, s.lvl0 = t[4] & 0xC0, (~t[4]) & 0x3F
        s.ksl1, s.lvl1 = t[10] & 0xC0, (~t[10]) & 0x3F
        s.avekm0, s.mult0 = t[3] & 0xF0, t[3] & 0x0F
        s.avekm1, s.mult1 = t[9] & 0xF0, t[9] & 0x0F
        s.ad0, s.sr0, s.ws0 = t[5], t[6], t[7]
        s.ad1, s.sr1, s.ws1 = t[11], t[12], t[13]
        s.scale = s.fbc | 2
        s.update = U_ALL

    def note_on(self, ch, note, vel):
        self.stats["note_on"] += 1
        if ch == RHYTHM_CHANNEL:
            t = self.cache.get((note, RHYTHM_BANK))
        else:
            t = self.timbre[ch]
        if t is None:
            self.stats["note_on_no_timbre"] += 1
            return
        s = next((x for x in self.slots if x.status == FREE), None)
        if s is None:
            self.stats["note_on_no_slot"] += 1
            return
        s.channel, s.keynum = ch, note
        tr = t[2] - 256 if t[2] >= 128 else t[2]
        if ch == RHYTHM_CHANNEL:
            s.note, s.transpose = t[2], 0
        else:
            s.note, s.transpose = note, tr
        s.velocity = VEL_GRAPH[vel >> 3]
        s.timbre = t
        s.status = KEYON
        s.sustain = 0
        if struct.unpack("<H", t[:2])[0] != 14:
            return                                     # OPL3 / TVFX timbres: not on SBFM
        self._bnk_phase(s, t)
        s.voice = -1
        self._assign(s)

    def note_off(self, ch, note):
        for s in self.slots:
            if s.status != KEYON or s.keynum != note or s.channel != ch:
                continue
            if self.sus[ch] >= 64:
                s.sustain = 1
                continue
            self.stats["note_off"] += 1
            self._release(s)
            s.status = FREE

    def _flag(self, ch, flag):
        for s in self.slots:
            if s.status != FREE and s.channel == ch:
                s.update |= flag
                self._update(s)

    def send(self, status, d1, d2):
        kind, ch = status & 0xF0, status & 0x0F
        if kind == 0x90:
            if d2 == 0:
                self.note_off(ch, d1)
            else:
                self.note_on(ch, d1, d2)
        elif kind == 0x80:
            self.note_off(ch, d1)
        elif kind == 0xC0:
            self.program[ch] = d1
            self.timbre[ch] = self.cache.get((d1, self.bank[ch]))
        elif kind == 0xE0:
            self.pitch[ch] = (d2 << 7) | d1
            self._flag(ch, U_FREQ)
        elif kind == 0xB0:
            if d1 == CC_PATCH_BANK_SEL:
                self.bank[ch] = d2
            elif d1 == CC_VOICE_PROTECT:
                self.vprot[ch] = d2
            elif d1 == CC_MODULATION:
                self.mod[ch] = d2
                self._flag(ch, U_AVEKM)
            elif d1 == CC_PART_VOLUME:
                self.vol[ch] = d2
                self._flag(ch, U_KSLTL)
            elif d1 == CC_EXPRESSION:
                self.expr[ch] = d2
                self._flag(ch, U_KSLTL)
            elif d1 == CC_PANPOT:
                self.pan[ch] = d2                      # mono card: no effect
                self._flag(ch, U_KSLTL)
            elif d1 == CC_SUSTAIN:
                self.sus[ch] = d2
                if d2 < 64:
                    for s in self.slots:
                        if s.status != FREE and s.channel == ch and s.sustain:
                            self.note_off(ch, s.note)
            elif d1 == CC_RESET_ALL_CTRLS:
                self.sus[ch] = 0
                for s in self.slots:
                    if s.status != FREE and s.channel == ch and s.sustain:
                        self.note_off(ch, s.note)
                self.mod[ch], self.expr[ch], self.pitch[ch] = 0, 127, 0x2000
                self._flag(ch, U_AVEKM | U_KSLTL | U_FREQ)
            elif d1 == CC_ALL_NOTES_OFF:
                for s in self.slots:
                    if s.status == KEYON and s.channel == ch:
                        self.note_off(ch, s.note)
            # everything else (incl. CC 0 bank select MSB) is ignored by the driver

    def active_voices(self):
        return sum(1 for c in self.v_channel if c != -1)


# ==================================================================== renderers


def _tick_bounds(rate):
    """Sample count of each 120 Hz interval (fractional accumulation)."""
    k = 0
    while True:
        yield (k + 1) * rate // QUANT_RATE - k * rate // QUANT_RATE
        k += 1


def render_opl(seq: XmiSequence, bank: AdBank, rate=DEFAULT_RATE, max_tail_s=4.0,
               max_seconds=None):
    """Render one sequence through DBOPL (pyopl).  Returns (int16 mono ndarray, info)."""
    import numpy as np
    import pyopl

    chip = pyopl.opl(rate, 2, 1)
    installed = {}
    missing = []
    for p, b in seq.timbres:
        t = bank.get(p, b)
        if t is None:
            missing.append((p, b))
        else:
            installed[(p, b)] = t
    drv = AilOplDriver(chip.writeReg, installed)
    sq = XmidiSequencer(seq, drv)
    chunks = []
    buf = bytearray(512 * 2)

    def gen(n):
        while n > 0:
            m = min(n, 512)
            mv = memoryview(buf)[:m * 2]
            chip.getSamples(mv)
            chunks.append(np.frombuffer(bytes(mv), dtype="<i2"))
            n -= m

    sizes = _tick_bounds(rate)
    max_ticks = None if max_seconds is None else int(max_seconds * QUANT_RATE)
    peak_voices = 0
    while sq.step():
        peak_voices = max(peak_voices, drv.active_voices())
        gen(next(sizes))
        if max_ticks is not None and sq.tick >= max_ticks:
            break
    queued_at_end = sq.note_count
    sq.flush()
    end_samples = sum(len(c) for c in chunks)
    # release tail: render until 50 ms of near-silence or max_tail_s
    tail = 0
    while tail < max_tail_s * rate:
        gen(rate // 20)
        tail += rate // 20
        if np.abs(chunks[-1].astype(np.int32)).max() < 8:
            break
    audio = np.concatenate(chunks) if chunks else np.zeros(0, np.int16)
    nz = np.nonzero(np.abs(audio.astype(np.int32)) >= 8)[0]
    keep = max(end_samples, int(nz[-1]) + 1 if len(nz) else 0)
    audio = audio[:keep]
    info = dict(drv.stats)
    info.update(notes_dispatched=sq.notes_dispatched, queue_overflows=sq.queue_overflows,
                notes_queued_at_end=queued_at_end, peak_voices=peak_voices,
                missing_timbres=missing, sequence_samples=end_samples)
    return audio, info


SOUNDFONT_URL = ("https://raw.githubusercontent.com/mrbumpy409/GeneralUser-GS/main/"
                 "GeneralUser-GS.sf2")
SOUNDFONT_NAME = "GeneralUser-GS.sf2"


def ensure_soundfont(cache_dir):
    path = os.path.join(cache_dir, SOUNDFONT_NAME)
    if not os.path.exists(path):
        os.makedirs(cache_dir, exist_ok=True)
        tmp = path + ".part"
        print("downloading %s -> %s" % (SOUNDFONT_URL, path))
        with urllib.request.urlopen(SOUNDFONT_URL, timeout=120) as r, open(tmp, "wb") as f:
            while True:
                blk = r.read(1 << 20)
                if not blk:
                    break
                f.write(blk)
        with open(tmp, "rb") as f:
            if f.read(4) != b"RIFF":
                os.remove(tmp)
                raise RuntimeError("downloaded SoundFont is not a RIFF file")
        os.replace(tmp, path)
    return path


class _GmSink:
    def __init__(self, synth, sfid):
        self.s = synth
        self.sfid = sfid
        self.stats = {"note_on": 0, "program_fallback": 0}
        for ch in range(16):
            synth.program_select(ch, sfid, 0, 0, is_drums=(ch == RHYTHM_CHANNEL))

    def send(self, status, d1, d2):
        kind, ch = status & 0xF0, status & 0x0F
        s = self.s
        if kind == 0x90 and d2:
            self.stats["note_on"] += 1
            s.noteon(ch, d1, d2)
        elif kind in (0x80, 0x90):
            s.noteoff(ch, d1)
        elif kind == 0xC0:
            try:
                s.program_change(ch, d1, is_drums=(ch == RHYTHM_CHANNEL))
            except RuntimeError:
                self.stats["program_fallback"] += 1
                s.program_change(ch, 0, is_drums=(ch == RHYTHM_CHANNEL))
        elif kind == 0xB0:
            if d1 not in (0, 32):                      # bank select: stay on GM bank 0
                s.control_change(ch, d1, d2)
        elif kind == 0xE0:
            s.pitchbend(ch, (d2 << 7) | d1)


def render_gm(seq: XmiSequence, sf2_path, rate=DEFAULT_RATE, max_tail_s=4.0,
              max_seconds=None, gain_db=0.0):
    """Render one sequence as General MIDI with TinySoundFont.  Returns (int16 stereo
    ndarray shape (n, 2), info)."""
    import numpy as np
    import tinysoundfont

    synth = tinysoundfont.Synth(samplerate=rate, gain=gain_db)
    sfid = synth.sfload(sf2_path)
    sink = _GmSink(synth, sfid)
    sq = XmidiSequencer(seq, sink)
    chunks = []

    def gen(n):
        mv = synth.generate_simple(n)
        chunks.append(np.frombuffer(bytes(mv), dtype=np.float32).reshape(-1, 2))

    sizes = _tick_bounds(rate)
    max_ticks = None if max_seconds is None else int(max_seconds * QUANT_RATE)
    while sq.step():
        gen(next(sizes))
        if max_ticks is not None and sq.tick >= max_ticks:
            break
    queued_at_end = sq.note_count
    sq.flush()
    end_samples = sum(len(c) for c in chunks)
    tail = 0
    while tail < max_tail_s * rate:
        gen(rate // 20)
        tail += rate // 20
        if np.abs(chunks[-1]).max() < 1e-4:
            break
    audio = np.concatenate(chunks)
    nz = np.nonzero(np.abs(audio).max(axis=1) >= 1e-4)[0]
    audio = audio[:max(end_samples, int(nz[-1]) + 1 if len(nz) else 0)]
    peak = float(np.abs(audio).max()) if len(audio) else 0.0
    scale = 1.0
    if peak > 0.98:                                    # keep headroom, never clip
        scale = 0.98 / peak
    pcm = np.clip(np.round(audio * scale * 32767), -32768, 32767).astype(np.int16)
    info = dict(sink.stats)
    info.update(notes_dispatched=sq.notes_dispatched, queue_overflows=sq.queue_overflows,
                notes_queued_at_end=queued_at_end, sequence_samples=end_samples,
                extra_gain_db=round(20 * np.log10(scale), 2) if scale != 1 else 0.0)
    return pcm, info


# ======================================================================== cache

TRACK_NAMES = ["STARTUP"] + ["INT%d" % i for i in range(24)] + ["ANIM"]
VARIANTS = ("opl", "gm")
VARIANT_PREFIX = {"opl": "S", "gm": "R"}     # 155e:032f's s / r prefix (music.md §3)
DEFAULT_OUT = default_music_cache()
MANIFEST = "manifest.json"
AD_FILE = "MIDPAK.AD"
COMMAND = "python -m warlords2.audio.music_render"


def stem(name: str, variant: str) -> str:
    """Cache stem of a track: prefix + name, e.g. ('INT12', 'opl') -> 'SINT12'."""
    return VARIANT_PREFIX[variant] + name


def track_source(name: str, variant: str) -> str:
    """Game-directory path of a track's XMI file."""
    return "%s/%s.XMI" % ("START" if name == "ANIM" else "SOUND", stem(name, variant))


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_manifest(out_dir=DEFAULT_OUT) -> dict | None:
    """The cache's manifest.json, or None when there is none or it does not parse."""
    try:
        with open(Path(out_dir) / MANIFEST) as f:
            m = json.load(f)
    except (OSError, ValueError):
        return None
    return m if isinstance(m, dict) and isinstance(m.get("tracks"), dict) else None


def stale(manifest: dict | None, gd: GameDir, stems, out_dir=DEFAULT_OUT) -> list[str]:
    """The stems of `stems` the cache cannot play as current renders of this game copy:
    no manifest entry, no WAV, another RENDERER_VERSION, or an XMI (for S stems also a
    MIDPAK.AD) whose SHA-256 differs from the entry's."""
    tracks = (manifest or {}).get("tracks", {})
    ad_sha = None
    out = []
    for s in stems:
        e = tracks.get(s)
        ok = (isinstance(e, dict) and e.get("renderer_version") == RENDERER_VERSION
              and (Path(out_dir) / e.get("wav", "")).is_file())
        if ok:
            src = gd.path(e.get("source", ""))
            ok = src.is_file() and sha256(src.read_bytes()) == e.get("source_sha256")
        if ok and e.get("variant") == "opl":
            if ad_sha is None:
                ad = gd.path(AD_FILE)
                ad_sha = sha256(ad.read_bytes()) if ad.is_file() else ""
            ok = ad_sha == e.get("midpak_ad_sha256")
        if not ok:
            out.append(s)
    return out


def audio_stats(pcm, rate=DEFAULT_RATE):
    import numpy as np
    x = pcm.astype(np.float64)
    if x.ndim == 2:
        mono = x.mean(axis=1)
    else:
        mono = x
    peak = float(np.abs(x).max()) if x.size else 0.0
    rms = float(np.sqrt((mono ** 2).mean())) if mono.size else 0.0
    clipped = int(np.count_nonzero(np.abs(x) >= 32767))
    # spectral centroid / band energy of the whole track
    spec = np.abs(np.fft.rfft(mono[: 1 << 21])) if mono.size else np.zeros(1)
    freqs = np.fft.rfftfreq(min(mono.size, 1 << 21), 1 / rate) if mono.size else np.zeros(1)
    tot = spec.sum() or 1.0
    centroid = float((spec * freqs).sum() / tot)
    # fraction of 1-second windows that are silent
    win = rate
    nwin = max(1, mono.size // win)
    silent = sum(1 for k in range(nwin)
                 if np.sqrt((mono[k * win:(k + 1) * win] ** 2).mean()) < 30)
    return {"peak": int(peak), "peak_dbfs": round(20 * np.log10(peak / 32768), 2) if peak else None,
            "rms_dbfs": round(20 * np.log10(rms / 32768), 2) if rms else None,
            "clipped_samples": clipped, "spectral_centroid_hz": round(centroid, 1),
            "silent_seconds": silent}


def write_wav(path, pcm, rate):
    channels = 1 if pcm.ndim == 1 else pcm.shape[1]
    tmp = str(path) + ".part"
    with wave.open(tmp, "wb") as w:
        w.setnchannels(channels)
        w.setsampwidth(2)
        w.setframerate(rate)
        w.writeframes(pcm.astype("<i2").tobytes())
    os.replace(tmp, path)


def _write_manifest(out_dir, manifest):
    manifest["tracks"] = dict(sorted(manifest["tracks"].items()))
    path = Path(out_dir) / MANIFEST
    tmp = str(path) + ".part"
    with open(tmp, "w") as f:
        json.dump(manifest, f, indent=1)
    os.replace(tmp, path)


def render_track(gd: GameDir, name: str, variant: str, out_dir, *, bank=None, ad_sha=None,
                 sf2=None, sf2_sha=None, rate=DEFAULT_RATE, max_seconds=None) -> dict:
    """Render one track to <out_dir>/<stem>.wav and .mid; returns its manifest entry."""
    rel = track_source(name, variant)
    raw = gd.read(rel)
    seq = parse_xmi(raw).sequences[0]
    st_name = stem(name, variant)
    with open(Path(out_dir) / (st_name + ".mid"), "wb") as f:
        f.write(xmi_to_smf(seq))
    if variant == "opl":
        pcm, info = render_opl(seq, bank, rate, max_seconds=max_seconds)
    else:
        pcm, info = render_gm(seq, sf2, rate, max_seconds=max_seconds)
    write_wav(Path(out_dir) / (st_name + ".wav"), pcm, rate)
    loops = seq.loop_points()
    entry = {
        "track": name, "variant": variant, "wav": st_name + ".wav", "mid": st_name + ".mid",
        "source": rel, "source_sha256": sha256(raw),
        "renderer_version": RENDERER_VERSION,
        "sample_rate": rate, "channels": 1 if pcm.ndim == 1 else 2,
        "duration_s": round(len(pcm) / rate, 3),
        "sequence_end_s": round(seq.end_tick / QUANT_RATE, 3),
        "end_tick": seq.end_tick,
        "loop_point": loops[0] if loops else None,
        "notes_in_file": len(seq.notes()), "render": info, "audio": audio_stats(pcm, rate),
    }
    if variant == "opl":
        entry["midpak_ad_sha256"] = ad_sha
    else:
        entry["soundfont_sha256"] = sf2_sha
    if max_seconds is not None:
        entry["max_seconds"] = max_seconds        # a test render, never current
        entry["renderer_version"] = None
    return entry


def _report(entry):
    info, st = entry["render"], entry["audio"]
    ok = info["notes_dispatched"] == entry["notes_in_file"] or "max_seconds" in entry
    print("%-8s %6.1fs seq %6.1fs notes %4d/%4d %s peak %5s dBFS rms %6s dBFS clip %d%s" % (
        entry["wav"][:-4], entry["duration_s"], entry["sequence_end_s"],
        info["notes_dispatched"], entry["notes_in_file"],
        ("voiced %d stolen %d nslot %d ntimb %d" % (
            info["voiced"], info["stolen"], info["note_on_no_slot"],
            info["note_on_no_timbre"])) if entry["variant"] == "opl" else
        ("fallback %d" % info["program_fallback"]),
        st["peak_dbfs"], st["rms_dbfs"], st["clipped_samples"],
        "" if ok else "  NOTE COUNT MISMATCH"))
    return ok


def render(gd: GameDir, out_dir=DEFAULT_OUT, variants=VARIANTS, tracks=TRACK_NAMES, *,
           force=False, soundfont=None, rate=DEFAULT_RATE, max_seconds=None,
           optional=()) -> int:
    """Render `tracks` of each variant into the cache, skipping current entries unless
    `force`; the manifest is rewritten after every track.  Returns 0 when every track
    was rendered (or current) with all its notes, else 1.  A variant in `optional` whose
    Python packages are missing is skipped with a note and does not fail the run (the
    default variant set of the command line)."""
    import importlib.util
    out_dir = Path(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    manifest = load_manifest(out_dir) or {"tracks": {}}
    rc = 0
    rendered = 0
    for variant in variants:
        need = ["numpy", "pyopl"] if variant == "opl" else ["numpy", "tinysoundfont"]
        missing = [m for m in need if importlib.util.find_spec(m) is None]
        if missing:
            print("%s: skipped, missing %s (see requirements-music.txt)"
                  % (variant, ", ".join(missing)))
            if variant not in optional:
                rc = 1
            continue
        kw = {"rate": rate, "max_seconds": max_seconds}
        if variant == "opl":
            ad = gd.path(AD_FILE)
            if not ad.is_file():
                print("opl: skipped, %s not found in %s" % (AD_FILE, gd.root))
                rc = 1
                continue
            raw = ad.read_bytes()
            kw.update(bank=parse_ad(raw), ad_sha=sha256(raw))
            manifest["opl_renderer"] = {
                "emulator": "DOSBox DBOPL (pyopl 2.0, GPL-3.0-only)",
                "driver_model": "AIL 2 Yamaha XMIDI driver, YM3812, mono",
                "timbres": AD_FILE}
        else:
            sf2 = soundfont or ensure_soundfont(os.path.join(default_music_cache().parent, "cache",
                                                             "soundfonts"))
            with open(sf2, "rb") as f:
                sf2_sha = sha256(f.read())
            kw.update(sf2=sf2, sf2_sha=sf2_sha)
            manifest["gm_renderer"] = {
                "synth": "TinySoundFont (tinysoundfont 0.3.7, MIT)",
                "soundfont": os.path.basename(sf2), "soundfont_sha256": sf2_sha}
        stems = [stem(n, variant) for n in tracks]
        todo = set(stems) if force else set(stale(manifest, gd, stems, out_dir))
        if variant == "gm" and not force:
            todo |= {s for s in stems
                     if manifest["tracks"].get(s, {}).get("soundfont_sha256") != kw["sf2_sha"]}
        for name in tracks:
            s = stem(name, variant)
            if s not in todo:
                continue
            if not gd.path(track_source(name, variant)).is_file():
                print("%-8s missing %s" % (s, track_source(name, variant)))
                rc = 1
                continue
            entry = render_track(gd, name, variant, out_dir, **kw)
            manifest["tracks"][s] = entry
            _write_manifest(out_dir, manifest)
            rendered += 1
            if not _report(entry):
                rc = 1
        print("%s: %d of %d track(s) current already" % (variant, len(stems) - len(todo),
                                                        len(stems)))
    _write_manifest(out_dir, manifest)
    print("rendered %d track(s) into %s" % (rendered, out_dir))
    return rc


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog=COMMAND, description=__doc__.split("\n")[0])
    ap.add_argument("game_dir", nargs="?", default=None)
    ap.add_argument("out_dir", nargs="?", default=None)
    ap.add_argument("--variant", choices=["opl", "gm", "all"], default=None)
    ap.add_argument("--tracks", nargs="*")
    ap.add_argument("--force", action="store_true")
    ap.add_argument("--soundfont", help="SF2 file for --variant gm (default: download "
                    "GeneralUser GS into out/cache/soundfonts/)")
    ap.add_argument("--rate", type=int, default=DEFAULT_RATE)
    ap.add_argument("--max-seconds", type=float, default=None,
                    help="stop each render after this many seconds (testing; such entries "
                    "are never current)")
    a = ap.parse_args(argv)

    names = []
    for t in a.tracks or TRACK_NAMES:
        u = t.upper().removesuffix(".XMI")
        if u not in TRACK_NAMES and u[:1] in "MRS" and u[1:] in TRACK_NAMES:
            u = u[1:]
        if u not in TRACK_NAMES:
            ap.error("unknown track %r" % t)
        if u not in names:
            names.append(u)
    data = Path(a.game_dir) if a.game_dir else default_data()
    if data is None:
        ap.error("no game directory: pass GAME_DIR or set WL2_DATA")
    gd = GameDir(data)
    if not gd.root.is_dir():
        ap.error("game directory not found: %s" % gd.root)
    variants = VARIANTS if a.variant in (None, "all") else (a.variant,)
    optional = ("gm",) if a.variant is None else ()      # not asked for: a missing synth is a note
    return render(gd, a.out_dir or DEFAULT_OUT, variants, names, force=a.force,
                  soundfont=a.soundfont, rate=a.rate, max_seconds=a.max_seconds,
                  optional=optional)


if __name__ == "__main__":
    sys.exit(main())
