#include "script_component.hpp"

params [
    ["_group", grpNull, [grpNull]],
    ["_groupSet", [], [[]]]
];

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
    /* 9  */ ["_multi", 1, [1]],
    /* 10 */ ["_occupy", "Off", [""]],
    /* 11 */ ["_waypoints", [], [[]]],
    /* 12 */ ["_storedVars", [], [[]]],
    /* 13 */ ["_name", "", [""]],
    /* 14 */ ["_groupID", "", [""]],
    /* 15 */ ["_taskArray", [], [[]]],
    /* 16 */ ["_commanderArray", [], [[]]]
];

_group call EFUNC(Tasks,handleGroupTask);
