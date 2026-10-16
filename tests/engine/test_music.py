"""rules.music: the music call ovl58:0000 (raw-byte disassembly of WARLORD2.EXE at file offset
0x73b40), the Settings switch ovl33:0576(0) and the 18 call sites (M10c, register X32 model O1).

Every die is logged as (dice, sides, add) in the order drawn, with markers of the traced
steps between them, so each test pins where the music die lies among the game's rolls."""
import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, Control, ItemState, SiteKind
from warlords2.model.music import MusicWords
from warlords2.rules import city as CT
from warlords2.rules import engine
from warlords2.rules import heroes as H
from warlords2.rules import music as MU
from warlords2.rules import present as PR
from warlords2.rules import quests as Q
from warlords2.rules import rng as R
from warlords2.rules import saveload as SL
from warlords2.rules import turn as T
from warlords2.rules import victory as VI
from warlords2.rules.constants import music as K
from warlords2.rules.engine import IllegalCommand
from warlords2.model.state import SCN_VICTORY

from test_bonuses import mk_state, put
from test_city import add_city
from test_heroes import hero, mk
from test_quests import qstate, quest
from test_ruins import mkr, site

HUMAN, COMP = Control.HUMAN, Control.COMPUTER
gamedata = pytest.mark.gamedata

# mode -> ((group, index) with every die returning its lowest value, the draws)
TABLE = {0: ((8, 0), []), 1: ((10, 0), [(1, 8, -1)]), 3: ((9, 0), [(1, 3, -1)]),
         4: ((12, 0), []), 5: ((13, 0), [(1, 2, -1)]), 6: ((14, 0), [(1, 1, -1)]),
         7: ((15, 0), []), 8: ((16, 0), []), 9: ((17, 0), []), 10: ((18, 0), []), 11: ((19, 0), [])}


class Log(list):
    """Rolls (dice, sides, add) and markers (str) in order; `script` forces the next results."""

    def __init__(self):
        super().__init__()
        self.script = []

    def draws(self):
        return [e for e in self if isinstance(e, tuple)]

    def mark(self, mod, name, label):
        """`label` at the call, "/" + `label` at its return."""
        f = getattr(mod, name)

        def wrap(*a, **k):
            self.append(label)
            try:
                return f(*a, **k)
            finally:
                self.append("/" + label)
        return wrap

    def inside(self, label):
        """The draws between each `label` and its end marker, per call."""
        out, cur = [], None
        for e in self:
            if e == label:
                cur = []
            elif e == "/" + label:
                out.append(cur)
                cur = None
            elif cur is not None and isinstance(e, tuple):
                cur.append(e)
        return out


@pytest.fixture
def log(monkeypatch):
    lg = Log()
    orig = R.Rng.rnd

    def rnd(self, d, s, a):
        v = lg.script.pop(0) if lg.script else orig(self, d, s, a)
        lg.append((d, s, a))
        return v
    monkeypatch.setattr(R.Rng, "rnd", rnd)
    return lg


def trace(monkeypatch, log, *targets):
    for mod, name, label in targets:
        monkeypatch.setattr(mod, name, log.mark(mod, name, label))


def on(st, mode=-1, playing=0):
    st.music.on, st.music.mode, st.music.playing = 1, mode, playing
    return st


def started(ev):
    return [(e.info["mode"], e.info["group"], e.info["index"], e.info["loop"], e.info["site"])
            for e in ev if isinstance(e, E.MusicStarted)]


# ----------------------------------------------------------------------------- ovl58:0000


@pytest.mark.parametrize("mode", sorted(TABLE))
def test_mode_table_and_draws(log, mode):
    """ovl58:003f..017b: (group, index) per mode; a negative index draws rnd(1, n, -1) in
    ovl59:052f, n the FILE.DAT group size (1-entry group 14 too); loop flag 1 (0065)."""
    st = on(mk_state())
    log.script = [0] * 4
    ev = MU.play(st, mode, "x")
    (group, index), draws = TABLE[mode]
    assert started(ev) == [(mode, group, index, 1, "x")] and log.draws() == draws
    w = st.music
    assert (w.mode, w.playing, w.loop, w.track, w.starts) == (mode, 1, 1, (group, index), 1)


