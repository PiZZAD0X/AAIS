#include "script_component.hpp"

[QGVAR(shareInfo), {
    params ["_info"];

    _info params ["_group", "_unitInfo"];

    private _leader = leader _group;

    {
        params ["_unit", "_knowledge", "_skill"];
        private _averageSkill = ((_leader skill "commanding") + _skill) / 2;
        private _knowledge = _knowledge - (1 - _averageSkill);
        if ((_leader knowsAbout _unit) > _knowledge) then {
        _leader reveal [_unit, _knowledge];
        };
    } forEach _unitInfo;
}] call CBA_fnc_addEventHandler;
