# Warlords II (1993, DOS, v1.02) — music: XMIDI files, timbre bank, rendering

Code: `warlords2/formats/xmi.py` (`parse_xmi`, `parse_ad`, `sequence_ticks`),
`warlords2/audio/music_render.py` (sequencer, AIL OPL driver model, renderers, the cache).
Renderer: `python -m warlords2.audio.music_render [<game_dir>] [<out_dir>] [--variant
opl|gm|all] [--tracks ...] [--force]` (also `tools/render_music.py`, a thin wrapper) →
`out/music/<stem>.wav`, `<stem>.mid`, `manifest.json` (§9). Extra packages:
`requirements-music.txt` (the opl packages; tinysoundfont for gm is installed by hand).
Without `--variant` both variants are rendered and a variant whose package is missing is
skipped with a note (exit 0 when the rest succeeded), so the bare command works with only
`requirements-music.txt`; an explicit `--variant gm` / `all` fails (exit 1) without it.
Tests: `tests/test_formats_music.py`.
Evidence tags as in `tables.md` / `sound.md`: **[bytes]** = read from the data,
**[EXE]** = from the executables/drivers, **[src]** = from the published AIL source,
**[inferred]**, **[unknown]**. The file names, the M/R/S prefix logic and the track-usage
table come from `sound.md` §2; this document adds the data-level detail.

## 1. Files

| files | count | variant |
|---|---:|---|
| `SOUND/{M,R,S}STARTUP.XMI`, `SOUND/{M,R,S}INT0..23.XMI` | 3 × 25 | one sequence each |
| `START/{M,R,S}ANIM.XMI` | 3 | intro of START.EXE |

`MINT21.XMI` = `SINT21.XMI` and `MANIM.XMI` = `SANIM.XMI` byte for byte **[bytes]**.

## 2. XMI structure as found **[bytes]**

```
FORM <be32 14> XDIR
    INFO <be32 2>  u16le sequence count = 1
CAT  <be32 n>  XMID
    FORM <be32 n> XMID
        TIMB <be32 2+2k>  u16le k, then k × {u8 patch, u8 bank}
        EVNT <be32 n>     event stream (below)
```

No `RBRN` (branch) chunk in any file. IFF sizes are big-endian; odd chunk bodies are
followed by a pad byte. In 45 of the 78 files the EVNT size is even although the stream
ends one byte earlier: the byte after `FF 2F 00` is a `00` pad counted *inside* the chunk
(EVNT size = consumed bytes rounded up to even). The parser accounts for every byte.

