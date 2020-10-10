#include "script_component.hpp"

params [["_mode","",[""]],["_input",[],[[]]]];
switch (_mode) do {
    case "init": {
        EXEC_CHECK(ALL);
        _input params ["_logic",["_isActivated",true,[true]]];
        if (is3den) then {
            private _AreaModules = (all3DENEntities select 3) select {_x isKindOf QGVAR(AreaModule)};
            private _AreaModulesList = [];
            private _compareList = (_AreaModules - [_logic]);
            LOG_2("_logic: %1 _compareList: %2",_logic,_compareList);
            {
                private _AreaName = (_x get3DENAttribute QGVAR(AreaName)) select 0;
                if !(_AreaName in _AreaModulesList) then {
                    _AreaModulesList append [_AreaName];
                };
            } foreach _compareList;
            LOG_2("_logic: %1 _AreaModulesList: %2",_logic,_AreaModulesList);
            private _AreaName = (_logic get3DENAttribute QGVAR(AreaName)) select 0;
            if (_AreaName in _AreaModulesList) exitwith {
                ERROR_1("Duplicate AreaName for Commander Area %1",_AreaName);
                [_AreaName,_logic,_AreaModulesList] spawn {
                    params ["_AreaName","_logic","_AreaModulesList"];
                    private _result = ["Area Name duplicate found, please rename one of the Areas", "Duplicate Area Name", "Rename?", true, (findDisplay 313)] call BIS_fnc_guiMessage;
                    if (_result) then {
                        for "_i" from 1 to (count _AreaModulesList) step 1 do {
                            private _newName = format ["Area_%1",_i];
                            LOG_3("logic %1 newName %2 currentList %3",_logic,_newName,_AreaModulesList);
                            if !(_newName in _AreaModulesList) exitwith {
                                _logic set3DENAttribute [QGVAR(AreaName), _newName];
                                LOG_2("Renamed %1 to %2",_logic,_newName);
                            };
                        };
                    };
                };
            };
        } else {
            private _AreaName = GETVAR(_logic,AreaName,"Area0");
            private _loc = getPosATL _logic;
            private _size = _logic getVariable ["objectArea", [100, 100, 0, false]];
            _size params ["_radiusX","_radiusY", "_direction", "_isRectangle"];
            private _area = [_loc,_radiusX,_radiusY,_direction,_isRectangle];
            private _sendArray = [_AreaName,_area,_logic];
            if (isNil QGVAR(AreaArray)) then {
                GVAR(AreaArray) = [_sendArray];
            } else {
                private _index = (GVAR(AreaArray)) findIf {(_x select 0) isEqualTo _AreaName};
                if (_index isEqualTo -1) then {
                    GVAR(AreaArray) set [_index,_sendArray];
                } else {
                    GVAR(AreaArray) pushback _sendArray;
                };
            };
            publicvariable QGVAR(AreaArray);
        };
    };
    case "attributesChanged3DEN": {
        _input params ["_logic",["_isActivated",true,[true]]];
        private _AreaModules = (all3DENEntities select 3) select {_x isKindOf QGVAR(AreaModule)};
        private _AreaModulesList = [];
        private _compareList = (_AreaModules - [_logic]);
        LOG_2("_logic: %1 _compareList: %2",_logic,_compareList);
        {
            private _AreaName = (_x get3DENAttribute QGVAR(AreaName)) select 0;
            if !(_AreaName in _AreaModulesList) then {
                _AreaModulesList append [_AreaName];
            };
        } foreach _compareList;
        LOG_2("_logic: %1 _AreaModulesList: %2",_logic,_AreaModulesList);
        private _AreaName = (_logic get3DENAttribute QGVAR(AreaName)) select 0;
        if (_AreaName in _AreaModulesList) exitwith {
            ERROR_1("Duplicate AreaName for Commander Area %1",_AreaName);
            [_AreaName,_logic,_AreaModulesList] spawn {
                params ["_AreaName","_logic","_AreaModulesList"];
                private _result = ["Area Name duplicate found, please rename one of the Areas", "Duplicate Area Name", "Rename?", true, (findDisplay 313)] call BIS_fnc_guiMessage;
                if (_result) then {
                    for "_i" from 1 to (count _AreaModulesList) step 1 do {
                        private _newName = format ["Area_%1",_i];
                        LOG_3("logic %1 newName %2 currentList %3",_logic,_newName,_AreaModulesList);
                        if !(_newName in _AreaModulesList) exitwith {
                            _logic set3DENAttribute [QGVAR(AreaName), _newName];
                            LOG_2("Renamed %1 to %2",_logic,_newName);
                        };
                    };
                };
            };
        };
    };
    default {};
};
true
