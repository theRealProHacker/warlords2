# Warlords II (1993, DOS, v1.02) — data tables and text resources

Byte-level description of the non-graphic, non-scenario data files. Decoder:
`tools/dump_tables.py <gamedir> <outdir>` (writes `out/tables/*.json`), tests in
`tests/test_formats_tables.py`.

All integers are little-endian. Text is CP437, NUL-terminated inside fixed fields.

Evidence tags used below:

- **[bytes]** verified from the file bytes alone (sizes divide exactly, every record parses).
- **[EXE]** verified from WARLORD2.EXE code; the address is given as `ovlNN:OOOO`
  (overlay number : offset inside that overlay) or `SSSS:OOOO` (resident segment),
  followed by the linear address in the flattened image `out/rea/WARLORD2_flat.exe`
  (Ghidra load segment 0x1000). `DS:` means DGROUP (segment 0x3125), `2c04:` is the
  far game-state segment.
- **[inferred]** deduced from value patterns or naming; not confirmed in code.
- **[unknown]** not determined.

Nothing here is taken from documentation of other Warlords versions.

---

## 1. TERRAIN0/ARMYTYPE.DAT and ARMYTYP2.DAT (1798 bytes each)

29 records of 62 bytes, no header **[bytes]**. The whole file (0x706 bytes) is read into
one block by `ovl44:1128` (flat 0x716c8) **[EXE]**; the path is FILE.DAT group 21 formatted
with the terrain-set number (`TERRAIN%d\...`), and the index into that group is `DS:26c4`,
which is set to 1 by the `s` command-line switch at `0a4c:00f8` (flat 0x1a5b8) — so
ARMYTYP2.DAT is the "alternate army names" table **[EXE]**.

The two files differ only in four names (34 bytes): Ghosts→Shamblers, Demons→Gargoyles,
Devils→Imps, Archons→Winged Folk **[bytes]** (READ.ME lists the same four).

Records are stored sorted roughly by strength, not by id. The game finds a record by
scanning for `type_id` (`ovl44:14ac`, flat 0x71a4c, copies the matching 62-byte record)
**[EXE]**.

