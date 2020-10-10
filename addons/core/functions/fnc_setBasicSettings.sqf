#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Sets the basic setting parameters.
 *
 * Arguments:
 * 0: Settings <HASH>
 * 1: Marker <STRING>
 * 2: Group type <STRING>
 *
 * Return Value:
 * Hash with basic settings <HASH>
 *
 * Example:
 * [[], "marker", "infantry"] call aais_core_fnc_init
 *
 * Public: No
 */

params ["_settings", "_area", "_type"];

_area params ["_pos","_radiusX","_radiusY","_direction","_isRectangle"];
private _largerRadius = if (_radiusX > _radiusY) then {_radiusY} else {_radiusX};

if !([_settings] call CBA_fnc_isHash) exitWith {
    WARNING_1("Passed argument is not a valid CBA Hash: %1",_settings);
    _settings
};

[_settings, "blacklist", []] call CBA_fnc_hashSet;
[_settings, "fullCache", false] call CBA_fnc_hashSet;
[_settings, "area", _area] call CBA_fnc_hashSet;
[_settings, "type", _type] call CBA_fnc_hashSet;

[_settings, "skillLeader", []] call CBA_fnc_hashSet;
[_settings, "skill", []] call CBA_fnc_hashSet;

[_settings, "task", QEGVAR(tasks,patrolRandom)] call CBA_fnc_hashSet;

[_settings, "allowWater", false] call CBA_fnc_hashSet;
[_settings, "allowLand", true] call CBA_fnc_hashSet;
[_settings, "forceRoads", false] call CBA_fnc_hashSet;

[_settings, "randomBehaviour", true] call CBA_fnc_hashSet;
[_settings, "waitAtWaypoint", true] call CBA_fnc_hashSet;
[_settings, "allowVehicles", true] call CBA_fnc_hashSet;
[_settings, "patrolBuildings", true] call CBA_fnc_hashSet;
[_settings, "spawnInBuilding", false] call CBA_fnc_hashSet;
[_settings, "randomPosition", false] call CBA_fnc_hashSet;
[_settings, "reinforcement", true] call CBA_fnc_hashSet;
[_settings, "execWaypoint", ""] call CBA_fnc_hashSet;
[_settings, "perimeterSettings", [[_pos] call CBA_fnc_getPos, _largerRadius]] call CBA_fnc_hashSet;

[_settings, "init", ""] call CBA_fnc_hashSet;
[_settings, "preSpawn", ""] call CBA_fnc_hashSet;

[_settings, "template", ""] call CBA_fnc_hashSet;
[_settings, "createTemplate", ""] call CBA_fnc_hashSet;

[_settings, "release", false] call CBA_fnc_hashSet;


_settings
