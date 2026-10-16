"""The random-map panel of the Game Start screen (WARLORD2.EXE ovl60, docs/plan.md M11; prep §1.1).

There is no random-map dialog: the generator's parameters live on the Game Start screen itself,
in the rectangle the scenario picture takes otherwise.  The words are the run's
(`rules.randmap.RandomRun`, kept as `persist.saves.RunCarry.random_map`): DS:28c8 `random`,
28ca `terrain_set`, 28cc `allies`, 28d0[4] `sliders`, 28d8[4] `shown`.

Evidence (asm ovl60; DGROUP values read from the user's EXE, texts from STRING.DAT / TERRAIN.DAT):
* button 102 -> ovl60:05f5: DS:28c8 = 1; 0332(-1); 02bf (the title STRING (0, 0)); 011e;
* 011e with DS:28c8: 104, 105 normal (08a9:066e); for i 0..3: 110 + i in state
  `DS:28d8[i] ? 1 : 0` (08a9:05f0: normal, or pressed while the "?" shows), 106 + i normal;
  without DS:28c8 104..113 hidden (08a9:03b3);
* the dispatch 07be:04d8 (table cs:0b0c): 104 -> 063a, 105 -> 0661, 106..109 -> 0512(id - 106),
  110..113 -> 0571(id - 110); each handler ends with 0332(k) and 011e;
* 0512(i) (slider): with DS:28d8[i] the mouse x at handler time (12bf:0af4) and DS:28d0[i] =
  (mx - DS:29ac[i].x) * 7 / DS:29ac[i].w (imul, cwd, idiv: truncation toward zero); without it
  DS:28d8[i] = 1 and the value stays;
* 0571(i) ("?"): DS:28d8[i] = 0.  The generator never reads DS:28d8 (ovl57:1193..11cc reads
  DS:28d0 only and rolls only for a value 7, which a click inside the 120-px button cannot give:
  quirk Q1, register X54, reproduced: the "?" shows random, the map is made with the value);
* 063a: n = ovl60:0dff() (DATA\\TERRAIN.DAT = FILE.DAT (36, 0): its first word, 1 when the file
  does not open); DS:28ca = (DS:28ca + 1) % n;
* 0661: DS:28cc = !DS:28cc;
* 0332(k) with DS:28c8 (k = -1 all, 0..3 one slider, 4 terrain, 5 allies): colour 3 over DS:2930
  (k < 0) or the row DS:2948 + 8 k; SetFont(2, 15, 0, 3) (ovl50:06ae); per slider i: the label
  STRING (2, i) right-aligned (ovl59:0103) at DS:2978[i]; picture 1 (STARTBU) opaque (0997:0129)
  from `DS:28d8[i] ? DS:29cc + 8 DS:28d0[i] : DS:2a04` to DS:299c[i]; the value text
  `DS:28d8[i] ? sprintf(DS:2918[i], DS:28e0[7 i + DS:28d0[i]]) : strcpy(DS:2a76)` left-aligned
  (ovl59:00bf) at (DS:298c[i].x, DS:2978[i].y); k in (-1, 4): the TERRAIN.DAT record label
  (ovl60:0e4d(DS:28ca): the count word, then 0x34-byte records read up to the index, the text
  at record + 2) left-aligned at (0x150, 0x154); k in (-1, 5): STRING (3, DS:28cc) left-aligned
  at (0x150, 0x16d).  The pointer is hidden around it (12bf:07a5 / 0757).
`paint` redraws the whole frame, so one full 0332(-1) stands for every 0332(k): a row redraw
paints the same pixels a full one does.  The 2 x 2 preview of the generator (ovl02:03aa / 0449)
is dead code (DS:26c2 has no writer) and is not drawn.

The value words are read the way the EXE reads them, by address: DS:28e0 + 2 (7 i + v) and
DS:29cc + 8 v.  A value outside 0..6 (a mouse that left the button between the release and the
handler) then reads what lies there: the run words DS:28c6..28df from the run, the rest from
the EXE image.
"""
from __future__ import annotations

from typing import TYPE_CHECKING

import pygame

from ..assets.exe import ds_str, ds_word, ds_words
from ..assets.fonts import CHANCE17
from ..assets.text import printf
from . import registry
from .layout import NORMAL, PRESSED
from .widgets import blit_opaque, kit

if TYPE_CHECKING:
    from ..rules.randmap import RandomRun
    from .widgets import Kit

