#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _group = ((get3DENSelected "group") select 0);
private _ctrlCombo = (_control controlsGroupCtrl 100);
private _occupyType = _value;
LOG_2("_group: %1 _occupyType: %2",_group,_occupyType);
SETVAR(_group,OccupyType,_occupyType);
private _occupyTypes = [
    ["Off","Off"],
    ["Nearest Building","NearestB"],
    ["Random Building","RandomB"],
    ["Near Group of Buildings","NearGB"],
    ["Random Group of Buildings","RandomGB"],
    ["Near Multiple Buildings","NearMB"],
    ["Random Multiple Buildings","RandomMB"]
];

{
    _x params ["_name","_data"];
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_data];
    _ctrlCombo lbsetValue [_index,_forEachIndex];
    if (_occupyType isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _occupyTypes;
