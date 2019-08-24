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
 * [group player] call aais_tasks_fnc_onDoTaskStateEntered
 *
 * Public: No
 */

params ["_group", ""];

private _settings = _group getVariable [QEGVAR(core,settings), []];
[[_settings, "task"] call CBA_fnc_hashGet, _group] call CBA_fnc_localEvent;
