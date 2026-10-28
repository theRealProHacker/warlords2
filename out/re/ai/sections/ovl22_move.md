# ovl22 / ovl23 and the movement machinery as the AI uses it

Source of every [V]: the capstone listings out/asm/ovl22.asm, ovl23.asm, res_0555.asm, res_0a8b.asm,
res_0c8c.asm (addresses are overlay/segment offsets). Names as in docs/research/ai.md (AI[+x] = the
locked AI block DS:40ee, `cur` = 2c04:0110, `count` = city count 2c04:157b, `N` = army high-water
mark 2c04:0181). Army fields: +0 x, +2 y, +4 type, +5 owner, +6 max moves, +7 moves left,
+8 strength, +0xc flags, +0xe order byte (low nibble kind, bits 4-6 "sub"), +0xf (bit 0 kept,
bits 1-7 order index), +0x11 group id, +0x12/+0x14 goto. "flies(t)" = byte DS:45c4+6t != 0,
"w13(t)" = byte DS:45c8+6t (+4). "terrain(x,y)" = SCN[0x710 + low byte of map word (x,y)];
10 = City, 11 = Ruin/Temple site. "intact city c" = terrain(c.x, c.y) == 10 (its corner square).
All loops written `for i = n-1..0` are Borland `mov ax,i; dec i; or ax,ax; jne body` loops whose body
sees n-1 down to 0 [V].

## 1. Function table

| address | name (driver label) | args → result | callers | summary |
|---|---|---|---|---|
| ovl22:0000 | move #1 / move #2 | () → 1 | ovl25:0000 (twice) | walk every own awake stack nearest-first (ovl67:05c4) and move it toward its goto; drop invalid city orders |
| ovl22:0284 | move Search | () | ovl25:0000 (Hidden Map only) | the flagged (0x20) explorer armies: heroes first, then the rest, each sent by ovl20:0e4b; counts them in AI[+0x22]/[+0x24] |
| ovl22:0458 | move Explore | () | ovl25:0000 | heroes carrying flag 0x100 continue their site mission via 11a6 |
| ovl22:05ff | re-target a 0x80 stack | () → 0/1 | ovl22:0000 | for the selected stack whose order is "city c": pick the nearest neutral neighbour city with odds ≥ 75 |
| ovl22:0888 | rescue | () | ovl25:0000 | idle (kind 0) full-move armies outside cities → 0c5b; clear orders aimed at razed cities |
| ovl22:0b4d | last rescue | () | ovl25:0000 | armies that did not move for a turn outside cities: wipe their order → 0c5b |
| ovl22:0c5b | send army to a city | (army index) | 0888, 0b4d | build the stack on the army's square, distance map, choose a city (0f3c), give order 1 and move, else ovl24 fallback |
| ovl22:0f3c | choose target city | (stack size n) → city or −1 | 0c5b | lowest score over reachable cities (own +30/+10, +100 if n ≥ 4; foreign only with odds ≥ 75) |
| ovl22:10e3 | specials | () | ovl25:0000 | for own cities flagged AI[+0x11e+c] & 0x20 and role ≠ 7: hero+flyer pair waiting at (x+1, y) goes exploring (11a6) |
| ovl22:11a6 | hero + flyer explore | (list far) → 0/1/2 | 0458, 10e3 | pair the first hero with the first flyer; best unsearched site (or own city) by a 15/40 distance score; order 3 (site) or 1 (city) and move; search on arrival (15c3) |
| ovl22:15c3 | search site on arrival | (army, site) → 0/2 | 11a6, 0a8b:0001, ovl20:12eb | if the army stands on the site with moves left: ovl34:0000 search; temple + Quests: quest; allies (kind 5): w13 allies get flag 0x20 and are sent by ovl20:0e4b |
| ovl23:0000, 0144, 0247, 0478 | see §3 | | | (§3) |
| 0a8b:0001 / 0254 / 04c8 / 0c4f | move executor | | | §4 |
| 0c8c:0529 | stack move mode | | | §4 (EL §4.2) |
| 0555:1ab9, 1b0a, 1b2e, 0373, 08bf, 0d9e | pathfinder / distance map / cost map | | | §4 |

