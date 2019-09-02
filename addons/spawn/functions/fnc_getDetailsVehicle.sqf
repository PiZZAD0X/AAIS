#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets info from crewed vehicle
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
if (_vehInit isEqualType "") then {
    _vehInit = compile _vehInit;
};
if (_pos isEqualTo []) then {
    _pos = getPosATL _veh;
};

[false,
typeOf _veh,
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
_vehInit,
(GETVAR(_veh,Flying,false)),
(GETVAR(_veh,FlyInHeight,250))]