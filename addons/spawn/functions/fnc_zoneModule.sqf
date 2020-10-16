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
            
            _configModules apply {
                private _logicConfig = _x;
                private _position = getPosATL _logicConfig;
                private _size = _logicConfig getVariable ["objectArea", [100, 100, 0, false]];
                _size params ["_radiusX", "_radiusY"];
                private _direction = getDir _logicConfig;
                private _areaConfig = [_position, _radiusX, _radiusY, _direction, false];
                private _configSelect = GETVAR(_logicConfig,configSelect,"NONE");
                private _side = GETVAR(_logicConfig,Side,"WEST");
                private _name = GETVAR(_logicConfig,Name,"");
                private _init = GETVAR(_logicConfig,Init,"");
                private _probability = GETVAR(_logicConfig,Probability,100);
                private _stance = GETVAR(_logicConfig,Stance,"auto");
                private _forceLights = GETVAR(_logicConfig,ForceLights,0);
                private _task = GETVAR(_logicConfig,Task,"Patrol");
                private _taskRadius = GETVAR(_logicConfig,TaskRadius,30);
                private _taskWait = GETVAR(_logicConfig,taskWait,3);
                private _taskTimer = GETVAR(_logicConfig,TaskTimer,0);
                private _createRadius = GETVAR(_logicConfig,CreateRadius,0);
                private _multiplier = GETVAR(_logicConfig,Multiplier,0);
                private _occupy = GETVAR(_logicConfig,Occupy,"Off");
                private _combatMode = GETVAR(_logicConfig,CombatMode,"YELLOW");
                private _behaviour = GETVAR(_logicConfig,Behaviour,"AWARE");
                private _formation = GETVAR(_logicConfig,Formation,"wedge");
                private _speedMode = GETVAR(_logicConfig,SpeedMode,"normal");
                private _areaAssigned = EGETVAR(_logicConfig,Commander,areaAssigned,"NONE");
                private _assetType = EGETVAR(_logicConfig,Commander,assetType,"INFANTRY");
                private _commanderIgnore = EGETVAR(_logicConfig,Commander,CommanderIgnore,false);
                private _QRF = EGETVAR(_logicConfig,Commander,QRF,false);
                if (_init isEqualType "" && {!(_init isEqualTo "")}) then {
                     _init = compile _init;
                } else {
                     _init = false;
                };
                private _groupSet = [
                    _side,
                    _position,
                    _behaviour,
                    _combatMode,
                    _speedMode,
                    _formation,
                    _stance,
                    _init,
                    _createRadius,
                    _taskRadius,
                    _taskWait,
                    _task,
                    _taskTimer,
                    _multiplier,
                    _occupy,
                    [],
                    _forceLights,
                    false,
                    [],
                    _name,
                    "",
                    _areaAssigned,
                    _assetType,
                    _commanderIgnore,
                    _QRF
                ];
                private _groupMemArray = [_configSelect] call FUNC(getDetailsConfigGroup);
                _groupMemArray params ["_groupMem", "_groupVehs"];
                _configs pushback ["", _groupSet, _groupMem, _groupVehs];
            };    
        };
        SETPVAR(_logic,configs,_configs);
        
        private _templates = [];
        private _templateModules = [_logic,[QGVAR(Templates)]] call FUNC(getSyncedModules);
        if !(_templateModules isEqualTo []) then {
            LOG_2("_logic: %1 _templateModules: %2",_logic,_templateModules);
        };
        SETPVAR(_logic,templates,_templates);
        
        private _tasks = [];
        private _tasksModules = [_logic,[QEGVAR(Tasks,TaskModule)]] call FUNC(getSyncedModules);
        SETPVAR(_logic,tasks,_tasks);

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