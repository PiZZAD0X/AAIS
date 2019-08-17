#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrlCombo","_cursel"];

private _task = _ctrlCombo lbData _cursel;
private _group = ((get3DENSelected "group") select 0);
SETVAR(_group,TaskSelect,_task);
