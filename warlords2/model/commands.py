"""Every player intention, one class each (docs/plan.md section 1.2; closed list).

A new command needs a plan change by the coordinator.  Army groups are tuples of army ids.
"""
from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class Command:
    pass


@dataclass(frozen=True)
class Move(Command):
    group: tuple
    dest: tuple


@dataclass(frozen=True)
class SetPath(Command):
    group: tuple
    path: tuple


@dataclass(frozen=True)
class CancelPath(Command):
    group: tuple


@dataclass(frozen=True)
class MoveAll(Command):
    pass


@dataclass(frozen=True)
class Group(Command):
    armies: tuple


@dataclass(frozen=True)
class Ungroup(Command):
    armies: tuple


@dataclass(frozen=True)
class GroupAll(Command):
    x: int
    y: int


@dataclass(frozen=True)
class UngroupAll(Command):
    x: int
    y: int


@dataclass(frozen=True)
class LeaveGroup(Command):
    """"Quit & Next"."""
    group: tuple


@dataclass(frozen=True)
class Defend(Command):
    group: tuple


@dataclass(frozen=True)
class Disband(Command):
    armies: tuple


@dataclass(frozen=True)
class SelectStack(Command):
    """Click on an own stack on the map: select the first army of the sorted square list and
    its group (0b62:0405)."""
    x: int
    y: int


@dataclass(frozen=True)
class SelectGroup(Command):
    """Stack palette: select the palette group of this army (buttons 232-239)."""
    army: int


@dataclass(frozen=True)
class SetPalette(Command):
    """Stack dialog OK (ovl66:14d3 -> ovl66:000a): the palette arrays as the dialog left them,
    in palette order: army ids (DS:6862), palette indices (DS:6852), selected flags 0/1 (DS:6842)."""
    armies: tuple
    group: tuple
    selected: tuple


@dataclass(frozen=True)
class Next(Command):
    """"Next" (button 174): select the nearest stack that still has to move."""
    pass


@dataclass(frozen=True)
class Deselect(Command):
    """Deselect the stack (button 178, Del)."""
    pass


@dataclass(frozen=True)
class ConfirmDisband(Command):
    """Answer to the Disband question (DisbandPrompt)."""
    yes: bool


@dataclass(frozen=True)
class Attack(Command):
    group: tuple
    x: int
    y: int


@dataclass(frozen=True)
class Advise(Command):
    """Military Advisor on the square (x, y) (ovl36:1f19): 19 trial battles, then two text rolls."""
    x: int
    y: int


@dataclass(frozen=True)
class ConfirmTreachery(Command):
    yes: bool


@dataclass(frozen=True)
class SetFightOrder(Command):
    order: tuple


@dataclass(frozen=True)
class Search(Command):
    group: tuple


@dataclass(frozen=True)
class TempleChoice(Command):
    choice: str                  # "bless" | "quest"


@dataclass(frozen=True)
class SageChoice(Command):
    choice: str                  # "gem" | "show_site" | "map_view"
    target: int | tuple | None = None   # show_site: index into SageOffered.info["entries"];
    #                                     map_view: the (x, y) square clicked on the overview map


@dataclass(frozen=True)
class TakeItem(Command):
    hero: int
    item: int


@dataclass(frozen=True)
class TakeAll(Command):
    """Search result "Take" (ovl34:186e): every item lying on the hero's square to the hero."""
    hero: int


@dataclass(frozen=True)
class DropItem(Command):
    hero: int
    item: int


@dataclass(frozen=True)
class PlantFlag(Command):
    hero: int


@dataclass(frozen=True)
class AcceptHero(Command):
    yes: bool


@dataclass(frozen=True)
class NameHero(Command):
    """Name of the turn-1 hero."""
    name: str
    female: bool


@dataclass(frozen=True)
class CaptureChoice(Command):
    choice: str                  # "occupy" | "pillage" | "sack" | "raze"