@pytest.mark.parametrize("group,n", [(9, 3), (10, 8), (13, 2)])
def test_random_pick_is_the_die(log, group, n):
    """index = min(rnd(1, n, -1), n - 1): every entry reachable, the last one too."""
    mode = next(m for m, ((g, _), _) in TABLE.items() if g == group)
    for face in range(n):
        st = on(mk_state())
        log.script = [face]
        assert started(MU.play(st, mode, "x"))[0][1:3] == (group, face)


@pytest.mark.parametrize("r,group,draws", [
    (5, 12, [(1, 100, 0), (1, 1, -1)]),       # r < 6: (12, -1), the 1-entry group draws too
    (6, 11, [(1, 100, 0), (1, 5, -1)]),
    (52, 11, [(1, 100, 0), (1, 5, -1)]),
    (53, 10, [(1, 100, 0), (1, 8, -1)])])     # r >= 53
def test_mode2_without_a_live_human(log, r, group, draws):
    """ovl58:0096..00f6: no side with 0x137 != 0 and 0x0d0 == 0 -> rnd(1, 100, 0) picks the
    group; a dead human side does not count; repeat flag 0 (011b)."""
    st = on(mk_state())
    for p in st.players:
        p.control = COMP
    st.players[3].control, st.players[3].alive = HUMAN, 0
    log.script = [r, 0]
    ev = MU.play(st, 2, "ovl61:21d4")
    assert started(ev) == [(2, group, 0, 0, "ovl61:21d4")] and log.draws() == draws
    assert st.music.loop == 0


def test_mode2_with_a_live_human_draws_only_the_pick(log):
    """00cb je 00f6: a live human side -> (11, -1) at once, one die."""
    st = on(mk_state())
    st.players[0].control = COMP
    st.players[7].control = HUMAN
    log.script = [4]
    assert started(MU.play(st, 2, "y")) == [(2, 11, 4, 0, "y")] and log.draws() == [(1, 5, -1)]


@pytest.mark.parametrize("mode", list(range(12)))
def test_music_off_draws_nothing_and_writes_nothing(log, mode):
    """0007: DS:0bee == 0 -> return before DS:2632 is written."""
    st = mk_state()
    before = st.music.copy()
    assert MU.play(st, mode, "x") == [] and log.draws() == [] and st.music == before


def test_same_mode_still_playing_returns(log):
    """0011..0020: mode == DS:2632 and 155e:04a8 (O1: the playing flag) -> nothing; after a stop
    the same mode starts and rolls again; another mode starts (and rolls) at once."""
    st = on(mk_state())
    MU.play(st, 1, "a")
    assert MU.play(st, 1, "b") == [] and len(log.draws()) == 1 and st.music.starts == 1
    MU.stop(st.music)
    assert started(MU.play(st, 1, "c")) and len(log.draws()) == 2
    assert started(MU.play(st, 5, "d")) and log.draws()[-1] == (1, 2, -1) and st.music.starts == 3
    MU.play(st, 2, "e")
    assert MU.play(st, 2, "f") == [] and st.music.mode == 2 and st.music.playing


def test_no_driver_draws_but_starts_nothing(log):
    """res_155e:0412 / 032f do nothing without DS:37a3; ovl59:052f has rolled already."""
    st = on(mk_state())
    st.music.driver = 0
    assert MU.play(st, 3, "x") == [] and log.draws() == [(1, 3, -1)]
    assert st.music.mode == 3 and not st.music.playing and not MU.still_playing(st.music)


