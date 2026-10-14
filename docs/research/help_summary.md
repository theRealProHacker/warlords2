# What the in-game help and READ.ME say about the rules

A summary, in our own words, of the rule-relevant statements in the texts shipped with
Warlords II v1.02: `HELP/WARLORD2.HLP` (button tooltips), `HELP/H*.GFX` (three help
pages), `TUTORIA/T*.GFX` (tutorial pop-ups) and `READ.ME`. These texts describe intent;
they are **not** verified mechanics — exact numbers must come from
`docs/research/exe_logic.md`. Where a text gives a number it is quoted as such.

## Nature of the sources

- **WARLORD2.HLP is not a manual.** It holds 388 records, each a button id, a short title
  and a one-line description (format: `docs/formats/tables.md` §8). It tells what each
  button does, hardly ever how a rule is computed.
- The three `HELP/*.GFX` pages cover keyboard keys, mouse cursors and item bonuses.
- The eleven tutorial pop-ups explain the basic turn flow for the two-player Tutorial
  scenario.
- READ.ME is mostly installation/memory/sound trouble-shooting plus a handful of rule
  clarifications added after the manual was printed.

## Objective and turn structure (tutorial)

- The aim is to eliminate every other player, mainly by leaving them without cities.
- A turn is: move and fight with your armies, end the turn, then the opponents move one
  after another. At the start of your next turn new armies appear and movement
  allowances are restored.
- An army that runs out of movement on the way to a clicked destination keeps its path
  and can continue along it next turn.
- A standard game is described as "8 players, 40 ruins, and 80 cities"; the tutorial
  island has 6 cities, 6 ruins and 2 players.

## Cities and production

- A city can produce "up to four different army types"; choosing one starts production,
  and right-click shows an army's statistics without selecting it.
- Production buttons: stop production, buy a new army type for the city ("Build
  Production"), replace one of the four slots, rename the city, raze it.
- **Vectoring**: armies produced in one city can be sent directly to another city;
  an existing destination can be moved ("Move all armies coming here") and all vector
  paths can be displayed. No delay or limit is stated in these texts.
- Reports exist for armies, cities, gold, this turn's production, and "the leaders"
  (winning report); history graphs stop at turn 200 (READ.ME: "not 300 as the manual
  states").
- READ.ME: razed cities cannot be owned or produce, but "still act as ports".

## Capturing a city

After winning a city four choices are offered. The tooltips and tutorial describe them as:

| choice | description in the texts |
|---|---|
| Occupy | little damage, production can start immediately; "usually the best option" |
| Pillage | "Reduce defence for gold" — a little money, some damage |
| Sack | "Destroy defences for gold" — much more money, much more damage |
| Raze | "Burn city to the ground" — destroyed, "can never be rebuilt" |

No amounts are given.

## Heroes, ruins, temples, sages, items

- Every player starts with one hero, who arrives alone. Later heroes "offer to join you
  … but only if you have enough gold to pay them" and may bring allies ("such as dragons
  and wizards"). The offer dialog allows accept/decline, renaming, and setting the hero
  male or female.
- Only heroes search ruins. Four kinds of result are named: items, gold, allies, sages.
  Allies: "From one to three may decide to join you." Sages can reveal items or other
  ruins, give money, or uncover part of a hidden map (buttons "Items", "Money", "Maps").
- Temple buttons: "Blessing: Receive +1 to strength" and "Quest: Receive a quest for your
  hero".
- Item bonuses (help page): five kinds —
  - *Battle*: adds to the strength of the carrying hero only.
  - *Command*: adds to the hero and to every army stacked with him.
  - *Movement*: doubles the movement of every unit stacked with the hero "at the start
    of turn".
  - *Flying*: turns the hero's stack into flying armies.
  - *Gold*: adds an amount of gold to income "for each city you own".
- Heroes can take and drop items; items can lie on the ground.
- READ.ME on quests: a quest to raze a city must be fulfilled "as soon as the city
  falls" (the raze button is then the default); the same holds for sack and pillage
  quests.

## Combat-related statements

- Fighting is started by clicking an enemy with the sword cursor. A different cursor
  indicates "you're not at war yet" (diplomacy on).
- The Military Advisor "speculates on combat results" (hold a key while the sword cursor
  is shown).
- A fight-order screen lets the player move army types to the front or rear of the
  battle line, swap two entries, or reset to the original order.
- Option tooltips: *Intense Combat* — "Bias combat towards large stacks"; *View Enemy* —
  may look inside enemy stacks.
- No dice, strength modifiers or hit counts are mentioned anywhere in these texts.

## Game options (setup screen tooltips)

| option | tooltip meaning |
|---|---|
| Neutral Cities | sets the difficulty of neutral cities |
| Diplomacy | diplomatic options on/off |
| Quests | hero quests and hidden sites |
| Hidden Map | play with a hidden map |
| View Enemy | can look inside enemy stacks |
| View Production | city production visible to all |
| Intense Combat | bias combat towards large stacks |
| Quick Start | begin with all cities owned |
| Military Advisor | speculates on combat results |
| Random Turns | random ordering of turns |

Presets: Beginner, Mid-level and Advanced game; "Recall Options" reloads the last game's
options; "Random Characters" picks a random leader (computer personality) for each side;
a "Top Level" toggle exists. Each player can be human or computer, with an "enhance"
mode and an "observe" switch per player. Random maps take four settings: amount of
water, hills, forest and number of cities (each also "random"), plus "Produce Allies"
(cities may produce ally armies) and an alternate terrain set.

## Diplomacy

Per opposing side there are three actions: offer peace, become hostile, declare war.
A report/action pair of screens exists. READ.ME: allied computer players let each other's
stacks pass through to attack an enemy beyond; human players must go around allied
stacks.

## End of game

- Surrender: the remaining sides may offer surrender; the player can accept (ends the
  game) or decline and fight on.
- Resigning: gracefully (cities left intact) or ungracefully ("Burn all your cities!").
- READ.ME: with no human players left (or when observing), holding ALT while a computer
  player finishes its turn opens the settings dialog where human/computer control can be
  changed.

## Hidden map notes (READ.ME)

- Path-finding avoids unexplored (black) areas, so clicking a far destination may give
  odd routes; move in short steps through unexplored parts.
- In a single-human game with hidden map, the display always shows the human's view;
  observed computer players are only shown where they cross explored areas.

## Other READ.ME facts

- Command-line switches: `x` extended memory, `h` no expanded/extended memory, `s`
  alternate army names, `m` monochrome, `v` no talking advisor, `n` no startup animation.
- `s` renames four armies: Ghosts→Shamblers, Demons→Gargoyles, Devils→Imps,
  Archons→Winged Folk (matches ARMYTYP2.DAT).
- IMPORT.EXE installs someone else's saved map or game into one of the 10 list slots
  (`IMPORT <MAP|GAME> <file> <listname> <slot>`, list name ≤ 14 letters without spaces) —
  consistent with the slot lists in SAVEINFO.DAT / MAPINFO.DAT.
- The READ.ME header says "v1.00s" although the executable reports Version 1.02.

## What these texts do not say

Combat resolution, strength bonuses and caps, movement costs, income and upkeep,
hero prices and probabilities, ruin outcome odds, pillage/sack amounts, vectoring delay,
diplomacy mechanics, AI behaviour. None of that can be taken from the shipped help;
see `docs/research/exe_logic.md`.
