#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrl","_value","_config"];

params ["_ctrl"];

[_ctrl] spawn {
    disableSerialization;
    params ["_ctrl"];
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;
    private _allControls = (allcontrols (ctrlparent _ctrl)) select {ctrlParentControlsGroup ctrlParentControlsGroup _x isEqualto _ctrlGroup};
    LOG_1("_allControls: %1",_allControls);
    {
        private _name = ctrlClassName _x;
        private _isCategory = _name isEqualTo "Minimize";
        if (_isCategory) then {
            private _checked = cbChecked _x;
            if (_checked) then {
                ctrlActivate _x;
            };
        };
        _x ctrlenable false;
        _x ctrlsetfade 0.75;
        _x ctrlshow false;
        _x ctrlcommit 0;
        ctrlsetfocus _x;
        ctrlsetfocus _ctrl;
    } foreach _allControls;
};