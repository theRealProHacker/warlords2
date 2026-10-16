"""Tests for warlords2.formats.sound (docs/formats/sound.md) against the user's game copy.

Needs the game data (`gamedata` marker, tests/conftest.py), except where noted.
"""
from pathlib import Path

import pytest

from warlords2.formats.gamedir import GameDir, default_root
from warlords2.formats.sound import Pcm, load_8sn

gamedata = pytest.mark.gamedata


def _pcm(root):
    return sorted(p for p in (root / "SOUND").glob("*") if p.suffix.upper() == ".8SN")


def _xmi(root):
    return sorted(p for p in root.rglob("*") if p.suffix.upper() == ".XMI")


DATA = default_root()                          # only to list the parametrize ids at collection
PCM = [p.relative_to(DATA).as_posix() for p in _pcm(DATA)] if DATA.is_dir() else []


@pytest.fixture(scope="module")
def root(game):
    return Path(game)


@gamedata
def test_file_counts(root):
    assert len(_pcm(root)) == 36
    assert len(_xmi(root)) == 78               # 75 in SOUND/, 3 in START/
    assert GameDir(root).path("start/ding0.snd").is_file()


@gamedata
@pytest.mark.parametrize("rel", PCM + ["START/DING0.SND"], ids=lambda r: r.rsplit("/", 1)[-1])
def test_8sn_is_the_whole_file_at_11000_hz(root, rel):
    data = (root / rel).read_bytes()
    pcm = load_8sn(data)
    assert (pcm.rate, pcm.width, pcm.signed) == (11000, 1, False)
    assert pcm.samples == data and 0 < len(data) < 65536


def test_pcm_defaults():
    assert Pcm(samples=b"\x80") == Pcm(rate=11000, width=1, signed=False, samples=b"\x80")

