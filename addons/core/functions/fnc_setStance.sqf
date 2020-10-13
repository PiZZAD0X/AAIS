#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_groupStance", "AUTO", [""]],
    ["_unitStance", "AUTO", [""]]
];

private _stance = if (!(_groupStance isEqualTo "AUTO") && {_unitStance isEqualTo "AUTO"}) then {
    _groupStance
} else {
    _unitStance
};

if !(_stance isEqualTo "AUTO") then {
    _unit setUnitPos _stance;
};
