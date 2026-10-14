"""rules.combat: fight order, battle loop, Attack command, advisor (EL §3.1-3.5).

Exact cases use a scripted die source: every value the roller returns is given, so the
expected outcome follows from the listing (out/asm/ovl36.asm 08a6..0a6a, 0000..0522, 0a6b..,
2065) by hand.  The address each case pins is named in the test.
"""

import pytest

from warlords2.model import commands as C
from warlords2.model import events as E
from warlords2.model.ids import HERO_TYPE, MAP_ARMY, MAP_FORTIFIED, MAP_W, NO_OWNER, Control, Terrain
from warlords2.model.state import SCN_TUTORIAL, BattleWork
from warlords2.rules import combat, engine
from warlords2.rules.bonuses import ABOARD_FLAG
from warlords2.rules.constants import UnverifiedError, allowing_unverified
from warlords2.rules.rng import Rng

from test_bonuses import army, atype, city, default_types, mk_state, put, set_terrain


class Script:
    """Die source returning given values (cycled when `cycle`), recording the sides asked."""

    def __init__(self, values, cycle=False):
        self.values, self.cycle, self.i = list(values), cycle, 0
        self.sides = []

    def die(self, sides):
        self.sides.append(sides)
        if self.i >= len(self.values):
            if not self.cycle:
                raise StopIteration
            self.i = 0
        self.i += 1
        return self.values[self.i - 1]


def script(st, pairs, cycle=False):
    """pairs = [(defender roll, attacker roll), ...] in the order ovl36:0918/093d draws them."""
    st.rng.src = Script([v for p in pairs for v in p], cycle)
    return st.rng.src


def duel_state(a_str=5, d_str=5, n_def=1, **opts):
    st = mk_state(**opts)
    a = put(st, 1, 0, 4, 5, strength=a_str)
    d = [put(st, 2, 1, 5, 5, strength=d_str) for _ in range(n_def)]
    return st, a, d


# ----------------------------------------------------------------------------- battle loop


def test_exchange_rules_exact():
    """ovl36:0974..0a1b: both or neither succeed -> roll again; r1 <= sd (defender's roll first)
    and r2 > sa -> attacker loses a hit; r1 > sd and r2 <= sa -> defender loses a hit; equal to
    the strength counts as success; a unit dies when its hits drop below 0 (2 hits)."""
    st, a, d = duel_state()
    script(st, [(3, 3), (10, 10), (5, 6), (10, 3), (10, 5)])
    b = combat.resolve(st, (a,), 5, 5)
    assert b.attacker_won and not b.unopposed
    assert b.rolls == 5
    assert b.duels[0]["hits"] == ["attacker", "defender", "defender"]
    assert (b.a_hits, b.d_hits, b.kills) == ([0], [-1], [0])


def test_hits_carry_over_between_duels():
    """Hit counters are set once at ovl38:06ed/0712 and not reset per duel."""
    types = default_types()
    st = mk_state(types)
    a = put(st, 1, 0, 4, 5, strength=5)
    d0 = put(st, 2, 1, 5, 5, strength=5)
    d1 = put(st, 3, 1, 5, 5, strength=5)                     # fight order 3 > 2: fights second
    script(st, [(10, 3), (3, 10), (10, 3), (3, 10)])
    b = combat.resolve(st, (a,), 5, 5)
    assert b.setup.defenders == [d0, d1]
    assert not b.attacker_won
    assert b.kills == [0, 1]
    assert (b.a_hits, b.d_hits, b.d_alive) == ([-1], [-1, 1], [False, True])
    assert [x["rolls"] for x in b.duels] == [3, 1]


@pytest.mark.parametrize("intense,sides", [(0, 20), (1, 24)])
def test_die_size(intense, sides):
    """Die 20, or 24 with Intense Combat (asm ovl36:091f..092c)."""
    st, a, d = duel_state(intense_combat=intense)
    src = script(st, [(sides, 1)], cycle=True)
    combat.resolve(st, (a,), 5, 5)
    assert set(src.sides) == {sides} and len(src.sides) == 4


