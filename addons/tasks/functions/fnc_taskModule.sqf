#include "script_component.hpp"

params [
    ["_mode","",[""]],
    ["_input",[],[[]]]
];

switch (_mode) do {
    case "init": {
        if (isMultiplayer && {!isDedicated || hasInterface}) exitwith {};
        _input params ["_logic", ["_isActivated", true, [true]]];
        if !(_isActivated) exitWith {};
        
        private _loc = getPosATL _logic;
        private _size = _logic getVariable ["objectArea", [100, 100, 0, false]];
        _size params ["_radiusX","_radiusY", "_direction", "_isRectangle"];
        private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
        private _cond = compile (GETVAR(_logic,Condition,""));
        private _code = compile (GETVAR(_logic,Code,""));
        private _task = GETVAR(_logic,Task,"PATROL");
        private _taskWait = GETVAR(_logic,TaskWait,3);
        private _taskTimer = GETVAR(_logic,TaskTimer,0);
        private _forceLights = GETVAR(_logic,ForceLights,0);
        private _syncedTasks = [_logic, [QGVAR(TaskModule)]] call EFUNC(Spawn,getSyncedModules);
        
        private _saveArray = [
            _area,
            _cond,
            _code,
            _task,
            _taskWait,
            _taskTimer,
            _forceLights
        ];
        SETPVAR(_logic,taskArray,_saveArray);
        SETPVAR(_logic,syncedTasks,_syncedTasks);
        
    };
    case "attributesChanged3DEN": {};
    default {};
};
true