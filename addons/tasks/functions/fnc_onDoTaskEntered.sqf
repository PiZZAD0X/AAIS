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
 * [group player] call aais_tasks_fnc_onDoTaskStateEntered
 *
 * Public: No
 */
 #include "script_component.hpp"
 EXEC_CHECK(SERVERHC);

params ["_group", "_state"];

private _settings = _group getVariable [QEGVAR(core,settings), []];
[[_settings, "task"] call CBA_fnc_hashGet, _group] call CBA_fnc_localEvent;