def test_ten_thousand_roll_rule():
    """Counter before increment > 10000 forces (0, 100): pairs 1..10001 are rolled normally,
    pair 10002 and later make the attacker lose a hit (asm ovl36:0961..0971); the counter is not
    reset by a hit, only by a death."""
    st, a, d = duel_state()
    src = script(st, [(1, 1)], cycle=True)                 # both always succeed
    b = combat.resolve(st, (a,), 5, 5)
    assert not b.attacker_won
    assert b.rolls == 10003 and len(src.sides) == 2 * 10003
    assert b.duels[0]["hits"] == ["attacker", "attacker"]


@pytest.mark.parametrize("hero,control,owner,hit", [
    (True, Control.HUMAN, NO_OWNER, False), (False, Control.HUMAN, NO_OWNER, True),
    (True, Control.COMPUTER, NO_OWNER, True), (True, Control.HUMAN, 1, True)])
def test_tutorial_hero_immunity(hero, control, owner, hit):
    """SCN 0x12e set, attacking unit a hero, attacker human (SCN 0xd0), owner nibble 0xf: the
    defender's success costs no hit (asm ovl36:09a1..09cf)."""
    st = mk_state()
    st.flags[SCN_TUTORIAL] = 1
    st.players[0].control = control
    a = put(st, HERO_TYPE if hero else 1, 0, 4, 5, strength=5)
    put(st, 2, owner, 5, 5, strength=5)
    script(st, [(3, 10), (10, 3), (10, 3)])
    b = combat.resolve(st, (a,), 5, 5)
    assert b.attacker_won
    assert b.a_hits == ([0] if hit else [1])
    st.flags[SCN_TUTORIAL] = 0
    script(st, [(3, 10), (10, 3), (10, 3)])
    assert combat.resolve(st, (a,), 5, 5).a_hits == [0]


def test_min_strength_one_in_the_loop():
    """sa = max(1, strength) (asm ovl36:08ed..0912): a strength -2 unit still hits on a 1."""
    st, a, d = duel_state(a_str=1)
    st.army_types[1] = atype(1, strength=1)
    b_setup = combat.prepare(st, (a,), 5, 5)
    b_setup.a_strength[0] = -2
    script(st, [(10, 1), (10, 1)])
    b = combat.fight(st, b_setup)
    assert b.attacker_won and b.duels[0]["a_strength"] == 1


def test_unopposed_city_uses_no_rng():
    """A side with no units: attacker wins, DS:41b2 = 1, no roll (asm ovl36:08c4..08e1)."""
    st = mk_state()
    city(st, 10, 10, 1, 2)
    a = put(st, 1, 0, 9, 10)
    src = script(st, [])
    b = combat.resolve(st, (a,), 10, 10)
    assert b.attacker_won and b.unopposed and src.sides == [] and b.rolls == 0


@pytest.mark.parametrize("sa,sd,intense", [(7, 11, 0), (12, 4, 0), (5, 5, 1)])
def test_per_exchange_rate(sa, sd, intense):
    """Over 10^5 decisive exchanges of seeded battles the attacker's share equals
    sa/die*(1-sd/die) / (that + sd/die*(1-sa/die)) (EL §3.4), within 4 standard errors."""
    st, a, d = duel_state(a_str=sa, d_str=sd, intense_combat=intense)
    st.rng = Rng(2024)
    setup = combat.prepare(st, (a,), 5, 5)
    assert (setup.a_strength, setup.d_strength) == ([sa], [sd])
    die = 24 if intense else 20
    n = wins = 0
    while n < 100_000:
        for duel in combat.fight(st, setup).duels:
            n += len(duel["hits"])
            wins += duel["hits"].count("defender")
    pa, pb = sa / die * (1 - sd / die), sd / die * (1 - sa / die)
    p = pa / (pa + pb)
    assert abs(wins / n - p) < 4 * (p * (1 - p) / n) ** 0.5


# ----------------------------------------------------------------------------- fight order


