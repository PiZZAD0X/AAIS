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

params [["_zone",objNull,[objNull]],["_entities",[],[[]]],["_delay",0,[0]],"_code"];

[{
    params ["_zone","_entities","_code"];
    _entities params [["_grps",[],[[]]],["_emptyvehs",[],[[]]],["_objs",[],[[]]]];
    {
        private _veh = _x;
        private _vehicle = createVehicle [(_veh select 0),(_veh select 1),[],0,"CAN_COLLIDE"];
        _vehicle setPosATL (_veh select 1);
        _vehicle setVectorDirAndUp [_veh select 2,_veh select 3];
        _vehicle setDamage (_veh select 4);
        _vehicle setFuel (_veh select 5);
        {
            _x params [["_class","",[""]],["_path",[],[[]]],["_ammo",0,[0]]];
            _vehicle setMagazineTurretAmmo [_class,_ammo,_path];
        } forEach (_veh select 6);
        _vehicle lock (_veh select 7);
        if ((count (_veh select 9)) > 1) then {
            missionNamespace setVariable[(_veh select 9), _vehicle];
        };
        [_vehicle,(_veh select 10)] call FUNC(setPersistent);
        _vehicle call (_veh select 11);
    } forEach _emptyvehs;
    {
        private _obj = _x;
        private _object = createVehicle [(_obj select 0),(_obj select 1),[],0,"CAN_COLLIDE"];
        _object setVectorDirAndUp [_obj select 2,_obj select 3];
        _object setPosATL (_obj select 1);
        _object setVariable ["persistent",true,true];
        _object setDamage (_obj select 4);
        if ((count (_obj select 6)) > 1) then {
            missionNamespace setVariable[(_obj select 6), _object];
        };
        [_object,(_obj select 7)] call FUNC(setPersistent);
        _object call (_obj select 8);
    } forEach _objs;
    {
        private _grpSet = _x select 1;
        if (((_grpSet select 15) > 0) && {!(_grpSet select 16)}) then {
            _x call FUNC(createOccupyGroup);
        } else {
            _x call FUNC(createGroup);
        };
    } forEach _grps;
    [_zone] call _code;
}, [_zone,_entities,_code],_delay] call CBA_fnc_waitAndExecute;

