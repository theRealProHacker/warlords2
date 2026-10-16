"""Single entry point of the rules: `apply(state, cmd) -> list[Event]` (plan section 1.3).

The dispatch table maps every command class to (owning milestone, "module:function").
Targets are resolved lazily by name, so rule milestones add their functions without
editing this file.  Every target is called as `f(state, cmd)` and returns a list of events;
it raises `IllegalCommand` for a command that is not legal now.  A target that does not
exist yet raises `NotImplementedCommand` naming the owning milestone.

While `state.pending` holds a question event, only its answering command is legal, except the
view and speech settings (`ANYTIME`), which answer nothing: the walk that led to a pending
question scrolled the view before the question came up in the original, while here the animation
replays that walk (and its scrolls, `SetView`) after the engine has already set the question.
"""
from __future__ import annotations

import importlib

from ..model import commands as C
from ..model import events as E

R = "warlords2.rules."
DISPATCH = {
    C.Move: ("M4b", R + "movement:move"),
    C.SetPath: ("M4b", R + "movement:set_path"),
    C.CancelPath: ("M4b", R + "movement:cancel_path"),
    C.MoveAll: ("M4b", R + "selection:move_all"),
    C.Group: ("M4b", R + "selection:group"),
    C.Ungroup: ("M4b", R + "selection:ungroup"),
    C.GroupAll: ("M4b", R + "selection:group_all"),
    C.UngroupAll: ("M4b", R + "selection:ungroup_all"),
    C.LeaveGroup: ("M4b", R + "selection:leave_group"),
    C.Defend: ("M4b", R + "selection:defend"),
    C.Disband: ("M4b", R + "selection:disband"),
    C.SelectStack: ("M4b", R + "selection:select_stack"),
    C.SelectGroup: ("M4b", R + "selection:select_group"),
    C.Next: ("M4b", R + "selection:next_stack"),
    C.Deselect: ("M4b", R + "selection:deselect"),
    C.ConfirmDisband: ("M4b", R + "selection:confirm_disband"),
    C.Attack: ("M5a", R + "combat:attack"),
    C.SetFightOrder: ("M5a", R + "combat:set_fight_order"),
    C.ConfirmTreachery: ("M9a", R + "diplomacy:confirm_treachery"),
    C.Search: ("M7a", R + "ruins:search"),
    C.TempleChoice: ("M7a", R + "ruins:temple_choice"),
    C.SageChoice: ("M7a", R + "ruins:sage_choice"),
    C.TakeItem: ("M7a", R + "heroes:take"),
    C.DropItem: ("M7a", R + "heroes:drop"),
    C.PlantFlag: ("M7a", R + "heroes:plant_flag"),
    C.AcceptHero: ("M7a", R + "heroes:accept_hero"),
    C.NameHero: ("M7a", R + "heroes:name_hero"),
    C.CaptureChoice: ("M6a", R + "city:capture"),
    C.SetProduction: ("M6a", R + "city:set_production"),
    C.BuyProduction: ("M6a", R + "city:buy_production"),
    C.SetVector: ("M6a", R + "vectoring:set_vector"),
    C.RenameCity: ("M6a", R + "city:rename"),
    C.RazeOwnCity: ("M6a", R + "city:raze_own"),
    C.EditSign: ("M9b", R + "signs:edit_sign"),
    C.Propose: ("M9a", R + "diplomacy:propose"),
    C.SetControl: ("M8a", R + "turn:set_control"),
    C.SetEnhance: ("M8a", R + "turn:set_enhance"),
    C.SetObserve: ("M8a", R + "turn:set_observe"),
    C.SetSpeech: ("M8a", R + "turn:set_speech"),
    C.SetMusic: ("M10c", R + "music:set_music"),
    C.SetView: ("M8a", R + "turn:set_view"),
    C.AcceptSurrender: ("M9a", R + "victory:accept_surrender"),
    C.CloseVictory: ("M9b", R + "victory:close_victory"),
    C.Resign: ("M9a", R + "victory:resign"),
    C.EndTurn: ("M8a", R + "turn:end_turn"),
    # review fixes of M5b / M6b / M7b (X34, X35, X09)
    C.SetPalette: ("M5b", R + "selection:set_palette"),
    C.Advise: ("M5b", R + "advisor:advise"),
    C.TakeAll: ("M7b", R + "heroes:take_all"),
    C.SortSlots: ("M6b", R + "city:sort_slots"),
    C.ChooseProduction: ("M6b", R + "city:choose_production"),
    C.ScreenTutorial: ("M6b", R + "selection:screen_tutorial"),
    C.RedirectVectors: ("M6b", R + "vectoring:redirect_vectors"),
    C.QuestPage: ("M9b", R + "quests:quest_page_command"),
    C.ReportPage: ("M9b", R + "reports:report_page_command"),
}
assert set(DISPATCH) == set(C.COMMANDS)

