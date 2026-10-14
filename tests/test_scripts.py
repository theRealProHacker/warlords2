"""Every tests/scripts/*.json runs headless and passes its assert_* steps (docs/plan.md 3.3, 6.1).

Golden steps are evaluated but not enforced here (tests/test_golden.py does that).  Each
shot must also be the recorded frame of the same logical frame, byte for byte, and every
decoded MP4 frame must be nearest to its own frame.
"""
import os
from pathlib import Path

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pytest  # noqa: E402

from warlords2.debug.capture import png_sha256  # noqa: E402
from warlords2.debug.recorder import read_mp4  # noqa: E402
from warlords2.debug.run import run  # noqa: E402
from warlords2.debug.script import read  # noqa: E402

SCRIPTS = sorted((Path(__file__).resolve().parent / "scripts").glob("*.json"))


def test_there_are_scripts():
    assert SCRIPTS


@pytest.mark.gamedata
@pytest.mark.parametrize("script", SCRIPTS, ids=lambda p: p.stem)
def test_script(script, tmp_path):
    _, steps = read(script)
    m = run(script, tmp_path / "ev", ["--headless", "--user-dir", str(tmp_path / "u")], enforce_golden=False)
    asserts = [c for c in m["checks"] if c["op"].startswith("assert_")]
    assert len(asserts) == sum(1 for _, st in steps if any(k.startswith("assert_") for k in st))
    assert all(c["ok"] for c in asserts)
    assert len(m["shots"]) == sum(1 for _, st in steps if "shot" in st)
    frames = {}
    for seg in m["segments"]:
        assert len(read_mp4(seg["path"])) == seg["frames"]
        assert seg["nearest_ok"], seg["not_nearest"]          # decoded frame k nearest to frame k
        for k, digest in enumerate(seg["frame_sha256"]):
            frames[seg["first_frame"] + k * seg["frame_step"]] = digest
    assert len(frames) == m["frames"]
    for sh in m["shots"]:
        assert frames[sh["frame"]] == sh["sha256"] == png_sha256(sh["path"])


@pytest.mark.gamedata
def test_runs_are_hermetic_without_user_dir(tmp_path):
    """Without --user-dir each run gets its own empty user dir, removed afterwards: the
    OPTIONS.DAT m2b_begin writes at Begin (ovl57:2289) never reaches m2b_setup."""
    scripts = Path(__file__).resolve().parent / "scripts"
    dirs = []
    for name in ("m2b_begin", "m2b_setup"):
        m = run(scripts / f"{name}.json", tmp_path / name, ["--headless"], enforce_golden=False)
        assert all(c["ok"] for c in m["checks"] if c["op"].startswith("assert_"))
        argv = m["argv"]
        dirs.append(Path(argv[len(argv) - 1 - argv[::-1].index("--user-dir") + 1]))
    assert dirs[0] != dirs[1] and not any(d.exists() for d in dirs)
