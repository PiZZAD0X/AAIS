#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets info from synced Group
 *
 * Arguments:
 * 0: Group Leader <OBJECT>
 * 1: Group Position <ARRAY>
 *
 * Return Value:
 * Group Info <ARRAY>
 *
 * Public: No
 */

params [
    "_unit",
    ["_pos",[],[[]]]
];
 
private _group = group _unit;
private _init = GETVAR(_group,Init,"");
if ((_init isEqualType "") && {!(_init isEqualTo "")}) then {
     _init = compile _init;
} else {
     _init = false;
};
private _occupy = GETVAR(_group,occupy,"Off");
if !(_occupy isEqualTo "Off") then {_occupy = floor(random [2,5,7])};
if (_pos isEqualTo []) then {
    _pos = (getposATL _unit) apply {parseNumber (_x toFixed 2)};
};
private _areaAssigned = EGETVAR(_group,Commander,areaAssigned,"NONE");
private _assetType = EGETVAR(_group,Commander,assetType,"INFANTRY");
private _commanderIgnore = EGETVAR(_group,Commander,CommanderIgnore,false);
private _QRF = EGETVAR(_group,Commander,QRF,false);
private _waypoints = [waypoints _unit] call FUNC(getWaypointDetails);
private _taskArray = [] call EFUNC(tasks,getTaskInfoGroup);
private _commanderArray = [];

[side _unit,
_pos,
behaviour _unit,
combatMode _group,
speedMode _group,
formation _group,
GETVAR(_group,groupStance,"AUTO"),
_init,
GETVAR(_group,multiplier,0),
_occupy,
GETVAR(_group,storedVars,[]),
GETVAR(_group,varName,""),
GETVAR(_group,groupID,""),
_taskArray,
_commanderArray]
