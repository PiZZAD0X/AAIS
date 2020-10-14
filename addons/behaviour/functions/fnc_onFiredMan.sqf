#include "script_component.hpp"

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

if !(local _unit) exitwith {};
if !(GETMVAR(HearingAid,true)) exitWith {};
if (GETMVAR(OnlyPlayers,true) && {!(isPlayer leader _unit)}) exitWith {};

private _lockoutTime = GETVAR(_unit,firedLockoutTime,-1);
if (CBA_MissionTime < _lockoutTime) exitWith {};
SETVAR(_unit,firedLockoutTime,CBA_MissionTime + 5);
[QGVAR(reportShotEvent), [_unit,_weapon,_ammo], EGVAR(Core,HC_ID)] call CBA_fnc_targetEvent;
