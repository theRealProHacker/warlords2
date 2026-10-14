"""Scripted run with captures, recording and manifest (docs/plan.md sections 3.1 and 3.3).

    python -m warlords2.debug.run tests/scripts/<name>.json --evidence out/evidence/<milestone>/<name>/ [flags]

Flags after the script are `python -m warlords2` flags (e.g. `--headless`, `--shot-at`,
`--record`, `--record-fps`); the script's own `args` come first.  The directory gets
`frames/<shot>.png`, `run_<k>.mp4` (or the `--record` path) and `manifest.json`.  This
module owns the loop of section 3.1, so it calls `capture.after_frame` after each
presented frame.

Runs are hermetic: without `--user-dir` (in the script's args or the flags) each run gets
a fresh empty user directory, removed afterwards, so one script's OPTIONS.DAT or saves never
reach the next.
"""
from __future__ import annotations

import argparse
import re
import shutil
import sys
import tempfile
from pathlib import Path

from ..app import App
from ..config import parse_args
from . import evidence, script as script_mod
from .capture import Capture
from .recorder import Recorder

STALE = ("frames/*.png", "run_*.mp4", "manifest.json")


def run(script: Path, out_dir: Path, flags: list[str] = (), enforce_golden: bool = True) -> dict:
    """Run `script` and write its evidence to `out_dir`; returns the manifest.  A failed
    check still writes the manifest (with `error`) and the recording, then re-raises."""
    script, out_dir = Path(script), Path(out_dir)
    args, _ = script_mod.read(script)
    argv = [*args, *flags, "--script", str(script)]
    own_user = None
    if not any(a == "--user-dir" or a.startswith("--user-dir=") for a in argv):
        own_user = tempfile.mkdtemp(prefix="wl2-user-")
        argv += ["--user-dir", own_user]
    try:
        return _run(script, out_dir, argv, enforce_golden)
    finally:
        if own_user is not None:
            shutil.rmtree(own_user, ignore_errors=True)


def _run(script: Path, out_dir: Path, argv: list[str], enforce_golden: bool) -> dict:
    cfg = parse_args(argv)
    if cfg.tick_hz % cfg.record_fps:
        raise SystemExit(f"--record-fps {cfg.record_fps} must divide --tick-hz {cfg.tick_hz}")
    for pattern in STALE:                        # never mix frames of two runs
        for p in out_dir.glob(pattern):
            p.unlink()
    if cfg.record:                               # --record elsewhere: its old segments too
        seg = re.compile(re.escape(cfg.record.stem) + r"_\d+\.mp4")
        for p in cfg.record.resolve().parent.glob(f"{cfg.record.stem}_*.mp4"):
            if seg.fullmatch(p.name):
                p.unlink()
    capture = Capture(out_dir / "frames", cfg.shot_at)
    recorder = Recorder(cfg.record or out_dir / "run.mp4", cfg.record_fps, cfg.tick_hz // cfg.record_fps)
    app = App(cfg)
    error, src = None, None
    try:
        src = script_mod.load(script, app, capture, enforce_golden)
        while app.running and app.frame <= src.last_frame:
            f = app.frame
            src.before_frame(f)
            app.step()
            present = app.screen.present_surface
            recorder.after_frame(present, f)
            capture.after_frame(present, f)
            src.after_frame(f)
    except BaseException as e:
        error = f"{type(e).__name__}: {e}"
        raise
    finally:
        try:
            recorder.close()
        except BaseException as e:
            error = error or f"{type(e).__name__}: {e}"
            raise
        finally:
            m = evidence.manifest(gd=app.gd, script=script, argv=argv, seed=cfg.seed, shots=capture.shots,
                                  segments=recorder.segments, checks=src.results if src else [],
                                  frames=app.frame, error=error)
            evidence.write(out_dir, m)
            app.close()
    return m


def main(argv: list[str] | None = None) -> None:
    p = argparse.ArgumentParser(prog="python -m warlords2.debug.run", description=__doc__.split("\n\n")[0])
    p.add_argument("script", type=Path)
    p.add_argument("--evidence", type=Path, help="output directory (default out/evidence/<script name>/)")
    ns, flags = p.parse_known_args(argv)
    out = ns.evidence or Path("out/evidence") / ns.script.stem
    try:
        m = run(ns.script, out, flags)
    except script_mod.ScriptAssertion as e:
        print(f"FAILED: {e} (evidence in {out})", file=sys.stderr)
        raise SystemExit(1) from None
    seg = ", ".join(f"{s['path']} ({s['frames']} frames"
                    f"{'' if s['nearest_ok'] else ', decoded frames not nearest: ' + str(s['not_nearest'])})"
                    for s in m["segments"])
    print(f"{m['frames']} frames, {len(m['shots'])} shots, {len(m['checks'])} checks passed; {seg}; "
          f"{out / 'manifest.json'}")


if __name__ == "__main__":
    main()
