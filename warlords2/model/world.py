"""The map: tile graphics, map-word flags, road layer, signposts.

A map word (EL §4.1) is kept as two flat lists indexed `y * MAP_W + x`: `tiles` (low byte,
tile graphic) and `flags` (high byte: owner nibble, army, fortified, explored, port).  Ports
are the flag bit 0x80, so there is no separate port list.
"""
from __future__ import annotations

from dataclasses import dataclass, field

from .ids import MAP_EXPLORED, MAP_FORTIFIED, MAP_PORT, MAP_W, ROAD_PIECE_MASK, Terrain


@dataclass
class Sign:
    x: int
    y: int
    line1: str
    line2: str


@dataclass
class World:
    tiles: list[int]                       # MAP_W * MAP_H tile graphic indices
    flags: list[int]                       # MAP_W * MAP_H high bytes of the map words
    roads: list[int]                       # MAP_W * MAP_H road-layer bytes (19d9:0000)
    terrain_of_tile: list[int]             # SCN 0x710 table, tile graphic -> Terrain
    signs: list[Sign] = field(default_factory=list)
    explored: list[int] = field(default_factory=list)   # DS:126c, bit p = seen by side p [I] (EL §9.5)

    def terrain(self, x: int, y: int) -> Terrain:
        return Terrain(self.terrain_of_tile[self.tiles[y * MAP_W + x]])

    def is_port(self, x: int, y: int) -> bool:
        return bool(self.flags[y * MAP_W + x] & MAP_PORT)

    def road(self, x: int, y: int) -> int:
        """Road piece 1..17, 0 = none."""
        return self.roads[y * MAP_W + x] & ROAD_PIECE_MASK

    def fortified(self, x: int, y: int) -> bool:
        return bool(self.flags[y * MAP_W + x] & MAP_FORTIFIED)

    def explored_site(self, x: int, y: int) -> bool:
        return bool(self.flags[y * MAP_W + x] & MAP_EXPLORED)
