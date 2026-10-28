# ovl21: evaluate (0000), task-force classification (01b3), update hide (0c1c), helpers

Source of truth: out/asm/ovl21.asm (the Ghidra output for 01b3 is garbage: it splices in code
from another segment — `DAT_451b_002a + 0x6120`, terrain rewriting, rnd calls — none of that is in
ovl21:01b3; everything below for 01b3 is from the listing). Conventions, record layouts and names
as in 00_shared.md and docs/research/ai.md. `AI[x]` = byte/word at DS:40ee far ptr + x.
`count` = 2c04:157b. `owner(c)` = signed byte 2c04:1592+0x41c (cwde before compares).
`intact(c)` = terrain of the map tile at (c.x, c.y) (2c04:0710[tile]) == 10.
"for c in count-1..0" = Borland `i = n; while (i-- != 0)` (loop at the addresses given).

## 1. Function table

| address | size | callers | callees | purpose |
|---|---|---|---|---|
| ovl21:0000 | 0x1b3 | ovl25:0205 (evaluate phase, arg = 2c04:0110) | ovl21:09cf, ovl21:0b55, ovl20:01f6 | per-turn city census: AI[+2..+8], roles 0/1/3/5/11, AI[+0xba+c] age counter, AI[+0] turn counter |
| ovl21:01b3 | 0x692 (+ jump table 0845..084c) | ovl19:0011 (assault, only when AI[+0]≠0), ovl27:01b2 (end of assault XX) | ovl29:1a4d, ovl27:0a7a | classify own cities into capability groups (AI[+0x11e+c] bits 3/6/7), AI[+0x3a..+0x40], task-force fields +0x58/+0x5a |
| ovl21:084d | 0x182 | ovl25:054a | ovl21:0d7b | AI block initialiser — done (ai.md §4.1) |
| ovl21:09cf | 0xb6 | ovl21:0000 | – | AI[+0x11e+c] bit1 := city has a flying-type slot |
| ovl21:0a85 | 0xd0 | ovl19:0b98, ovl22:1045, ovl29:07b3, ovl29:19a3 | 0a8b:0b4d | smallest \|distance\| on the 12-square ring around a city in a distance table |
| ovl21:0b55 | 0x40 | ovl21:0000, ovl21:0c1c | ovl21:0b95 | Hidden Map: refresh "unseen" bit0 of every city |
| ovl21:0b95 | 0x87 | ovl21:0b55, ovl20:117c | – | clear AI[+0x11e+c] bit0 if any square of the 4×4 block around c is explored |
| ovl21:0c1c | 0x76 | ovl25:0292 (only if HiddenMap 2c04:0124 ≠ 0) | ovl21:0b55, ovl20:01f6 | update hide: role 2 → 3 when an eligible neutral neighbour has become seen |
| ovl21:0c92 | 0x31 | none (no far call `lcall 0x2fc5,…` reaches it) | ovl25:056c, ovl21:0cc3, ovl25:05b9 | dead: lock current side's block into DS:40ee, call empty 0cc3, unlock |
| ovl21:0cc3, 0cc8, 0ccd, 0cd2 | 5 each | 0cc3 by 0c92; others none | – | empty functions (`push bp; mov bp,sp; pop bp; retf`) |
| ovl21:0cd7 | 0xa4 | none | ovl23:0000, 005a, 0099 | dead debug: print a list of numbers into a text buffer |
| ovl21:0d7b | 0x37a | ovl21:084d | rnd ×14 | personality defaults / card — done (EL §6.8, ai.md §4.1) |

Overlay entry stubs (segment 0x2fc5) used anywhere in the EXE [V, grep of all listings]:
+0x20 → 01b3 (2 sites), +0x25 → 084d, +0x2a → 0000, +0x2f → 0c1c, +0x34 → 0b95, +0x39 → 0a85 (4 sites).
No stub targets 0c92, 0cc3..0cd2 or 0cd7 → unreachable [V]; funcs.tsv also lists no callers for 0c92 and 0cd7 [V].