RANDOM_MAP, TERRAIN_SET, ALLIES = 102, 104, 105
SLIDERS, QUERIES = range(106, 110), range(110, 114)
PANEL_IDS = (TERRAIN_SET, ALLIES, *SLIDERS, *QUERIES)
N = 4

STARTBU = 1                                  # picture 1 (0997:0129(1, ...))
PAPER, INK, SHADOW = 3, 15, 0                # 14d0:0002(3); ovl50:06ae(2, 15, 0, 3)
LABELS, ALLY_TEXT = 2, 3                     # STRING.DAT groups (2, i), (3, DS:28cc)
TERRAIN_FILE = (36, 0)                       # FILE.DAT: DATA\TERRAIN.DAT (ovl60:0e13 push 0x24)
TERRAIN_RECORD, TERRAIN_TEXT = 0x34, 2       # ovl60:0ea3 push 0x34; caller's bp-0x46 = record + 2
TERRAIN_AT, ALLIES_AT = (0x150, 0x154), (0x150, 0x16D)

PANEL = 0x2930                               # rect, k = -1
ROW = 0x2948                                 # rects, + 8 k
LABEL_AT, VALUE_AT, SLIDER_AT = 0x2978, 0x298C, 0x299C   # points, + 4 i
HIT = 0x29AC                                 # rects of 106..109, + 8 i
SLIDER_SRC, QUERY_SRC = 0x29CC, 0x2A04       # rects in picture 1, + 8 v; the "?" picture
FORMATS = 0x2918                             # far pointers, + 4 i
VALUES = 0x28E0                              # words, 7 per slider
QUERY_TEXT = 0x2A76
STEPS = 7                                    # ovl60:0540 imul ax, ax, 7

GAME_START, RANDOM, TERRAIN, ALLY, INDEX, SLIDER_W, SHOWN_W = (
    0x28C6, 0x28C8, 0x28CA, 0x28CC, 0x28CE, 0x28D0, 0x28D8)
RUN_WORDS = range(0x28C6, 0x28E0)


# --------------------------------------------------------------------------- run words


def run_words(app) -> RandomRun:
    """DS:28c8..28df of this run (`persist.saves.RunCarry.random_map`)."""
    from .dialogs.save_load import run_carry
    return run_carry(app).random_map


def slider_value(mx: int, x: int, w: int) -> int:
    """ovl60:0539..054d: (mx - x) * 7 / w with the 8086's idiv (the quotient truncated toward
    zero, no clamp)."""
    return int((mx - x) * STEPS / w)


