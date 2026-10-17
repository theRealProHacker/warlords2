"""The window icon: the title's "W" from the user's START/STEXT.PCK, on a transparent square."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"

import pygame
import pytest

from warlords2.assets import sprites
from warlords2.assets.sprites import has_icon_files, set_window_icon, window_icon
from warlords2.assets.store import AssetStore
from warlords2.formats.gamedir import GameDir


@pytest.fixture(scope="module")
def store(game):
    pygame.display.init()
    return AssetStore(GameDir(game))


@pytest.mark.gamedata
@pytest.mark.parametrize("size", [32, 64, 128])
def test_icon_is_a_transparent_square_with_the_gold_w(store, size):
    s = window_icon(store, size)
    assert s.get_size() == (size, size)
    assert s.get_flags() & pygame.SRCALPHA
    alpha = pygame.surfarray.array_alpha(s)
    assert set(alpha.flat) <= {0, 255}
    assert alpha[0, 0] == alpha[-1, 0] == alpha[0, -1] == alpha[-1, -1] == 0
    assert 0.25 * size * size < (alpha == 255).sum() < size * size
    r, g, b = pygame.surfarray.array3d(s)[alpha == 255].mean(0)
    assert r > g > b                          # gold lettering


@pytest.mark.gamedata
def test_the_w_is_the_largest_component(store):
    idx = pygame.surfarray.array2d(store.surface(sprites.ICON_SHEET, sprites.ICON_KEY)).T
    bx, by = sprites.ICON_BLANK
    idx[by:, bx:] = sprites.ICON_KEY
    x, y, w, h = sprites.ICON_CROP
    opaque = idx[y:y + h, x:x + w] != sprites.ICON_KEY
    w_only = sprites._largest_component(opaque)
    assert w_only.sum() == 13704 and opaque.sum() - w_only.sum() == 31


@pytest.mark.gamedata
def test_set_window_icon_skips_under_the_dummy_driver(store):
    set_window_icon(store)                    # no window, no error


@pytest.mark.gamedata
def test_no_icon_without_the_start_files(store, monkeypatch):
    assert has_icon_files(store)
    monkeypatch.setattr(sprites, "ICON_PALETTE", "START/MISSING.PAL")
    assert not has_icon_files(store)
    monkeypatch.setattr(pygame.display, "get_driver", lambda: "x11")
    monkeypatch.setattr(pygame.display, "set_icon", lambda s: pytest.fail("icon set"))
    set_window_icon(store)
