#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Handles entered. Inspired by FUPS.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onFlankEntered
 *
 * Public: No
 */

params ["_group"];

private _targetPos = _group getVariable QGVAR(targetPos);
private _leader = leader _group;

// Try to flank
private _dir = _leader getDir _targetPos;
_dir = if (random 1 < .5) then {_dir + 90} else {_dir - 90};

private _currentPos = getPosATL _leader;
private _dist = ((_currentPos distance _targetPos) * 2 / 3) min 200;
_targetPos = _currentPos getPos [_dist, _dir];

_group move _targetPos;