def dgroup_word(exe: bytes, run: RandomRun, off: int, index: int = 0) -> int:
    """The signed word at DS:off as ovl60 reads it: the run words DS:28c6..28df from the run
    (`index` = DS:28ce, the current record), every other word from the EXE image."""
    if off not in RUN_WORDS:
        return ds_word(exe, off)
    if off & 1:
        raise ValueError("odd run word address %#x" % off)
    if off >= SHOWN_W:
        return run.shown[(off - SHOWN_W) // 2]
    if off >= SLIDER_W:
        return run.sliders[(off - SLIDER_W) // 2]
    return {GAME_START: 1, RANDOM: run.random, TERRAIN: run.terrain_set, ALLY: run.allies,
            INDEX: index}[off]


# --------------------------------------------------------------------------- TERRAIN.DAT


def _terrain_file(k: Kit) -> bytes | None:
    try:
        return k.store.read(k.files.get(*TERRAIN_FILE))
    except (OSError, KeyError):
        return None


def terrain_count(k: Kit) -> int:
    """ovl60:0dff: the first word of DATA\\TERRAIN.DAT, 1 when the file does not open."""
    data = _terrain_file(k)
    if data is None:
        return 1
    return int.from_bytes(data[:2], "little", signed=True) if len(data) >= 2 else 1


def terrain_label(k: Kit, index: int) -> str:
    """ovl60:0e4d(index): record `index`'s text (record + 2, NUL-ended).  Past the count (or no
    file) the EXE leaves its stack buffer as it was; here "" [stand-in, unreachable in 1.02:
    DS:28ca stays below the count]."""
    data = _terrain_file(k)
    if data is None or len(data) < 2 or not 0 <= index < int.from_bytes(data[:2], "little", signed=True):
        return ""
    p = 2 + TERRAIN_RECORD * index + TERRAIN_TEXT
    raw = data[p:2 + TERRAIN_RECORD * (index + 1)]
    return raw.split(b"\0")[0].decode("cp437")


# --------------------------------------------------------------------------- buttons, handlers


def set_buttons(host) -> None:
    """ovl60:011e's panel part on the Game Start host (`states.menu.Menu`)."""
    run = run_words(host.app)
    if not host.random:
        for id in PANEL_IDS:
            host.hide_button(id)
        return
    host.set_button(TERRAIN_SET, NORMAL)
    host.set_button(ALLIES, NORMAL)
    for i in range(N):
        host.set_button(QUERIES[i], NORMAL if run.shown[i] else PRESSED)
        host.set_button(SLIDERS[i], NORMAL)


def _redraw(host) -> None:
    """0332(k) (the next paint) and 011e."""
    host.refresh()


@registry.action(RANDOM_MAP)
def choose_random(host) -> None:
    """ovl60:05f5: DS:28c8 = 1, then the panel, the title and the buttons."""
    run_words(host.app).random = 1
    host.random = True
    _redraw(host)


@registry.action(TERRAIN_SET)
def next_terrain(host) -> None:
    """ovl60:063a."""
    run = run_words(host.app)
    n = terrain_count(kit(host.app))
    run.terrain_set = (run.terrain_set + 1) % n
    _redraw(host)


@registry.action(ALLIES)
def toggle_allies(host) -> None:
    """ovl60:0661: DS:28cc = (DS:28cc == 0)."""
    run = run_words(host.app)
    run.allies = int(not run.allies)
    _redraw(host)


def slide(host, i: int) -> None:
    """ovl60:0512(i): the mouse x read now (12bf:0af4)."""
    run = run_words(host.app)
    if run.shown[i]:
        x, _, w, _ = ds_words(kit(host.app).exe, HIT + 8 * i, 4)
        run.sliders[i] = slider_value(host.app.input.pos[0], x, w)
    else:
        run.shown[i] = 1
    _redraw(host)


def query(host, i: int) -> None:
    """ovl60:0571(i): the "?" shows; the value stays (Q1)."""
    run_words(host.app).shown[i] = 0
    _redraw(host)


for _i in range(N):
    registry.action(SLIDERS[_i])(lambda host, _i=_i: slide(host, _i))
    registry.action(QUERIES[_i])(lambda host, _i=_i: query(host, _i))
del _i


# --------------------------------------------------------------------------- drawing


def value_text(k: Kit, run: RandomRun, i: int, index: int = 0) -> str:
    """0332's value text of slider i."""
    exe = k.exe
    if not run.shown[i]:
        return ds_str(exe, QUERY_TEXT)
    fmt_off, _seg = ds_words(exe, FORMATS + 4 * i, 2, signed=False)
    v = dgroup_word(exe, run, VALUES + 2 * (STEPS * i + run.sliders[i]), index)
    return printf(ds_str(exe, fmt_off), v)


def slider_source(k: Kit, run: RandomRun, i: int) -> tuple[int, int, int, int]:
    """0332's picture-1 source rectangle of slider i."""
    off = SLIDER_SRC + 8 * run.sliders[i] if run.shown[i] else QUERY_SRC
    return ds_words(k.exe, off, 4)


def draw(fb: pygame.Surface, k: Kit, run: RandomRun, index: int = 0) -> None:
    """ovl60:0332(-1) with DS:28c8 set: the panel under the title and the buttons."""
    exe, f = k.exe, k.fonts[CHANCE17]
    fb.fill(PAPER, ds_words(exe, PANEL, 4))
    pic = k.picture(STARTBU)
    for i in range(N):
        lx, ly = ds_words(exe, LABEL_AT + 4 * i, 2)
        label = k.text.S(LABELS, i)
        f.draw(fb, lx - f.width(label), ly, label, INK, SHADOW)
        try:
            blit_opaque(fb, pic, ds_words(exe, SLIDER_AT + 4 * i, 2), slider_source(k, run, i))
        except ValueError:          # a value outside 0..6 whose rectangle leaves the picture:
            pass                    # the EXE copies other memory there [stand-in, X54]
        vx, _ = ds_words(exe, VALUE_AT + 4 * i, 2)
        f.draw(fb, vx, ly, value_text(k, run, i, index), INK, SHADOW)
    f.draw(fb, *TERRAIN_AT, terrain_label(k, run.terrain_set), INK, SHADOW)
    f.draw(fb, *ALLIES_AT, k.text.S(ALLY_TEXT, run.allies), INK, SHADOW)
