#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets waypoint info from synced group
 *
 * Arguments:
 * 0: Group <GROUP>
 *
 * Return Value:
 * Waypoint Info <ARRAY>
 *
 * Public: No
 */

params ["_group"];
private _entityWaypoints = waypoints _group;
private _waypointDetails = [];
{
    private _waypointID = _x;
    _waypointDetails pushBack [
        _waypointID,
        waypointName _waypointID,
        waypointPosition _waypointID,
        waypointType _waypointID,
        waypointBehaviour _waypointID,
        waypointCombatMode _waypointID,
        waypointSpeed _waypointID,
        waypointFormation _waypointID,
        waypointTimeout _waypointID,
        waypointCompletionRadius _waypointID,
        waypointAttachedObject _waypointID,
        waypointAttachedVehicle _waypointID,
        waypointHousePosition _waypointID,
        waypointLoiterRadius _waypointID,
        waypointScript _waypointID,
        waypointStatements _waypointID
    ];
} foreach _entityWaypoints;
_waypointDetails