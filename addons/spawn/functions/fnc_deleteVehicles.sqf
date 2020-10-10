#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Deletes synced objvects after collecting entity data
 *
 * Arguments:
 * 0: Array of objects <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_entities"];

_entities apply {
    private _obj = _x;
    if !(_obj isEqualTo objNull) then {
        attachedObjects _obj apply {
            detach _x;
            deleteVehicle _x;
        };
        //crew _obj apply {
        //    _obj deleteVehicleCrew _x
        //};
        deleteVehicle _obj;
        if !(group _obj isEqualTo grpNull) then {
            deleteGroup group _obj;
        };
    };
};