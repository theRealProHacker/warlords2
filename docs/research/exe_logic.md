# WARLORD2.EXE game logic (Warlords II 1.02, 1993, not Deluxe)

Every item carries one of three tags: **[V]** verified from the binary (code or data read at
the address given), **[I]** inferred (a reading of the code that depends on an unproven
identification, named in the text), **[U]** unknown. Nothing here is taken from documentation
of other Warlords versions.

## 1. The executable and how it was made analysable

| item | value | tag |
|---|---|---|
| file | `WARLORD2.EXE`, 542880 bytes, sha256 `9f9147af74d6b616b93fa0188dfdaff162a347b0202b7d2473cad8ee88922bc2` | [V] |
| compiler | Borland C++ ("Borland C++ - Copyright 1991 Borland Intl." at DS:0004, TLINK tag `FB 50 6A 72` at file 0x1c), large model, 286/386 opcodes, FP emulator interrupts 34h-3Dh | [V] |
| packing | none (no LZEXE/PKLITE/EXEPACK signature; entry 0000:0000 is plain C0 startup) | [V] |
| MZ image | header 0x2000 bytes, 1655 relocations, load image file 0x2000..0x3a4d0 (230608 bytes), SS:SP 383c:0080 | [V] |
| overlay | Borland VROOMM: `FBOV` at file 0x3a4d0, then u32 size 0x4a3c0 (bytes after the 16-byte header, reaching exactly to end of file), u32 file offset 0x310e0 of the segment table, u32 137 entries | [V] |
| segment table | 137 x 8 bytes (u16 segment, u16 max offset, u16 flags, u16 min offset). Entries 0-41 resident code, 43-45 far data (19d9, 1e1d, 2c04), 56-124 the 69 overlay stub segments (flags 3), 125 DGROUP = 3125 | [V] |
| overlay stub | in the resident image, one per overlay: `CD 3F 00 00`, u32 offset of the code relative to FBOV+16, u16 code size, u16 fixup-list size, u16 entry count, padding to 0x20, then per entry `CD 3F`, u16 target offset, `00` | [V] |
| overlay body | code, then u16 fixup offsets. The word at each fixup offset is a byte offset into the segment table (wanted segment = table[word/8].segment); zero padding up to the next overlay | [V] |
| totals | 69 overlays, 282297 code bytes, 9950 fixups, 950 stub entries | [V] |

### Flattened image used for analysis

`tools/re/flatten_overlay.py` writes `out/rea/WARLORD2_flat.exe` (not tracked; regenerate with
`.venv/bin/python -I tools/re/flatten_overlay.py original/game/Warlrd2/WARLORD2.EXE out/rea/WARLORD2_flat.exe out/rea/flatten_report.json`).

* resident image kept byte-identical except the 950 stub entries, each rewritten from
  `CD 3F off 00` to `EA off seg` (far jump to the overlay's new home);
* each overlay's code appended as its own paragraph-aligned segment after the resident image
  (first one at load-relative segment 384d), fixup words replaced by real segment values;
* one MZ relocation added per fixup and per patched stub entry (1655 -> 12555 relocations),
  header rebuilt (0xc600 bytes); nothing else changed. It is an analysis artefact, not meant to run.
* result: 564128 bytes, sha256 `f0973331dd372cf7486612cac54078becf0cffcb255f9fca2199eaa614e3f719`.
* checks done by the script: stub count equals the number of flag-3 segment-table entries and
  the stub segments match them one to one; overlays are in order, non-overlapping, gaps all
  zero, the last ends at end of file; every fixup word is a valid table offset; every stub
  target lies inside its overlay.
* `rea inspect-native-load-image` (Ghidra 12.1.4 MzLoader) reports `verified`, all 12555
  relocations `APPLIED`; decompiling a stub target (battle loop, section 3) gives coherent code
  whose callee is the dice roller reached through a patched stub.

### Address notation

| notation | meaning | original file offset |
|---|---|---|
| `ovlNN:OOOO` | overlay NN (stub order, 0-68), offset in its code | overlay file offset + OOOO |
| `SSSS:OOOO` | resident code, load-relative segment | 0x2000 + SSSS*16 + OOOO |
| `DS:OOOO` | DGROUP, segment 3125 | 0x33250 + OOOO |
| `2c04:OOOO`, `1e1d:OOOO` | far data segments (game state, map and army pool) | BSS, not in the file unless stated |
| `L 0x…` | linear address in the flattened image as rea/Ghidra prints it (load segment 0x1000) | — |

`tools/re/addr.py` converts between them; `tools/re/dc.py` prints the Ghidra decompilation
for any of these addresses. Ghidra names data by its relocated segment (+0x1000): DGROUP data
appears as `DAT_4125_xxxx` up to the end of its initialised part and as `DAT_451b_yyyy` beyond
it (DS:xxxx = 351b:(xxxx-0x3f60)); 2c04 appears as `3c04`, 1e1d as `2e1d`, 19d9 as `29d9`.

### Method

All rule analysis below was done on the flattened image with rea (Ghidra 12.1.4 through
`rea --mcp`, client `tools/re/rea_mcp.py`, which dumped the decompilation of all 1969
functions to `out/rea/decomp/`). Two Ghidra limitations matter: functions that use the
Borland floating-point emulator (int 34h-3Dh) do not decompile meaningfully, and a few Borland
switch tables are resolved into unrelated code. Those places were read from the instruction
bytes with the capstone listing (`tools/re/disasm.py`) and are marked in the text.

## 2. Random numbers

**C library generator [V]** — `0000:200a` (L 0x1200a) is Borland `rand()`:
`seed = seed * 0x015A4E35 + 1` (32-bit, DS:3d84), result `(seed >> 16) & 0x7fff`.
`0000:1ff9` is `srand(s)` (seed = s, high word 0).

**Game dice roller [V]** — `ovl59:02bf` (L 0x7ebaf), called from 254 sites as `rnd(dice, sides, add)`:

```
rnd(dice, sides, add):
    if first call ever: srand(time())                 # ovl59:0356, DS:2678 = seeded flag
    if sides == 0: return add
    total = 0
    repeat dice times:
        total += trunc(rand() / 32767.0 * sides + 1)  # float constant 32767.0 at DS:2690
    total += add
    clamp total to [dice + add, dice*sides + add]
    return total
```

The arithmetic runs through the Borland FP emulator (int 34h..3Dh), which Ghidra cannot
decompile; it was read from the instruction bytes at ovl59:02f5..031e. The truncation is the C
float->int cast helper `0000:1b57` **[I]** (standard Borland behaviour, not re-traced).
*(Re-traced, §9.7: `0000:1b57` is Borland `__ftol` — FNSTCW, rounding control set to chop
(`or byte [bp-1], 0x0c`), FISTP qword, control word restored, low 32 bits returned in dx:ax.
Truncation toward zero is therefore **[V]**.)* A die
is uniform on 1..sides except that rand() = 32767 gives sides+1, which only the final clamp
can catch (probability 1/32768 per die). `rnd(1, N, -1)` is therefore uniform 0..N-1.
Seeding from the clock means games are not reproducible from a save **[V]**.

## 3. Combat

Entry point: attack(x, y) `ovl36:0000` (L 0x67a70), reached from the map click handler
(ovl46:0179) and the AI (0c8c:046a).

### 3.1 Preconditions and cost of attacking [V]

* Target must be enterable: tile cost (table in §4) ≥ 1 or a road on the tile, unless the
  stack flies (move mode 2).
* With the Diplomacy option on (2c04:011c) and a target owner whose relation to the attacker is
  "peace" (relation bits = 0, or = 1 while a city is involved), the player is asked to confirm
  attacking without a declaration (STRING group 140) and the attack is aborted there; the
  declaration itself is handled in §6.
* The stack needs ≥ 1 movement point. Attack cost = max(2, terrain cost of the target tile)
  (`DS:4160`, set at ovl36:0205). In the prelude `ovl36:0522` every member pays it (floored at
  0) and is **moved onto the target tile before the battle**.
* Attacking onto Water/Shore (tile types 2, 3) with a non-flying stack: every member that
  cannot fly (ARMYTYPE w16 = 0 and no flight item) is set "aboard" (army flag 0x1000) with 0
  moves left — i.e. land units attacking from a port fight as embarked.

### 3.2 Who fights [V] (setup `ovl38:008b`, L 0x6a6ab)

* Side A (attacker) = the selected stack (up to 8 units, DS:5e3e, count DS:5dfe).
* Side B (defender) = every army on the target tile not owned by the attacker; if the tile is a
  city (tile type 10) all armies on the city's 2×2 tiles. `owner` of the defence is the low
  nibble of the map word's high byte (8 = neutral, 0xF = nobody, see §7).
  *(Correction, §9.4: no code found writes 8 as an owner. Neutral cities and their garrisons
  carry owner 0x0f (city +0x15, army +5), and ovl62:0000 copies that into the nibble, so a
  neutral square reads 0x0f. 8 appears only as the clamp `min(owner, 8)` that picks the
  fight-order row and in `owner >= 8` "not a player" tests.)*
* **Fight order**: each unit gets an order value from a per-side table read from the scenario
  file: `SCN[0x60b + side*29 + armytype]` (side = attacking player, or min(defending owner, 8));
  9 rows × 29 bytes end exactly at SCN offset 0x710. Units are insertion-sorted ascending; the
  lowest value fights first. One exception: in a battle on Water, Shore or Mountains (types 2,
  3, 6) the first non-aboard flying unit of a stack that contains a hero gets +80, so it fights
  last (purpose inferred: the flyer carrying the hero is kept alive longest **[I]**).
* Every unit starts with **2 hits** (hit counter initialised to 1, dies when it drops below 0)
  at ovl38:06ed/0712. Counters are not reset between duels: a duel winner carries its
  remaining hits into the next duel.

*(Addition, M5b: the Fight Order dialog.)* [V] ovl38:0de1 (07be:01e8, key of menu 506): popup
0x0b, DS:0d56 = -1, a 29-byte copy of SCN 0x60b + 29·SCN 0x110 at DS:0d58, DS:166a = 1,
ovl38:0e4a(0), screen 26 (425 OK, 426 Cancel, 427 Reset, 428 up, 429 down, 430+n slots
n = 0..26), ovl38:1067. Slot n shows the first type whose row byte equals n (so row values 27,
28 have no slot: hero and type 5 in every shipped row), ovl64:08be at (n%4·120+88,
n/4·31+128), ring SCN 0x110+2 when chosen else 1, label "%d." (DS:0d5c) of n+1 at +(40,6).
Title STRING (0x7f, 0) (font 1) at (320,64), shields ovl64:0bf7 mode 0 at (88,64)/(512,64),
(0x7f, 1) with the side name at (320,104), (0x7f, 2..4) at y 348/368/388. Buttons: 430+n
ovl38:1379 (choose / un-choose / swap with the chosen and un-choose), 428 ovl38:11af / 429
ovl38:1294 (swap with the neighbour, the choice follows), 427 ovl38:116a (row = SCN 0x6f3,
un-choose), 425 ovl38:10fa (free the copy, ovl17:069c, ovl61:0000(0,0)), 426 ovl38:111c (copy
back, then as OK). States: 428 disabled when none chosen or at 0, 429 when none or at 26. The
row is edited in place at every step. HLP word2 45..71 of buttons 430..456: ovl15:01fb ->
ovl38:1475(n, x, y): with DS:1174 == 0 the type at slot n -> ovl44:14ac record ->
ovl46:032a(t, w1, w0, w2, w3, x, y), the army-type panel (240x128 at ovl46:1486, POPUP3; name
at +(112,8), icon ring 1 at +(96,31), Strength/Movement/Time/Cost DS:107c/1089/1096/109f at
+(104,66)r/(120,66)l/(104,86)r/(120,86)l, kind icon DS:45c4 at +(96,103)); ovl15:0189 then
sets DS:1174.

### 3.3 Strength pipeline [V]

Notation: terrain class `c` of the battle tile from `ovl38:0000`:

| class | condition |
|---|---|
| 0 "city" | map flag 0x20 ("tower"/fortified square, see below) **or** tile type 10 (city) or 11 (ruin/temple site) |
| 2 "woods" | tile type 4 (Forest) |
| 3 "hills" | tile types 5 (Hills), 6 (Mountains) |
| 1 "open" | everything else |

ARMYTYPE words (record offsets in docs/formats/tables.md): w5..w8 own bonus for c = 0..3,
w9..w12 stack bonus for c = 0..3, w14 enemy-stack modifier, w15 cancel mode.

Per side, scanning its units:

```
hero_best   = max over heroes of min(9, hero.strength + battle_items(hero))
hero_bonus  = HEROTAB[hero_best] + sum over heroes of command_items(hero)
              HEROTAB (DS:0ce4) = 0,0,0,0,1,1,1,2,2,3   for 0..9
stack_bonus = max over units of w[9+c]          # highest only; several do not add
enemy_mod   = min over units of w14 (if nonzero) # e.g. Elephants -1, applied to the OTHER side
flags: w15 == 1 -> cancels defender's city bonus   (only looked at on side A)
       w15 == 2 -> cancels the other side's hero bonus
       w15 == 3 -> cancels the other side's stack (non-hero) bonus
```

`battle_items` = sum of item value for carried items of type 1 (`ovl38:0d1a`),
`command_items` = sum of type-2 item values plus 1 per type-8 item (`ovl38:0d71`); items are
the 0x1d-byte records at 2c04:0cfd (see §5).

City/defence bonus for the defender (only if side A has no w15 = 1 unit and c == 0):
1 if the tile carries the fortified ("tower") flag, else 2 if tile type 11, else the city's defence byte
(city record +0x14); halved (integer) when the defending owner nibble is 0xF.

Totals (cap `CAP` = scenario word SCN[0x112], value 5 in all seven shipped scenarios):

```
A_total = min(CAP, (B has w15==2 ? 0 : A.hero_bonus) + (B has w15==3 ? 0 : A.stack_bonus)) + B.enemy_mod
B_total = min(CAP, (A has w15==2 ? 0 : B.hero_bonus) + (A has w15==3 ? 0 : B.stack_bonus)
                   + (A has w15==1 ? 0 : city_bonus)) + A.enemy_mod
```

So the city bonus counts towards the cap; the enemy modifier is applied after the cap.

Per unit (`ovl38:0a08..0d19`):

```
if unit aboard (flag 0x1000) and battle tile type is 2 or 3:  strength = 4 (no bonuses)
else:
    s = army.strength (+8) + side_total
    if hero: s += battle_items(hero)
    s += w[5+c]                       # own terrain bonus
    s = min(s, 15)
```

The "+1" in the cancel-mode texts ("+1 & cancel hero/non-hero") is **not** added anywhere in
the battle setup; I found no code that applies it **[U]** (only the cancel part is verified).
w13 ("special") is not read by the battle setup either.

### 3.4 Battle loop [V] (`ovl36:08a6`, L 0x68316)

```
die = 24 if option Intense Combat (2c04:0126) else 20       # hard-coded, not per scenario
a = 0; b = 0                      # index of the current unit of each side (sorted order)
if either side is empty: result = attacker wins, 'unopposed' flag DS:41b2 = 1
loop until one side is exhausted:
    sa = max(1, strength[A[a]]); sb = max(1, strength[B[b]])
    repeat:
        ra = rnd(1, die, 0); rb = rnd(1, die, 0)
        after 10000 rolls in one duel: force ra = 0, rb = 100   # attacker unit loses
        A succeeds if rb <= sa;  B succeeds if ra <= sb    # (each side's own roll vs own strength)
        exactly one succeeds -> the other unit loses 1 hit; if its hits < 0 it dies,
                                the next unit of that side steps up, the kill is logged (DS:41b5[])
        both or neither      -> roll again
return attacker_won (all of B dead)
```

Variable naming check against the code: the first roll is compared with the defender's
strength and the second with the attacker's, which is symmetric, so the description above is
exact. The die sizes 20/24 are immediates at ovl36:0927/092c.
Tutorial exception: with the tutorial flag (SCN[0x12e] = 1, only TUTORIA.SCN) a human
attacking hero whose battle tile owner nibble is 0xF never loses a hit.

Expected per-exchange odds for a reimplementation: P(A scores) = sa/die · (1 − sb/die)
normalised by P(exactly one succeeds).

### 3.5 After the battle

`ovl36:0a6b` (casualty removal, loot), `ovl36:2274` (medals) and the city capture choices are
documented in §5/§6. On victory the attacker's stack stays on the target tile (it already moved
there in §3.1) and the tile's army-present flag (0x10) is set (ovl36:0472).

*(correction / addition, X23, asm re-read: the battle arrays and the selection.)* [V]
* The set-up ovl38:008b writes the type bytes DS:424c[i] (attackers, 8 bytes) and DS:4254[i]
  (defenders, 32 bytes) = army +4 only for i below the side's count (asm ovl38:06e5..072d,
  counting down from the count), together with hits 1 (DS:4274 / 427c), alive 1 (DS:4224 /
  422c, 042d) and the pointers DS:42c6 / 42e6. The bytes past a count keep the previous
  set-up's; the area is zero in the EXE image. Every set-up writes them, also the advisor's 19
  trial battles (ovl36:2065 -> 124a(0) -> 1311). The 32-byte defender arrays follow from the
  layout: 422c + 32 = 424c, 4254 + 32 = 4274, 427c + 32 = 429c, 42a4 + 32 = 42c4.
* ovl36:0a6b reads the set-up types, not the army records: attackers DS:424c[i] (0b6a, 0bd5),
  defenders DS:4254[i] (0c23), and for the exp of surviving defender i DS:424c[i] (0c8e), i.e.
  the attacker array: for i < attackers attacker i's type, for attackers <= i < 8 the byte the
  previous set-up (possibly an advisor trial) left, for i >= 8 DS:4254[i - 8]. The quest check
  ovl01:1ded reads DS:4254[i] of the dead defenders, so a killed defender keeps its type there.