def test_fight_order_scan_and_stable_sort():
    """Defenders are scanned from the top army index down, then insertion-sorted ascending on
    SCN[0x60b + min(owner, 8)*29 + type] (decomp 06a6ab)."""
    st = mk_state()
    st.fight_order[1][3], st.fight_order[1][4], st.fight_order[1][5] = 5, 2, 5
    ids = [put(st, t, 1, 5, 5) for t in (3, 4, 5)]
    a = put(st, 1, 0, 4, 5)
    s = combat.prepare(st, (a,), 5, 5)
    assert s.defenders == [ids[1], ids[2], ids[0]]
    assert s.d_order == [2, 5, 5]
    st.fight_order[8][3], st.fight_order[8][4], st.fight_order[8][5] = 1, 1, 0
    for i in ids:
        army(st, i).owner = NO_OWNER
    combat.refresh_map(st)
    assert combat.prepare(st, (a,), 5, 5).defenders == [ids[2], ids[1], ids[0]]


def _flyer_state(terrain, hero=True, aboard_first=False):
    types = default_types()
    types[6] = atype(6, flag16=1)
    st = mk_state(types)
    set_terrain(st, 5, 5, terrain)
    f0 = put(st, 6, 1, 5, 5)
    f1 = put(st, 6, 1, 5, 5, flags=ABOARD_FLAG if aboard_first else 0)
    others = [put(st, HERO_TYPE if hero else 7, 1, 5, 5)]
    a = put(st, 1, 0, 4, 5)
    return st, a, f0, f1, others


@pytest.mark.parametrize("terrain", [Terrain.WATER, Terrain.SHORE, Terrain.MOUNTAINS])
def test_flyer_shift_80(terrain):
    """First non-aboard flyer in scan order (top index first) +80 on terrain 2/3/6 when the
    side has a hero (decomp 06a6ab)."""
    st, a, f0, f1, (h,) = _flyer_state(terrain)
    s = combat.prepare(st, (a,), 5, 5)
    assert s.defenders == [f0, h, f1]
    assert s.d_order == [6, HERO_TYPE, 6 + 80]


def test_flyer_shift_skips_aboard_and_needs_hero_and_terrain():
    st, a, f0, f1, _ = _flyer_state(Terrain.WATER, aboard_first=True)
    assert combat.prepare(st, (a,), 5, 5).defenders[-1] == f0
    st, a, f0, f1, _ = _flyer_state(Terrain.WATER, hero=False)
    assert 86 not in combat.prepare(st, (a,), 5, 5).d_order
    st, a, f0, f1, _ = _flyer_state(Terrain.PLAIN)
    assert 86 not in combat.prepare(st, (a,), 5, 5).d_order


def test_flyer_shift_is_signed_byte():
    """Order values are signed bytes: 60 + 80 wraps to -116 and the flyer fights first."""
    st, a, f0, f1, (h,) = _flyer_state(Terrain.WATER)
    st.fight_order[1][6] = 60
    s = combat.prepare(st, (a,), 5, 5)
    assert s.d_order[0] == -116 and s.defenders[0] == f1


# ----------------------------------------------------------------------------- Attack


class Hooks:
    """Recording stand-ins for the other milestones' after-battle steps."""

    def __init__(self, st, quest=0):
        self.calls = []
        self.st = st
        self.quest = quest

    def get(self, name):
        def f(*args):
            self.calls.append((name,) + tuple(args[1:]))
            if name == "hero_died":
                assert any(a.id == args[1] for a in self.st.armies)     # still present
            if name == "quest_check":
                return self.quest, []
            return None if name == "ai_memory" else []
        return f


@pytest.fixture
def hooks(monkeypatch):
    holder = {}

    def install(st, **kw):
        h = Hooks(st, **kw)
        monkeypatch.setattr(combat, "_hook", h.get)
        holder["h"] = h
        return h
    return install


WIN = [(20, 1)]          # defender misses, attacker hits
LOSE = [(1, 20)]


@pytest.mark.parametrize("terrain,cost", [(Terrain.ROAD, 2), (Terrain.PLAIN, 2), (Terrain.FOREST, 4),
                                          (Terrain.HILLS, 6), (Terrain.MARSH, 5)])
