/*
 * Author: TheMagnetar
 * Spawns a random group of units.
 *
 * Arguments:
 * 0: Marker information <STRING><ARRAY>
 *  0: Marker <STRING>
 * 1: Groups to Spawn <ARRAY>
 *  0: Group count either in [min, max] format or a defined number <ARRAY><NUMBER> (default: 0)
 *  1: Config/template entry or array of units <STRING><ARRAY> (default: "")
 *  2: Group size either in [min, max] format or a defined number or group side <ARRAY><NUMBER><STRING> (default: 0)
 *  3: Position <ARRAY><OBJECT><LOCATION><GROUP> (default: [])
 *  4: Override options <ARRAY> (default: [])
 *  5: Group type <STRING> (default: "infantry")
 * 2: Common options to override <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * ["marker", [[3, "infantryUSMC", [2, 5]], [2, "infantryUSMC", 4]]] call aais_spawn_fnc_populateMarker
 *
 * Public: Yes
 */
#include "script_component.hpp"
EXEC_CHECK(SERVERHC);

params [
    ["_marker", "", ["", []]],
    ["_groupsToSpawn", [], [[]]],
    ["_commonOptions", [], [[]]]
];

if !([_marker] call EFUNC(waypoint,checkMarkerInput)) exitWith {};

if (!GVAR(debugEnabled) && {markerAlpha _marker != 0}) then {
    _marker setMarkerAlpha 0;
};

{
    _x params [
        ["_groupCount", 0, [[], 0], [1, 2]],
        ["_entry", "", ["", []]],
        ["_groupSize", 0, ["", [], 0], [2]],
        ["_position", [], [[], objNull, grpNull, locationNull], [0, 2, 3]],
        ["_overrideOptions", [], [[]]],
        ["_type", "infantry", [""]]
    ];

    // Determine group count
    private _num = [_groupCount] call EFUNC(core,getRandomMinMax);
    _overrideOptions append _commonOptions;

    for "_i" from 1 to _num do {
        if (_entry isEqualType "") then {
            if (isClass (missionConfigFile >> "CfgGroupCompositions" >> _entry)) then {
                [_entry, _groupSize, _marker, _position, _overrideOptions] call FUNC(spawnGroupFromConfig);
            } else {
                [_entry, 1, _marker, _position, _overrideOptions] call FUNC(spawnGroupFromTemplate);
            };
        } else {
            // _groupSize indicates in this case the group side
            [_entry, _marker, _type, _groupSize, _position, _overrideOptions] call FUNC(spawnGroup);
        };
    };
} forEach _groupsToSpawn;

if (GVAR(spawnGroupPFH) == -1) then {
    GVAR(spawnGroupPFH) = [DFUNC(spawnGroupPFH), 1, []] call CBA_fnc_addPerFrameHandler;
};
