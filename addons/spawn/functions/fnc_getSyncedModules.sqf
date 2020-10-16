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

params [
    "_logic",
    ["_filter",[],[[]]]
];

private _filteredSynced = synchronizedObjects _logic select {
    _x isKindOf "Logic" &&
    {_filter isEqualTo [] || {typeof _x in _filter}}
};

_filteredSynced