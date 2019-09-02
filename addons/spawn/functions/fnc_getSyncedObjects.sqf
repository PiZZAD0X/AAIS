#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets info from objects synced to the module
 *
 * Arguments:
 * 0: Module Logic Object <OBJECT>
 *
 * Return Value:
 * Synced Arrays <ARRAY>
 *
 * Public: No
 */

params ["_logic"];

private _synced = synchronizedObjects _logic;
LOG_1("command _synced %1",_synced);
{
    private _obj = _x;
    if (_obj isKindOf "StaticWeapon"
        || _obj isKindOf "Static"
        || _obj isKindOf "Air"
        || _obj isKindOf "Ship"
        || _obj isKindOf "LandVehicle"
    ) then {
        _synced = _synced + (units _obj);
        _synced = _synced + (assignedCargo _obj);
    };
} foreach _synced;
_synced = _synced arrayIntersect _synced;

private _vehLog = [];
private _groups = [];
private _vehs = [];
private _things = [];
LOG_1("_synced %1",_synced);
{
    private _obj =  _x;
    if (_obj isKindOf "Logic") then {
        //TODO synced logics
    } else {
        if (_obj isKindOf "Man") then {
            private _group = group _obj;
            private _gLeader = leader _group;
            if (_gLeader isEqualTo _obj) then {
                private _gPos = getposATL _gLeader;
                private _units = units _group;
                private _gArray = [str _group,[],[]];
                private _gMultiplier = GETVAR(_group,multiplier,0);
                private _gStance = GETVAR(_group,stance,"AUTO");
                //LOG_2("_group: %1 _gMultiplier: %2",_group,_gMultiplier);
                private _gPosArray = [];
                private _gPosNew = _gPos;
                private _gCreateRadius = GETVAR(_group,createRadius,0);
                if (_gCreateRadius > 0) then {
                    _gPosArray = [_gPos,0,_gCreateRadius,(_gMultiplier * 5)] call EFUNC(Core,getRandomPositionCircle);
                    if (!(_gPosArray isEqualTo [])) then {
                        private _index = (floor random (count _gPosArray));
                        _gPosNew = _gPosArray deleteAt _index;
                    };
                };
                {
                    private _unit = _x;
                    private _unitPos = getPosATL _unit;
                    //LOG_2("_unit: %1 _unitPos: %2",_unit,_unitPos);
                    if (!(_gPosNew isEqualTo _gPos)) then {
                        _unitPos = [_gPosNew,_gLeader,_unit] call EFUNC(Core,getNewPos);
                        //LOG_3("GroupPos not equal to groupPosNew, getting new unit pos for: %1 OldPos: %2 NewPos: %3",_unit,(getPosATL _unit),_unitPos);
                    };
                    private _veh = assignedVehicle _unit;
                    if !(isNull _veh) then {
                        private _vehPos = getposATL _veh;
                        if !(_gPosNew isEqualTo _gPos) then {
                            _vehPos = _gPosNew;
                        };
                        if !(_veh in _vehLog) then {
                            (_gArray select 2) pushBack ([_veh,_vehPos] call FUNC(getDetailsVehicle));
                            _vehLog pushBack _veh;
                        };
                    };
                    if (_gLeader isEqualTo _unit) then {
                        {
                            (_gArray select 1) pushback _x;
                        } forEach ([_unit,_gPosNew] call FUNC(getDetailsGroup));
                    };
                    private _unitArray = [_unit,_unitPos,_veh,_gStance] call FUNC(getDetailsUnit);
                    //LOG_1("_unitArray: %1",_unitArray);
                    (_gArray select 2) pushback _unitArray;
                    //LOG_1("_group select 2: %1",(_group select 2));
                } foreach _units;
                private _occupy = ((_gArray select 1) select 15);
                private _newOccupy = [GETVAR(_group,multiOccupy,0),_gMultiplier] call FUNC(setMultiOccupy);
                //LOG_2("_gArray: %1 _newOccupy: %2",_group,_newOccupy);
                private _currentPos = ((_gArray select 1) select 1);
                if (_gMultiplier isEqualTo 0) then {
                    _groups pushback _gArray;
                } else {
                    for "_gc" from 0 to _gMultiplier step 1 do {
                        if (_gMultiplier > 0) then {
                            if (!(_gPosArray isEqualTo [])) then {
                                private _index = (floor random (count _gPosArray));
                                _currentPos = _gPosArray select _index;
                                _gPosArray deleteAt _index;
                            };
                        };
                        if (_gc < _newOccupy || _newOccupy isEqualTo 0) then {
                            private _newgroup =+ _gArray;
                            _newgroup set [0,format["%1_%2",(str _group),_gc]];
                            (_newgroup select 1) set [1, _currentPos];
                            (_newgroup select 1) set [15, _occupy];
                            {
                                private _unit = _x;
                                _unit params ["","","_unitPos"];
                                _unit set [2,(_unitPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                            } foreach (_newgroup select 2);
                            _groups pushback _newgroup;
                        } else {
                            private _newgroup =+ _gArray;
                            _newgroup set [0,format["%1_%2",(str _group),_gc]];
                            (_newgroup select 1) set [1, _currentPos];
                            (_newgroup select 1) set [15, 0];
                            {
                                private _unit = _x;
                                _unit params ["","","_unitPos"];
                                _unit set [2,(_unitPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                            } foreach (_newgroup select 2);
                            _groups pushback _newgroup;
                        };
                    };
                };
            };
        } else {
            if (_obj isKindOf "Thing") then {
                _things pushback ([_obj] call FUNC(getDetailsThing));
            } else {
                if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static" || _obj isKindOf "Air" || _obj isKindOf "Ship" || _obj isKindOf "LandVehicle") then {
                    private _group = group ((crew _obj) select 0);
                    if (isNull _group) then {
                        _vehs pushback ([_obj] call FUNC(getDetailsVehicleEmpty));
                    };
                };
            };
        };
    };
} foreach _synced;
private _entities = [_groups,_vehs,_things];
LOG_3("Deleting %1 Objects for Logic: %2 Entities: %3",count _synced,_logic,_entities);
[_synced] call FUNC(deleteVehicles);
_entities