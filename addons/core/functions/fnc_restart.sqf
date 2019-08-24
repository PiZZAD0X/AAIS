#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Reenables all AI management.
 *
 * Arguments:
 * 0: Group <OBJECT> (Default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_core_fnc_restart
 *
 * Public: Yes
 */

params ["_group"];

if (_group getVariable [QGVAR(settings), []] isEqualTo []) exitWith {
    ERROR_1("Group %1 has not been initialised",_group);
};

_group setVariable [QGVAR(enabled), true];
