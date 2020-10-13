#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Returns an array of near enemies from a unit
 *
 * Arguments:
 * 0: Unit <OBJECT><GROUP>
 * 1: Radius <NUMBER> (default: -1)
 *
 * Return Value:
 * Array of dead bodies <ARRAY>
 *
 * Example:
 * [player, 100] call aais_behaviour_fnc_getNearEnemies
 *
 * Public: No
 */

params ["_unit", ["_radius", -1]];

private _side = side _unit;
private _enemyTargets = [];

{
    private _target = _x select 4;
    if (((_unit knowsAbout _target) > 0) && {((_side getFriend (side _target))) < 0.6}) then {
        _enemyTargets pushBack _target;
    };
} forEach (_unit nearTargets _radius);

_enemyTargets
