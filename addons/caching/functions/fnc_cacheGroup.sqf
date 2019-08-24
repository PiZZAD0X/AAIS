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
 * [group1] call aais_cache_fnc_cacheGroup
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_group"];

_group setVariable [QGVAR(cached), true];

private _leader = leader _group;
{
    if (!(_x isEqualTo _leader) && {!("driver" isEqualTo (assignedVehicleRole _x))}) then {
        _x enableSimulationGlobal false;
        _x hideObjectGlobal true;
    };
} forEach (units _group);
