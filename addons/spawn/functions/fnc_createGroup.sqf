#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Creates group from zone array format
 *
 * Arguments:
 *
 * Return Value:
 * Group <GROUP>
 *
 * Public: No
 */

params [
    ["_args", [], [[]]],
    ["_initial", false, [false]]
];

_args params [
    "",
    "_groupSet",
    "_groupMem",
    "_groupVehs"
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

private _group = createGroup _side;
_group deleteGroupWhenEmpty true;

SETVAR(_group,Spawned,true);

if !(_name isEqualTo "") then {
    private _uniqueName = [_name] call FUNC(findUniqueName);
    missionNamespace setVariable [_uniqueName, _group, true];
};

if !(_groupID isEqualTo "") then {
    _group setGroupIdGlobal [_groupID];
};

if !(_storedVars isEqualTo []) then {
    _storedVars apply {
        _x params ["_varName", "_varValue"];
        _group setvariable [_varName, _varValue];
    };
};

[_group,_groupSet] call FUNC(setGroupVariables);

private _startBld = !(_occupy isEqualTo "Off");
_initial = true;
if (_initial) then {
    {
        [_group, _groupPos, _x] call FUNC(createVehicle);
    } forEach _groupVehs;
    {
        [false, _group, _groupPos, _startBld, _foreachIndex, _x, _taskRadius] call FUNC(createUnit);
    } forEach _groupMem;
    [_group, _groupSet] call FUNC(finishGroupSpawn);
} else {
    [DFUNC(spawnUnitsGroupPFH), 0.1, [_group, _groupSet, _groupMem, _groupVehs]] call CBA_fnc_addPerFrameHandler;
};
