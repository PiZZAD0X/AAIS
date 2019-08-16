/*
 * Author: TheMagnetar
 * Clears all waypoints of a group
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_waypoint_fnc_clearWaypoints
 *
 * Public: No
 */
 #include "script_component.hpp"
 EXEC_CHECK(SERVERHC);

params ["_group"];

{
    deleteWaypoint [_group, 0];
} forEach (waypoints _group);
