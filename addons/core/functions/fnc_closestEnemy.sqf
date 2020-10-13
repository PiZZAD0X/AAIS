#include "script_component.hpp"


params [
	["_unit",objnull,[objnull]],
	["_randomSelect", false, [false]]
];

private _group = group _unit;
private _enemyArray = [_group] call FUNC(EnemyArray);

if (_enemyArray isEqualTo []) exitwith {objnull};

_enemyArray apply {
	[_unit distance2d _x, _x];
};

_enemyArray sort true;

private _selectIndex = if (_randomSelect) then {
	random (count _enemyArray / 2)
} else {
	0
};

private _closestEnemy = (_enemyArray select _selectIndex) select 1;

_closestEnemy
