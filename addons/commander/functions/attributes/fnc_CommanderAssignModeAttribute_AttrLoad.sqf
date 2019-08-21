#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _ctrlCombo = (_control controlsGroupCtrl 100);
SETMVAR(CommanderAssignMode,_value);
private _assignModes = [
    "Fill in Order",
    "Fill Evenly"
];

{
    private _name = _x;
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_name];
    if (_value isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _assignModes;
