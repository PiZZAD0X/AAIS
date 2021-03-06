#include "script_component.hpp"
EDEN_CHECK;

params ["_unit"];

private _valueArray = [
    ["UnitPos", QGVAR(UnitPos), 3],
    ["Name", QGVAR(Name), ""],
    ["Init", QGVAR(Init), ""]
];

_valueArray apply {
    _x params ["_BIvarName", "_varName", "_default"]; // "_defaultValue is the third parameter"
    private _BIvalueReturn = _unit get3DENAttribute _BIvarName;
    if (_BIvalueReturn isEqualTo []) then {
        _BIvalueReturn = [_default];
    };
    private _valueReturn = _unit get3DENAttribute _varName;
    if (_valueReturn isEqualto [] || {!((_valueReturn select 0) isEqualTo (_BIvalueReturn select 0))}) then {
        _unit set3DENAttribute [_varName, _BIvalueReturn select 0];
    };
};

private _valueArrayGroup = [
    ["Name", QGVAR(Name), ""],
    ["Init", QGVAR(Init), ""],
    ["Callsign", QGVAR(Callsign), ""],
    ["Placement", QGVAR(Placement), 0],
    ["CombatMode", QGVAR(CombatMode), "YELLOW"],
    ["Behaviour", QGVAR(Behaviour), "AWARE"],
    ["Formation", QGVAR(Formation), "wedge"],
    ["SpeedMode", QGVAR(SpeedMode), "normal"],
    ["DynamicSimulation", QGVAR(DynamicSimulation), true]
];

_valueArrayGroup apply {
    _x params ["_BIvarName", "_varName", "_default"];
    private _group = group _unit;
    private _BIvalueReturn = _group get3DENAttribute _BIvarName;
    if (_BIvalueReturn isEqualTo []) then { 
        _BIvalueReturn = [_default];
    };
    private _valueReturn = _group get3DENAttribute _varName;
    if (_valueReturn isEqualto [] || {!((_valueReturn select 0) isEqualTo (_BIvalueReturn select 0))}) then {
        _group set3DENAttribute [_varName, _BIvalueReturn select 0];
    };
};
