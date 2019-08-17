#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrlCheckbox"];

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

