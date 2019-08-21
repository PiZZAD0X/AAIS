#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _ctrlCombo = (_control controlsGroupCtrl 100);
private _sides = [
    ["Opfor","EAST","a3\ui_f\data\map\diary\icons\playereast_ca.paa"],
    ["Blufor","WEST","a3\ui_f\data\map\diary\icons\playerwest_ca.paa"],
    ["Indfor","INDEPENDENT","a3\ui_f\data\map\diary\icons\playerguer_ca.paa"],
    ["Civilian","CIVILIAN","a3\ui_f\data\map\diary\icons\playerciv_ca.paa"]
];

{
    _x params ["_name","_data","_icon"];
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_data];
    _ctrlCombo lbSetPicture [_index, _icon];
    if (_value isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _sides;
