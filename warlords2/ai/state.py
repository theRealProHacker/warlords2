"""ai.md §3: the AI state and the small ovl25 accessors around it.

The data are `GameState.ai` (`model.ai.AiState`): the eight blocks (`AiBlock`, ai.md §3.1),
the neighbour table (`NeighbourTable`, ai.md §4.2) and the DGROUP words DS:0832, DS:0836,
DS:40f2 (the last three in `AiProcess`, the run's words, not saved).  The original locks the
side on turn's block into DS:40ee for the whole computer turn (ovl25:0000 at 0089);
`block(state)` is that pointer during the turn.  DS:40ee keeps pointing there after the turn
(`AiState.locked`): the only reader outside ovl25:0000 is ovl25:0919 (`ai.base.hero_city`),
which reads `state.ai[state.ai.locked]`.  Lock and unlock (0d28:069a / 07a9, ovl25:056c / 05b9
/ 05e6 / 063d) move no game data and are not modelled.
"""
from __future__ import annotations

from ..model.ai import AiBlock, AiState, NeighbourTable, TaskForce  # noqa: F401  (re-exports)
from ..model.ids import Control


def block(state, p: int | None = None) -> AiBlock:
    """Side p's AI block (default: the side on turn, DS:40ee during its turn).
    Evidence: ovl25:0000 at 0077..0095 locks DS:40ca[SCN 0x110] into DS:40ee; ovl25:056c(p)
    returns DS:40ee when DS:0836 is set and p is the side on turn, else locks DS:40ca[p]
    (asm ovl25:056c..05b8): the same block either way."""
    return state.ai[state.current if p is None else p]


def ai_turn_active(state) -> int:
    """DS:0836: 1 while the computer turn ovl25:0000 runs.
    Evidence: asm ovl25:0071 (= 1), 0354 (= 0); readers ovl25:056c, 05b9, 05e6, 063d, 09ab."""
    return state.ai.turn_active


def is_computer_now(state) -> bool:
    """ovl25:09ab(): the side on turn is computer-controlled now.
    Evidence: asm ovl25:09ab..09d6: SCN 0x0d0[SCN 0x110] == 1, or DS:0836 != 0.  (Same test as
    rules.heroes.is_computer, which leaves out DS:0836 because it is 1 only inside ovl25:0000,
    which runs only for a side whose 0x0d0 is 1, or that ovl25:0000 itself made 1 at 0141.)"""
    return state.players[state.current].control == Control.COMPUTER or state.ai.turn_active != 0


def quest_city(state) -> int:
    """AI[+0x46] of the side on turn: the target city of an occupy / raze quest, else -1
    (rules.movement HOOKS ai_quest_city).
    DS:40ee is the side on turn's block here: 0a8b:0254 is reached only from 0a8b:0001, whose
    callers are all in the AI overlays (ovl19 / 20 / 22 / 26 / 28, inside ovl25:0000).
    Evidence: asm 0a8b:0318..0320 (les bx, DS:40ee; es:[bx + 0x46]); 0a8b:0129 (the only call
    of 0254); ai.md §3.1."""
    return block(state).quest_city


def set_city_role(state, city: int, role: int) -> None:
    """AI[+0x56 + city] = role (byte) for the side on turn (rules.movement HOOKS ai_set_role).
    Evidence: asm 0a8b:02f8..02fe (DS:40ee + 0x56 + city = 1); ai.md §3.2."""
    block(state).role[city] = role & 0xFF
