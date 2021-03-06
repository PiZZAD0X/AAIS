#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Checks if a group should start doing something
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * Do task? <BOOL>
 *
 * Example:
 * [group player] call aais_tasks_fnc_checkDoTask
 *
 * Public: No
 */

params ["_group", ""];

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _task = [_settings, "task"] call CBA_fnc_hashGet;

!(_task isEqualTo "donothing")
