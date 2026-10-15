# Warlords II 1.02 computer player (AI), traced from WARLORD2.EXE

Status: every function of ovl18–ovl30 reachable from the game is traced (§6), with the
resident movement machinery the AI uses (§7a); what stays open is in §10. Tags as in exe_logic.md (EL):
**[V]** verified from code at the address given, **[I]** inferred (the reason is stated),
**[U]** unknown (what blocks it is stated). Addresses `ovlNN:OOOO` / `SSSS:OOOO` / `DS:OOOO`
as in EL §1; `AI[+x]` = offset x in the side's AI block (§3.1); `2c04:x` = SCN offset x.
`rnd(n,s,a)` is the dice roller ovl59:02bf (EL §2). `dist` = 0a8b:0acc (EL §9.7).

Tools and dumps (dumps are in `out/`, not tracked; regenerate with the commands):

| tool | writes | purpose |
|---|---|---|
| `tools/re/ai_callgraph.py` | `out/re/ai/{funcs.tsv,callgraph.txt,reach.txt,hooks.txt,xref_ds.tsv,xref_2c04.tsv,xref_ai.tsv,xref_far.tsv,ds_exclusive.txt}` | call graph from the AI entry points, external calls into ovl18–ovl30, per-address R/W cross references (DGROUP, SCN image, AI block, other far pointers) |
| `tools/re/ai_dump.py` | `out/re/ai/dc/ovl18..30.c`, `res_{0555,0a8b,0b62,0c8c}.c` | compacted Ghidra decompile of every function of those segments |
| `tools/re/xref.py` (existing) | `out/re/ai/rnd.txt` (filtered: `grep -E 'RND (ovl(1[89]\|2[0-9]\|30)\|0a8b\|0c8c\|0555\|0b62):'`) | every rnd() site with reconstructed (dice, sides, add) |

Tool caveats (found in the second review; check the listing before relying on these dumps):
* `funcs.tsv` / `callgraph.txt` split functions only at labelled entry points: an unlabelled
  function is merged into the preceding one, so its callees appear as the preceding function's,
  and a call into it may end a breadth-first search early. A path from these files (e.g.
  `rnd_reach_turn.txt`) is a lead, not evidence: 077b:005f "reached from 0a8b:0254" was such a
  false path (its rnd lies in the uncalled 077b:00c1).
* `rnd@` markers in `callgraph.txt` can sit on the wrong function for the same reason.
* `xref_ai.tsv` attributes every `es:[bx+off]` after a `les bx` of a far pointer to the AI
  block when the pointer was DS:40ee earlier in the function; e.g. "ovl28:0efc R +0x0c" is the
  hero table S, not AI[+0x0c].
* The Ghidra decompile names DGROUP variables by another segment base (e.g. DS:412c appears as
  DAT_451b_01cc): compare linear addresses, not the printed offsets.

## 1. Size and shape

The AI is overlays **ovl18–ovl30** (≈57 KB of code, 175 functions in the listing's function
split) plus resident helpers it shares with the human UI: 0a8b (move executor), 0b62
(square/army helpers), 0c8c (stack move mode), 0555 (cost map, distance map, path search),
ovl36 (attack and battle simulation), ovl44 (production slots). No AI function uses the
floating-point emulator (no `int 34h..3Dh` in ovl18–ovl30, 0555, 0a8b, 0b62, 0c8c) [V], so
everything decompiles; Borland switch tables (ovl25:06d4, ovl25:0c83, others) must be read
from the listing.

Overlay roles [V for the call sites, I for the names]:

| overlay | role |
|---|---|
| ovl18 | Diplomacy phase |
| ovl19 | assault phase; capture choice (occupy/pillage/sack/raze) |
| ovl20 | neutral phase; Hidden-Map helper called from production |
| ovl21 | evaluate phase; update-hide phase; AI block initialiser and card unpacking |
| ovl22 | move #1/#2, move Search, move Explore, rescue, last rescue, specials |
| ovl23 | callback from the path search 0555:0373 |
| ovl24 | clean city phase |
| ovl25 | turn driver; production, vectoring, rebuilding; memory management; hooks for rules code |
| ovl26 | quick attack phase; sage choice; post-battle and move-executor callbacks |
| ovl27 | assault XX phase; task-force maintenance called first in production |
| ovl28 | move Hero phase; move-executor callback |
| ovl29 | shared utilities (stack orders, target choice, win odds, production choice), setup tables, save/load |
| ovl30 | new-game territory call; empty round-end hook |

## 2. Entry points

### 2.1 From the computer turn [V]

