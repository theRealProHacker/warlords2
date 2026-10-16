# Warlords II (1993, DOS) scenario and map file formats

Scope: the original Warlords II, version 1.02 (`WARLORD2.EXE`, 542880 bytes). Not Deluxe.
Parser: `tools/dump_scenario.py`. Tests: `tests/test_formats_scenario.py`.

All integers are little-endian. `u8`/`u16`/`u32` are unsigned. Strings are single-byte
(treated as CP437), NUL-terminated inside a fixed-size buffer; bytes after the NUL are
uninitialised garbage in several files and must be ignored.

## How this was verified

- **exe**: read from the disassembly of the overlay code in `WARLORD2.EXE` (capstone
  over the raw file; offsets given as `exe@0x…` are file offsets). The string constants'
  data segment starts at file offset 0x33250. In the raw overlay bytes the game's three
  big data segments appear as unrelocated placeholders `0x168` = SCN block, `0x160` =
  map block, `0x158` = road block, so every `mov ax,0x168 / mov es,ax / es:[…]`
  instruction names an SCN offset directly.
- **rea**: the scenario loader was cross-checked with the Ghidra decompiler on the
  flattened image `out/rea/WARLORD2_flat.exe` (`FUN_7b71_0194`, linear 0x7b933 = raw
  0x71703): one `read(fd, seg:0, 0x2EE1)`, then the `0x137` / `0xC0` loop described
  below. Result in `out/rea/scn_loader_decompile.json`. Everything else is capstone only.
- **data**: confirmed by cross-checking all seven scenarios (tests enforce it).
- **guess**: inferred from values only.

Confidence: **H** high (exe + data agree), **M** medium, **L** low.

## Scenario directory

`<NAME>/<NAME>.<EXT>` for `TUTORIA DRAGON SORCERY ERYTHEA HADESHA ISLADIA`, plus `RANDOM`
(the last generated random world, same formats).

| File | Size | Content |
|---|---|---|
| `.MAP` | 34944 | tile grid, `u16` per tile |
| `.RD` | 17472 | road layer, `u8` per tile |
| `.SCN` | 12001 | game state block: players, sites, items, cities |
| `.SGN` | 2 + 104·n | signposts |
| `.ITM` | 4 + 26·n | item list (text) |
| `.CTY` | variable | city descriptions (text) |
| `.SPC` | variable | ruin/temple descriptions (text) |

The loader (exe@0x71703–0x718f5) opens `%s\%s.scn`, `.map`, `.rd` and reads each with a
single `read()` of exactly 0x2EE1, 0x8880 and 0x4440 bytes. **H**

## .MAP — tile grid

112 columns × 156 rows, row-major, origin top-left, x east, y south. Index
`2·(y·112 + x)`; the exe computes `y·0xE0 + x·2` (exe@0x4b08c). **H**

Orientation check: signposts in `RANDOM.SGN` say "N leagues southeast" etc. and agree
with the named city's position under this layout.

Each `u16`:

| Bits | Meaning | Conf. |
|---|---|---|
| 0–7 | tile id (0–152 used), frame in the scenery tile sheet, 16 per row | H |
| 15 | port flag; only ever set on shore tiles | M (data: tutorial sign beside one says so) |
| 8–14 | always 0 in shipped files | H |

Terrain class of a tile is **not** in the map; it comes from the table at SCN 0x710:
`terrain = scn[0x710 + tile_id]` (exe@0x4b0a9). The table is identical in all seven
scenarios:

| Tile ids | Terrain | Notes |
|---|---|---|
| 0 | 9 | signpost; one per `.SGN` record, positions match exactly |
| 1, 9, 31, 111, 127 | 7 | plain. 9 and 31 are the checkerboard grass fill. Tile 1: no code tests it (no compare of a map tile byte with 1). 111 and 127 never appear |
| 2–8 | 9 | not present in any shipped map (towers, by the terrain name) |
| 10–12 | 11 | ruin/temple picture; one per site record. Variant does not encode site type |
| 13–15, 29, 30, 46 | 8 | marsh |
| 16–28, 32–38, 40–44, 47, 63 | 3 | shore (coast transitions) |
| 39, 45 | 2 | open water, checkerboard fill |
| 48–62, 78, 79, 135–143, 149–152 | 4 | forest |
| 64–77 | 5 | hills |
| 80–95, 110, 126 | 6 | mountains |
| 96–109, 112–125, 128–131, 144–147 | 10 | city, 2×2 blocks |
| 132–134, 148 | 1 | bridge |
| 153–159, 192–254 | 0 | unused |
| 160–191 | 11 | unused in maps |

