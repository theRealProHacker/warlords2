# Warlords II (1993, DOS) graphics and font formats

Scope: `*.PAL`, `*.PCK`, `*.FNT` + `*.FIN`, `*.GFX` of the original (non-Deluxe) game.
Reference implementation: `tools/dump_gfx.py` (decoders are importable). Checked by
`tests/test_formats_gfx.py`. All multi-byte integers are little-endian unless marked BE.

Confidence tags: **[code]** read from disassembly, **[data]** holds for every file in the
game (asserted by the tests), **[shot]** pixel-compared with a reference screenshot,
**[seen]** judged from the rendered PNG only, **[guess]** inference.

Addresses: "START img" / "WL2 img" are offsets into the MZ load image (file offset minus
header: 0xC00 for START.EXE, 0x2000 for WARLORD2.EXE). Ghidra/`rea` linear address =
img + 0x10000. START.EXE has no overlay; WARLORD2.EXE has a Borland VROOMM overlay after
file offset 238800, overlay addresses below refer to `out/rea/WARLORD2_flat.exe`.

## 1. PAL — palette (160 bytes)

16 text lines, each exactly 10 bytes: `RR GG BB\r\n`, two decimal digits per channel,
range 00–99. Line n is colour index n. **[code]** START img 0x5713 reads 10 bytes per line
and `sscanf("%2d %2d %2d")`s them into three int[16] arrays (R, G, B).

Scale: **[code]** START img 0x5574–0x56DE converts each value with the FPU emulator as
`fild v; fadd 0.5f; fmul 0.64; ftol` (constants at DS:0x305 and DS:0x309), i.e.

    dac6 = trunc((v + 0.5) * 0.64)        # 0..99 -> 0..63, 99 -> 63

and sets DAC register n via INT 10h AX=1010h (START img 0x56DF). For 8-bit RGB use
`(dac6 << 2) | (dac6 >> 4)`. **[shot]** With this, flat-colour areas of decoded pictures
differ from the reference screenshots by a mean of 0.15/255 (JPEG noise), e.g. PAL 44 ->
113, 56 -> 146, 73 -> 190, 77 -> 199.

| File | Used for |
|---|---|
| `STANDARD.PAL` | everything in WARLORD2.EXE **[code]** (strings `standard.pal`, `terrain%d\war2.pal`) |
| `TERRAIN0/WAR2.PAL` | terrain set 0; byte-identical to STANDARD.PAL **[data]** |
| `BLACK.PAL` | all zero; fade target |
| `START/LOGO.PAL` | intro, `START/SSG.PCK` **[code]** (START img 0x57E6: palette 0 after ssg.pck) |
| `START/SCREEN0.PAL` | intro, `START/START.PCK` and the STEXT/SPARKLE overlays **[code]** (0x585B: palette 1) |

## 2. PCK — packed 16-colour bitmap

One file = one bitmap. There is no frame directory; sheets are cut up by the caller (§3).

    0  u16  always 1                          [data]
    2  u16  width in pixels                   multiple of 16 in every file [data]
    4  u16  height in pixels
    6  ...  token stream, to end of file

Pixel data is **planar, 4 planes**, plane p = bit p of the colour index (plane 0 first).
Each plane is `(width/8) * height` bytes, rows top to bottom, bit 7 = leftmost pixel.
The planes are packed as one continuous stream of tokens:

| First byte b | Meaning |
|---|---|
| `b < 0x80` | literal: copy the next `b + 1` bytes |
| `b >= 0x80` | back-reference, 3 bytes `b, b2, n`: copy `n + 1` bytes from `dst + int16((b<<8)\|b2)` (BE, negative), byte by byte, so overlapping copies repeat (`FF FF n` = run of the previous byte) |

A plane ends when exactly `(width/8)*height` bytes have been produced; the next token
begins the next plane. No token straddles a plane boundary and no reference reaches
before the start of its plane **[data]**; after the fourth plane the file ends exactly
**[data]** (all 95 PCK/FNT files).

**[code]** Decoder: START img 0x65E1 (Ghidra `FUN_1659_0051`, decompiled with `rea`,
output in `out/rea/start_pck_decode.json`); it reads the file through a 1 KiB buffer.
Loader: START img 0x6661 reads the 6-byte header, allocates a `width x height` bitmap and
calls the decoder with plane size `width/8*height` and plane count 4. WARLORD2.EXE contains
the byte-identical decoder at file offset 0x9236 (resident part).
**[shot]** Plane order/bit order: decoded pictures match the screenshots (§5).

