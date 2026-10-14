"""The ten game options in OPTIONS.DAT / STRING group 4 order (EL §6.9 ovl57:223b, 0e34)."""
from __future__ import annotations

from dataclasses import astuple, dataclass, fields

# Option index -> SCN word the setup copies it to at ovl57:0e34 (EL §6.9).
SCN_WORD = (0x11A, 0x11C, 0x11E, 0x124, 0x12A, 0x132, 0x126, 0x128, 0x12C, 0x122)


@dataclass(frozen=True)
class GameOptions:
    neutral_cities: int = 0      # 0 Average, 1 Strong, 2 Active (STRING 5)
    diplomacy: int = 0
    quests: int = 0
    hidden_map: int = 0
    view_enemies: int = 0
    view_production: int = 0
    intense_combat: int = 0
    quick_start: int = 0
    military_advisor: int = 0
    random_turns: int = 0

    def to_words(self) -> list[int]:
        return list(astuple(self))

    @classmethod
    def from_words(cls, words) -> GameOptions:
        words = list(words)
        if len(words) != len(fields(cls)):
            raise ValueError("need %d option words, got %d" % (len(fields(cls)), len(words)))
        return cls(*words)
