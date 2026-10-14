"""The talking advisor (ovl58:026f(n)): speech sample or caption, blink and timing.

Evidence (asm out/asm/ovl58.asm; FILE.DAT groups in docs/formats/sound.md):
* ovl58:0293: nothing at all when DS:26c8 (no talking advisor) is set (`talking`);
* n = 5 (turn start of a human side, ovl68:04ab) first picks the file (`turn_advice`); the
  face then follows for every n: VOICE.PCK at (152, 15) (ovl58:071b..0823), and the case
  of jump table ovl58:0b17: n = 0 (60, *) "one moment" (ovl58:087b; Begin on Game Start
  with the random map, ovl60:0621), 1 (61, *) Begin (ovl58:08b0; ovl57:0e2e), 2 (59, *)
  greeting (ovl58:0838; ovl60:0109), 3 no sample (face only, no caller found), 4 (62, *)
  quit (ovl58:08e1; Quit, ovl49:0072), 5 the picked file (ovl58:0913).  With speech
  (DS:37a4 != 0, here: a mixer device) index 0, the sample, is played (155e:04e9 /
  065e mode 2); without, index 1, the caption file, is shown by ovl58:0d01 (`caption_lines`)
  and no sample plays;
* ovl58:0944: the blink counter starts at rnd(1, 30, 10) (`BLINK_ROLL`, once per call, also
  without speech); while the sample plays (155e:075a, polled before each wait): wait 1 tick,
  counter + 1; above 40 (DS bp-0x24 = 0x28) a blink: VOICEBIT (0, 47), wait 2, (0, 94),
  wait 2, (0, 47), wait 2, (0, 0), counter 0 (ovl58:096a..0a75); a blink once started is
  finished.  Then (ovl58:0a90) with speech a 6-tick wait, and the screen is put back;
* ovl58:0d01 (captions): at most 0x80 bytes of the file; '|' ends a line, '~' ends the text;
  up to 6 lines, each drawn alone in SetFont(2, 15, 0, 3) (ovl50:06ae) centred at (312, 408)
  (ovl59:00d6) over the saved rectangle (312 - w/2, 408, w, 17), w = (text width & ~15) + 16,
  for 40 ticks or until a key / button event (ovl59:015e(0x28): event mask 0xd4).

Ticks are the BIOS timer's (register X05, closed here): ovl59:0000(n) reads the tick count
with int 1Ah AH=0 (0000:1bcf) and loops until it is t0 + n (ovl59:015e the same, polling
input); the EXE installs no int 8 / 1Ch handler (its setvect calls, res_0e8f:0018, hook
9, 1Bh, 23h, 24h) and the PIT routine 0000:0894 (channel 0 divisor + int 8 vector) has no
caller, so a tick is 65536 / 1193182 s (`TICK_HZ`).  Not covered: the DIGPAK / MIDPAK .COM
drivers (not part of the EXE).  The face is taken to open on a tick boundary.
"""
from __future__ import annotations

from fractions import Fraction

TICK_HZ = Fraction(1193182, 65536)        # BIOS timer ticks per second (X05)
BLINK_ROLL = (1, 30, 10)                  # ovl58:094c
BLINK_AT = 40                             # ovl58:028e: [bp-0x24] = 0x28, `jg`
BLINK = ((0, 0), (2, 1), (4, 2), (6, 3))  # (tick offset, voice_face FRAMES index): rects y=47/94/47/0 at ovl58:0984/09cb/0a0c/0a4d, 2-tick waits
BLINK_TICKS = 6
END_WAIT = 6                              # ovl58:0a97: ovl59:0000(6), speech only
CAPTION_TICKS = 40                        # ovl58:0ea4: ovl59:015e(0x28)
CAPTION_LINES = 6                         # ovl58:0ee7..0ef2
CAPTION_BYTES = 0x80                      # ovl58:0d26
CAPTION_AT, CAPTION_H = (312, 408), 17    # ovl58:0e36..0e47 / 0e96
FILES = {0: 60, 1: 61, 2: 59, 4: 62}      # case -> FILE.DAT group (index 0 sample, 1 caption)
TURN = 5

# ovl58:026f(5) tables (cities -> group): losing ovl58:0b3b, winning ovl58:0b23
LOSE = {5: 40, 10: 41, 15: 42, 20: 43, 25: 44, 30: 45}
LOSE_ELSE = 46
WIN = {10: 48, 15: 49, 20: 50, 25: 51, 30: 52, 35: 53}
WIN_ELSE = 47
CAPTION_OFFSET = 30                       # caption group = sample group + 30 (0x28 -> 0x46, ...)
GOLD_LOW, GOLD_HIGH = 54, 55              # gold < 100 / > 2800 (ovl58:063d / 0670)
HEROES_NONE, HEROES_MANY = 56, 57         # heroes <= 0 / >= 5 (ovl58:0692 / 06af)
REMARK = 58                               # rnd(1, 5, 0) == 1 (ovl58:06cd)
MODE_BYTE, BUCKET_BYTE = 0x100, 0x108     # SCN bytes [p]: last advice 1 win / 2 lose; its bucket


