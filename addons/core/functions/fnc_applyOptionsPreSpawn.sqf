#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Applies the settings to the group before units are spawned
 *
 * Arguments:
 * 0: Group <OBJECT> (Default: objNull)
 * 1: Settings <HASH>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_core_fnc_applyOptionsPreSpawn
 *
 * Public: No
 */

params ["_group", ["_settings", []]];

if (_settings isEqualTo []) then {
    _settings = _group getVariable [QGVAR(settings), []];
};

// PreSpawn code
[_group] call compile ([_settings, "preSpawn"] call CBA_fnc_hashGet);

[_group, _settings] call FUNC(handleStartPosition);
