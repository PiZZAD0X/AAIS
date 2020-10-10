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

params [
    "_unit", 
    ["_pos",[],[[]]]
];

private _unitInit = GETVAR(_unit,Init,"");
if ((_unitInit isEqualType "") && {!(_unitInit isEqualTo "")}) then {
     _unitInit = compile _unitInit;
} else {
     _unitInit = false;
};
private _stance = if ((GETVAR(_unit,stance,"Auto")) isEqualTo "Auto") then {
     unitPos _unit
} else {
     GETVAR(_unit,unitStance,"Auto")
};
if (_pos isEqualTo []) then {
     _pos = (getposATL _unit) apply {parseNumber (_x toFixed 2)};
};
private _vectorDir = (vectorDir _unit) apply {parseNumber (_x toFixed 2)};
private _vectorUp = (vectorUp _unit) apply {parseNumber (_x toFixed 2)};
private _damage = parseNumber (damage _unit toFixed 2);
//private _pitch = parseNumber (pitch _unit toFixed 2);
private _identity = [
     name _unit,
     face _unit,
     speaker _unit,
     nameSound _unit,
     pitch _unit
];
private _name = GETVAR(_unit,varName,"");
private _olsenGearType = GETVAR(_unit,gearType,"");
private _vanillaLoadout = if (_olsenGearType isEqualTo "") then {
     []
} else {
     getUnitLoadout _unit
};

[typeOf _unit,
_pos,
_vectorDir,
_vectorUp,
_damage,
_vanillaLoadout,
_unit getVariable ["ACE_captives_isHandcuffed",false],
surfaceIsWater (getposATL _unit),
_stance,
_unitInit,
GETVAR(_unit,Name,""),
_identity,
GETVAR(_unit,storedVars,[]),
_name,
_olsenGearType]
