#include "script_component.hpp"

params [
    "_configEntry",
    "_random",
    "_minSize",
    "_maxSize"
];

private _missionConfigs = configproperties [missionConfigFile >> "CfgGroupCompositions", "isclass _x"];
private _baseConfig = [configFile, missionConfigFile] select (_configEntry in _missionConfigs);
private _cfg = (_baseConfig >> "CfgGroupCompositions" >> _configEntry);
private _vehiclesCfg = [_cfg, "vehicles", []] call BIS_fnc_returnConfigEntry;
private _unitsArray = [];
private _vehsArray = [];

if (_vehiclesCfg isEqualTo []) then {
    private _leadersCfg = [_cfg, "leaders", []] call BIS_fnc_returnConfigEntry;
    if (_random) then {_leadersCfg = [selectRandom _leadersCfg]};
    _leadersCfg apply {
        private _unitInfo = [_x] call FUNC(getDetailsCfgArray);
        _unitsArray pushBack _unitInfo;
    };
    private _unitsCfg = [_cfg, "units", []] call BIS_fnc_returnConfigEntry;
    private _unitsSpawn = if (_random) then {
        private _numToSpawn = [_minSize, _maxSize] call EFUNC(Core,getRandomMinMax);
        private _tempArray = [];
        for "_i" from 0 to _numToSpawn step 1 do {
            private _unit = selectRandom _unitsCfg;
            _tempArray pushBack _unit;
        };
        _tempArray
    } else {
        _unitsCfg
    };
    _unitsSpawn apply {
        private _unitInfo = [_x] call FUNC(getDetailsCfgArray);
        _unitsArray pushBack _unitInfo;
    };
} else {
    private _crewCfg = [_cfg, "crew", []] call BIS_fnc_returnConfigEntry;
    private _cargoCfg = [_cfg, "cargo", []] call BIS_fnc_returnConfigEntry;
    private _leadersCfg = [_cfg, "cargoLeaders", []] call BIS_fnc_returnConfigEntry;
    private _cargoSpawnNum = if (_random) then {
        [_minSize, _maxSize] call EFUNC(Core,getRandomMinMax)
    } else {
        count _cargoCfg + count _leadersCfg
    };
    _vehiclesCfg apply {
        private _vehicle = _x;
        private _roles = _vehicle call BIS_fnc_vehicleRoles;
        //private _turrets = [_vehicle, false] call BIS_fnc_allTurrets;
        private _crew = _roles select {_x select 0 != "Cargo"} apply {
            params ["_role", "_path"];
            private _index = if (_role == "cargo") then {
                _path select 0
            } else { _path };
            private _roleInfo = [_role, _index];
            private _unitInfo = [selectRandom _crewCfg] call FUNC(getDetailsCfgArray);
            [_roleInfo, _unitInfo]
        };
        private _cargo = [];
        if (_random) then {_leadersCfg = [selectRandom _leadersCfg]};
        _leadersCfg apply {
            private _unitInfo = [_x] call FUNC(getDetailsCfgArray);
            _cargo pushBack _unitInfo;
        };
        private _cargoCrew = _roles select {_x select 0 == "Cargo"};
        _cargoSpawnNum = ({_x select 0 == "Cargo"} count _cargoCrew) max _cargoSpawnNum;
        for "_i" from 0 to _cargoSpawnNum step 1 do {
            if (count _cargo >= _cargoSpawnNum) exitWith {};
            private _unit = if (_random) then {
                selectRandom _cargoCfg
            } else { _cargoCfg select _i };
            private _unitInfo = [_unit] call FUNC(getDetailsCfgArray);
            _cargo pushBack [["Cargo", _i], _unitInfo];
        };
        _crew append _cargo;
        _vehsArray pushBack [_vehicle, _crew];
    };
};

[_unitsArray, _vehsArray]
