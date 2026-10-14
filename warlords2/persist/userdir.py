"""The user directory (`--user-dir`, default out/user/): everything the game writes.

The original writes OPTIONS.DAT, OPTIONS.SND, SAVEINFO.DAT, MAPINFO.DAT and SAVE/ into
its own directory; here nothing is written under `--data` (docs/plan.md section 0).
File names and formats below the root belong to the modules that write them.
"""
from __future__ import annotations

from pathlib import Path

DEFAULT_ROOT = "out/user"


class UserDir:
    def __init__(self, root: Path, data_root: Path):
        self.root = Path(root)
        r, d = self.root.resolve(), Path(data_root).resolve()
        if r == d or d in r.parents:
            raise ValueError(f"user dir {self.root} lies inside the game directory {data_root}")

    def path(self, rel: str) -> Path:
        """Path of `rel` below the root; its parent directories are created."""
        p = self.root / rel
        if ".." in Path(rel).parts or Path(rel).is_absolute():
            raise ValueError(f"path leaves the user directory: {rel!r}")
        p.parent.mkdir(parents=True, exist_ok=True)
        return p
