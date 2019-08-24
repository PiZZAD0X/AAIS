#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Returns an array of near enemies from a unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Position <OBJECT><ARRAY>
 *
 * Return Value:
 * Nearest known enemy <OBJECT>
 *
 * Example:
 * [player, player] call aais_behaviour_fnc_getNearestEnemy
 * [player, [0, 0, 0]] call aais_behaviour_fnc_getNearestEnemy
 *
 * Public: No
 */

params ["_unit", "_position"];

// TODO: This is a temporary function state. This function should also make use of shared enemy positions and possibly make use of cached
// values to avoid using expensive commands.
// QGVAR(knownEnemies) is a variable storing shared enemy positions

_unit findNearestEnemy _position
