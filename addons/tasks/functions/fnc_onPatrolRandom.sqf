#include "script_component.hpp"
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
 * [group player] call aais_tasks_fnc_handlePatrolRandomState
 *
 * Public: No
 */

params ["_group", ""];

if !(CBA_missionTime >= (_group getVariable [QGVAR(nextCheckTime), CBA_missionTime])) exitWith {};

if ((units _group) findIf {alive _x} == -1) exitWith {deleteGroup _group;};

private _leader = leader _group;
private _targetPos = waypointPosition [_group, 0];

if (!local _leader) exitWith {
    _group setVariable [QGVAR(waitUntil), _group getVariable [QGVAR(waitUntil), CBA_missionTime], true];
    _group setVariable [QGVAR(distance), _group getVariable [QGVAR(distance), (getPos _leader) distance2D _targetPos], true];
    _group setVariable [QGVAR(buildingCheckTime), _group getVariable [QGVAR(buildingCheckTime), CBA_missionTime], true];
    _group setVariable [QGVAR(inBuilding), _group getVariable [QGVAR(inBuilding), false], true];
};

// Do not do advanced actions if unit is cached
if (_group getVariable [QGVAR(cached), false]) exitWith {};

private _settings = _group getVariable [QEGVAR(core,settings), []];
private _checkingDistance = [_settings, "checkingDistance"] call CBA_fnc_hashGet;
private _reachedDistance = [_settings, "reachedDistance"] call CBA_fnc_hashGet;

// Search for a vehicle
private _distance = _leader distance _targetPos;

if (_distance > _reachedDistance && {vehicle _leader == _leader} && {[_settings, "allowVehicles"] call CBA_fnc_hashGet}) then {
    // TODO: Check for vehicles
};

// Start patrolling buildings if units are near the waypoint
private _unitType = [_settings, "type"] call CBA_fnc_hashGet;
private _inBuilding = _group getVariable [QGVAR(inBuilding), false];

if (_inBuilding && {CBA_missionTime > (_group getVariable [QGVAR(finishedBuildingPatrol), CBA_missionTime])}) then {
    _inBuilding = false;
    _group setVariable [QGVAR(buildingCheckTime), CBA_missionTime + 10];
};

private _buildingCheckTime = _group getVariable [QGVAR(buildingCheckTime), CBA_missionTime];
private _checkProbability = (1 - _distance/(_group getVariable [QGVAR(distance), _leader distance _targetPos]))*100 min 70;

if (_unitType in ["infantry", "wheeled"] && {CBA_missionTime >= _buildingCheckTime} && {_distance < _checkingDistance} && {[_settings, "patrolBuildings"] call CBA_fnc_hashGet} && {!_inBuilding} && {random 100 < _checkProbability}) then {
    if (_unitType isEqualTo "wheeled") then {
        _group setVariable [QGVAR(checkBuildings), true];
        [QGVAR(disembark), _group] call CBA_fnc_localEvent;
    } else {
        [QGVAR(patrolBuildings), _group] call CBA_fnc_localEvent;
    };
};

// Perform the next check in 10 seconds
_group setVariable [QGVAR(nextCheckTime), CBA_missionTime + 5];
