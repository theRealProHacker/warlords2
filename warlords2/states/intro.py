"""START.EXE's intro and credits pages (pgsm state `intro`, docs/plan.md row M2c).

Evidence: docs/research/start_exe.md ("SE"; addresses are START.EXE load segments, listing
`tools/re/start_disasm.py` -> out/asm/start/).  `program` mirrors the intro 0579:0000 line
by line (SE §3.2); its yields are the waits, everything between two yields takes no time
(a fast machine: the PCK / GFX loads and the blits are instant, decision D2; D1..D8 are
the M2c brief's developer decisions, listed in docs/plan.md register X66).

* Time (SE §3.1, register X05): one logical frame is one display refresh.  The BIOS tick
  counter at intro frame f is c(f) = floor(f * TICK_HZ / tick_hz), frame 0 on a tick edge
  (decision D3, as `ui.widgets.tick_frames`).  `wait(n)` 0579:0494 takes t0 = c(start) and
  ends on the first frame with c >= t0 + n; Borland's `delay(20)` 0000:2f22 followed by the
  `vsync` 0682:000a of the next lettering step ends on the first frame at least 20 ms after
  its start (at 60 Hz two refreshes per step: stand-in X66, decision D1).
* Keys (SE §3.1 0579:0438, §5): DOS `getch` bytes, one per `key_check`; the polls inside
  `wait` (04be) read every byte typed by then, `delay` reads none.  A byte 0x20 / 0x1b /
  0x0d ends the intro (black, the music cut, then the Game Start screen); every other byte
  is read and dropped.  The bytes are the getch codes of `ui.menubar.with_codes` /
  `ui.keys.code_of` (an extended key is 0 then its scan code): Space, Esc, Return, keypad
  Enter, Ctrl+M and Alt+D (0, 0x20) skip; Alt+] does not (`ui.menubar.SCAN` has no ']'),
  and Ctrl+Return gives 0x0d here where the BIOS gives 0x0a [inferred, SE §5].  The mouse
  does nothing (SE §1.2: the mouse library is never initialised).
* Drawing: the screen (`vga`), the saved background DS:031e (480x240) and the work buffer
  DS:0359 (480x210) are 8-bit surfaces; the masked blit 072b:0c4d with the mask 0bc3:00d0
  builds (bit set where the pixel equals the key, 0bc3:023a..02e0; dst & mask | src & ~mask
  in 0682:0059 / 00f3) is a colour-key 13 blit (0579:01d3 / 05d2; the mask offset equals
  the source offset at every call).
* Palettes 0551:0003: 0 START\\LOGO.PAL, 1 START\\SCREEN0.PAL, 2 BLACK.PAL, each a single
  switch (`Screen.set_dac`, no fade anywhere, SE §3.5).
* Sound (SE §2, decision D4): ANIM (prefix as `audio.music`, `--music-variant`, for 0c07:0344, X66)
  plays once from 0579:002d (`MusicPlayer.play_once`) whenever SOUND.DAT names a music
  driver and `--music` is on, whatever OPTIONS.SND says (START.EXE never reads it);
  DING0.SND (11000 Hz, 0c07:06a8) at 0579:032c through `audio.effects.ding0`.  A scripted
  or headless run logs ANIM but sounds neither; a missing or stale ANIM render mutes the
  intro only (`MusicPlayer.play_once`).  The end and a skip cut both (cleanup
  062b:0113: MIDPAK / DIGPAK unload, decision D5).
* Exit (SE §1.1): START.EXE leaves mode 12h with the DAC black (palette 2 at 0579:042c, again
  at 062b:00ff, or at 0579:0457 on a skip); that frame is shown, and the next one starts
  WARLORD2.EXE, whose start-up sets BLACK.PAL, draws, then STANDARD.PAL (res_0a4c:0238..024a
  ovl55:0000(2) / ovl61:092a / ovl55:0000(0)): the Game Start screen's first frame is drawn
  under STANDARD.PAL, as without the intro.  Bytes still unread in `typed` and the keys of
  the hand-off frame are dropped: WARLORD2 drains the BIOS buffer (res_08a9:0252 ->
  ovl59:01f1) before its first key read (08a9:006a), register X66.
* Missing files (`playable`): without START.EXE or a START file it names, boot goes to the
  menu, as WAR2.BAT would go on to WARLORD2.EXE.

Not modelled (decision D8, register X66): exit 1 on a command-line argument (062b:004e),
exit 5 when the sound set-up fails (062b:00b8), the 23:59:59 / midnight guards of `wait`
(0579:0468, 04d8), the PC-speaker BEL of IBMBAK.COM (0c07:0679) and the Ctrl-C / Ctrl-Break
defeat (06a9:004b / 0093).
"""
from __future__ import annotations

