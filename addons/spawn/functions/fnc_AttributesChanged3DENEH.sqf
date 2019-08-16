#include "script_component.hpp"
EXEC_CHECK(ALL);
EDEN_CHECK;

params ["_unit"];

private _valueArray = [
    ["UnitPos",0]
];

{
    _x params ["_varName","_defaultValue"];
    LOG_3("_unit:%1 _varName:%2 _value:%3",_unit,_varName,_defaultValue);
    private _valueReturn = _unit get3DENAttribute _varName;
    LOG_3("_unit:%1 _varName:%2 _value:%3",_unit,_varName,_valueReturn);
    if (_valueReturn isEqualTo []) exitwith {};
    private _hiddenVarName = format ["%1_%2_%3_Hidden",PREFIX,COMPONENT,_varName];
    private _value = _valueReturn select 0;
    LOG_3("_unit:%1 _hiddenVarName:%2 _value:%3",_unit,_hiddenVarName,_value);
    if (_value != _defaultValue) then {
        _unit set3DENAttribute [_hiddenVarName,_value];
    };
} foreach _valueArray;