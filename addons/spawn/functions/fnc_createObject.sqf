#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Creates group from zone array format
 *
 * Arguments:
 *
 * Return Value:
 * Group <GROUP>
 *
 * Public: No
 */

 params [
    "_objClass",
    "_objpos",
    "_vectorDir",
    "_vectorUp",
    "_damage",
    "_objInWater",
    "_objName",
    ["_init", false, [false,{}]],
    "_storedVars",
    "_name"
];

private _object = createVehicle [_objClass,_objpos,[],0,"CAN_COLLIDE"];
_object setVectorDirAndUp [_vectorDir,_vectorUp];
_object setPosATL _objpos;

if !(_name isEqualTo "") then {
    private _uniqueName = [_name] call FUNC(findUniqueName);
    missionNamespace setVariable [_uniqueName, _object, true];
};

_object setDamage _damage;

if (_init isEqualType {}) then {
     //SETVAR(_vehicle,Init,_vehInit);
     _object call _init;
 };

if !(_storedVars isEqualTo []) then {
    //LOG_1("Setting vars: %1",_storedVars);
    {
        _x params ["_varName", "_varValue"];
        _object setvariable [_varName,_varValue];
        //LOG_2("Setting _varName: %1 with: %2",_varName,_varValue);
    } forEach _storedVars;
};

_object