#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets info from objects
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Object Position <ARRAY>
 *
 * Return Value:
 * Object Info <ARRAY>
 *
 * Public: No
 */

params ["_obj",["_pos",[],[[]]]];

private _objectInit = (GETVAR(_obj,init,""));
if (_objectInit isEqualType "") then {
    _objectInit = compile _objectInit;
};
if (_pos isEqualTo []) then {_pos = (getposATL _obj)};
[typeOf _obj,
getposATL _obj,
vectorDir _obj,
vectorUp _obj,
damage _obj,
surfaceIsWater (getposATL _obj),
_obj getVariable [QGVAR(name),""],
_obj getVariable [QGVAR(persistent),true],
_objectInit]