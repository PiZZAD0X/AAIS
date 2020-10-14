#include "script_component.hpp"

params ["_group",["_groupSet",[],[[]]]];

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

SETVAR(_group,Pos,_gpos);
SETVAR(_group,behaviour,_behaviour);
SETVAR(_group,combatMode,_combat);
SETVAR(_group,speed,_speed);
SETVAR(_group,formation,_formation);
SETVAR(_group,taskRadius,_taskRadius);
SETVAR(_group,taskWait,_wait);
SETVAR(_group,task,_task);
SETVAR(_group,TaskTimer,_taskTimer);
SETVAR(_group,occupyOption,_occupyOption);
SETVAR(_group,Waypoints,_waypoints);
SETVAR(_group,forceLights,_fl);
SETVAR(_group,surrender,_surrender);
SETVAR(_group,vehicleCargo,_vehicleCargo);
