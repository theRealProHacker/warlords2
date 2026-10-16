# Warlords II (1993, DOS, v1.02) — sound and music files

Converter: `tools/dump_sound.py <gamedir> <outdir>` → `out/sound/*.wav`.
Evidence tags and address notation are the same as in `docs/formats/tables.md`
(`ovlNN:OOOO` / `SSSS:OOOO`, "flat" = linear address in `out/rea/WARLORD2_flat.exe`).

## 1. Digital sound: SOUND/*.8SN (36 files) and START/DING0.SND

**Format: headerless, unsigned 8-bit, mono PCM at 11000 Hz.**

- No header **[bytes]**: every file starts and ends close to the rest level (first/last bytes within
  0x78–0x89, typically 0x7E–0x80),
  the mean of all samples is ≈126.5, and the loader uses the *file length* as the sample
  count.
- Loader `155e:04e9` (flat 0x25ac9) **[EXE]**: opens the file, allocates `filelength`
  bytes, reads the whole file, stores pointer and length in an 11-byte slot table at
  `DS:7068` (10 slots), then fills the driver's sound structure at `DS:705c`:
  far pointer to the data, `u16` length, far pointer to a "playing" flag, and
  **`u16` frequency = 0x2AF8 = 11000** (`mov word [7066h], 2AF8h` at `155e:05d0`,
  flat 0x25bb0) and calls the driver through `INT 66h` with `AX = 068Ah`
  (`0000:02bb`, flat 0x102bb).
- Player `155e:065e` (flat 0x25c3e) **[EXE]**: fills the same structure, again with
  frequency 11000 (`155e:06a9`, flat 0x25c89), and calls `INT 66h, AX = 068Bh`
  (`0000:02ce`). Status polling uses `AX = 0689h`, driver name `AX = 068Ch`.
- Signedness: the structure and the `INT 66h / AX=068xh` interface are those of the
  DIGPAK digital driver loaded from the `.COM` named in SOUND.DAT (e.g. SBLASTER.COM);
  the data are handed over unconverted. Unsigned is **[bytes]** (silence = 0x7F/0x80,
  not 0x00) — the converter therefore copies the samples unchanged into an 8-bit WAV
  (which is unsigned by definition).
- Since the length field is 16-bit, a sound is limited to 65535 bytes; the largest file
  is 43725 bytes (≈4.0 s).
- `START/DING0.SND` is played by START.EXE, not WARLORD2.EXE (string `start\ding0.snd`
  in START.EXE). START.EXE contains the identical instruction pattern
  `C7 06 xx xx F8 2A` (store 11000) twice, at file offsets 0xD23F and 0xD318
  **[bytes]**: START.EXE's DIGPAK request 0c07:065d stores 0x2AF8 = 11000 into the request
  at 0c07:06a8 (and 0c07:05cf) before INT 66h, so DING0.SND plays at **11000 Hz [V]**
  (docs/research/start_exe.md §3.2 step 18).

### What the files are used for

File names come from FILE.DAT (group, index); the `.TXT` caption with the same base name
(tables.md §15) is shown while a voice clip plays.

| FILE.DAT group | files | use | confidence |
|---|---|---|---|
| 37 | dramatic.8SN, orch.8SN | stingers; `ovl58:01a9` (flat 0x7db99) plays index 0 or 1 by argument and waits for its end: dramatic at a human's ruin search (ovl34:01fe) and sage visit (ovl34:0af7), orch after a human hero's guardian message (ovl34:02b1) | [EXE] (`audio.effects`) |
| 38 | war.8SN | `ovl58:0206` (flat 0x7dbf6), waits for its end: a human attacker's battle start (ovl36:1a28) | [EXE] (`audio.effects`) |
| 39 | splash.8SN | `ovl58:023d` (flat 0x7dc2d): armies sunk for lack of a boat (0b62:11f8), a dying hero's items lost on Water (ovl36:173b), a human's drop on Water (ovl47:09a1) | [EXE] (`audio.effects`) |
| 40–46 | vlose05 … vlose35 | advisor speech, losing (group 45 repeats vlose25; there is no vlose30): the side's city count c fell below the bucket kept in SCN 0x108[p]; the new bucket t = c / 5 * 5 picks the group, else 46 | [EXE] ovl58:02ab..0718 (`rules.turn.advice_file`) |
| 47–53 | vwin05(a) … vwin35 | advisor speech, winning: c reached the bucket + 5, group by t, else 47 | as above |
| 54, 55 | vgold00, vgold01(a) | advisor speech about treasury, every 7th turn: gold < 100 / gold > 2800 | as above |
| 56, 57 | vhero00, vhero01 | advisor speech about heroes, every 7th turn: no hero / five or more. Group 87 names the caption `vhero1.TXT` while the sound is `vhero01.8SN` — the caption file on disk is indeed VHERO1.TXT | [bytes] |
| 58 | vmess00 … vmess03 | advisor remarks, every 7th turn otherwise when rnd(1, 5, 0) == 1, one picked at random (`ovl58:06f7` passes index −1 for the caption group 88) | [EXE] |
| 59–62 | vgreet0, vmoment, vbegin, vquit (+ .TXT) | greeting, "one moment", begin, quit | [inferred] from names/captions |
| 63 | turn.8SN | `ovl58:0b93`: a human side's turn start, while the "Turn" pop-up shows (ovl68:0415) | [EXE] (`audio.effects`) |
| 64 | army.8SN (0), ding.8SN (1), chord.8SN (2), army2.8SN (5) | preloaded at start-up by `ovl58:0bc5` (flat 0x7e5b5) into slots `DS:5974..597e`; `ovl58:0181` plays army/army2 | [EXE]; UI click/ack sounds [inferred] |

