/*
 * Author: TheMagnetar
 * Reenables AI management for the specified group.
 *
 * Arguments:
 * 0: Group <OBJECT> (Default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_core_fnc_reenableGroup
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_group"];

if (!local _group) exitWith {};

if ((_group getVariable [QGVAR(settings), []]) isEqualTo []) exitWith {
    ERROR_1("Group %1 has not been initialised",_group);
};

_group setVariable [QGVAR(enabled), true];
