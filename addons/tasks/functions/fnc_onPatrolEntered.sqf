/*
 * Author: TheMagnetar
 * Task patrol.
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onEmbarkStateEntered
 *
 * Public: No
 */
 #include "script_component.hpp"
 EXEC_CHECK(SERVERHC);

params ["_group", "_state"];

private _settings = _group getVariable [QEGVAR(core,settings), []];

if (_group getVariable [QGVAR(patrolFinished), true]) then {
    _group setVariable [QGVAR(patrolFinished), false];
    private _perimeterSettings = [_settings, "perimeterSettings"] call CBA_fnc_hashGet;
    _perimeterSettings params ["_center", "_radius"];
    private _execStatements = "";
    private _condition = "true";

    _center = [_center] call CBA_fnc_getPos;
    [_group, _center, _radius, ["MOVE", _execStatements, _condition]] call EFUNC(waypoint,generatePerimeterWaypoint);
};
