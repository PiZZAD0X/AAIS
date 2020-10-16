#include "script_component.hpp"

params [
    ["_minSize", 0, [0]],
    ["_maxSize", 5, [5]]
];

private _value = _minSize + floor (random (_maxSize - _minSize));

_value