| off | size | field | meaning | confidence |
|----:|-----:|-------|---------|------------|
| 0 | u16 | `type_id` | army type number 0..28 (28 = Hero); also the picture index | [EXE] lookup key at ovl44:14c2; picture use [inferred] |
| 2 | char[20] | `name` | display name | [bytes] |
| 22 | i16 | w0 `strength` | base strength | [EXE] copied to city slot array +0x1e at ovl11:1be9 (flat 0x52ef9), shown as "Strength" by ovl45:1245→ovl16:0000 (flat 0x72fa5 → 0x54cf0) |
| 24 | i16 | w1 `turns` | production time in turns | [EXE] → city slot array +0x1a (ovl11:1bc1), shown as "Time" |
| 26 | i16 | w2 `cost` | production cost per unit | [EXE] → city slot array +0x26 (ovl11:1bd5), shown as "Cost" |
| 28 | i16 | w3 `moves` | movement points | [EXE] → city slot array +0x22 (ovl11:1bfd), shown as "Move" |
| 30 | i16 | w4 `buy_price` | gold to buy this production for a city; shown as "%d gp" and compared against the player's gold | [EXE] ovl44:0ced / ovl44:0d58 (flat 0x7128d / 0x712f8). Negative for allies/navy/hero (cannot be bought) — meaning of the magnitude [unknown] |
| 32 | i16 | w5 `str_bonus_city` | "+%d str in city" (own strength) | [EXE] ovl66:1b70 (text), ovl66:1dec (use) |
| 34 | i16 | w6 `str_bonus_open` | "+%d str in open" | [EXE] ovl66:1b63, 1dd2 |
| 36 | i16 | w7 `str_bonus_woods` | "+%d str in woods" | [EXE] ovl66:1b56, 1db8 |
| 38 | i16 | w8 `str_bonus_hills` | "+%d str in hills" | [EXE] ovl66:1b49, 1d9e |
| 40 | i16 | w9 `stack_bonus_city` | "+%d stack in city" | [EXE] ovl66:1b3c, 1cd1 |
| 42 | i16 | w10 `stack_bonus_open` | "+%d stack in open" | [EXE] ovl66:1b2f, 1cb0 |
| 44 | i16 | w11 `stack_bonus_woods` | "+%d stack in woods" | [EXE] ovl66:1b22, 1c8f |
| 46 | i16 | w12 `stack_bonus_hills` | "+%d stack in hills" | [EXE] ovl66:1b15, 1c6e |
| 48 | i16 | w13 `special` | 1 for the eight ally types; text "+%d special" (the number printed is w10); copied to `DS:45c8[type*6]` | [EXE] ovl66:1ad0, ovl48:005a. Game-rule effect: see combat notes |
| 50 | i16 | w14 `enemy_stack_mod` | "%d enemy stack" (Elephants: -1) | [EXE] ovl66:1b08 |
| 52 | i16 | w15 `cancel_mode` | 1 = "Cancel city bonus", 2 = "+1 & cancel hero", 3 = "+1 & cancel non-hero"; copied to `DS:45c9[type*6]` | [EXE] ovl66:1aba..1b05, ovl48:004e |
| 54 | i16 | w16 `flies` | flag copied to `DS:45c4[type*6]`; set for Giant Bats, Pegasi, Griffins, Archons, Dragons | [EXE] ovl48:001e copy; flying mode at 0c8c:0529 |
| 56 | i16 | w17 `forest_move` | flag copied to `DS:45c5[type*6]`; set for Scouts, Orcish Mob, Archers; any stack member with it makes Forest cost 2 | [EXE] ovl48:002a copy; use 0c8c:0529 + 0555:19e4 |
| 58 | i16 | w18 `hills_move` | flag copied to `DS:45c6[type*6]`; set for Scouts, Orcish Mob, Dwarves, Giants; any stack member with it makes Hills cost 2 | [EXE] ovl48:0036 copy; use 0c8c:0529 + 0555:19e4 |
| 60 | i16 | w19 `ship` | flag copied to `DS:45c7[type*6]`; set only for Navy; a stack containing it moves in ship mode | [EXE] ovl48:0042 copy; use 0c8c:0529 |

The bonus-description routine `ovl66:1a07` (flat 0x8b3d7) picks one line of STRING.DAT
group 163 per army in this priority: boat (army flag 0x1000 → "Boat strength of 4"),
hero bonus, cancel_mode 2/3, special, "+%d to stack" (all four stack bonuses non-zero),
cancel_mode 1, enemy-stack modifier, the four stack bonuses, the four own-strength bonuses
**[EXE]**. The terrain class used for the bonuses comes from `ovl38:0000(x,y)`:
0 = city, 1 = open, 2 = woods, 3 = hills **[EXE]** (ovl66:1c74..1cdb).

### Decoded table (ARMYTYPE.DAT)

`id` = type_id; str/turns/cost/moves/buy = w0..w4; bonus columns list only non-zero words.

