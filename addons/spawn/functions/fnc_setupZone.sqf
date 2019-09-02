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

params ["_logic",["_delay",0,[0]],"_code"];

LOG_1("setupZone started _logic:%1",_logic);

private _index = [GVAR(zoneEntities),_logic,0] call EFUNC(Core,searchNestedArray);
private _entities = (GVAR(zoneEntities) select _index) select 1;

LOG_2("_logic: %1 _entities: %2",_logic,_entities);
if !(_entities isEqualto []) then {
    if (!isMultiplayer) then {
        LOG("!isMultiplayer, createZone function executed");
        [_logic,_entities,_delay,_code] call FUNC(createZone);
    } else {
        params ["_logic","_entities","_delay","_code"];
        LOG_1("sending createZone function to clientid %1",EGVAR(Core,HC_ID));
        [
            [_logic,_entities,_delay,_code], {
                if (EGETMVAR(Core,HC_isHC,false)) then {
                    _this call FUNC(createZone);
                };
            }
        ] remoteExec ["bis_fnc_call", EGVAR(Core,HC_ID)];
    };
};