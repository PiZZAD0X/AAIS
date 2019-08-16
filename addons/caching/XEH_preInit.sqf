#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

EXEC_CHECK(SERVERHC);

[QEGVAR(Core,SettingsLoaded), {
    if !(GETMVAR(Enabled,false)) exitwith {};
    GVAR(stateMachine) = (configFile >> QGVAR(StateMachine)) call CBA_statemachine_fnc_createFromConfig;
}] call CBA_fnc_addEventHandler;

ADDON = true;
