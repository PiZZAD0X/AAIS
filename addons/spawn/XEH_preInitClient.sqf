#include "script_component.hpp"

EXEC_CHECK(HC);

GVAR(spawnGroupPFH) = -1;
GVAR(spawnQueue) = [];
GVAR(spawnUnitsQueue) = [];
GVAR(spawnUnitsQueueActiveGroup) = [];
GVAR(Zones) = [];
GVAR(ZoneEntities) = [];

GVAR(GroupConfigs) = [];
configproperties [missionConfigFile >> "CfgGroupCompositions", "isclass _x"] apply {
    private _cfg = _x;
    if !(
        [
            "leaders",
            "units",
            "crew",
            "cargoLeaders",
            "cargo"
        ] findIf {
            ([_cfg, _x,[]] call BIS_fnc_returnConfigEntry) isEqualTo []
        } == -1
    ) then {
        GVAR(GroupConfigs) pushBackUnique (configName _cfg);
    };
};
configproperties [configfile >> "CfgGroupCompositions", "isclass _x"] apply {
    private _cfg = _x;
    if !(
        [
            "leaders",
            "units",
            "crew",
            "cargoLeaders",
            "cargo"
        ] findIf {
            ([_cfg, _x,[]] call BIS_fnc_returnConfigEntry) isEqualTo []
        } == -1
    ) then {
        GVAR(GroupConfigs) pushBackUnique (configName _cfg);
    };
};

[QMGVAR(SpawnZoneEvent), {
    params [
        ["_zone", objNull, [objNull]],
        ["_initial", false, [false]],
        ["_delay", 0, [0]]
    ];
    [_zone, _initial, _delay] call FUNC(createZone);
}] call CBA_fnc_addEventHandler;

[{
    [] call FUNC(ZoneMonitor);
    [] call FUNC(initMain);
}, []] call CBA_fnc_execNextFrame;