| # | id | name | str | turns | cost | moves | buy | non-zero bonus/flag words |
|--:|---:|------|----:|------:|-----:|------:|----:|---------------------------|
| 0 | 11 | Scouts | 1 | 1 | 2 | 16 | 10 | w17, w18 |
| 1 | 15 | Giant Bats | 1 | 1 | 5 | 16 | 30 | w16 |
| 2 | 2 | Light Inf. | 2 | 1 | 3 | 12 | 50 | — |
| 3 | 14 | Orcish Mob | 2 | 2 | 4 | 12 | 100 | w17, w18 |
| 4 | 13 | Light Cav. | 2 | 2 | 6 | 20 | 300 | str_open +1 |
| 5 | 10 | Catapults | 2 | 4 | 16 | 16 | 500 | cancel_mode 1 |
| 6 | 1 | Heavy Inf. | 3 | 2 | 5 | 8 | 300 | — |
| 7 | 6 | Archers | 3 | 2 | 7 | 12 | 400 | str_woods +1, w17 |
| 8 | 3 | Dwarves | 3 | 2 | 7 | 8 | 400 | str_hills +1, w18 |
| 9 | 16 | Pikemen | 4 | 3 | 5 | 8 | 400 | str_open +1 |
| 10 | 4 | Heavy Cav. | 4 | 3 | 8 | 16 | 500 | str_open +2 |
| 11 | 7 | Wolfriders | 4 | 2 | 8 | 16 | 500 | stack_hills +1 |
| 12 | 5 | Navy | 4 | 4 | 20 | 30 | -500 | w19 |
| 13 | 0 | Giants | 5 | 2 | 10 | 16 | 800 | w18 |
| 14 | 17 | Minotaurs | 5 | 2 | 10 | 12 | 800 | str_city +1 |
| 15 | 12 | Spiders | 5 | 2 | 12 | 12 | 1000 | str_city +2 |
| 16 | 8 | Pegasi | 5 | 3 | 12 | 20 | 1000 | stack city/open/woods/hills +1, w16 |
| 17 | 9 | Griffins | 6 | 3 | 15 | 20 | 1500 | str_city +2, w16 |
| 18 | 21 | Unicorns | 7 | 4 | 15 | 16 | 1500 | stack all four +1 |
| 19 | 18 | Elephants | 8 | 4 | 15 | 16 | 1500 | enemy_stack_mod -1 |
| 20 | 23 | Wizards | 6 | 4 | 12 | 50 | -1500 | stack all four +1, special |
| 21 | 20 | Giant Worms | 7 | 4 | 12 | 12 | -1500 | stack all four +1, special |
| 22 | 24 | Ghosts (alt: Shamblers) | 7 | 4 | 12 | 16 | -1500 | stack all four +1, special |
| 23 | 26 | Demons (alt: Gargoyles) | 7 | 4 | 15 | 20 | -1500 | stack all four +1, special |
| 24 | 22 | Elementals | 8 | 4 | 15 | 12 | -2000 | stack all four +1, special |
| 25 | 27 | Devils (alt: Imps) | 8 | 4 | 15 | 16 | -2000 | stack all four +1, special, cancel_mode 3 |
| 26 | 19 | Archons (alt: Winged Folk) | 8 | 4 | 20 | 16 | -2500 | stack all four +1, special, cancel_mode 2, w16 |
| 27 | 25 | Dragons | 9 | 4 | 20 | 22 | -3000 | stack all four +2, special, w16 |
| 28 | 28 | Hero | 5 | 0 | 0 | 16 | -1 | — |

Unknowns: what the magnitude of a negative `buy_price` is used for; exact rule effect of
w16..w19 (only the copies into the per-type table at `DS:45c4` are verified here; w13 see
below).

### Semantics from combat code

Verified in the battle setup `ovl38:008b` and the movement code (details and pseudo-code in
docs/research/exe_logic.md §3-§4):

* w5..w8: added to the unit's own strength when the battle tile class is city / open / woods /
  hills (class from `ovl38:0000`: city = city, ruin/temple site or tower tile; woods = Forest;
  hills = Hills or Mountains; everything else open). [EXE]
* w9..w12: stack bonus for the same four classes; only the highest value in a stack counts,
  and it is capped together with the hero and city bonus at the scenario value SCN 0x112 (5).
  [EXE]
* w14: the most negative value in a stack is subtracted from the *other* side's total, after
  the cap (Elephants −1). [EXE]
* w15: 1 cancels the defender's city bonus (attacker only), 2 cancels the other side's hero
  bonus, 3 cancels the other side's stack bonus. The "+1" in the texts for 2 and 3 is not
  applied by the battle code (no code found). [EXE] / [unknown] for the "+1"
* w13: not read by the battle setup; it is copied to `DS:45c8` and read by hero/ally and
  medal code. Non-zero = ally type: allies joining a hired hero are drawn from the w13 ≠ 0
  types (`ovl47:01fc`, exe_logic.md §5.2), as are quest type 2 targets (§5.7); zero =
  medal-eligible (`ovl36:2274`, §5.8). [EXE]