EVNT stream (as walked by AIL's `serve_driver`, xmidi.asm **[src]**):

- byte `< 0x80` in status position: interval count. The driver waits that many 120 Hz
  intervals (a 0 would wait 1; none occur). Long gaps are runs of `7F` bytes.
- `9c note vel dur`: note-on with a MIDI-style variable-length **duration** in intervals;
  there are no note-off events in the files. The driver queues the note (32-entry
  queue) and sends the note-off itself after `dur` intervals.
- `Bc`, `Cc`, `Ec`, `Ac`: ordinary 3/2/3/3-byte channel messages; no running status.
- `FF type vlq-len data`: meta; `F0/F7 vlq-len data`: sysex (none present).

Content of all 78 files **[bytes]**:

| item | found |
|---|---|
| channels | MIDI 2–6 (index 1–5) melodic, 10 (index 9) percussion |
| channel messages | note-on, program change, CC 0 (value 0), CC 7, CC 1 (only INT5: 334 modulation events) |
| absent | pitch bend, aftertouch, sysex, pan, expression, sustain, all XMIDI controllers 110–120 (no FOR/NEXT loops 116/117, no callbacks 119, no bank select 114) |
| metas | `51` tempo, `58` time signature, `2F` end of track |
| notes | 52 (INT22) … 1852 (SSTARTUP) per file |
| length | 17.8 s (INT22) … 276.7 s (INT9) at 120 intervals/s |

**Length.** `sequence_ticks(data)` = the tick of the End-Of-Track event; the sequence
plays `sequence_ticks / 120` s, which is how long MIDPAK reports it as playing (sound.md
§2, 155e:04a8) **[src]** / **[inferred]** for MIDPAK. S lengths of the mode-2 tracks:
INT2 16626 ticks (138.55 s), INT3 14408 (120.07), INT5 24748 (206.23), INT7 19242
(160.35), INT13 24474 (203.95), INT11 27955 (232.96); group 10 116.5 … 276.7 s. The R
arrangement differs for some tracks (INT2 16592 = 138.27 s, INT7 20169 = 168.08 s), so the
variant changes the timing.

**Timing.** AIL plays XMIDI at a fixed 120 intervals/s; tempo metas only feed the
beat/bar counters (xmidi.asm `XMIDI_meta`, `time_per_beat`) and do not change the
interval rate **[src]**. MIDIFORM already baked tempo into the intervals. Within one
interval the driver first expires queued notes (note-offs), then dispatches events. A
note queued with duration d is released d intervals later (0 or 1 → next interval).

**Loop points.** None of the files contains FOR/NEXT, so the manifest has
`"loop_point": null`. The sequencer still implements controllers 116/117 as AIL does
(finite FOR counts are unrolled; an infinite loop, count 0, is played once and reported in
`loop_point`). Whether the game restarts a finished sequence is decided outside the
file (`155e:0412` second argument, sound.md §2, **[unknown]**). The AIL driver does
**not** silence notes still queued at End-Of-Track (`reset_sequence` does not flush the
queue) **[src]**; in these files no note is still queued at EOT **[bytes]** (checked by
the renderer: `notes_queued_at_end` = 0 for all 52 rendered files).

## 3. Device variants M / R / S

The name logic is in both executables: WARLORD2.EXE `155e:032f` (sound.md §2) and
START.EXE, which has the same strings `"MT32MPU.ADV" "SC32MPU.ADV" "s" "m" "r" "%s%s%s"`
at file offset 0x1214e–0x1216c and `"start\\"`, `"anim.xmi"` at 0x11a86/0x11a8d **[EXE]**.

| prefix | chosen when | the data |
|---|---|---|
| **S** | any other `.ADV` (ADLIB, ADLIBG, SBFM, SBP1FM, SBP2FM, PASFM, PASOPL) | MT-32 program numbers (57 of 81 melodic channel programs identical to M, the rest changed for the FM bank), all requested timbres present in MIDPAK.AD → **OPL arrangement** |
| **M** | `MT32MPU.ADV` | MT-32 numbering: e.g. 112 Timpani, 16 Harpsi 1, 48 Str Sect 1, 51 Pizzicato, 58 Harp |
| **R** | `SC32MPU.ADV` | **General MIDI numbering** — on the same channels R has 47 Timpani (for M 112, 8×), 6 Harpsichord (M 16), 48 String Ensemble (M 48), 45 Pizzicato (M 51), 46 Harp (M 58), 61 Brass Section (M 24/25/27), 11 Vibraphone / 14 Tubular Bells (M 97/102, MT-32 mallet range). INT2's percussion uses other note numbers (GM 58/76/77/80/82 for MT-32 39/60–62/73) |

`SC32MPU.ADV` is byte-identical to `MT32MPU.ADV` (an AIL MT-32/MPU-401 driver, "Roland
MT-32 or compatible with Roland MPU MIDI Interface") **[bytes]**: the R files are simply
GM data sent through the MPU driver to a Sound Canvas/SCC-1 ("SC" [inferred] from the
name). The S files are *not* GM.

## 4. MIDPAK.AD — AIL global timbre library **[bytes]**

```
index:  n × { u8 patch, u8 bank, u32le offset }   ended by the word FF FF
record: u16le length (includes itself) + length-2 bytes
```

- 256 index entries (1536 bytes) + `FF FF` → records start at 0x602; each record is 14
  bytes at consecutive offsets; 126 zero bytes of padding follow the last record (file
  5248 bytes).
- bank 0: patches 0–127 (melodic, MT-32-numbered as the S data shows); bank 127: the
  percussion ("RBS") timbres keyed by MIDI note. Entry 228 is `(0, 127)` where `(100,
  127)` would be expected, so note 0 has two entries (the first wins) and note 100 has
  none — no file uses either note.
- 14-byte record = AIL ".BNK-style" OPL2 timbre (`BNK` struct in yamaha.inc **[src]**):

| byte | field |
|---:|---|
| 0–1 | length = 14 |
| 2 | transpose (signed, semitones). All melodic timbres: 0. Percussion: **the fixed note to play** |
| 3–7 | modulator: AM/VIB/EG/KSR/MULT (reg 20), KSL/TL (40), AR/DR (60), SL/RR (80), WS (E0) |
| 8 | feedback/connection (C0) |
| 9–13 | carrier: same five registers |

A 25-byte record would be an OPL3 4-operator timbre (only used by OPL3 builds with a `.OPL`
bank); none exist here. Every (patch, bank) requested by any TIMB chunk of any variant
exists in MIDPAK.AD. The percussion timbre (52, 127) has TL = 63 on both operators, i.e. it
is silent: the 45 note-52 hits in STARTUP (and those in other tracks) produce no sound on
OPL **[bytes]**.

## 5. The OPL renderer (`--variant opl`)

Pipeline: `parse_xmi` → `XmidiSequencer` (xmidi.asm interval loop) → `AilOplDriver`
(model of the AIL 2 Yamaha XMIDI driver) → OPL register writes → DOSBox **DBOPL** (via
the `pyopl` wheel) at 44.1 kHz, 16-bit **mono** → WAV.

The driver model is a translation of the AIL/32 1.05 source (`YAMAHA32.INC`,
`XMIDI32.ASM`, John Miles, released as freeware in 2000), assembled for the YM3812 /
Sound Blaster FM build (`SBFM.ADV` is the driver in the shipped `SOUND.DAT`). It was
checked against the shipped real-mode driver **[EXE]**: `SBFM.ADV` contains the identical
velocity table (offset 0x55a), F-number table (0x130, 192 words), register init array
(0x370), controller defaults (127,0,64,127,0 at 0x222d) and default programs; its
`note_on` (0x1efe) and `assign_voice` (0x1772) disassemble to the same logic (velocity
`>>3` + table lookup, channel 10 → bank 127 with fixed note, 16 slots, circular search
over 9 voices with a persistent rover, else priority stealing). What is reproduced:

- reset: WSE on, timers masked, all operators muted, BD = 0xC0 (AM 4.8 dB, vibrato 14 ¢);
- program change → timbre lookup (patch, bank from CC 114, default 0); CC 0 is ignored
  by the driver; timbres not requested in TIMB are unavailable (none needed);
- note-on: 16 virtual slots, 9 OPL2 voices, circular voice assignment, stealing by
  priority (32767 − voices in channel; ties → highest slot), notes without voice wait
  silently until note-off;
- velocity curve `vel_graph[vel>>3]` (82…127), level = vol × expression × velocity with
  the driver's integer rounding, scaling the carrier TL (and the modulator TL for
  additive timbres);
- F-number/block from the driver's 1/16-semitone table, note range folded into
  MIDI 12–107 (note 108 plays an octave low, as on the card), pitch-bend range ±2
  (unused), modulation ≥ 64 sets the vibrato bit (INT5);
- percussion: channel 10, timbre (note, 127), pitch = the timbre's fixed note, played
  on melodic voices (no OPL rhythm mode — AIL never enables it);
- note durations, interval timing and ordering exactly as `serve_driver`.

Render log per file (manifest `render`): notes dispatched = notes in file for all 26
tracks; 0 notes without timbre, 0 without slot, 0 queue overflows; voice stealing
happens in 10 tracks (up to 172 steals in INT5) — that is the 9-voice limit of the card.

### Fidelity limits (what is approximated or not verified)

- **Emulator**: DBOPL is a good but not bit-exact YM3812 model (Nuked OPL3 would be
  closer); it renders at 49716 Hz internally and resamples to 44.1 kHz. No Sound Blaster
  output stage (DAC, analogue low-pass, amplifier) is modelled.
- **Driver**: translated from the 32-bit AIL/32 1.05 source, not from the 1992 real-mode
  `SBFM.ADV` instruction by instruction; tables and the main routines were matched, the
  volume/frequency arithmetic was not single-stepped. MIDPAK.COM's own layer (it wraps
  AIL 2) was not examined; a relative volume other than 100 % set by the game would
  scale CC 7 and is **[unknown]** (assumed 100 %).
