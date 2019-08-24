#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Gets all buildings within a certain radius of the given position
 *
 * Arguments:
 * 0: Unit or position <OBJECT><ARRAY>
 * 1: Radius <NUMBER> (default: 25)
 * 2: Return only the nearest building <BOOL> (default: false)
 *
 * Return Value:
 * Array of buildings <ARRAY> or the nearest building <OBJECT>
 *
 * Example:
 * [nearestBuilding player] call aais_building_fnc_getNearBuildings
 *
 * Public: No
 */

params ["_pos", ["_radius", 25], ["_returnNearest", false]];

private _buildings = nearestObjects [_pos, ["house", "building"] , _radius];

if (_returnNearest) exitWith {
    _buildings select 0;
};

_buildings