def test_pregame_start_without_a_game():
    """Modes 0 / 11 (ovl60:00fb, ovl57:003a, ovl57:0e24) have fixed entries: `start` on the
    run's words; a die mode without the game's roller is refused before anything changes."""
    w = MusicWords(on=1)
    assert started(MU.start(w, 0, "ovl60:00fb")) == [(0, 8, 0, 1, "ovl60:00fb")]
    assert MU.start(w, 0, "ovl57:003a") == []
    assert started(MU.start(w, 11, "ovl57:0e24")) == [(11, 19, 0, 1, "ovl57:0e24")]
    before = w.copy()
    for mode in (1, 2, 3, 5, 6):
        with pytest.raises(ValueError):
            MU.start(w, mode, "x")
    assert w == before
    with pytest.raises(ValueError):
        MU.start(w, 12, "x")


# ----------------------------------------------------------------------------- Settings


def test_set_music_toggle(log):
    """ovl33:0576(0): stop (0782), DS:0bee toggled, on -> ovl58:0000(1), which rolls even with
    DS:2632 == 1 (the stop cleared the playing flag); off draws nothing."""
    st = on(mk_state(), mode=1, playing=1)
    assert engine.apply(st, C.SetMusic(False)) == [] and log.draws() == []
    assert (st.music.on, st.music.playing, st.music.mode) == (0, 0, 1)
    ev = engine.apply(st, C.SetMusic(True))
    assert started(ev) == [(1, 10, ev[0].info["index"], 1, "ovl33:05a0")] and log.draws() == [(1, 8, -1)]


@pytest.mark.parametrize("value", [True, False])
def test_set_music_to_the_value_it_has_is_refused(log, value):
    """058e..0596 DS:0bee = !DS:0bee: the box toggles, so no click sets the switch to what it
    is (on -> on would roll a die no EXE run draws)."""
    st = mk_state()
    st.music.on = int(value)
    before = st.music.copy()
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetMusic(value))
    assert st.music == before and log.draws() == []


def test_set_music_needs_the_driver_and_no_question_up(log):
    """ovl33:0079: the box is disabled without DS:37a3.  Under a pending question (a modal
    pop-up, DS:166a set) Settings does not open (07be:0064 skips the menu keys, 00a9): not in
    ANYTIME, unlike SetSpeech."""
    st = mk_state()
    st.music.driver = 0
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetMusic(True))
    st.music.driver = 1
    st.pending = E.SageOffered({})
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetMusic(True))
    assert st.music.on == 0 and log.draws() == []
    engine.apply(st, C.SetSpeech(True))                # the speech switch answers nothing: legal
    st.pending = None
    assert started(engine.apply(st, C.SetMusic(True)))


def _play_then_fail(state, cmd):
    state.music.on = 1
    MU.play(state, 1, "x")
    raise IllegalCommand("refused")


def test_refused_command_rolls_the_music_words_back(log, monkeypatch):
    """A refused command stands for one the EXE never carried out: the rollback puts the game,
    the dice and the music words back (the same object), so a retry draws the same dice."""
    monkeypatch.setitem(engine.DISPATCH, C.SetMusic, ("M10c", "test_music:_play_then_fail"))
    st = mk_state()
    words = st.music
    before = words.copy()
    h = st.hash()
    with pytest.raises(IllegalCommand):
        engine.apply(st, C.SetMusic(True))
    assert len(log.draws()) == 1 and st.hash() == h
    assert st.music is words and words == before


def test_snapshot_restore_puts_the_words_back_in_place():
    """model.serialize.snapshot / restore (also states.game.run_snapshot / run_restore)."""
    from warlords2.model.serialize import restore, snapshot
    st = on(mk_state(), mode=2, playing=1)
    words = st.music
    snap = snapshot(st)
    MU.stop(words)
    MU.play(st, 5, "x")
    restore(st, snap)
    assert st.music is words and (words.mode, words.playing, words.starts, words.on) == (2, 1, 0, 1)


def test_words_are_outside_the_hash_and_copied():
    st = mk_state()
    h = st.hash()
    on(st, mode=5, playing=1)
    assert st.hash() == h
    cp = st.copy()
    assert cp.music == st.music and cp.music is not st.music


# ----------------------------------------------------------------------------- call sites


def _hero_ready(st, level_exp=15):
    h = hero(st)
    st.heroes[h.hero_slot].exp = level_exp
    return h


