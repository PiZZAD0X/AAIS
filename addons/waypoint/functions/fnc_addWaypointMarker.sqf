/*
 * Author: TheMagnetar
 * Adds a waypoint marker to the group.
 *
 * Arguments:
 * 0: Group <OBJECT> (Default: grpNull)
 * 1: Marker <STRING> (Default: "")
 * 2: Marker weight <NUMBER> (Default: 0)
 *
 * Return Value:
 * Operation successful <BOOL>
 *
 * Example:
 * [group1, "marker1", 50] call aais_waypoint_fnc_addWaypointMarker
 *
 * Public: Yes
 */
 #include "script_component.hpp"
 EXEC_CHECK(SERVERHC);

params [
    ["_group", grpNull, [grpNull]],
    ["_marker", "", [""]],
    ["_markerWeight", 0, [0]]
];

if (!local _group || {(getMarkerColor _marker) isEqualTo ""} || {_markerWeight isEqualTo 0}) exitWith { false };

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _markers = [_settings, "marker"] call CBA_fnc_hashGet;

_markers append [_marker, _markerWeight];

_markers = [_markers] call FUNC(organizeMarkers);

[_settings, "marker", _markers] call CBA_fnc_hashSet;

true
