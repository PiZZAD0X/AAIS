/*
 * Author: TheMagnetar
 * Function called when entering disembark state.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onDisembarkStateEntered
 *
 * Public: No
 */
 #include "script_component.hpp"

params ["_group", "_state"];

private _vehicles = [_group] call EFUNC(vehicle,getGroupVehicles);

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _allowWater = [_settings, "allowWater"] call CBA_fnc_hashGet;
private _allowLand = [_settings, "allowLand"] call CBA_fnc_hashGet;

{
    [_x, true, true, false, _allowLand, _allowWater] call EFUNC(vehicle,disembark);
} forEach _vehicles;
