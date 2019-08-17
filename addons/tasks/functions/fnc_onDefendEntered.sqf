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
 * [group player] call aais_tasks_fnc_onDefendStateEntered
 *
 * Public: No
 */
 #include "script_component.hpp"

params ["_group"];

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _marker = [_settings, "marker"] call CBA_fnc_hashGet;

_marker = [_marker] call EFUNC(waypoint,selectRandomMarker);
[_group, _marker] call CBA_fnc_taskDefend;
