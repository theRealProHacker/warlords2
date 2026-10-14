"""Report values: the bars of Report > Army, City, Gold and Winning, and the winning score the
history records keep (MAN p.55-56).

Source (re-read by M9a from out/asm/ovl42.asm): ovl42:02fb computes for every side the value
of the report DS:0df6 (jump table ovl42:05f5), the dead-side marks DS:4440 and the bar scale
DS:0e40, and returns the current side's value (the winning report: its rank); ovl42:0947 runs
it for the winning report and copies the eight values (the history record, ovl41:0ef3).  The
production report (case 3, ovl43:07e5) is the list of the armies the side produced this turn,
which the `Produced` events of the turn start carry; it has no value per side.
Not modelled (presentation only): the bar drawing ovl42:05ff.
"""
from __future__ import annotations

from .bonuses import s8
from .constants import history as K
from .economy import city_count, income, owns, s16, upkeep
from ..model.state import SCN_ARMY_HIGH

N_SIDES = 8


def _raw_scores(state) -> list:
    """Winning score before the rank: (gold + 5 income + upkeep + sum of defence * income of the
    own cities) / 30, in 1..500 (16-bit words, as coded: upkeep is added)."""
    out = []
    lo, hi = K.SCORE_RANGE.value
    for p in range(N_SIDES):
        di = sum(s8(c.defence) * c.income for c in state.cities if owns(c, p))
        total = s16(state.players[p].gold + income(state, p) * K.SCORE_INCOME.value + upkeep(state, p) + di)
        v = int(total / K.SCORE_DIV.value)             # idiv truncates toward zero
        out.append(min(max(v, lo), hi))
    return out


def scores(state) -> list:
    """The winning score of every side, 0..100, as the history record stores it.
    Evidence: asm ovl42:0947..0973: DS:0df6 = 4, ovl42:02fb, copy DS:4450[0..7]; case 4 ovl42:04c2..
    05e9: ovl62:0372 and 02bf for all sides; per side c: di = sum over cities with owner byte
    == c of signed byte +0x14 (defence) * word +0x2a (income) (04d1..0514); (gold + DS:5dca * 5 +
    DS:5dda + di) idiv 0x1e, clamped to 1..0x1f4 (0516..0573); after the rank, each idiv 5
    (05a5..05c3)."""
    return [v // K.SCORE_SCALE.value for v in _raw_scores(state)]


def report(state, mode: int) -> dict:
    """Values of a report for all eight sides: {"values": [8], "dead": [8] (1 = not alive),
    "scale": bar scale, "own": the current side's value, for the winning report its rank (the
    number of sides with a higher score; 0 = first)}.
    Evidence: asm ovl42:02fb..05f4: DS:4440[c] = !0x137[c], DS:4450[c] = 0 (030c..0341);
    ovl62:03f9 (0343); case 0 (035b..03fa): army records 0x181-1..0 whose signed owner byte is
    in 0..7 count for it (no position test); case 1 (03fd): DS:5dea; case 2 (0453): player
    record +0 (signed); for cases 0-2 the scale is the largest value (signed, from 0), made even
    when odd (03c8..03e6), and the return value the current side's; case 4 (04c2..05e9): the
    rank si = number of c with score[c] > score[0x110] before the division by 5, scale 100.
    Case 3 is ovl43:07e5 (see the module text) and is refused here."""
    if mode == K.REPORT_WINNING.value:
        raw = _raw_scores(state)
        mine = raw[state.current]
        return {"values": scores(state), "dead": _dead(state), "scale": K.SCORE_TOP.value,
                "own": sum(1 for v in raw if v > mine)}
    if mode == K.REPORT_ARMIES.value:
        values = [0] * N_SIDES
        high = min(state.flags.get(SCN_ARMY_HIGH, len(state.armies)), len(state.armies))
        for i in range(high - 1, -1, -1):
            o = s8(state.armies[i].owner)
            if 0 <= o < N_SIDES:
                values[o] += 1
    elif mode == K.REPORT_CITIES.value:
        values = [city_count(state, p) for p in range(N_SIDES)]
    elif mode == K.REPORT_GOLD.value:
        values = [s16(p.gold) for p in state.players]
    else:
        raise ValueError("report %r has no values per side (ovl42:02fb cases 0, 1, 2, 4)" % (mode,))
    scale = max([0] + values)
    if scale and scale % 2:
        scale += 1
    return {"values": values, "dead": _dead(state), "scale": scale, "own": values[state.current]}


def _dead(state) -> list:
    return [0 if p.alive else 1 for p in state.players]
