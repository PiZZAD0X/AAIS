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
 * [[], 2] call aais_spawn_fnc_spawnUnitsGroupPFH
 *
 * Public: No
 */
 
params ["_args", "_idPFH"];

_args params [
    "_group",
    "_groupSet",
    "_groupMem",
    ["_groupVeh", [], [[]]],
    ["_unitIndex", 0, [0]]
];

_groupSet params [
    /* 0 */ "_side",
    /* 1 */ "_groupPos",
    /* 2 */ "_behaviour",
    /* 3 */ "_combat",
    /* 4 */ "_speed",
    /* 5 */ "_formation",
    /* 6 */ "_groupStance",
    /* 7 */ "_groupInit",
    /* 8 */ "_createRadius",
    /* 9 */ "_taskRadius",
    /* 10 */ "_wait",
    /* 11 */ "_startBld",
    /* 12 */ "_task",
    /* 13 */ "_taskTimer",
    /* 14 */ "_multi",
    /* 15 */ "_occupyOption",
    /* 16 */ "_waypoints",
    /* 17 */ "_onWater",
    /* 18 */ "_fl",
    /* 19 */ "_surrender",
    /* 20 */ "_tracker",
    /* 21 */ "_storedVars",
    /* 22 */ "_name",
    /* 23 */ "_groupID",
    /* 24 */ "_areaAssigned",
    /* 25 */ "_assetType"
];

if (_groupVeh isEqualTo [] && {_groupVeh isEqualTo []}) exitWith {
    [_group, _groupSet] call FUNC(finishGroupSpawn);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

if (_groupVeh isEqualTo []) then {
    private _toSpawn = _groupMem deleteAt 0;
    _args set [2, _groupMem];
    TRACE_1("",_toSpawn);

    [false, _group, _groupPos, _startBld, _unitIndex, _toSpawn, _taskRadius] call FUNC(createUnit);
    _unitIndex = _unitIndex + 1;
    _args set [4, _unitIndex];
} else {
    private _toSpawn = _groupVeh deleteAt 0;
    _args set [3, _groupVeh];
    TRACE_1("",_toSpawn);

    _toSpawn call FUNC(createVehicle);
};