import struct
from collections import deque
from fractions import Fraction

import pygame

from ..assets.exe import ds_str, ds_words
from ..audio.voice import TICK_HZ
from ..ui.keys import code_of
from ..ui.menubar import with_codes
from ..ui.screen import IDENTITY
from ..ui.widgets import blit_opaque
from .base import BaseState

START_EXE = "START.EXE"
DGROUP = 0x109E                              # 0000:0000 mov dx, 0x109e (SE §0)
SKIP = frozenset((0x20, 0x1B, 0x0D))         # 0579:0448 / 044d / 0452
KEY = 13                                     # 0579:01d3 / 05d2: mask of colour 13
LOGO, SCREEN0, BLACK = 0, 1, 2               # 0551:0003 argument
PALETTES = {LOGO: 0x2E4, SCREEN0: 0x2F3, BLACK: 0x2DA}     # DS strings (0551:0003)
FILES = {"ssg": 0x4B7, "black": 0x4C6, "start": 0x4D7, "stext": 0x4E8,
         "black2": 0x56E, "sparkle": 0x57F, "ding": 0x496}
MUSIC_NAME = 0x4AD                           # 0579:001a; 0c07:032e: "%s%s%s" = START\ + prefix + name
PAGES = (0x4F8, 0x509, 0x517, 0x527, 0x537, 0x548, 0x55A)  # 0579:0399..03e7, in order
SPARKLE_XY, SPARKLE_N, SPARKLE_SX = 0x40A, 0x486, 0x488    # 31 (x, y) pairs, 31, 7 words
SLOTS, CELL_W, CELL_H, FRAMES = 20, 32, 41, 7              # 0579:06af, 070e / 0710, 0739
W, H = 640, 480
AREA = (80, 30, 480, 210)                    # the lettering's rest / the sparkle window
PAGE_ORIGIN = (80, 260)                      # 0579:0574 / 0577
STEP_PX, TEXT_H, DROP = 6, 210, 30           # 0579:01ea..0265 and 026b..0307
DELAY_MS = 20                                # 0579:025a / 02fc
PAGE_TICKS, GAP_TICKS = 60, 5                # 0579:0587 / 05ac
SSG_TICKS, TITLE_TICKS, SPARKLE_TICKS = 10, 20, 20         # 0579:0076 / 00eb / 0373
TICKS, DELAY = "ticks", "delay"


class Skipped(Exception):
    """A skip byte read by `key_check` (0579:0457 -> cleanup(0))."""


def bios_ticks(frame: int, tick_hz: int) -> int:
    """c(f): BIOS ticks passed by intro frame `frame` (frame 0 on a tick edge)."""
    return int(frame * Fraction(TICK_HZ) / tick_hz)


def key_bytes(code: int) -> tuple[int, ...]:
    """The bytes `getch` returns for a getch code: an extended key is 0, then its scan code."""
    return (code,) if code < 0x100 else (0, code - 0x100)


# --------------------------------------------------------------------------- the program


def wipe(io, pic):
    """0579:04f8: even rows top-down and odd rows bottom-up, one of each per iteration, a
    wait(1) after iterations 0, 4, ... 236 (SE §3.3)."""
    count, top, bottom = 0, 0, H - 1
    while top < H and bottom > 0:
        io.key_check()
        io.blit(pic, 0, top, W, 1, io.screen, 0, top)
        io.blit(pic, 0, bottom, W, 1, io.screen, 0, bottom)
        if count % 4 == 0:
            yield (TICKS, 1)
        top += 2
        bottom -= 2
        count += 1


