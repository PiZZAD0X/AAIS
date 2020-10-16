#include "script_component.hpp"

params ["_unitEntry"];

private _unitClass = "";
private _unitLoadout = [];
if (_unitEntry isEqualType "") then {
    _unitClass = _unitEntry;
} else {
    _unitEntry params ["_uClass", "_uLoadout"];
    _unitClass = _uClass;
    _unitLoadout = _uLoadout;
};
[_unitClass, _unitLoadout]