/*
 * Author: TheMagnetar
 * Handles entered. Inspired by FUPS.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onFlank
 *
 * Public: No
 */
 #include "script_component.hpp"

params ["_group"];

if !(CBA_missionTime >= (_group getVariable [QGVAR(nextCheckTime), CBA_missionTime])) exitWith {};

if ((units _group) findIf {alive _x} == -1) exitWith {deleteGroup _group;};

if (!local _group) exitWith {
    _group setVariable [QGVAR(targetPos), _group getVariable [QGVAR(targetPos)], true];
};

private _leader = leader _group;
if (_leader distance (_group getVariable QGVAR(targetPos)) < CLOSE_ATTACK_DISTANCE) exitWith {
     [QGVAR(taskAttack), _group] call CBA_fnc_localEvent;
};

// Perform the next check in 5 seconds
_group setVariable [QGVAR(nextCheckTime), CBA_missionTime + 1];
