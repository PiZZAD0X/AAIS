#include "script_component.hpp"

/*
 * Author: PiZZADOX
 * Gets random position within radius
 *
 * Arguments:
 * 0: Position <ARRAY>
 * 1: Minimum Range <NUMBER>
 * 2: Maximum Range <NUMBER>
 * 3: Position Calculate Number <NUMBER>
 * 4: Water Position <BOOL>
 *
 * Return Value:
 * Position <ARRAY> 
 *
 * Public: No
 */

params [["_pos",[0,0,0],[[]]],["_rangeMin",0,[0]],["_rangeMax",100,[100]],["_posCount",5,[5]],["_water",false,[false]]];

private _return = [];
if (_posCount <= 1) then {
    _posCount = 5;
};
private _max = (_posCount * 5);
if (_rangeMax < _max) then {
    _rangeMax = _max;
};
for "_i" from 0 to _max step 1 do {
    private _angle = random 360;
    private _dist = _rangeMin + (random (_rangeMax - _rangeMin));
    private _newPos = _pos getPos [_dist,_angle];
    if ((!_water) && {surfaceIsWater _newPos}) then {
        _i = _i - 1;
        _newPos = [];
    };
    if !(_newPos isEqualTo []) then {
        _return pushBack _newPos;
    };
};
_return