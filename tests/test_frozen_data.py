"""The game directory of a frozen build (packaging/): saved path, Warlrd2/ next to the program."""
import sys

import pytest

from warlords2 import config, paths


def fake_game(d):
    d.mkdir(parents=True)
    (d / "warlord2.exe").write_bytes(b"")              # any case, as on a DOS copy
    return d


@pytest.fixture
def bundle(tmp_path, monkeypatch):
    monkeypatch.setattr(sys, "frozen", True, raising=False)
    return tmp_path


def test_frozen_is_never_a_checkout(bundle):
    assert not paths.in_checkout()
    assert paths.default_user_dir() == paths.user_data_root()
    assert paths.default_music_cache() == paths.user_data_root() / "music"


def test_saved_path_first(bundle, monkeypatch):
    user = bundle / "user"
    user.mkdir()
    game = fake_game(bundle / "elsewhere")
    (user / paths.SAVED_DATA).write_text(str(game), encoding="utf-8")
    monkeypatch.setattr(sys, "executable", str(bundle / "dist" / "warlords2"))
    assert paths.frozen_data(user, interactive=False) == game


def test_stale_saved_path_falls_through_to_the_sibling(bundle, monkeypatch):
    user = bundle / "user"
    user.mkdir()
    (user / paths.SAVED_DATA).write_text(str(bundle / "gone"), encoding="utf-8")
    game = fake_game(bundle / "dist" / "Warlrd2")
    monkeypatch.setattr(sys, "executable", str(bundle / "dist" / "warlords2"))
    assert paths.frozen_data(user, interactive=False) == game


def test_sibling_of_a_macos_app(bundle, monkeypatch):
    game = fake_game(bundle / "WARLRD2")
    monkeypatch.setattr(sys, "executable", str(bundle / "Warlords II.app" / "Contents" / "MacOS" / "warlords2"))
    assert paths.frozen_data(bundle / "user", interactive=False) == game


def test_nothing_found_headless_is_the_usual_error(bundle, monkeypatch, capsys):
    monkeypatch.delenv("WL2_DATA", raising=False)
    monkeypatch.setattr(sys, "executable", str(bundle / "dist" / "warlords2"))
    monkeypatch.setattr(paths, "pick_data", lambda: pytest.fail("no picker when headless"))
    with pytest.raises(SystemExit):
        config.parse_args(["--headless", "--user-dir", str(bundle / "user")])
    assert "WARLORD2.EXE" in capsys.readouterr().err
    assert not (bundle / "user").exists()


def test_picked_folder_is_saved(bundle, monkeypatch):
    game = fake_game(bundle / "picked")
    monkeypatch.delenv("WL2_DATA", raising=False)
    monkeypatch.setattr(sys, "executable", str(bundle / "dist" / "warlords2"))
    monkeypatch.setattr(paths, "pick_data", lambda: game)
    cfg = config.parse_args(["--user-dir", str(bundle / "user"), "--seed", "1"])
    assert cfg.data == game
    assert (bundle / "user" / paths.SAVED_DATA).read_text(encoding="utf-8") == str(game)