def program(io):
    """0579:0000 (SE §3.2), yielding (TICKS, n) for wait(n) and (DELAY, ms) for delay(ms)."""
    io.music_start()                                  # 0579:0019..002d (DING0 loaded at 000b)
    io.key_check()                                    # 0035
    io.palette(BLACK)                                 # 003a
    pic = io.load("ssg")                              # 0042
    io.palette(LOGO)                                  # 0056
    io.mark("wipe ssg")
    yield from wipe(io, pic)
    io.mark("wiped ssg")
    yield (TICKS, SSG_TICKS)                          # 0076
    pic = io.load("black")                            # 007e
    io.mark("wipe black")
    yield from wipe(io, pic)
    io.mark("wiped black")
    io.palette(BLACK)                                 # 00aa
    io.key_check()                                    # 00b4
    pic = io.load("start")                            # 00b7
    io.palette(SCREEN0)                               # 00cb
    io.mark("wipe start")
    yield from wipe(io, pic)
    io.mark("wiped start")
    yield (TICKS, TITLE_TICKS)                        # 00eb
    io.key_check()                                    # 00f5
    saved = io.new(480, 240)                          # 00f8 DS:031e
    io.blit(io.screen, 80, 0, 480, 240, saved, 0, 0)  # 0161
    work = io.new(480, TEXT_H)                        # 019c..01b2 DS:0359
    io.key_check()                                    # 01bc
    text = io.load("stext")                           # 01bf, its mask 01e2
    for s in range(STEP_PX, TEXT_H + 1, STEP_PX):     # 01ea..0269: the bottom s rows at the top edge
        io.key_check()
        io.blit(saved, 0, 0, 480, s, work, 0, 0)
        io.mblit(text, 0, TEXT_H - s, 480, s, work, 0, 0)
        io.blit(work, 0, 0, 480, s, io.screen, 80, 0)       # after vsync 023a
        io.mark(f"letter 1 {s}")
        yield (DELAY, DELAY_MS)
    for s in range(STEP_PX, DROP + 1, STEP_PX):       # 026b..030c: down to rest at (80, 30)
        io.key_check()
        io.blit(saved, 0, s, 480, TEXT_H, work, 0, 0)
        io.mblit(text, 0, 0, 480, TEXT_H, work, 0, 0)
        io.blit(saved, 0, s - STEP_PX, 480, STEP_PX, io.screen, 80, s - STEP_PX)   # after vsync 02b7
        io.blit(work, 0, 0, 480, TEXT_H, io.screen, 80, s)
        io.mark(f"letter 2 {s}")
        yield (DELAY, DELAY_MS)
    sparkle = io.load("sparkle")                      # 0328 -> 05b5..05e1
    x, y, w, h = AREA
    io.blit(io.screen, x, y, w, h, saved, 0, 0)       # 05ff
    io.ding()                                         # 032c 0c07:065d(di, 0)
    slots: list[list[int] | None] = [None] * SLOTS
    for i, (px, py) in enumerate(io.sparkle_table):   # 0335..036c
        io.key_check()
        if px >= 0 and py >= 0:                       # 065b: the lowest free slot
            free = next((k for k, v in enumerate(slots) if v is None), None)
            if free is not None:
                slots[free] = [px - x, py - y, 0]
        io.blit(saved, 0, 0, w, h, work, 0, 0)        # 06b7
        for k, v in enumerate(slots):
            if v is not None:
                sx = io.sparkle_sx[v[2]]
                io.mblit(sparkle, sx, 0, CELL_W, CELL_H, work, v[0], v[1])
                v[2] += 1
                if v[2] >= FRAMES:
                    slots[k] = None
        io.blit(work, 0, 0, w, h, io.screen, x, y)
        io.mark(f"sparkle {i}")
        yield (TICKS, 1)
    io.blit(saved, 0, 0, w, h, work, 0, 0)            # 036f -> 0608: the clean frame
    io.blit(work, 0, 0, w, h, io.screen, x, y)
    io.mark("sparkles done")
    yield (TICKS, SPARKLE_TICKS)                      # 0373
    px, py = PAGE_ORIGIN
    io.blit(io.screen, px, py, w, h, work, 0, 0)      # 0392: the painting under the pages
    for n, page in enumerate(PAGES):                  # 0579:0571 per page
        io.page(page)                                 # 08b8
        io.mark(f"page {n}")
        yield (TICKS, PAGE_TICKS)
        io.blit(work, 0, 0, w, h, io.screen, px, py)  # 05a5
        io.mark(f"erased {n}")
        yield (TICKS, GAP_TICKS)
    io.ding_free()                                    # 03ed 0c07:061d
    pic = io.load("black2")                           # 03f4
    io.mark("wipe end")
    yield from wipe(io, pic)
    io.palette(BLACK)                                 # 042c (and 062b:00ff)
    io.mark("end")