def test_attack_cost_and_move_onto_target(hooks, terrain, cost):
    """Cost max(2, DS:1274[t]) paid by every member, floored at 0; members moved onto the target
    and their goto cleared before the battle (decomp 067a70 ovl36:0205, ovl36:0522)."""
    st = mk_state()
    set_terrain(st, 5, 5, terrain)
    a1, a2 = put(st, 1, 0, 4, 5, moves=10), put(st, 1, 0, 4, 5, moves=1)
    army(st, a1).goto = (9, 9)
    put(st, 2, 1, 5, 5)
    hooks(st)
    script(st, WIN, cycle=True)
    ev = engine.apply(st, C.Attack((a1, a2), 5, 5))
    assert [army(st, i).moves_left for i in (a1, a2)] == [10 - cost, 0]
    assert all((army(st, i).x, army(st, i).y, army(st, i).goto) == (5, 5, (-1, -1)) for i in (a1, a2))
    moved = next(e for e in ev if isinstance(e, E.Moved))
    assert moved.info["cost"] == cost
    assert isinstance(ev[-1], E.BattleEnded) and ev[-1].info["attacker_won"]


def test_attack_moves_before_setup(hooks):
    """The stack stands on the target when ovl38:008b runs; the attacker gets its own Forest
    (class 2) bonus w7."""
    st = mk_state()
    set_terrain(st, 5, 5, Terrain.FOREST)
    st.army_types[1] = atype(1, str_bonus_woods=1)
    a = put(st, 1, 0, 4, 5)
    put(st, 2, 1, 5, 5)
    hooks(st)
    script(st, WIN, cycle=True)
    ev = engine.apply(st, C.Attack((a,), 5, 5))
    bs = next(e for e in ev if isinstance(e, E.BattleStarted))
    assert bs.info["a_strength"] == [3]


def test_attack_refusals(hooks):
    """Refused: impassable without road unless flying; own square; non-city square without an
    army (decomp 067a70).  No movement point is not refused: the stack is deselected and
    nothing else changes (asm ovl36:0189..01be, 0b62:08b3)."""
    types = default_types()
    types[6] = atype(6, flag16=1)
    st = mk_state(types)
    hooks(st)
    set_terrain(st, 5, 5, Terrain.MOUNTAINS)
    put(st, 2, 1, 5, 5)
    walker = put(st, 1, 0, 4, 5)
    flyer = put(st, 6, 0, 4, 6)
    with pytest.raises(engine.IllegalCommand):
        engine.apply(st, C.Attack((walker,), 5, 5))
    st.world.roads[5 * MAP_W + 5] = 1
    script(st, WIN, cycle=True)
    engine.apply(st, C.Attack((walker,), 5, 5))           # road makes it enterable
    st = mk_state(types)
    hooks(st)
    set_terrain(st, 5, 5, Terrain.MOUNTAINS)
    put(st, 2, 1, 5, 5)
    flyer = put(st, 6, 0, 4, 6)
    script(st, WIN, cycle=True)
    engine.apply(st, C.Attack((flyer,), 5, 5))            # flying stack
    st = mk_state()
    hooks(st)
    own = put(st, 1, 0, 6, 6)
    a = put(st, 1, 0, 6, 7)
    for target in ((6, 6), (6, 8)):
        with pytest.raises(engine.IllegalCommand):
            engine.apply(st, C.Attack((a,), *target))
    put(st, 2, 1, 7, 7)
    army(st, a).moves_left = 0
    st.selection.selected, st.selection.moving = a, [a]
    rng0 = st.rng.state()
    assert engine.apply(st, C.Attack((a,), 7, 7)) == []
    assert st.selection.selected == -1 and st.selection.moving == [a]
    assert (army(st, a).x, army(st, a).y) == (6, 7) and st.rng.state() == rng0
    assert own >= 0


