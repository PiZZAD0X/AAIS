#include "script_component.hpp"
EDEN_CHECK;

params ["_control"];

private _value = (_control controlsGroupCtrl 100) lbData lbCurSel (_control controlsGroupCtrl 100);
private _logic = ((get3denselected 'logic') select 0);
SETVAR(_logic,ActivationType,_value);
_value
