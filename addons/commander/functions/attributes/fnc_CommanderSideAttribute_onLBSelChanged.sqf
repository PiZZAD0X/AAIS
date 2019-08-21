#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrlCombo","_cursel"];

private _side = _ctrlCombo lbData _cursel;
SETMVAR(CommanderSide,_side);
