# ovl28: the hero AI ("move Hero" phase and helpers)

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

## 1. Function table

| address | name | args → result | callers | summary |
|---|---|---|---|---|
| 0000 | move Hero (phase) | () → – | ovl25:0000 | AI[+0x46] = quest city; build hero table S (065d); per hero: clean its city (ovl24:023f force), quest attack (0cf3), continue a site order, then ≤ 2 rounds of {score sites/temples, items, cities; pick (0efc); act} |
| 0427 | pick up items | (x, y) → – | 0a8b:0001 (0064), 0a8b:04c8 (0598), ovl24:023f | if a hero is selected (DS:5e5e): every lying item (state 1) on (x, y) — 2×2 block when (x, y) is a city square — becomes carried (state 3) by that hero |
| 056d | site on a square | (x, y, &kind) → site / −1 | ovl20:12eb | site at (x, y) if terrain 11, kind written; −1 for an explored non-temple |
| 0600 | temple ordinal | (s) → k / −1 | 063c | number of temples (kind 1) with index < s, capped at 4 |
| 063c | temple blessing flag | (s) → mask / −1 | ovl20:12eb, 0fda | DS:0958[0600(s)] = {2, 4, 8, 0x10, 0x6353} |
| 065d | hero table | (S far) → – | 0000 | up to 6 own heroes (army index N-1..0) with their city / site square and flight-item flag; AI[+0x0e] = number recorded |
| 07ea | move to site / item | (i, kind, S far, unused) → 1 arrived / 0 | 0000 | gather the hero's group (13b2), trim it (flyer / alone), give order 3 (site S+0x34) or 4 with goto = item S+0x3c, move |
| 0b75 | move to city | (i, S far, unused) → 0 always | 0000 | gather the hero's group, stay if it is the whole garrison and an enemy is near, else order 1 (city S+0x38) and move |
| 0cf3 | quest city | (i, S far) → 1 moved / 0 | 0000 | quest types 4/5: march on the quest city with the square's armies when enough armies and odds ≥ 75 (or already ordered there) |
| 0efc | choose action | (i, S far) → 0..4 | 0000 | random-perturbed nearest of: 1 quest temple, 3 site, 4 city, 2 item (2 or 4 rnd(1,20,0)) |
| 0fda | score sites | (i, S far) → – | 0000 | nearest quest temple (S+0x30/0x32) and nearest legal site (S+0x34/0x36) |
| 11f8 | score items | (i, S far) → – | 0000 | nearest reachable lying item (S+0x3c/0x3e) |
| 1348 | score cities | (i, S far) → – | 0000 | best enemy city by win odds then distance (S+0x38/0x3a) |
| 1637 | site worth visiting | (s, a) → 0/1 | 0000, 0fda | near enough (2T+3, +12 special), a seen square around, terrain 11, temple or unexplored |
| 1736 | item worth fetching | (it) → 0/1 | 11f8 | lying, a seen square around, not inside a foreign city |
| 17db | share items in a city | (H far) → – | ovl24:023f | among ≤ 8 heroes in one city: hand flight/move/gold items to heroes without one, then even out battle/command items; AI[+0x4c] += 1 per hand-over |
| 1a3d | hand out one item type | (H far, cnt far, I far, type) → – | 17db | repeat until stable: a hero with ≥ 2 items of `type` gives one to each hero with none |

## 2. Hero table S (frame of 0000, bp-0x48, passed as a far pointer)

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

## 3. Function traces

### 3.1 ovl28:0000 move Hero (phase entry, from ovl25:0000) [V 0000..041e]

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

### 3.2 ovl28:065d(S) hero table [V 065d..07e9]

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

### 3.3 ovl28:0efc(j, S) choose the action [V 0efc..0fd9]

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

### 3.4 ovl28:0fda(j, S) sites and quest temples [V 0fda..11f7]

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

### 3.5 ovl28:1637(s, a) site worth visiting [V 1637..1735]

