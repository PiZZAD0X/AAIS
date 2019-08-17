#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _unit = ((get3DENSelected "object") select 0);
private _ctrlCombo = (_control controlsGroupCtrl 100);
private _rank = _value;
LOG_2("_unit: %1 _rank: %2",_unit,_rank);
SETVAR(_unit,CommanderRank,_rank);
private _ranks = [
    ["None","NONE"],
    ["Commander","COMMANDER"],
    ["Executive Officer","XO"]
];

{
    _x params ["_name","_data"];
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_data];
    _ctrlCombo lbsetValue [_index,_forEachIndex];
    if (_rank isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _ranks;
