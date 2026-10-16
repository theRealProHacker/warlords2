"""Music playback: the cached WAV of the track the engine picked (docs/plan.md M10c).

The engine decides what plays (`rules.music`: ovl58:0000, its dice, the run's words
`model.music.MusicWords`); this player only sounds it, through `pygame.mixer.music` (one
stream, apart from the digital voice on reserved channel 0, `audio.mixer`).

Evidence (EL §9.8 addition "Music"; out/asm/res_155e.asm):
* the file: FILE.DAT (group, index) e.g. INT12.XMI with the driver's prefix (155e:032f: s / m /
  r) in SOUND\\ (FILE.DAT (7, 0)); here `--music-variant opl|gm` = prefix S / R and the cache
  stem of `audio.music_render` (out/music/SINT12.wav; `--music-cache`);
* 155e:0412(seq, flags): a start stops what plays (0466) first: a mode change is a hard cut,
  no fade (155e:04c3 has no caller), no segue (res_0000:0c5d has no caller);
* 155e:02ab, the poller: a sequence that has ended (04a8 == 0) is restarted from the start
  when its repeat flag (DS:37a9 bit 0) is set, no new die, else stopped.  It runs only on the
  idle passes of the event loop 08a9:0081 (event type 0) and once after each computer side
  (ovl61:2206, the present point "loop_check").  So a looping track restarts at the first poll
  after its sequence end (`end_tick` / 120 s, the WAV's release tail is cut); nothing restarts
  inside a modal wait or a computer side's turn;
* mode 2 (the computer phase) plays once (repeat flag 0): the poll after its end stops it, and
  the EXE re-rolls at the next ovl61:21d4.  Register X32 (model O1): the engine still takes it
  as playing there, so no re-roll; the user decision for that case is that the player restarts
  the same track at that 21d4 ("side"), without a die (audio only).  After the last computer
  side it stays silent through the "Turn" pop-up, as in the EXE;
* Settings off (ovl33:0576(0) -> 155e:0782) and Quit (0a4c:02b5 -> 155e:02a0) stop at once.

Timing is the logical frame clock (`App.frame`, --tick-hz): a scripted run is reproducible.  A
track's length is its sequence's End-Of-Track tick from the game's own XMI file
(`formats.xmi.sequence_ticks`), so it does not depend on the cache.

No cache, or a stale one (`audio.music_render.stale`: no manifest entry, no WAV, another
renderer version or other XMI / MIDPAK.AD bytes): the music driver stays present for the rules
(user decision: the same dice as with the cache), playback is silent, and one line on stderr
names the command that renders it.  The log (`MusicLog`) is the same either way.
"""
from __future__ import annotations

import json
import sys
from dataclasses import dataclass
from pathlib import Path

from ..formats.xmi import QUANT_RATE, sequence_ticks
from ..model import events as E
from ..rules import music as MU
from . import music_render as R

MUSIC_GROUPS = range(8, 20)          # FILE.DAT groups of the music modes (rules.constants.music)
DIR_ENTRY = (7, 0)                   # FILE.DAT (7, 0) = SOUND\ (ovl58:0050)


def variant(cfg) -> str:
    return getattr(cfg, "music_variant", "opl") or "opl"


def cache_dir(cfg) -> Path:
    d = getattr(cfg, "music_cache", None)
    return Path(d) if d is not None else R.DEFAULT_OUT


def track_name(files, group: int, index: int) -> str:
    """FILE.DAT (group, index) without its extension, e.g. (9, 1) -> 'INT21'."""
    return files.get(group, index).rsplit(".", 1)[0].upper()


def music_stems(files, var: str) -> list[str]:
    """Cache stems of every entry of the music groups 8..19."""
    return sorted({R.stem(track_name(files, g, i), var)
                   for g in MUSIC_GROUPS for i in range(len(files.groups[g]))})


class PygameMusic:
    """The backend: `pygame.mixer.music` (initialised by `audio.mixer`)."""

    def __init__(self):
        from . import mixer
        self.available = mixer._init()

    def play(self, path: Path) -> None:
        import pygame
        if self.available:
            pygame.mixer.music.load(str(path))
            pygame.mixer.music.play()

    def stop(self) -> None:
        import pygame
        if self.available:
            pygame.mixer.music.stop()


class MusicLog:
    """The run's music record: one dict per ovl58:0000 call (`kind` "call": frame, site, mode,
    outcome off / same / silent / play, group, index, dice, wav, loop) and per player action
    (`kind` "start" / "restart" / "stop" / "end": a one-shot track stopped by the poll)."""

    def __init__(self):
        self.records: list[dict] = []

    def add(self, **rec) -> None:
        self.records.append(rec)

    def mark(self) -> int:
        return len(self.records)

    def roll_back(self, mark: int) -> None:
        """A refused command or a failed turn-loop run put the dice and the words back
        (`rules.engine.apply`, `Game.run_failed`): its "call" records after `mark` go too; what
        the player did (start / restart / stop) stays, it was heard."""
        self.records[mark:] = [r for r in self.records[mark:] if r["kind"] != "call"]

    def lines(self) -> str:
        return "".join(json.dumps(r, sort_keys=True) + "\n" for r in self.records)

    def write(self, path: Path) -> Path:
        path = Path(path)
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(self.lines())
        return path


