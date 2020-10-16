#include "script_component.hpp"
EDEN_CHECK;

params ["_control"];

private _group = get3DENSelected "group" select 0;
private _ctrlCombo = _control controlsGroupCtrl 100;
private _taskSynced = [_group] call FUNC(isTaskSynced);
private _cfgTasks = "[_x, 'requireModule', -1] call BIS_fnc_returnConfigEntry isEqualTo 1" configClasses (configFile >> "CfgTasks");
TRACE_1("",_cfgTasks);
private _task = GETVAR(_group,Task,"PATROL");

_cfgTasks apply {
    private _displayname = [(configFile >> "CfgTasks" >> _x), "displayName", ""] call BIS_fnc_returnConfigEntry;
    private _taskName = [(configFile >> "CfgTasks" >> _x), "taskName", ""] call BIS_fnc_returnConfigEntry;
    [_displayname,_taskName]
};

_cfgTasks apply {
    params ["_name", "_taskName"];
    if (!(_name isEqualTo "") && {!(_taskName isEqualTo "")}) then {
        private _index = _ctrlCombo lbadd _name;
        _ctrlCombo lbsetdata [_index,_taskName];
        if (_task isEqualto (_ctrlCombo lbData _index)) then {
            _ctrlCombo lbSetCurSel _index;
        };
    };
};


[_ctrlCombo, _taskSynced] spawn {
    disableserialization;
    params ["_ctrlCombo", "_taskSynced"];
    private _cfgAttributes = (configfile >> "cfg3DEN" >> "Group" >> "AttributeCategories" >> QGVAR(GroupTaskBehaviour) >> "Attributes");
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;
    private _allControls = (allcontrols ctrlparent _ctrlCombo) select {
        ctrlParentControlsGroup _x isEqualto _ctrlGroup
    };
    private _n = 0;
    _taskSynced = [0,1] select _taskSynced;
    _allControls apply {
        private _cfg = _cfgAttributes select _n;
        private _ctrl = _x;
        _n = _n + 1;
        private _disableOnTaskSync = [_cfg, "disableOnTaskSync", -1] call BIS_fnc_returnConfigEntry;
        private _state = (_disableOnTaskSync isEqualTo -1 || {_taskSynced isEqualTo _disableOnTaskSync});
        private _fade = [0.75,0] select _state;
        _ctrl ctrlenable _state;
        _ctrl ctrlsetfade _fade;
        _ctrl ctrlcommit 0;
        ctrlsetfocus _ctrl;
        ctrlsetfocus _ctrlCombo;
    };
};
