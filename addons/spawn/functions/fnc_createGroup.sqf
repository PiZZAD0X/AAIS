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

_initial = true;
if (_initial) then {
    {
        [false, _group, _groupPos, _startBld, _foreachIndex, _x, _taskRadius] call FUNC(createVehicle);
    } forEach _groupVehs;
    {
        [false, _group, _groupPos, _startBld, _foreachIndex, _x, _taskRadius] call FUNC(createUnit);
    } forEach _groupMem;
    [_group, _groupSet] call FUNC(finishGroupSpawn);
} else {
    [DFUNC(spawnUnitsGroupPFH), 0.1, [_group, _groupSet, _groupMem, _groupVehs]] call CBA_fnc_addPerFrameHandler;
};
