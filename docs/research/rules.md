# Warlords II (SSG, 1993, DOS v1.0x) — rules and UI reference

Scope: the ORIGINAL 1993 DOS release (local copy reports v1.00s in READ.ME, plus a VER102.DAT patch marker). Not Warlords II Deluxe (1995), not Warlords I/III.

No emulator runs back this document. Evidence is: the scanned original 1993 manual, the game's own READ.ME / help / string tables, ten static screenshots, and (as a weak behavioural hint only) the GPL clone LordsAWar.

## How to read the tags

Every claim carries an edition tag and a source key.

| Tag | Meaning |
|---|---|
| `[original]` | Stated by the 1993 manual, READ.ME, or the shipped game's own data files. |
| `[deluxe-only]` | Sources attribute it to Deluxe (1995) and the original's manual/data show no trace of it. |
| `[unclear]` | Not confirmed for the original. Includes everything known only from LordsAWar or from memory of later editions. Do not implement as fact; verify against the binary. |

| Key | Source |
|---|---|
| MAN p.N | Original 1993 manual, 64 pages, "This manual is written for the IBM", (c) 1993 SSG. Scan with OCR layer: https://api.regvault.org/api/v1/game/dos/0f16c912/manual (catalogue page https://regvault.org/game/dos/ad7e4de4). N is the printed page number (PDF page = N - 1). Tables and menu pictures were read from the page images, not the OCR. |
| README | `original/game/Warlrd2/READ.ME` ("WARLORDS ][ NOTES (v1.00s)") |
| HLP | `strings -n 5 original/game/Warlrd2/HELP/WARLORD2.HLP` (right-click button help: title + one-line description per button) |
| STR | `strings -n 5 original/game/Warlrd2/DATA/STRING.DAT` |
| SCN | `strings` over `DATA/SCENARIO.DAT` and `<SCENARIO>/*.SCN` |
| SHOT nn | `original/ref/screenshot_nn.jpg` (648x488 captures) |
| LAW | LordsAWar source, behaviour reference only, described in own words: https://git.savannah.nongnu.org/cgit/lordsawar.git/plain/src/defs.h , `.../src/fight.cpp` , `.../src/player.cpp` |
| WIKI | https://en.wikipedia.org/wiki/Warlords_II |
| GB | https://www.giantbomb.com/games/3030-16271/ |

Where MAN and the game's own data disagree, the data (HLP/STR/README) is the better witness for v1.0x, because README explicitly corrects the manual in places.

---

## 1. Game flow

### 1.1 Startup

- Intro animation and title, then the Game Start screen. [original] MAN p.10, p.14
- Command-line switches after `WAR2`: `x` use extended memory, `h` no EMS/XMS, `s` alternate army names, `m` mono, `v` no talking advisor, `n` no startup animation. [original] README
- Alternate names (`s`): Ghosts→Shamblers, Demons→Gargoyles, Devils→Imps, Archons→Winged Folk. [original] README
- Sound setup is asked on first start and saved; `INSTALL` reruns it. [original] MAN p.8

### 1.2 Game Start screen (main menu)

- Four large red buttons, top to bottom: New Scenario, Load Game, Random Map, Begin. To the right a framed picture of the currently selected scenario with its title above it ("The Island-Kingdom of Erythea" by default). Warlords II logo top centre. Menu bar already visible at the top. [original] SHOT 00, SHOT 02; HLP
- HLP descriptions: New Scenario "Shows list of scenarios"; Load Game "Shows list of saved games"; Random Map "Play with random map"; Begin Scenario "Begin playing this scenario". [original] HLP
- A large horned-helmet face is drawn over the centre of this screen in two captures. Whether it is the tail of the startup animation (`n` switch) or the talking face (`v` switch, HLP "Voice On/Off — Talking face on/off") cannot be told from a still. [original] SHOT 01, `original/ref/msdos_Warlords_II_1993.gif`

### 1.3 Scenario selection

- Dialog: scenario names listed on the left, details of the selected one on the right (name, short description, number of cities and ruins, number of players). OK / Cancel, scroll buttons. [original] MAN p.14; HLP ("Choose a scenario from the list")
- Shipped scenarios (name — description): Tutorial — A Brief Warlords II Tutorial; Dragon Realms — Battle the Five Dragonlords; Isles of Sorcery — The four Colleges of Magic; Erythea Campaign — The Island-Kingdom of Erythea; Hadesha Campaign — Hadesha, Land of Nightmares; Isladia Campaign — Battle the Lords of Isladia. [original] SCN
- Scenarios with twenty or forty cities exist for short/medium games. [original] MAN p.14
- Not every scenario uses all eight sides (unused slots are literally "Not Used"): Tutorial has 2 sides (Knights, Darklords), Isles of Sorcery 4, Dragon Realms 5, the three campaigns 8. [original] SCN
- Erythea side names in slot order: Sirians, Stone Giants, White Dwarves, Ussyrian Orcs, Dark Elves, Kingdoms, Horse Tribes, Lich King. [original] SCN, SHOT 09
- Army types, bonuses, items and the maximum stack bonus can differ per scenario. [original] MAN p.27, p.33, p.64

### 1.4 Random map

- Sliders for Water, Hills (manual: "Hills and Mountains"), Forest, and number of Cities; a question-mark button beside each slider randomises that value. [original] MAN p.14; HLP ("Water - Choose amount of water", "Water - Random amount of water", ...)
- Toggle "Cities can produce allies: Yes/No" — lets some cities start able to produce the special army types normally obtained only as hero allies. [original] MAN p.14; STR; HLP ("Produce Allies")
- "Change Terrain — Use alternate terrain set" button exists in the original's help table; the install has a `TERRAIN0` directory. [original] HLP. How many terrain sets v1.0x ships is not established. [unclear]
- Random maps can be saved and reloaded (Save Map / Load Map), 10 slots like saved games. [original] MAN p.54; README (IMPORT slots 1-10)
- Title "A Random World". [original] STR

### 1.5 Game Setup screen (choosing sides)

- Left panel: eight side boxes in two columns of four, each framed in the side's colour with the side name on the frame, a portrait icon, a control button, and a "Character" checkbox. [original] SHOT 09; MAN p.15
- Erythea colours as seen: Sirians white, Stone Giants yellow, White Dwarves orange, Ussyrian Orcs red, Dark Elves green, Kingdoms blue, Horse Tribes light blue, Lich King black. [original] SHOT 09
- Clicking the control word cycles the controller; the portrait changes with it. A side can also be left out entirely. [original] MAN p.15
- Controller levels: Human, Knight, Lord, Warlord. [original] MAN p.15, p.17. A "Baron" level is NOT mentioned anywhere in the 1993 manual or in STR/HLP. [unclear] (see open questions)
- Computer players get no hidden bonuses (no extra heroes, combat bonuses or cheaper production). [original] MAN p.17
- "Character" opens the Setup Side screen: rename the side, and pick a named computer leader (name + attitude description) from a scrolling list appropriate to the chosen level. Without a choice a standard opponent is used. [original] MAN p.16; HLP ("Side Name", "Select Leader")
- Right panel "Options": Beginner, Intermediate, Advanced, Edit Options, "I am the Greatest"; then "Game": Begin, Main Menu. SSG logo below. Bottom-right box shows a literary quotation. [original] SHOT 09
- "I am the Greatest" sets all opponents to Warlord (still editable) and the computer players react to the boast. HLP calls this button "Top Level" / "Top Level Off". [original] MAN p.17; HLP
- Bottom strip: Recall Options (load options from the last game), "Difficulty Rating NN%", Random Characters (random leader for each side). [original] SHOT 09; HLP; STR
- Hot-seat multiplayer with several humans is the only multiplayer mode evidenced. [original] MAN (settings, "absent human player"). Play-by-email: WIKI attributes it to the series article without separating editions. [unclear]

