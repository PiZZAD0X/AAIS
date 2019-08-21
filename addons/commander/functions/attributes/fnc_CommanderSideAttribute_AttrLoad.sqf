#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _ctrlCombo = (_control controlsGroupCtrl 100);
SETMVAR(CommanderSide,_value);
private _sides = [
    ["Opfor","EAST"],
    ["Blufor","WEST"],
    ["Indfor","INDEPENDENT"],
    ["Civilian","CIVILIAN"]
];

{
    _x params ["_name","_data"];
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_data];
    if (_value isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _sides;
