#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Executed when units enter the Patrol Random state.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onPatrolRandomStateEntered
 *
 * Public: No
 */

params ["_group", "_state"];

// Do not generate any new waypoint
if !(_group getVariable [QGVAR(generateWaypoint), true]) exitWith {
    _group setVariable [QGVAR(generateWaypoint), true];
};

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _execStatements = "";
private _condition = "true";

if ([_settings, "waitAtWaypoint"] call CBA_fnc_hashGet) then {
    private _unitType = [_settings, "type"] call CBA_fnc_hashGet;

    if (_unitType isEqualTo "infantry") then {
        _execStatements = QUOTE([ARR_2(QQGVAR(wait), group this)] call CBA_fnc_localEvent);
    } else {
        private _vehicle = vehicle (leader _group);
        _execStatements = QUOTE([ARR_2(QQGVAR(disembark), [ARR_4(group this, true, true, false)])] call CBA_fnc_localEvent);
        _condition = QUOTE(speed (vehicle (leader this)) == 0);
    };
} else {
    _execStatements = QUOTE([ARR_2(QQGVAR(doTask), group this)] call CBA_fnc_localEvent);
};


private _area = [_settings, "area"] call CBA_fnc_hashGet;
private _targetPos = [_group, _area, ["MOVE", _execStatements, _condition]] call EFUNC(waypoint,generateWaypoint);

_group setVariable [QGVAR(distance), (getPosWorld (leader _group)) distance2D _targetPos];
