#include "script_component.hpp"
/*
 * Author: TheMagnetar & PiZZADOX
 * Spawns a group defined in a config entry.
 *
 * Arguments:
 * 0: Config Logic <OBJECT> (default: objnull)
 * 1: Area <ARRAY> (default: [])
 * 2: Config entry <STRING> (default: "")
 * 3: Group Multiplier <NUMBER> (default: 1)
 * 4: Group size either in [min, max] format or a defined number <ARRAY><NUMBER> (default: 0)
 * 4: Additional options for the group <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * ["infantryUSMC", [2, 5], "marker"] call aais_spawn_fnc_spawnGroupFromConfig
 ^ ["infantryUSMC", 4, "marker", player] call aais_spawn_fnc_spawnGroupFromConfig
 *
 * Public: Yes
 */

params [
    ["_logic",objnull,[objnull]],
    ["_area",[],[[]]],
    ["_configEntry", "", [""]],
    ["_groupMultiplier",1,[1]],
    ["_groupSize",0,[0]],
    ["_overrideOptions",[],[[]]]
];

_area params [
    ["_position",[0,0,0],[[]]],
    ["_radiusX",0,[0]],
    ["_radiusY",0,[0]],
    ["_direction",0,[0]],
    ["_isRectangle",false,[false]]
];


//search for config in missionConfigFile, then in core configs.
private _index = GVAR(GroupConfigs) find _configEntry;
private _missionConfigs = configproperties [missionConfigFile >> "CfgGroupCompositions", "isclass _x"];
private _isMissionCfg = if (_configEntry in _missionConfigs) then {true} else {false};

// Basic options should be always defined
private _options = [];
private _settings = [] call CBA_fnc_hashCreate;
private ["_type","_side"];

if (_isMissionCfg) then {
    {
        private _values = getArray (missionConfigFile >> "CfgGroupCompositions" >> _configEntry >> _x);
        _options pushBack [_x, _values];
    } forEach ["behaviour", "combatMode", "formation", "speed", "skill", "skillLeader"];
    _options = getArray (missionConfigFile >> "CfgGroupCompositions" >> _configEntry >> "options");
    _type = toLower (getText (missionConfigFile >> "CfgGroupCompositions" >> _configEntry >> "type"));
    _side = getText (missionConfigFile >> "CfgGroupCompositions" >> _configEntry >> "side");
} else {
    {
        private _values = getArray (configFile >> "CfgGroupCompositions" >> _configEntry >> _x);
        _options pushBack [_x, _values];
    } forEach ["behaviour", "combatMode", "formation", "speed", "skill", "skillLeader"];
    _options = getArray (configFile >> "CfgGroupCompositions" >> _configEntry >> "options");
    _type = toLower (getText (configFile >> "CfgGroupCompositions" >> _configEntry >> "type"));
    _side = getText (configFile >> "CfgGroupCompositions" >> _configEntry >> "side");
};

TRACE_4("",_configEntry,_type,_side,_groupMultiplier);

_settings = [_settings, _area, _type] call EFUNC(core,setBasicSettings);
_settings = [_settings, _options] call EFUNC(core,parseOptions);

if !(_overrideOptions isEqualTo []) then {
    [_settings, _overrideOptions] call EFUNC(core,parseOptions);
};

for "_i" from 1 to _groupMultiplier do {
    // Determine group size
    private _size = if (_type isEqualTo "infantry") then {
        [_groupSize] call EFUNC(core,getRandomMinMax);
    } else {
        if (_groupSize isEqualType 0) then {
            _groupSize = [0,0];
        };
        _groupSize params ["_gSize", "_cargoSize"];
        [[_groupSize select 0] call EFUNC(core,getRandomMinMax), [_groupSize select 1] call EFUNC(core,getRandomMinMax)];
    };
    // Generate units
    if (_type isEqualTo "infantry") then {
        [_configEntry, _settings, _side, _size, _position] call FUNC(helperSpawnInfantry);
    } else {
        [_configEntry, _settings, _side, _size, _position] call FUNC(helperSpawnVehicle);
    };
};

