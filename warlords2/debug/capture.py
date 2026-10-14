"""PNG frame captures of `Screen.present_surface` (docs/plan.md section 3.3).

A frame's identity is the SHA-256 of its RGB bytes (`frame_sha256`): the same digest is
computed for the presented surface, for a recording frame and for a PNG read back from
disk, so "recorded frame k equals shot k" is a byte comparison.
"""
from __future__ import annotations

import hashlib
from pathlib import Path

import pygame


def frame_sha256(s: pygame.Surface) -> str:
    return hashlib.sha256(pygame.image.tobytes(s, "RGB")).hexdigest()


def png_sha256(path: Path) -> str:
    """`frame_sha256` of a PNG as decoded from disk."""
    return frame_sha256(pygame.image.load(str(path)))


class Capture:
    """Writes `<out_dir>/<name>.png` and remembers what it wrote, for the manifest."""

    def __init__(self, out_dir: Path, shot_at: list[int] = ()):
        self.out_dir = Path(out_dir)
        self.shot_at = set(shot_at)
        self.shots: list[dict] = []

    def shot(self, s: pygame.Surface, name: str, frame: int) -> dict:
        self.out_dir.mkdir(parents=True, exist_ok=True)
        path = self.out_dir / f"{name}.png"
        if any(sh["name"] == name for sh in self.shots):
            raise ValueError(f"shot {name!r} taken twice")
        pygame.image.save(s, str(path))
        digest = frame_sha256(s)
        if png_sha256(path) != digest:
            raise RuntimeError(f"{path}: PNG does not decode to the captured frame")
        rec = {"name": name, "frame": frame, "path": str(path.resolve()), "sha256": digest}
        self.shots.append(rec)
        return rec

    def after_frame(self, s: pygame.Surface, frame: int) -> None:
        """--shot-at: `frame_<F>.png` at the requested logical frames."""
        if frame in self.shot_at:
            self.shot(s, f"frame_{frame}", frame)