No rnd() call in ovl21 outside 0d7b [V, out/re/ai/rnd.txt lists only 0d7b sites].

## 2. Per-function traces

### 2.1 ovl21:0000(side) — evaluate

Input: `side` = [bp+6] (the caller pushes 2c04:0110, ovl25:0200) [V]. Output: AI block fields; no
return value (void, ax not used by ovl25:020a) [V].

```
0006  ovl21:09cf()                                   # flying-slot bit1 refresh (§2.3)      [V]
000b  ovl21:0b55()                                   # Hidden Map unseen-bit refresh (§2.5) [V]
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

### 2.2 Words written by ovl21:0000 [V]
| field | value after the call | proposed name |
|---|---|---|
| AI[+0x00] | +1 per call with AI[+2] ≠ 0 | `turns_with_cities` |
| AI[+0x02] | number of intact cities owned by `side` | `own_cities` |
| AI[+0x04] | number of intact cities owned by another player (owner ≠ side, ≠ 0x0f) | `enemy_cities` |
| AI[+0x06] | number of intact neutral cities | `neutral_cities` |
| AI[+0x08] | number of intact non-own cities (neutral or enemy) with AI[+0x11e+c] bit0 (unseen) | `unseen_cities` (always 0 without Hidden Map: bit0 is only ever set by 084d under Hidden Map) |

### 2.3 ovl21:09cf() — flying-slot bit [V]
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

### 2.4 ovl21:0b95(c) — clear unseen bit [V]
```
x0 = c.x (157d), y0 = c.y (157f); seen = 0
0bc6 for x in x0-1 .. x0+2:                          # dx, inclusive (cmp x0+2,dx; jge)
0bcb     for y in y0-1 .. y0+2:                      # cx, inclusive
0bd8         if 19d9:[y*0x70 + x] & 0x20: seen = 1   # road/explored layer, bit 0x20
0c06 if seen: AI[+0x11e+c] &= 0xfe
```
No bounds check [V]: x0-1 = -1 or x0+2 = 0x70 read the neighbouring row's byte, y0-1 = -1 reads
before the layer (19d9:-0x70..). [I] cities are never placed on the border, so this is harmless;
a reimplementation should index `y*0x70+x` linearly to stay exact.
Bit 0 of AI[+0x11e+c] = `CF_UNSEEN` [I from 084d (set for all cities when HiddenMap) and this
clear rule]: the city counts as seen once any square of the 4×4 block x0-1..x0+2 × y0-1..y0+2 is
explored. It is never set again after 084d [V: grep of every `or/and/mov byte es:[bx+0x11e]` in
out/asm: bit0 is set only at ovl21:0928 (084d) and cleared only at ovl21:0c12 (0b95); other
overlays only `test` it].
Other writers of AI[+0x11e+c] for reference [V grep]: ovl29:128e |= 2 (11d5), ovl25:044b &= 0xfb,
ovl24:02d8 |= 4, ovl24:0514 &= 0xcf, ovl24:0527 |= 0x20, ovl24:053a |= 0x10.

### 2.5 ovl21:0b55() [V]
```
0b5e if 2c04:0124 (HiddenMap) == 0: return
0b6b for c in count-1..0:  if AI[+0x11e+c] & 1: ovl21:0b95(c)
```

### 2.6 ovl21:0c1c() — update hide (called only when HiddenMap, ovl25:028a) [V]
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

### 2.7 ovl21:0a85(c, &x, &y, table far, flag) — nearest ring square of a city in a distance table [V]

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

### 2.8 ovl21:01b3() — task-force capability classification (listing only; Ghidra output is wrong)

No arguments; reads cur = 2c04:0110. Called by ovl19:0011 (start of assault, after the
`AI[+0] != 0` test) and ovl27:01b2 (last call of assault XX) [V]. Returns ax = 0 (loop-exit value
at 0841) and both callers ignore it [V: ovl19:0016 reloads ax; ovl27 returns straight after].
TF[k] = task-force record at AI[+0x24c + 0x5c·k]; TF[k].active = word +0, +0x58 = word at
AI[0x2a4+0x5c·k], +0x5a = word at AI[0x2a6+0x5c·k].
Slot fields of city c, slot s: type = signed byte 2c04:[0x1593+0x41·c+s], str = signed byte
[0x159b+…], moves = signed byte [0x159f+…] (all cwde'd / compared as signed bytes) [V].
`w15(t)` = byte DS:45c9[6t] (= 45c4+5), `flies(t)` = byte DS:45c4[6t] (00_shared.md) [V addresses].
`eff(c,s)` = str + 2 if w15(type) == 1 else str (same rule as ovl29:1a4d / 1ae9) [V].
`ok(c)` = ovl27:0a7a(c, 1) [V push 1 at 0390/0475/05ac]:
```
ovl27:0a7a(c, also6) [V ovl27.asm 0a7a..0aec]:
    for k in AI[+0x24a]-1..0: if TF[k].active and TF[k].target(+4) == c: return 0
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