Terrain ids, named after the game's own terrain help list (Road, Bridge, Water, Shore,
Forest, Hills, Mountains, Plain, Marsh, Tower): 0 road, 1 bridge, 2 water, 3 shore,
4 forest, 5 hills, 6 mountains, 7 plain, 8 marsh, 9 tower/signpost, 10 city,
11 ruin/temple. Ids 1–8 **M** (order of the name list matches the data), 0, 9, 10, 11 **M**
(10 is tested by the exe as "city", exe@0x4b0a9).

City blocks: a city at `(x, y)` occupies `(x,y) (x+1,y) (x,y+1) (x+1,y+1)` with tiles
`t, t+1, t+16, t+17`. `t = 96` neutral; `98, 100, 102, 104, 106, 108, 128, 130` are the
versions for players 0–7 in that order. Only `RANDOM.MAP` ships with coloured
capitals; there all eight match the owning player's capital record. **H**

## .RD — road layer

One `u8` per tile, same 112×156 layout. 0 = no road. Values 1–17 select a road piece.
Connections were derived by counting, over all scenarios, how often each neighbour
carries a road or city (always ≈100 % or ≈5 %): **M**

| Value | Connects | Value | Connects |
|---|---|---|---|
| 1 | E W | 10 | N E |
| 2 | N S | 11 | E S |
| 3 | N E S W | 12 | W (dead end) |
| 4 | E S W | 13 | S (dead end) |
| 5 | N S W | 14 | E (dead end) |
| 6 | N E W | 15 | N (dead end) |
| 7 | N E S | 16 | E W (second straight piece) |
| 8 | S W | 17 | N S (second straight piece) |
| 9 | N W | | |

Unknown: why 16/17 exist next to 1/2 (different art in `ROAD.PCK`, presumably).
Bridges are map tiles (terrain 1) and never have a road-layer entry.

## .SCN — state block (12001 bytes)

A raw dump of the game's main state segment. Scenario files fill in players, sites,
items, monsters and cities; everything else is default or zero and becomes live state
during play (the same block is written into saves).

| Offset | Size | Field | Conf. |
|---|---|---|---|
| 0x000 | 8 × 20 | player names; unused slots hold "Not Used" | H |
| 0x0A0 | 8 × u16 | constant `15,7,8,9,10,6,5,0`; palette colour per player | L |
| 0x0B0 | 8 × u16 | constant `0,…,0,9` | unknown |
| 0x0C0 | 8 × u16 | player control setting = computer level 0/1/2 (card letter K/L/W; 3 is left out of the difficulty average, exe_logic.md §6.1 ovl57:21c1, §6.9 ovl57:0bab); exe writes 3 for inactive slots (exe@0x717ef). 0 in files, 3 for the tutorial's unused slots | M |
| 0x0D0 | 8 × u16 | 1 for the tutorial's enemy, else 0; 0 = human, 1 = computer (exe_logic.md §6.1: ovl68:0000 counts humans, ovl61:1aed sets dead humans to 1) | M |
| 0x0E0 | 8 × u16 | zero in files; card number of the computer player (`CARDS\%c%03d`, exe_logic.md §6.1 ovl57:21c1) | M |
| 0x0F0 | 8 × u16 | zero in files; "Enhanced" toggle of the side-setup screen (exe_logic.md §6.1 ovl33:0508) | M |
| 0x100, 0x108 | 8 × u8 each | zero | unknown |
| 0x110 | u16 | current player (≈300 references; exe_logic.md §7 ovl38:00e7) | M |
| 0x112 | u16 | constant 5; battle bonus cap, never written by code (exe_logic.md §6.9, §7 ovl38:0a2a) | M |
| 0x114 | u16 | constant 15 | unknown |
| 0x116–0x12C | u16 each | option/state words, zero in files | unknown |
| 0x12E | u16 | 1 only in `TUTORIA.SCN`; tutorial flag | M |
| 0x130–0x135 | | zero (`0x134` is a u8, `0x135` a u16) | unknown |
| 0x137 | 8 × u16 | player takes part in this scenario (1/0) | H (exe@0x717c6) |
| 0x147 | 8 × u16 | zero | unknown |
| 0x157–0x161 | 6 × u16 | zero | unknown |
| 0x163 | 8 × u16 | `0..7`; turn order | L |
| 0x173–0x177 | 3 × u16 | zero | unknown |
| 0x179–0x181 | 5 × u16 | constants `8, 8, 4, 4, 10` | unknown |
| 0x183 | 8 × 20 | player records, see below | H |
| 0x223 | 1000 | zero in files (runtime) | unknown |
| 0x60B | 9 × 29 | fight order: permutation of the 29 army ids for players 0–7, then one more row (neutral) | M |
| 0x710 | 255 | tile id → terrain table | H |
| 0x80F | u16 | site count (≤ 40) | H |
| 0x811 | 40 × 31 | site records | H |
| 0xCE9 | 22 × 29 | item table | H |
| 0xF67 | 10 × 16 | ruin monster names; entry 0 empty | H (data) |
| 0x1007 | 10 × u16 | monster strengths; entry 0 = 0 | M |
| 0x101B | 1376 | zero in files. The exe indexes sub-tables at 0x10E3, 0x10F3, 0x1103 (8 × 12), 0x1163 (8 × 8 × 10), 0x13E3 (8 × 43), 0x153B (64 bytes). Identified (exe_logic.md §5.1, §6.1): 0x10E3 8 × u16 infamy per player; 0x1103 8 × 12-byte quest records (ovl01:0d7a); 0x153B 8 × 8 relation bytes, a towards b (ovl00:0db3) | unknown except the three named |
| 0x157B | u16 | city count (≤ 100) | H |
| 0x157D | 100 × 65 | city records, ends exactly at 0x2EE1 | H |

