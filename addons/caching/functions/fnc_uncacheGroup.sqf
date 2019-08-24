#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Caches all units in a group except the leader or the driver
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1] call aais_cache_fnc_uncacheGroup
 *
 * Public: No
 */

params ["_group"];

_group setVariable [QGVAR(cached), false];

{
    if (simulationEnabled _x) exitWith {};

    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;
    if (vehicle _x == _x) then {
        _x setPosATL (formationPosition _x);
    };
} forEach (units _group);
