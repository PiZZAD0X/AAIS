#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Checks if a group should start doing something
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * Do task? <BOOL>
 *
 * Example:
 * [group player] call aais_tasks_fnc_checkDoTask
 *
 * Public: No
 */

params ["_group", "_type", ["_requestedType", ""]];

if !(_type isEqualTo "infantry") exitWith {};

private _unitCount = {alive _x} count (units _group);
private _pickUpPos = getPosATL (leader _group);

// Check if a transport is available within a certain radius
private _availableGroups = [];
private _enabledGroups = allGroups select {_x getVariable [QEGVAR(core,enabled), false]};

{
    private _settings = _x getVariable [QEGVAR(core,settings), []];
    private _task = [_settings, "task"] call CBA_fnc_hashGet;
    if (_task isEqualTo "transport" && {!(_x getVariable [QGVAR(inMission), false])}) then {
        // Check if the transport can go to the designated coordinates
        private _positionAllowed = false;

        private _targetPos = waypointPosition [_x, 0];
        if ((surfaceIsWater _targetPos && {surfaceIsWater _pickUpPos}) && {[_settings, "allowWater"] call CBA_fnc_hashGet}) then {
            _positionAllowed = true;
        };

        if (!surfaceIsWater _targetPos && {!surfaceIsWater _pickUpPos} && {[_settings, "allowLand"] call CBA_fnc_hashGet}) then {
            _positionAllowed = true;
        };

        if (_requestedType != "") then {
            private _transportType = [_settings, "type"] call CBA_fnc_hashGet;
            if !(_transportType isEqualTo toLower _requestedType) then {
                _positionAllowed = false;
            };
        };

        if (_positionAllowed) then {
            // Check if the vehicle transport has enough empty cargo spaces
            private _vehicle = vehicle (leader _x);
            private _availablePositions = {isNull (_x select 0)} count (fullCrew [_vehicle, "cargo", true]) ;

            if (_availablePositions >= _unitCount) then {
                _availableGroups pushBack [_vehicle distance2D _group, _x];
            };
        };
    };
} forEach _enabledGroups;

// Get the nearest transport
_availableGroups sort true;
private _groupTransport = (_availableGroups select 0) select 1;
_groupTransport setVariable [QGVAR(inMission), true];
[_groupTransport, _pickupPos, "MOVE"] call EFUNC(waypoint,addWaypoint);