Unused slots of the site table keep `type = 2`; unused city slots are zero.

### Player record (20 bytes, at 0x183 + 20·p)

| Offset | Type | Field | Conf. |
|---|---|---|---|
| 0 | u16 | player index (0–7) | H |
| 2 | u16 | starting gold (exe subtracts purchase prices here, exe@0x663ec) | H |
| 4 | u16 | zero; possibly the high word of gold | L |
| 6 | u16 | capital x | H (data) |
| 8 | u16 | capital y | H (data) |
| 10 | 10 bytes | zero; the exe uses words at +0x10 and +0x12 | unknown |

There is no capital flag in the city record: a player's capital is the city whose
`(x, y)` equals `(capital x, capital y)`. This holds for every active player in every
scenario. Inactive slots carry stale coordinates.

Player colours, from the setup screen: 0 white, 1 yellow, 2 orange, 3 red, 4 green,
5 dark blue, 6 light blue, 7 black.

### Site record (31 bytes) — ruins and temples

| Offset | Type | Field | Conf. |
|---|---|---|---|
| 0 | u16 | x | H |
| 2 | u16 | y | H |
| 4 | char[20] | name | H |
| 24 | u8 | type: 1 = temple, 2 = ruin | H (data: names; random-map text templates) |
| 25, 26 | u8 | zero in files (runtime) | unknown |
| 27, 29 | u16 | zero in files (runtime) | unknown |

The tile at `(x, y)` is always 10, 11 or 12.

### Item table record (29 bytes)

22 entries. The first eight are the players' standards, the other fourteen duplicate
entries of the `.ITM` list with identical type and bonus.

| Offset | Type | Field | Conf. |
|---|---|---|---|
| 0 | char[20] | name | H |
| 20 | u8 | type | H (exe@0x6109f) |
| 21 | u8 | bonus | H |
| 22 | u8 | zero in files | unknown |
| 23, 25, 27 | u16 | zero in files (runtime: holder/position) | unknown |

Item types: 1 = battle bonus ("bat +n"), 2 = command bonus ("com +n"), 5 = flight,
6 = movement, 7 = gold per turn ("gld +n"), 8 = standard (shown as "com +1").

### City record (65 bytes)

