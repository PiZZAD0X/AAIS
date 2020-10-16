#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrl","_value"];

private _ctrlCheckbox = (_ctrl controlsGroupCtrl 100);
_ctrlCheckbox cbSetChecked _value;
private _logic = (get3denselected 'logic') select 0;
SETVAR(_logic,ActivationType,_activationType);

[_ctrlCheckbox, _logic, _value] spawn {
    disableserialization;
    params ["_ctrlCheckbox", "_logic", "_value"];
    private _logicType = typeOf _logic;
    private _cfgAttributes = (configfile >> "CfgVehicles" >> _logicType >> "Attributes");
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;
    private _allControls = (allcontrols ctrlparent _ctrlCheckbox) select {
        ctrlParentControlsGroup _x isEqualto _ctrlGroup
    };
    private _n = 0;
    _value = [0,1] select _value;
    _allControls apply {
        private _cfg = _cfgAttributes select _n;
        private _ctrl = _x;
        _n = _n + 1;
        private _randomMode = [_cfg, "randomMode", -1] call BIS_fnc_returnConfigEntry;
        private _state = (_randomMode isEqualTo -1 || {_value isEqualTo _randomMode});
        private _fade = [0.75,0] select _state;
        _ctrl ctrlenable _state;
        _ctrl ctrlsetfade _fade;
        _ctrl ctrlcommit 0;
        ctrlsetfocus _ctrl;
        ctrlsetfocus _ctrlCheckbox;
    };
};
