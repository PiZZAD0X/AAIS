#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrl","_value","_config"];

private _ctrlCheckbox = (_ctrl controlsGroupCtrl 100);
_ctrlCheckbox cbSetChecked _value;

[_ctrlCheckbox] spawn {
    disableSerialization;
    params ["_ctrlCheckbox"];
    private _state = cbChecked _ctrlCheckbox;
    private _fade = [0.75,0] select _state;
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;
    private _allControls = ((allcontrols (ctrlparent _ctrlCheckbox)) - [ctrlParentControlsGroup _ctrlCheckbox]) select {ctrlParentControlsGroup _x isEqualto _ctrlGroup};
    {
        _x ctrlenable _state;
        _x ctrlsetfade _fade;
        _x ctrlcommit 0;
    } foreach _allControls;
};