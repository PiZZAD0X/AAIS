#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Moves all units of a group to the specified position
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1] call aais_core_fnc_moveGroupToPosition
 *
 * Public: No
 */

params ["_group", "_position"];

private _vehicles = [_group] call EFUNC(vehicle,getGroupVehicles);

{
    _x setPosATL (_position findEmptyPosition [0, 60, typeOf _x]);
} forEach _vehicles;

{
    if (vehicle _x == _x) then {
        _x setPosATL (_position findEmptyPosition [0, 60, typeOf _x]);
    };
} forEach (units _group);