- **Card choice**: rendered as `SBFM.ADV` (mono OPL2). The OPL3 builds (SBP2FM, ADLIBG,
  PASOPL) and dual-OPL2 builds (SBP1FM, PASFM) differ only by stereo panning and more
  voices (18 on OPL3 → fewer steals); with no pan controllers and 2-op timbres the
  difference would be the voice limit only **[inferred]**.
- **Timing**: exact 120 Hz with all register writes at the start of an interval; the
  real PIT rate (1193182/9943 ≈ 120.0003 Hz) and write latency are ignored.
- **End**: the sequence part is `sequence_end_s` long; after it the renderer releases all
  notes (as `stop_seq` would) and keeps up to 4 s of release tail (trimmed at silence, cut
  at 4 s if still ringing — SINT0/14/18/19/20, SSTARTUP, SANIM). The ringing comes from the
  crash-cymbal timbre (49, 127): modulator RR = 0, carrier RR = 2, so crashes sustain for
  seconds; it is also the broadband noise visible in STARTUP's spectrum.
  For looping in a game, loop the first `sequence_end_s` seconds (`duration_s` includes
  the tail).
- **Loudness**: levels are the data's own (rms −19 … −43 dBFS); no normalisation.
  Manifest `audio.rms_dbfs` lets the game equalise if desired.
