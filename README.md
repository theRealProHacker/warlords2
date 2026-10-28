# warlords2

A reimplementation of Warlords II (1993, DOS v1.02) in Python and pygame.

It contains no game data apart from the game's music, pre-rendered to Ogg Vorbis. You need your own copy of Warlords II for DOS: the program
reads its files (the directory with `WARLORD2.EXE`) at run time and never writes there.

## Downloads

Ready-to-run builds for Windows, macOS and Linux (no Python needed): the
[Releases](https://github.com/theRealProHacker/warlords2/releases) page, or the artifacts of a run on the
repository's Actions tab.

- Windows: run `warlords2-windows-x64-setup.exe`, pick the install folder, and setup downloads
  the original game from the [Internet Archive](https://archive.org/details/msdos_Warlords_II_1993).
  The portable `warlords2-windows-x64.zip` works too.
- Elsewhere: unpack and start `warlords2` (macOS: `Warlords II.app`).

Without game files next to it (a `Warlrd2` folder beside the program or the .app), the first
start offers to download them from the Internet Archive or to choose your own folder, and
remembers the answer; `--data DIR` and `WL2_DATA` work too, and `--fetch-data DIR` downloads
into DIR.

- macOS (14 or newer): the app is not signed. Start it once, then System Settings, Privacy &
  Security, Open Anyway, or run `xattr -dr com.apple.quarantine "Warlords II.app"`.
- Windows: SmartScreen may warn about an unknown publisher: More info, Run anyway.

## Install

Python 3.12 or newer:

    pip install git+https://github.com/theRealProHacker/warlords2

Extras: `[music]` to render the music yourself (`python -m warlords2.audio.music_render`),
`[record]` for `--record FILE.mp4`, e.g. `pip install "warlords2[music] @ git+https://github.com/theRealProHacker/warlords2"`.

## Clone

The `out` branch holds about 4.6 GB of generated outputs. To clone without it:

    git clone --single-branch --branch main https://github.com/theRealProHacker/warlords2.git

## Run

    warlords2 --data /path/to/Warlrd2

or set `WL2_DATA=/path/to/Warlrd2` and run `warlords2`.

Main options:

- `--data DIR`: your Warlords II directory (or `WL2_DATA`)
- `--scale N`: window scale, fractional allowed (e.g. `1.5`); default: the largest that fits the screen
- `--no-intro`: skip the intro
- `--user-dir DIR`: where options, saves and maps go (default: `~/.local/share/warlords2`,
  `%APPDATA%\warlords2` or `~/Library/Application Support/warlords2`)

`--fullscreen` (Alt+Enter toggles), `--frameless` (no title bar) and `--integer-scale` (whole scales only). `warlords2 --help` lists every option.

The music plays out of the box (the bundled renders, for DOS v1.02's music files; with
other ones it is silent). Rendering it yourself is optional:
`python -m warlords2.audio.music_render /path/to/Warlrd2` (needs the `[music]` extra) fills
the cache (`--music-cache`), which is played first.
