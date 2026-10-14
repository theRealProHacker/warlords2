"""Golden-frame comparison against the reference captures (docs/plan.md section 3.5).

The captures in `original/ref` are 648x488 JPEGs with a 4-px border around the 640x480
screen.  `compare` crops the border and reports the mean absolute error per channel
(0-255) per region; JPEG puts flat art at about 0.2-2 and keyed borders up to about 6
(`graphics.md` section 6).
"""
from __future__ import annotations

from pathlib import Path

import numpy as np
import pygame

from ..ui.screen import H, W

REF_DIR = Path(__file__).resolve().parents[2] / "original" / "ref"
BORDER = 4

Rect = tuple[int, int, int, int]


def _rgb(img: pygame.Surface) -> np.ndarray:
    return pygame.surfarray.array3d(img).swapaxes(0, 1).astype(np.int16)    # rows, cols, rgb


def reference(ref: str | Path) -> np.ndarray:
    path = REF_DIR / ref
    if not path.is_file():
        raise FileNotFoundError(f"reference capture {path} not found")
    a = _rgb(pygame.image.load(str(path)))
    if a.shape[:2] != (H + 2 * BORDER, W + 2 * BORDER):
        raise ValueError(f"{path}: expected {W + 2 * BORDER}x{H + 2 * BORDER}, got {a.shape[1]}x{a.shape[0]}")
    return a[BORDER:BORDER + H, BORDER:BORDER + W]


def compare(frame: pygame.Surface | str | Path, ref: str | Path, regions: dict[str, Rect]) -> dict[str, float]:
    """Region name -> MAE of `frame` (a surface or PNG path) against reference `ref`."""
    if not isinstance(frame, pygame.Surface):
        frame = pygame.image.load(str(frame))
    ours, theirs = _rgb(frame), reference(ref)
    if ours.shape != theirs.shape:
        raise ValueError(f"frame is {ours.shape[1]}x{ours.shape[0]}, reference {W}x{H}")
    out = {}
    for name, (x, y, w, h) in regions.items():
        if w <= 0 or h <= 0 or x < 0 or y < 0 or x + w > W or y + h > H:
            raise ValueError(f"region {name!r} {(x, y, w, h)} outside {W}x{H}")
        out[name] = round(float(np.abs(ours[y:y + h, x:x + w] - theirs[y:y + h, x:x + w]).mean()), 3)
    return out
