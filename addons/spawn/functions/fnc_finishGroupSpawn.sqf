#include "script_component.hpp"

params [
    ["_group", grpNull, [grpNull]],
    ["_groupSet", [], [[]]]
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

_group call CBA_fnc_clearWaypoints;
if ((GETVAR(leader _group,noAI,false) || {GETVAR(_group,noAI,false)}) || {(count _waypoints > 1) && {_task isEqualTo "NONE"}}) then {
    LOG_2("Setting %1 to manual wp mode with: %2",_group,_waypoints);
    [_group,_waypoints] call FUNC(createWaypoints);
} else {
    if (GETVAR(_group,vehCargo,false)) then {
        SETVAR(_group,vehCargoOrigTask,_task);
        private _veh = vehicle leader _group;
        private _cargoGroups = GETVAR(_veh,vehCargoGroups,[]);
        _cargoGroups pushBackUnique _group;
        SETVAR(_veh,vehCargoGroups,_cargoGroups);
        TRACE_2("vehCargoGroups added",_veh,_cargoGroups);
        _task = "CARGO";
    };
    LOG_2("Setting %1 to task: %2",_group,_task);
    private _manualPos = GETVAR(_group,taskPos,[ARR_3(0,0,0)]);
    private _taskPos = if (_manualPos isEqualTo [0,0,0]) then {
        _groupPos
    } else {
        _manualPos
    };
    TRACE_2("",_group,_taskPos);
    private _passarray = [_group,_task,_taskPos,_taskRadius,_wait,_behaviour,_combat,_speed,_formation,_occupyOption];
    [{!((count waypoints (_this select 0)) isEqualTo 0)},{
        _this call EFUNC(tasks,assignGroupTask);
    },_passarray] call CBA_fnc_waitUntilAndExecute;
};