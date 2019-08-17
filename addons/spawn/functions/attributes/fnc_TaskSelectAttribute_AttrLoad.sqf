#include "script_component.hpp"
EDEN_CHECK;

params ["_control","_value"];

private _group = ((get3DENSelected "group") select 0);
private _ctrlCombo = (_control controlsGroupCtrl 100);
private _task = _value;
LOG_2("_group: %1 _task: %2",_group,_task);
SETVAR(_group,TaskSelect,_task);
private _tasks = [
    "Loiter",
    "Hold Until",
    "Sentry",
    "Stationary",
    "Patrol",
    "Patrol Perimeter",
    "Move to Patrol Buildings",
    "Move to Defend Buildings",
    "Entrenched",
    "Reinforcments",
    "None"
];
{
    private _name = _x;
    private _index = _ctrlCombo lbadd _name;
    _ctrlCombo lbsetdata [_index,_name];
    _ctrlCombo lbsetValue [_index,_forEachIndex];
    if (_task isEqualto (_ctrlCombo lbData _index)) then {
        _ctrlCombo lbSetCurSel _index;
    };
} foreach _tasks;
