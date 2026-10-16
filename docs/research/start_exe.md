# START.EXE — the intro and credits program (Warlords II, 1993 DOS)

Scope: everything START.EXE does from entry to exit, as needed for M2c (`states/intro.py`)
and for plan rows X04 / X16. Read from a capstone listing made by
`tools/re/start_disasm.py` (`python -I tools/re/start_disasm.py
original/game/Warlrd2/START.EXE out/asm/start`, output git-ignored); the earlier `rea`
snapshots in `out/rea/start_*.json` (PCK decoder / loader) agree with it.

Tags: **[V]** read from the code at the cited address, **[V-abs]** established by the
absence of any code or string that could do it (searched over the whole listing), **[I]**
inferred, **[U]** unverified (with the reason). No game text is quoted: strings are named
by their DGROUP offset; file names are given as file names.

## 0. Address notation and layout

* START.EXE: 76026 bytes, plain MZ, header 0xC00 bytes, 475 relocations, entry 0000:0000,
  no overlay, no packer. Borland C++ 1991 runtime (banner string DS:0004..), large model.
* `SSSS:OOOO` = load-relative segment:offset; **START img = SSSS·16 + OOOO**, file offset =
  img + 0xC00. `graphics.md` writes "START img 0x....": e.g. 048a:0009 = img 0x48A9.
* DGROUP (DS) = segment 0x109E (`mov dx, 0x109e` at 0000:0000), img 0x109E0. BSS from
  DS:0x131A on (not in the file).
* Code segments (= the relocated segment values): 0000 C0 + runtime library; 048a fonts;
  0551 palettes; 0579 **the intro**; 062b `main`; 064a file I/O; 0666 PCK loader; 0682 VGA
  helpers; 06a9 interrupt hooks; 06bd video detection; 06eb INT 33h wrappers; 072b blitters;
  083d bitmaps / video mode; 09e8 text; 0aa3 mouse cursor; 0bc3 masks / start-up; 0bfc BIOS
  mode set; 0c07 sound (DIGPAK + MIDPAK); 0c87 memory manager; 0dc8 PCK decoder et al.

## 1. Control flow, entry to exit

### 1.1 `main` (062b:000f)

| Step | Address | What |
|---|---|---|
| 1 | 062b:0018..0024 | install the memory-error handler 062b:018e (DS:0ba6/0ba8), memory manager init 06bd:0000; failure → message DS:0596, `exit(1)` (062b:003c) **[V]** |
| 2 | 062b:004e..0099 | **command line**: for each argv[i], i ≥ 1: skip leading `-` / `/`, `tolower(c)` (0000:2602, result unused), `exit(1)` (0000:1c30 = `exit`). *Any* argument ends the program with code 1 before video or sound are touched **[V]** |
| 3 | 062b:009b..00ad | DS:1498 = 4; 06bd:008c(4) returns 4 unconditionally (06bd:00bd → 0071) → 083d:0043(4): video mode table entry 4 (DS:0787 + 4·0x1A): 640x480, 4 planes, BIOS mode 0x12 set by 0bfc:000c **[V]** |
| 4 | 062b:00b3 | 0bc3:0005: memory manager / swap file (DS:0a92) 0c87:0008, 0b56:0006, font engine init 09e8:0001, then 06f7:0009 with values from the mode table (purpose not traced) **[V]** calls / **[U]** purposes (no visible effect) |
| 5 | 062b:00b8..00da | 0c07:0004 sound init (§2). Returns 0 → message DS:05be printed, `getch()` (0000:34f5), cleanup(5) → **exit code 5** **[V]** |
| 6 | 062b:00db..00ea | hooks: 06a9:004b INT 9 (on scan 0x2E with Ctrl held it clears the Ctrl bit of 0040:0017, 06a9:0028 — Ctrl-C is defeated), 06a9:0093 INT 23h / 1Bh → `iret` (Ctrl-C / Ctrl-Break ignored), 06a9:00f8 INT 24h → fail (06a9:00f5) **[V]** |
| 7 | 062b:00f5 | 048a:0009 fonts: `Chance36.fnt/.fin` → font 1, `Chance17.fnt/.fin` → font 2, from the **game root** (no directory prefix, DS:0243 = ""); a missing file → message, cleanup(2) via 0579:076f → exit 2 **[V]** |
| 8 | 062b:00fa | **0579:0000, the intro** (§3) |
| 9 | 062b:00ff | palette 2 (black) **[V]** |
| 10 | 062b:0107 | cleanup(0) 062b:0113 → `exit(0)` |

