#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer || {!hasInterface}) then {
    [QEGVAR(Core,SettingsLoaded), {
        if !(GETMVAR(Enabled,false)) exitwith {};
        GVAR(sightAidStateMachine) = (configFile >> QGVAR(sightAidStateMachine)) call CBA_statemachine_fnc_createFromConfig;
    }] call CBA_fnc_addEventHandler;
};

ADDON = true;