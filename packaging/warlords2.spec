# PyInstaller 6 spec: one-dir bundle of the game (requirements-build.txt).
#   pyinstaller packaging/warlords2.spec        ->  dist/warlords2/ (macOS: also dist/Warlords II.app)
# The game files are the user's own and never bundled; the rendered music is (package data,
# warlords2/data/music/, user decision 2026-10-17).  Left out: the GPL music renderer (pyopl,
# tinysoundfont) and the debug-only recorder's cv2 / pygame_screen_record, PIL, pytest.
import sys
from pathlib import Path

from PyInstaller.utils.hooks import collect_data_files, collect_submodules

ROOT = Path(SPECPATH).parent
NAME = "warlords2"
BUNDLE_ID = "io.github.therealprohacker.warlords2"
EXCLUDES = ["cv2", "pygame_screen_record", "PIL", "pytest", "pyopl", "tinysoundfont",
            "warlords2.debug.recorder",
            "readline"]        # GNU readline (GPL) via numpy.testing -> pdb on setup-python's Linux build

# states, dialogs and scripts are imported by name (app.STATES, ui.registry, debug.script)
hidden = collect_submodules(NAME, filter=lambda m: not m.startswith("warlords2.debug.recorder"))
datas = collect_data_files(NAME, includes=["data/music/*.ogg", "data/music/manifest.json"])

a = Analysis(
    [str(ROOT / "packaging" / "entry.py")],
    pathex=[str(ROOT)],
    datas=datas,
    hiddenimports=hidden,
    excludes=EXCLUDES,
    noarchive=False,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    [],
    exclude_binaries=True,
    name=NAME,
    console=False,          # windowed (user 2026-10-17); entry.py logs to the user dir
    icon=str(ROOT / "packaging" / "icon.ico") if sys.platform == "win32" else None,
    upx=False,
)
coll = COLLECT(exe, a.binaries, a.datas, name=NAME, upx=False)

if sys.platform == "darwin":
    app = BUNDLE(
        coll,
        name="Warlords II.app",
        icon=str(ROOT / "packaging" / "icon.icns"),
        bundle_identifier=BUNDLE_ID,
        version="0.1.0",
        # numpy's macOS wheels on the macos-15 runners are macosx_14_0 builds
        info_plist={"CFBundleDisplayName": "Warlords II", "NSHighResolutionCapable": True,
                    "LSMinimumSystemVersion": "14.0"},
    )