- **Not listened to.** All checks are numeric (note counts, levels, clipping, spectra,
  pitch of the F-number calculation); no listener has compared the renders with the
  original hardware or DOSBox, so perceptual correctness is unverified.

## 6. The GM renderer (`--variant gm`)

`parse_xmi` → `XmidiSequencer` → TinySoundFont, R files, channel 10 as drum kit, GM bank 0,
CC 0 ignored, 44.1 kHz 16-bit stereo, fixed 0 dB gain (scaled down only if a track would
clip; none did). SoundFont: GeneralUser GS v2.0.x, downloaded on first use into
`out/cache/soundfonts/GeneralUser-GS.sf2` (git-ignored; sha256 recorded in the manifest).
This is *not* an emulation of a Sound Canvas: different samples, no reverb/chorus
(the SC-55 applies reverb by default), different volume/velocity curves; and on the real
setup the MT-32 driver's initialisation messages would also reach the SC — **[unknown]**
effect. Levels range widely (RINT0/4/5/16/23 ≈ −44 … −48 dBFS rms) because of low
velocities and CC 7 values in the R data.

`.mid` files (both variants): type 0, division 60 PPQN with tempo 500000 µs → one SMF tick
= one interval; the XMIDI tempo metas are dropped, note-ons are split into note-on +
note-off at the effective duration; ordering per interval as in AIL.

## 7. Track usage

WARLORD2.EXE `ovl58:0000(mode)` (raw-byte disassembly at file offset 0x73b40, `rules.music`,
`rules.constants.music`; EL §9.8 addition "Music"; sound.md §2) **[V asm]**. Each mode names a
FILE.DAT (group, index) (index -1: a random entry, `ovl59:052f` rnd(1, n, -1) on the game's
dice) and plays it from SOUND\ with the driver's prefix; the second argument of
`155e:0412` is the repeat flag (DS:37a9 bit 0): every mode loops (the poller `155e:02ab`
restarts the ended sequence, no new die) except mode 2, which plays once.

| mode | FILE.DAT | tracks | callers |
|---:|---|---|---|
| 0 | (8, 0) | STARTUP | Game Start entry ovl60:00fb, Game Setup entry ovl57:003a, saved-map load ovl49:13b7 |
| 1 | (10, -1) | INT0, 4, 6, 9, 10, 16, 17, 23 | human turn start ovl68:0546, end of a load ovl49:040a, after the medal pop-up ovl36:2668, Settings music on ovl33:05a0 |
| 2 | (11, -1); no live human: rnd(1, 100, 0) < 6 -> (12, -1), >= 53 -> (10, -1) | INT2, 3, 5, 7, 13; without a live human also INT11 or a group-10 track | before each computer side ovl61:21d4; plays once |
| 3 | (9, -1) | INT12, INT21, INT12 (INT12 2 of 3) | quest completed ovl01:272c, victory screen ovl61:1fc0 |
| 4 | (12, 0) | INT11 | hero offer at the human turn start ovl68:0529 |
| 5 | (13, -1) | INT1, INT8 | temple menu ovl01:0006 |
| 6 | (14, -1) (one entry, a die all the same) | INT14 | sage ovl34:0aad |
| 7 | (15, 0) | INT15 | hero promotion ovl47:0726 |
| 8 | (16, 0) | INT18 | medal pop-up ovl36:24c9 |
| 9 | (17, 0) | INT19 | surrender offer ovl61:1f76 |
| 10 | (18, 0) | INT20 | surrender declined ovl61:1edb |
| 11 | (19, 0) | INT22 | Begin ovl57:0e24 |

