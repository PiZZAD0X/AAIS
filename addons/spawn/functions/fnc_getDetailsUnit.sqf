#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets info from unit
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Object Position <ARRAY>
 * 2: Group Vehicle <OBJECT>
 * 2: Group Stance <STRING>
 *
 * Return Value:
 * Object Info <ARRAY>
 *
 * Public: No
 */

params ["_unit",["_pos",[],[[]]],"_vehicle",["_gStance","AUTO",[""]]];

private _unitInit = (GETVAR(_unit,init,""));
if (_unitInit isEqualType "") then {
    _unitInit = compile _unitInit;
};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
private _stance = "AUTO";
if !(_gStance isEqualTo "AUTO") then {
    _stance = _gStance;
} else {
    _stance = ["DOWN","MIDDLE","UP","AUTO"] select (GETVAR(_unit,unitPos,3));
};

LOG_2("_unit:%1 stance:%2",_unit,_stance);
LOG_4("_unit:%1 name:%2 pos: %3 passedpos: %4",_unit,(name _unit),(getpos _unit),_pos);

[true,
typeOf _unit,
getposATL _unit,
vectorDir _unit,
vectorUp _unit,
damage _unit,
getUnitLoadout _unit,
typeOf _vehicle,
assignedVehicleRole _unit,
_vehAssigned,
surfaceIsWater (getposATL _unit),
_stance,
_unitInit,
GETVAR(_unit,name,""),
GETVAR(_unit,identity,""),
GETVAR(_unit,storedVars,[])]
