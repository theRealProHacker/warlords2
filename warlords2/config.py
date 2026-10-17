"""Command line (docs/plan.md section 3.2).  Every flag of the plan is declared here;
each is consumed by the milestone that owns the feature."""
from __future__ import annotations

import argparse
import random
import sys
from pathlib import Path

from .formats.scenario import SCENARIOS
from .paths import default_data, default_music_cache, default_user_dir, frozen, frozen_data


def _frames(s: str) -> list[int]:
    return [int(f) for f in s.split(",") if f]


def _positive(s: str) -> int:
    n = int(s)
    if n < 1:
        raise argparse.ArgumentTypeError(f"must be >= 1, got {n}")
    return n


# accepted so scripts and docs can use them, but no milestone has implemented them yet
NOT_IMPLEMENTED = {"state_hash_at": "--state-hash-at"}


def build_parser() -> argparse.ArgumentParser:
    prog = "warlords2" if Path(sys.argv[0]).stem == "warlords2" else "python -m warlords2"
    p = argparse.ArgumentParser(prog=prog,
                                description="Warlords II (1993, DOS v1.02) on the user's own game files")
    p.add_argument("--data", type=Path, default=None,
                   help="game directory, read-only (env WL2_DATA; default original/game/Warlrd2 "
                        "in a checkout, required when installed)")
    p.add_argument("--user-dir", type=Path, default=default_user_dir(),
                   help="options, sound settings, shortcuts, saves, map slots (default %(default)s)")
    p.add_argument("--scenario", choices=SCENARIOS, help="skip the menus and start this scenario")
    p.add_argument("--controls", help="with --scenario: H(uman)/C(omputer) for each of the 8 sides, "
                                      "e.g. HHCCCCCC (default HCCCCCCC)")
    p.add_argument("--levels", help="with --scenario: computer level digit per side, 0-2 (card letter "
                                    "K/L/W) or 3 side off, e.g. 22220000 (default 00000000)")
    p.add_argument("--options", help="with --scenario: the 10 game option words, comma separated "
                                     "(default all 0)")
    p.add_argument("--seed", type=int, help="engine seed (default: random, printed)")
    p.add_argument("--script", type=Path, help="frame-indexed input script; implies fixed dt")
    p.add_argument("--shot-at", type=_frames, default=[], metavar="F[,F...]",
                   help="PNG of the presented frame at these logical frames")
    p.add_argument("--record", type=Path, metavar="FILE.mp4", help="record frames to MP4")
    p.add_argument("--record-fps", type=_positive, help="recording rate (default --tick-hz)")
    p.add_argument("--scale", type=_positive, default=2, help="window scale (default 2)")
    p.add_argument("--fullscreen", action="store_true",
                   help="full screen at the desktop resolution, the largest integer scale that fits, "
                        "black borders (Alt+Enter toggles at run time)")
    p.add_argument("--frameless", action="store_true", help="window without a title bar, at --scale")
    p.add_argument("--headless", action="store_true", help="dummy SDL video/audio, fixed dt")
    p.add_argument("--tick-hz", type=_positive, default=60, help="logical tick rate (default 60)")
    p.add_argument("--no-intro", action="store_true", help="skip the intro (the 'n' switch)")
    p.add_argument("--alt-names", action="store_true", help="ARMYTYP2.DAT names (the 's' switch)")
    p.add_argument("--no-voice", action="store_true", help="no talking advisor (the 'v' switch)")
    p.add_argument("--music", choices=["on", "off"], default="on",
                   help="off: no music driver (DS:37a3 = 0: the Settings music box disabled, no music "
                        "dice); on (default): SOUND.DAT decides, OPTIONS.SND switches it")
    p.add_argument("--music-variant", choices=["opl", "gm"], default="opl",
                   help="rendered arrangement: opl = the S files (FM, default), gm = the R files")
    p.add_argument("--music-cache", type=Path, default=default_music_cache(),
                   help="rendered music (python -m warlords2.audio.music_render; default %(default)s); "
                        "without a current render there, the bundled warlords2/data/music/ plays")
    p.add_argument("--allow-unverified", action="store_true",
                   help="permit Unverified constants, with a logged warning each")
    p.add_argument("--state-hash-at", type=_frames, default=[], metavar="F[,F...]",
                   help="print the engine state hash at these frames")
    p.add_argument("--probe", metavar="NAME",
                   help="debug: boot into a test-only state of debug/probe_states.py (e.g. probe_backdrop)")
    return p


def given_flags(argv: list[str] | None) -> set[str]:
    """Destinations of the flags present on the command line (not left at their default)."""
    p, unset = build_parser(), object()
    p.set_defaults(**{a.dest: unset for a in p._actions})
    return {k for k, v in vars(p.parse_args(argv)).items() if v is not unset}


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    p = build_parser()
    cfg = p.parse_args(argv)
    for dest in sorted(given_flags(argv) & set(NOT_IMPLEMENTED)):
        print(f"{NOT_IMPLEMENTED[dest]}: accepted but not implemented yet; ignored", file=sys.stderr)
    cfg.data = cfg.data or default_data()
    if cfg.data is None and frozen():                 # the bundle (packaging/): never in a checkout
        cfg.data = frozen_data(cfg.user_dir, interactive=not (cfg.headless or cfg.script))
    if cfg.data is None:
        p.error("no game directory: pass --data DIR or set WL2_DATA to your own Warlords II "
                "(DOS) directory, the one containing WARLORD2.EXE")
    if cfg.seed is None:
        cfg.seed = random.SystemRandom().randrange(2 ** 31)
        print(f"seed {cfg.seed}")
    cfg.record_fps = cfg.record_fps or cfg.tick_hz
    cfg.fixed_dt = bool(cfg.script or cfg.headless)
    return cfg