* w16 = flies, w17 = forest movement bonus, w18 = hills movement bonus (either costs 2 instead
  of 4 / 6 for the whole stack if any member has it), w19 = ship (stack moves as a fleet).
  Verified in `0c8c:0529` (stack mode) and `0555:19e4` (step cost). [EXE]
* Final unit strength is clamped to 15; units aboard ship fighting on water have strength 4
  with no bonuses. [EXE]

---

## 2. TERRAIN0/HERONAM0.DAT … HERONAM7.DAT (text)

CRLF text, one hero name per line: `#<digit> <name>` **[bytes]**. 100 lines per file
(HERONAM4 has 101).

Loader `ovl47:0c67` (flat 0x75f97) **[EXE]**: the file is FILE.DAT group 20, index =
current player number (`2c04:0110`), formatted with the terrain-set number; it rolls
r = 1..100 and takes the r-th `#` in the file (so a 101st line is never chosen). The digit
after `#` sets `DS:44d0`: `0` → 0, anything else → 1. Name = text from 2 characters after
the digit up to the first control character, copied to `DS:44d2`.

`DS:44d0` = female flag **[inferred]** (all `#1` names are Lady/Queen/Princess or feminine
names; HERONAM0 has none).

## 3. TERRAIN0/MAPCOLOR.DAT (1200 bytes)

Read by `ovl63:2a11` (flat 0x85ac1) in this order **[EXE]**: 4 × 256 bytes, 3 × 32 bytes,
4 × 20 bytes (far pointers `DS:5e92, 5e8e, 5e8a, 5e86`; `5e72, 5e6e, 5e6a`;
`5e82, 5e7e, 5e7a, 5e76`). ovl63 is the "Creating the strategic map" module.

| off | size | content | confidence |
|----:|-----:|---------|------------|
| 0 | 4 × u8[256] | four colour tables indexed by map tile number (values 0..15; tiles 192..254 are 0, tile 255 = 13) | layout [EXE]; "tile → overview-map colour, four sub-pixels" [inferred] |
| 1024 | 3 × u16[16] | first table is the identity 0..15; the others remap a few entries | layout [EXE]; meaning [unknown] (palette remaps?) |
| 1120 | 4 × u8[20] | all 13 except a single 10 at index 10, 7, 9, 8 respectively | layout [EXE]; meaning [unknown] |

## 4. DATA/TERRAIN.DAT (54 bytes)

Not a movement-cost table. It is the list of terrain *sets* **[EXE]**: `ovl60:0dff`
(flat 0x8019f) reads a u16 count; `ovl60:0e4d` (flat 0x801ed) reads record *n* of 0x34
bytes.

| off | size | field |
|----:|-----:|-------|
| 0 | u16 | number of terrain sets (= 1) |
| 2 + 52·i | u16 | word (0) — [unknown], probably the set number |
| 4 + 52·i | char[50] | label, here "Terrain type:  Grassland" |

Only `TERRAIN0` ships with this copy, consistent with count = 1. Movement costs are not
in any data file examined here.

## 5. DATA/STRING.DAT, FILE.DAT, ERROR.DAT (indexed string tables)

Same format **[bytes]** + **[EXE]** (`ovl59:03a0` loads all three whole; getter
`ovl59:053f`, flat 0x7ee2f):

```
header:  G entries of { u16 list_offset; u16 count }      G = first list_offset / 4
lists:   at list_offset: count × u16 string_offset
strings: NUL-terminated, offsets from start of file
```

A string is addressed as (group, index). Getter entry points: `ovl59:04f0` STRING.DAT,
`ovl59:0505` FILE.DAT, `ovl59:051a` ERROR.DAT (table pointers at `DS:267c`) **[EXE]**.
The getter clamps index to count-1; a negative index means "pick one of the group at
random". The result is copied to one of 8 rotating 80-byte buffers at `DS:59a8`, so
strings longer than 79 characters are not expected.

