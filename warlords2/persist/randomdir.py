"""The generated RANDOM\\RANDOM.* files (docs/plan.md M11, register X55, engine gap G3).

The original's generator writes RANDOM\\RANDOM.SGN / .MAP / .RD / .CTY / .SPC / .SCN into its
own directory (ovl09, FILE.DAT (33, 0) / (30, 0) / (31, 0) / (35, 0) / (34, 0) / (32, 0) in that
order), and the load of a random-map game writes .SPC / .CTY back there (ovl49:0728 / 07a9, open
mode 9).  Every later reader opens them by name: the scenario loader (ovl57:0194), the
description reader (ovl45:1e02, "%s\\%s.CTY" / ".SPC" of DS:5da0), Begin's signs (ovl53:026c ->
ovl13:0103, "%s\\%s.sgn"), the Game Start counts, a random-map save (ovl49:0bbe / 0c46).

Here the game directory stays read-only: the files live in the user directory under the same
relative names, and `RandomDir.serve` is the `formats.gamedir.GameDir.overlay` hook that serves
such a file before the game's copy whenever it exists (a file never written here falls through to
the game's, as the EXE reads the shipped file until the first generation).  RANDOM.ITM and
RANDOM.DAT are never served (the generator reads RANDOM.DAT, nothing writes either).

Use: `rd = RandomDir(user, gd)` then `rd.attach()` (the App right after its UserDir exists);
`Saves(..., random_texts=rd.texts, random_write=rd.write_texts)`; `rd.write_files(
generated.files)` after a generation (ovl57:10e8), before the scenario loader reads them.
"""
from __future__ import annotations

from pathlib import Path

from ..formats.scenario import parse_sgn
from ..formats.tables import StringTable

# FILE.DAT entries of the six files, keyed as `rules.randmap.Generated.files`, in the order the
# generator writes them (ovl09: SGN, MAP, RD, CTY, SPC, SCN; prep §2.4).
FILES = (("SGN", (33, 0)), ("MAP", (30, 0)), ("RD", (31, 0)), ("CTY", (35, 0)),
         ("SPC", (34, 0)), ("SCN", (32, 0)))
TEXTS = ("SPC", "CTY")              # the random-game save's order (ovl49:0bbe, then 0c46)
# A failed create of the generator's files (`RandomDir.write_files`): these end the program
# (ovl09:02d4 / 0346 / 03b8 / 0435 -> ovl52:0000), SCN prints ERROR.DAT (0, 0) and goes on
# (ovl09:110a / 1117), SGN is skipped silently (ovl09:13e6).
FATAL = ("MAP", "RD", "CTY", "SPC")
FATAL_ERROR = (1, 0)                # ovl09:02b7 / 0329 / 039b / 0418: ovl59:051a(1, 0)
PRINTED = {"SCN": (0, 0)}           # ovl09:110a: ovl59:051a(0, 0), printf at 1117


class FatalCreate(Exception):
    """A failed create the EXE ends the program on (ovl52:0000): `name` ("MAP" ...), `file`
    (its FILE.DAT name), `error` the ERROR.DAT entry the message is formatted from (with
    `file`).  The host does what ovl52:0000 does: the chord, the message to the console, then
    the end of the program with its banner (`App.exit_program`, 0a4c:02b5)."""

    def __init__(self, name: str, file: str):
        super().__init__("cannot create %s (ovl52:0000 ends the run)" % file)
        self.name, self.file, self.error = name, file, FATAL_ERROR


def _rel(s: str) -> str:
    """A FILE.DAT path (backslashes, doubled in the file) as an upper-case '/' path."""
    return "/".join(p for p in s.replace("\\", "/").upper().split("/") if p)


