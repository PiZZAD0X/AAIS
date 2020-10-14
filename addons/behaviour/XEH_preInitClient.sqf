#include "script_component.hpp"

EXEC_CHECK(HC);

[QGVAR(StanceChangeEvent), {
    params ["_unit", "_groupStance", "_stance"];
    [_unit,_groupStance,_stance] call EFUNC(Core,setStance);
}] call CBA_fnc_addEventHandler;

[QGVAR(reportShotEvent), {
    params ["_firer", "_weapon", "_ammo"];
    allGroups select {
        private _leader = leader _x;
        local _leader &&
        {!isNull _leader} &&
        {alive _leader} &&
        {!isPlayer _leader} &&
        {!(EGETVAR(_leader,Spawn,NOAI,false))} &&
        {EGETVAR(_x,Spawn,Spawned,false)} &&
        {_leader distance _firer <= GVAR(HearingDistance)}
    } apply {
        private _leader = leader _x;
        private _distance = _leader distance _firer;
        private _travelTime = _distance / 343;
        private _revealValue = linearConversion [200, GVAR(HearingDistance), _distance, 4, GVAR(HearingMinIncrease)];
        [{
            params ["_firer","_groupLeader","_revealValue"];
            _groupLeader reveal [_firer, _revealValue];
            if (GETMVAR(VerboseDebug,false)) then {
                LOG_5("%1 got revealed to %2\n %3m, %4 seconds, %5 reveal value.",_firer,_groupLeader,_distance,_travelTime,_revealValue);
            };
        }, [_firer,_leader,_revealValue], _travelTime] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;
