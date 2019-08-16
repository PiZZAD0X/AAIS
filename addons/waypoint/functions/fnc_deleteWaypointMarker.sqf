/*
 * Author: TheMagnetar
 * Deletes a waypoint marker to the group.
 *
 * Arguments:
 * 0: Group <OBJECT> (Default: grpNull)
 * 1: Marker <STRING> (Default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1, "marker"] call aais_waypoint_fnc_deleteWaypointMarker
 *
 * Public: Yes
 */
 #include "script_component.hpp"

params [
    ["_group", grpNull, [grpNull]],
    ["_marker", "", [""]]
];

if (!local _group || {(getMarkerColor _marker) isEqualTo ""}) exitWith { false };

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _markers = [_settings, "marker"] call CBA_fnc_hashGet;

private _index = -1;
{
    if (_x select 0 isEqualTo _marker) exitWith {
        _index = _forEachIndex;
    };
} forEach _markers;

if (_index == -1) exitWith {false};

_markers deleteAt _index;

_markers = [_markers] call FUNC(organizeMarkers);

[_settings, "marker", _markers] call CBA_fnc_hashSet;

true