**cleanup(code)** 062b:0113 **[V]**: 0c07:029f (MIDPAK unload 0000:0deb — the music stops
here — and DIGPAK unload 0000:04a5); unhook INT 9 / 23h / 1Bh / 24h (06a9:0070, 00c6, 011e);
mouse shutdown 0aa3:0a2d; memory manager 0bc3:0088; **only if code ≠ 0** set text mode 3
(0bfc:000c(3), 062b:0138..0143); `exit(code)`. So a normal end *and* a key skip leave the
machine in mode 12h with an all-black DAC **[V]**.

**Exit codes** **[V]**: 0 = intro finished or skipped (indistinguishable); 1 = any
command-line argument, or out of memory (06bd:0000; the memory-error handler 062b:018e also
ends with cleanup(1), 062b:01e7); 2 = a font file missing (0579:076f); 5 = sound init failed.

### 1.2 What START.EXE does *not* do

* It starts no other program: no INT 21h AH=4Bh anywhere, no `.EXE`, `.BAT`, `COMSPEC`,
  `WARLORD` string in the file **[V-abs]**. The shipped START.BAT runs WARLORD2.EXE only,
  so in this copy START.EXE is never run at all **[V]** (START.BAT).
* It reads no OPTIONS.SND, no configuration besides `sound.dat` **[V-abs]**: the intro's
  music and DING depend only on SOUND.DAT's drivers, not on the in-game music / effects
  settings.
* It uses no random numbers: no LCG constant, no `rand`/`random`; the only INT 1Ah users
  are `_bios_timeofday` (0000:1b81, the waits) and 06da:001b (no caller) **[V-abs]**. The
  sparkle positions are a fixed table (§3.6). The intro is fully deterministic apart from
  wall-clock timing.
* No mouse: the mouse library (0aa3, INT 33h in 06eb) is never initialised on this path —
  its only outside callers are the shutdown 062b:012e and 0bc3:008e, which has no caller;
  the cursor hide count DS:0888 starts at 1, and the page draw's hide/show pair
  (0579:0916 / 0a44 → 0aa3:07a9 / 075b) moves it 1 → 2 → 1, so no pointer is ever drawn
  and mouse buttons skip nothing **[V]**.

### 1.3 X16: how the intro is launched, and the `n` switch

* WARLORD2.EXE's switch parser 0a4c:005a..0166: after skipping `-` / `/` it lowercases the
  character (0000:288d) and looks it up in the 16-entry table at 0a4c:0275 (`0`-`9`, `h`,
  `m`, `n`, `s`, `v`, `x`), handlers at 0a4c:0295. **`n` → 0a4c:0160 = `inc di`, the loop
  increment: WARLORD2.EXE accepts `n` and does nothing with it** **[V]**. (`s` → 00f8
  DS:26c4 = 1, `m` → 0100 DS:26c6, `v` → 0108 DS:26c8, `x` → 00be, `h` → 00c6, digits →
  00ce lock-down; an unknown letter prints the usage lines and exits 1.)
* START.EXE quits with exit code 1 at its first argument, before it sets a video mode
  (§1.1 step 2) **[V]**.
* README: switches are typed after `WAR2`, and `n` means no startup animation. WAR2 is
  not shipped (no WAR2.BAT / WAR2.EXE in the game directory; START.BAT is the only batch
  file). **[I]** WAR2.BAT ran START.EXE and then WARLORD2.EXE, passing the switches to
  both: with any switch START ends at once (so `n` — and in fact every switch — suppresses
  the intro) and WARLORD2 ignores `n`. **[U]**: the batch file itself is not available; the
  installer (INSTALL.EXE) holds no readable copy of it.
* Our counterpart: `--no-intro` (plan §3.1), boot → menu directly.

## 2. Sound and music set-up (0c07:0004)

