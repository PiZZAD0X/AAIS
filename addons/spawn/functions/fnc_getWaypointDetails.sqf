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

params [
    ["_entityWaypoints",[],[[]]],
    ["_waypointDetails",[],[[]]]
];
{
    private _wayPoint = _x;
    _waypointDetails pushBack [
        _wayPoint,
        waypointName _wayPoint,
        waypointPosition _wayPoint,
        waypointType _wayPoint,
        waypointBehaviour _wayPoint,
        waypointCombatMode _wayPoint,
        waypointSpeed _wayPoint,
        waypointFormation _wayPoint,
        waypointTimeout _wayPoint,
        waypointCompletionRadius _wayPoint,
        waypointAttachedObject _wayPoint,
        waypointAttachedVehicle _wayPoint,
        waypointHousePosition _wayPoint,
        waypointLoiterRadius _wayPoint,
        waypointScript _wayPoint,
        waypointStatements _wayPoint
    ];
} foreach _entityWaypoints;
_waypointDetails