def test_promotion_mode7_human_only(log):
    """ovl47:071a ovl25:09ab == 0 -> 0726 ovl58:0000(7) (no die), before the HeroPromoted."""
    st = on(mk())
    _hero_ready(st)
    ev = H.promote_all(st)
    assert started(ev) == [(7, 15, 0, 1, "ovl47:0726")] and isinstance(ev[1], E.HeroPromoted)
    st = on(mk())
    st.players[0].control = COMP
    _hero_ready(st)
    assert started(H.promote_all(st)) == [] and st.music.mode == -1


def _medal(st):
    from test_heroes import _battle
    h = hero(st, 0, 10, 10)
    u = [put(st, 1, 0, 10, 10, strength=5) for _ in range(2)]
    from warlords2.rules import selection as S
    S.select_army_stack(st, st.armies[u[0]])
    st.selection.moving = [h.id] + u
    st.selection.selected, st.selection.hero = h.id, h.id
    st.turn, st.battle_work.attacker = 30, 0
    return _battle(st, [h.id] + u, [90, 91])


def test_medal_modes_8_then_1_around_the_text_rolls(log, monkeypatch):
    """ovl36:24c9 mode 8 (writes DS:2632) before the text rolls 2524 / 2581, mode 1 after the
    pop-up (2668): a die right after the two text rolls; events 8, MedalAwarded, 1."""
    st = on(mk())
    b = _medal(st)
    log.script = [1, 1]                              # the chance (1 < 40) and the pick
    modes = []
    orig = R.Rng.rnd
    monkeypatch.setattr(R.Rng, "rnd", lambda self, d, s, a: (modes.append(st.music.mode), orig(self, d, s, a))[1])
    ev = H.award_medal(st, b)
    assert [type(e).__name__ for e in ev] == ["MusicStarted", "MedalAwarded", "MusicStarted"]
    assert started(ev)[0][:3] == (8, 16, 0) and started(ev)[1][0] == 1
    assert modes == [-1, -1, 8, 8, 1]       # chance, pick, (158) and (160) after DS:2632 = 8, then 0028 of mode 1


def test_medal_draws_in_order(log):
    st = on(mk())
    b = _medal(st)
    log.script = [1, 1, 1, 1, 1]
    H.award_medal(st, b)
    assert log.draws() == [(1, 100, 0), (1, 2, -1), (1, 7, -1), (1, 4, -1), (1, 8, -1)]


def test_medal_of_a_computer_attacker_plays_nothing(log):
    st = on(mk())
    b = _medal(st)
    st.players[1].control, st.battle_work.attacker = COMP, 1
    log.script = [1, 1]
    ev = H.award_medal(st, b)
    assert started(ev) == [] and log.draws() == [(1, 100, 0), (1, 2, -1)]


def test_temple_menu_die_first(log):
    """ovl01:0006: the temple menu's first call is mode 5 (13, -1): the only roll of the Search."""
    st = on(mkr())
    si = site(st, 5, 5, SiteKind.TEMPLE)
    hr = hero(st)
    log.script = [1]
    ev = engine.apply(st, C.Search((hr.id,)))
    assert log.draws() == [(1, 2, -1)] and ev[0].info["temple_menu"] and ev[0].info["site"] == si
    assert started(ev) == [(5, 13, 1, 1, "ovl01:0006")]
    engine.apply(st, C.TempleChoice("bless"))         # the blessing plays nothing
    assert len(log.draws()) == 1


def test_computer_temple_blessing_plays_nothing(log):
    st = on(mkr())
    site(st, 5, 5, SiteKind.TEMPLE)
    st.players[0].control = COMP
    hr = hero(st)
    st.selection.selected = st.selection.hero = hr.id
    st.selection.moving = [hr.id]
    from warlords2.rules import ruins as RU
    assert started(RU.search_selection(st)) == [] and log.draws() == []


