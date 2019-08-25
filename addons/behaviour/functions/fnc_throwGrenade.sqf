#include "script_component.hpp"
/*
 * Author: PiZZAD0X, TheMagnetar
 * Determine if a unit throws a grenade or not.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Grenade thrown <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, false] call aais_behaviour_fnc_throwGrenade
 *
 * Public: No
 */

params [["_unit", objNull], ["_grenadeThrown", false]];

if (((random 100) > GVAR(grenadeChance)) || {isNull _unit}) exitwith {};

private _nearestEnemy = _unit call FUNC(getNearestEnemy);

if (_grenadeThrown || {isNull _nearestEnemy}) exitWith {};

private _targetPosition = (_unit targetKnowledge _nearestEnemy) select 6;
private _checkDistance = _unit distance (ASLToAGL _targetPosition);

if ((_checkDistance < 60) && {_checkDistance > 6}) then {
    _unit setDir (_unit getDir _targetPosition);
    _unit forceWeaponFire ["HandGrenadeMuzzle", "HandGrenadeMuzzle"];
    _unit forceWeaponFire ["MiniGrenadeMuzzle", "MiniGrenadeMuzzle"];
};

// TODO: Check if this can result in firing twice!
if (GVAR(useSmoke) && {_checkDistance < 5000}) then {
    _unit setDir (_unit getDir _targetPosition);
    _unit forceWeaponFire ["SmokeShellMuzzle", "SmokeShellMuzzle"];
};