* Clears the 10 DIGPAK slots (11 bytes each at DS:1a7a..1ae8) **[V]**.
* Opens `sound.dat` (DS:0ac2) in the current directory; **if it cannot be opened, the init
  fails → exit 5** (0c07:002f..0038) **[V]**. Reads up to 0x50 bytes and `sscanf`s
  `"%s %s %d"` (DS:0acc) into: digital driver name, music driver name, a number → DS:0ab8
  **[V]**.
* Digital name equal to the string DS:0ad5 (`NO_SOUND`) → DS:0ab6 = 0 (digital off) and
  DS:0ab8 = 0; music name equal to DS:0ade (`NO_SOUND`) → DS:0ab7 = 0 (music off). Both
  start as 1 (DS:0ab6/0ab7 in the image) **[V]**. Both off → DS:0aba = 1, success.
* Digital on: name `IBMBAK.COM` (DS:0ae7) → DS:0abf = 1 (PC speaker: no driver is loaded;
  a "play" prints character 7 with `"%c"` DS:0b93, 0c07:0679 — a BEL); any other name is
  loaded as a DIGPAK driver (0000:03f5); failure → exit 5 **[V]**.
* Music on: the ADV file named in SOUND.DAT and `MIDPAK.AD` are read (0000:0660), then
  `MIDPAK.COM` is loaded (0000:0d3b) and initialised (0000:0e15); any failure → message
  (DS:0af2 / 0b15 / 0b38 / 0b53) and exit 5 **[V]**. A 10000-byte buffer (DS:1a66 / 1a62)
  receives the XMI later (0c07:0279).
* **Variant prefix** 0c07:0344..0375: default `s` (DS:0b86); music driver name ==
  `MT32MPU.ADV` (DS:0b6e, flag DS:0ac0 set at 0c07:0239) → `m` (DS:0b88); ==
  `SC32MPU.ADV` (DS:0b7a, DS:0ac1, 0c07:0269) → `r` (DS:0b8a), tested last **[V]**. Same
  rule as WARLORD2.EXE 155e:032f (`sound.md` §2).
* The third SOUND.DAT number DS:0ab8 is written (by `sscanf`, and cleared at 0c07:00a3)
  and never read anywhere in START.EXE **[V-abs]**.
* Shipped SOUND.DAT: SBLASTER.COM, SBFM.ADV, 1 → the `s` files.

## 3. The intro, 0579:0000

### 3.1 Primitives

| Name here | Address | Behaviour |
|---|---|---|
| `key_check()` | 0579:0438 | `kbhit()` (INT 21h AH=0Bh, 0000:36c9); if a key is waiting, `getch()` (INT 21h AH=07h, 0000:34f5) reads **one** byte; if it is 0x20 (Space), 0x1B (Esc) or 0x0D (Return) → palette 2 (black), cleanup(0), **exit 0**. Any other byte is consumed and ignored **[V]** |
| `wait(n)` | 0579:0494 | `t0 = _bios_timeofday()` (INT 1Ah AH=0, 0000:1b81); loop { `key_check()`; read the tick count `now`; return if the midnight flag is set } until `now ≥ t0 + n` (0579:04dc..04f4). Returns at once if 0579:0468 reports 23:59:59 (INT 21h AH=2Ch: hour 23, minute 59, second > 58) **[V]**. Unit: one BIOS tick = 65536 / 1193182 s (X05) |
| `delay(ms)` | 0000:2f22 | Borland `delay`, milliseconds (PIT-calibrated busy loop) **[V]** |
| `vsync()` | 0682:000a | port 3DAh: wait until bit 3 (vertical retrace) is set, then until it clears **[V]** |
| `set_palette(k)` | 0551:0003 | k = 0 `start\logo.pal` (DS:02e4), 1 `start\screen0.pal` (DS:02f3), 2 `black.pal` (DS:02da, game root). Reads the 16 lines with `"%2d %2d %2d"` (DS:0311, 0551:0203) and writes each colour **at once** with INT 10h AX=1010h (0551:01cf), converted `trunc((v + 0.5) · 0.64)` (`graphics.md` §1); register = colour for 0-5 and 7, 0x14 for 6, 0x38 + (c - 8) for 8-15 (the default EGA attribute mapping of mode 12h) **[V]**. **There are no palette fades anywhere in START.EXE**: every palette change is a single switch |
| `load(bm, name)` | 0666:0001 | PCK into a bitmap (`graphics.md` §2): `strcpy(dir) + strcat(name)`, here dir = "" and name `start\...` **[V]** |
| `mask(bm, m, key)` | 0bc3:00d0 | builds the 1-bit mask `m` of the pixels of `bm` equal to `key` (the key colour is transparent in the masked blit) **[V]** call / **[I]** polarity (consistent with STEXT / SPARKLE backgrounds of colour 13 and with the identical WARLORD2 code, `graphics.md` §2) |
| `blit(src, sx, sy, w, h, dst, dx, dy)` | `[DS:15f6]` = 072b:03a1 (set at 083d:011c) | opaque copy (argument order from the cdecl pushes; 072b:03a7 reads `src` at [bp+6]) **[V]** |
| `mblit(src, sx, sy, w, h, dst, dx, dy, mask, mx, my)` | `[DS:15ea]` = 072b:0c4d (083d:0128) | masked copy **[V]** |
| `wipe(bm)` | 0579:04f8 | see §3.3 |

