#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Sets up zone with stored synced entities
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Zone Delay <NUMBER>
 * 2: Zone Code <CODE>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [
    ["_zone", "", ["", objNull]],
    ["_initial", false, [false]],
    ["_delay", 0, [0]]
];

if (_zone isEqualType "") then {
    _zone = missionNamespace getVariable [_zone, objNull];
};
if (_zone isEqualTo objNull) exitWith {
    ERROR_1("Zone: %1 objnull",_zone);
};

LOG_1("spawnZone started _zone: %1", _zone);

if !(isMultiplayer) then {
    LOG("!isMultiplayer, createZone function executed");
    [QMGVAR(SpawnZoneEvent), [_zone,_initial,_delay]] call CBA_fnc_localEvent;
} else {
    LOG_1("sending createZone function to clientid %1",EGVAR(Core,HC_ID));
    [QMGVAR(SpawnZoneEvent), [_zone,_initial,_delay], GVAR(HC_ID)] call CBA_fnc_ownerEvent;
};