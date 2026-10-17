# warlords2

A reimplementation of Warlords II (1993, DOS v1.02) in Python and pygame.

It contains no game data apart from the game's music, pre-rendered to Ogg Vorbis. You need your own copy of Warlords II for DOS: the program
reads its files (the directory with `WARLORD2.EXE`) at run time and never writes there.

## Downloads

Ready-to-run builds for Windows, macOS and Linux (no Python needed): the
[Releases](https://github.com/<user>/warlords2/releases) page, or the artifacts of a run on the
repository's Actions tab. Unpack and start `warlords2` (macOS: `Warlords II.app`). It finds
your game in a `Warlrd2` folder next to the program (or the .app), else asks for the folder
once and remembers it; `--data DIR` and `WL2_DATA` work too.

- macOS (14 or newer): the app is not signed. Start it once, then System Settings, Privacy &
  Security, Open Anyway, or run `xattr -dr com.apple.quarantine "Warlords II.app"`.
- Windows: SmartScreen may warn about an unknown publisher: More info, Run anyway.

## Install

Python 3.12 or newer:

    pip install git+https://github.com/<user>/warlords2

Extras: `[music]` to render the music yourself (`python -m warlords2.audio.music_render`),
`[record]` for `--record FILE.mp4`, e.g. `pip install "warlords2[music] @ git+https://github.com/<user>/warlords2"`.

## Run

    warlords2 --data /path/to/Warlrd2

or set `WL2_DATA=/path/to/Warlrd2` and run `warlords2`.

Main options:

- `--data DIR`: your Warlords II directory (or `WL2_DATA`)
- `--scale N`: window scale, default 2
- `--no-intro`: skip the intro
- `--user-dir DIR`: where options, saves and maps go (default: `~/.local/share/warlords2`,
  `%APPDATA%\warlords2` or `~/Library/Application Support/warlords2`)

`--fullscreen` (Alt+Enter toggles) and `--frameless` (no title bar). `warlords2 --help` lists every option.

The music plays out of the box (the bundled renders, for DOS v1.02's music files; with
other ones it is silent). Rendering it yourself is optional:
`python -m warlords2.audio.music_render /path/to/Warlrd2` (needs the `[music]` extra) fills
the cache (`--music-cache`), which is played first.
