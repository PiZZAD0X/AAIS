#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrl"];

private _ctrlCheckbox = (_ctrl controlsGroupCtrl 100);
private _value = cbChecked _ctrlCheckbox;
_value
