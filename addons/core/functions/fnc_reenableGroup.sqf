#include "script_component.hpp"
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

params ["_group"];

if (!local _group) exitWith {
    ERROR_1("Group %1 is not local",_group);
};

if ((_group getVariable [QGVAR(settings), []]) isEqualTo []) exitWith {
    ERROR_1("Group %1 has not been initialised",_group);
};

_group setVariable [QGVAR(enabled), true];
