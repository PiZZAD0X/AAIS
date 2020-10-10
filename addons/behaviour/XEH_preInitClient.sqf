#include "script_component.hpp"

EXEC_CHECK(HC);

[QMGVAR(StanceChangeEvent), {
    params ["_unit", "_groupStance", "_stance"];
    [_unit,_groupStance,_stance] call FUNC(setStance);
}] call CBA_fnc_addEventHandler;
