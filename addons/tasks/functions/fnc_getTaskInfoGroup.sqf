#include "script_component.hpp"

params ["_entity"];

private _synced = synchronizedObjects _entity select {
    _x isKindOf QGVAR(TaskModule)
};

private _taskModule = selectRandom _synced;
private _taskArray = GETVAR(_taskModule,taskArray,[]);
_taskArray
