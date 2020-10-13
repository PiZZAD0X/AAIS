#include "script_component.hpp"


params ["_group"];

units _group select {!(primaryWeapon _x isEqualTo "")} apply {
    private _unit = _x;
    private _laserFlashlight = _unit weaponAccessories primaryWeapon _unit select 1;
    if !(_laserFlashlight isEqualTo "" && {!(_laserFlashlight isEqualTo acc_flashlight)}) then {
        _unit removePrimaryWeaponItem "";
        _unit addPrimaryWeaponItem "acc_flashlight";
    };
    private _nvg = hmd _unit;
    if !(_nvg isEqualTo "") then {
        _unit unassignItem _nvg;
        _unit removeItem _nvg;
    };
    _unit enableGunLights "ForceOn";
};
