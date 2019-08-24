#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Modifies the weight of a waypoint marker.
 *
 * Arguments:
 * 0: Group <OBJECT> (Default: grpNull)
 * 1: Marker <STRING> (Default: "")
 * 2: New weight <NUMBER> (Default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1, "marker", 200] call aais_waypoint_fnc_modifyWaypoitMarkerWeight
 *
 * Public: Yes
 */

params [
    ["_group", grpNull, [grpNull]],
    ["_marker", "", [""]],
    ["_markerWeight", 0, [0]]
];

if (!local _group || {(getMarkerColor _marker) isEqualTo ""}) exitWith { false };

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _markers = [_settings, "marker"] call CBA_fnc_hashGet;

private _index = -1;
{
    if ((_x select 0) isEqualTo _marker) exitWith {
        _x set [1, _markerWeight];
        _index = _forEachIndex;
    };
} forEach _markers;

if (_index == -1) exitWith {false};

_markers = [_markers] call FUNC(organizeMarkers);

[_settings, "marker", _markers] call CBA_fnc_hashSet;

true
