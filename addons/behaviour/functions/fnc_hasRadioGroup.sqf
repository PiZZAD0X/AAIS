#include "..\..\script_macros.hpp"


params ["_group"];

private _return = units _group findIf {[_x] call acre_api_fnc_hasRadio} != -1;

_return