| file | size | groups | notes |
|------|-----:|-------:|-------|
| STRING.DAT | 14054 | 169 | all game messages; e.g. group 4 = the ten option names, 100–103 hero level titles, 163 = army bonus texts |
| FILE.DAT | 4495 | 89 | file names and printf patterns (`TERRAIN%d\ARMYTYPE.DAT`, `%s\%s.CTY`, …). Backslashes are stored doubled in some entries exactly as dumped |
| ERROR.DAT | 128 | 3 | three "cannot open" messages |

The dump keeps group and index numbers (`strings.json`, `files.json`, `errors.json`).

## 6. DATA/AREA.DAT, BUTTON.DAT, JOIN.DAT (screen layout)

Loader `ovl53:02cd` (flat 0x79f0d) and screen activation `ovl53:056a` (flat 0x7a1aa)
**[EXE]**.

**JOIN.DAT** (216 bytes) = 36 records × 6 bytes: `u16 screen_id, u16 button_group,
u16 area_group`. Activating screen *n* searches the 36 records for `screen_id == n`.

**AREA.DAT** (378 bytes) = 7 groups. Group header 14 bytes: `u16 32000` (marker),
`u16 group_id`, `u16 mask`, `u16 count`, 6 zero bytes; then `count` records of 14 bytes.
The loader walks exactly 7 groups and copies the group whose id matches; `mask` bit *i*
enables area record *i*: its id is passed to `08a9:07ed` (loop of 8 at ovl53:079b).

Area record (7 × i16): `id, 0, x, y, w, h, 0` — the rectangle interpretation is
**[inferred]** (values such as 0,0,640,18 and 400,30,224,312 fit a 640×480 screen).
Record 0 of every group is all zero.

**BUTTON.DAT** (15312 bytes) = 36 groups, 464 records of 33 bytes in total. Group header
33 bytes: `u16 32000`, `u16 group_id`, `u8 count`, rest zero; then `count` records.

| off | size | field | confidence |
|----:|-----:|-------|------------|
| 0 | u16 | button id (same id space as HELP ids and UDB ids) | [bytes]/[inferred] |
| 2 | 4 | zero | [bytes] |
| 6 | u16, u16 | x, y on screen | [inferred] |
| 10 | u8, u8 | width, height | [inferred] |
| 12 | 7 | zero | [bytes] |
| 19 | 6 × u16 | three (x, y) pairs — source positions of the button images: pair *s* at +0x13 + 4·*s* for state *s* = 0 pressed, 1 normal, 2 disabled (`0771:0001` blits the pair of the state byte at run-time record +4) | [EXE] |
| 31 | u16 | index into FILE.DAT group 3 (picture file; 4 = button.pck, 63 = citybu.pck, 61 = dbutton.pck, …); 0 = no picture | [inferred] from the values |

## 7. UDB/UDB.DAT (1430 bytes), UDB/UDB.CUR (8 bytes) — user-defined buttons

File names referenced in ovl14 (`ovl14:043e` … `05a1`, flat 0x5490e…) **[EXE]**; layout
**[bytes]**:

- UDB.DAT: `u16 count` (21), then 68-byte records: `u16 button_id`, `char name[50]`,
  `u16 x, y, w, h` (large image, 64×29), `u16 x, y, w, h` (small image, 32×29).
- UDB.CUR: 4 × u16 = the four button ids currently assigned to the shortcut bar
  (535 End Turn, 514 Win Rpt, 511 City Rpt, 517 Heroes in this copy). "Four" matches the
  dialog text "Choose 4 buttons for shortcuts".

## 8. HELP/WARLORD2.HLP (40354 bytes)

`u16 count` (388) followed by 104-byte records **[bytes]**, **[EXE]** `ovl15:0000`
(flat 0x54ad0; reads 2 bytes, then 0x68-byte records until the id matches):

| off | size | field |
|----:|-----:|-------|
| 0 | u16 | button id |
| 2 | u16 | `word2` — 0 = static help, otherwise a dynamic-help selector |
| 4 | char[50] | title, e.g. "- Pillage -" |
| 54 | char[50] | one-line description |

