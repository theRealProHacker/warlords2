"""Shared test set-up: the `gamedata` marker and the `game` fixture.

Tests that read the user's game copy carry `@pytest.mark.gamedata` (those taking the `game`
fixture get it automatically, so `-m "not gamedata"` runs without the copy).  They fail when the
data directory is missing, so a broken checkout cannot pass by skipping; set
`WL2_NO_DATA=1` to skip them instead (docs/plan.md section 6.1).  The directory is
`WL2_DATA`, else `original/game/Warlrd2` below the repository root.
"""
import os
from pathlib import Path

import pytest

from warlords2.formats.gamedir import DATA_ENV, EXE_NAME, GameDir, default_root

NO_DATA_ENV = "WL2_NO_DATA"


def game_root() -> Path:
    return default_root()


def pytest_configure(config):
    config.addinivalue_line("markers", "gamedata: needs the original game files (see tests/conftest.py)")


@pytest.hookimpl(tryfirst=True)
def pytest_collection_modifyitems(config, items):
    """A test that takes the `game` fixture (directly or through another fixture) reads the
    game copy, so it is `gamedata` even unmarked; before `-m` deselects (tryfirst)."""
    for item in items:
        if "game" in getattr(item, "fixturenames", ()):
            item.add_marker(pytest.mark.gamedata)


@pytest.hookimpl(tryfirst=True)
def pytest_runtest_setup(item):
    if item.get_closest_marker("gamedata") is None or GameDir(game_root()).path(EXE_NAME).is_file():
        return
    msg = f"game data not found at {game_root()} (set {DATA_ENV}, or {NO_DATA_ENV}=1 to skip)"
    if os.environ.get(NO_DATA_ENV) == "1":
        pytest.skip(msg)
    pytest.fail(msg, pytrace=False)


@pytest.fixture(scope="session")
def game() -> str:
    return str(game_root())
