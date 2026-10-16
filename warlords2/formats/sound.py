"""Digital sound (`.8SN`, `DING0.SND`).

Format: docs/formats/sound.md.  The music files (XMIDI) are `formats.xmi`.
"""
from __future__ import annotations

from dataclasses import dataclass

RATE = 11000


@dataclass(frozen=True, kw_only=True)
class Pcm:
    """Headerless mono PCM as WARLORD2.EXE hands it to the DIGPAK driver."""
    rate: int = RATE          # frequency field the EXE stores (155e:05d0, 155e:06a9)
    width: int = 1            # bytes per sample
    signed: bool = False      # silence is 0x7F/0x80
    samples: bytes


def load_8sn(data: bytes) -> Pcm:
    """SOUND/*.8SN and START/DING0.SND: the whole file is the sample data, unchanged."""
    return Pcm(samples=bytes(data))

