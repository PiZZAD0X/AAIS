#include "script_component.hpp"
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

params ["_group"];

private _settings = _group getVariable [QEGVAR(core,settings), []];

private _allowWater = [_settings, "allowWater"] call CBA_fnc_hashGet;
private _allowLand = [_settings, "allowLand"] call CBA_fnc_hashGet;
private _forceRoads = [_settings, "forceRoads"] call CBA_fnc_hashGet;
private _area = [_settings, "area"] call CBA_fnc_hashGet;
private _target = [_area, [_allowWater, _allowLand, _forceRoads], [0, 50, (leader _group)]] call EFUNC(waypoint,areaRandomPos);
[_group, _target] call CBA_fnc_taskDefend;
