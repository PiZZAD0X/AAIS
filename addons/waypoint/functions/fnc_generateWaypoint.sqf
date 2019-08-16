/*
 * Author: TheMagnetar
 * Generates a waypoint.
 *
 * Arguments:
 * 0: Group <OBJECT> (default: objNull)
 * 1: Marker <STRING>
 * 2: Waypoint options <ARRAY> (default: [])
 *  0: Waypoint type <STRING> (default: "MOVE")
 *  1: Statements execution upon waypoint completion <STRING> (default: "")
 *
 * Return Value:
 * Waypoint successful <BOOL>
 *
 * Example:
 * [group player] call aais_waypoint_fnc_generateWaypoint
 *
 * Public: No
 */
 #include "script_component.hpp"
 EXEC_CHECK(SERVERHC);

params [["_group", objNull], "_marker", ["_options", []]];

if (!local _group) exitWith {};

private _settings = _group getVariable [QEGVAR(core,settings), []];

_marker = [_marker] call FUNC(selectRandomMarker);

private _sizeX = (markerSize _marker) select 0;
private _sizeY = (markerSize _marker) select 1;
private _minimumDistance = 2/3*sqrt(_sizeX^2 + _sizeY^2);

if (_settings isEqualTo []) exitWith {
    WARNING_1("Group %1 defined without configuration",_settings);
};

private _tries = 0;
private _currentPos = getPos (leader _group);
private _allowWater = [_settings, "allowWater"] call CBA_fnc_hashGet;
private _allowLand = [_settings, "allowLand"] call CBA_fnc_hashGet;
private _forceRoads = [_settings, "forceRoads"] call CBA_fnc_hashGet;
private _blackListedMarkers = [_settings, "blacklist"] call CBA_fnc_hashGet;
if (_blackListedMarkers isEqualTo "") then {
    _blackListedMarkers = [_blackListedMarkers];
};

private _targetPos = _currentPos;

// Delete all waypoints
[_group] call FUNC(clearWaypoints);
_targetPos = _currentPos;
while {_tries < 50} do {
    private _trialPos = [_marker, [_allowWater, _allowLand, _forceRoads], [0, 50, ""], _blackListedMarkers] call FUNC(markerRandomPos);

    TRACE_3("waypoint at %1. Minimum distance %2. Greater than minimum distance %3",_trialPos,_minimumDistance,_trialPos distance2D _currentPos >= _minimumDistance);

    if (_trialPos distance2D _currentPos >= _minimumDistance) then {
        _targetPos = _trialPos;
        _tries = 50;
    } else {
        _tries = _tries + 1;
    };
};

_options params [["_waypointType", "MOVE"], ["_execStatemets", ""], ["_condition", "true"]];
private _waypoint = [_group, _targetPos, _waypointType, _execStatemets, _condition] call FUNC(addWaypoint);

_group setCurrentWaypoint _waypoint;

if (EGVAR(core,debugEnabled)) then {
    private _markerName = format ["marker_%1", CBA_missionTime];
    createMarker [_markerName, _targetPos];
    _markerName setMarkerShape "icon";
    _markerName setMarkerType "hd_dot";
    _markerName setMarkerColor "colorRed";
};

_targetPos