class Timeline:
    """Runs `program` against the frame clock: `advance(frame)` resumes it once its wait is
    over and runs it to its next wait.  `done` is the frame it ended on (its last wait over,
    or a skip byte read), `skipped` whether a key ended it."""

    def __init__(self, io, tick_hz: int):
        self.io, self.tick_hz = io, tick_hz
        self.gen = program(io)
        self.wait: tuple[str, int, int] | None = None     # kind, amount, start frame
        self.done: int | None = None
        self.skipped = False

    def ready(self, frame: int) -> bool:
        if self.wait is None:
            return True
        kind, n, f0 = self.wait
        if kind == TICKS:                                 # 0579:04dc..04f4
            self.io.poll()                                # 04be: every byte typed by now
            return bios_ticks(frame, self.tick_hz) >= bios_ticks(f0, self.tick_hz) + n
        return (frame - f0) * 1000 >= n * self.tick_hz    # delay(ms), then the next vsync

    def advance(self, frame: int) -> None:
        if self.done is not None:
            return
        self.io.frame = frame
        try:
            if not self.ready(frame):
                return
            kind, n = next(self.gen)
            self.wait = (kind, n, frame)
            if kind == TICKS:
                self.io.poll()                            # 04bb -> 04dc -> 04bd: a poll before the first time read
        except Skipped:
            self.gen.close()
            self.done, self.skipped = frame, True
            self.io.finish(skipped=True)
        except StopIteration:
            self.done = frame
            self.io.finish(skipped=False)


class IntroIO:
    """What `program` draws on and plays through.  This base logs and draws nothing (the
    schedule alone, for the timeline test); `Intro` draws and plays.  `log` holds
    (frame, label) for the marks, palette switches, sound and the end."""

    sparkle_table: tuple[tuple[int, int], ...] = ()
    sparkle_sx: tuple[int, ...] = ()
    screen = None

    def __init__(self):
        self.frame = 0
        self.log: list[tuple[int, str]] = []
        self.typed: deque[int] = deque()

    def mark(self, label: str) -> None:
        self.log.append((self.frame, label))

    def key_check(self) -> None:
        """0579:0438: one byte, if any; a skip byte raises Skipped."""
        if self.typed and self.typed.popleft() in SKIP:
            raise Skipped

    def poll(self) -> None:
        while self.typed:
            self.key_check()

    def palette(self, k: int) -> None:
        self.mark(f"palette {k}")

    def music_start(self) -> None:
        self.mark("music")

    def ding(self) -> None:
        self.mark("ding")

    def ding_free(self) -> None:
        pass

    def finish(self, skipped: bool) -> None:
        if skipped:
            self.palette(BLACK)                       # 0579:0457
        self.mark("skip" if skipped else "exit")

    def load(self, key: str):
        return None

    def new(self, w: int, h: int):
        return None

    def blit(self, src, sx, sy, w, h, dst, dx, dy) -> None:
        pass

    def mblit(self, src, sx, sy, w, h, dst, dx, dy) -> None:
        pass

    def page(self, off: int) -> None:
        pass


def start_tables(exe: bytes) -> tuple[tuple[tuple[int, int], ...], tuple[int, ...]]:
    """DS:040a (DS:0486 pairs, (-1, -1) = no sparkle) and the cell offsets DS:0488."""
    n = ds_words(exe, SPARKLE_N, 1, dgroup=DGROUP)[0]
    xy = ds_words(exe, SPARKLE_XY, 2 * n, dgroup=DGROUP)
    return tuple(zip(xy[::2], xy[1::2])), ds_words(exe, SPARKLE_SX, FRAMES, dgroup=DGROUP)


def _surface(w: int, h: int) -> pygame.Surface:
    s = pygame.Surface((w, h), depth=8)
    s.set_palette(IDENTITY)
    return s


