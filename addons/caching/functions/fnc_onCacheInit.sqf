/*
 * Author: TheMagnetar
 * Initialises cache state machine.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1] call aais_cache_fnc_onCacheInit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_group"];

_group setVariable [QGVAR(cached), false];

if ([_group] call FUNC(shouldCache)) then {
    [QGVAR(cache), _group] call CBA_fnc_localEvent;
} else {
    [QGVAR(uncache), _group] call CBA_fnc_localEvent;
};
