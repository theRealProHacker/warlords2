"""Default locations of the game directory, the user directory and the music cache.

Run from a checkout (the repository's pyproject.toml next to the package, also for
`pip install -e`), the defaults stay below the repository: original/game/Warlrd2,
out/user/, out/music/.  Installed into site-packages there is no game directory to
default to (`--data` or WL2_DATA is required), and what the program writes goes to the
per-user data directory: %APPDATA%\\warlords2, ~/Library/Application Support/warlords2,
or $XDG_DATA_HOME/warlords2 (default ~/.local/share/warlords2).

A frozen build (PyInstaller, packaging/) is never a checkout, so it writes only to that
per-user directory.  Without --data or WL2_DATA it looks for the game (`frozen_data`) in the
path saved in the user directory, then a Warlrd2/ folder next to the program (or the .app),
then, run interactively, offers to download the game from the Internet Archive into the user
directory (warlords2.fetch) or asks for the folder, once, and saves the result.
"""
from __future__ import annotations

import os
import sys
from pathlib import Path

from .formats.gamedir import DATA_ENV, EXE_NAME, REPO_ROOT, GameDir, default_root
from .persist.userdir import DEFAULT_ROOT as REPO_USER_ROOT

APP_NAME = "warlords2"
SAVED_DATA = "data_dir.txt"              # in the user directory: the game folder picked once
SIBLING_DATA = "WARLRD2"                 # the game's folder next to the program, any case


def frozen() -> bool:
    return bool(getattr(sys, "frozen", False))


def in_checkout() -> bool:
    return (not frozen() and (REPO_ROOT / "pyproject.toml").is_file()
            and (REPO_ROOT / APP_NAME).is_dir())


def user_data_root() -> Path:
    """The per-user data directory of an installed copy (platformdirs' user_data_dir)."""
    if sys.platform == "win32":
        base = os.environ.get("APPDATA") or Path.home() / "AppData" / "Roaming"
    elif sys.platform == "darwin":
        base = Path.home() / "Library" / "Application Support"
    else:
        base = os.environ.get("XDG_DATA_HOME") or Path.home() / ".local" / "share"
    return Path(base) / APP_NAME


def default_data() -> Path | None:
    """WL2_DATA, else the repository default in a checkout; None when installed without it."""
    if os.environ.get(DATA_ENV) or in_checkout():
        return default_root()
    return None


def default_user_dir() -> Path:
    return REPO_ROOT / REPO_USER_ROOT if in_checkout() else user_data_root()


def default_music_cache() -> Path:
    return REPO_ROOT / "out" / "music" if in_checkout() else user_data_root() / "music"


def is_game_dir(p: Path) -> bool:
    return GameDir(p).path(EXE_NAME).is_file()


def program_dirs() -> list[Path]:
    """The executable's folder, and for a macOS .app the folder holding the .app."""
    exe = Path(sys.executable).resolve()
    return [exe.parent] + [a.parent for a in exe.parents if a.suffix == ".app"]


def frozen_data(user_dir: Path, interactive: bool) -> Path | None:
    """The game directory of a frozen build without --data / WL2_DATA: the saved path, a
    Warlrd2/ folder next to the program, else (`interactive`) the download or folder dialog
    (`pick_data`), whose result is saved.  None when there is none (or no tkinter)."""
    try:
        saved = Path((Path(user_dir) / SAVED_DATA).read_text(encoding="utf-8").strip())
        if is_game_dir(saved):
            return saved
    except (OSError, ValueError):
        pass
    for d in program_dirs():
        try:
            names = os.listdir(d)
        except OSError:
            continue
        for n in sorted(names):
            if n.upper() == SIBLING_DATA and is_game_dir(d / n):
                return d / n
    if not interactive:
        return None
    picked = pick_data(Path(user_dir))
    if picked is not None:
        Path(user_dir).mkdir(parents=True, exist_ok=True)
        (Path(user_dir) / SAVED_DATA).write_text(str(picked), encoding="utf-8")
    return picked


def pick_data(user_dir: Path) -> Path | None:
    """Offer to download the game into user_dir/Warlrd2 (warlords2.fetch); declined or failed,
    ask for the Warlords II folder (tkinter) until it holds WARLORD2.EXE or is cancelled."""
    try:
        import tkinter
        from tkinter import filedialog, messagebox
    except ImportError:
        return None
    try:
        root = tkinter.Tk()
    except tkinter.TclError:                  # no display
        return None
    root.withdraw()
    try:
        from .fetch import FetchError, fetch
        if messagebox.askyesno(
                "Warlords II",
                "Warlords II needs the original DOS game files.\n\n"
                "Download them now from the Internet Archive (2.6 MB)?\n\n"
                "No: choose your own Warlords II folder.", parent=root):
            try:
                return fetch(user_dir / "Warlrd2")
            except FetchError as e:
                messagebox.showerror("Warlords II", f"{e}\n\nChoose your own Warlords II folder.",
                                     parent=root)
        while True:
            hint = f"Your Warlords II (DOS) folder, with {EXE_NAME}"
            # macOS's open panel ignores the title and shows the message
            d = filedialog.askdirectory(parent=root, mustexist=True, title=hint,
                                        **({"message": hint} if sys.platform == "darwin" else {}))
            if not d:
                return None
            if is_game_dir(Path(d)):
                return Path(d)
            messagebox.showerror("Warlords II", f"{EXE_NAME} not found in {d}", parent=root)
    finally:
        root.destroy()
