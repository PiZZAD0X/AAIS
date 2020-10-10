#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Creates Zone and spawns entities
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Zone Entities <ARRAY>
 * 1: Zone Delay <NUMBER>
 * 2: Zone Code <CODE>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [
    ["_zone", objNull, [objNull]],
    ["_initial", false, [false]],
    ["_delay", 0, [0]]
];

LOG_1("createZone started _zone: %1", _zone);

private _createZone = {
    params ["_zone", "_initial"];

    private _entities = GETVAR(_zone,entities,[]);
    private _configs = GETVAR(_zone,configs,[]);
    private _templates = GETVAR(_zone,templates,[]);
    private _code = GETVAR(_zone,code,{});
        
    LOG_2("%1 _entities: %2", _zone, _entities);
    
    _entities params [
        ["_groups",[],[[]]],
        ["_emptyVehs",[],[[]]],
        ["_objects",[],[[]]]
    ];
    
    _emptyVehs apply {
        _x call FUNC(createEmptyVehicle);
    };

    _objects apply {
        _x call FUNC(createObject);
    };
    
    if !(_configs isEqualto []) then {
        _configs apply {
            _x call FUNC(spawnGroupFromConfig);
        };
    };
    
    _groups apply {
        if (_initial) then {
            [_x, true] call FUNC(createGroup);
        } else {
            GVAR(spawnQueue) pushBack [false, _x];

            if (GVAR(spawnGroupPFH) == -1) then {
                GVAR(spawnGroupPFH) = [FUNC(spawnGroupPFH), 1, []] call CBA_fnc_addPerFrameHandler;
            };
        };
    };
    
    [_zone] call _code;
};

if (!_initial && {_delay isEqualTo 0}) then {
    [_zone, _initial] call _createZone;
} else {
    [{
        params ["_zone", "_initial", "_createZone"];
        [_zone, _initial] call _createZone;
    }, [_zone, _initial, _createZone], _delay] call CBA_fnc_waitAndExecute;
};



