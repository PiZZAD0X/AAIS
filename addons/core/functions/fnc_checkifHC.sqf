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

LOG("Running CheckIfHC");

GVAR(HC_isHC) = false;
GVAR(HC_ID) = false;

//listen server and SP
if (!isMultiplayer || {!hasInterface && {!isDedicated}} || {isMultiplayer && {isServer} && {hasinterface}}) then {
    GVAR(HC_isHC) = true;
    SETMPVAR(HC_ID,clientowner);
};

//server or client
if (isDedicated) then {
    LOG("clientID: SERVER");
} else {
    LOG_1("clientID: %1",clientowner);
};

LOG_1("HC_ID: %1",GVAR(HC_ID));
LOG_2("Running CheckIfHC: %1 for client %2",GVAR(HC_isHC),clientowner);