## 2. ovl22 traces

### 2.1 ovl22:0000 move #1 / move #2 [V]

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

### 2.2 ovl22:0284 move Search (only with Hidden Map, ovl25:0000) [V]

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
  task-force target role, ai.md §3.2 [I]).
* Flag 0x20 = "explorer" [I from this function and 15c3, which sets it on allies before calling
  the same ovl20:0e4b]. 0e4b itself belongs to the ovl20 trace.

### 2.3 ovl22:0458 move Explore [V]

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

### 2.4 ovl22:05ff re-target the selected stack (flag 0x80) [V]

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

### 2.5 ovl22:0888 rescue [V]

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

### 2.6 ovl22:0b4d last rescue [V]

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

### 2.7 ovl22:0c5b(i) send army i (and its square-mates) to a city [V]

```
a = army[i]
near = ovl20:0981(a.x, a.y, cur)                            # 0c97: min dist(a, own intact city), start 10000, strict <
weak = a.strength < 3 or a.max_moves < 8                    # 0cac, 0cbe signed bytes -> di
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
lim = (a.strength / 2) * 10 if DS:5e5e == null else 50      # 0e86..0ea8: no hero: signed /2 truncating (cdq,sub,sar)
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
  to the nearest own city, capped at 5·strength (no hero; strength here is the **trigger army's**,
  not the stack's) or 50 with a hero [V].
* `n` passed to 0f3c is the 12c9 count (before the walkers were dropped) [V 0ef2 pushes [bp-2]].

### 2.8 ovl22:0f3c(n) choose a target city from the distance map [V]

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
  when none. So the table is x-major, 156 words per column [V decompile; I that DS:07d8 lists the
  2×2 city squares].
* Every foreign candidate within reach costs AI[+0x20] battle simulations [V].

### 2.9 ovl22:10e3 specials [V]

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
  (role 13 is turned back into 4/8 by ovl25:0386 next turn, ai.md §6.0 [V]). Who sets bit 0x20 of
  AI[+0x11e+c] is outside this section [U: writer not located here].

### 2.10 ovl22:11a6(list) hero + flyer exploration [V]

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

### 2.11 ovl22:15c3(i, s) search a site on arrival [V]

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

## 3. ovl23: debug text output (no AI logic) [V]

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

## 4. Movement machinery used by the AI

### 4.0 Path record and global tables [V]

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

### 4.1 0a8b:0001(x, y, keep) move the selected stack to (x, y) [V]

All AI callers pass the leader's goto and keep = 0.
```
loop = 1; r = 0                                             # 0009, bp-8
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
             j = index (N-1..0) of the hero; s = ovl62:04b5(x, y)   # site at (x, y) or -1
             if s != -1: ovl22:15c3(j, s)
             for m in DS:5e3e[0..7]: m.+0xe &= 0xf0; m.+0xe &= 0x8f  # 01dc..0202 (+0xf kept)
      5: if terrain(x, y) == 10 and owner(city c) != cur:  # 00c3..0110: goto is a city square
             if 0a8b:0254(c, DS:5dc8, DS:5dc6, &x, &y):    # 0129
                 loop = 1; c = (L.+0xf >> 1) & 0x7f        # 0138..014a (k not re-read)
      other (0, 1): nothing
