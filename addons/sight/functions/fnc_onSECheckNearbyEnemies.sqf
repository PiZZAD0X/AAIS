#include "script_component.hpp"

params ["_unit"];

private _enemyInRange = GETVAR(_unit,enemyInRange,[]);
private _nearestEnemy = [_enemyInRange,vehicle _unit,true] call EFUNC(Core,closestObject);
private _enemyCloseDistance = vehicle _unit distance2d _nearestEnemy;
private _closeTargets = _enemyInRange select {(_unit distance2d _x) <= (_enemyCloseDistance * 1.2)};
private _chosenTarget = selectRandom _closeTargets;
private _enemyDistance = vehicle _unit distance2d _chosenTarget;

SETVAR(_unit,enemyTarget,_chosenTarget);
SETVAR(_unit,enemyDistance,_enemyDistance);




