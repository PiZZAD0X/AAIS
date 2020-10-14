#include "script_component.hpp"
EDEN_CHECK;

params ["_control", "_config"];

private _logic = (get3DENSelected "logic") select 0;
private _ctrlCombo = _control controlsGroupCtrl 100;
SETVAR(_logic,ConfigSelect,_config);
private _configs = [];
configproperties [missionConfigFile >> "CfgGroupCompositions", "isclass _x"] apply {
    private _cfg = _x;
    if !(
        [
            "leaders",
            "units",
            "crew",
            "cargoLeaders",
            "cargo"
        ] findIf {
            ([_cfg, _x,[]] call BIS_fnc_returnConfigEntry) isEqualTo []
        } == -1
    ) then {
        _configs pushBackUnique (configName _x);
    };
};
configproperties [configfile >> "CfgGroupCompositions", "isclass _x"] apply {
    private _cfg = _x;
    if !(
        [
            "leaders",
            "units",
            "crew",
            "cargoLeaders",
            "cargo"
        ] findIf {
            ([_cfg, _x,[]] call BIS_fnc_returnConfigEntry) isEqualTo []
        } == -1
    ) then {
        _configs pushBackUnique (configName _x);
    };
};

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