ANIM = START.EXE's intro (START\?ANIM.XMI, see §3; START.EXE is not disassembled, its use is
**[unverified]**). Correction to an earlier sound.md: INT22 is not silence — it is a 17.8 s,
52-note single-channel piece (all three variants) **[bytes]**.

| track | S seq s | S wav s | S rms dBFS | R seq s | R rms dBFS | notes S / R | use |
|---|---:|---:|---:|---:|---:|---:|---|
| STARTUP | 174.3 | 176.0 | -23.0 | 174.3 | -31.1 | 1852 / 1813 | mode 0 (Game Start, Setup, saved-map load) |
| INT0 | 147.8 | 151.7 | -30.1 | 147.8 | -46.9 | 788 / 788 | mode 1 (turn start, load, after the medal, Settings on); mode 2 without a live human, r >= 53 |
| INT1 | 151.9 | 152.0 | -26.6 | 151.9 | -23.9 | 405 / 405 | mode 5 (temple) |
| INT2 | 138.6 | 140.5 | -39.2 | 138.3 | -18.1 | 974 / 974 | mode 2 (computer sides) |
| INT3 | 120.1 | 123.3 | -27.2 | 120.1 | -19.8 | 498 / 498 | mode 2 (computer sides) |
| INT4 | 191.4 | 191.5 | -34.0 | 191.4 | -44.1 | 277 / 277 | mode 1 (turn start, load, after the medal, Settings on); mode 2 without a live human, r >= 53 |
| INT5 | 206.2 | 206.8 | -41.3 | 206.2 | -46.0 | 1293 / 1293 | mode 2 (computer sides) |
| INT6 | 116.5 | 118.7 | -32.8 | 116.5 | -28.8 | 754 / 754 | mode 1 (turn start, load, after the medal, Settings on); mode 2 without a live human, r >= 53 |
| INT7 | 160.35 | 161.5 | -31.3 | 168.1 | -42.8 | 1406 / 1406 | mode 2 (computer sides) |
| INT8 | 243.0 | 243.8 | -38.2 | 243.0 | -36.2 | 428 / 428 | mode 5 (temple) |
| INT9 | 276.7 | 277.3 | -32.1 | 276.7 | -42.2 | 475 / 475 | mode 1 (turn start, load, after the medal, Settings on); mode 2 without a live human, r >= 53 |
| INT10 | 273.8 | 276.8 | -25.9 | 273.8 | -28.8 | 1092 / 1092 | mode 1 (turn start, load, after the medal, Settings on); mode 2 without a live human, r >= 53 |
| INT11 | 233.0 | 235.1 | -22.3 | 233.0 | -32.0 | 1488 / 1488 | mode 4 (hero offer); mode 2 without a live human, r < 6 |
| INT12 | 143.1 | 143.5 | -19.3 | 142.9 | -22.3 | 1020 / 1020 | mode 3 (quest completed, victory) |
| INT13 | 203.9 | 206.7 | -21.8 | 203.9 | -24.6 | 1203 / 1203 | mode 2 (computer sides) |
| INT14 | 120.8 | 124.0 | -24.4 | 120.8 | -27.4 | 803 / 803 | mode 6 (sage) |
| INT15 | 47.7 | 49.6 | -28.0 | 47.7 | -23.1 | 319 / 319 | mode 7 (hero promotion) |
| INT16 | 192.4 | 193.8 | -32.0 | 192.4 | -47.6 | 610 / 610 | mode 1 (turn start, load, after the medal, Settings on); mode 2 without a live human, r >= 53 |
| INT17 | 266.4 | 267.2 | -32.2 | 266.4 | -35.7 | 1015 / 1015 | mode 1 (turn start, load, after the medal, Settings on); mode 2 without a live human, r >= 53 |
| INT18 | 49.5 | 52.9 | -27.4 | 49.5 | -26.7 | 271 / 271 | mode 8 (medal) |
| INT19 | 34.6 | 36.9 | -24.9 | 34.6 | -29.6 | 561 / 561 | mode 9 (surrender offer) |
| INT20 | 37.1 | 40.0 | -24.5 | 37.1 | -23.1 | 298 / 298 | mode 10 (surrender declined) |
| INT21 | 173.2 | 173.2 | -19.9 | 170.4 | -17.8 | 1668 / 1668 | mode 3 (quest completed, victory) |
| INT22 | 17.8 | 19.3 | -35.2 | 17.8 | -39.3 | 52 / 52 | mode 11 (Begin) |
| INT23 | 148.4 | 149.0 | -43.1 | 148.4 | -44.1 | 549 / 549 | mode 1 (turn start, load, after the medal, Settings on); mode 2 without a live human, r >= 53 |
| ANIM | 49.0 | 53.0 | -20.6 | 48.8 | -21.7 | 376 / 376 | START.EXE intro [unverified] |

