#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Zone Module activation function. Gathers synced units and modules and either adds zone to zone
 * handler or calls zone spawner if zone is set to initial mode
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
        
        private _activationMode = GETVAR(_logic,zoneActivation,"Conditional");
        private _loc = getPosATL _logic;
        private _size = _logic getVariable ["objectArea", [100, 100, 0, false]];
        _size params ["_radiusX","_radiusY", "_direction", "_isRectangle"];
        private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
        private _delay = GETVAR(_logic,zoneDelay,0);
        private _sidesStr = GETVAR(_logic,zoneSides,[ARR_4("BLUFOR","OPFOR","INDFOR","CIVILIAN")]);
        private _sides = [];
        {
            if (_x isEqualTo "BLUFOR") then {
                _sides pushback west;
            };
            if (_x isEqualTo "OPFOR") then {
                _sides pushback east;
            };
            if (_x isEqualTo "INDFOR") then {
                _sides pushback independent;
            };
            if (_x isEqualTo "CIVILIAN") then {
                _sides pushback Civilian;
            };
        } foreach _sidesStr;
        private _activatorClasses = GETVAR(_logic,zoneActivatorType,[ARR_4("Ground","Helicopter","Plane","Ship")]);
        if ("Ground" in _activatorClasses) then {
            _activatorClasses pushBackUnique "Man";
        };
        
        private _code = compile (_logic getVariable [QGVAR(zoneCode),""]);
        SETPVAR(_logic,code,_code);
        private _cond = compile (_logic getVariable [QGVAR(zoneCondition),""]);
        SETPVAR(_logic,cond,_cond);
        private _entities = [_logic] call FUNC(getSyncedObjects);
        SETPVAR(_logic,entities,_entities);
        LOG_2("_logic: %1 _entities: %2",_logic,_entities);
        
        private _configs = [];
        private _configModules = [_logic,[QGVAR(ConfigModule)]] call FUNC(getSyncedModules);
        if !(_configModules isEqualTo []) then {
            LOG_2("_logic: %1 _configModules: %2",_logic,_configModules);
            
            {
                private _logicConfig = _x;
                private _position = getPosATL _logicConfig;
                private _size = _logicConfig getVariable ["objectArea", [100, 100]];
                _size params ["_radiusX","_radiusY"];
                private _direction = getDir _logicConfig;
                private _areaConfig = [_position,_radiusX,_radiusY,_direction];
                private _configSelect = GETVAR(_logicConfig,configSelect,"NONE");
                private _groupSide = GETVAR(_logicConfig,groupSide,"WEST");
                private _groupName = GETVAR(_logicConfig,groupName,"");
                private _groupInit = GETVAR(_logicConfig,groupInit,"");
                private _groupProbabilityPresence = GETVAR(_logicConfig,groupProbabilityPresence,100);
                private _groupStance = GETVAR(_logicConfig,groupStance,"auto");
                private _groupForceLights = GETVAR(_logicConfig,groupForceLights,0);
                private _groupTask = GETVAR(_logicConfig,groupTask,"Patrol");
                private _groupPatrolRadius = GETVAR(_logicConfig,groupPatrolRadius,30);
                private _groupWaypointWait = GETVAR(_logicConfig,groupWaypointWait,3);
                private _groupTaskTimer = GETVAR(_logicConfig,groupTaskTimer,0);
                private _groupCreateRadius = GETVAR(_logicConfig,groupCreateRadius,0);
                private _groupMultiplier = GETVAR(_logicConfig,groupMultiplier,1);
                private _groupOccupyOption = GETVAR(_logicConfig,groupOccupyOption,"Off");
                
                _configs pushback [_logicConfig,_area,_configSelect,_groupMultiplier];
            } foreach _configModules;
            
        };
        SETPVAR(_logic,configs,_configs);
        
        private _templates = [];
        private _templateModules = [_logic,[QGVAR(Templates)]] call FUNC(getSyncedModules);
        if !(_templateModules isEqualTo []) then {
            LOG_2("_logic: %1 _templateModules: %2",_logic,_templateModules);
        };
        SETPVAR(_logic,templates,_templates);

        GVAR(Zones) pushBack [
            _logic,
            _area,
            _delay,
            _sides,
            _activatorClasses,
            _cond,
            _code,
            _activationMode
        ];
        
        publicVariable QGVAR(Zones);
        
        if (_activationMode isEqualTo "Initial") then {
            [_logic, true] call FUNC(spawnZone);
            SETVAR(_logic,zoneActivated,true);
            LOG_1("_logic: %1 initially activated",_logic);
        }
    };
    case "attributesChanged3DEN": {};
    default {};
};
true