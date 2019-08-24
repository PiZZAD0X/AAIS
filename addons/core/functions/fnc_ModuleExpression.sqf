#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Stores a module expression value
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Property name <STRING>
 * 2: Value <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "aishootme", 1.0] call aais_core_fnc_moduleExpression
 *
 * Public: No
 */

params ["_obj", "_propertyName", "_value"];

_obj setVariable [_propertyName, _value, true];