* Selection: ovl36:0afd..0b58 (after the news call of 0a6b) clears DS:5e3e, appends every
  surviving attacker (DS:4224[i] != 0) in fight order and sets DS:5e62 = DS:5e3e[0] (null when
  none survived). On a win ovl36:045b..0490: army bit, DS:5e62 = 0b62:007d(x, y) (the target
  square's first army), ovl67:06eb(DS:5e62); then the medal call ovl36:0498. A stack with < 1
  move is deselected (0b62:08b3 at ovl36:01b1) and the attack ends there, without a message.

### 3.6 Battle display and Military Advisor *(Addition, M5b)* [V]

Human attack, ovl36:0000 (asm 026f..0445; positions are DGROUP words of v1.02):

* ovl36:1836(x, y, 1) before the prelude 0522: ovl65:0227 on the current centre, ovl64:0053;
  war.pck (picture 11) rectangle DS:0cfa = (0, 0, 128, 120), masked ([DS:69c8], mask DS:56f6),
  into the map bitmap at ((x - SCN 0x177) * 40 - 40, (y - SCN 0x175) * 40 - 40); view edges
  (1925..19b1): left column -> source x + 40, width - 48, no - 40; right column (SCN 0x17b) ->
  width - 48; top row -> source y + 40, height - 40, no - 40; bottom row (SCN 0x179) -> height
  - 40; the bitmap copied to (16, 30) (14d0:009d); a human side gets war.8SN (ovl58:0206, which
  waits for the sample to end); pointer hidden 19d7..1a2d. Returns early for a computer side
  with more than one human and Hidden Map, or with Hidden Map, DS:3254 set and the square
  unexplored. Nothing redraws the map until ovl61:011f after the medals, so the mark stays.
* ovl37:0160(0) -> 041c: popup type 8 (DS:06a8: 160, 60, 320, 312, marble); DS:4366 = 0x12a;
  bshield.pck (picture 38) (32 * o, 0, 32, 0x24) masked at DS:0d3c = (176, 86) for the defending
  owner nibble and DS:0d40 = (176, 246) for the attacker (0x0f -> column 8). Slots (01a1..02dd):
  defenders 0..31 in rows of 8 at x = DS:0d1e[i] (216 + 32 i), y = DS:0d14[row] (86, 116, 146,
  176); the last row of n < 8 centred: x from DS:0d2e (232 + 32 i) for odd n, DS:0d1e for even
  n, index 4 - (n + 1) / 2 + i; attackers likewise in the row y = DS:0d14[4] = 246. Per unit
  (02df..0415): aboard (DS:4204 / 41fc) -> war.pck (0, 0xa2, 0x20, 0x12) opaque at (x, y + 10);
  then ovl64:08be(type DS:4254 / 424c, owner DS:41fb / 41fa, x, y, ring 0, mode 0). DS:42c4 /
  42c5 are the side counts; 0160(1) (not called by the attack) shows the city defence byte as
  the defender count with owner 8.
* ovl37:0094 (00a6..0157): fast = 0; per kill of DS:41b5 (count DS:41b4): one key off the BIOS
  buffer (0000:38dc / 3708, two getch for an extended key), space bar -> fast for the rest;
  unless fast ovl58:0181(0) for a dying attacker / (1) for a defender; ovl37:0000(x, y, fast) =
  atrans2 (picture 9) (0x20, 0, 0x20, 0x1d) masked at the slot, ovl59:0000(fast ? 2 : 5),
  ovl17:07e4 (the window picture's 32 x 30 at the slot back: the unit is gone); then
  ovl59:0000(3) and, unless fast, ovl59:0000(5). A kill takes 13 ticks, 5 when fast. Attacker
  kills explode slot 32 + their count, defender kills slot their count. Then ovl59:01f1.
* Lines via ovl37:04c5 (SetFont(2, 15, 0, 3), centred at (0x140, DS:4366), + 0x14 each),
  02f3..042d: won on a city (SCN 0x710 type 10): unopposed (DS:41b2) -> (0x8d, rnd); DS:4148 =
  hero name of DS:5e5e (2c04:0223 + 0x14 * army +0xa) or the attacker's name, DS:4134 = city
  name (2c04:1581 + 0x41 * ovl62:044a); hero -> (0x8e, 0) with its name, else (0x8f, 0). Won
  elsewhere: hero -> (0x90, 0) with its name and (0x90, 1), else (0x91, 0). Lost: (0x92, 0).
  Then 0a6b, whose loot line (0x93) at 0e18..0e32 is the next line. ovl37:04f6: a human side
  waits ovl61:10fb(0), then ovl17:069c.
* ovl59:04f0 with index -1 (ovl59:052f) draws ovl59:02bf(1, n, -1): the line (0x8d, rnd), the
  capture question's (0x42 / 0x43, rnd) and the advisor's (0x7c / 0x7d, rnd) consume the
  game's dice. The engine draws the line and the capture question's (rules.combat.attack:
  BattleEnded "fled_text", CityCaptured "texts").
* After 0a6b (0445..04f7): ovl37:04f6 closes the window, ovl63:0000(1, 1, NULL) redraws the
  overview (0453; its box from the view words the prelude 0522 moved), the won square's first
  army is re-selected (045b..0490), the medals ovl36:2274 (049d), then ovl61:011f(1, 0x10001)
  redraws map, overview and info area (04a9), then the quest check ovl01:1ded (04bf / 04e2) and
  the capture question 04f7. Keys typed after the kills' flush ovl59:01f1 (ovl37:0157) stay in
  the BIOS buffer: the first ends ovl61:10fb's wait at once.
* Prelude view words (ovl36:0522, 0718..08a2, only when its third argument is not -1, i.e. the
  human attack, which passes the leader's square before the move): leader not strictly inside
  (SCN 0x177 < x < 0x17b and 0x175 < y < 0x179) -> centre on it: 0x17d / 0x17f = x / y, 0x175 =
  max(0, y - 4), 0x177 = max(0, x - 4), 0x17b = min(0x70, x + 4), 0x179 = min(0x9c, y + 4);
  else one square toward the target per axis: target x > x, 0x17d + 1 < target x and 0x17b <
  0x6f -> 0x17d, 0x177, 0x17b + 1; target x < x, 0x17d > target x and 0x177 > 0 -> - 1; the same
  for y with 0x179 < 0x9b / 0x175 > 0. No redraw inside 0522.

Keys and presses of a pop-up screen *(Addition, M5b / M6b)* [V]: 07be:0064 with DS:166a set
ignores 'A'..'Z' (00bd), presses the first state-1 button of DS:1514 (Esc) / DS:155c (Return)
(00cc..0122, 08a9:05ab tests byte +4 of the screen's record only); 07be:0444 then returns 0 and
07be:03ef returns 1 for every code, so the switch cs:0337 (map scrolls, menu letters, the city
screen's b / c / p / v) is never reached: 0x1b and 0x153 (Del) -> DS:4c3e = 08a9:03f5(1) (no
BUTTON.DAT record has id 1: index 0) and 07be:0e26(0); 0x181 nothing; every other code the chord
ovl58:0b5f (0426). Index 0 of every screen table is the group's all-zero first BUTTON.DAT record
(ovl53:056a copies the records as they are; 08a9:0756 treats 0 as "no button") and ovl53:056a ->
08a9:0345 clears every state and visibility byte, so 0e26 finds state 0 there and chords
(0e56..0e7b): Esc without a live listed button and Del chord, they press nothing. 07be:0e26(1)
(a left press, 08a9:012c) chords on a button of state 0 (pressed) or 2 (disabled). A right press
(08a9:012c event 3) runs ovl15:0000 for the shown button under the pointer whatever its state
(08a9:0756 skips only hidden ones, byte +5).

Military Advisor, ovl36:1f19(x, y) (cursor 9, ovl46:0162): nothing with SCN 0x12c == 0; popup
type 12 (176, 60, 288, 300); SetFont(1) (0x7b, 0) at (0x140, 0x43); screen 25 (424 Done);
advisor.pck (picture 48) (0, 0, 0x80, 0x82) opaque at (0x100, 0x75); r = ovl36:2065 (19 runs of
ovl36:124a(x, y, 0), count of signed DS:4132 > 0, / 2 truncating); SetFont(2) (0x7c, rnd) at
(0x140, 0x102), (0x7d, rnd) at (0x140, 0x116), (0x7e, r) at (0x140, 0x12a). So the verdict is
the group entry r, 0..9, directly (no thresholds). 424 -> ovl36:2050: ovl17:069c,
ovl61:0000(0, 0).

BIGARMY.PCK (picture 30) is not drawn by the battle display; its one user is ovl16:0000
(rectangle DS:05fe, 0997:0129), called from the production screen ovl45:12ac.

## 4. Movement

### 4.1 Map words [V]

Map at 1e1d:0000, 112 × 156 tiles, one u16 per tile at `y*0xE0 + x*2`:
low byte = tile graphic index, mapped to a terrain type by the 256-byte table `SCN[0x710]`
(scenario file); high byte: bits 0-3 owner of what stands there (0-7 player, 8 neutral,
0xF none — *correction §9.4: neutral is written as 0xF; 8 is never written*), bit 4 army present, bit 5 fortified square (set by `ovl67:0000` under the moving
side's armies on terrain types 1, 4, 5, 7, 8, 9 or roads, cleared on capture at ovl36:0a6b;
the terrain popup labels such an enemy square "Tower", STRING group 130), bit 7 port. A second byte layer at 19d9:0000
(`y*0x70 + x`): bits 0-4 road piece (nonzero = road), bit 5 blocks (used by AI scans).
*(Correction, engine review: bit 5 means **seen** in the working hidden-map view: 0555:08bf
blocks a square for human path searches when it is clear, ovl64:1298 sets it on the squares it
reveals, ovl64:0d39 loads it from the side's explored bit; it is only tested with Hidden Map,
SCN 0x124.)*

Terrain type numbering = STRING group 128 order (verified by the terrain info popup
`ovl46:0000`, which also shows "Road" whenever the road layer is set):

| type | name | cost (DS:1274) | cost-map flags (0555:0e9f, jump table 0555:1089) |
|---:|---|---:|---|
| 0 | Road | 1 | – |
| 1 | Bridge | 1 | water + crossing (0x18) |
| 2 | Water | 1 | water (0x08) |
| 3 | Shore | 2 | water (0x08) |
| 4 | Forest | 4 | woods (0x40) |
| 5 | Hills | 6 | hills (0x20) |
| 6 | Mountains | 0 = impassable on foot | – |
| 7 | Plain | 2 | – |
| 8 | Marsh | 5 | – |
| 9 | Tower | 2 | – |
| 10 | City | 1 | own city: crossing (0x18) if 0555:109d (coastal) ; enemy city: blocked (0) |
| 11 | Ruin/Temple site | 2 | – |

Any tile with a road piece costs 1 and gets no flags; a port (bit 7) adds the crossing flag.
A second table `DS:01e0` = 1,1,3,3,4,5,7,2,5,2,1,7 replaces DS:1274 when the cost map is
built for the special mode 0xE (0555:0e46) **[I]**: which caller uses it was not traced.

### 4.2 Stack move mode [V] (`0c8c:0529`, L 0x1cde9)

From the selected units (ARMYTYPE w16 flies, w17, w18, w19 copied to DS:45c4+5/6/7):

* stack moves = minimum moves left of its members;
* any member aboard -> mode 1 with mask 8 (sailing);
* else any member with w19 (Navy) -> mode 0 (ship);
* else if all members fly, or a hero has a flight item, or all non-heroes fly and at least one
  flyer is present -> mode 2 (flying: heroes are carried);
* else mode 1 (land); mask bit 0 if **any** member has w18, bit 1 if any member has w17.

### 4.3 Cost of one step [V] (`0555:19e4`, L 0x16f34)

```
c = costmap & 7
mode 2 (flying): cost = 1 on Road/Bridge/City/road tiles, else 2 (incl. water, mountains)
mode 1 (land):   a step between water and land without the crossing flag ends the path
                 (embarking/landing only at bridges, ports, coastal own cities);
                 if c > 2 and ((mask&1 and Hills) or (mask&2 and Forest)): cost = 2
                 -> w18 = hills movement bonus, w17 = forest bonus, shared by the whole stack
mode 0 (ship):   cost = c
c == 0 -> impassable (pathfinder marks 0x7531, 0555:08bf)
```

Marsh (5) has no bonus flag, so it always costs 5 on foot.

### 4.4 Per-turn movement points [V] (`ovl68:05fb`, L 0x8ce0b)

For each army of the player starting his turn:

```
carry = min(moves_left, 2)
moves_left = (aboard ? 20 : max_moves) + carry          # army +6 = max moves, +7 = moves left
if the army reached its goto target (+0x12/+0x14): clear it (-1)
then for every hero with a "double movement" item (66b0:0874): every army in the hero's
stack gets moves_left += its own max_moves
moves_left = min(moves_left, 99)
```

So at most 2 points carry over; ships/embarked units always get 20.

### 4.5 Selection, stack palette, order commands [V] *(addition, M4b orders; asm re-read, implemented in `rules/selection.py`)*

Army +0xc bits: 0x01 awake (set by every selection and wake, cleared by Defend), 0x40 done this
turn (Quit & Next, out of moves after the Move button), 0x200 visited in the current Next cycle.
+0x11: 0 alone, 1 defended (asleep run), >= 2 group id. Selection words (DGROUP, zero at start):
DS:5e62 leader, DS:5e3e[0..7] moving group (count DS:5dfe, flag DS:2bda = count > 1), DS:5e5e
hero, DS:3250/3252 Next's reference square, palette DS:6862[i] armies / DS:6842[i] selected /
DS:6852[i] palette index (count DS:30f6).

* Square list 0b62:007d: up to 8 armies on the square from the top table index down; sort
  0b62:0a03(n, list, 0): insertion sort, an army moves up while its +0x11 is greater
  (unsigned), or equal with a greater fight-order byte (signed, row of list[0]'s owner, 0xf -> 8).
* Map click 0b62:0405: double click on the selected square -> Group All; else
  5e62 = first of the sorted square list -> ovl67:06eb.
* ovl67:06eb(p): a human stack on Water/port first sinks (0b62:0ea0); if anything sank, return.
  Members = own armies on p's square with +0x11 == p's nonzero +0x11, plus p; each gets 0x200;
  leader = highest fight-order byte (first found on ties). Then 0c8c:0529 (hero, mode, the
  leader's goto copied to all, path search for a human side with a goto), 0b62:09ce (sort the
  moving group), ovl66:0000 -> 0d30 (palette), ovl67:0955(1) (bit 0 on all; 5e5e = the hero in
  the lowest slot).
* Palette draw ovl66:0356 *(Addition, DS:5e00)* [V]: DS:5e62 null -> info area 05a3 (DS:30f8 = 1),
  no write. Else DS:30f8 = 0 (03a0); DS:2bda clear -> DS:5dfe = 1, DS:5e3e[0] = DS:5e62
  (03ab..03bc); at the end 070d (055c) -> 0c8c:0912(6862, 6842, 30f6) (0750): DS:5e00 = 100, then
  the min of cwde(+7) over every entry with 6842[i] != 0 (strict <, no liveness test: a freed
  record gives its +7 = 0). 070d's other caller 0a8b:0d05 (human move tail, before ovl66:0000
  and 0356 at 0d0a / 0d0f) is overwritten by those with no reader between. Readers of DS:5e00
  all test DS:2bda first (0a8b:0839 / 09ff / 0a80, ovl36:0190 / 062d, 0c8c:0158), except the
  AI's (ovl19:0787 / 0797 / 0ba7 / 0d73, ovl26:0792 / 07a2, ovl29:1a06 / 1526). Engine:
  `rules.selection.redraw_palette` at the draws commands end in (0b62:04e8, ovl67:01e0,
  ovl66:0959 / 0a4a / 0a8f / 0acf / 14f3, 0c8c:04fb, 0a8b:0d0f, 0b62:075a); after every command
  DS:5e00 equals 0912's value whenever DS:5e62 is set, so the dialog redraws (ovl61:0000 /
  011f) change nothing. Turn start: ovl68:03a4 (after the centring 039c, only while di != 0:
  di = 0 at 02e6 when Hidden Map is on and more than one live side has 0x0d0 == 0) and
  ovl68:05a8 (end of 04bd, always reached there) call 0356 too (`rules.turn.human_turn` /
  `resume`); with the selection cleared at every turn end DS:5e62 is null there in play, so
  both write nothing. Open: AI turns. 0b62:0ea0 with anything sunk (count [bp-6] > 0, 11ef)
  nulls DS:5e5e, 5e62, 5e3e[0..7] and zeroes DS:2bda / 5dfe (11f8..1228; DS:5e00 stays), then
  ovl62:0000 (122b) and, after the message, ovl64:0629(x, y) when x, y >= 0 (127c..128e; only
  ovl67:0728's call, the turn start passes -1, -1): `rules.movement.sink`.
* Palette 0d30: DS:2bda (stored) clear -> DS:5dfe = 1, DS:5e3e[0] = DS:5e62 (0d40..0d51, as
  0356); square list sorted; index grows except between neighbours with the same nonzero
  +0x11; selected = in DS:5e3e[0..DS:5dfe-1] (0d85..0db8, signed jl). DS:2bda writers: 0c8c:0529
  (06bd), ovl66:000a (00bd, then 0529), ovl67:0955 (0969), 0b62:06bf (088f, Disband = 0;
  087d..088f leave DS:5e3e as it was),
  0b62:0ea0 (1225, sink = 0), ovl29:14d3 (14d6 / 157e); every engine reader takes
  `Selection.group` as stored (also the UI's command groups and the ants kind ovl64:020a).
* Apply ovl66:000a (after every palette button): selected armies in palette order become the
  moving group (first = leader), get bit 0 and the leader's goto; ids >= 2 on the palette are
  listed in order of appearance (L); runs of equal palette index: one army -> 0; two or more
  with the first army's bit 0 clear -> 1; else `k -= 1; id = k > 0 ? L[k] : 0b62:0cde()`
  (L[0] is never reused); then 0c8c:0529. 0b62:0cde = smallest id 1..254 not carried by an
  own army on the map; its table word for id 1 is never initialised (zeroing starts at 2), so
  the result 1 depends on stack garbage when no army is defended — modelled as taken.
* Buttons: Select Army 224-231 ovl66:0963 (unselected -> joins the first selected army's index;
  selected -> lowest unused index and deselected, unless alone in its index: no change); Select
  Group 232-239 ovl66:0910 (select exactly that index); Group All 240 / Space ovl66:0a55 (all
  index 0, all selected; nothing without 5e62); Ungroup All 241 ovl66:0a99 (index i, only slot 0
  selected). The large-stack dialog versions 334-351 (ovl66:16c5 / 1704 / 157d / 166f) do the
  same edits without the apply step; its OK / Cancel (332 / 333) were not traced.
* Next 174 ovl67:019b: search ovl67:040e over own armies on the map with bit 0 and without
  0x40: distance |dx|+|dy| to DS:3250/3252, 0 counts 9000, strict `<` from the top index down
  (ties -> highest index); armies without 0x200 first; if only 0x200 armies remain, the
  nearest of them is taken and 0x200 cleared on every own army (new cycle); the reference
  moves to the result; none -> 5e62 = null. Then ovl67:06eb.
* Quit & Next 175 ovl61:0ed7: without 5e62 just Next; else ovl67:0393 = 08fb (0x40 on 5e62,
  or on 5e3e[*] with 2bda) + Next. Defend 176 ovl67:03a6: without 5e62 nothing; else bit 0
  cleared and +0x11 = 1 on the stack, then Next (no rnd, goto kept). Deselect 178 / Del
  0b62:08b3: 5e62 = null only.
* Move button / goto key 0c8c:01fd(x, y): nothing without 5e62 or off the map; (0, 0) means
  the mouse square; 0a8b:0c4f(x, y, 0) moves (no path -> 1, before the palette rebuild at
  0a8b:0d0a); leader's goto cleared when reached; status 2 -> 08fb + 0b62:08b3.
* Move All 'm' 0c8c:04c4: the selected stack first if its leader's goto x >= 0; then loop
  ovl67:05c4 (as 040e but only armies without 0x200, no cycle reset): mark 0x200; goto x >= 0
  -> 06eb and 01fd.
* Disband 'q' 0b62:06bf: yes/no (ovl56:0088, a fourth line when the stack holds a hero);
  yes 0b62:076a: single army: hero -> ovl36:16cd, then 0b62:03be; group: for each of 5e3e[0..7]
  a hero goes through ovl36:16cd and, when 2c04:1103 + 0xc*p (+0) is set and +4 is this army,
  +0 = 0; then 0b62:03be; finally 5e62 = 5e5e = 2bda = 0, ovl62:0000, ovl62:02bf.
* Turn start: 0b62:0d85 (an id >= 2 on exactly one own army on the map -> 0), ovl67:0000
  (fortify, §6.2), ovl67:0113 (0x40 / 0x200 cleared on own armies; DS:3250/3252 = player
  record +4/+6). Call sites ovl68:01b8 / 01c2 / 01cc (computer), 0351 / 035b / 0365 (human),
  0243 / 0252 in ovl68:022c (no fortify there; caller not traced).
* *(Addition, M5b: View → Stack and View → Army Bonus.)* [V] View → Stack ovl66:0c9c (07be:0235,
  key of menu 529; nothing without DS:5e62) backs up DS:6862 / 6852 / 6842 / 6832 / 6830 /
  30f6 into DS:6810 / 6800 / 67f0 / 67e0 / 67de / 3126, popup type 0, screen 18. Its buttons
  edit the live arrays without the apply step: 336+i -> 157d (as 0963), 344+i -> 166f (as
  0910), 334 -> 16c5 (as 0a55), 335 -> 1704 (as 0a99), each followed by 17e7 and the redraw
  0e85; states ovl66:1425 (332 / 333 normal; 334 / 335 only with more than one army; 336+i /
  344+i for i below the count). OK 332 -> 14d3: close, ovl61:0000(0, 0), then 000a(0), then
  0356. Cancel 333 -> 14fd restores the backup. A Select Army press on an unselected army with
  none selected reads an uninitialised register in 157d (si). Drawing 0e85: STACK.PCK DS:30fa
  masked at DS:3102, the DS:320d format with SCN 0x112 at (480, 66), rows at DS:3106[i] (icon
  ring (p + index) % 8 + 2, greyed when unselected; medals DS:2fa6 + 8k when w13 == 0; name at
  x + 48; strength at x + 168; the stack strength for selected armies at x + 184; moves at
  x + 232; the kind cell at (x + 256, y + 8); the bonus text at x + 304). Stack strengths
  ovl66:1b9c: over the selected non-aboard armies, heroes add DS:0ce4[min(str + items, 9)] plus
  command items, the others give a running maximum of w[9+c] (c = ovl38:0000); the sum capped
  at SCN 0x112; per army 4 when aboard, else min(str (+ battle items for a hero) + w[5+c] for a
  non-hero, 9) + the sum. The bonus text ovl66:1a07 uses STRING 0xa3 (branch order in
  `ui/dialogs/stack.py`); 1a07(0x1c, NULL) skips the record fetch and the hero branch and then
  tests uninitialised stack words. View → Army Bonus ovl66:1e3b (07be:0208, key of menu 522):
  table[s8(SCN 0x60b + 0x1d p + t)] = t, popup type 0, screen 34 (490 Done, 491 / 492 one row
  up / down, 493 / 494 six rows, the first row DS:67d8 kept in 0..0x15, so table rows 27 and 28
  never show; states 1f51), drawn by 1fd2 (title (0xa4, 0), bevel 14d0:02e5((124, 146, 434,
  186), 4, 2), outline (125, 147, 432, 184), STACK.PCK (188, 0, 216, 22) at (256, 125), six
  rows: icon ring p + 2 at (128, 148 + 30 i), name (168, 153 + 30 i), w0 at 280, w3 at 328, kind
  cell at (352, 156 + 30 i), bonus text at (400, 154 + 30 i)). v1.02 has no Bonus detail button.

## 5. Heroes, sites, quests, items

Evidence: Ghidra decompilation of the flattened image (`out/rea/decomp/`, viewed with
`tools/re/dc.py`), cross-checked against the capstone listing wherever Ghidra lost a Borland
switch table or argument pushes. Addresses are `ovlNN:OOOO` (flat linear address in brackets).
`rnd(d,s,a)` is the dice roller ovl59:02bf [L 0x7ebaf] = `a` + sum of `d` rolls of 1..`s`.

Note on argument decoding: several call sites push two of the three roller arguments with a single
`66 6A nn` (push dword), e.g. `push dword 100; push 1` = rnd(1,100,0). The capstone-based
`xref.txt` shows these as `sides=? add=?`; the values below are from the raw bytes.

### 5.1 Records used in this section

| record / array | layout | evidence | tag |
|---|---|---|---|
| player record, 0x14 bytes at 2c04:0185 + p*0x14 | +0 gold (word), +4 capital x, +6 capital y | gold deducted at ovl47:01fc; capital used for the turn-1 hero at ovl47:0000 | [V] |
| hero slots, 40 entries | 2c04:0543[s] used flag (word), 2c04:0593[s] female flag (word), 2c04:0223+s*0x14 name (20 bytes), 2c04:05e3[s] byte: bits 0-1 level (0..3), bits 2-7 experience (0..60) | ovl47:031b, ovl47:04f1, ovl47:0579 | [V] |
| army record (0x16 bytes, 1e1d:8880) fields seen here | +4 type, +5 owner, +6 movement allowance, +7 movement left, +8 strength, +9 (hero: index of the city it appeared in), +0xa hero: hero slot; non-hero: medal count, +0xc flags: 0x02/0x04/0x08/0x10 blessed at temple #1..#4, 0x1000 aboard ship | ovl47:031b, ovl34:12e6, ovl36:2274, ovl34:08a1 | +6/+7 roles [I] (promotion and medals add to +6, the hero list prints +6 as "Move"); rest [V] |
| item record, 22 entries x 0x1d bytes at 2c04:0ce9 | +0x00 name (20 bytes), +0x14 type, +0x15 value, +0x16 state (0 not in play / lost, 1 lying on the map, 2 inside a site, 3 carried), +0x17 word holder (army index when carried, site index when in a site), +0x19 x, +0x1b y (when on the map) | ovl47:08c7, ovl47:0943, ovl34:01ab, ovl35:0000, ovl40:08c0 | [V] |
| site record ("special"), 0x1f bytes at 2c04:0811, count 2c04:080f | +0 x, +2 y, +4 name, +0x18 kind (1 temple, 2 item ruin, 3 sage, 4 gold ruin, 5 allies ruin, 0 emptied), +0x19 item index, +0x1a guardian monster type (kinds 2/4) or ally army type (kind 5), +0x1b word flag (scenario-supplied; meaning [U]; when set, ruins pay more, see 5.4), +0x1d word bitmask "already shown to player p by a sage/quest" *(correction, §9.3: +0x1b is not taken from the scenario; ovl35:091e clears it and sets it on sites·3/10 random non-temple sites at every new game. Flagged sites get the special items, the richer kinds, ally types and ruin rewards, and their own map icon (ovl63:07db). +0x1d bit p = the site's marker is shown to side p on the map (ovl63:0785); set to 0x00ff for every site at set-up, 0 for flagged sites when Quests is on)* | ovl34:0000, ovl34:01ab, ovl34:0e85, ovl35:0000, ovl35:091e, ovl63:076b | layout [V]; +0x1b origin and effects [V], the name "special site" [I] |
| monster tables | name 2c04:0f67 + t*0x10, strength word 2c04:1007 + t*2 (BSS, filled from scenario data, not in the EXE) | ovl34:01ab, ovl34:07ad | [V] location; values [U] here |
| per-army-type table, 6 bytes per type at DS:45c4 (Ghidra `451b:0664`) | [0] w16, [1] w17, [2] w18, [3] w19, [4] w13, [5] w15 of ARMYTYPE.DAT | ovl48:0000 [L 0x76e40] | [V] |
| quest record, 0xc bytes at 2c04:1103 + p*0xc | +0 active, +2 type (0-6), +4 army index of the questing hero, +6 target, +8 required amount, +0xa progress | ovl01:0d7a | [V] |
| map attribute bit | high byte of the tile word, bit 0x40 = site explored/searched (global, not per player) | ovl34:0000, ovl34:01ab | [V] |

Turn counter: 2c04:0135, read through ovl61:225b [L 0x824cb] which returns max(turn, 1). [V]
Cities per player: ovl62:03f9 [L 0x828e9] fills DS:5dea[p] (Ghidra `451b:1e8a`). [V]
"Computer controls this side": ovl25:09ab [L 0x5e39b] returns 1 when 2c04:00d0[p] == 1 or DS:0836 != 0. [V]

### 5.2 Hero offers

`hero_offer_check` ovl47:0000 [L 0x75330] [V]:

```
if flag 2c04:015d != 0: no offer                      ; meaning of 015d [U]
if turn == 1: offer a hero in the city at the capital coordinates, price stays 0 (free); return yes
cap = 5; if own cities > 39: cap = 6
count heroes on the whole map (total) and own heroes
if total >= 40 or own >= cap: no offer
price = own heroes exist ? rnd(1,600,1000)  (1001..1600)
                         : rnd(1,400,300)   (301..700)
if price <= gold and rnd(1,30,0) < 7 (6 in 30 = 20 %):
    pick the k-th own city, k = rnd(1, own cities, 0)
    computer side: replace it by ovl25:0919, which scores each own city by
      rnd(1,100,100) if its AI status byte is 7, rnd(1,100,50) if 2, rnd(1,100,0) if 3, else 0,
      and takes the highest                            ; status byte meaning belongs to the AI section
    offer = yes
```

Callers: human turn ovl68:04bd [L 0x8cccd] (level-ups ovl47:0579 first, then the check, then the
dialog ovl47:0d5c; accept = ovl47:127e, decline = ovl47:12af); computer turn ovl68:0000
[L 0x8c810] accepts every offer through ovl47:0301. [V]

Creating the hero, ovl47:031b [L 0x7564b] [V]: first free slot of 40; name and female flag from
the name pick; level 0, exp 0; new army type 0x1c, strength 5, movement 14/14 (not the 16 in
ARMYTYPE.DAT's Hero row), placed by ovl61:0bff near the city *(correction §5.10: ovl43:0bff(city, 1))*. Turn 1 only: no gold is
charged, no allies, and item number p (p = player index, items 0..7 are the per-side starting
items) is put into the hero's hands (state 3). From turn 2: ovl47:01fc deducts the price and
adds allies.

Allies with a hired hero, ovl47:01fc [L 0x7552c] [V]:

```
r = rnd(1,100,0): r < 70 -> 1 ally (69 %), r < 95 -> 2 (25 %), else 3 (6 %)
type = random army type t in 0..27 with ARMYTYPE w13 != 0 (uniform over those), fallback type id 25
each ally is placed by ovl34:12e6 at the hero's square, or up to 10 random steps of -1..+1 in x and y
until a square with < 8 own armies (or empty) is found; ally gets the type's strength and moves
```

With the shipped ARMYTYPE.DAT the w13 != 0 types are Wizards, Giant Worms, Ghosts, Demons,
Elementals, Devils, Archons, Dragons (ids 23, 20, 24, 26, 22, 27, 19, 25). [V for data, V for code]

Name and sex, ovl47:0c67 [L 0x75f97] [V]: reads `TERRAIN<set>\HERONAM<p>.DAT` (FILE.DAT group 20,
index = current player, 2c04:0161 = terrain set), takes the n-th `#` line with n = rnd(1,100,0); the
character after `#` is the sex: `0` male, anything else female (DS:44d0, Ghidra `451b:0570`). The female
flag selects the Heroine wording (STRING 97 indices 8-15), level names from group 100 instead of 99,
and is stored in 2c04:0593[slot].

### 5.3 Experience and levels

`add_exp(army, n)` ovl47:04f1 [L 0x75821] [V]: only for heroes; exp = min(exp + n, 60).

Awards found (all calls of ovl47:04f1) [V]:

| amount | where | when |
|---|---|---|
| +3 | ovl34:0112 | searching a sage site |
| +3 | ovl34:0210 | every ruin search (before the outcome) |
| +1 | ovl34:0a19 | hero blessed at a temple |
| +1 or +2 | ovl36:0c01 | attacking hero after combat: +2 if the battle square is terrain type 10 (city), else +1 |
| +1 | ovl36:0ca1 | defending hero after combat |
| +10 | ovl01:1dd9 | completing a quest |

Which battle outcome triggers ovl36:0c01/0ca1 (win only or any survival) was not traced. [U] *(resolved by M5a: every surviving hero, see §5.10)*

Promotion check ovl47:0579 [L 0x758a9], run at the start of the owner's turn [V]:
level 0 -> 1 at exp >= 15, 1 -> 2 at exp >= 30, 2 -> 3 at exp >= 60 (the "Needs" column of the hero
list, ovl47:1652/193c, prints 15, 30, 60). At most one level per hero per turn.
Promotion ovl47:0672 [L 0x759a2]: level + 1, strength + 1 through 0b62:0005 (which caps every
strength increase at 9), movement allowance (+6) + 2. Messages: STRING groups 101-103 (index +6 for
heroines). [V]
Level names: group 99 (male) / 100 (female), index = level. [V]

### 5.4 Searching sites

Dispatcher ovl34:0000 [L 0x65130] (Search command on the selected stack) [V]:

```
stack must have movement left (> 0) and stand on terrain type 11 (site); the site is looked up by x,y
no hero in the stack: only a temple (kind 1) does anything (blessing)
hero present and the square's explored bit set: nothing
kind 3 sage: hero +3 exp, sage dialog (human) or AI handler, set explored bit
kind 1 temple: human -> temple menu ovl01:0000 (blessing or quest), computer -> blessing directly
other kinds: ruin search ovl34:01ab
```

Ruin search ovl34:01ab [L 0x652db] [V]:

```
hero +3 exp
if kind != 5 and a guardian is present (+0x1a != 0):
    fight ovl34:07ad: the hero dies if rnd(1,100,0) > 90 + 3*S + 5*(H + B - M)
       S = number of armies on the hero's square, H = hero strength (+8),
       B = sum of the hero's type-1 (battle) items, M = guardian strength (2c04:1007[type])
    hero dies: the hero is removed, counters updated, search ends
    hero wins: guardian removed
kind 2 item: human -> item is dropped on the site square (state 1, picked up separately);
             computer -> hero carries it (state 3); site kind becomes 0; explored bit set
kind 4 gold: gold += rnd(3,500,500) (503..2000), or rnd(3,1000,1000) (1003..4000) when +0x1b set
kind 5 allies (never guarded): n = rnd(1,2,0) (1..2), +2 when +0x1b set (3..4);
             n armies of type +0x1a placed by ovl34:12e6
```

So the survival probability is (90 + 3S + 5(H+B-M))/100, clamped to 0..100 % by the 1..100 roll. [V]

Temple blessing ovl34:08a1 [L 0x659d1] [V]: the first four temple sites in site-table order are
temples #1-#4; any other temple has no blessing effect. Each army of the selected stack that does
not yet carry the flag of that temple (0x02/0x04/0x08/0x10 at +0xc) gets strength +1 (capped at 9)
and the flag; heroes among them also get +1 exp. Result message STRING 55 (nothing blessed) or
56. So one blessing per temple per army, up to four temples. [V]

Sage, ovl34:0aa0 / menu ovl34:146f [V]: the sage visit itself is once per site (explored bit), and
offers:
* gem: gold += rnd(3,500,500) (ovl34:0b1a [L 0x65c4a]);
* show a location (ovl34:0e85 [L 0x65fb5]) *(correction §5.10: only sites with +0x1b)*: a chosen item's site, or the nearest not-yet-shown
  gold ruin (kind 4) or allies ruin (kind 5) within distance < 35 of the sage; the site is marked
  shown for that player (+0x1d bit) and revealed on the map;
* map view (ovl34:0cd6 [L 0x65e06]) *(correction §5.10: around a clicked square, clipping)*: reveals a rectangle with corner (x - rnd(1,5,8), y - rnd(1,5,8))
  (9..13 back) and size rnd(1,10,15) x rnd(1,10,15) (16..25), clipped to the 112 x 156 map; this
  button is enabled only when 2c04:0124 != 0 (option flag, identity belongs to the options section).

### 5.5 Site and item set-up at game start

ovl35:0000 [L 0x66b00] [V] (runs when a game is set up):

*Correction and addition (§9.3): the routine first runs two steps this listing left out.
`ovl35:091e` chooses the +0x1b flags. `ovl35:04ef(cap)` redraws items 8..21 from the
scenario's `.ITM` list. "Put item i into a random free non-temple site" below is also
incomplete: `ovl35:0173..020e` accepts a drawn site only when its +0x1b flag equals
`special(item i)` (ovl35:08f4). Special items go only into flagged sites, all other items
only into unflagged ones. The listing is kept as written; §9.3 has the full pseudo-code.*

```
total_items = min(22, sites/3 + rnd(1,5,-3) + 8)          ; items 8..total-1 are scattered
cap = (2*sites)/10 ; k = min(rnd(2,3,1), cap)               ; 3..7
for i in 8..total-1:
    if i < k+8 or i >= cap+8: put item i into a random free non-temple site (state 2, site kind 2)
    else: item i not in play (state 0)
items >= total: not in play
for every other non-temple site:
    +0x1b set                      -> kind from {5,5,4}            (2/3 allies, 1/3 gold)
    no live capital within 15      -> kind from {3,4,5,3,4}        (2/5 sage, 2/5 gold, 1/5 allies)
    a capital within 15            -> kind from {3,4,5}            (1/3 each)
then +0x1a for every site: temple 0; allies ruin: +0x1b set -> type id from {25,23,27,19}
    (Dragons, Wizards, Devils, Archons); else no capital within 15 -> {24,20,26} (Ghosts,
    Giant Worms, Demons); else {22,20} (Elementals, Giant Worms); other kinds: guardian
    monster rnd(1,9,0) (1..9)
```

Tables: DS:0c9a..0cae (bytes 25,23,27,19 | 24,20,26,22 | 22,20 | 5,5,4 | 3,4,5,3,4 | 3,4,5). The
"{24,20,26}" pick uses only the first three of the four bytes stored there (22 is never chosen). [V]
Per-side starting items 0..7: handed to each side's turn-1 hero (5.2); their placement before that
was not traced. [U]

### 5.6 Items

Effect type at +0x14, value at +0x15 (labels of the army-info screen ovl40:08c0, list text STRING
group 167) [V]:

| type | effect | used in |
|---|---|---|
| 1 | +value battle strength for the carrying hero | ovl38:0d1a (combat), ovl34:07ad (ruin fights) |
| 2 | +value command (stack bonus) | ovl38:0d71 |
| 8 | +1 command (label "com +1") | ovl38:0d71 |
| 5 | allows flight (label "fly") | not traced [U] |
| 6 | doubles movement (label "move") | not traced [U] |
| 7 | +value gold per city (label "gld +%d") | not traced [U] |

Types 3 and 4 were not seen. Dropping an item on water (terrain type 2) destroys it (state 0),
elsewhere it lies on the map (state 1, square flag 0x40 in the byte map at 0x70 bytes per row *(correction §5.10: 0943 does not set 0x40; 0x40 marks a planted standard)*),
ovl47:0943 [L 0x75c73]; picking up sets state 3, ovl47:08c7 [L 0x75bf7]. [V]

### 5.7 Quests

Assignment ovl01:0d7a [L 0x4a4ba] (Ghidra lost its switch table; read from the listing) [V]:
human temple request (argument 0): type = DS:00a0[rnd(1,10,-1)], table {0,1,2,3,4,5,6,4,5,6};
computer (argument != 0): first try type 4 (80 %) or 5 (20 %), second try 3, third try 6.
An infeasible type restarts the selection.

| type | task | target / amount |
|---|---|---|
| 0 | kill an enemy hero | a random enemy hero (army index) |
| 1 | fetch an item | a random item still inside a site (state 2) within 50 squares in x and y (30 for computer sides); the site is revealed to the player *(correction §5.10: never a special item)* |
| 2 | kill a unit of an enemy army type | up to 5 tries of a random w13 army type (as for hero allies) that some enemy army on the map has |
| 3 | kill N armies of a side | a random other live side (up to 200 tries), N = rnd(1,12,10) (11..22) |
| 4 | occupy a city | random enemy city whose square is terrain 10, distance <= 60 (40 for computer), any distance after 100 tries |
| 5 | raze a city | as 4, distance <= 60 |
| 6 | pillage/sack gold | amount rnd(3,300,500) (503..1400) |

Types 3-5 are refused while 2c04:015b != 0 (flag meaning [U]). For type 1 the counting pass
selects items with state 2 but the picking pass accepts any state != 0, so a mismatch is possible
(code as written). [V]

Reward ovl01:1909 [L 0x4b049] [V]:

```
if own cities < 10 and turn > 15: allies, n = rnd(1,3,5) (6..8)
else:
    if gold >= 100:
        if some item is not in play (state 0; index > 7 or = own index) and rnd(1,3,0) == 1:
            reward = that item (random one)
        elif no such item, some site is unrevealed for the player, and rnd(1,3,0) < 3:
            reward = show the nearest such site to the hero
    if no reward yet: rnd(1,2,0) == 1 -> allies, n = rnd(1,3,2) (3..5)
                      else gold rnd(2,1000,1000) (1002..3000)
    *(correction §5.10: the item must be special; the allies roll only with gold >= 100)*
```

Reward allies are always army type id 19 (Archons; "Winged Folk" with ARMYTYP2.DAT), created by
ovl34:12e6 at the hero (ovl01:1d5b). The hero gets +10 exp. [V]

Quest checking ovl01:1ded [L 0x4b52d] runs with an event code (-1 start of turn, 0..4 from
battle, capture, raze, pillage and search sites). Its failure messages are STRING groups 32-42
(hero dead, city razed, city taken without the hero, city to be razed was occupied, wrong
pillage, foes all dead, ...). The per-event conditions were not traced instruction by
instruction. [I] *(traced, §5.10)*

### 5.8 Medals

ovl36:2274 [L 0x69ce4], called after a battle with a flag argument (1 = the case that can award)
[V]:

```
eligible = units of the battle stack that are not heroes and whose type has w13 == 0   *(§5.10: DS:5e3e after re-selection)*
no award if any unit of the stack is aboard a ship, no hero in the stack, or no eligible unit
"real battle": both sides had >= 2 units, or (turn < 20 and the defender had >= 1 unit
               whose final battle strength was > 3)
m = own non-hero, w13 == 0 armies that already hold >= 1 medal
chance: rnd(1,100,0) < max(12, 40 - 5*m)
pick a random eligible unit; if it has < 4 medals: medals + 1 (+0xa) and
    if its strength > 14: movement allowance + 1, else strength + 1 (capped at 9 by 0b62:0005)
```

Medal name: STRING group 161 index medals-1. With the cap at 9, a strength-9 unit gains nothing
from a medal (strength > 14 cannot occur). [V for the code; whether the cap is reachable this way
in play was not checked]

### 5.9 Not determined

* Meaning of 2c04:015d (blocks hero offers), 2c04:015b (blocks quest types 3-5), site flag +0x1b.
  *(Update §9: 015d is reset to 0 at new game (ovl53:0018). EL §6.7 identifies it as the
  surrender-offered flag. Site flag +0x1b is set at random at set-up (§9.3).)*
* Effects of item types 5, 6, 7 in movement and income code.
* Exact battle outcome that awards hero experience (ovl36:0c01/0ca1) and the caller's
  argument to the medal routine.
* Quest failure conditions per event (only the message set is mapped).
* Monster names/strengths (scenario data, 2c04:0f67 / 2c04:1007).

### 5.10 Corrections and additions (M7a, asm re-read for rules/heroes.py, ruins.py, quests.py)

All [V] from out/asm/ unless tagged.

* **New hero's square** (ovl47:031b): ovl43:0bff(city, 1), not ovl61:0bff: the first city square
  with < 8 armies, else 20 tries `(cx + rnd(1,3,-2), cy + rnd(1,3,-2))` until the map army bit
  0x10 is clear; 031b ignores the result, so the last try is used even when it failed. The
  square's owner nibble becomes SCN 0x110. Turn 1: item p state 3, holder = the hero (no
  position). News ovl41:1244(p, 0, city, 0, name).
* **Offer** (ovl47:0000): the k-th own city with k = rnd(1, cities, 0); price DS:1110 is reset
  to 0 at every check. The human dialog ovl47:0d5c draws the name (ovl47:0c67) when it opens,
  also on turn 1; buttons accept 0x11f, decline 0x120 (disabled on turn 1), rename 0x121 (15
  characters), male / female 0x122 / 0x123. Allies (ovl47:01fc): type ovl47:1a9b first, then the
  count roll, then ovl34:12e6 per ally.
* **Ally placement** ovl34:12e6: 10 squares tested at most (the start and 9 moved ones; the
  10th move is not tested, 20 dice); a square with < 8 armies whose owner nibble is SCN 0x110,
  or an empty one, is used; positions are not clipped to the map. The army: +6 = +7 = w3,
  +8 = w0, +9 = +0xa = +0xb = 0.
* **Hero death** ovl36:16cd (X08): slot freed; every carried item gets state 0 when there is an
  item and (x, y) is Water, else state 1, holder 0, x, y. The road bit 0x40 is **not** set, so a
  dropped standard is not planted (ovl47:0b47 fails) but can be picked up again (ovl40 item
  dialog lists state-1 items on the hero's square, ovl51:03d9 mode 1). An item whose index
  equals SCN 0x110 (the side on turn's standard, even when the dead hero is the defender's)
  cancels that side's vectoring to the standard (ovl44:0410(-2): +0x31 = 0, target -1/-1).
  The quest record is not touched (only the grouped Disband clears it, EL §4.5).
* **Road-layer bit 0x40** = planted standard: set only by ovl47:09f7 (plant: not on Water, Shore,
  City, Site, nor where 0x40 is set; the hero must carry item SCN 0x110), cleared by ovl47:08c7
  for items 0..7 and at new game. ovl47:0943 (drop) and the ruin item never set it.
* **Experience** (ovl47:04f1): exp + n >= 60 -> 60. M5a: every surviving attacking hero gets
  +2 (first square terrain 10) / +1, a surviving defender +1 when DS:424c[i] is a hero
  *(correction X23: DS:424c is the attacker type array; past the attacker count it holds the
  previous set-up's bytes, see §3.5)*.
* **Ruin search** ovl34:01ab: a hero killed by the guardian also increments 2c04:1167 + p*0x5a
  and, per carried item < 8, 2c04:116b + p*0x5a (per-side statistics record 2c04:1163 + p*0x5a,
  also written by ovl36:1aff), news (1, 0xfffe). A human's found item lies on the site square
  (state 1); the result dialog (ovl34:1812) has OK (0x124 -> ovl34:1964: re-select the stack
  on the square, hero first) and, after an item, Take (0x125 -> ovl34:186e: every state-1 item
  on the square to the hero, re-select, quest check ovl01:1ded(3)). The guardian strength is the
  word 2c04:1007 + 2t; S counts armies of any owner on the hero's square.
* **Temple** (ovl01:0000): the quest button 0x149 is enabled only with Quests on, no active
  quest and a hero (DS:5e5e); bless 0x148 -> ovl01:0132 -> ovl34:08a1. Without a hero
  ovl34:0000 blesses directly (human too).
* **Sage** (ovl34:1610 / 0e85): the "show" list holds only sites with **+0x1b set**, not shown to
  p, at distance < 35: one entry for the nearest gold ruin (-1), one for the nearest allies ruin
  (-2), one per item ruin (its item). 0e85 then sets +0x1d bit p, ovl64:1298 at the site and
  ovl35:09f2(p). Map view: a human clicks the overview map (res_0726:036f: square = ((px-0x50)/2,
  (py-0x3c)/2)); ovl34:0cd6 rolls dx, dy, w, h, clips x0/y0 at 0 and `x0 + w >= 0x70 -> w = 0x6f -
  x0` (column 111 / row 155 are never included), then calls ovl64:1298 for **every square** of
  the rectangle (so it reveals radius 1 around each, 2 when flying / on a City). The computer's
  sage choice is ovl26:0080 (AI tables). Buttons: 0x117 show (iff list), 0x118 gem, 0x119 map
  (iff Hidden Map), 0x11a close (after a choice).
* **Site tiles** ovl35:09f2(p) (from ovl61:217d, ovl49, ovl01:1d07, ovl34:11f1): map low byte
  of every site = 0x0b temple, 0x0c without +0x1b, 0x09 with +0x1b while not shown to p and
  Quests on, else 0x0a. SCN 0x710 maps 0x0a..0x0c to Site and 0x09 to another terrain in the
  shipped scenarios, so a hidden special site cannot be searched until a sage or a quest shows
  it. With Quests on it also calls ovl63:2785(0, x, y), which draws no dice on these tiles.
* **News** ovl41:1244(p, kind, a, b, name): per side record 2c04:13e3 + p*0x2b holding two
  entries (count byte, kind bytes, two words each, 16-byte names); when full, the entry with
  the larger kind is replaced by a smaller kind. Kinds seen: 0 hero joined, 1 hero lost in a
  ruin, 2 quest done, 3 quest taken, 6 site (0x65 sage, item, 0x66 gold, 100 allies).
* **Quest assignment** ovl01:0d7a: news (3) first; the type-1 item must not be special
  (ovl35:08f4) in both passes; positions by ovl35:0b36 (state 1 x/y, 2 site, 3 army); after the
  reveal (ovl64:1298 at ovl01:10dd), a site there is marked shown and ovl63:2785(1, x, y) draws
  four rnd(1,3,1) when the square's picture is a mountain tile (0x50..0x5f). Type 2: up to 5
  types from ovl47:1a9b with an enemy army of that type on the map. Types 3/4/5 are refused
  while 2c04:015b (victory) is set (X24); their 200-try loops fail also when the 200th try
  succeeds. Computer: 4/5, then 3, then 6 for every later attempt.
* **Quest check** ovl01:1ded(event, w, value, continuation): no active quest -> 0; quest hero's
  owner != SCN 0x110 -> failure (group 32). Per event (X26):
  -1 (turn start): 4 or 5 and the target city no longer terrain 10 -> 33; 4 / 5 and the city
  owned by p -> 42; 0 and the target army no longer a hero -> 41; 3 and the target side dead
  -> 39; 1 and the item out of play -> 40. 0 (battle; only with the quest hero among DS:42c6):
  3 with DS:41fb == target: progress += dead defenders, done at the amount; 2: a dead defender
  of the target type (DS:4254); 0: the target among the dead defenders (DS:42e6). 1 (pillage /
  sack, value = gold): 4 / 5 with the city own and intact -> 36; 6 with the hero among the
  attackers: progress += value. 2 (raze): 5 with owner 0x0f, ruined, and the quest hero's
  square in the city -> done with the hero among the attackers, else 37; 4 with the city
  ruined -> 38. 3 (items): 1 with the item carried by the quest hero -> the item leaves play
  (state 0), done. 4 (occupy): 4 with the city own and intact -> done with the hero among the
  attackers, else 34; 5 with the city own and intact -> 35. Failure clears +0 (message for a
  human, ovl61:1160). Done: +0 = 0, reward, news (2), +10 exp; for a human the reward page
  ovl01:1520, closed by ovl01:18a1 (re-select at DS:5e5e's square, then the continuation
  DS:3f64). From the battle with a taken city the continuation is 3024:0075 = ovl36:04f7 (the
  capture choice), so a human still chooses after the reward and a computer does not.
* **Reward** ovl01:1909: the item must be special (ovl35:08f4), state 0, index > 7 or == p; the
  site candidates are sites with +0x1b, not shown to p, kind != 0, nearest to the quest hero
  by max(|dx|, |dy|); the rnd(1,2,0) allies branch only runs with gold >= 100 (below: gold).
  The site reward reveals (ovl64:1298) and redraws (ovl35:09f2) only when (SCN 0x159 and not
  DS:3254) or the side is human; DS:3254 = Hidden Map and exactly one live human, set at the
  computer turn start ovl68:0074.
* **Medals** (ovl36:2274): the stack is DS:5e3e as left by the re-selection ovl36:047f..0490
  (first army of the target square, ovl67:06eb) after a won attack; "real battle" reads DS:42c4 /
  42c5 (side counts) and DS:42a4 (first defender's set-up strength >= 4). The argument is the
  battle result (asm ovl36:0498) *(closed, X23: the re-selection runs in ovl36:0000 itself,
  see §3.5)*.

### 5.11 Presentation of heroes and sites *(Addition, M7b)*

All [V] from out/asm/ (positions are DGROUP words read from the user's EXE; implemented in
`ui/dialogs/{hero_offer,hero_name,hero_inspect,hero_levels,level_up,medal,search_result,sage,
temple,quest,items,ruins}.py`, `ui/info/site.py`, whose docstrings carry the full lists).

* **Popup type 2** (ovl17:0000(2)): marble with source and destination x shifted by DS:2a8c = 224,
  the common frame on the whole (80, 60, 480, 312), the overview bitmap in the left 224 px at
  (ovl17:08c7() = 0x50, 0x3c) (ovl63:04d3; with Hidden Map three colour-3 edge lines on the
  bitmap first). ovl63:0000(1, ...) adds the city markers, (0, ...) not. Marks on the bitmap:
  ovl63:1f5f(x, y, k) ATRANS2 DS:2cae + 8k at (max(0, (2x - 2) >> 3 << 3), max(0, 2y - 6));
  ovl63:05e4 site icons DS:0f28 + 8k (k 2 temple, 1 explored, 3 +0x1b, else 0) at
  ((2x + 3) >> 3 << 3, 2y - 1), the chosen site boxed in colour 15 (12 x 10); ovl63:158d army
  marks; ovl62:08cd / 099e / 0a3f the 4x4 mark, 8x8 box and line in colour 8.
* **Hero offer** ovl47:0d5c is not modal: it draws, activates screen 12 and returns; 287 accept
  (127e), 288 decline (12af, disabled on turn 1 by 120c), 289 rename (12ce: ovl56:03a6(box, name,
  15, 176)), 290 / 291 sex (12f9: picture and wording again, the drawn name kept). Lines: STRING
  97, turn 1 indices 0-3, later 4-7, +8 for a heroine; FHERO / MHERO (pictures 34 / 33).
* **Promotion** ovl47:0672(army, group, popup 0x10 + level): nothing for a computer side (0723);
  popups 0x10-0x12 = LEVEL2-4; STRING group 101-103 indices f..f+5 (f = 6 for a heroine), the
  last with (level + 1, strength, gain, allowance, 2); waits for a release or a key.
* **Medal** ovl36:24a5: only for a human attacker; popup 0x18 + medals - 1 (MEDAL0-3); the unit at
  (176, 155); (158, -1), (159, 0) with the type name, (160, -1), (161, m), (162, 0 / 1),
  (162, 2) "v - 1 to v". The two -1 indices roll the game's dice (ovl59:052f) - not drawn by
  the engine.
* **Search** ovl34:0000: every refusal is silent. A human's ruin search: WAR.PCK mark on the
  square, popup type 4 "Searching" with SEARCH.PCK, lines at (128, 300 / 320 / 340); the waits
  ovl61:10fb(NULL) only wait (no popup); result buttons screen 13 (292 OK, 293 Take after an
  item, Return presses Take then). Blessing: ovl61:1160((55, 0) / (56, 0) / (56, 1) n, (56, 2)).
* **Sage** ovl34:0aa0 / 146f: the visit line (58, 0), 10 ticks, then popup 2 "A Sage!" with
  (63, 0..4), screen 10 (279 show iff the list, 280 gem, 281 map iff Hidden Map, 282 close after a
  choice); the place list is the generic ovl51:0000 list (popup 3, screen 2).
* **Temple** ovl01:0000: popup 9, (19, 0..2) in SetFont(2, 7, 6, 1), screen 15 (328 bless, 329 quest
  iff Quests, no quest, a hero). **Quest page** ovl01:0167 / 0320 and **reward** ovl01:1520 / 160e:
  popup 2 with SCROLL.PCK, lines centred at x 440 in SetFont(2, 0, 7, 1), groups 21-27 per type,
  28-31 for the reward; failures ovl61:1160((g, 0), (g, 1)), g = 32..42.
* **View > Items** ovl35:0c21: items 8..21 sorted by (type, value), groups 166 / 167.
  **View > Ruins** = ovl45:0000(4, view centre): the nearest site shown to the side, SPECBITS cell,
  (113, kind), (114, explored), legend (115, i), three lines of `<scen>\<scen>.SPC` after
  "#nnn"; close 192 only. **Site right click** ovl46:0fd7: the name in the side's colours,
  DS:10e5 / 10f9 / 1105 (the last at T + 33).

## 6. Cities, economy, turn sequence, diplomacy, victory, AI

Evidence is the Ghidra decompilation of the flattened image (`out/rea/decomp/`, viewed with
`tools/re/dc.py`), cross-checked against the capstone listing wherever Ghidra's output was
damaged. Addresses are `ovlNN:OOOO` (overlay offsets) with the flat linear address `L 0x…`.
Dice: `rnd(n, s, a)` = `a` + sum of `n` rolls of 1..s (ovl59:02bf, L 0x7ebaf).

Two decompiler pitfalls met here, worth knowing for re-checks:

* Ghidra function names `FUN_SSSS_OOOO` mean linear `SSSS*16+OOOO`; flat segment = SSSS-0x1000
  (e.g. `FUN_8c81_…` is ovl68, `FUN_824f_…` ovl62, `FUN_7533_…` ovl47). Some near-call targets
  inside overlays are printed 0x10000 too low (e.g. `FUN_5efd_122f` in ovl43:0000 is really
  ovl43:0bff); the listing's near-call offsets are authoritative.
* Borland pushes `rnd`'s last two arguments as one 32-bit immediate (`66 6A imm8` /
  `66 68 imm32`). In the listing these look like a single `push N`; the hidden high word is
  the `add` argument. Several dice calls below were read that way.

### 6.1 Data layout used in this section

| item | field | meaning | evidence | tag |
|---|---|---|---|---|
| player record 2c04:0185 + p*0x14 | +0 (word) | gold | ovl68:0827 (L 0x8d037) adds income-upkeep; ovl44:0ee3 subtracts purchase price | [V] |
| | +4, +6 (2c04:0189/018b) | map x/y used to centre the view at turn start | ovl68:0259, 04bd | [I] |
| 2c04:00d0[p] | word | 0 = human, 1 = computer | ovl68:0000 counts humans as `d0==0`; ovl61:1aed turns dead humans into 1 | [V] |
| 2c04:00c0[p] | word | computer level 0/1/2 = card letter K/L/W (DS:2616 "KLW"); 3 is excluded from the difficulty average | ovl57:21c1 (L 0x7d8d1), ovl57:0bab | [V] |
| 2c04:00e0[p] | word | card number (CARDS\%c%03d) | ovl57:21c1 | [V] |
| 2c04:00f0[p] | word | "Enhanced" toggle of the side-setup screen | ovl33:0508 toggles it; effect 6.3 | [V] |
| 2c04:0137[p] | word | side alive | ovl61:18ab clears it on elimination | [V] |
| 2c04:0147[p] | word | side's turn is shown/animated (set for all when no human, etc.) | ovl68:0000, ovl53:0000 | [I] |
| 2c04:10e3[p] | word | "infamy" counter (rises with razing, sacking, treachery); used to rank the diplomatic rating | 6.6 | [V] (name [I]) |
| 2c04:153b[a*8+b] | byte | relation of a towards b: bits 0-1 current state, bits 2-3 proposed state | ovl00:0db3 | [V] |
| DS 0x5dca (`451b_1e6a`)[p] | word | income of p computed this turn | ovl62:0372 | [V] |
| DS 0x5dda (`451b_1e7a`)[p] | word | upkeep of p computed this turn | ovl62:02bf | [V] |
| DS 0x5dea (`451b_1e8a`)[p] | word | number of cities owned by p | ovl62:03f9 | [V] |
| city 2c04:157d + c*0x41 | +0x00/+0x02 | x, y (top-left of the 2x2 city) | many | [V] |
| | +0x04 | name (C string) | ovl19:1864 prints it | [V] |
| | +0x14 | defence value: 1 if the city has < 3 production slots filled, else 2 (recomputed by ovl44:0930 after buying or losing a slot) *(addition §9.2: also recomputed for every city at new game, ovl53:0a41..0a70, after the slot normalisation; so the file value never survives into play)* | ovl44:0930 (L 0x70ed0) | [V] |
| | +0x15 | owner (0-7, 0x0f = none/razed) | ovl62:0372, ovl32:016b | [V] |
| | +0x16..0x19 | production slot army type (0xff = empty) | ovl44:094f counts `>= 0` | [V] |
| | +0x1a..0x1d | slot build time (turns) | ovl44:1299 copies ARMYTYPE w1 | [V] |
| | +0x1e..0x21 | slot strength | w0 | [V] |
| | +0x22..0x25 | slot moves | w3 | [V] |
| | +0x26..0x29 | slot cost | w2 | [V] |
| | +0x2a (word) | gold income of the city | ovl62:0372 sums it; random maps set it at ovl11:1171 | [V] |
| | +0x2c | army type currently in production (0xff none) | ovl44:00ff, ovl43:0dd7 | [V] |
| | +0x2d | turns left on the current production | ovl43:0000, ovl44:00ff | [V] |
| | +0x2f | second owner byte, set to 0x0f when razed *(addition §9.1/§9.5: set to +0x15 at scenario load, ovl29:0000. At new game ovl29:010b sets it to p on each live side's capital and deals every other intact city with +0x2f = 0x0f round-robin to the computer sides. Reading: the AI's claimed territory [I])* | ovl32:016b, ovl29:0000, ovl29:010b | [V] (meaning [I]) |
| | +0x30 | OR-ed with 2c04:0cbe[attacker] when attacked | ovl36:0000 | [I] (bitmask of attackers) |
| | +0x31 (word) | vectoring on | ovl44:021d/028b | [V] |
| | +0x33/+0x35 | vectoring target x/y (-2,-2 = special target, see 6.4) | ovl44:028b | [V] |
| army 1e1d:8880 + i*0x16 | +0x06 | movement allowance | ovl43:0dd7 | [V] |
| | +0x07 | movement left | ovl68:05fb | [V] |
| | +0x09 | home city | ovl43:0dd7 | [V] |
| | +0x0b | upkeep (gold/turn) | ovl43:0dd7, ovl62:02bf | [V] |
| | +0x0f | bits 1-7: vectoring destination city (or player+100), bit 0 kept | ovl43:0dd7 | [V] |
| | +0x10 | transit state: 0x65 just produced in transit, 0x66 one turn on the way, 0xff normal | ovl43:0000 | [V] |
| | +0x11 | group number (cleared at turn start when the group has one member) | 0b62:0d85 (L 0x1c3a5) | [V] |

Army fields +0, +2, +4, +5, +8, +0xc are documented in the army section; +0xc bit 0x1000 is the
"in a boat" flag used by upkeep below.

### 6.2 Turn sequence  [V]

The per-side turn is driven from ovl68. For a **computer** side ovl68:0000 (L 0x8c810) runs, for
a **human** side ovl68:0259 (L 0x8ca69) followed by ovl68:04bd. Both begin by recounting cities
(ovl62:03f9) and the diplomacy resolution ovl00:0db3 (6.6) runs first for the computer path.

Computer side, after the city count, if it still owns a city:
1. hero offer decision ovl47:0000 / ovl47:0301, then ovl47:0579 (hero code, see heroes section);
2. income and upkeep ovl68:0827;
3. production and vectored arrivals ovl43:0000 (6.3, 6.4);
4. single-member groups dissolved (0b62:0d85);
5. movement refresh ovl68:05fb;
6. fortify marks ovl67:0000 (below);
7. ovl62:03f9 recount, ovl67:0113 (clears army flags 0x40 and 0x200), quest check
   ovl01:1ded(-1), ovl25:0000 (AI move, 6.8).
A side without cities (`cities[p] < 1`) is skipped.

Human side (ovl68:0259): diplomacy resolution and recount, then ovl61:0aeb, group cleanup
(0b62:0d85), movement refresh (05fb), fortify marks (ovl67:0000), **income/upkeep (0827)**,
ovl67:0113, report screens; then ovl68:04bd: production (ovl43:0000) with its report
(ovl43:06bd), hero code (ovl47:0579, ovl47:0000 → ovl47:0d5c offer dialog), and the
victory/surrender screens of 6.7. So for humans income is credited before production is
delivered; for computers too (step 2 before 3).

Movement refresh ovl68:05fb (L 0x8ce0b), for each own army on the map:
`carry = min(moves_left, 2)`; `moves_left = allowance + carry`, or `carry + 20` if the army
is in a boat (flag 0x1000); armies with a hero holding the double-move item get their stack's
allowance added again (ovl35:0874 test, +army[+6]); finally `moves_left = min(moves_left, 99)`.
Movement points are the parent's topic; listed here only because it is part of the sequence.

Fortify marks ovl67:0000 (L 0x8bc30): for each own army without flag bit 0 whose
`moves_left >= allowance` and which stands on tile type 1, 4, 5, 7, 8 or 9 or on a road/feature
square (`1e1d:[y*0x70+x] & 0x1f`), the map word gets bit 0x2000. The battle code treats that
bit as "city-class" terrain with +1 defence (see combat section); the bit is cleared when the
square is captured (ovl36:0a6b). [V] for the code, [I] that this is the "fortified" rule.
*(Addition, M4b orders: bit 0 is the "awake" bit — every selection sets it (ovl66:009f,
ovl67:0955), Defend clears it (ovl67:03a6) — so the marks fall under armies that were told to
Defend and did not move since. The test is signed (`+7 >= +6`) and has no x >= 0 check. The
only writer of 0x2000 is ovl67:00ff; it is cleared only where no army stands (0b62:023e when
a square empties, ovl62:02a8 at every main-loop pass), on capture (ovl36:0d6f) and at new game
(ovl53:0247): no per-turn clear while the armies stay.)*

*(Addition, M8a: the whole sequence re-read from the asm; implemented in `rules/turn.py`. It
corrects the human order above: the hero code runs **before** production.)*

| step | address | what |
|---|---|---|
| main-loop pass (every side) | ovl61:217d, 2183, 2194, 219c, 21a1, 21b0, 21b6 | ovl35:09f2(0x110) site tiles; ovl62:0000 map words; 0555:0d9e(0x110, 1) cost map; ovl00:0cc7 proposal marks on relation byte [p][p] (bits 4/5); ovl68:089d: own armies with flags != 0 standing in a city lose 0x1000; ovl36:10d7(p): player record +4/+6 = first capital (+0x10/+0x12) while own and intact, else the own city nearest to +4/+6 (ovl62:04fa), unchanged without cities, first capital with one live side; ovl64:175c: with Hidden Map, when the four explored bytes of every intact city OR the dead-side mask are 0xff, 0x124 = 0 and STRING (18, 0) |
| computer | ovl68:0000 | 0x159 = 0x147[p], 1 without a live human, 0 with Hidden Map, > 1 human and 0x147[p] == 0; DS:3254; Hidden Map: ovl64:0d39 + 1558; ovl00:0db3; recount: no city -> return (no view store); ovl47:0000 / 0301 offer; ovl47:0579 levels; ovl68:0827 settlement; ovl43:0000 production (no 06bd restart); 0b62:0d85; ovl68:05fb; ovl67:0000; ovl62:03f9; ovl67:0113; ovl01:1ded(-1); ovl25:0000(1) AI; DS:5e3e[8], 5e62, 5e5e = 0; Hidden Map: ovl64:0e68 |
| then | ovl61:2203 | ovl61:17f6, the loop goes on |
| human | ovl68:0259 | DS:3254 = 0; DS:16a6 -> 0x147[q] = 1 for live q; 0x159 = 1; ovl00:0db3; ovl64:0d39 (always); recount, income, upkeep caches; Hidden Map: ovl64:1558; display; 0b62:0d85; ovl68:05fb; ovl67:0000; ovl68:0827; ovl67:0113; ovl64:0629(+4, +6) view centre (SCN 0x175..0x17f); "Turn %d" screen; 0b62:0ea0(-1, -1) sink; ovl01:1ded(-1); ovl58:026f(5) talking advisor; ovl68:04bd(0); the loop returns |
| | ovl68:04bd(si) | 0x15b and not 0x157 -> victory screen ovl61:1fbd, return; 0x15d and not 0x15f -> surrender offer ovl61:1f68, return (buttons -> ovl61:2004 / 2046 -> 04bd(0)); si <= 0: ovl47:0579, ovl47:0000 -> music 4, offer dialog ovl47:0d5c, return (buttons ovl47:127e / 12af -> 04bd(1)), else music 1; si <= 1 and turn 1: ovl45:0000(2, +4, +6) production screen, return; si <= 2: ovl43:0000, ovl43:06bd when it reported; SCN 0x12e, turn 2, byte 0x134 bit 0x40 clear -> set it, tutorial page FILE.DAT (25, 7) |
| End Turn | ovl61:2074 | 0x15b -> nothing; ovl00:1063 refused-proposal infamy; ovl64:0e68 (always); selection words = 0; display; ovl61:17f6; ovl61:2123 |
| round end | ovl61:17f6 | turn + 1; ovl61:1732 (Random Turns: 20 swaps, 40 dice); 0x118 = 0; ovl61:18ab; ovl61:1aed; ovl30:0034 (empty); ovl39:025a Active neutrals (attacked intact neutral cities: count +0x2d down, unit at 0 via ovl39:0381; not busy (ovl29:0fd5) and < 4 armies -> ovl29:103d(c, 2): refused when gold[0x110] < cost + 30 and turn > 5); ovl41:0d60 history file; ovl68:0952 display |

ovl58:026f(5) rolls the game's dice (remark rnd(1,5,0), pick rnd(1, n, -1), blink rnd(1,30,10))
whenever the talking advisor is on (DS:26c8 == 0), and n depends on DS:37a4 (sample or caption
group). ovl58:0000 (music) rolls for a random track only when the mode differs from the playing
one or the track has ended (ovl58:0011..0020), a wall-clock condition. ovl68:022c has no caller
in the listing.

*(Addition, engine fidelity round: no pass between two human commands.)* ovl61:2123 returns right
after ovl68:0259 for a human side (2221..2236). Its callers are ovl61:0118 (Begin, ovl61:0000(x, 1)),
ovl61:211e (End Turn) and ovl33:0060 (the Settings close of the computer-turn interrupt). The
event loop 08a9:000e dispatches each event (0726:0009, 07be:0064, 07be:0e26, 07be:04d8) and polls
again; nothing on that path calls ovl35:09f2, ovl62:0000 or 0555:0d9e. Their other callers are
commands: ovl62:0000 at ovl24:00c1 / 0155 (AI), ovl34:039b (ruin), ovl36:02ee / 0cf1 / 168a
(battle), ovl43:0760 (production restart), ovl49:0231 / 0380 / 17e7 (load, Resign), 0b62:0895
(Disband), 0b62:122b (sinking); ovl35:09f2 at ovl01:1d07 (quest reward), ovl34:11f1 (sage),
ovl49:037a (load); 0555:0d9e at ovl12:00e3 (road builder), ovl29:0402 (AI), ovl36:0f69
(take-over), ovl49:0391 / 138a (loads). So a vacated square keeps its owner nibble (0b62:01a7
clears only bits 0x10 / 0x20), and a city razed during the turn keeps its four cost-map bytes
(0x99 for an own city: cost 1) until the next side's pass. [V]

*(Addition, same round: DS:5dea is a stored word.)* Only ovl62:03f9 writes it (0404 / 0437), called
from ovl32:009c (own raze), ovl36:0cb5 (battle), 10c1 (take-over), 1149 (ovl36:10d7, more than one
live side), ovl41:0efb (history round), ovl42:0343 (every ovl42:02fb: report pages, the history
scores ovl42:0947), ovl47:007b (hero offer), ovl49:0361 / 136f (loads), ovl61:18b3 (elimination),
1afa (end states), ovl68:0158 / 01c7 (computer turn), 0234 (ovl68:022c, no caller), 02fe (human
turn start). The burning of Resign and the raze after a capture call ovl32:016b without it, so
the word stays stale: Resign's gate ovl49:151c lets the side resign again in the same turn, and
the menu switches ovl61:0745 / 0886 keep Resign, Build, Production and Vectoring on. [V]

*(Addition, same round: the info area is drawn only by ovl66:0356.)* Its no-selection branch
ovl66:05a3 prints DS:5dea, gold, DS:5dca, DS:5dda as they are at that moment. The callers are
0b62:04e8 / 08fa, 0c8c:04fb, 0a8b:0d0f, ovl66:0959 / 0a4a / 0a8f / 0acf / 14f3, ovl67:01e0 /
0384, ovl36:01b9 / 04cb, ovl68:03a4 / 05a8, ovl61:008f (ovl61:0000(x, 0), 20 callers) and
ovl61:0168 (ovl61:011f(x, y, z) with z != 0). ovl61:011f(0, 0, 0), the close of the reports,
history, item, diplomacy, shortcut, hero-level and Settings dialogs, skips it (0140 / 014b /
0162), so after Report > Gold refreshes DS:5dda the info area keeps the old upkeep until the
next 0356. [V]

*(Addition, M8a UI pass: presentation and settings around the turn loop, asm re-read.)*

* "Turn %d" pop-up (ovl68:03a9..0444): ovl17:0000(6) = popup type 6, picture 28, whose extra
  frame (ovl17:0200..04e7) is drawn into the picture: outlines (0, 0, w, h) and (10, 10, w-20,
  h-20) in SCN 0x0b0[0x110], bands (1, 1, w-2, 9), (1, 1, 9, h-2), (1, h-10, w-2, 9), (w-10, 1,
  9, h-2) filled with SCN 0x0a0[0x110]; SetFont(1, 15, 0, 3); side name centred at (320, 0x55),
  "Turn %d" (DS:3263, ovl61:225b) at (320, 0x82); ovl58:0b93; input flushed (ovl59:01f1), DS:166a
  = 1 during the wait ovl59:0142 (mask 0xd4), close, 155e:0736. With > 1 live human and Hidden
  Map (di = 0 in ovl68:0259) the overview / view centring / map draw come only after the pop-up,
  and End Turn blanks map and overview first (ovl61:20fd -> 0a6e: colour 0 over DS:2ab0 =
  (16, 30, 360, 360) and DS:2aa8 = (400, 30, 224, 312)).
* ovl61:0000(0, 1) (Begin): ovl61:1732, 17f6, ovl68:0952, ovl53:0000, ...; no live human ->
  ovl61:1160(STRING (14, 0), STRING (14, 1)); then ovl61:2123.
* Settings (ovl33): open ovl33:0000(n) (menu 07be:02d9 with 1, ovl25:0479 with 0), popup type 4,
  screen 9, DS:166a = 1; buttons (jump table 07be:0b0c) 251 close (ovl33:0034: from the menu
  ovl61:011f(0, 0), else DS:166a = 0, screen 0, ovl61:2123), 252+p -> ovl33:04cc (0x0d0[p] =
  !0x0d0[p]), 260+p -> 0508 (0x0f0[p]), 268+p -> 053f (0x147[p]), 276 / 277 / 278 ->
  ovl33:0576(0 / 1 / 2) (music DS:0bee / effects DS:0bec / speech DS:26c8, then OPTIONS.SND).
  ovl33:0067 disables 276 / 277 without a music / digital driver (DS:37a3 / 37a2) and removes the
  three side buttons of a dead side; for 268+p it tests `0xd0 | 0x2c04` (a constant, always
  non-zero) where 0x0d0[p] was meant, so Observe is live for human sides too (no check mark
  drawn for them, ovl33:039e). Draw ovl33:0137: positions DS:0ae4..0bfc, check box picture 8
  sources DS:0ad4 (index 0 = ticked), level names DS:0ac4[3 for a human, else 0x0c0[p]].
  DS:26c8 is the talking advisor's gate too (ovl58:0293), so the speech toggle changes the dice
  stream of later turn starts; it is DGROUP, not SCN.
* Tutorial pages (SCN 0x12e set; byte 0x134): 0b62:04f2..063f after a single-click select and
  ovl67:01ea..0337 after Next (also via Quit & Next ovl67:0393 and Defend ovl67:0409): bit 3
  clear -> page (25, 3); bit 4 clear and a city (ovl62:044a) on one of the 8 squares DS:2b4c /
  2b5c around the selected army whose owner byte != 0x110 -> (25, 4); bit 7 clear, terrain
  SCN 0x710[tile] == 11 under the selected army and its type 0x1c -> (25, 5); each sets its
  bit; in order, several in one call. In ovl67 a Next that found nothing reads the army words
  through the null DS:5e62. The move tail 0c8c:01fd: status 2 -> ovl67:08fb, 0b62:08b3, and on
  turn 1 (25, 9) with no flag (shown at every such move); any other status -> the bit 4 / 7
  tests. The pages go through ovl61:168d -> 10fb, which waits for mask 0xd4 without a flush
  before it (the flush ovl59:01f1 comes after), so the release of the click that selected
  closes the page.
* 07be:0064 (keys): DS:166c and a key event -> nothing; DS:1174 / 1176 / 1172 / 3700 -> nothing
  (007d..00a2); the menu keys 1372:0047 only for a key event (second argument 1) with DS:166a
  clear (00a5..00ba). DS:3700 = a menu is open (1372:0133 / 01da).
* View words: ovl65:0227 (overview click) stores the centre as given, top / left = centre - 4
  clamped to 0..0x93 / 0..0x67, bottom / right = top / left + 8; ovl64:0629 clamps the centre to
  4..0x6b / 4..0x97 first.
* ovl00:1063 (refused-proposal infamy) has a second caller, ovl25:0379 near the end of the
  computer turn ovl25:0000 (after DS:0836 = 0 at 0354); after the "no side alive" end state
  ovl61:1aed exits (0a4c:02b5 at 1c55), so no round-end step follows.

*(Addition, M8b UI: what a computer side's turn shows, asm re-read; `states/phases/computer.py`,
`ui/turn_bar.py`, `rules/present.py`, `states/runner.py`.  Rewritten for the paused-engine
design: the screen is drawn from the engine's state at the EXE's draw / wait points, see the
last item.)*

* Main loop ovl61:2123: per pass ovl59:01f1 (input flush, 2165); a computer side's ovl68:0000 runs
  between 12bf:07a5 / 0757 (21e8 / 21fd: no pointer during its turn), preceded by the music
  ovl58:0000(2) (21d4); after ovl61:17f6 and 155e:02ab, DS:166a set (Settings opened by
  ovl25:045e) ends the loop (220b..2212), also before a human side.
* ovl61:2074 End Turn: ovl00:1063 (2087), the buttons ovl61:0418 (2092: 0xad..0xb7, 0xba..0xbc,
  0xf0, 0xf1, 0x140..0x147 to state 2, disabled; 0xb8 / 0xb9 and the army slots 0xe0..0xef are
  not touched), ovl64:0e68, the selection words cleared, the strip 0aeb (20cb), the map 006c
  (20c5) and with Hidden Map and more than one live human 0a6e (2110); 17f6, 2123.  Nothing in a
  computer turn calls ovl61:0174, so the buttons stay disabled until the human turn start's
  0174 (ovl68:05ad) or ovl61:011f (the hero offer's answer).  Begin (ovl61:0000(0, 1), si = 1):
  the strip (0076), 0174 (0080), then for si != 0 the same 0418 (009f: the buttons disabled
  until the first human turn start's 05ad), the overview without Hidden Map (00a7..00b8), no
  map (005a).
* ovl68:0000: 0x159 = 0x147[p]; no live human (di) -> 1; > 1 live human, Hidden Map, 0x147[p] == 0
  -> 0; DS:3254 = exactly one live human and Hidden Map (005b..0074).  Hidden Map: ovl64:0d39 +
  1558, and for di or (0x159 and !3254) ovl63:2200(p) (00ea); di or (0x159 and !3254):
  ovl63:0000(1, 1, NULL) (0112, also without Hidden Map); no map draw.  sprintf(DS:3260 = "%s",
  side name), ovl61:11d1(buf, 0) (013e), ovl61:1291 (0146), ovl61:131b(5) (014d); ovl00:0db3
  (0153, its messages), ovl62:03f9; no city: ovl68:0952(0, 0), 1291, 131b(25 / 50 / 75 / 100),
  return (0168..0198).  At the end ovl62:0af3 (0218: the selection frame taken off).
* ovl61:11d1(msg, t): marble (0, 0x3c, DS:2aa0, DS:2aa6 - DS:2a9e + 0x14) = (0, 60, 360, 32) at
  DS:2a9c = (16, 403) opaque; SetFont(2, SCN 0x0a0[0x110], 0x0b0[0x110], 3); msg centred at DS:2aa4
  = (196, 415); t > 0: ovl59:0000(t).  Callers in a computer turn: ovl00:0f65 (t 0x14), ovl36:2238
  (0x14), ovl36:14db / 16c3 (5), ovl64:18d6 (0x19, only with a live human: 18c3 tests di = live
  humans, 1769..17a6), ovl61:1a41 (0x64, else ovl61:10fb).
* ovl61:1291: marble (8, 92, 352, 31) at (24, 435); colour 0 outline (116d:01fd) of (36, 442, 320,
  22).  ovl61:131b(n): picture 0x47 + SCN 0x110 (MOVEBAR0..7) source (0, 0, (n / 5) * 16, 18)
  masked (0997:027e) at (32, 444).  ovl25:0000 calls 131b(10) at 00c7 (after ovl25:0386, before
  Diplomacy) and 131b(15, 20, 25, 30, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95) after the
  phases move Hero .. vectoring (00f5..0333; none after Diplomacy, quick attack and update hide;
  20 after move Search also without Hidden Map), 131b(100) after 0a4c:0348 (034e).
* ovl25:045e: BIOS 0000:0417 & 8 (Alt) or & 3 (Shift) -> ovl33:0000(0) (0479): popup, screen 9,
  ovl33:0137(-1, 1) (titles in SCN 0x110's colours, the computer side's), DS:166a = 1,
  DS:0bf0 = 0, return (no modal wait); the side's turn and ovl61:17f6 run on, the loop stops at
  220b; close ovl33:0034 with DS:0bf0 = 0: DS:166a = 0, screen 0, ovl61:2123 (0060), no 0174.
  [I] An Alt+E End Turn whose first computer side reaches 045e while Alt is still held opens it
  too (045e reads the held keys, not the buffer); the scripts end such turns from the menu.
* Walk 0a8b:04c8 of any stack: per step ovl64:1298 (reveal), on a reveal ovl63:1fed(x, y, 1)
  (05ea), ovl64:0565 (05f2, not gated: 0629 writes the view words SCN 0x175..0x17f, clamped
  centre, then 006c), the step wait 05f7..0654 (t - t0 >= 3 ticks, or 10000 polls of
  151d:008a, or the midnight guard; not gated).  0a8b:0254 / 0476 around the AI's battle: with
  SCN 0x159, ovl64:0565 before 124a (029a / 03dd / 0489) and after it (02c4 / 0433 when DS:5e62
  is set, else 006c and 077b:005f, 02cb / 043a).  ovl67:08fb (mark done) ends with 006c (094b);
  0b62:08b3(1, 1, 1) (deselect, 0a8b:023d): DS:5e62 = 0, ovl62:0af3 (08cd), 006c (08d8).
  ovl24:10a1 (the AI's redraw, after a delete and after a raze at ovl19:1988): 006c when the
  side is shown or human and (x, y) is in the view.
* ovl64:006c: returns for 0x0d0[0x110] == 1 and 0x159 == 0 (0083..0098).  With DS:3254: x, y =
  DS:5e62's square (00aa..00c6) and then the view centre SCN 0x17d / 0x17f (0106..0128); each is
  "hidden" when DS:2d56[ovl64:1055(x, y, 1)] == 0x0e, 1055 setting bit k for neighbour k
  (offsets DS:2efa / 2f0a) off the map (edge argument) or without road bit 7 (bit 5 without
  DS:3254).  A hidden stack square: return with DS:2eac = 0 unless DS:2eac is set and the square
  is within 1 (both axes) of DS:2eae / 2eb0 (00c8..00fc); a hidden centre: the same test, and when
  it passes DS:2eac = 0 and draw (015f); a centre not hidden: DS:2eac = 1 (0169), draw.  Without
  DS:3254: DS:2eac = 1, draw.  Draw: DS:2eae / 2eb0 = the centre (016f..0184), ovl65:0227(centre)
  (the words again, the overview box), ovl64:0053 (the view, from road bit 7 with DS:3254:
  0f76 / 105c / 143f), the copy to the screen, then for DS:5e62 whose cache cell
  (DS:5ed4[(x - 0x177) * 9 + y - 0x175]) is not 0x0e: ovl62:0afd (single) / 0b27 (DS:2bda) ->
  077b:0020(x, y, 1 / 2, DS:2b6c[0x110]) and 077b:005f, which draws the frame twice (0161(4) and
  0161(0): phases DS:124e and DS:124e + 1).  ovl64:0238(x, y) (frame erase, via 077b:003d): in
  the view, 0x159, with DS:3254 the centre not hidden (1055(.., 0)), the view built and one
  square copied.
* ovl63:0000(markers, force, rect): Hidden Map, 0x0d0[0x110] != 0, 0x159 == 0, DS:2d28 == 0 ->
  return; Hidden Map, computer, 0x159, DS:3254 and a rect -> the box only (0698); markers with
  DS:2d25 set and force 0 -> nothing; else the bitmap through the fog mask DS:54e3 and either
  the markers (0ed7, DS:2d25 = 1) or none (DS:2d25 = 0); a rect of at most 8 x 8 squares is
  widened to the 4-square grid and 4 squares around (1f4a..1f58).  Callers in a computer turn:
  ovl68:0112, ovl36:1679, ovl26:0360 (sage, (0x159 and !3254) or human), ovl47:020a ((1, 0,
  NULL): nothing while the markers are on), ovl63:1fed (rect, Hidden Map, (human or 0x159) and
  !3254: the reveal box, 5 x 5 on a city square, map high byte bit 5 or a flying stack).
* AI battle ovl36:124a(x, y, 1) display: gates as ai.md §7a.7 (re-read 1281..167e); 1836's war
  sample only for a human side (1a1a..1a28); ovl65:0227(x, y) at 1474 for show (the view words,
  a state write, and the box); the result line r == 0 (0x98, side name), hero DS:5e5e (0x8e,
  hero name 2c04:0223 + 0x14 * record +0xa), else (0x96, side name); show2 / view: 16b3,
  ovl37:04c5, ovl59:0000(10), ovl37:04f6; show only 16b3 (1621).  ovl37:0094 plays ovl58:0181
  for any attacker (00d7..010c, unless Space); it takes one key per kill off the BIOS buffer
  (00ae..00ce) and flushes it after the last (0157).  ovl19:1914 / 19da / 1a5f ("%s is being
  razed! / sacked! / pillaged!", DS:0788 / 079b / 07af with the city's name) go through ovl36:16b3,
  which prints with 11d1(.., 5) only when DS:0cf8 (set by the last 124a: show or view).
* How this is drawn here: the engine calls `rules.present.present(point, **info)` at these
  places (rules/turn.py, rules/movement.py, rules/selection.py, rules/combat.py,
  rules/diplomacy.py, rules/victory.py, rules/heroes.py, ai/base.py, ai/phases/assault.py,
  ai/phases/clean_city.py); without a presenter it is a no-op.  The game runs End Turn and
  Begin's loop on an engine thread (`states.runner.Runner`, two semaphores: exactly one of the
  threads runs), one computer side per run (`EndTurn(max_sides=1)`, then `rules.turn.run(state,
  max_sides=1)`; the same pass sequence as one run); at each point the computer phase draws from
  the real state (read only) into the pictures it keeps (map, overview, box, info area, battle
  window) and holds the EXE's wait in frames.  The display words (DS:2eac / 2eae / 2eb0, 0cf8,
  2d25, the selection frame DS:124c..1254 / 124e, the BIOS key buffer) live in the phase; the
  state writes of these routines (view words of 0565 / 0629 per computer step and around the
  AI's battle with 0x159, ovl65:0227 at 124a:1474, DS:3254 in `AiProcess.single_view`) are the
  engine's; the display words are kept per app (`App.display_words`), so they carry from one
  End Turn to the next as in the EXE.  An error of any later run point is logged and the state
  restored to before End Turn / Begin (`Game.run_failed`).  Open: the shield strip ovl68:0952
  (the menu bar's turn strip, also in human turns, plan M9b) is not drawn; the music
  ovl58:0000(2) at 21d4 is M10c; the human phase keeps its own selection-frame phase (DS:124e
  is one word in the EXE).

### 6.3 Income, upkeep, production  [V]

**Income** ovl62:0372 (L 0x82862): `income[p] = sum(city[+0x2a] for cities owned by p)
+ cities[p] * items(p)`, where `items(p)` (ovl35:07cf, L 0x672cf) sums the value of all
item type 7 ("+%d gold per city") carried by p's heroes.

City income comes from the scenario city file; for random maps ovl11:1171 sets
`income = 2*q + rnd(1,8,0) + 14` with q a size parameter of the generator. [V]

**Upkeep** ovl62:02bf (L 0x827af): `upkeep[p] = sum(army[+0xb])` over p's armies on the map
(x, y ≥ 0); an army in a boat (flag 0x1000) whose upkeep is below 5 counts 4 instead.

**Per turn** ovl68:0827 (L 0x8d037): `gold += income - upkeep; if gold < 0: gold = 0`.
No army is disbanded for lack of money in this routine. [V]

**Unit upkeep** is set when the unit is produced, ovl43:0dd7 (L 0x703d7):
`upkeep = slot_cost / 2` (integer division of the ARMYTYPE w2 "cost" copied into the slot).

**Buying a production slot** ovl44:0ee3 / ovl44:1299 (L 0x71483 / 0x71839): the slot gets
type, time, cost, strength and moves from the ARMYTYPE record, `gold -= w4` (the buy price),
and the city defence value is recomputed (6.1, +0x14). Only types with `w4 >= 0` are offered
(record +0x1e tested `> -1` when building the list). If the current production type is no
longer in any slot, production and vectoring are cancelled.

**Choosing a production** ovl44:00ff: `city.current = type; city.turns_left = slot_time`.

**Delivery** ovl43:0000 (L 0x6f600), at the owner's turn start, for every own city with
`turns_left > 0`: `turns_left -= 1`; when it reaches 0 (clamped at 0) **and the owner's gold is
> 0** and (there is room — ovl43:0bff finds one of the four city squares holding < 8 armies,
falling back to 20 random tries within ±1 square of the city corner that are not water
(map flag 0x10) — or the city is vectoring), a unit is created by ovl43:0dd7. Afterwards
ovl43:06bd restarts `turns_left = slot_time` for every city that delivered. A city whose timer
ran out while gold was 0 stays at 0 and produces nothing further until a production is chosen
again ([V] for the code path; "production stalls" is the consequence).

Unit creation ovl43:0dd7: type = current production; owner = city owner; moves and allowance
= slot moves; strength = slot strength, or `min(slot_strength + 2, 9)` when the owner has the
"Enhanced" flag 2c04:00f0[p] set (same +2 cap 9 also in the AI's evaluation, ovl29:10ac);
home city; upkeep = cost/2.
*(Correction §9.5: the flag tested is 2c04:00f0[2c04:0110], the **current player's**
(ovl43:0e83, ovl29:10a0), not the city owner's. During a turn they are the same side. At
new game the garrison units of ovl39:00cc are made while 0110 is the first side in turn
order, so every garrison gets +2 when that side is Enhanced.)*

*(Addition, X36: production of type byte 0xff.)* [V] ovl44:00ff with DS:0e9e = -1 (the city
screen of a city not producing, an empty slot clicked) writes +0x2c = 0xff and +0x2d = the time
byte of slot ovl44:0000(city, -1) = the first empty slot. Nothing treats 0xff as "nothing"
afterwards: the city loop ovl43:04c8..0690 tests owner, +0x2d > 0, gold > 0 and room /
vectoring only, and ovl43:0dd7 reads no type record: slot = ovl44:0000(city, cwde(+0x2c))
(0ded..0e02; no empty slot left -> slot 0), +4 = the 0xff byte (0e2e), +6 / +7 = slot moves
(0e59 / 0e72), +8 = slot strength (+2 cap 9 Enhanced), +0xb = slot cost / 2 (0f08..0f16).
ovl43:0d4f (the only type-table read of ovl43) runs for transit arrivals only (0156, 0342).
ovl43:06bd restarts +0x2d with the same slot's time (human sides). So a unit is made exactly
when the empty slot's time byte is > 0: the scenario file's bytes (0 in most shipped slots,
non-zero leftovers in ERYTHEA / HADESHA / ISLADIA / RANDOM, e.g. time 5 strength 6 moves 50
cost 6), or the old statistics of a slot pillaged / sacked (ovl31:0886 / 0941 clear only the
type byte). Readers of +4 = 0xff:
* DS:45c4 + 6 t (flies, w17, w18, w19, w13, w15): every reader sign-extends (mov al,[+4]; cwde;
  imul 6: ovl20, 21, 22, 24, 28, 36, 38, ovl43:0d8a, ovl66, 0a8b:071a / 0763, 0b62:1001 / 11b7,
  0c8c:05a5 / 085a ...), so it reads DS:45be..45c3, below the table: words 18..20 of the array
  DS:459a (one of five 21-word arrays 44f2 / 451c / 4546 / 4570 / 459a with count DS:1258),
  written only by res_077b:0079 / 00c1, which have no caller (no resolved call to either in
  out/asm/, no near call inside res_077b). They stay the image's zeros: all six flags 0.
* SCN 0x60b + 29 row + cwde(t) (fight order; ovl38:04c6 / 051a, 0b62:0140 / 0174 / 0b56 /
  0b7c / 0c8e / 0cb4, ovl64:2b1e, ovl67:0834 / 0851 and ovl66:183f / 1856 through the
  0b62:0024 row pointer, likewise ovl29:0b93 / 0bae, the leader of 0ae7): the byte before the row, i.e. row - 1's
  type-28 entry, for row 0 SCN 0x60a = hero slot 39's level/exp byte (2c04:05e3 + 39).
  0b62:0a03 reads it in the first test (0b56 / 0b7c) and in the swap loop's test (0c8e / 0cb4).
  0b62:007d (0140 / 0174) compares the best army so far by its byte in the *new* army's row
  against the value it kept from its own row: equal on a square of one owner, so 007d returns
  the first army found from the top index. ovl64:2985: the cell's side of the compare
  (2b42..2b72) uses the cell's 5-bit type field (+0x17 bits 2-6) in the cell's owner row;
  after a 0xff army won the cell it holds 31 (2b83..2ba6, `+4 & 0x1f`), so the next army is
  compared with row + 1's byte 2, or for row 8 with SCN 0x712 (the terrain table SCN 0x710
  follows the fight order); 29 / 30 likewise. The other readers of SCN 0x60b (ovl38 fight-order
  dialog 0e19..149b, ovl64:2608, ovl66:1e73) index by a loop counter 0..28.
* ovl44:14ac(cwde(t), buf): no record id equals 0xffff, nothing is copied, `buf` keeps its
  contents (14b7..14e9: 29 records of 0x3e bytes, id word first, copied by 0000:1d02 on a
  match). In ovl38:008b the one buffer [bp-0x70..-0x33] serves the four loops in this order:
  side A bonuses 073b, side B bonuses 0876, side A strengths 0a9d, side B strengths 0bdc; each
  fetches once per unit as the first statement of its body, before the hero test (type byte
  DS:424c / 4254 == 0x1c, not the record) and before the aboard test (0abe / 0bfd), so an
  aboard unit still replaces the record. A 0xff unit therefore uses the record fetched last in
  that call: its own side's previous unit, at the start of side B side A's last unit, at the
  start of the strength loops side B's last unit (side A's when B is empty). Words read from
  the buffer: w5..w8 (strength loops, bytes [bp-0x50..-0x4a]), w9..w12, w14, w15 (bonus loops,
  [bp-0x48..-0x42], [bp-0x3e], [bp-0x3c]). Before the first fetch of a call it is the caller's
  stack contents (not determined); the engine uses zeros (`rules.bonuses.RecordBuffer`, X36).
* ovl64:2b83 (map sprite) `+4 & 0x1f` = 31; 0b62:0966 / 0980 sort with a signed byte compare.
* UI readers: ovl44:14f4(cwde(t)) leaves DS:4468 unchanged for -1 (no id 0xffff; nothing else
  writes DS:4468, image zeros), so a type-0xff name is the last name any 14f4 caller looked up.
  ovl64:08be(t < 0) skips the icon (0b39..0b3f); all army-icon callers sign-extend +4
  (ovl66:0450 / 102f, ovl46:0c58, ovl40:02bd, ovl37:0401, ovl43:094b, ovl45). ovl46:0626
  returns for -1 at 0634..0639 before the pointer hide, the screen save and the drawing; its
  callers set DS:1174 anyway; ovl46:11cf then blits the save bitmap DS:4494 that the last panel
  freed (1012:0975 zeroes +0x34 only) and shows the pointer unpaired: the contents are not
  determinable. ovl66:1b9c shares [bp-0x50] between 1c1a (selected, not aboard, non-hero) and
  1d5d (selected non-hero, before the aboard test); ovl66:1a07 has its own [bp-0x40]. Path ghost
  ovl64:239d: (-1 % 16) * 32 = -32, (-1 / 16) * 29 = 0; 0f00:0c4d addresses
  y * stride + (x >> shift), so ghost rows 1..28 are ashadow row j-1 at x 480..511 (type 15's
  ghost one line lower) and row 0 the bytes before each plane buffer (not determinable).

*(Addition, M9b: the production report list, asm ovl43 re-read.)* [V] ovl43:0000 keeps a list of
what this start-of-turn production did in the far block DS:4464 (ovl43:076d allocates 0x321
bytes once per program run, handle DS:0e4c, count byte +0x320 zeroed only at the allocation):
100 slots of +0x000 kind, +0x064 type, +0x0c8 city, +0x12c dest (signed bytes), +0x190 a far
pointer to the army record (written, never read).  Each run sets count = 0 (0016), then appends
in this order: (a) the army loop from the top record down, every vectored army that arrives
(city 01ee, standard 03aa): kind 0, type +4, city = its home +9, dest = (+0xf >> 1) & 0x7f read
before 047f clears it (the destination city, or 100 + side); (b) cities 0..count-1, every unit
made (068b): kind 1 when the city vectors (word +0x31, 05dd; dest = ovl62:044a of the target, or
SCN 0x110 + 100 without a city there), else kind 2 (dest -1, 0609); type = the new record's +4
(0653), city = the producing city.  No bound check at 100 slots: every field write re-reads
the signed count byte, so the 101st entry writes its kind over type[0] and its far pointer's
offset word over the count byte (the count becomes the low byte of the record offset; the other
pointer bytes and every later pointer land past the block, on other heap memory) and its type /
city / dest at that new count; ovl43:06bd then restarts the cities the aliased bytes name
(plan X40: the block is modelled byte for byte, writes outside it are dropped, a restart of a
city byte outside the city table is Unverified).  Stalled cities (gold <= 0,
no room without vectoring) and the neutral production add nothing.  ovl43:0000 runs on every
side's turn start (human ovl68:0597 only for stage <= 2, computer ovl68:01b3), so the block
holds the last run's list, whichever side made it; ovl43:06bd (human) restarts the timers of
the kind 1 / 2 entries.  ovl43:07e5 returns the count (Report > Production, ovl42:02fb case 3);
only ovl43 touches DS:4464 / 0e4c, so no save or load writes or reads the list: after a load
in the same program run the report shows the previous list until the next ovl43:0000, after a
load in a fresh run it is empty (07e5 allocates, count 0).  ovl43:06bd is called when
ovl43:0000 returned a nonzero signed count (ovl68:059c) and ends with ovl62:0000 (0760) also
for a negative one.  Engine: `GameState.production_report` (`model.state.ProductionReport`, the
0x321 bytes; not saved, not hashed; a load starts empty), `rules.reports.production_list`,
`rules.city.restart_production` (reads the block).

### 6.4 Vectoring  [V]

Setting (ovl44:028b, L 0x7082b): only while the city has a production running
(`turns_left >= 1`). Choosing the city itself switches vectoring off. ovl44:0410 counts the
cities already vectoring to the chosen destination; with more than 3 (i.e. a fifth source)
the order is refused, so **at most 4 cities can vector to one destination**. A destination
index ≥ 100 is stored as (-2,-2); ovl44:021d sets that form directly. Its arrival uses
ovl47:0b47 (a location supplied by the hero code) and requires the target square to hold ≤ 7
armies; otherwise the unit is sent back towards its home city. [V] for the code; that the -2
form means "vector to a hero/standard bearer" is [I].

Transit (ovl43:0000): a vectored unit is created off-map (x = -1 or -2, y = -1) with state 0x65.
At the owner's next turn start it becomes 0x66; at the one after it is placed in the
destination city (ovl43:0bff room search, ovl43:0d4f check that the destination is still owned
or the terrain is passable for that type). If it cannot be placed and the destination is not
its home city it is rerouted home (state 0x65 again); if it cannot be placed at home it is
deleted (0b62:03be). So a vectored unit arrives **two turns after** it would have appeared in
its home city. [V]

### 6.5 City capture, pillage, sack, raze, loot  [V]

After a human takes a city, ovl31:0000 shows the choice dialog (occupy / pillage / sack / raze;
pillage and sack buttons disabled when they would yield 0). The computer chooses in ovl19:1864.

* **Occupy**: no gold and no infamy change in the capture code.
* **Pillage** ovl31:046b (L 0x6420b) / ovl19:1a2a: gold = |buy price| / 2 of the army type in
  the **last** filled production slot; that slot is emptied; defence recomputed;
  `gold[attacker] += value`; `infamy += rnd(1,5,0)`.
* **Sack** ovl31:035e (L 0x640fe) / ovl19:199c: gold = sum over all slots **except the first** of
  |buy price| / 2; those slots are emptied; `infamy += rnd(1,10,0)+5`.
* **Raze** ovl31:029f (L 0x6403f) via ovl32:016b: owner and +0x2f set to 0x0f, the four map squares
  replaced by ruin graphics, every city vectoring to it has vectoring cancelled;
  `infamy += rnd(1,15,0)+10`. Razing a city from the city screen later (ovl32:0061, "raze %s?")
  costs `rnd(1,25,0)+25`.
* Computer choice ovl19:1864 (L 0x57b04): unless forced, if 3 or more nearby cities (of a list of
  six from ovl25:0656, within distance < 0x2d) belong to the computer it keeps the city
  (returns -1 = occupy). If the sack value is ≥ 400 it sacks (falling back to pillage when
  the sack value is 0); otherwise it razes. [V] for the branches; the meaning of the neighbour
  list is [I].
* **Loot** on winning a battle on a city square, ovl36:0a6b (ovl36:0dd0..0e62, L 0x68840):
  `d` = owner nibble of the square. If `d` is 0x0f no loot. Otherwise
  `loot = gold[d]` if `d` owns fewer than 2 cities, else `gold[d] / cities[d]`; then
  `loot = max(loot/2, 0)`; `gold[attacker] += loot; gold[d] -= loot`. The square's fortify bit
  0x2000 is cleared. [V]

*(Addition, M5b: the capture question ovl31:0000.)* [V] Called as ovl31:0000(DS:4148, DS:4134,
DS:41fb, city) from ovl36:04f7 when the quest check at ovl36:04e2 returned 0. Lines (0x42, rnd)
with DS:4148 and (0x43, rnd) with DS:4134 (0x42 drawn first); popup 7 (160, 90, 320, 200,
victory.pck); SetFont(1) (0x41, 0) at DS:0a40 = (320, 93); SetFont(2) the two lines at
(320, 140) / (320, 160), (0x41, 1) / (0x41, 2) at (320, 180) / (320, 200); screen 11: 285
Occupy (07be:08a6 -> 03fe), 283 Pillage (08b6 -> 046b), 286 Sack (08ae -> 035e), 284 Raze
(08be -> 029f). 07be:0001(old, new) replaces the first `old` in the Return list DS:155c: 284,
283, 286 -> 285; with Quests on and an active quest whose hero (+0x1107) is DS:5e5e: type 5 on
this city -> 285 -> 284; type 6 -> 285 -> 286 when 07d0 != 0, else 285 -> 283 when 0834 != 0;
Esc (DS:1514) holds 285. States: 283 normal iff 0834 != 0, 286 iff 07d0 != 0, else disabled.
Tutorial: SCN 0x12e and DS:0a54 == 0 -> DS:0a54 = 1, page FILE.DAT (25, 10) (ovl59:0505,
ovl61:168d), once per program run. Occupy: ovl17:069c, ovl61:011f(0, 0, 1), 1ded(4, ...); 0 ->
ovl31:043a = ovl45:0000(2, x, y) (production screen). Pillage / Sack for a human: the result
popup ovl31:0508(0 / 1): popup 12 (176, 60, 288, 300); SetFont(1) (0x44, kind) at (320, 64);
SetFont(2) (0x45, kind) with the city at (320, 115), (0x46, 0) with DS:4114 (gold) at (320,
135), (0x47, DS:4118 != 1) with DS:4118 (emptied slots) at (320, 165), (0x48, DS:4116 != 1)
with DS:4116 (pillage: filled - 1; sack: 1) at (320, 185); 14d0:02e5((184, 220, 272, 130), 4,
2) and ((185, 221, 270, 128), 2, 4) (top / left in the first colour, right / bottom in the
second, drawn in the order that gives the corners the later one); (0x44, 2) / (0x44, 3) left at
(192, 230) / (368, 230); per emptied slot i: ovl64:08be(type DS:411a[i], SCN 0x110, 208,
250 + 30 i, ring 1), the type name (ovl44:14ac) at (248, 256 + 30 i), DS:0a66 with DS:410e[i]
(|w4| / 2) at (368, 256 + 30 i); empty icons (type -1, ring 1) up to row 2; ovl61:10fb(0); two
ovl17:069c. Raze: the message DS:0a56 with the city name through ovl61:10fb (popup 5),
ovl64:006c, ovl32:016b, ovl17:069c, ovl61:011f(1, 1, 0).

### 6.6 Diplomacy  [V] unless noted

Relation byte 2c04:153b[a*8+b]: bits 0-1 current state, bits 2-3 the state a proposes to b.
*(Correction §9.6: 1 is **not** the initial value. At new game ovl00:11bd sets current and
proposal to 0 for all 64 bytes when Diplomacy is on, and to 2 when it is off; bits 4-5
are cleared and bits 6-7 kept. 1 is written only on elimination, ovl61:18ab.)*
Values: **0 = peace, 1 = neutral (initial and post-elimination value), 2 = war**. The names are
[I] from the messages each transition prints (STRING 111: "Peace negotiated…" when the new
state is 0, "War declared…" when it is 2) and from the treachery costs below.

Resolution at the start of side a's turn, ovl00:0db3 (L 0x49283), for every b ≠ a whose
current state differs from a's proposal:
* proposal **more hostile** than current: applied at once to both directions (a→b and b→a
  current := a's proposal); b's own proposal is raised to that value if it was lower. On
  reaching war: history event 9 and a "War declared" message.
* proposal **less hostile**: applied (both directions) only if b's proposal towards a is
  already at least as peaceful as a's; otherwise nothing happens. On reaching peace: history
  event 10 and "Peace negotiated".

Penalty for a refused de-escalation, ovl00:1063 (L 0x49533): when a proposes something more
peaceful than the current state and b proposes something more hostile than a's proposal:
peace proposed while neutral → `infamy[a] += rnd(1,2,0)+1`; peace while at war →
`rnd(1,10,0)+10`; neutral while at war → `rnd(1,2,0)+1`. [V] for the arithmetic; why proposing
peace raises the counter is not explained by the code.

Attacking without war, ovl36:0000 (L 0x67a70): with the Diplomacy option on and the target
square owned by a side, if the relation is peace, or neutral and the target is a city
(city index > 0 in the test), the human gets the STRING 140 prompt; going ahead calls
ovl36:20a8 (L 0x69b18): `infamy += rnd(1,100,0)+100` from peace, `rnd(1,15,0)+10` from
neutral; both directions set to current = war and proposal = war; history event 8;
"Treachery upon %s!" shown.

Diplomatic rating: the screen ovl00:0039 sorts sides by `infamy` (insertion sort at
ovl00:0b29..0b9b, ascending) and assigns the STRING 106 titles (Statesman … Running Dog, 8
entries) by rank through a jump table at ovl00:0bb4 indexed by the number of sides. [V] for the
sort and the table use; the exact rank→title mapping per side count is in that table and was
not transcribed. [U]

Start values, ovl53:0271: `infamy[p] = rnd(1,8,0)`; if 2c04:0116 is non-zero and p is human,
+400. 2c04:0116 is not one of the ten game options (6.9); its writer was not traced. [U]

*(Addition / corrections, M9a: asm re-read for rules/diplomacy.py.)*
* *Proposals are written by ovl00:0a69 (the Diplomatic Action buttons): proposal bits of
  [0x110][b] only; nothing else is tested there (the dialog opens only with Diplomacy on,
  ovl00:0346).*
* *ovl00:0cc7, at every main-loop pass (ovl61:219c), marks the diagonal byte [p][p]: bit 4 when
  some b's proposal **to p** ([b][p]) differs from its current state, bit 5 when every such
  proposal is more **peaceful** than the current state (the action-palette button colour, MAN
  p.56).*
* *"History event 9 / 10 / 8" above are entries of the per-side news record ovl41:1244 (kind,
  a, b, name; the name pointer is NULL for these kinds), which the round-end history record
  copies (§6.7 addition).  The "War declared / Peace negotiated / Treachery upon" messages are
  shown only when SCN 0x159 is set and ovl25:09ab is true, i.e. on a viewed computer turn
  (ovl25:09ab = d0[0x110] == 1 or DS:0836, which is 1 only while ovl25:0000 runs); a human's
  own turn-start resolution shows nothing.*
* *Treachery ovl36:20a8 is the "yes" handler of the STRING 140 dialog (far stub 3024:006b; "no"
  is 3024:0070 -> ovl36:2262, a redraw).  Order: the roll (none when already at war), war in
  both directions, then for a human side (not ovl25:09ab) the attack itself is made again
  (ovl36:0000(x, y), now without the question), then the news entry (p, 8, p, o).*
* *Rating, R10b closed: ovl00:0aed sorts the live sides ascending by the signed infamy word
  (strict <, stable) and takes the title of rank i from the jump table ovl00:0cb7 indexed by
  n - 1: n = 1 (0), 2 (0, 7), 3 (0, 3, 7), 4 (0, 1, 5, 7), 5 (0, 1, 3, 5, 7), 6 (0, 1, 3, 5, 6, 7),
  7 (0, 1, 3, 4, 5, 6, 7), 8 (0..7) into STRING 106.  [V]*
* *2c04:0116's other readers (X29), ovl18:06ad and ovl27:13b7, are in the computer players'
  own diplomacy (ovl18:0000, ovl27:0e04), not in these rules.*

### 6.7 Elimination, victory, surrender  [V]

Elimination, ovl61:18ab (L 0x81b1b): every living side with **0 cities** is eliminated, whatever
armies it still has: its heroes go through the hero-death routine ovl36:16cd, all its armies are
deleted, history event 4, a STRING 11 message (random entry), `alive = 0`, `gold = 0`, and all
its relations in both directions become neutral (current 1, proposal 1).

ovl61:1aed (L 0x81d5d), with `n_cities` = number of city records whose top-left square is
terrain type 10 (intact cities):
* no side alive → STRING 12 sequence, program exits (1a4c:02b5);
* there were humans and none is left → STRING 13 ("no further human resistance"), dead humans
  are switched to computer (d0 = 1) and the war goes on;
* exactly one human left, no computer alive, and that human owns **more than n_cities/2**
  cities → victory flag 2c04:015b, history event 7;
* no human left and exactly one computer alive → that computer is declared winner
  (STRING 15), switched to human control, flag 015b, history event 7;
* exactly one human, ≥ 1 computer alive, no surrender offered yet: if the human owns more
  than half of all city records **and** more than (largest computer city count +
  total cities / 8) → surrender-offer flag 2c04:015d.
ovl68:04bd then shows the victory screen (ovl61:1fbd, sets 0157) or the surrender offer
(ovl61:1f68, STRING 17, buttons 0x1e5/0x1e6, sets 015f). What accepting the surrender does was
not traced (the button handlers live outside these functions). [U]
*(Correction M9a: traced, see below.)*

*(Addition / corrections, M9a: asm re-read for rules/victory.py, rules/history.py.)*
* *Elimination: the army scan runs from record 0x181-1 down to 0; a hero goes through ovl36:16cd
  with 0x110 temporarily = p.  The message is ovl59:04f0(11, -1): index -1 makes ovl59:052f roll
  **rnd(1, n, -1)** with n = 5, the entry count of STRING.DAT group 11, so each elimination
  draws one die.  News entry (p, 4, p, 0, "").  Relations: proposal 1, current 1 in both
  directions, bits 4-7 kept.*
* *ovl61:1aed precisely: "there were humans and none is left" = no live human and a **dead**
  human found in this call (that side is switched to d0 = 1 in the same loop, so the message
  comes once); the side scan runs 7..0.  The single-human win counts **intact** cities (terrain
  10) for n, the surrender test all city records (word 2c04:157b).  The lone-computer winner is
  the first live side; news (w, 7, w, 0, ""), d0[w] = 0.*
* *Button ids are dispatched by res_07be:04d9 (id - 100 into the table 07be:0b0c): 0x1e3 ->
  ovl61:2004, 0x1e4 -> ovl61:2046, 0x1e5 -> ovl61:1e4e, 0x1e6 -> ovl61:1ecd, 0x1e7 / 0x1e8 ->
  ovl49:1608(0 / 1), 0x1e9 -> ovl49:1832.*
* *Accepting the surrender (0x1e5, ovl61:1e4e): every live side with d0 == 1 gets alive = 0
  (cities, armies, gold untouched), 0x15b = 1, news (0x110, 7, 0x110, 0, ""), then the victory
  screen ovl61:1fbd (music 3, sets 0x157, button 0x1e3).  Its button ovl61:2004: Hidden Map off
  (0x124 = 0), redraw, ovl68:04bd(0).  [V]*
* *Declining (0x1e6, ovl61:1ecd): music 0xa, a screen with button 0x1e4; when a live human
  exists, 0x10f3[c] = 0x110 for every live c (the only writer besides ovl30:0000's -1).  Button
  0x1e4 -> ovl61:2046: redraw, ovl68:04bd(0).  [V]*
* *Resign (Order > Resign, ovl49:150d): nothing without cities; the dialog's two resign
  buttons both call ovl49:1608, which razes every own city with ovl32:016b (no infamy),
  deletes every own army (heroes through ovl36:16cd), with Hidden Map sets the road-layer seen
  bit 0x20 on the whole map, clears the selection and refreshes the map words.  The side stays
  alive until the round-end elimination.  [V]*
* *History (§6.10 "city history"): ovl41:0d60 at every round end, from turn 2 (the file
  FILE.DAT (6, 0) is created) while turn < 0xca (200 records, R12): per record gold[8],
  winning score[8] (ovl42:0947: (gold + 5 income + upkeep + sum over own cities of defence *
  income) / 30 clamped to 1..500, then / 5), cities[8], an owner byte per city record (0xff
  when its square is not terrain 10), and up to 10 news entries (ovl41:132f: every side's first
  entry, then second entries while fewer than 10); then all news records are emptied
  (ovl41:1225; not when nothing was written).  The battle code adds news (a, 5, -1 / a, city,
  hero name / "") for a won battle in a city with >= 8 armies and >= 4 defenders, and (side, 1,
  city or -1, 0, name) for every hero killed (ovl36:0a78..0c5f), and counts losses in the 8 x 8
  table of 5 words at 2c04:1163 (row = the side that inflicted the loss, column = the loser,
  diagonal = all of a side's losses; words: unit, w13 unit, hero, aboard, standard; ovl36:1aff).
  [V]*

*(Addition, M9b: the victory button, the end-state waits, the shield-strip calls, signposts.)*
* *The victory screen ovl61:1fbd only sets 0x157 (1ff6) and returns with the screen up; Hidden
  Map goes off when its button 0x1e3 is pressed (07be:0abf -> ovl61:2004: 0x124 = 0 at 2026,
  then ovl61:011f(1, 1, 1), ovl68:04bd(0) at 203e).  Engine: `Victory` is a pending question,
  answered by the command `CloseVictory`.  [V]*
* *End-state waits in ovl61:1aed: no side alive -> ovl61:1160(S(12, 0), S(12, 1)) at 1c28,
  1160(S(12, 2), S(12, 3)) at 1c4f, each a two-line popup 5 waiting for a key, then 0a4c:02b5
  (1c55) ends the program; no human left -> 1160 (13, 0 / 1) at 1c8d and (13, 2 / 3) at 1cb4;
  the lone computer -> S(15, 0) with its name through ovl61:10fb at 1d71, before d0 = 0
  (1d80).  Engine: present points "no_players", "quit", "no_humans", "winner".  [V]*
* *The shield strip ovl68:0952(full, quiet) is called at ovl61:0034 (1, 1, Begin: after 1732 /
  17f6, before ovl53:0000), ovl61:183f (1, 0, after ovl41:0d60 in the round end), ovl68:0374
  (0, 0, human turn start, after ovl62:0af3 at 036a, before ovl64:0629 at 039c), ovl25:0064
  (0, 0, computer turn), ovl68:016d (0, 0, a computer side without cities) and ovl49:03b0 (1, 0)
  / 03bb (0, 0) (load).  Engine: present point "strip" with `at` = the call address at 183f,
  0374 and ovl25:0064 (016d is inside "no_cities"); Begin runs in `rules.setup.new_game`, which
  has no presenter, and load is M10b.  [V]*
* *Signpost ovl13:01a4: DS:5e62 set, terrain SCN 0x710[tile of its square] == 9, the first
  CURRENT.SGN record with its x, y (DS:3f9a = index); else nothing.  The line editors (buttons
  422 / 423, ovl56:03a6(rect, record +4 / +0x36, 0x1e, 0xd8)) start from an empty field
  (03d2..03eb: strcpy of DS:2374 = "", si = 0 at 043b), not from the record: Return (0575)
  copies the typed text over the line, also an empty one; Esc (045b) copies the record into the
  buffer first, so the line stays as it was.  A key is typed only when 0x20 <= key <= 0x7a
  (047f..048e), fewer than 0x1e - 1 = 29 characters are typed (04c1..04c7) and the width of the
  text typed so far is < 0xd8 = 216 px (04b6..04cf, 11e2:0a8e in font slot 2).  So a line is
  the old one or at most 29 typed characters in 0x20..0x7a.  OK 421 (ovl13:0486) writes the
  whole buffer back to CURRENT.SGN.  Engine: `rules.signs.sign_at`, command `EditSign`
  (`World.signs`, saved with the game) with the character rules; the width rule is the UI
  editor's.  [V]*

### 6.8 Computer players  

Levels [V]: three, selected per side by 2c04:00c0 = 0/1/2 and mapped to the card letter
K/L/W (DS:2616 "KLW", format DS:261a `CARDS\%c%03d.%s`). The card number comes from
2c04:00e0[p]. The level names Knight/Lord/Warlord appear in the card descriptions (CARDS/*.DSC),
not in the EXE logic.

Card file (`.CRD`, 103 bytes) read by ovl48:006a into a buffer and unpacked by ovl21:0d7b
(L 0x5a80b) into the side's AI parameter block (far pointer DS 0x40ee, `451b_018e`):

| CRD offset | use | tag |
|---|---|---|
| +0x08 | AI word +0x24a | [V] |
| +0x0a | non-zero → AI flags +0x0c bit 0 | [V] |
| +0x0e..+0x2a (29 bytes) | copied to 2c04:060b + p*29: the side's per-army-type **fight order** used to sort a stack before battle (ovl38:008b) | [V] |
| +0x2b, +0x2d, +0x2f, +0x31 | AI words +0x48, +0x10, +0x12, +0x0a | [V] |
| +0x45..+0x53 (8 words) | AI words +0x26, +0x28, +0x2a, +0x2c, +0x2e, +0x34, +0x32, +0x30 | [V] |
| +0x55, +0x57, +0x59, +0x5b | each is a die size: AI words +0x18, +0x1c, +0x1a, +0x1e = rnd(1, value, 0) | [V] |
| +0x5f, +0x61 | AI words +0x36, +0x42 | [V] |
| +0x63 | AI word +0x44 = value*10 + rnd(1,10,0) | [V] |
| +0x65 | AI word +0x38 | [V] |
| +0x00..+0x07, +0x0c, +0x33..+0x44 | not read by ovl21:0d7b | [V] |

Before the card is applied ovl21:0d7b fills defaults for three built-in personalities
(argument 0/1/2) with constants and small random rolls (e.g. +0x0a = 30/20/10, +0x44 = 80/35/35).
What each AI word controls was not traced; the target-scoring code that reads +0x18/+0x1a/
+0x1c/+0x1e (by level) and +0x3bc.. history counters is in the damaged decompile of
ovl38:0000's neighbour and was not resolved. [U]

AI turn phases [V for the order, I for the meaning]: ovl25:0000 runs, in this order, phases
labelled by debug strings pushed before each call: Diplomacy, move Hero, move Search, move
Explore, assault, move #1, rescue, evaluate, clean city, neutral, move #2, quick attack,
update hide, assault XX, specials, rebuilding, last rescue, production, vectoring
(strings at DS:0848..08ff, call sites ovl25:00e0..0331).

AI advantages found [V]: none tied to level in the economy code traced here (income, upkeep,
production and delivery read no level). The only strength bonus is the per-side "Enhanced"
flag (00f0), selectable for any side in the setup screen: produced units +2 strength (cap 9).
The difficulty rating treats level as harder (6.9). Other per-level effects are [U].

### 6.9 Game options and difficulty rating  [V]

OPTIONS.DAT's ten words are loaded into DS:23b4[0..9] (ovl57:223b) in the order of STRING
group 4 and copied into the game state at ovl57:0e34:

| idx | option | game word |
|---|---|---|
| 0 | Neutral Cities | 2c04:011a |
| 1 | Diplomacy | 2c04:011c |
| 2 | Quests | 2c04:011e |
| 3 | Hidden Map | 2c04:0124 |
| 4 | View Enemies | 2c04:012a |
| 5 | View Production | 2c04:0132 |
| 6 | Intense Combat | 2c04:0126 (battle die 24 instead of 20) |
| 7 | Quick Start | 2c04:0128 |
| 8 | Military Advisor | 2c04:012c |
| 9 | Random Turns | 2c04:0122 |

2c04:0130 is zeroed there. 2c04:012e is the **tutorial** flag: when set the option defaults are
taken from DS:2378 (ovl57:00a4) and it gates the TUTORIA\*.GFX help screens (ovl31:0000,
ovl68:04bd, ovl57:00d7). Neutral Cities takes three values (STRING 5: Average, Strong,
Active). 2c04:0112 (the battle bonus cap) is not written by code at all: the whole 2c04 segment is the
scenario file image (SCN read verbatim, ovl57:0194), and SCN offset 0x112 holds 5 in every
shipped scenario (see §7). [V]

Difficulty rating, ovl57:0bab (L 0x7c2bb):
```
opt = 4*NeutralCities + 4*Diplomacy + 3*Quests + 4*HiddenMap - ViewEnemies + ViewProduction
opt = min(opt, 20)
for each living computer side with level != 3: sum += level+1; n += 1
ai  = 80 if n == 0 else sum*80 // (3*n);   if ai >= 78: ai = 80
rating = ai + opt          # shown with STRING 6 "Difficulty Rating %d%%"
```
The signs of ViewEnemies/ViewProduction are as coded. [V]

### 6.10 Not traced / unknown

* Hero offers, quests, ruins, items: other section.
* Surrender acceptance outcome; rank→title table of the diplomatic rating; meaning of
  2c04:0116 (SCN offset 0x116); meaning of the AI parameter words; city history (ovl41) details.
  *(M9a: surrender, rating table and history traced, §6.6 / §6.7 additions; 0x116 is left to
  the AI research.)*
* City income for scenario maps comes from the scenario files (+0x2a), not from a formula.

### 6.11 The city screen (Addition, M6b)  [V]

Re-read from out/asm/ (ovl45, ovl44, ovl63, ovl62, ovl46, ovl32, ovl56, ovl16, ovl17, 07be, 0726,
1133); the drawing details are in the docstrings of `ui/dialogs/production.py`, `city_info.py`,
`raze_confirm.py`, `rename_city.py` and `ui/info/city.py`.

* Entry ovl45:0000(mode, x, y), modes 0 City Info (any owner, ovl62:04fa(x, y, 0x0e, 1)), 1 Build,
  2 Production, 3 Vectoring (own city, ovl62:04fa(x, y, SCN 0x110, 1)), 4 a site (ovl62:06fd, M7b).
  Callers: the tower cursor ovl46:011c (2 own / 0 other), the site cursor ovl46:0106 (0 / 4), the
  keys b / c / p / v / '.' (07be:019a / 01b5 / 0210 / 024d / 0281, at the view centre SCN
  0x17d / 0x17f; the menu entries 524-528 carry those keys; only from the main map: while
  the screen is up (DS:166a) 07be:03ef chords them, see "Keys and presses of a pop-up screen",
  §3.6), the turn-1 screen ovl68:0588 (2),
  Occupy ovl31:0461 (2), the tabs 193-196 (ovl45:033b / 0393 / 0367 / 037d) and the screen's own
  map clicks.  DS:0e94 = 0 at every call; the same mode and city while DS:166a is set refresh the
  buttons only (ovl45:03a9), except mode 1; DS:0e9e (chosen type) is set from +0x2c / +0x2d in
  modes 1-3 only.
* ovl62:04fa(x, y, owner, hidden): best = 1000, scan in table order, with Hidden Map and `hidden`
  only cities with one of their four squares passing ovl64:15ff(1); strictly nearest by 0a8b:0acc;
  owner filter unless 0x0e.  ovl62:0651(x, y): ovl62:04fa(x, y, SCN 0x110, 0), replaced by SCN
  0x110 + 100 when the standard (ovl47:0b47) is strictly nearer.
* Popup type 2: marble from source x DS:2a8c = 224 at (304, 60), the frame of the full
  (80, 60, 480, 312); the map at (ovl17:08c7() = 0x50 while popup 2 is the top popup, else 0x20,
  0x3c).  ovl63:0000(a, b, rect): with a = 0 no city markers (the popup's own call at ovl17:067d).
* Pages, buttons, map pictures, the ovl44 production / vector actions and the Build Production
  dialog: `ui/dialogs/production.py`.  The screen draws pages and map only at these calls; e.g.
  ovl44:072e ends with ovl45:0000(3) on the same city, which only refreshes the buttons, so the
  page (in-transit and incoming armies) keeps what it showed before the click.
* ovl44:1544 (slot sort by |w4|) runs when the Build Production dialog closes (ovl44:0eca), not
  after each purchase; ovl44:0ee3 advances DS:0e86 to the next slot when it is empty.
* Rename ovl56:0000 is the input variant of the confirmation box (popup 1, screen 5, 191 = the
  field, DS:58d0 = 0); its editor ovl56:03a6 starts empty and takes at most 14 characters (limit
  15 - 1) while the text before the new character is narrower than 0x80 px.
* Raze from the screen ovl32:0000 -> ovl56:0088 (four lines) -> ovl32:0061 (infamy
  rnd(1, 25, 0) + 25, `rules.city.raze_own`) -> ovl45:0000(0) of the razed city; no ->
  ovl45:0000(1).
* Right-click city panel ovl46:0c73(city) after ovl46:1201 (map square or overview pointer).
* Tutorial pages (25, 1), (25, 6) at open and (25, 2) at close: plan register X09.

## 7. Structures established in sections 2-4

| structure | field | meaning | evidence |
|---|---|---|---|
| army (0x16 bytes, 1e1d:8880 + i*0x16, count 2c04:0181) | +0 / +2 | x / y (x < 0 = unused) | ovl38:032f, ovl68:05fb |
| | +4 | army type (0x1c = hero) | ovl38:04f0 |
| | +5 | owner | ovl38:0314 |
| | +6 | max moves | ovl68:068e |
| | +7 | moves left | ovl36:0522, ovl68 |
| | +8 | strength | ovl38:0a08 |
| | +0xc | flags; 0x1000 = aboard | ovl36:0522, ovl38:0564 |
| | +0x12 / +0x14 | goto / vector target x, y (-1 = none) | ovl36:0522, ovl68 |
| map | see §4.1 | | |
| scenario image | SCN file read verbatim (0x2ee1 bytes) to 2c04:0000 | | ovl57:0194 (L 0x7b8a4) |
| | SCN 0x110 | current player | ovl38:00e7 |
| | SCN 0x112 | battle bonus cap (5) | ovl38:0a2a, 0a78 (L 0x6b0ca), shown as "(max +%d)" at ovl66:1425 |
| | SCN 0x11a.. | option words copied from the setup screen: 0x11a, 0x11c (Diplomacy), 0x11e, 0x124, 0x12a (View Enemies), 0x132, 0x126 (Intense Combat), 0x128 in STRING-group-4 order | ovl57:0e34 |
| | SCN 0x12e | tutorial flag | TUTORIA only; used beside TUTORIA\*.GFX loads |
| | SCN 0x60b | fight-order table 9 × 29 | ovl38:04bd |
| | SCN 0x710 | tile graphic -> terrain type (256 bytes) | ovl38:0000 |
| battle work area (DGROUP) | DS:41fa side A player, 41fb defending owner nibble, 4224/422c alive, 424c/4254 type, 4274/427c hits, 429c/42a4 strength, 42c4/42c5 counts, 42c6/42e6 far pointers | | ovl38:008b, ovl36:08a6 |
| per-type flags | DS:45c4 + type*6: +0 w16, +1 w17, +2 w18, +3 w19, +4 w13, +5 w15 | | ovl48:0000 |

## 8. Summary of what is not determined

Collected from the sections above (each is also stated in place):

* RNG: the float-to-int helper 0000:1b57 is assumed to truncate (C cast); not re-traced. [I]
  *(Resolved §9.7: chop rounding [V].)*
* New game: see §9.8 for what remains open (meaning of 2c04:0116, 2c04:10f3, the 9×9 DGROUP
  tables of ovl64:1931/113b, the run-time "Active" neutral rule ovl39:025a in detail,
  placement of starting items 0..7).
* Combat: the "+1" part of ARMYTYPE cancel modes 2/3 is not applied by any code found; w13 has
  no role in the battle setup. Purpose of the +80 fight-order shift for flyers in stacks with
  a hero at sea/mountains is inferred. [U]/[I]
* Movement: which caller builds the cost map with the alternative table DS:01e0 (mode 0xE). [U]
* Heroes/sites: see §5.9 (flags 2c04:015d/015b, site flag +0x1b, item types 5-7 effects,
  quest failure triggers, starting item placement, monster data in scenario files).
* Cities/AI: see §6.10 (surrender acceptance outcome, rating titles, 2c04:0116, AI parameter
  words, city history).
* Not looked for: anything in IMPORT.EXE, PATCH.EXE, START.EXE beyond the sound rate check
  noted in docs/formats/sound.md.

## 9. New-game setup (ovl53/ovl35/ovl57)

Read from the capstone listing (`out/asm/`), cross-checked against the Ghidra decompile.
Everything is **[V]** unless tagged otherwise. Offsets are 2c04 offsets, which equal SCN
offsets because the segment is the SCN image (§7). "Player record" below means
2c04:0185 + 0x14·p, the EL §5.1 base (= scenario.md's 0x183 record + 2), so gold is +0,
capital x/y +4/+6, and the words written at 0x193/0x195 are +0x0e/+0x10 (scenario.md's
+0x10/+0x12). City record 2c04:157d + 0x41·c, count 2c04:157b. Site record 2c04:0811 + 0x1f·s,
count 2c04:080f. Item record 2c04:0ce9 + 0x1d·i. Army record 1e1d:8880 + 0x16·a.
`dist` = 0a8b:0acc (§9.7).

### 9.1 Load and Begin

Scenario load ovl57:0194 (L 0x7b8a4), in this order: the SCN (0x2ee1 bytes) is read verbatim
into 2c04:0000; ovl57:0323 runs; then ovl29:0000 (L 0x621e0) runs for **all 100 city
records** (not only `count`):

```
for c in 99..0:
    bytes +0x2c..+0x40 = 0          # +0x2c current production = 0 (not 0xff), +0x2d turns left,
                                    # +0x2e, +0x30 attackers, +0x31 vectoring, +0x33/+0x35 target,
                                    # +0x37, +0x38, words +0x39 +0x3b +0x3d +0x3f
    +0x2f = +0x15                   # second owner byte = owner (0x0f in every shipped file)
```
Then ovl63:232b runs. It builds the map graphics, reads 0x161 (terrain set) and fills a local
256-byte table with rnd(1,3,0), which looks like a choice of tile picture variants [I]; it
writes no 2c04 header word. *(Correction, engine review: the call at ovl63:2479 pushes dword
0x00010003 then 1, i.e. rnd(1,3,**1**) (low word sides, high word add, as at ovl53:0973), so the
values are 2..4 **[V]**; they are the overview map's mountain colours, used per pixel at
ovl63:2785, not map-view tile variants. The number of rand() calls is unchanged.)* ovl57:0323 before it only reads files. Then, for every side with alive (0x137) = 0 the name (2c04:0000 + 0x14·p)
becomes "Not used" (DS:256f) and level (0x0c0) becomes 3.

Begin, ovl57:0cfe (L 0x7c40e):
```
if no side has alive != 0 and level != 3: message (ovl58:0b5f), back to the setup screen
ovl57:2289: write the ten option words DS:23b4 to OPTIONS.DAT
for p in 0..7:
    if not alive[p]:  computer[p] (0x0d0) = 1; level[p] = 0
    if level[p] == 3: alive[p] = 0; computer[p] = 1; level[p] = 0
                      city at capital (ovl62:044a): +0x15 = 0x0f      # byte only, tiles untouched
    if computer[p] == 0 (human): level[p] = 2
copy the options (§6.9 ovl57:0e34), 0x130 = 0
ovl25:0519: AI parameter block for p = 7..0 (ovl21:084d -> ovl21:0d7b, §6.8; draws rnd)
ovl61:0aeb, and with Hidden Map ovl61:0a6e (screen only)
ovl61:0000(0, 1)     # the only call with "new game" = 1; every scenario and random map passes here
```
ovl61:0000 with new game set (L 0x80270) calls, in order: ovl61:1732, ovl61:17f6,
ovl68:0952(1,1), ovl53:0000. Then it continues into the common entry that loaded games also
use (ovl53:056a UI tables, …, main loop ovl61:2123).

* **ovl61:1732 (L 0x819a2), turn order**: `order[i] = i` (0x163 + 2i). With Random Turns
  (0x122 ≠ 0): 20 times `a = rnd(1,8,-1); b = rnd(1,8,-1); swap(order[a], order[b])`.
  Then 0x173 (position in the order) = 0.
* **ovl61:17f6 (L 0x81a66), next side**: `repeat: if 0x118: { turn += 1; ovl61:1732;
  0x118 = 0; elimination ovl61:18ab; ovl61:1aed; ovl30:0034; ovl39:025a; ovl41:0d60;
  ovl68:0952(1) }; current (0x110) = order[0x173]; 0x173 += 1; if 0x173 >= 8: 0x118 = 1;
  until alive[current]`. 0x118 is 0 in the files, so at new game this just makes the current
  player the **first live side in turn order** and leaves 0x173 one past it. The SCN value
  of 0x110 is overwritten.
* **ovl68:0952 (L 0x8d162)**: draws the turn-order shield strip. It writes only locals and
  screen state; no game state.

### 9.2 ovl53:0000 (L 0x79c40), the new-game routine

```
0x118 = 0      round-complete flag (set by ovl61:17f6 when 0x173 reaches 8; the next advance
               starts a new round)
0x15d = 0      surrender offered (§6.7)
0x135 = 1      turn counter
0x181 = 10     army-table high-water mark: scan bound for army loops (ovl62:0000 …), raised
               by the allocator 0b62:0309 to index+1; the files hold 10 as well
0x157 = 0      victory acknowledged (set by ovl61:1fbd; the main loop ends when 015b and 0157)
humans = #p with computer[p] == 0                 # all 8 slots; dead ones are computers by now
shown  = 0 if HiddenMap and humans >= 1 else 1
if HiddenMap and humans == 1: DS:16a6 = 1
for p: 0x147[p] = shown; if not alive[p]: gold[p] = 0
ovl35:0000                                        # sites and items, 9.3
for a in 999..0: army[a].owner (+5) = 0xff; x (+0) = -1; y (+2) = -1   # other bytes untouched
DS:5e5e, DS:5e62 (dwords) = 0; DS:5e3e/5e40[p] = 0                    # AI far pointers into 1e1d
ovl48:0000                                        # per-type flag table DS:45c4 (§7)
ovl53:07ca                                        # cities, 9.4
ovl64:1931                                        # DS:2f1a = 1; two 9×9 DGROUP tables of 4-byte
                                                  # entries (Ghidra 451b:1fe1, 451b:2287) &= 0x1f [U]
ovl64:113b                                        # explored map, 9.5
ovl30:0000                                        # AI territories, 9.5
ovl39:00cc                                        # garrisons, 9.5
view = current (0x110); if HiddenMap: view = lowest p with computer[p] == 0; ovl63:2200(view) (fog drawing)
cx = clamp(capital_x[view], 4, 107); cy = clamp(capital_y[view], 4, 151)
0x17d, 0x17f = cx, cy                             # view centre
0x177, 0x17b = cx - 4, cx + 4                     # view rectangle left/right
0x175, 0x179 = cy - 4, cy + 4                     # view rectangle top/bottom (ovl36:0726.. moves it)
for every square: map word &= ~0x2000 (fortified, §6.2); road layer 19d9 &= ~0x40 (planted standard, §5.6 *(correction: not "item lying there"; 0x40 is set only by the plant ovl47:09f7)*)
ovl13:0103                                        # copies <scenario>.SGN to CURRENT.SGN (DS:03d3)
infamy (§6.6 ovl53:0271)
ovl00:11bd                                        # relations, 9.6
```
`DS:16a6`: at the start of a human turn (ovl68:026d), if set it is cleared and `0x147[p] = 1`
for every live p. So with Hidden Map and exactly one human, the other sides' turns become
visible from the human's first turn on. With two or more humans they stay hidden.

The map owner nibble and the army bit 0x10 are **not** written during set-up (ovl39:0000 writes
only the tile bytes). ovl62:0000 (L 0x824f0) rebuilds both at the top of every pass of the main
loop (ovl61:2183), so before the first turn: every square gets nibble 0x0f and bit 0x10 off; each
army with y ≥ 0 (indices 0x181-1..0) sets bit 0x10 and nibble = owner & 0x0f; each city with
owner ≠ 0x0f sets its four squares' nibble; bit 0x20 is cleared where no army stands.

### 9.3 Sites and items, ovl35:0000 (L 0x66b00)

```
cap = 2*sites/10
ovl35:091e (L 0x6741e):
    for every site: +0x1b = 0; +0x1d = 0x00ff
    repeat sites*3/10 times:
        draw s = rnd(1, sites, -1) until kind(+0x18) != 1 (temple) and +0x1b == 0
        +0x1b = 1; if Quests (0x11e): +0x1d = 0
ovl35:04ef(cap) (L 0x66fef), only if "<dir>\<scenario>.itm" opens (otherwise nothing changes):
    n = sscanf("%2d") of the first 2 bytes; skip CR LF
    entry: name = 20 bytes, [19] = 0, cut at the first ' ', '_' -> ' ';
           skip 1; type = char - '0'; skip 1; value = char - '0'; skip CR LF
    for i in 8..21:
        draw r = rnd(1, n, -1) until r was not drawn for an earlier i and
             special(entry r) == (i < cap + 8)
        item[i].name = entry r name (strcpy); +0x14 type, +0x15 value = entry's
        (state, holder, position untouched)
k = min(rnd(2,3,1), cap); total = min(22, sites/3 + rnd(1,5,-3) + 8)    # §5.5
for i in 8..total-1:
    if i < k+8 or i >= cap+8:
        draw s = rnd(1, sites, -1) until not used[s] and +0x1b[s] == special(item i)
        item i state 2, holder s; site s kind 2, +0x19 = i; used[s] = 1
    else: item i state 0
then items >= total, kinds, +0x1a as in §5.5
special(item) (ovl35:08f4): type 5, 6 or 8, or type 2 with value >= 2 (signed byte compare)
```
`used[]` starts as 1 for temples and for indices sites..39, 0 otherwise. A draw loop that can
never succeed (too few flagged or unflagged sites or entries) loops for ever in the original.

### 9.4 Cities, ovl53:07ca (L 0x7a40a)

```
last = -1
for p in 7..0:
    rec[p]+0x0e/+0x10 (0x193/0x195 + 0x14p) = capital x/y if alive[p] else -1/-1
    anchor[p] = capital[p]
    c = ovl62:044a(capital)           # first city with x in {X, X-1} and y in {Y, Y-1}
    if c < 0: continue
    if alive[p]: ovl39:0000(c, p); c.owner = p; last = p      # ends as the lowest live side
    else:        ovl39:0000(c, 0x0f); c.owner = 0x0f
if last != -1 and QuickStart (0x128):                         # R28
    loop:
        c = ovl62:04fa(anchor[last], owner 0x0f, 0)          # forward scan, strict <: lowest index on ties;
        if c < 0: break                                      # 4th arg 0 = no hidden-map filter
        ovl39:0000(c, last); c.owner = last
        anchor[last] = capital[last] if rnd(1,10,-1) <= 4 else (c.x, c.y)
        last = next live side after last (cyclic)
ovl53:0a75                            # production slots, below
for c in 0..count-1: c.+0x14 = ovl44:0930(c)   # 1 if < 3 of the 4 slot bytes are >= 0, else 2
```
ovl39:0000(city, o) writes only the four tile bytes: base = 0x62 + 2o for o < 6, 0x80 + 2(o-6)
for o ≥ 6, and o = 0x0f is treated as -1 (base 0x60). The squares are base, base+1, base+0x10
and base+0x11.

**Production slots, ovl53:0a75 (L 0x7a6b5)**. It runs on every new game, because 07ca calls it
unconditionally and 07ca is called only from ovl53:012c.
```
for every city c:
    every slot type == 5 (Navy) -> 0xff
    for d in 0..3: if type[d] == 0xff: type[d..2] = type[d+1..3]; type[3] = 0xff
                                      # type bytes only; one pass, so [ff,ff,A,B] -> [ff,A,B,ff]
for t in 0..28: rec = ARMYTYPE record of id t (ovl44:14ac)
    for every city, every slot with type == t:
        strength(+0x1e) = w0, time(+0x1a) = w1, moves(+0x22) = w3, cost(+0x26) = w2   (low bytes)
for every city: ovl44:1544 (L 0x71ae4): if type[0] >= 0: stable insertion sort of the leading
    run of filled slots by |w4| (buy price) ascending; type, time, strength, moves, cost move together
for every city, slot s in 0..3, stopping at the first type < 0:
    if rnd(1,100,0) < 10: strength = min(str+1, 9) if rnd(1,100,0) < 60 else max(str-1, 1)
    if rnd(1,100,0) < 20: r = rnd(1,100,0)
        r < 10: moves += 4;  r < 60: moves += 2;  r < 95: moves = max(moves-2, 2);  else max(moves-4, 2)
    if moves < 6: moves = 6               # always
    if rnd(1,100,0) < 10: cost = cost - cost/4 if rnd(1,100,0) < 60 else cost + cost/4
                                          # signed byte, idiv (trunc); costs are <= 20 in ARMYTYPE
    if rnd(1,100,0) < 10: time = max(time-1, 1) if rnd(1,100,0) < 60 else time+1
```
So a new game always discards the scenario file's per-city slot statistics and Navy slots:
it keeps only the slot types, re-reads the statistics from ARMYTYPE and perturbs them at random.
*Correction (M6b review): the statistics of empty slots (type 0xff, also Navy slots cleared here)
are not rewritten - they keep the scenario file's bytes at their position (the compaction moves
type bytes only) - and they are read: ovl44:00ff with DS:0e9e = -1 sets +0x2d to the time byte of
the first slot of type 0xff (ovl44:0000).*

### 9.5 Explored map, AI territories, garrisons

**ovl64:113b (L 0x86e3b)**: the per-tile byte buffer DS:126c (112×156, index x + 0x70·y) is
filled with 0xff without Hidden Map and 0 with it. Every road-layer byte (19d9) gets
`|= 0x20` and `&= 0x7f`; ovl63:2200 draws fog on the squares with 0x20, so 0x20 reads as
"not seen" [I]. *(Correction, engine review: 0x20 means "seen" — 0555:08bf blocks human paths
through squares where it is clear and ovl64:1298 sets it when revealing; see §4.1. So 113b marks
every square seen in the working view, and the turn start ovl64:0d39 replaces that with the
side's own bits. ovl63:2200 does not contradict it: after filling the bitmap DS:54e3 through
1012:07cc(…, 1) it plots value 0 at (2x, 2y)… for the squares with 0x20 set (asm ovl63:2269..22ac),
which reads as clearing the fog mask there [I].)* DS:5ed4[9][9] = 0xff. For p = 0..7, for each city owned by p, the buffer bytes
at x-2..x+3 × y-2..y+3 (not clipped) get `|= 1 << p`. The buffer holds one explored bit per
side per square [I].

**ovl30:0000 (L 0x63d60)**: calls ovl29:010b, then for p: infamy (0x10e3) = 0 (overwritten
later by ovl53:0271) and 0x10f3[p] = -1 (written elsewhere only by ovl61:1f54, = current
player; meaning [U]).

ovl29:010b (L 0x622eb), after ovl29:0398 builds the AI per-city tables (DS far pointer
018a, no rnd):
```
for p in 7..0: mark[p] = 0
    if alive[p]: if human: humans++ else: mark[p] = 1; comps++
        anchor[p] = capital[p]; c = ovl62:044a(capital); if c >= 0: c.+0x2f = p
if comps == 0 and humans > 0:
    best = -1; for p in 7..0 alive: mark[p] = 1; r = rnd(1,100,0); if best == -1 or r > br: best, br = p, r
    mark[best] = 0
q = highest p with mark[p]; if none: done
loop: c = ovl29:0a27(anchor[q], 0x0f)    # nearest intact city (terrain 10) with +0x2f == 0x0f,
                                          # scanned count-1..0 with strict <: highest index on ties
      if c < 0: break
      c.+0x2f = q
      anchor[q] = capital[q] if rnd(1,10,-1) <= 4 else (c.x, c.y)
      q = next marked side after q (cyclic)
```

**Garrisons, ovl39:00cc (L 0x6bbcc)**, one army per intact city, owned or neutral:
```
KIND = DS:0d60 = {1, 6, 2, 3}
for c in count-1..0:
    if terrain(tile at c.x, c.y) != 10: continue
    fallback = no
    if c.owner != 0x0f:               n = 3
    elif NeutralCities (0x11a) == 0:  fallback = yes                  # Average
    else:                             n = min(rnd(1, 4, NeutralCities - 2), 3)
                                      # Strong (1): n = 0..3 uniform; Active (2): 1, 2, 3, 3
    if not fallback:
        if ovl29:103d(c, KIND[n], -1, 0):
            c.+0x2c = type of slot ovl44:0000(c, c.+0x2c)             # same type again
            ovl39:0381(c): a = ovl43:0dd7(c, c.x, c.y, -1); a.moves_left (+7) = 0;
                           c.+0x2c = 0xff; c.+0x2d = 0; map army bit 0x10 at (c.x, c.y)
        else: fallback = yes          # the city has no production slot
    if fallback:
        a = 0b62:0309(); a.owner = 0x0f; a.type = 11 (Scouts); a.x, a.y = c.x, c.y; a.strength = 1
        # even in an owned city; moves (+6/+7), home, upkeep not written (0 in a fresh table)
```
Option values are 0 Average, 1 Strong, 2 Active (ovl57:1650 cycles `(v+1) % 3`; STRING 5).

ovl29:103d (L 0x6321d), production choice, with A = DS:0a10 {0,10,10,5,5,5,10},
B = DS:0a1e {0,4,10,10,10,10,1}, C = DS:0a2c {0,1,1,1,1,1,10}:
```
best = 0; pick = -1
for s in 3..0 with type t = slot type >= 0:
    time = slot time
    S = min(slot strength + (Enhanced[0x110] ? 2 : 0), 9)
    if DS:45c9[6t] (w15 cancel mode) == 1: S += 2
    if kind != 6 and S < 3: time += 1
    time = min(time, 10)
    if DS:45c4[6t] (w16 flies) == 0 and kind == 4: skip
    score = (10 - time)*A[kind] + S*B[kind] + trunc(slot moves * C[kind] / 2)
    if score > best: best, pick = score, t          # ties: the higher slot index wins
if pick == -1: return 0
ovl29:0e5a(c, pick, 0, 0): (refused only if gold[0x110] < cost + 30 and turn > 5; from the decompile)
    c.+0x2c = pick; c.+0x2d = that slot's time; c.+0x31 (vectoring) = 0
return 1
```
The unit (ovl43:0dd7, §6.3) gets type, the city's owner, moves = slot moves, strength = slot
strength, or `min(+2, 9)` when the **current player** (0x110, the first side in turn order)
is Enhanced, home = c, upkeep = cost/2. The allocator 0b62:0309 also gives it +0xc = 1,
+0x10 = 0xff, +0x11 = 0, +0x12/+0x14 = -1 and raises 0x181. Because the garrison runs after
ovl53:0a75, it uses the perturbed slots. Because the production it chose is cleared again,
no city has a production running at the start.

Run time, not set-up: with Active (0x11a ≥ 2), ovl39:025a (L 0x6bd5a) runs at every round end
(ovl61:17f6). For each intact neutral city with +0x30 ≠ 0 (it has been attacked), it counts
down +0x2d and produces a unit through ovl39:0381 when the count reaches 0. When ovl29:0fd5(c)
is 0 and fewer than 4 armies stand there (0b62:007d), it picks a production of kind 2 through
ovl29:103d. ovl29:0fd5 and the exact cap were not traced [U].

### 9.6 Relations, ovl00:11bd (L 0x4968d)

For a, b in 0..7 (all 64 bytes, a == b included): with Diplomacy (0x11c) on, bits 0-1 (current)
and bits 2-3 (proposal) = 0. With it off, current = 2 and proposal = 2. Then bits 4 and 5 are
cleared; bits 6-7 are kept.

### 9.7 Distance, 0a8b:0acc (L 0x1b37c)

A far call through DS:69b8, which 1012:0174 sets to 1012:1199 (L 0x212b9); no other writer.
1012:1199, read from the emulator opcodes: `fild |x1-x2|`, `fild |y1-y2|`, square both in
doubles, add, compare with 0 (`< 0` -> 10000, unreachable), then `sqrt` (0000:1a6a: FLD, sign
test, D9 FA = FSQRT) and `__ftol` (0000:1b57, chop). Result
`trunc(sqrt(dx² + dy²))`, which equals the integer square root for every map distance.
(0a8b:0ae4 next to it is a different routine, a direction code.)

### 9.8 Random-number order and what stays open

rnd() draws at new game, in order: 256 × rnd(1,3,0) in the loader's ovl63:232b (graphics)
*(correction: rnd(1,3,1), overview mountain colours, see §9.1)*; the AI blocks at Begin (ovl25:0519 → ovl21:0d7b, §6.8); the
turn-order swaps (ovl61:1732); ovl35:091e flags; ovl35:04ef redraw; k; total; item sites; site
kinds and +0x1a (§5.5); Quick Start anchors (ovl53:097b); slot perturbation (ovl53:0bf8..0e39);
territory split (ovl29:024d, 02d6); garrison n (ovl39:0174); infamy (ovl53:0275).

Open: what 2c04:0116 and 0x10f3 mean; the 9×9 tables of ovl64:1931/113b; the file reads
of ovl57:0323 in detail; the details of the Active rule (ovl29:0fd5); where starting items
0..7 lie before turn 1 (§5.5).

*(Addition, Game Start face roll [V].)* The stream does not start at the loader. ovl59:02bf
seeds itself on its first call only (DS:2678 -> ovl59:0356), and no roller lies on the start-up
path (08a9:0219..024c: ovl14:02fb, ovl53:056a, ovl54:0341, ovl59:0a1b; none is a caller of
02bf, and ovl59:052f rolls rnd(1, n, -1) only for a negative STRING, FILE or ERROR.DAT entry, at 058b..0595). So the
first rolls of a run are the talking faces of Game Start. ovl60:0000 with `draw` (08a9:024c
start-up, ovl57:0ee0 the setup screen's Main Menu) calls ovl58:026f(2) at 0109; jump table
0b17 sends 2 to 0838, and both branches (no digital driver 0845 -> 0854 -> 0944, digital
085d -> 0939 -> 0854 -> 0944) reach rnd(1, 30, 10) at 094c, the blink counter (si, 0954).
The speech files are FILE.DAT (0x3b, 1) (caption, 083f) and (0x3b, 0) (sample, 085a), fixed
entries, so 052f adds no die (it rolls rnd(1, n, -1) only for a negative entry of STRING,
FILE or ERROR.DAT, 04f0 / 0505 / 051a). ovl60:060f with DS:28c8 (random map) calls 026f(0) at 0621
(087b: (0x3c, 1) / (0x3c, 0) -> 0944), also one roll. The
only exit before 094c is DS:26c8 != 0 (talking advisor off, 0293); 071b..0826 has no roller.
Then ovl57:0000 loads and ovl63:232b draws its 256 rnd(1,3,1) at 2479..2492 (si < 0x100).
Order with the talking advisor on: face(2) [, Begin random map face(0)], 256 loader rolls,
quotation (ovl57:0fe8), Random Characters, Begin face(1) (ovl57:0e2c); each Main Menu ->
Begin adds another face(2), 256, quotation, and so on. The music on this way draws no die:
ovl58:0000(0) before the face (ovl60:00fb / 00fd) and at the setup entry (ovl57:003a / 003c)
reads FILE.DAT (8, 0) / (7, 0), Begin's ovl58:0000(11) (ovl57:0e24 / 0e26) (19, 0) / (7, 0);
the modes that roll (1, 2, 3, 5, 6) are listed in register X32. Modelled by `states.menu.session_dice` and
`NewGameConfig.rng_state`.

*(Addition, planted-standard slots 11 / 12, register X44.)* ovl64:2d7c scans items 21..0;
an item on a square with road bit 0x40 (2e66..2e78) writes (n & 15) << 1 into the cell
(2e90..2ead), so the lowest such index wins. An item 11 or 12 can be the lowest one on a
flagged square in play: Plant (ovl47:09f7) sets the bit with standard p < 8 on the square;
a computer hero's step (0a8b:04c8 -> ovl28:0427) takes every item there and writes only
the item records (0511 +0x16 = 3, 055a +0x17), so the bit stays; a later drop (ovl47:0943)
or a dead hero's items (ovl36:16cd) put item 11 / 12 there. Slots DS:51a9 / 51e4 are the
mask and bitmap records of 15 of the 49 pictures whose table byte +5 (DS:1f5b) is 8 (45, 46,
50, 54, 62, 69..78, all with a mask, movebar0..7 in TERRAIN<n>; the other 34 have records of
their own). Drawing or loading any group-8 picture through the cache (0997:00a2 / 0129 /
027e / 034a, 0158..0171) first unloads the group's loaded picture (059c: flags &= ~4,
1012:0975 frees bitmap and mask and sets +0x34 = 0 at 09bf..09c2), then loads (03a9);
0997:0066 (ovl57:0014, ovl49:0449) unloads the pictures of directory != 0 (the movebars).
Both records are zero in the image, and 0f00:0c4d bounds its lock, plane and unlock loops by
the source's +0x34 (0ce9..0d25, 0f8e..109a), so with none of the 15 loaded (before the first
load, after any other group-8 load, after 0066) nothing is drawn. With one of them loaded,
0c4d reads rows 29..57 from x 416 (offset sy * stride * 2 + (sx >> shift), 0c56..0c6a); it
does not clip to the source (it compares the record's +4 / +6 with DS:34e7 only to choose the
path, 0ca1..0cc8), and 0e68:00f3 is a word loop bounded by the width and height passed to it.
The read stays inside the planes for scroll (256x252), stack (400x112), voice (352x442),
helpgfx (512x110) and bscroll (336x347), rows wrapping where the width is below 448, so it
depends only on the picture; for movebar0..7 (320x18) and rmapbar (192x21) it runs past the
plane buffers into heap memory (scroll2 is missing from the game copy used here). Which
picture is the occupant at a map draw is the order of the EXE's 137 cache call sites
(0129 x71, 034a x46, 027e x18, 00a2 x2) against its map draws.

## 10. Save / Load / New Game / Quit (ovl49) *(Addition, M10b)*

Read from `out/asm/ovl49.asm` (019d..0e5f), `ovl29.asm` 0da9 / 0dff, `ovl25.asm` 04c5..05b9,
`ovl60.asm` 0000, `ovl61.asm` 0000, `ovl64.asm` 1927 / 1931 / 113b, `res_070b.asm`,
`res_0555.asm` 0350 [V unless noted].  Engine: `rules/saveload.py`.  File I/O of res_070b:
0006 open / create, 003a close, **004e write (ah = 40h)**, **006d read (ah = 3Fh)**, 00a9 lseek.

### 10.1 Entry points

ovl49 stub 307f: 2f -> 019d (New Game, menu 500, Alt+N 0x131), 7f -> 0203 (its *yes*
callback), 25 -> 093b (Save Game 501, Alt+S), 2a -> 026b (Load Game 502, Alt+L; Game Start
button 101 through ovl60:05e3), 34 -> 0000 (Quit 505, Ctrl+Q), 89 -> 0a46 (the save
writer), 98 -> 0414 (the load), 8e -> 0995 / 93 -> 02d3 (the list callbacks), 4d -> 0e25 (any
game slot used), 52 -> 0e42 (any map slot used), 39 -> 0e5f (slot table read at start-up,
res_0a4c:0250).  0a09 (stub 66) has no caller and no pushed pointer in any listing.

### 10.2 Save, ovl49:0a46(desc, map_flag, path)

The slot table first (0a64 strcpy, 0a70 DS:4712[DS:128c] = 1, 0f4c writes FILE.DAT (4, 0)),
then the file FILE.DAT (28, DS:128c) is opened (0ab9; failure: nothing more, the slot stays
marked used).  Writes in order: DS:5d64 0x54 (0ad1, the SCENARIO.DAT record copy: +0x3c the
directory DS:5da0, +0x44 the compare field DS:5da8), 2c04:0000 0x2ee1 (SCN, 0ae3), 1e1d:0000
0xde70 (map words 0x8880 + 1000 army records x 0x16, 0af5), 19d9:0000 0x4440 (roads, 0b07),
the buffer of handle DS:1270 0x4440 (explored layer, 0b29); CURRENT.SGN, [RANDOM.SPC,
RANDOM.CTY when SCN 0x120], CURRENT.HST as a 4-byte length and the bytes (0b46..0d3c); unless
`map_flag`, ovl29:0da9 (0d4b): the 8 AI blocks (0x42c each) and the neighbour table (0x4b0).
No game state and no run word changes besides DS:128c / 128e and the slot table.

### 10.3 Load, ovl49:0414(slot, game, rebuild) and ovl49:02d3

0414: (0424..0441) compare string = "" (DS:129f) when DS:28c6 or not DS:2a86, else DS:5da8;
0997:0066, ovl64:1927 (DS:6469 bit 0 off), ovl64:1931 (DS:2f1a = 1, 9x9 tables DS:61e7 / 5f41
&= 0x1f); (0458..04d7) army records 0..9: owner 0x0f, x = y = -1; DS:5e5e, 5e62, 5e3e[0..7]
= 0; progress scroll (popup 0x17, STRING 133 / 134); ovl64:113b (explored layer and road bits,
§9.5); open FILE.DAT (28 / 26, slot) mode 2 (0612), **failure jumps to 08b1**; reads (006d)
in the save's order with the progress at 20 / 30 / 40 / 50 / 60 / 70; **SCN 0x130 = 1**
(0891); `game`: **ovl29:0dff** (08a4): its first ovl25:056c runs 04c5(1) -> 0519 (the AI dice,
on the loaded SCN) when DS:0832 == 0, then reads the blocks and the neighbour table and calls
**0555:0350** (path cache clear, only when allocated, DS:00de); close; 80; SCN 0x124 ->
ovl63:2200 (fog); 0997:034a(7); 90; `rebuild` or strcmp(compare, DS:5da8) != 0 ->
**ovl63:232b** (256 rnd(1, 3, 1)), return 1; SCN 0x120 -> ovl45:1de4; 100; close the scroll;
ovl55:0000(1).  So the dice of a fresh-run load are the 0519 draws, then the 256.

A failed open leaves the wipe on the live game (records 0..9, the selection pointers, 113b),
skips SCN 0x130, the AI read and the path-cache clear, compares DS:5da8 with itself (in a
game: no rebuild; from the Game Start / Setup screens: rebuild unless the field is "") and
02d3's sequence runs on that game.

02d3 after 0414 (0332..040c): ovl48:0000; DS:2a86 and rebuilt -> ovl61:0a6e, ovl65:0698;
DS:28c6 or not DS:2a86 -> ovl65:0000; **ovl62:03f9, 02bf, 0372**; **ovl35:09f2(SCN 0x110),
ovl62:0000, 0555:0d9e(SCN 0x110, 1)**; ovl61:0000(DS:28c6, 0) (DS:2a86 = 1, the game screen,
ovl66:0356 at 008f; with new-game 0 it returns before 0118: no main-loop pass); DS:28c6 = 0;
ovl68:0952(1, 0), (0, 0); STRING (47, 1) with the side's name -> ovl61:10fb; ovl64:006c;
ovl62:0af3; ovl58:0000(1).  The game resumes mid-turn in the human phase of SCN 0x110: no
turn start.  Cancel of the list: DS:28c6 ? ovl60:0000(0) : DS:2a86 ? ovl61:0000(0, 0) :
ovl57:0000(0, 0, 0, 1).

The list quirks [V asm, not run]: 026b lists only the used slots, compacted, and 02d3 passes
the *entry index* to 0414 as the slot (DS:4bfc, the entry's slot, is not read in ovl49 /
ovl51); the preselected row DS:128e is shared with the Save list, and ovl51:0000 shifts every
row (also the -1 ones) while the chosen row is >= 5, so rows past the count show the name
buffer DS:483c as an earlier list left it and are loadable.

### 10.4 What a load keeps from the running program

Not in the file, so a load leaves them as the run has them: the dice stream DS:3d84 / 2678;
the AI process words DS:0832 / 0836 / 40f2 / 40ee / 40c0 / 07c6 / 3254 and the raze result;
the search field DS:3f86; the battle arrays DS:41fa..436a and DS:4160; the production report
block DS:4464; the army type table (loaded once per run); DS:16a6; the selection words
DS:5dfe / 5e00 / 2bda / 5dfc / 5dfa / 3250 / 3252 / 6862 / 6842 / 6852 (only the pointers
DS:5e62 / 5e5e / 5e3e are nulled); the overview bitmap (unless 232b runs); DS:0a54, DS:5c38;
DS:128c / 128e / 1290 and DS:483c.  Recomputed: DS:5dca / 5dda / 5dea, the cost map, the map
words.  Cleared (game load only): the path cache.

### 10.5 New Game, ovl49:019d -> 0203

019d asks (ovl56:0088, STRING group 45) with 307f:007f = 0203 as *yes*.  0203: ovl45:1de4;
0b62:03be on army records 0..999; ovl62:0000; ovl64:1927, 1931; ovl65:01ff; ovl64:113b; DS:2a86
= DS:166a = 0; ovl62:0af3; ovl60:0000(1) (DS:28c6 = 1, music mode 0, the talking face
ovl58:026f(2), whose rnd(1, 30, 10) comes only when the advisor talks: 026f returns at once
when DS:26c8 != 0, 0293..029a); **ovl25:0519** (all eight AI blocks re-initialised from the
abandoned game's SCN, with their dice; DS:0832 = 1).  The abandoned game stays the run's
memory: a later load and a later Begin both take the run words from it (§10.4, §10.7), a
later Begin also the AI heap blocks.

### 10.6 Quit, ovl49:0000

DS:2a86 == 0 -> 0072 at once; else ovl56:0088 (STRING group 44) with yes = 0072, no =
ovl34:1434 (the game screen redraw ovl61:0000(0, 0)).  0072: ovl58:026f(4), then 0a4c:02b5
(text mode, music off, vectors back, mouse, `printf(DS:27c9, DS:27f8)` one console line,
exit(0)).  Nothing is written on exit.

### 10.7 What a Begin keeps from the running program

A Begin in a run that had a game (after New Game, or after the end of a game) starts from the
run's memory as a load does [V grep of the writers]: nothing in the scenario loader / Begin
(ovl57), in ovl61:0000(x, 1) (1732, 17f6, ovl68:0952, 0174, 0aeb, 0a9d, 0418) or in
ovl53:0000 writes the path cache DS:3f7e (0555:0350 has only the callers 0555:034b, the
allocation, and ovl29:0e51, the load), the battle arrays DS:41fa..436a and DS:4160 (read by
the attack prelude ovl36:0522), the selection words DS:5dfe / 5e00 / 2bda / 5dfc / 5dfa /
3250 / 3252 / 6862 / 6842 / 6852, the caches DS:5dca / 5dda / 5dea or the report block
DS:4464; the army type table is read once per run (ovl44:112f).  ovl53:0000 writes only:
DS:16a6 = 1 with Hidden Map and exactly one human (006f..007c; otherwise the old value
stays), the army records 999..0 owner 0xff and x = y = -1 (00c1..00fe; every other byte stays,
so 0b62:0309 hands out records with the old game's +0xe bits 4-7 and the bytes the creators
do not write), and the selection pointers DS:5e5e / 5e62 / 5e3e[0..7] (0100..0120).  The
search field and the cost map are rewritten by the set-up's own searches (territories,
neighbour table), the overview bitmap by the loader's ovl63:232b.  Engine:
`rules.setup.new_game(..., run=rules.saveload.run_part(previous game))`,
`rules.saveload.begin_carry`.

