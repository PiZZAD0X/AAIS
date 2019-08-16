#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

EXEC_CHECK(SERVERHC);

GVAR(stateMachine) = (configFile >> QGVAR(StateMachine)) call CBA_statemachine_fnc_createFromConfig;

GVAR(definedTasks) = ["attack", "defend", "donothing", "patrol", "patrolrandom"];

ADDON = true;
