# Warlords II (1993, DOS v1.02) in pygame — architecture and milestone plan

Target: a faithful reimplementation of the original game (not Deluxe). Planning document. M1a (`warlords2/formats/`) is done; everything else is to be built.

## 0. Ground rules

| Rule | Consequence |
|---|---|
| Evidence only | Every behaviour traces to (a) `WARLORD2.EXE` via `rea` on `out/rea/WARLORD2_flat.exe` (results in `docs/research/exe_logic.md`), (b) `START.EXE` for the intro, credits pages and font drawing only (it is a separate program, see X16), (c) the shipped data files, or (d) the 1993 manual / READ.ME as recorded in `docs/research/rules.md`. Precedence on conflict: EXE > data > READ.ME > manual. LordsAWar and memory of other Warlords versions are never a source. |
| No emulator | Code and data are the oracle. Screens without a reference capture are checked against decoded assets and EXE draw code, and the plan says so each time. |
| No assets in the repo | Game data is read at run time from `--data` (default `original/game/Warlrd2`, env `WL2_DATA`). No pixels, sounds, music or game text in tracked files. `original/` and `out/` stay git-ignored; rendered music lives only in the local cache `out/music/`. |
| Game text | `warlords2/`, `tests/`, `tools/` contain no game text: source refers to text as `(group, index)` into `STRING.DAT` or by HLP id; tests assert SHA-256 digests, lengths and counts. `docs/` may quote short strings (existing quotes stay). |
| Nothing silently defaulted | Unverified values are `Unverified(name, row)` objects in the owning module's constants file (`rules/constants/<module>.py`); they raise on use unless `--allow-unverified` is given. `tests/test_traceability.py` asserts each one names a row of section 5. |
| Game directory is read-only | The original writes `DATA/OPTIONS.DAT`, `DATA/OPTIONS.SND`, `DATA/SAVEINFO.DAT`, `DATA/MAPINFO.DAT` and `SAVE/` (`UDB/UDB.CUR` is referenced in ovl14, `tables.md` §7; whether it is written is not traced). Nothing is written under `--data`; options, sound settings, shortcut assignment, saves and map slots go to `--user-dir` (default `out/user/`). |
| Presentation | 640x480, 16 colours, integer-scaled to the window. |
| Libraries | `pgsm` (`StateManager`) and `pygame-screen-record` are the user's published packages and are never modified. Their bugs are worked around in `warlords2/` and listed with file:line in section 3.4. |

Inputs and their state on 2026-10-14:

| Document | State | Used for |
|---|---|---|
| `docs/research/exe_logic.md` | present (927 lines) | RNG §2, combat §3, movement §4, heroes/sites/quests/items/medals §5, cities/economy/turn/diplomacy/victory/AI/options §6, structures §7, open points §8. Cited below as *EL §n*. |
| `docs/research/rules.md` | present | rules and UI from manual/README, 23 open questions in §10 |
| `docs/research/help_summary.md` | present | intent statements from HLP / tutorial / READ.ME |
| `docs/formats/graphics.md`, `scenario.md`, `tables.md`, `sound.md` | present | byte formats; `sound.md` §2 has the music mode → track → call-site table |
| `docs/formats/music.md`, `tools/render_music.py` | being written by another agent | XMI parse, OPL render with `MIDPAK.AD` timbres, GM fallback, WAV cache in `out/music/` |
| `docs/research/parts/00_image.md` | present | EXE structure, address notation |
| `~/.gstack/projects/warlords2/` | no artifacts | nothing to honour |

Doc follow-ups found while planning (owned by M1c, docs only): `tables.md` §9 still tags the OPTIONS.DAT order [inferred] although EL §6.9 verifies it; `tables.md` §1 "w13 meaning not established" is answered by EL §5.2/§5.8 (ally/medal eligibility); `scenario.md` SCN header table can take the offsets EL §6.1/§7 identified (0x0C0 level, 0x0D0 human/computer, 0x0E0 card, 0x0F0 enhanced, 0x110 current player, 0x112 bonus cap, 0x10E3 infamy, 0x1103 quests, 0x153B relations).

## 1. Package layout

Package `warlords2/`, run as `python -m warlords2`.

**Dependency rule.** Engine = `formats`, `model`, `rules`, `ai`. It imports only the standard library and itself, never `pygame`, `numpy`, `cv2`, `StateManager` or `pygame_screen_record`. Direction: `formats` <- `model` <- `rules` <- `ai` <- presentation. `tests/test_architecture.py` imports every engine module with those names blocked.

**Determinism rule.** The engine has no global state, no wall clock, no `random` module calls. All randomness goes through one `rules.rng.Rng` owned by `GameState`. Same scenario + options + seed + command list gives the same state hash. This is tested at engine level only.

**Registry rule.** Presentation code that several milestones extend goes through `ui/registry.py` (M2a). A milestone adds entries by decorating functions in its own files; the registry imports every module under `ui/dialogs/`, `ui/anim/`, `ui/info/` and `audio/` at start-up (`pkgutil.walk_packages`). Nobody edits another milestone's file to wire a feature in.

### 1.1 Engine: `formats/` (done in M1a; names as implemented)

Records are plain dicts keyed by the field names of the format docs; `tools/dump_*.py` dump them unchanged.

| Module | Public interface (as implemented) | Source of truth |
|---|---|---|
| `formats/gamedir.py` | `GameDir(root)`; `.path(rel)`, `.read(rel)`, `.verify() -> list[str]`, `.scenarios() -> list[ScenarioHeader]`; `default_root()`, `DEFAULT_ROOT`, `DATA_ENV`, `EXE_NAME` | `00_image.md`, `tables.md` §5 |
| `formats/pal.py` | `parse_pal(data) -> list[tuple[int,int,int]]`, `pal_to_dac(v)`, `dac_to_rgb8(d)` | `graphics.md` §1 |
| `formats/pck.py` | `decode_pck(data) -> Bitmap` (`NamedTuple(width, height, rows: list[bytes])`); `Sheet`, `sheet_info(rel)`, `SHEETS`, `TERRAIN_PAL` | `graphics.md` §2-3 |
| `formats/font.py` | `parse_fin(data) -> FontInfo` (dataclass); `glyph_rects(fi) -> list[Rect4]` | `graphics.md` §4 |
| `formats/gfxscript.py` | `parse_gfx(data) -> list[GfxCmd]` (tuples `(letter, *args)`) | `graphics.md` §5 |
| `formats/scenario.py` | `load_scenario(gd, name) -> ScenarioData` (dict); `parse_scn/parse_map/parse_rd/parse_sgn/parse_itm/parse_desc`; `parse_scenario_header`, `parse_scenario_dat`; `parse_saved_map`, `parse_hst`, `parse_random_dat` (tool-only consumers, see section 1.6); `NEUTRAL`, `MAP_W`, `MAP_H`, `SCENARIOS` | `scenario.md` |
| `formats/tables.py` | `parse_armytypes -> list[ArmyTypeRec]`; `StringTable(data).get(group, index)`; `parse_area/parse_button/parse_join/parse_udb/parse_help/parse_options/parse_slots(data, sep)/parse_quotes/parse_card(crd, dsc)/parse_heronames/parse_mapcolor/parse_terrain/parse_sounddat/parse_voice_text`. `parse_scenario` is a duplicate decoder, removed in M1c | `tables.md` |
| `formats/sound.py` | `load_8sn(data) -> Pcm` (`RATE = 11000`); `xmi_chunks(data)` (replaced by `formats/xmi.py` in M10c) | `sound.md` |
| `formats/xmi.py` (M10c) | `parse_xmi(data)`, `parse_ad(data)` moved from `tools/render_music.py` | `music.md` |

### 1.2 Engine: `model/` (M4a; closed lists, no rules)

| Module | Interface | Notes |
|---|---|---|
| `model/ids.py` | `Terrain` 0-11 (Road, Bridge, Water, Shore, Forest, Hills, Mountains, Plain, Marsh, Tower, City, Site — STRING group 128 order, [V] EL §4.1 ovl46:0000), `TerrainClass` (city 0, open 1, woods 2, hills 3; EL §3.3), `MAP_W/MAP_H`, `NEUTRAL_OWNER`, `NO_OWNER` (see X17), `HERO_TYPE = 28`, `ItemType` (1, 2, 5, 6, 7, 8), `SiteKind` (0-5, EL §5.1), `Relation` (0 peace, 1 neutral, 2 war; EL §6.6), `Control` | |
| `model/world.py` | `World(tiles, roads, terrain_of_tile, ports, signs, flags)`; `.terrain(x,y)`, `.is_port`, `.road(x,y)`, `.fortified(x,y)` (map word bit 0x2000), `.explored_site(x,y)` (bit 0x4000), `.city_at`, `.site_at` | EL §4.1 map word |
| `model/army.py` | `ArmyType` (all 20 words); `Army(id, type_id, owner, x, y, allowance, moves_left, strength, home_city, hero_slot, medals, upkeep, flags, vector_dest, transit, group, goto)` | EL §5.1, §6.1, §7. Army table convention: `state.armies[i]` is record i (1e1d:8880 + 0x16·i); a free record stays in the list with owner 0xFF (x = y = -1, ovl53:0000, 0b62:03be) and is reused by `rules.movement.alloc_army` (0b62:0309); readers skip owner 0xFF |
| `model/city.py` | `City(index, x, y, name, owner, owner2, defence, slots[4](type, time, strength, moves, cost), income, current, turns_left, attacked_by, vectoring, vector_to)` | EL §6.1 (+0x00..+0x35) |
| `model/site.py`, `model/item.py`, `model/hero.py` | `Site(x, y, name, kind, item, guardian_or_ally, flag_1b, shown_mask)`; `Item(name, type, value, state, holder, x, y)`; `HeroSlot(used, female, name, level, exp)` (40 slots) | EL §5.1 |
| `model/player.py` | `Player(index, name, control, level, card, enhanced, alive, gold, capital, infamy, shown, quest)` | EL §6.1 |
| `model/options.py` | `GameOptions` in OPTIONS.DAT order (EL §6.9 [V]); `.to_words()/.from_words()` | E1 closed |
| `model/newgame.py` | `NewGameConfig(scenario, controls, levels, cards, enhanced, names, options, army_set, seed, rng="python", greatest=None, setup_rolls=())`: `rng` = die source of `Rng` (X06); `greatest` = SCN 0x116 as the setup screen left it (ovl57:0ee8; None keeps the file's word, X29); `setup_rolls` = (dice, sides, add) of the setup screen's ovl59:02bf rolls after the loader's (quotation ovl57:0fe8, Random Characters ovl57:20af), repeated by `new_game` after the loader's 256 so the one dice stream continues | moved out of `rules/setup.py` so M2b does not wait for rules |
| `model/state.py` | `GameState(world, players, cities, sites, items, armies, heroes, monsters, army_types, fight_order, options, turn, current, relations, rng, history, pending, flags, reveal_at_first_human_turn, overview_mountain_rolls, cost_map, path_cache, selection, hero_names, news, battle_work, advisor_talking, advisor_digital, advisor_groups)`; `.hash()`, `.copy()`; `history` = the per-round records of `rules.history` (ovl41:0d60; plain dicts, 200 at most); `flags` holds SCN words with a known role (also the battle statistics 2c04:1163, ovl36:1aff) (bonus cap 0x112, 0x116, tutorial 0x12E, victory 0x15B, surrender-offered 0x15D, …) and keeps unknown SCN words verbatim (S1); `overview_mountain_rolls` = the loader's 256 rnd(1,3,1) (ovl63:2479, overview mountain colours); `cost_map` = 0555:0d9e buffer DS:3f82 (`[]` = not built); `path_cache` = the 20 slots of DS:3f7e (`PathSlot`); `selection` = `Selection(selected, moving, hero, next_ref, palette, palette_selected, palette_group)` (DS:5e62, 5e3e, 5e5e, 3250/3252, 6862 / 6842 / 6852; zero at start); `hero_names` = per side the [female, name] entries of TERRAIN<SCN 0x161>/HERONAM<p>.DAT, supplied to `new_game` by the caller; `news` = per side up to two [kind, a, b, name] (2c04:13e3 + p·0x2b, ovl41:1244); `battle_work` = `BattleWork(attacker, owner, attackers, defenders, a_alive, d_alive, a_types[8], d_types[32])`, the DGROUP arrays of the last ovl38:008b set-up (DS:41fa..436a; zero in the EXE image); `advisor_talking` / `advisor_digital` / `advisor_groups` = DS:26c8 == 0, DS:37a4 != 0 and the FILE.DAT group sizes the talking advisor ovl58:026f(5) rolls on (it writes SCN 0x100/0x108 and rolls the game's dice, so it is engine state; set by the caller, off by default) | |
| `model/commands.py` | Closed list (below) | |
| `model/events.py` | Closed list (below) | |
| `model/serialize.py` | `dump(state) -> dict`, `load(d) -> GameState`; lossless JSON; `snapshot` / `restore` (in place, for the atomic `apply`); `FORMAT = 6` (`load` refuses any other) | own format (X12) |