Widths are padded to 16 pixels; the padding columns hold filler (e.g. `SCENARIO.PCK` is
272 wide, the picture occupies the left 264 columns **[shot]**).

### Transparency

PCK files carry no mask. WARLORD2.EXE has a static table of 79 pictures, 12 bytes each,
at DS:0x1F56 (WL2 img 0x331A6; count at DS:0x230A) **[code]**, indexed like the 79 names of
group 3 in `DATA/FILE.DAT`:

    +0  u8   flags: bits 0-1 directory (0 = PICS\, 1 = <scenario>\PICS\, 2 = TERRAIN<n>\),
             bit 2 loaded, bit 5 build a mask
    +1  far* bitmap          +5 u8 cache group (loading evicts the loaded picture of the same group)
    +6  far* mask bitmap     +10 u16 key colour

When bit 5 is set the loader (WL2 img 0x9D19) builds a 1-bit mask from the pixels equal
to the key colour and blits with `dst = (dst AND mask) OR (src AND NOT mask)` (blit: START
img 0x68E2). Pictures without bit 5 are drawn opaque. Key colours **[code]**:

| Key | Pictures |
|---|---|
| 10 | a0–a3, a5–a8, popup3, scroll, bscroll, voice, rmapbar, helpgfx, movebar0–3, movebar5–7 |
| 11 | a4 (the green player's sprites use colour 10) |

**[code]** In WARLORD2 all nine army sheets are drawn through one mask: DS:4ee5 is rebuilt by
every a*.pck load (0997:03a9 -> 151d:00cf) and ovl64:1a79 loads a0..a8 in that order, so the
shape of every army sheet (a4 included) is a8's key-10 mask.
| 1 | atrans2, war, hidden, popup, popup2, road, movebar4 |
| 15 | ashadow, bigarmy |
| 12 | bshield |
| 5 | stack |
| 0 | curs |
| none | all others (shields, scenery0/1, cityback, button sheets, full pictures) |

**[data]** The key equals the top-left pixel and the most frequent colour of every A*.PCK.
Not in the table: `STAND.PCK` (background colour 10 **[seen]**) and the intro files
(`STEXT.PCK`/`SPARKLE.PCK` background colour 13 **[seen]**; START.EXE draws them with key 13, below).
`tower.pck`, `vpopup.pck`, `scroll2.pck`, `screen.pck`, `startup.pck` are named in
FILE.DAT but not shipped.

START.EXE's masks for STEXT / SPARKLE are a colour key 13 **[code]**: 0bc3:00d0 (key 13)
builds one mask plane whose bit is set where the pixel equals the key (0bc3:023a..02e0: the
inverted OR of the planes where the key bit is 0, ANDed with the planes where it is 1). The
masked blit 072b:0c4d hands each plane, with mask plane 0, to seg 0682: 0682:0059 when the
destination is the screen (DS:074c, 072b:0d27..0d38, 0e4f), 0682:00f3 for a memory bitmap
(072b:0ee6, 104b). Both compute `dst = (dst & mask) | (src & ~mask)` per word (0682:00c2..00cd,
0140..014b), so pixels of the key colour leave the destination unchanged.

## 3. Sheet layout and contents

Frame numbers are those of `out/gfx/<file>/frames/NNN.png` (row-major). "single" = the
file is used as one picture or cut by rectangles stored in the executable / `DATA/*.DAT`
(not decoded here). Palette is STANDARD.PAL (= WAR2.PAL) unless noted.

### TERRAIN0 (map graphics)

| File | Size | Frames | Contents |
|---|---|---|---|
| `A0`–`A8.PCK` | 512x64 | 32 of 32x29, row pitch 30 | Army set in player n's colours (A8 = neutral grey). 16 columns, rows at y=0 and y=30, each cell 29 px high **[code]** (ovl64:0335: `(t%16*32, t/16*30, 32, 29)`); y 60–63 unused. Cells 0–28 are army types (type t -> cell t **[code]**), the standard at (416, 29, 32, 29) (ovl64:213c), pennants at x = 464 (DS:2d4e rows) **[code]**. The tutorial scripts cut `(x,y,32,30)` from picture 16 at x=0,32,64,96,384 and y=0,30 **[data]** |
| `ASHADOW.PCK` | 512x64 | 32 of 32x29, row pitch 29 | Same shapes: black outline with a colour-1 checkerboard fill; two ring marks in cell 31 **[seen]**. Use **[code]**: the path ghost of the moving army `(t%16*32, t/16*29, 32, 29)` at square + (8, 5) (ovl64:238e) and the path marks (0x1f0, 0x1f / 0x30, 16, 14) at + (16, 13) (ovl64:22bf) |
| `SCENERY0.PCK` | 640x240 | 96 of 40x40 | Terrain tiles, 16x6: row 0 grass/special (cells 2–8 black), rows 1–2 coast and water, row 3 forest, row 4 hills, row 5 mountains **[seen]**. Tile size **[data]**: script cuts `(360,0,40,40)` from picture 26 |
| `SCENERY1.PCK` | 640x240 | 96 of 40x40 | Objects spanning 2x2 tiles (80x80): rows 0–1 eight city/site types, rows 2–3 two more castles, bridges, forest; rows 4–5 the burning/razed versions **[seen]** |
| `ROAD.PCK` | 640x80 | 13 per row of 48x40 | Road piece r at `((r-1)%13*48, (r-1)/13*40)` (ovl64:1eb4..1f02) **[code]**; the towers of owners 0–8 at (0xc0 + 48·owner, 40, 48, 40) (ovl64:2008) **[code]**. Row 0: road pieces by connection; row 1: bridge roads, standing stones and small site markers with flags **[seen]** |
| `SHIELDS.PCK` | 368x64 | 34 rects | 0–8 framed shields 40x40 at x=40i (8 players + neutral "?"); 9–16 swords 24x24 at (40i,40); 17–24 small shields 16x24 at (40i+24,40); 25–32 tiny 8x8 shields at (320..351,40..55); 33 shield outline. Rects **[seen]** |
| `BSHIELD.PCK` | 288x59 | 9 of 32x59 | Per player: large shield, "CAPITAL" label, small shield **[seen]** |
| `ATRANS2.PCK` | 144x246 | single | Anchor, explosion, cauldron etc. (top): port (0, 0, 32, 29), item bag (64, 0, 32, 29) **[code]**; then 16-px columns of the overview city markers: per owner (DS:2c2e, 9 x (sx, sy, w, h), owner 0x0f -> 8) eight copies pre-shifted by 0..7 px, one below the other at sy + shift·h (ovl63:0ed7) **[code]** |
| `MOVEBAR0`–`7.PCK` | 320x18 | single | Computer-turn progress bar per player: picture 0x47 + SCN 0x110 (71..78); ovl61:131b(n) copies (0, 0, (n / 5) * 16, 18) to (32, 444) through 0997:027e; callers ovl68:0000 (n = 5, 25, 50, 75, 100) and ovl25 (18 calls) — the computer phase (M8b), not the stack palette |
| `CITYBACK.PCK` | 240x86 | single | City view background strip |

### Root and PICS

| File | Size | Contents |
|---|---|---|
| `STAND.PCK` | 192x20 | 12 mouse cursors, cells of 16x16 at (16n, 0); rows 16–19 unused; key colour 10; hotspot (h, h) with h from the table DS:045c **[code]** (12bf:036f, 0709:0000 → 12bf:000a) |
| `PICS/CURS.PCK` | 240x80 | 4 animation frames at x=0,64,128,192: dashed selection boxes (about 30x30 and 40x40) **[seen]** |
| `<scenario>/PICS/SCENARIO.PCK` | 272x230 | Scenario picture; drawn at screen (328,200) in the main menu **[shot]** |
| `PICS/SCREEN0`–`3.PCK` | 320x240 | Main game screen backdrop as four quadrants: 0 TL, 1 TR, 2 BL, 3 BR **[shot]** |
| `PICS/STARTUP0`–`3.PCK` | 320x240 | Main menu backdrop, same quadrant order **[shot]** (0 and 2) |
| `PICS/STARTBU.PCK` | 640x265 | Main menu buttons (normal/pressed/disabled), terrain-set icons, sliders |
| `PICS/MARBLE.PCK` | 480x360 | Marble texture |
| `PICS/SCROLL.PCK`, `BSCROLL.PCK` | 256x252, 336x347 | Parchment scroll; big scroll with logo (map generation) |
| `PICS/SSG.PCK` | 144x64 | SSG logo |
| `PICS/RMAPBAR.PCK` | 192x21 | Random-map progress ornament |
| `PICS/BUTTON.PCK` | 544x197 | In-game buttons and icons |
| `PICS/MENUBUTT.PCK`, `CITYBU`, `DBUTTON`, `DIPLOM`, `FORDER`, `NEWSCNBU`, `RESIGNBU`, `SETUPBU`, `STACK` | various | Button sheets (states stacked vertically) |
| `PICS/ABITS.PCK` | 480x40 | Selection rings 32x30 per player, group/move labels, digits, icons |
| `PICS/SPECBITS.PCK` | 320x126 | City skyline strips |
| `PICS/HELPGFX.PCK` | 512x110 | Key caps (48x19) and icons (16x16) for the help pages |
| `PICS/HIDDEN.PCK` | 336x82 | Dither patterns (hidden map) |
| `PICS/POPUP`, `POPUP2`, `POPUP3.PCK` | 256x75/75/128 | Popup panels (marble, wooden sign, marble oval) |
| `PICS/WAR.PCK` | 240x180 | Battle explosion, result icons |
| `PICS/VOICE.PCK`, `VOICEBIT.PCK` | 352x442, 160x141 | Horned helmet and its three eye frames |
| `PICS/STRAT.PCK` | 224x312 | All colour 0; canvas for the strategic map |
| `PICS/CITY`, `TEMPLE`, `SEARCH`, `VICTORY`, `MHERO`, `FHERO`, `ADVISOR`, `BIGARMY`, `RESIGN`, `RESIGNYE`, `RESIGNNO`, `NEWSCEN`, `LEVEL2`–`4`, `MEDAL0`–`3` | various | Full illustrations |

### START (intro, START.EXE)

| File | Size | Palette | Contents |
|---|---|---|---|
| `SSG.PCK` | 640x480 | LOGO.PAL | SSG presents |
| `START.PCK` | 640x480 | SCREEN0.PAL | Title painting |
| `STEXT.PCK` | 480x210 | SCREEN0.PAL | "Warlords II" lettering on colour 13 |
| `SPARKLE.PCK` | 128x41 | SCREEN0.PAL | 4 sparkle frames of 32x41 **[seen]** |
| `BLACK.PCK` | 640x480 | — | All colour 0 |

Exact sizes and frame counts of all 95 files are the `EXPECTED` table in the test.

## 4. FNT + FIN — bitmap fonts

`NAME.FNT` is a PCK bitmap (§2). `NAME.FIN` describes it **[code]** (loader START img
0x4CAC; words are big-endian, read by 0x5490):

    0   u8      n        number of glyphs (96)
    1   u8      first    first character code (32)
    2   u16 BE  width    sheet width (= FNT width)
    4   u8      line     height of one glyph row
    5   u8      ?        12 / 12 / 25 (baseline? not traced)
    6   u8      ?        0 / 1 / 2 (not traced)
    7   u16 BE  rows     glyph rows per colour block
    9   u16 BE  nvar     number of colour variants
    11  u8[n]   bitmap width of each glyph
    11+n u8[n]  second per-glyph width: equal to the first except space and some
                swash capitals, where it is smaller -> the pen advance [code]: START.EXE's
                character loop 09e8:04a4 advances by it (font +0x18, 09e8:07c6) and the
                text width 09e8:0a88 sums it (docs/research/start_exe.md §4)
    11+2n  nvar x 3 u16 BE: (ink colour, shadow colour, background colour)

File size is `11 + 2n + 6*nvar` **[data]**. Characters are ASCII 32–127; code 127 is a
solid box, `&` in TEXT is drawn as a tick **[seen]**.

Glyph placement **[data]**: glyphs are stored in code order, left to right, each in a
cell `ceil(width/8)*8` pixels wide starting on a byte boundary; a glyph whose cell would
pass the sheet's right edge starts a new row `line` pixels lower. Space has width 0 and
no cell. This rule reproduces `rows` for all three fonts and covers all ink (CHANCE17: 6
stray pixels).

The sheet is `line*rows` high per colour block; blocks are stacked vertically and block
i is drawn in variant i's colours on the background colour. Glyphs carry a 1-pixel
shadow on their left in the shadow colour **[data]**.

| Font | Sheet | line | rows | Blocks on disk | Variants |
|---|---|---|---|---|---|
| TEXT | 320x135 | 15 | 3 | 3 | (15,0,3) (0,3,3) (4,3,3) |
| CHANCE17 | 416x102 | 17 | 3 | 2 | (15,0,3) (0,3,3) |
| CHANCE36 | 560x148 | 37 | 4 | 1 | (15,0,3) (0,3,3) |

**[code]** `SetFont(font, ink, shadow, bg)` (START img 0x4F78) looks for a variant with
these three colours; if none exists it recolours the last block from block 0 (0x511F)
and overwrites that variant. A reimplementation only needs block 0: treat background as
transparent and map ink and shadow to the requested colours.

Font slots: START.EXE loads Chance36 as font 1 and Chance17 as font 2 **[code]**
(0x48A9). WARLORD2.EXE uses slot 0 TEXT, 1 CHANCE36, 2 CHANCE17 **[code]**: ovl50:0000
loads the three fonts into the records that `SetFont` ovl50:06ae selects as these slots.

## 5. GFX — text page scripts

Plain text (CR LF), not pixels: credits pages (START), help pages (HELP), tutorial pages
(TUTORIA). **[code]** Interpreter: START img 0x6048; WARLORD2 overlay, flat img 0x6F035
(jump table at 0x6F1B5). It scans for `#`, reads one command letter, and ignores
everything else. Numbers are exactly three decimal digits. Coordinates are relative to
an origin passed by the caller.

| Command | Action |
|---|---|
| `#H` | font 1, ink 15, shadow 0, background 3 |
| `#T` | font 2, same colours |
| `#Fnnn` | font 2, ink nnn |
| `#C(xxx,yyy)\|text\|` | text centred on x |
| `#L(xxx,yyy)\|text\|` | text starting at x |
| `#R(xxx,yyy)\|text\|` | text ending at x (not used by any shipped file) |
| `#G(sx,sy,w,h)ppp(dx,dy)` | blit rectangle of picture ppp (index into FILE.DAT group 3, §2) to (dx,dy); WARLORD2 only, uses the picture's mask if it has one |
| `#Dnnn` | ignored by both interpreters; WARLORD2's pre-scan ovl59:062a returns the nnn of the first `#D` (0 if `#E` comes first), and the tutorial caller ovl61:168d opens popup type 0x0e + nnn **[code]** |
| `#E` | end |

Picture ids used: 4 button, 8 abits, 16 a0, 26 scenery0, 62 helpgfx **[data]**.

## 6. Verification against reference screenshots

Decoded sheets were template-matched (OpenCV) against `original/ref`; mean absolute
error per channel, 0–255:

| Screenshot | Sheet | Found at | Error |
|---|---|---|---|
| screenshot_00 (main menu) | STARTBU "New Scenario" | (32,162) | 0.22 |
| screenshot_00 | STARTUP0 logo area | (0,0) quadrant | 0.29 |
| screenshot_00 | STARTUP2 | (0,240) | 0.14 |
| screenshot_00 | ERYTHEA SCENARIO | (328,200) | 1.64 |
| screenshot_03 (map generation) | MARBLE | — | 0.17 |
| screenshot_03 | BSCROLL (incl. keyed border) | (160,55) | 4.74 |
| screenshot_08 (empty game screen) | SCREEN0–3 | four quadrants | 0.15 |
| screenshot_01 / gif | VOICE helmet (incl. keyed border) | (152,15) | 6.0 |

Also viewed as PNG: all 95 sheets, the START files in their intro palettes, army frames
with key 10/11, all three fonts with glyph rectangles, SHIELDS/BSHIELD/STAND/CURS with
pixel rulers. No reference screenshot shows the map, so terrain, army, shield and road
sheets are confirmed by shape and colour only, not by position on screen.

## 7. Open points

- Which cell each army type, terrain code, road code and city type selects (needs the map
  drawing code and `TERRAIN0/ARMYTYPE.DAT`); the grids above are solid, the indices are not.
- Rectangles inside the button sheets, ABITS, ATRANS2, WAR, HIDDEN, SPECBITS, HELPGFX.
- FIN bytes 5 and 6 (the second FIN width is the pen advance in START.EXE, §4).
- STAND.PCK cursor hotspots and key colour.
