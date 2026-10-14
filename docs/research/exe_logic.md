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
* Palette 0d30: square list sorted; index grows except between neighbours with the same
  nonzero +0x11; selected = in the moving group (2bda clear: the leader alone).
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
