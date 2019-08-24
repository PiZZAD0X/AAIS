#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Task patrol.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onEmbarkStateEntered
 *
 * Public: No
 */

params ["_group", ""];
private _unitsToEmbark = (units _group) select {vehicle _x == _x && {alive _x}};

if (_unitsToEmbark isEqualTo []) exitWith {};

// Allow units to get in
_unitsToEmbark allowGetIn true;

// If units were patrolling on their own, fall back to following the group leader
_unitsToEmbark doFollow (leader _group);

private _assignedVehicles = _group getVariable [QEGVAR(vehicle,assignedVehicles), objNull];

{
    private _vehicle = _x;
    private _units = _unitsToEmbark select {(_x getVariable [QEGVAR(vehicle,assignedVehicle), objNull]) isEqualTo _vehicle};
    [_x, _units] call EFUNC(vehicle,getInVehicle);
} forEach _assignedVehicles;


