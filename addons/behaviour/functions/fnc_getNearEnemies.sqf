#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Returns an array of near enemies from a unit
 *
 * Arguments:
 * 0: Unit <OBJECT><ARRAY>
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

// TODO: This is a temporary function state. This function should also make use of shared enemy positions and possibly make use of cached
// values to avoid using expensive commands.
// QGVAR(knownEnemies) is a variable storing shared enemy positions

private _targets = _unit nearTargets _radius;

_targets
