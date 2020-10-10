#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Config module activation function
 *
 * Arguments:
 * 0: Module Logic Object <OBJECT>
 * 1: Module Execution Mode <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_mode","",[""]],["_input",[],[[]]]];
switch (_mode) do {
    case "init": {
        if (isMultiplayer && {!isDedicated || hasInterface}) exitwith {};
        _input params ["_logic",["_isActivated",true,[true]]];
        if !(_isActivated) exitWith {};

        private _ZoneModules = [_logic,[QGVAR(ZoneModule),QGVAR(ZoneModule_R)]] call FUNC(getSyncedModules);
        
        if (_ZoneModules isEqualTo []) then {
            private _position = getPosATL _logic;
            private _size = _logic getVariable ["objectArea", [100, 100]];
            _size params ["_radiusX","_radiusY"];
            private _direction = getDir _logic;
            private _areaConfig = [_position,_radiusX,_radiusY,_direction];
            private _configSelect = GETVAR(_logic,configSelect,"NONE");
            private _groupSide = GETVAR(_logic,groupSide,"WEST");
            private _groupName = GETVAR(_logic,groupName,"");
            private _groupInit = GETVAR(_logic,groupInit,"");
            private _groupProbabilityPresence = GETVAR(_logic,groupProbabilityPresence,100);
            private _groupStance = GETVAR(_logic,groupStance,"auto");
            private _groupForceLights = GETVAR(_logic,groupForceLights,0);
            private _groupTask = GETVAR(_logic,groupTask,"Patrol");
            private _groupPatrolRadius = GETVAR(_logic,groupPatrolRadius,30);
            private _groupWaypointWait = GETVAR(_logic,groupWaypointWait,3);
            private _groupTaskTimer = GETVAR(_logic,groupTaskTimer,0);
            private _groupCreateRadius = GETVAR(_logic,groupCreateRadius,0);
            private _groupMultiplier = GETVAR(_logic,groupMultiplier,1);
            private _groupOccupyOption = GETVAR(_logic,groupOccupyOption,"Off");
            
            [_logic,_areaConfig,_configSelect] call FUNC(spawnGroupFromConfig);
        };

    };
    case "attributesChanged3DEN": {};
    default {};
};
true