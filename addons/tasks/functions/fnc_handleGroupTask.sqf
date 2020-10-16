#include "script_component.hpp"

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