### 1.6 Game options (Edit Options)

The options dialog groups options under "Affecting Difficulty" and "Not Affecting Difficulty" (which option is in which group is not established). [original] STR

| Option | Values | Effect | Tag / source |
|---|---|---|---|
| Neutral Cities | Average / Strong / Active | Average: one defender, the weakest type the city can make. Strong: one defender picked from all types the city can build. Active: one defender, more likely a strong type; after a failed attack the city produces extra defenders up to a maximum of five armies. | [original] MAN p.45; STR |
| Diplomacy | on/off | Off: everyone permanently at war. On: full diplomatic system (section 8). | [original] MAN p.47 |
| Quests | on/off | Heroes can be offered quests at temples; strongholds become hidden sites. | [original] MAN p.44, p.46; HLP ("Hero quests and hidden sites") |
| Hidden Map | on/off | Whole map hidden except a small area around the start castle; revealed as armies move. | [original] MAN p.46 |
| View Enemies | on/off | Right-click can inspect enemy stacks. | [original] MAN p.46; HLP ("Can look inside enemy stacks") |
| View Production (manual: "View Enemy Cities") | on/off | The Cities command shows production info of enemy cities. | [original] MAN p.46; STR; HLP |
| Intense Combat | on/off | Heavier casualties both sides, advantage of strong armies reduced. HLP wording: "Bias combat towards large stacks". | [original] MAN p.46; HLP |
| Quick Start | on/off | All cities divided among the players at game start. | [original] MAN p.45; HLP ("Begin with all cities owned") |
| Military Advisor | on/off | Shift-click on a target gives a battle prediction. | [original] MAN p.45 |
| Random Turns | on/off | Player order re-randomised at the start of each turn. | [original] MAN p.46 |

- Presets: Beginner / Intermediate ("Mid-level") / Advanced set groups of options. Their exact contents are not documented. [original] MAN p.17; HLP. Contents [unclear].
- Options NOT present in the original's manual, help table or string table: razing-cities option, cusp-of-war, see-opponents'-production variants, army-set/city-set selection. These exist in LordsAWar and/or later editions. [unclear] for exactly which edition introduced each; treat as not original.

### 1.7 Deluxe additions (for exclusion)

- Deluxe (1995) added 256-colour support and custom tile, army and city sets; its editor drove user-made content. [deluxe-only] WIKI
- Scenario Builder was a separate 1994 expansion (24 premade scenarios per a CGW review cited there). [deluxe-only in the sense "not in the 1993 base game"] WIKI
- Original is 16-colour-era VGA art on floppies; Deluxe was CD-ROM. [original]/[deluxe-only] WIKI, GB

---

## 2. Turn structure

- Sides move in the order of the Game Setup screen; with Random Turns the order is re-rolled each turn. [original] MAN p.46
- A turn-number message appears at the start of a player's turn; click it to begin. [original] MAN p.10
- Turn 1: a free hero appears in each side's capital with a hero dialog (rename, male/female, OK). [original] MAN p.10; HLP ("Male Hero", "Female Hero", "Name")
- In the tutorial walkthrough the next step is setting the city's production; whether the game opens the production dialog by itself or the player opens it is not clear from the text. [unclear] MAN p.11
- Start of turn, per player:
  - City income is added to the treasury "at the beginning of every turn". [original] MAN p.38
  - Upkeep is paid each turn: half an army's production cost (example: 4 gp to build → 2 gp per turn). [original] MAN p.38. Rounding for odd costs is not stated. [unclear]
  - Allies gained in ruins have no maintenance cost. [original] MAN p.52
  - Movement points regenerate; at most 2 unused MPs carry over from the previous turn. [original] MAN p.28
  - Finished production appears; vectored production arrives two turns after completion. [original] MAN p.41
  - A hero may offer service if the player can afford him (section 5). [original] MAN p.52
  - A group under Defend that stayed put for a full turn outside a city/ruin becomes encamped at the start of its next turn. [original] MAN p.26
  - Quest-became-impossible messages are shown at the start of the turn. [original] MAN p.47
  - Diplomatic proposals are compared and resolved. [original] MAN p.47 (timing within the turn [unclear])
- The exact ordering of these start-of-turn steps is not documented. [unclear]
- No hit-point healing exists: armies have 2 hits per individual fight and nothing in the manual carries damage between battles. [original by omission] MAN p.64. LordsAWar restores HP after a fight. [unclear] LAW
- Info Area shows four numbers: cities owned, gold, income this turn, upkeep. [original] MAN p.22
- End of turn: Turn menu → End Turn (Alt+E). [original] MAN p.59
- Running out of money stops production; disbanding is the remedy. Any harsher penalty (desertion etc.) is not described. [original] MAN p.38; details [unclear]
- An all-computer game can be interrupted by holding Alt (README) or Shift/Alt (STR) while a computer finishes its turn; this opens the Settings dialog. [original] README; STR

---

## 3. Armies

### 3.1 Basics

- 28 army types (manual text). The appendix has 30 columns: 27 producible/ally types plus Navies, Hero and Flag. 27 + Hero = 28, which matches the manual; GB's 27 excludes heroes and navies. [original] MAN p.31, p.61-63; GB
- Three classes: ordinary armies, special armies (allies/supernaturals), heroes. [original] MAN p.30
- Acquisition: production in cities, alliance (ruin guardians join a hero; hired heroes bring allies), hiring heroes. [original] MAN p.31
- Combat value 1 to 9 before modifiers. [original] MAN p.32, p.64
- Stack limit: 8 armies per square. Groups may pass through friendly squares over the limit during movement, but may not end there. [original] MAN p.23, p.28
- Stack size is shown on the map by flag length: armies 1-4 lengthen the top flag; a fifth adds a short bottom flag with a short top flag; 6-8 lengthen the top flag again. [original] MAN p.30
- Group vs stack: a group is one army or armies explicitly combined; a stack is everything in a square. Units move and attack as groups, defend as stacks. [original] MAN p.22-23
- Disband (Order menu) removes the selected group, heroes included. [original] MAN p.32
- Upkeep: half build cost per turn; allies free. [original] MAN p.38, p.52
- Settings dialog has a per-player "Enhance" toggle. MAN calls it "Enhanced Production, which adds +2 to each army's combat value"; HLP says "Set enhance mode of player N". [original] MAN p.53; HLP. Whether it affects only newly produced armies is not stated. [unclear]

### 3.2 Standard army table (default army set)

Read from the page images of Appendix A. [original] MAN p.61-63. Scenarios may alter these, so the data files are authoritative per scenario.

"Establish" = one-off gold cost to add that type to a city's production slots.