It is a per-button tooltip table (right-click help), not a topic manual. 387 distinct
ids (id 421 occurs twice). `word2` dispatch at `ovl15:00df` **[EXE]**: 1–4 → production
slot of the current city (army info), 5–24 → entry of the army list (`ovl44:11f4`),
33–36 → user-defined button *n* (title "- User-Defined Button -"), 37–44 → unit *n* of
the selected stack (`ovl66:1747`), 45–71 → combat-order list entry (`ovl38:1475`);
65535 (18 records) matches none of the ranges, i.e. no popup.

Popup **[EXE]** (`ovl46:1201` / `131a`, text `ovl46:1158`): POPUP.PCK (FILE.DAT picture 29,
keyed), 256×75, placed around the pointer (x, y): cx = ((x + 4) >> 3) << 3 clamped to
[128, 512], cy = y clamped to [37, 441], rectangle (cx − 128, cy − 37, 256, 75). Title
`SetFont(2, 7, 0, 3)` centred at (left + 120, top + 11), description `SetFont(2, 15, 0, 3)`
centred at (left + 120, top + 35). The popup opens on a right press over a live button
(hit test `08a9:0756`, later records win) unless one is already up, hides the pointer
(`12bf:07a5`), and closes when no mouse button is held (`0726:0009`).

## 9. DATA/OPTIONS.DAT (20 bytes), DATA/OPTIONS.SND (3 bytes)

- OPTIONS.DAT: 10 × u16 read into `DS:23b4` by `ovl57:223b` (flat 0x7d94b), written back
  by `ovl57:2289` **[EXE]** ("Recall Options"). Order = the ten options of STRING.DAT
  group 4 (Neutral Cities, Diplomacy, Quests, Hidden Map, View Enemies, View Production,
  Intense Combat, Quick Start, Military Advisor, Random Turns) **[EXE]**: copied in that
  order into the game state at `ovl57:0e34` (exe_logic.md §6.9). Stored values here:
  `0 0 0 0 1 0 0 0 1 0`.
