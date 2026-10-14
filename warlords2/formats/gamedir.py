"""The user's game directory: read-only, case-insensitive file access.

The original runs on DOS, so names in FILE.DAT, SCENARIO.DAT and the executable come in
any case and with backslashes (docs/formats/tables.md sections 5 and 11), while the
files on disk are whatever the user's copy has.  Nothing is ever written here.
"""
from __future__ import annotations

import hashlib
import os
from pathlib import Path

from .scenario import ScenarioHeader, parse_scenario_dat

REPO_ROOT = Path(__file__).resolve().parents[2]
DEFAULT_ROOT = "original/game/Warlrd2"          # below REPO_ROOT
DATA_ENV = "WL2_DATA"
EXE_NAME = "WARLORD2.EXE"
# v1.02, 542880 bytes (docs/research/parts/00_image.md)
EXE_SHA256 = "9f9147af74d6b616b93fa0188dfdaff162a347b0202b7d2473cad8ee88922bc2"


def default_root() -> Path:
    """Game directory from the environment (WL2_DATA, as given), else the default
    location below the repository root (absolute, so the working directory does not matter)."""
    env = os.environ.get(DATA_ENV)
    return Path(env) if env else REPO_ROOT / DEFAULT_ROOT


class GameDir:
    def __init__(self, root: Path):
        self.root = Path(root)
        self._listings: dict[Path, dict[str, str]] = {}

    def _entries(self, d: Path) -> dict[str, str]:
        """Upper-cased name -> name on disk for one directory (empty if it is none)."""
        if d not in self._listings:
            try:
                # reverse order: of names that differ only in case, the first sorted one wins
                self._listings[d] = {n.upper(): n for n in sorted(os.listdir(d), reverse=True)}
            except OSError:
                self._listings[d] = {}
        return self._listings[d]

    def path(self, rel: str) -> Path:
        """Path of `rel` ('/' or '\\\\' separated, any case) below the root.  Components
        that do not exist are kept as given, so the result may not exist."""
        p = self.root
        for part in str(rel).replace("\\", "/").split("/"):
            if part in ("", "."):
                continue
            if part == "..":
                raise ValueError(f"path leaves the game directory: {rel!r}")
            p = p / self._entries(p).get(part.upper(), part)
        return p

    def read(self, rel: str) -> bytes:
        return self.path(rel).read_bytes()

    def verify(self) -> list[str]:
        """Problems with this directory as a v1.02 game copy; empty when it is one."""
        exe = self.path(EXE_NAME)
        if not exe.is_file():
            return [f"{EXE_NAME} not found in {self.root}"]
        digest = hashlib.sha256(exe.read_bytes()).hexdigest()
        if digest != EXE_SHA256:
            return [f"{EXE_NAME} is not v1.02 (sha256 {digest}, expected {EXE_SHA256})"]
        return []

    def scenarios(self) -> list[ScenarioHeader]:
        """The bundled scenarios listed in DATA/SCENARIO.DAT, in file order."""
        return parse_scenario_dat(self.read("DATA/SCENARIO.DAT"))

