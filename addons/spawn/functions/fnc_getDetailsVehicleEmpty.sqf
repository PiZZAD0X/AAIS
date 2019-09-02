#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets info from empty vehicle
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Vehicle Position <ARRAY>
 *
 * Return Value:
 * Vehicle Info <ARRAY>
 *
 * Public: No
 */

params ["_veh",["_pos",[],[[]]]];

private _vehInit = (GETVAR(_veh,Init,""));
if (typename _vehInit isEqualTo "STRING") then {_vehInit = compile _vehInit;};
if (_pos isEqualTo []) then {_pos = (getposATL _veh)};
[typeOf _veh,
getposATL _veh,
vectorDir _veh,
vectorUp _veh,
damage _veh,
fuel _veh,
magazinesAllTurrets _veh,
locked _veh,
surfaceIsWater (getposATL _veh),
(GETVAR(_veh,Name,"")),
(GETVAR(_veh,Persistent,true)),
_vehInit]
