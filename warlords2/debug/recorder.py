"""MP4 recording of the presented frames with pygame-screen-record (docs/plan.md 3.3, 3.4).

One `Recording(fps, (640, 480), 0)` per segment of `SEGMENT` frames, saved as
`<stem>_<k>.mp4` next to the requested path and listed in the manifest (no join).
Library caveats handled here, without touching the library:

* S6  `Recording.add_frame` with compress 0 stores the Surface it is given, so every
      frame is added as `present_surface.copy()`, on the main thread (`ScreenRecorder`
      and its wall-clock thread, S6b, are not used).
* S7  `mp4` maps to `h264`, which this OpenCV build cannot open, and the library never
      checks `VideoWriter.isOpened()`: `add_codec("mp4", FOURCC)` once, and every saved
      file is decoded again and its frame count compared with the frames given.
* S7b `RecordingSaver` does `os.chdir` in a thread: `Recording.save(abs_path)` is called
      directly.

mp4v is lossy and stores 4:2:0 chroma (on 16-colour art that alone caps PSNR near 26 dB),
so a decoded frame is not checked against a floor: decoded frame k must be nearest
(highest PSNR) to frame k among the distinct frames of its segment (`nearest_ok`; ties
with another frame count as nearest).  Exact identity is checked on the in-memory frames
by SHA-256; the PNG of a shot has the same digest (`capture.frame_sha256`).
"""
from __future__ import annotations

from pathlib import Path

import cv2
import numpy as np
import pygame
from pygame_screen_record import Recording, add_codec

from ..ui.screen import H, W
from .capture import frame_sha256

FOURCC = "mp4v"
SEGMENT = 100                                  # frames per file, ~123 MB in memory

add_codec("mp4", FOURCC)                       # S7


class RecorderError(RuntimeError):
    pass


def to_bgr(s: pygame.Surface) -> np.ndarray:
    """A frame as OpenCV sees it (rows first, BGR), the way the library writes it."""
    return cv2.cvtColor(pygame.surfarray.array3d(s).swapaxes(0, 1), cv2.COLOR_RGB2BGR)


def read_mp4(path: Path) -> list[np.ndarray]:
    """Every decoded frame (BGR); frames are counted by decoding, not from metadata."""
    cap = cv2.VideoCapture(str(path))
    out = []
    try:
        while True:
            ok, f = cap.read()
            if not ok:
                return out
            out.append(f)
    finally:
        cap.release()


def nearest_frames(frames: list, digests: list[str], decoded: list[np.ndarray]) -> tuple[list[bool], list[float]]:
    """Per decoded frame k: is frame k (a Surface) the nearest of the distinct `frames`,
    and the PSNR to it.  `frames` may be Surfaces or BGR arrays."""
    distinct = {}
    for s, h in zip(frames, digests):
        if h not in distinct:
            distinct[h] = to_bgr(s) if isinstance(s, pygame.Surface) else s
    nearest, psnr = [], []
    for h, f in zip(digests, decoded):
        scores = {d: cv2.PSNR(b, f) for d, b in distinct.items()}
        nearest.append(scores[h] >= max(scores.values()))
        psnr.append(round(min(scores[h], 99.0), 2))
    return nearest, psnr


class Recorder:
    def __init__(self, path: Path, fps: int, every: int = 1):
        path = Path(path).resolve()                       # S7b: absolute path, no chdir
        if path.suffix != ".mp4":
            raise ValueError(f"recording must be .mp4, got {path}")
        self.dir, self.stem = path.parent, path.stem
        self.fps, self.every = fps, every
        self.recording = Recording(fps, (W, H), 0)
        self.first_frame: int | None = None
        self.segments: list[dict] = []

    def after_frame(self, s: pygame.Surface, frame: int) -> None:
        if frame % self.every:
            return
        if self.first_frame is None:
            self.first_frame = frame
        self.recording.add_frame(s.copy())                # S6
        if self.recording.frame_number == SEGMENT:
            self._save()

    def close(self) -> list[dict]:
        if self.recording.frame_number:
            self._save()
        return self.segments

    def _save(self) -> None:
        rec = self.recording
        path = self.dir / f"{self.stem}_{len(self.segments)}.mp4"
        self.dir.mkdir(parents=True, exist_ok=True)
        path.unlink(missing_ok=True)
        rec.save(str(path))                               # S7b
        got = read_mp4(path) if path.is_file() else []
        if len(got) != rec.frame_number:                  # S7: a failed writer is silent
            raise RecorderError(f"{path}: wrote {rec.frame_number} frames, reads back {len(got)}")
        digests = [frame_sha256(s) for s in rec.frames]
        nearest, psnr = nearest_frames(rec.frames, digests, got)
        self.segments.append({
            "path": str(path), "codec": FOURCC, "fps": self.fps,
            "first_frame": self.first_frame, "frame_step": self.every, "frames": rec.frame_number,
            "frame_sha256": digests, "nearest_ok": all(nearest),
            "not_nearest": [k for k, ok in enumerate(nearest) if not ok], "psnr": psnr})
        self.recording = Recording(self.fps, (W, H), 0)
        self.first_frame = None
