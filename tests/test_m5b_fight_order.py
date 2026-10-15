"""M5b: the Fight Order dialog (ovl38:0de1..1475) and its HLP selectors 45-71."""
import os

os.environ["SDL_VIDEODRIVER"] = "dummy"
os.environ["SDL_AUDIODRIVER"] = "dummy"

import pygame  # noqa: E402
import pytest  # noqa: E402

from warlords2.app import App  # noqa: E402
from warlords2.config import parse_args  # noqa: E402
from warlords2.ui import registry  # noqa: E402
from warlords2.ui.dialogs import fight_order as FO  # noqa: E402
from warlords2.ui.info import LARGE, panel_rect  # noqa: E402
from warlords2.ui.layout import DISABLED, NORMAL  # noqa: E402

gamedata = pytest.mark.gamedata
UP = pygame.event.Event(pygame.MOUSEBUTTONUP, button=1, pos=(320, 240))


def test_helpers():
    row = [8, 3, 1, 6, 12, 28, 5, 11, 16, 17, 13, 0, 9, 10, 2, 15, 4, 7, 14, 25, 18, 21, 22, 20, 19, 26, 24, 23, 27]
    assert FO.type_at(row, 0) == 11 and FO.type_at(row, 28) == 5 and FO.type_at(row, 30) == FO.NO_TYPE
    s = FO.swapped(row, 0, 1)
    assert s[11] == 1 and s[2] == 0 and sorted(s) == sorted(row)
    assert FO.slot_xy(0) == (88, 128) and FO.slot_xy(26) == (328, 314)


def test_selectors_registered():
    registry.load_all()
    for w in (45, 58, 71):
        assert registry.help_selector_for(w) is FO.slot_help
    assert registry.help_selector_for(44) is not FO.slot_help and registry.help_selector_for(72) is None
    assert registry.has_dialog("fight_order") and registry.has_action(registry.MENU_ID["fight_order"])


@pytest.fixture
def fo(game, tmp_path):
    a = App(parse_args(["--data", game, "--headless", "--no-voice", "--seed", "3", "--scenario", "TUTORIA",
                        "--controls", "HCCCCCCH", "--scale", "1", "--user-dir", str(tmp_path / "u")]))
    from test_m5b_ui import _settle            # the turn-1 dialogs of M7b / M6b answered
    g = _settle(a)
    yield a, g
    a.close()


def _open(g):
    registry.run_action(registry.MENU_ID["fight_order"], g)
    d = g.dialogs.top
    assert d.dialog_id == "fight_order"
    return d


@gamedata
def test_button_states_follow_the_chosen_slot(fo):
    _, g = fo
    d = _open(g)
    s = d.row.state
    assert s[FO.UP] == s[FO.DOWN] == DISABLED and s[FO.OK] == s[FO.CANCEL] == s[FO.RESET] == NORMAL
    assert all(s[FO.SLOT + n] == NORMAL for n in range(27)) and len(d.row.buttons) == 5 + 27
    d.press(FO.SLOT)
    assert d.chosen == 0 and s[FO.UP] == DISABLED and s[FO.DOWN] == NORMAL
    d.press(FO.SLOT)                                                # its own slot again: none chosen
    assert d.chosen == -1
    d.press(FO.SLOT + 26)
    assert s[FO.UP] == NORMAL and s[FO.DOWN] == DISABLED


@gamedata
def test_edits_are_set_fight_order_commands(fo, monkeypatch):
    _, g = fo
    st = g.state
    before = list(st.fight_order[0])
    sent = []
    real = g.command
    monkeypatch.setattr(g, "command", lambda cmd: (sent.append(cmd), real(cmd))[1])
    d = _open(g)
    d.press(FO.SLOT + 1)
    d.press(FO.DOWN)
    assert d.chosen == 2 and st.fight_order[0] == FO.swapped(before, 1, 2)
    d.press(FO.SLOT + 2)
    d.press(FO.SLOT + 4)
    d.press(FO.SLOT + 8)                                            # swap 4 <-> 8, nothing chosen
    want = FO.swapped(FO.swapped(before, 1, 2), 4, 8)
    assert d.chosen == -1 and st.fight_order[0] == want
    assert [list(c.order) for c in sent] == [FO.swapped(before, 1, 2), want]
    d.press(FO.OK)
    assert not g.dialogs and st.fight_order[0] == want and len(sent) == 2


@gamedata
def test_cancel_restores_and_reset_takes_row_8(fo):
    _, g = fo
    st = g.state
    before = list(st.fight_order[0])
    d = _open(g)
    d.press(FO.SLOT)
    d.press(FO.SLOT + 5)
    assert st.fight_order[0] != before
    d.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_ESCAPE, mod=0, unicode="\x1b", scancode=0)], 16)
    assert not g.dialogs and st.fight_order[0] == before
    st.fight_order[8] = list(reversed(range(29)))
    d = _open(g)
    d.press(FO.RESET)
    assert st.fight_order[0] == st.fight_order[8] and d.chosen == -1
    d.update([pygame.event.Event(pygame.KEYDOWN, key=pygame.K_RETURN, mod=0, unicode="\r", scancode=0)], 16)
    assert not g.dialogs and st.fight_order[0] == list(reversed(range(29)))


@gamedata
def test_slot_help_opens_the_type_panel(fo):
    a, g = fo
    st = g.state
    d = _open(g)
    rec = FO.kit(a).text.hlp(FO.SLOT + 3)
    assert rec["word2"] == 48
    a.input.buttons.add(3)                                          # the right button is held
    a.input.pos = (464, 143)                                        # ovl15:0000's pointer
    d.update([pygame.event.Event(pygame.MOUSEBUTTONDOWN, button=3, pos=(464, 143))], 16)
    top = g.dialogs.top
    assert top.dialog_id == "info/army_type"
    assert top.rect == panel_rect((464, 143), LARGE)
    t = FO.type_at(st.fight_order[0], 3)
    fb = pygame.Surface((640, 480), depth=8)
    top.draw(fb)                                                    # ovl46:032a draws without error
    assert FO.slot_help(g, rec, 48) is None                         # DS:1174 set: nothing more
    assert t != FO.NO_TYPE