| Army | Str | Move | Cost | Turns | Establish | Bonuses |
|---|---|---|---|---|---|---|
| Scout | 1 | 16 | 2 | 1 | 10 | Move bonus woods + hills |
| Giant Bat | 1 | 16 | 5 | 1 | 30 | Fly |
| Light Infantry | 2 | 12 | 3 | 1 | 50 | none |
| Orc Mob | 2 | 12 | 4 | 2 | 100 | Move bonus woods + hills |
| Light Cavalry | 2 | 20 | 6 | 2 | 300 | +1 self in open/roads |
| Catapult | 2 | 16 | 16 | 4 | 500 | Negates enemy city/camp defence bonus when attacking |
| Heavy Infantry | 3 | 8 | 5 | 2 | 300 | none |
| Elven Archers | 3 | 12 | 7 | 2 | 400 | Move bonus woods; +1 self in woods |
| Dwarves | 3 | 8 | 7 | 2 | 400 | Move bonus hills; +1 self in hills |
| Pikemen | 4 | 8 | 5 | 3 | 400 | +1 self in open/roads |
| Heavy Cavalry | 4 | 16 | 8 | 3 | 500 | +2 self in open/roads |
| Wolf-Riders | 4 | 16 | 8 | 2 | 500 | +1 stack in hills |
| Giants | 5 | 16 | 10 | 2 | 800 | Move bonus hills |
| Minotaurs | 5 | 12 | 10 | 2 | 800 | +1 self in city |
| Giant Spiders | 5 | 12 | 12 | 2 | 1000 | +2 self in city |
| Pegasi | 5 | 20 | 12 | 3 | 1000 | Fly; +1 stack |
| Griffins | 6 | 20 | 15 | 3 | 1500 | Fly; +2 self in city |
| Unicorns | 7 | 16 | 15 | 4 | 1500 | +1 stack |
| Elephants | 8 | 16 | 15 | 4 | 1500 | When attacking: -1 to every enemy army |
| Navies | 4 | 20 | n/a | n/a | n/a | Any army at sea: strength 4, no bonuses |
| Wizard | 6 | 50 | 12 | 4 | n/a | +1 stack |
| The Worm | 7 | 12 | 12 | 4 | n/a | +1 stack |
| Undead | 7 | 16 | 12 | 4 | n/a | +1 stack |
| Demon | 7 | 20 | 15 | 4 | n/a | +1 stack |
| Elemental | 8 | 12 | 15 | 4 | n/a | +1 stack |
| Devil | 8 | 16 | 15 | 4 | n/a | +1 stack; negates all enemy non-hero, non-city bonuses |
| Archon | 8 | 16 | 20 | 4 | n/a | +1 stack; negates all enemy hero bonuses |
| Dragon | 9 | 22 | 20 | 4 | n/a | Fly; +2 stack |
| Hero | 5-9 | 14-22 | n/a | n/a | n/a | Grows with experience |
| Flag | n/a | n/a | n/a | n/a | n/a | Planted standard; vector target |

Notes on the table:

- "City" terrain for bonuses includes ruins, camps and sacred sites; "open" includes roads. [original] MAN p.62
- The Army Bonus screen in-game shows for example Pikemen 4/8 "+1 str in open", Archers 3/12 "+1 str in woods", Dwarves 3/8 "+1 str in hills", Minotaurs 5/12 "+1 str in city", Giants 5/16, Spiders 5/12 "+2 str in city" — matching the table, with shorter in-game names (Archers, Spiders). [original] MAN p.28 fig 8.1
- Ghosts are named in README's rename list but the appendix column is "Undead". The in-game default name for that unit is therefore probably "Ghosts". [unclear] README vs MAN p.63
- The Elephant note says "reduce by 1 point the combat value of every enemy army"; STR has "%d enemy stack". [original] MAN p.62; STR
- Catapult move 16 and cost 16 are as printed; worth cross-checking against the army data file. [original as printed] MAN p.61
- Special armies have build cost/time (used when "Cities can produce allies" is on) but no establish cost: they cannot be bought into a city. [original] MAN p.40, p.63

### 3.3 Bonus vocabulary used by the game

Exact strings of the army bonus list: "+%d hero bonus", "+1 & cancel hero", "+1 & cancel non-hero", "+%d special", "Cancel city bonus", "%d enemy stack", "+%d stack in hills/woods/open/city", "+%d str in hills/woods/open/city", "+%d to stack", "Boat strength of 4". Column tags "siege", "spc/fly". [original] STR

### 3.4 Individual bonuses

- Temple blessing: +1 combat value, once per temple per army, stackable across different temples. [original] MAN p.33, p.43
- Medals (veteran armies): after a combat in which two or more armies took part on BOTH sides and the winner was led by a hero, there is a small chance one winning army is decorated. Heroes and allies are not eligible. +1 strength per award, at most four awards (+4). Shown as stars beside the army in the Stack dialog. [original] MAN p.36
- Medal dialog text: "A Medal!", four medal names (Star of Battle, Warriors Cross, Shield of Courage, Heart of Virtue), and two outcome lines "Their strength has increased" and "Their movement has increased" "from %d to %d!". So a medal can raise movement as well as strength, which the manual does not mention. [original] STR. Probability and when movement is chosen: [unclear]
- LordsAWar uses a different medal scheme (three medals tied to hit counters). Do not copy. [unclear] LAW
- Terrain bonuses use the terrain of the DEFENDER's square. [original] MAN p.33
- Base strength (including medals, levels, blessings) cannot exceed 9 before the stack modifier. [original] MAN p.64

### 3.5 Stack bonuses

- Every special army gives +1 to its whole stack, dragons +2. [original] MAN p.33, p.63
- Hero strength bonus to the stack: strength 4-6 → +1; 7-8 → +2; 9 → +3. Battle items raise hero strength and can therefore raise this. [original] MAN p.49
- Command items add a further stack bonus (the Standard is +1). [original] MAN p.50
- City walls bonus for defenders; encamped +1 for defenders. [original] MAN p.33
- The total stack bonus is capped. The cap varies per scenario, "usually about +5", and is shown on the top line of the Stack dialog. [original] MAN p.33, p.64
- Negation: Devil cancels enemy non-hero bonuses (not city, not encamped); Archon cancels enemy hero bonuses; Catapult ("siege") cancels city and camp defence bonuses when attacking. [original] MAN p.34, p.62-63
- Whether multiple +1 specials accumulate or only the highest counts is not stated. LordsAWar takes the highest non-hero bonus rather than the sum. [unclear] LAW

### 3.6 Encampment (fortification)

- Defend order + stationary for one full turn + outside a city or ruin → encamped at the start of the next turn. Icon replaced by a small tower. +1 in defence. [original] MAN p.26
- STR terrain entry "Tower — Very hard to conquer!". [original] STR
- An encamped square counts as "city" terrain for [C] bonuses (appendix lists "camps"). [original] MAN p.62

### 3.7 Ships and water

- No separate ship units and no ship production. Each army "hires its own boat". [original] MAN p.29
- Embark/disembark only at a coastal city, a bridge, or a port (coastal square with an anchor symbol). [original] MAN p.29
- Setting a destination on or across water moves the group to the embarkation point, where it stops and its icon becomes a ship. It can move on water from the next turn. [original] MAN p.29
- Disembarking (moving onto land at a valid point) also ends the move; normal land movement resumes next turn. [original] MAN p.29
- A naval group attacking a city from the sea does NOT end its naval movement and can keep moving/attacking while MPs last. [original] MAN p.30
- Razed cities still act as ports. [original] README
- Navy move value 20. [original] MAN p.62. LordsAWar uses 18. [unclear] LAW
- Pathfinding handles embark → cross → disembark automatically over several turns. [original] MAN p.30
- Message "Alas! %d armies have been sunk due to lack of a boat!" exists. Trigger not documented (likely non-flyers left over water, e.g. after a flying carrier dies). [original string] STR; trigger [unclear]

### 3.8 Flying

- A group flies only if every army in it can fly, with one exception: a hero may ride with flying armies; he flies if all OTHER armies in the group fly, or if he carries a flight item. [original] MAN p.29
- Flying groups cross water and mountains; "Mountains — Only for flying armies". [original] STR; MAN p.29
- Flying armies fight at normal strength against naval groups. [original] MAN p.36
- Stack Palette shows wings when the whole current group can fly. [original] MAN p.24

---

## 4. Combat

### 4.1 Starting a fight

- Attack by moving a group into an adjacent enemy stack or city (sword cursor, click). Only the selected group attacks, at most 8 armies. [original] MAN p.32, p.34
- The defender is the whole stack in the square. For a city the defender is every army in the city, up to 32 (4 squares x 8), whichever wall is attacked. [original] MAN p.34
- A city with no defenders is captured without a fight ("The garrison has fled before you!" and variants). [original] MAN p.32; STR
- Fights are always to the death: one side is completely eliminated. [original] MAN p.34

