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
        
        private _activationMode = GETVAR(_logic,zoneActivation,"Conditional");
        private _loc = getPosATL _logic;
        private _size = _logic getVariable ["objectArea", [100, 100]];
        _size params ["_radiusX","_radiusY"];
        private _direction = getDir _logic;
        private _isRectangle = if ((typeOf _logic) isEqualTo QGVAR(ZoneModule_R)) then {true} else {false};
        private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
        private _delay = GETVAR(_logic,zoneDelay,0);
        private _sides = GETVAR(_logic,zoneSides,[ARR_4("BLUFOR","OPFOR","INDFOR","CIVILIAN")]);
        private _activatorClasses = GETVAR(_logic,zoneActivatorType,[ARR_4("Ground","Helicopter","Plane","Ship")]);
        private _code = compile (_logic getVariable [QGVAR(zoneCode),""]);
        private _cond = compile (_logic getVariable [QGVAR(zoneCondition),""]);
        private _entities = [_logic] call FUNC(getSyncedObjects);
        
        LOG_2("_logic: %1 _entities: %2",_logic,_entities);

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

        LOG_1("_zone added to Zones array: %1",_logic);
        LOG_2("_zone: %1 entities: %2",_logic,_entities);
        GVAR(zoneEntities) pushBack [_logic,_entities];
        
        if (_activationMode isEqualTo "Initial") then {
            [_logic,_code,_entities] call FUNC(setupZoneInitial);
            SETVAR(_logic,zoneActivated,true);
            LOG_1("_logic: %1 initially activated",_logic);
        }
    };
    case "attributesChanged3DEN": {};
    default {};
};
true