@dataclass
class Playing:
    stem: str
    mode: int
    group: int
    index: int
    loop: int
    started: int                     # logical frame of the (re)start
    frames: int                      # the sequence's length in frames
    ended: bool = False              # a one-shot track the poll found ended (155e:02ab 02e7: stopped)


class MusicPlayer:
    def __init__(self, app, backend=None, err=None):
        from ..formats.tables import StringTable
        self.app = app
        self.words = app.music_words
        self.log: MusicLog = app.music_log
        self.files = StringTable(app.gd.read("DATA/FILE.DAT"))
        self.variant = variant(app.cfg)
        self.prefix = R.VARIANT_PREFIX[self.variant]
        self.dir = cache_dir(app.cfg)
        self.seen = self.words.starts            # starts already sounded (or skipped)
        self.current: Playing | None = None
        self._lengths: dict[str, int] = {}
        self.silent = False
        self.cache_problem = None
        if self.words.driver:
            stale = R.stale(R.load_manifest(self.dir), app.gd, music_stems(self.files, self.variant), self.dir)
            if stale:
                self.silent = True
                self.cache_problem = stale
                print("music: no current render of %s in %s (%d tracks); run `%s` - playing silently"
                      % (self.variant, self.dir, len(stale), R.COMMAND), file=err or sys.stderr)
        self.backend = backend if backend is not None else PygameMusic()

    # ------------------------------------------------------------------ tracks

    def stem(self, group: int, index: int) -> str:
        return R.stem(track_name(self.files, group, index), self.variant)

    def length_frames(self, stem: str) -> int:
        """The sequence's length (End-Of-Track tick / 120 Hz) in logical frames, at least one."""
        n = self._lengths.get(stem)
        if n is None:
            d = self.files.get(*DIR_ENTRY).replace("\\", "/").rstrip("/")
            ticks = sequence_ticks(self.app.gd.read(f"{d}/{stem}.XMI"))
            hz = self.app.cfg.tick_hz
            n = self._lengths[stem] = max(1, -(-ticks * hz // QUANT_RATE))
        return n

    def _sound(self, stem: str) -> None:
        if not self.silent:
            self.backend.play(self.dir / f"{stem}.wav")

    # ------------------------------------------------------------------ actions

    def start(self, info: dict, why: str = "event") -> None:
        """155e:0412: stop what plays (a hard cut), load and play the track of `info`
        (MusicStarted's {mode, group, index, loop, site})."""
        if self.current is not None:
            self.backend.stop()
        stem = self.stem(info["group"], info["index"])
        self.current = Playing(stem, info["mode"], info["group"], info["index"], info["loop"],
                               self.app.frame, self.length_frames(stem))
        self._sound(stem)
        self.log.add(kind="start", frame=self.app.frame, mode=info["mode"], group=info["group"],
                     index=info["index"], wav=f"{stem}.wav", loop=info["loop"], site=info.get("site"), via=why)

    def stop(self, why: str) -> None:
        if self.current is None:
            return
        self.backend.stop()
        self.log.add(kind="stop", frame=self.app.frame, wav=f"{self.current.stem}.wav", why=why)
        self.current = None

    def events(self, events) -> None:
        """Sound the MusicStarted events of a command (or a pre-game call) in order: each is the
        next start the player has not sounded yet; one already caught up by `sync` is skipped."""
        for ev in events or ():
            if isinstance(ev, E.MusicStarted) and self.words.starts > self.seen:
                self.seen += 1
                self.start(ev.info)

    def sync(self, why: str = "sync") -> None:
        """Catch up with the words (a start on the runner thread, ovl61:21d4 before "side"):
        a grown `starts` is a new sequence, `track` its entry; a stopped sequence stops."""
        w = self.words
        if w.starts > self.seen:
            self.seen = w.starts
            g, i = w.track
            self.start({"mode": w.mode, "group": g, "index": i, "loop": w.loop, "site": None}, why)
        elif self.current is not None and not MU.still_playing(w):
            self.stop("stopped")

    def rolled_back(self) -> None:
        """The words were put back (`serialize.restore`: a failed turn-loop run, `Game.run_failed`):
        sound what they hold now."""
        w = self.words
        self.seen = min(self.seen, w.starts)
        if not MU.still_playing(w) or w.track is None:
            return self.stop("rolled back")
        cur = self.current
        if cur is None or (cur.group, cur.index, cur.mode) != (*w.track, w.mode):
            g, i = w.track
            self.start({"mode": w.mode, "group": g, "index": i, "loop": w.loop, "site": None}, "rolled back")

    def ahead(self, why: str) -> None:
        """Sound the one start not sounded yet before its event is reached (the temple menu)."""
        if self.words.starts == self.seen + 1:
            self.sync(why)

    def poll(self, where: str = "idle") -> None:
        """155e:02ab: an ended sequence with the repeat flag starts again from its beginning, no
        die; one without it (mode 2) is stopped (02e7 155e:0466) and stays silent."""
        cur = self.current
        if cur is None:
            return
        if not MU.still_playing(self.words):
            return self.stop("stopped")
        f = self.app.frame
        if cur.ended or f - cur.started < cur.frames:
            return
        self.backend.stop()
        if not cur.loop:
            cur.ended = True
            self.log.add(kind="end", frame=f, wav=f"{cur.stem}.wav", mode=cur.mode, at=where)
            return
        self._restart(cur, where)

    def side(self, at: str = "ovl61:21d4") -> None:
        """The present point "side", right after ovl61:21d4's ovl58:0000(2): a track that call
        started sounds now (`sync`).  When the call found mode 2 "still playing" (register X32,
        model O1) but its one-shot sequence has ended, the EXE would roll a new track here; by
        the user decision the player restarts the same one instead, no die."""
        before = self.seen
        self.sync(at)
        cur = self.current
        if (self.seen == before and cur is not None and not cur.loop and MU.still_playing(self.words)
                and (cur.ended or self.app.frame - cur.started >= cur.frames)):
            self.backend.stop()
            self._restart(cur, at)

    def _restart(self, cur: Playing, where: str) -> None:
        f = self.app.frame
        cur.started, cur.ended = f, False
        self._sound(cur.stem)
        self.log.add(kind="restart", frame=f, wav=f"{cur.stem}.wav", loop=cur.loop, mode=cur.mode, at=where)

    def close(self) -> None:
        self.stop("quit")

    def summary(self) -> dict:
        """The evidence manifest's music entry."""
        import hashlib
        text = self.log.lines()
        return {"records": len(self.log.records), "log_sha256": hashlib.sha256(text.encode()).hexdigest(),
                "variant": self.variant, "cache": str(self.dir), "silent": self.silent,
                "stale": self.cache_problem, "on": self.words.on, "driver": self.words.driver}


# ---------------------------------------------------------------------- evidence timeline


def render_timeline(records: list[dict], frames: int, tick_hz: int, cache: Path, out: Path) -> Path:
    """`music.wav` of a run, offline, from its log: each start / restart places its WAV at its
    frame, cut at the next start, restart or stop (a hard cut, as the player does) or at the
    run's end.  For the user checkpoint only (not in the tests); needs the cache."""
    import numpy as np
    import wave
    rate, ch = R.DEFAULT_RATE, 2
    total = int(round(frames * rate / tick_hz))
    mix = np.zeros((total, ch), dtype=np.int16)
    events = [r for r in records if r["kind"] in ("start", "restart", "stop", "end")]
    for k, r in enumerate(events):
        if r["kind"] in ("stop", "end"):
            continue
        a = int(round(r["frame"] * rate / tick_hz))
        b = int(round(events[k + 1]["frame"] * rate / tick_hz)) if k + 1 < len(events) else total
        with wave.open(str(Path(cache) / r["wav"]), "rb") as w:
            data = np.frombuffer(w.readframes(w.getnframes()), dtype=np.int16).reshape(-1, w.getnchannels())
        if data.shape[1] == 1:
            data = np.repeat(data, ch, axis=1)
        n = max(0, min(b, total) - a, 0)
        n = min(n, len(data))
        mix[a:a + n] = data[:n]
    with wave.open(str(out), "wb") as w:
        w.setnchannels(ch)
        w.setsampwidth(2)
        w.setframerate(rate)
        w.writeframes(mix.tobytes())
    return Path(out)


def main(argv=None) -> None:
    """python -m warlords2.audio.music EVIDENCE_DIR: music.wav from music.jsonl and, when
    ~/.local/bin/ffmpeg (or ffmpeg on PATH) exists, run_music.mp4 = the run's segments with it."""
    import argparse
    import shutil
    import subprocess
    p = argparse.ArgumentParser(prog="python -m warlords2.audio.music")
    p.add_argument("evidence", type=Path)
    p.add_argument("--cache", type=Path, default=R.DEFAULT_OUT)
    ns = p.parse_args(argv)
    d = ns.evidence
    man = json.loads((d / "manifest.json").read_text())
    records = [json.loads(x) for x in (d / "music.jsonl").read_text().splitlines()]
    argv_ = man["argv"]
    hz = int(argv_[argv_.index("--tick-hz") + 1]) if "--tick-hz" in argv_ else 60
    wav = render_timeline(records, man["frames"], hz, ns.cache, d / "music.wav")
    print(wav)
    ff = Path.home() / ".local" / "bin" / "ffmpeg"
    ff = str(ff) if ff.is_file() else shutil.which("ffmpeg")
    segs = [s["path"] for s in man["segments"]]
    if ff and segs:
        lst = d / "segments.txt"
        lst.write_text("".join(f"file '{Path(s).resolve()}'\n" for s in segs))
        out = d / "run_music.mp4"
        subprocess.run([ff, "-y", "-loglevel", "error", "-f", "concat", "-safe", "0", "-i", str(lst),
                        "-i", str(wav), "-c:v", "copy", "-c:a", "aac", "-shortest", str(out)], check=True)
        lst.unlink()
        print(out)


if __name__ == "__main__":
    main()
