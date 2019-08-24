#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Gets all positions of the given building
 *
 * Arguments:
 * 0: Building <OBJECT> (Default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [nearestBuilding player] call aais_building_fnc_getBuildingPositions
 *
 * Public: No
 */

params [["_building", objNull]];

if (isNull _building) exitWith {[]};

private _buildingPos = [];
private _index = 0;

while {!((_building buildingPos _index) isEqualTo [0,0,0])} do {
    _buildingPos pushBack (_building buildingPos _index);
    _index = _index + 1;
};

_buildingPos
