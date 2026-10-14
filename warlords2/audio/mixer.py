"""The one digital voice: 11000 Hz unsigned 8-bit PCM through pygame.mixer.

Evidence (docs/formats/sound.md §1): WARLORD2.EXE hands every sample unconverted to the
DIGPAK driver with frequency 11000 (155e:04e9 load, 155e:065e play: `mov word [7066h],
2AF8h`); DIGPAK has a single voice.  155e:065e waits (155e:0736, busy loop on INT 66h
AX=0689h) for a sample still playing before it starts the next one, so samples never
overlap and none is cut.  Here the game does not block: a sample started while one plays
waits in the channel's queue (one place; a later one takes that place).

The Pcm is wrapped in an in-memory WAV of its own rate and width, so SDL converts it to the
device format: it plays at 11000 Hz whatever rate the mixer runs at (M10c's music shares
the mixer through `pygame.mixer.music`; this voice is reserved channel 0).

No device (mixer init fails, e.g. no SDL audio driver): `available` is False and every call
is a no-op, the counterpart of the EXE without a digital driver (DS:37a2 = 0).
"""
from __future__ import annotations

import io
import wave

import pygame

from ..formats.sound import Pcm


class Mixer:
    def __init__(self):
        self.available = _init()
        self.channel = None
        self._sounds: dict[Pcm, pygame.mixer.Sound] = {}
        if self.available:
            pygame.mixer.set_reserved(1)
            self.channel = pygame.mixer.Channel(0)

    def sound(self, pcm: Pcm) -> pygame.mixer.Sound:
        s = self._sounds.get(pcm)
        if s is None:
            s = self._sounds[pcm] = pygame.mixer.Sound(io.BytesIO(wav_bytes(pcm)))
        return s

    def play(self, pcm: Pcm) -> None:
        """155e:065e: start the sample, after the one playing (queued)."""
        if not self.available:
            return
        s = self.sound(pcm)
        if self.channel.get_busy():
            self.channel.queue(s)
        else:
            self.channel.play(s)

    def play_now(self, pcm: Pcm) -> None:
        """Start the sample at once, dropping what plays or waits (speech, `audio.voice`)."""
        if not self.available:
            return
        self.channel.stop()
        self.channel.play(self.sound(pcm))

    def busy(self) -> bool:
        """155e:075a."""
        return bool(self.available and self.channel.get_busy())

    def stop(self) -> None:
        if self.available:
            self.channel.stop()


def wav_bytes(pcm: Pcm) -> bytes:
    """A RIFF WAV holding the Pcm unchanged (8-bit WAV data is unsigned by definition)."""
    if (pcm.width, pcm.signed) != (1, False):
        raise ValueError(f"only unsigned 8-bit PCM is played, got width {pcm.width} signed {pcm.signed}")
    b = io.BytesIO()
    with wave.open(b, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(1)
        w.setframerate(pcm.rate)
        w.writeframes(pcm.samples)
    return b.getvalue()


def _init() -> bool:
    if pygame.mixer.get_init():
        return True
    try:
        pygame.mixer.init()
    except pygame.error:
        return False
    return bool(pygame.mixer.get_init())