```
d = dist(site s, army a)                                             # 168f
lim = 2·T + 3; if site[s].+0x1b (word) != 0: lim += 12               # 169a..16b8  [V]
if not d < lim: return 0                                             # 16bb (jl)  [V]
if ovl29:16ae(site s) == 0: return 0                                 # 16c8  [V] a seen square in the 3×3 around it
if terrain(site s) != 11: return 0                                   # 16f4  [V]
if site[s].kind == 1: return 1                                       # 1706  [V] temples always
return 0 if explored(site s) else 1                                  # 1720..172d  [V]
```

### 3.6 ovl28:11f8(j, S) items lying on the map [V 11f8..1347]

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

### 3.7 ovl28:1736(it) item worth fetching [V 1736..17da]

```
if item[it].state != 1: return 0                                     # 1769  [V] lying on the map
if ovl29:16ae(item x, y) == 0: return 0                              # 1777  [V]
if terrain(item x, y) == 10 and owner(ovl62:044a(item x, y)) != cur: return 0   # 17a2, 17ac, 17cd  [V]
return 1
```
* On a city square ovl62:044a should find the city; if it returned −1 the owner byte of record −1
  (2c04:157d − 0x41 + 0x15) would be read [V code; U whether reachable, not checked].

### 3.8 ovl28:1348(j, S) enemy cities [V 1348..1636]

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

### 3.9 ovl28:07ea(j, kind, S, unused) move to a site or an item [V 07ea..0b74]

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

### 3.10 ovl28:0b75(j, S, unused) move to a city [V 0b75..0cf2]

```
h = S[j]; c = S+0x38; hc = S.city[j]                                 # 0b8b..0bcb
d = dist(c, h)                                                       # 0bf9  [V] never read afterwards
n = ovl29:13b2(h.x, h.y, &L8, (h.+0xe>>4)&7, h.+0xe&0xf, 12)         # 0c04..0c57  [V] selects
if n == 0: return 0                                                  # 0c5c
if hc != -1 and AI[+0x182+hc] (byte) == n:                           # 0c61..0c78  [V] the group is the whole garrison
    th = ovl20:0a3e(h.x, h.y, -1)                                    # 0ca1
    if th < (15 if T > 5 else 10): return 0                          # 0cac..0cc1 (jg)  [V] stay
ovl29:0ae7(L8, 1, c, 0)                                              # 0ccf  [V] order kind 1 city c
0a8b:0001(leader.goto.x, leader.goto.y, 0)                           # 0ce5  [V]
return 0                                                             # 0ced: di is 0 throughout  [V]
```
* 0b75 always returns 0, so after a city move the hero's rounds end [V].
* 0ae7 sets the goto by ovl29:0c7e (enemy city: corner moved one step toward the army, ai.md §5.3);
  the executor attacks the city on reaching it, and for AI[+0x46] == c with a hero selected it does not
  re-target (0a8b:0254, ovl22_move.md §4.6) [V there].

### 3.11 ovl28:0cf3(j, S) march on the quest city [V 0cf3..0efb]

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

### 3.12 ovl28:0427(x, y) pick up lying items [V 0427..056c]

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

### 3.13 ovl28:056d(x, y, &kind) site on a square [V 056d..05ff]

```
if terrain(x, y) != 11: return -1                                    # 05a3
s = ovl62:04b5(x, y); if s < 0: return -1                            # 05b0..05bc  [V]
*kind = site[s].kind (sign-extended byte)                            # 05c8..05d1  [V] written before the next test
if *kind != 1 and explored(x, y): return -1                          # 05d4..05f8  [V]
return s
```

### 3.14 ovl28:0600(s) / 063c(s) temple ordinal and blessing flag [V 0600..065c]

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

### 3.15 ovl28:17db(H) share items among the heroes of one city [V 17db..1a2c]

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
  be 2c04:0ce3 (site 39 +0x19/+0x1a). Since a name byte is 0 or printable (≥ 0x20), it never equals
  1, 2, 5, 6, 7 or 8, so the bug has no effect [I]. A reimplementation simply skips 0xff [I].
