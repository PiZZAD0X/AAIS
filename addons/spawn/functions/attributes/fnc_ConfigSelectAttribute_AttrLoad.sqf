#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _logic = ((get3DENSelected "logic") select 0);
private _ctrlCombo = (_control controlsGroupCtrl 100);
private _config = _value;
SETVAR(_logic,ConfigSelect,_config);
private _configs = [];
{
    if !(
        (([_x,"leaders",[]] call BIS_fnc_returnConfigEntry) +
        ([_x,"units",[]] call BIS_fnc_returnConfigEntry) +
        ([_x,"crew",[]] call BIS_fnc_returnConfigEntry) +
        ([_x,"cargoLeaders",[]] call BIS_fnc_returnConfigEntry) +
        ([_x,"cargo",[]] call BIS_fnc_returnConfigEntry)) isEqualTo []
    ) then {
        _configs pushBackUnique (configName _x);
    };
} foreach configproperties [missionConfigFile >> "CfgGroupCompositions", "isclass _x"];
{
    if !(
        (([_x,"leaders",[]] call BIS_fnc_returnConfigEntry) +
        ([_x,"units",[]] call BIS_fnc_returnConfigEntry) +
        ([_x,"crew",[]] call BIS_fnc_returnConfigEntry) +
        ([_x,"cargoLeaders",[]] call BIS_fnc_returnConfigEntry) +
        ([_x,"cargo",[]] call BIS_fnc_returnConfigEntry)) isEqualTo []
    ) then {
        _configs pushBackUnique (configName _x);
    };
} foreach configproperties [configfile >> "CfgGroupCompositions", "isclass _x"];

private _name = "None Selected";
private _index = _ctrlCombo lbadd _name;
_ctrlCombo lbsetdata [_index,"NONE"];
if (_config isEqualto (_ctrlCombo lbData _index)) then {
    _ctrlCombo lbSetCurSel _index;
};

{
    private _name = _x;
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_name];
    if (_config isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _configs;
