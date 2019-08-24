#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Handles groups that are cached
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

params ["_group"];

// Only when unit is local
if (!local _group) exitWith {
    _group setVariable [QGVAR(cached), false, true];
    _group setVariable [QEGVAR(core,leader), leader _group, true];
};

if (CBA_missionTime < (_group getVariable [QGVAR(lastCheck), CBA_missionTime])) exitWith {};

// Check in 10 seconds
_group setVariable [QGVAR(lastCheck), CBA_missionTime + 1];

if !([_group] call FUNC(shouldCache)) then {
    [QGVAR(uncache), _group] call CBA_fnc_localEvent;
} else {

    private _leader = leader _group;

    if (!alive _leader || {_leader != (_group getVariable [QEGVAR(core,leader), leader _group])}) then {
        [QGVAR(leaderChanged), _group] call CBA_fnc_localEvent;
    };

    // Delete cache units that are dead
    if !(((units _group) select {!alive _x} )isEqualTo []) then {
        [QGVAR(deleteUnits), _group] call CBA_fnc_localEvent;
    };

    [QGVAR(moveUnits), _group] call CBA_fnc_localEvent;
};


