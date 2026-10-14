"""Tests for warlords2.formats.gamedir: case-insensitive, read-only access to the game copy."""
from pathlib import Path

import pytest

from warlords2.formats import gamedir
from warlords2.formats.gamedir import GameDir



def test_case_insensitive_lookup(tmp_path):
    (tmp_path / "Data").mkdir()
    (tmp_path / "Data" / "Scenario.DAT").write_bytes(b"x")
    gd = GameDir(tmp_path)
    for rel in ("DATA/SCENARIO.DAT", "data\\scenario.dat", "./Data//Scenario.DAT"):
        assert gd.path(rel) == tmp_path / "Data" / "Scenario.DAT"
        assert gd.read(rel) == b"x"
    assert gd.path("DATA/missing.dat") == tmp_path / "Data" / "missing.dat"
    with pytest.raises(FileNotFoundError):
        gd.read("nope/none.dat")
    with pytest.raises(ValueError):
        gd.path("../outside")


def test_verify_reports_problems(tmp_path):
    assert "not found" in GameDir(tmp_path).verify()[0]
    (tmp_path / "warlord2.exe").write_bytes(b"not the game")
    problems = GameDir(tmp_path).verify()
    assert len(problems) == 1 and "not v1.02" in problems[0]


def test_default_root(monkeypatch):
    monkeypatch.delenv(gamedir.DATA_ENV, raising=False)
    assert gamedir.default_root() == gamedir.REPO_ROOT / "original/game/Warlrd2"
    assert gamedir.default_root().is_absolute()
    monkeypatch.setenv(gamedir.DATA_ENV, "/some/where")
    assert gamedir.default_root() == Path("/some/where")


@pytest.mark.gamedata
def test_real_copy(game):
    gd = GameDir(game)
    assert gd.verify() == []
    headers = gd.scenarios()
    assert len(headers) == 6
    for h in headers:                            # SCENARIO.DAT names resolve to directories
        assert gd.path(f"{h['dir']}/{h['dir']}.SCN").is_file()
