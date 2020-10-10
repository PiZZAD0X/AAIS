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

 params [
     "_occupy",
     "_group",
     "_gpos",
     "_startBld",
     "_i",
     "_unitArgs",
     "_taskRadius"
 ];
 
 _unitArgs params [
     "_unitClass",
     "_unitPos",
     "_unitVectorDir",
     "_unitVectorUp",
     "_damage",
     "_editorGear",
     "_handcuffed",
     "_unitOnWater",
     "_unitStance",
     ["_init", false, [false,{}]],
     "_name",
     ["_identity", [], [[]]],
     "_storedVars",
     ["_varName", "", [""]],
     ["_olsenGearType", "", [""]]
 ];

 if (_occupy) then {
     LOG_1("%1 set to occupy",_unitClass);
     _unitPos = _gpos;
 } else {
     if (_startBld) then {
         _unitPos = [_gpos,_taskRadius,_i] call FUNC(getStartBuilding);
     };
 };

 private _unit = _group createUnit [_unitClass, _unitPos, [], 0, "CAN_COLLIDE"];
 [_unit] joinSilent _group;
 _unit disableAI "Path";
 _unit setPosATL _unitPos;
 if (_olsenGearType isEqualTo "") then {
     if (_editorGear isEqualTo []) then {
         ERROR_1("Empty gear for:%1",_unit);
     } else {
         _unit setUnitLoadout _editorGear;
     };
 } else {
     [_unit, _olsenGearType] call EFUNC(FW,gearScript);
 };
 private _VecDirUp = [_unitVectorDir,_unitVectorUp];
 _unit setVectorDirAndUp _VecDirUp;
 SETVAR(_unit,VecDirUp,_VecDirUp);
 _unit setDamage _damage;
 if (_handcuffed) then {
     [_unit,_handcuffed] call ACE_captives_fnc_setHandcuffed;
 };

 if !(_varName isEqualTo "") then {
     private _uniqueName = [_varName] call FUNC(findUniqueName);
     missionNamespace setVariable [_uniqueName, _unit, true];
     SETVAR(_unit,customName,_uniqueName);
 };

 if !(_storedVars isEqualTo []) then {
     _storedVars apply {
         _x params ["_varName", "_varValue"];
         _unit setvariable [_varName,_varValue];
     };
 };

 if !(_unitStance isEqualTo "AUTO") then {
     SETVAR(_unit,unitStance,_unitStance);
 };
 if !(_editorGear isEqualTo []) then {
     SETVAR(_unit,identityArray,_identity);
 };
 if (_init isEqualType {}) then {
     SETVAR(_unit,unitInit,_init);
 };
 SETVAR(_unit,spawned,true);

 _unit
