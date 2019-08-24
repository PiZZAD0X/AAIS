/*
 * Author: TheMagnetar
 * Helper routine for spawning group of units
 *
 * Arguments:
 * 0: Unit array. First position is always the leader <ARRAY>
 * 1: Marker <STRING>
 * 2: Unit type <STRING>
 * 3: Unit side <STRING>
 * 4: Position <ARRAY><OBJECT><LOCATION><GROUP>
 * 5: Settings <HASH>
 *
 * Return Value:
 * Group <OBJECT>
 *
 * Example:
 * [units, "east", [], []] call aais_spawn_fnc_helperSpawnGroup
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_units", "_side", "_position", "_settings"];

_position = _position call CBA_fnc_getPos;

private _group = objNull;
switch (toLower _side) do {
    case "civilian": {_group = createGroup civilian};
    case "east": {_group = createGroup east};
    case "resistance": {_group = createGroup resistance};
    case "west": {_group = createGroup west};
    default {_group = createGroup east};
};

_group setVariable [QGVAR(settings), _settings];

if !(_position isEqualTo []) then {
    _group setVariable [QEGVAR(core,startPosition), _position];
};

_group setVariable [QEGVAR(core,settings), _settings];
_group setVariable [QGVAR(unitsToSpawn), _units];

private _template = [_settings, "template"] call CBA_fnc_hashGet;

if !(_template isEqualTo "") then {
    private _templateValues = [EGVAR(core,groupTemplates), _template] call CBA_fnc_hashGet;

    _templateValues params ["", "", "", "_loadout", "_rank", "_skill"];
    _group setVariable [QGVAR(template), [_loadout, _rank, _skill]];
};

[_group, _settings] call EFUNC(core,applyOptionsPreSpawn);

[DFUNC(spawnUnitsGroupPFH), 0.1, _group] call CBA_fnc_addPerFrameHandler;