@dataclass(frozen=True)
class SetProduction(Command):
    city: int
    slot: int


@dataclass(frozen=True)
class BuyProduction(Command):
    """Build Production buy (ovl44:0ee3) into `slot` (DS:0e86); None = rules.city.buy_slot."""
    city: int
    type: int
    slot: int | None = None


@dataclass(frozen=True)
class SortSlots(Command):
    """Build Production closed (ovl44:0eca -> ovl44:1544): sort the leading filled slots."""
    city: int


@dataclass(frozen=True)
class ChooseProduction(Command):
    """ovl44:00ff with the remembered type DS:0e9e: a type held in a slot, or -1."""
    city: int
    type: int


@dataclass(frozen=True)
class ScreenTutorial(Command):
    """The tutorial pages of the city / site screen ovl45:0000: open (025d..02da) or close
    (02f9..0336)."""
    close: bool


@dataclass(frozen=True)
class SetVector(Command):
    city: int
    dest: int


@dataclass(frozen=True)
class RedirectVectors(Command):
    """Vectoring page, mode DS:0e94 == 2 (ovl44:072e 07d8..086b): every city vectoring to
    `city` is sent to `dest` (an own city index, or 100 + side for the standard)."""
    city: int
    dest: int


@dataclass(frozen=True)
class RenameCity(Command):
    city: int
    name: str


@dataclass(frozen=True)
class RazeOwnCity(Command):
    city: int


@dataclass(frozen=True)
class EditSign(Command):
    """Signpost OK (button 421, ovl13:0486): both lines of sign `sign` (index in World.signs)."""
    sign: int
    line1: str
    line2: str


@dataclass(frozen=True)
class QuestPage(Command):
    """Report > Quest (07be:02a7 -> ovl01:0167): the quest page of the current side."""
    pass


@dataclass(frozen=True)
class ReportPage(Command):
    """Report > Army / City / Gold / Production / Winning (ovl42:0000(mode), on opening and on
    each page button 218..222): the page routine's state writes."""
    mode: int


@dataclass(frozen=True)
class Propose(Command):
    other: int
    relation: int


@dataclass(frozen=True)
class SetControl(Command):
    player: int
    control: int


@dataclass(frozen=True)
class SetEnhance(Command):
    player: int
    on: bool


@dataclass(frozen=True)
class SetObserve(Command):
    player: int
    on: bool


@dataclass(frozen=True)
class SetSpeech(Command):
    on: bool


@dataclass(frozen=True)
class SetView(Command):
    x: int
    y: int


@dataclass(frozen=True)
class AcceptSurrender(Command):
    yes: bool


@dataclass(frozen=True)
class CloseVictory(Command):
    """The victory screen's button 483 (07be:0abf -> ovl61:2004); answers the pending Victory."""


@dataclass(frozen=True)
class Resign(Command):
    graceful: bool


@dataclass(frozen=True)
class EndTurn(Command):
    max_sides: int | None = None     # rules.turn.run's limit (the user interface plays one side per run)


COMMANDS = (
    Move, SetPath, CancelPath, MoveAll, Group, Ungroup, GroupAll, UngroupAll, LeaveGroup, Defend,
    Disband, SelectStack, SelectGroup, Next, Deselect, ConfirmDisband, Attack, ConfirmTreachery,
    SetFightOrder, Search, TempleChoice, SageChoice, TakeItem, DropItem, PlantFlag, AcceptHero, NameHero, CaptureChoice, SetProduction, BuyProduction,
    SetVector, RenameCity, RazeOwnCity, EditSign, Propose, SetControl, SetEnhance, SetObserve,
    SetSpeech, SetView, AcceptSurrender, Resign, EndTurn,
    SetPalette, Advise, TakeAll, SortSlots, ChooseProduction, ScreenTutorial, RedirectVectors,
    QuestPage, CloseVictory, ReportPage,
)
