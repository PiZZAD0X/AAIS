#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrlCombo","_cursel"];

private _value = _ctrlCombo lbData _cursel;
SETMVAR(CommanderAssignMode,_value);
