# Shared conventions for the AI trace (read before tracing a phase)

Repo: /home/rharvey/Dokumente/Programmieren/warlords2. Executable: Warlords II 1.02 DOS (not Deluxe).
Python: `.venv/bin/python -I`. Do NOT edit docs/, warlords2/, tests/ or original/. Do not git commit.
Write only your section file out/re/ai/sections/<yours>.md (and scratch files under out/re/ai/).

## Material
* Compact Ghidra decompile per overlay: out/re/ai/dc/ovlNN.c (each function headed `// ovlNN:OOOO (L 0x...)`),
  resident helpers out/re/ai/dc/res_{0555,0a8b,0b62,0c8c}.c. Single function: `.venv/bin/python -I tools/re/dc.py ovlNN:OOOO 20000`.
* Capstone listings: out/asm/ovlNN.asm, out/asm/res_SSSS.asm (authoritative; far calls annotated `-> ovlNN:OOOO`,
  DGROUP string pushes annotated). Some functions decompile to nothing or wrong code (Borland switch
  tables: `jmp word ptr cs:[bx+T]` + a `dw ...` table line) -> read the listing.
* Call graph: out/re/ai/callgraph.txt, out/re/ai/funcs.tsv (func, size, callees, callers);
  xrefs: out/re/ai/xref_ds.tsv (DGROUP), xref_2c04.tsv (SCN image), xref_ai.tsv (AI block), hooks.txt.
* rnd() call sites in AI code: out/re/ai/rnd.txt (dice/sides/add reconstructed; '?' = run-time value).
* Rules already traced (cite, don't redo): docs/research/exe_logic.md (EL). §3 combat (ovl36:0000 attack,
  ovl36:124a battle simulation/advisor), §4 movement (cost map, stack move mode 0c8c:0529, selection globals),
  §5 heroes/sites/quests/items, §6 cities/economy/diplomacy/AI, §9 new game.

## Address/decompiler pitfalls
* Ghidra `FUN_SSSS_OOOO` = linear SSSS*16+OOOO; flat seg = SSSS-0x1000. Overlay -> Ghidra seg:
  ovl18 59?? etc.: use `.venv/bin/python -I tools/re/addr.py original/game/Warlrd2/WARLORD2.EXE 0xLINEAR`.
  `thunk_FUN_7e8f_02bf` = rnd (ovl59:02bf). `FUN_1a8b_0acc` = dist (0a8b:0acc, trunc(sqrt(dx²+dy²))).
* Ghidra data: `DAT_3c04_XXXX` = 2c04:XXXX (SCN image, game state); `DAT_4125_XXXX` = DS:XXXX;
  `DAT_451b_YYYY` = DS:(YYYY+0x3f60); `2e1d` = 1e1d (map / armies); `29d9` = 19d9 (road layer).
  Bare `*(N + K)` with no segment in the decompile is usually 2c04 (Ghidra default) — verify in the listing.
* Borland pushes rnd's last two args as one 32-bit immediate (`66 6A imm8`, `66 68 imm32`): low word =
  sides, high word = add. Ghidra shows e.g. `thunk_FUN_7e8f_02bf(1,0xffff0004)` = rnd(1,4,-1).
* Near-call targets inside overlays are sometimes printed 0x10000 too low by Ghidra; the listing wins.

## Records (2c04 = SCN image; offsets equal SCN offsets)
* 0x110 current side; 0x0d0[p] 0 human / 1 computer; 0x0c0[p] level 0/1/2 (K/L/W); 0x0f0[p] Enhanced;
  0x137[p] alive; 0x135 turn; 0x11a NeutralCities; 0x11c Diplomacy; 0x11e Quests; 0x124 HiddenMap;
  0x128 QuickStart; 0x12c MilitaryAdvisor; 0x181 army high-water mark; 0x157b city count.
* player record 0x185 + 0x14p: +0 gold, +4/+6 capital x/y. Infamy 0x10e3[p]. Relation byte
  0x153b[a*8+b]: bits0-1 current (0 peace, 1 neutral, 2 war), bits 2-3 a's proposal to b.
* city 0x157d + 0x41c: +0/+2 x,y; +0x15 owner (0x0f none); +0x16..+0x19 slot type (0xff empty);
  +0x1a.. slot time; +0x1e.. slot strength; +0x22.. slot moves; +0x26.. slot cost; +0x2a income;
  +0x2c current production type; +0x2d turns left; +0x2f AI claim (side whose territory, 0x0f none;
  set at new game by ovl29:010b); +0x30 attackers bitmask; +0x31 vectoring on (word);
  +0x33/+0x35 vector target x,y. In Ghidra: 0x1592 = +0x15, 0x1593 = slot types, 0x1597 times,
  0x159b strengths, 0x159f moves, 0x15a3 costs, 0x15a9 = +0x2c, 0x15aa = +0x2d, 0x15ac = +0x2f,
  0x15ae = +0x31, 0x15b0/0x15b2 = +0x33/+0x35.
* site 0x0811 + 0x1f*s (count 0x080f); item 0x0ce9 + 0x1d*i (x/y at item+0x19/+0x1b -> 0xd02/0xd04).
* army 1e1d:8880 + 0x16a (Ghidra 2e1d, negative offsets: -0x7780 = +0): +0 x, +2 y, +4 type (0x1c hero),
  +5 owner, +6 max moves, +7 moves left, +8 strength, +9 home city, +0xb upkeep, +0xc flags word
  (0x1 awake, 0x40 done, 0x200 visited, 0x1000 aboard; AI uses 0x20/0x80 — see ovl29:0ae7),
  +0xe low nibble = AI order kind, bits 4-6 = ?, +0xf bits1-7 = AI order index (bit0 kept),
  +0x10 transit, +0x11 group id, +0x12/+0x14 goto x,y.
