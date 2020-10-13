#include "script_component.hpp"


params [
	["_list",[],[[]]],
	["_object",objnull,[objnull]],
	["_randomSelect",false,[false]]
];

if ("_object" isEqualTo objnull) exitWith {};
if ("_list" isEqualTo []) exitWith {};

_list apply {
	[_object distance2d _x,_x];
};

_list sort true;

private _selectIndex = if (_randomSelect) then {
	random (count _list / 2)
} else {
	0
};

private _closestObject = (_list select _selectIndex) select 1;

_closestObject
