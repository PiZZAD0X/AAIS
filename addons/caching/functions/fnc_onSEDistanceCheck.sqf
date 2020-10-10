#include "script_component.hpp"

params ["_group"];

private _leader = leader _group;
private _enemyInRange = false;
private _enemyArray = if (GETMVAR(CacheAllPlayers,true)) then {
	[] call BIS_fnc_listPlayers;
} else {
	_group call EFUNC(behaviour,EnemyArray);
};

if !(_enemyArray isEqualTo []) then {
	_enemyInRange = !((_enemyArray select {(vehicle _leader distance2d _x) <= (GETMVAR(CacheDisableDistance,3000))}) isEqualTo []);
};

SETVAR(_group,enemyInRange,_enemyInRange);