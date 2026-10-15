"""`manifest.json` of an evidence directory (docs/plan.md sections 3.3 and 6.3).

Records what a reviewer needs to trust the frames without rerunning the session: git
commit, EXE hash, seed, script hash, the command line, per-shot SHA-256, the video
segments (per-frame SHA-256; each decoded MP4 frame nearest to its own, with PSNR), check
results (with the `state_hash` steps' hashes), and the final engine state hash (null without a
game state).
"""
from __future__ import annotations

import hashlib
import json
import subprocess
from pathlib import Path

from ..formats.gamedir import EXE_NAME, GameDir


def git_commit() -> str | None:
    """HEAD, with `+dirty` for uncommitted changes; None outside git or before the first commit."""
    root = Path(__file__).resolve().parents[2]
    try:
        head = subprocess.run(["git", "rev-parse", "HEAD"], cwd=root, capture_output=True, text=True, check=True)
        dirty = subprocess.run(["git", "status", "--porcelain"], cwd=root, capture_output=True, text=True, check=True)
    except (OSError, subprocess.CalledProcessError):
        return None
    return head.stdout.strip() + ("+dirty" if dirty.stdout.strip() else "")


def sha256_file(path: Path) -> str:
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def manifest(*, gd: GameDir, script: Path, argv: list[str], seed: int, shots: list[dict],
             segments: list[dict], checks: list[dict], frames: int, error: str | None,
             state_hash: str | None = None) -> dict:
    exe = gd.path(EXE_NAME)
    return {
        "git_commit": git_commit(),
        "exe_sha256": sha256_file(exe) if exe.is_file() else None,
        "seed": seed,
        "script": str(script),
        "script_sha256": sha256_file(script),
        "argv": argv,
        "frames": frames,
        "shots": shots,
        "segments": segments,
        "checks": checks,
        "engine_state_hash": state_hash,
        "error": error,
    }


def write(out_dir: Path, data: dict) -> Path:
    path = Path(out_dir) / "manifest.json"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=1) + "\n")
    return path