def test_attack_onto_water_puts_land_units_aboard(hooks):
    """ovl36:0522: target Water/Shore, stack not flying, selected army not aboard -> every
    non-flying member without a flight item gets flag 0x1000 and 0 moves, so it fights at 4."""
    types = default_types()
    types[8] = atype(8, strength=9)
    types[6] = atype(6, flag16=1)
    st = mk_state(types)
    set_terrain(st, 5, 5, Terrain.WATER)
    put(st, 2, 1, 5, 5, flags=ABOARD_FLAG)
    land, fly = put(st, 8, 0, 4, 5), put(st, 6, 0, 4, 5)
    hooks(st)
    script(st, WIN, cycle=True)
    ev = engine.apply(st, C.Attack((land, fly), 5, 5))
    assert army(st, land).flags & ABOARD_FLAG and army(st, land).moves_left == 0
    assert not army(st, fly).flags & ABOARD_FLAG
    bs = next(e for e in ev if isinstance(e, E.BattleStarted))
    assert sorted(bs.info["a_strength"]) == [2, 4]
    assert any(isinstance(e, E.Embarked) for e in ev)


def test_advisor_does_not_board(hooks):
    """ovl36:124a mode 0 skips ovl36:0522: the land unit is not aboard in the prediction."""
    types = default_types()
    types[8] = atype(8, strength=9)
    st = mk_state(types)
    set_terrain(st, 5, 5, Terrain.WATER)
    put(st, 2, 1, 5, 5, flags=ABOARD_FLAG)
    land = put(st, 8, 0, 4, 5)
    assert combat.prepare(st, (land,), 5, 5).a_strength == [9]


def test_won_field_battle_aftermath(hooks):
    """ovl36:0a6b: dead defenders freed in place (0b62:03be), surviving attacking hero +1 exp off a
    city, square owner nibble = attacker, fortify bit cleared, army bit set, medals called after."""
    st = mk_state()
    h = put(st, HERO_TYPE, 0, 4, 5)
    d = put(st, 2, 1, 5, 5)
    st.world.flags[5 * MAP_W + 5] |= MAP_FORTIFIED
    rec = hooks(st)
    script(st, WIN, cycle=True)
    ev = engine.apply(st, C.Attack((h,), 5, 5))
    gone = army(st, d)
    assert st.armies[d] is gone and (gone.type_id, gone.owner, gone.x, gone.y) == (0xFF, 0xFF, -1, -1)
    f = st.world.flags[5 * MAP_W + 5]
    assert f & 0x0F == 0 and f & MAP_ARMY and not f & MAP_FORTIFIED
    assert [c[0] for c in rec.calls] == ["ai_memory", "history", "add_exp", "medals", "quest_check"]
    assert ("add_exp", h, 1) in rec.calls
    assert st.pending is None and not ev[-1].info["captured"]


def test_lost_battle_aftermath(hooks):
    """Attackers freed (hero_died first for a hero), owner nibble = defender (asm ovl36:0cc4)."""
    st = mk_state()
    h, u = put(st, HERO_TYPE, 0, 4, 5), put(st, 1, 0, 4, 5)
    d = put(st, 2, 1, 5, 5)
    rec = hooks(st)
    script(st, LOSE, cycle=True)
    engine.apply(st, C.Attack((h, u), 5, 5))
    assert [a.id for a in st.armies if a.owner != 0xFF] == [d]
    assert [a.id for a in st.armies] == [0, 1, 2]                      # index == id, kept
    assert st.world.flags[5 * MAP_W + 5] & 0x0F == 1
    assert ("hero_died", h, 5, 5) in rec.calls
    assert not any(c[0] in ("add_exp", "take_city") for c in rec.calls)


