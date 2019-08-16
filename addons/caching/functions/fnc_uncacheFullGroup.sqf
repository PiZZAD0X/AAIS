/*
 * Author: TheMagnetar
 * Uncaches all units and vehicles in a group.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1] call aais_cache_fnc_uncacheFullGroup
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_group"];

if !(_group getVariable [QGVAR(fullCached), false]) exitWith {};

_group setVariable [QGVAR(fullCached), false, true];

private _units = units _group;
_units append ([_group] call EFUNC(vehicle,getGroupVehicles));

{
    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;
} forEach _units;
