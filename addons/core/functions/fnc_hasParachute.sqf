/*
 * Author: TheMagnetar
 * Returns wether a unit has a parachute equipped
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Unit has a rebreather <BOOL>
 *
 * Example:
 * [player] call aais_core_fnc_hasParachute
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _backpack = backpack _unit;

_backpack isKindOf "B_Parachute"
