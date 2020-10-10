#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Initialises a group.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Marker <STRING> (default: "")
 * 2: Unit type <STRING> (default: "infantry")
 * 3: Options <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player, "marker", "wheeled"] call aais_core_fnc_init
 *
 * Public: Yes
 */

// Execute only on HCs or Servers
if (hasInterface && {!isServer}) exitWith {
    ERROR("Init function called in a client during a multiplayer session.")
};

params [
    ["_unit", objNull, [objNull]],
    ["_area", [], [[]]],
    ["_type", "infantry", [""]],
    ["_options", [], [[]]]
];

// Only execute where the group is local
private _group = group _unit;
if (!local _group) exitWith {};

// Create default values for the group
private _settings = [] call CBA_fnc_hashCreate;
_settings = [_settings, _area, _type] call FUNC(setBasicSettings);

[_settings, "behaviour", [behaviour (leader _group)]] call CBA_fnc_hashSet;
[_settings, "combatMode", [combatMode _group]] call CBA_fnc_hashSet;
[_settings, "formation", [formation _group]] call CBA_fnc_hashSet;
[_settings, "speed", [speedMode _group]] call CBA_fnc_hashSet;

_settings = [_settings, _options] call FUNC(parseOptions);
[_group, _settings] call FUNC(applyOptionsPreSpawn);
[_group, _settings] call FUNC(applyOptions);

_group setVariable [QGVAR(settings), _settings];

if !([_settings, "release"] call CBA_fnc_hashGet) then {
    _group setVariable [QGVAR(enabled), true];
};
