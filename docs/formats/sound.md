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
  **[bytes]**; the file has the same headerless unsigned shape, so 11000 Hz is used for
  it as well — **[inferred]**, START.EXE was not disassembled.

### What the files are used for

File names come from FILE.DAT (group, index); the `.TXT` caption with the same base name
(tables.md §15) is shown while a voice clip plays.

| FILE.DAT group | files | use | confidence |
|---|---|---|---|
| 37 | dramatic.8SN, orch.8SN | stingers; `ovl58:01a9` (flat 0x7db99) plays index 0 or 1 by argument | [EXE] loading; occasions [unknown] |
| 38 | war.8SN | `ovl58:0206` (flat 0x7dbf6) | [EXE]; "battle start" [inferred] from the name |
| 39 | splash.8SN | `ovl58:023d` (flat 0x7dc2d) | [EXE]; "army lost at sea / boat" [inferred] |
| 40–46 | vlose05 … vlose35 | advisor speech, losing (group 45 repeats vlose25; there is no vlose30) | [bytes]; selection logic in `ovl58:026f` not traced |
| 47–53 | vwin05(a) … vwin35 | advisor speech, winning | as above |
| 54, 55 | vgold00, vgold01(a) | advisor speech about treasury | as above |
| 56, 57 | vhero00, vhero01 | advisor speech about heroes. Group 87 names the caption `vhero1.TXT` while the sound is `vhero01.8SN` — the caption file on disk is indeed VHERO1.TXT | [bytes] |
| 58 | vmess00 … vmess03 | advisor remarks, one picked at random (`ovl58:06f7` passes index −1 for the caption group 88) | [EXE] |
| 59–62 | vgreet0, vmoment, vbegin, vquit (+ .TXT) | greeting, "one moment", begin, quit | [inferred] from names/captions |
| 63 | turn.8SN | turn change | [inferred] |
| 64 | army.8SN (0), ding.8SN (1), chord.8SN (2), army2.8SN (5) | preloaded at start-up by `ovl58:0bc5` (flat 0x7e5b5) into slots `DS:5974..597e`; `ovl58:0181` plays army/army2 | [EXE]; UI click/ack sounds [inferred] |

The numbers in the `vwin`/`vlose` names (05…35) are **[unknown]** (thresholds of some
score comparison — to be confirmed from `ovl58:026f`).

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
follow the same prefix scheme for the START.EXE intro **[inferred]**.

### Track usage

`ovl58:0000` (flat 0x7d9f0) is `play_music(mode)` **[EXE]**; a negative index asks the
string getter for a random member of the group.

| mode | FILE.DAT group → tracks | called from | occasion |
|---:|---|---|---|
| 0 | 8 → STARTUP | ovl57:0000, ovl60:0000, ovl49:12f2 | title / setup screens [EXE call sites] |
| 1 | 10, random → INT0, 4, 6, 9, 10, 16, 17, 23 | ovl33:0576 (sound options), ovl36:2274 (after a medal), ovl49:02d3 ("thy turn continues"), ovl68:04bd | general in-game music pool [inferred] |
| 2 | see below | ovl61:2123 | computer/other player's turn [inferred] |
| 3 | 9, random → INT12, INT21, INT12 | ovl01:1ded (quest failed/invalid, "Alas!"), ovl61:1fbd | bad news [inferred] |
| 4 | 12 → INT11 | ovl68:04bd | [unknown] |
| 5 | 13, random → INT1, INT8 | ovl01:0000 (temple dialog) | temple [EXE call site] |
| 6 | 14 → INT14 | ovl34:0aa0 (search result popup) | ruin/sage result [inferred] |
| 7 | 15 → INT15 | ovl47:0672 (hero dialog) | hero offer/arrival [inferred] |
| 8 | 16 → INT18 | ovl36:2274 (medal award) | medal [EXE call site] |
| 9 | 17 → INT19 | ovl61:1f68 | end-of-game sequence A [unknown which] |
| 10 | 18 → INT20 | ovl61:1ecd | end-of-game sequence B [unknown which] |
| 11 | 19 → INT22 | ovl57:0cfe | INT22 is a 382-byte file — effectively silence [inferred] |

After loading, every mode starts the sequence with `155e:0412(0, 1)`, except mode 2 which
passes `(0, 0)`; the meaning of that second argument (repeat?) is **[unknown]**.

Mode 2 **[EXE]** (`ovl58:0096..0120`): if at least one active human player exists
(`2c04:0137[p] != 0` and `2c04:00d0[p] == 0`), a random track of group 11
(INT2, 3, 5, 7, 13) is played. If there is none, r = 1..100 is rolled: r < 6 → group 12
(INT11), r ≥ 53 → random track of group 10, otherwise group 11.

Tracks INT22/INT23 exist for every prefix; there is no INT24+.
Music is skipped when `DS:0bee` is 0 (OPTIONS.SND digit 0) or the music driver is
`NO_SOUND`.

## 3. SOUND.DAT

`<digital driver .COM> <music driver .ADV> <number>` — see tables.md §14. The third
number is stored at `DS:37a4` (cleared when the digital driver is `NO_SOUND`); its
meaning is **[unknown]**.

## 4. Unknowns

- Exact occasion for dramatic/orch/war/splash and the advisor-speech selection rules
  (`ovl58:026f`, not traced).
- Which end-game situations use INT19 and INT20; what INT11 (mode 4) marks.
- DING0.SND's rate is inferred (see §1).