Commands (every player intention; one class each): `Move(group, dest)`, `SetPath(group, path)`, `CancelPath(group)`, `MoveAll()`, `Group(armies)`, `Ungroup(armies)`, `GroupAll(x, y)`, `UngroupAll(x, y)`, `LeaveGroup(group)` ("Quit & Next"), `Defend(group)`, `Disband(armies)`, `SelectStack(x, y)` (map click, 0b62:0405), `SelectGroup(army)` (palette buttons 232-239), `Next()` (button 174), `Deselect()` (button 178, Del), `ConfirmDisband(yes)` (answers DisbandPrompt), `Attack(group, x, y)`, `ConfirmTreachery(yes)`, `SetFightOrder(order)`, `Search(group)`, `TempleChoice(bless|quest)`, `SageChoice(gem|show_site(target)|map_view)`, `TakeItem(hero, item)`, `DropItem(hero, item)`, `PlantFlag(hero)`, `AcceptHero(yes)`, `NameHero(name, female)` (turn-1 hero), `CaptureChoice(occupy|pillage|sack|raze)`, `SetProduction(city, slot)`, `BuyProduction(city, type)`, `SetVector(city, dest)`, `RenameCity(city, name)`, `RazeOwnCity(city)`, `EditSign(sign, line1, line2)`, `Propose(other, relation)`, `SetControl(player, control)`, `SetEnhance(player, on)`, `SetObserve(player, on)`, `AcceptSurrender(yes)`, `Resign(graceful)`, `EndTurn()` — 41 classes (`model.commands.COMMANDS`). A new command needs a plan change (coordinator), not an M4a-owner edit.

Events: `TurnStarted`, `TurnEnded`, `Moved`, `Embarked`, `Landed`, `Sunk`, `Fortified`, `BattleStarted`, `Duel` (one exchange), `BattleEnded`, `Looted`, `MedalAwarded`, `HeroExp`, `HeroPromoted`, `HeroOffered` (pending), `HeroJoined`, `HeroDied`, `AlliesJoined`, `CityCaptured` (pending choice), `CityPillaged`, `CitySacked`, `CityRazed`, `Produced`, `ProductionStalled`, `VectorArrived`, `VectorRerouted`, `IncomeSettled`, `SiteSearched`, `GuardianFought`, `ItemFound`, `ItemDropped`, `ItemTaken`, `Blessed`, `SageOffered` (pending), `QuestAssigned`, `QuestCompleted`, `QuestFailed`, `RelationChanged`, `TreacheryPrompt` (pending), `Treachery`, `PlayerEliminated`, `NoHumansLeft`, `NoPlayersLeft`, `Victory`, `SurrenderOffered` (pending), `Resigned`, `DisbandPrompt` (pending, Disband yes/no), `TurnCue` (presentation step of the turn sequence: advice / city_screen / tutorial, rules/turn.py; surrender_declined, rules/victory.py), `Msg(group, index, args)` — 49 classes (`model.events.EVENTS`), 6 pending (`PENDING`).

### 1.3 Engine: `rules/` and `ai/`

Single entry point: `rules.engine.apply(state, cmd) -> list[Event]`; raises `IllegalCommand`. Mid-action questions (capture choice, hero offer, sage, treachery, surrender, disband) set `state.pending`; only the matching answer command is legal next. `apply` is atomic: on any exception the state is restored in place. `engine.py` (M4a) holds the complete dispatch table as `{Command: "rules.module:function"}` strings resolved lazily; an unresolved target raises `NotImplementedCommand` (an `IllegalCommand` naming the milestone), so rule milestones never edit it.