def test_defender_exp_reads_attacker_type_slot(hooks):
    """asm ovl36:0c8e tests DS:424c[i] (attacker types) for surviving defender i: a surviving
    defending hero gets no exp unless attacker i is a hero; a surviving non-hero defender does
    when attacker i is a hero."""
    st = mk_state()
    a_h = put(st, HERO_TYPE, 0, 4, 5)
    d_u = put(st, 2, 1, 5, 5)
    rec = hooks(st)
    script(st, LOSE, cycle=True)
    engine.apply(st, C.Attack((a_h,), 5, 5))
    assert ("add_exp", d_u, 1) in rec.calls
    st = mk_state()
    a_u = put(st, 1, 0, 4, 5)
    d_h = put(st, HERO_TYPE, 1, 5, 5)
    rec = hooks(st)
    script(st, LOSE, cycle=True)
    engine.apply(st, C.Attack((a_u,), 5, 5))
    assert not any(c[0] == "add_exp" for c in rec.calls)


def test_city_capture(hooks):
    """Won battle on a city: +2 exp for a surviving hero (first tile terrain 10), city +0x30 |=
    DS:0cbe[p], take_city hook, CityCaptured pending when the quest check returns 0."""
    st = mk_state()
    ci = city(st, 10, 10, 1, 1)
    h = put(st, HERO_TYPE, 0, 9, 11)
    put(st, 2, 1, 10, 10)
    put(st, 2, 1, 11, 11)
    rec = hooks(st)
    script(st, WIN, cycle=True)
    ev = engine.apply(st, C.Attack((h,), 11, 11))
    assert st.cities[ci].attacked_by == 1
    assert ("add_exp", h, 2) in rec.calls and ("take_city", ci, 0, 1, False) in rec.calls
    assert isinstance(st.pending, E.CityCaptured) and ev[-1] is st.pending
    assert [a.id for a in st.armies if a.owner != 0xFF] == [h]
    with pytest.raises(engine.IllegalCommand):
        engine.apply(st, C.EndTurn())


def test_city_capture_quest_check_suppresses_prompt(hooks):
    st = mk_state()
    city(st, 10, 10, 1, 1)
    h = put(st, HERO_TYPE, 0, 9, 11)
    hooks(st, quest=1)
    script(st, WIN, cycle=True)
    engine.apply(st, C.Attack((h,), 11, 11))
    assert st.pending is None


@pytest.mark.parametrize("rel,city_index,prompt", [(0, None, True), (1, None, False), (1, 0, False),
                                                    (1, 1, True), (2, 1, False)])
def test_treachery_prompt(hooks, rel, city_index, prompt):
    """Diplomacy on, owner != 0xf: relation 0, or relation 1 with city index > 0 (as coded at
    ovl36:0000; index 0 does not count) asks instead of attacking."""
    st = mk_state(diplomacy=1)
    if city_index is not None:
        if city_index == 1:
            city(st, 20, 20, 2, 1)
        city(st, 10, 10, 1, 1)
        target = (10, 10)
    else:
        target = (5, 5)
    put(st, 2, 1, *target)
    a = put(st, 1, 0, target[0] - 1, target[1])
    st.relations[0][1] = rel
    hooks(st)
    script(st, WIN, cycle=True)
    before = (army(st, a).x, army(st, a).moves_left)
    ev = engine.apply(st, C.Attack((a,), *target))
    assert isinstance(st.pending, E.TreacheryPrompt) == prompt
    if prompt:
        assert ev == [st.pending] and (army(st, a).x, army(st, a).moves_left) == before


def test_neutral_relation_byte_reads_next_row():
    """Owner 8 (neutral): 2c04:153b[p*8 + 8] is row p+1's first byte; for p = 7 the city count."""
    st = mk_state()
    st.relations[1][0] = 2
    assert combat.relation_byte(st, 0, 8) == 2
    city(st, 10, 10, 1, 1)
    assert combat.relation_byte(st, 7, 8) == 1


def test_missing_hooks_strict_and_permissive(monkeypatch):
    """Strict: NotImplementedCommand before anything changes; permissive: skipped and listed."""
    monkeypatch.setattr(combat, "_hook", lambda name: None)
    st = mk_state()
    a = put(st, 1, 0, 4, 5)
    put(st, 2, 1, 5, 5)
    h0 = st.hash()
    with pytest.raises(engine.NotImplementedCommand):
        engine.apply(st, C.Attack((a,), 5, 5))
    assert st.hash() == h0
    script(st, WIN, cycle=True)
    with allowing_unverified():
        ev = engine.apply(st, C.Attack((a,), 5, 5))
    assert set(ev[-1].info["skipped"]) == {"ai_memory", "history", "medals", "quest_check"}


