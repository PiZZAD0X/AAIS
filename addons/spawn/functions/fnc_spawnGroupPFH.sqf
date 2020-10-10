#include "script_component.hpp"

/*
 * Author: TheMagnetar
 * Spawn PFH.
 *
 * Arguments:
 * 0: Parameters <ARRAY>
 * 1: PerFrameHandler identifier <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 2] call aais_spawn_fnc_spawnGroupPFH
 *
 * Public: No
 */

if (GVAR(spawnQueue) isEqualTo []) exitWith {
    [GVAR(spawnGroupPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(spawnGroupPFH) = -1;
};

private _queueArray = GVAR(spawnQueue) deleteAt 0;
TRACE_1("",_queueArray);

_queueArray params [
    ["_configMode", true, [true]],
    ["_toSpawn", [], [[]]]
];

if (_configMode) then {
    _toSpawn params [
        ["_entity", [], [[]]],
        ["_side", "", [""]],
        ["_position", [], [[]]],
        ["_settings", []]
    ];
    [_entity, _side, _position, _settings] call FUNC(helperSpawnGroup);
} else {
    [_toSpawn, false] call FUNC(createGroup);
};