Bitmaps (DGROUP records, 0x3B bytes): DS:074c the screen; DS:0394 the current picture;
DS:03cf its mask; DS:031e the saved background (480x240); DS:0359 the work buffer
(480x210); DS:145d SPARKLE.PCK; DS:1422 its mask **[V]**.

### 3.2 The sequence

Times are BIOS ticks unless marked; "fast machine" = blits and loads take no time.

| # | Address | Action | Duration |
|---|---|---|---|
| 1 | 0579:000b | load `start\ding0.snd` into a DIGPAK slot (0c07:04e8), handle → `di` **[V]** | load |
| 2 | 0579:0019 | load the music: `"%s%s%s"` (DS:0b8c) = `start\` + prefix + `anim.xmi` → e.g. `START\SANIM.XMI`, at most 10000 bytes (9999 if longer, 0c07:03cb..03d7) (0c07:032e) **[V]** | load |
| 3 | 0579:0029 | **music starts**: 0c07:0411(seq 0, flags 0) — `RegisterXmidi` (0000:0c6f) then `PlaySequence(0)` (0000:0c4e); flags 0 = no repeat; the repeat poller 0c07:02aa has no caller in START.EXE, so ANIM plays **once**, until it ends or the program exits **[V]** | — |
| 4 | 0579:0035 | `key_check()` | — |
| 5 | 0579:003a | palette 2 (black) | — |
| 6 | 0579:0042..006e | load `start\ssg.pck`; **palette 0 (LOGO.PAL)**; `wipe(ssg)`; free | 60 |
| 7 | 0579:0076 | `wait(10)` | 10 |
| 8 | 0579:007e..00a7 | load `start\black.pck` (640x480, all colour 0); `wipe(black)` under LOGO.PAL (colour 0 of LOGO.PAL is 0,0,0); free | 60 |
| 9 | 0579:00aa..00b4 | palette 2 (black); `key_check()` | — |
| 10 | 0579:00b7..00e8 | load `start\start.pck`; **palette 1 (SCREEN0.PAL)**; `wipe(start)` (over the colour-0 screen); free | 60 |
| 11 | 0579:00eb | `wait(20)` | 20 |
| 12 | 0579:00f3..01b7 | `key_check()`; allocate DS:031e 480x240; `blit(screen, 80, 0, 480, 240 → 031e, 0, 0)` (save the painting under the lettering's path); (re)allocate DS:0359 480x210 | — |
| 13 | 0579:01ba..01e7 | `key_check()`; load `start\stext.pck` (480x210) into DS:0394; `mask(0394, 03cf, 13)` | — |
| 14 | 0579:01ea..0269 | **lettering, phase 1**: for s = 6, 12, …, 210 (35 steps): `key_check()`; `blit(031e, 0, 0, 480, s → 0359, 0, 0)`; `mblit(0394, 0, 210 - s, 480, s → 0359, 0, 0, mask 03cf, 0, 210 - s)`; `vsync()`; `blit(0359, 0, 0, 480, s → screen, 80, 0)`; `delay(20)` — the bottom s rows of the lettering appear at the top edge, 6 px more per step **[V]** | 35 steps |
| 15 | 0579:026b..030c | **lettering, phase 2**: for s = 6, 12, …, 30 (5 steps): `key_check()`; `blit(031e, 0, s, 480, 210 → 0359, 0, 0)`; `mblit(0394, 0, 0, 480, 210 → 0359, 0, 0, 03cf, 0, 0)`; `vsync()`; `blit(031e, 0, s - 6, 480, 6 → screen, 80, s - 6)` (restore the strip above); `blit(0359, 0, 0, 480, 210 → screen, 80, s)`; `delay(20)` — the whole lettering moves down to rest at **(80, 30)** **[V]** | 5 steps |
| 16 | 0579:030f..0324 | free STEXT and its mask | — |
| 17 | 0579:0328 → 05b5 | load `start\sparkle.pck` (DS:145d), `mask(145d, 1422, 13)`; `blit(screen, 80, 30, 480, 210 → 031e, 0, 0)` (save painting + lettering) **[V]** | load |
| 18 | 0579:032c | **DING**: 0c07:065d(di, 0) — DIGPAK play (0000:02ce) at **11000 Hz** (0c07:06a8 stores 0x2AF8 into the request DS:1a6e..1a79; also 0c07:05cf), flags 0 (no repeat) **[V]** | (1.37 s of sound, plays on) |
| 19 | 0579:0335..036c | **sparkles**: for i = 0 … 30 (DS:0486 = 31): `key_check()`; `spawn(table[i])`; `draw_sparkles()`; `wait(1)` (§3.6) **[V]** | 31 |
| 20 | 0579:036f → 0608 | clean frame: `blit(031e → 0359)`, `blit(0359 → screen, 80, 30)`; free SPARKLE and its mask | — |
| 21 | 0579:0373 | `wait(20)` | 20 |
| 22 | 0579:037b | `blit(screen, 80, 260, 480, 210 → 0359, 0, 0)` (save the painting under the credits area) **[V]** | — |
| 23 | 0579:0399..03ea | **credits**, 0579:0571 per page, in this order: `start\design.gfx`, `art.gfx`, `devel.gfx`, `music.gfx`, `assist.gfx`, `testing.gfx`, `testing2.gfx` (§4) | 7 × 65 |
| 24 | 0579:03ed | free the DING slot (0c07:061d) | — |
| 25 | 0579:03f4..0424 | load `start\black.pck`; `wipe(black)` under SCREEN0.PAL; free; free DS:031e | 60 |
| 26 | 0579:042c | palette 2 (black); return to `main` (which sets palette 2 again and exits 0, §1.1) | — |

Total on a fast machine: 776 ticks (42.62 s) + 40 lettering steps. With the lettering at
two 59.94 Hz refreshes per step (§3.4) that is 1.33 s, **≈ 43.96 s** from step 3 to exit.
ANIM is 48.95 s long (`formats.xmi.sequence_ticks`: 5874 ticks at 120 Hz, S file), so the
music is cut about 5 s before its end by MIDPAK's unload in cleanup **[V]** (the cut) /
**[I]** (the amount: on 1993 machines the PCK loads and the software planar blits took
extra time, so the real cut came later or not at all).

### 3.3 The wipe, 0579:04f8

    count = 0; top = 0; bottom = 479
    while top < 480 and bottom > 0:
        key_check()
        blit(pic, 0, top, 640, 1 → screen, 0, top)
        blit(pic, 0, bottom, 640, 1 → screen, 0, bottom)
        if count % 4 == 0: wait(1)
        top += 2; bottom -= 2; count += 1

**[V]** 0579:0503..056b. Even rows are copied top-down and odd rows bottom-up at the same
time, one row of each per iteration: 240 iterations (top 0..478, bottom 479..1), each row of
the screen written exactly once. `wait(1)` follows iterations 0, 4, 8, …, 236: 60 waits.
Drawn per tick: iteration 0 alone, then four iterations (8 rows) per tick, the last three
iterations (237-239) after the 60th wait with no wait after them. Mid-wipe the screen shows
the new picture on the rows done and the old screen on the others (interlaced from both
ends, meeting in the middle). Wipes 1 and 3 (SSG, START) reveal over a colour-0 screen; wipes
2 and 4 (BLACK.PCK) cover the picture with colour 0.

### 3.4 Timing of the lettering steps

Each step is `vsync()` → screen blit → `delay(20 ms)` → (next step's compose) → `vsync()`.
On a machine whose compose takes less than ~13 ms, `delay(20)` ends inside the second
refresh, so the screen is updated on every **second** vertical retrace: 2 × 16.68 ms at
mode 12h's 59.94 Hz **[I]** from the code; the real period depends on the CPU (the planar
masked blit of 480x210 is software) **[U]**: no timing capture of the original exists.

### 3.5 Palette use

| Phase | DAC |
|---|---|
| program start to step 5 | the BIOS default palette after mode 12h (screen all colour 0) |
| 5 | black |
| 6-8 | LOGO.PAL (SSG wipe in, wait 10, BLACK wipe) |
| 9 | black |
| 10-25 | SCREEN0.PAL (title, lettering, sparkles, credits, final BLACK wipe) |
| 26 and after | black, also after a key skip (0579:0457) |

### 3.6 Sparkles (0579:05b5, 065b, 06b7, 0608)

* State: 20 slots — active DS:13fa[i] (word), position DS:13aa[i] (x, y words), frame
  counter DS:1382[i] **[V]**.
* `spawn(x, y)` 0579:065b: if x < 0 or y < 0 nothing; else the **lowest-numbered free slot**
  becomes active at (x − 80, y − 30) in work-buffer coordinates (= screen (x, y)), frame 0;
  no free slot → nothing **[V]**.
* `draw_sparkles()` 0579:06b7: `blit(031e, 0, 0, 480, 210 → 0359, 0, 0)`; for slot 0..19 in
  order, if active: `mblit(145d, sx, 0, 32, 41 → 0359, x, y, mask 1422, sx, 0)` with
  sx = DS:0488[frame]; frame += 1; frame ≥ 7 → slot free; then `blit(0359, 0, 0, 480, 210 →
  screen, 80, 30)`. No `vsync()` here **[V]**.
* Frame table DS:0488 (7 words): 96, 64, 32, 0, 32, 64, 96 → SPARKLE.PCK cells 3, 2, 1, 0,
  1, 2, 3 (32x41 each) **[V]**. Each sparkle is shown for 7 ticks; higher slots are drawn
  over lower ones.
* Position table DS:040a, 31 (x, y) pairs (DS:0486 = 31): 24 real positions, then 7 × (−1,
  −1), which spawn nothing and let the last sparkles finish **[V]**:

  (88,59) (104,105) (136,58) (144,106) (168,151) (192,81) (224,93) (232,132) (256,143)
  (256,108) (288,98) (312,60) (328,139) (336,109) (368,142) (352,93) (384,112) (392,99)
  (424,112) (448,96) (464,130) (472,56) (496,100) (512,149)

* So in iteration i (0..30) the entries k = max(0, i−6) .. min(i, 23) are drawn, entry k
  with sx = DS:0488[i − k]. At most 7 are active, and entry k always gets slot k mod 7, so
  overlaps are painted in slot order (not by age). Iteration 30 draws no sparkle; step 20
  redraws the same clean frame.

## 4. Credits pages

* Page drawer 0579:0571(name): `draw_gfx(name, origin (80, 260))` (0579:08b8); `wait(60)`;
  `blit(0359, 0, 0, 480, 210 → screen, 80, 260)` (erase); `wait(5)` **[V]**. Pages
  replace each other in the 480x210 area (80, 260)-(559, 469); nothing else changes.
* Interpreter 0579:08b8 **[V]** — the same language as WARLORD2's (`graphics.md` §5): read
  the whole file (064a:000e / 00b1 / 0075), origin into DS:1380 / DS:137e, hide the mouse
  (0aa3:07a9, a no-op here), then repeatedly skip to the next `#`, take the letter, switch
  on letter − 'C' (table 0579:0a4d, 18 entries):

  | letter | target | action |
  |---|---|---|
  | `C` | 0983 | parse `(xxx,yyy)` (0aac: 3 digits each, origin added), the text between the next two `\|` (0af9, into an 80-byte stack buffer, no bound check), draw at x − w/2 (07a3: width 09e8:0a88, halved toward zero) |
  | `L` | 09b8 | the same, drawn at x (078a) |
  | `R` | 09ed | the same, drawn at x − w (07d4) |
  | `H` | 0971 | `set_font(1, 15, 0, 3)` (048a:06d8) — Chance36 |
  | `T` | 097b | `set_font(2, 15, 0, 3)` — Chance17 |
  | `F` | 094e | three digits n, `set_font(2, n, 0, 3)` |
  | `E` | 0a25 | end |
  | anything else (`D`, `G`, …) | 0a28 | ignored, scanning goes on after the letter |

