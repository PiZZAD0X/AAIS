#include "script_component.hpp"

params ["_group",["_groupSet",[],[[]]]];

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
    /* 9 */ ["_taskRadius", 50, [50]],
    /* 10 */ ["_wait", 3, [3]],
    /* 11 */ ["_task", "PATROL", [""]],
    /* 12 */ ["_taskTimer", 0, [0]],
    /* 13 */ ["_multi", 1, [1]],
    /* 14 */ ["_occupy", "Off", [""]],
    /* 15 */ ["_waypoints", [], [[]]],
    /* 16 */ ["_fl", false, [false]],
    /* 17 */ ["_surrender", false, [false]],
    /* 18 */ ["_storedVars", [], [[]]],
    /* 19 */ ["_name", "", [""]],
    /* 20 */ ["_groupID", "", [[]]],
    /* 21 */ ["_areaAssigned", "NONE", [""]],
    /* 22 */ ["_assetType", "INFANTRY", [""]]
];

SETVAR(_group,Pos,_gpos);
SETVAR(_group,behaviour,_behaviour);
SETVAR(_group,combatMode,_combat);
SETVAR(_group,speed,_speed);
SETVAR(_group,formation,_formation);
SETVAR(_group,taskRadius,_taskRadius);
SETVAR(_group,taskWait,_wait);
SETVAR(_group,task,_task);
SETVAR(_group,TaskTimer,_taskTimer);
SETVAR(_group,occupy,_occupy);
SETVAR(_group,Waypoints,_waypoints);
SETVAR(_group,forceLights,_fl);
SETVAR(_group,surrender,_surrender);
SETVAR(_group,vehicleCargo,_vehicleCargo);
