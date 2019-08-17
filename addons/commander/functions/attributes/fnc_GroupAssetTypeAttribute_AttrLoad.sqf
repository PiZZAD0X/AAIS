#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _group = ((get3DENSelected "group") select 0);
private _ctrlCombo = (_control controlsGroupCtrl 100);
private _assetType = _value;
LOG_2("_unit: %1 _assetType: %2",_unit,_assetType);
SETVAR(_group,GroupAssetType,_assetType);
private _assetTypes = [
    ["Automatic","AUTO"],
    ["Scouts","SCOUT"],
    ["Infantry","INF"],
    ["Motorized Infantry","MOTORINF"],
    ["Mechanized Infantry","MECHINF"],
    ["Armour","ARMOUR"]
];

{
    _x params ["_name","_data"];
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_data];
    _ctrlCombo lbsetValue [_index,_forEachIndex];
    if (_assetType isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _assetTypes;
