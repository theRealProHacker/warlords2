"""The desktop's view of the window on Linux: its WM_CLASS / app_id and a launcher entry.

GNOME (and other freedesktop shells) show a window's icon in the dash and Alt+Tab from the
.desktop file whose StartupWMClass matches the window's WM_CLASS (X11 / XWayland) or app_id
(Wayland); the icon set on the window itself (`assets.sprites.set_window_icon`) is not used
there.  SDL names the class after the program ("__main__.py" under `python -m`), so
`set_wm_class` gives it a fixed name before the display opens, and `install` writes, at run
time, the icon (from the user's own game files, so never shipped) in three sizes to the
user's hicolor theme and a launcher entry naming it.  Files are rewritten only when their
bytes differ; nothing here is fatal.  Only on Linux, never under the dummy video driver.
"""
from __future__ import annotations

import os
import shlex
import sys
from pathlib import Path

WM_CLASS = "warlords2"
ICON_SIZES = (32, 64, 128)


def set_wm_class() -> None:
    """SDL's hints, read from the environment by `pygame.display.init`; a value the user set
    already wins.  `import pygame` itself sets SDL_VIDEO_X11_WMCLASS to the script's base name
    (pygame/__init__.py, e.g. "__main__.py") when DISPLAY is set: that one is replaced."""
    if os.environ.get("SDL_VIDEO_X11_WMCLASS") in (None, "", os.path.basename(sys.argv[0])):
        os.environ["SDL_VIDEO_X11_WMCLASS"] = WM_CLASS
    os.environ.setdefault("SDL_VIDEO_WAYLAND_WMCLASS", WM_CLASS)


def data_home() -> Path:
    return Path(os.environ.get("XDG_DATA_HOME") or Path.home() / ".local" / "share")


def entry_text(python: str, workdir: Path | None) -> str:
    """The launcher entry (Desktop Entry Specification 1.5)."""
    lines = ["[Desktop Entry]", "Type=Application", "Name=Warlords II",
             "Comment=Warlords II (1993) on your own game files",
             f"Exec={shlex.quote(python)} -m warlords2",
             f"Icon={WM_CLASS}", f"StartupWMClass={WM_CLASS}",
             "Categories=Game;StrategyGame;", "Terminal=false"]
    if workdir is not None:
        lines.append(f"Path={workdir}")
    return "\n".join(lines) + "\n"


def _write(path: Path, data: bytes) -> bool:
    """Write `data` when the file is missing or differs; True when it was written."""
    try:
        if path.read_bytes() == data:
            return False
    except OSError:
        pass
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_name(path.name + ".tmp")
    tmp.write_bytes(data)
    os.replace(tmp, path)
    return True


def png_bytes(surface) -> bytes:
    import io

    import pygame
    b = io.BytesIO()
    pygame.image.save(surface, b, "icon.png")
    return b.getvalue()


def install(store, root: Path | None = None) -> list[Path]:
    """The icon PNGs and warlords2.desktop below `root` (default $XDG_DATA_HOME or
    ~/.local/share); returns the files written.  A checkout runs `python -m warlords2` from
    the repository (Path=), an installed copy from anywhere."""
    written: list[Path] = []
    try:
        import pygame
        if not sys.platform.startswith("linux") or pygame.display.get_driver() == "dummy":
            return written
        from .assets.sprites import has_icon_files, window_icon
        if not has_icon_files(store):
            return written
        root = data_home() if root is None else Path(root)
        icons = root / "icons" / "hicolor"
        for n in ICON_SIZES:
            p = icons / f"{n}x{n}" / "apps" / f"{WM_CLASS}.png"
            if _write(p, png_bytes(window_icon(store, n))):
                written.append(p)
        if written:
            os.utime(icons)                   # the theme directory's mtime: GTK re-reads it
        from .paths import in_checkout
        from .formats.gamedir import REPO_ROOT
        text = entry_text(sys.executable, REPO_ROOT if in_checkout() else None)
        p = root / "applications" / f"{WM_CLASS}.desktop"
        if _write(p, text.encode()):
            written.append(p)
    except Exception:
        pass
    return written
