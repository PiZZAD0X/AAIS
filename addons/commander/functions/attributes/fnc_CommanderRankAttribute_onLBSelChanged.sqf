#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrlCombo","_cursel"];

private _rank = _ctrlCombo lbData _cursel;
private _unit = ((get3DENSelected "object") select 0);
SETVAR(_unit,CommanderRank,_rank);