### 4.2 Resolution algorithm

[original] MAN p.64 (Appendix B) unless noted.

1. Compute each stack's Combat Modifier: hero stack bonuses and command items, special-army stack bonuses, terrain of the battle square, city/encampment bonus, minus enemy negations.
2. Compute each army's modified Combat Value = base value (max 9) + individual bonuses + stack modifier (capped per scenario, about +5).
3. Line both sides up in fight order, most valuable armies last (right-hand side of the battle display).
4. The front (left-most) army of each side duel. The survivor stays and faces the loser's next army.
5. Duel step: each army rolls one die. A roll is "low" if it is less than or equal to the ENEMY army's modified combat value, otherwise "high". Both low or both high → reroll. One low and one high → the low roller takes 1 hit.
6. An army with 2 hits is destroyed.
7. Repeat until one side has no armies.

- Die size: "a 16-32 sided die, depending upon the scenario chosen and whether the Intense Combat option is in effect". [original] MAN p.64. The actual numbers for the shipped scenarios are not in the manual. [unclear]
- LordsAWar uses 20 sides normally and 24 with intense combat, and an equivalent hit rule (roll below own strength hits; simultaneous or neither → reroll; 2 hit points). That fits inside the manual's 16-32 range but is not proof for v1.0x. [unclear] LAW
- Whether hits persist on a surviving army into its next duel within the same battle is not spelled out. The wording "as soon as an army receives 2 hits it is destroyed" plus "survivor going on to fight" implies hits persist within a battle. [unclear]
- Upper bound of modified strength: only the base cap (9) and the stack cap (about +5) are stated, giving roughly 14 plus city bonus. No explicit total cap is given. [unclear]

### 4.3 Fight order

- Default: weakest armies first, heroes last. [original] MAN p.34, p.54
- Over mountains or sea a flying creature goes last instead of the hero, so the hero is not stranded by its death. [original] MAN p.54
- Order → Fight Order shows all army types of the side; click two to swap or move one with arrows; Reset restores default. HLP: "Increase Priority — Move to the front in a battle", "Decrease Priority — Move to the rear in a battle", "Swap Armies". The order is per side, by army type. [original] MAN p.54; HLP; STR ("Order of combat for %s")

### 4.4 City defence

- City bonus depends on how many army types the city can produce: 1 or 2 types → +1; 3 or 4 types → +2. [original] MAN p.34
- Consequently pillage/sack lower the defence (HLP: Pillage "Reduce defence for gold", Sack "Destroy defences for gold"). [original] HLP
- City info shows "Defence: %d" and "Income: %d gold". [original] STR
- The bonus for a city with no production types at all (possible in scenario data or after pillaging a one-type city) is not covered. [unclear]
- There is no command to buy city defence upgrades in the original's menus, help table or strings. Purchased defence levels are a Warlords I mechanic. [original by omission] MAN p.40, p.57-58; HLP
- LordsAWar derives city bonus as defence level - 1 (levels 1-4). Different model. [unclear] LAW

### 4.5 Naval combat

- All armies on boats fight at strength 4 with no bonuses of any kind. [original] MAN p.36, p.62; STR ("Boat strength of 4")
- A naval group attacking a city fights as a land group with all normal bonuses. [original] MAN p.36
- A city stack attacking an adjacent naval group fights as a navy itself (strength 4, no bonuses); the Military Advisor mispredicts this case. [original] MAN p.36

### 4.6 Military Advisor

- Shift while the sword (or heart) cursor is showing → question-mark cursor → click for a prediction; described as very accurate. [original] MAN p.20, p.45
- Text is assembled from three parts: an address ("O Mighty Leader," ...), a lead-in ("this battle would be" ...), and one of ten verdicts from "complete and utter suicide!" through "very evenly matched!" to "as simple as butchering sleeping cattle!". [original] STR
- Thresholds mapping win probability to the ten verdicts are unknown. [unclear]
- `v` switch disables the talking (digitised speech) advisor. [original] README

### 4.7 After the battle

- Result banners: "%s has won the battle!", "You are victorious!", "You have lost!", attacked-notices for the defender and for neutrals. [original] STR
- "Your armies loot %d gp!" exists. Trigger (probably capturing a city owned by a player) and formula are undocumented. [original string] STR; rule [unclear]. LordsAWar has a minimum looted gold constant of 10. [unclear] LAW
- Medal check (section 3.4) and hero experience (section 5.3). [original]

---

## 5. Heroes

### 5.1 Recruitment

- First hero is free, appears in the capital on turn 1, and carries the side's Standard. [original] MAN p.10, p.31, p.51
- Later: each turn a small chance that a hero offers himself, only if the player has enough gold; no offer otherwise. Second and later heroes cost more than the first. [original] MAN p.52
- Hero cap: 5 if you own less than half the cities, 6 if more than half. [original] MAN p.52
- Offer dialog: "A Hero in %s offers to join you for %d gold. You have %d gold to spend. Will you accept?" (Heroine variant "offers service for %d gold"). Buttons Okay (accept) / Cancel (decline), name field, Male/Female toggle. [original] STR; HLP
- Hired heroes bring at least one special creature: "And the hero brings 1 ally!" / "%d allies!". [original] MAN p.31; STR
- Numbers (chance, price range, ally count) are not in the manual. [unclear]
- LordsAWar: 1 in 6 chance per turn when gold exceeds the price; price uniformly 1000-1499; halved when the player has no living hero. Its author's comment says this is from memory of the original. [unclear] LAW

### 5.2 Hero stats and bonuses

- Strength 5-9, move 14-22. [original] MAN p.63
- Stack bonus from strength: 4-6 → +1, 7-8 → +2, 9 → +3. [original] MAN p.49
- "Battle" = strength added by carried items; "Command" = stack bonus from carried items. Both shown in Hero → Inspect together with Level and experience ("Battle:", "Command:", "Level:", "Near:"). [original] MAN p.49-50; STR
- Tutorial: a fresh hero shows "+2 hero bonus" (strength 5 → +1, Standard +1). [original] MAN p.11
- A hero may travel with any army using that army's movement cost (terrain bonuses, flight). [original] MAN p.29

### 5.3 Experience and levels

- Experience: search a ruin +3, capture a city +2, defeat an enemy outside a city +1, defend against an attack +1, be blessed +1, complete a quest +10. [original] MAN p.50
- Each new level: +1 strength, +2 movement. [original] MAN p.50
- Level titles: male Hero (1), Cavalier (2), Champion (3), Paladin (4); female Heroine (1), Amazon (2), Champion (3), Valkyrie (4). Level-up dialog line: "Level: %d Str: %d (+%d) Move: %d (+%d)". [original] STR
- Hero → Levels lists level, current XP, XP needed, strength, move ("Hero Levels", "Level", "Needs"). [original] MAN p.57; STR
- XP thresholds per level are not documented. [unclear]
- Stat range 5-9 / 14-22 implies four increments, i.e. five levels, but only four titles exist. [unclear]

### 5.4 Items

- Found in ruins or given by temples as quest rewards. [original] MAN p.44
- Effect types (exact strings): "+%d in battle!", "+%d to command!", "Allows flight!", "Doubles movement!", "+%d gold per city!". [original] STR
- View → Items lists the items of the current scenario; items are defined per scenario (`*.ITM`). [original] MAN p.57; STR ("Items in this scenario")
- Hero inspect: list of carried items; Drop Item, Take Item, toggle Items on Ground / Items Carried, scroll, Next/Previous Hero. [original] MAN p.51; HLP
- Items of a dead hero: STR has standards "wrested from a vanquished foe" and "betrayed by its guardian" in Triumphs, so standards can be captured/lost. Whether other items drop to the ground on death is not stated. [unclear]

