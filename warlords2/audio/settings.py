"""Sound settings: music, effects and speech (DATA/OPTIONS.SND, docs/formats/tables.md §9).

Evidence:
* start-up ovl58:0bc5 (called from 0a4c:01d7): the default "000" (DS:266f) is copied into a
  3-byte buffer, then FILE.DAT (68, 0) = DATA\\OPTIONS.SND is read over it when it opens;
  digit k is byte k - '0'.  Music DS:0bee = digit 0, forced 0 without a music driver
  (DS:37a3); effects DS:0bec = digit 1, forced 0 without a digital driver (DS:37a2);
  "no talking advisor" DS:26c8 = 1 when the 'v' switch set it already, else digit 2 == 0;
* the sound options ovl33:0576(n): n = 0 toggles music (stops it; music mode 1 when it
  comes on, M10c), n = 2 toggles DS:26c8, any other n toggles effects; then OPTIONS.SND is
  written as the three digits music, effects, !DS:26c8 (ovl33:05d8..062b).  Buttons 0x114
  (music) / 0x115 (effects) are disabled without their driver (ovl33:0079 / 0091).

Here the file is read from `--user-dir` (the game directory's copy when the user has none)
and written to `--user-dir` only.  The digital driver is the mixer (`audio.mixer`); whether
music can play is M10c's, so the music digit is kept as read.  `--no-voice` is the 'v'
switch.
"""
from __future__ import annotations

from dataclasses import dataclass

FILE = "OPTIONS.SND"                 # user-dir name (the game's is FILE.DAT (68, 0))
GAME_FILE = (68, 0)
DEFAULT = b"000"                     # DS:266f
MUSIC, EFFECTS, SPEECH = 0, 1, 2     # ovl33:0576 argument


@dataclass
class SoundSettings:
    music: bool                      # DS:0bee (digit 0, as read; M10c applies its driver test)
    effects: bool                    # DS:0bec
    speech: bool                     # not DS:26c8

    def digits(self) -> bytes:
        """ovl33:05f8..0612."""
        return bytes(0x30 + int(v) for v in (self.music, self.effects, self.speech))


def parse(data: bytes, *, digital: bool, no_voice: bool) -> SoundSettings:
    """ovl58:0bc5 on the bytes read (at most 3; a short file leaves the default's digits)."""
    buf = data[:3] + DEFAULT[len(data[:3]):]
    d = [b - 0x30 for b in buf]
    return SoundSettings(music=d[0] != 0, effects=digital and d[1] != 0,
                         speech=not no_voice and d[2] != 0)


def load(app, *, digital: bool) -> SoundSettings:
    """The settings at start-up: the user's OPTIONS.SND, else the game's, else "000"."""
    p = app.user.path(FILE)
    if p.is_file():
        data = p.read_bytes()
    else:
        from ..formats.tables import StringTable
        rel = StringTable(app.gd.read("DATA/FILE.DAT")).get(*GAME_FILE)
        g = app.gd.path(rel)
        data = g.read_bytes() if g.is_file() else DEFAULT
    return parse(data, digital=digital, no_voice=app.cfg.no_voice)


def toggle(app, n: int) -> SoundSettings:
    """ovl33:0576(n): flip one setting and write OPTIONS.SND to the user directory.  The
    caller keeps the effects / music buttons disabled without a device (ovl33:0079 / 0091)."""
    from . import audio
    s = audio(app).settings
    if n == MUSIC:
        s.music = not s.music
    elif n == SPEECH:
        s.speech = not s.speech
    else:
        s.effects = not s.effects
    app.user.path(FILE).write_bytes(s.digits())
    return s
