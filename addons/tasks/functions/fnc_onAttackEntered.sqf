/*
 * Author: TheMagnetar
 * Task attack.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onAttackStateEntered
 *
 * Public: No
 */
 #include "script_component.hpp"
 EXEC_CHECK(SERVERHC);

params ["_group"];

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _target = _group getVariable [QGVAR(targetAttack), objNull];

if (isNull _target) then {
    private _marker = [_settings, "marker"] call CBA_fnc_hashGet;
    _target = [_marker] call EFUNC(waypoint,selectRandomMarker);
    _group setVariable [QGVAR(targetAttack), _target];
};

private _type = switch (typeName _target) do {
    case "OBJECT": {"object"};
    case "GROUP": {"object"};
    default {"coordinates"};
};

private _targetPos = if (_type isEqualTo "object") then {
    _targetPos = ((leader _group) targetKnowledge (leader _target)) select 6;
} else {
    _targetPos = [_target] call CBA_fnc_getPos;
};
_group setVariable [QGVAR(targetPos), _targetPos];

// Look at the designated position
(units _group) apply {_x doWatch _targetPos};

// TODO: Add evaluate target group options

private _distance = (leader _group) distance _targetPos;
if (_distance <= CLOSE_ATTACK_DISTANCE) then {
    private _execStatements = format ["[group this, %1] call %2; deleteWaypoint [group this, currentWaypoint (group this)];", QGVAR(taskDefend), QFUNC(changeAssignedTask)];
    private _condition = "true";
    // TODO: Make the radius and completion radios a variable that can be modified
    [_group, _targetPos, "SAD", _execStatements, _condition, 100, 100] call EFUNC(waypoint,generateWaypoint);

    _group setBehaviour "COMBAT";
    _group setCombatMode "RED";
    _group setFormation "LINE";
} else {
    if (_type isEqualTo "object") then {
        [QGVAR(flankManeuver), _group] call CBA_fnc_localEvent;
    } else {
        private _execStatements = format ["[group this, %1] call %2; deleteWaypoint [group this, currentWaypoint (group this)];", QGVAR(taskDefend), QFUNC(changeAssignedTask)];
        private _condition = "true";
        // TODO: Make the radius and completion radios a variable that can be modified
        [_group, _targetPos, "SAD", _execStatements, _condition, 100, 100] call EFUNC(waypoint,generateWaypoint);
    };

    _group setBehaviour "AWARE";
    _group setCombatMode "YELLOW";
    _group setFormation "VEE";
};

_group setSpeedMode "FULL";
