"""Report values: the bars of Report > Army, City, Gold and Winning, and the winning score the
history records keep (MAN p.55-56).

Source (re-read by M9a from out/asm/ovl42.asm): ovl42:02fb computes for every side the value
of the report DS:0df6 (jump table ovl42:05f5), the dead-side marks DS:4440 and the bar scale
DS:0e40, and returns the current side's value (the winning report: its rank); ovl42:0947 runs
it for the winning report and copies the eight values (the history record, ovl41:0ef3).  The
production report (case 3, ovl43:07e5) is the list of the last start-of-turn production run,
`GameState.production_report` (filled by rules.city.deliver and rules.vectoring.advance_transit,
the block DS:4464 of ovl43:0000); it has no value per side.
Not modelled (presentation only): the bar drawing ovl42:05ff, the list's paging ovl43:0805..0bfe.
"""
from __future__ import annotations

from .bonuses import s8
from .constants import history as K
from .economy import (cached_cities, cached_income, cached_upkeep, owns, refresh_cities, refresh_income,
                      refresh_upkeep, s16)
from ..model.state import SCN_ARMY_HIGH

N_SIDES = 8


def _raw_scores(state) -> list:
    """Winning score before the rank: (gold + 5 income + upkeep + sum of defence * income of the
    own cities) / 30, in 1..500 (16-bit words, as coded: upkeep is added).  Refreshes the city
    counts (ovl42:0343, every run of 02fb), then the income and upkeep caches and reads them
    (ovl42:04c2..0536)."""
    out = []
    lo, hi = K.SCORE_RANGE.value
    refresh_cities(state)                        # asm ovl42:0343 (ovl62:03f9)
    refresh_income(state)                        # asm ovl42:04c2 / 04c7 (ovl62:0372, 02bf)
    refresh_upkeep(state)
    for p in range(N_SIDES):
        di = sum(s8(c.defence) * c.income for c in state.cities if owns(c, p))
        total = s16(state.players[p].gold + cached_income(state, p) * K.SCORE_INCOME.value
                    + cached_upkeep(state, p) + di)
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
    record +0 (signed), and the Gold report's page refreshes the income and upkeep caches
    (ovl42:0030 case 2, 01d4 / 01d9; nothing there reads them); for cases 0-2 the scale is the largest value (signed, from 0), made even
    when odd (03c8..03e6), and the return value the current side's; case 4 (04c2..05e9): the
    rank si = number of c with score[c] > score[0x110] before the division by 5, scale 100;
    case 3 (04b8): si = ovl43:07e5, the production list's signed count byte; the values
    stay 0 and the scale 0 (0302, 0337), and "entries" holds the list (`production_list`)."""
    refresh_cities(state)                        # asm ovl42:0343 (ovl62:03f9, every mode)
    if mode == K.REPORT_PRODUCTION.value:
        entries = production_list(state)
        return {"values": [0] * N_SIDES, "dead": _dead(state), "scale": 0,
                "own": state.production_report.count,
                "entries": entries}
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
        values = [cached_cities(state, p) for p in range(N_SIDES)]      # asm ovl42:0405
    elif mode == K.REPORT_GOLD.value:
        refresh_income(state)                    # the Gold report's page, asm ovl42:01d4 / 01d9
        refresh_upkeep(state)
        values = [s16(p.gold) for p in state.players]
    else:
        raise ValueError("report %r: no such mode (ovl42:02fb jump table 05f5, modes 0..4)" % (mode,))
    scale = max([0] + values)
    if scale and scale % 2:
        scale += 1
    return {"values": values, "dead": _dead(state), "scale": scale, "own": values[state.current]}


def report_page(state, mode: int) -> None:
    """The state writes of one run of the report page routine ovl42:0030 for mode `mode`.
    Evidence: asm, in ovl42:0030's order: every mode the city counts DS:5dea (ovl42:00dd ->
    02fb, ovl62:03f9 at 0343, before its jump table); mode 4 the income and upkeep caches
    (ovl42:02fb case 4: 04c2 ovl62:0372, 04c7 ovl62:02bf, before the scores read them); mode 2
    the same (ovl42:01d4 / 01d9, after the values and the overview); mode 0 the army bits of
    ovl63:158d (ovl42:0160, `rules.mapwords.army_bits`); modes 1 and 3 nothing more.  Every
    other write of ovl42 / ovl43:0805..0bfe is a presentation global (DS:0df6, DS:4440 / 4450 /
    0e40, DS:166a, the paging words)."""
    from .mapwords import army_bits
    if not 0 <= mode <= K.REPORT_WINNING.value:
        raise ValueError("report %r: no such mode (ovl42:02fb jump table 05f5, modes 0..4)" % (mode,))
    refresh_cities(state)                        # asm ovl42:0343
    if mode in (K.REPORT_GOLD.value, K.REPORT_WINNING.value):
        refresh_income(state)
        refresh_upkeep(state)
    elif mode == K.REPORT_ARMIES.value:
        army_bits(state)
    elif mode not in (K.REPORT_CITIES.value, K.REPORT_PRODUCTION.value):
        raise ValueError("report %r: no such mode (ovl42:02fb jump table 05f5, modes 0..4)" % (mode,))


def report_page_command(state, cmd) -> list:
    """Command `ReportPage(mode)` (res_07be:0190 / 01f4 / 01df / 0204 / 0263 -> ovl42:0000(mode),
    and the page buttons 218..222 -> ovl42:02d7 -> ovl42:0000(id - 218)) for a human side:
    `report_page`.  No events.
    Evidence: asm ovl42:0000..0029 (the only caller chain of ovl42:0030); the report menu exists
    only in the human turn."""
    from .engine import IllegalCommand
    from ..model.ids import Control
    if state.players[state.current].control != Control.HUMAN:
        raise IllegalCommand("the report pages belong to a human side")
    if not 0 <= cmd.mode <= K.REPORT_WINNING.value:
        raise IllegalCommand("report mode %r: not 0..4" % (cmd.mode,))
    report_page(state, cmd.mode)
    return []


def production_list(state) -> list:
    """The production report list as the last start-of-turn production of any side left it:
    `ReportEntry(kind, type, city, dest, army)` in block order (arrivals in army-table order
    from the top down, then the units made, cities ascending); a copy.
    Evidence: asm ovl43:07e5..0800: the count byte +0x320 of the block DS:4464 (allocated on first
    use, 076d: count 0), signed; ovl43:086e reads entries first..last: kind (095b / 09bf), type
    +0x64, city +0xc8, dest +0x12c, all signed bytes; the block is refilled only by ovl43:0000
    (0016).  Past 100 entries the bytes alias (model.state.ProductionReport); a negative count
    gives no entries (ovl43:0805 rows = min(count, 5))."""
    return list(state.production_report)


def _dead(state) -> list:
    return [0 if p.alive else 1 for p in state.players]