### 2.9 Unreachable code: ovl21:0c92, 0cc3..0cd2, 0cd7 [V]
* 0c92(): `DS:40ee = ovl25:056c(cur)` (dx:ax stored to 40f0:40ee), call 0cc3 (empty), ovl25:05b9(cur).
  Note it overwrites DS:40ee with the result of 056c — harmless since unreachable.
* 0cc3, 0cc8, 0ccd, 0cd2: empty far functions.
* 0cd7(buf_off, buf_seg, p3 dword, list far, n, add): ovl23:0000(buf, p3, 0x0f, 0, 0x2d) (box/clear,
  [U] exact), then for i in 0..n-1: colour = DS:07c8[i] if n == 8 else 0x0f; v = list[i] + add;
  v ∈ {0, -1} → ovl23:005a(buf+4i+10, DS:07f2 "  -", colour, 0) else ovl23:0099(buf+4i+10, v if
  v ≤ 1000 else 999, 3 digits, colour, 0). A debug dump of 8 per-side numbers; not needed.
  Nothing calls it, so a reimplementation omits it.

## 3. State read / written by the traced functions

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
| TF[k].+4 w | R | 0a7a | target city | V |
| TF[k].+0x58 w | W | 01b3 H | `min_moves` 8/12/16 (ovl27:0b72 uses it as a moves threshold) | V write, I name |
| TF[k].+0x5a w bits 3/4/5 | W | 01b3 H | `TF_FAST` (8) / `TF_MEDIUM` (0x10) / `TF_FLYER` (0x20) | V write, V use in ovl27:0b72 |
| NB[c*6+i], NB[600+c*6+i] | R | ovl20:01f6 | neighbour ids / distances | V |
| 19d9:[y*0x70+x] bit 0x20 | R | 0b95 | explored square | V read, meaning from 00_shared |
| DS:07d8, 2b04, 2b16 | R | 0a85, 0a8b:0b4d | ring walk / direction tables (values in §2.7) | V |
| DS:45c4[6t], 45c9[6t] | R | 09cf, 01b3 | flies / w15 | V |

## 4. rnd() calls in order

None in ovl21:0000, 01b3, 09cf, 0a85, 0b55, 0b95, 0c1c, nor in the callees used here
(ovl20:01f6, ovl27:0a7a, 0a8b:0b4d) [V: listings contain no `-> ovl59:02bf`; rnd.txt]. The 1a4d
path of 01b3 does not draw either: 1a4d → 103d (dry run, callees only 0e5a) and ovl44:0000 (no
callees); 0e5a → 0f10, ovl44:0000, ovl61:225b; none of them is rnd [V funcs.tsv]. So evaluate,
01b3 and update hide consume **no** random numbers.

## 5. [U] list
1. Meaning of AI[+0x24] (gate "< 5" for role 8 → 11). Blocker: writers ovl22:0284, ovl24:023f not traced.
2. Meaning of roles 2, 8, 11 beyond the conditions given (writers in ovl19/20/24/25/27).
3. Sign convention of distance-table entries (0a85 takes |d|). Blocker: 0555:000a subtree.
4. ovl23:0000 arguments in dead 0cd7 (irrelevant for the game).