* Text: 09e8:04a4 draws each character with 09e8:01f1(x, y, ch, 1) → 054d: the glyph
  rectangle (bitmap width table, font +0x14; height = line, font +0x24) is blitted at
  (x, y) **masked** (flag 1) — y is the top of the text — and the pen advances by the
  second FIN width (font +0x18, 09e8:07c6) **[V]**. The mask is built from the variant's
  background colour (048a:02a5 → 0bc3:00d0 with the key from the font record), so the
  colour-3 background is transparent over the painting **[V]**. The width (09e8:0a88) is
  the sum of the per-character advances **[V]**. This closes for START the G3 question
  "second width = advance": it is the pen advance.
* The fonts keep their selection between pages (global state); every shipped page begins
  with `#H` **[data]**.
* Shipped pages **[data]** (commands only): all text is `#C` at x = 240 (screen x 320).
  DESIGN, DEVEL: `#H` y 2, `#T` y 52/72/92/112, `#H` y 142, `#T` y 192. ART, MUSIC: `#H`
  2, `#T` 42, `#H` 72, `#T` 112, `#H` 142, `#T` 182. ASSIST: `#H` 2, `#T` 52, 72, 92, 122,
  142, 172, 192. TESTING: `#H` 2, `#T` 52 … 192 every 20. TESTING2: `#H` 2, `#T` 52 … 152
  every 20. No `#F`, `#L`, `#R`, `#G`, `#D`.
