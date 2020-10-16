#include "script_component.hpp"

params ["_entity"];

private _synced = synchronizedObjects _entity select {
    _x isKindOf QGVAR(TaskModule)
};

!(_synced isEqualTo [])