#include "script_component.hpp"
/*
 * Author: TheMagnetar
 * Helper routine for spawning a random group of infantry units.
 *
 * Arguments:
 * 0: Config entry <STRING>
 * 1: Settings <HASH>
 * 2: Side <STRING>
 * 3: Size <NUMBER>
 * 4: Marker <STRING>
 * 6: Position <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * ["usmcInfantry", [], "west", 5, "marker", 0.05] call aais_spawn_fnc_helperSpawnInfantry
 *
 * Public: No
 */

params ["_configEntry", "_settings", "_side", "_size", ["_targetPos", []], ["_isMissionCfg",false,[false]]];

TRACE_5("",_configEntry, _settings, _side, _size, _targetPos);

private ["_leaderPool","_unitPool","_random"];

if (_isMissionCfg) then {
    _leaderPool = getArray (missionConfigFile >> "CfgGroupCompositions" >> _configEntry >> "leaders");
    _unitPool = getArray (missionConfigFile >> "CfgGroupCompositions" >> _configEntry >> "units");
    _random = (getNumber (missionConfigFile >> "CfgGroupCompositions" >> _configEntry >> "random")) == 1;
} else {
    _leaderPool = getArray (ConfigFile >> "CfgGroupCompositions" >> _configEntry >> "leaders");
    _unitPool = getArray (ConfigFile >> "CfgGroupCompositions" >> _configEntry >> "units");
    _random = (getNumber (ConfigFile >> "CfgGroupCompositions" >> _configEntry >> "random")) == 1;
};

TRACE_3("",_leaderPool, _unitPool, _random);

private _spawnUnits = [];

TRACE_1("size before",_size);

if (_size <= 0) then {
    _size = count _unitPool;
};

TRACE_1("size after",_size);

if (_random) then {
    _unitPool = [_unitPool, 10] call EFUNC(core,shuffleArray);

    if (count _leaderPool > 1) then {
        _leaderPool = [_leaderPool, 10] call EFUNC(core,shuffleArray);
    };

    _spawnUnits pushBack (selectRandom _leaderPool);

    // Ignore leader
    for "_i" from 1 to (_size - 1) do {
        _spawnUnits pushBack (selectRandom _unitPool);
    };
} else {
    _spawnUnits append _leaderPool;
    _spawnUnits append _unitPool;
};

GVAR(spawnQueue) pushBack [true,[_spawnUnits, _side, _targetPos, _settings]];

if (GVAR(spawnGroupPFH) == -1) then {
    GVAR(spawnGroupPFH) = [DFUNC(spawnGroupPFH), 1, []] call CBA_fnc_addPerFrameHandler;
};