- OPTIONS.SND: three ASCII digits **[EXE]** `ovl58:0bc5` (flat 0x7e5b5): digit 0 → music
  on (`DS:0bee`, forced 0 without a music driver), digit 1 → sound effects on
  (`DS:0bec`), digit 2 → speech; the game stores the inverse in `DS:26c8` ("no talking
  advisor", also set by the `v` switch). This copy holds "001".

## 10. DATA/SAVEINFO.DAT (166 bytes), DATA/MAPINFO.DAT (65 bytes)

Text, one line per slot (10 save slots; MAPINFO has 5 lines here) **[bytes]**:
`<1 digit used flag><2 digits L><name>` where L = len(name) + 1. Lines end with LF CR in
SAVEINFO.DAT and CR LF in MAPINFO.DAT in this copy. The EXE builds the scanf/printf
pattern `%1d%02d%-<n>s` at `ovl49:0fcc` (flat 0x77ebc) **[EXE]**. Unused slots read
`009Not_Used`. Slot *n* corresponds to `SAVE\SAVEn.DAT` / `SAVE\RMAPn.DAT` (FILE.DAT
groups 28 / 26) **[inferred]**.

## 11. DATA/SCENARIO.DAT (504 bytes)

6 records × 84 bytes **[bytes]**; opened via FILE.DAT group 0 at `ovl60:06c8`
(flat 0x7fa68).

| off | size | field | confidence |
|----:|-----:|-------|------------|
| 0 | char[20] | scenario title | [bytes] |
| 20 | char[8] | directory name | [bytes]; matches the directories on disk |
| 28 | char[30] | description, NUL-terminated (the longest, record 3, is 29 characters with its NUL at byte 57) | [bytes] |
| 58 | u16 | 7, or 6 for Dragon | [bytes]; meaning [unknown] (plan register S4) |
| 60 | char[8] | name (same as directory) | [bytes]; which file base it selects [unknown] |
| 68 | char[8] | name (same as directory) | [bytes]; [unknown] |
| 76 | u16 | number of cities | [inferred]: Tutorial = 6, and the tutorial text says "6 cities and 6 ruins … 2 players"; large scenarios 80 |
| 78 | u16 | number of ruins/sites | [inferred] (6 / 40 for full scenarios) |
| 80 | u16 | number of players | [inferred] (2 … 8) |
| 82 | u16 | 0 | [unknown] |

Scenarios: Tutorial, Dragon Realms, Isles of Sorcery, Erythea Campaign, Hadesha Campaign,
Isladia Campaign.

## 12. DATA/QUOTES.DAT (1754 bytes)

CRLF text **[bytes]**. First line = number of quotes (19). Each further line:
3-digit number N, then the quote; `|` separates display lines and the attribution is the
last segment. N = number of characters after the 3 digits + 1. Opened at `ovl57:0f88`
(flat 0x7c698), which also draws a random number for the choice **[EXE]**.

## 13. CARDS/*.CRD (103 bytes) and *.DSC (text) — computer-player personalities

File name pattern `CARDS\%c%03d.%s` with the letter taken from "KLW" by the player's
level (`2c04:00c0[player]`: 0 = K, 1 = L, 2 = W) and the number from
`2c04:00e0[player]` (`ovl57:21c1`, flat 0x7d8d1) **[EXE]**. `ovl48:006a` (flat 0x76eaa)
reads exactly 0x67 bytes into a caller buffer (caller: ovl21:0fd2, AI) **[EXE]**.
"Random Characters" (`ovl57:2051`, flat 0x7d761) assigns each computer player a random
number 1..(cards of that letter − 1) **[EXE]**; card 000 is the "Standard" one. Nine cards
per letter exist (000–008).

Layout — split **[inferred]** from value patterns (all 27 files parse cleanly):

| off | size | content |
|----:|-----:|---------|
| 0 | 7 × u16 | seven small numbers (0..8). All zero except word 4 for most Knights |
| 14 | u8[29] | a permutation of 0..28 = army type ids in preference order (28 = Hero is always at position 5) |
| 43 | 30 × u16 | parameters (percentages/weights such as 10, 20, 50, 100; many zero for Knights) |

The meaning of the individual numbers is **[unknown]** here (AI analysis).

`.DSC`: CRLF text. Line 1 = character name (the list box reads the first 0x28 bytes up to
CR, `ovl51:0636`, flat 0x799b6 **[EXE]**); following lines = short description; empty
lines pad the file.

## 14. SOUND.DAT, SWAP.DAT, VER102.DAT, WAR2.INI (sound configuration)

One text line: `<digital driver> <music driver> <number>` parsed with `"%s %s %d"` from
`sound.dat` at `155e:0005` (flat 0x255e5) **[EXE]**. `NO_SOUND` in either position
disables that part. WARLORD2.EXE and START.EXE contain only the names `sound.dat` and `SWAP.DAT`
(the latter referenced at `151d:0013`, in the module that allocates swap storage); the
names VER102.DAT and WAR2.INI occur in none of the shipped executables **[bytes]**. In this
copy SWAP.DAT, VER102.DAT and WAR2.INI all hold `NO_SOUND NO_SOUND 0` — they look like
copies of an unconfigured SOUND.DAT; their purpose is **[unknown]** (SWAP.DAT is probably
overwritten as a swap file at run time, VER102.DAT probably a patch marker).
See `docs/formats/sound.md`.

## 15. SOUND/*.TXT (advisor speech captions)

27 files, one caption per digitised voice clip: text with `|` as line break, terminated by `~`,
followed by CRLF **[bytes]**. File names come from FILE.DAT groups 59–88 (the `.8SN`
counterparts from groups 40–58).

## 16. Not covered / open points

- `CURRENT.HST`, `CURRENT.SGN`, `HELP/*.GFX`, `TUTORIA/*.GFX`, `START/*.GFX` (text
  scripts with `#H #C #L #F #G #T #E #D` commands) are outside this document.
- CARD field meanings, MAPCOLOR word/byte tables, SCENARIO.DAT name fields at 60/68.
