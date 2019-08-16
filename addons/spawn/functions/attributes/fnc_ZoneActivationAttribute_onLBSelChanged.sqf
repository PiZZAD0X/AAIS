#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrlCombo","_cursel"];

private _activationType = _ctrlCombo lbData _cursel;
private _logic = ((get3denselected 'logic') select 0);
SETVAR(_logic,ActivationType,_activationType);

_this spawn {
    disableserialization;
    params ["_ctrlCombo","_cursel"];
    private _activationType = _ctrlCombo lbData _cursel;
    private _logic = ((get3denselected "logic") select 0);
    private _logicType = typeOf _logic;
    private _cfgAttributes = (configfile >> "CfgVehicles" >> _logicType >> "Attributes");
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;
    private _allControls = (allcontrols (ctrlparent _ctrlCombo)) select {ctrlParentControlsGroup _x isEqualto _ctrlGroup};
    private _n = 0;
    {
        private _cfg = _cfgAttributes select _n;
        private _ctrl = _x;
        _n = _n + 1;
        private _activationTypes = getarray (_cfg >> "activationTypes");
        private _state = ((_activationTypes isEqualTo []) || (_activationType in _activationTypes));
        private _fade = [0.75,0] select _state;
        _ctrl ctrlenable _state;
        _ctrl ctrlsetfade _fade;
        _ctrl ctrlcommit 0;
        ctrlsetfocus _ctrl;
        ctrlsetfocus _ctrlCombo;
    } foreach _allControls;
};
