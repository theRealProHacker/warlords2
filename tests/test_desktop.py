"""The launcher entry and icon files on Linux (warlords2.desktop), the window's WM_CLASS."""
import os
import shlex
import sys

os.environ["SDL_VIDEODRIVER"] = "dummy"

import pygame
import pytest

from warlords2 import desktop
from warlords2.assets.store import AssetStore
from warlords2.formats.gamedir import GameDir


@pytest.fixture(scope="module")
def store(game):
    pygame.display.init()
    return AssetStore(GameDir(game))


@pytest.fixture
def x11(monkeypatch):
    monkeypatch.setattr(pygame.display, "get_driver", lambda: "x11")
    monkeypatch.setattr(sys, "platform", "linux")


def test_entry_names_the_icon_and_the_wm_class():
    t = desktop.entry_text("/opt/my env/bin/python", None)
    assert t.startswith("[Desktop Entry]\n")
    assert "Name=Warlords II\n" in t and "Icon=warlords2\n" in t and "StartupWMClass=warlords2\n" in t
    assert "Exec='/opt/my env/bin/python' -m warlords2\n" in t and "Path=" not in t


def test_wm_class_replaces_pygames_default_and_keeps_a_user_value(monkeypatch):
    monkeypatch.setattr(sys, "argv", ["/x/warlords2/__main__.py"])
    monkeypatch.setenv("SDL_VIDEO_X11_WMCLASS", "__main__.py")      # what `import pygame` set
    monkeypatch.setenv("SDL_VIDEO_WAYLAND_WMCLASS", "mine")
    desktop.set_wm_class()
    assert os.environ["SDL_VIDEO_X11_WMCLASS"] == "warlords2"
    assert os.environ["SDL_VIDEO_WAYLAND_WMCLASS"] == "mine"
    monkeypatch.setenv("SDL_VIDEO_X11_WMCLASS", "theirs")
    desktop.set_wm_class()
    assert os.environ["SDL_VIDEO_X11_WMCLASS"] == "theirs"


@pytest.mark.gamedata
def test_install_writes_once_and_repairs(store, x11, tmp_path):
    w = desktop.install(store, tmp_path)
    pngs = [tmp_path / f"icons/hicolor/{n}x{n}/apps/warlords2.png" for n in desktop.ICON_SIZES]
    entry = tmp_path / "applications/warlords2.desktop"
    assert w == pngs + [entry]
    for n, p in zip(desktop.ICON_SIZES, pngs):
        s = pygame.image.load(str(p))
        assert s.get_size() == (n, n)
        alpha = pygame.surfarray.array_alpha(s)
        assert set(alpha.flat) == {0, 255} and alpha[0, 0] == 0
    assert f"Exec={shlex.quote(sys.executable)} -m warlords2\n" in entry.read_text()
    assert desktop.install(store, tmp_path) == []           # current: nothing rewritten
    entry.write_text("[Desktop Entry]\nExec=old\n")
    assert desktop.install(store, tmp_path) == [entry]


@pytest.mark.gamedata
def test_install_does_nothing_under_the_dummy_driver_or_off_linux(store, tmp_path, monkeypatch):
    assert desktop.install(store, tmp_path) == []
    monkeypatch.setattr(pygame.display, "get_driver", lambda: "x11")
    monkeypatch.setattr(sys, "platform", "win32")
    assert desktop.install(store, tmp_path) == [] and not any(tmp_path.iterdir())


@pytest.mark.gamedata
def test_install_does_nothing_without_the_start_files(store, x11, tmp_path, monkeypatch):
    from warlords2.assets import sprites
    monkeypatch.setattr(sprites, "ICON_SHEET", "START/MISSING.PCK")
    assert desktop.install(store, tmp_path) == [] and not any(tmp_path.iterdir())


def test_install_is_never_fatal(x11, tmp_path):
    assert desktop.install(object(), tmp_path) == []
