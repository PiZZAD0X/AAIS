#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Adds a waypoint to the specified group.
 *
 * Arguments:
 * 0: Group <OBJECT> (default: [])
 * 1: Target Position <ARRAY>
 * 2: Waypoint type <STRING> (default: "")
 * 3: Statemets execution at waypoint completion <STRING> (default: "")
 *
 * Return Value:
 * Waypoint <WAYPOINT>
 *
 * Example:
 * [group player, getPos _target, "MOVE", "hint 'moving'"] call aais_waypoint_fnc_addWaypoint
 *
 * Public: No
 */

params ["_group", "_targetPos", ["_waypointType", ""], ["_execStatements", ""], ["_condition", "true"], ["_radius", 0], ["_completionRadius", -1]];

private _settings = _group getVariable [QEGVAR(core,settings), []];
if (_completionRadius == -1) then {
    _completionRadius = [_settings, "reachedDistance"] call CBA_fnc_hashGet;
};

private _waypoint = _group addWaypoint [_targetPos, _radius];

_waypoint setWaypointPosition [_targetPos, 0];

if (_waypointType isEqualTo "") then {
    switch ([_settings, "task"] call CBA_fnc_hashGet) do {
        default { _waypointType = "MOVE"; };
    };
};

_waypoint setWaypointType _waypointType;
_waypoint setWaypointCompletionRadius _completionRadius;

if ([_settings, "randomBehaviour"] call CBA_fnc_hashGet) then {
    _waypoint setWaypointFormation (selectRandom ([_settings, "formation"] call CBA_fnc_hashGet));
    _waypoint setWaypointSpeed (selectRandom ([_settings, "speed"] call CBA_fnc_hashGet));
    _waypoint setwaypointBehaviour (selectRandom ([_settings, "behaviour"] call CBA_fnc_hashGet));
    _waypoint setwaypointCombatMode (selectRandom ([_settings, "combatMode"] call CBA_fnc_hashGet));
} else {
    _waypoint setWaypointFormation "NO CHANGE";
    _waypoint setWaypointSpeed "UNCHANGED";
    _waypoint setwaypointbehaviour "UNCHANGED";
    _waypoint setwaypointCombatMode "NO CHANGE";
};

//_waypoint setWaypointCompletionRadius ([_settings, [_settings, "reachedDistance"]] call CBA_fnc_hashGet);
private _statements = [_execStatements, [_settings, "execWaypoint"] call CBA_fnc_hashGet];
_waypoint setWaypointStatements [_condition, _statements joinString ";"];

_waypoint
