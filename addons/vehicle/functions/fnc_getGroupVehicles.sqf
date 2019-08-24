#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Returns all vehicles of a group
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * Group vehicles <ARRAY>
 *
 * Example:
 * [player] call aais_core_fnc_getGroupVehicles
 *
 * Public: No
 */

params ["_group"];

private _assignedVehicles = [];
{
    if (vehicle _x != _x) then {
        assignedVehicles pushBackUnique (vehicle _x);
        _assignedVehicles pushBackUnique (vehicle _x);
    };
} forEach (units _group);

_assignedVehicles
