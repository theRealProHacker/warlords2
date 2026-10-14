"""Digital sound (`.8SN`, `DING0.SND`) and the XMIDI container.

Format: docs/formats/sound.md.  The music itself is not interpreted here; `xmi_chunks`
only splits the IFF container.
"""
from __future__ import annotations

import struct
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


def xmi_chunks(data: bytes) -> list[tuple[str, bytes]]:
    """Split an XMIDI (IFF) file into its leaf chunks.

    Returns (path, payload) in file order, where path joins the type ids of the
    enclosing FORM / CAT groups and the chunk id with '/', e.g. 'XDIR/INFO',
    'XMID/XMID/TIMB', 'XMID/XMID/EVNT'.  Sizes are big-endian and chunks are padded
    to even length.  Raises ValueError unless the file is consumed exactly."""
    out: list[tuple[str, bytes]] = []

    def walk(pos: int, end: int, prefix: str) -> None:
        while pos < end:
            if pos + 8 > end:
                raise ValueError(f"truncated IFF chunk header at {pos}")
            cid = data[pos:pos + 4].decode("ascii")
            (size,) = struct.unpack_from(">I", data, pos + 4)
            body, stop = pos + 8, pos + 8 + size
            if stop > end:
                raise ValueError(f"IFF chunk {cid!r} at {pos} runs past its container")
            if cid in ("FORM", "CAT "):
                if size < 4:
                    raise ValueError(f"IFF group at {pos} has no type id")
                walk(body + 4, stop, prefix + data[body:body + 4].decode("ascii") + "/")
            else:
                out.append((prefix + cid, data[body:stop]))
            pos = stop + (size & 1)
        if pos != end:
            raise ValueError(f"IFF chunk padding runs past its container at {end}")

    walk(0, len(data), "")
    return out
