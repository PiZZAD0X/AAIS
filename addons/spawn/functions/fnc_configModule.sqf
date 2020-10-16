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

        private _ZoneModules = [_logic, [QGVAR(ZoneModule)]] call FUNC(getSyncedModules);
        
        if (_ZoneModules isEqualTo []) then {
            private _position = getPosATL _logic;
            private _size = _logic getVariable ["objectArea", [100, 100, 0, false]];
            _size params ["_radiusX", "_radiusY"];
            private _direction = getDir _logic;
            private _areaConfig = [_position, _radiusX, _radiusY, _direction, false];
            private _configSelect = GETVAR(_logic,configSelect,"NONE");
            private _side = GETVAR(_logic,Side,"WEST");
            private _random = GETVAR(_logic,Random,false);
            private _minSize = GETVAR(_logic,minSize,3);
            private _maxSize = GETVAR(_logic,maxSize,8);
            private _name = GETVAR(_logic,Name,"");
            private _init = GETVAR(_logic,Init,"");
            if (_init isEqualType "" && {!(_init isEqualTo "")}) then {
                 _init = compile _init;
            } else {
                 _init = false;
            };
            private _probability = GETVAR(_logic,Probability,100);
            private _stance = GETVAR(_logic,Stance,"auto");
            private _createRadius = GETVAR(_logic,CreateRadius,0);
            private _multiplier = GETVAR(_logic,Multiplier,0);
            private _occupy = GETVAR(_logic,Occupy,"Off");
            private _combatMode = GETVAR(_logic,CombatMode,"YELLOW");
            private _behaviour = GETVAR(_logic,Behaviour,"AWARE");
            private _formation = GETVAR(_logic,Formation,"wedge");
            private _speedMode = GETVAR(_logic,SpeedMode,"normal");
            //commander elements
            private _areaAssigned = EGETVAR(_logic,Commander,areaAssigned,"NONE");
            private _assetType = EGETVAR(_logic,Commander,assetType,"INFANTRY");
            private _commanderIgnore = EGETVAR(_logic,Commander,CommanderIgnore,false);
            private _QRF = EGETVAR(_logic,Commander,QRF,false);
            //task elements
            private _forceLights = GETVAR(_logic,ForceLights,0);
            private _task = GETVAR(_logic,Task,"Patrol");
            private _taskRadius = GETVAR(_logic,TaskRadius,30);
            private _taskWait = GETVAR(_logic,taskWait,3);
            private _taskTimer = GETVAR(_logic,TaskTimer,0);

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
            
            private _groupMemArray = [_configSelect, _random, _minSize, _maxSize] call FUNC(getDetailsConfigGroup);
            _groupMemArray params ["_groupMem", "_groupVehs"];
            [["", _groupSet, _groupMem, _groupVehs], true] call FUNC(createGroup);
        };

    };
    case "attributesChanged3DEN": {};
    default {};
};