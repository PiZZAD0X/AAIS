#include "script_component.hpp"

EXEC_CHECK(HC);

GVAR(MarkerArray) = [];

[QMGVAR(ChangeTaskEvent), {
    params ["_task","_group","_taskPos"];
    LOG_3("Changing task for %1 to: %2 at pos: %3",_task,_group,_taskPos);
    [_task,_group,_taskPos] call FUNC(taskAssign);
}] call CBA_fnc_addEventHandler;