def test_attack_group_validation(hooks):
    st = mk_state()
    a = put(st, 1, 0, 4, 5)
    b = put(st, 1, 0, 3, 5)
    e = put(st, 2, 1, 5, 5)
    hooks(st)
    for g in ((), (a, a), (a, b), (a, e), (99,), tuple(range(9))):
        with pytest.raises(engine.IllegalCommand):
            engine.apply(st, C.Attack(g, 5, 5))


# ----------------------------------------------------------------------------- advisor


def test_advisor_is_19_trials_over_two():
    """ovl36:2065: 19 trial battles on the game RNG, verdict = (runs with attacker survivors)//2."""
    st, a, d = duel_state(a_str=6, d_str=6)
    st.rng = Rng(77, "borland")
    ref = st.copy()
    wins = sum(combat.simulate(ref, (a,), 5, 5)[3] > 0 for _ in range(19))
    assert combat.odds(st, (a,), 5, 5) == wins // 2
    assert st.rng.state() == ref.rng.state()
    script(st, WIN, cycle=True)
    assert combat.odds(st, (a,), 5, 5) == 9
    script(st, LOSE, cycle=True)
    assert combat.odds(st, (a,), 5, 5) == 0
    assert [x.id for x in st.armies] == [a] + d and army(st, a).x == 4


# ----------------------------------------------------------------------------- fight-order command


def test_set_fight_order():
    """ovl38 fight-order dialog only permutes the row (or resets it to row 8)."""
    st = mk_state()
    new = list(reversed(range(29)))
    engine.apply(st, C.SetFightOrder(tuple(new)))
    assert st.fight_order[0] == new and st.fight_order[1] == list(range(29))
    for bad in ((0,) * 29, tuple(range(28)), tuple(range(1, 30))):
        with pytest.raises(engine.IllegalCommand):
            engine.apply(st, C.SetFightOrder(bad))


def test_same_seed_same_battle():
    def run():
        st, a, d = duel_state(a_str=7, d_str=7, n_def=3)
        st.rng = Rng(5, "borland")
        b = combat.resolve(st, (a,), 5, 5)
        return b.kills, b.rolls, st.rng.state()
    assert run() == run()


def test_attacker_type_slot_layout():
    """DS:424c (8 attacker types) is followed by DS:4254 (32 defender types): slot i >= 8
    reads defender i - 8; the slots between the attacker count and 8 hold whatever the
    previous set-up left there."""
    bw = BattleWork()
    bw.a_types = [HERO_TYPE, 1, 7, 0, 0, 0, 0, 0]
    bw.d_types[:10] = [2] * 8 + [HERO_TYPE, 3]
    assert combat._attacker_type_slot(bw, 0) == HERO_TYPE
    assert combat._attacker_type_slot(bw, 2) == 7
    assert combat._attacker_type_slot(bw, 8) == 2
    assert combat._attacker_type_slot(bw, 16) == HERO_TYPE


def test_setup_writes_battle_arrays_keeping_stale_bytes():
    """ovl38:06e5..072d: DS:424c[i] / 4254[i] = army +4 for i below the side's count only; the
    bytes past it keep the previous set-up's.  The area is zero in the EXE image."""
    st = mk_state()
    assert st.battle_work.a_types == [0] * 8 and st.battle_work.d_types == [0] * 32
    a = [put(st, t, 0, 4, 5) for t in (1, 1, HERO_TYPE)]
    d = [put(st, 2, 1, 5, 5) for _ in range(3)]
    s = combat.prepare(st, a, 5, 5)
    bw = st.battle_work
    assert bw.attackers == s.attackers and bw.defenders == s.defenders
    assert bw.attacker == 0 and bw.owner == 1 and bw.a_alive == [1] * 3 and bw.d_alive == [1] * 3
    first_a, first_d = bw.a_types[:3], bw.d_types[:3]
    assert sorted(first_a) == sorted([1, 1, HERO_TYPE]) and first_d == [2, 2, 2]
    one = put(st, 6, 0, 4, 6)
    combat.prepare(st, (one,), 5, 5)
    assert bw.a_types[:3] == [6] + first_a[1:] and bw.d_types[:3] == first_d
    assert bw.attackers == [one] and bw.a_alive == [1]


