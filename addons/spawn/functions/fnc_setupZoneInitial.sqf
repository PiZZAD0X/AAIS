#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Sets up zone with stored synced entities in initial/instant mode
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Zone Code <CODE>
 * 2: Zone Entities <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_logic","_code","_entities"];

LOG_2("setupZoneInitial started _logic: %1 _initmode: %2 _entities: %3",_logic,_initial,_entities);

if !(_entities isEqualto []) then {
    if (!isMultiplayer) then {
        LOG("!isMultiplayer, createZone function executed");
        [_logic,_entities,_code] call FUNC(createZone);
    } else {
        params ["_logic","_entities","_code"];
        LOG_1("sending createZone function to clientid %1",EGVAR(Core,HC_ID));
        [
            [_logic,_entities,_code], {
                if (EGETMVAR(Core,HC_isHC,false)) then {
                    _this call FUNC(createZone);
                };
            }
        ] remoteExec ["bis_fnc_call", EGVAR(Core,HC_ID)];
    };
};