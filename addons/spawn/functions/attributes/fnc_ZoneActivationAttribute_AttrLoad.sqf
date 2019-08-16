#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _logic = ((get3denselected "logic") select 0);
private _ctrlCombo = (_control controlsGroupCtrl 100);
private _activationType = _value;
LOG_2("_logic: %1 _activationType: %2",_logic,_activationType);
SETVAR(_logic,ActivationType,_activationType);
private _activationTypes = [["Initial","Initial"],["Conditional","Conditional"],["Custom Conditional","CustomConditional"],["Custom","Custom"]];
{
    _x params ["_name","_string"];
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_string];
    _ctrlCombo lbsetValue [_index,_forEachIndex];
    if (_activationType isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _activationTypes;
