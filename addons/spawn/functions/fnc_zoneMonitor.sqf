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
        private _aliveplayers = ([] call CBA_fnc_players) select {alive _x};
        LOG_3("zone checked: %1 _activatorClasses: %2 _aliveplayers: %3",_x,_activatorClasses,_aliveplayers);
        private _shouldBeOn = switch (_activationMode) do {
            case "Initial": {false};
            case "Conditional": {
                ((_aliveplayers findIf {
                    private _player = _x;
                    (_player inArea _area)
                    && {side _player in _sides}
                    && {_activatorClasses findIf {(vehicle _player) isKindOf _x} > -1}
                }) > -1);
            };
            case "Custom Conditional": {
                (((_aliveplayers findIf {
                    private _player = _x;
                    (_player inArea _area)
                    && {side _player in _sides}
                    && {_activatorClasses findIf {(vehicle _player) isKindOf _x} > -1}
                }) > -1) && {call _cond});
            };
            case "Custom": {
                (call _cond);
            };
            default {false};
        };
        LOG_1("_shouldBeOn: %1",_shouldBeOn);
        if (_shouldBeOn && {!_isOn}) then {
            LOG_1("setup _logic: %1",_logic);
            [_logic, false, _delay] call FUNC(spawnZone);
            _isOn = true;
            SETVAR(_logic,zoneActivated,_isOn);
        };
    } forEach GVAR(Zones);
}, 10] call CBA_fnc_addPerFrameHandler;