### 5.5 The Standard (flag)

- +1 command item issued with the first hero. [original] MAN p.50-51
- Hero → Plant Flag plants it in the ground; hero must be selected and not in a city, temple, ruin or at sea. [original] MAN p.57
- Production can then be vectored to the standard like to a city, max four armies per turn; the stack limit applies to its square. [original] MAN p.51-52
- The hero need not stay with it. [original] MAN p.52
- Vector strings: "Ordered to Standard!", "Standard!". [original] STR

### 5.6 Searching ruins

- Hero → Search (z). Only a group containing a hero can search ruins. [original] MAN p.57
- Unexplored ruins are always guarded. The hero fights the guardian or it joins him. More accompanying armies improve survival odds regardless of their strength. [original] MAN p.43
- Outcomes: gold, an artefact, allies, or a Sage. An explored ruin is useless afterwards. [original] MAN p.43
- Message flow: "%s encounters a %s..." → "...and is slain by it!" / "...and is victorious!" → "%s has found the %s!" / "%s has found %d gp!" / "A unit of %s offer to join %s" / "%d units of %s offer to join %s" / "%s has found a Sage!". Also "It appears to be uninhabited!", "It has already been explored!". [original] STR
- Strongholds: heavily guarded ruins holding the strongest items; with Quests on they are hidden until revealed as a quest reward. [original] MAN p.44
- Site types in data: Ruin, Temple, Stronghold; state Explored/Unexplored. [original] STR
- Guardian fight odds and reward amounts are undocumented. [unclear]

### 5.7 Sages

- Greeting offers three choices: Items, Money, Maps. [original] STR; HLP
- Items: shows where an item is (location hint strings: "The %s can be found ... near the %s city of %s", "with a hero of %s", "at %s!"). [original] STR
- Money: "The sage gives you a gem worth %d gp!". [original] STR
- Maps: only when Hidden Map is on; the player points at the map and a small area is revealed. [original] MAN p.43; STR
- Right-click/sage hints about sites: "Blessings and Quests are found there!", "An ancient artifact is there!", "I believe there is much gold there!", "Friendship is possible!", "It is inhabited by a %s!". [original] STR

### 5.8 Temples and blessings

- Any armies (not only heroes) can Search at a temple: +1 strength to every blessed army; once per temple. "%d armies have been blessed!", "We have already blessed thee!", "Seek more blessings in far temples!". [original] MAN p.43, p.57; STR
- With a hero present and Quests on, a choice dialog: Blessing ("Receive +1 to strength") or Quest ("Receive a quest for your hero"). [original] HLP; STR

### 5.9 Quests

Quests ARE in the original (option, Report menu entry, string table, README).

- One quest per side at a time, bound to a specific hero; lasts until completed or impossible. [original] MAN p.46, p.56
- Quest types, from the quest text templates: [original] STR
  - Kill a named enemy hero ("He can be found to the <direction>").
  - Retrieve a named item.
  - Kill a unit of a given enemy army type.
  - Kill N armies of a given side (progress tracked).
  - Conquer and occupy a named city.
  - Conquer and raze a named city.
  - Sack and pillage N gold from enemies (progress tracked).
- Rewards: the location of a hidden site (stronghold), an item, N allies, or money "especially if the successful hero seems poor". [original] MAN p.47; STR
- Completing a quest gives the hero +10 XP. [original] MAN p.50
- Failure conditions (each has a message): hero dead; target city razed; city not taken by the questing hero; city razed/pillaged/kept contrary to the quest; target foes all dead; item gone; target hero slain by someone else. [original] STR
- City-quest decision must be made at the capture dialog: for a raze quest the default button becomes Raze and the city must be razed immediately; likewise for sack/pillage quests. [original] README
- Report → Quest (`=`) shows the current quest and progress. [original] MAN p.56

---

## 6. Cities

### 6.1 Income

- Each city has a fixed income added to the owner's gold every turn (example cities of 20, 25 and 28 gp). [original] MAN p.38
- Income values are scenario data. [original] MAN p.38
- Items can add "+%d gold per city". [original] STR
- Starting gold exists ("You start the game with some gold") but the amount is not documented. [unclear]

### 6.2 Production

- Up to four army types per city; one army in production at a time. [original] MAN p.39
- Click an owned city (tower cursor) or View → Production (p). [original] MAN p.39
- Production screen: a map with a shield per owned city (plain white = idle, white with black anvil = producing, white anvil with black border = the city being viewed); city name; current production ("Current:" with turns, e.g. "1t"); a row of up to four army icons; details of the selected type on the right; Stop button. A strip of icons along the bottom switches sub-screens: anvil (production), castle with question mark (city info), crane (build), arrows (vectoring). [original] MAN p.39-40; HLP ("City Info", "City Build", "City Production", "Vector Production", "Stop Production")
- Whether production repeats automatically after delivery is implied (set once, armies keep arriving) but not explicitly stated. [unclear]
- Whether a city whose four squares are full still delivers is not stated. [unclear]

### 6.3 Building (buying) production

- Build screen (crane): Rename city, Raze own city, Build Production. [original] MAN p.40; HLP
- Build Production lists valid army types with their establish cost; unaffordable ones are greyed; specials and heroes cannot be built. [original] MAN p.40
- Max four types; no duplicates; a new type may replace an existing one (red cursor selects the slot, "Replace Army"). [original] MAN p.40; HLP
- Establish costs: section 3.2 table. [original] MAN p.61-62
- Title line strings: "The %s city of %s", "Thou hast %d gold", "Currently Producing". [original] STR

### 6.4 Vectoring

- A city may send its finished armies to another owned city or to the planted standard. Arrival is two turns after normal completion. [original] MAN p.41
- A destination can receive from at most four other cities. [original] MAN p.41-42
- Screen shows current production and in-transit armies, "Next turn:" and "Turn after:" arrivals. Yellow = outgoing, orange = incoming. [original] MAN p.41-42; STR
- Two actions: single yellow arrow = vector this city to a new destination (choosing the source itself cancels); orange arrows = move the destination of everything arriving at this city. "Show All" / "See All" shows every vector. [original] MAN p.41-42; HLP
- Shift-click on a city in the production map jumps to vectoring ("Left-click to select city / Shift-click for vectoring"). [original] STR
- What happens to in-transit armies when the destination is lost is not documented. [unclear]

### 6.5 Capture: Occupy, Pillage, Sack, Raze

- Victory dialog ("Victory! ... The city is yours! Will you...") with four buttons left to right: Occupy, Pillage, Sack, Raze. [original] MAN p.35 fig 10.1; STR
- Occupy: take the city as is. [original] MAN p.35
- Pillage: the city loses its most expensive army type; the player gets gold. [original] MAN p.35
- Sack: the city loses all but its cheapest army type; more gold. [original] MAN p.35
- Raze: the city is destroyed permanently and cannot be rebuilt or owned; no gold. Still a port. [original] MAN p.35; README
- Result text: "The city of %s is pillaged/sacked for %d gold!", "Ability to produce %d unit(s) has been lost", "and only %d unit(s) remain(s)". [original] STR
- Gold formula is not in the manual. [unclear]
- LordsAWar pays half the establish cost of each removed type (a flat 1500 for types with no establish cost). Plausible, unverified. [unclear] LAW
- All three hostile choices worsen the player's reputation, with or without the Diplomacy option. [original] MAN p.36
- A player can raze his own city from the Build screen. [original] MAN p.40
- No option restricting razing is evidenced in the original. [unclear]

### 6.6 Capital and neutral cities

