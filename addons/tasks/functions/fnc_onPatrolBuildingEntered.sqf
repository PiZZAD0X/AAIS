#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Handles patrol building state entered
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call aais_tasks_fnc_onPatrolBuildingEntered
 *
 * Public: No
 */

params ["_group", ""];

private _inBuilding = [_group] call EFUNC(building,moveInBuilding);

if (_inBuilding) then {
    _group setVariable [QGVAR(inBuilding), true];

    // Lock the waypoint and add a new one
    _group lockWP true;
    private _leader = leader _group;
    private _wp = _group addWaypoint [getPos _leader, 0, currentWaypoint _group];
    if (EGVAR(core,DebugEnabled)) then {
        private _markerName = format ["marker_%1", CBA_missionTime + random 1];
        createMarker [_markerName, getPos _leader];
        _markerName setMarkerShape "icon";
        _markerName setMarkerType "hd_dot";
        _markerName setMarkerColor "colorYellow";
    };
    private _comp = format ["this setFormation '%1'; this setBehaviour '%2'; deleteWaypoint [group this, currentWaypoint (group this)];", formation _group, behaviour _leader];
    _wp setWaypointStatements ["thislist findIf {!unitReady _x} == -1;", _comp];

    _group setBehaviour "Combat";
};
