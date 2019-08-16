/*
 * Author: TheMagnetar
 * Spawns a group of units.
 *
 * Arguments:
 * 0: Unit array. First position is always the leader <ARRAY> (Default: [])
 * 1: Marker <STRING> (default: "")
 * 2: Unit type <STRING> (default: "")
 * 3: Unit side <STRING> (default: "")
 * 4: Position <ARRAY><OBJECT><LOCATION><GROUP> (default: [])
 * 5: Group options <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [units, "marker", "infantry", "west"] call aais_spawn_fnc_spawnGroup
 *
 * Public: Yes
 */
#include "script_component.hpp"
EXEC_CHECK(SERVERHC);

params [
    ["_units", [], [[]]],
    ["_marker", "", ["", []]],
    ["_type", "", [""]],
    ["_side", "", [""]],
    ["_position", [], [[], objNull, grpNull, locationNull], [2, 3]],
    ["_options", [], [[]]]
];

if (!([_marker] call EFUNC(waypoint,checkMarkerInput))) exitWith {};

private _settings = [] call CBA_fnc_hashCreate;
_settings = [_settings, _marker, _type] call EFUNC(core,setBasicSettings);
[_settings, _options] call EFUNC(core,parseOptions);

GVAR(spawnQueue) pushBack [_units, _side, _position, _settings];

if (GVAR(spawnGroupPFH) == -1) then {
    GVAR(spawnGroupPFH) = [DFUNC(spawnGroupPFH), 1, []] call CBA_fnc_addPerFrameHandler;
};