- Each side has a capital (start castle); the first hero appears there; with Hidden Map only its surroundings are visible. No further special rule is documented. [original] MAN p.10, p.45-46
- Unless Quick Start is on, every non-capital city starts neutral (grey). [original] MAN p.45
- Neutral garrison rules: section 1.6. [original] MAN p.45
- A city occupies four map squares (2x2), each holding up to 8 armies. [original] MAN p.20, p.34

---

## 7. Movement

### 7.1 Movement points and terrain

- Each terrain has one fixed MP cost for all armies; some armies have a move bonus for woods and/or hills. [original] MAN p.27
- A move bonus lets the army pay the plains cost for that terrain; the appendix states this as "reduces the cost to enter it to 2 MPs". So plains cost 2 MP. [original] MAN p.28, p.61
- If any army in a group has a move bonus, the whole group pays the reduced cost. [original] MAN p.29
- Terrain list with the game's own one-line descriptions: Road "The fastest way to travel"; Bridge "For land armies to cross water"; Water and Shore "Only for flying armies and boats"; Forest and Hills "Slows down movement"; Mountains "Only for flying armies"; Plain "The next best thing to roads"; Marsh "Very hard to pass through this"; Tower "A good view of the countryside". [original] STR (label order in the file is Road?, Bridge, Water, Shore, Forest, Hills, Mountains, Plain, Marsh, Tower; the first label was not captured by `strings`)
- Numeric costs for road, forest, hills, marsh, water and flying are not in the manual. [unclear] They are probably in `DATA/TERRAIN.DAT` (54 bytes) or the scenario files.
- No army in the standard set has a marsh bonus. [original] MAN p.61-63
- Unused MPs: at most 2 carry into the next turn. [original] MAN p.28

### 7.2 Illegal moves

- Forbidden terrain for the army type; off the map edge; onto an enemy army or into an enemy/neutral city (must attack instead); ending on a friendly square that would exceed eight armies. [original] MAN p.28
- With Diplomacy, humans may move through allied stacks as if their own (MAN p.29); README states human players must go around allied stacks while allied computer players pass through each other. [original] conflicting: MAN p.29 vs README. README is later and wins for v1.0x.

### 7.3 Group movement

- A group moves at the lowest move value in it ("Group Move" shown in the Stack Palette). [original] MAN p.24
- The group stops as soon as one army cannot afford the next square. [original] MAN p.29
- Paths: clicking a destination computes an efficient route and moves at once. The path is drawn as hollow dots; dots with a cross are beyond this turn's reach. Paths persist across turns and may be re-optimised. [original] MAN p.25
- Alt+click creates the path without moving; Alt+drag from the group drags a shadow to set a path. [original] MAN p.20, p.25
- Order → Move All (m) advances every group with a stored path. [original] MAN p.55
- On a hidden map the pathfinder avoids black squares, which can create odd detours; click short of the unexplored area or use the arrow keys. [original] README

---

## 8. Diplomacy, victory, reports

### 8.1 Diplomacy

- Three states between any two sides. Manual names: Allied, Neutral, Hostile. In-game action buttons: "Offer Peace", "Become Hostile", "Declare War"; event strings: "Peace negotiated with %s!", "War declared with %s!", "%s at war with", "%s at peace with". So the game's own labels look like Peace / Hostile / War. [original] MAN p.47; HLP; STR. Naming conflict recorded in open questions.
- Rules by state (manual wording): Allied — should attack neither armies nor cities; Neutral — may attack each other's armies freely but not cities; Hostile — unrestricted. [original] MAN p.47
- Each side makes a proposal toward each other side; the more hostile of the two proposals takes effect; both must propose alliance for alliance. [original] MAN p.47
- Attacking in breach of the state is allowed (heart cursor instead of sword; clicking still attacks). It counts as a declaration of war and costs a severe drop in diplomatic rating. Prompt: "Milord! Thou art attacking without first having declared war! This shall make thee most unpopular! Shall we attack anyway?". Event: "Treachery upon %s!" / "Treachery by %s on". [original] MAN p.19, p.36, p.47; STR
- Downgrading through the diplomacy screen costs only a moderate rating penalty. [original] MAN p.49
- Rating ladder, best to worst, one per side (relative ranking recomputed each turn): Statesman, Diplomat, Pragmatist, Politician, Deceiver, Scoundrel, Turncoat, Running Dog. [original] MAN p.48-49; STR
- Computer players use the rating to choose allies and targets; pillage/sack/raze hurt it. [original] MAN p.36, p.49
- Diplomatic Report screen: 8x8 grid of side shields with a state icon in each cell, the rating ladder on the right, buttons Action (bottom left) and Done. [original] MAN p.48 fig 14.1
- Diplomatic Action screen: own shield and name; one column per other side; rows "Diplomatic State", "Their Proposals", "Your offers and replies" (three button rows: peace emblem, single sword, crossed swords); buttons Report and Done. [original] MAN p.48 fig 14.2; STR
- Action Palette diplomacy button turns red when a negative proposal has arrived and green for a positive one. [original] MAN p.56
- Allied computer players let each other's stacks pass through. [original] README
- Numeric scoring is undocumented. LordsAWar uses a 0-15 score starting at 8. [unclear] LAW

### 8.2 Victory, defeat, surrender

- Goal: control all cities / eliminate all opposition. [original] MAN p.9
- Surrender offer: surviving computer players may offer to surrender when the human owns more than half the cities on the map AND has a reasonable margin of cities over the nearest computer player. Accept → proclaimed winner; Decline → play to the last city. [original] MAN p.59; HLP ("Accept surrender & end game" / "Decline surrender & fight!")
- Surrender text: "Surrender! Ambassadors from all the other nations offer their lands if thou wilt spare their lives. Accept their resignation?". [original] STR
- Win text: "%s, thou hast triumphed! No side remains to oppose thee! At thy leisure thou mayst inspect thy kingdom". [original] STR
- Elimination texts (random variants): "%s, for thee the war is over!", "thy empire has fallen!", "thou art vanquished!", "thou art no more!", "thy cities are as dust!". [original] STR
- A side is eliminated when it has no cities (implied by "thy cities are as dust" and the all-cities goal); whether leftover armies survive is not stated. [unclear]
- No humans left: "No further human resistance is possible! But the battle will continue! Hold down 'Shift' or 'Alt' to stop the war and visit the sites of thy old battles". No players left: "Alas! No more players are left! ... Hit any key to return to DOS." [original] STR
- Resign (Order → Resign, r): confirmation dialog with Don't Resign / Resign Gracefully ("Leave your cities intact") / Resign Ungracefully ("Burn all your cities!"). The graceful choice is a joke: the cities are burned either way. [original] MAN p.55; HLP; STR
- "All cities seen! The game is open!" message exists (hidden map fully revealed). [original] STR

### 8.3 Reports (Report menu)

| Entry | Key | Content | Source |
|---|---|---|---|
| Army | a | Number of armies per side; map of every army/stack | [original] MAN p.55; STR |
| City | k | Number of cities per side; ownership map | [original] MAN p.55 |
| Gold | g | Gold per side | [original] MAN p.55 |
| Production | n | Armies you produced this turn (scrolling list) | [original] MAN p.55 |
| Winning | w | Ranking of sides; "You are coming first ... last" | [original] MAN p.56; STR |
| Diplomacy | d | Diplomatic Report / Action (only if option on) | [original] MAN p.56 |
| Quest | = | Current quest and progress | [original] MAN p.56 |

Each report has a one-line caption (e.g. "Number of armies each side owns") and a summary line ("You have %d armies"). [original] STR

### 8.4 History (History menu)