def test_advisor_runs_rewrite_the_battle_arrays():
    """ovl36:2065 -> ovl36:124a(0) -> ovl38:008b: the trial battles write the arrays too."""
    st = mk_state()
    a = put(st, HERO_TYPE, 0, 4, 5)
    put(st, 2, 1, 5, 5)
    st.battle_work.a_types = [9] * 8
    script(st, WIN, cycle=True)
    combat.odds(st, (a,), 5, 5)
    assert st.battle_work.a_types == [HERO_TYPE] + [9] * 7 and st.battle_work.attackers == [a]
    assert st.battle_work.d_alive == [0]


def test_defender_exp_reads_a_stale_attacker_type(hooks):
    """ovl36:0c8e reads DS:424c[i] for surviving defender i: with one attacker, defender slot 1
    sees the byte the previous set-up left at DS:424c[1] - here an advisor trial with a hero
    in attacker slot 1 - and the surviving defending hero there gets +1 exp."""
    st = mk_state()
    u = put(st, 1, 0, 4, 5, strength=1)
    h = put(st, HERO_TYPE, 0, 4, 5)
    d = [put(st, 2, 1, 5, 5), put(st, HERO_TYPE, 1, 5, 5)]
    rec = hooks(st)
    script(st, LOSE, cycle=True)
    combat.odds(st, (u, h), 5, 5)                         # trial set-up: DS:424c = [1, 0x1c]
    assert st.battle_work.a_types[1] == HERO_TYPE
    order = st.battle_work.defenders
    engine.apply(st, C.Attack((u,), 5, 5))
    assert st.battle_work.a_types[1] == HERO_TYPE         # past the count: kept
    assert ("add_exp", order[1], 1) in rec.calls
    assert not any(c[:2] == ("add_exp", order[0]) for c in rec.calls)


# ----------------------------------------------------------------------------- selection


def test_won_attack_reselects_the_target_square_stack(hooks, monkeypatch):
    """ovl36:0afd..0b58: the surviving attackers become DS:5e3e and the first DS:5e62; on a win
    ovl36:047f..0490 select the stack of the target square's first army (0b62:007d,
    ovl67:06eb: it and the armies of its nonzero +0x11 group) before the medal call at
    ovl36:0498, which then reads that stack."""
    st = mk_state()
    a1, a2, a3 = put(st, 1, 0, 4, 5), put(st, 1, 0, 4, 5), put(st, 1, 0, 4, 5)
    army(st, a1).group = army(st, a3).group = 2
    put(st, 2, 1, 5, 5)
    rec = hooks(st)
    seen = []

    def get(name):
        if name == "medals":
            return lambda *a: seen.append(list(st.selection.moving)) or []
        return rec.get(name)
    monkeypatch.setattr(combat, "_hook", get)
    script(st, WIN, cycle=True)
    engine.apply(st, C.Attack((a1, a2, a3), 5, 5))
    sel = st.selection
    assert sorted(sel.moving) == [a1, a3] and sel.selected in (a1, a3)   # a3: highest index first
    assert seen == [sel.moving] and sorted(sel.palette) == [a1, a2, a3]


def test_lost_attack_leaves_no_selected_stack(hooks):
    """ovl36:0b54: DS:5e62 = DS:5e3e[0], null when no attacker survived; no re-selection."""
    st = mk_state()
    a = put(st, 1, 0, 4, 5)
    put(st, 2, 1, 5, 5)
    hooks(st)
    st.selection.selected, st.selection.moving = a, [a]
    script(st, LOSE, cycle=True)
    engine.apply(st, C.Attack((a,), 5, 5))
    assert st.selection.selected == -1 and st.selection.moving == []
