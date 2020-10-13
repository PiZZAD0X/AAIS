#include "script_component.hpp"


params ["_group"];

private _return = units _group findIf {!((secondaryWeapon _x) isEqualTo "")} != -1;

_return