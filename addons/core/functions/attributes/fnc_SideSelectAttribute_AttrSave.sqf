#include "script_component.hpp"
EDEN_CHECK;

params ["_control"];

private _value = (_control controlsGroupCtrl 100) lbData lbCurSel (_control controlsGroupCtrl 100);
_value