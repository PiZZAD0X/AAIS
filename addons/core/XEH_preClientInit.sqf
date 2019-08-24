#include "script_component.hpp"
EXEC_CHECK(CLIENTHC);

[QGVAR(SettingsLoaded), {
    if (hasInterface) exitWith {};

    if (GETMVAR(AIViewDistanceEnabled,false)) then {
        setViewDistance GVAR(AIViewDistance);
        setTerrainGrid 50;
    };

    if (GVAR(ForceTimeEnable)) then {
        private _forcedDate = [date select 0, date select 1, date select 2, GVAR(ForceTime) select 0, GVAR(ForceTime) select 1];
        GVAR(TimeHandlePFH) = [{
            params ["_argNested", ""]; // Second argument. PFH ID
            _argNested params ["_forcedDate"];
            setdate _forcedDate;
        }, 1, [_forcedDate]] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;
