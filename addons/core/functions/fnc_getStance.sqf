#include "script_component.hpp"

params ["_unit"];

private _stance = stance _unit;
private _return = switch (_stance) do {
	case "STAND": {"UP";};
	case "CROUCH": {"MIDDLE";};
	case "PRONE": {"DOWN";};
	case "AUTO": {"AUTO"};
	default {"AUTO"};
};

_return
