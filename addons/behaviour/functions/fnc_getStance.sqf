#include "script_component.hpp"

params ["_stance"];

private _return = switch (_stance) do {
	case "STAND": {"UP";};
	case "CROUCH": {"MIDDLE";};
	case "PRONE": {"DOWN";};
	case "AUTO": {"AUTO"};
	default {"AUTO"};
};

_return
