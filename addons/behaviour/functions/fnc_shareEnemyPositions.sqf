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

if (_radius == -1) then {
    _radius = _group getVariable [QGVAR(shareDistance), GVAR(shareDistance)];
};

private _leader = leader _group;
private _side = side _leader;
private _groups = allGroups select {_x getVariable [QEGVAR(core,enabled), false] && {side (leader _x) isEqualTo _side}};
_groups deleteAt (_groups find _group);

private _sharedInfo = [];
{
    private _knowledge = _leader knowsAbout _x;
    if (_knowledge > 0.1) then {
        _sharedInfo pushBack [_x, _knowledge, _leader skill "commanding"];
    };
} forEach allUnits;

{
    [QGVAR(shareInfo), [_x, _sharedInfo]] call CBA_fnc_localEvent;
} forEach _groups;