# Pending question -> the commands that answer it.
ANSWERS = {
    E.HeroOffered: (C.AcceptHero, C.NameHero),
    E.CityCaptured: (C.CaptureChoice,),
    E.SageOffered: (C.SageChoice,),
    E.TreacheryPrompt: (C.ConfirmTreachery,),
    E.SurrenderOffered: (C.AcceptSurrender,),
    E.Victory: (C.CloseVictory,),
    E.DisbandPrompt: (C.ConfirmDisband,),
}
assert set(ANSWERS) == set(E.PENDING)

# Commands legal with or without a pending question (the view words, the speech switch).
# Not SetMusic: it rolls a die, and Settings does not open under the modal questions
# (07be:0064 skips the menu keys while DS:166a is set, 00a9; rules.music.set_music).
ANYTIME = (C.SetView, C.SetSpeech)


class IllegalCommand(Exception):
    pass


class NotImplementedCommand(IllegalCommand, NotImplementedError):
    """The rule for this command belongs to a milestone that has not delivered it."""

    def __init__(self, cmd_cls, milestone: str, target: str):
        super().__init__("not implemented: %s -> %s (%s)" % (cmd_cls.__name__, target, milestone))
        self.milestone = milestone
        self.target = target


def resolve(cmd_cls):
    """The handler for a command class.
    Evidence: plan §1.3 dispatch by handler name; no game rule."""
    if cmd_cls not in DISPATCH:
        raise IllegalCommand("unknown command %r" % cmd_cls)
    milestone, target = DISPATCH[cmd_cls]
    mod, name = target.split(":")
    try:
        module = importlib.import_module(mod)
    except ModuleNotFoundError as e:
        if e.name != mod:
            raise
        raise NotImplementedCommand(cmd_cls, milestone, target) from None
    fn = getattr(module, name, None)
    if fn is None:
        raise NotImplementedCommand(cmd_cls, milestone, target)
    return fn


def apply(state, cmd) -> list:
    """Apply one command; returns the events it produced.  Atomic: when the handler raises
    (IllegalCommand, an Unverified value, any error), the state is put back as it was before
    the call (same hash), in place, so references into the state stay valid; the production
    report block (`GameState.production_report`, not in the snapshot) is put back too, and the
    music words (`GameState.music`, through `serialize.snapshot` / `restore`): a refused command
    stands for one the EXE never carried out, so its music call is undone with its dice.
    Evidence: plan §1.3 (single entry point, pending questions); no game rule."""
    from ..model.serialize import restore, snapshot
    snap = snapshot(state)
    report = state.production_report.copy()
    try:
        return _dispatch(state, cmd)
    except BaseException:
        restore(state, snap)
        state.production_report.data[:] = report.data
        raise


def _dispatch(state, cmd) -> list:
    if isinstance(cmd, ANYTIME):
        pass
    elif state.pending is not None:
        allowed = ANSWERS[type(state.pending)]
        if not isinstance(cmd, allowed):
            raise IllegalCommand("%s pending; expected %s"
                                 % (type(state.pending).__name__, "/".join(c.__name__ for c in allowed)))
    elif any(isinstance(cmd, answers) for answers in ANSWERS.values()):
        raise IllegalCommand("%s answers no pending question" % type(cmd).__name__)
    return resolve(type(cmd))(state, cmd)


def legal(state, cmd) -> bool:
    """Whether `cmd` would be accepted now (tried on a copy of the state).
    Evidence: plan §1.3; no game rule."""
    try:
        apply(state.copy(), cmd)
    except IllegalCommand:
        return False
    return True
