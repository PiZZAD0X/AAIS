#include "script_component.hpp"
/*
 * Author: PiZZAD0X
 * Gets the index of the first nested array in (1) that contains (2) at index (3). Also matches nested nested arrays.
 * Use -1 as an index wildcard, and the function will search every value of the nested array.
 *
 * Arguments:
 * 0: Array to search for nested arrays in <ARRAY>
 * 2: Value to search for <ANY>
 * 3: the element of the nested array that the value matches <NUMBER>
 *
 * Return Value:
 * Index of the match, -1 if there is no match <NUMBER>
 *
 * Example:
 * [arr1, val1, 0] call aais_core_fnc_searchNestedArray
 *
 * Public: Yes
 */

params ["_hayStackArray", "_needleValue", ["_searchIndex", 0, [0]]];

scopeName "main";
private _index = -1;

{
    private _currentIndex = _forEachIndex;
    if (_searchIndex != -1) then {
        if ((_x select _searchIndex) isEqualTo _needleValue) exitWith {
            _index = _currentIndex;
        };
    } else {
        private _nestedArray = _x;
        {
            if (_x isEqualTo _needleValue) then {
                _index = _currentIndex;
                breakTo "main";
            };
        } forEach _nestedArray;
    };
} forEach _hayStackArray;

_index
