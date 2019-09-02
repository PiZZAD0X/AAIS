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

params ["_grpString","_grpSet","_grpMem",["_currentVeh",objNull,[objNull]]];
_grpSet params ["_side","_gpos","_behave","_combat","_speed","_formation","_stance","","","_taskRadius","_wait","_startBld","_task","_taskTimer","","_occupyOption","","_waypoints","","_tasks",""];
private _ngrp = createGroup _side;
{
    if ((_x select 0)) then {
        private _u = [false,_ngrp,_gpos,_startBld,_foreachIndex,_x,_taskRadius,_currentVeh,_stance] call FUNC(createUnit);
    } else {
        private _vpos = (_x select 2);
        private _v = [_vpos,_x,_side] call FUNC(createVehicle);
        _currentVeh = _v;
    };
} foreach _grpMem;
[_ngrp,_gpos,_grpSet] call FUNC(setGroupVariables);
_ngrp call CBA_fnc_clearWaypoints;
if !(_tasks isEqualTo []) then {
    [_ngrp,_tasks] call FUNC(taskRegister);
    _tasks = _tasks call FUNC(taskRemoveZoneActivated);
};
if !(_tasks isEqualTo []) then {GVAR(taskedGroups) pushBack [_ngrp];};
if (count _waypoints > 2) then {
    [_ngrp,_waypoints] call FUNC(createWaypoints);
} else {
    if (!(_tasks isEqualTo []) && {(_ngrp getVariable [QGVAR(TaskTimer),0]) isEqualTo 0}) then {
        [_ngrp,_tasks] call FUNC(taskInit);
    } else {
        SETVAR(_ngrp,CurrentTaskEndTime,(CBA_MissionTime + _taskTimer));
        private _passarray = [_task,_ngrp,_gpos,_taskRadius,_wait,_behave,_combat,_speed,_formation,_occupyOption];
        [{!((waypoints (_this select 1)) isEqualTo [])},{
            _this call FUNC(taskAssign);
        },_passarray] call CBA_fnc_waitUntilAndExecute;
    };
};
_ngrp