def talking(app) -> bool:
    """Whether the talking advisor is on (DS:26c8 == 0): OPTIONS.SND digit 2 and --no-voice."""
    from . import audio
    return audio(app).settings.speech


def caption_lines(data: bytes) -> list[str]:
    """ovl58:0d01: the lines of a SOUND/*.TXT caption as the EXE cuts them."""
    buf = data[:CAPTION_BYTES]
    lines, si = [], 0
    for _ in range(CAPTION_LINES):
        start, done, end = si, False, None
        while si < len(buf):
            c = buf[si]
            si += 1
            if c in (0x7C, 0x7E):
                end, done = si - 1, c == 0x7E
                break
        text = buf[start:si if end is None else end].split(b"\0")[0]
        lines.append(text.decode("cp437"))
        if done or si >= len(buf):
            break
    return lines


class Speech:
    """One ovl58:026f face, stepped once per logical frame by the voice_face dialog.

    `eye` is the voice_face FRAMES index drawn over the face (None: VOICE.PCK as it is),
    `caption` the caption line on screen (None: none)."""

    def __init__(self, tick_hz: int, blink: int, sample_ticks: Fraction | None = None,
                 captions: list[str] | None = None):
        self.dt = TICK_HZ / tick_hz
        self.t = Fraction(0)
        self.eye: int | None = None
        self.caption: str | None = None
        self._lines = list(captions or [])
        self._line_end = Fraction(0)
        self._eyes: list[tuple[int, int]] = []
        if sample_ticks is not None:
            self._eyes, self.end = _timeline(sample_ticks, blink)
            self._lines = []
        else:
            self.end = None                  # set when the last caption goes
            self._next_line(Fraction(0))

    def _next_line(self, at: Fraction) -> None:
        if self._lines:
            self.caption = self._lines.pop(0)
            self._line_end = at + CAPTION_TICKS
        else:
            self.caption = None
            self.end = at

    def step(self, skip: bool = False) -> bool:
        """Advance one frame; `skip` = a key or mouse button this frame (ends a caption line,
        ovl59:015e; ignored while a sample plays).  False when the face is gone."""
        self.t += self.dt
        if self.end is None:
            if skip:
                self._next_line(self.t)
            while self.end is None and self.t >= self._line_end:
                self._next_line(self._line_end)
        for tick, frame in self._eyes:
            if tick <= self.t:
                self.eye = frame
        return self.end is None or self.t < self.end


def _timeline(sample_ticks: Fraction, blink: int) -> tuple[list[tuple[int, int]], int]:
    """ovl58:0944..0a9e in ticks: the eye frames and the tick the face is removed."""
    t, c, eyes = 0, blink, []
    while t < sample_ticks:
        t += 1
        c += 1
        if c > BLINK_AT:
            eyes += [(t + dt, f) for dt, f in BLINK]
            t += BLINK_TICKS
            c = 0
    return eyes, t + END_WAIT


def speak(app, n: int, blink: int, file: tuple[int, int] | None = None) -> Speech:
    """Start face n: play its sample (or read its captions without a device) and return the
    Speech to step.  `blink` = the face's rnd(1, 30, 10), rolled by the caller in its dice
    stream; `file` = the FILE.DAT entry `turn_advice` picked for n = 5."""
    from . import audio
    a = audio(app)
    hz = app.cfg.tick_hz
    if n == TURN:
        if file is None:
            raise ValueError("face 5 needs the file turn_advice picked")
    elif n in FILES:
        file = (FILES[n], 0 if a.mixer.available else 1)
    if file is None:                                     # n = 3: face only
        return Speech(hz, blink, sample_ticks=Fraction(0) if a.mixer.available else None)
    rel = a.path(*file)
    if a.mixer.available:
        pcm = a.pcm(rel)
        a.mixer.play_now(pcm)
        return Speech(hz, blink, sample_ticks=Fraction(len(pcm.samples), pcm.rate) * TICK_HZ)
    return Speech(hz, blink, captions=caption_lines(app.gd.read(rel)))


# ovl58:026f(5) up to the face writes SCN bytes and rolls the game's dice, so it is engine
# state: it runs in the human turn start (rules.turn.advice) and is re-exported here.
from ..rules.turn import advice_file as turn_advice  # noqa: E402,F401
