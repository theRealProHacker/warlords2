"""Golden frames: every `golden` step of tests/scripts/*.json vs original/ref (docs/plan.md 3.5, 6.1)."""
import os
from pathlib import Path

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import numpy as np  # noqa: E402
import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.debug import golden  # noqa: E402
from warlords2.debug.run import run  # noqa: E402
from warlords2.debug.script import read  # noqa: E402

SCRIPTS = Path(__file__).resolve().parent / "scripts"


def golden_scripts():
    return [p for p in sorted(SCRIPTS.glob("*.json")) if any("golden" in st for _, st in read(p)[1])]


@pytest.mark.gamedata
@pytest.mark.parametrize("script", golden_scripts(), ids=lambda p: p.stem)
def test_golden_steps_within_tolerance(script, tmp_path):
    m = run(script, tmp_path / "ev", ["--headless", "--user-dir", str(tmp_path / "u")], enforce_golden=False)
    results = [c for c in m["checks"] if c["op"] == "golden"]
    assert results, "golden steps did not run"
    for c in results:
        assert all(v <= c["max_mae"] for v in c["mae"].values()), (c["ref"], c["frame"], c["mae"])


def test_compare_crops_border_and_reports_mae_per_region(tmp_path):
    pygame.display.init()
    try:
        ref = pygame.Surface((648, 488), depth=32)
        ref.fill((200, 0, 0))
        ref.fill((0, 0, 0), (4, 4, 640, 480))
        ref.fill((90, 90, 90), (4 + 100, 4 + 50, 20, 10))
        path = tmp_path / "ref.png"                       # lossless stand-in for the JPEG
        pygame.image.save(ref, str(path))
        frame = pygame.Surface((640, 480), depth=32)
        frame.fill((0, 0, 0))
        got = golden.compare(frame, path, {"patch": (100, 50, 20, 10), "black": (0, 0, 100, 50),
                                           "half": (100, 50, 40, 10)})
        assert got == {"patch": 90.0, "black": 0.0, "half": 45.0}
        with pytest.raises(ValueError, match="outside"):
            golden.compare(frame, path, {"r": (630, 0, 20, 10)})
        with pytest.raises(ValueError, match="648x488"):
            pygame.image.save(frame, str(tmp_path / "small.png"))
            golden.compare(frame, tmp_path / "small.png", {})
        assert np.array_equal(golden.reference(path)[0, 0], [0, 0, 0])
    finally:
        pygame.display.quit()
