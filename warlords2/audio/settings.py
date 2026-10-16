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
and written to `--user-dir` only.  The digital driver is the mixer (`audio.mixer`); the music
driver DS:37a3 is `--music on` with a music driver named in SOUND.DAT (`music_driver`, 155e:00d5),
and digit 0 is forced 0 without it.  A fresh user directory (no OPTIONS.SND of its own) starts
with the music on in an interactive run (user decision, docs/plan.md M10c: the shipped file says
"001", music off); a scripted or headless run (`--script` / `--headless`, `cfg.fixed_dt`) reads
the game's file as the EXE does, so scripts and tests run with the music off and no music die is
drawn.  `--no-voice` is the 'v' switch.
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


SOUND_DAT = "SOUND.DAT"                # 155e:0023 "sound.dat" (DS:37ae), opened in the game dir
NO_DRIVER = b"NO_SOUND"                # DS:37c1 / 37ca, compared case-sensitively (repe cmpsb)
NO_DIGITAL_LOAD = b"IBMBAK.COM"        # DS:37d3: the digital driver is not loaded (DS:37ab = 1)
AD_FILE, MIDPAK = "MIDPAK.AD", "MIDPAK.COM"      # DS:37f7, DS:3819
CANT_INIT = 0x27B7                     # res_0a4c:01c7: the start-up's sound error line
NO_ADV, NO_AD, NO_MIDPAK = 0x37DE, 0x3801, 0x3824    # 155e:0174 / 01ad / 01cf messages


class SoundInitError(Exception):
    """155e:0005 returned 0: the lines the EXE prints (0000:43ac) before 0a4c:02b5 ends it."""

    def __init__(self, lines: list[str]):
        super().__init__("; ".join(lines))
        self.lines = lines


def parse(data: bytes, *, digital: bool, no_voice: bool, music: bool = True) -> SoundSettings:
    """ovl58:0bc5 on the bytes read (at most 3; a short file leaves the default's digits);
    `music` False = no music driver (DS:37a3 = 0: digit 0 forced 0, 0c32..0c45)."""
    buf = data[:3] + DEFAULT[len(data[:3]):]
    d = [b - 0x30 for b in buf]
    return SoundSettings(music=music and d[0] != 0, effects=digital and d[1] != 0,
                         speech=not no_voice and d[2] != 0)


def sound_init(app) -> bool:
    """155e:0005 with `--music on`: DS:37a3, the music driver flag; raises SoundInitError when
    the EXE's start-up fails (res_0a4c:01bc..01d4: the line DS:27b7, then 0a4c:02b5).
    * 0020..0039: "sound.dat" not opened -> 0;
    * 005b sscanf("%s %s %d"): the digital driver, the music driver (ADV), DS:37a4;
    * 007c..00a4 / 00b2..00d5: a word equal to "NO_SOUND" (case-sensitive) clears DS:37a2 /
      DS:37a3; both clear: DS:37a6 = 1, return 1 (00ea);
    * 00f5..014b: a digital driver other than "IBMBAK.COM" is loaded (0000:03f5), a failure -> 0;
    * 0156..01dd (music driver): the ADV file (0000:0660, message DS:37de), MIDPAK.AD (DS:3801),
      MIDPAK.COM (0000:0d3b, DS:3824), each failure prints its message and returns 0.
    Here a load is the file's presence in the game directory [unverified: the drivers' own
    initialisation and 0000:03f5's failures are not modelled]; a SOUND.DAT with fewer than two
    words has an unset buffer in the EXE and fails here as a missing driver file [unverified].
    `--music off` stands for a SOUND.DAT whose music word is NO_SOUND: no check, no driver."""
    if getattr(app.cfg, "music", "on") != "on":
        return False
    p = app.gd.path(SOUND_DAT)
    if not p.is_file():
        raise SoundInitError([_text(app, CANT_INIT)])
    words = p.read_bytes().split()
    digital, music = (words + [b"", b""])[:2]
    if digital != NO_DRIVER and digital != NO_DIGITAL_LOAD and not _found(app, digital):
        raise SoundInitError([_text(app, CANT_INIT)])
    if music == NO_DRIVER:
        return False
    for name, msg in ((music, NO_ADV), (AD_FILE.encode(), NO_AD), (MIDPAK.encode(), NO_MIDPAK)):
        if not _found(app, name):
            raise SoundInitError([_text(app, msg), _text(app, CANT_INIT)])
    return True


def music_driver(app) -> bool:
    """DS:37a3 (`sound_init`, the App's start-up check already passed)."""
    try:
        return sound_init(app)
    except SoundInitError:
        return False


def _found(app, name: bytes) -> bool:
    return bool(name) and app.gd.path(name.decode("latin-1")).is_file()


def _text(app, off: int) -> str:
    from ..assets.exe import ds_str
    return ds_str(app.gd.read("WARLORD2.EXE"), off)


def load(app, *, digital: bool) -> SoundSettings:
    """The settings at start-up: the user's OPTIONS.SND, else the game's, else "000"; in an
    interactive run a user directory without its own file starts with the music on."""
    p = app.user.path(FILE)
    fresh = not p.is_file()
    if not fresh:
        data = p.read_bytes()
    else:
        from ..formats.tables import StringTable
        rel = StringTable(app.gd.read("DATA/FILE.DAT")).get(*GAME_FILE)
        g = app.gd.path(rel)
        data = g.read_bytes() if g.is_file() else DEFAULT
        if not getattr(app.cfg, "fixed_dt", True):         # user decision: music on by default
            data = b"1" + data[1:3]
    return parse(data, digital=digital, no_voice=app.cfg.no_voice, music=music_driver(app))


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
