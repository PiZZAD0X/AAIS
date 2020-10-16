#include "script_component.hpp"
EDEN_CHECK;

params ["_control"];

private _ctrl = _control controlsGroupCtrl 100;
private _value = _ctrl lbData lbCurSel _ctrl;
private _group = get3DENSelected "group" select 0;
SETVAR(_group,Task,_value);
_value
