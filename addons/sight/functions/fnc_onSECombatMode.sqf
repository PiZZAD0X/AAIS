#include "script_component.hpp"

params ["_unit"];

if (GETVAR(group _unit,forcedCombatMode,"AUTO") isEqualTo "AUTO") then {
	_unit setCombatMode "RED";
	_unit setBehaviour "COMBAT";
};

private _enemyTarget = GETVAR(_unit,enemyTarget,objnull);
if (_enemyTarget isEqualTo objnull) exitwith {};
private _distance = GETVAR(_unit,enemyDistance,600);
if (_distance > GETMVAR(SightAidDistance,600)) exitwith {};
private _knowsabouttarget = _unit knowsabout _enemyTarget;
if (_knowsabouttarget < 4) then {
	private _cansee = [objNull, "VIEW"] checkVisibility [eyePos _Unit, eyePos _enemyTarget];
	if ((_cansee > 0.6) && {(_distance < GETMVAR(SightAidEngageDistance,200))}) exitwith {
		_unit reveal [_enemyTarget, 4];
		_unit doSuppressiveFire _enemyTarget;
	};
	if (_cansee > 0.05) then {
		private _revealValue = linearConversion [100, GETMVAR(SightAidDistance,600), _distance, 4, GETMVAR(SightAidMinIncrease,1)];
		_unit reveal [_enemyTarget, _knowsabouttarget + _revealValue];
		if (EGETMVAR(Core,VerboseDebug,false)) then {
			LOG_4("revealing: %1 to %2, old knows: %3 new: %4",_enemyTarget,_unit,_knowsabouttarget,(_unit knowsabout _enemyTarget));
		};
	};
};

