/*
 * Author: TheMagnetar
 * Checks if a group should be cached
 *
 * Arguments:
 * 0: Group <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group1] call aais_cache_fnc_shouldCache
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_group"];

private _playerUnits = [] call CBA_fnc_players;
private _leader = leader _group;

(_playerUnits findIf {(_x distance2D _leader) < GVAR(cacheDistance)}) isEqualTo -1
