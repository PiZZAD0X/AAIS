#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Sets occupy mode for multiplied groups
 *
 * Arguments:
 * 0: Occupy Mode <NUMBER>
 * 1: Group Multiplier <NUMBER>
 *
 * Return Value:
 * Occupy Mode <NUMBER>
 *
 * Public: No
 */

params ["_multiOccupy","_gx"];
private _return = switch (_multiOccupy) do {
    case 1: {floor(_gx*0.25);};
    case 2: {floor(_gx*0.5);};
    case 3: {floor(_gx*0.75);};
    case 4: {floor(_gx*(random 1));};
    case 5: {1};
    case 6: {2};
    case 7: {3};
    case 8: {4};
    case 9: {5};
    default {0};
};
_return