| Entry | Key | Content | Source |
|---|---|---|---|
| City | h | Graph of cities owned over time; "On turn %d, thou hadst %d cities!" | [original] MAN p.58; STR |
| Events | e | Notable events per turn, scroll by arrows or slider | [original] MAN p.58 |
| Gold | j | Graph of all sides' gold over time | [original] MAN p.58 |
| Winners | y | Graph of each side's performance; names the leader | [original] MAN p.59 |
| Triumphs | l | Own losses and kills against each side, by category | [original] MAN p.59 |

- Event templates: "%s emerges in %s", "%s killed in battle", "%s killed searching", "%s killed in %s", "%s completes quest", "%s receives a quest", "%s vanquished!", "%s won %s", "%s finds %s" (some allies / a sage / some gold / item), "%s victorious!", "%s at war with", "%s at peace with", "Treachery by %s on". [original] STR
- Triumphs categories: armies, unnatural creatures (specials), heroes, navies, standards — separate wording for own losses and for kills. [original] STR
- History is kept for 200 turns in v1.00s, not the manual's 300. [original] README (overrides MAN p.59)
- Turn 1: "'Tis only turn one, my liege! There is no history yet!". [original] STR

---

## 9. User interface

### 9.1 Screen layout

Five areas: Menu Bar, Playing Map, Overview Map, Action Palette, Info Area / Stack Palette. [original] MAN p.18

Panel outlines measured by scanning for the 1 px black frame lines in the empty game screen. Coordinates are in the 648x488 capture, which has a 4 px black border on every side around the 640x480 image: subtract 4 from x and y for game coordinates. Values are the outline pixels themselves (inclusive). The capture is a JPEG, so allow 1 px of error. [original] SHOT 08

| Area | x (capture) | y (capture) | Game coords (x, y) | Outline size |
|---|---|---|---|---|
| Menu bar | 4-643 | 4 to about 22 | 0-639, 0 to about 18 | White bar, black text: SSG, Game, Order, Report, Hero, View, History, Turn |
| Playing Map | 19-380 | 33-394 | 15-376, 29-390 | 362 x 362 |
| Overview Map | 403-628 | 33-346 | 399-624, 29-342 | 226 x 314 |
| Info Area / Stack Palette | 19-380 | 406-473 | 15-376, 402-469 | 362 x 68 |
| Action Palette | 403-628 | 358-473 | 399-624, 354-469 | 226 x 116 |

The menu bar's lower edge was not measured, only read off the image.

Background is a grey marble texture; panels are darker inset rectangles. [original] SHOT 08

### 9.2 Playing Map

- Close-up scrolling view; cities are 2x2 castles; army icons carry a flag whose length shows stack size; the selected group has an animated "marching ants" outline; a battle shows an explosion graphic. [original] MAN p.18, p.22, p.30
- Cursors: standard arrow (dialogs, menu bar); army-selection (circle with a dot, over own armies); city/tower (over own city → production); sword (attackable enemy); heart (attack would breach diplomacy); land destination (walking feet); sea destination; scrolling hand (hold button to drag the map); path-create (Alt); question mark advisor (Shift over a target); ruin cursor (over ruins and temples → ruins dialog); magnifying glass (over the Overview Map). [original] MAN p.11-12, p.19-21
- Signposts exist on maps, are readable by right-click and editable via Order → Signpost when a selected army stands on one. [original] MAN p.20, p.55; HLP ("Edit Sign")

### 9.3 Overview Map

- Whole world at reduced scale; cities drawn as owner shields (grey for neutral); a rectangle marks the current view. Clicking scrolls the Playing Map there. [original] MAN p.21

### 9.4 Info Area

- Shown when no group is selected: icon+number for cities owned, gold ("gp"), income this turn, upkeep. [original] MAN p.22 fig 6.4

### 9.5 Stack Palette

- Shown when a group is selected: up to eight army icons in a row, movement points under each. [original] MAN p.23-24 fig 7.1
- The current group has a green tick under its left-most army; its armies sit together and share a background circle colour. Other groups in the square are greyed, with a red cross under their first army (click the cross to make that group current). [original] MAN p.23-24
- Click a greyed army to add it to the current group; click a highlighted one to remove it into its own group. [original] MAN p.24
- Right end: terrain/flight indicator at the top (wings, tree, hill, tree+hill, or boat), "Group Move" with the group's MP, and a small group button — green = ungroup all, red = group all. [original] MAN p.24; HLP ("Group All", "Ungroup All")
- Unselected armies are greyed with a yellow highlight ring instead of white. [original] MAN p.11

### 9.6 Action Palette

Layout from the manual figure. [original] MAN p.21 fig 6.3, p.26-27

| Row | Buttons, left to right |
|---|---|
| 1 | Move Group (walking feet), Next Group (arrow), Leave Group (exclamation), Defend (crossed), Deselect (flag with cross) |
| 2 | Show Army Destination (wide), Mouse and Keyboard Info (diamond with ?), Cancel Path (wide) |
| 3 | Four user-assignable shortcut buttons (large) |
| Right of rows 1-2 | 3x3 scroll pad; centre button centres on the current group |
| Right of row 3 | Diplomacy button (crossed swords with emblem) |

| Button | Action | Key |
|---|---|---|
| Move Group | Move the current group along its path (active only with a path) | End |
| Next Group | Select the next group able to move | Return |
| Leave Group ("Quit & Next") | Skip this group until next turn; auto-issued when a group cannot move further | Esc |
| Defend | Skip this group every turn until reselected by clicking it; leads to encampment | none listed |
| Deselect | Deselect the current group | Del |
| Show Army Destination ("Start/End Path") | Toggle view between the group and its destination | Tab |
| Cancel Path | Delete the current path | Backspace |
| Mouse and Keyboard Info | Help pages on mouse, cursors, keys (`HELP/HMOUSE.GFX`, `HKEYS.GFX`, `HITEM.GFX`) | none listed |
| Scroll pad | Scroll the Playing Map in 8 directions | — |
| Centre | Centre on the current group | keypad 5 |
| Diplomacy | Open diplomacy screens | d |

Sources: [original] MAN p.25-27; HLP ("Move", "Next Army", "Quit & Next — Finsh one group, then get next", "Defend", "Centre Screen", "Deselect", "Diplomacy", "Start/End Path", "Help", "Cancel Path").

- Shortcut buttons: Game → Shortcuts (Alt+U) lists all menu commands with icons; click one of the four slots at the bottom, then a command icon, then Done. [original] MAN p.53; HLP ("Replace Button")

### 9.7 Menus and keys

Read from the menu pictures in the manual. [original] MAN p.52-59

| Menu | Entry | Key |
|---|---|---|
| SSG | About Warlords II (version + three memory figures: free, largest block, locked) | — |
| Game | Settings | Alt+X |
| Game | Shortcuts | Alt+U |
| Game | New Game | Alt+N |
| Game | Save Game | Alt+S |
| Game | Load Game | Alt+L |
| Game | Save Map | Alt+M |
| Game | Load Map | Alt+Z |
| Game | Quit | Ctrl+Q |
| Order | Fight Order | i |
| Order | Move All | m |
| Order | Disband | q |
| Order | Signpost | x |
| Order | Resign | r |
| Report | Army | a |
| Report | City | k |
| Report | Gold | g |
| Report | Production | n |
| Report | Winning | w |
| Report | Diplomacy | d |
| Report | Quest | = |
| Hero | Inspect | , |
| Hero | Plant Flag | f |
| Hero | Levels | u |
| Hero | Search | z |
| View | Army Bonus | o |
| View | Items | t |
| View | Build | b |
| View | Cities | c |
| View | Production | p |
| View | Vectoring | v |
| View | Ruins | . |
| View | Stack | s |
| History | City | h |
| History | Events | e |
| History | Gold | j |
| History | Winners | y |
| History | Triumphs | l |
| Turn | End Turn | Alt+E |