def test_sage_mode6_after_the_list(log):
    """ovl34:0aad: mode 6 (14, -1) after the list ovl34:1610 (no roll), before the menu."""
    st = on(mkr(hidden_map=1))
    site(st, 20, 20, SiteKind.SAGE)
    site(st, 25, 20, SiteKind.GOLD_RUIN, flag=1, shown=0)
    hr = hero(st, x=20, y=20)
    ev = engine.apply(st, C.Search((hr.id,)))
    assert log.draws() == [(1, 1, -1)] and started(ev) == [(6, 14, 0, 1, "ovl34:0aad")]
    names = [type(e).__name__ for e in ev]
    assert names.index("MusicStarted") < names.index("SageOffered")


def test_quest_completed_mode3_after_the_reward(log):
    """ovl01:272c: human (2723 ovl25:09ab == 0), after the reward 1909 / 1c02: the last roll."""
    st, h = qstate()
    on(st)
    quest(st, h, 1, target=9)
    st.items[9].state, st.items[9].holder = int(ItemState.CARRIED), h.id
    done, ev = Q.check(st, (3, 0, 0, 0, 0))
    assert done == 1 and log.draws()[-1] == (1, 3, -1) and len(log.draws()) >= 2
    names = [type(e).__name__ for e in ev]
    assert names.index("QuestCompleted") < names.index("MusicStarted") and started(ev)[0][:2] == (3, 9)


def test_computer_quest_completion_plays_nothing(log):
    st, h = qstate()
    on(st)
    st.players[0].control = COMP
    quest(st, h, 1, target=9)
    st.items[9].state, st.items[9].holder = int(ItemState.CARRIED), h.id
    assert started(Q.check(st, (3, 0, 0, 0, 0))[1]) == [] and st.music.mode == -1


def _turn5(st):
    st.turn = 5
    st.players[0].gold = 0                     # the offer check draws the price, then no offer
    return st


def test_turn_start_mode1_after_the_offer_check_before_production(log, monkeypatch):
    """ovl68:0539..0546: no offer (ovl47:0000 == 0), SCN 0x15b clear -> mode 1, a die, after the
    check's rolls and before ovl43:0000."""
    st = on(_turn5(mk()), mode=2, playing=1)
    trace(monkeypatch, log, (H, "human_offer_check", "ovl47:0000"), (CT, "deliver", "ovl43:0000"))
    ev = T.resume(st, 0)
    assert log == ["ovl47:0000", (1, 400, 300), "/ovl47:0000", (1, 8, -1), "ovl43:0000", "/ovl43:0000"]
    assert started(ev)[0][:2] == (1, 10)


def test_turn_start_offer_mode4_between_check_and_dialog(log, monkeypatch):
    """ovl68:0529: an offer -> mode 4 (12, 0), no die, before ovl47:0d5c (whose name roll is
    after it); resume(1) after the answer plays nothing."""
    st = on(mk(), mode=1, playing=1)
    st.players[0].capital = (11, 21)
    add_city(st, 10, 20, 0)
    modes = []
    orig = R.Rng.rnd
    monkeypatch.setattr(R.Rng, "rnd", lambda self, d, s, a: (modes.append(st.music.mode), orig(self, d, s, a))[1])
    ev = T.resume(st, 0)
    names = [type(e).__name__ for e in ev]
    assert names[:2] == ["MusicStarted", "HeroOffered"] and started(ev)[0][:3] == (4, 12, 0)
    assert modes == [4]                                  # the name roll of 0d5c
    ev = engine.apply(st, C.AcceptHero(True))
    assert started(ev) == [] and st.music.mode == 4


def test_turn_start_after_the_victory_button_plays_nothing(log):
    """ovl68:0521 / 053e: SCN 0x15b set -> neither mode 4 nor 1 (CloseVictory -> 04bd(0))."""
    st = on(_turn5(mk()))
    VI.victory_screen(st)
    st.flags[SCN_VICTORY] = 1
    st.music.mode = 3
    n = len(log.draws())
    ev = engine.apply(st, C.CloseVictory())
    assert started(ev) == [] and st.music.mode == 3 and (1, 8, -1) not in log.draws()[n:]


