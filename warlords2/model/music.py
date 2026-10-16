"""The music words of the running program (docs/plan.md M10c; EL §9.8 addition "Music").

ovl58:0000 (`rules.music.play`) reads and writes a few DGROUP words of the sound code: the
mode of the last call, the loaded sequence, its repeat flag, the music switch and the driver
flag.  They are memory of the program run, not of the game: no save holds them (ovl49:0a46
writes DS:5d64, the SCN, the map and army blocks, the text files and the AI blocks only), a
load and New Game keep them, and a Begin keeps them too.  So they are not `GameState` fields:
`GameState.music` is a plain attribute like the production report block (not dumped, not in
`GameState.hash`, a fresh object after `serialize.load`), carried
by `rules.saveload.RunPart.music` into a loaded or begun game.  The host owns one object per
program run and hands it to the pre-game screens (modes 0 / 11, `rules.music.start`) and to
every game it enters.

A refused or failed command stands for one the EXE never carried out, so its music call is
undone with its dice: `serialize.snapshot` keeps a copy of the words and `serialize.restore`
puts it back in place (`assign`), which covers `rules.engine.apply`'s refusal rollback and
the host's run restore (`states.game.run_snapshot` / `run_restore` call those two).

Initial values: the EXE image (DS:2632 = 0xffff, DS:379e = 0xffff, DS:37a9 = 0, DS:0bee = 0,
DS:37a3 = 1); the host then sets `on` from OPTIONS.SND digit 0 (ovl58:0bc5) and `driver` from
SOUND.DAT (155e:00d5), `on` forced 0 without a driver (ovl58:0c32..0c45).
"""
from __future__ import annotations

from dataclasses import dataclass, fields, replace


@dataclass
class MusicWords:
    mode: int = -1                  # DS:2632, the mode of the last ovl58:0000 call that got past 0007
    playing: int = 0                # DS:379e != -1: a sequence registered and not stopped since
    #                                 (rules.music.still_playing, register X32 model O1)
    loop: int = 0                   # DS:37a9 bit 0: 155e:02ab restarts the sequence at its end
    on: int = 0                     # DS:0bee, the music switch (Settings box 276)
    driver: int = 1                 # DS:37a3, a music driver is loaded
    track: tuple | None = None      # FILE.DAT (group, index) of the last sequence started
    starts: int = 0                 # how many sequences were started (for the player: a new one
    #                                 when it grows; no EXE word)

    def copy(self) -> MusicWords:
        """An independent copy (a `GameState.copy` preview must not write the run's words);
        also the snapshot of `model.serialize.snapshot`."""
        return replace(self)

    def assign(self, other: MusicWords) -> None:
        """Take `other`'s values in place (this object stays the run's one: the App, the
        pre-game screens and the game share it); the restore of `model.serialize.restore`."""
        for f in fields(self):
            setattr(self, f.name, getattr(other, f.name))