Rendered files: no clipped samples in any file. One-second windows below −60 dBFS rms
inside the sequence part occur only where the score rests or plays very softly (SINT2
opening drums, SINT4/8/18 rests); in the GM renders soft pad passages of RINT5, RINT9,
RINT8, RINT17 and RINT23 also fall below that line (low velocities, CC 7 ≈ 60–75).

## 8. Dependencies and licences

Only the renderer needs these (`requirements-music.txt`, imported lazily when rendering);
the game plays the rendered WAVs and needs none of them.


| component | use | licence |
|---|---|---|
| `pyopl` 2.0 (wheel) — DOSBox DBOPL | OPL emulation | **GPL-3.0-only** (no permissively licensed OPL core is available as a wheel; ymfm, BSD-3-Clause, would be a buildable alternative) |
| `tinysoundfont` 0.3.7 (wheel, installed `--no-deps`) | GM synthesis | MIT |
| GeneralUser GS v2.0.x by S. Christian Collins | GM SoundFont, downloaded to the git-ignored cache, not tracked | GeneralUser GS License v2.0 (free use incl. commercial; do not hot-link the author's downloads) |
| AIL/32 1.05 source (`YAMAHA32.INC`, `XMIDI32.ASM`) | reference for the driver model (translated, not copied) | "open-source freeware, usable by anyone for any purpose" (John Miles, 2000) |
| ScummVM `miles_adlib.cpp` | consulted only to cross-check the reading of the AIL source; no code taken | GPL-2.0+ |

No MT-32 ROMs are used. No game data is stored in tracked files.

## 9. The WAV cache

`out/music/` below the repository (git-ignored; another directory as `<out_dir>`). One
render per **stem** = variant prefix + track (`SINT12`, `RSTARTUP`, `SANIM`): `--variant
opl` renders the S files, `gm` the R files, `all` (default) both; the M (MT-32) files are
not rendered. FILE.DAT groups 8..19 name the tracks without prefix (`INT12.XMI`); the EXE
loads `SOUND\` + prefix + name (155e:032f), so a FILE.DAT entry maps to stem prefix + base
name. All 26 entries of groups 8..19 (the 25 SOUND tracks) and `ANIM` are rendered.

`manifest.json`:

```
{ "opl_renderer": {emulator, driver_model, timbres},
  "gm_renderer":  {synth, soundfont, soundfont_sha256},
  "tracks": { "<stem>": {
      track, variant ("opl" | "gm"), wav, mid, source (game-dir path of the XMI),
      source_sha256       SHA-256 of the XMI file
      midpak_ad_sha256    (opl) SHA-256 of MIDPAK.AD, the timbres
      soundfont_sha256    (gm)  SHA-256 of the SF2
      renderer_version    music_render.RENDERER_VERSION at render time (null for a
                          --max-seconds test render)
      sample_rate, channels, duration_s (incl. the <= 4 s release tail),
      end_tick, sequence_end_s = end_tick / 120 (rounded to ms), loop_point,
      notes_in_file, render {...driver / synth counters}, audio {peak, rms, ...} } } }
```

An entry is **current** for a game copy while its WAV exists, its `renderer_version` is
the module's, `source_sha256` equals the XMI's and, for S stems, `midpak_ad_sha256` equals
MIDPAK.AD's (`music_render.stale(manifest, gamedir, stems)` lists the stems that are not;
the player uses it). That is the cache key: XMI + MIDPAK.AD SHA-256 (R renders do not
depend on MIDPAK.AD; they are keyed by XMI + SoundFont, the SoundFont checked by the
renderer only). The renderer skips current entries unless `--force` and rewrites the
manifest after every track. A change of the renderer that changes its output bumps
`RENDERER_VERSION`.
