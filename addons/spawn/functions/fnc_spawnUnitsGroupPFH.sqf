#include "script_component.hpp"

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
    /* 1 */ ["_groupPos", [], [[]]],
    /* 2 */ ["_behaviour", "AWARE", [""]],
    /* 3 */ ["_combat", "YELLOW", [""]],
    /* 4 */ ["_speed", "normal", [""]],
    /* 5 */ ["_formation", "wedge", [""]],
    /* 6 */ ["_groupStance", "AUTO", [""]],
    /* 7 */ ["_groupInit", false, [false]],
    /* 8 */ ["_createRadius", 0, [0]],
    /* 9  */ ["_multi", 1, [1]],
    /* 10 */ ["_occupy", "Off", [""]],
    /* 11 */ ["_waypoints", [], [[]]],
    /* 12 */ ["_storedVars", [], [[]]],
    /* 13 */ ["_name", "", [""]],
    /* 14 */ ["_groupID", "", [""]],
    /* 15 */ ["_taskArray", [], [[]]],
    /* 16 */ ["_commanderArray", [], [[]]]
];

if (_groupVeh isEqualTo [] && {_groupVeh isEqualTo []}) exitWith {
    [_group, _groupSet] call FUNC(finishGroupSpawn);
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};

private _startBld = _occupy isEqualTo "Off";

if (_groupVeh isEqualTo []) then {
    private _toSpawn = _groupMem deleteAt 0;
    _args set [2, _groupMem];
    TRACE_1("",_toSpawn);

    [false, _group, _groupPos, _startBld, _unitIndex, _toSpawn, _createRadius] call FUNC(createUnit);
    _unitIndex = _unitIndex + 1;
    _args set [4, _unitIndex];
} else {
    private _toSpawn = _groupVeh deleteAt 0;
    _args set [3, _groupVeh];
    TRACE_1("",_toSpawn);

    _toSpawn call FUNC(createVehicle);
};
