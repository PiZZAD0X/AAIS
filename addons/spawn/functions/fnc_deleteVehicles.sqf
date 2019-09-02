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

{
    private _veh = _x;
    if (!isNull _veh && {!(_veh isKindOf "Logic")}) then {
        {
            detach _x;
            deleteVehicle _x;
        } foreach attachedObjects _veh;
        deleteVehicle _veh;
        (group _veh) deleteGroupWhenEmpty true;
    };
} forEach _entities;