* map word 1e1d:[y*0xe0 + x*2]: low byte tile -> terrain via SCN 0x710 (10 = city);
  high byte bits0-3 owner nibble, bit4 army present, bit5 fortified, bit7 port. Road layer 19d9:[y*0x70+x],
  bit 0x20 = seen (Hidden Map).
* per-army-type flags DS:45c4 + 6t (Ghidra 451b_0664 + 6t): +0 w16 flies, +1 w17, +2 w18, +3 w19 navy,
  +4 w13, +5 w15 (cancel mode; ==1 counts +2 strength in AI scoring).
* Selection globals (shared with the human UI): DS:5e62 leader far ptr (Ghidra 451b_1f02), DS:5e3e[8]
  group far ptrs (451b_1ede/1ee0), DS:5dfe count (451b_1e9e), DS:5e00 min moves left (451b_1ea0),
  DS:2bda group flag, DS:5e5e hero; DS:5dfa/5dfc (451b_1e9a/1e9c) = (y? x?) passed to 0555:1ab9.

## AI state (verified from ovl25:04c5/0519/05e6, ovl21:084d, ovl29:0da9/0dff)
* Per side an AI block of 0x42c bytes, allocated by ovl25:04c5 (DS:0832 = allocated), handle DS:40ca[p]
  (far, 4 bytes each). During the computer turn it is locked to the far pointer **DS:40ee** (Ghidra
  `DAT_451b_018e`), referred to below as `AI[...]`. ovl25:056c(p)/05b9(p) lock/unlock another side's block.
  Saved and loaded whole (8 × 0x42c) by ovl29:0dff / ovl29:0da9 together with the city table below.
* City-neighbour table 0x4b0 bytes, handle DS:40c6, locked to far ptr **DS:40ea** (Ghidra `DAT_451b_018a`)
  by ovl25:05e6 (unlocked ovl25:063d): `NB[c*6 + i]` = i-th neighbour city of c (0xff none), `NB[600 + c*6 + i]`
  its distance; built by ovl29:0398 at new game; query ovl25:0656(c, d, ids_out, dist_out) -> d in c's list.
* DS:0836 = "AI turn in progress" (set 1 in ovl25:0000 after the prologue, 0 before the epilogue);
  ovl25:09ab() = side 0x110 is computer (0x0d0 == 1) or DS:0836 != 0 — the rules code asks this.
* AI block layout (ovl21:084d initialiser, called per side at Begin and loaded game ovl49:0203):
  words +0x00 (=0), +0x0a, +0x0c (bit0 flag), +0x0e, +0x10, +0x12, +0x16..+0x1e, +0x20 (=10: number of
  battle simulations in ovl29:15c5), +0x22, +0x24, +0x26..+0x36, +0x38, +0x42, +0x44, +0x46, +0x48,
  +0x4a, +0x4c; per-city byte arrays [100]: **+0x56 city role** (values 2..13 seen, see production),
  **+0xba**, **+0x11e city flags** (bit0 = set at init with Hidden Map, bit1 = city has a flying-type slot
  / bought one, bit2 cleared each turn by ovl25:0386); +0x182 and +0x1e6 [100] (written by ovl24:023f);
  word +0x24a = number of task-force records; records at +0x24c + 0x5c*k, k < 4 (+0 active word,
  +4 target city (0x250), +6..+0xd four source cities (0x252+2j), more fields at 0x25a, 0x272, 0x27e,
  0x28a, 0x292, 0x2a4, 0x2a6 — names to be established); 7 word arrays [8] indexed by opponent side:
  +0x3bc, +0x3cc, +0x3dc, +0x3ec, +0x3fc, +0x40c, +0x41c (battle memory, written by ovl25:09d7).
* Card parameters: EL §6.8 table (ovl21:0d7b). Personalities 0/1/2 defaults then card overrides.

## Shared utilities in ovl29 (already read; cite by address, refine if you find more)
0a27 nearest intact city with given claim (+0x2f); 0ae7(list[8], kind, idx, flags) give a stack an
order and move it (sets army +0xe nibble kind, +0xf idx, group id via 0b62:0cde, goto via 0c7e, army
flag word &= ~0xa0 then |= flags, then 0c8c:0529 move); 0c7e goto point per order kind (1 city, 2 item,
3 site, 4 none); 0e5a set production (refused if gold < cost+30 and turn > 5); 0f10 set vectoring;
0fd5 city has a partly finished production; 103d choose production by kind (tables DS:0a10/0a1e/0a2c,
EL §9.5); 11d5 buy a slot; 12c9/13b2 collect up to 8 own armies on a square (filters) and select them
(14d3); 15c5(x,y) win percentage = wins of ovl36:124a(x,y,0) simulations × 100 / AI[+0x20];
1626 count armies/strength/heroes on a square; 16ae any 3×3 neighbour with road-layer bit 0x20;
1771/1851/1885 target-city choice after a battle/raze; 1a4d can the city build a decent unit;
1ae9 weakest slot.

## Tags
Every statement: [V] verified from code (address given), [I] inferred (say from what), [U] unknown (say what
blocks it). Give addresses for every branch you describe. Constants exactly as in the code.