class RandomDir:
    """The RANDOM overlay of one user directory.  `user`: `persist.userdir.UserDir`; `gd`: the
    game directory (FILE.DAT names; the overlay is installed on it by `attach`)."""

    def __init__(self, user, gd):
        self.user, self.gd = user, gd
        files = StringTable(gd.read("DATA/FILE.DAT"))
        self.names = {name: files.get(*which) for name, which in FILES}
        self.rels = {name: _rel(n) for name, n in self.names.items()}
        self._by_rel = {rel: name for name, rel in self.rels.items()}

    # ---------------------------------------------------------------- the hook

    def user_path(self, name: str) -> Path:
        """The user-dir path of RANDOM.<name> (no directory made)."""
        return self.user.root / self.rels[name]

    def serve(self, rel: str) -> Path | None:
        """`GameDir.overlay`: the user-dir file for one of the six names (`rel` upper case, '/'),
        when it exists; else None (the game's file)."""
        name = self._by_rel.get(rel)
        if name is None:
            return None
        p = self.user_path(name)
        return p if p.is_file() else None

    def attach(self) -> None:
        """Every reader of `gd` (and of an AssetStore on it) sees the overlay from now on."""
        self.gd.overlay = self.serve

    # ---------------------------------------------------------------- reads

    def read(self, name: str) -> bytes | None:
        """RANDOM.<name> as a reader opens it now (the user's file, else the game's); None when
        neither can be opened."""
        p = self.serve(self.rels[name])
        if p is None:
            p = self._game_path(name)
        try:
            return p.read_bytes()
        except OSError:
            return None

    def _game_path(self, name: str) -> Path:
        ov, self.gd.overlay = self.gd.overlay, None
        try:
            return self.gd.path(self.rels[name])
        finally:
            self.gd.overlay = ov

    def texts(self) -> dict:
        """The `Saves(random_texts=)` reader: {"SPC": bytes, "CTY": bytes} as on disk now (the
        open of ovl49:0bbe / 0c46).  Raises ValueError when one cannot be opened: the save is
        refused (register X65's stand-in)."""
        out = {}
        for name in TEXTS:
            b = self.read(name)
            if b is None:
                raise ValueError("RANDOM.%s cannot be opened (register X65)" % name)
            out[name] = b
        return out

    def signs(self):
        """%s\\%s.SGN of DS:5da0 = "random" as Begin's ovl13:0103 reads it (register X63): the
        parsed signs, None when the open fails (`rules.setup.begin(signs=)`)."""
        b = self.read("SGN")
        return None if b is None else parse_sgn(b)

    # ---------------------------------------------------------------- writes

    def _write(self, name: str, data: bytes) -> bool:
        try:
            self.user.path(self.rels[name]).write_bytes(bytes(data))
        except OSError:
            return False
        return True

    def write_files(self, files: dict) -> list[tuple[tuple[int, int], str]]:
        """The generator's writes (`rules.randmap.Generated.files`: {"SGN": bytes, ...}), in
        its order (SGN, MAP, RD, CTY, SPC, SCN).  What a failed create (open mode 9) does is
        per file, as in the EXE:
        * SGN (ovl09:13da..13e6 `jl 1406`): skipped silently, the rest goes on;
        * MAP / RD / CTY / SPC (ovl09:027c, 02b0..02d4 / 0322..0346 / 0394..03b8 / 0411..0435):
          ERROR.DAT (1, 0) formatted with the file name (ovl59:051a(1, 0) + sprintf) goes to
          ovl52:0000, the fatal-error routine (text mode, the chord ovl58:0b5f, printf of the
          message, 0a4c:02b5: the banner and exit(0)), so the program ends there and no later
          file is written: raised as `FatalCreate` (the files after it are not written);
        * SCN (ovl09:10f7..111f): printf(ERROR.DAT (0, 0), file name) to the console and on
          (113a): returned.
        Returns the console messages to print and go on: [(ERROR.DAT entry, FILE.DAT name)]
        (the name as `files` holds it: the string sprintf'd as the format at 10e8).  The EXE's
        texts are the user's ERROR.DAT, formatted by the host.  A failed file keeps what the
        user directory held.  A name outside the six raises KeyError (before anything)."""
        order = [n for n, _ in FILES]
        for name in files:
            if name not in self.rels:
                raise KeyError(name)
        printed = []
        for name in sorted(files, key=order.index):
            if self._write(name, files[name]):
                continue
            if name in FATAL:
                raise FatalCreate(name, self.names[name])
            if name in PRINTED:
                printed.append((PRINTED[name], self.names[name]))
        return printed

    def write_texts(self, texts: dict) -> list[str]:
        """The random-game load's write-back of `rules.saveload.Loaded.random_texts` (ovl49:0728
        SPC, then 07a9 CTY, open mode 9).  Returns the names whose create failed."""
        return [n for n in TEXTS if n in texts and not self._write(n, texts[n])]