The numbers in the `vwin`/`vlose` names (05…35) are the city-count buckets c / 5 * 5
(`ovl58:02ab..0718`, SCN 0x100[p] / 0x108[p]; no face on turn 1) **[EXE]**; face, captions and
blink are ovl58:0293..0ef2 (`audio.voice`).

Effects are skipped when `DS:0bec` is 0 (OPTIONS.SND digit 1, tables.md §9) and when the
digital driver is `NO_SOUND` or `IBMBAK.COM` (`155e:0104` sets `DS:37ab` for that name; `155e:065e` then prints a BEL
character via `printf("%c", 7)` instead of calling the driver, and nothing is loaded).

## 2. Music: SOUND/*.XMI, START/*ANIM.XMI

**Format: Miles Sound System Extended MIDI (XMIDI)** **[bytes]**: IFF structure
`FORM XDIR { INFO }` + `CAT XMID { FORM XMID { TIMB, EVNT } }`, one sequence per file.
Playback goes through the MIDPAK driver: the game loads `MIDPAK.COM`, `MIDPAK.AD` and the
`.ADV` driver named in SOUND.DAT (`155e:0156…020f`) **[EXE]**.

### File-name prefixes M / R / S

`155e:032f` (flat 0x2590f) builds the name as `"%s%s%s"` = directory (`SOUND\`, FILE.DAT
group 7) + one prefix letter + base name (`STARTUP.XMI`, `INTn.XMI`) **[EXE]**:

| prefix | chosen when | meaning |
|---|---|---|
| `S` | default (any other `.ADV`: AdLib, Sound Blaster FM, PAS, …) | FM-synth arrangement |
| `M` | music driver in SOUND.DAT is `MT32MPU.ADV` (flag `DS:37ac`) | Roland MT-32 arrangement |
| `R` | music driver is `SC32MPU.ADV` (flag `DS:37ad`; tested last, so it wins) | Roland SCC-1 / Sound Canvas arrangement — "Roland" naming [inferred] from the driver file name |

(The letters are the strings "s", "m", "r" at `DS:3872/3874/3876`.) At most 10000 bytes of
a file are read into a fixed buffer (`155e:03cc`); the largest XMI is 9296 bytes.
MINT21.XMI and SINT21.XMI are byte-identical **[bytes]**. START/MANIM, RANIM, SANIM.XMI
follow the same prefix scheme for the START.EXE intro (0c07:0344..0375, docs/research/start_exe.md)
**[EXE]**.

### Track usage

`ovl58:0000` (flat 0x7d9f0; file offset 0x73b40) is `play_music(mode)` **[EXE]**, read from a
raw-byte disassembly (the `out/asm` listing of its head is broken by case labels; the far
calls in the bytes are unrelocated, `0130:04a8` = `155e:04a8`). A negative FILE.DAT index
makes ovl59:052f draw `rnd(1, n, -1)` on the game's dice (n = the group's entry count, one
die also for a 1-entry group), so the music is game logic (`rules/music.py`, plan register
X32). The call returns at once with the music off (`DS:0bee == 0`, before `DS:2632` is
written) and when the mode equals the last one (`DS:2632`) while the sequence still plays
(`155e:04a8`); else `DS:2632 = mode`, a playing sequence is stopped (`155e:0466`, a hard cut),
the track is picked and loaded (`155e:032f`) and started with `155e:0412(0, repeat)`.

| mode | FILE.DAT (group, index) → tracks | die | called from | occasion |
|---:|---|---|---|---|
| 0 | (8, 0) → STARTUP | none | ovl60:00fb (Game Start screen, every entry), ovl57:003a (Game Setup entry), ovl49:13b7 (load of a saved map) | pre-game screens **[EXE]** |
| 1 | (10, -1) → INT0, 4, 6, 9, 10, 16, 17, 23 | rnd(1, 8, -1) | ovl68:0546 (human turn start, no hero offer), ovl49:040a (end of a load), ovl36:2668 (medal pop-up closed), ovl33:05a0 (Settings: music switched on) | the human phase **[EXE]** |
| 2 | see below | 1 or 2 | ovl61:21d4 (main loop, every computer side, before ovl68:0000) | the computer phase **[EXE]** |
| 3 | (9, -1) → INT12, INT21, INT12 | rnd(1, 3, -1) | ovl01:272c (quest completed, human, after the reward), ovl61:1fc0 (victory screen) | success **[EXE]** |
| 4 | (12, 0) → INT11 | none | ovl68:0529 (human turn start with a hero offer, before the offer dialog ovl47:0d5c) | hero offer **[EXE]** |
| 5 | (13, -1) → INT1, INT8 | rnd(1, 2, -1) | ovl01:0006 (temple menu ovl01:0000, human) | temple **[EXE]** |
| 6 | (14, -1) → INT14 | rnd(1, 1, -1) | ovl34:0aad (sage ovl34:0aa0, human) | sage **[EXE]** |
| 7 | (15, 0) → INT15 | none | ovl47:0726 (hero promotion pop-up ovl47:0672, human) | hero level up **[EXE]** |
| 8 | (16, 0) → INT18 | none | ovl36:24c9 (medal pop-up ovl36:2274, human attacker) | medal **[EXE]** |
| 9 | (17, 0) → INT19 | none | ovl61:1f76 (surrender offer ovl61:1f68) | surrender offer **[EXE]** |
| 10 | (18, 0) → INT20 | none | ovl61:1edb (surrender declined, button 0x1e6 ovl61:1ecd) | surrender declined **[EXE]** |
| 11 | (19, 0) → INT22 | none | ovl57:0e24 (Begin) | Begin; INT22 is a 17.8 s piece (music.md) **[EXE]** |

The calls with a human gate test ovl25:09ab (computer side on turn) or the battle's attacker
(DS:41fa). The second argument of `155e:0412` is the repeat flag (`DS:37a9`): 1 for every
mode but 2, which passes 0 (`ovl58:011b`). The poller `155e:02ab` (event loop 08a9:0081 on
idle, main loop ovl61:2206 after each computer side) restarts an ended sequence with bit 0
set (the same track, no new die) and stops one without it, so every mode but 2 loops and mode
2 plays once **[EXE]**. Nothing fades, segues or pauses (`155e:04c3`, `0c5d`, `049a`, `048c`
have no caller); effects and speech play on DIGPAK beside it.

Mode 2 **[EXE]** (`ovl58:0096..011d`): if at least one live human side exists
(`2c04:0137[p] != 0` and `2c04:00d0[p] == 0`, p < 8), a random track of group 11
(INT2, 3, 5, 7, 13: one die). If there is none, r = rnd(1, 100, 0) is drawn first: r < 6 →
group 12 (INT11, its 1-entry pick still draws), r ≥ 53 → group 10, otherwise group 11.

Tracks INT22/INT23 exist for every prefix; there is no INT24+.
Music is skipped when `DS:0bee` is 0 (OPTIONS.SND digit 0; forced 0 without a music driver,
ovl58:0c32..0c45) or the music driver is `NO_SOUND` (`DS:37a3 == 0`: `155e:032f`, `0412`,
`04a8` do nothing). The Settings switch (ovl33:0576(0)) stops the sequence whichever way it
goes and, switched on, calls mode 1.

## 3. SOUND.DAT

`<digital driver .COM> <music driver .ADV> <number>` — see tables.md §14. The third
number is stored at `DS:37a4` (cleared when the digital driver is `NO_SOUND`); its
meaning is **[unknown]**.

## 4. Unknowns

Register T4 is closed: the effects' occasions are the callers listed in §1
(`audio.effects`), the advisor's choice is ovl58:02ab..0718 (`rules.turn.advice_file`), and
DING0.SND plays at 11000 Hz (§1).
