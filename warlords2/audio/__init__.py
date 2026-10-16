"""Digital sound: effects, the advisor's speech and the sound settings (M10a); the music is
`audio.music` (player), `audio.music_triggers` (host hook-up) and `audio.music_render` (M10c).

WARLORD2.EXE plays every sample through one DIGPAK voice (155e:04e9 load, 155e:065e play,
155e:0736 wait for the end, 155e:075a playing?), always at 11000 Hz (docs/formats/sound.md).
The routines that choose the samples are ovl58 (`audio.effects`, `audio.voice`); the
settings are ovl58:0bc5 / ovl33:0576 (`audio.settings`).

`audio(app)` builds the app's one `Audio` on first use (on the main thread, like
`ui.widgets.kit`); without an audio device the mixer is a no-op and speech falls back to the
captions, as the EXE does without a digital driver.
"""
from __future__ import annotations

from ..formats.sound import Pcm, load_8sn


class Audio:
    def __init__(self, app):
        from ..formats.tables import StringTable
        from .mixer import Mixer
        from .settings import load
        self.app = app
        self.files = StringTable(app.gd.read("DATA/FILE.DAT"))
        self.mixer = Mixer()
        self.settings = load(app, digital=self.mixer.available)
        self._pcm: dict[str, Pcm] = {}

    def path(self, group: int, index: int) -> str:
        """FILE.DAT (group, index) as a game-directory path."""
        return self.files.get(group, index).replace("\\", "/")

    def members(self, group: int) -> int:
        """Number of entries of a FILE.DAT group (ovl59:052f reads it for index -1)."""
        return len(self.files.groups[group])

    def pcm(self, rel: str) -> Pcm:
        p = self._pcm.get(rel)
        if p is None:
            p = self._pcm[rel] = load_8sn(self.app.gd.read(rel))
        return p

    def frames(self, pcm: Pcm) -> int:
        """Logical frames the sample plays at --tick-hz."""
        n = len(pcm.samples) * self.app.cfg.tick_hz
        return -(-n // pcm.rate)


def audio(app) -> Audio:
    """The Audio of an app, built on first use and kept as `app.audio`."""
    a = getattr(app, "audio", None)
    if a is None:
        a = app.audio = Audio(app)
    return a
