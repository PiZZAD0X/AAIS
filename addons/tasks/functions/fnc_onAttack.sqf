/*
 * Author: TheMagnetar
 * Task defend.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onAttackState
 *
 * Public: No
 */
 #include "script_component.hpp"
 EXEC_CHECK(SERVERHC);

params ["_group"];

if (!local _group) exitWith {};

if !(CBA_missionTime >= (_group getVariable [QGVAR(nextCheckTime), CBA_missionTime])) exitWith {};

if ((units _group) findIf {alive _x} == -1) exitWith {deleteGroup _group;};

private _targetPos = _group getVariable QGVAR(targetPos);
private _distance = (leader _group) distance _targetPos;

// TODO: Add reinforcement check

// Perform the next check in 5 seconds
_group setVariable [QGVAR(nextCheckTime), CBA_missionTime + 1];
