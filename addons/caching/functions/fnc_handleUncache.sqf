/*
 * Author: TheMagnetar
 * Handles groups that are not cached
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1] call aais_cache_fnc_handleCache
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_group"];

// Only when unit is local
if (!local _group) exitWith {
    _group setVariable [QGVAR(cached), false, true];
    _group setVariable [QEGVAR(core,leader), leader _group, true];
};

if (CBA_missionTime < (_group getVariable [QGVAR(lastCheck), CBA_missionTime])) exitWith {};

// Check in 10 seconds
_group setVariable [QGVAR(lastCheck), CBA_missionTime + 1];

if ([_group] call FUNC(shouldCache)) then {
    [QGVAR(cache), _group] call CBA_fnc_localEvent;
};