| Offset | Type | Field | Conf. |
|---|---|---|---|
| 0 | u16 | x of the top-left tile | H |
| 2 | u16 | y of the top-left tile | H |
| 4 | char[16] | name | H |
| 20 | u8 | 0–8; printed as a number in the city report. After a production purchase the exe overwrites it with 1 (≤ 2 filled slots) or 2 (exe@0x663c6), which does not fit a plain "defence" reading. Meaning unknown | unknown |
| 21 | u8 | owner 0–7, 15 = neutral. Always 15 in files; `TUTORIA` included | H (exe@0x4b0d3 tests `== 0xF`) |
| 22 | u8[4] | production slot army id, 0xFF = empty. A city may have no production at all (one in `HADESHA`) | H |
| 26 | u8[4] | turns to produce | H |
| 30 | u8[4] | strength | H |
| 34 | u8[4] | movement | H |
| 38 | u8[4] | cost | H |
| 42 | u16 | income; summed per owner into a per-player total (exe@0x790e6) | H |
| 44 | 21 bytes | zero in files; runtime (current production, timers, vectoring) | unknown |

Production fields are confirmed twice: the "buy production" code copies
`ARMYTYPE.DAT` fields into them (exe@0x662ed–0x663b1: id→22, +0x18→26, +0x16→30,
+0x1C→34, +0x1A→38), and 96 % of the slots in the generated `RANDOM.SCN` equal the
`ARMYTYPE.DAT` values under exactly this mapping. Hand-made scenarios store different
stats per city, but a new game discards them: ovl53:0a75 overwrites every slot's stats
from `ARMYTYPE.DAT` and then perturbs them (exe_logic.md §9, register X07).

The army id is the leading word of an `ARMYTYPE.DAT` record (also the army picture
number), not the record's position in that file.

## .SGN — signposts

`u16 count`, then `count` records of 104 bytes (exe@0x46cc1). **H**

| Offset | Type | Field |
|---|---|---|
| 0 | u16 | x |
| 2 | u16 | y |
| 4 | char[50] | line 1 |
| 54 | char[50] | line 2 |

Bytes after each NUL are garbage. `CURRENT.SGN` in the game root is the same format
(here byte-identical to `RANDOM/RANDOM.SGN`).

## .ITM — item list

ASCII, fixed width, CRLF (exe@0x5b276 reads it field by field). **H**

```
NN\r\n                          two-digit count (39)
<name:20><sp><type:1><sp><bonus:1>\r\n     26 bytes per item
```

Names are space-padded and use `_` for spaces. Type and bonus are single digits with
the meanings of the item table above. All seven `.ITM` files have 39 entries.

## .CTY and .SPC — descriptions

ASCII text, one record per line: `#NNN|line|line|line|` + CRLF. `NNN` is the city index
(`.CTY`) or site index (`.SPC`). Files written by the random-map generator end lines
with a bare LF. `.SPC` files may hold more records than the scenario has sites. **H**

## DATA/SCENARIO.DAT

Six records of 84 bytes, one per bundled scenario (no entry for `RANDOM`). **H** for
the layout, tested against the SCN counts.

| Offset | Type | Field |
|---|---|---|
| 0 | char[20] | title |
| 20 | char[8] | directory / file base name |
| 28 | char[30] | description, NUL-terminated (the longest, record 3, is 29 characters with its NUL at byte 57) |
| 58 | u16 | 7, or 6 for Dragon. Read by nothing: the record is only copied whole (ovl60:06c8 into DS:5d64 or a stack buffer, ovl49:0626 / 0acd with a saved map), and no code reads +0x3a (DS:5d9e) or a buffer's +0x3a. Checked on the bytes: 58-59 hold 7/6 in every record, so the description field cannot be char[32] (as `tables.md` §11 once said) |
| 60 | char[8] | the scenario's file directory (DS:5da0): `%s\%s.sgn`, `.CTY`, `.SPC` are opened from it |
| 68 | char[8] | the name a load compares to choose the overview (DS:5da8) |
| 76 | u16 | city count |
| 78 | u16 | site count |
| 80 | u16 | number of players |
| 82 | u16 | 0 |

## SAVE/RMAP*.DAT — saved random map (`RMAPTEMP.DAT`, 126205 bytes)

Read sequence at exe@0x6cc9a. **H** for the block layout, file consumed exactly.

