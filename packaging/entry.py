"""PyInstaller entry point: warlords2/__main__.py imports relatively, so it cannot be the script.

A windowed build has no console: sys.stdout / sys.stderr are None there, so both go to a log
file (WL2_LOG, else warlords2.log in the per-user directory).  When the program ends with an
error (a non-zero exit or an uncaught exception) its last lines are also shown in a message
box on Windows, except in headless runs (`--headless`, or CI set), where nobody could close it."""
import os
import sys
from pathlib import Path


def _log_streams() -> Path:
    if os.environ.get("WL2_LOG"):
        path = Path(os.environ["WL2_LOG"])
    else:
        from warlords2.paths import default_user_dir
        path = default_user_dir() / "warlords2.log"
    path.parent.mkdir(parents=True, exist_ok=True)
    f = open(path, "w", encoding="utf-8", buffering=1)
    sys.stdout = sys.stdout or f
    sys.stderr = sys.stderr or f
    return path


def _message_box(log: Path) -> None:
    if sys.platform != "win32" or "--headless" in sys.argv or os.environ.get("CI"):
        return
    sys.stderr.flush()
    try:
        tail = "".join(log.read_text(encoding="utf-8").splitlines(True)[-8:]).strip()
    except OSError:
        tail = ""
    import ctypes
    ctypes.windll.user32.MessageBoxW(None, f"{tail}\n\n(log: {log})", "Warlords II", 0x10)


if __name__ == "__main__":
    windowed = sys.stdout is None or sys.stderr is None
    log = _log_streams() if windowed else None
    from warlords2.app import main
    try:
        main()
    except SystemExit as e:
        if windowed and e.code not in (None, 0):
            if isinstance(e.code, str):
                print(e.code, file=sys.stderr)     # before the box; then exit 1 as Python would
                _message_box(log)
                raise SystemExit(1) from None
            _message_box(log)
        raise
    except BaseException:
        if windowed:
            import traceback
            traceback.print_exc()
            _message_box(log)
        raise
