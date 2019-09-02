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

params ["_arr"];

{
    private _vehicle = _x;
    if (!(_vehicle isKindOf "Logic") && {!isNull _vehicle}) then {
        {
            private _object = _x;
            detach _object;
            deleteVehicle _object;
        } foreach attachedObjects _vehicle;
        deleteVehicle _vehicle;
        if !((group _vehicle) isEqualTo grpNull) then {
            deleteGroup (group _vehicle);
        };
    };
} forEach _arr;