| Offset | Size | Content |
|---|---|---|
| 0 | 84 | header, same record as `SCENARIO.DAT` (field at 68 is garbage here) |
| 84 | 12001 | SCN block |
| 12085 | 56944 | map segment: 34944 bytes of `.MAP` data, then 22000 zero bytes (unknown) |
| 69029 | 17472 | road layer |
| 86501 | 17472 | second per-tile layer, all zero here (unknown) |
| 103973 | 4 + n | `u32 n`, then a `.SGN` image |
| … | 4 + n | `u32 n`, then a history blob (same shape as `CURRENT.HST`) |

More length-prefixed blocks follow in real saved games when SCN word 0x120 is set
(exe@0x6cda8); none are present in this file. In the shipped file the map and road
parts equal `RANDOM.MAP`/`RANDOM.RD`, while the embedded sign block is a stale copy of
the Erythea signs.

## CURRENT.HST — history

`u32` total size (equals the file size, 356), then a packed log. Partly understood: a
`u16` payload length (size − 4), three runs of eight `u16` per-player values, 80 bytes
that look like city owners (0–7, 15), then variable event records containing 16-byte
names. Event layout **unknown**; not needed to load scenarios.

## RANDOM/RANDOM.DAT — random world generator data (42336 bytes)

Read whole into the generator's work buffer (far pointer DS:3f8a, farmalloc(0xA560) and one
read of 0xA560 bytes, ovl02:001d..006a). The generator reads and writes it in place: header
words (e.g. +0x2a city count, +0x34 / +0x36 ridge seeds, +0x38 / +0x3a rivers, +0x3c forest
density, each plus the slider's table entry, ovl02:0095..00f2), tables, the name and text
pools (side names at 0x764, 20 bytes each; syllables, templates, description words, signpost
phrases), the city / site description texts (+0x1f56, +0x3e96) and the 112 × 156 terrain
grid at +0x6120 (byte y · 0x70 + x). Every offset used is a `Const` with its address in
`warlords2/rules/constants/randmap.py` (`rules.randmap.buffer.Buffer`).

`tools/dump_scenario.py` lists every string with its offset in `_global.json`.

## Other files

| File | Format | Conf. |
|---|---|---|
| `DATA/MAPINFO.DAT`, `DATA/SAVEINFO.DAT` | text slot lists, one entry per slot: 1 digit used flag, 2 digits = name length + 1, name with `_` for spaces, 2-byte line end (CR LF in MAPINFO, LF CR in SAVEINFO). 5 map slots, 10 save slots | H |
| `DATA/TERRAIN.DAT` | `u16 count`, then 52-byte records: `u16` (0) + char[50] label. One record | M |
| `TERRAIN0/MAPCOLOR.DAT` | 1200 bytes: four 256-byte tables indexed by tile id: the four pixels of an overview square; four 20-byte tables by road piece; 16-word colour remaps per terrain set (`tables.md` §3) | L |
| `TERRAIN0/ARMYTYPE.DAT`, `ARMYTYP2.DAT` | 29 records of 62 bytes: `u16` army id, char[20] name, then `u16` strength (+0x16), turns (+0x18), cost (+0x1A), movement (+0x1C), `i16` purchase price (+0x1E, negative for allies), 15 more words (terrain and special bonuses, unknown) | H for the named fields |
| `UDB/UDB.DAT` | `u16 count` (21), then 68-byte records: `u16` id, char[50] label, 8 × `u16` (two rectangles). User-definable buttons | M |
| `UDB/UDB.CUR` | 8 bytes, current button assignment | L |
| `DATA/AREA.DAT` | screen area definitions for the UI, see `tables.md` §6 | EXE |

## Still unknown

- SCN header words listed as unknown above, and the runtime regions 0x223–0x60A and
  0x101B–0x157A.
- City byte 20 and the 21 runtime bytes at the end of a city record.
- The 22000 bytes after the map and the second tile layer in saved maps.
- `CURRENT.HST` event records, the last 15 words of an `ARMYTYPE.DAT` record.

Settled since: tile 1 has no meaning of its own (drawn and costed like any tile byte; no
code compares a map tile byte with 1); road pieces 16 / 17 are the generator's markers
(ROAD.PCK cells 15 / 16); `SCENARIO.DAT` +58 is read by nothing and +60 / +68 are the
directory and the load's overview name; `RANDOM.DAT` is the generator's work buffer (above);
`AREA.DAT` and `MAPCOLOR.DAT` are in `tables.md` §6 and §3.
