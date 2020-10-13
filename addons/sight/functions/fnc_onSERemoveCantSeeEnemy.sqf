#include "script_component.hpp"

params ["_unit"];

private _enemyTarget = GETVAR(_unit,enemyTarget,objnull);
private _enemyInRange = GETVAR(_unit,enemyInRange,[]);
if (!(_enemyTarget isEqualTo objnull) && {!(_enemyInRange isEqualTo [])} && {count _enemyInRange > 1}) then {
    _enemyInRange = _enemyInRange - [_enemyTarget];
    SETVAR(_unit,enemyInRange,_enemyInRange);
    private _seeChecks = GETVAR(_unit,seeChecks,0);
    SETVAR(_unit,seeChecks,(_seeChecks + 1));
} else {
    SETVAR(_unit,enemyInRange,[]);
};

