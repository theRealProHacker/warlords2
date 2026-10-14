"""`.PAL` palettes: 16 text lines to VGA DAC and RGB888 values.

Format: docs/formats/graphics.md section 1.
"""
from __future__ import annotations

import re


def pal_to_dac(v: int) -> int:
    """PAL value 0..99 -> 6-bit VGA DAC value, exactly as START.EXE computes it
    (fild v; fadd 0.5f; fmul 0.64; truncating ftol)."""
    return int((v + 0.5) * 0.64)


def dac_to_rgb8(d: int) -> int:
    """6-bit DAC -> 8-bit, the usual VGA expansion (matches the reference shots)."""
    return (d << 2) | (d >> 4)


def parse_pal(data: bytes) -> list[tuple[int, int, int]]:
    """16 lines 'RR GG BB\\r\\n' (10 bytes each, decimal 00..99) -> 16 RGB888 tuples."""
    if len(data) != 160:
        raise ValueError(f"PAL must be 160 bytes, got {len(data)}")
    out = []
    for i in range(16):
        line = data[i * 10:i * 10 + 10]
        m = re.fullmatch(rb"(\d\d) (\d\d) (\d\d)\r\n", line)
        if not m:
            raise ValueError(f"bad PAL line {i}: {line!r}")
        out.append(tuple(dac_to_rgb8(pal_to_dac(int(g))) for g in m.groups()))
    return out