- Separators: Game has groups (Settings, Shortcuts) / (New, Save, Load Game) / (Save Map, Load Map) / (Quit); Order separates Resign; Report separates Diplomacy and Quest; View separates (Army Bonus, Items) from the rest; History is (City, Events) / (Gold, Winners) / (Triumphs). [original] MAN p.53-58
- Menu titles are drawn greyed when unavailable. Game Start screen: all eight titles are drawn black. Map-generation scroll, empty game frame and Game Setup screen: only "Game" is black, the other seven (SSG included) are grey. [original] SHOT 00, SHOT 02 (start); SHOT 03-08 (loading, empty frame); SHOT 09 (setup)

Other keys: [original] MAN p.23, p.25-27

| Key | Action |
|---|---|
| Numeric keypad | Move the current group one square |
| Keypad 5 | Centre on the current army |
| Space | Merge all armies in the square into one group (same as double-click) |
| End / Return / Esc / Del / Tab / Backspace | See Action Palette table |
| Shift (held) | Force the city or ruin cursor; with the sword cursor → advisor |
| Ctrl (held) | Toggle between land-destination and army-selection cursor |
| Alt (held) | Path-create cursor |
| Alt or Shift (held during computer turns) | Interrupt an all-computer game → Settings |

### 9.8 Mouse conventions

- Left click: select group / set destination and move / attack / open production on own city / press buttons. [original] MAN p.19-20
- Double left click on a stack: group all armies in the square. [original] MAN p.12, p.23
- Left button held with the scrolling cursor: drag the map. [original] MAN p.19
- Right click: context help or info on almost anything — armies, cities, terrain, ruins, signposts, icons and buttons, towers, both maps. Buttons show a title plus a one-line description (the HLP table). [original] MAN p.20; HLP
- With View Enemies off, right-click on enemy stacks does not reveal their contents. [original] MAN p.46

### 9.9 Dialogs

- Common furniture: marble panel, title in a blackletter/uncial display face, grey bevelled buttons (Done, Okay, Cancel), four scroll buttons (Up, Page Up, Down, Page Down) for lists. [original] MAN p.17 fig 5.3, p.28, p.35, p.48; HLP
- Loading/progress: yellow parchment scroll with the logo, a message ("Creating the strategic map / Please wait..."), a percentage and a progress bar. Other messages: "Loading a saved game", "Loading a saved map", "Loading a new scenario", "Creating a new random map", "Setting Up Game". [original] SHOT 03-06; STR
- Settings: per player Human/Computer flip, Enhance toggle, Observe toggle; Music, Sound, Voice on/off at the bottom. Switching a side between human and computer confuses the AI for several turns. [original] MAN p.53; HLP
- Observe: not allowed in hidden-map mode with messages "Observe is now on/off!"; in a single-human hidden-map game the map always shows the human's view and computer moves are shown only inside explored areas. [original] STR; README
- Save/Load Game: ten slots; select a slot, OK, edit the name, Return, OK. `IMPORT <MAP|GAME> <file> <listname> <slot 1-10>` imports foreign files; list names up to 14 characters without spaces. [original] MAN p.53-54; README
- Quit / New Game confirmations ("Are you sure you want to quit this game O great and valiant warrior?"). [original] STR
- Stack dialog (View → Stack): same manipulation as the Stack Palette, plus strength with bonuses in brackets, the maximum stack bonus on the top line, medal stars, Group / OK. [original] MAN p.11, p.31-33, p.36
- Army Bonus (View): scrolling list with columns Str, Move, Bonus; move-bonus icon beside the move value; "Bonus" button for more detail; Done. [original] MAN p.28 fig 8.1; HLP
- Ruins dialog (View → Ruins): map with site markers on the left; on the right the site name, a picture, "Type: Ruin/Temple", "Explored: Yes/No", a legend (Unexplored, Explored, Temple, Stronghold), a description text, Done. [original] MAN p.44 fig 13.1; STR
- City info: name, "Income: %d gold", "Defence: %d", owner ("Owner: %s" / "Neutral City" / "Razed City"). [original] STR
- Battle display: both sides lined up, most valuable armies on the right; results shown and announced by voice. [original] MAN p.12, p.64
- Capture dialog, hero offer, level-up, medal, sage, temple choice, quest, surrender, resign: see the sections above. [original]
- Tutorial scenario has built-in help screens that pop up at key moments and are dismissed by a click. [original] MAN p.10-13

---

## 10. Open questions and conflicting sources

1. **Combat die size.** Manual: 16-32 sides depending on scenario and Intense Combat. LordsAWar: 20 / 24. The real per-scenario values must come from the binary or scenario files.
2. **Stack bonus cap.** "Usually about +5", per scenario. Exact value and whether city/encampment bonuses count toward it are unknown. LordsAWar takes only the highest non-hero bonus rather than summing; the manual does not say.
3. **Hit persistence.** Whether a duel winner keeps its hit for the next duel in the same battle is not explicit.
4. **Terrain movement costs.** Only plains = 2 MP is derivable. Road, forest, hills, marsh, bridge, water and flight costs are undocumented externally.
5. **Pillage / sack gold and battle loot.** Formula unknown; LordsAWar's "half of establish cost" is unverified. "Your armies loot %d gp!" has no documented rule.
6. **Hero offers.** Chance per turn, price range, first-vs-later pricing and number of allies are undocumented. LordsAWar's 1-in-6 and 1000-1500 gp come from its author's memory.
7. **Hero levels.** XP thresholds unknown. Four titles (levels 1-4) vs a 5-9 strength range that implies five levels.
8. **Medals.** Probability unknown; STR shows medals can raise movement, the manual mentions only strength (max +4).
9. **AI levels.** Manual and data show Knight, Lord, Warlord only. "Baron" (in the brief) is not attested for the original; it may be Deluxe or a misremembering. The exact strings on the setup button were not captured by `strings` and no screenshot shows a computer level.
10. **Diplomacy state names.** Manual: Allied / Neutral / Hostile. In-game buttons and events: Peace / Hostile / War. Likely mapping Allied=Peace, Neutral=Hostile ("war in the field"), Hostile=War, but that mapping is an inference.
11. **Moving through allied stacks.** Manual says humans can; README says humans cannot (only allied computers can). README is taken as correct for v1.0x.
12. **History length.** Manual 300 turns; README 200. README wins.
13. **Option name.** Manual "View Enemy Cities" vs in-game "View Production". In-game wins.
14. **Preset contents.** What Beginner / Intermediate / Advanced switch on, and which options count toward the Difficulty Rating percentage, are undocumented.
15. **Start-of-turn ordering.** Income, upkeep, production delivery, hero offer and encampment are all "at the start of the turn" with no stated order; behaviour at negative gold is undocumented.
16. **Starting gold** and city income values: scenario data, not in the manual.
17. **Enhance.** "+2 to each army's combat value" per player — scope (all armies or newly produced) unclear.
18. **"Sunk due to lack of a boat"** trigger is undocumented.
19. **Army table check.** The count reconciles (27 types + Hero = 28). Catapult move 16 / cost 16 are as printed and should be checked against the army data.
20. **Ghosts vs Undead.** README implies the in-game name is "Ghosts"; the manual appendix prints "Undead".
21. **Terrain sets and PBEM in v1.0x.** A "Change Terrain" button exists on the random-map dialog; the number of sets is unknown. Wikipedia's feature list does not separate the 1993 game from Deluxe, so play-by-email, the map editor and "multiple army/city sets" are unconfirmed for v1.0x.
22. **Elimination rule.** Whether a side with no cities but living armies is out immediately is not stated.
23. **Sources not reached.** MobyGames returned HTTP 403; no original-edition FAQ with formulas was found. The manual scan's OCR layer is poor; all tables and key bindings above were read from the page images.