* Only the giver's row is cleared; the receiver's row is not extended while both counters move [V].
  This is what ends the B pass: a receiver's counter says it has an item but its row has none to
  give. Examples [I, worked from the code]: B = (1, 0) → the item moves to the second hero and stays
  there (B ends (0, 1)); B = (3, 0, 0) → (1, 1, 1) after three passes; B = (2, 1) with items {a, b} / {c} → hero 0
  gives a, hero 1 gives c back (its row still holds c), hero 0 then gives b: hero 0 ends with {c},
  hero 1 with {a, b} (counters (1, 2)).
* The B pass may move an item to a hero that has fewer battle/command items only (`B[m] < lo`) [V].

### 3.16 ovl28:1a3d(H, cnt, I, type) hand out one item type [V 1a3d..1b33]

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

## 4. State read and written

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

## 5. rnd() calls in order

ovl28 itself draws only in 0efc [V rnd.txt, listing]:

| site | call | when |
|---|---|---|
| 0f0a | rnd(1, 20, 0) | always (quest temple score) |
| 0f31 | rnd(1, 20, 0) | always (site score) |
| 0f85 | rnd(1, 20, 0) | unless the hero's city has AI[+0x182+c] ≤ 4 (city score) |
| 0fb0 | rnd(1, 20, 0) | same condition (item score) |

Order of all draws in the phase [V call order; draws inside callees per their traces]:
```
for each recorded hero (ascending army index):
    ovl24:023f(city, 1) if the hero stands in a city       # its rnd(1,6,-1) is skipped (force) [V ovl24:0565];
                                                          # Hidden Map flyer explorers -> ovl20:0e4b draws (ai.md §6.10)
    if quest hero: 0cf3 -> ovl29:15c5 (AI[+0x20] simulations, unless already ordered to the city)
                   -> 0a8b:0001 move (battles, ovl29:1771 / 0a8b:0254 draws)
    if site order still good: 07ea -> 0a8b:0001 (battles; on arrival ovl22:15c3 -> ovl34 search draws)
    up to 2 rounds:
        1348: ovl29:15c5 for each candidate city surviving the filters, cities count-1..0
        0efc: 2 or 4 x rnd(1,20,0)
        action: 07ea / 0b75 -> 0a8b:0001 (as above); or explore ovl20:0e4b (177f/164e draws)
```

## 6. [U] list and open points

* [U] Whether 2c04:0ce0 (item −1 type = site 39 name byte 18) can ever hold 1, 2, 5..8 — blocker:
  scenario site-name data not checked; treated as inert [I] (§3.15).
* [U] Exact draw counts inside 0a8b:0001 / ovl22:15c3 / ovl20:0e4b / ovl24:023f — outside ovl28,
  see their traces (ovl22_move.md, ai.md §6.9, §6.10).
* [I] (not [U]) Choice 1 of 0efc (quest temple) is a no-op that ends the hero's rounds; the temple
  is only reached through choice 3 (§3.1). Reproduce as coded.
* [I] The kind-2 exclusion in 11f8 never sees a kind-2 order given by ovl28 (07ea uses kind 4); no
  kind-2 writer was looked for outside ovl28.
* [I] 0427 trusts DS:5e5e; it is reached with a non-null DS:5e5e only through the executor and
  ovl24:023f.

Corrections / upgrades for ai.md (for integration):
* §3.1 +0x0c: 0efc does **not** read AI[+0x0c]; the `+0xc` at 0f61 is the hero-table field S+0x0c+2j
  (`les bx,[bp+8]` = S), the only AI access there is AI[+0x182+city] (0f70..0f78) [V]. Drop
  "ovl28:0efc" from the +0x0c readers.
* §3.1 +0x46: [I excluded city] → quest target city of an active type 4/5 quest (Quests on), else −1,
  rewritten each hero phase [V 0031..00ae].
* §3.1 +0x0e: [I hero count] → min(own heroes, 6), recounted each hero phase [V 065d].
* §3.1 +0x4c: [U] → cumulative item hand-over counter (17db / 1a3d), no reader [V].
* §2.2 row ovl28:0427 "not traced" → §3.12 here; §6.2 move Hero → §3.1 here.
* §5.10: 13b2 arguments are `(x, y, out, sub, kind, minallow)` [V ovl29:13b2] (§3.8 here).