def test_offer_after_the_victory_plays_nothing(log):
    """ovl68:051c..0527: an offer with SCN 0x15b set -> the dialog without mode 4."""
    st = on(mk(), mode=3, playing=1)
    st.flags[SCN_VICTORY] = 1
    st.flags[T.K.SCN_ACK_VICTORY.value] = 1
    st.players[0].capital = (11, 21)
    add_city(st, 10, 20, 0)
    ev = T.resume(st, 0)
    assert isinstance(ev[0], E.HeroOffered) and started(ev) == [] and st.music.mode == 3


def test_victory_screen_mode3_first(log):
    """ovl61:1fc0: mode 3 (9, -1), a die, before 0x157 = 1; accepting a surrender gets there."""
    st = on(_turn5(mk()))
    st.players[1].control = COMP
    VI.surrender_offer(st)
    assert st.music.mode == 9 and log.draws() == []
    ev = engine.apply(st, C.AcceptSurrender(True))
    assert started(ev)[0][:2] == (3, 9) and log.draws() == [(1, 3, -1)]
    assert isinstance(ev[-1], E.Victory)


def test_surrender_offer_mode9_and_declined_10_then_1(log):
    """ovl61:1f76 mode 9 (17, 0); button 0x1e6 ovl61:1edb mode 10 (18, 0), no die; its button
    -> ovl68:04bd(0) -> 0546 mode 1, a die (10 -> 1)."""
    st = on(_turn5(mk()))
    ev = VI.surrender_offer(st)
    assert started(ev) == [(9, 17, 0, 1, "ovl61:1f76")]
    ev = engine.apply(st, C.AcceptSurrender(False))
    s = started(ev)
    assert [m[:3] for m in s][0] == (10, 18, 0) and s[1][0] == 1 and s[1][4] == "ovl68:0546"
    assert log.draws() == [(1, 400, 300), (1, 8, -1)]
    names = [type(e).__name__ for e in ev]
    assert names[:2] == ["MusicStarted", "TurnCue"]


def _saved(st):
    rec = {"str_44": "x"}
    return SL.saved_part(st, rec), SL.run_part(st)


def test_load_die_after_the_overview_rolls(log):
    """ovl49:040a: after a load from the Game Start screen (mode 0 before): 256 rnd(1, 3, 1)
    of ovl63:232b, then mode 1's die; the run's words are the loaded game's."""
    st = on(mk(), mode=0, playing=1)
    saved, run = _saved(st)
    loaded = SL.load(saved, run, where="game_start")
    assert loaded.rebuilt and loaded.state.music is st.music
    got = []
    PR.attach(__import__("threading").current_thread(), lambda p, i: got.append((p, i)))
    try:
        ev = SL.after_load(loaded.state, loaded.rebuilt, "game_start")
    finally:
        PR.detach(__import__("threading").current_thread())
    assert log.draws() == [(1, 3, 1)] * 256 + [(1, 8, -1)] and started(ev)[0][4] == "ovl49:040a"
    assert dict(got)["music"]["events"] == ev


def test_in_game_load_with_mode1_playing_draws_nothing(log):
    st = on(mk(), mode=1, playing=1)
    saved, run = _saved(st)
    rec = saved["record"]
    loaded = SL.load(saved, run, where="game", live_record=rec)
    assert not loaded.rebuilt and SL.after_load(loaded.state, False, "game") == [] and log.draws() == []


def test_run_part_carries_the_words():
    """RunPart.music: the run's one object, into a load (merge), a Begin (begin_carry) and from
    a fresh run (fresh_run_part)."""
    st = mk()
    run = SL.run_part(st)
    assert run.music is st.music
    other = mk()
    SL.begin_carry(other, run)
    assert other.music is st.music
    w = MusicWords(on=1)
    assert SL.fresh_run_part(None, st.army_types, music=w).music is w
    assert SL.fresh_run_part(None, st.army_types).music is None


