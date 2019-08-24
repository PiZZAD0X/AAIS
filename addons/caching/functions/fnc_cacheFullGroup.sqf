#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Caches all units and vehicles in a group.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1] call aais_cache_fnc_cacheFullGroup
 *
 * Public: No
 */

params ["_group"];

if (_group getVariable [QGVAR(fullCached), false]) exitWith {};

_group setVariable [QGVAR(cached), false];
_group setVariable [QGVAR(fullCached), true];

private _units = units _group;
_units append ([_group] call EFUNC(vehicle,getGroupVehicles));

{
    _x enableSimulationGlobal false;
    _x hideObjectGlobal true;
} forEach _units;
