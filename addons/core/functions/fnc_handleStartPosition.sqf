#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Handles positioning a spawned group or editor placed groups with random start positions.
 *
 * Arguments:
 * 0: Group <OBJECT>
 * 1: Settings <HASH> (Default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1] call aais_spawn_fnc_handleStartPosition
 *
 * Public: No
 */

params ["_group", ["_settings", []]];

if (_settings isEqualTo []) then {
    _settings = _group getVariable [QGVAR(settings), []];
};
private _inRandomPosition = [_settings, "randomPosition"] call CBA_fnc_hashGet;
private _inRandomBuilding = [_settings, "spawnInBuilding"] call CBA_fnc_hashGet;
private _blackListedMarkers = [_settings, "blacklist"] call CBA_fnc_hashGet;

if (_blackListedMarkers isEqualTo "") then {
    _blackListedMarkers = [_blackListedMarkers];
};

private _spawnMarkers = [_settings, "marker"] call CBA_fnc_hashGet;
private _marker = ([_spawnMarkers] call EFUNC(waypoint,selectRandomMarker));
private _position = _group getVariable [QGVAR(startPosition), []];

// Exit if marker configuration is invalid and position is either empty or at [0, 0, 0]
if (!([_marker] call EFUNC(waypoint,checkMarkerInput)) && {_position isEqualTo [] || {_position isEqualTo [0, 0, 0]}}) exitWith {
    ERROR("Invalid marker configuration and/or empty or null position speficied");
};

// Only infantry units spawn in buildings
private _type = [_settings, "type"] call CBA_fnc_hashGet;
if (!(_type isEqualTo "infantry") && {_inRandomBuilding}) then {
    _inRandomBuilding = false;
    [_settings, "spawnInBuilding", false] call CBA_fnc_hashSet;
};

private _units = units _group;
if (_units isEqualTo []) then {
    _units =+ (_group getVariable [QEGVAR(spawn,unitsToSpawn), []]);
} else {
    private _inMarker = "";
    private _leaderPos = position (leader _group);
    {
        if (_leaderPos inArea (_x select 0)) exitWith {
            _inMarker = _x select 0;
        };
    } forEach _spawnMarkers;

    _group setVariable [QGVAR(registerMarker), _inMarker];
};

if (_inRandomPosition || {!(_position isEqualTo [])} ) exitWith {
    private _allowWater = [_settings, "allowWater"] call CBA_fnc_hashGet;
    private _allowLand = [_settings, "allowLand"] call CBA_fnc_hashGet;
    private _forceRoads = [_settings, "forceRoads"] call CBA_fnc_hashGet;

    private _moveUnits = false;

    // Select a unit
    private _unit = "";
    if ((_units select 0) isEqualTypeAny ["", []]) then {
        if ((_units select 0) isEqualType "") then {
            _unit = _units select 0;
        } else {
            _unit = _units select 0 select 0;
        };
    } else {
        // These are editor placed units. Move them at the end of the function
        _moveUnits = true;
        private _unitInVehicle = _units findIf {vehicle _x != _x};
        if (_unitInVehicle != -1) then {
            _unit = typeOf (vehicle (_units select _unitInVehicle));
        } else {
            _unit = typeOf (_units select 0);
        };
    };

    if (_position isEqualTo [0, 0, 0]) then {
        _position = [_marker, [_allowWater, _allowLand, _forceRoads], [0, 50, _unit], _blackListedMarkers] call EFUNC(waypoint,markerRandomPos);
        _group setVariable [QGVAR(registerMarker), _marker];
    } else {
        private _inMarker = "";
        {
            if (_position inArea (_x select 0)) exitWith {
                _inMarker = _x select 0;
            };
        } forEach _spawnMarkers;

        _group setVariable [QGVAR(registerMarker), _inMarker];
    };

    if (_moveUnits) then {
        [_group, _position] call FUNC(moveGroupToPosition);
    } else {
        _group setVariable [QGVAR(startPosition), _position];
    };
};

if (_inRandomBuilding) exitWith {
    _group setVariable [QGVAR(registerMarker), _marker];
    private _unitCount = count _units;
    private _positions = [_unitCount, _marker, [["area", _marker], ["enterable", true], ["blacklist", _blackListedMarkers]], false] call EFUNC(waypoint,markerRandomBuildingPos);
    private _positionsCount = count _positions;
    // Generate positions for all units
    if (_unitCount > _positionsCount) then {
        // Generate a random position since there are no suitable buildings
        if (_positions isEqualTo []) then {
            private _unitType = _units select 0;
            if !(_unitType isEqualTo "") then {
                _unitType = typeOf _unitType;
            };
            _positions pushBack ([_marker, [false, true, false], [0, 50, _unitType], _blackListedMarkers] call EFUNC(waypoint,markerRandomPos));
        };

        private _requiredPositions = _unitCount - _positionsCount - 1;
        private _numPositions = _positionsCount;
        for "_i" from 0 to _requiredPositions do {
            private _unitType = _units select (_numPositions + _i);
            if !(_unitType isEqualTo "") then {
                _unitType = typeOf _unitType;
            };
            _positions pushBack ((_positions select 0) findEmptyPosition [0, 60, _unitType]);
        };
    };

    private _moveUnits = false;
    if !((_units select 0) isEqualType "") then {
        _moveUnits = true;
    };

    if (_moveUnits) then {
        [_units, _positions] call FUNC(moveUnitsToPositions);
    } else {
        _group setVariable [QGVAR(startPosition), _positions];
    };
};

if (_units isEqualTo []) then {
    ERROR("No position assigned");
}
