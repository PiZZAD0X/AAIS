#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets modules synced to main module logic
 *
 * Arguments:
 * 0: Module Logic Object <OBJECT>
 * 1: Classnames of synced modules <ARRAY>
 *
 * Return Value:
 * Synced Arrays <ARRAY>
 *
 * Public: No
 */

params ["_logic",["_AllowedModules",[],[[]]]];
private _AllowedSynced = [];
{
    private _syncModule = _x;
    if (_syncModule isKindOf "Logic") then {
        private _Allowed = if !(_AllowedModules isEqualTo []) then {
            (typeof _syncModule) in _AllowedModules
        } else {
            true
        };
        if (_Allowed) then {
            _AllowedSynced pushBack _syncModule;
        };
    };
} foreach synchronizedObjects _logic;
_AllowedSynced