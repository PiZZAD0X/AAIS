#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Share enemy positions with other groups of the same side.
 *
 * Arguments:
 * 0: Group <OBJECT>
 * 1: Radius <NUMBER> (default: -1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player, 100] call aais_behaviour_fnc_shareEnemyPositions
 *
 * Public: No
 */

params ["_group", ["_radius", -1]];

private _knownEnemies = _group getVariable [QGVAR(knownEnemies), []];
if (_knownEnemies isEqualTo []) exitWith {};

if (_radius == -1) then {
    _group getVariable [QGVAR(shareDistance), 500];
};

private _leader = leader _group;
private _side = side _leader;
private _groups = allGroups select {_x getVariable [QEGVAR(core,enabled), false] && {side (leader _x) isEqualTo _side}};

{
    private _grpEnemies = _group getVariable [QGVAR(knownEnemies), []];
    _grpEnemies append _knownEnemies;
    _grpEnemies = _grpEnemies arrayIntersect _grpEnemies;

    // Take care of groups not being local
    if (!local _x) then {
        _group setVariable [QGVAR(knownEnemies), _grpEnemies, true]; // TODO: Make use of CBA targetEvent to reduce network traffic
    };
} forEach _groups;
