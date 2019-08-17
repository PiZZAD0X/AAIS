#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrl","_value","_config"];

private _group = ((get3denselected "group") select 0);
private _cfgname = gettext (_config >> "property");
_group setvariable [_cfgname,_value];
private _ctrlCombo = (_ctrl controlsGroupCtrl 100);
_ctrlCombo setvariable [QGVAR(parentcontrolcfg),_config];
private _AreaModules = (all3DENEntities select 3) select {(_x isKindOf QGVAR(AreaModule)) || (_x isKindOf QGVAR(AreaModule_R))};
if (_AreaModules isEqualTo []) exitwith {
    ERROR("No Commander Areas Found!");
    private _name = "No Commander Areas Found";
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,"No Area Selected"];
    _ctrlCombo lbSetCurSel _index;
};

private _AreaModulesList = [];
{
    private _logic = _x;
    private _AreaName = (_logic get3DENAttribute QGVAR(AreaName)) select 0;
    if (_AreaName in _AreaModulesList) then {
        ERROR_1("Duplicate AreaName for Commander Area %1",_AreaName);
    } else {
        _AreaModulesList append [_AreaName];
    };
} foreach _AreaModules;

private _name = "No Area Selected";
private _index = _ctrlCombo lbadd _name;
_ctrlCombo lbsetdata [_index,"No Area Selected"];
if (_value isEqualto (_ctrlCombo lbData _index) || (_value isEqualto "No Commander Areas Found")) then {
    _ctrlCombo lbSetCurSel _index;
};

{
    private _name = _x;
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_name];
    if (_value isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _AreaModulesList;
