"""Fetch the original game files from the Internet Archive (user decision 2026-10-17).

The item msdos_Warlords_II_1993 holds the DOS v1.02 game as one ZIP with a single Warlrd2/
folder.  `fetch(dest)` downloads that ZIP, checks its size and SHA-256 against the copy the
reimplementation was built from, and unpacks the folder's contents into `dest` (so `dest`
holds WARLORD2.EXE).  Used by the Windows installer (`warlords2 --fetch-data DIR`) and by the
first-start dialog of a bundle (paths.pick_data).
"""
from __future__ import annotations

import hashlib
import io
import os
import shutil
import sys
import urllib.request
import zipfile
from pathlib import Path, PurePosixPath

from .formats.gamedir import EXE_NAME, GameDir

ITEM_URL = "https://archive.org/details/msdos_Warlords_II_1993"
ZIP_URL = "https://archive.org/download/msdos_Warlords_II_1993/Warlords_II_1993.zip"
ZIP_SIZE = 2_626_522
ZIP_SHA256 = "b7d6c8e452fa5358b0608ac639a261496269073cb42e94a995239fb80ed48df4"
ZIP_FOLDER = "Warlrd2"
TIMEOUT = 60                                   # seconds per network read


class FetchError(Exception):
    pass


def download(url: str = ZIP_URL) -> bytes:
    """The ZIP's bytes, checked against ZIP_SIZE and ZIP_SHA256."""
    req = urllib.request.Request(url, headers={"User-Agent": "warlords2"})
    try:
        with urllib.request.urlopen(req, timeout=TIMEOUT) as r:
            data = r.read(ZIP_SIZE + 1)
    except OSError as e:
        raise FetchError(f"download from {url} failed: {e}") from e
    if len(data) != ZIP_SIZE or hashlib.sha256(data).hexdigest() != ZIP_SHA256:
        raise FetchError(f"{url} is not the expected file ({len(data)} bytes, other contents)")
    return data


def unpack(data: bytes, dest: Path) -> Path:
    """Unpack the ZIP's Warlrd2/ folder as `dest`.  `dest` must not exist or be empty; the files
    land in a sibling .part folder first, so a failed unpack leaves no half game behind."""
    dest = Path(dest)
    if dest.exists() and (not dest.is_dir() or any(dest.iterdir())):
        raise FetchError(f"{dest} already exists and is not empty")
    part = dest.with_name(dest.name + ".part")
    shutil.rmtree(part, ignore_errors=True)
    try:
        with zipfile.ZipFile(io.BytesIO(data)) as z:
            for info in z.infolist():
                p = PurePosixPath(info.filename)
                if p.parts[:1] != (ZIP_FOLDER,) or ".." in p.parts or p.is_absolute():
                    raise FetchError(f"unexpected entry {info.filename!r} in the ZIP")
                target = part.joinpath(*p.parts[1:])
                if info.is_dir():
                    target.mkdir(parents=True, exist_ok=True)
                else:
                    target.parent.mkdir(parents=True, exist_ok=True)
                    with z.open(info) as src, open(target, "wb") as out:
                        shutil.copyfileobj(src, out)
        if not GameDir(part).path(EXE_NAME).is_file():
            raise FetchError(f"no {EXE_NAME} in the ZIP")
        if dest.exists():
            dest.rmdir()
        os.replace(part, dest)
    except (OSError, zipfile.BadZipFile) as e:
        shutil.rmtree(part, ignore_errors=True)
        raise FetchError(f"unpacking into {dest} failed: {e}") from e
    except FetchError:
        shutil.rmtree(part, ignore_errors=True)
        raise
    return dest


def fetch(dest: Path, url: str = ZIP_URL) -> Path:
    """`dest` as a game directory: kept when it already holds the game, else fetched."""
    dest = Path(dest)
    if GameDir(dest).path(EXE_NAME).is_file():
        return dest
    return unpack(download(url), dest)


def main(dest: Path) -> int:
    """`warlords2 --fetch-data DIR`: 0 when DIR holds the game afterwards, else 1."""
    print(f"fetching the game files from {ITEM_URL} into {dest}")
    try:
        fetch(dest)
    except FetchError as e:
        print(f"--fetch-data: {e}", file=sys.stderr)
        return 1
    print("done")
    return 0
