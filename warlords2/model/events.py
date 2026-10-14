"""What `rules.engine.apply` reports back (docs/plan.md section 1.2; closed list).

The payload of an event is its `info` mapping; the rule milestone that emits an event
documents its keys.  Only `Msg` (a STRING.DAT message) has fixed fields.  Events marked
"pending" are also stored in `GameState.pending` until the answering command arrives.
"""
from __future__ import annotations

from dataclasses import dataclass, field


@dataclass(frozen=True)
class Event:
    info: dict = field(default_factory=dict)


class TurnStarted(Event): pass
class TurnEnded(Event): pass
class Moved(Event): pass
class Embarked(Event): pass
class Landed(Event): pass
class Sunk(Event): pass
class Fortified(Event): pass
class BattleStarted(Event): pass
class Duel(Event): pass                       # one exchange
class BattleEnded(Event): pass
class Looted(Event): pass
class MedalAwarded(Event): pass
class HeroExp(Event): pass
class HeroPromoted(Event): pass
class HeroOffered(Event): pass                # pending
class HeroJoined(Event): pass
class HeroDied(Event): pass
class AlliesJoined(Event): pass
class CityCaptured(Event): pass               # pending choice
class CityPillaged(Event): pass
class CitySacked(Event): pass
class CityRazed(Event): pass
class Produced(Event): pass
class ProductionStalled(Event): pass
class VectorArrived(Event): pass
class VectorRerouted(Event): pass
class IncomeSettled(Event): pass
class SiteSearched(Event): pass
class GuardianFought(Event): pass
class ItemFound(Event): pass
class ItemDropped(Event): pass
class ItemTaken(Event): pass
class Blessed(Event): pass
class SageOffered(Event): pass                # pending
class QuestAssigned(Event): pass
class QuestCompleted(Event): pass
class QuestFailed(Event): pass
class RelationChanged(Event): pass
class TreacheryPrompt(Event): pass            # pending
class Treachery(Event): pass
class PlayerEliminated(Event): pass
class NoHumansLeft(Event): pass
class NoPlayersLeft(Event): pass
class Victory(Event): pass
class SurrenderOffered(Event): pass           # pending
class Resigned(Event): pass
class DisbandPrompt(Event): pass              # pending (Disband yes/no, 0b62:06bf)
class TurnCue(Event): pass                    # a presentation step of the turn sequence (rules/turn.py)


@dataclass(frozen=True)
class Msg(Event):
    """STRING.DAT entry (group, index) formatted with args."""
    group: int = 0
    index: int = 0
    args: tuple = ()


EVENTS = (
    TurnStarted, TurnEnded, Moved, Embarked, Landed, Sunk, Fortified, BattleStarted, Duel,
    BattleEnded, Looted, MedalAwarded, HeroExp, HeroPromoted, HeroOffered, HeroJoined, HeroDied,
    AlliesJoined, CityCaptured, CityPillaged, CitySacked, CityRazed, Produced, ProductionStalled,
    VectorArrived, VectorRerouted, IncomeSettled, SiteSearched, GuardianFought, ItemFound,
    ItemDropped, ItemTaken, Blessed, SageOffered, QuestAssigned, QuestCompleted, QuestFailed,
    RelationChanged, TreacheryPrompt, Treachery, PlayerEliminated, NoHumansLeft, NoPlayersLeft,
    Victory, SurrenderOffered, Resigned, DisbandPrompt, TurnCue, Msg,
)
PENDING = (HeroOffered, CityCaptured, SageOffered, TreacheryPrompt, SurrenderOffered,
           DisbandPrompt)
