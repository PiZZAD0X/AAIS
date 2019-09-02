#include "script_component.hpp"
/*
 * Author: PiZZAD0X, TheMagnetar
 * Checks if the machine is a Headless Client (HC).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * True if machine is HC, false otherwise <BOOL>
 *
 * Example:
 * [] call aais_core_fnc_checkIfHC
 *
 * Public: No
 */

private _hc = false;
GVAR(HC_isHC) = false;
GVAR(HC_ID) = false;

// Listen server and SP
if ((isServer && {hasinterface}) || {!hasInterface && {!isDedicated}}) then {
    _hc = true;
    GVAR(HC_isHC) = true;
    SETMPVAR(HC_ID,clientowner);
};

// Server or client
if (isServer) then {
    LOG("clientID: SERVER");
} else {
    LOG_1("clientID: %1",clientowner);
};

LOG_3("Running CheckIfHC: %1 for client %2 HC_ID: %3",_hc,clientowner,GVAR(HC_ID));

_hc
