"""warlords2.fetch: the Internet Archive download, checked and unpacked as one game folder."""
import hashlib
import io
import zipfile
from pathlib import Path

import pytest

from warlords2 import config, fetch

REPO_ZIP = Path(__file__).resolve().parents[1] / "original" / "dl" / "Warlords_II_1993.zip"


def make_zip(entries):
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w") as z:
        for name, data in entries.items():
            z.writestr(name, data)
    return buf.getvalue()


@pytest.fixture
def served(tmp_path, monkeypatch):
    """Serve `data` from a file:// URL as if it were the archive.org ZIP."""
    def serve(data):
        f = tmp_path / "served.zip"
        f.write_bytes(data)
        monkeypatch.setattr(fetch, "ZIP_SIZE", len(data))
        monkeypatch.setattr(fetch, "ZIP_SHA256", hashlib.sha256(data).hexdigest())
        return f.as_uri()
    return serve


GAME = {"Warlrd2/": b"", "Warlrd2/WARLORD2.EXE": b"MZ", "Warlrd2/DATA/ARMY.DAT": b"x"}


def test_fetch_unpacks_the_folder_contents(tmp_path, served):
    dest = fetch.fetch(tmp_path / "game", served(make_zip(GAME)))
    assert (dest / "WARLORD2.EXE").read_bytes() == b"MZ"
    assert (dest / "DATA" / "ARMY.DAT").read_bytes() == b"x"
    assert not (tmp_path / "game.part").exists()


def test_existing_game_is_kept_without_a_download(tmp_path):
    (tmp_path / "game").mkdir()
    (tmp_path / "game" / "warlord2.exe").write_bytes(b"")
    assert fetch.fetch(tmp_path / "game", "file:///nowhere/at/all.zip") == tmp_path / "game"


def test_other_contents_are_refused(tmp_path, served, monkeypatch):
    url = served(make_zip(GAME))
    monkeypatch.setattr(fetch, "ZIP_SHA256", "0" * 64)
    with pytest.raises(fetch.FetchError, match="not the expected file"):
        fetch.fetch(tmp_path / "game", url)
    assert not (tmp_path / "game").exists()


@pytest.mark.parametrize("bad", ["Warlrd2/../evil.txt", "other/WARLORD2.EXE"])
def test_entries_outside_the_folder_are_refused(tmp_path, served, bad):
    with pytest.raises(fetch.FetchError, match="unexpected entry"):
        fetch.fetch(tmp_path / "game", served(make_zip({**GAME, bad: b"!"})))
    assert not (tmp_path / "game").exists() and not (tmp_path / "game.part").exists()
    assert not (tmp_path / "evil.txt").exists()


def test_a_folder_with_other_files_is_not_touched(tmp_path, served):
    (tmp_path / "game").mkdir()
    (tmp_path / "game" / "mine.txt").write_text("keep")
    with pytest.raises(fetch.FetchError, match="not empty"):
        fetch.fetch(tmp_path / "game", served(make_zip(GAME)))
    assert (tmp_path / "game" / "mine.txt").read_text() == "keep"


def test_network_failure_is_a_fetch_error(tmp_path):
    with pytest.raises(fetch.FetchError, match="failed"):
        fetch.download((tmp_path / "missing.zip").as_uri())


def test_fetch_data_flag_exits_with_the_result(tmp_path, monkeypatch, capsys):
    monkeypatch.setattr(fetch, "fetch", lambda dest: dest)
    with pytest.raises(SystemExit) as e:
        config.parse_args(["--fetch-data", str(tmp_path / "game")])
    assert e.value.code == 0
    monkeypatch.setattr(fetch, "fetch", lambda dest: (_ for _ in ()).throw(fetch.FetchError("offline")))
    with pytest.raises(SystemExit) as e:
        config.parse_args(["--fetch-data", str(tmp_path / "game")])
    assert e.value.code == 1 and "offline" in capsys.readouterr().err


@pytest.mark.skipif(not REPO_ZIP.is_file(), reason="original/dl/Warlords_II_1993.zip not downloaded")
def test_the_pinned_zip_is_the_one_in_original_dl(tmp_path):
    data = REPO_ZIP.read_bytes()
    assert len(data) == fetch.ZIP_SIZE and hashlib.sha256(data).hexdigest() == fetch.ZIP_SHA256
    dest = fetch.unpack(data, tmp_path / "Warlrd2")
    assert (dest / "WARLORD2.EXE").is_file()
