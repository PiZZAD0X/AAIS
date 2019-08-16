#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if !(GETMVALUE(Enabled,false)) exitWith {
    INFO("AAIS is disabled in Mission settings... exiting");
};
INFO("Initializing MAI");

LOG("Global Pre Init");
SETMVAR(Initialized,false);
[] call FUNC(setDefaults);

if (isServer) then {
    DGVAR(groupRegisters) = [];
    DGVAR(groupTemplates) = [] call CBA_fnc_hashCreate;
};

private _MAIVersionCreatedStr = (GETMVALUE(Version_Created,""));
if (_MAIVersionCreatedStr isEqualto "") then {
    SETMVAR(Version_CreatedNum,102);
    INFO("Mission Created with Framework Version: Legacy");
} else {
    private _MAIVersionCreated = parseNumber ((_MAIVersionCreatedStr splitString ".") joinString "");
    SETMVAR(Version_CreatedNum,_MAIVersionCreated);
    INFO_1("Mission Created with Framework Version:%1",_MAIVersionCreated);
};

private _MAIVersionStr = (GETMVALUE(Version_Updated,""));
if (_MAIVersionStr isEqualto "") then {
    SETMVAR(Version_UpdatedNumber,102);
    INFO("Mission Updated with Framework Version: Legacy");
} else {
    private _MAIVersion = parseNumber ((_MAIVersionStr splitString ".") joinString "");
    SETMVAR(Version_UpdatedNumber,_MAIVersion);
    INFO_1("Mission Updated with Framework Version:%1",_MAIVersion);
};

[QGVAR(registerGroup), {
    params ["_group", ["_registerMarker", ""]];

    GVAR(groupRegisters) pushBack [_group, _registerMarker];

    if (_registerMarker isEqualTo "") exitWith {};

    private _markerGroups = missionNamespace getVariable [format [QGVAR(%1), _registerMarker], []];
    _markerGroups pushBack _group;
    missionNamespace setVariable [format [QGVAR(%1), _registerMarker], _markerGroups];
}] call CBA_fnc_addEventHandler;

[QGVAR(unregisterGroup), {
    params ["_group"];

    {
        if ((_x select 0) isEqualTo _group) exitWith {
            private _markerGroups = missionNamespace getVariable [format [QGVAR(%1), _x select 1], []];
            _markerGroups deleteAt (_markerGroups find _group);

            GVAR(groupRegisters) deleteAt _forEachIndex;
        };
    } forEach GVAR(groupRegisters);
}] call CBA_fnc_addEventHandler;

ADDON = true;
