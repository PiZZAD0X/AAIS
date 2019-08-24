/*
 * Author: AAIS Team
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
#include "script_component.hpp"
EXEC_CHECK(ALL);

LOG("Running CheckIfHC");

private _hc = false;
GVAR(HC_isHC) = false;
GVAR(HC_ID) = false;

// Listen server and SP
if (!isMultiplayer || {(isMultiplayer) && {isServer} && {hasinterface}}) then {
    _hc = true;
    GVAR(HC_isHC) = true;
    SETMPVAR(HC_ID,clientowner);
};

// Headless client
if (!hasInterface && {!isDedicated}) then {
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

if !(isNil QGVAR(HC_ID)) then {
    LOG_1("HC_ID: %1",GVAR(HC_ID));
};

LOG_2("Running CheckIfHC: %1 for client %2",_hc,clientowner);
_hc
