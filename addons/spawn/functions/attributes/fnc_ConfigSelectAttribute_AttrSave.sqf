#include "script_component.hpp"
EDEN_CHECK;

params ["_control"];

private _value = (_control controlsGroupCtrl 100) lbData lbCurSel (_control controlsGroupCtrl 100);
private _logic = (get3DENSelected "logic") select 0;
SETVAR(_logic,ConfigSelect,_value);
_value