* Each page is on screen for 60 ticks (3.30 s), then the empty area for 5 ticks.

## 5. Input

* Only the keyboard, through DOS `kbhit`/`getch` (§3.1). The checks are: before each phase
  (0579:0035, 00b4, 00f5, 01bc), every wipe iteration (050b), every lettering step (01f1,
  0273), every sparkle step (033d) and every poll inside `wait()` (04be), so a key is acted
  on within one iteration **[V]**. During the PCK / GFX loads and inside `delay(20)` keys
  are buffered by the BIOS and seen at the next check.
* **Space, Esc, Return end the whole program** (palette black, exit 0 → WARLORD2 next);
  there is no "next page" key. Any other key is read and discarded **[V]**. A key typed
  before START.EXE runs (BIOS type-ahead) is read at the first check and skips at once.
  Extended keys arrive as 0 then the scan code, and the second `getch` sees the scan code:
  Alt+] (scan 0x1B) and Alt+D (scan 0x20) therefore skip too; no scan code is 0x0D **[I]**.
  Keypad Enter and Ctrl+M give 0x0D, Ctrl+[ gives 0x1B (BIOS) **[I]**.
* Ctrl-C / Ctrl-Break cannot stop it (§1.1 step 6). Mouse: none (§1.2).

## 6. Formats used (all already described)

* PCK: `graphics.md` §2 (decoder 0dc8 / START img 0x65E1 per `graphics.md`; loader 0666:0001).
* PAL: `graphics.md` §1 (0551:0203, 0551:0064..01ce).
* GFX: `graphics.md` §5 and §4 above.
* FNT/FIN: `graphics.md` §4 (048a:0042 loads, 048a:06d8 selects / recolours).
* XMI: `music.md`; START\MANIM.XMI and SANIM.XMI are byte-identical **[data]**, so the `m`
  and `s` variants of the intro tune differ only in the driver.
* DING0.SND: headerless unsigned 8-bit (`sound.md` §1), **11000 Hz [V]** (0c07:06a8),
  15105 bytes = 1.373 s.

## 7. Open points

* Real wall-clock pacing on period hardware (load times, blit speed, the lettering period)
  **[U]**: no capture of the original intro exists.
* WAR2.BAT and therefore who ran START.EXE **[U]** (§1.3).
* The polarity of the mask built by 0bc3:00d0 is taken from the identical WARLORD2 code and
  the pictures **[I]**, not re-read bit by bit.
