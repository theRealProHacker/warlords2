"""Checks for the VROOMM overlay flattener (tools/re/flatten_overlay.py)."""
import hashlib
import os
import struct
import sys

import pytest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools", "re"))

pytestmark = pytest.mark.gamedata


def test_flatten(tmp_path, game):
    from flatten_overlay import flatten
    from mz import Exe

    exe = os.path.join(game, "WARLORD2.EXE")

    src = open(exe, "rb").read()
    rep = flatten(exe, str(tmp_path / "flat.exe"))
    assert hashlib.sha256(src).hexdigest() == rep["source_sha256"] == \
        "9f9147af74d6b616b93fa0188dfdaff162a347b0202b7d2473cad8ee88922bc2"
    assert open(exe, "rb").read() == src                     # original untouched
    assert rep["overlay_count"] == 69 and rep["stub_entries_patched"] == 950
    assert rep["relocs_after"] == rep["relocs_before"] + rep["overlay_fixups"] + 950
    assert rep["flat_sha256"] == "f0973331dd372cf7486612cac54078becf0cffcb255f9fca2199eaa614e3f719"

    flat = Exe(str(tmp_path / "flat.exe"))
    assert not flat.ovls                                      # no INT 3Fh stubs left, no FBOV
    img = flat.image
    for o in rep["overlays"]:
        stub = int(o["stub_seg"], 16) * 16
        assert img[stub + 0x20] == 0xEA                       # first entry is now JMP FAR
        off, seg = struct.unpack_from("<HH", img, stub + 0x21)
        assert seg == int(o["new_seg"], 16) and off < o["code_size"]