if keep == 0: ovl67:08fb(); 0b62:08b3(1, 1)                 # 022a..023d: 0x40 on the stack, deselect
return r
```
* Status values come from 0c4f / 07f9 (§4.2): 1 no path, 2 out of moves (or embarked/landed),
  3 an enemy stack blocks the next square, 4 path end reached, 5 a foreign city blocks the next
  square, 0 stopped otherwise [V].
* ovl67:08fb [V decompile]: sets 0x40 on DS:5e62 (single) or on every DS:5e3e member (group). So
  every AI stack that went through 0001 is "done" for the turn whatever happened, and move #1's next
  walk (05c4) skips it [V].
* ovl28:0427(x, y) [V decompile]: when a hero is selected (DS:5e5e), every item with state 1 (lying)
  on (x, y) — or within the 2×2 block (x..x+1, y..y+1) when (x, y) is a City — gets state 3 and holder
  = the hero's army index. Also called after every step for a computer side (04c8 0598). Item rules
  belong to EL §5 / the hero trace.
* Case 5 attacks the square that blocked the walk (DS:5dc8/5dc6) but decides with the **order city c**;
  when the blocking city is another city than c, that other city is attacked [V 0129 args].

### 4.2 Walking: 0a8b:0c4f(x, y, quiet), 07f9, 04c8 [V]

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
* 04c8(rec, steps) [V 04c8..07f8]: per step: timing delay (display), 0b4d step, the new (x, y) is
  written to every member (group) and the leader; computer side: ovl28:0427(x, y); 0b62:01a7 /
  0b62:0e9b (map army bits, [I]); DS:2ea8 += 1; ovl64:1298(cur, x, y) (Hidden Map reveal, EL §4.1:
  sets the seen bit 0x20) → redraw if anything was revealed. After the last step, with mode 1:
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
with the hills/forest bonus → 2 when C & 7 > 2); in mode 1 the first step that changes water ↔ land onto
a non-crossing square sets a flag and **every later step costs 0x80** [V 19e4]; cum[i] = min(total, 0xff);
returns the number of steps with total ≤ mv (counting all of them, also after a step that exceeded mv).

### 4.3 Path search 0555:000a(rec) / 0373 / 08bf / 117b, cache 1508 / 16f0, shortcut 020e [V]

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
            if [bp-2] == 0xd: 13e4(rec)                     # uninitialised local, see [U]
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
  0x20 clear) are also 0x7531 (except the target; mode 0 exempts the target's row and column) — never for
  the AI [V 08c9..08ed].
* 0373(rec, pass) — ring relaxation from the **target** (not Dijkstra):
  ```
  pass 0: R = 6, r = 0 (DS:3f68); pass 1: R = 50 (20 if DS:00e0), r continues; mask & 0x10: R = DS:3f70, r = 0
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
                  if v + c < |T[n]| (unsigned): T[n] = -(v + c)     # strict: first writer keeps ties
              if (X, Y) == start and not mask & 0x10: stop = 1, found = 1   # the scan of this ring still finishes
      r += 1
      if not progress: stop = 1, found = 0
  ```
  Cells can be finalised and later improved (made negative again) and re-expanded on a later ring
  [V: the `< 1` test and the relax write]. Values: T[target] = 1, a cell = 1 + Σ costs of the cells
  from it toward the target (the start counts 1) [V]. In the distance-map mode the result is all
  rings r = 0..R−1 inside the box of half-size R; cells first reached in the last ring keep a
  negative (tentative) value; callers read |T| [V ovl21:0a85].
* 117b(rec) path extraction [V decompile]: from the start, repeatedly: base = 0a8b:0ae4(cur, target)
  (direction toward the target: same x → N if y0 > y1 else S; same y → W if x0 > x1 else E; else
  NW/SW/NE/SE by the signs, 0xff when equal) [V 0ae4..0b4c]; try directions `(base + o) % 8` for
  o in DS:0212 = 0, 7, 1, 6, 2, 5, 3, 4 (straight first, then alternating left/right); a candidate must
  be on the map with T ∉ {30000, 0x7531}; in mode 1 a water↔land change onto a non-crossing square is
  refused unless the current square is a crossing; pick the first with `|T| < best` (strict, best
  starts at |T[start]| and then the chosen value). Up to 198 steps (0xc6); when no candidate is
  smaller (or 198 reached) the **target is moved to the current square** (rec +4/+6) and extraction ends.
* Cache [V decompile 1508/1595/165c/16f0, 0350/146c]: 20 slots (+0 state 0/2, +2 mode, +4 mask, +6/+8
  start, +0xa/+0xc target, +0xe 200 dirs). Slot 0 holds the last short path (d < 15), slots 1..19 long
  ones (first free; when full, the slot whose own start–target distance is smallest, strict `<` from
  10000, replaced only if that distance < d). A lookup matches when target, mode and mask are equal and
  the current start lies on the cached path (walking its dirs from its start); the remaining dirs are
  copied. The cache is keyed by neither side nor map state and is cleared only at allocation and by
  ovl29:0e51 (save, 0555:0350) [V callers], so paths persist across turns and sides [V].
* 020e(rec) shortcut for adjacent targets (d == 1) [V decompile]: unless mode 2, refused when exactly
  one of start/target is Water/Shore or the target terrain's DS:1274 cost is 0 (Mountains); otherwise
  dirs[0] = 0ae4(start, target) and success — no army or city test (the walk handles those) [V].

### 4.4 Distance map 0555:1ab9(limit, x, y, mode, mask), 1b0a, 1b2e [V]

`1ab9`: DS:3f70 = limit; rec = start = target = (x, y), dirs on the stack, mode, `mask | 0x10`;
000a(&rec) [V decompile]. So: T from 08bf (mode-specific impassable squares), then rings r = 0..limit−1
from (x, y) inside the box [x−limit, x+limit] × [y−limit, y+limit]; no path, no cache. **limit** is
therefore both the box half-size and the number of rings (Chebyshev radius), not a cost cap [V 0373].
`1b0a()` allocates if needed and locks T, returning its far pointer; `1b2e()` unlocks it [V decompile].
Readers: ovl21:0a85 (distance of a city = smallest |T| on the 12 squares around its 2×2 block, in the
order (x,y−1), (x+1,y−1), (x+2,y−1), (x+2,y), (x+2,y+1), (x+2,y+2), (x+1,y+2), (x,y+2), (x−1,y+2),
(x−1,y+1), (x−1,y), (x−1,y−1) from DS:07d8 = 0,2,2,4,4,4,6,6,6,0,0,0,−1; strict `<` against the cap
100, an off-map step ends the scan) [V data + ovl21 listing 0ad9..0b1b]. Foreign cities are
impassable in T (cost byte 0), which is why the ring around them is measured [I from 08bf + 0a85].
Callers: ovl29:0398 (45, then 60; mode 1, mask 0 → 0x10), ovl29:1771/1851 (15, DS:5dfc, DS:5dfa),
ovl22:0c5b (min(near+10, 5·strength or 50), DS:5dfc, DS:5dfa), ovl19:0996 (assault trace).

### 4.5 Stack move mode 0c8c:0529 [V 0529..07f9] (confirms EL §4.2)

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

### 4.6 How an AI stack attacks or stops [V]

* The AI never calls ovl36:0000 (the human attack command); its battles go through
  **ovl36:124a(x, y, 1)** (EL §3: set-up ovl38:008b; with the flag ≠ 0 the prelude 0522 moves the
  stack onto the square and charges the attack cost, then battle loop 08a6, battle memory ovl25:09d7,
  casualties 0a6b, …) [V call sites 0a8b:02a7, 03ea, 0496; I that flag 1 = "real" from 124a 1319 and
  15c5 passing 0].
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
  (arrival; with a site order and a hero 15c3 searches), 0; every exit of 0001 marks the stack done
  (0x40) and deselects it (keep = 0) [V].

## 5. State read / written

### 5.1 Army record [V unless noted]

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

### 5.2 AI block and city fields

| field | use here |
|---|---|
| AI[+0x0c] bit 0 | via ovl18:0851 (05ff) [V decompile] |
| AI[+0x20] | number of simulations in 15c5 (05ff, 0f3c, 1771) |
| AI[+0x22] / AI[+0x24] | W 0284: non-flying / flying explorers kept this turn; +0x24 > 7 releases weak flyers [V] |
| AI[+0x46] | excluded city: order to it is dropped (0000), skipped in 0f3c and ovl20:01f6; 0254 attacks it directly when a hero is in the stack [V] |
| AI[+0x56+c] role | R 7 (0284 hero release, 0f3c own-city bonus, 11a6 −80, 10e3 skip); W 13 (10e3), W 1 (0254 after taking a neutral city) [V] |
| AI[+0x11e+c] bit 0 | city skipped (05ff, 0f3c) [V] |
| AI[+0x11e+c] bit 0x20 | city sends hero+flyer explorers (10e3) [V read; U writer] |
| city +0x15 owner, terrain at corner | intact / owner tests everywhere |
| site +0x18 kind | 1 temple (ignored by 11a6, quest in 15c3), 5 allies ruin (15c3) |
| map high byte 0x40 | site searched (11a6, 15c3) |
| road layer 0x20 | seen (ovl29:16ae in 11a6; set by ovl64:1298 while walking) |

### 5.3 DGROUP

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

## 6. rnd() in order

ovl22, ovl23 and the resident movement code draw **no** rnd() directly [V: no ovl59:02bf call in
ovl22.asm, ovl23.asm, res_0555/0a8b/0c8c.asm]. They consume rnd through:
1. ovl29:15c5 (AI[+0x20] simulations, each with battle dice): 05ff once per surviving neighbour
   candidate (i = 5..0) when 2c04:011a ≠ 0; 0f3c once per reachable foreign city (count−1..0) [V].
2. ovl36:124a(x, y, 1) real battles from 0476 / 0254 (EL §3.4 dice) [V call].
3. ovl29:1771 from 0254 (15c5, then rnd(1,4,−1) when the city owner is human, then 1885's
   simulations, ai.md §5.13) [V call].
4. Callees owned by other traces: ovl20:0e4b (0284, 05ff, 15c3), ovl24:015e/00ca (disband, via
   ovl36:16cd for heroes), ovl26:0000 (after a capture), ovl34:0000 (search), ovl01:0d7a (quest) [U:
   their rnd use is in their own traces].
So inside move #1 the order is: per walked stack (05c4 order) → 05ff's simulations (flag 0x80) →
for each status 3/5 encounter: 1771's draws (status 5, non-neutral) → the battle → repeat [V].

## 7. [U] list

1. 0555:000a 01a4: `cmp [bp-2], 0xd` reads an uninitialised local; when it happens to be 0xd,
   13e4 runs (debug path display that also writes the view centre 2c04:017d/017f). Blocker: stack
   contents left by earlier calls; no game logic depends on it [I].
2. Writers of army +0xe bits 4-6 and of AI[+0x11e+c] bit 0x20, and the phases that set army flag 0x80
   (via ovl29:0ae7 flags) — outside ovl22 (ovl19/ovl20/ovl21/ovl24/ovl28 traces).
3. ovl20:0e4b (explorer move), ovl24:015e/00ca (disband), ovl26:0000, ovl34:0000, ovl01:0d7a, ovl28:0427,
   ovl18:0851, ovl20:01f6, ovl20:0981 are cited from their decompiles only; their exact rules belong to
   the owning traces.
4. Whether the display-only calls (ovl64:0565 / 006c, 077b:005f, ovl63:1fed) made when 2c04:0159 ≠ 0
   draw rnd(): 077b:005f does not [V 005f → 0161]; ovl64 not checked.
5. 0b62:01a7 / 0b62:0e9b in 04c8 (per-step map army-bit bookkeeping) not read [I from context].