@gamedata
def test_group_sizes_match_file_dat(game):
    """GROUP_SIZES and the mode table's fixed entries exist in the user's DATA/FILE.DAT."""
    from warlords2.formats.gamedir import GameDir
    from warlords2.formats.tables import StringTable
    t = StringTable(GameDir(game).read("DATA/FILE.DAT"))
    for g, n in K.GROUP_SIZES.value.items():
        assert len(t.groups[g]) == n, g
    for g, i in K.TRACKS.value.values():
        assert i < len(t.groups[g])


# ----------------------------------------------------------------------------- the main loop


def _erythea(game, music=True):
    from movekit import scenario_state
    st = scenario_state(game, "ERYTHEA", seed=3, controls=(HUMAN,) + (COMP,) * 7)
    st.turn = 2
    if music:
        on(st, mode=1, playing=1)
    return st


@gamedata
def test_computer_phase_die_before_the_computer_turn(game, log, monkeypatch):
    """ovl61:21d4: mode 2 after the pass top, before ovl68:0000 (computer_turn's first roll);
    one die (1, 5, -1) with a live human; the next computer sides find mode 2 playing (no
    die); the human turn start then rolls mode 1 (2 -> 1)."""
    st = _erythea(game)
    trace(monkeypatch, log, (T, "computer_turn", "ovl68:0000"), (T, "pass_top", "pass_top"),
          (MU, "play", "ovl58:0000"), (H, "human_offer_check", "ovl47:0000"),
          (CT, "deliver", "ovl43:0000"))
    assert st.players[st.current].control == HUMAN
    engine.apply(st, C.EndTurn())
    first = log.index("ovl68:0000")
    assert log[first - 4:first + 1] == ["/pass_top", "ovl58:0000", (1, 5, -1), "/ovl58:0000", "ovl68:0000"]
    sides = [i for i, e in enumerate(log) if e == "ovl68:0000"]
    assert len(sides) >= 2
    for i in sides[1:]:                                    # 2 -> 2: nothing
        assert log[i - 3:i] == ["/pass_top", "ovl58:0000", "/ovl58:0000"]
    k = log.index("ovl47:0000")                           # the human turn start: 2 -> 1 or 4
    m = log.index("ovl58:0000", k)
    if isinstance(st.pending, E.HeroOffered):
        assert log[m:m + 2] == ["ovl58:0000", "/ovl58:0000"] and st.music.mode == 4
    else:
        assert log[m:m + 4] == ["ovl58:0000", (1, 8, -1), "/ovl58:0000", "ovl43:0000"]
        assert st.music.mode == 1


@gamedata
def test_computer_phase_music_off_draws_no_music_die(game, log, monkeypatch):
    """With the music off every call draws nothing and writes nothing."""
    trace(monkeypatch, log, (MU, "play", "ovl58:0000"))
    a = _erythea(game, music=False)
    engine.apply(a, C.EndTurn())
    calls = log.inside("ovl58:0000")
    assert len(calls) >= 8 and not any(calls) and a.music == MusicWords()


@gamedata
def test_settings_on_during_the_computer_interrupt(game, log, monkeypatch):
    """ovl25:045e opens Settings during a computer side; the loop stops at ovl61:220b; the
    box switched off and on plays mode 1 (a die) mid-phase, and the next side's 21d4 rolls
    again (1 -> 2)."""
    st = _erythea(game)
    engine.apply(st, C.EndTurn(max_sides=0))                 # to the first computer side
    assert st.players[st.current].control == COMP
    stop = [True]
    th = __import__("threading").current_thread()
    PR.attach(th, lambda p, i: stop.pop() if p == "loop_check" and stop else None)
    try:
        T.run(st)
    finally:
        PR.detach(th)
    assert st.music.mode == 2 and st.players[st.current].control == COMP
    n = len(log)
    engine.apply(st, C.SetMusic(False))
    ev = engine.apply(st, C.SetMusic(True))
    assert started(ev)[0][0] == 1 and log[n:] == [(1, 8, -1)]
    trace(monkeypatch, log, (T, "computer_turn", "ovl68:0000"))
    T.run(st, max_sides=1)
    assert log[n + 1:n + 3] == [(1, 5, -1), "ovl68:0000"] and st.music.mode == 2