`ovl68:0000` (computer side's turn, EL §6.2): … `ovl01:1ded(-1,0,0,0,0)` (quest check) at
01d9, then **`ovl25:0000`** at ovl68:01e3 (pushes 1; ovl25:0000 never reads it). After it
returns ovl68:01e9..0218 clears the selection: DS:5e3e[0..7] = 0, DS:5e62 = 0, DS:5e5e = 0,
then ovl62:0af3. (Engine: `rules/turn.py` HOOKS["ai_turn"].)

### 2.2 Calls into the AI overlays from other code [V] (`out/re/ai/hooks.txt`)

| AI function | called from | what it is | engine hook |
|---|---|---|---|
| ovl25:0000 | ovl68:01e3 | computer turn | turn `ai_turn` |
| ovl25:0519 | ovl57:0eae (Begin); ovl49:0263 in New Game ovl49:0203 (the *yes* callback of ovl49:019d, menu 500 / Alt+N; stub 307f:007f) | (re)initialise all 8 AI blocks, §4.1 | setup `ai_setup`; New Game `rules.saveload.new_game(ai_setup=)` |
| ovl25:0919(c) | ovl47:01ed (hero offer) | city for a new hero, §6.18 | heroes `ai_hero_city` |
| ovl25:09ab() | 28 far calls (ovl00 ×2 in 0db3, ovl01 ×13 in 1ded, ovl34 ×4, ovl36 ×2 in 20a8, ovl47 ×4, ovl67:06eb, 0555:08bf, 0a8b:04c8) [V grep `-> ovl25:09ab` over out/asm] | "this side is computer-controlled now", §3.3 | needed by every rules module that asks it |
| ovl25:09d7(x,y,def,att) | ovl36:02c7 (human attack), ovl36:1502 (AI attack) | battle memory, §6.19 | combat `ai_memory` |
| ovl26:0080 | ovl34:015a | sage choice | ruins `ai_sage` |
| ovl26:038d(x,y) | ovl36:16a3 (last step of the AI's real battle ovl36:124a(x, y, 1), §7a.7) | quest bookkeeping, §6.11a | new hook needed (combat, after the AI's battle) |
| ovl26:0000(c, prev) | 0a8b:0416 | early plunder of human cities, §6.11a | inside the move executor |
| ovl28:0427(x,y) | 0a8b:0064, 0a8b:0598, ovl24:023f | the selected hero (DS:5e5e) picks up items lying on the square / city (§6.2) | inside the move executor |
| ovl22:15c3(a, s) | 0a8b:01c8 | hero searches the site on arrival, quests (§6.6) | inside the move executor |
| ovl29:1771(c,x,y) | 0a8b:0331 | re-target after a move, §5.12 | inside the move executor |
| ovl23:0478 | 0555:06f7 | debug text only, prints for human sides (§6.6a) | none |
| ovl19:1864 | ovl19:0f1b, ovl26:0000, ovl26:038d | capture choice (EL §6.5); the raze branch ends with ovl29:1851, whose result 1864 returns; only 0f1b uses it (ovl19:11e3), 0000 (ax = 1 at ovl26:007a) and 038d (ovl26:049a) discard it [V] | city `ai_raze` = 1851 (§9) |
| ovl29:0000 | ovl57:02bb (scenario load) | clears city AI bytes, EL §9.1 | setup |
| ovl29:0da9 / 0dff | ovl49:0d4b (save 0a46) / ovl49:08a4 (load 0414) | write / read the AI state of a saved game (0dff then clears the path cache), §3.4 | persist (`ai.cards.load_draws` as `rules.saveload.load`'s `ai_read`) |
| ovl29:0fd5, 103d | ovl39:00cc, 025a | production choice for garrisons and Active neutrals (EL §9.5) | setup / round end |
| ovl30:0000 | ovl53:013a (new game) | territories, EL §9.5 + §4.2 | setup |
| ovl30:0034 | ovl61:182d (round end) | empty function (`push bp; mov bp,sp; pop bp; retf`) [V] | none |

## 3. State inventory

### 3.1 The AI block (one per side, 0x42c bytes) [V]

Allocation ovl25:04c5(flag): DS:0832 = 1; for p = 7..0: handle = 0d28:011f(0x42c, 0, 0),
stored as a far value at DS:40ca + 4p (fatal error 0x909 when null); if flag: ovl25:0519.
DS:0832 = 0 means "not yet allocated"; ovl25:0000, 0519, 056c, 09d7 allocate on demand.

Access: ovl25:0000 locks the current side's block (0d28:069a(DS:40ca[cur])) into the far
pointer **DS:40ee** for the whole turn and unlocks it at the end (0d28:07a9). Every AI routine
reads `AI[+x]` through DS:40ee. ovl25:056c(p) returns side p's block (the locked one if
DS:0836 is set and p == cur, else it locks p's handle into DS:40c2) and ovl25:05b9(p) unlocks
it under the same condition.

Layout. Initialiser ovl21:084d(p) (called for p = 7..0 by ovl25:0519, block locked in DS:40ee):

| offset | size | init (084d) | card / default (0d7b) | known readers / writers | meaning |
|---|---|---|---|---|---|
| +0x00 | w | 0 | – | W ovl21:0000; R ovl19:0000, ovl27:0000 | turns on which the side owned a city (§6.8) |
| +0x02 | w | – | – | W ovl21:0000; R ovl20:10a8, ovl25:0af2, ovl27:06a0, ovl29:1a4d | own intact cities (§6.8) |
| +0x04, +0x06, +0x08 | w | – | – | W ovl21:0000; R ovl20:10a8 (+6) | intact cities of other sides / neutral / not own and still unseen (§6.8) |
| +0x0a | w | – | card +0x31; default 30/20/10 | R ovl25:0af2 | rebuilding quota: `max(5, AI[+0x0a]·cities/80)` |
| +0x0c | w | 0 | default bit 0 for personalities 1, 2; then `|= 1` when card +0x0a ≠ 0 (an OR: a card with 0 keeps the default bit, 1045..104b) | R ovl18:0851 | bit 0: may attack cities of neutral (and, with no war at all, peaceful) sides (ovl18:0851) |
| +0x0e | w | – | – | W ovl28:065d; R ovl25:0af2 | number of own heroes recorded by the hero phase (≤ 6) (§6.2) |
| +0x10 | w | – | card +0x2d; default 3/6/7 | R ovl25:0af2 | army type bought when gold ≤ 2000 |
| +0x12 | w | – | card +0x2f; default 3/18/0 | R ovl25:0af2 | army type bought when gold > 2000 |
| +0x16 | w | 0 | – | W ovl25:0bd1 (+1 per purchase) | count of slots bought by rebuilding |
| +0x18,+0x1a,+0x1c,+0x1e | w | 0 | rnd(1, card +0x55/+0x59/+0x57/+0x5b, 0); defaults rnd(1,4/·/·,0) | R ovl27:0e04 | bonus added to every side's enemy score, chosen by the **current side's** level: +0x18 human, +0x1c level 0, +0x1a level 1, +0x1e level 2 (§6.1a) |
| +0x20 | w | 10 | – | R ovl29:15c5 | number of battle simulations for the win odds |
| +0x22 | w | 0 | – | W ovl22:0284 | [U] |
| +0x24 | w | 0 | – | R/W ovl22:0284, ovl24:023f, R ovl21:0000 | [U] |
| +0x26..+0x36 | 9 w | 0 | card +0x45..+0x53 (+0x26,+0x28,+0x2a,+0x2c,+0x2e,+0x34,+0x32,+0x30) and +0x5f (+0x36) | R ovl27:06a0 | task-force style odds (‰): +0x26/+0x28/+0x2a thresholds for flags 1/2/4, +0x2c multiplier of AI[+0x02], +0x2e/+0x30/+0x32/+0x34 bonus by level (human/2/1/0), +0x36 bonus when gold < 100 (§6.13) |
| +0x38 | w | – | card +0x65; default 0/0/1 | R ovl18:0000, 0a6e, ovl25:0386 | "solidarity" flag: makes peace with computers fighting humans (§6.1 step F); copied every turn to DS:40f2[cur] |
| +0x42 | w | – | card +0x61; default 0/0/1 | R ovl26:0000 | plunder captured human cities in turns < 10 (§6.11a) |
| +0x44 | w | – | card +0x63·10 + rnd(1,10,0); default 80/35/35 | R ovl18:0000 | share of all cities (%) above which a **human** side counts as the leader to gang up on (§6.1 step E; 50 for computers) |
| +0x46 | w | – | – | W ovl26:038d, ovl28:0000; R 0a8b:0254, ovl19, ovl20, ovl22, ovl26, ovl29:1885 | target city of an active occupy/raze quest (type 4/5), else −1; set each hero phase; kept out of normal target choice and not re-targeted (§6.2) |
| +0x48 | w | – | card +0x2b; default 1/0/0 | R ovl20:03aa, 06c7, 0b19, ovl26:04ba | non-zero: no quick attack (§6.11); ovl20 uses not traced |
| +0x4a | w | 0 | – | W ovl26:038d | count of quest city battles won (§6.11a) |
| +0x4c | w | 0 | – | W ovl28:17db, 1a3d | count of item hand-overs between heroes; no reader (§6.2) |
| +0x56+c | b[100] | 4 with Quick Start else 0 | – | many | **city role** (§3.2) |
| +0xba+c | b[100] | 0 | – | W ovl21:0000; R ovl24, ovl25:0c83, ovl24:0b5c | turns the city has been owned (wraps at 256) (§6.8) |
| +0x11e+c | b[100] | bit0 = Hidden Map | – | many | city flags: bit0 = unseen (set for all cities under Hidden Map by 084d, cleared by ovl21:0b95 once explored; target choices skip such cities), bit1 = has a flying-type slot (ovl21:09cf) / bought one (ovl29:11d5), bits 3/6/7 = reserved as source for the medium / flyer / fast task force (ovl21:01b3), bit2 = processed by clean city this turn (set ovl24:023f, cleared ovl25:0386), bit4 = holds a w13 type, bit5 = holds a hero (ovl24:023f) |
| +0x182+c, +0x1e6+c | b[100] each | – | – | W ovl24:023f; R ovl26, ovl28 | armies in city c this turn; keepers on square 0 (§6.9) |
| +0x24a | w | – | card +0x08; default 1/2/4 | R ovl19, ovl21, ovl25:085f, ovl27 | number of task forces used |
| +0x24c + 0x5c·k | 4 × 0x5c | +0 word = 0 | – | ovl19, ovl27 (writers), ovl25:085f, ovl18 | **task force** k, layout §6.13 |
| +0x3bc..+0x41c | 7 × w[8] | 0 | – | W ovl25:09d7; R ovl18:0000, ovl27:0e04, ovl20 | battle memory per opponent, §6.19 |

AI[+0x3a] min member strength 1..4, +0x3c/+0x3e/+0x40 flyer / fast / medium source-city counts (ovl21:01b3, §6.8). Ranges +0x14, +0x3a..+0x40 and +0x4e..+0x55 are not initialised by 084d
[V]; the block is not zeroed on allocation: 0d28:011f (handle allocator: free-handle search,
0d28:0244 → 053c / 02cf / 05c8 / 0a84, header writes) has no store into the block; only the
calloc-style 0d28:027c clears (rep stosb at 02af), and ovl25:04c5 does not use it [V 0d28 listing].
So these fields hold whatever the heap held at the first Begin (and are saved so). +0x3a..+0x40 are
zeroed by ovl21:01b3 at 01ec..01fa before any read [V]; no AI read of +0x14 or +0x4e..+0x55 was
found [I: grep of the DS:40ee accesses in ovl18..ovl29].

### 3.2 City role byte AI[+0x56+c]

The writers and the conditions are [V] at the addresses given; the names are [I] from those
conditions and from what production (§6.16) builds for each role.

| value | set by (condition) | production kind (§6.16) | name [I] |
|---|---|---|---|
| 0 | ovl21:0000 (razed or not own) | – | none |
| 1 | ovl21:0000 (own, was 0), turned into 3/5 in the same call; 0a8b:0254 after taking a neutral city (§7a.6), turned into 3 by the next neutral pass (§6.10) | – | new |
| 2 | ovl20:00b5 (03aa found nothing visible to take: explorers sent), ovl20:02ff (all neutral neighbours unseen) | 4 (flyers; buys a flying slot first) | explore |
| 3 | ovl21:0000 / ovl20:00b5 (has a takeable neutral neighbour), ovl21:0c1c (2 → 3) | 2 with Neutral Cities on, else 1 | expand |
| 4 | ovl20:00b5 (no neutral neighbour left), ovl24:023f (< 2 armies), ovl25:0386 (11/13 early), 084d (Quick Start) | 2 | build up |
| 5 | ovl21:0000 (no neutral neighbour), ovl24:023f (armies < wanted, §6.9), ovl25:0bd1 (after a purchase) | 3 | interior |
| 6 | ovl27:0b72 (task-force source) | 3 | TF source |
| 7 | ovl27:0000, ovl19:134c, ovl25:085f (task-force staging city) | 3 | TF staging |
| 8 | ovl24:023f (armies ≥ wanted), ovl19:066d / 0000 (TF ended), ovl25:0386, ovl25:0c83, ovl27:0aed (6 → 8) | none: turns left set to 0 | full / defended |
| 11 | ovl21:0000 (8, unseen cities left, flying slot, AI[+0x24] < 5), ovl25:0386 (Quick Start + Hidden Map, turn 2) | 4 | flyer producer |
| 13 | ovl25:0386 (Quick Start + Hidden Map, turn 1), ovl22:10e3 at 1194 (a hero but no flyer waits in the city, §6.6) | 4 (buys a flying slot) | flyer wanted for a hero |
| 14 | ovl25:0c83 (8 without a decent unit) | 3 | rebuild candidate |

### 3.3 DGROUP words [V]

| address | meaning | writers | readers |
|---|---|---|---|
| DS:0832 | AI blocks allocated | ovl25:04c5 | ovl25:0000, 0519, 056c, 09d7 |
| DS:0834 | neighbour table allocated | ovl25:05e6 | ovl25:05e6 |
| DS:0836 | AI turn in progress | ovl25:0000 (1 at 0071, 0 at 0354) | ovl25:056c, 05b9, 05e6, 063d, 09ab |
| DS:40ca + 4p | far handle of side p's AI block | ovl25:04c5 | ovl25 |
| DS:40ee | far pointer to the current side's AI block (locked) | ovl25:0000, 0519 | all AI code, 0a8b |
| DS:40c2 | far pointer to another side's block (ovl25:056c) | ovl25:056c | callers of 056c |
| DS:40c6 | far handle of the neighbour table (0x4b0 bytes) | ovl25:05e6 | ovl25:05e6, 063d |
| DS:40ea | far pointer to the locked neighbour table | ovl25:05e6 | ovl25:0656, ovl29:0398, 0da9/0dff, ovl20:01f6 |
| DS:40f2 + 2p | copy of AI[+0x38] of side p (written at each of p's turns) | ovl25:0386 | ovl18:0000, 0a6e |
| DS:410a | far pointer returned by the last battle simulation | ovl29:15c5 | – |
| DS:408e | enemy chosen this turn (ovl27:0e04) | ovl18:0000 | ovl18:0000 |
| DS:4090[p], 40a0[p], 40b0[p] | territory conflicts with p, cities of p, cities of p without flag bit 0 (§6.1) | ovl18:0000 | ovl18:0000 |
| DS:4102 | far pointer to ovl27's 600-byte graph-distance table (§6.13) | ovl27:01bb | ovl27 |
| DS:0932, 0940, 094c | role lists {5,8,6,4,14,7}, {5,8,6,4,14}, {5,8,6,4,14} (−1 terminated) | – | ovl26:04ba, ovl27:01bb |
| DS:40c0, DS:07c6 | source city and last target of the neutral chain (§6.10) | ovl20:06c7 | ovl20:06c7 |
| DS:0814/081c, 0824 | city square offsets; garrison quota by army count (§6.9) | – | ovl24 |
| DS:07c8, 07d8, 07f6, 0800, 080a, 0958 | used only by one AI overlay each (ds_exclusive.txt) | | [U] (ovl21, ovl23, ovl28) |
| DS:0a10/0a1e/0a2c | production-choice weight tables, EL §9.5 | – | ovl29:103d |

Shared with the human UI and rules: selection DS:5e62 / 5e3e[8] / 5dfe / 5e00 / 2bda / 5e5e
(EL §4.5), DS:5dfa/5dfc (stack move mode and mask stored by 0c8c:0529, passed to the
distance map by ovl29:1771, 1851), income DS:5dca, upkeep DS:5dda, city counts DS:5dea, battle
arrays DS:4224/422c/42c4/42c5/42c6/42e6 (EL §3.5, §7).

`ovl25:09ab()` = `2c04:0d0[cur] == 1 or DS:0836 != 0` [V]: the rules code asks this
everywhere it behaves differently for the computer.

### 3.4 Lifetime and saving [V]

* The AI blocks and the neighbour table persist for the whole game and are **saved** [V]:
  ovl29:0da9(file) (called from the save ovl49:0a46 at 0d4b) writes the 8 blocks (0x42c bytes
  each, p = 0..7) and then the 0x4b0-byte neighbour table with 070b:004e (ah = 40h, write);
  ovl29:0dff(file) (called from the load ovl49:0414 at 08a4) reads them back in the same order
  with 070b:006d (ah = 3Fh, read) and then calls 0555:0350, the path-cache clear.  (res_070b:
  0006 open / create, 003a close, 004e write, 006d read, 00a9 lseek.)  **The path cache is
  cleared by the load, not by the save.**  (Before M10b this section had the two directions
  swapped.)
* ovl49:0203 is New Game: stub 307f:007f -> 0203, pushed by ovl49:019d (menu 500, Alt+N 0x131)
  as the *yes* callback of its confirmation ovl56:0088 [V].  It frees all 1000 army records
  (0b62:03be), runs ovl62:0000, ovl64:1927 / 1931, ovl65:01ff, ovl64:113b, sets DS:2a86 =
  DS:166a = 0, ovl62:0af3, shows the Game Start screen ovl60:0000(1) (its talking face
  ovl58:026f(2) rolls rnd(1, 30, 10) when the advisor talks; with DS:26c8 != 0 it returns at
  once, ovl58:0293..029a) and then calls **ovl25:0519 on the abandoned game's SCN**:
  all eight blocks re-initialised with their rnd draws (§4.1), DS:0832 set; a following Begin
  reuses those heap blocks (and the other run words, EL §10.7), a following load draws nothing
  more (`rules.saveload.new_game`).
  Earlier versions of this document called 0203 uncalled dead code; that was wrong.
* A loaded game keeps the saved AI blocks: the load ovl49:0414 reads them with ovl29:0dff and
  nothing re-initialises them afterwards [V]. **But** when the blocks are not yet allocated
  (DS:0832 == 0, i.e. a game loaded before any Begin, New Game or load in this run of the
  program), the first ovl25:056c(p) of 0dff (ovl29:0e0f) calls ovl25:04c5(1)
  (ovl25:057a..057d), which allocates all eight blocks and runs ovl25:0519 → ovl21:084d / 0d7b
  for p = 7..0 — with their rnd() draws (§4.1, §8) — before the file data overwrites the
  blocks [V ovl25:04c5..0516, 0573..0580]. The SCN image (2c04:0000, 0x2ee1 bytes) has already
  been read at ovl49:063c, before 0dff (ovl49:08a4, called only when the load's `game` flag
  [bp+8] is set), so the number of draws per side follows the **loaded** game's 0x0d0 / 0x0c0
  / 0x137 (and the computers' cards), and the fight-order rows 0d7b copies from the cards stay
  in the loaded SCN [V]. A reimplementation that loads a saved game must therefore consume
  those draws when its own "blocks allocated" flag is 0, or the RNG stream differs from the
  original after such a load (`ai.cards.load_draws`).  The overview rebuild ovl63:232b (256
  rnd(1, 3, 1)), when the load runs it, comes after these draws (ovl49:08fe).
* The path cache of the path search (20 slots × 0xd6 bytes at DS:3f7e, §7a.0/§7a.3) is keyed only
  by target, mode and mask, survives across turns and sides, and is cleared only at allocation and
  by the game load (0555:0350 at the end of ovl29:0dff, ovl49:0414) [V]: a reimplementation must
  keep it to reproduce the original's paths.
* SCN fields the AI owns: city +0x2f (claim/territory, EL §9.5; read by ovl29:0a27), city
  +0x2c..+0x40 cleared at scenario load (ovl29:0000). They are in the SCN image and saved
  with it.

## 4. Set-up

### 4.1 AI blocks at Begin and load, ovl25:0519 → ovl21:084d → ovl21:0d7b [V]

```
ovl25:0519: if not DS:0832: ovl25:04c5(0)
for p in 7..0: DS:40ee = lock(DS:40ca[p]); ovl21:084d(p); unlock
ovl21:084d(p):
    words +0x4a, +0x00, +0x22, +0x24, +0x0c, +0x16..+0x1e, +0x4c, +0x26..+0x36 = 0; +0x20 = 10
    for c in count..1 (indices count-1..0):  +0x56+c = 4 if QuickStart else 0; +0xba+c = 0;
        +0x11e+c = 0, then |= 1 if HiddenMap
    personality = level (0x0c0[p]) if computer (0x0d0[p] != 0) and level in {0, 1}, else 2
    ovl21:0d7b(personality, p)
    for k in 3..0: task force k word +0 = 0
    for i in 7..0: battle-memory words +0x3bc..+0x41c [i] = 0   (all seven rows; +0x41c at ovl21:09a3)
```
ovl21:0d7b defaults (personality 0 / 1 / 2) and the card overrides are EL §6.8, re-checked
here: defaults draw rnd(1,4,0)×3 (0: +0x18, +0x1e, +0x1a), (1: +0x18, +0x1e, rnd(1,8,0) +0x1c),
(2: rnd(1,10,0) +0x18, rnd(1,8,0) +0x1a, rnd(1,6,0) +0x1c); then, **only if alive and
0x0d0[p] == 1**, the card is read (ovl48:006a into a 0x67-byte buffer) and draws
rnd(1,card+0x55,0)→+0x18, rnd(1,card+0x59,0)→+0x1a, rnd(1,card+0x57,0)→+0x1c,
rnd(1,card+0x5b,0)→+0x1e, then rnd(1,10,0) for +0x44, and copies the 29-byte fight order to
2c04:060b+29p. Humans get personality 2 and no card. rnd order per side: 3 default draws,
then (computers) 5 card draws; sides in order 7..0.

Card bytes not read by any code: +0x00..+0x07, +0x0c, +0x33..+0x44 (EL §6.8) [V].

### 4.2 Neighbour table, ovl29:0398 (called by ovl29:010b at new game) [V]

```
NB[c*6+i] = 0xff, NB[600+c*6+i] = 0 for all c < 100, i < 6
save 0x110; 0x110 = 0; 0555:0d9e(0, 1)            # cost map for side 0, land
for c in 0..count-1:
    progress bar ovl61:1463(5·(20c/count)) when 20c/count changes
    owner(c) and the owner nibble of its 4 squares := 0 (temporarily)
    0555:1ab9(45, c.x, c.y, mode 1, mask 0)        # distance map from c, limit 45
    if ovl29:0749(c, &NB[c*6], &NB[600+c*6]) == 0:
        0555:1ab9(60, c.x, c.y, 1, 0); ovl29:0749(...)   # nothing reachable: limit 60
    restore owner(c) and the 4 nibbles
ovl61:1463(100); restore 0x110
```
ovl29:0749(c, ids, dists): with the distance table locked (0555:1b0a):
```
cand_id[0..49] = 0xff; cand_d[0..49] = 0; n = 0
for d in count-1..0, d != c:
    dd = ovl21:0a85(d, &x, &y, table, 0)          # distance of city d in the map, cap 100
    if x == -1: continue                           # unreachable
    n += 1
    slot = -1; worst = dd
    for s in 0..49: if cand_id[s] == 0xff: slot = s; break
                    if cand_d[s] > worst: slot = s; worst = cand_d[s]   # unsigned bytes
    if slot != -1 and (cand_id[slot] == 0xff or cand_d[slot] > dd):
        cand_id[slot] = d; cand_d[slot] = dd (low byte)
W = E = N = S = 0
for k in 0..5:
    best = 10000; pick = -1
    for s in 49..0 with cand_id[s] != 0xff:
        v = cand_d[s]; t = cand_id[s]
        if (t.x < c.x and W > 2) or (t.x > c.x and E > 2) or (t.y < c.y and N > 2) or (t.y > c.y and S > 2): v += 50
        if v < best: best, pick = v, s             # strict: highest slot wins ties
    if pick == -1: break
    ids[k] = cand_id[pick]; dists[k] = cand_d[pick]
    W += t.x < c.x; E += t.x > c.x; N += t.y < c.y; S += t.y > c.y
    cand_id[pick] = 0xff
0555:1b2e; return n
```
Query ovl25:0656(c, d, ids_out, dists_out): returns 1 if d is one of c's six entries; copies
the six ids / distances when the pointers are non-null. The test compares the id **byte**
(zero-extended) with the word d (0676..067b), so d = 255 matches an empty entry (0xff) and
d = −1 never does [V].

The temporary owner of city c is SCN 0x110, which 0398 has set to 0 (045d, 0499..0565); the
restore (062b..071b) writes the saved owner byte back and sets the four owner nibbles to
**owner & 0xf**, whatever they held before [V]. 0749 writes only its picks: entries after the
last pick keep 0398's 0xff / 0 [V 094e..0a0f].

### 4.3 Territories, ovl30:0000 → ovl29:010b; garrisons [V]

EL §9.5 (claim byte +0x2f, rnd(1,100,0) when there is no computer, rnd(1,10,-1) per claimed
city). ovl30:0000 then sets infamy 0 and 2c04:10f3[p] = -1. Garrisons use ovl29:103d (EL §9.5).

## 5. Shared utilities (ovl29) [V unless noted]

5.1 **0a27(x, y, claim)**: nearest intact city (terrain 10 at its corner) with +0x2f == claim;
scan count-1..0, `dist < best` (best starts 1000): highest index wins ties.

5.2 **0ae7(list[8], kind, idx, flags)** — give a stack an order:
```
row = 0b62:0024(cur)                              # fight-order row of the side
n = #list entries != -1; if n == 0: return 0
gid = 0b62:0cde() if n > 1 else 0
for i in 0..7 with army a = list[i]:
    DS:5e3e[i] = &a (null for -1)
    if row[a.type] > best (signed, starts -1): best = it; DS:5e62 = &a     # first wins ties
    if kind != -1:
        a.+0xe = (a.+0xe & 0xf0) | kind; a.+0xf = (a.+0xf & 1) | idx << 1; a.+0x11 = gid
        0c7e(&a, kind, idx)
    a.flags &= ~0xa0; a.flags |= flags
0c8c:0529()                                       # stack move mode (EL §4.2)
return 1
```
DS:5e62 keeps its previous value when no entry's row byte beats −1 (every byte ≥ 0x80) [V
0b9d..0bd3]; DS:5e3e[i] is null for each −1 entry, so a list with a −1 before a live entry
leaves a hole in DS:5e3e (kept in place by the engine, `Selection.moving`; Changelog "Selection
holes").
5.3 **0c7e(army, kind, idx)** goto point: kind 4 → unchanged; kind 1 (city idx): own city →
(x+1, y+1); other → (x, y) moved one step toward the army by 0d88 (each coordinate +1 when
below the army's); kind 2 → item idx position (2c04:0d02/0d04 + 0x1d·idx); kind 3 → site idx
(0811/0813 + 0x1f·idx); other kinds → −1; a −1 coordinate becomes the army's own. Stored in
+0x12/+0x14.

5.4 **0e5a(c, type, vec, dest)**: s = ovl44:0000(c, type) (slot of type, 0 if none); refuse
(return 0) if `cost[s] + 30 > gold[cur]` **and** `max(turn,1) > 5` (ovl61:225b); else
+0x2c = type, +0x2d = time[s]; vec == 0 → +0x31 = 0, else 0f10(c, dest); return 1.

5.5 **0f10(c, dest)**: if 0fd5(c) == 0 → vectoring off (+0x31 = 0, +0x33/+0x35 = −1); else
+0x31 = 1 and target = dest's (x, y), or (−2, −2) when the **source** index c ≥ 100
(the test at ovl29:0f5b is `cmp si, 0x64` with si = c, not dest; never true for a city) [V].

5.6 **0fd5(c)**: 1 if +0x2d ≠ 0 and +0x2d ≠ time of the current type's slot (production
started and partly done), else 0.

5.7 **103d(c, kind, vec, dry)**: EL §9.5. When `dry` == 0: no pick → return 0; else
0e5a(c, pick, vec != −1, vec) and return 1. When `dry` ≠ 0 it returns the picked type
(−1 none) without setting anything.

5.8 **11d5(c)** buy a flying slot: s = 1ae9(c) (weakest slot); ovl44:1128 (open ARMYTYPE);
for t in 0..28 with flies(t) (DS:45c4+6t) and not w13 (DS:45c8+6t): r = ovl44:138f(t, …) = index
of the production record DS:447c + 0x3e·r whose word +0 == t, price = that record's word +0x1e
(an output argument of 138f) [V ovl44:138f..142b]; (a loop over c's four slots compares their
types with t and discards the result: no effect, 1214..1232);
if price + 30 ≤ gold (signed): ovl44:1299(c, s, r) (fills the slot, gold −= price, defence recomputed),
AI[+0x11e+c] |= 2, +0x2d = 0, +0x31 = 0; stop. An unaffordable type moves on to the next t.
ovl44:11e2 at the end. [V] When 1ae9 returns −1 (all four slots at effective strength ≥ 10),
1299 writes the "slot −1" bytes +0x15 (owner), +0x19, +0x1d, +0x21, +0x25 [V ovl44:12b6..1347,
no range test]; the engine refuses that case. ovl44:138f leaves its outputs unwritten when no
record has word +0 == t (returns 29); with ARMYTYPE's ids 0..28 that does not happen.

5.9 **1ae9(c)** slot to replace: scan s = 0..3; the first empty slot (type 0xff) is returned
at once; otherwise the slot with the lowest effective strength (strength + 2 when w15 == 1),
strict `<` starting from 10, so the first wins ties; −1 if every slot is ≥ 10 [V ovl29:1af4..1b6b].

5.10 **12c9(x, y, out, minmoves)** / **13b2(x, y, out, kind, idx, minmax)**: up to 8 own armies
on (x, y), table scanned 0x181-1..0; 12c9 requires moves left (+7) ≥ minmoves when ≠ 0; 13b2
13b2(x, y, out, sub, kind, minallow) requires (+0xe & 0x70) >> 4 == sub (the TF group),
(+0xe & 0x0f) == kind, and allowance +6 ≥ minallow when ≠ 0 [V, ovl28 and ovl19 call sites]; both select the result (14d3) and copy it.

5.11 **14d3(list)** selection: DS:2bda = 0, count DS:5dfe, min moves DS:5e00 (from 100);
count 1: DS:5e3e[0] = list[0]; count > 1: DS:5e3e[i] for every entry and 2bda = 1;
DS:5e62 = DS:5e3e[0].

5.12 **15c5(x, y)** win odds [V ovl29:15c5..1625]:
```
n = AI[+0x20] if AI[+0x20] >= 1 (signed) else 1          # always 10: only 084d writes +0x20
wins = 0
repeat n times: r = ovl36:124a(x, y, 0); DS:410a = r (far, no reader)
                if r[+2] (= DS:412e, defender survivors) == 0: wins += 1
return wins·100 idiv n                                    # signed, truncating
```
124a(x, y, 0) [V ovl36:124a..1376]: DS:415e/415c = x, y; set-up ovl38:008b(x, y) for the
**current selection** against the square; then DS:412c = defenders (DS:42c5), DS:4130 =
attackers (DS:42c4), battle loop ovl36:08a6, DS:412e / DS:4132 = surviving defenders / attackers
(DS:422c[i] / DS:4224[i] ≠ 0); returns the far pointer DS:412c. No casualties, no movement, no
battle memory, no treachery, no medals, no quest check (all of those are mode 1 only, §7a.7).
* The attackers are DS:5e3e[0..DS:5dfe−1] when DS:2bda ≠ 0, else DS:5e62 alone [V
  ovl38:0293..02ea]; so each caller's selection decides what is simulated (§7).
* **Dice:** each simulation draws the battle dice of 08a6 (EL §3.4: pairs of rnd(1, die, 0)
  until each duel ends) — except when either side is empty: 08a6 ends at once when the attacker
  or the defender count is 0 (ovl36:08c4..08e1) and draws nothing [V]. So a target square
  without defenders (an ungarrisoned city, an empty square) costs **0 draws** and returns 100.
* The set-up and the loop overwrite the battle arrays DS:4224..42e6 and the battle log
  (DS:41b2..41b5), as every set-up does (EL §3.5); these leftovers are read later (§7).

5.13 **1771(c, x, y)** (from the move executor 0a8b:0254) and **1885(x, y, flag)** target choice:
```
1771: p = 15c5(x, y); o = owner(c)
      ok = (o == 0xf) or relation[o][cur] == war
      if o != 0xf and o is human: if rnd(1,4,-1) == 0: ok = 1
      if ok and p > 50: return c
      0555:1ab9(15, leader.x, leader.y, DS:5dfc, DS:5dfa)
      r = 1885(x, y, ok); return c if r == -1 else r
1885: lock distance table; best = -1; pick = -1
      for c in count-1..0:
          skip if flag and owner(c) == cur; skip unless terrain(c) == 10
          skip if c == AI[+0x46] or AI[+0x11e+c] & 1
          skip if owner(c) not in (0xf, cur) and relation[owner][cur] != war
          d = ovl21:0a85(c, ...); skip if unreachable
          if owner(c) == cur: p = 15; d += 20  else p = 15c5(c.x, c.y)
          if p > 50 and d < DS:5e00: s = 400 - d + 10p
          elif p > 10:               s = 100 - d + 5p
          else:                      s = -2
          if s > best: best, pick = s, c        # strict: highest index wins ties
      unlock; return pick
```
[V ovl29:1771..1850, 1885..1a4c] Exact points:
* 1771 draws 15c5 first, then reads the leader's square; "human" is `0x0d0[o] == 0` (not
  ovl25:09ab), and the rnd(1,4,−1) is drawn whenever `o != 0xf` and o is human, **also when ok is
  already 1** (a human side at war) [V 17de..1808]. `p > 50` is signed (`jle 0x32`).
* 1885's own x, y parameters are never read: their stack slots are passed to ovl21:0a85 as the
  `&x, &y` outputs (1998..19a3) and `x == -1` is the "unreachable" test. The candidate tests
  run in the order shown; 15c5 is drawn only for a reachable foreign candidate. `d < DS:5e00`
  is signed; s = −2 never beats the start value −1, so a candidate with p ≤ 10 is never chosen.
* No intact test on the owner side: a city counts when terrain(corner) == 10 (intact) [V 190d].
5.14 **1851()** (after razing, end of ovl19:1864; engine hook `ai_raze`): distance map
0555:1ab9(15, leader.x, leader.y, DS:5dfc, DS:5dfa) from the leader DS:5e62 with the stack's
mode and mask, then `return 1885(leader.x, leader.y, 1)` — the decompile shows no return value,
but ax from 1885 passes through unchanged (ovl29:187b..1884), and ovl19:0f1b attacks the
returned city next [V]. 1885 draws a 15c5 per reachable candidate (§5.13), so the hook must run
in full on every AI raze, whichever caller uses the result (§9).

5.15 **1626(x, y, &n, &str, &heroes)**, **16ae(x, y)** (any of the 3×3 squares has road-layer
bit 0x20 [I segment]), **170c** (centres the view and shows the move only for a human side),
**1a4d(c, &slot)** (production pick of kind 3 dry-run; ok unless AI[+0x02] ≥ 12 and its
strength ≤ 2, or AI[+0x02] ≥ 8 and ≤ 1; "strength" = the slot's strength + 2 when
DS:45c9[6·type] (w15) == 1, the same effective strength as §6.8 `eff` and 1ae9).

## 6. The computer turn, ovl25:0000 [V]

```
if not DS:0832: ovl25:04c5(1)
relation[cur][cur] bits 0-3 := 0
ovl68:0952(0, 0)                    # shield strip
ovl25:05e6()                        # lock neighbour table
DS:0836 = 1; DS:40ee = lock(AI block of cur)
debug print (ovl25:0dc9 is an empty function: all phase-name strings go nowhere)
ovl25:0386()                        # §6.0 pre-turn refresh
progress 10; Diplomacy ovl18:0000
move Hero ovl28:0000; progress 15
move Search: if no Shift held (BIOS 0000:0417 & 3 == 0) and 0x0d0[cur] == 0: 0x0d0[cur] = 1 (restored after)
             if HiddenMap: ovl22:0284
progress 20; move Explore ovl22:0458; progress 25
assault ovl19:0000; progress 30
move #1 ovl22:0000; progress 40
rescue ovl22:0888; progress 45
evaluate ovl21:0000(cur); progress 50
clean city ovl24:01f1; progress 55
neutral ovl20:0000; progress 60
move #2 ovl22:0000; progress 65
quick attack ovl26:04ba
update hide: if HiddenMap: ovl21:0c1c
assault XX ovl27:0000; progress 70
specials ovl22:10e3; progress 75
rebuilding ovl25:0af2; progress 80
last rescue ovl22:0b4d; progress 85
production ovl25:06d4; progress 90
vectoring ovl25:085f; progress 95
0a4c:0348; progress 100
DS:0836 = 0; ovl25:063d (unlock table); unlock AI block
ovl00:1063                          # refused de-escalation penalty (EL §6.6)
ovl25:045e: if Alt or Shift held (0000:0417 & 8, or & 3): ovl33:0000(0) at 0479 (Settings, rules.md §9.7)
```
"progress n" = ovl61:131b(n). The 0x0d0 flip only matters for a human side, which never
runs ovl25:0000 from ovl68:0000 [I]; it is reproduced as coded.

### 6.0 Pre-turn refresh, ovl25:0386 [V]
```
DS:40f2[cur] = AI[+0x38]
for c in count-1..0 owned by cur:
    if role[c] in (13, 11): role[c] = 4 if max(turn,1) < 5 else 8
    if QuickStart and HiddenMap:
        if max(turn,1) == 1: role[c] = 13
        elif max(turn,1) < 3: role[c] = 11
    AI[+0x11e+c] &= ~4
```

### 6.1 Diplomacy, ovl18:0000 [V] (listing ovl18:0000..0850)

`prop(a,b)` = bits 2-3 of relation byte 2c04:153b[8a+b] (a's proposal to b), `cur_rel(a,b)` =
bits 0-1. Setting a proposal writes `byte & 0xf3 | v << 2`. Values 0 peace, 1 neutral, 2 war
(EL §6.6). The resolution of the proposals is rules code (ovl00:0db3 at the next turn start
of each side, ovl00:1063 at the end of this turn, EL §6.6).

```
human = 0x0d0[cur] == 0                         # the phase also runs for a human side's block
ovl18:0917()                                    # claim one city, below; runs even without Diplomacy
if Diplomacy (0x11c) == 0: return
enemy = ovl27:0e04(0)  -> DS:408e               # §6.1a; draws 8 × rnd(1,10,0)
for p in 7..0:
    prop(cur,p) = 0                              # every proposal restarts at peace
    DS:4090[p] = DS:40a0[p] = DS:40b0[p] = 0
    peace_in[p] = prop(p,cur) == 0; war_in[p] = prop(p,cur) == 2
total = 0
for c in count-1..0:
    if terrain(c) == 10: total += 1
    o = owner(c); if o == 0xf: continue
    DS:40a0[o] += 1                              # cities per side
    if not AI[+0x11e+c] & 1: DS:40b0[o] += 1     # cities per side not flagged bit 0
    if o == cur: if claim(c) != 0xf: DS:4090[claim(c)] += 1     # my cities in p's territory
    elif claim(c) == cur: DS:4090[o] += 1                      # p's cities in my territory
for p in 7..0, p != cur, alive:                   # step A: territory conflict
    t = 2·(peace_in[p] - war_in[p])
    if DS:4090[p] >= t + 4: prop(cur,p) = 1
    elif DS:4090[p] >= t + 8: prop(cur,p) = 2     # unreachable as coded (ovl18:02a1)
for p in 7..0, p != cur, alive:                   # step B: battle memory (this side's block, §6.19)
    m = mem3ec[p] + 4·mem40c[p] + 2·mem3bc[p]
    t = 2·(peace_in[p] - war_in[p])
    if m >= t + 5: prop(cur,p) = max(prop(cur,p), 1)
    elif m >= t + 10: prop(cur,p) = 2             # unreachable as coded (ovl18:03b7)
if enemy != -1: prop(cur,enemy) = 2               # step C
for k in 3..0: if task force k active (+0x24c): prop(cur, TF[k].+0x24e) = 2    # step D (+0x24e = target side)
best = 0; leader = -1                             # step E: a side holding a large share
for p in 7..0 alive (cur included):
    share = DS:40a0[p]·100 / max(total,1)
    thr = AI[+0x44] if p is human else 50
    if DS:40a0[p] > best and share > thr: best, leader = DS:40a0[p], p
if leader != -1 and leader != cur:
    for p in 7..0 alive: prop(cur,p) = 2 if p == leader or p == enemy else 0
if not human and AI[+0x38] != 0:                  # step F (card +0x65)
    for p in 7..0, alive, 0x0d0[p] != 0, p != cur, prop(cur,p) != 0:   # 057c..05f4
        if ovl18:0a6e(p): prop(cur,p) = 0
    if some h in 7..0, alive, 0x0d0[h] != 1, has cur_rel(cur,h) == 2:    # 05fb..0646 (h = cur allowed)
        for p in 7..0, alive, 0x0d0[p] == 1, DS:40f2[p] != 0:          # 0651..069d, no p != cur test:
            prop(cur,p) = 0                                             #   prop(cur,cur) is cleared too
if not human and 2c04:0116 != 0:                  # step G ("I am the Greatest", EL X29)
    vs_human[s] = 1 for each alive computer s with cur_rel(s,h) == 2 for some alive non-computer h
    for p in 7..0 alive computer: if vs_human[cur] or vs_human[p]: prop(cur,p) = 0
for p in 7..0: if DS:40b0[p] == 0: prop(cur,p) = 0       # step H (also dead sides)
for k in 3..0: if TF k active and prop(cur, TF[k].+0x24e) == 0: ovl19:066d(k, 20)   # step I
```
`ovl18:0a6e(p)` = 1 iff Diplomacy, AI[+0x38] ≠ 0, cur is a computer, and some alive human h
has `cur_rel(p,h) == 2` and `DS:40f2[h] != 0`. DS:40f2[x] is written only at x's computer
turns (ovl25:0386), so for a side that has always been human it keeps its start value [I: 0,
DGROUP BSS]; then 0a6e is 0.

`ovl18:0917()` claim: c0 = ovl62:044a(player rec +0x0e/+0x10 of cur, i.e. the capital
position); for c in count-1..0 with terrain 10, claim(c) ≠ cur and (claim(c) == 0xf or the
claiming side is dead): d = dist(c, c0); keep the smallest d with d < 40 (strict <, start
10000: highest index on ties); set claim(best) = cur. One city per turn. [V] (c0 = −1 when no
city stands on the capital square; then the city record −1 is read, which lies inside the
relation matrix and is therefore deterministic: record −1 = 2c04:157d − 0x41 = 2c04:153c, so its
x = word 2c04:153c (relation bytes [0][1], [0][2]), y = word 2c04:153e ([0][3], [0][4]) and its
owner byte +0x15 = 2c04:1551 = relation byte [2][6] (2c04:153b + 8·2 + 6) [V address arithmetic].
A reimplementation must read these exact relation bytes, not treat −1 as "no capital".)

`ovl18:0851(c)` attack permission (callers ovl20:10a8, ovl22:05ff): owner 0xf → 1; else
with n = number of alive sides s with `cur_rel(cur,s) == 2` and `r = cur_rel(cur, owner)`:
r == 2 → 1; r == 1 → AI[+0x0c] & 1; r == 0 → (n == 0 or (n == 1 and that side is the owner))
and AI[+0x0c] & 1; r == 3 → 0. [V] (the "n == 1 and owner" case cannot happen at peace.)

### 6.1a Enemy choice, ovl27:0e04(arg unused) [V] (callers ovl18:0000, ovl27:0000)
```
cap = ovl62:044a(capital of cur); inf = infamy[cur]
for p in 7..0: arrays below = 0; r10[p] = rnd(1,10,0)            # 8 draws, p = 7..0
for c in count-1..0 with owner(c) != 0xf:
    cities[owner] += 1; if not AI[+0x11e+c] & 1: seen[owner] += 1
    if owner == cur:
        if claim(c) != 0xf: mine_in[claim(c)] += 1
        for each of c's six neighbours n (ovl25:0656) != 0xff:
            if owner(n) != cur and claim(n) == cur: border[cur] += 1   # index is cur (as coded)
ntf = 0; for k in AI[+0x24a]-1..0: if TF k active: tf_on[TF[k].+0x24e] += 1; ntf += 1
if owner(cap) not in (0xf, cur): score[owner(cap)] += 20
others = 0
for p in 7..0 with cities[p] != 0:
    if p != cur: others += 1
    if owner(ovl62:044a(capital of p)) == cur: took_cap[p] = 1
lvl = AI[+0x18] if cur is human else AI[+0x1e] (level 2) / AI[+0x1a] (level 1) / AI[+0x1c] (level 0) / 0
for p in 7..0:
    score[p] += r10[p] + 15·took_cap[p] + 4·mine_in[p] + 6·border[p]
              + 4·mem3bc[p] + mem3cc[p] + mem3dc[p] + 2·(mem3ec[p] + mem3fc[p] + mem40c[p])
              + lvl + |inf - infamy[p]| / 8 + |cities[cur] - cities[p]| / 4     # idiv, truncating
any_war = some alive p != cur with prop(cur,p) == 2           # the proposals as they stand
if 2c04:0116 and cur is computer: score[p] = 0 for alive computers p with vs[cur] or vs[p] (as §6.1 step G)
for p in 7..0:
    if ovl18:0a6e(p): score[p] = 0
    if any_war and prop(cur,p) == 0: score[p] = 0
    if ntf == 0 and seen[p] == 0: score[p] = 0
    if max(turn,1) < (4 if QuickStart else 8) and mem3dc[p] + mem3fc[p] == 0: score[p] = 0
    if others > 1 and cities[p]/4 < tf_on[p]: score[p] = 0
score[cur] = 0
enemy = -1; best = 0
for p in 7..0 with cities[p] != 0: if score[p] > best: best, enemy = score[p], p   # strict
if owner(cap) not in (0xf, cur):
    hit = any k in AI[+0x24a]-1..0 with tf_on[k] == owner(cap)    # compares with the count array indexed by k (as coded)
    if not hit: enemy = owner(cap)
if enemy != -1 and seen[enemy] == 0: enemy = -1
return enemy
```
`mem3bc[p]` etc. = this side's battle memory words AI[+0x3bc + 2p] … (§6.19): 3bc defender
heroes killed by p, 3cc defenders killed by p, 3dc battles p fought against us, 3ec battles
where p wiped us out, 3fc battles p fought at our cities, 40c city battles we lost to p.

### 6.2 move Hero, ovl28:0000 (and the hooks ovl28:0427, 17db) [V]

Traced from the listing (the ovl28 decompile is unusable). Conventions of this subsection:

Source of every [V]: the capstone listing out/asm/ovl28.asm (addresses = ovl28 offsets unless another
overlay is named); callee contracts from out/asm/ovl29.asm, ovl51.asm, the decompile of ovl62:044a /
04b5 / ovl35:08b4, docs/research/ai.md (§5, §6.9, §6.10) and out/re/ai/sections/ovl22_move.md (§4,
move executor). Names as in ai.md: `AI[+x]` = locked AI block (far ptr DS:40ee), `cur` = 2c04:0110,
`count` = 2c04:157b (cities), `N` = 2c04:0181 (army high-water mark), `nsites` = 2c04:080f.
City record = 2c04:157d + **0x41**·c (`imul 0x41` everywhere here; +0 x, +2 y, +0x15 owner (0x1592)).
Site = 2c04:0811 + 0x1f·s (+0 x, +2 y, +0x18 kind (0x829), +0x1b word "special" flag (0x82c)).
Item = 2c04:0ce9 + 0x1d·i, 22 items (+0x14 type (0xcfd), +0x16 state (0xcff), +0x17 word holder
(0xd00), +0x19/+0x1b x, y (0xd02/0xd04)). Army = 1e1d:8880 + 0x16·a (+0 x, +2 y, +4 type, +5 owner,
+6 allowance, +7 moves left, +0xc flags word, +0xe low nibble order kind / bits 4-6 "sub",
+0xf bits 1-7 order index, +0x12/+0x14 goto). `terrain(x,y)` = 2c04:0710[low byte of map word
1e1d:(y·0xe0 + 2x)]; 10 = City, 11 = Ruin/Temple site. `explored(x,y)` = bit 6 (0x40) of the high
byte of that map word. `dist` = 0a8b:0acc (trunc(sqrt(dx²+dy²)), symmetric). `T` = max(turn,1) =
ovl61:225b. Quest record Q = 2c04:1103 + 0xc·cur: +0 active (0x1103), +2 type (0x1105), +4 hero
army (0x1107), +6 target (0x1109) (EL §5.1). Loops written `for i = n-1..0` are Borland
`mov ax,i; dec i; or ax,ax; jne body` loops [V].

#### Hero table S (frame of 0000, bp-0x48, passed as a far pointer)

| S offset | 0000 frame | contents | writer | readers |
|---|---|---|---|---|
| +0x00 + 2j, j < 6 | bp-0x48 | army index of hero j, −1 empty | 065d (06dd) | all |
| +0x0c + 2j | bp-0x3c | city on hero j's square at table time (terrain 10 → ovl62:044a), else −1 | 065d (075f) | 0000 (0118), 07ea, 0b75, 0efc |
| +0x18 + 2j | bp-0x30 | site on hero j's square (terrain 11 → ovl62:04b5), else −1 | 065d (07a2) | none (write-only) [V grep] |
| +0x24 + 2j | bp-0x24 | 1 if hero j carries a flight item (ovl35:08b4 ≠ 0), else 0 | 065d (071c, 07cd) | none (write-only) [V grep] |
| +0x30 / +0x32 | bp-0x18 / -0x16 | quest temple / its distance (−1 / 100) | 0fda (11db) | 0efc |
| +0x34 / +0x36 | bp-0x14 / -0x12 | site / distance (−1 / 100) | 0fda (11e9), 0000 (01d3) | 0efc, 07ea |
| +0x38 / +0x3a | bp-0x10 / -0x0e | city / distance (−1 / −1 when no group, else start 20) | 1348 | 0efc, 0b75 |
| +0x3c / +0x3e | bp-0x0c / -0x0a | item / distance (−1 / 100) | 11f8 | 0efc, 07ea |

The +0x30..+0x3e fields are per call (for the hero being processed), recomputed every round [V].
Other 0000 locals: bp-0x58 list[8] (explore), bp-8 round counter, bp-6 choice, bp-4 "a task force is
active" (written 0008/0025, never read [V]), bp-2 "moved this hero" flag.


#### ovl28:0000 move Hero (phase entry, from ovl25:0000) [V 0000..041e]

```
tf = 0; for k = 3..0: if AI[+0x24c + 0x5c·k] != 0: tf = 1           # 000d..002f  [V] tf never read [V]
AI[+0x46] = -1                                                       # 0031  [V]
if Quests (2c04:011e) != 0 and Q.active != 0 and Q.type in (4, 5):   # 0040, 0057, 0071, 008b  [V]
    AI[+0x46] = Q.target                                             # 00a5  [V] (city to occupy / raze)
065d(&S)                                                             # 00b9  [V]
for j = 5..0:                                                        # 00bf, 0411  [V]
    h = S[j]                                                         # 00ce
    if h == -1 or army[h].owner != cur or army[h].type != 0x1c: continue   # 00d3, 00f0, 0104  [V]
    if S.city[j] >= 0 (signed): ovl24:023f(S.city[j], 1)             # 0118, 0129  [V] clean city, force = 1
    if Quests and Q.active != 0 and Q.hero == h:                     # 0136, 014d, 0167  [V]
        if 0cf3(j, &S) != 0: continue                                # 0176, 017e  [V] marched on the quest city
    if (army[h].+0xe & 0xf) == 3:                                    # 0192  [V] hero has a site order
        s = army[h].+0xf >> 1 (& 0x7f)                               # 01a8
        if 1637(s, h) != 0:                                          # 01b5  [V]
            S+0x34 = s                                               # 01d3  [V] (bp-0x14 is S+0x34)
            07ea(j, 3, &S, 1)                                        # 01e2  [V] result ignored (01e8 jmp 02cc)
        else:                                                        # 01eb..02c2  [V]
            for a = N-1..0:
                if army[a].owner == cur and army[a].(x,y) == army[h].(x,y)
                   and (army[a].+0xe & 0xf) == (army[h].+0xe & 0xf):     # same kind as the hero (3)
                    army[a].+0xe &= 0xf0; army[a].+0xf &= 1; army[a].goto = (-1, -1)   # 028c..02bd
                    # the hero itself is in this scan, so its kind becomes 0 when it is reached;
                    # armies scanned after it (lower index) then compare with kind 0 [V order; I effect]
    go = 1; rounds = 0; moved = 0                                    # 02cc..02d4  [V] per hero
    while go != 0 and rounds < 2 and army[h].moves_left (+7, signed byte) >= 4:   # 03f2..040c  [V]
        rounds += 1                                                  # 02dc
        0fda(j, &S); 11f8(j, &S); 1348(j, &S)                        # 02e7, 02f5, 0303  [V] in this order
        c = 0efc(j, &S)                                              # 0311  [V]
        switch c:                                                    # 031a..0324, table 041f = 0329,032c,032c,0348  [V]
          1: go = 0                                                  # 0329 -> 03c0: no move, no explore [V]
          2, 3: moved = 1; go = 07ea(j, c, &S, 0)                    # 032c..0346  [V]
          4: moved = 1; go = 0b75(j, &S, 0)  (always 0)              # 0348..035d  [V]
          0 (default):                                               # 035f  [V]
             if moved and HiddenMap (2c04:0124) and T < 10:          # 035f, 036a, 0377 (jge 10 skips)  [V]
                 if ovl29:12c9(army[h].x, army[h].y, &L8, 8) == 1:   # 03a8, 03b0  [V] exactly one own army with >= 8 moves left
                     ovl20:0e4b(h, -1)                               # 03b8  [V] explore (ai.md §6.10)
             go = 0                                                  # 03c0
        if army[h].owner != cur or army[h].type != 0x1c: go = 0      # 03c2..03f0  [V] hero died / lost
```
* Hero order: 065d fills S[0] with the **highest** army index; the loop runs j = 5..0, so the
  recorded heroes are processed in **ascending army index** [V 0690, 00bf].
* The site-order continuation (01b5..01e8) moves the hero once more before the rounds; whatever it
  returns, the rounds still start with go = 1 [V 01e8 → 02cc].
* Choice 1 (quest temple, S+0x30) does nothing and ends the hero's rounds [V table 041f / 0329]. The
  same temple is normally also the regular site candidate S+0x34 (0fda falls through to the site test,
  10e7 → 116d), so the hero still goes there when choice 3 beats choice 1 on the rnd draw [I from
  0fda + 0efc].
* Explore needs `moved`, which only cases 2/3/4 set and which jump past 035f; so it can fire only in
  round 2, after round 1's 07ea arrived (returned 1) and round 2 chose 0 [V control flow].
* 12c9 also selects its armies (ovl29:14d3) before 0e4b [V ovl29:137b].
* ovl24:023f(c, 1): with force = 1 its `rnd(1,6,-1)` "leave it" test is not reached (ai.md §6.9:
  `if not force and ...`) [V ovl24:0565 `cmp [bp+8],0; jne 05bd` precedes the rnd at 058c]. It may call 0427 and 17db
  for the heroes in that city and may send flyers exploring (ovl20:0e4b) under Hidden Map.

#### ovl28:065d(S) hero table [V 065d..07e9]

```
for k = 5..0: S[k] = -1                                              # 0667..067f  [V]
AI[+0x0e] = 0; n = 0                                                 # 0681, 0665
for a = N-1..0:                                                      # 0690, 07dc
    if army[a].owner != cur or army[a].type != 0x1c: continue        # 06ad, 06c1  [V]
    if n >= 6: continue                                              # 06cc  [V] (also no count)
    S[n] = a; (x, y) = army[a].(x, y)
    S.site[n] = -1; S.city[n] = -1; S.fly[n] = 0                     # 0714..071c  (S+0x18, +0x0c, +0x24)
    if terrain(x, y) == 10: S.city[n] = ovl62:044a(x, y)             # 0742, 074e  [V]
    elif terrain(x, y) == 11: S.site[n] = ovl62:04b5(x, y)           # 0785, 0791  [V]
    if ovl35:08b4(&army[a]) != 0: S.fly[n] = 1                       # 07b8..07cd  [V]
    n += 1; AI[+0x0e] += 1                                           # 07d3, 07d4  [V]
```
* ovl62:044a(x, y): first city c = 0..count-1 with c.x ∈ {x, x−1} and c.y ∈ {y, y−1}, else −1
  (no terrain or owner test) [V decompile]. ovl62:04b5(x, y): first site s = 0..nsites-1 at exactly
  (x, y), else −1 [V decompile]. ovl35:08b4(a) = number of items of type 5 (flight) carried by a
  (ovl51:03d9 mode 2 list) [V decompile].
* AI[+0x0e] = number of heroes recorded = min(own heroes, 6) [V].

#### ovl28:0efc(j, S) choose the action [V 0efc..0fd9]

```
best = 0; c = 0                                                      # 0f01, 0f03
v = 100 - S+0x32 + rnd(1,20,0)                                       # 0f0a..0f1c  [V]
if S+0x30 != -1: c = 1; best = v                                     # 0f20..0f2a  [V] unconditional
v = 100 - S+0x36 + rnd(1,20,0)                                       # 0f31
if S+0x34 != -1 and best < v: c = 3; best = v                        # 0f47..0f55  [V] strict
if S.city[j] != -1 and AI[+0x182 + S.city[j]] <= 4 (unsigned byte): return c   # 0f61..0f7e  [V] jbe
v = 100 - S+0x3a + rnd(1,20,0)                                       # 0f85
if S+0x38 != -1 and best < v: c = 4; best = v                        # 0f9b..0fa9  [V]
v = 100 - S+0x3e + rnd(1,20,0)                                       # 0fb0
if S+0x3c != -1 and best < v: c = 2                                  # 0fc6..0fd1  [V]
return c
```
* Signed 16-bit arithmetic; the score is "closer is better" with a 1..20 random bonus; ties keep the
  earlier option (order 1, 3, 4, 2) [V].
* The draw is made even when the candidate is −1 (the −1 test comes after the rnd call) [V], so the
  number of draws is 2 when the hero stands in a city with ≤ 4 armies counted (AI[+0x182+c], written
  by ovl24:023f, which 0000 has just run for that city), else 4 [V]. Such a hero never targets a city
  or an item [V].

#### ovl28:0fda(j, S) sites and quest temples [V 0fda..11f7]

```
h = S[j]
bs = -1; bsd = 100; bt = -1; btd = 100                              # 0ff2..1001
lim = 5 if (army[h].+0xe & 0xf) == 1 else 25                         # 1011..1026  [V]
for s = 0..nsites-1:                                                 # 1029, 11c6..11d2 (signed)  [V]
    ok = 1                                                           # 1052
    if 1637(s, h) == 0: continue                                     # 105d  [V]
    d = dist(site s, army h)                                         # 1097
    if site[s].kind == 1:                                            # 10ab  [V]
        if Quests and Q.active == 0 and d < lim and d < btd:         # 10b8, 10cf, 10d7 (jge), 10dc (jge)  [V]
            bt = s; btd = d                                          # 10e1  -> falls to the site test (10e7 jmp 116d)
        elif army[h].flags (+0xc word) & 063c(s) != 0: continue      # 10ec..1102  [V] already blessed there
    else:
        for k = 5..0, k != j, S[k] != -1:                            # 1105..116b  [V]
            if (army[S[k]].+0xe & 0xf) == 3 and army[S[k]].+0xf >> 1 == s: ok = 0
    if ok and d <= lim and d < bsd: bs = s; bsd = d                  # 116d (je), 1173 (jg), 1178 (jge)  [V]
S+0x30 = bt; S+0x32 = btd; S+0x34 = bs; S+0x36 = bsd                  # 11d5..11f0  [V]
```
* Ties: lowest site index wins (ascending scan, strict `<`) [V].
* A temple qualifies as a quest temple only when Quests is on and this side has **no** active quest
  (visiting one asks for a quest, ovl22:15c3 → ovl01:0d7a) [V test; I purpose]. A temple can be the
  target of several heroes (the "another hero ordered there" check is in the non-temple branch only) [V].
* 063c(s) for the 5th and later temples returns DS:0958[4] = 0x6353 (the bytes "Sc" of the string at
  DS:0960) [V data]: such a temple is skipped whenever the hero's flag word has any of the bits
  0x6353 (0x1, 0x2, 0x10, 0x40, 0x100, 0x200, 0x2000, 0x4000) — in practice nearly always [I].
  063c(s) = −1 is impossible here (s < nsites) [V 0600].
* The debug print (1193, "Legal site …") and ovl29:170c (view, human sides only, ai.md §5.15) have no
  effect on the computer's state [I ai.md].

#### ovl28:1637(s, a) site worth visiting [V 1637..1735]

```
d = dist(site s, army a)                                             # 168f
lim = 2·T + 3; if site[s].+0x1b (word) != 0: lim += 12               # 169a..16b8  [V]
if not d < lim: return 0                                             # 16bb (jl)  [V]
if ovl29:16ae(site s) == 0: return 0                                 # 16c8  [V] a seen square in the 3×3 around it
if terrain(site s) != 11: return 0                                   # 16f4  [V]
if site[s].kind == 1: return 1                                       # 1706  [V] temples always
return 0 if explored(site s) else 1                                  # 1720..172d  [V]
```

#### ovl28:11f8(j, S) items lying on the map [V 11f8..1347]

```
h = S[j]; bi = -1; bd = 100
lim = 5 if (army[h].+0xe & 0xf) == 1 else 15                         # 1221..1236  [V]
for it = 21..0:                                                      # 1239, 1329  [V]
    ok = 1
    if 1736(it) == 0: continue                                       # 126b
    for k = 5..0, k != j, S[k] != -1:                                # 1276..12dc  [V]
        if (army[S[k]].+0xe & 0xf) == 2 and army[S[k]].+0xf >> 1 == it: ok = 0
    if ok: d = dist(item it, army h)                                 # 130f
           if d <= lim and d < bd: bi = it; bd = d                   # 1319 (jg), 131e (jge)  [V]
S+0x3c = bi; S+0x3e = bd                                             # 1333..1340
```
* Ties: highest item index wins (descending scan, strict `<`) [V]. 07ea sends heroes to items with
  order kind 4, not 2, so the exclusion only sees kind-2 orders given elsewhere (ovl29:0c7e supports
  kind 2) [V 0ad7; I no kind-2 writer in ovl28].

#### ovl28:1736(it) item worth fetching [V 1736..17da]

```
if item[it].state != 1: return 0                                     # 1769  [V] lying on the map
if ovl29:16ae(item x, y) == 0: return 0                              # 1777  [V]
if terrain(item x, y) == 10 and owner(ovl62:044a(item x, y)) != cur: return 0   # 17a2, 17ac, 17cd  [V]
return 1
```
* On a city square ovl62:044a should find the city; if it returned −1 the owner byte of record −1
  (2c04:1551 = relation byte [2][6], see ovl18:0917 in §6.1) would be read [V code; whether
  reachable not checked — every intact-city square lies in some city's 2×2 block].

#### ovl28:1348(j, S) enemy cities [V 1348..1636]

```
h = S[j]; bc = -1; bd = 20; bp = 0                                   # 1360..136a
S+0x38 = S+0x3a = -1                                                 # 136f..1379  [V]
oc = army[h].+0xf >> 1 if (army[h].+0xe & 0xf) == 1 else -1          # 1388..13af  [V] current city order
n = ovl29:13b2(h.x, h.y, &L8, (h.+0xe >> 4) & 7, h.+0xe & 0xf, 12)   # 13b4..1412  [V] selects the group
if n == 0: return                                                    # 1418  [V]
thr = 95 if n < 3 else 75                                            # 141f..142d  [V]
for c = count-1..0:                                                  # 1435, 1618  [V]
    if terrain(c) != 10: continue                                    # 1476  [V] intact
    if AI[+0x11e+c] & 1: continue                                    # 1487  [V]
    o = owner(c); if o == 0xf: continue                              # 149c  [V]
    if (2c04:153b[cur·8 + o] & 3) != 2: continue                     # 14b1..14d6  [V] at war (own cities: 0)
    d = dist(c, army h)                                              # 1520
    if d > bd and c != oc: continue                                  # 152b (jle), 1530  [V] running best distance
    p = ovl29:15c5(c.x, c.y)                                         # 1556  [V] AI[+0x20] battle simulations
    if c == oc: p += 20                                              # 1560..1565  [V]
    if p < thr: continue                                             # 15f5 (jl)  [V]
    if p > bp or (p == bp and d < bd): bd = d; bc = c; bp = p        # 15fa..1615  [V]
S+0x38 = bc; S+0x3a = bd                                             # 1622..162f
```
* The distance filter uses the **running** best distance: a city farther than the best taken so far
  is not simulated (unless it is the hero's current order city) [V 152b]. Initial cap 20.
* 13b2(x, y, out, sub, kind, minallow) [V ovl29:13b2 listing]: up to 8 own armies on (x, y) with
  `(+0xe>>4)&7 == sub`, `+0xe&0xf == kind` and allowance (+6, signed) ≥ minallow when ≠ 0, scanned
  N-1..0, selected with 14d3 and copied out; returns the count. This settles ai.md §5.10's [U].
  The hero itself is in the group only if its allowance is ≥ 12 [V].
* 15c5 simulates the **selected group** (13b2 → 14d3) against the city; each candidate that reaches
  1556 consumes the dice of AI[+0x20] simulations [V call; I dice per ai.md §5.12].
* The debug print (15c3) computes another dist with no effect [V].

#### ovl28:07ea(j, kind, S, unused) move to a site or an item [V 07ea..0b74]

```
r = 0; h = S[j]                                                      # 07f2, 0801
if kind == 3: (tx, ty) = site S+0x34; t = S+0x34                     # 0804..0838  [V]
else:         (tx, ty) = item S+0x3c; t = S+0x3c + 1000              # 083e..0870  [V]
d = dist(tx, ty, h)                                                  # 089d  (debug only)
n = ovl29:13b2(h.x, h.y, &L8, (h.+0xe>>4)&7, h.+0xe&0xf, 12)         # 08a8..0902  [V] selects
if n == 0: return 0                                                  # 0908
c = S.city[j]
th = ovl20:0a3e(h.x, h.y, -1) if c != -1 else 100                    # 0920..095f  [V] nearest foreign army
if c != -1:                                                          # 095f
    f = -1; for k = 7..0: if L8[k] != -1 and flies(army[L8[k]].type): f = L8[k]   # 0968..09a9  [V] lowest slot wins
    if f != -1: L8 = [h, f, -1 × 6]; n = 2; ovl29:14d3(L8)           # 09ab..09d5, 09ff  [V]
    elif th >= 15: L8 = [h, -1 × 7]; n = 1; ovl29:14d3(L8)           # 09d7..09fa  [V]
if c != -1 and AI[+0x182+c] (byte) == n and n < 3 and th < 15: return 0   # 0a0c..0a31  [V] whole garrison, enemy near
if c != -1 and n == 3: L8 = [h, -1 × 7]; ovl29:14d3(L8)              # 0a34..0a67  [V] (n not changed)
0c8c:0529()                                                          # 0a6a  [V] stack move mode
ovl29:170c(h.x, h.y)                                                 # 0ab0  (view, human only)
if t == -1: return 0                                                 # 0ab8  [V]
if t >= 1000:                                                        # 0ad1  [V] item
    ovl29:0ae7(L8, 4, 0, 0)                                          # 0ae1  [V] kind 4 "none", flags 0
    leader (DS:5e62).goto = (item[t-1000].x, .y)                     # 0aeb..0b1f  [V] (offset 0x9ba1+0x19 wraps to 0xd02)
else:
    ovl29:0ae7(L8, 3, t, 0)                                          # 0b46  [V] kind 3 site t
if 0a8b:0001(leader.goto.x, leader.goto.y, 0) == 4: r = 1            # 0b2d/0b5c, 0b35/0b64  [V] path end reached
return r
```
* The flyer is the one in the lowest list slot, i.e. the flying group member with the highest army
  index (13b2 fills from N-1 down) [V]; flies = DS:45c4 + 6·type ≠ 0 [V 099a].
* Outside a city (c == −1) the whole same-order group with allowance ≥ 12 goes [V].
* `t == -1` can only occur for kind 3 with S+0x34 == −1, which 0000 never passes (0efc picks 3 only
  when S+0x34 ≠ −1; the continuation sets it from a valid order) [I]. For kind 2 with S+0x3c == −1,
  t would be 999 and treated as a site; 0efc never picks 2 then [V 0efc].
* On arrival at a site with order kind 3 and a hero selected, the move executor searches it
  (ovl22:15c3, ovl22_move.md §4.1) [V there]; on arrival at an item the executor's per-step 0427
  picks it up [V there].

#### ovl28:0b75(j, S, unused) move to a city [V 0b75..0cf2]

```
h = S[j]; c = S+0x38; hc = S.city[j]                                 # 0b8b..0bcb
d = dist(c, h)                                                       # 0bf9  [V] never read afterwards
n = ovl29:13b2(h.x, h.y, &L8, (h.+0xe>>4)&7, h.+0xe&0xf, 12)         # 0c04..0c57  [V] selects; n is NOT stored
if n == 0: return 0                                                  # 0c5a..0c5c (`or ax, ax` only)
if hc != -1 and AI[+0x182+hc] (byte) == j:                           # 0c61..0c78  [V] compares with [bp-2], see below
    th = ovl20:0a3e(h.x, h.y, -1)                                    # 0ca1
    if th < (15 if T > 5 else 10): return 0                          # 0cac..0cc1 (jg)  [V] stay
ovl29:0ae7(L8, 1, c, 0)                                              # 0ccf  [V] order kind 1 city c
0a8b:0001(leader.goto.x, leader.goto.y, 0)                           # 0ce5  [V]
return 0                                                             # 0ced: di is 0 throughout  [V]
```
* **Uninitialised local** [V listing + decompile `local_4`]: 0b75 never writes [bp-2]; the
  `cmp ax, [bp-2]` at 0c75 reads a stale stack word. 0000 calls 0efc(j, &S) (3 words) right before
  0b75(j, &S, 0) (4 words), so 0b75's bp-2 is 0efc's bp-4, where 0efc saved di (0efc 0f00 `push
  di`) = 0000's di = **j**, the hero's slot in S (0..5). Nothing else writes that word between the
  two calls (0314..0357 only dispatches) [V]; only a hardware interrupt taken in that ~25-instruction
  window could change it [I, negligible]. So the "stay" test is `garrison count == j`, not
  "the group is the whole garrison": a reimplementation must compare with j. (07ea's similar test at
  0a20 does use its n, [bp-2] written at 0905 [V].)
* 0b75 always returns 0, so after a city move the hero's rounds end [V].
* 0ae7 sets the goto by ovl29:0c7e (enemy city: corner moved one step toward the army, ai.md §5.3);
  the executor attacks the city on reaching it, and for AI[+0x46] == c with a hero selected it does not
  re-target (0a8b:0254, ovl22_move.md §4.6) [V there].

#### ovl28:0cf3(j, S) march on the quest city [V 0cf3..0efb]

```
h = S[j]
if Q.type not in (4, 5): return 0                                    # 0d1a, 0d34  [V]
c = Q.target                                                         # 0d53
if AI[+0x11e+c] & 1: return 0                                        # 0d82  [V]
need = 1 if owner(c) == 0xf or T < 8 else 2                          # 0d94..0dae  [V]
n = ovl29:12c9(h.x, h.y, &L8, 8)                                     # 0db1..0de2  [V] own armies, moves left >= 8; selects
if n < need: return 0                                                # 0de5 (jge)  [V]
if not ((h.+0xe & 0xf) == 1 and h.+0xf >> 1 == c):                   # 0dff, 0e18  [V] not yet ordered there
    d = dist(c, h)                                                   # 0e47 (debug only)
    if ovl29:15c5(c.x, c.y) < 75: return 0                           # 0e70, 0e7b  [V]
ovl29:170c(h.x, h.y)                                                 # 0ec5
ovl29:0ae7(L8, 1, c, 0)                                              # 0ed7  [V]
0a8b:0001(leader.goto.x, leader.goto.y, 0)                           # 0eed
return 1                                                             # 0ef5  [V] whatever the move result
```
* 0cf3 does not test Q.active or Q.hero; 0000 does before calling (0136..016c) [V].
* 12c9 counts every own army on the square with ≥ 8 moves left, the hero included only if it has
  ≥ 8 left [V ovl29:12c9 listing].

#### ovl28:0427(x, y) pick up lying items [V 0427..056c]

```
city = terrain(x, y) == 10                                           # 0454  [V]
if DS:5e5e (far) == 0: return                                        # 0466  [V] no hero selected
for it = 21..0:                                                      # 0471, 055f  [V]
    if item[it].state != 1: continue                                 # 0481
    if not city: require item.x == x and item.y == y                 # 049c, 04b0
    else:        require x <= item.x <= x+1 and y <= item.y <= y+1   # 04ca..0505 (signed)  [V]
    item[it].state = 3                                               # 0511  [V]
    k = N-1..0: first k with &army[k] == DS:5e5e (segment and offset); -1 if none   # 051c..054b  [V]
    item[it].holder = k                                              # 055a  [V]
```
* No owner or position test on the hero: the caller guarantees that DS:5e5e is the moving stack's
  hero (set by 0c8c:0529 / ovl24:023f) [I]. Item x/y are left as they were [V].
* Called by the executor before each walk and, for a computer side, after each step (ovl22_move.md
  §4.1) [V there], and by ovl24:023f for the last hero found in a city [V ai.md §6.9].

#### ovl28:056d(x, y, &kind) site on a square [V 056d..05ff]

```
if terrain(x, y) != 11: return -1                                    # 05a3
s = ovl62:04b5(x, y); if s < 0: return -1                            # 05b0..05bc  [V]
*kind = site[s].kind (sign-extended byte)                            # 05c8..05d1  [V] written before the next test
if *kind != 1 and explored(x, y): return -1                          # 05d4..05f8  [V]
return s
```

#### ovl28:0600(s) / 063c(s) temple ordinal and blessing flag [V 0600..065c]

```
0600(s): k = 0
    for i = 0..nsites-1:                                             # 0605, 062b (signed jg)
        if i == s: return k                                          # 0609
        if site[i].kind == 1 and k < 4: k += 1                       # 061c..0629  [V]
    return -1
063c(s): k = 0600(s); return -1 if k == -1 else word DS:0958[k]      # 0643..0657  [V]
```
DS:0958 = 0x0002, 0x0004, 0x0008, 0x0010, then DS:0960 = 0x6353 ("Sc", start of the debug string
"Scan dist …") for k = 4 [V EXE bytes at file offset 0x2000 + 0x31250 + 0x958]. The first four temples
in table order give flags 0x02/0x04/0x08/0x10 = the temple-blessing army flags of EL §5.4 [V EL].

#### ovl28:17db(H) share items among the heroes of one city [V 17db..1a2c]

H = far list of 8 army indices (−1 empty), built by ovl24:023f for city c (heroes in scan order
N-1..0), called only when that city holds > 1 hero (ai.md §6.9). Byte counters per slot k: G[k]
(bp-0x2c, type 7), F[k] (bp-0x24, type 5), M[k] (bp-0x1c, type 6), B[k] (bp-0x14, types 1/2/8),
Tot[k] (bp-0xc, every item; never read [V]); item rows I[k][0..21] bytes (bp-0xde + 0x16·k).
```
for k = 0..7: G = F = M = B = Tot = 0; I[k][21..0] = 0xff           # 17e4..181a  [V]
for k = 0..7 with H[k] != -1:                                        # 181c..18b6  [V]
    ovl51:03d9(2, 0L, &army[H[k]])                                   # 184d  [V] mode 2: carried items
    for m = 0..DS:482e-1:                                            # 18ac (signed)
        it = DS:4bfc[m]; I[k][m] = low byte of it                    # 185d..186e
        switch item[it].type (table 1a2d, type-1 unsigned <= 7):     # 1881..1891  [V]
            1, 2, 8: B[k] += 1;  5: F[k] += 1;  6: M[k] += 1;  7: G[k] += 1;  3, 4, other: –
        Tot[k] += 1                                                  # 18a8
1a3d(H, M, I, 6); 1a3d(H, F, I, 5); 1a3d(H, G, I, 7)                 # 18bb..1903  [V] in this order
repeat:                                                              # 1906..1a26  [V]
    stable = 1
    for k = 0..7 with H[k] != -1 and B[k] != 0:                      # 1918..1932 (signed byte)
        lo = B[k]; r = -1
        for m = 0..7, m != k, H[m] != -1: if B[m] < lo: lo = B[m]; r = m   # 1940..196c  [V] strict, first lowest
        if r == -1: continue
        for e = 0..21:                                               # 1977..1a12
            it = sign-extended I[k][e]                               # 1989 (cbw)
            if it == 0xff: continue                                  # 198f  dead test, see below  [V]
            if item[it].type in (1, 2, 8):                           # 199e, 19ad, 19bc  [V]
                I[k][e] = 0xff; stable = 0; AI[+0x4c] += 1           # 19d1..19de
                item[it].holder = H[r]                               # 19f9  [V] state stays 3
                B[k] -= 1; B[r] += 1; break                          # 19fe..1a0c
until stable
```
* ovl51:03d9 mode 2 (case 0531): k = index of the army (N-1..0), then the items it = 0..21 with
  state 3 and holder k, into DS:4bfc[] (count DS:482e) [V ovl51 listing].
* **Dead 0xff test** [V]: both 17db (198c..1992) and 1a3d (1ab3..1aba) load the row byte with cbw
  and compare with 0x00ff, so an empty entry (0xff) becomes item −1, never skipped. Item −1's type
  byte is 2c04:0ce0 = byte +0x16 of site 39's name (site 39 = 2c04:0cca..0ce8); its holder word would
  be 2c04:0ce3 (site 39 +0x19/+0x1a). The site name is +4..+0x17, so 0ce0 is name byte 18. It is
  0x00 in every shipped scenario (the .SCN files are the 2c04 image: ERYTHEA, ISLADIA, HADESHA,
  DRAGON, SORCERY, TUTORIA, RANDOM; checked at file offset 0xce0) [V data]; the game never writes
  site names in play, and a generated name byte is 0 or printable (≥ 0x20). It never equals 1, 2,
  5, 6, 7 or 8, so the bug has no effect, and the holder word is never written for item −1 (the
  type test fails first) [V]. A reimplementation simply skips 0xff.
* Only the giver's row is cleared; the receiver's row is not extended while both counters move [V].
  This is what ends the B pass: a receiver's counter says it has an item but its row has none to
  give. Examples [I, worked from the code]: B = (1, 0) → the item moves to the second hero and stays
  there (B ends (0, 1)); B = (3, 0, 0) → (1, 1, 1) after three passes; B = (2, 1) with items {a, b} / {c} → hero 0
  gives a, hero 1 gives c back (its row still holds c), hero 0 then gives b: hero 0 ends with {c},
  hero 1 with {a, b} (counters (1, 2)).
* The B pass may move an item to a hero that has fewer battle/command items only (`B[m] < lo`) [V].

#### ovl28:1a3d(H, cnt, I, type) hand out one item type [V 1a3d..1b33]

```
repeat:                                                              # 1a45..1b2d  [V]
    stable = 1                                                       # 1a4a
    for g = 0..7 with H[g] != -1 and cnt[g] >= 2 (signed byte):      # 1a52..1a6d  [V] tested once per g
        for r = 0..7, r != g, H[r] != -1, cnt[r] == 0:               # 1a77..1a9e  [V]
            for e = 0..21:                                           # 1aa0..1b15
                it = sign-extended I[g][e]; (0xff test dead, as in 17db)   # 1ab0..1aba
                if item[it].type == type:                            # 1ac7  [V]
                    stable = 0; I[g][e] = 0xff; AI[+0x4c] += 1       # 1ad2..1ae8
                    item[it].holder = H[r]                           # 1afa  [V]
                    cnt[g] -= 1; cnt[r] += 1; break                  # 1b04..1b0f -> next r
until stable
```
* The `cnt[g] >= 2` test is made before the r loop only; inside it g gives one item to **every**
  hero with none as long as its row holds one, so it can end with 0 [V]. Example [I]: two flight
  items on hero 0, heroes 1 and 2 without → (0, 1, 1).


#### State read and written by ovl28

| state | access | meaning |
|---|---|---|
| AI[+0x46] | W 0000 (0035 = −1, 00ae = Q.target) | quest target city while a type 4 (occupy) / 5 (raze) quest is active and Quests is on, else −1; reset every hero phase [V]. Used by 0a8b:0254 (no re-target for a hero stack, ovl22_move.md §4.6), ovl29:1885 (excluded from target choice), ovl20:01f6 (not a neutral-chain target) [V there] |
| AI[+0x0e] | W 065d (0685 = 0, 07d4 += 1) | number of own heroes recorded this turn, ≤ 6 [V]; read by ovl25:0af2 (rebuilding) [V ai.md] |
| AI[+0x4c] | W 17db (19de), 1a3d (1ae8) | cumulative count of item hand-overs between heroes (init 0 by ovl21:084d); no reader in xref_ai.tsv [V] |
| AI[+0x182+c] | R 07ea (0a19), 0b75 (0c6e), 0efc (0f78) | armies counted in city c by ovl24:023f this turn (0000 has just refreshed it with force = 1 for the hero's city) [V] |
| AI[+0x11e+c] bit 0 | R 1348 (1487), 0cf3 (0d82) | city flagged bit 0 (Hidden Map, ai.md §3.1) is never a hero target [V] |
| AI[+0x24c+0x5c·k] | R 0000 (001d) | task force active; result unused [V] |
| DS:0958[5] | R 063c | blessing flags of temples #1..#4 (2, 4, 8, 0x10); index 4 reads 0x6353 [V] |
| DS:5e5e | R 0427 | selected hero (far) [V]; set by 0c8c:0529 / ovl24:023f [V there] |
| DS:5e62 | R/W via 0ae7 | leader; 07ea writes its goto for items (0b02, 0b1f) [V] |
| DS:4bfc[], DS:482e | R 17db | item list built by ovl51:03d9 [V] |
| 2c04:011e, 0124, 0110, 0135 (T), 0181, 080f, 157b | R | Quests, Hidden Map, current side, turn, armies, sites, cities [V] |
| quest Q (2c04:1103 + 0xc·cur) +0, +2, +4, +6 | R 0000, 0cf3, 0fda | active, type, hero army, target [V] |
| relation 2c04:153b[cur·8+o] bits 0-1 | R 1348 | war (2) required [V] |
| army +0xe / +0xf / +0x12 / +0x14 | W 0000 (01eb..02bd) | site orders cleared on the hero's square when the site is no longer worth it [V]; other order writes via ovl29:0ae7 [V] |
| item +0x16 state, +0x17 holder | W 0427 (state 3, holder), 17db / 1a3d (holder) | pick-up and hand-over [V] |
| site +0x18 kind, +0x1b, map explored bit, road-layer seen bit (16ae) | R 1637, 056d, 0600 | [V] |


### 6.3 move Search, ovl22:0284

See §6.6 (ovl22:0284). [V]
### 6.4 move Explore, ovl22:0458

See §6.6 (ovl22:0458). [V]
### 6.5 assault: running the task forces, ovl19:0000 [V]

Call arguments that the decompile hides were read from the listing (ovl19:01af..1836).
TF fields as in §6.13; `TF.age` is word +0x00 (it counts up while the TF runs, so "active" =
non-zero); `TF.leaders` = +0x3e (4 army indices, the leader of each launched group);
`TF.stagings` = +0x46 (6 cities, former staging cities). Each launched army carries its TF
in army +0xe bits 4-6 (value k+1).
```
0000: if AI[+0x00] == 0: return
    ovl21:01b3()                                  # §6.8
    for c in count-1..0 owned by cur with role 7: role[c] = 8
    for k in 0..AI[+0x24a]-1 with TF[k] active:
        role[TF.staging] = 7
        if 00ca(k): TF.age += 1
00ca(k):
    cap = ovl62:044a(capital of cur)
    if owner(cap) not in (0xf, cur) and no active TF (k' < AI[+0x24a]) has enemy == owner(cap):
        0607(); return 0                          # our capital is lost: drop the oldest TF
                                                  # (cap = -1: owner = byte 2c04:1551, §6.1)
    if 041c(k) == 0: 066d(k, 0); return 0         # no target left
    1579(k)
    shared = another active TF has the same staging city
    if (not shared and owner(TF.staging) == cur) or 02ed(k):
        0996(k)                                   # move the launched groups
        if TF active:
            ovl24:023f(TF.staging, 1)              # clean the staging city (forced)
            if 06e9(k) and TF.staging >= 0: ovl24:023f(TF.staging, 1)
            if TF active: 16fd(k); return 1
    return 0
02ed(k): new staging = nearest (dist(n, staging), strict <, start 1000, NB slots i = 5..0, so the
    highest slot wins ties) of the staging city's six neighbours owned by cur that are not a
    staging city (ovl27:07f8); no intact test; none → 066d(k, 1), return 0; else set, return 1
041c(k): for i in 0..5: a target that is AI[+0x46] or no longer owned by the enemy → −1;
        n = number of the others (no intact test)
    for each neighbour t of the staging city (NB slot i = 5..0) owned by the enemy, not flag bit 0,
        not already in TF.targets:
        n += 1                                    # counted even if it is not stored below
        slot = -1; worst = 0
        for j in 5..0: if targets[j] == -1: slot = j; worst = -1; break     # highest empty slot
                       if dists[j] > worst (signed): slot = j; worst = dists[j]   # largest, highest j on ties
        if slot != -1 and (worst == -1 or NBdist(staging, i) < worst):
            targets[slot] = t; dists[slot] = NBdist(staging, i)   # a NB distance, not a graph distance
    return n                                      # [V ovl19:041c..0606]
066d(k, reason): role[staging] = 8; role[source] = 8 for every source; ovl27:08ba(k)   # reason unused
0607(): 066d on the TF with the largest age (strict >, k from AI[+0x24a]-1 down: highest index on ties)
06e9(k): launch a group from the staging city
    n = ovl29:12c9(staging.x + 1, staging.y, L, 0)          # armies on square 0 (the keepers' square)
    if n == 0: return 0
    best = -1; bs = -1
    for i in 0..5 with t = TF.targets[i] != -1:
        turns = TF.dists[i] / max(DS:5e00 - 2, 1) + 1
        p = ovl29:15c5(t.x, t.y)                  # odds of this selection, rnd
        r = rnd(1,4,0)
        s = (10 - turns if turns < 11 else 0) + p + TF[+0x32+2i] + r + (100 if turns == 1 else 0)
        if (p > 75 or n > 7) and s > bs: best, bs = t, s
    if best == -1: return 0
    08b2(k, L)                                    # record the group leader
    every army of L: +0xe bits 4-6 = k + 1
    0f1b(k, L, best); return 1
08b2(k, L): j = highest free leader slot (3..0); if none: return
    leader = the first hero in L scanning 7..0, else the strongest (+8, signed, strict >: highest
    slot on ties); a hero found later in the scan still wins [V 08b2..0995]
1251(k): a leader that is no longer own or no longer carries group k+1 is removed (−1)
0996(k): for j in 3..0:
    repeat:
        1251(k); a = TF.leaders[j]; if a == -1: break
        n = ovl29:13b2(a.x, a.y, L, group(a), kind(a), 0)  # its group on its square (09ee push 0)
        if n == 0: break
        0c8c:0529(); 0555:1ab9(15, a.x, a.y, DS:5dfc, DS:5dfa)    # distance map with the stack's mode
        r = 0b49(k, L, TF.enemy, 15)
        if r == 0:
            c = order index of the first non-empty L slot scanning 7..0 if its kind is 1, else none
            if c != none: 0f1b(k, L, c)            # keep marching on its city
            break
        if r in (1, 3): break                      # r == 2: same group again
0b49(k, L, enemy, range):
    near = -1; bd = 1000
    for c in count-1..0 with owner(c) == enemy:          # no intact and no flag-bit-0 test
        d = ovl21:0a85(c, &x, &y, map, 0)               # x not tested: unreachable gives d = 100
        if d < 50 and d < DS:5e00 (signed): p = 15c5(c.x, c.y)   # drawn only here
            if p > 75 and d < bd: near, bd = c, d       # strict: highest index on ties [V 0b49..0bec]
    r = 0c32(k, L, enemy, range, map)
    if r != 0 and near != -1: r = 0f1b(k, L, near)
    return r
0c32(k, L, enemy, range, map): skirmish with an enemy stack in the open
    a = L[0]; if a is aboard (flag 0x1000): return 0
    for x in a.x-range .. a.x+range-1, y in a.y-range .. a.y+range-1 (on the map):
        need army bit 0x10, owner nibble == enemy, terrain not 10/3/2, |map[x][y]| <= DS:5e00 - 1,
             road-layer bit 0x20 (seen)
        ovl29:1626(x, y, &cnt, &str, &heroes); p = ovl29:15c5(x, y)
        if p > 75 and ((cnt > 2 and str > 10) or heroes) and p > best: best = p; target = (x, y)
    if none: return 0
    c = a's order index if a's kind is 1 else none
    ovl29:0ae7(L, 4, 0, 0x20); leader goto = target; 0a8b:0001(target, 0)   # attack
    for every own survivor in L: if c != none: kind 1, index c (order restored); non-own entries → -1
    return 2
0f1b(k, L, c): attack/enter city c
    if L[0] != -1 and terrain(c) != 10:            # c was razed
        best = 1000; pick = -1
        for i in 0..5 with t = TF.targets[i] != -1:
            d = dist(L[0].x, L[0].y, t.x, t.y)        # computed before the terrain test [V 0fcc..0ff3]
            if d < best and terrain(t) == 10: pick, best = t, d   # strict: lowest i on ties
        if pick != -1: c = pick
    loop:                                          # the retarget above is not repeated in the loop
        nt = #targets; drop non-own entries of L; was = owner(c)
        ovl29:0ae7(L, 1, c, 0); r = 0a8b:0001(leader.goto, 0)
        if r == 1: ovl24:0000(1); 1251(k); return 3     # 0a8b:0001 result 1: the whole selection is deleted
        1251(k)
        if owner(c) != cur or was == cur: return 3     # not taken, or it was ours already
        capital = (c.x, c.y) == player[cur] capital (2c04:0193/0195 + 0x14·cur)
        if capital or nt < 2 or not TF.flags & 1:
            if not capital: sack (199c) if flags & 2 else pillage (1a2a) if flags & 4
            134c(k, c); return 1
        c = 1864(c, 0)                                  # TF flag 1: capture choice, may raze
        if c == -1: return 1                             # kept (occupy / sack), or razed with no next target; no 134c
        # razed: 1864 returned the next target city (ovl29:1851) → attack it in the same call
    # L may hold holes here (0c32 drops dead entries, then 0b49 calls 0f1b; or members killed
    # in an earlier pass of this loop): 0ae7 writes them into DS:5e3e as null entries in place
    # (Changelog M8b4, "Selection holes")
134c(k, c): after taking c (c != staging; else return 0)
    ovl24:023f(c, 1); remove c from the targets (first match)
    tn = Σ over c's neighbours owned by the enemy of [d<10]+[d<20]+[d<30]+[d<50]  (NB distances)
    to = the same for the staging city
    new = c if to < tn else staging; add new to TF.stagings (first empty, if not present)
    if tn == 0 and to == 0: 066d(k); return 0        # TF finished
    TF.staging = new; role[c] = 7; 16fd(k); return 1
1579(k): with exactly one target T (the highest-index non-empty slot): T's neighbours (NB slot
    0..5) without flag bit 0: enemy-owned → added to the first empty target slot (0..5) without
    writing its distance word +0x272 (it keeps its old value) [V 165b..168a]; own: staging found →
    keep; else the first that is not a staging city (07f8) becomes the new staging city (if the
    current one is not a neighbour)
16fd(k): bring rear armies forward
    for each former staging v in TF.stagings (i = 0..5; v != -1, v != staging, owned by cur):
        if no neighbour of v owned by another side (≠ 0xf, ≠ cur) lies at NB distance < 25:
            ovl24:023f(v, 1)
            n = ovl29:13b2(v.x + 1, v.y, L, 0, 0, TF[+0x58])   # sub 0, kind 0 (17f1 push dword 0), allowance >= the TF minimum [V]
            if n > 3: ovl29:0ae7(L, 1, staging, 0); 0a8b:0001(leader.goto, 0)
```
The capture choice ovl19:1864(c, forced) [V]:
```
v = ovl31:07d0(c)                                   # sack value (EL §6.5)
if not forced and ≥ 3 of c's six neighbours are own cities at NB distance < 45: return -1   # occupy
if v >= 400: ovl19:199c(c); return -1               # sack (199c pillages when v == 0)
raze: message; ovl32:016b(c.x, c.y, 1); infamy[cur] += rnd(1,15,0) + 10; redraw
return ovl29:1851()                                 # next target city or -1 (§5.14)
```
`199c(c)`: v = 07d0(c); v == 0 → 1a2a(c); else message, ovl31:0941 (empties the slots),
infamy += rnd(1,10,0)+5, gold += v. `1a2a(c)`: v = ovl31:0834(c); if v: message, gold += v,
ovl31:0886, infamy += rnd(1,5,0).

### 6.6 move phases in ovl22 (move #1/#2, Search, Explore, rescue, last rescue, specials) [V]

Traced by a helper from the listings (out/re/ai/sections/ovl22_move.md, which also has the
function table and the state table). No rnd() is drawn directly in ovl22, ovl23 or the resident
move code; draws come only through 15c5 simulations, real battles (ovl36:124a(x, y, 1)), ovl29:1771
and the callees named.

#### ovl22:0000 move #1 / move #2 [V]

```
for i = N-1..0:                                             # 0013..0079
    a = army[i]
    if a.owner == cur and a.x != -1:                        # 0027 byte cmp, 0038
        a.flags &= ~0x200                                   # 004a
        if a.moves_left < 2: a.flags |= 0x200               # 005b signed byte, jge
loop:                                                       # 026c
    a = ovl67:05c4()                                        # far ptr; null -> return 1 (027e)
    a.flags |= 0x200                                        # 0081
    if a.goto_x < 0: continue                               # 0087 signed
    if a.moves_left < 2: continue                           # 0091 signed byte
    ovl67:06eb(a)                                           # 009f select a's stack (see below)
    k = a.+0xe & 0xf; c = (a.+0xf >> 1) & 0x7f
    invalid = k == 0                                        # 00b1
           or (k == 1 and c >= count)                       # 00d2 unsigned (jb)
           or (k == 1 and c == AI[+0x46])                   # 00f8
           or (k == 1 and terrain(city c corner) != 10)     # 0110..0162
    if invalid:                                             # 0164
        for s = 7..0 with DS:5e3e[s] != null:               # 0169
            m = DS:5e3e[s]; m.+0xe &= 0xf0; m.+0xf &= 1
            m.goto = (-1, -1)                                # 019d..01ad (+0x14 first)
            m.flags |= 0x40                                  # 01ba: done for this turn
        continue
    if a.flags & 0x80:                                      # 01cc
        if ovl22:05ff() == 0: continue                      # 01d6
    if k == 1 and owner(city c) == cur:                     # 01e0..0210 (k, c re-read: 05ff may have changed them)
        leader.goto = (c.x + 1, c.y + 1)                    # 0226..0252, leader = DS:5e62
    0a8b:0001(leader.goto_x, leader.goto_y, 0)              # 0264
```
* ovl67:05c4 [V ovl67:05c4..06e7]: among own armies with x ≥ 0, flag 0x01 set, 0x40 clear and
  0x200 clear, the one with the smallest `|x − DS:3250| + |y − DS:3252|` (0 counts 9000), start
  10000, signed strict `<` scanning N−1..0 (highest index wins ties); DS:3250/3252 := its x, y;
  returns null when none. So the order is a nearest-neighbour chain starting from the reference
  square (set to the player's capital at turn start, EL §4.5). Armies without the awake bit 0x01 are
  never moved here [V].
* ovl67:06eb [V ovl67:06eb..0888] fills DS:5e3e[0..] with **every** member (also for a single army),
  sets 0x200 on each, picks the leader (highest fight-order byte, first found), then 0c8c:0529.
  For a computer side ovl25:09ab is true, so the sinking test 0b62:0ea0 is skipped [V 0715].
* `k` and `c` are re-read from `a` (not the leader) after 05ff [V 01e0 reads [bp-4]].
* The +1/+1 offset sends a stack aimed at an **own** city to the city's lower-right square [V];
  for other owners the goto set by ovl29:0c7e is used unchanged.
* Return value is always 1 [V 027e].

#### ovl22:0284 move Search (only with Hidden Map, ovl25:0000) [V]

```
t7 = any own city (count-1..0) with role AI[+0x56+c] == 7          # 029d..02c6
AI[+0x22] = 0; AI[+0x24] = 0                                        # 02d2
for pass = 0, 1:                                                    # di, 02e2/044b
    for i = N-1..0:                                                 # 02f4
        a = army[i]
        skip unless a.owner == cur and a.x != -1 and a.flags & 0x20 # 0308, 031c, 0331
        hero = a.type == 0x1c
        skip if hero and pass != 0; skip if not hero and pass == 0   # 0347, 0360: heroes in pass 0
        if (hero and t7)                                            # 0379
           or (flies(a.type) and AI[+0x24] > 7 and a.strength < 4): # 039c, 03a7 signed, 03b8 signed byte
            a.+0xe &= 0xf0; a.+0xf &= 1; a.flags &= ~0x20           # 03ca..03e4: released
            continue
        ovl20:0e4b(i, -1)                                           # 03ef (explorer move, ovl20)
        if a.owner == cur:                                          # 040c (still alive / not lost)
            if flies(a.type): AI[+0x24] += 1 else: AI[+0x22] += 1   # 0428..043d
```
* AI[+0x24] = number of flying explorers kept this turn (after the 8th, weak flyers with strength
  < 4 are released) [V]; AI[+0x22] = non-flying explorers [V]. Their other readers (ai.md §3.1:
  ovl24:023f, ovl21:0000) are outside this section.
* A hero explorer is released as soon as the side has a city with role 7 [V] (role 7 is the
  task-force **staging** city, §3.2 / §6.13).
* Flag 0x20 = "explorer" [I from this function and 15c3, which sets it on allies before calling
  the same ovl20:0e4b]. 0e4b itself belongs to the ovl20 trace.

#### ovl22:0458 move Explore [V]

```
for i = N-1..0:                                             # 046d
    a = army[i]
    skip unless a.owner == cur and a.x != -1 and a.flags & 0x100      # 0481, 0495, 04aa
    a.flags &= ~0x100                                       # 04c0 (for every type)
    skip unless a.type == 0x1c                              # 04d1
    again = 1
    while again:                                            # 04e2 / 05ea
        n = ovl29:13b2(a.x, a.y, &list[8], (a.+0xe >> 4) & 7, a.+0xe & 0xf, 0)   # 0530
        if n == 0: break                                    # 053a
        if a.moves_left < 3: break                          # 0549 signed byte
        x0, y0 = a.x, a.y
        r = ovl22:11a6(&list)                               # 0586
        if r == 0 or r == 1: again = 0                      # 058e..059c; r == 2 (or other) keeps again
        if a.x == x0 and a.y == y0 and a.moves_left < a.max_moves: break    # 05ac..05e8 signed bytes
```
* ovl29:13b2(x, y, out, sub, kind, minmax) [V ovl29:13b2..14d2]: up to 8 own armies on (x, y) whose
  `(+0xe >> 4) & 7 == sub` and `+0xe & 0xf == kind`, and `+6 ≥ minmax` when minmax ≠ 0 (signed),
  scanned N−1..0; selects them (14d3) when ≥ 1 and copies the 8 slots (−1 padded) to `out`; returns
  the count. So the hero's square-mates with exactly the hero's order byte are collected [V].
* Flag 0x100 is set by 11a6 when it gives a site order (0ae7 flags argument 0x100, §2.10): Explore
  continues last turn's site missions [V for the flag path].
* The loop exits when the hero did not move although it had spent moves; it repeats when 11a6
  returned 2 (site searched: look for the next site) [V].

#### ovl22:05ff re-target the selected stack (flag 0x80) [V]

Called from 0000 when the moving army has flag 0x80 (set by ovl29:0ae7's flags argument elsewhere).
```
L = DS:5e62 (leader); c = (L.+0xf >> 1) & 0x7f; (x0, y0) = (L.x, L.y)   # 0607..0620
p = 100                                                                 # 0623
f = ovl18:0851(c)                                                       # 0629 (may we attack c's owner)
here = ovl62:044a(x0, y0)                                               # 0638 city on the square or -1
if owner(c) != cur:                                                     # 064c..065c
    if f != 0: return 1                                                 # 0827/0881
    for s = 0..7 with DS:5e3e[s] != null:                               # 0831
        m.+0xe &= 0xf0; m.+0xf &= 1; m.goto = (-1, -1)                   # no 0x40 here
    return 0                                                            # 0823
if here < 0 or ovl20:01f6(here, ids, dists) == 0:                       # 0661..067a
    ovl20:01f6(c, ids, dists)                                           # 0687
best = -1; bd = 1000                                                    # 068f/0694
for i = 5..0:                                                           # 0699..0738
    d = ids[i] (byte); skip if d == 0xff                                # 06a6
    skip if AI[+0x11e+d] & 1                                            # 06b4
    if 2c04:011a != 0: p = ovl29:15c5(d.x, d.y)                         # 06c1 (NeutralCities setting)
    skip if p < 75                                                      # 06f2 signed
    dd = dist(x0, y0, d.x, d.y)                                         # 071c 0a8b:0acc
    if dd < bd: bd = dd; best = d                                       # 0726 signed strict
if best != -1:                                                          # 073b
    for s = 0..7 with DS:5e3e[s] != null:                               # 0745
        m.+0xe = (m.+0xe & 0xf0) | 1; m.+0xf = (m.+0xf & 1) | (best & 0x7f) << 1
        ovl29:0c7e(m, 1, best)                                          # 0790 goto
    return 1
if 2c04:0124 == 0 (no Hidden Map): return 1                             # 07a6
if ovl61:225b() >= 10: return 1                                         # 07b1 (max(turn,1))
for s = 0..7 with DS:5e3e[s] != null:                                   # 07c2
    j = highest army index i (N-1..0) with &army[i] == DS:5e3e[s]       # 07d9..0804
    if j != -1: ovl20:0e4b(j, -1)                                       # 0815 (explorer move)
return 0                                                                # 0823
```
* ovl20:01f6(c, ids, dists) [V decompile, ovl20 trace owns it]: c's six neighbour entries
  NB[c*6+i] kept only when ≠ 0xff, ≠ AI[+0x46], intact, **owner 0x0f (neutral)**, and (no entry kept
  yet, or i < 2, or distance byte < 20); others 0xff / 0; returns the number kept. So 05ff only
  re-targets toward neutral cities [V].
* `p` is not reset per candidate: with 2c04:011a == 0 it stays 100 and every candidate passes; with
  011a ≠ 0 every candidate draws simulations (rnd) [V]. The order ties: i descending, strict `<`, so
  the highest neighbour slot wins ties [V].
* ovl18:0851(c) [V decompile]: 1 if c is neutral (0x0f) or relation[cur][owner] is war; if peace:
  0 unless the side is at war with nobody alive, or only with that owner; peace/neutral then need
  AI[+0x0c] & 1. (Owned by the diplomacy trace.)
* Result 0 makes move #1 skip the move; 1 moves the stack to its (possibly new) goto [V 01d9].

#### ovl22:0888 rescue [V]

```
for i = N-1..0:                                             # 089d
    a = army[i]
    skip unless a.owner == cur and a.x != -1                # 08b1, 08c5
    skip unless a.moves_left >= a.max_moves                 # 08e9 signed bytes
    if a.moves_left == a.max_moves + 2                      # 0918 (signed, widened)
       and terrain(a.x, a.y) != 10                          # 095f
       and (a.+0xe & 0xf) == 1                              # 097c
       and terrain(city c corner) != 10:                    # 09e3, c = (a.+0xf>>1)&0x7f: razed target
        for j = N-1..0:                                     # 0a12
            b = army[j]
            if b.owner == cur and b.x == a.x and b.y == a.y and (b.+0xe & 0xf) == 1
               and ((b.+0xf >> 1) & 0x7f) == c:
                b.+0xe &= 0xf0; b.+0xe &= 0x8f               # 0aaa/0ab7: kind and bits 4-6 cleared; +0xf kept
    # 0ac7
    skip if a.flags & 0x20                                  # 0ad1
    skip if (a.+0xe & 0xf) != 0                             # 0ae9
    skip if terrain(a.x, a.y) == 10                         # 0b30
    ovl22:0c5b(i)                                           # 0b3b
```
* `moves_left == max + 2` means the army kept the full carry of 2 (EL §4.4: carry = min(left, 2)):
  it did not move last turn [I from EL §4.4].
* Explorers (0x20), armies with any order and armies in a city are left alone [V].

#### ovl22:0b4d last rescue [V]

```
for i = N-1..0:                                             # 0b5e
    a = army[i]
    skip unless a.owner == cur (cwde, word cmp) and a.x != -1      # 0b73, 0b87
    skip unless a.moves_left == a.max_moves + 2             # 0bb7 signed
    skip if terrain(a.x, a.y) == 10                         # 0bfe
    a.flags &= 0xff5f                                       # 0c10: clears 0x20 and 0x80
    a.+0xe &= 0xf0                                          # 0c1e (bits 4-6 kept, +0xf kept)
    a.goto = (-1, -1)                                       # 0c31 (+0x14), 0c42 (+0x12)
    ovl22:0c5b(i)                                           # 0c4a
```
Unlike rescue, it ignores the order and the explorer flag: every army that sat still for a whole
turn outside a city is re-planned [V].

#### ovl22:0c5b(i) send army i (and its square-mates) to a city [V]

```
a = army[i]
near = ovl20:0981(a.x, a.y, cur)                            # 0c97: min dist(a, own intact city), start 10000, strict <
weak = a.strength (+8) < 3 or a.allowance (+6) < 8          # 0cac, 0cbe signed bytes -> di
if not flies(a.type) and weak:                              # 0cde..0ce9
    ovl24:015e(i, 1); return                                # 0cee: DISBAND the army (see below)
n = ovl29:12c9(a.x, a.y, &list[8], 8)                       # 0d25: own armies on the square with moves_left >= 8; selected
if n == 0: return                                           # 0d32
changed = 0
for s = 7..0: if list[s] != -1 and army[list[s]].moves_left < 8: list[s] = -1; changed = 1   # 0d3e (never true after 12c9's filter)
F = H = O = 0
for s = 7..0 with list[s] != -1:                            # 0d8d
    if flies(type): F += 1 elif type == 0x1c: H += 1 else: O += 1
if F and H and O:                                           # 0de5..0df5
    for s = 7..0 with list[s] != -1, not flies, not hero: list[s] = -1; changed = 1   # 0dfc..0e4e: walkers stay
if changed: ovl29:14d3(&list)                               # 0e61 reselect
if n < 2 and weak:                                          # 0e69 (n = 12c9's count, before filtering)
    ovl24:015e(i, 1); return                                # 0e76 (a weak flyer alone is disbanded)
0c8c:0529()                                                 # 0e81 stack move mode -> DS:5dfc / 5dfa
lim = (a.strength / 2) * 10 if DS:5e5e == null else 50      # 0e86..0ea8: no hero: signed /2 truncating (cdq,sub,sar), then ·10
lim = min(near + 10, lim)                                   # 0ead..0ec1 (near+10 if strictly smaller)
0555:1ab9(lim, a.x, a.y, DS:5dfc, DS:5dfa)                  # 0eea distance map from the army's square
t = ovl22:0f3c(n)                                           # 0ef7
if t != -1:
    ovl29:0ae7(&list, 1, t, 0)                              # 0f0c order kind 1 city t, flags 0
    0a8b:0001(leader.goto_x, leader.goto_y, 0)              # 0f22
else:
    ovl24:00ca(&list, 1)                                    # 0f30: disband every army in the list
```
* ovl24:015e(i, redraw) [V decompile]: a hero goes through ovl36:16cd (hero removal), then
  0b62:03be (delete the army), redraw of the square when `redraw`. ovl24:00ca(list, redraw) does this
  for each list entry 7..0 and then ovl62:0000 [V decompile]. So **rescue / last rescue disband**
  idle walkers that are weak (strength < 3 or max moves < 8) and stacks that find no reachable
  target city within the search limit [V]. (Names of ovl24 helpers belong to the ovl24 trace.)
* The search limit is in pathfinder cost units (§4.3): up to 10 more than the straight-line distance
  to the nearest own city, capped at 10·⌊strength/2⌋ (no hero; strength here is the **trigger
  army's**, not the stack's) or 50 with a hero [V].
* `n` passed to 0f3c is the 12c9 count (before the walkers were dropped) [V 0ef2 pushes [bp-2]].

#### ovl22:0f3c(n) choose a target city from the distance map [V]

```
T = 0555:1b0a()                                             # 0f44 lock the distance table (far ptr)
best = -1; bv = 1000; big = n >= 4                          # 0f4f, 0f54, 0f59 signed
for c = count-1..0:                                         # 0f76
    skip unless intact(c)                                   # 0faf
    skip if AI[+0x11e+c] & 1                                # 0fc0
    skip if c == AI[+0x46]                                  # 0fcf
    o = owner(c)
    skip unless o == 0x0f or o == cur or (relation[cur*8 + o] & 3) == 2   # 0fe2..102f (cur's row)
    d = ovl21:0a85(c, &x, &y, T, 0)                         # 1045: min |T| over c's squares, < 100
    skip if x == -1                                         # 104f unreachable within cap
    if o != cur:                                            # 106a
        p = ovl29:15c5(c.x, c.y)                            # 108f simulations (rnd)
        skip if p < 75                                      # 109a signed
        v = d
    else:
        v = d + (10 if role(c) == 7 else 30)                # 10a8..10b7
        if big: v += 100                                    # 10bf
    if v < bv: bv = v; best = c                             # 10c2 signed strict: highest index wins ties
0555:1b2e()                                                 # 10d7 unlock
return best
```
* ovl21:0a85(c, &x, &y, T, flag) [V decompile]: cap = 100 (flag 0) or 1000; iterates the city's
  squares through the offset list DS:07d8 (0a8b:0b4d), reads `T[x*0x9c + y]` (word, byte offset
  `x*0x138 + y*2`), keeps the smallest `|value|` strictly below the cap and its square; x = y = −1
  when none, and then the return value is the cap (100 here). So the table is x-major, 156 words
  per column. DS:07d8 = {0,2,2,4,4,4,6,6,6,0,0,0} are cumulative steps (0a8b:0b4d, listing
  ovl21:0ad5..0b4d) that walk the **12-square ring around the 2×2 block**, not the city's own
  squares (§6.8 0a85, §7a.4) [V].
* Every foreign candidate within reach costs AI[+0x20] battle simulations [V].

#### ovl22:10e3 specials [V]

```
for c = count-1..0:                                         # 10f7
    skip unless owner(c) == cur (byte cmp)                  # 110b
    skip unless AI[+0x11e+c] & 0x20                         # 1122
    skip if role(c) == 7                                    # 112d
    n = ovl29:13b2(c.x + 1, c.y, &list[8], 0, 0, 0)         # 115e: own armies on the city's upper-right square with order byte low 7 bits 0
    if n == 0: continue
    r = ovl22:11a6(&list)                                   # 1171
    if r == 1 and ovl29:0fd5(c) == 0:                       # 1177, 1184 (no partly finished production)
        role(c) = 13                                        # 1194
```
* r == 1 means "a hero but no flyer on the square" (§2.10): the city is switched to role 13 [V]
  (role 13 is turned back into 4/8 by ovl25:0386 next turn, ai.md §6.0 [V]). Bit 0x20 of
  AI[+0x11e+c] ("city holds a hero") is written only by ovl24:023f (clean city, §6.9: cleared
  with 0x10 at ovl24:0514, set at 0527) [V grep].

#### ovl22:11a6(list) hero + flyer exploration [V]

```
hero = flyer = -1                                           # 11c4..11c6
for s = 0..7:                                               # 11cc
    e = list[s]                                             # NOTE: e may be -1: type read from army[-1] (map bytes 1e1d:886e..)
    if hero == -1 and army[e].type == 0x1c: hero = e        # 11e5
    if flyer == -1 and flies(army[e].type): flyer = e       # 121d (same entry may be both)
if hero == -1: return 0                                     # 1236
if flyer == -1: return 1                                    # 123e
hx, hy = hero.x, hero.y
list[0..7] = -1; list[0] = hero; list[1] = flyer            # 1278..1292
flyer.+0xe &= 0xf0; hero.+0xe &= 0xf0; flyer.+0xf &= 1; hero.+0xf &= 1   # 12a0..12e0
bs = -1; site = -1; city = -1                               # bp-4, bp-2, bp-6
for s = sites-1..0:                                         # 2c04:080f; 12f2
    (sx, sy) = site s position
    skip if some army j (N-1..0), j != hero, owner cur, type 0x1c, kind 3, index s exists   # 1327..1387
    skip unless ovl29:16ae(sx, sy)                          # 13a4: a 3x3 neighbour has road-layer bit 0x20 (seen)
    skip unless terrain(sx, sy) == 11                       # 13d4
    skip if site.kind (+0x18) == 1                          # 13e9: temples ignored
    skip if map high byte bit 0x40 (searched) at (sx, sy)   # 1404..1411
    d = dist(hx, hy, sx, sy)                                # 141f
    if d < 15 and 215 - d > bs: bs = 215 - d; site = s      # 1429..1460 (15 + 200 - d), signed
    elif d < 40 and 90 - d > bs: bs = 90 - d; site = s      # 1443..1460 (40 + 50 - d)
for c = count-1..0 with owner(c) == cur (byte cmp):         # 147a
    d = dist(hx, hy, c.x, c.y)                              # 14c3
    if role(c) == 7: d -= 80                                # 14d3
    if d < 15 and 115 - d > bs: bs = 115 - d; city = c      # 14dd..150e (15 + 100 - d)
    elif d < 40 and 40 - d > bs: bs = 40 - d; city = c      # 14f7..150e
if site != -1:                                              # 151b (site wins whenever one qualified)
    ovl29:0ae7(&list, 3, site, 0x100)                       # 152d order kind 3, flags 0x100
    0a8b:0001(leader.goto_x, leader.goto_y, 0)              # 1543
    return ovl22:15c3(hero, site)                           # 1551 -> 0 or 2
if city != -1 and dist(hx, hy, city.x, city.y) > 2:         # 1559, 158d signed
    ovl29:0ae7(&list, 1, city, 0)                           # 159d
    0a8b:0001(leader.goto_x, leader.goto_y, 0)              # 15b3
return 0
```
* Scores are signed words; ties keep the earlier (higher-index) candidate (`jle` skip) [V].
* The city pass shares `bs` with the site pass but writes only `city`, so the site wins whenever
  any site qualified [V]. A role-7 city counts 80 squares nearer (d may go negative: 115 − d grows) [V].
* The hero and flyer keep bits 4-6 of +0xe at 0 (the `or 0` at 12b6 is a no-op) [V]; 0ae7 then sets
  kind and index.
* `list[s] == -1` read: army[-1] is 0x16 bytes below 1e1d:8880, i.e. the end of the map words
  (row 155); its "+4" byte is 1e1d:886e. Harmless: a match would assign `e` = −1, i.e. leave the
  variable at −1 [V by the code shape]. Reimplementation: skip −1 entries.

#### ovl22:15c3(i, s) search a site on arrival [V]

```
(sx, sy) = site s position; a = army[i]
if a.x != sx or a.y != sy or a.moves_left == 0: return 0    # 1604, 1618, 162f
if terrain(sx, sy) != 11: return 2                          # 1657
if site.kind != 1 and map high byte bit 0x40 at (sx, sy): return 2   # 166c, 168c (searched ruin)
DS:5e62 = &a                                                # 16a7
ovl34:0000()                                                # 16b0 Search command (EL §5)
if site.kind == 1 and 2c04:011e (Quests) != 0 and quest[cur].active (2c04:1103 + 0xc*cur) == 0:
    ovl01:0d7a(1)                                           # 16ed quest assignment
if a.type != 0x1c: return 0                                 # 16fd
for k = 0..DS:5dfe-1 with DS:5e3e[k] != null: flags &= ~0x40   # 170c..172e (signed <)
if not HiddenMap: return 2                                  # 1735
if site.kind != 5: return 2                                 # 174a (allies ruin)
for j = N-1..0:                                             # 1762
    b = army[j]
    if b.owner == cur and (b.+0xe & 0xf) == 0 and w13(b.type) and b.x == sx and b.y == sy:
        b.flags |= 0x20; ovl20:0e4b(j, -1)                  # 17e1, 17ea
return 2
```
* `site.kind` is read **after** ovl34:0000 for the quest test (16bf) and the allies test (174a):
  ovl34:0000 sets kind 0 when a ruin is emptied (EL §5 table), so the allies branch runs only if the
  kind is still 5 afterwards [V reads order; I effect of ovl34 on +0x18 from EL].
* Allies (w13 types) found in a ruin under Hidden Map become explorers (0x20) and move off at once
  [V].
* Called from the move executor 0a8b:0001 too (§4.1), so any AI stack that stops on its site
  target searches it [V call site, see §4.1].

### 6.6a ovl23: debug text output (no AI logic) [V]

ovl23 is a tiny text renderer used for developer/status messages; it changes no game state.

| address | args | behaviour |
|---|---|---|
| ovl23:0000 | (col, row, str far, colour, inverse, len) | for k < len (unsigned): draw str[k] via 0144, a space (0x20) once the string's NUL is reached (the pointer stops advancing) [V decompile] |
| ovl23:005a | (col, row, str far, colour, inverse) | draw up to 0x50 chars until NUL [V decompile] |
| ovl23:0099 | (col, row, value, digits, colour, inverse) | right-aligned decimal of `value` (5 digits, leading zeros as spaces, last digit always) [V decompile] |
| ovl23:0144 | (col, row, ch, colour, inverse) | writes the 8×8 glyph of `ch` from the BIOS ROM font (F000:FA6E + 8·ch) straight into VGA planar memory A000 (bytes per row 0x50 when the video mode byte *DS:34e7 is 1, 2 or 4, else 0x28), inverted when `inverse`; then 0247 [V decompile] |
| ovl23:0247 | () | when DS:3384 ≠ 0, resets VGA GC registers 8 (bit mask 0xff) and 5 (mode 0) [V decompile] |
| ovl23:026b | (buf far, col, row, len, colour) | line editor on top of 0144 with key loop ovl59:020d (not reached from AI code) [V decompile] |
| ovl23:0478 | (str far, line, wait) | `if line >= 3 or 0x0d0[cur] == 0` (human side): 12bf:07a5 (unless line 4), draw `str` at DS:07f6[line], DS:0800[line] for DS:080a[line] chars with colour 0xf if wait else 7, 12bf:0757; if wait: ovl59:0142, redraw in colour 7. Otherwise nothing [V 0483..0532] |

Callers of 0478: 0555:06f7 (path search error "ERROR - (%d, %d) (%d, %d) %d %d", DS:0242,
line 0, wait 1) and ovl29:1765 (line 0, wait 1). Both use line 0, so **during a computer side's turn
nothing is drawn and nothing waits** [V 0483..04a1]. A reimplementation of the AI can ignore ovl23.
[I: ovl59:0142 is a key/delay wait; 12bf:07a5/0757 hide/show the mouse cursor — names only, not
needed.]

### 6.7 rescue, ovl22:0888

See §6.6 (ovl22:0888). [V]
### 6.8 evaluate, ovl21:0000 (and update hide ovl21:0c1c, task-force classification 01b3) [V]

Traced by a helper from the listing (out/re/ai/sections/ovl21_evaluate.md; the Ghidra output for
01b3 is spliced from another segment and must not be used). No rnd() in any of it.

#### ovl21:0000(side) — evaluate

Input: `side` = [bp+6] (the caller pushes 2c04:0110, ovl25:0200) [V]. Output: AI block fields; no
return value (void, ax not used by ovl25:020a) [V].

```
0006  ovl21:09cf()                                   # flying-slot bit1 refresh (below)      [V]
000b  ovl21:0b55()                                   # Hidden Map unseen-bit refresh (below) [V]
000f  AI[+8] = AI[+6] = AI[+4] = AI[+2] = 0          # words (+0x00 is NOT cleared)          [V]
002a  for c in count-1..0:                           # di; loop test 011c                   [V]
006b      if not intact(c):                          # terrain(2c04:0710[tile]) != 10       [V]
0079          AI[+0x56+c] = 0; AI[+0xba+c] = 0;  continue                                    [V]
009d      if owner(c) == side:                       # signed byte vs word, je 00f5          [V]
00f9          AI[+2] += 1                            # word                                  [V]
00ff          AI[+0xba+c] += 1                       # byte, wraps 255 -> 0 (inc byte)        [V]
010a          if AI[+0x56+c] == 0: AI[+0x56+c] = 1                                           [V]
          else:                                      # intact city not owned by side
00a8          if AI[+0x11e+c] & 1: AI[+8] += 1       # unseen (Hidden Map) foreign city      [V]
00be          AI[+0x56+c] = 0; AI[+0xba+c] = 0                                               [V]
00d9          if owner(c) == 0x0f: AI[+6] += 1       # neutral                               [V]
00ef          else:                AI[+4] += 1       # another player's                      [V]
0126  if AI[+2] == 0: return                         # no own city: AI[+0] NOT incremented   [V]
0136  for c in count-1..0:                           # loop test 01a1                        [V]
0143      if AI[+0x56+c] == 8 and AI[+8] != 0 and AI[+0x24] < 5 and (AI[+0x11e+c] & 2):
016c          AI[+0x56+c] = 11                       # 0x0b                                  [V]
                                                     # AI[+0x24] compared signed (jge 0171)  [V]
0177      if AI[+0x56+c] == 1:                       # also catches nothing else             [V]
0185          n = ovl20:01f6(c, NULL, NULL)          # eligible neutral neighbours (below)   [V]
018f          AI[+0x56+c] = 3 if n != 0 else 5                                               [V]
01ac  AI[+0] += 1                                    # word                                  [V]
```

Notes
* The second loop does not test ownership [V]; it only matters for roles 8 and 1. Role 1 can only
  be present on cities owned by `side` (the first loop zeroes every other city's role and only
  sets 1 on own cities) [V]. A role-8 byte also survives only on own cities, because the first loop
  zeroes the role of every non-own or razed city [V]. So both rewrites apply to own cities only.
* The 8→11 test is done before the 1→3/5 test in the same iteration; 11 is not 1, so a city is
  rewritten at most once [V].
* The roles are only zeroed for non-own cities; an own city keeps whatever role it had (2..14)
  except 0 → 1 → 3/5 in the same call and 8 → 11 [V].
* AI[+0xba+c] counts the evaluate calls (≈ turns, since evaluate runs once per computer turn) for
  which c has been continuously owned and intact; reset to 0 when lost or razed [V for the code,
  I for "turns owned"]. Read by ovl25:0c83 (compared with 4) and ovl24 [V per ai.md §3.1].
* AI[+0] counts the turns on which the side owned at least one city (never reset after 084d)
  [V]; ovl19:0004 skips the whole assault phase while it is 0 [V ovl19:0008].
* Order of side effects inside the loop: AI[+8] is tested/incremented **before** the role is
  zeroed; nothing depends on that order [V].

ovl20:01f6(c, ids far, dists far) contract (read from ovl20.asm 01f6..02fe) [V]:
```
n = 0
for i in 0..5:                                       # ascending, dx
    if ids:   ids[i] = 0xff
    if dists: dists[i] = 0
    d = NB[c*6 + i]                                  # DS:40ea neighbour table (byte)
    skip if d == 0xff
    skip if AI[+0x46] == d                           # word compare
    skip if not intact(d)
    skip if owner(d) != 0x0f                         # neutral only
    skip if n != 0 and i >= 2 and NB[600 + c*6 + i] >= 20     # unsigned byte (jae 02f0)
    if ids:   ids[i] = d
    if dists: dists[i] = NB[600 + c*6 + i]
    n += 1
return n
```
i.e. the neutral, intact neighbour cities of c (from the 6-entry neighbour list, ai.md §4.2),
except AI[+0x46]; the first two list positions always count, later ones only when nothing was
found yet or their stored distance is < 20.

#### Role values produced by ovl21:0000 (complete list) [V]
| value | condition | proposed meaning |
|---|---|---|
| 0 | city razed (terrain ≠ 10), or not owned by `side` | `ROLE_NONE` [V for condition] |
| 1 | own city whose role was 0 (newly owned / first evaluated) — transient, always turned into 3 or 5 within the same call | `ROLE_NEW` [V] |
| 3 | from 1: at least one eligible neutral neighbour (ovl20:01f6 ≠ 0) | `ROLE_EXPAND` [I: has a neutral city next to it to take] |
| 5 | from 1: no eligible neutral neighbour | `ROLE_INTERIOR` [I] |
| 11 | from 8, when AI[+8] ≠ 0 (some foreign city still unseen), AI[+0x24] < 5 (signed), and the city has a flying-type slot (bit1, refreshed by 09cf at the start of this call) | [I] switches to producing flyers for exploring (role 11 is turned back into 4/8 by ovl25:0386, ai.md §3.2) |

Other writers of the role byte (for cross-reference, not traced here): ovl19 (7, 8), ovl20 (2, 3, 4),
ovl22:1194 (13), ovl24 (4, 5, 8), ovl25:0386 (from table / 11 / 13), ovl25:08c0 (7), 0c73 (5),
0d1d (14), 0d3f (8), ovl27 (6, 7, 8), ovl21:0c1c (3), ovl21:084d (0/4) [V: grep of `mov byte
es:[bx+0x56]` in out/asm].

#### Words written by ovl21:0000 [V]
| field | value after the call | proposed name |
|---|---|---|
| AI[+0x00] | +1 per call with AI[+2] ≠ 0 | `turns_with_cities` |
| AI[+0x02] | number of intact cities owned by `side` | `own_cities` |
| AI[+0x04] | number of intact cities owned by another player (owner ≠ side, ≠ 0x0f) | `enemy_cities` |
| AI[+0x06] | number of intact neutral cities | `neutral_cities` |
| AI[+0x08] | number of intact non-own cities (neutral or enemy) with AI[+0x11e+c] bit0 (unseen) | `unseen_cities` (always 0 without Hidden Map: bit0 is only ever set by 084d under Hidden Map) |

#### ovl21:09cf() — flying-slot bit [V]
```
09db for c in count-1..0:                            # dx
0a1c     if not intact(c): continue                  # razed cities keep their old bit1
0a2c     AI[+0x11e+c] &= 0xfd
0a32     f = 0; for s in 3..0:                       # cx
0a43         t = (signed) 2c04:[0x1593 + 0x41·c + s] ; if t != -1 and DS:45c4[6t] (flies) != 0: f = 1
0a68     if f: AI[+0x11e+c] |= 2
```
Runs for **every** intact city, whatever its owner [V]. Only type byte 0xff counts as empty (cwde
then `cmp ax,0xffff`) [V]. Proposed name for bit1: `CF_HAS_FLYER_SLOT`.

#### ovl21:0b95(c) — clear unseen bit [V]
```
x0 = c.x (157d), y0 = c.y (157f); seen = 0
0bc6 for x in x0-1 .. x0+2:                          # dx, inclusive (cmp x0+2,dx; jge)
0bcb     for y in y0-1 .. y0+2:                      # cx, inclusive
0bd8         if 19d9:[y*0x70 + x] & 0x20: seen = 1   # road/explored layer, bit 0x20
0c06 if seen: AI[+0x11e+c] &= 0xfe
```
No bounds check [V]: x0-1 = -1 or x0+2 = 0x70 read the neighbouring row's byte (index
`y*0x70+x` linearly to stay exact); y0-1 = -1 gives a 16-bit offset 0xff90+x, which wraps to
19d9:ff8f.. (64 KiB past the layer start, not before it: unknown memory) [V 0bd1..0bdd]. [I] cities
are never placed on row 0 or column 0 / 0x6e+, so this is harmless; a reimplementation may treat
off-map squares as unseen.
Bit 0 of AI[+0x11e+c] = `CF_UNSEEN` [I from 084d (set for all cities when HiddenMap) and this
clear rule]: the city counts as seen once any square of the 4×4 block x0-1..x0+2 × y0-1..y0+2 is
explored. It is never set again after 084d [V: grep of every `or/and/mov byte es:[bx+0x11e]` in
out/asm: bit0 is set only at ovl21:0928 (084d) and cleared only at ovl21:0c12 (0b95); other
overlays only `test` it].
Other writers of AI[+0x11e+c] for reference [V grep]: ovl29:128e |= 2 (11d5), ovl25:044b &= 0xfb,
ovl24:02d8 |= 4, ovl24:0514 &= 0xcf, ovl24:0527 |= 0x20, ovl24:053a |= 0x10.

#### ovl21:0b55() [V]
```
0b5e if 2c04:0124 (HiddenMap) == 0: return
0b6b for c in count-1..0:  if AI[+0x11e+c] & 1: ovl21:0b95(c)
```

#### ovl21:0c1c() — update hide (called only when HiddenMap, ovl25:028a) [V]
```
0c24 ovl21:0b55()                                    # refresh unseen bits first
0c2d for c in count-1..0:                            # si, test 0c87
0c3a     if AI[+0x56+c] != 2: continue
0c4a     ovl20:01f6(c, ids = local[6] at bp-8, dists = NULL)
0c52     for i in 5..0:                              # di 6→ i = di-1 (test at 0c80 before body)
0c57         d = ids[i] (byte, zero-extended)
             if d != 0xff and not (AI[+0x11e+d] & 1):   # eligible neutral neighbour that is seen
0c79             AI[+0x56+c] = 3; break
```
Only role 2 → 3 is produced [V]. Role 2 is written by ovl20 (01b5, 0397) [V grep]; [I] it is the
"has neutral neighbours, but all of them unseen" variant of role 3, promoted as soon as one of
them has been explored. The ids buffer is filled completely by 01f6 (0xff for non-eligible
entries) before it is read, so no stale stack bytes are used [V].

#### ovl21:0a85(c, &x, &y, table far, flag) — nearest ring square of a city in a distance table [V]

Arguments [V, 0a8d..0ac3 and the caller ovl29:07a0..07b3]: [bp+6] city c; [bp+8] far int *px;
[bp+0xc] far int *py; [bp+0x10] far word table (the locked distance map, `table[x*0x9c + y]`,
i.e. byte offset x*0x138 + y*2 — column-major, 156 words per x); [bp+0x14] flag.
```
0a90 best = 1000 if flag != 0 else 100               # di
0aa0 i = 0; x = c.x; y = c.y                         # locals bp-2 / bp-4, start at the city corner
0ac6 *py = -1; *px = -1
0ad5 loop:
0ad9     dir = DS:07d8[i]; if dir == -1: return best
0af2     if not 0a8b:0b4d(&x, &y, dir): return best  # step leaves the map -> stop the WHOLE scan
0b11     v = |table[x][y]|                           # cwd / xor / sub: 16-bit abs, abs(-32768) = -32768
0b19     if v < best:                                # signed, strict: first square in walk order wins ties
             best = v; *px = x; *py = y
0b4c     i += 1
```
0a8b:0b4d(&x, &y, dir) [V res_0a8b.asm 0b4d..0b99]: nx = x + DS:2b16[dir], ny = y + DS:2b04[dir];
if nx < 0 or ny < 0 or nx == 0x70 or ny == 0x9c: return 0 (x, y unchanged); else x = nx, y = ny,
return 1. The steps are **cumulative** (x, y are updated in place).

Direction tables (read from the EXE image, DGROUP file offset 0x2000+0x31250+off) [V]:
DS:2b16 (dx) = 0, 1, 1, 1, 0, -1, -1, -1, 0; DS:2b04 (dy) = -1, -1, 0, 1, 1, 1, 0, -1, 0
(dir 0 N, 1 NE, 2 E, 3 SE, 4 S, 5 SW, 6 W, 7 NW, 8 none).
DS:07d8 = 0, 2, 2, 4, 4, 4, 6, 6, 6, 0, 0, 0, -1 (only reader ovl21:0a85, xref_ds.tsv) [V].

So relative to the city corner (cx, cy) (the city covers cx..cx+1 × cy..cy+1) the squares are
visited in this order — the 12-square ring around the 2×2 city, clockwise from the square above
the corner [V by composing the tables]:
```
(0,-1) (1,-1) (2,-1) (2,0) (2,1) (2,2) (1,2) (0,2) (-1,2) (-1,1) (-1,0) (-1,-1)
```
Contract: returns the minimum |d| over the ring squares visited (cap 100, or 1000 with flag),
strictly below the cap; (*px, *py) = the first square in walk order achieving it, or (-1, -1)
when no visited square has |d| < cap (then the return value is the cap). If a step would leave
the map (x = -1/0x70 or y = -1/0x9c), the remaining ring squares are **not** examined [V].
The city's own four squares are never looked at [V]. Unreached squares of the distance map hold
0x7531 (EL §4.3, 0555:08bf), which never beats the cap [I: from EL; the map builder 0555:000a
was not re-traced here]. The meaning of negative entries (abs is taken) is [U] (distance-map
encoding, 0555:000a subtree).

Callers: ovl29:0749 (neighbour table, flag 0), ovl29:1885 (target choice), ovl19:0b49, ovl22:0f3c
[V funcs.tsv]; all treat *px == -1 as "unreachable" (ovl29:07bd shown) [V for 0749].

#### ovl21:01b3() — task-force capability classification (listing only; Ghidra output is wrong)

No arguments; reads cur = 2c04:0110. Called by ovl19:0011 (start of assault, after the
`AI[+0] != 0` test) and ovl27:01b2 (last call of assault XX) [V]. Returns ax = 0 (loop-exit value
at 0841) and both callers ignore it [V: ovl19:0016 reloads ax; ovl27 returns straight after].
TF[k] = task-force record at AI[+0x24c + 0x5c·k]; TF[k].active = word +0, +0x58 = word at
AI[0x2a4+0x5c·k], +0x5a = word at AI[0x2a6+0x5c·k].
Slot fields of city c, slot s: type = signed byte 2c04:[0x1593+0x41·c+s], str = signed byte
[0x159b+…], moves = signed byte [0x159f+…] (all cwde'd / compared as signed bytes) [V].
`w15(t)` = byte DS:45c9[6t] (= 45c4+5), `flies(t)` = byte DS:45c4[6t] (00_shared.md) [V addresses].
`eff(c,s)` = str + 2 if w15(type) == 1 else str (same rule as ovl29:1a4d / 1ae9) [V].
`ok(c)` = ovl27:0a7a(c, 1) [V push 1 at 0390/0475/05ac] (c is not the staging city of an active task force and has role 8 or 5, or 6):
```
ovl27:0a7a(c, also6) [V ovl27.asm 0a7a..0aec]:
    for k in AI[+0x24a]-1..0: if TF[k].active and TF[k].staging(+4, AI[+0x250]) == c: return 0
    if role(c) in (8, 5): return 1
    if also6 and role(c) == 6: return 1
    return 0
```

```
# A — active task forces
01bb n_tf = #{k in AI[+0x24a]-1..0 : TF[k].active != 0}                          [V]
01e8 AI[+0x40] = AI[+0x3e] = AI[+0x3c] = AI[+0x3a] = 0                           [V]
01fe arr[0..7] = 0  (words, bp-0x24)                                             [V]

# B — strength sample over buildable cities
021d for c in count-1..0:                                    # si, test 030b
023a     if owner(c) != cur: continue                        # no intact test     [V]
024a     AI[+0x11e+c] &= 0x37                                # clears bits 3, 6, 7 [V]
0256     if AI[+0x56+c] == 7: continue                                            [V]
0266     if ovl29:1a4d(c, &slot) == 0: continue              # slot = bp-2        [V]
0275     lim = v_prev; idx = -1                              # cx = di BEFORE di is reassigned [V]
0289     v = eff(c, slot)                                                         [V]
02b3     for i in 7..0:                                      # dx
02c1         if arr[i] == 0: arr[i] = v; idx = -1; break     # first empty from the top [V]
02e0         if arr[i] < lim: lim = arr[i]; idx = i          # signed, strict     [V]
02f8     if idx != -1: arr[idx] = v                          # only when no empty slot was found [V]
         v_prev = v                                          # di keeps v into the next city [V]

# C — threshold
0315 m = 100; for i in 7..0: if arr[i] != 0 and arr[i] < m: m = arr[i]           [V]
0347 AI[+0x3a] = 4 if m > 4 else m                                                 [V]

# D — flyer group (bit 0x40), only with 4 active task forces
035b if n_tf == 4:
0369   for c in count-1..0:
0386     if owner(c) == cur and ok(c) and (AI[+0x11e+c] & 2):
03b1       f = any s in 3..0 with type >= 0 and flies(type) != 0 and str > 4    # signed, jle 03f5 [V]
03fc       if f: AI[+0x3c] += 1; AI[+0x11e+c] |= 0x40                         [V]
041a f3c = AI[+0x3c] > 3;  r = AI[+0x3c] - 4 if f3c else AI[+0x3c]                [V]

# E — fast group (bit 0x80), only with >= 3 active task forces
0440 if n_tf >= 3:
044e   for c in count-1..0:
046b     if owner(c) != cur or not ok(c): continue
048d     if AI[+0x11e+c] & 0x40:
0495         if r == 0: continue                          # keeps 0x40, not tested further [V]
04a2         AI[+0x11e+c] &= 0xbf; r -= 1                 # released, falls through   [V]
04a9     f = any s in 3..0 with type >= 0 and (w15(type) == 1 or str >= AI[+0x3a]) and moves >= 16   [V]
0519     if f: AI[+0x3e] += 1; AI[+0x11e+c] |= 0x80                                  [V]
0537 fast_many = AI[+0x3e] > 7;  nslots = 0                                          [V]
0551 f3e = AI[+0x3e] > 3;  r = AI[+0x3e] - 4 if f3e else AI[+0x3e]                   [V]

# F — medium group (bit 0x08), only with >= 2 active task forces
0577 if n_tf >= 2:
0585   for c in count-1..0:
05a2     if owner(c) != cur or not ok(c): continue
05c4     if AI[+0x11e+c] & 0x40: continue                                            [V]
05d5     if AI[+0x11e+c] & 0x80:
05dd         if r == 0: continue
05ea         AI[+0x11e+c] &= 0x7f; r -= 1                                            [V]
05f1     f = 0
         for s in 3..0:
             if type >= 0 and (w15(type) == 1 or str >= AI[+0x3a]) and moves >= 12:
0657             nslots += 1                              # per qualifying SLOT    [V]
065a             if not fast_many or moves >= 16: f = 1                             [V]
067e     if f: AI[+0x40] += 1; AI[+0x11e+c] |= 8                                     [V]
069c many12 = nslots > 7                                                             [V]
06ac f40 = AI[+0x40] > 3;  r = AI[+0x40] - 4 if f40 else AI[+0x40]                   [V]

# G — trim the medium group (no ok() test, runs always)
06d7 for c in count-1..0:
06f3     if owner(c) == cur and (AI[+0x11e+c] & 0xc0) == 0 and (AI[+0x11e+c] & 8) and r != 0:
0720         AI[+0x11e+c] &= 0xf7; r -= 1                                            [V]

# H — task-force parameters
072e for k in AI[+0x24a]-1..0:                                    # cx
0745     if TF[k].active == 0: continue
075b     TF[k].+0x58 = 8
0764     if k > 3 (unsigned): continue                               # jump table cs:0845 [V]
         switch k:
0773       0: TF[0].+0x58 = 12 if many12 else 8
0794       1: TF[1].+0x5a &= ~0x10
07a5          if f40:  TF[1].+0x5a |= 0x10;  TF[1].+0x58 = 12      # else (je 0837) +0x58 stays 8
07c1       2: TF[2].+0x5a &= ~0x08
07d2          if f3e:  TF[2].+0x5a |= 0x08;  TF[2].+0x58 = 16      # else +0x58 stays 8
07fd       3: TF[3].+0x5a &= ~0x20
080e          if f3c:  TF[3].+0x5a |= 0x20;  TF[3].+0x58 = 12      # else +0x58 stays 8
0841 return 0
```

Notes on 01b3
* Phase B is **not** a "keep the 8 strongest" filter [V]: once the 8 slots are full, the new value
  v replaces the smallest entry that is below `lim` = the previous qualifying city's v (strict `<`,
  scanning 7..0, so the highest index wins ties), even when v is smaller than that entry. If no
  entry is below lim, nothing is replaced. While a 0 entry exists the scan inserts there (slots
  fill from 7 downwards). The caller's di at entry is never used: lim matters only when the array
  is full, i.e. after ≥ 8 qualifying cities, when di holds the previous v [V by control flow].
  A v of 0 would look like an empty slot [V; I that eff ≥ 1 for every buildable type].
* AI[+0x3a] ∈ 1..4 (4 when no own city passes B, or when every sampled strength is > 4)
  [V; I that eff ≥ 1]. Proposed name `min_member_strength`.
* TF.+0x58 is 8 unless the matching group flag is set (TF 1: 12, TF 2: 16, TF 3: 12); TF 0 is the
  exception: 12 iff many12 (more than 7 qualifying slots in F), else 8 [V].
* Group trimming rule [V]: the second and third groups consume the previous group's surplus. With
  G ≥ 4 cities in a group, the first G-4 group members met in the next scan (count-1..0) lose the
  bit and are re-tested for the next group; the remaining 4 keep it. With G ≤ 3 every member loses
  it (r = G) and the matching flag (f3c / f3e / f40) is 0. Exactly the same in G for bit 8: with
  ≥ 4 medium cities the first AI[+0x40]-4 (scan order count-1..0) lose bit 8, else all lose it.
  In D/E/F a city still holding a bit it was allowed to keep is skipped (`continue`) [V].
  Every 0x40 city re-passes ok() in E (D required ok(); nothing in between changes roles or task
  forces), so the surplus is released strictly in scan order; same for 0x80 in F [V].
* AI[+0x3c], +0x3e, +0x40 keep the **counts before trimming** (they are not decremented with r)
  [V]. Proposed names `n_flyer_cities`, `n_fast_cities`, `n_medium_cities`.
* The `(bits & 0xc0) == 0` test in G is always true for a city with bit 8 (F never sets 8 on a
  city that keeps 0x40 or 0x80) [V by control flow]; keep it anyway for exactness.
* Bits 3/6/7 are cleared (phase B) only on cities owned by cur; other cities keep stale bits from
  an earlier call (e.g. a city lost since) [V]. Bits 0,1,2,4,5 are preserved by the `& 0x37` [V].
* Meaning of the task-force fields [I from ovl27:0b72, which reads them as the minimum moves for
  members: 12 if +0x5a & 0x10, else 16 if +0x5a & 8, else +0x58; ovl27:0c66..0ce1 and ovl24:0c72..
  0cbb test 0x10 / 8 / 0x20 / 0x38]: +0x58 = `min_moves` (8, 12 or 16), +0x5a bit 0x08 =
  `TF_FAST` (from the fast group, TF 2), bit 0x10 = `TF_MEDIUM` (TF 1), bit 0x20 = `TF_FLYER`
  (TF 3). Bits 0..2 of +0x5a are written by ovl27 (0724 = 0, 075b |1, 07b6 |2, 07ee |4) [V grep],
  not touched here. Task forces with index > 3 cannot exist (AI[+0x24a] ≤ 4 from the cards
  [I EL §6.8]) but would get +0x58 = 8 only.
* City bits, proposed names: 0x08 `CF_TF_MEDIUM` (TF 1), 0x40 `CF_TF_FLYER` (TF 3), 0x80
  `CF_TF_FAST` (TF 2). Pairing [V ovl27:0c66..0cf8, in ovl27:0b72's source-city scan for task force
  di]: TF.+0x5a & 0x10 → the city must have bit 8; & 8 → bit 0x80; & 0x20 → bit 0x40; when
  (+0x5a & 0x38) == 0 the city must have none of 0xc8. So a group bit reserves the city as a
  source for exactly that task force, and only while the group has ≥ 4 cities (otherwise the
  TF flag is off and the bits were all cleared). Other readers: ovl24:0c72..0cbb (same three
  +0x5a tests) [V grep; ovl24 logic not traced here].

#### Unreachable code: ovl21:0c92, 0cc3..0cd2, 0cd7 [V]
* 0c92(): `DS:40ee = ovl25:056c(cur)` (dx:ax stored to 40f0:40ee), call 0cc3 (empty), ovl25:05b9(cur).
  Note it overwrites DS:40ee with the result of 056c — harmless since unreachable.
* 0cc3, 0cc8, 0ccd, 0cd2: empty far functions.
* 0cd7(buf_off, buf_seg, p3 dword, list far, n, add): ovl23:0000(buf, p3, 0x0f, 0, 0x2d) (box/clear,
  [U] exact), then for i in 0..n-1: colour = DS:07c8[i] if n == 8 else 0x0f; v = list[i] + add;
  v ∈ {0, -1} → ovl23:005a(buf+4i+10, DS:07f2 "  -", colour, 0) else ovl23:0099(buf+4i+10, v if
  v ≤ 1000 else 999, 3 digits, colour, 0). A debug dump of 8 per-side numbers; not needed.
  Nothing calls it, so a reimplementation omits it.
### 6.9 clean city, ovl24:01f1 → 023f(c, force = 0) [V]

Branch points re-read in the listing (ovl24:0394..03b4, 0500..0700); the rest from the
decompile, which is coherent here. `T[]` = square offsets DS:0814 = {1,0,0,1} (x),
DS:081c = {0,0,1,1} (y): square 0 = (x+1, y), 1 = (x, y), 2 = (x, y+1), 3 = (x+1, y+1).
```
01f1: for c in count-1..0 owned by cur with not AI[+0x11e+c] & 4: 023f(c, 0)
023f(c, force):                                   # returns 1 (0 when c is out of range)
    old = AI[+0x182+c]; AI[+0x11e+c] |= 4; AI[+0x182+c] = 0
    n = heroes = flyers = w13s = ordered = 0; H[8] = -1; L[32] = -1
    for a in 0x181-1..0 with c.x <= a.x <= c.x+1 and c.y <= a.y <= c.y+1 (signed):   # no owner/x test first
        if owner(a) != cur: ovl24:015e(a, 1)       # delete (hero death first); NOT skipped afterwards:
                                                   # the freed record (type/owner 0xff, kind 0) is counted
                                                   # below, flies/w13 read DS:45be / DS:45c2 (type −1), and
                                                   # it enters L, so the placement loop gives it the city
                                                   # square again [V 039e..04a6; I: a foreign army on an
                                                   # own city square is not expected to occur]
        AI[+0x182+c] += 1
        if a.order kind (+0xe & 0xf) == 1 and a.+0xf >> 1 == c: a.+0xe &= 0xf0; a.+0xf &= 1   # drop "go to this city"
        if a.+0xe & 0xf != 0: ordered += 1
        if a is a hero and heroes < 8: H[heroes] = a; heroes += 1; lasthero = a
        if flies(a.type): flyers += 1
        if w13(a.type): w13s += 1
        if n < 32: L[n] = a; n += 1  else: ovl24:015e(a, 0)          # more than 32: deleted
    if lasthero: DS:5e5e = lasthero; ovl28:0427(lasthero.x, lasthero.y)
    if heroes > 1: ovl28:17db(H)
    AI[+0x11e+c] &= ~0x30; |= 0x20 if heroes; |= 0x10 if w13s
    if n > 16: old = 0; ordered = 0
    if ordered > 2 and role[c] != 7: return 1
    if not force and heroes == 0 and AI[+0x182+c] == old:
        if rnd(1,6,-1) != 0 and not (army bit 0x10 on square 3): return 1     # 5/6: leave it
    AI[+0x1e6+c] = 0
    if role[c] in (4, 5, 8):
        need = ovl24:0a3d(c)
        role[c] = 4 if n < 2 else (5 if n < need else 8)
    k = ovl24:0b5c(c, n, L, G)                    # G = garrison order, first k are "keepers"
    if not force and gold < 300 and income < 2·upkeep and role[c] != 7
       and AI[+0xba+c] > 10 and heroes + w13s + 4 < n and ovl20:0a3e(c.x, c.y, -1) > 10:
        delete G[heroes + w13s + 4 .. n-1]        # ovl24:015e(a, 0): disband the surplus
    if n > 24: delete G[24 .. n-1]
    if (not QuickStart or max(turn,1) > 2) and n < 2: role[c] = 4
    clear army bit 0x10 on the four squares
    if HiddenMap and role[c] == 11 and AI[+0x24] < 5:            # send flyers exploring
        m = flyers; if n - flyers < 2: m = flyers - (2 - (n - flyers))
        if QuickStart and max(turn,1) < 3: m = 1
        for i in 0..n-1 while m > 0: if G[i] != -1 and flies(G[i]):
            AI[+0x24] += 1; G[i].flags |= 0x20; ovl20:0e4b(G[i], -1); G[i] = -1; m -= 1
    if role[c] in (2, 3): sq = 1; left = 8
    else: sq = (k == 0); left = k if k else 8
    for i in 0..n-1 with a = G[i] != -1:          # stack them, 8 per square
        if sq == 0: AI[+0x1e6+c] += 1
        a.x, a.y = c.x + T[sq].x, c.y + T[sq].y; a.goto = (-1, -1); a.+0x11 = 0
        a.+0xe &= 0x8f; a.+0x10 = c; a.flags &= ~0x40; army bit 0x10 on that square
        left -= 1; if left == 0: sq += 1; left = 8
    ovl24:10a1(c.x, c.y)                          # redraw if visible
```
So AI[+0x182+c] = armies counted in city c this turn, AI[+0x1e6+c] = number of keepers placed
on square 0, flag 0x20 = city holds a hero, 0x10 = holds a w13 type, bit 2 = processed this
turn (cleared by §6.0). The writes to army +0x10 (EL: transit state) store the city index [V];
what reads it there for AI armies is not traced [U].

`0a3d(c)` defenders wanted: over c's six neighbours that are intact cities of another
**side** (owner ≠ 0xf, ≠ cur): any at war → 8; else 2 or more → 4; one → 3; none → 2.

`0b5c(c, n, L, G)` garrison order (returns k) [V ovl24:0b5c..10a0]:
```
quota = DS:0824[n] if n < 13 else 8        # {0,0,0,0,3,3,4,5,5,6,7,7,7}
minmv = 0; air = 0; taken = 0; g = 0 (len G); k = 0
if role[c] == 7:                            # the city is a task-force staging city
    f = h = 0
    for i in n-1..0 with a = L[i] != -1:
        if hero: h += 1
        elif flies: if a.strength (+8) >= 4 or f == 0: f += 1
    if f and h: f += h
    air = (f >= 4 and n <= 16) or (f >= 3 and n <= 8)
    for task force j in 3..0, active, staging (+0x250) == c:    # the lowest such j decides minmv
        minmv = 12 if flags (+0x2a6) & 0x10 else 16 if & 8 else word +0x2a4
        if flags & 0x20: air = 1
v = 3 - AI[+0xba+c] / 3                     # unsigned byte, truncating
if 0 < v < n and n - quota < v: quota = n - v
loop:
    bA = bB = -1; iA = iB = -1
    for i in n-1..0 with a = L[i] != -1:
        s = a.strength (+8, signed byte); w15 = DS:45c9[6·type]
        if g < quota:
            if not taken & 1 and hero:                     s += 1000
            elif a.allowance (+6) < minmv:                 pass
            elif not taken & 0x10 and flies:               s += 900
            elif air:                                      pass
            elif not taken & 2 and w15 == 2:               s += 800
            elif not taken & 4 and w15 == 3:               s += 700
            elif not taken & 0x80 and w13 (DS:45c8):       s += 600
            elif not taken & 8 and w15 == 1:               s += 500
            elif not taken & 0x20 and w17 (DS:45c5):       s += 400
            elif not taken & 0x40 and w18 (DS:45c6):       s += 300
        else: taken = 0xfff
        if taken & 1 and hero: s = 1
        if taken & 0x80 and w13: s = 2
        if a.allowance < minmv or (air and not flies and not hero):
            if s > bB: bB, iB = s, i                       # pool B, strict: highest i on ties
        else:
            if s > bA: bA, iA = s, i                       # pool A
    if iA == -1 and iB == -1: break
    if taken != 0xfff:
        ch = L[iA] if iA != -1 else L[iB]
        if hero(ch): taken |= 1
        else: taken |= (2 if w15 == 2) | (4 if w15 == 3) | (0x10 if flies) | (0x80 if w13)
                     | (8 if w15 == 1) | (0x20 if w17) | (0x40 if w18)
    if iA != -1: G[g] = L[iA]; L[iA] = -1; g += 1; k += 1
    else:        G[g] = L[iB]; L[iB] = -1; g += 1
return min(quota, k)
```
`015e(a, redraw)`: x, y = a's square (read first); hero → ovl36:16cd(a, x, y) (death); 0b62:03be
deletes; redraw → 10a1(x, y).
`0000(redraw)` [V ovl24:0000..00c9]: for slot i = 0..7 of DS:5e3e with a non-null pointer: the record
index is found by scanning 0x181−1..0, x, y read through the pointer, 015e(a, 0), DS:5e3e[i] = null;
then DS:5e5e = DS:5e62 = null (DS:2bda, 5dfe, 5e00 untouched); redraw and x ≠ −1 → 10a1 on the
**last** army's square; ovl62:0000 (map words rebuilt). Called by ovl19:1117 (redraw 1).
`00ca(list, redraw)` [V ovl24:00ca..015d]: entries **7..0** that are not −1: x, y read, 015e(a, 0);
then as 0000 (10a1 on the last one's square, i.e. the lowest slot; ovl62:0000); the list and the
selection are not written. Called by ovl22:0f30 (redraw 1).
`10a1(x, y)`: redraw (ovl64:006c) if the side is shown (0x147[cur] ≠ 0) or not computer
(0x0d0[cur] ≠ 1), and 0x177 ≤ x ≤ 0x17b, 0x175 ≤ y ≤ 0x179 [V ovl24:10a1..1109]; display only.
`0a3d`'s war test reads relation[**cur**][owner] (2c04:153b + 8·cur + owner, 0b07..0b1e).
No caller uses 023f's return value (ovl19:0289/02c1/1394/17e6, ovl20:0111, ovl28:0129) [V].
Income DS:5dca and upkeep DS:5dda (023f at 066b..068a, also ovl25:06d4 at 0775..0795) are **caches**:
written only by ovl62:0372 / 02bf, which run at the turn-start settlement (ovl68:082a / 082f, before
ovl43:0000's new units), in ovl36:0a6b after every real battle (0cba) and on a capture (10c6), after
a raze (ovl32:00a1), at load, Disband (0b62:089a) and in some dialogs — not after 015e or a purchase
[V grep of the writers and their callers].

### 6.10 neutral: taking neutral cities, ovl20:0000 [V]

Hidden call arguments read from the listing (ovl20:0194..01ba, 0782..0887, 0e73..15bb).
`sent[c]` = number of own armies whose order is "city c" (kind 1).
```
0000: sent[0..99] = 0; for own armies with kind 1 and index < count: sent[index] += 1
      for i in 0..9: if 00b5(i, sent) == 0: break
00b5(pass, sent): n = 0
    for c in count-1..0 owned by cur:          # passes >= 1 continue from cities taken in the previous pass (role 1, set by 0a8b:0254)
        if pass != 0 and role[c] != 1: continue
        if role[c] == 1: ovl24:023f(c, 1); role[c] = 3
        if 01f6(c) == 0:                           # no neutral neighbour
            if role[c] in (3, 2): role[c] = 4
            if QuickStart or role[c] != 5 or max(turn,1) >= 6: continue
        n += 1
        if 03aa(c, sent): 0b19(c, max(turn,1) > 10); role[c] = 2         # explore instead
        else: role[c] = 4 if 0935(c, sent) == 0xff else 3
    return n
01f6(c, ids, dists): the neighbours of c (NB order i = 0..5) that are intact (terrain 10),
    neutral (owner 0xf), not AI[+0x46], and (none accepted yet or i < 2 or NB distance < 20)
0935(c, sent): the last such neighbour (scan 5..0) with sent ≤ 2 (signed byte `< 3`), else 0xff
    (also 0xff when 01f6 returns 0) [V 0935..0980]
0a3e(x, y, side): returns the smallest dist (start 1000, strict <) to an army i = N-1..0 with owner
    byte ≠ 0xf and (side == -1: owner byte ≠ cur; else (signed) owner == side); with Hidden Map
    only armies for which ovl29:16ae(a.x, a.y) (a seen square in the 3×3 around it) holds
    [V 0a3e..0b18]. **There is no x ≠ −1 test**: a freed army record (0b62:03be: owner 0xff,
    type 0xff, x = y = −1; freed records below the high mark 0x181 stay in the scan) counts for
    side == −1 as an army at (−1, −1), i.e. at dist trunc(√((x+1)² + (y+1)²)); under Hidden Map
    16ae(−1, −1) tests only square (0, 0). So once any army record has been freed, 0a3e(·, −1)
    never exceeds the distance to (−1, −1) [V].
0981(x, y, side): returns the smallest dist (start 10000, strict <) to an intact city (terrain
    10 at its corner) with owner side (cwde compare), or any owner for −1; scan count-1..0 [V 0981..0a3d]
03aa(c, sent):
    th = 0a3e(c.x, c.y, -1)
    keep = (2 if th < 5 else 0) + (th < 15) + (AI[+0x48] != 0) + min(Σ_p mem40c[p], 2)
    ret = HiddenMap; per = 1 if NeutralCities == 0 else 8
    G = own armies exactly on (c.x, c.y), no TF group, not done (0x40), no order, scanned
        0x181-1..0, the first `keep` of them skipped, at most 8
    if G empty: return 0
    sort G by allowance (+6, signed) descending: repeatedly take the largest > 0 (strict, slots
        7..0, so the highest slot wins ties); an army with allowance ≤ 0 is dropped [V 056e..05fb]
    repeat:
        take the next `per` armies into a group; stop when none
        if keep == 0 and HiddenMap and 0a3e(c) < 15: stop
        06c7(c, len, sent, group, &ret)
    return ret
06c7(src, n, sent, group, &ret): chain of neutral captures
    p = 100; from = src
    loop:
        drop non-own armies of the group; if NeutralCities: ovl29:14d3(group)   # select it
        best = -1; bs = 1000
        if 01f6(from, ids, d) == 0: return                 # no candidate at all: no Hidden-Map tail
        for i in 5..0 with t = ids[i] != 0xff:
            skip if AI[+0x11e+t] & 1
            *ret = 0                                       # written before the sent test
            skip if sent[t] >= 3                           # signed byte
            if NeutralCities: p = ovl29:15c5(t.x, t.y)     # else p keeps its value (100) without a simulation
            if p >= 75:
                s = rnd(1,10,0) + d_i + 10·sent[t] + (10 if d_i > 40) + (30 if d_i > 50) + 100 - p
                if s < bs: best, bs = t, s                 # strict: highest slot on ties; d_i unsigned byte
        if best == -1:
            if HiddenMap and DS:40c0 == src and DS:07c6 != -1:
                ovl29:0ae7(group, 1, DS:07c6, 0x80)        # order only, no move
            return
        sent[best] += n (byte; n = the group size passed in); DS:07c6 = best; DS:40c0 = src
        ovl29:0ae7(group, 1, best, 0x80); 0a8b:0001(leader.goto, 0)
        if owner(best) != cur or AI[+0x48] != 0: return
        from = best; if 0a3e(best.x, best.y, -1) < 10: return
                                                           # [V ovl20:06c7..0934]
02ff (from production, Hidden Map only): own role-3 cities whose neutral neighbours
    (01f6) are all flagged bit 0 → role 2
0b19(c, fly_only): explorers from city c
    th, keep as in 03aa; tf = any TF active
    E = own armies exactly on (c.x, c.y) without TF group, not done, no order, not a hero
        when tf, flyers only when fly_only; first `keep` skipped; at most 8; sorted by allowance
        as in 03aa (descending, strict, highest slot on ties; allowance ≤ 0 is dropped) [V 0b19..0e4a]
    for each army a of E in that order:
        if keep == 0 and HiddenMap and 0a3e(c) < 15: return
        0e4b(a, c)
```
**Exploring one army, ovl20:0e4b(a, c)** (also used by ovl22, ovl24):
```
ovl29:0ae7([a], 4, 0, 0x20)                       # alone, order "none", flag 0x20 = exploring
steps = a.moves_left / 5 + 1
loop: if a.moves_left < 2: return
      old = a.pos; 0f46(a, c); if a.pos == old or a.moves_left < 4: return
      if steps == 0: return; if not a.flags & 0x20: return; steps -= 1
0f46(a, c):
    if 177f(a, &x, &y, &kind, &kx, &ky) == 0:
        if not (flies(a) and 164e(a, &x, &y)):
            if c == -1 or (t = 0935(c, zeros)) == 0xff:
                clear a's order, flag 0x20, goto, group; return
            (x, y) = t's corner
    elif kind == 1 and 10a8(a, kx, ky): return
    elif kind == 2 and 12eb(a, kx, ky): return
    1581(a, x, y)
177f(a, …) frontier search in the 10×10 window x ∈ [a.x-5, a.x+4], y ∈ [a.y-5, a.y+4]:
    home = a's home city (+9); boat = a aboard
    if rnd(1,4,-1) == 0 and a stands on a city square that is coastal (0555:109d) and a is no hero: boat = 1
    *kind = 0; best = 0; found = 0
    for x in a.x-5 .. a.x+4 ascending, y in a.y-5 .. a.y+4 ascending, on the map:
        if terrain city and owner nibble != cur: 1bab: d = 2 if DS:5dfc == 2 else dist(a, sq);
            if d < 4 and (not aboard or 0555:109d(sq)) and some 3×3 square around sq is seen
            (road layer 0x20): kind = 1; k = sq       # overwrites an earlier kind 1 or 2: the last one in scan order is kept
        if terrain 11 (ruin/temple): 1c9d: if kind == 0 and not aboard and a seen square around: kind = 2; k = sq
                                                      # only while kind == 0: the first site, and never over a city
        if terrain city: continue
        if terrain != city and (DS:5dfc == 2 or road or DS:5dfa & 1 or terrain != 5)
           and sq not seen and (DS:5dfc == 2 or cost(terrain) != 0):
            u = unseen squares in sq's 3×3 (on the map)
            if u > 1:
                if boat: b = 200 if terrain in (2, 3) else 0
                else:    b = 0 if terrain in (2,3) else (0 if terrain == 5 else 100) + (200 if road)
                d1 = dist(sq, a); d2 = dist(sq, home); r = rnd(1,10,0)   # rnd after both dists
                s = r + 2·d1 + d2 + 10u + b
                if boat and b: s += 10·min(d2, 50)
                if s > best (signed, from 0): (x, y) = sq; best = s; found = 1   # strict: first in scan order on ties
    return found                                      # [V ovl20:177f..1baa, 1bab..1d37]
    (`aboard` = a.flags & 0x1000; `boat` starts as aboard and the rnd(1,4,−1) at 1837 is drawn
    first, unconditionally; `home` = city a.+9 (signed byte); "seen" = road-layer bit 0x20;
    the u count includes sq itself; the road test is 19d9 & 0x1f ≠ 0; cost(terrain) = word
    DS:1274[terrain].)
164e(a, &x, &y): over c = count-1..0 with terrain(c) == 10 and AI[+0x11e+c] & 1 (any owner):
    v = dist(c, a) + rnd(1,10,0) (one draw per such city, after the dist); keep the smallest
    (strict <, start 10000: highest index on ties); target (c.x − 1, c.y − 1); returns 1 if one [V]
10a8(a, x, y): attack a city met while exploring
    c = the first city in count-1..0 that is intact, not own, not AI[+0x46], dist(c, (x, y)) ≤ 2
        and ovl18:0851(c) != 0, after `if flag bit 0: ovl21:0b95(c)`, has flag bit 0 clear
        (a city still flagged after 0b95 is skipped and the scan goes on) [V 10b0..1193]
    if none: return 0
    ovl29:0ae7([a], 4, 0, 0x20); p = ovl29:15c5(c.x, c.y)
    need = 75; if not hero and strength < 4:
        need = 50 if AI[+0x06] < count/10 else (40 if AI[+0x02] <= min(max(turn,1)/2, 10) else 75)
    if p < need: return 0
    a.flags &= ~0x20; ovl29:0ae7([a], 1, c, 0x80); 0a8b:0001(goto, 0); return 1
12eb(a, x, y): visit a site met while exploring
    s = ovl28:056d(x, y, &kind)                     # site on that square
    require s != -1, a not aboard, (kind != 1 or not a.flags & ovl28:063c(s)), (hero or kind == 1),
            square owner nibble 0xf or cur                       # else return 0
    ovl29:0ae7([a], 4, 0, 0); leader.goto = (x, y); r = 0a8b:0001(leader.goto, 0)
    if r == 1: return 0
    if a.pos == (x, y):
        DS:5e62 = a; hero → ovl22:15c3(a, s) else ovl34:0000() (a non-hero only gets here for a
        temple, kind 1; EL §5.4)                               # rnd: §8
        if kind == 5 (the value from 056d, read before the search): every army j = N-1..0 with
            owner cur, order kind 0, w13 type, on (x, y): flags |= 0x20
    else:
        if kind == 1 and aboard: a.flags |= ovl28:063c(s)
        a.flags |= 0x40
    a.flags |= 0x20; a.+0xe &= 0xf0; a.+0xf &= 1; a.goto = (-1, -1); return 1   # [V 12eb..1580]
1581(a, x, y): a.goto = (x, y); ovl67:06eb(a) (selects every army on a's square as a click
    would; its 0c8c:0529 copies the **leader's** goto to every member, §7a.5);
    r = 0a8b:0001(DS:5e62.goto, 0)                 # the leader's goto: (x, y) only when a is the leader
    if r == 1: a.flags &= ~0x20; a.+0xe &= 0xf0; a.+0xf &= 1
    a.flags |= 0x40; a.goto = (-1, -1); a.+0x11 = 0   # a only, not the other members [V 1581..164d]
```

### 6.11 quick attack, ovl26:04ba / 053f [V]
```
if AI[+0x48] != 0: return                        # card +0x2b (default 1/0/0): personality 0 never quick-attacks
for c in count-1..0 owned by cur:
    if role[c] in DS:0932 = {5, 8, 6, 4, 14, 7} and AI[+0x182+c] > 3 (unsigned byte): 053f(c)
053f(c):
    x = c.x + (0 if role[c] == 7 else 1); y = c.y   # one square of the 2×2 city
    if role[c] == 7 and AI[+0x182+c] < 12: return
    thr = 65 if gold < 40 and income < upkeep else 85
    n = ovl29:12c9(x, y, list, 8)                  # own armies there with >= 8 moves left, selected
    if n == 0: return
    if n < 4 and role[c] in (6, 7): return
    ids, d = ovl25:0656(c)                         # the six neighbour cities and distances
    danger = 0; best = -1; bt = 100; bp = 0
    for i in 5..0 with t = ids[i] != 0xff:
        skip if AI[+0x11e+t] & 1, owner(t) == cur, terrain(t) != 10, t == AI[+0x46]
        skip unless owner(t) == 0xf or cur_rel(cur, owner(t)) == war
        p = ovl29:15c5(t.x, t.y)                   # 10 simulated battles of this stack, rnd
        if p == 0:
            if (n < 4 and d[i] < 25) or (n < 6 and d[i] < 15): danger = 1   # unsigned bytes
        elif p >= thr:
            turns = d[i] / max(DS:5e00 - 2, 1) + 1  # DS:5e00 = the stack's lowest moves left
            if turns < bt or (turns == bt and p > bp): best, bp, bt = t, p, turns
    if not danger and best != -1:
        ovl29:0ae7(list, 1, best, 0)               # order "city best", goto next to it
        0a8b:0001(leader.goto_x, leader.goto_y, 0)  # move/attack (executor §7a)
```
(053f reuses its register for the city index inside the loop at ovl26:06aa; the value is not
read afterwards, so it has no effect.)

### 6.11a AI callbacks in ovl26 [V]

**ovl26:0000(c, prev)** — called by the move executor 0a8b:0416 when the AI takes city c from
side `prev`; returns 1 when it made the capture decision itself:
```
if cur is human or prev is not human or AI[+0x42] == 0 or max(turn,1) >= 10: return 0
if AI[+0x46] == c: return 0
if ovl31:07d0(c) >= 200: ovl19:199c(c)            # sack (EL §6.5); 07d0 = the sack value
else: ovl19:1864(c, 0)                            # normal capture choice
return 1
```
So AI[+0x42] (card +0x61, default 0/0/1) = "plunder human cities in the first 9 turns".

**ovl26:038d(x, y)** — end of the AI's real battle (ovl36:16a3): with Quests on, a quest active
for cur (2c04:1103 + 0xc·cur ≠ 0), its hero (army index at +4) among the attackers DS:42c6[i]
(i < DS:42c4), quest type (+2) 4 or 5 and target city (+6) == ovl62:044a(x, y):
AI[+0x4a] += 1; AI[+0x46] = −1; type 5 → ovl19:1864(city, 1) (forced: skips the occupy test,
but still sacks instead when the sack value is ≥ 400; its return value is discarded) and
ovl01:1ded(2, 0, 0, 0, 0); type 4 → ovl01:1ded(4, 0, 0, 0, 0) (five words: two `push dword 0`
and the code, `add sp, 0xa`) [V ovl26:0492..04b4]. Quest types: EL §5.7 (4 occupy, 5 raze).
[V for the code; the field names of the quest record from EL §5.7 are I]

**ovl26:0080()** — the sage, called by ovl34:015a (engine hook `ai_sage`):
```
gold_gift = rnd(3, 500, 500)                      # always drawn first
best = -1; bn = -1; bd = 0
for c in count-1..0 with owner(c) == 0xf and AI[+0x11e+c] & 1:
    if no neighbour of c (ovl25:0656) is owned by cur: continue
    n = #cities k (count-1..0) with owner 0xf, AI flag bit 0, dist(c, k) < 20   # c itself included
    d = min dist(c, k) over own cities k (start 1000)
    if n > 3 and (n > bn or (n == bn and d > bd)): best, bn, bd = (c.x, c.y), n, d
if not HiddenMap or best == -1: gold[cur] += gold_gift
else:
    x = best.x + rnd(1,11,-6); y = best.y + rnd(1,11,-6)      # each clamped below at 0
    x = min(x, 111); y = min(y, 155)
    ovl34:0cd6(x, y)                              # reveal the area (EL §5.4)
    redraw when (2c04:0159 and not DS:3254) or cur is human
```
So under Hidden Map the computer takes the map view over the largest cluster (> 3) of
neutral cities still flagged bit 0 next to its own cities; otherwise the gem's gold.
AI flag bit 0 therefore reads as "not yet seen/explored by this side" [I].

### 6.12 update hide, ovl21:0c1c

See §6.8 (ovl21:0c1c): role 2 → 3 when an eligible neutral neighbour has become seen. [V]
### 6.13 assault XX: creating task forces, ovl27:0000 [V]

**Task-force record** TF[k] = AI[+0x24c + 0x5c·k], k < 4 (reset by ovl27:08ba):

| rel | abs (k=0) | size | meaning | writers |
|---|---|---|---|---|
| +0x00 | 0x24c | w | age: 0 inactive, 1 at creation, +1 per assault turn | ovl27:0000, 08ba, ovl19:0000 |
| +0x02 | 0x24e | w | enemy side | 0000 |
| +0x04 | 0x250 | w | **staging city** (an own city, role 7) | 0000 |
| +0x06 | 0x252 | 4 w | source cities (role 6, vectored to the staging city) | 0b72, 083e (−1) |
| +0x0e | 0x25a | 6 w | target cities of the enemy, nearest first | 01bb / 03ff |
| +0x26 | 0x272 | 6 w | their graph distances from the staging city | 01bb / 03ff |
| +0x32 | 0x27e | 6 w | per target: number of its six neighbours owned by the enemy | 09ca |
| +0x3e | 0x28a | 4 w | group leaders (army indices) of launched groups | ovl19:08b2, 1251 |
| +0x46 | 0x292 | 6 w | former staging cities | ovl19:134c |
| +0x58 | 0x2a4 | w | minimum movement allowance wanted for sources/keepers: 8, 12 or 16 | ovl21:01b3, 08ba (0) |
| +0x5a | 0x2a6 | w | flags: 1 = raze/choose (1864) when ≥ 2 targets remain, 2 = sack, 4 = pillage (06a0); 8 fast, 0x10 medium, 0x20 flyer task force (ovl21:01b3) | 06a0, ovl21:01b3 |

```
0000: if AI[+0x00] == 0: return                     # turns with cities (§6.8)
    n = #own cities with role 5 or 8
    act = #active among all four records
    if act < AI[+0x24a] and n != 0 and (act == 0 or n > 2):
        k = lowest index < AI[+0x24a] with TF[k] inactive (scan downwards, last hit wins)
        08ba(k); enemy = ovl27:0e04(0)               # §6.1a, 8 rnd draws again
        if enemy == -1: return
        s = 01bb(k, enemy, TF[k].targets, TF[k].dists)
        if s == -1: 08ba(k); return
        TF[k].active = 1; .enemy = enemy; .staging = s; role[s] = 7
        06a0(k)                                     # style flags, rnd
        prop(cur, enemy) = war
        083e(s)                                     # s leaves every source list, vectoring off
        09ca(k); ovl21:01b3()
```
**01bb(k, enemy, ids, dists)** — staging city and targets. A 600-byte work table
(DS:4102, 0d28:011f; freed 0d28:048e) holds R[c] reached, D[c] = R + 100 words distance,
F[c] = + 200 words done.
```
ids[0..5] = dists[0..5] = -1; if allocation fails: return -1
e = 04d2(enemy); if e == -1: return -1
058a(e)                                             # graph distances from e
s = own city with role in {5,8,6,4,14} (DS:0940) and R[s], minimal D (strict <, start 10000)
if s == -1:
    if not AI[+0x11e+e] & 1:
        s = own city with role in {5,8,6,4,14} (DS:094c) minimal dist(s, e) (straight, start 10000)
        if s != -1: ids[0] = e; dists[0] = 100
else:
    058a(s)                                         # graph distances from the staging city
    if 03ff(e, enemy, ids, dists) == 0: s = -1
free; return s
04d2(enemy): best = -1, bn = 0
    for c in count-1..0 owned by enemy: n = 1 + #c's neighbours owned by enemy
        if n > bn or (n == bn and rnd(1,2,-1) != 0): best, bn = c, n     # rnd only on ties
058a(src): R = D = F = 0 for all; R[src] = 1
    repeat: changed = 0
        for c in count-1..0 with R[c] and not F[c]: changed = 1; F[c] = 1
            for the six neighbours n of c (i = 5..0, n != 0xff):
                nd = D[c] + NBdist(c, i)
                if not R[n]: R[n] = 1; D[n] = nd  elif D[n] > nd: D[n] = nd
    until not changed                               # a done city is never revisited
03ff(e, enemy, ids, dists): for i in 0..5:
        t = city owned by enemy, not flag bit 0, R[t], minimal D[t] (strict <, start 10000)
        if none: break
        ids[i] = t; dists[i] = D[t]; R[t] = 0
    if none found and not AI[+0x11d] & 1: ids[0] = e; dists[0] = 100; count 1
    return count
```
(The last test reads AI[+0x11e + (−1)] = AI[+0x11d], the +0xba byte of city 99, because the
index register is −1 after the loop, ovl27:04a4..04b8 [V]; reproduce as coded.)

**06a0(k)** attack style, three draws at most:
```
base = AI[+0x02]·AI[+0x2c] + (AI[+0x2e] human / AI[+0x30] level 2 / AI[+0x32] level 1 / AI[+0x34] level 0)
                                                    # the side on turn's control / level (06b9..0715), not the enemy's
TF.flags = 0
if AI[+0x26] != 0 and rnd(1,1000,0) < AI[+0x26] + base: flags |= 1; return
if gold < 100: base += AI[+0x36]
if AI[+0x28] != 0 and rnd(1,1000,0) < AI[+0x28] + base: flags |= 2; return
if AI[+0x2a] != 0 and rnd(1,1000,0) < AI[+0x2a] + base: flags |= 4
```
**09ca(k)**: for i in 0..5 with target t = TF.targets[i] != −1: TF[+0x32+2i] = number of t's
six neighbours owned by TF.enemy.
**083e(s)**: every active TF (k < AI[+0x24a]) loses s from its source list (−1) and s's
vectoring is switched off.
**07f8(c)** = c is the staging city of an active TF; **0a7a(c, f)** = c is not a staging city
and role 8 or 5 (or 6 when f).

### 6.16a first step of production: ovl27:0aed / 0b72 (task-force sources) [V]
```
0aed: for c in count-1..0 owned by cur with role 6: role[c] = 8; vectoring off
      for k in 3..0 with TF[k] active: 0b72(k)
0b72(k): mv = 12 if TF.flags & 0x10 else 16 if TF.flags & 8 else TF[+0x58]
    src[0..3] = -1; str[0..3] = -1
    for c in count-1..0 owned by cur with 0a7a(c, 0):
        require: (not flags & 0x10 or cflag(c) & 0x08) and (not flags & 8 or cflag(c) & 0x80)
                 and (not flags & 0x20 or cflag(c) & 0x40) and (flags & 0x38 or not cflag(c) & 0xc8)
                 and ovl29:1a4d(c, &slot) and moves(slot) >= mv
        j = first empty source slot, else the slot with the lowest str (strict <, from 100)
        if j != -1 and (src[j] empty or str[j] <= strength(slot)): src[j] = c; str[j] = strength(slot)
    role[src[j]] = 6 for every filled j
```
cflag = AI[+0x11e+c]; bits 0x08, 0x40, 0x80 are written by ovl21:01b3 (§6.8).
The vectoring phase (§6.17a) then vectors every role-6 source to the TF's staging city.

### 6.14 specials, ovl22:10e3

See §6.6 (ovl22:10e3). [V]
### 6.15 last rescue, ovl22:0b4d

See §6.6 (ovl22:0b4d). [V]

### 6.16 production, ovl25:06d4 [V] (switch table at ovl25:0847)
```
ovl27:0aed()                                    # §6.16a
if HiddenMap: ovl20:02ff()                      # §6.10
for c in count-1..0 owned by cur:
    +0x31 = 0; +0x33 = +0x35 = -1                # every own city's vectoring is reset
    if ovl29:0fd5(c): continue                   # a production is partly done
    if gold < 40 and income < upkeep: return     # (DS:5dca / DS:5dda of cur) whole phase ends
    switch role[c]:
        2, 13: if not AI[+0x11e+c] & 2: ovl29:11d5(c);  kind = 4
        11:    kind = 4
        3:     kind = 2 if NeutralCities else 1
        4:     kind = 2
        8:     +0x2d = 0; continue               # no production
        default (incl. 5, 6, 7, 9, 10, 12, 14, <2): kind = 3
    ovl29:103d(c, kind, -1, 0)                   # choose and start, vectoring off
```
Kinds index the weight tables of 103d: score = (10 − time)·A + S·B + moves·C/2 with
A = {0,10,10,5,5,5,10}, B = {0,4,10,10,10,10,1}, C = {0,1,1,1,1,1,10}; kind 4 only considers
flying types (EL §9.5). The production phase runs **after** vectoring was reset, so a city's
vectoring survives only through §6.17 / vectoring §6.17a below.

### 6.17 rebuilding, ovl25:0af2 / 0c83 / 0bd1 [V]
```
n = max(5, AI[+0x0a]·count/80)                  # 16-bit product, cwd, signed idiv (0afd..0b33)
if (AI[+0x0e] >= 5 or n·AI[+0x0e] >= AI[+0x02]) and gold >= 500:
    t = AI[+0x12] if gold > 2000 else AI[+0x10]
    c = 0c83(t); if c != -1 and gold >= 500: 0bd1(t, c)
0c83(t): best = -1, bv = -1
    for c in count-1..0 owned by cur:
        (a loop over the four slots compares them with t and discards the result: no effect)
        cand = 0; sub = 0
        switch role[c]:                          # table at ovl25:0daf
            2, 3: if AI[+0xba+c] < 4 (unsigned): skip; sub = 4; then as 4
            4, 5: cand = not 1a4d(c)
            8:    if not 1a4d(c): role[c] = 14; cand = 1
            14:   if 1a4d(c): role[c] = 8 else cand = 1
            other: skip
        if cand and AI[+0xba+c] - sub > bv: best, bv = c, that   # strict: highest index on ties
    return best
0bd1(t, c): ovl44:1128 (open the table); r = ovl44:138f(t, …), price = record r's +0x1e (as 11d5)
    if gold > price + 30 (signed, strict): s = 1ae9(c); ovl44:1299(c, s, r) (gold -= price);
        AI[+0x16] += 1; +0x2d = 0; +0x31 = 0; role[c] = 5
    ovl44:11e2                                   # [V ovl25:0bd1..0c82]
```

### 6.17a vectoring, ovl25:085f [V]
```
for k in AI[+0x24a]-1..0:
    T = task force k; if T.active and T.staging (+0x250) != -1 and owner(T.staging) == cur:
        role[T.staging] = 7
        for j in 3..0: s = T.src[j]; if s != -1 and role[s] == 6: ovl29:0f10(s, T.staging)
```

### 6.17b Hero offers and surrender [V]

Recruiting is rules code: at the start of the computer turn ovl47:0000 / ovl47:0301 accept every
hero offer (EL §5.2, §6.2); the AI's only part is the city, ovl25:0919 below. Surrender: no AI
overlay (ovl18–ovl30) reads or writes the surrender words 2c04:015d / 015f or calls ovl61:1f68
[V grep]; the surrender offer exists only towards a human (EL §6.7), so the computer never offers,
accepts or refuses one.

### 6.18 hero city, ovl25:0919(c0) [V]
```
best = 0; r = c0
for c in count-1..0 owned by cur:
    v = rnd(1,100,100) if role 7, rnd(1,100,50) if role 2, rnd(1,100,0) if role 3, else 0 (no draw)
    if v > best: best, r = v, c
return r
```

### 6.19 battle memory, ovl25:09d7(x, y, defenders = DS:42e6, attackers = DS:42c6) [V]
After every real battle (human ovl36:02c7, computer ovl36:1502), not after simulations:
```
d = owner nibble of (x, y); if d == 0xf: return
city = terrain(x, y) == 10
for i < DS:42c5 (defenders): dead_i = DS:422c[i] == 0
heroes = #dead defenders of type 0x1c; dead = #dead; wiped = dead == DS:42c5
a = owner of attackers[0]
in side d's block (ovl25:056c(d)), index a:
    +0x3bc[a] += heroes; +0x3cc[a] += dead; +0x3dc[a] += 1; +0x3ec[a] += wiped
    if city: +0x3fc[a] += 1; +0x40c[a] += wiped
```
+0x41c[a] is not written here.

## 7. Advisor, odds and simulations

The AI's odds are ovl29:15c5 (§5.12), AI[+0x20] = 10 simulations of the real battle
procedure with the real dice; there is no separate formula. Where each phase calls it:
§5.13 and the phases of §6 (assault, quick attack, neutral, move, hero).

**Which stack is simulated.** 15c5 has no stack argument: ovl38:008b takes the current
selection (DS:5e3e[0..DS:5dfe−1] when DS:2bda ≠ 0, else DS:5e62 alone, §5.12). Every caller sets
it first [V call sites]:

| caller of 15c5 | selection made by |
|---|---|
| ovl19:06e9 (launch), ovl26:053f (quick attack), ovl28:0cf3 (quest city), ovl22:0c5b → 0f3c (rescue) | ovl29:12c9 → 14d3 (0c5b may reselect a filtered list with 14d3 first) |
| ovl28:1348 (hero cities), ovl19:0996 → 0b49 / 0c32 (assault) | ovl29:13b2 → 14d3 |
| ovl20:10a8 (explorer attack) | ovl29:0ae7([a]) → 0c8c:0529 (the explorer alone) |
| ovl20:06c7 (neutral chain) | ovl29:14d3(group), only when Neutral Cities is on (no 15c5 otherwise) |
| ovl22:05ff (move #1 re-target) | ovl67:06eb (the moving army's whole square) in ovl22:0000 |
| ovl29:1771 (executor re-target), 1885 via 1771 | the moving stack (its leader DS:5e62) |
| ovl29:1885 via 1851 (after ovl19:1864's raze) | what 0a8b:0001(keep = 0) left: DS:5e62 **null** (0b62:08b3) when ovl19:0f1b razes, so DS:5e3e[0..DS:5dfe−1] with DS:2bda, else the null DS:5e62 (plan register X38); with ovl26:0000 / 038d inside the executor's battle, the attacking stack |

**Advisor vs AI** [V ovl29:15c5, ovl36:2065]: the Military Advisor ovl36:2065 and 15c5 call the
same ovl36:124a(x, y, 0) (2065 near, 15c5 far), so one engine `combat.simulate` serves both,
given the current selection. 2065 runs 19 trials and counts `r[+6]` (DS:4132, attacker
survivors) > 0 (signed), returning that count / 2 (truncating); 15c5 runs n = 10 and counts
`r[+2]` (DS:412e, defender survivors) == 0, returning wins·100 idiv n. Because 08a6 only ends
when one side is exhausted, the two win tests agree except when **both** sides are empty at the
set-up (15c5: a win; advisor: a loss); an empty defender is a win for both, an empty attacker
a loss for both.

**Leftover state.** Each simulation rewrites the battle arrays (DS:4224..42e6, including the
set-up pointers DS:42c6 / 42e6), the battle log DS:41b2..41b5, DS:412c..4132, DS:415c/415e
and (15c5 only) DS:410a/410c, which has no reader. The AI reads battle results only after real
battles (ovl25:09d7, ovl26:038d), so no AI decision reads stale simulation data; but the
quest check ovl01:1ded(−1, …) at ovl68:01d9 (start of the next computer turn) reads DS:42c6,
which the last simulation may have left, so the engine's `simulate` must keep writing
`state.battle_work` as it does now [V xref; EL §3.5].

## 7a. Movement machinery used by the AI (resident 0a8b, 0555, 0c8c) [V]

From the same helper trace.

### 7a.0 Path record and global tables [V]

Path record built by 0555:1868(rec, dirs) [V decompile] or 1ab9: `+0 x0, +2 y0` = start (leader
position), `+4 x1, +6 y1` = target (leader goto +0x12/+0x14), `+8 mask` = DS:5dfa, `+0xa mode` =
DS:5dfc, `+0xc` far pointer to a 200-byte direction buffer (filled with 0xff by 000a [V 0063..007a]).
Directions (0a8b:0b4d, dx DS:2b16, dy DS:2b04; same in DS:0222/0232): 0 N (0,−1), 1 NE (1,−1),
2 E (1,0), 3 SE (1,1), 4 S (0,1), 5 SW (−1,1), 6 W (−1,0), 7 NW (−1,−1) [V data]. 0b4d(&x,&y,d)
returns 0 (and leaves x, y) when the step leaves 0..0x6f × 0..0x9b [V 0b4d..0b99].

Buffers (allocated once by 0555:02f2 when DS:00de == 0) [V]: distance table T = DS:3f86 (0x8880
bytes, words, index `x*0x9c + y`, locked to DS:3f7a), cost map C = DS:3f82 (0x4440 bytes, index
`x*0x9c + y`, locked to DS:3f76), path cache = DS:3f7e (20 × 0xd6 bytes, locked to DS:3f72).

**Mode** (rec +0xa, DS:5dfc): 0 ship, 1 land, 2 flying. **Mask** (rec +8, DS:5dfa): bit 0 hills
bonus (some member has ARMYTYPE w18), bit 1 forest bonus (w17), bit 3 (8) sailing = some member is
aboard (mode stays 1), bit 4 (0x10) **distance map only**: no path cache, no shortcuts, the search runs
a fixed number of rings and no path is extracted (§4.3) [V 000a 007f/0190, 0373 03c0, 19e4, 0c8c:06c0..071e].

Cost map C (0555:0d9e(side, force), built for the side to move; EL §4.1): bits 0-2 step cost, 0x08 water,
0x10 crossing, 0x20 hills, 0x40 forest, **0x80 city square** (set on every square of terrain City,
0eb2..0ef9); a City square whose owner nibble ≠ side has cost byte 0 (blocked) before the 0x80 [V 0ec2..0ecf];
own coastal city (0555:109d) |= 0x18; port bit |= 0x10; ruined cities that are coastal |= 0x18 on
their four squares [V 0f86..1051]. Rebuilt only when `force` or the side changes (DS:3f6c cache) [V 0db1..0dc6].
**DS:01e0**: used instead of DS:1274 when `side == 0xE` (0e46), which also sets DS:00e0 = 1 (four-
neighbour search, see 4.3). The only caller passing 0xE is **ovl12:00dd** (`push 0x1000e`,
0d9e(0xE, 1)) [V]; ovl12 is reached only from ovl02:0199 (the random-map pipeline ovl02:011c that
also runs ovl11, the random map generator) [V call chain], so DS:01e0/four-neighbour mode belong to
random-map road building, not to the AI [I from the call chain]. In AI play DS:00e0 = 0 [I: 0d9e is
called with side = 2c04:0110 by every other caller, V call sites ovl29:0402, ovl36:0f69, ovl49:0391,
ovl49:138a, ovl61:2194].

### 7a.1 0a8b:0001(x, y, keep) move the selected stack to (x, y) [V]

All AI callers pass the leader's goto and keep = 0 (ovl19:0e66 first writes its target into
the leader's goto, 0e4e..0e5c) [V call sites in ovl19, 20, 22, 26, 28]. The early `return 0`
(L null or (x, y) off the map, 002a..0053) leaves before the loop and before the `keep` test:
nothing is marked done or deselected [V 004e..0053]. A goto of (−1, −1) takes that exit, e.g.
ovl20:1581 when the ordered army is not the leader and the leader has no goto (second review);
such a stack stays eligible for move #1's 05c4 walk [I: which other call sites can pass −1].
```
loop = 1; r = 0; n = 0                                      # 0009 bp-2, bp-8; 000e n = DI
c = (L.+0xf >> 1) & 0x7f; k = L.+0xe & 0xf                  # 0010..0027, L = DS:5e62 (read once here)
if L == null or x, y off the map (x<0, y<0, x>=0x70, y>=0x9c): return 0     # 002a..0053
while loop:                                                 # 0221 -> 0054
    loop = 0
    ovl28:0427(L.x, L.y)                                    # 0064 hero picks up a lying item (below)
    r = 0a8b:0c4f(x, y, 1)                                  # 0076
    if L.goto == (L.x, L.y): r = 4; L.goto = (-1, -1)       # 0083..00a2 (leader only)
    switch r:                                               # table 024c: 2->00bb 3->0206 4->0150 5->00c3
      2: ovl67:08fb()                                       # out of moves: 0x40 on the stack
      3: n = 0a8b:0476(DS:5dc8, DS:5dc6)                    # enemy stack ahead: attack it
         if n: loop = 1                                     # survivors: continue toward (x, y)
      4: if k == 3 and DS:5e5e != null:                     # arrived with a site order and a hero
             j = index (N-1..0) of the record == DS:5e5e    # 0166..01da, first match from the top
             s = ovl62:04b5(H.x, H.y)                       # 01b5: site on the HERO's square or -1
             if s != -1: ovl22:15c3(j, s)
             for m in DS:5e3e[0..7]: m.+0xe &= 0xf0; m.+0xe &= 0x8f  # 01dc..0202 (+0xf kept)
      5: if terrain(x, y) == 10:                            # 00c3..00ef: goto is a city square
             if owner(city c) != cur:                       # 0101..0110 (byte compare)
                 n = 0a8b:0254(c, DS:5dc8, DS:5dc6, &x, &y) # 0129
             if n: loop = 1; c = (L.+0xf >> 1) & 0x7f       # 0131..014a (k not re-read)
      other (0, 1): nothing
if keep == 0: ovl67:08fb(); 0b62:08b3(1, 1, 1)              # 022a..023d: 0x40 on the stack, deselect
return r
```
* `n` is one register (DI) for both 0476's survivor count and 0254's result, set to 0 only on
  entry [V 000e, 012f, 0216, 0131]. In case 5 with an **own** order city c the test `if n`
  reads the value left by an earlier iteration: after a won battle (case 3, n > 0) or a redirect
  (case 5, n = 1), a later status 5 with owner(c) == cur loops again — and, since nothing changes
  between two such iterations (0 steps walked, moves untouched, same path), for ever [V code].
  Status 5 survives 07f9 only while the stack has ≥ 2 moves (0a90 turns it into 2 otherwise), so
  that is a precondition. Reachable only when
  the walk is stopped by a foreign city that is not the order city while c is own: c is not a city
  order (k ≠ 1, c = whatever +0xf holds) or a cached path (§7a.3: the cache is not keyed by
  ownership) leads through a city captured since; a fresh search never enters a foreign city
  other than the opened target [I from 08bf]. A reimplementation that reproduces the original
  must keep the stale value (and would hang where it hangs).
* Case 4 searches the site on the **hero's** square (DS:5e5e's x/y), which differs from (x, y)
  when status 4 came from the end of a cut path (117b, §7a.3) rather than from reaching the goto.
* Status values come from 0c4f / 07f9 (§4.2): 1 no path, 2 out of moves (or embarked/landed),
  3 an enemy stack blocks the next square, 4 path end reached, 5 a foreign city blocks the next
  square, 0 stopped otherwise [V].
* ovl67:08fb [V decompile]: sets 0x40 on DS:5e62 (single) or on every DS:5e3e member (group). So
  every AI stack that went through 0001's loop is "done" for the turn whatever happened (not after
  the early off-map / no-leader return above), and move #1's next
  walk (05c4) skips it [V].
* ovl28:0427(x, y) [V decompile]: when a hero is selected (DS:5e5e), every item with state 1 (lying)
  on (x, y) — or within the 2×2 block (x..x+1, y..y+1) when (x, y) is a City — gets state 3 and holder
  = the hero's army index. Also called after every step for a computer side (04c8 0598). Item rules
  belong to EL §5 / the hero trace.
* Case 5 attacks the square that blocked the walk (DS:5dc8/5dc6) but decides with the **order city c**;
  when the blocking city is another city than c, that other city is attacked [V 0129 args].

### 7a.2 Walking: 0a8b:0c4f(x, y, quiet), 07f9, 04c8 [V]

```
0c4f(x, y, quiet):                                          # quiet = 1 from 0001
    L.goto = (x, y)                                         # 0c5b..0c69
    0555:1868(&rec, dirs)                                   # start = L.x, L.y; target = (x, y); mode/mask DS:5dfc/5dfa
    if 0555:000a(&rec) == 0:                                # no path
        if human: ovl58:0b5f()   (message)                  # 0ca4
        return 1
    if not quiet: 0c8c:0963(...) (path display) else DS:2eaa = DS:2ea6 = DS:2ea8 = 0
    st = 07f9(&rec)
    if DS:5dc4 != 0: 0d1a(); st = 2                          # embarked or landed: moves zeroed
    if not quiet: palette refresh (ovl66)
    return st

07f9(rec):
    (x, y) = start; steps = 0; pend = 0; st = 0
    n  = DS:5dfe if DS:2bda else 1                          # stack size
    mv = DS:5e00 if DS:2bda else L.moves_left               # 0832..0847 (signed byte)
    DS:5dc4 = 0
    cnt = 0555:18be(rec, mv, cum[100]); DS:2eaa = cnt       # cnt = steps with cumulative cost <= mv
    for i in 0..cnt-1:                                      # 086f..09ce
        d = dirs[i]; if d == 0xff or not 0b4d(&x, &y, d): st = 4; break
        o = owner nibble of map(x, y)
        if terrain(x, y) == 10 and o != cur: st = 5; DS:5dc8, DS:5dc6 = x, y; break      # 08e9..090e
        if army bit (0x10) at (x, y) and o != cur and (relation[cur*8+o] & 3) != 0:   # not at peace
            st = 3; DS:5dc8, DS:5dc6 = x, y; break                                    # 091f..0966
        kk = 0b62:007d(x, y, list)                          # armies on the square
        if n + kk > 8 or (army bit at (x, y) and o != cur): pend += 1   # cannot stop here
        else: steps += pend + 1; pend = 0                   # 097b..09c3
    if steps:
        cost = cum[steps-1]                                 # 09da
        04c8(rec, steps)                                    # animate / move
        group: DS:5e00 = max(0, DS:5e00 - cost); each member moves_left = max(0, moves_left - cost)
        single: L.moves_left = max(0, L.moves_left - cost)  # 09f8..0a75
    m = DS:5e00 if DS:2bda else L.moves_left
    if m < 2: st = 2                                        # 0a90 signed
    elif steps and st not in (5, 3) and cum[steps] != 0xff and cum[steps] > m: st = 2   # 0a95..0ac0
    return st
```
* A peace partner's stack is walked through but never stopped on; an enemy (neutral or war) stack
  stops the walk one square short [V 0949..0953: relation 0 = peace passes]. Neutral cities (owner 0xf)
  and every non-own city stop the walk (status 5) [V].
* A stack never ends on a square where it would exceed 8 armies: the squares are walked over and only
  counted once a later square is free (`pend`) [V]. If the walk ends inside such a run, the stack
  stops at the last free square.
* Moves are charged with the cumulative cost up to the last square stopped on (`cum[steps-1]`), not
  the squares walked beyond it [V].
* 04c8(rec, steps) [V 04c8..07f8]: per step: 0b4d step (its result is not tested; 07f9 has
  already checked the squares), the new (x, y) is written to every DS:5e3e member (group only)
  and to the leader; computer side (ovl25:09ab): ovl28:0427(x, y); then 0b62:01a7(ox, oy) on the
  square **just left**: when no army record (0..DS:0181−1) stands there any more, the map high
  byte loses 0x10 (army) and 0x20 (fortified) [V 0b62:01a7..024d]; DS:2ea8 += 1; 0b62:0e9b is an
  empty function [V]; ovl64:1298(cur, L.x, L.y) (Hidden Map reveal, EL §4.1: sets the seen bit
  0x20) → ovl63:1fed(L.x, L.y, 1) redraw if anything was revealed; ovl64:0565; then a delay loop
  (clock 0000:1bcf, ≤ 3 ticks or 10000 rounds, skipped when ovl59:0a7c or 0000:1bf0 says so —
  display only, no rnd). After the last step, with mode 1:
  sailing (mask & 8) and the square is not Water/Shore/Bridge (terrain ∉ {2, 3, 1}): every member
  `flags &= ~0x1000`, DS:5dc4 = 2 (landed); not sailing and the square is Water or Shore: if any
  member is a non-flying non-hero, every non-flier (heroes included) is set aboard (0x1000); else, if
  some member flies, nobody is (heroes are carried); else (heroes alone) the heroes are set aboard;
  DS:5dc4 = 1 whenever someone was set aboard [V 06f5..078b]. Finally the map word of the leader's square gets the army bit 0x10 and owner nibble
  = cur [V 079b..07eb].
* 0d1a [V]: DS:5dc4 == 1: members with 0x1000 get moves_left = 0; DS:5dc4 == 2: members without
  0x1000 get moves_left = 0.

0555:18be(rec, mv, cum) [V decompile]: cum[0..99] = 0xff; walk dirs (≤ 100, stop at 0xff or off map)
from the start; step cost = 19e4 (EL §4.3: flying 1 on cost-1 squares else 2; ship C & 7; land C & 7
with the hills/forest bonus → 2 when C & 7 > 2); in mode 1 the first non-crossing square whose
water bit differs from **aboard** (mask & 8: aboard and the square is land, or not aboard and it is
water) sets a flag — its own cost still counts — and **every later step costs 0x80** [V 19e4
1a61..1a7e]; 19e4 compares with the stack's state, not with the previous square (0373 at
0744..075d / 07cf..07e6 and 117b at 1332..134f do compare the two squares' water bits). cum[i] =
min(total, 0xff) for i < 100; returns the number of steps with total ≤ mv (signed, counting all of
them, also after a step that exceeded mv) [V 18be..19e3].
* 07f9's stack test reads relation byte 2c04:153b[cur·8 + o] for the square's owner nibble o;
  for o ≥ 8 (0xf: a neutral army outside a city — cities are caught by the status-5 test first)
  this runs into the next row, or past the 64 bytes into the city count 2c04:157b and city 0
  [V 093d..094e]; rules/movement.py `_relation_bits` reproduces that.

### 7a.3 Path search 0555:000a(rec) / 0373 / 08bf / 117b, cache 1508 / 16f0, shortcut 020e [V]

```
000a(rec):
    d = dist(x1, y1, x0, y0)                                # 0026
    if target off map: return 0                             # 0034..0051
    allocate buffers if needed; dirs[199..0] = 0xff
    if not mask & 0x10:
        if 1508(rec, 0): return 1                           # cache slot 0
        if d >= 15 and 1508(rec, 1): return 1               # cache slots 1..19
        if d == 1 and 020e(rec): return 1                   # adjacent shortcut
    lock T, C; 08bf(rec)                                    # initialise T
    if T[x1][y1] == 0x7531 and not C[x1][y1] & 0x80: r = 0  # impassable non-city target: no search
    else:
        T[x1][y1] = -1; r = 0
        for pass = 0, 1 while r == 0: r = 0373(rec, pass)   # 015f..0186
        if r == 1 and not mask & 0x10:
            117b(rec)                                       # extract the path into dirs
            if [bp-2] == 0xd: 13e4(rec)                     # uninitialised local: never 0xd, §10.2
            16f0(d, rec, d >= 15)                           # store in the cache
    0bde(rec, 0); unlock; return r                          # restore a temporarily opened city
```
* 08bf(rec) [V decompile]: DS:3f6e = 0; if the target square is a City square with cost 0 (C & 0x80,
  C & 7 == 0): 0bde(rec, 1) opens that city: its four squares get cost DS:1288 (= 1), |= 0x18 when
  coastal (109d), |= 0x80, and the city is remembered in DS:3f6a / DS:01de (0bde(rec, 0) at the end
  rewrites the four squares as in 0d9e: own → coastal 0x18, other → cost 0, then 0x80). Then every
  T cell = 30000, and 0x7531 (impassable) where: mode 1: C & 7 == 0 (DS:3f6e = 10, or 20 when the
  **target** is Water/Shore); mode 0: C has no water bit 8; mode 2: C & 0x80 and C & 7 == 0 (foreign
  city squares). With Hidden Map and a **human** side (ovl25:09ab() == 0) unseen squares (road layer bit
  0x20 clear) are also 0x7531 (mode 1 exempts the target square; modes 0 and 2 exempt the target's
  whole row and column) — never for the AI [V 08c9..08ed, 09c2..09e7, 0a92..0ab7, 0b66..0b8b].
* 0bde(rec, 1) takes the **last** city record (index count−1 down to 0) whose 2×2 block holds the
  target, and only when the target's terrain is City; 0bde(rec, 0) runs only when DS:01de is set
  and writes each of the four squares as DS:1288 (= 1), then 0 when the map owner nibble ≠
  2c04:0110, else | 0x18 when coastal, then | 0x80 [V 0bde..0d9d]. That is not 0d9e's value: an own
  city square gets cost 1 whatever 0d9e gave it, and the port bit 0x10 0d9e sets on port squares
  is lost (for a foreign port city the four squares become 0x80) until the next 0d9e.
* 0373(rec, pass) — ring relaxation from the **target** (not Dijkstra):
  ```
  pass 0: R = 6, r = 0 (DS:3f68); pass 1: R = 50, r continues; mask & 0x10: R = DS:3f70, r = 0 (both passes)
  (DS:00e0 set and pass 1: return 0 at once, 03ac..03bc; the 20 at 03ef is dead)
  box = [max(0, min(x0,x1) - R), min(0x6f, max(x0,x1) + R)] x [same for y with 0x9b]
  loop:
      if stop or (mask & 0x10 and r == R): return found
      progress = 0
      for X = max(0, x1-r)..min(0x6f, x1+r):            # ascending
        for Y = max(0, y1-r)..min(0x9b, y1+r):          # ascending
          skip unless (X, Y) in box
          if T[X][Y] < 1:                               # tentative (negative) cell
              progress = 1; v = -T[X][Y]; T[X][Y] = v   # finalise
              for each neighbour (nx, ny) in the fixed order NW, N, NE, E, SE, S, SW, W
                     (edge squares: the same order minus the off-map ones; DS:00e2/00f6/0162):
                  skip if T[n] == 0x7531
                  c = C[n] & 7
                  if n == start: (mode 1 and neither cell crossing and water bits differ) -> skip; else c = 1
                  elif mode 2: c = 1 if (C[n] & 7) == 1 and not (water and not crossing) else 2
                  elif mode 0: if not water(n) and not C[n] & 0x80: T[n] = 0x7531; skip   (else c = C[n] & 7)
                  else (mode 1): skip if neither crossing and water bits differ
                       if mask and c > 2 and ((mask&1 and hills(n)) or (mask&2 and forest(n))): c = 2
                       if (cell is not water or is crossing) and n is water and not crossing: c += DS:3f6e
                  if v + c < |T[n]| (signed): T[n] = -(v + c)     # strict: first writer keeps ties
              if (X, Y) == start and not mask & 0x10: stop = 1, found = 1   # the scan of this ring still finishes
      r += 1
      if not progress: stop = 1, found = 0
  ```
  The "ring" is the whole square [x1−r, x1+r] × [y1−r, y1+r] (rescanned every round), so cells can
  be finalised, later improved (made negative again) and re-expanded on a later ring [V: the `≤ 0`
  test at 05ad and the relax write 0835..0850]. The box limits only which cells are **expanded**;
  the relax step has no box test, so neighbours one square outside the box can hold tentative
  values [V]. The start test at 0860 is inside the expansion branch: the start must be expanded
  in this ring. Values: T[target] = 1, a cell = 1 + Σ costs of the cells from it toward the
  target (the start counts 1) [V]. In the distance-map mode the result is all rings r = 0..R−1
  inside the box of half-size R; callers read |T| [V ovl21:0a85] (encoding: §7a.4).
  CX on return is the cost register of the last neighbour that got past the 0x7531 test in the
  last expanded cell (raw C & 7 when it was then skipped, the adjusted c otherwise; y1 from 043d
  when no neighbour was examined) — 117b uses it (below) [V 043d, 0727, 0760, 0784..07a4, 0814,
  0831].
* 117b(rec) path extraction [V listing 117b..13e3]: from the start, repeatedly: base =
  0a8b:0ae4(DI, CX, x1, y1) (direction from (DI, CX) toward the target: same x → N if CX > y1
  else S; same y → W if DI > x1 else E; else NW/SW/NE/SE by the signs, 0xff when equal) [V 0ae4..0b4c],
  where **(DI, CX) are registers, not the current square** (push cx / push di at 1224): on the
  first step DI = 1 (000a's r, 017c) and CX = the value 0373 left (above); on every later step they
  hold the last candidate computed for the previous square, i.e. previous square + direction
  (base_prev + 4) % 8 (computed at 124c..125d for every candidate, also an off-map one). When
  (DI, CX) equals the target, base = 0xff and (0xff + o) % 8 = (7 + o) % 8 (idiv of a positive
  value). Try directions `(base + o) % 8` for o in DS:0212 = 0, 7, 1, 6, 2, 5, 3, 4; a candidate
  must be on the map with T ∉ {30000, 0x7531}; in mode 1 a water↔land change onto a non-crossing
  square is refused unless the current square is a crossing; pick the first with `|T| < best`
  (signed, strict; best starts at |T[start]| and then the chosen value). Up to 198 steps (0xc6, tested
  after the candidates); when no candidate is smaller (or 198 reached) the **target is moved to the
  current square** (rec +4/+6) and extraction ends (start == target: no step). rules/pathfinding.py
  `_Search.backtrace` implements exactly this (BACKTRACE_ENTRY_DI, `self.cx`) [V code compare].
* Cache [V decompile 1508/1595/165c/16f0, 0350/146c]: 20 slots (+0 state 0/2, +2 mode, +4 mask, +6/+8
  start, +0xa/+0xc target, +0xe 200 dirs). Slot 0 holds the last short path (d < 15), slots 1..19 long
  ones (first free; when full, the slot whose own start–target distance is smallest, strict `<` from
  10000, replaced only if that distance < d). A lookup matches when target, mode and mask are equal and
  the current start lies on the cached path (walking its dirs from its start); the remaining dirs are
  copied. The cache is keyed by neither side nor map state and is cleared only at allocation and by
  ovl29:0e51 (the load's AI read ovl29:0dff, 0555:0350) [V callers], so paths persist across turns and sides [V].
  Details [V listing 146c..1867]: the lookup (1595) never reads the state word; 165c returns the
  index i of the start before stepping, so a start equal to the cached path's last square (after
  its last dir) does not match, and a 0xff dir or an off-map step ends the walk with no match; a
  slot cleared by 146c is all zero (dirs 0 = N), so it matches only target (0, 0), mode 0, mask 0
  from start (0, 0). The store (16f0) copies **200** dir bytes (si = 199..0, 17b7..17e3) into
  +0xe..+0xd5 and nothing beyond (it does not touch the next slot); it writes state 2, mode, mask,
  start and the (possibly cut, 117b) target of rec. Slot 0 is written for d < 15 whatever it held.
* 020e(rec) shortcut for adjacent targets (d == 1) [V decompile]: unless mode 2, refused when exactly
  one of start/target is Water/Shore or the target terrain's DS:1274 cost is 0 (Mountains); otherwise
  dirs[0] = 0ae4(start, target) and success — no army or city test (the walk handles those) [V].

### 7a.4 Distance map 0555:1ab9(limit, x, y, mode, mask), 1b0a, 1b2e [V]

`1ab9`: DS:3f70 = limit; rec = start = target = (x, y), dirs on the stack, mode, `mask | 0x10`;
000a(&rec) [V decompile]. So: T from 08bf (mode-specific impassable squares), then rings r = 0..limit−1
from (x, y) inside the box [x−limit, x+limit] × [y−limit, y+limit]; no path, no cache. **limit** is
therefore both the box half-size and the number of rings (Chebyshev radius), not a cost cap [V 0373].
**Encoding of T after 1ab9** [V 08bf, 0373, 000a]: 0x7531 impassable for the mode (08bf; mode 0
also marks land cells met as neighbours, 07c4); 30000 not reached; a **positive** value = expanded
(final for this map); a **negative** value −v = reached but not expanded: first reached or improved
in ring R−1 after its own position was scanned, or outside the box (relaxed from a boundary cell).
|T| is the distance in both cases (1 at (x, y)). The target-city patch (0bde) and DS:3f6e
(10, or 20 when (x, y) is Water/Shore) apply as in a path search. Return value: 1 after R rings;
0 when a ring made no progress before R (pass 1 then resets r to 0, finds (x, y) already positive,
makes no progress and returns 0 at once, so T is the complete flood of the box), and 0 with no
flood at all when (x, y) is 0x7531 and not a city square (T = 30000 / 0x7531 everywhere) [V
000a 0132..015c, 03c8, 04f6..04fe].
`1b0a()` allocates if needed and locks T, returning its far pointer; `1b2e()` unlocks it [V decompile].
Readers: ovl21:0a85 (distance of a city = smallest |T| on the 12 squares around its 2×2 block, in the
order (x,y−1), (x+1,y−1), (x+2,y−1), (x+2,y), (x+2,y+1), (x+2,y+2), (x+1,y+2), (x,y+2), (x−1,y+2),
(x−1,y+1), (x−1,y), (x−1,y−1) from DS:07d8 = 0,2,2,4,4,4,6,6,6,0,0,0,−1; strict `<` against the cap
100, an off-map step ends the scan) [V data + ovl21 listing 0ad9..0b1b]. Foreign cities are
impassable in T (cost byte 0), which is why the ring around them is measured [I from 08bf + 0a85].
Callers: ovl29:0398 (45, then 60; mode 1, mask 0 → 0x10), ovl29:1771/1851 (15, DS:5dfc, DS:5dfa),
ovl22:0c5b (min(near+10, 5·strength or 50), DS:5dfc, DS:5dfa), ovl19:0996 (assault trace).

### 7a.5 Stack move mode 0c8c:0529 [V 0529..07f9] (confirms EL §4.2)

```
DS:5dfe = 0; DS:5e00 = 100; DS:5e5e = L if L.type == 0x1c else null
allfly = 1; walkers_fly = 1; flyer_free = 0; item = 0; aboard = 0; navy = 0; w17 = 0; w18 = 0
for s = 0..7 with m = DS:5e3e[s] != null:
    DS:5dfe += 1; DS:5e00 = min(DS:5e00, m.moves_left)          # signed
    if hero and ovl35:08b4(m): item = 1                          # flight item
    if not flies or aboard(m): allfly = 0
    if aboard(m): aboard = 1
    if not hero and not flies: walkers_fly = 0
    if flies and not aboard(m): flyer_free = 1
    navy |= w19; w18 |= DS:45c6+6t; w17 |= DS:45c5+6t
    if DS:5e5e == null and hero: DS:5e5e = m                     # first hero by slot
DS:2bda = DS:5dfe > 1
mode = 1; mask = 0
if aboard: mask = 8
elif navy: mode = 0
elif item or allfly or (walkers_fly and flyer_free): mode = 2
else: mask |= 1 if w18; mask |= 2 if w17
every member's goto = L.goto
human side with L.goto >= 0: path search + 18be + display; else DS:2eaa = DS:2ea6 = DS:2ea8 = 0
```
DS:5e3e must be filled before the call: ovl67:06eb and ovl29:0ae7 fill it for every member; ovl29:14d3
sets DS:5e3e[0] = list[0] for a count of 1 and every entry for a count > 1 [V ovl29:155a..15b6]
(correction to ai.md §5.11, which says "only when count > 1").

### 7a.6 How an AI stack attacks or stops [V]

* The AI never calls ovl36:0000 (the human attack command); its battles go through
  **ovl36:124a(x, y, 1)** (step order §7a.7) [V call sites 0a8b:02a7, 03ea, 0496]. The flag
  selects the path: `cmp [bp+0xa], 0; jne 1379` at ovl36:1319 — 0 = simulation (§5.12), non-zero
  = the real battle [V].
* 0a8b:0476(x, y) [V]: 124a(x, y, 1); n = number of non-null DS:5e3e (the survivors re-selected by
  the battle, EL §3.5); n > 0 → 0c8c:0529; return n.
* 0a8b:0254(c, x, y, &gx, &gy) [V 0254..0475]:
  ```
  o = owner(c)
  if o == 0x0f:                                      # neutral order city
      124a(x, y, 1); if owner(c) == cur: role(c) = 1             # 02a7, 02fe
      clear orders (+0xe &= 0xf0, +0xf &= 1 on DS:5e3e[7..0]); return 0
  if o == cur: clear orders; return 0                            # 0315
  t = c if (AI[+0x46] == c and DS:5e5e != null) else ovl29:1771(c, x, y)   # 0318..0339
  if t != c:                                                     # redirect
      DS:5e3e[7..0]: +0xe = (+0xe & 0xf0) | 1, +0xf = (+0xf & 1) | (t & 0x7f) << 1
      gx, gy = city t corner; return 1                           # 0001 walks on toward it
  124a(x, y, 1)                                                  # 03ea
  if owner(c) == cur: ovl26:0000(c, o)                           # 0416 after capture (raze/occupy, other trace)
  clear orders; return 0
  ```
  ovl29:1771 draws rnd (battle simulations, ai.md §5.13) [V].
* Stops: status 2 (moves < 2 or the next step too expensive, or embark/land), 1 (no path), 4
  (arrival; with a site order and a hero 15c3 searches), 0; every exit of 0001's loop (not the
  early return for a null leader or an off-map goto, §7a.1) marks the stack done
  (0x40) and deselects it (keep = 0) [V].


### 7a.7 The AI's real battle ovl36:124a(x, y, 1) — engine work [V ovl36:124a..16b2]

`rules/combat.py` has only the human attack (ovl36:0000) and the simulation; the AI's battle
path below must be added. `d` = owner nibble of (x, y); `human(p)` = `0x0d0[p] == 0`.
```
DS:415e, DS:415c = x, y
show  = 0x159 != 0 or (d < 8 and human(d))                     # [bp-6], 1281..12a8
show2 = (0x159 != 0 and d < 8) or (d < 8 and human(d))          # [bp-8], 12ab..12dd
view  = 0                                                       # [bp-0xa]
if DS:3254 != 0 and not (19d9[y·0x70 + x] & 0x80): show = show2 = 0      # 12e5..130c
ovl38:008b(x, y)                                  # set-up for the current selection (§5.12)
                                                  # (flag 0 returns here, §5.12)
multi = (number of sides s with 0x137[s] != 0 and human(s)) > 1          # 1379..13b4
if multi and HiddenMap: view = show; show = show2 = 0
if DS:41dd != 0:                                  # the target is a city (record pointer from the set-up)
    if Diplomacy (0x11c) and city.owner (+0x15) != 0xf and (relation[cur·8 + owner] & 3) != 2:
        ovl36:20a8()                              # treachery: rnd(1,100,0)+100 / rnd(1,15,0)+10, war both ways (below)
    city +0x30 |= byte DS:0cbe[2·cur]             # attacked-by mask, as the human path does (combat.py)
if show and not (multi and HiddenMap): ovl36:1836(x, y, 1)             # display only
ovl36:0522(x, y, -1L)                             # prelude: the stack moves onto the square, attack cost
if show: ovl65:0227(x, y)                         # display
if show or view: message (STRING 0x94 with the defender's name, or 0x95 when d >= 8) via
                 ovl61:11d1(5, …); DS:0cf8 = 1
else: DS:0cf8 = 0
r = ovl36:08a6()                                  # battle loop: rnd (EL §3.4)
ovl25:09d7(x, y, DS:42e6, DS:42c6)                # battle memory (§6.19)
if show2 or view: battle display (12bf:07a5, ovl37:0160(0), ovl59:0000(5), ovl37:0094(0, r), 12bf:0757)
ovl36:0a6b(r, x, y)                               # casualties, loot, re-selection (EL §3.5)
if r == 1: map(x, y) high byte |= 0x10            # army bit
if show or show2 or view:
    message: STRING 0x98 (r == 0) / 0x8e (hero name) / 0x96; shown through ovl36:16b3 (which
    prints only when DS:0cf8 != 0), plus ovl37:04c5, ovl59:0000(10), ovl37:04f6 when show2 or view
if show and not (multi and HiddenMap):
    ovl36:1836(x, y, 0); ovl62:0af3; if DS:3254 and HiddenMap: ovl65:05ec; ovl63:0000(…)   # display
ovl36:2274(r)                                     # medals: rnd (EL §5.8)
ovl62:0000()
ovl01:1ded(0, 0, 0, 0, 0)                         # quest check (rnd on completion, below)
ovl26:038d(x, y)                                  # AI quest bookkeeping (§6.11a)
return 0
```
* Only 20a8, 08a6, 2274 and 1ded draw rnd(); none of the display-gated calls do (no rnd site in
  ovl37, ovl62, ovl65; ovl61's only sites are in 1732; ovl63's are in 232b / 2785, which are not
  called from ovl63:0000; 1836 / 16b3 / 0522 / 0a6b and their callees 16cd, 1aff, ovl58:023d,
  ovl47:04f1, ovl39:0000 have none) [V rnd inventory + call sites]. So whether the defender is
  human changes the display, not the RNG stream.
* ovl01:1ded on a completed quest [V ovl01:26e5..273f]: quest record +0 = 0; reward ovl01:1909
  (rnd: EL §5.7), then ovl01:1c02 applies it (allies through ovl34:12e6, which draws rnd(1,3,−2)
  ×2); the music call ovl58:0000(3) is made **only when ovl25:09ab() is false** (a human side),
  so during a computer turn it is skipped and its wall-clock-dependent rnd(1,100,0) (EL §6.2) never
  happens [V 2723..272e].
* The treachery call is made by 124a itself (no dialog), before the prelude; for a computer side
  20a8 skips its nested ovl36:0000 (21cf: only when ovl25:09ab() is false) and shows its message
  only when 0x159 is set (21f4..2238), then writes the news entry ovl41:1244 [V ovl36:20a8..2261].

**Treachery by deed** [V ovl36:124a decompile, EL §6.6]: when the AI's real battle
ovl36:124a(x, y, 1) is against a city (DS:41dd set by the set-up), Diplomacy is on, the city has an
owner and the relation cur → owner is not war, ovl36:20a8 runs: infamy rnd(1,100,0)+100 from peace
or rnd(1,15,0)+10 from neutral, both directions set to war. This happens when ovl29:1771 picks a
human-owned city not at war (its rnd(1,4,-1) == 0 case, §5.13) or ovl18:0851 allowed the attack
(AI[+0x0c] bit 0, §6.1); it is the computer's only way to declare war other than its proposals.

## 8. Random numbers in AI code [V sites, order per phase]

### 8.1 Sites in the AI overlays and the resident AI helpers

All rnd() sites in ovl18–ovl30 and the resident AI helpers (out/re/ai/rnd.txt), plus the
battle dice of every ovl29:15c5 simulation:

| site | function | call |
|---|---|---|
| ovl19:07d7 | ovl19:06e9 | rnd(1,4,0) |
| ovl19:1949 / 19ee / 1a8a | capture choice, sack, pillage | rnd(1,15,0) / rnd(1,10,0) / rnd(1,5,0) (infamy, EL §6.5) |
| ovl20:07e7 | ovl20:06c7 | rnd(1,10,0) |
| ovl20:1721 | ovl20:164e | rnd(1,10,0) |
| ovl20:1837, 1b31 | ovl20:177f | rnd(1,4,-1), rnd(1,10,0) |
| ovl21:0db5..10bb | ovl21:0d7b | §4.1 |
| ovl24:058c | ovl24:023f | rnd(1,6,-1) |
| ovl25:098a | ovl25:0919 | §6.18 |
| ovl26:0090, 02a4, 02b6 | ovl26:0080 (sage) | rnd(3,500,500), rnd(1,11,-6) ×2 |
| ovl27:0567 | ovl27:04d2 | rnd(1,2,-1) |
| ovl27:073e, 0799, 07d1 | ovl27:06a0 | rnd(1,1000,0) ×3 |
| ovl27:0ed1 | ovl27:0e04 | rnd(1,10,0) |
| ovl28:0f0a, 0f31, 0f85, 0fb0 | ovl28:0efc | rnd(1,20,0) ×4 |
| ovl29:024d, 02d6 | ovl29:010b | EL §9.5 |
| ovl29:17fc | ovl29:1771 | §5.13 |
| ovl36:08a6 (via 124a(·,·,0)) | every 15c5 | battle dice; none when either side is empty (§5.12) |

### 8.2 Engine (rules) code reached from AI phases that draws rnd() [V call sites]

These are not AI functions, but the computer turn reaches them, so their draws sit inside the
phase order below. Each is already rules code (EL), except where §9 says it is missing.

| reached through | function | draws |
|---|---|---|
| ovl25:0000 at 0379 (end of the turn) | ovl00:1063 refused de-escalation (EL §6.6) | for p = 0..7 ascending, p ≠ cur, when prop(cur,p) < cur_rel(cur,p) and prop(cur,p) < prop(p,cur): rnd(1,10,0) (1152, prop 0 / rel 2) or rnd(1,2,0) (1199, prop 0 / rel 1 or prop 1 / rel 2) [V ovl00:1063..11bc] |
| ovl26:0080 (sage, Hidden Map with a target) | ovl34:0cd6 reveal (EL §5.4) | rnd(1,5,8) ×2 then rnd(1,10,15) ×2, unconditionally at its start [V 0cde..0d31] |
| 0a8b:0001 status 4 / ovl28:07ea / ovl20:12eb → ovl22:15c3 | ovl34:0000 Search (EL §5): ruin 01ab (05af, 05c1, 0677, 07ad:0850, allies 12e6 ×2), sage → ovl26:0080 | as EL §5 |
| ovl22:15c3 at 16ed (a temple, Quests on, no active quest) | ovl01:0d7a quest assignment (EL §5.7) | 0dea..14ef (9 sites), ovl47:1a9b (1abf), ovl63:2785 (2863..28dd) |
| ovl20:12eb (a non-hero explorer at a temple) | ovl34:0000 | as above |
| 0a8b:0254 (order city reached) | ovl29:1771 | 15c5, then rnd(1,4,−1) whenever the owner is a human side, also when `ok` is already 1 (§5.13); then possibly 1885 (15c5 per candidate) |
| 0a8b:0254 / 0476 → ovl36:124a(x, y, 1) | the real battle (§7a.7) | in order: 20a8 (treachery, rnd(1,100,0) from peace or rnd(1,15,0) from neutral, only for a city of a side not at war), 08a6 battle dice, 2274 medals (rnd(1,100,0), then rnd(1,n,−1) for the unit, EL §5.8), ovl01:1ded(0,…) → on a completed quest 1909 (1936, 1a1f, 1a31, 1ab0, 1bd3, 1bed as EL §5.7) and 1c02 (allies: ovl34:12e6); ovl58:0000 is **not** reached for a computer side (§7a.7) |
| 124a(1) → ovl26:038d (quest city) | ovl19:1864 (forced) | raze: rnd(1,15,0) then 1851 → 1885 (15c5 per candidate); or sack 199c rnd(1,10,0) / pillage 1a2a rnd(1,5,0) |
| 0a8b:0254 → ovl26:0000 (human city taken early) | ovl19:199c / 1864 | as above |

### 8.3 Order within a computer turn

Each "15c5" = AI[+0x20] = 10 simulated battles, each drawing pairs of battle dice until the
duel ends (EL §3.4), and none at all when the target square has no defenders (§5.12).
"Executor" = 0a8b:0001 with its callbacks (§7a.1, §7a.6): 1771 on reaching an order city,
the real battle 124a(1) (§7a.7) on attacking, 15c3 on reaching a site with a hero.

| phase | draws, in execution order |
|---|---|
| (a game loaded before any Begin) | ovl25:0519 → 0d7b draws for p = 7..0 while loading (§3.4) — not in the turn, but in the stream |
| Diplomacy §6.1 | with Diplomacy on: ovl27:0e04 → rnd(1,10,0) for p = 7..0 (8 draws); 0917 draws nothing |
| move Hero §6.2 | per hero (ascending army index): clean city 023f(c, 1) for its city (no rnd(1,6,−1) with force = 1, but its flyer exploring below); quest-city 0cf3 (15c5 unless already ordered there, then the executor); a site-order continuation (executor); then up to 2 rounds of {1348: 15c5 per candidate city; 0efc: 2 or 4 × rnd(1,20,0); the chosen move through the executor; explore ovl20:0e4b when it applies (§6.2)} |
| move Search §6.6 (Hidden Map only) | per explorer (heroes first, then the others, N−1..0): ovl20:0e4b → per step 0f46: 177f (rnd(1,4,−1) first, then rnd(1,10,0) per candidate square, x then y ascending), when nothing was found and the army flies 164e (rnd(1,10,0) per flagged intact city, count−1..0), 10a8 (15c5 for the chosen city, then the executor), 12eb (executor, then 15c3 / ovl34:0000), 1581 (executor) |
| move Explore §6.6 | per hero with flag 0x100: 11a6 → executor and 15c3 (§8.2) |
| assault §6.5 | per active TF k = 0..AI[+0x24a]−1: 00ca → 0996 groups j = 3..0 → 0b49 (15c5 per enemy city with map distance < 50 and < DS:5e00, count−1..0) → 0c32 (15c5 per candidate square, x then y ascending; then the executor) → 0f1b (executor; captures: 1864 rnd(1,15,0) and 1851 → 1885, or 199c rnd(1,10,0), 1a2a rnd(1,5,0)); 023f(staging, 1) (flyer exploring); 06e9: per target i = 0..5 one 15c5 then rnd(1,4,0), then 0f1b; 023f(staging, 1) again; 16fd: 023f(v, 1) per rear staging city and the executor |
| move #1 §6.6 | per walked stack: only for a moving army with flag 0x80, 05ff (15c5 per candidate when Neutral Cities is on; explorers 0e4b as above under Hidden Map before turn 10); then the executor |
| rescue §6.6 | per idle army: 0c5b → 0f3c (15c5 per reachable foreign candidate, count−1..0), then the executor |
| evaluate, update hide §6.8 | none |
| clean city §6.9 | per own unprocessed city (count−1..0): rnd(1,6,−1) only when not forced, no hero and the count unchanged; then, under Hidden Map for role 11 with AI[+0x24] < 5, ovl20:0e4b per flyer sent exploring (as move Search) |
| neutral §6.10 | per own city and pass: 023f(c, 1) for a newly taken city (flyer exploring); 03aa → 06c7 per candidate neighbour (i = 5..0): 15c5 if Neutral Cities on, then rnd(1,10,0) when p ≥ 75; the executor per launched group; 0b19 → 0e4b explorers as move Search |
| move #2 | as move #1 |
| quick attack §6.11 | per city (count−1..0), per candidate neighbour i = 5..0: one 15c5; then the executor |
| assault XX §6.13 | ovl27:0e04 8 × rnd(1,10,0); 04d2 rnd(1,2,−1) per tie (count−1..0); 06a0 up to 3 × rnd(1,1000,0) (only for non-zero weights) |
| specials §6.6 | per city with a hero (bit 0x20): 11a6 → executor and 15c3 |
| rebuilding, last rescue, production, vectoring | last rescue as rescue; the others none |
| end of the turn | ovl00:1063 (§8.2) at ovl25:0379, after the AI block is unlocked |
| hooks outside the turn | ovl25:0919 rnd(1,100,add) per own city with role 7/2/3 (count−1..0); ovl26:0080 rnd(3,500,500) then, with a Hidden-Map target, rnd(1,11,−6) for x then y and ovl34:0cd6's four draws |

## 9. Proposed module split for `warlords2/ai/`

One module per original unit, functions named after their address, so a reviewer can map
1:1. Inputs are the engine `GameState`; outputs are the state changes listed per function.

| module | original | functions (address → name) | hooks satisfied |
|---|---|---|---|
| `ai/state.py` | §3 | `AiBlock` (fields of §3.1 under the names of §3.1/3.2), `NeighbourTable` (NB), `ai_turn_active` (DS:0836), `is_computer_now(state)` = ovl25:09ab | persist: saved with the game (§3.4) |
| `ai/cards.py` | ovl21:084d, 0d7b | `init_block(state, p)` 084d, `apply_card(state, p, personality)` 0d7b | setup `ai_setup` = `setup_all(state)` = ovl25:0519 |
| `ai/tables.py` | ovl29:0398, 0749, ovl25:0656 | `build_neighbours`, `nearest_six`, `is_neighbour` | setup (ovl30:0000 → 010b → 0398, before territories) |
| `ai/util.py` | ovl29 | `nearest_claimed_city` 0a27, `order_stack` 0ae7, `goto_for_order` 0c7e, `step_toward` 0d88, `set_production` 0e5a, `set_vector` 0f10, `production_in_progress` 0fd5, `choose_production` 103d, `buy_flying_slot` 11d5, `fill_slot` ovl44:1299 (also for ovl25:0bd1), `select_square`/`select_square_order` 12c9/13b2, `select_list` 14d3, `win_odds` 15c5, `count_square` 1626, `seen_near` 16ae, `retarget` 1771, `best_target` 1885, `can_build_decent` 1a4d, `weakest_slot` 1ae9, `nearest_ring` ovl21:0a85 (shared by ovl19, ovl22, ovl29) | move executor needs retarget |
| `ai/base.py` | ovl25 (+ ovl29:1851) | `computer_turn` 0000, `pre_turn` 0386, `hero_city` 0919, `record_battle` 09d7, `after_raze` ovl29:1851 | turn `ai_turn`, heroes `ai_hero_city`, combat `ai_memory`, city `ai_raze` (rules/city.py names `warlords2.ai.base:after_raze`, so 1851 lives here, not in util.py) |
| `ai/phases/production.py` | ovl25:06d4 | `production` | – |
| `ai/phases/vectoring.py` | ovl25:085f | `vectoring` | – |
| `ai/phases/rebuilding.py` | ovl25:0af2, 0bd1, 0c83 | `rebuilding`, `buy_slot`, `rebuild_city` | – |
| `ai/phases/diplomacy.py` | ovl18, ovl27:0e04 | `diplomacy` 0000, `claim_city` 0917, `ally_vs_human` 0a6e, `may_attack_city` 0851, `choose_enemy` ovl27:0e04 | – (proposals feed rules.diplomacy resolve/penalty) |
| `ai/phases/assault.py` | ovl19 | `assault` 0000, `run_tf` 00ca, `move_staging` 02ed, `refresh_targets` 041c, `cancel_oldest` 0607, `cancel_tf` 066d, `launch` 06e9, `record_leader` 08b2, `move_groups` 0996, `near_city` 0b49, `skirmish` 0c32, `attack_city` 0f1b, `check_leaders` 1251, `after_capture` 134c, `extend_targets` 1579, `bring_rear` 16fd, `capture_choice` 1864, `sack` 199c, `pillage` 1a2a | city capture choice for computer sides; the raze contract is below the table |
| `ai/phases/neutral.py` | ovl20 | `neutral` 0000, `neutral_pass` 00b5, `neutral_neighbours` 01f6, `mark_explore_cities` 02ff (called from production), `send_group` 03aa, `neutral_chain` 06c7, `pick_neutral` 0935, `nearest_city` 0981, `nearest_foreign_army` 0a3e (also used by ovl22, ovl24, ovl28), `send_explorers` 0b19, `explore` 0e4b (also used by ovl22, ovl24, ovl28), `explore_step` 0f46, `explore_attack` 10a8, `explore_site` 12eb, `explore_move` 1581, `flagged_city` 164e, `frontier` 177f, `frontier_city` 1bab, `frontier_site` 1c9d | – |
| `ai/phases/evaluate.py` | ovl21 (without 084d / 0d7b, which are cards.py, and 0a85, which is util.py) | `evaluate` 0000, `tf_groups` 01b3, `flying_slot_bits` 09cf, `refresh_unseen` 0b55, `clear_unseen` 0b95, `update_hide` 0c1c; 0c92..0cd7 are unreachable (omit) | – |
| `ai/phases/move.py` | ovl22 | `move` 0000, `search` 0284, `explore` 0458, `retarget` 05ff, `rescue` 0888, `last_rescue` 0b4d, `send_to_city` 0c5b, `pick_city` 0f3c, `specials` 10e3, `hero_explore` 11a6, `search_on_arrival` 15c3 | move executor needs `search_on_arrival`; ovl23 is debug output (omit) |
| `ai/phases/clean_city.py` | ovl24 | `clean_cities` 01f1, `clean_city` 023f, `defenders_wanted` 0a3d, `garrison_order` 0b5c, `delete_army` 015e, `delete_selection` 0000, `delete_list` 00ca, `redraw` 10a1 | – |
| `ai/phases/quick_attack.py` | ovl26 | `quick_attack` 04ba, `quick_attack_city` 053f, `sage` 0080, `captured` 0000, `after_battle` 038d | ruins `ai_sage` (rules/ruins.py names `warlords2.ai.phases.quick_attack:sage`, M8b4, since M8b1); move executor needs `captured`; the AI battle (§7a.7) calls `after_battle` last |
| `ai/phases/assault_xx.py` | ovl27 | `assault_xx` 0000, `pick_staging` 01bb, `pick_targets` 03ff, `enemy_core` 04d2, `graph_dist` 058a, `style` 06a0, `is_staging` 07f8, `drop_source` 083e, `reset_tf` 08ba, `count_enemy_nb` 09ca, `source_ok` 0a7a, `refresh_sources` 0aed, `pick_sources` 0b72 | – |
| `ai/phases/hero.py` | ovl28 | `move_hero` 0000, `pick_up` 0427, `site_at` 056d, `temple_ordinal` 0600, `blessing_flag` 063c, `hero_table` 065d, `go_site_or_item` 07ea, `go_city` 0b75, `quest_city` 0cf3, `choose` 0efc, `score_sites` 0fda, `score_items` 11f8, `score_cities` 1348, `site_ok` 1637, `item_ok` 1736, `share_items` 17db, `hand_out` 1a3d | move executor and clean city need `pick_up`; clean city needs `share_items` |

**Status (M8b1 engine part done):** `GameState.ai` is `model/ai.py` `AiState`: the eight
`AiBlock`s with every field of §3.1 (names of §3.1 / A.2, task forces `TaskForce` of §6.13,
`memory[r][a]` = +0x3bc + 0x10·r + 2·a), the `NeighbourTable`, DS:0832 (`allocated`), DS:0836
(`turn_active`), DS:40f2 (`solidarity[p]`), DS:40ee (`locked`), DS:40c0 / 07c6
(`neutral_source` / `neutral_last`) and the 1851 result (`raze_target`); the blocks and the
table are saved (serialize FORMAT 9), the DGROUP words are the run's `AiProcess` (not saved;
Changelog "M8b1 review"). Written: `ai/state.py` (`block`, `ai_turn_active`, `is_computer_now`
09ab, `quest_city`, `set_city_role`), `ai/cards.py` (`init_block` 084d, `apply_card` 0d7b,
`setup_all` 0519, `load_draws` for §3.4, `card_reader` / `card_name` ovl48:006a / ovl57:21c1),
`ai/tables.py` (`build_neighbours` 0398, `nearest_six` 0749, `is_neighbour` 0656), `ai/util.py`
(the row above; 14d3 re-uses `rules.movement.select_list`, 103d's scoring
`rules.setup._choose_production`, 15c5 `rules.combat.simulate_selection`; `best_target(state,
flag, dm)` and `nearest_ring(state, c, dm, flag)` take the distance table T as the
`rules.pathfinding.distance_map` result), `ai/base.py` (`computer_turn` 0000 with the phase
table `PHASES` naming the modules / functions above, `pre_turn` 0386, `hero_city` 0919,
`after_raze` 1851, `record_battle` 09d7). Wiring: `rules.setup` HOOKS `ai_setup` (Begin, with
`new_game(cards=...)`) and `ai_neighbours` (start of ovl30:0000); `rules.turn._require` asks
`computer_turn.require` (strict: the phases must exist before End Turn changes anything);
`rules.ruins` HOOKS `ai_sage` -> `ai.phases.quick_attack:sage` (M8b4). The phase modules are
M8b2–4: each is called as `f(state) -> list[Event]`, `evaluate(state, side)`.
**M8b4 done:** `ai/phases/diplomacy.py` (ovl18 + ovl27:0e04), `assault.py` (ovl19, capture
choice 1864 / 199c / 1a2a: 1864 razes with `rules.city.raze` and calls `ai.base.after_raze`
once, reading `state.ai.raze_target`), `assault_xx.py` (ovl27), `quick_attack.py` (ovl26: the
phase, `captured`, `after_battle`, `sage` - the three rules hooks resolve here) and
`evaluate.py` (ovl21); helper calls that return a value give `(value, events)`.

**Raze contract** (one 1851 per raze, never two): `ai.base:after_raze(state, city)` = ovl29:1851
runs the distance map and 1885 in full (15c5 per reachable candidate: it draws rnd) and stores
its result (next target city or −1) in `state.ai.raze_target`. The computer's raze is
`assault.capture_choice` (1864): `rules.city.raze` (ovl32:016b), the infamy draw, then
`after_raze` once, called by 1864 itself; `assault.attack_city` (0f1b) reads the result.
`rules.city.capture` (the CaptureChoice command) calls the same hook after a computer raze
for a pending capture question, which the AI path never raises. The hook signature `-> None`
is sufficient; the two other callers of 1864 (ovl26:0000, ovl26:038d) discard the result
[V §2.2]. When 0f1b razes, DS:5e62 is null (0a8b:0001 keep = 0 ends with 0b62:08b3): 1851's
distance map is off the map and 1885 runs on the previous table DS:3f86 (Changelog "Selection
holes").

**Engine work the AI needs that is not an AI module** (each item is a rules change, listed once):
1. The move executor 0a8b:0001 / 0c4f / 07f9 / 04c8 / 0254 / 0476 (§7a.1, §7a.2, §7a.6) with its
   callbacks into the AI (ovl28:0427, ovl22:15c3, ovl26:0000, ovl29:1771). What the engine already
   has and what is missing (third review, compared with rules/pathfinding.py, movement.py,
   selection.py):
   * Present and equal to the listing: `pathfinding.find_path` = 0555:000a for modes 0/1/2 and
     masks 0..3 | 8 (cache 1508/16f0, shortcut 020e, 08bf/0373/117b incl. the DI/CX octant,
     0bde patch/restore) — except the store bug in item 7; `path_costs` / `reach_this_turn` =
     18be/19e4; `movement.stack_mode` = 0c8c:0529's mode/mask; the walk inside `movement.move`
     = 07f9 + 04c8 + 0d1a (statuses 0/2/3/4/5, `ahead` = DS:5dc8/5dc6, pend rule, relation
     overflow, embark/land, 0b62:01a7 as `_clear_left`, computer pick-up); `selection.selection_step`
     = 0529's hero / goto copy; `selection.mark_done` = ovl67:08fb.
   * Missing entry points: (a) `0c4f(x, y, quiet=1)` on the **current** selection:
     `movement.move` takes a command group and calls `selection.adopt` (leader = first id),
     while the AI's selection comes from ovl29:14d3 / 0ae7 / ovl67:06eb, and it reports "no path"
     as status 0 + `no_path` where 0c4f returns 1; (b) a public `pick_up(state, x, y)` =
     ovl28:0427 on DS:5e5e (`movement._pick_up` is private and runs only per step, but 0001
     also calls it before every 0c4f with the leader's square); (c) the 0001 loop with the stale
     `n` (§7a.1), 0254, 0476 → ovl36:124a(x, y, 1) (item 2) and 0c8c:0529 after a battle; (d) the
     DS:5dfe / 5e00 / 2bda / 5e5e values 0529 leaves for the AI readers (ovl29, ovl22).
   * **Done (M8b engine prep):** `rules.movement` `walk_selection(state, x, y)` = (a) (returns
     (status, DS:5dc8/5dc6 or None, events), "no path" = 1); `pick_up(state, x, y)` = (b);
     `execute_move(state, x, y, keep=0)` = 0001, `attack_stack(state, x, y)` = 0476,
     `attack_order_city(state, c, x, y, goto)` = 0254 (returns (result, goto, events)) = (c),
     with the stale `n` reproduced; a round of the stale case that leaves the state unchanged
     raises RuntimeError instead of hanging (as `combat.fight` does for 08a6); `set_selection(state,
     leader, members)` (DS:5e62 / 5e3e + 0529) and `selection_values(state)` (DS:5dfe, 5e00, 2bda,
     5e5e, 5dfc, 5dfa) = (d). AI calls go through `rules.movement.HOOKS` (ai_quest_city =
     AI[+0x46], ai_set_role = AI[+0x56+c], ai_retarget = ovl29:1771, ai_search_on_arrival =
     ovl22:15c3, ai_captured = ovl26:0000); the order byte +0xe is `Army.order`.
2. The AI's real battle ovl36:124a(x, y, 1) in the order of §7a.7 — treachery 20a8 called
   directly when its conditions hold, city +0x30 mask, prelude 0522, battle 08a6, ovl25:09d7 at
   1502, casualties 0a6b, map army bit, (messages), medals 2274, ovl62:0000, quest check
   ovl01:1ded(0, 0, 0, 0, 0) at 1697, then ovl26:038d at 16a3. rules/combat.py has only the
   human attack ovl36:0000 and the simulation.
   **Done:** `rules.combat.ai_battle(state, x, y)`; ovl26:038d is HOOKS `ai_after_battle`. Found
   on the way [V ovl36:124a 1311 / 1466, ovl36:0211]: the set-up runs **before** the prelude (a
   land unit attacking Water fights at its strength, not aboard at 4), and the prelude charges
   DS:4160, which only the human attack ovl36:0000 writes (0 before any human attack, else the
   last human attack's cost; `state.battle_work.attack_cost`). Open (rules/heroes.py, not this
   change): ovl36:2274 tests DS:5e5e for non-null only (23e3); after an AI battle DS:5e5e still
   names the attacking stack's hero, also when it died, while `heroes.award_medal` tests
   `live(...)`, so a won battle whose hero died skips the medal draws the original makes.
3. `combat.simulate` for 15c5 and the advisor, on the current selection, keeping
   `state.battle_work` (§7).
   **Done:** `combat.selection_group(state)` = ovl38:0293..02ea's attackers, `simulate_selection(state,
   x, y)`; `simulate(state, group, x, y)` stays for the advisor dialog.
4. The distance map 0555:1ab9 with limit / mode / mask arguments and the path cache (§7a.3,
   §7a.4, §3.4). The path cache exists (`state.path_cache`); the distance map does not:
   `_Search.flood` ignores mask 0x10 and `find_path` always uses the cache and the backtrace. A
   `distance_map(state, limit, x, y, mode, mask)` must run `_Search` with src = dst = (x, y),
   mask | 0x10, R = limit in **both** passes with r reset to 0 at each pass, return at r == R
   (result 1) or on a round without progress (0), no start stop, no backtrace, no cache lookup or
   store, the 0bde patch / restore and DS:3f6e as usual, and expose the signed field (§7a.4
   encoding) to ovl21:0a85 and the other readers.
   **Done:** `pathfinding.distance_map(state, limit, x, y, mode, mask)` -> `DistanceMap(found,
   field)` (field indexed y·112 + x, `.value(x, y)`).
5. `rules.diplomacy.penalty` (ovl00:1063): the `diplomacy_penalty` hook is called only from the
   human End Turn (rules/turn.py, ovl61:2087); `ai.base:computer_turn` must call it itself at the
   end of the computer turn (ovl25:0379, after the AI block is unlocked), §8.2.
6. Loading a saved game before any Begin consumes the 0d7b draws (§3.4).
   **Done:** `ai.cards.load_draws(state, cards, process)`, for the load path to call with
   the session's `AiProcess` (its `allocated`: a Begin or a load happened in this run) (the load ovl49:0414 reads
   the SCN at 063c and calls ovl29:0dff at 08a4; nothing re-reads the SCN after the cards' fight orders [V]).
   `rules.saveload.load` calls it as its `ai_read` hook (M10b).
7. **Engine bug** (rules/pathfinding.py `_store`, tests/engine/test_path_cache.py): the engine
   copies 201 bytes and writes the last (0xff) into the low byte of the next slot's state word;
   0555:16f0 copies 200 (si = 199..0 at 17b7..17e3, slot +0xe..+0xd5) and never touches the next
   slot. Effect: free slots look used, so far paths go to slots 1, 3, 5, … instead of 1, 2, 3, …
   and, once full, the "phantom" (0,0)→(0,0) slots (distance 0) are replaced first — the slot
   chosen differs from the original, which changes which cached path a later lookup returns.
   Failing scenario: fresh cache, `find_path((10,10), (14,10))` → original slot 1 state 0, engine
   0xff; eleven far paths from (10,10) → original slots 1..11, engine 1,3,…,19,2. Not fixed here;
   tests/engine/test_path_cache.py lines 31, 52 and 64 assert the 201st byte and must change with
   the fix.
   **Fixed** (200 bytes; tests updated and the two scenarios added). The 201 came from reading
   the copy loop `mov si, 0xc8; jmp 17de; ... 17de: mov ax, si; dec si; or ax, ax; jne 17c6` as
   si = 200..0; the test is on the value before the decrement, so the body runs for si = 199..0.
   000a's 0xff fill (0063..007a) is the same loop (200 bytes, not 201).

## 10. Remaining work

### 10.1 Not traced (function by function)

* ovl19: done (§6.5); the former [I] arguments are closed (§10.2).
* ovl20: done (§6.10).
* ovl21: done (§6.8).
* ovl22, ovl23: done (§6.6, §6.6a).
* ovl27: done (§6.1a, §6.13, §6.16a); ovl27:1052 / 122f / 0e73 / 0eeb in the dump are Ghidra fragments of 0e04, not functions.
* ovl28: done (§6.2).
* ovl29: 16ae reads the road layer 19d9 bit 0x20 [I segment].
* Resident: done as far as the AI uses it (§7a), including 0b62:01a7 / 0e9b (§7a.2, third review).

### 10.2 [U] list

* AI words whose writers are known but whose purpose beyond the code is not: +0x22 (ovl22:0284),
  +0x24 (explorer count, gate < 5; ovl22:0284, ovl24:023f), +0x4c (ovl28), +0x0e (ovl28:065d) —
  the ovl28 ones close with the hero trace.
* (closed) 0d28:011f does not zero new blocks; +0x3a..+0x40 are zeroed by ovl21:01b3 before use,
  no reader of +0x14 / +0x4e..+0x55 found [V allocator listing; I for the readers], §3.1.
* (closed) 0555:000a at 01a4 tests its never-written local [bp-2] against 0xd (13e4: debug path
  display that writes the view centre 2c04:017d/017f). For every movement caller that slot holds
  the return offset of the 0555:1868 call made just before (0a8b:0c4f: 0x0c7e, 0c8c:0529: 0x07a3,
  0c8c:0125: 0x011c), never 0xd; 1ab9 never reaches 01a4 (mask 0x10) [V stack layout; a hardware
  interrupt in the five instructions between the two calls is the only way to change it]. Only
  ovl12 (random-map roads) leaves real garbage there.
* (closed) The display calls made when 2c04:0159 ≠ 0 (ovl64:0565 / 006c, ovl63:1fed) draw no
  rnd(): there is no rnd site in ovl64, and ovl63's sites are in 232b / 2785 (called only from
  ovl01:111f, ovl35:0b0b, ovl49, ovl57) [V rnd inventory, call sites].
* (closed) Sign of distance-table entries: positive = expanded, negative = reached in the last
  ring or outside the box but not expanded, 30000 unreached, 0x7531 impassable; readers take |d|
  [V 0373], §7a.4.
* (closed) ovl62:044a returning −1 for a capital square without a city: callers read city record
  −1 = relation-matrix bytes (owner = 2c04:1551, x/y = words 2c04:153c/153e), §6.1 [V].
* (closed) ovl28:17db / 1a3d read empty item-row bytes 0xff as item −1, whose type byte is 2c04:0ce0
  (site 39's name byte 18): 0x00 in every shipped .SCN, never written in play, so never a type
  1/2/5..8 [V data, §6.2].
* The fifth and later temples get blessing mask 0x6353 (bytes after DS:0958) in ovl28:063c [V];
  effect on real heroes' flag words not established.
* (closed) The [I] arguments of §6.5: 0f1b's fallback distance is dist(L[0], target) [V
  0fcc..0ff3]; 16fd's 13b2 zero arguments are one `push dword 0` (sub 0, kind 0) [V 17f1].

## Appendix A. State tables of the move, evaluate phases

### A.1 Read/written by ovl22 and the movement machinery


#### Army record [V unless noted]

| field | value | meaning here | written by (this section) | read by |
|---|---|---|---|---|
| +0xc 0x0001 | awake | required by ovl67:05c4 (move #1 only walks awake stacks) | – | 0000 via 05c4 |
| +0xc 0x0020 | explorer | stack belongs to the explorer/search group (moved by ovl20:0e4b) [I name] | set 15c3 (allies from a ruin); cleared 0284 (release), 0b4d | 0284 (selects), 0888 (skips) |
| +0xc 0x0040 | done this turn | – | set 0000 (dropped order), ovl67:08fb after every 0a8b:0001; cleared on the stack by 15c3 after a hero search | 05c4 |
| +0xc 0x0080 | re-target before moving | 0000 calls 05ff first | cleared 0b4d; set through ovl29:0ae7's flags argument by other phases [U: which] | 0000 |
| +0xc 0x0100 | site mission | continue in Explore next turn | set by 11a6 (0ae7 flags 0x100); cleared 0458 | 0458 |
| +0xc 0x0200 | visited in this walk | move #1 bookkeeping (also the UI's Next cycle bit) | 0000 (cleared, then set when moves < 2 and for each walked stack), ovl67:06eb | 05c4 |
| +0xc 0x1000 | aboard | embark / land | 04c8 | 0c8c:0529, 0d1a |
| +0xe & 0x0f | order kind | 0 none, 1 city, 3 site (2 item, 4 keep goto: ovl29:0c7e) | 0000/05ff/0b4d/11a6/15c3-path/0001/0254 (see each trace) | 0000, 0888, 0458, 15c3, 0001 |
| +0xe bits 4-6 | "sub" | must match for 13b2 (Explore) [I: a grouping tag]; cleared by 0888 (razed target) and 0001 (site reached); 10e3 collects only armies with sub 0 | writer of non-zero values not in this section [U] | 0458, 10e3 via 13b2 |
| +0xe bit 7 | – | always preserved (`& 0xf0`, `& 0x8f`) [V] | – | [U] |
| +0xf bits 1-7 | order index (city / site) | – | 05ff, 0254, 0ae7 | 0000, 05ff, 0888, 0001 |
| +0xf bit 0 | – | always preserved (`& 1`) [V] | – | [U] |
| +0x12/+0x14 | goto | −1 = none; reaching it clears it on the leader | 0000 (own city: corner + 1), 0b4d, 05ff, 0c4f, 0c8c:0529 (copy), 0001 | 0000, 0001 |
| +7 | moves left | thresholds 2 (0000), 3 (0458), 8 (0c5b), = max (0888), = max + 2 (0888, 0b4d) | 07f9, 0d1a | many |

#### AI block and city fields

| field | use here |
|---|---|
| AI[+0x0c] bit 0 | via ovl18:0851 (05ff) [V decompile] |
| AI[+0x20] | number of simulations in 15c5 (05ff, 0f3c, 1771) |
| AI[+0x22] / AI[+0x24] | W 0284: non-flying / flying explorers kept this turn; +0x24 > 7 releases weak flyers [V] |
| AI[+0x46] | excluded city: order to it is dropped (0000), skipped in 0f3c and ovl20:01f6; 0254 attacks it directly when a hero is in the stack [V] |
| AI[+0x56+c] role | R 7 (0284 hero release, 0f3c own-city bonus, 11a6 −80, 10e3 skip); W 13 (10e3), W 1 (0254 after taking a neutral city) [V] |
| AI[+0x11e+c] bit 0 | city skipped (05ff, 0f3c) [V] |
| AI[+0x11e+c] bit 0x20 | city holds a hero (written by ovl24:023f, §6.9); read by 10e3 [V] |
| city +0x15 owner, terrain at corner | intact / owner tests everywhere |
| site +0x18 kind | 1 temple (ignored by 11a6, quest in 15c3), 5 allies ruin (15c3) |
| map high byte 0x40 | site searched (11a6, 15c3) |
| road layer 0x20 | seen (ovl29:16ae in 11a6; set by ovl64:1298 while walking) |

#### DGROUP

| address | meaning | W | R |
|---|---|---|---|
| DS:3250/3252 | reference square of the nearest-first walk | ovl67:05c4 | 05c4 |
| DS:5e62, 5e3e[8], 5dfe, 5e00, 5e5e, 2bda | selection (EL §4.5) | 06eb, 14d3, 0ae7, 0c8c:0529, 15c3 (5e62), 124a | everywhere |
| DS:5dfc / DS:5dfa | stack mode / mask (§4.0) | 0c8c:0529 | 1868, 0c5b, ovl29:1771/1851 |
| DS:5dc4 | 0 / 1 embarked / 2 landed | 07f9, 04c8 | 0c4f, 0d1a |
| DS:5dc8 / DS:5dc6 | x / y of the square that stopped the walk (status 3/5) | 07f9 | 0001 |
| DS:2eaa, 2ea6, 2ea8 | path-display counters (reachable steps, drawn, walked) | 07f9, 04c8, 0c4f, 0529 | display |
| DS:00de | pathfinder buffers allocated | 02f2 | 000a, 0d9e, 1b0a, 0350 |
| DS:00e0 | four-neighbour mode (cost side 0xE) | 0d9e | 0373, 117b |
| DS:01de, DS:3f6a | a target city's squares are temporarily opened / which city | 0bde | 0bde |
| DS:3f68 | current ring r | 0373 | 0373 |
| DS:3f6c | side of the current cost map | 0d9e | 0d9e |
| DS:3f6e | water-entry penalty 10/20 (mode 1) | 08bf | 0373 |
| DS:3f70 | distance-map limit | 1ab9 | 0373 |
| DS:3f72..3f86 | locked pointers / handles of cache, T, C | 02f2, lockers | pathfinder |


### A.2 Read/written by ovl21

| state | R/W | where | meaning / proposed name | tag |
|---|---|---|---|---|
| AI[+0x00] w | W (+1) | 0000:01ac | `turns_with_cities`; ovl19:0008 skips assault while 0 | V |
| AI[+0x02] w | W | 0000 | `own_cities` (intact, owner = side); read by ovl29:1a4d (≥ 8 / ≥ 12 strength gates), ovl25:0af2, ovl20:10a8, ovl27:06a0 | V |
| AI[+0x04] w | W | 0000 | `enemy_cities` (intact, owned by another player) | V |
| AI[+0x06] w | W | 0000 | `neutral_cities` (intact, owner 0x0f) | V |
| AI[+0x08] w | W, R | 0000 | `unseen_cities` (intact, not own, bit0 set); gate for 8 → 11 | V |
| AI[+0x24] w | R | 0000:0155 | must be < 5 (signed) for 8 → 11; written by ovl22:0284, ovl24:023f | V read / U meaning |
| AI[+0x3a] w | W, R | 01b3 | `min_member_strength` 1..4 | V |
| AI[+0x3c] w | W | 01b3 D | `n_flyer_cities` (count before trimming) | V |
| AI[+0x3e] w | W | 01b3 E | `n_fast_cities` | V |
| AI[+0x40] w | W | 01b3 F | `n_medium_cities` | V |
| AI[+0x46] w | R | ovl20:01f6 | excluded neighbour city | V |
| AI[+0x56+c] b | R/W | 0000, 0c1c; R 01b3 (7), 0a7a (5, 6, 8) | role; values written here: 0, 1, 3, 5, 11 (0000), 3 (0c1c) | V |
| AI[+0xba+c] b | W | 0000 | `owned_age`: +1 per evaluate while own & intact, else 0 (wraps at 256) | V code, I name |
| AI[+0x11e+c] bit0 | R/W | 0000 (R), 0b95 (clear), 0c1c (R) | `CF_UNSEEN` (Hidden Map) | V code, I name |
| AI[+0x11e+c] bit1 | W, R | 09cf (W), 0000, 01b3 D (R) | `CF_HAS_FLYER_SLOT` | V |
| AI[+0x11e+c] bits 3/6/7 | W | 01b3 | `CF_TF_MEDIUM` / `CF_TF_FLYER` / `CF_TF_FAST` | V code, V pairing (ovl27:0b72) |
| AI[+0x24a] w | R | 01b3, 0a7a | number of task-force records | V |
| TF[k].+0 w | R | 01b3, 0a7a | active | V |
| TF[k].+4 w | R | 0a7a | staging city (AI[+0x250+0x5c·k]; the target list is +0x0e = AI[+0x25a]) | V |
| TF[k].+0x58 w | W | 01b3 H | `min_moves` 8/12/16 (ovl27:0b72 uses it as a moves threshold) | V write, I name |
| TF[k].+0x5a w bits 3/4/5 | W | 01b3 H | `TF_FAST` (8) / `TF_MEDIUM` (0x10) / `TF_FLYER` (0x20) | V write, V use in ovl27:0b72 |
| NB[c*6+i], NB[600+c*6+i] | R | ovl20:01f6 | neighbour ids / distances | V |
| 19d9:[y*0x70+x] bit 0x20 | R | 0b95 | explored square | V read, meaning from 00_shared |
| DS:07d8, 2b04, 2b16 | R | 0a85, 0a8b:0b4d | ring walk / direction tables (values in §2.7) | V |
| DS:45c4[6t], 45c9[6t] | R | 09cf, 01b3 | flies / w15 | V |

## Changelog

### M8b UI: present points and the view words (rules/present.py; ovl36:124a, 0a8b:0254 / 0476 / 04c8, ovl64:0565 / 0629 re-read)

* The display calls of the AI's battle and walk that write game state are engine work now: the
  view words SCN 0x175..0x17f of ovl64:0565 -> 0629 after every step of a computer stack (0a8b:05f2,
  not gated), and with SCN 0x159 before (0a8b:029a / 03dd / 0489) and after (02c4 / 0433 when
  DS:5e62 is set) the battle; ovl65:0227(x, y) at ovl36:1474 when `show` (`rules.combat.
  ai_battle_gates`, `set_view_words`).  DS:3254 is kept as `AiProcess.single_view` (ovl68:0074,
  cleared at ovl68:0267).  Nothing in the engine reads the view words (only ovl24:10a1's display
  test), so no roll or decision changes; the human turn start rewrites all six (ovl64:0629 at
  ovl68:039c / 047c).
* Everything else these routines do is drawn by `states/phases/computer.py` at the present
  points (EL addition "M8b UI"), from the state as it is there.


### Selection holes, the search table DS:3f86 and the null-leader raze (M8b4 review B1, M8b review holes)

[V listing unless noted]
* **DS:3f86, the search table T.** 0555:02f2 allocates it (0x8880 bytes = 112 × 156 words,
  indexed x·0x9c + y: 0555:0113..012c `imul 0x138`). Only 0555:000a writes it: 08bf (init), the
  target word (0168), 0373 (flood); 117b reads it; 0d9e, 1508 and 18be lock the handle but
  never address it (no `[0x3f7a]` / `[0x3f7c]` use in them); the AI reads it through 0555:1b0a
  (ovl21:0a85 via ovl19:0b49, ovl22:0f3c, ovl29:1885). 000a returns before the lock for a
  target off the map (0034..0056), a cache hit (1508, 008f / 00ae) and the direct step (020e,
  00cb); every other search, path or distance map, rewrites it, also one that finds nothing.
  So the "previous table" a distance map off the map leaves is the field of the last such
  search, whichever caller made it (path searches of the executor 0a8b:0c87, of 0c8c:0125 /
  07ab, ovl12:0c58's road builder, the distance maps of ovl19 / ovl22 / ovl29). Engine:
  `GameState.dist_table` (serialised, FORMAT 10), written by `rules.pathfinding.find_path` and
  `distance_map`; `distance_map` off the map returns it. The AI callers that refused a leader
  off the map (ovl19:0996, ovl29:1771) now score on it as the EXE does.
* **B1, ovl19:0f1b raze → ovl29:1851 with DS:5e62 null.** 0f1b calls 0a8b:0001(goto, keep = 0)
  (10fa / 1108, push 0); its tail 022a..023d runs ovl67:08fb and 0b62:08b3(1, 1, 1), whose 08be
  writes dword DS:5e62 = 0. Between 1108 and 1864 (11dd) only ovl19:1251 runs (no DS:5e62
  write), nor do ovl31:07d0, ovl32:016b, the infamy draw or ovl24:10a1 inside 1864. 1851 at 1856
  (`les bx, [0x5e62]`, `mov si, es:[bx]`, `mov di, es:[bx+2]`) reads x = word 0000:0000, y = word
  0000:0002: the offset and segment of int 0. The Borland start-up (res_0000:017d..01bf) saves
  ints 0, 4, 5, 6 and sets int 0 to its divide-error handler CS:0174 (01b2..01bc: AX = 2500h, DS = CS,
  DX = 0x174); no other code of the EXE sets int 0 (the only other int 21h / 25h setters are
  res_0e8f:0018 for ints 9, 0x1b, 0x23, 0x24 and the overlay manager's res_15de:0162 for its own
  vector) [I: no resident program or debugger rewrites int 0 while the game runs]. x = 0x174 ≥
  0x70, so 0555:000a returns at 0042..0051 whatever the segment, before T is touched (1ab9 only
  wrote DS:3f70 = 15); 1885(x, y, 1) then runs on the previous T (x / y are only its outputs'
  slots), with the stale DS:5e00 and the DS:5e3e / 2bda / 5dfe that 08b3 leaves (15c5's
  set-up). The engine's `ai.base.after_raze` does exactly that (`IVT_INT0_OFFSET`); a stack of
  one army has DS:2bda clear, so 15c5's set-up then takes the null DS:5e62 itself (plan
  register X38). ai.md §2.2's table row for 1885 via 1851 and the raze contract are corrected.
* **Selection holes.** `Selection.moving` is DS:5e3e slot by slot (−1 = null, trailing nulls not
  stored). Writers: ovl29:14d3 (`rules.movement.select_list`: a −1 entry leaves its slot null in
  place when more than one entry; one entry not in slot 0 makes DS:5e3e[0] = DS:5e62 the pointer
  computed from −1, 1e1d:886a "record −1" = the map words of (101..111, 155), kept null in the
  engine, X38), ovl29:0ae7 (`ai.util.order_stack`: holes in place, DS:5e62 kept when no byte
  beats −1 — null after such a 14d3; unreachable with the shipped fight orders, all bytes 0..28),
  ovl36:0a6b (dense survivors, 0afd..0b58). Readers and what they do on a null slot: 0c8c:0529
  skips it (058f..0597) and with a null DS:5e62 sets DS:5e5e to the first hero by slot (0566's
  type test reads 0000:0004, both outcomes null) and copies the words 0000:0012 / 0014 into
  the members' goto — the only such caller, ovl22:0c5b (0e81), overwrites them in 0ae7 or
  deletes the armies in ovl24:00ca, so the copy is not modelled; 0a8b:04c8 / 07f9 / 0d1a / 0476,
  ovl67:08fb, ovl24:0000 skip null slots (the engine's `_group_records`, `_members`,
  `delete_selection`); ovl38:0293..02ea copies slots 0..DS:5dfe−1 without a test, so a hole
  takes a null slot into the battle and leaves the last live slots out (reproduced), and the
  set-up and battle then read the null attacker's fields from the interrupt vector table:
  plan register X38 (stand-in: the null slot is left out of the attacking side). Holes arise in
  ovl22:0c5b (walkers dropped, 0f3c's 15c5 and the march), ovl20:06c7 (members killed in a
  chain capture, the next link's 15c5 and march) and ovl19:0f1b (members killed in the skirmish
  0c32 or in an earlier pass of the raze loop, the next march's battles) — all reached in
  normal play. The engine's dense copies (`_dense` in move.py / neutral.py) are gone.

### M8b1 review (ai/{base,state,cards,tables,util}.py, model/ai.py, model/serialize.py, rules/pathfinding.py; ovl25, ovl29, ovl47, ovl68, 0d28 listings re-read)

* §6.18 ovl25:0919 (hero city) reads the roles through **DS:40ee** (les bx at 0953 / 0964 /
  0975). Its writers are ovl25:0091 / 0095 (the side on turn, ovl25:0000) and 0542 / 0546
  (0519, p = 7..0, so block 0 last); ovl21:0ca9 is unreachable; the unlock 0371 leaves DS:40ee
  as it is. 0919 is called at ovl47:01ed inside ovl47:0000, which ovl68:0000 runs at 019b,
  before ovl25:0000 at 01e3: it sees the block of the **last side that ran ovl25:0000**, or
  block 0 after Begin / a load that ran 0519. The engine read the side's own block (a different
  number of rnd(1,100,·) draws); now `AiState.locked` (`ai.base.hero_city`). [I] 0d28:0a84 can
  swap out an unlocked block when a swap handler (DS:3292) is registered, and 069a then locks
  it at a new address while DS:40ee keeps the old one; the engine takes the block as not moved.
  0a8b:0318 / 02f8 (quest city / set role) read DS:40ee too, but 0a8b:0254 is reached only from
  0a8b:0001, whose callers are all AI overlays (ovl19 / 20 / 22 / 26 / 28): the side on turn.
* §3.3 / §3.4 process state: ovl29:0da9 saves (and 0dff reads) only the eight blocks and the neighbour table.
  DS:0832, 0836, 40f2[8], 40ee, 40c0 / 07c6 (ovl20:06c7's chain, 0xffff in the EXE image) and
  the raze result are the running program's: a load in a fresh run finds them as the EXE
  image has them (DS:40f2 has the single writer ovl25:0386; readers ovl18:0000, 0a6e), and
  ovl25:04c5 allocates the blocks once per run and never frees them (DS:0832 has no other
  writer), so a second Begin reuses the first game's heap blocks (words 084d does not write
  keep their values) and sees stale DS:40f2. Now `model.ai.AiProcess`, held by the caller
  (`App.ai_process`) and handed to `rules.setup.new_game(process=)` and
  `ai.cards.load_draws(state, cards, process)`; not saved (serialize FORMAT 9), not hashed;
  `GameState.copy` and `serialize.snapshot` / `restore` keep its words.
* §3.1 unwritten fields are read before their first writer: ovl24:023f reads the old
  +0x182 + c (028e) before writing it (030d / 03af) and draws rnd(1, 6, −1) (058c) when the new
  count equals it (057f); ovl28:0a19 / 0c6e / 0f78 read it in the hero phase, which runs before
  clean city on a side's first computer turn. The heap's initial bytes are unknown: the engine's
  stand-in is 0 for the first game of a run [I], the previous game's bytes after that.
* The app never passed the card source to new_game: Begin drew no ovl25:0519 dice and the
  blocks were never set up. `states.game.Game.start_engine` now passes
  `ai.cards.card_reader(gd)`; the test kit's `movekit.scenario_state` too (`cards=False` for the
  synthetic `flat_state`).
* §5 ovl29:0ae7 handles holes: a −1 entry makes DS:5e3e[i] null in place (0b59..0b64). The engine's
  DS:5e3e keeps the non-null entries in slot order (every reader skips nulls), so
  `ai.util.order_stack` now takes the live entries instead of refusing (M8b4's open item).
  [Superseded: not every reader skips nulls (ovl38:0293 copies them); DS:5e3e now keeps the
  holes, Changelog "Selection holes".]
* ovl29:15c5 is imul / cwd / idiv on 16-bit words (`win_odds`); ovl25:09d7's memory words are
  kept signed, a first attacker with owner −1 (it would add at +0x3ba + 0x10 r) is refused as
  unreachable. ovl29:0e5a with vec != 0 always ends with vectoring off: 0fd5 sees +0x2d equal to
  the slot's time that 0e5a has just written. 0e5a / 0f10 write +0x31 as a word (+0x32 is
  zeroed; model.city has no such byte); 0f10's (−2, −2) tests the source index, not dest.
  ovl29:11d5's slot −1 (every slot at strength ≥ 10) cannot happen with the stock army tables
  (only type 10 has w15 = 1, strength 4; set-up caps slot strengths at 9): refused [I for
  modded tables].
* 0555:0373 is now written for speed (precomputed neighbour indices, flat index): the same
  fields, CX / radius, paths, path cache and neighbour tables as the plain version
  (`tests/engine/test_flood_fast.py` keeps it), about 2× faster (ovl29:0398 on ERYTHEA
  2.24 s -> 1.09 s); the process-wide memo of `ai.tables` is gone.

### M8b4 (ai/phases/{diplomacy,assault,assault_xx,quick_attack,evaluate}.py; ovl18, ovl19, ovl21, ovl26, ovl27 listings re-read)

Every function of ovl18, ovl19, ovl26, ovl27 and ovl21:0000 / 01b3 was re-read in the listing
while writing the modules; DS:0932 / 0940 / 094c read from the EXE image ({5,8,6,4,14,7},
{5,8,6,4,14}, {5,8,6,4,14}). Corrections and precisions [V listing]:
* §6.13 / §3.1 ovl27:06a0: the bonus +0x2e / +0x30 / +0x32 / +0x34 is chosen by the **side on
  turn** (SCN 0x0d0[cur] == 0 human, else 0x0c0[cur] 2 / 1 / 0, 06b9..0715), not by the enemy's
  level (model/ai.py's field comment says "by the enemy's level"). The gold test is the signed
  low word 2c04:0185 + 0x14·cur < 100 (0776).
* §6.1a ovl27:0e04: the "I am the Greatest" zeroing hits every alive computer p when **vs[cur] or
  vs[p]** (14a6..14c3), i.e. all of them once the side itself is at war with a non-computer; vs[s]
  needs an alive side h with 0x0d0[h] != 1 (not only humans). 0e04 runs before ovl18 resets the
  proposals, so a war proposal left from the side's last turn zeroes every side it proposed
  peace to (13a8 `any_war`).
* §6.13 ovl27:058a: a pass marks every reached city done with the D it has at that moment, so
  a shorter path found later in the same pass is never propagated further (test: chain 0→1→2
  plus a long edge 0→2 gives D = 35 at the far end where the shortest is 25).
* §6.5 ovl19:0f1b: after a skirmish with casualties 0c32 sets the dead entries of L to −1 and
  0b49 passes that L to 0f1b(k, L, near); 0f1b drops nothing more and 0ae7 then writes DS:5e3e
  with **holes** (null entries before live ones). The original's next battle set-up (ovl38:0293,
  DS:5e3e[0..DS:5dfe−1]) would then read a null far pointer. ai.util.order_stack refuses such a
  list (IllegalCommand), so the engine stops there instead of reading garbage [divergence by
  refusal; needs a decision at the frame: Selection.moving cannot hold a hole]. [Superseded:
  Changelog "Selection holes".]
* §6.5 ovl19:00ca: the capital test reads the record of ovl62:044a(first capital) also when it is
  −1 (owner byte = relation byte [2][6]); ovl19:0000 writes role 7 on TF.staging without an owner
  or range test (an active task force always has one).
* §6.11 ovl26:053f: p is stored in a byte array and re-read zero-extended (0759..075e); no effect
  for 0..100. DS:5dca / 5dda (income / upkeep) are computed now, as M8b2 does (cache, ai.md M8b2).
* §6.8 ovl21:0b95: the engine raises when y0 − 1 < 0 (the original reads 64 KiB past the layer);
  x = −1 / 0x70 read the neighbouring row as in the original.
* The 8-entry side arrays of ovl18 / 0e04 are indexed by owner / claim bytes; an index outside 0..7
  (only possible through the record −1 or a corrupt claim) reads other locals in the original and
  raises here.

Checked and found as documented: ovl18:0000 (steps A–I incl. the unreachable war branches),
0851, 0917, 0a6e; ovl27:0000, 01bb, 03ff (AI[+0x11d]), 04d2, 06a0 draws, 07f8, 083e, 08ba (the
words +0x1a.. / +0x52.. are not written), 09ca (empty targets keep their word), 0a7a, 0aed, 0b72,
0e04; ovl19:0000, 00ca, 02ed, 041c, 0607, 066d, 06e9, 08b2, 0996, 0b49, 0c32, 0f1b, 1251, 134c,
1579, 16fd, 1864, 199c, 1a2a; ovl26:0000, 0080, 038d, 04ba, 053f; ovl21:0000, 01b3, 09cf, 0b55,
0b95, 0c1c. ovl24:10a1 (called by 1864) is a view redraw only (ovl64:006c when the square is in
view); ovl32:016b does not read its third argument; ovl63:2200 (sage redraw) only draws.

### M8b3 (ai/phases/{hero,move,neutral}.py; ovl20, ovl22, ovl28 and ovl34:0000 listings re-read)

No pseudocode of §6.2, §6.6 or §6.10 was found wrong; every block was confirmed against the
listing. Additions and precisions [V listing unless noted]:
* ovl28 (§6.2): DS:0958 bytes in the EXE are `02 00 04 00 08 00 10 00 53 63` (0x6353 for the
  fifth temple, confirmed). 07ea with kind 3 and S+0x34 == −1 would read site record −1 at
  080a..0832, but only for the debug distance (no effect). 1348 returns at 141c straight to 1633
  when 13b2 finds nobody, leaving the −1 / −1 written at 136f. 0b75's dist at 0bf9 reads city
  S+0x38, harmless (0efc picks 4 only when it is ≠ −1). The 0b75 stale [bp-2] == j was re-derived
  from the frame sizes (0efc 5 words, 0b75 6). Jump table 1a2d (17db) = 1896, 1896, 18a8, 18a8,
  189b, 18a0, 18a5, 1896 for types 1..8.
* ovl22:05ff (§6.6): the Hidden-Map explore loop re-reads DS:5e3e[s] each round (07c2..0821),
  and ovl20:0e4b reselects through ovl29:0ae7([j]) (and possibly ovl67:06eb in 1581), so after
  the first explorer only what DS:5e3e then holds is sent — in practice the first member alone
  [V reads; I effect].
* ovl22:0c5b (§6.6): the walkers dropped at 0dfc..0e4e leave −1 holes in the list; 14d3 (0e61)
  and 0ae7 (0f0c) copy it slot by slot, so DS:5e3e holds nulls and DS:5e62 = DS:5e3e[0] is null
  when slot 0 was a walker; 0529 at 0e81 then reads hero / goto from a null leader; 00ca (0f30)
  gets the list with its holes. Engine: the dense live entries in slot order give the same
  members, hero and leader; the only difference is that, when no entry's fight-order byte beats
  −1, 0ae7 would keep the null DS:5e62. [Superseded: also 0f3c's 15c5 copies the null slot;
  the holes are kept now, Changelog "Selection holes".]
* ovl34:0000 (Search, called by 15c3 and ovl20:12eb): moves test `+7 > 0` signed (0017);
  terrain 11 without a site record counts as terrain 7 (0081), so nothing happens; with a hero
  the searched bit (0x4000) is tested before the kind (00ef), so a hero on a searched temple
  does nothing.
* A.1 "+0xc 0x80 set by other phases [U]": one writer is ovl20:06c7 (0ae7 flags 0x80, also
  10a8's 0ae7([a], 1, c, 0x80)).
* ovl20:00b5: the skip after "no neutral neighbour" is SCN 0x128 (Quick Start) or role != 5 or
  ovl61:225b > 5 (jg, = "≥ 6"); clean city is 023f(c, 1) at 0111; 01f6 gets a null dists
  pointer (0124).
* ovl20:03aa: keep's memory term is Σ AI[+0x40c + 2p] for p = 7..0 (row 5), a signed 16-bit sum
  capped by `jle 2`, so a negative sum lowers keep (0435..045e); the "keep == 0" stop reads the
  original keep (di), not the copy decremented while skipping (0663); groups are taken from the
  sorted list in order, `per` at a time (05fe..065d); ret starts as HiddenMap != 0 (03e3).
* ovl20:06c7: before 01f6, group entries whose owner (cwde) != cur become −1 in the group list
  itself (06df..071d); only then, with Neutral Cities, 14d3. p = 100 is set once on entry (06cf),
  not per link. [bp−6] (p of the best) is written and never read. **Engine divergence:** members
  killed in a chain capture leave −1 holes before live entries; the original's 14d3 / 0ae7 keep
  those null slots in DS:5e3e and ovl38:008b (02bd..02e2) would copy a null attacker into the next
  link's 15c5. The engine cannot hold holes: neutral.py compacts the list (same leader, members
  and order); the null-attacker read is not reproduced [V code; whether a later simulation then
  differs is I]. [Superseded: Changelog "Selection holes".]
* ovl20:0b19: tf = any of TF k = 3..0 active (0b5b..0b82); the keep == 0 / Hidden Map / 0a3e < 15
  test is made again before each explorer (0d9d..0e36).
* ovl20:0e4b: steps = moves (signed byte) idiv 5 + 1; the loop makes up to steps + 1 calls of 0f46
  (0e98..0f3d).
* ovl20:0f46: found with kind 1 → 10a8, kind 2 → 12eb, a non-zero result ends the step; a zero
  result or kind 0 goes to 1581 on the frontier square (0f73..0fbe). 177f's result is `found`, so
  kind 1 / 2 with found == 0 takes the not-found path. The fallback clear is +0xe &= 0xf0,
  +0xf &= 1, flags &= ~0x20, goto (−1, −1), +0x11 = 0 (1047..109e).
* ovl20:12eb: the owner test reads the map owner nibble of (x, y) (1375..138c), the temple test is
  `test flags, 063c(s)` (1344); r == 1 from 0a8b:0001 returns 0 before the tail (13de).
* ovl20:177f: home = city record (signed byte) a.+9 (17c4..17fc; record −1 lies in the relation
  matrix, words 2c04:153c / 153e as x / y); the hills skip needs mode ≠ 2, no road, mask bit 0 clear
  and terrain 5 (1996..19e4); the cost-0 skip applies only when mode ≠ 2 (1a05..1a3c).
* DS:07c6 is initialised data, 0xffff (file offset 0x2000 + 0x31250 + 0x7c6); DS:40c0 reads 0 in the
  image. Neither has a field in model/ai.py yet (neutral.py keeps them as attributes of
  `state.ai`, not saved; see the M8b3 report).

### M8b2 (ai/phases/{production,vectoring,rebuilding,clean_city}.py; listing re-read)

Checked against the listing and found as documented: ovl25:06d4 (incl. the switch table 0847:
roles 0/1 and ≥ 14 fall to kind 3 through the unsigned `ja`; role 8 writes +0x2d = 0 only),
085f, 0af2, 0bd1 (strict `gold > price + 30`, unlike 11d5's `>=`), 0c83 (table 0daf); ovl24:01f1,
023f, 0a3d, 0b5c, 015e, 10a1; DS:0814 / 081c / 0824 re-read from the EXE image.
Added [V listing]:
* §6.9 0000 / 00ca: slot orders (0..7 / 7..0), what 0000 clears (5e3e, 5e5e, 5e62 only), the
  last-square redraw and the closing ovl62:0000 (doc said only "delete every army").
* §6.9 0a3d reads relation[cur][owner]; no caller uses 023f's result.
* §6.17: AI[+0x0a]·count is a 16-bit product sign-extended by cwd before the idiv.
* §6.9 / §6.16: DS:5dca / 5dda are caches (writers ovl62:0372 / 02bf only; refresh sites listed in
  §6.9). **Engine divergence, open:** the engine has no such cache (`rules.economy` computes
  income / upkeep when asked), so clean city's `income < 2·upkeep` and production's
  `income < upkeep` use current values where the original uses the values of the last refresh
  (the turn-start settlement, before the turn's new units, or the last battle / capture / raze).
  They differ when the side's armies changed since (new units of ovl43:0000, 015e disbands,
  embarking, items picked up). Needs a per-side cache refreshed at those call sites.

### M8b1 implementation (listing re-read for ai/{state,cards,tables,util,base}.py)

Corrections [V listing]:
* §6 / ovl25:045e: the Settings call is ovl33:0000(0) at 0479 (doc said "ovl64:...:0000(0)");
  the key test is `0000:0417 & 8` or `& 3`.
* §3.1 +0x0c: the card sets bit 0 with an OR (1045..104b), so personalities 1 and 2 keep it
  whatever the card says (doc read as "bit 0 = card +0x0a ≠ 0").
* §4.2: 0398's temporary owner is SCN 0x110 (= 0 after 03f2), and the restore sets the four
  owner nibbles to owner & 0xf, not to their previous value; 0749 writes only the picks.
  ovl25:0656 compares the id byte with a word: d = 255 matches an empty entry.
* §5.2 0ae7: DS:5e62 is kept when no row byte beats −1; −1 entries leave holes in DS:5e3e.
* §5.8 11d5: 1ae9 = −1 makes 1299 write the city's owner byte and slot-3 bytes (no range test).
* §3.4: also the fight-order rows of 0d7b stay in the loaded SCN image (copied after
  ovl49:0ae3 read it), so a load before any Begin replaces the saved fight order of every
  live computer side by its card's.

Checked and found as documented: ovl21:084d, 0d7b (all three personalities, card offsets, draw
order), 0a85; ovl25:0000, 0386, 04c5, 0519, 056c, 05b9, 05e6, 063d, 0919, 09ab; ovl29:0398, 0749,
0a27, 0c7e, 0d88, 0e5a, 0f10, 0fd5, 103d, 11d5, 12c9, 13b2, 1626, 16ae, 1771, 1851, 1885, 1a4d,
1ae9; ovl44:0000, 1128, 1299, 138f; ovl48:006a; ovl57:21c1; ovl47:01dc..01f3 (09ab, 0919),
0301; ovl01:0d7a's computer type order (4 / 5 by rnd(1,5,−1), then 3, then 6, 6 kept).

### Third review (the part the second pass left on one trace; listing + engine code compare)

Errors found and fixed [V listing]:
* 0555:117b: the octant is `0ae4(DI, CX, target)` with DI/CX **registers** (1224): DI = 1 and
  CX = 0373's leftover on the first step, then the last candidate tried from the previous square
  ((base + 4) % 8). Doc said `0ae4(current square, target)`. The engine already does this.
* 0555:0373: the relax compare is signed (jle at 0847), not unsigned; the box restricts expansion
  only (cells just outside it get relaxed); with DS:00e0 pass 1 returns 0 at once (the R = 20 is
  dead code). CX on return documented (117b reads it).
* 0555:08bf: under Hidden Map for a human side, mode 2 exempts the target's row and column like
  mode 0 (doc said mode 0 only). 0bde restore: cost 1 for own squares, port bit lost (doc said
  "as in 0d9e").
* 0555:19e4: the 0x80 stop flag is set by a non-crossing square whose water bit differs from
  aboard (mask & 8), not by a water ↔ land change between squares.
* 0a8b:0001: 0476 and 0254 share one register n (DI), zeroed only on entry; in case 5 with an own
  order city the stale n loops again, for ever when nothing changes (doc: no loop when the city is
  own). Case 4 looks for the site on the hero's square (doc: on (x, y)). 0b62:08b3 has three
  arguments (1, 1, 1). The early return (null leader / off-map goto, e.g. a −1 goto) marks
  nothing done and does not deselect (doc: "every exit of 0001 marks the stack done", §7a.1/§7a.6).
* 0a8b:04c8: 0b62:01a7 gets the square just left and clears map bits 0x10 and 0x20 when no army
  record is left there; 0b62:0e9b is empty (doc: "[I] map army bits", §10.1 "not read").
* §7a.4: encoding of T after 1ab9 (sign, 30000, 0x7531) and 1ab9's return value ([U] closed).
* §3.1 / §10.2: 0d28:011f does not zero (0d28:027c is the clearing allocator); ovl21:01b3
  zeroes +0x3a..+0x40 first ([U] closed). 0555:000a's [bp-2] is the return offset of the 1868
  call made just before, never 0xd, so 13e4 is never called ([I] closed).
* §9: engine entry points the AI still lacks (0c4f on the current selection, public pick-up,
  distance map with mask 0x10) and the engine path-cache store bug (item 7, not fixed).
* ovl28:0b75 (fork A): the stay test compares AI[+0x182+hc] with the never-written local [bp-2],
  which holds 0efc's saved DI = j, the hero's slot in S. Doc said `== n` ("the whole garrison").
* ovl28 item −1 (fork A): byte 2c04:0ce0 is 0 in every shipped .SCN and never written in play,
  [I] → [V data].
* ovl20:0a3e (fork B): it has no x ≠ −1 / owner ≠ 0xff test (0a56..0acc), so with side == −1
  freed army records (0b62:03be: owner 0xff, x = y = −1) count as armies at (−1, −1). Once any
  record was freed the result is at most trunc(√((x+1)² + (y+1)²)). Doc said "nearest army not
  neutral and not cur's".
* ovl20:0935 / 0981 (fork B): return values stated. 0935 returns 0xff also when 01f6 finds none,
  and its test is a signed byte `< 3`. 0981 returns the distance, not the city.
* ovl24:023f (fork B): the army scan has no owner or x test before the signed box test. A
  foreign army deleted there by 015e(a, 1) is still counted, its flags are read through type −1
  (DS:45be / DS:45c2), and it enters L [V 039e..04a6; whether it is reachable is I].
* ovl21:0b95 (fork B): y0 − 1 = −1 wraps to 19d9:ff90 + x (past the layer, not before it).

Checked and found as documented: 0555:000a, 020e, 02f2, 0350, 1508 / 1595 / 165c / 16f0 slot
rules, 1868, 18be, 1ab9, 1b0a, 1b2e; 0a8b:0ae4, 0c4f, 07f9, 0d1a, 04c8 embark / land and map
mark, 0254, 0476; 0c8c:0529 in full; ovl28:07ea, 0cf3, 0efc, 0fda, 11f8, 0427, 0600 / 063c, 17db,
1a3d; ovl22:0458, 0b4d, 10e3, 15c3; ovl21:09cf, 0b55, 0c1c; ovl20:0000, 00b5; ovl24:01f1 and 023f
outside the corrected scan. rules/pathfinding.py and the walk in rules/movement.py match these
listings except `_store` (§9 item 7).

### Second review (review findings + second-pass verification against the listings)

Review findings applied (each re-checked in out/asm first):
* §8 restructured: 8.1 AI sites, 8.2 rules code reached from AI phases that draws rnd (ovl00:1063
  at ovl25:0379; ovl34:0cd6 from the sage; ovl34:0000 / ovl01:0d7a from 15c3 and 12eb; 1771; the
  real battle 124a(1): 20a8, 08a6, 2274, ovl01:1ded → 1909 / 1c02; 1864 from ovl26), 8.3 per-phase
  order incl. 023f flyer exploring (force = 1 callers too), Search / Explore / specials, load.
* **Changed from the review**: ovl58:0000 (music, rnd(1,100,0)) is *not* reached during a
  computer turn — ovl01:1ded calls it only when ovl25:09ab() is false (ovl01:2723..272e). The
  quest-completion path draws through 1909 and ovl01:1c02 (allies: ovl34:12e6) instead.
* §7a.7 new: step order of ovl36:124a(x, y, 1), with one step the review list did not have
  (city +0x30 |= DS:0cbe[2·cur], 1423..1437) and the display gating ([bp-6]/[bp-8]/[bp-0xa]);
  §7a.6: flag 1 = real is [V] (1319). §9 lists it as engine work.
* §5.12: exact 15c5 / 124a(0); a simulation with an empty side draws nothing (08a6 08c4..08e1).
* §7: which selection a simulation uses (ovl38:0293..02ea) and who sets it; advisor vs AI win
  tests; leftover battle arrays read by ovl01:1ded(−1) at ovl68:01d9.
* §2.2 / §5.14 / §9: only 0f1b uses 1864's return; raze contract (one 1851 per raze) and
  `after_raze` moved to ai/base.py to match rules/city.py; ai_sage path mismatch stated;
  `diplomacy_penalty` must be called by computer_turn.
* TF +0x250 called "staging" everywhere (§6.6 0284 note, §6.8 0a7a, §6.9 0b5c, §6.17a 085f, A.2).
* §6.6 0f3c note: DS:07d8 walks the 12-square ring (was [I] "2×2 squares"); returns the cap with
  x = y = −1. §6.6 10e3 / A.1: bit 0x20 writer = ovl24:023f.
* §5.15 1a4d: effective strength (+2 when w15 == 1). §4.1: +0x41c is cleared (ovl21:09a3).
* §6.17 0bd1 and §5.8 11d5: ovl44:1299 gets ovl44:138f's return (record index), price = that
  record's +0x1e. (The review's "+0x1e" is the record offset; the `add [bp-8], 0x1e` that follows
  is the +30 margin.)
* §6.5 0f1b: fallback = dist(L[0], target) before the terrain test (0fcc..0ff3); record −1 =
  relation-matrix bytes (closed [U], §6.1 / §10.2); §6.1 step F tests written exactly.
* §3.4: loading with DS:0832 == 0 runs 0519 / 0d7b (rnd) before the file overwrites the blocks.
* §2.2: 28 far call sites of ovl25:09ab. Tool caveats added under the tool table.
* §9: neutral.py and evaluate.py filled.
* rules/combat.py docstrings: DS:412c..4132 (listing ovl36:1323..136f), not 41cc..41d2 (the
  decompile prints these words as 451b:01cc..01d2).

Second-pass errors found and fixed [V listing]:
* ovl20:0f46 / 1581: 1581 moves the stack with the **leader's** goto (0a8b:0001(DS:5e62.goto));
  ovl67:06eb → 0c8c:0529 copies the leader's goto to every member (0c8c:0737..0766), so a's new
  goto survives only when a is the leader. Was "0a8b:0001(goto)".
* ovl20:177f / 1bab / 1c9d: a later foreign city in scan order overwrites an earlier kind 1 or 2;
  a site is taken only while kind == 0; the rnd(1,10,0) comes after both dist calls (1b0e..1b31).
* ovl20:10a8: the first qualifying city (highest index) is taken; a flagged one is skipped only if
  0b95 leaves it flagged (was "the scan continues").
* ovl20:12eb: exact branches; the kind-5 test uses the value read before the search; a non-hero
  reaches ovl34:0000 only at a temple; 0x40 is set only when the army is not on the site.
* ovl20:164e: any owner (no owner test); ovl20:03aa / 0b19: allowance ≤ 0 is dropped by the sort.
* ovl20:06c7: when 01f6(from) finds no candidate it returns at once (the Hidden-Map order-only
  tail runs only after a scan that found none acceptable); `*ret = 0` is written for every
  unflagged candidate before the sent ≥ 3 test; thresholds are d > 40 / d > 50 (same as ≥ 41 /
  ≥ 51).
* ovl19:041c: slot rule written exactly (worst starts 0, largest > 0, NB distance stored).
* ovl19:0b49: no intact / flag test, 15c5 drawn only for d < 50 and d < DS:5e00.
* ovl19:0996: 13b2 minallow is 0 (was "·"); "last member" = first non-empty slot from 7 down.
* ovl19:0f1b: `L[0] != -1` (was "L non-empty"); the retarget is not repeated after a raze;
  capital = 2c04:0193/0195 + 0x14·cur; no 134c when 1864 keeps the city.
* ovl19:1579: a target added from T's neighbours keeps a stale distance word (+0x272).
* ovl19:16fd: 13b2(…, 0, 0, TF[+0x58]) is [V] (17f1 `push dword 0`); order i = 0..5.
* ovl19:02ed, 08b2: tie rules stated (NB slot 5..0; strongest strict >, highest slot).
* ovl22:0c5b: limit is 10·⌊strength/2⌋, not 5·strength; "max_moves" is the allowance +6.
* ovl24:0b5c: pseudocode rewritten exactly (elif chain of the bonuses, pool tests, `taken`
  update for heroes, minmv from the lowest matching TF index).
* ovl26:038d: ovl01:1ded takes five words (2/4, 0, 0, 0, 0); the forced 1864 still sacks at
  value ≥ 400.
* ovl29:1771 / 1885: rnd(1,4,−1) also when ok is already 1; 1885's x, y are scratch outputs.
* ovl18 step F: the third loop has no p ≠ cur test (prop(cur,cur) is cleared too).

Checked in the second pass and found as documented: ovl19:0000, 00ca, 0607, 066d, 06e9, 0c32,
134c, 1251, 1864, 199c, 1a2a; ovl20:0e4b, 03aa, 0b19 (apart from the sort note); ovl21:01b3
phases D–H; ovl22:0284, 05ff, 0888, 11a6; ovl24:0a3d, 023f flyer block (07cd..08a0); ovl27:01bb,
03ff, 04d2, 058a, 09ca, 0a7a; ovl28:1348; 0a8b:0001 (dispatch and the case-4 clear); ovl38:008b
attacker list; ovl25:04c5 / 056c / 0bd1; ovl00:1063.

Not re-verified in this pass (still as the first trace left them): 0555 path search / cache
internals (§7a.3), 0a8b:07f9 / 04c8 / 0c4f walking details (§7a.2), 0c8c:0529 except the goto copy,
ovl28:07ea / 0b75 / 0cf3 / 0fda / 11f8 / 0427 / 17db / 1a3d, ovl22:0458 / 0b4d / 10e3 / 15c3,
ovl21:09cf / 0b95 / 0c1c, ovl20:00b5 / 0935 / 0a3e / 0981, ovl24:023f outside the flyer block.

