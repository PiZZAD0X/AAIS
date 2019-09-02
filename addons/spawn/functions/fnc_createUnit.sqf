#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Creates unit from entity array format
 *
 * Arguments:
 *
 * Return Value:
 * Unit <OBJECT>
 *
 * Public: No
 */

params ["_occupy","_grp","_gpos","_startBld","_i","_unitArgs","_taskRadius",["_currentVeh",objNull,[objNull]],["_initmode",false,[false]]];
_unitArgs params ["_uv","_unitClass","_pos","_vectorDir","_vectorUp","_damage","_editorGear","_vehicle","_vr","_vehicleAssigned","_onWater","_stance","_init","_name","_identity"];

if (_occupy) then {
    _pos = _gpos;
} else {
    if (_startBld && {!_vehicleAssigned}) then {
        _pos = [_gpos,_taskRadius,_i] call FUNC(getStartBuilding);
    };
};
private _unit = _grp createUnit [_unitClass,_pos,[],0,"NONE"];
[_unit] join _grp;
_unit disableAI "Path";
_unit setPosATL _pos;
_unit setVectorDirAndUp [_vectorDir,_vectorUp];
_unit setDamage _damage;
if !(_name isEqualTo "") then {
    missionNamespace setVariable[_name, _unit];
};
_unit setVariable [QGVAR(unitIdentity),_identity,true];
if (_initmode) then {
    _unit call _init;
} else {
    _unit spawn _init;
};
if (isNil QGVAR(ActiveList)) then {
    GVAR(ActiveList) = [_unit];
} else {
    GVAR(ActiveList) append [_unit];
};
_unit setUnitPos _stance;
[_unit, "Hit", {
    _this call FUNC(onAIHit);
}] call CBA_fnc_addBISEventHandler;
if (_vehicleAssigned && {!isNull _currentVeh}) then {
    [_unit,_vr,_currentVeh] call FUNC(setAssignedVehicle);
};

_unit