class Intro(BaseState, IntroIO):
    """The state.  `on_enter` only resets fields (pgsm hook thread); the files are read and
    the surfaces made by the first `step` (intro frame 0), so the paint before it shows the
    blank screen of the fresh mode 12h (colour 0)."""

    def __init__(self, app):
        BaseState.__init__(self, app)
        IntroIO.__init__(self)
        self.timeline: Timeline | None = None
        self.first: int | None = None              # app frame of intro frame 0
        self.vga: pygame.Surface | None = None
        self.dinged = False

    def playable(self) -> bool:
        """START.EXE and every START file it names (pictures, palettes, pages, DING0) exist;
        else boot skips the intro, as WAR2.BAT would go on to WARLORD2.EXE.  The music needs
        no file here (a missing ANIM render mutes it, `MusicPlayer.play_once`)."""
        gd = self.app.gd
        if not gd.path(START_EXE).is_file():
            return False
        try:
            exe = gd.read(START_EXE)
            start_tables(exe)
            names = [ds_str(exe, off, dgroup=DGROUP) for off in (*FILES.values(), *PALETTES.values(), *PAGES)]
        except (ValueError, struct.error):
            return False
        return all(gd.path(n).is_file() for n in names)

    def on_enter(self, frm: str, **kw) -> None:
        if kw:
            raise TypeError(f"intro: unexpected arguments {sorted(kw)}")
        IntroIO.__init__(self)
        self.timeline, self.first, self.vga, self.dinged = None, None, None, False

    # ------------------------------------------------------------------ frames

    def step(self, events, dt) -> None:
        if self.timeline is None:
            self.exe = self.app.gd.read(START_EXE)
            self.sparkle_table, self.sparkle_sx = start_tables(self.exe)
            self.vga = self.screen = _surface(W, H)        # mode 12h: all colour 0
            self.first = self.app.frame
            self.timeline = Timeline(self, self.app.cfg.tick_hz)
        elif self.timeline.done is not None:               # the black frame was shown
            self.app.screen.set_dac(self.app.assets.palette("STANDARD.PAL"))   # WARLORD2's 0a4c:024a
            self.request("menu")
            return
        for e, code in with_codes(events, self.app.input):
            code = code_of(e, code)
            if code is not None:
                self.typed.extend(key_bytes(code))
        self.timeline.advance(self.app.frame - self.first)

    def paint(self, fb: pygame.Surface) -> None:
        if self.vga is None:
            fb.fill(0)
        else:
            fb.blit(self.vga, (0, 0))

    # ------------------------------------------------------------------ IntroIO

    def name(self, off: int) -> str:
        return ds_str(self.exe, off, dgroup=DGROUP).replace("\\", "/")

    def palette(self, k: int) -> None:
        self.app.screen.set_dac(self.app.assets.palette(self.name(PALETTES[k])))
        super().palette(k)

    def load(self, key: str) -> pygame.Surface:
        return self.app.assets.surface(self.name(FILES[key]))

    def new(self, w: int, h: int) -> pygame.Surface:
        return _surface(w, h)

    def blit(self, src, sx, sy, w, h, dst, dx, dy) -> None:
        blit_opaque(dst, src, (dx, dy), (sx, sy, w, h))

    def mblit(self, src, sx, sy, w, h, dst, dx, dy) -> None:
        src.set_colorkey(KEY)
        dst.blit(src, (dx, dy), (sx, sy, w, h))
        src.set_colorkey(None)

    def page(self, off: int) -> None:
        from ..ui.gfxpage import render
        from ..ui.widgets import kit
        render(self.vga, self.app.gd.read(self.name(off)), PAGE_ORIGIN, kit(self.app).fonts, None)

    def music_start(self) -> None:
        from ..audio import music_render as R
        from ..audio import music_triggers
        p = music_triggers.player(self.app)
        name = self.name(MUSIC_NAME).rsplit(".", 1)[0].upper()
        p.play_once(R.stem(name, p.variant), "0579:002d")
        super().music_start()

    def ding(self) -> None:
        from ..audio import effects
        effects.ding0(self.app)
        self.dinged = True
        super().ding()

    def finish(self, skipped: bool) -> None:
        """cleanup(0) 062b:0113: MIDPAK unload (the music stops), DIGPAK unload."""
        super().finish(skipped)
        from ..audio import music_triggers
        music_triggers.player(self.app).stop_once("skip" if skipped else "end")
        if self.dinged:
            from ..audio import audio
            audio(self.app).mixer.stop()
