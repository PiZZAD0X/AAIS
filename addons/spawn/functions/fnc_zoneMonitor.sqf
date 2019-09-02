#include "script_component.hpp"
/*
 * Author: PiZZADOX
 * Monitors zone conditions and activation state, activating them when conditions met.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

GVAR(ZoneMonitorPFH) = [{
    params ["_args","_idPFH"];
    {
        _x params ["_logic","_area","_delay","_sides","_activatorClasses","_cond","_code","_activationMode"];
        private _isOn = GETVAR(_logic,zoneActivated,false);
        LOG_1("zone checked: %1",_x);
        private _aliveplayers = ([] call CBA_fnc_players) select {
            alive _x
        };
        private _shouldBeOn = switch (_activationMode) do {
            case "Initial": {false};
            case "Conditional": {
                ((_aliveplayers findIf {
                    private _player = _x;
                    (_player inArea _area)
                    && {(side _player) in _sides}
                    && {(({(vehicle _player) isKindOf _x} count _activatorClasses) > 0)}
                }) > -1);
            };
            case "Custom Conditional": {
                (((_aliveplayers findIf {
                    private _player = _x;
                    (_player inArea _area)
                    && {(side _player) in _sides}
                    && {(({(vehicle _player) isKindOf _x} count _activatorClasses) > 0)}
                }) > -1) && {(call _cond)});
            };
            case "Custom": {
                (call _cond);
            };
            default {};
        };
        LOG_1("_shouldBeOn: %1",_shouldBeOn);
        if (_shouldBeOn && {!_isOn}) then {
            LOG_1("setup _logic: %1",_logic);
            [_logic,_delay,_code] spawn FUNC(setupZone);
            _isOn = true;
            SETVAR(_logic,zoneActivated,true);
        };
    } forEach GVAR(Zones);
}, 5] call CBA_fnc_addPerFrameHandler;