| Module | Owner | Interface | Evidence |
|---|---|---|---|
| `rules/constants/__init__.py` | M4a | `Const(value, evidence)`, `Unverified(name, row)` | — |
| `rules/constants/<module>.py` | owner of `<module>` | that module's numbers | EL addresses |
| `rules/rng.py` | M4a | `Rng(seed: int)`; `.rnd(dice, sides, add)` with the EL §2 semantics (sum of uniform 1..sides, clamp to [dice+add, dice·sides+add], `sides == 0 -> add`); `.state()` | EL §2 ovl59:02bf. Generator: Python `random.Random` (distribution-equivalent, default); a `BorlandRand` (seed·0x015A4E35+1, `(seed>>16)&0x7fff`, `trunc(r/32767.0·sides+1)`) is a drop-in alternative — X06 |
| `rules/engine.py` | M4a | `apply`, `legal` | — |
| `rules/setup.py` | M4a | `new_game(sc, cfg, armytypes, *, unused_name=None, hero_names=None, ai_setup=None) -> GameState` (`hero_names` = `rules.heroes.load_hero_names(gd, SCN 0x161)`, eight lists; the original reads the file at each name draw, ovl47:0c67, before its die, so loading it up front changes no order); `difficulty_rating(options, levels) -> int` (ovl57:0bab). `new_game` does not call `refresh_map` / `rebuild_cost_map`: the main loop does (ovl61:2183, 2194) | `scenario.md`; EL §5.5 (sites/items), §6.6 (start infamy), §6.9 (options), §9 |
| `rules/movement.py` | M4b | `stack_mode(state, group)`, `step_cost(state, group, frm, to)`, `move` (for a human side with the 0c8c:01fd tail: palette rebuild, goto clear, done + deselect on status 2; boarding / landing ends the members' moves with status 2, 0a8b:0cf2 -> 0d1a), `set_path`, `cancel_path`, `refresh_moves(state, p)`, `alloc_army(state)` (0b62:0309), `armies_at`, `type_flag`, `carried_count`, `remove_army`, `sink`, `stack_flies_07fa` (0c8c:07fa; old name `_stack_flies` kept) | EL §4.2-4.4 |
| `rules/selection.py` | M4b | `select_stack`, `select_group`, `next_stack`, `deselect`, `group` / `ungroup` / `group_all` / `ungroup_all`, `leave_group`, `defend`, `move_all`, `disband` / `confirm_disband`; shared steps `square_list`, `sort_stack`, `selection_step`, `build_palette`, `sort_palette` (ovl66:17e7(1), before the apply step of Select Army / Group All / Ungroup All), `select_army_stack` (ovl67:06eb), `adopt`, `apply_palette`, `mark_done`, `goto_selected`; turn start `fortify_marks`, `clear_turn_flags`, `group_cleanup` | 0b62, 0c8c, ovl66, ovl67 (module docstring) |
| `rules/pathfinding.py` | M4b | `cost_map`, `rebuild_cost_map(state)` (0555:0d9e for SCN 0x110), `find_path(state, src, dst, mode, mask)`, `reach_this_turn`. `find_path` reads/writes `state.path_cache` and patches / restores `state.cost_map`, so a UI preview runs on `state.copy()` | EL §4.3 (0555:08bf marks 0x7531), 0555:000a |
| `rules/visibility.py` | M4b | `reveal`, `visible`, `load_view` / `store_view` (ovl64:0d39 / 0e68); road-layer bit 0x20 = seen (`model.ids.ROAD_SEEN`). `rules.combat` imports `reveal` directly (no `HOOKS` entry) | R29 |
| `rules/mapwords.py` | M4b | `refresh_map(state)`: owner nibbles, army bits, stale fortify bits (ovl62:0000); run at the top of every main-loop pass (ovl61:2183) before `rebuild_cost_map` (ovl61:2194), and in the battle path | EL §4.1 |
| `rules/bonuses.py` | M5a | `battle_class(state, x, y)`, `side_total(...)`, `unit_strength(...)` | EL §3.3 |
| `rules/combat.py` | M5a | `attack`, `set_fight_order`; `fight_order`, `defenders_at`, `prepare(state, group, x, y) -> Setup` (writes `state.battle_work`), `fight(state, setup) -> Battle`, `resolve`, `simulate`, `odds(state, group, x, y) -> int` (advisor verdict 0..9), `relation_byte`; after-battle steps of other milestones through `HOOKS` | EL §3.1-3.5 |
| `rules/city.py` | M6a | `buy_production`, `set_production`, `deliver`, `capture(choice)`, `raze_own` | EL §6.3, §6.5 |
| `rules/vectoring.py` | M6a | `set_vector`, `advance_transit` | EL §6.4 |
| `rules/economy.py` | M6a | `income`, `upkeep`, `settle` | EL §6.3 |
| `rules/heroes.py` | M7a | commands `accept_hero`, `name_hero`, `take`, `drop`, `plant_flag`; `parse_hero_names` / `load_hero_names`, `pick_name`, `offer_check`, `human_offer`, `computer_offer`, `create_hero`, `hero_square`, `ally_type`, `place_ally`, `allies`, `pay_and_allies`, `add_exp`, `promote` / `promote_all`, `hero_died`, `items_here`, `award_medal`, `news`, `overview_rolls`; AI city choice through `HOOKS` | EL §5.2-5.3, §5.6, §5.8, §5.10 |
| `rules/ruins.py` | M7a | commands `search`, `temple_choice`, `sage_choice`; `ruin_search`, `guardian_kills`, `temple_number`, `bless`, `sage`, `sage_entries`, `show_site`, `map_view`, `site_tiles` | EL §5.4, §5.10 |
| `rules/quests.py` | M7a | `assign(state, computer)`, `check(state, words) -> (done, events)`, `after_battle` (combat hook; reads `state.battle_work`), `reward`, `apply_reward`, `item_location`, `special` | EL §5.7, §5.10 |
| `rules/turn.py` | M8a | `run(state, max_sides=None)` (main loop ovl61:2123; call once after `new_game`), `end_turn` (ovl61:2074), `pass_top` (ovl61:217d..21b6), `computer_turn` (ovl68:0000), `human_turn` (ovl68:0259), `resume(state, stage)` (ovl68:04bd; AcceptHero / NameHero call it with 1, M9a's victory / surrender buttons with 0), `next_side` (ovl61:17f6, round end), `turn_order` (ovl61:1732), `active_neutrals` (ovl39:025a), `land_in_cities` (ovl68:089d), `update_capital` (ovl36:10d7), `lift_hidden_map` (ovl64:175c), `centre_view` (ovl64:0629), `advice` / `advice_file` (ovl58:026f(5); `audio.voice.turn_advice` re-exports `advice_file`); M8b1 / M9a steps through `HOOKS`; `set_control/enhance/observe` not yet | EL §6.2 (addition M8a) |
| `rules/diplomacy.py` | M9a | commands `propose` (ovl00:0a69), `confirm_treachery` (ovl36:20a8 / 2262); `current`, `proposal`, `set_current`, `set_proposal`, `mark_proposals(state)` (ovl00:0cc7), `resolve(state, a)` (ovl00:0db3), `penalty(state)` (ovl00:1063), `treachery(state, x, y)` (ovl36:20a8; also for the AI), `rating(state) -> [(side, title)]` (ovl00:0aed) | EL §6.6 |
| `rules/victory.py` | M9a | `eliminate(state)` (ovl61:18ab), `check(state)` (ovl61:1aed), `victory_screen(state)` (ovl61:1fbd + 2004), `surrender_offer(state)` (ovl61:1f68), commands `accept_surrender` (ovl61:1e4e / 1ecd + 2046), `resign` (ovl49:1608) | EL §6.7 |
| `rules/reports.py`, `rules/history.py` | M9a | `reports.report(state, mode)` (ovl42:02fb: armies, cities, gold, winning), `reports.scores(state)` (ovl42:0947); `history.record_round(state)` (ovl41:0d60, records in `state.history`), `history.news_events(state)` (ovl41:132f), `history.record_battle(state, battle)` (combat hook: ovl36:1aff statistics, battle news), `history.stat_word(r, c, field)` | MAN p.55-59; ovl41, ovl42 |
| `rules/randmap.py` | M11 | generator | X02 |
| `ai/base.py`, `ai/cards.py`, `ai/exe_ai.py`, `ai/phases/*.py` | M8b1-M8b4 | `Controller.commands(state, p)`; `load_card(gd, level, n)`; `ExeAi`; one module per EL §6.8 phase | EL §6.8 |

### 1.4 Presentation

| Module | Owner | Responsibility |
|---|---|---|
| `__main__.py`, `app.py`, `config.py` | M1b1 | CLI (all flags of 3.2 declared here), boot, asset load, main loop |
| `ui/input.py` | M1b1 | Input state from events only: buttons from `MOUSEBUTTONDOWN/UP`, modifiers from modifier `KEYDOWN/KEYUP`; never `event.buttons`, `event.mod`, `pygame.key.get_mods()`, `pygame.mouse.get_pressed()`. Window px -> logical px. Text from `KEYDOWN.unicode` with `pygame.key.start_text_input()` called once, never stopped |
| `ui/screen.py` | M1b1 | 640x480 index framebuffer, DAC palette at present time, fades (3.1) |
| `ui/dialog.py` | M1b1 | `Dialog`, `DialogStack` (needed by `states/base.py`) |
| `states/base.py`, `states/boot.py` | M1b1 | `BaseState` (hooks `on_enter(self, frm, **kw)`, `on_exit(self, to)`, `request(name, **kw)`), `boot` |
| `assets/store.py` | M1b1 | 79-entry picture table (FILE.DAT group 3), key masks, palettes |
| `debug/probe_states.py` | M1b1 | test-only states (raise in hook, bad kwarg, game→game, backdrop) |
| `debug/**` (rest) | M1b2 | input scripts, frame capture, recording, golden compare, evidence |
| `ui/registry.py` | M2a | `action(id)` (menu item / button → callable), `dialog(id)`, `event_view(EventCls)`, `event_sound(EventCls)`, `right_click(kind)`, `help_selector(range)`, `button_decor(id)`; `MENU` names the 39 menu action ids of the EXE table DS:1798 (shortcut keys from that table, `ui.menubar`); the keys rules.md §9.7 lists outside the menus are not declared (their dispatch is not traced); unregistered actions draw greyed |
| `assets/fonts.py`, `assets/text.py`, `assets/cursors.py` | M2a | fonts, `S(group, index, *args)`, 12 `STAND.PCK` cursors |
| `ui/widgets.py`, `ui/layout.py`, `ui/menubar.py`, `ui/gfxpage.py` | M2a | widgets, `JOIN/AREA/BUTTON.DAT`, menu bar, `.GFX` renderer |
| `assets/sprites.py`, `ui/mapview.py`, `ui/minimap.py` | M3 | id → sheet cell (G1), playing map, overview map |
| `states/game.py`, `states/phases/__init__.py`, `states/phases/building.py` | M3 | game host and phase machine; phase names `building turn_start human computer animating over` declared, each phase a module that returns the next phase |
| `ui/palettes.py`, `ui/game_menus.py`, `ui/animate.py`, `ui/anim/move.py`, `states/phases/human.py` | M4c | info/stack/action palettes, in-game menu refresh (ovl61:0519), event animator (dispatch via `event_view`), human phase; map left clicks of later milestones via `registry.left_click` (city, site, advisor) |
| `ui/dialogs/*.py`, `ui/info/*.py`, `ui/anim/*.py` | per milestone (section 4) | one file per dialog / right-click panel / animation |
| `ui/tutorial.py` | M8a | tutorial pop-up triggers (X09) |
| `states/menu.py`, `states/setup.py` | M2b | Game Start screen, Game Setup screen |
| `states/intro.py` | M2c | START.EXE intro and credits pages |
| `states/phases/turn_start.py` | M8a | |
| `states/phases/computer.py` | M8b1 | incl. Alt/Shift interrupt → Settings |
| `states/phases/over.py` | M9b | end-of-game states |
| `persist/saves.py`, `persist/userdir.py` | M10b / M1b1 | slot list and save files in `--user-dir`; user-dir paths |
| `audio/mixer.py`, `audio/voice.py`, `audio/effects.py`, `audio/settings.py` | M10a | 8SN playback, speech + captions, effect triggers, music/sound/speech flags |
| `audio/music.py`, `audio/music_render.py`, `audio/music_triggers.py` | M10c | WAV playback from cache, renderer, mode → trigger table |

### 1.5 Library roles

| Library | Used for | Not used for |
|---|---|---|
| `pgsm` 0.0.2 | the five top-level states and their transitions (section 2) | dialogs (in-state stack) |
| `pygame-screen-record` 0.1.2 | `Recording` + `save` for MP4 demos; `ScreenRecorder` not used (its wall-clock thread tears frames, 3.4) | `EventRegister`: not used at all (user decision 2026-10-14) |

### 1.6 Data file → consumer

| File(s) | Consumer | Notes |
|---|---|---|
| `WARLORD2.EXE` | `formats.gamedir.verify` (sha256); evidence | never executed |
| `START.EXE` | evidence for M2c (intro), G3 (fonts) | never executed; launch chain X16 |
| `START.BAT`, `READ.ME` | evidence | |
| `STANDARD.PAL`, `BLACK.PAL`, `TERRAIN0/WAR2.PAL` | `ui/screen` (M1b1), fades | |
| `STAND.PCK` | `assets/cursors` (M2a) | G4 |
| `TEXT/CHANCE17/CHANCE36 .FIN/.FNT` | `assets/fonts` (M2a) | |
| `DATA/STRING.DAT`, `FILE.DAT` | `assets/text`, `assets/store` | |
| `DATA/ERROR.DAT` | `app` boot: the three "cannot open" messages printed to stderr when a file is missing | console only, never on screen |
| `DATA/AREA.DAT`, `BUTTON.DAT`, `JOIN.DAT` | `ui/layout` (M2a) | G5 |
| `HELP/WARLORD2.HLP` | `ui/dialogs/popup_help` (M2a) | |
| `HELP/HITEM.GFX`, `HKEYS.GFX`, `HMOUSE.GFX` | `ui/dialogs/help_page` (M2a) | |
| `TUTORIA/T*.GFX` (11) | `ui/dialogs/tutorial_page` (M2a) rendering, `ui/tutorial` (M8a) triggers | X09 |
| `START/*.GFX` (7 credits pages), `START/*.PCK`, `LOGO.PAL`, `SCREEN0.PAL`, `DING0.SND`, `START/?ANIM.XMI` | `states/intro` (M2c), music cache (M10c) | X04 |
| `DATA/SCENARIO.DAT`, `<scn>/PICS/SCENARIO.PCK` | `scenario_select`, `states/menu` (M2b) | RANDOM has neither (C8 rule in M2b) |
| `<scn>/*.SCN .MAP .RD .SGN .ITM .CTY .SPC` | `formats.scenario.load_scenario` → `rules/setup` (M4a); `.CTY` → `city_info` (M6b), `.SPC` → `ruins` (M7b), `.SGN` → `info/sign` (M4c), `.ITM` → setup | |
| `DATA/OPTIONS.DAT` | `states/setup` (M2b): initial "Recall Options" values, read once | ours written to user dir |
| `DATA/OPTIONS.SND` | `audio/settings` (M10a): initial music/sound/speech flags | ours written to user dir |
| `DATA/QUOTES.DAT` | M2b, place of display per ovl57:0f88 (R14 row covers reading the caller) | |
| `DATA/TERRAIN.DAT` | `ui/dialogs/random_map` (M11) terrain-set label; set count 1 → `TERRAIN0` fixed | |
| `DATA/SAVEINFO.DAT`, `DATA/MAPINFO.DAT`, `SAVE/*`, `CURRENT.HST`, `CURRENT.SGN` | deliberately unused: own save/map/history format (X12); `parse_saved_map`/`parse_hst` stay for `tools/dump_scenario.py` | MAPINFO slot count is E2/X18 |
| `RANDOM/*` | `--scenario RANDOM` (M2b rule), `rules/randmap` (M11: `RANDOM.DAT`) | |
| `TERRAIN0/ARMYTYPE.DAT`, `ARMYTYP2.DAT` | `rules/setup` via `NewGameConfig.army_set` (`--alt-names`) | |
| `TERRAIN0/HERONAM0-7.DAT` | `rules/heroes` | EL §5.2 |
| `TERRAIN0/MAPCOLOR.DAT` | `ui/minimap` (M3) | T3 |
| `TERRAIN0/A0-A8, SCENERY0/1, ROAD, SHIELDS, BSHIELD, ATRANS2` | `assets/sprites` (M3, M4c) | G1, G2 |
| `TERRAIN0/ASHADOW.PCK` | `assets/sprites` if G3a resolves its use; else deliberately unused | G3 |
| `TERRAIN0/MOVEBAR0-7.PCK` | computer-turn progress bar ovl61:131b (ovl68:0000, ovl25): M8b, not M4c (graphics.md) | G2 |
| `TERRAIN0/CITYBACK.PCK` | `ui/dialogs/production`/`city_info` (M6b) | G2 |
| `PICS/STARTUP0-3, STARTBU, MARBLE, SCROLL, BSCROLL, SSG` | M1b1 probe backdrop, M2a dialogs/progress, M2b menu | |
| `PICS/SCREEN0-3, STRAT, HIDDEN, CURS` | M3 frame, minimap canvas, fog, selection box | |
| `PICS/BUTTON, MENUBUTT, DBUTTON, POPUP*, HELPGFX` | M2a widgets/popups/help | |
| `PICS/ABITS, SPECBITS` | M4c palettes; M6b skyline strips | G2 |
| `PICS/WAR, FORDER, STACK, ADVISOR, BIGARMY` | M5b fight, fight order, stack, advisor; `BIGARMY` in the battle display if its caller confirms (G2), else M5b records it unused | |
| `PICS/CITY, CITYBU` | M6b | |
| `PICS/MHERO, FHERO, LEVEL2-4, MEDAL0-3, TEMPLE, SEARCH` | M7b | |
| `PICS/DIPLOM, RESIGN*, VICTORY` | M9b | |
| `PICS/NEWSCEN, NEWSCNBU, SETUPBU` | M2b | |
| `PICS/VOICE, VOICEBIT` | `ui/dialogs/voice_face` (M2b draw, M10a speech sync) | gated on X19 |
| `PICS/RMAPBAR` | M11 | |
| `SOUND/*.8SN`, `SOUND/*.TXT` | M10a | |
| `SOUND/[SMR]*.XMI`, `MIDPAK.AD` | M10c renderer → `out/music/` | default `S` (FM) set; `--music-variant gm` uses `R` |
| `UDB/UDB.DAT`, `UDB/UDB.CUR` | `ui/dialogs/shortcuts` (M9b), `ui/palettes` shortcut bar (M4c reads the user-dir copy, initialised from `UDB.CUR`) | |
| `CARDS/*.CRD`, `*.DSC` | `ai/cards` (M8b1), `setup_side` list (M2b) | |
| `SOUND.DAT`, `SWAP.DAT`, `VER102.DAT`, `WAR2.INI`, `*.COM`, `*.ADV`, `MIDPAK.COM`, `IBMBAK.COM` | deliberately unused: DOS driver configuration and drivers | |
| `INSTALL.EXE`, `IMPORT.EXE`, `PATCH.EXE` | deliberately unused: DOS tools; IMPORT has no counterpart (saves are own format) | |
| `content.xml`, `Warlords II (1993).ba1` | deliberately unused: distribution packaging, not read by either executable | |

## 2. State graph

### 2.1 pgsm facts (verified in `StateManager.py`, pgsm 0.0.2) and the design answer

| Fact | Line | Design answer |
|---|---|---|
| `on_init`, `on_enter`, `on_exit` run on a new `Thread` | 157-164, 169-179 | Hooks only assign plain fields. No surface, mixer or file access there. All assets and tables load synchronously in `App.__init__` before `StateManager(...)`. `on_init` is empty everywhere. |
| While `loading[state]` is true, `update`/`draw` go to the loading state | 118-134 | `loading_state=NoLoading()` (no-op). After each `manager.update(...)` the loop joins `list(manager.threads.values())` (sound: the list is copied before threads delete themselves). |
| Default `LoadingState()` is built when `loading_state` is falsy; it needs a display and `SysFont` | 56-61, 76 | `NoLoading` is a plain truthy object built without pygame. Its `update(dt, state)` takes the arguments in that order (line 122). |
| An exception in a hook (or a bad kwarg to `on_enter`) kills the thread before `loading[new] = False` | 169-176 | `threading.excepthook` is replaced in `App` to store the exception; after each join the loop raises it, and otherwise asserts `not manager.loading[current]` ("transition never completed"). Hooks are declared `on_enter(self, frm, **kw)` / `on_exit(self, to)` (line 170 passes `new_state` positionally, line 174 `frm=` by keyword). |
| The start state gets `on_init` only, never `on_enter` | 93-99, 154-164 | Start state is always `boot`, whose first `update` requests the target. |
| `update()` defaults `dt` to `time.get_ticks()` and events to `pygame.event.get()` | 116-117 | The loop always passes `events` and `dt`. |
| `exit(name, **kw)` = `set_state`; `""` reserved; one-state managers self-start | 74, 81, 85-87, 146-152 | States `boot intro menu setup game`. `BaseState.request(name, **kw)` records one transition (a second request in a frame raises); `BaseState.update` performs it as its last statement, so `exit()` only ever runs on the main thread inside `update`. Dialog callbacks and hooks call `request`, never `exit`. |
| A newly entered state is drawn once before its first `update` | 118-134 + loop order | `on_enter` must leave the state drawable (fields set, no lazy init in `update`). |
| Same-object transitions run `on_exit`/`on_enter` on one object | 165-179 | `game -> game` is used for Load Game (Alt+L) during play. |

### 2.2 States and transitions

```
boot --> intro --> menu <--> setup --> game
  \________________^  \_________________^   (load game / direct start)
                      game --> menu         (Game > New Game)
                      game --> game         (Game > Load Game)
```

| From | To | Call | Evidence |
|---|---|---|---|
| `boot` | `intro` | unless `--no-intro`, or when `states/intro.py` is absent (M2c not done) | README (`n` switch, X16) |
| `boot` | `menu` / `game` | `request("game", new_game=NewGameConfig(...))` with `--scenario`; else `menu` | harness |
| `intro` | `menu` | end or key | MAN p.10; X04 |
| `menu` | `setup` | `request("setup", scenario=dir, random_map=None \| RandomMapParams)` | MAN p.14-15; SHOT 00, 09 |
| `menu` | `game` | `request("game", load_slot=n)` | MAN p.53 |
| `setup` | `game` / `menu` | `new_game=NewGameConfig(...)` / Main Menu | MAN p.15-17; SHOT 09 |
| `game` | `menu` / `game` / quit | New Game / Load Game / post `pygame.QUIT` | MAN p.53 |

`states/game.py` holds a `Session` (engine state, command log, seed) and runs the phase machine (`building`, `turn_start`, `human`, `computer`, `animating`, `over`), one module per phase. The progress scroll (SHOT 03-07) is `ui/dialogs/progress.py` (M2a) fed by a generator on the main thread, never pgsm's loading state. Per X03 (closed) the strategic map is built during the scenario load, before the setup screen (`states.setup.load_scroll`); `building` then only starts the engine game, except with `--scenario`, where it runs the same load first.

### 2.3 Modal dialogs: an in-state dialog stack

Every pgsm state derives from `BaseState`, which owns a `DialogStack`. Dialogs are not pgsm states: they sit over the visible map/menu, nest and return a value (`on_close(result)` issues the answering command), and scripts address "top dialog" independent of threads. Input goes to the top dialog only; the state draws itself, then the stack bottom-up. Menu-bar enablement is recomputed from state + stack + registry (SHOT evidence: all titles black on the start screen, only "Game" elsewhere before play).

| Host | Dialog files (owner) |
|---|---|
| any | `message`, `confirm`, `progress`, `help_page`, `popup_help`, `tutorial_page` (M2a) |
| `menu` | `scenario_select`, `voice_face` (M2b); `save_load` in load mode (M10b); `random_map` (M11) |
| `setup` | `options`, `setup_side` (M2b) |
| `game` | `info/army`, `info/terrain`, `info/sign`, `info/tower`, `info/minimap` (M4c); `fight`, `capture`, `fight_order`, `stack`, `army_bonus`, `advisor` (M5b); `production` (tabs: production, city info, build, vectoring), `city_info`, `cities`, `info/city`, `raze_confirm`, `rename_city` (M6b); `hero_offer`, `hero_name`, `hero_inspect`, `hero_levels`, `level_up`, `medal`, `search_result`, `sage`, `temple`, `quest`, `ruins`, `items`, `info/site` (M7b); `turn_start`, `settings` (M8a); `reports` (army, city, gold, production, winning, quest), `history` (city, events, gold, winners, triumphs), `diplomacy_report`, `diplomacy_action`, `treachery_confirm`, `resign`, `surrender`, `victory`, `about`, `shortcuts`, `signpost` (M9b); `save_load` (M10b); `map_slots` (M11) |

## 3. Debug and record harness

User decision 2026-10-14: frame captures and screen recordings are the means to show demos and check UI. No `EventRegister`, no event capture/replay.

### 3.1 Main loop

```
events = input_script.events(frame) if --script else pygame.event.get()
app.input.feed(events)            # logical px, button/modifier state (ui/input.py)
manager.update(events, dt)        # dt = 1000 / tick_hz when --script or --headless
join list(manager.threads.values()); raise stored hook exception; assert transition completed
manager.draw(screen.fb)
screen.present()                  # fb indices -> LUT -> present_surface (32-bit) -> window
capture.after_frame(frame)        # PNG shots at requested frames; recording.add_frame(copy)
```

Before the first frame the loop joins once after `manager.start("boot")`.

`Screen.fb` is an 8-bit surface of colour indices under a fixed identity palette, shared by every sprite surface; 8-bit to 8-bit blits keep indices and colour keys (X13 verified). `fb.set_palette` is never called after creation (it would remap later blits). The DAC palette (`STANDARD.PAL`, intro palettes, fade steps toward `BLACK.PAL`) is applied in `present()` as a numpy LUT over `pygame.surfarray.pixels2d(fb)` written into the 32-bit `present_surface` with `surfarray.blit_array`. Captures and recordings read `present_surface`.

### 3.2 CLI (all flags declared in `config.py` by M1b1)

| Flag | Meaning |
|---|---|
| `--data DIR` | Game directory (default `original/game/Warlrd2`, env `WL2_DATA`), read-only; aborts if `WARLORD2.EXE` is missing, reports a hash mismatch. |
| `--user-dir DIR` | Options, sound settings, shortcuts, saves, map slots (default `out/user/`). |
| `--scenario NAME` | Skip menus: `TUTORIA DRAGON SORCERY ERYTHEA HADESHA ISLADIA RANDOM`; with `--controls HHCC....`, `--levels`, `--options WORDS`. |
| `--seed N` | Engine seed (int). Default: a random int, printed and written to the evidence manifest. |
| `--script FILE` | Frame-indexed input script (3.3); implies fixed `dt`. |
| `--shot-at F[,F...]` | PNG of `present_surface` at those logical frames to `out/shots/<run>/frame_<F>.png`. |
| `--record FILE.mp4` | Record every frame (or every `tick_hz/record_fps`-th) to MP4. `--record-fps` default = `--tick-hz`. |
| `--scale N`, `--headless`, `--tick-hz N` | Window scale (default 2); dummy SDL video/audio, no vsync; logical tick rate (default 60; X05). |
| `--no-intro` | Skip the intro (our counterpart of the `n` switch). |
| `--alt-names` | `ARMYTYP2.DAT` names (the `s` switch, `tables.md` §1). |
| `--no-voice` | No talking advisor (the `v` switch, `tables.md` §9 `DS:26c8`). |
| `--music on\|off`, `--music-variant opl\|gm`, `--music-cache DIR` | Music (default on, `opl`, `out/music/`). |
| `--allow-unverified`, `--state-hash-at F` | Permit `Unverified` constants with a logged warning each; print the engine state hash. |

### 3.3 Scripted runs, captures, recordings

`python -m warlords2.debug.run tests/scripts/<name>.json --evidence out/evidence/<milestone>/<name>/`

A script is a list of `[frame, step]` in logical frames and logical pixels. Steps: `key`, `keyup`, `click`, `rclick`, `move`, `drag`, `press_button` (`BUTTON.DAT` id), `wait_dialog` (registry dialog id, option `frames`, default 60: the top dialog was opened as that id by `registry.open_dialog` at the step's frame or within `frames` frames after it; absolute frames of later steps do not move when it is met early), `shot`, `assert_state` (pgsm state, phase, top dialog), `assert_hash` (engine state), `golden` (reference capture + regions). `debug/script.py` turns each step into `pygame.event.Event`s posted into the app's own queue (`pygame.event.post`) before that frame's `pygame.event.get()`. Scripts are tracked and hold coordinates and ids only.

Each run writes `frames/*.png` (every `shot`), `run.mp4`, and `manifest.json` (git commit, EXE hash, seed, script hash, per-shot SHA-256 of `present_surface` bytes, final engine state hash, list of video segments). Reviewers look at this directory; they do not rerun the implementer's session.

Recording (`debug/recorder.py`): one `pygame_screen_record.Recording(fps, (640, 480), 0)` per segment; every captured frame is appended as `present_surface.copy()` on the main thread; segments of 100 frames (about 123 MB in memory at 1.2 MB per frame) are saved as `run_<k>.mp4` and listed in the manifest (no ffmpeg join). Saving calls `add_codec("mp4", "mp4v")` once and `rec.save(<absolute path>)` directly; afterwards the file is opened with `cv2.VideoCapture` and its frame count checked, because a failed writer is silent (3.4).

### 3.4 Library caveats (installed copies in `.venv/lib/python3.12/site-packages/`; for upstream fixes by the user)

| Id | Library file:line | Bug | Workaround here |
|---|---|---|---|
| S1 | `StateManager.py:169-176` | exception in `on_exit`/`on_init`/`on_enter` (incl. an unexpected kwarg, or a kwarg named `frm`) ends the thread before `loading[new] = False`: frozen blank screen with `NoLoading`, no traceback | `threading.excepthook` capture + post-join assert (2.1); acceptance M1b1 |
| S9a | `StateManager.py:76` | default `LoadingState()` needs a display and `SysFont` | pass `NoLoading()` |
| S9b | `StateManager.py:122` | loading state called as `update(dt, state)`, unlike states' `(events, dt)` | `NoLoading.update(dt, state)` |
| S9c | `StateManager.py:116-117` | `dt` defaults to absolute `get_ticks()`, not a delta | always pass `dt` |
| S9d | `StateManager.py:146-179` | `set_state` from a non-main thread or twice per frame races `on_exit`/`on_enter` | `BaseState.request` (2.1) |
| S2 | `EventRegister.py:297, 299-300` | `save()` with no events: `IndexError`; without trailing QUIT appends a tuple then indexes/astuples it: `TypeError` | not applicable — `EventRegister` not used |
| S3 | `EventRegister.py:128-130, 156, 252-256` | replay decompress overwrites `buttons`/`mod` with defaults; `key_pressed` indexed by `key - mod` | not applicable |
| S4 | `EventRegister.py:199, 228, 235` | timestamps and replay are wall-clock | not applicable |
| S5 | `EventRegister.py:275, 277` | auto seed is a float; replay `seed(N)` overrides the recorded seed | not applicable |
| S9e | `EventRegister.py:207-214` | replay constructor reads `pg.key.get_pressed()` (needs a display) and monkey-patches getters until `save()` | not applicable |
| S6 | `ScreenRecorder.py:105-110, 246-249` | `Recording.add_frame` with compress 0 stores the same `Surface` object: N references to the last frame | append `present_surface.copy()` |
| S6b | `ScreenRecorder.py:153-164` | `RecordingThread` copies the surface while the main thread draws (tearing); `pg.error` silently ends it | `ScreenRecorder` not used; frames added on the main thread |
| S7 | `ScreenRecorder.py:445, 470-476` | `mp4` maps to `h264`, which pip OpenCV cannot encode; `cv2.VideoWriter.isOpened()` never checked, so the file is silently empty | `add_codec("mp4", "mp4v")`; read-back frame-count check |
| S7b | `ScreenRecorder.py:562-576` | `RecordingSaver` does `os.chdir` inside a worker thread and names files `recording_N` | call `Recording.save(abs_path)` directly |

### 3.5 Golden-frame comparison

`debug/golden.py compare(png_or_surface, ref_jpg, regions) -> dict` crops the 4-px border of the 648x488 captures and reports mean absolute error per region (flat art about 0.2-2, keyed borders up to about 6 because of JPEG; `graphics.md` §6).

| Capture | Shows | Used by |
|---|---|---|
| `screenshot_00`, `_02` | Game Start screen | M1b2 (backdrop probe), M2b |
| `screenshot_01`, `msdos_Warlords_II_1993.gif` | helmet over the main menu | M2b, only if X19 closes |
| `screenshot_03`-`_07` | progress scroll at 0/10/30/50/70 % | M2a (scroll), M2b (sequence) |
| `screenshot_08` | empty game frame | M3 |
| `screenshot_09` | Game Setup screen | M2b |

No capture shows the intro, a map with content, an in-game dialog or a battle. For those: decoded-asset placement from `AREA/BUTTON.DAT` and EXE draw code, manual figures by page, and independent review of the captured frames and recordings.

## 4. Milestones

One implementer agent and one independent reviewer agent per row. An implementer edits only the files in its row (plus new test files `tests/engine/test_<its modules>.py` and `tests/scripts/<id>_*.json`). Register rows and this plan are edited by the coordinator only; implementers report closures in their manifest.

Common acceptance for every row: `pytest` green incl. `test_architecture.py` and `test_traceability.py`; reviewer sign-off (6.3). Rows owning presentation files also deliver an evidence directory (captured frames, recording, manifest) produced by `debug.run`; engine-only rows deliver the pytest log and a manifest of the state hashes their tests produce. A row that uses an `Unverified` constant cannot be accepted until its register row closes or the user decides.

| ID | Scope | Owns (exclusive) | Needs | Blocked by rows | Acceptance (behavioural) |
|---|---|---|---|---|---|
| M1a | **DONE**: decoders, `GameDir`, tools as CLIs | `warlords2/formats/{gamedir,pal,pck,font,gfxscript,scenario,tables,sound}.py`, `tools/dump_*.py`, `tests/test_formats_*.py`, `tests/test_architecture.py`, `pyproject.toml` | — | — | 308 tests pass |
| M1c | M1a follow-up: game text out of `tests/test_formats_tables.py` (lines 81-90, 151-153, 164, 190, 212, 219-223 → SHA-256/lengths/counts); drop `tables.parse_scenario`, point `dump_tables.py` and its test at `scenario.parse_scenario_dat`; `tests/conftest.py` with `gamedata` marker (fail, not skip, without data unless `WL2_NO_DATA=1`; replaces the per-file skip at line 18); `tests/test_traceability.py`; doc follow-ups of section 0 | `tests/test_formats_tables.py`, `formats/tables.py`, `tools/dump_tables.py`, `tests/conftest.py`, `tests/test_traceability.py`, `docs/formats/{tables,scenario}.md` (follow-up lines only) | M1a | — | traceability test fails on a planted STRING/HLP literal > 12 chars in a temp file (field-name keys of `tables.py` allow-listed) and on an `Unverified` naming a missing row; no test file contains a STRING/HLP entry |
| M1b1 | Loop, `Screen`, input, pgsm integration, boot, config, assets store, probe states | `__main__.py`, `app.py`, `config.py`, `ui/input.py`, `ui/screen.py`, `ui/dialog.py`, `states/base.py`, `states/boot.py`, `assets/store.py`, `persist/userdir.py`, `debug/probe_states.py`, `tests/test_loop.py`, `requirements.txt` | M1a | — | `python -m warlords2 --headless --script` runs; probe states: exception in `on_enter`, bad kwarg, and kwarg named `frm` each fail the run with the original traceback within one frame; `game -> game` probe runs `on_exit` then `on_enter`; two `request`s in one frame raise; all 16 indices survive a sprite→`fb` blit and present with `STANDARD.PAL` colours; a fade never changes `fb` bytes; Alt held + drag gives the right button/modifier state in `ui/input` |
| M1b2 | Input scripts, captures, recorder, golden compare, evidence | `debug/{run,script,capture,recorder,golden,evidence}.py`, `tests/test_harness.py`, `tests/test_golden.py`, `tests/test_scripts.py`, `tests/scripts/m1_*` | M1b1 | — | backdrop probe (STARTUP0-3 quadrants) within golden tolerance of SHOT 00 regions; recorded frame k equals shot k: in-memory `Recording` frame SHA-256 = PNG SHA-256, and the decoded MP4 has the same frame count with decoded frame k nearest (highest PSNR) to PNG k among all captured PNGs (mp4v 4:2:0 chroma caps PSNR on 16-colour art, so identity is proven by SHA-256 on the in-memory frames); recording with N frames holds N distinct surfaces; `test_scripts.py` runs every `tests/scripts/*.json` headless and checks its `assert_*` steps |
| M2a | Fonts, text, cursors, widgets, layout, menu bar, GFX pages, registry, common dialogs | `assets/{fonts,text,cursors}.py`, `ui/{widgets,layout,menubar,gfxpage,registry}.py`, `ui/dialogs/__init__.py`, `ui/dialogs/{message,confirm,progress,help_page,popup_help,tutorial_page}.py` | M1b1 | G3, G4, G5 | menu-bar title positions and black/grey state golden vs SHOT 00 and SHOT 09; progress scroll at 0/10/30/50/70 % golden vs SHOT 03-07 in the BSCROLL region only ((160,55), 336x347, `graphics.md` §6) plus the menu bar — the frame behind it is M3's; `HMOUSE/HKEYS/HITEM.GFX` render with every `#G` rect inside its picture; right-click on button id 100 opens the HLP record with id 100 (text hash matches); unregistered menu actions are greyed and inert |
| M2b | Game Start and Setup screens | `states/{menu,setup}.py`, `ui/dialogs/{scenario_select,options,setup_side,voice_face}.py` | M2a, M4a | R14b (closed), X03 (closed), X19 (closed) | golden vs SHOT 00/02 and 09; script menu → scenario → setup → Begin yields `NewGameConfig` whose option words equal `OPTIONS.DAT`; the displayed Difficulty Rating is `rules.setup.difficulty_rating` (M4a tests the ovl57:0bab formula for 10 option/level combinations); scenario list = 6 SCENARIO.DAT records; `--scenario RANDOM` rule: loads `RANDOM/`, counts from SCN 0x157B / 0x80F / 0x137, title from STRING (0,0); Load Game and Random Map buttons inert until their actions register |
| M2c | Intro and credits (optional) | `states/intro.py` | M2a | X04, X16 | sequence per START.EXE trace; key skips to menu; credits pages render `START/*.GFX`. Without X04: not started; boot skips the intro |
| M3 | Game frame, map, minimap, sprites, game host + phase machine, building phase | `assets/sprites.py`, `ui/{mapview,minimap}.py`, `states/game.py`, `states/phases/{__init__,building}.py` | M2a, M4a | G1, G6, S3, T3 | empty frame golden vs SHOT 08; all 7 maps draw with zero unmapped tile/road codes; city at (x, y) draws tiles t, t+1, t+16, t+17 (`scenario.md`); fortified squares (bit 0x2000) draw the tower; minimap 224x312 at 2 px per tile; reviewer compares frames to `out/scenario/*_map.png` |
| M4a | Model (closed lists), new game, serialise, engine dispatch, RNG, constants base | `model/**`, `rules/{engine,setup,rng}.py`, `rules/constants/{__init__,setup}.py`, `tests/engine/{test_setup,test_rng,test_serialize,test_determinism}.py` | M1a | X17, R28 | 7 scenarios x option matrix build; capital = city at player-record coords (EL §5.1); item scatter: count = min(22, sites/3 + rnd(1,5,-3) + 8) and site kinds drawn from the DS:0c9a tables (EL §5.5 ovl35:0000) — 10^4 seeds, chi-square against the table weights; start infamy 1..8 (ovl53:0271); `difficulty_rating` = ovl57:0bab formula for 10 option/level combinations; `rnd` clamp and `sides == 0` cases; `BorlandRand` reproduces `rand()` for seed 1 (first values computed from the LCG in the test); dump/load round-trip keeps the hash; same seed + command list = same hash |
| M4b | Movement, stack mode, pathfinding, visibility | `rules/{movement,pathfinding,visibility}.py`, `rules/constants/movement.py` | M4a | R11, R18, R29, X20, X21 | cost table = DS:1274 values (EL §4.1); a stack with one w17 member pays 2 in Forest, with w18 2 in Hills, Marsh always 5 (0555:19e4); flying pays 1 on road/bridge/city else 2; land path ends at a water/land step without crossing flag; refresh: carry ≤ 2, aboard → 20 + carry, cap 99, double-move item adds allowance (ovl68:05fb); path cost = sum of step costs on all 7 maps; 8-army limit |
| M4c | Map interaction, palettes, animator, map right-click panels | `ui/{palettes,animate}.py`, `ui/anim/move.py`, `states/phases/human.py`, `ui/game_menus.py`, `ui/info/{army,terrain,sign,tower,minimap,frame}.py` | M3, M4b | G2, X05 | script selects the tutorial hero, sets a path, moves, regroups, cancels path, Quit & Next, Defend; the menu bar is refreshed by ovl61:0519 after every order (titles enabled in play); right-click on army/terrain/sign/tower/minimap/map frame opens the panel (terrain label from STRING group 128, "Road" when the road layer is set — ovl46:0000); stack-palette HLP selectors 37-44 registered; frames reviewed against MAN fig 6.3, 7.1 |
| M5a | Bonuses and combat | `rules/{bonuses,combat}.py`, `rules/constants/combat.py` | M4a | T2b, X22, X23 (closed) | die 20 / 24 with Intense Combat (ovl36:0927/092c); 2 hits per unit, carried across duels (ovl38:06ed); HEROTAB 0,0,0,0,1,1,1,2,2,3; highest stack bonus only; cap SCN 0x112 includes city bonus, enemy modifier after the cap; w15 1/2/3 cancel cases; aboard on water/shore = 4; unit cap 15; flyer +80 shift on types 2/3/6 with a hero; tutorial hero immunity (SCN 0x12E); attack cost max(2, tile cost), stack moved onto target first; per-exchange win rate over 10^5 seeded duels equals sa/die·(1−sb/die) normalised (EL §3.4), plus each fixed case above as exact unit tests |
| M5b | Battle display, capture, fight order, stack, army bonus, advisor | `ui/dialogs/{fight,capture,fight_order,stack,army_bonus,advisor}.py`, `ui/anim/battle.py` | M4c, M5a | G2, X05, R27b (advisor text) | scripted battle with fixed seed: displayed duel order equals the engine's `Duel` events; capture dialog disables pillage/sack when value 0 (ovl31:0000); advisor shows `combat.odds` for Shift+sword target; combat-order HLP selectors 45-71 registered |
| M6a | Production, buying, vectoring, economy, capture outcomes | `rules/{city,vectoring,economy}.py`, `rules/constants/city.py` | M4a | X17 | income = Σ city +0x2a + cities·Σ type-7 item values (ovl62:0372); upkeep = Σ cost/2, aboard min 4 (ovl62:02bf, ovl43:0dd7); gold clamps at 0 (ovl68:0827); delivery only with gold > 0, stalls otherwise (ovl43:0000); defence byte 1/2 by filled slots after buy (ovl44:0930); Enhanced +2 cap 9 on produced units; vector refused for the fifth source (ovl44:0410); arrival two turns later, reroute home, delete; pillage = last slot |buy|/2, sack = all but first, raze cancels incoming vectors; infamy rolls per EL §6.5; loot = gold/cities/2 (ovl36:0dd0) |
| M6b | Production screen, city info, View→Cities, raze/rename | `ui/dialogs/{production,city_info,cities,raze_confirm,rename_city}.py`, `ui/info/city.py` | M4c, M6a | G2 | script buys and sets production, vectors two cities, renames and razes one; only types with w4 ≥ 0 offered; HLP selectors 1-24 registered; reviewed vs MAN p.39-42 |
| M7a | Heroes, levels, items, ruins, sages, temples, quests, medals | `rules/{heroes,ruins,quests}.py`, `rules/constants/heroes.py` | M5a, M6a | X08, X24, X25, X26, X27 | turn-1 free hero at capital, strength 5, moves 14, starting item p (ovl47:031b); offer chance 6/30, prices 301-700 / 1001-1600, cap 5 (6 above 39 cities), allies 69/25/6 % of w13 types (ovl47:0000, 01fc); thresholds 15/30/60, one level per turn, +1 str (cap 9) +2 move (ovl47:0579/0672); exp awards table EL §5.3; ruin survival (90 + 3S + 5(H+B−M))/100 (ovl34:07ad); gold 503-2000 / 1003-4000; temple flags #1-#4 (ovl34:08a1); sage options (ovl34:0aa0); quest type table and rewards (ovl01:0d7a, 1909); medal chance max(12, 40 − 5m) (ovl36:2274). Each as distribution or exact test |
| M7b | Hero and site dialogs | `ui/dialogs/{hero_offer,hero_name,hero_inspect,hero_levels,level_up,medal,search_result,sage,temple,quest,ruins,items}.py`, `ui/info/site.py` | M4c, M7a | G2 | scripted ruin search, temple visit, sage, hero offer accept/decline, turn-1 hero naming; female heroes use STRING 97 idx 8-15 and group 100 titles |
| M8a | Turn loop, start-of-turn sequence, encampment, settings, tutorial pop-ups | `rules/turn.py`, `rules/constants/turn.py`, `states/phases/turn_start.py`, `ui/dialogs/{turn_start,settings}.py`, `ui/tutorial.py` | M4c, M5a, M6a, M7a | X09, X28 | human order: diplomacy, recount, group cleanup, refresh, fortify, income, production, hero (EL §6.2 ovl68:0259/04bd); computer order as EL §6.2 list; side without cities skipped; fortify bit set per ovl67:0000; Settings toggles control/enhance/observe and music/sound/voice; two-human tutorial game runs 20 turns from a script, hash equal across two runs, and the event sequence of turn 2 matches the EL §6.2 order |
| M8b1 | AI frame: cards, phase order, traced decisions, computer phase | `ai/{base,cards,exe_ai}.py`, `ai/phases/__init__.py`, `states/phases/computer.py` | M8a | T5 | card unpacking per EL §6.8 table (ovl21:0d7b) incl. fight order into SCN 0x60B; phases run in the ovl25:0000 order; accepts every hero offer (ovl47:0301); hero city by ovl25:0919 scoring; capture choice per ovl19:1864 branches; quest pick 80/20 then 3 then 6 (ovl01:0d7a); Alt/Shift held during computer turns opens Settings (rules.md §9.7); untraced phases are no-ops that log |
| M8b2 | AI economy phases: production, vectoring, rebuilding, clean city | `ai/phases/{production,vectoring,rebuilding,clean_city}.py` | M8b1 | X01b | each decision cites its address; no heuristic without a user decision recorded in X01b |
| M8b3 | AI movement phases: hero, search, explore, move #1/#2, neutral, rescue, last rescue, update hide | `ai/phases/{hero,search,explore,move,neutral,rescue,hide}.py` | M8b1 | X01c | as M8b2 |
| M8b4 | AI combat and diplomacy phases: assault, assault XX, quick attack, evaluate, specials, diplomacy | `ai/phases/{assault,quick_attack,evaluate,specials,diplomacy}.py` | M8b1, M9a | X01d | as M8b2 |
| M9a | Diplomacy, victory, surrender, resign, reports, history | `rules/{diplomacy,victory,reports,history}.py`, `rules/constants/diplomacy.py` | M8a | R10b, X10b, X29, R12 | resolution table of ovl00:0db3 (escalate at once, de-escalate only if the other agrees) incl. refused-de-escalation infamy; treachery infamy 101-200 / 11-25 (ovl36:20a8); elimination at 0 cities whatever the armies (ovl61:18ab); end states of ovl61:1aed: no side alive, no humans left (dead humans → computer), single-human win (> n_cities/2), surrender offer threshold; 200-turn history cap |
| M9b | Reports, history, diplomacy, end-of-game and misc dialogs; over phase | `ui/dialogs/{reports,history,diplomacy_report,diplomacy_action,treachery_confirm,resign,surrender,victory,about,shortcuts,signpost}.py`, `states/phases/over.py` | M4c, M9a | R10a (state names), R10b (rating titles), X31, G2 | every Report / History menu entry opens by its key; surrender accept/decline; "no further human resistance" message then computer-only play; "no players left" waits for a key then quits; shortcut editor writes the user-dir copy and the bar updates; UDB HLP selectors 33-36 registered; diplomacy button decor registered |
| M10a | Effects, speech, captions, sound settings | `audio/{mixer,voice,effects,settings}.py` | M1b1, M2a, M4a | T4 | 37 clips play at 11000 Hz unsigned 8-bit; captions from `SOUND/*.TXT`; `--no-voice` and the speech flag silence speech; settings initialised from `OPTIONS.SND` and stored in user dir; triggers marked [unknown] in `sound.md` stay unregistered |
| M10b | Save / load (own format) | `ui/dialogs/save_load.py`, `persist/saves.py` | M8a, M2b | X12 (user flag before start) | 10 slots in user dir; save, quit, load, continue = same hash as uninterrupted run; Load Game from menu and Alt+L (`game -> game`) |
| M10c | Music | `formats/xmi.py`, `formats/sound.py` (drop `xmi_chunks`), `tests/test_formats_sound.py`, `audio/{music,music_render,music_triggers}.py`, `tools/render_music.py` (becomes a thin CLI), `requirements-music.txt` | M10a; the external renderer work finished | T4b | `python -m warlords2.audio.music_render` (and the tool) writes `out/music/manifest.json` keyed by XMI + `MIDPAK.AD` SHA-256; `audio/music.py` plays the cached WAV for mode n per `sound.md` §2 (modes 0-11, random member for groups 9/10/11/13, mode 2 rule of ovl58:0096); with no cache: music off and one stderr line naming the command; each trigger registered on the event matching its call site (e.g. mode 8 on `MedalAwarded`, ovl36:2274; mode 5 on temple dialog open, ovl01:0000) |
| M11 | Random map generator, Save/Load Map (optional) | `rules/randmap.py`, `rules/constants/randmap.py`, `ui/dialogs/{random_map,map_slots}.py` | M10b | X02, S6, X18 | generated worlds satisfy the invariants of `tests/test_formats_scenario.py`; city income = 2q + rnd(1,8,0) + 14 (ovl11:1171) |

Allowed sources per row (the only sources an implementer may use for behaviour and layout; engine rows additionally cite the EL addresses in their acceptance cell and §1.3):

| Row | Sources |
|---|---|
| M1b1, M1b2 | `graphics.md` §1-3, §6; this plan §2-3 |
| M2a | `graphics.md` §4-5; `tables.md` §5-8; MAN p.52-59; rules.md §9.7-9.9; SHOT 00, 03-09 |
| M2b | MAN p.14-17; `tables.md` §9, §11-13; EL §6.9; rules.md §1.2-1.6; SHOT 00-02, 09 |
| M2c | START.EXE (rea); `graphics.md` §3 START, §5 |
| M3 | `scenario.md` (tiles, roads, city blocks); `tables.md` §3; `graphics.md` §3; EL §4.1; SHOT 08 |
| M4a-M4b, M5a, M6a, M7a, M8a, M9a | EL sections cited in the row; `scenario.md`; `tables.md` §1-2, §13; MAN pages in §1.3 for intent only |
| M4c | MAN p.19-27, fig 6.3, 7.1; rules.md §9.2-9.8; UDB; HLP; EL §4.1 (terrain popup ovl46:0000) |
| M5b | MAN p.12, p.28, p.31-36, p.54, p.64; rules.md §4.6, §9.9; EL §3, §6.5 |
| M6b | MAN p.39-42; `BUTTON.DAT` (citybu); rules.md §6, §9.9; EL §6.3-6.5 |
| M7b | MAN p.44, p.49-51, p.57; HLP; rules.md §5; EL §5 |
| M8b1-M8b4 | EL §6.8 and rea of the phase in question only |
| M9b | MAN p.48 fig 14.1-14.2, p.53-59; rules.md §8; EL §6.6-6.7 |
| M10a, M10c | `sound.md`; `tables.md` §9, §15; `music.md`; EL §6.2 call sites |
| M10b, M11 | MAN p.53-54; `tables.md` §10; `scenario.md` RANDOM.DAT; EL §6.3 (ovl11:1171) |

M12 of the previous plan is dissolved: cursor hotspots → M2a (G4); intro timing → M2c; tutorial pop-ups → M8a; shortcut editor → M9b; music → M10c; remaining `Unverified` → the row that owns the constant.

### 4.1 Order and parallel groups

```
M1a(done) -> M1c
          -> M1b1 -> M1b2
                  -> M2a -> M2b, M2c, M10a
          -> M4a  -> M4b, M5a, M6a
M2a + M4a -> M3 ; M3 + M4b -> M4c ; M5a + M6a -> M7a
M4c + {M5a | M6a | M7a} -> M5b | M6b | M7b ; M4c+M5a+M6a+M7a -> M8a
M8a -> M8b1, M9a, M10b ; M8b1 -> M8b2, M8b3 ; M8b1 + M9a -> M8b4 ; M4c + M9a -> M9b
M10a -> M10c ; M10b -> M11
```

| Group | Rows that may run at once | Why it is safe |
|---|---|---|
| P1 | M1c, M1b1, M4a | disjoint trees (tests/docs, presentation core, engine) |
| P2 | M1b2, M2a, M4b, M5a, M6a | `debug/` vs `ui/assets` vs one rules file set each; dispatch is lazy strings, constants are per-module files |
| P3 | M2b, M2c, M3, M10a, M7a | own state / dialog / audio files; `NewGameConfig` is in `model/` (M4a done) |
| P4 | M4c, then M5b, M6b, M7b | dialogs, info panels, animations and HLP selectors register through `ui/registry.py`; no shared file |
| P5 | M8a | sole owner of `rules/turn.py` and the turn-start phase |
| P6 | M8b1, M9a, M10b | `ai/` vs `rules/diplomacy…` vs `persist/` |
| P7 | M8b2, M8b3, M9b, M10c, M11 | one `ai/phases/` file set each; M8b4 after M9a |

Engine rows M4b-M9a may build structure and tests before their blocking rows close but cannot be accepted while a constant they use is `Unverified`.

## 5. Risk and unknowns register

"Blocks" = milestone that cannot be accepted until the row is closed. Closed rows stay listed so constants can cite them. `rea` queries run through `tools/rea.sh` / `tools/re/rea_mcp.py`; string users via `tools/re/xref.py` (getter `ovl59:04f0`, roller `ovl59:02bf`).

### 5.1 From `rules.md` §10 (R01-R23)

| ID | Unknown | State | Blocks | Evidence / next step |
|---|---|---|---|---|
| R01 | Combat die size | closed | — | 20, 24 with Intense Combat, hard-coded ovl36:0927/092c (EL §3.4); not per scenario |
| R02 | Stack bonus cap; what counts | closed | — | cap SCN 0x112 (= 5 in all files); highest stack bonus only; city bonus inside the cap; enemy modifier after (EL §3.3 ovl38:0a2a) |
| R03 | Hit persistence | closed | — | 2 hits per unit, never reset between duels (ovl38:06ed/0712) |
| R04 | Terrain movement costs | closed | — | DS:1274 table and step rules (EL §4.1, §4.3 0555:19e4); alternative table → X20 |
| R05 | Pillage / sack / loot | closed | — | EL §6.5 (ovl31:046b, 035e, ovl36:0dd0) |
| R06 | Hero offer chance, price, allies | closed | — | EL §5.2 (ovl47:0000, 01fc) |
| R07 | XP thresholds, levels | closed | — | four levels 0-3, 15/30/60, +1 str +2 move (EL §5.3 ovl47:0579/0672) |
| R08 | Medals | closed (X23 closed) | — | EL §5.8 ovl36:2274 |
| R09 | AI levels | closed | — | three, K/L/W (EL §6.8, `tables.md` §13) |
| R10a | Diplomacy states and their names | narrowed | M9b (state names in report text) | values 0 / 1 / 2 and their transitions [V] (EL §6.6 ovl00:0db3); initial value [V]: 0 with Diplomacy on, 2 with it off, all 64 bytes, bits 4-5 cleared (ovl00:11bd, EL §9.6), 1 only after elimination; names peace / neutral / war [I] from STRING 111 messages; *M9a: the Diplomatic Report ovl00:0039 prints no state names: it draws an icon for current 2 and for current 0, none for 1 (ovl00:017b..01c7)*; rea: the Diplomatic Action dialog ovl00:0382 for its texts |
| R10b | Rating rank → title mapping per side count | closed (M9a) | — | ovl00:0aed: live sides sorted by infamy ascending (stable insertion sort), title index of rank i from the jump table ovl00:0cb7 by live sides n: 1 (0), 2 (0,7), 3 (0,3,7), 4 (0,1,5,7), 5 (0,1,3,5,7), 6 (0,1,3,5,6,7), 7 (0,1,3,4,5,6,7), 8 (0..7) into STRING 106 (ovl00:02c2); `rules.diplomacy.rating` |
| R11 | Humans moving through allied stacks | open | M4b | rea: move legality in 0555:19e4 callers (not in EL); README taken until then |
| R12 | History length 200 | closed (M9a) | — | ovl41:0d60 writes one record per round end from turn 2 (file created) while turn < 0xca: 200 records; from 0xca on nothing is written and the news records are no longer cleared; `rules.history.record_round` |
| R13 | "View Production" | closed | — | STRING group 4 |
| R14a | Difficulty Rating | closed | — | formula ovl57:0bab (EL §6.9) |
| R14b | Beginner/Intermediate/Advanced preset contents; QUOTES display place | closed | M2b | presets DS:2378, 3 rows of 10 words, only the first six applied (ovl57:1273/1694), buttons shown pressed while those six match (ovl57:1241); rows (0,0,0,0,1,0), (1,1,1,0,0,0), (2,1,1,1,0,1); quote drawn on the setup screen by ovl57:0f88 at DS:253c |
| R15 | Start-of-turn order, negative gold, upkeep rounding | closed | — | EL §6.2, §6.3: order listed; gold clamps 0; upkeep cost/2. *M8a: order re-traced from the asm (EL §6.2 addition; the human side runs the hero code before production, ovl68:04bd). Deviation: the music ovl58:0000 also rolls the game's dice (random track) but only when the requested mode differs from the playing one or the track has ended (ovl58:0011..0020, wall clock); the engine never rolls for music, so with music on the original's dice stream is not reproduced (coordinator: a register row)* |
| R16 | Starting gold, city income | closed | — | SCN player +2, city +42 |
| R17 | Enhance scope | closed | — | produced units +2, cap 9 (ovl43:0dd7) |
| R18 | "Sunk due to lack of a boat" | open | M4b | rea: xref the string (STRING 168). *M8a: the turn-start call ovl68:0491 (0b62:0ea0(-1, -1)) is wired in `rules.turn.human_turn`; the message is still not traced* |
| R19, R20 | Catapult; Ghosts | closed | — | `ARMYTYPE.DAT` |
| R21 | Terrain sets, PBEM, editor | closed | — | one set; no PBEM/editor in v1.02 |
| R22 | Elimination with armies but no cities | closed | — | eliminated at 0 cities (ovl61:18ab) |
| R23 | Source quality | accepted | — | — |

### 5.2 Added during planning (from rules.md §3.7, §4.4, §4.6, §6.2, §6.4, §7.1)

| ID | Unknown | State | Blocks | Evidence / next step |
|---|---|---|---|---|
| R24 | Navy movement 20 vs 30 | closed | — | aboard flag → 20 + carry (ovl68:05fb); a Navy unit gets its slot moves (from w3 = 30) like any unit (ovl43:0dd7) |
| R25 | Production repeat, full city, transit when destination falls | closed | — | repeats (ovl43:06bd); room search + 20 tries; reroute home or delete (EL §6.3-6.4) |
| R26 | City defence | closed | — | +0x14 = 1 with < 3 of the 4 slot bytes >= 0, else 2 (ovl44:0930); recomputed for every city at new game after the slot normalisation (ovl53:0a41..0a70, EL §9.4), so file values never reach play; again after any buy/loss; tower 1, site 2, halved when owner nibble 0xF (EL §3.3) |
| R27a | Ruin odds, rewards, sage gem | closed | — | EL §5.4 |
| R27b | Advisor verdict thresholds and wording choice | open | M5b (advisor text) | rea: advisor string-group user and the Shift-target handler |
| R28 | Neutral city garrisons per option value | closed | — (M4a unblocked) | set-up closed [V] (EL §9.5 ovl39:00cc): one army per intact city; owned cities kind 3; neutral: Average (0) one Scouts (type 11) strength 1, Strong (1) kind DS:0d60[rnd(1,4,-1)] of {1,6,2,3}, Active (2) kind of min(rnd(1,4,0),3); the city's best slot by ovl29:103d is built once (ovl43:0dd7) and production cleared; Scouts fallback when no slot. Quick Start ovl53:0937..0a3b [V] (EL §9.4). Open: run-time Active rule ovl39:025a (ovl29:0fd5, army cap) for M6a/M8 Run-time Active rule traced and implemented as rules.turn.active_neutrals (ovl39:025a; under 4 armies; refused if gold < cost + 30 after turn 5). |
| R29 | Hidden-map view radius, observe | open | M4b | rea: reveal routine; sage reveal rectangle known (ovl34:0cd6) |

### 5.3 From the format documents

| ID | Unknown | State | Blocks | Evidence / next step |
|---|---|---|---|---|
| G1 | Sheet cell for army type, tile id, road code, city type | open | M3 | rea: map draw routine; tutorial scripts cut picture 16 at x = 0, 32, 64, 96, 384 |
| G2 | Rects in button sheets, ABITS, ATRANS2, WAR, HIDDEN, SPECBITS, HELPGFX, MOVEBAR, CITYBACK, BIGARMY use | open | M4c, M5b, M6b, M7b, M9b (each for its sheets) | `BUTTON.DAT` source pairs; rea on drawing callers |
| G3 | ASHADOW use; FIN bytes 5, 6; second width = advance | open | M2a | START.EXE text draw (0x4F78); SHOT 00/09 text positions |
| G4 | Cursor hotspots, `STAND.PCK` key | open | M2a | rea: INT 33h AX=9 callers |
| G5 | AREA/BUTTON remaining fields (x, y, w, h confirmed against captures) | open | M2a | info area 56 vs 66 px, area id 13, `mask`, button bytes 2-5/12-18; rea ovl53:056a |
| G6 | Viewport origin, edge behaviour (360x360 = 9x9 tiles, minimap 2 px/tile confirmed) | open | M3 | rea map draw loop |
| S1 | SCN header words | narrowed | — (M4a unblocked) | identified: 0x0C0 level, 0x0D0 computer flag, 0x0E0 card, 0x0F0 enhanced, 0x110 current player, 0x112 cap, 0x116 (X29), 0x118 round complete, 0x11A-0x132 options, 0x12E tutorial, 0x135 turn, 0x137 alive, 0x147 shown, 0x157 victory acknowledged, 0x15B victory, 0x15D surrender offered, 0x161 terrain set, 0x163 turn order, 0x173 position in order, 0x175-0x17F view rectangle and centre, 0x181 army high-water mark, 0x60B fight order, 0x10E3 infamy, 0x1103 quests, 0x153B relations (EL §6.1, §6.9, §7, §9.1-9.2); Begin and new-game writes [V] (ovl57:0cfe, ovl61:1732/17f6, ovl53:0000; EL §9); 0x116, 0x10F3 meaning [U]; others preserved verbatim |
| S2 | City byte 20 and runtime bytes | closed | — | EL §6.1 (+0x14..+0x35); at load ovl29:0000 zeroes +0x2c..+0x40 of all 100 records and sets +0x2f = +0x15 (EL §9.1); +0x2f AI territory set at new game by ovl29:010b (EL §9.5) |
| S3 | Tile 1; road pieces 16/17 | open | M3 | `ROAD.PCK` cells; rea draw routine |
| S4 | SCENARIO.DAT word 58 and repeated names | open, non-blocking | — | layout reconciled: char[30] + u16@58 (bytes; `tables.md` §11 fixed) |
| S5 | Saved-map extra bytes, `CURRENT.HST` | not needed | — | own format (X12) |
| S6 | `RANDOM.DAT` parameters | open | M11 | rea generator (exe@0x3e563) |
| T1 | w16-w19 | closed | — | EL §4.2 (0c8c:0529), §4.3 |
| T2a | w13; negative buy price | closed | — | w13 = ally/medal/quest eligibility (EL §5.2, §5.8); |buy|/2 is pillage/sack value (EL §6.5) |
| T2b | "+1" of cancel modes 2/3 | open | M5a | EL §3.3 [U]: no code found; implement cancel only, `Unverified` for the +1 |
| T3 | MAPCOLOR four tables, word/byte tables | open | M3 | rea ovl63 |
| T4a | Music mode → track → call site | closed | — | `sound.md` §2 |
| T4b | Music: occasion of modes 4, 9, 10; repeat argument of 155e:0412 | open | M10c (those modes only) | rea callers ovl68:04bd, ovl61:1f68/1ecd |
| T4 | Effects occasions (dramatic/orch/war/splash), advisor speech selection ovl58:026f, vwin/vlose numbers, DING0 rate | open | M10a (those triggers only) | rea ovl58:026f, callers of ovl58:01a9/0206/023d |
| T5 | CARD fields | narrowed | M8b1 | CRD offset → AI word map [V] (EL §6.8); word meanings → X01 |

### 5.4 New items

| ID | Unknown | State | Blocks | Evidence / next step |
|---|---|---|---|---|
| X01a | AI phase order and traced decisions | closed | — | EL §6.8 phase list (ovl25:00e0..0331); hero accept, capture choice, quest pick |
| X01b-d | What each AI word and phase does | open | M8b2, M8b3, M8b4 | user decision 2026-10-14: the AI must be the original's, fully reverse engineered from the binary ("one of its best features"); no substitute heuristics at all. Research pass docs/research/ai.md first, then M8b rows implement from it |
| X02 | Random map generator | open | M11 | rea; button inert until then |
| X03 | Screen order after Begin | closed | — | Game Start ovl60:060f -> ovl57:0000(1, 1, 1, 0): one progress scroll (popup 0x17, ovl57:0047) for ovl57:0194(1) (STRING group 135, 0 / 20 / 60 / 100, ovl59:0000(10)) and then ovl63:232b in the same scroll (ovl17:08bf finds it open, ovl17:070b clears the text; group 137, 0..90; 256 rnd(1,3,1) at 2479), closed at ovl57:0092; "Not used" rename after it (ovl57:02dd); then the setup screen; Begin ovl57:0cfe -> ovl61:0000(0, 1) without another scroll. Implemented: `states.setup.load_scroll` (two chained `progress` dialogs, the second opened in the frame the first closes, since `progress` cannot swap its lines), bitmap handed to the game as `overview=`; --scenario runs the same load in the building phase |
| X04 | START.EXE intro sequence and timing | open | M2c | rea on START.EXE; or user decision for a static title |
| X05 | Timing base (animation, scrolling, battle pacing) | closed (M10a) | — | The waits are BIOS ticks: ovl59:0000(n) reads the tick count with int 1Ah AH=0 (0000:1bcf) and loops until t0 + n (ovl59:015e the same, polling input); the EXE installs no int 8 / 1Ch handler (its setvect calls, res_0e8f:0018, hook 9, 1Bh, 23h, 24h) and the PIT routine 0000:0894 (channel 0 divisor + int 8 vector) has no caller, so one tick = 65536 / 1193182 s ≈ 18.2065 Hz (`audio.voice.TICK_HZ`). Implemented: `ui.widgets.tick_frames(ticks, tick_hz, elapsed)` = frames of a wait at `--tick-hz`, the waits of one sequence counted from its start so fractions carry over (1 tick at 60 Hz: 4, 3, 3, ... frames; 10 ticks: 33); used by the load wait and the setup label frames (`states.setup`) and, in its own clock, by `audio.voice.Speech`. The port 3DAh (vertical retrace) polls (0e68:000a, ovl35, ovl45, 0a4c) sync drawing to the display (at most one refresh each) and are not modelled as time. Each animation's wait count stays its owner's evidence (M4c, M5b) |
| X06 | RNG | closed (user) | — | Borland LCG and roller verified (EL §2) and selectable via NewGameConfig.rng="borland". User 2026-10-14: switch the default only if it makes a real difference. Measured: Borland die 20 is uniform except rand()==32767 → 21, clamped to 20 (+1/32768 on the top face); duel win rates Borland vs Python vs analytic agree within ±0.001 for (4,4), (6,9), (9,12), (3,15); the original seeds from the clock, so its sequence is not reproducible anyway. Default stays "python" |
| X07 | Purchased-production stats | closed | — | slots copy ARMYTYPE (ovl44:1299); at every new game ovl53:0a75 drops Navy slots, re-copies w0-w3 into every slot (the scenario's per-city values are discarded), sorts by abs(w4) and perturbs strength/moves/cost/time at random (EL §9.4) |
| X08 | Item drop on hero death; standard capture | closed | — | ovl36:16cd [V] (EL §5.10): items fall at the death square, state 0 on Water else 1 (road bit 0x40 not set, so a dropped standard is not planted, ovl47:0b47, but can be picked up again: ovl40 list mode 1); item == SCN 0x110 cancels that side's vectoring to the standard; `rules.heroes.hero_died` |
| X09 | Tutorial pop-up triggers | narrowed | M8a | gates at ovl31:0000, ovl68:04bd, ovl57:00d7 with SCN 0x12E (EL §6.9). *ovl68:04bd closed: turn 2, SCN byte 0x134 bit 0x40 clear -> set, page FILE.DAT (25, 7) through ovl61:168d (`TurnCue` kind tutorial, rules/turn.py). Open: ovl31:0000, ovl57:00d7, ovl67:01ea..0337 / 0b62:04f7..063f (bits 3, 4, 7)* |
| X10a | Surrender offer threshold | closed | — | > half the city records and > max computer + total/8 (ovl61:1aed) |
| X10b | What accepting the surrender does | closed (M9a) | — | button dispatcher res_07be:04d9 (id - 100 into 07be:0b0c): 0x1e5 -> ovl61:1e4e: every live computer side alive = 0 (cities and armies stay), 0x15b = 1, news (p, 7), victory screen ovl61:1fbd (0x157), its button 0x1e3 -> ovl61:2004 (Hidden Map off, ovl68:04bd(0)); 0x1e6 -> ovl61:1ecd: 0x10f3[c] = 0x110 for every live c (when a live human exists), screen with button 0x1e4 -> ovl61:2046 -> ovl68:04bd(0); `rules.victory.accept_surrender` |
| X11 | Music | closed (user) | — | music on; WAVs pre-rendered locally to `out/music/`, never tracked (M10c). The OPL renderer uses pyopl (GPL-3.0): accepted by the user 2026-10-14 since only the rendered WAVs are used |
| X12 | Save format | closed (user) | M10b | user 2026-10-14: any format is fine; own format, no compatibility with the original's saves |
| X13 | 8-bit blits keep indices | closed | — | verified by review; palette via LUT (3.1) |
| X14 | MP4 encoding | closed | — | `mp4v` works, `h264` fails (3.4 S7) |
| X15 | Switches `x h m` | closed | — | not implemented; `s`, `v`, `n` are `--alt-names`, `--no-voice`, `--no-intro` |
| X16 | How START.EXE is launched and what `n` does | open | M2c | WARLORD2.EXE names neither START.EXE nor an exec target; START.BAT runs WARLORD2.EXE only; README says `WAR2` (a batch file not shipped here). rea: switch parser near 0a4c:00f8 for `n` |
| X17 | Neutral owner value: map nibble 8 = neutral, 0xF = nobody (EL §3.2, §4.1) vs city owner 15 in every file (`scenario.md`) | closed | — | neutral = 0x0F [V] at set-up: city +0x15, garrison army +5, map nibble (rebuilt by ovl62:0000 at every main-loop pass, not at set-up); no immediate write of 8 to these fields found anywhere, so 0x0F at run time too [I]; 8 only as clamp min(owner,8) for the fight-order row (EL §3.2/§4.1 corrections, §9.2, §9.5). Capitals ovl53:07ca..092e, player record words 0x193/0x195 (EL §9.4) |
| X18 | Map slots: `MAPINFO.DAT` has 5 lines vs 10 slots in MAN p.54 / README | open | M11 | rea ovl49 slot-list loop |
| X19 | Helmet (`VOICE.PCK`, SHOT 01) trigger: intro tail or talking face | closed (trigger); speech/captions/blink timing remain M10a | M2b (helmet only), M10a | talking advisor face: ovl58:026f is the only user of VOICE.PCK, drawn at (152,15); Game Start calls it on entry via ovl60:0000 → ovl58:026f(2) unless voice is off; SHOT 01 eyes = VOICEBIT frame (0,94) (MAE 0.40 vs 12.7/9.4) |
| X20 | Caller of the alternative cost table DS:01e0 (mode 0xE) | open | M4b (if a rule uses it) | EL §4.1 [I] |
| X21 | Item type 5 (flight) and 6 (double move) code paths beyond §4.2/§4.4 | narrowed | M4b | flight item → mode 2 (0c8c:0529), double move (ovl68:05fb); pickup/drop effects elsewhere open |
| X22 | +80 fight-order shift purpose | closed for code | — | coded as found (EL §3.2); purpose [I] irrelevant |
| X23 | Which battle outcome awards hero exp (ovl36:0c01/0ca1); medal caller argument; the battle type arrays after the battle | closed | — | medal argument = battle result [V] (asm ovl36:0498); medal stack = DS:5e3e after the re-selection ovl36:047f..0490, done in `rules.combat.attack` (survivors DS:5e3e / 5e62 at ovl36:0afd..0b58, then 0b62:007d + ovl67:06eb on a win); exp: every surviving hero (M5a). Type arrays [V]: ovl38:008b writes DS:424c[0..attackers) / 4254[0..defenders) (asm ovl38:06e5..072d; 8 / 32 bytes, zero in the EXE image), also in the advisor trials (ovl36:2065 -> 124a -> 1311); the bytes past a count are the previous set-up's; `rules.combat.prepare` records them in `state.battle_work`, read by ovl36:0c8e (defender exp: DS:424c[i]) and the quest kill-type check (DS:4254) (EL §3.5) |
| X24 | 2c04:015D / 015B blocking offers and quest types 3-5 | closed | — | readers [V]: ovl47:0017 (no offer while 015d), ovl01:11e3 / 12a7 / 13ae (types 3-5 refused while 015b); writers ovl61:1aed (015d surrender offered, 015b victory, EL §6.7), ovl53:0018 resets 015d |
| X25 | Site flag +0x1B | closed | — | not scenario data: ovl35:091e clears it and sets it on sites·3/10 random non-temple sites; +0x1D = 0x00FF, 0 for flagged sites with Quests on; special items (type 5, 6, 8, or 2 with value >= 2, ovl35:08f4) only in flagged sites, others only in unflagged (ovl35:0173..020e); flagged sites have their own map icon (ovl63:07db) (EL §5.1 correction, §9.3) |
| X26 | Quest failure per event; starting item placement | narrowed | — | per-event conditions of ovl01:1ded traced [V] (EL §5.10, `rules.quests.check`); items 8..21 redrawn from the .ITM list at set-up [V] (ovl35:04ef, EL §9.3); the turn-1 hero gets item p (ovl47:0474). Open: where items 0..7 lie before turn 1 (SCN data, not traced) |
| X27 | FP truncation helper 0000:1b57 | closed | — | __ftol with chop rounding [V]; distance 0a8b:0acc -> 1012:1199 = trunc(sqrt(dx²+dy²)) = integer square root (EL §2, §9.7) |
| X28 | Fortify rule details: meaning of army flag bit 0 tested by ovl67:0000; MAN "Defend + one turn" (rules.md §3.6) | closed | — | bit 0 = awake: set by every selection (ovl66:009f, ovl67:0955), a new army (0b62:038c) and the AI (ovl21:0e9c / 0f51 / 104b), cleared only by Defend (ovl67:03c5 / 03ee; bit-wise writers, whole-word writes of +0xc not enumerated); mark under asleep own armies with +7 >= +6 on terrain 1/4/5/7/8/9 or road; 0x2000 cleared only where no army stands (0b62:023e, ovl62:02a8), on capture and at new game (EL §4.5, §6.2 addition); `rules.selection.fortify_marks` for M8a |
| X29 | SCN 0x116 (+400 infamy for humans) | narrowed | M8b4 | writer traced: only ovl57:0ee8 ("I am the Greatest" 143 / 144: 0x116 = 1 / 0 at ovl57:0f52 / 0f60) besides the SCN read; readers ovl57:04f5 (button state), ovl53:0295 (start infamy +400 for humans), ovl18:06ad (in ovl18:0000), ovl27:13b7 (in ovl27:0e04, only when 0x0D0[0x110] = 0); passed as `NewGameConfig.greatest`. *M9a: both remaining readers sit in the computer's own diplomacy decisions (ovl18:0000 rewrites computer proposals bits 2-3 at 0692 / 07b3 / 07e4; ovl27:0e04 at 0196), not in the rules code of ovl00 / ovl61 / ovl36, so nothing is left for M9a.* Open (M8b4): what ovl18 / ovl27 do with it |
| X30 | City history (ovl41) | closed (M9a) | — | the history file of ovl41:0d60 holds per round: gold[8], winning score[8] (ovl42:0947 = ovl42:02fb case 4 / 5), cities[8] (DS:5dea), one owner byte per city record (0xff when not intact), up to 10 news entries (ovl41:132f: first entries of all sides, then second entries); History > City / Gold / Winners graph the cities / gold / score arrays (accessors ovl41:10eb / 119c / 1161, viewer ovl41:034a), Events prints the entries (ovl41:1516, STRING 94). Capture and raze leave no entry of their own: the owner array records them. Battle news kinds 5 and 1 at ovl36:0a78..0c5f, statistics 2c04:1163 (8 x 8 x 5 words) at ovl36:1aff (History > Triumphs); `rules.history` |
| X31 | Diplomacy button colour on the action palette | narrowed (M9a) | M9b | the state it shows is engine state [V]: ovl00:0cc7 (every main-loop pass) sets bit 4 of relation byte [p][p] when some side's proposal to p differs from its current state, bit 5 when all of them are more peaceful (MAN p.56 green / red); open: the action-palette draw that reads it; drawn via `button_decor` |
| X32 | Music track changes roll the game's dice (ovl58:0000) | open (accepted divergence candidate) | M10c | rolls happen only when the playing track ended or the mode changed, which depends on wall-clock playback; the engine never rolls for music, so with music on the original's dice stream is not reproduced (with music off it is). Decide in M10c whether to model a tick-based playback clock |

## 6. Testing strategy

### 6.1 Layers

| Layer | Location | Owner | What it checks |
|---|---|---|---|
| Decoder goldens | `tests/test_formats_*.py` | M1a, M1c | sizes, counts, exact consumption, SHA-256 digests |
| Architecture | `tests/test_architecture.py` | M1a | engine imports with pygame & co. blocked; import direction |
| Traceability | `tests/test_traceability.py` | M1c | every public function in `rules/` and `ai/` has an `Evidence:` line; every `Unverified` names a section-5 row; no literal in `warlords2/`, `tests/`, `tools/` equals a STRING/HLP entry longer than 12 characters (file names and dict keys allow-listed) |
| Engine units | `tests/engine/test_<module>.py` | module owner | the behavioural acceptance of section 4, parametrised over the 7 scenarios |
| Engine determinism | `tests/engine/test_determinism.py` | M4a; extended by new files of M8a, M10b | seed + command list → same hash; dump/load mid-game keeps it |
| Loop | `tests/test_loop.py` | M1b1 | pgsm traps of 2.1, palette and input rules |
| Harness | `tests/test_harness.py`, `tests/test_scripts.py` | M1b2 | script steps post events at the right frame; recorder frame count and distinct frames; MP4 read-back |
| Golden frames | `tests/test_golden.py` | M1b2 | iterates `golden` steps in `tests/scripts/*.json`; region MAE vs `original/ref` |

Tests needing game data carry `@pytest.mark.gamedata` (`tests/conftest.py`) and fail when the data directory is absent, unless `WL2_NO_DATA=1`.

### 6.2 Evidence tags in code

`Evidence: EXE ovl36:2274 | DATA ARMYTYPE.DAT+30 | MAN p.64 | README | STR 163/4 | EL §5.8`. A function resting only on the manual is tagged `MAN` and gets a register row for EXE confirmation.

### 6.3 Review loop

1. Implementer finishes the row, runs the scripts, leaves `out/evidence/<milestone>/` (frames, recordings, manifest).
2. A fresh reviewer agent that wrote none of the code receives the diff, the milestone row, the cited evidence sections and the evidence directory — not the implementer's summary.
3. The reviewer (a) opens every frame and the recording and reports what is wrong with each image before reading code, (b) checks each rule against its cited address or source, (c) reruns the scripts and compares manifest hashes, (d) lists any constant or behaviour without evidence.
4. Findings go back; the row closes on a clean second pass.
5. After M3, M5b, M9b and M10c a user checkpoint: the recording of the milestone's script.

## 7. Review disposition (review of 2026-10-14)

| Item | Disposition | Where / why |
|---|---|---|
| B1 | applied | §0 game-text rule (docs exempt); M1c rewrites `test_formats_tables.py`; test files assigned owners in §6.1 |
| B2 | applied | registry rule §1, `ui/registry.py` (M2a); phases as separate modules (§1.4); effect/music triggers in `audio/` registering on events |
| B3 | applied | help_page/popup_help/tutorial_page → M2a; `advisor` → M5b; `random_map` only M11; one `save_load` (M10b); shortcuts only M9b; `cities` → M6b |
| S1 | applied | §2.1, §3.4, M1b1 acceptance |
| S2 | not applicable | `EventRegister` not used (user decision); listed in §3.4 |
| S3 | applied in part | `ui/input.py` derives buttons/modifiers from DOWN/UP events (needed for scripted input too); replay part not applicable; Alt+drag test in M1b1 |
| S4, S5 | not applicable | no event capture/replay |
| S6 | applied | §3.3 copy per frame, `record-fps` = tick rate; M1b2 acceptance |
| S7 | applied | `mp4v`, direct `save(abs_path)`, read-back check; X14 closed |
| S8 | applied | §3.1 LUT presentation, no `set_palette` |
| S9 | applied | §2.1 rows (drawable after `on_enter`, `NoLoading.update(dt, state)`, `request`, `game -> game`, thread-list join); EventRegister part not applicable |
| C1 | applied | `--alt-names`, `--no-voice` in §3.2; consumers M4a, M10a |
| C2 | applied | fortify step in `rules/turn.py` (M8a), read in `rules/bonuses.py` (M5a), drawn by M3; EXE rule supersedes MAN (X28) |
| C3 | applied | closed command list §1.2 |
| C4 | applied | Alt/Shift interrupt → M8b1; end states → M9a rules, M9b presentation |
| C5 | applied | help pages, map right-click panels (M4c, M6b, M7b), tutorial pop-ups (M2a render, M8a triggers) |
| C6 | applied | credits pages → M2c |
| C7 | applied | §1.6 data-file table; OPTIONS.SND (not SOUND.DAT) in §0 |
| C8 | applied | `--scenario RANDOM` rule in M2b |
| C9 | applied | X19 helmet, X31 diplomacy button via `button_decor` |
| E1 | applied | closed by EL §6.9 (ovl57:223b, 0e34); `tables.md` §9 tag update is an M1c follow-up |
| E2 | applied | SCENARIO.DAT checked on bytes: char[30] + u16@58; `tables.md` §11 fixed, `scenario.md` annotated; duplicate decoder removed in M1c; MAPINFO slots → X18 |
| E3 | applied | §0 declares START.EXE; X16 |
| E4 | applied | R12 marked provisional; Terrain names now [V] by EL §4.1 |
| E5 | applied | §5.2 relabelled |
| Milestones: NewGameConfig, progress, M10b dep | applied | `model/newgame.py`; `progress` in M2a; M10b needs M2b |
| Milestones: split M1b, M8b, intro | applied | M1b1/M1b2, M8b1-4, M2c |
| Milestones: M7a size | rejected | stays one row: its three files share hero/site/item records and EL §5 is one traced unit; acceptance is a list of independent exact tests |
| Weak acceptance (M5a, M8a, M8b, M2a, M12) | applied | address-tied checks in §4; M12 dissolved |
| "section 6.5" typo | applied | common acceptance cites 6.3 |
| constants.py, model bottleneck | applied | `rules/constants/<module>.py`; closed model lists, changes via coordinator |
| Minor: ffmpeg join | applied | segments listed in the manifest |
| Minor: xmi_chunks, parse_saved_map | applied | `xmi_chunks` replaced in M10c; `parse_saved_map` kept for the dump tool (§1.6) |
| Minor: `--events`, rename | applied (moot) | no event flags at all (user decision) |
| Minor: recorder tearing, `pg.error` | applied | `ScreenRecorder` thread not used |
| Minor: `KEYDOWN.unicode` | applied | `start_text_input()` once (§1.4 `ui/input.py`) |
| Minor: UDB.CUR | applied | §0 wording |
| Verified-correct list | kept | pgsm facts in §2.1, data spot checks used in rows (AREA rects, BUTTON 100, HLP ids, SHOT 07) |
