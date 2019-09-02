#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets info from objects synced to the module
 *
 * Arguments:
 * 0: New Group Position <ARRAY>
 * 1: Group Leader <OBJECT>
 * 2: Unit <OBJECT>
 *
 * Return Value:
 * Position <ARRAY> 
 *
 * Public: No
 */

 params ["_newPos","_grpldr","_unit"];
 
 private _grpPos = getPosATL _grpldr;
 private _unitPos = getpos _unit;
 private _dist = _grpPos distance _unitPos;
 private _dir = _grpPos getDir _unitPos;
 private _pos = _newPos getpos [_dist, _dir];
 LOG_3("GetNewPos for %1 Old Pos: %2 New: %3",_unit,_newPos,_pos);
 _pos