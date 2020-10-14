#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrlCombo","_cursel"];

private _configType = _ctrlCombo lbData _cursel;
private _logic = (get3DENSelected "logic") select 0;
SETVAR(_logic,ConfigSelect,_configType);
private _configsMission = configproperties [missionConfigFile >> "CfgGroupCompositions", "isclass _x"];
private _configsDefaults = configproperties [configfile >> "CfgGroupCompositions", "isclass _x"];
private _config = "";
_configsMission apply {
    if (_configType isEqualTo (configName _x)) exitwith {
        _config = _x;
    };
};
if (_config isEqualTo "") then {
    _configsDefaults apply {
        if (_configType isEqualTo (configName _x)) exitwith {
            _config = _x;
        };
    };
};

[_ctrlCombo, _config, _configType, _logic] spawn {
    disableserialization;
    params ["_ctrlCombo", "_config", "_configType", "_logic"];
    private _activeUnitArray = [];
    private _activeUnitControls = [];
    private _activeVehArray = [];
    private _activeVehControls = [];
    if !(_configType isEqualTo "NONE") then {
        private _unitArray = (
            ([_config,"leaders",[]] call BIS_fnc_returnConfigEntry) +
            ([_config,"units",[]] call BIS_fnc_returnConfigEntry) +
            ([_config,"crew",[]] call BIS_fnc_returnConfigEntry) +
            ([_config,"cargoLeaders",[]] call BIS_fnc_returnConfigEntry) +
            ([_config,"cargo",[]] call BIS_fnc_returnConfigEntry)
        );
        LOG_2("_config: %1 _unitArray: %2",_config,_unitArray);
        if !(_unitArray isEqualTo []) then {
            private _unitCount = count _unitArray;
            if (_unitCount > 20) then {_unitCount = 20;};
            for "_uc" from 0 to (_unitCount - 1) step 1 do {
                private _idc = 5220 + _uc;
                private _tooltip = _unitArray select _uc;
                _activeUnitControls pushBack _idc;
                _activeUnitArray pushBack _tooltip;
            };
        };
        if (isArray (_config >> "vehicles")) then {
            private _vehArray = getArray (_config >> "vehicles");
            if !(_vehArray isEqualTo []) then {
                private _vehCount = count _vehArray;
                if (_vehCount > 3) then {_vehCount = 3;};
                for "_vc" from 0 to (_vehCount - 1) step 1 do {
                    private _idc = 5320 + _vc;
                    private _tooltip = _vehArray select _vc;
                    _activeVehControls pushBack _idc;
                    _activeVehArray pushBack _tooltip;
                };
            };
        };
    };
    private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;
    private _allControls = allcontrols ctrlparent _ctrlCombo;
    private _allPictures = _allControls select {(ctrlParentControlsGroup ctrlParentControlsGroup _x isEqualto _ctrlGroup) 
            && {(ctrlClassName _x find "Picture") > -1}
    };
    _allPictures apply {
        private _ctrl = _x;
        private _ctrlIDC = ctrlIDC _x;
        private _vehControl = _ctrlIDC in [5320,5321,5322,5323];
        private _state = false;
        private _tooltip = "";
        private _icon = "";
        if (_vehControl) then {
            _state = (_ctrlIDC in _activeVehControls);
            if !(_activeVehArray isEqualTo []) then {
                _tooltip = _activeVehArray deleteAt 0;
                _icon = switch (true) do {
                    case (_tooltip isKindOf "Helicopter"): {
                        "\A3\ui_f\data\map\vehicleicons\iconHelicopter_ca.paa";
                    };
                    case (_tooltip isKindOf "Air"): {
                        "\A3\ui_f\data\map\vehicleicons\iconPlane_ca.paa";
                    };
                    case (_tooltip isKindOf "Ship"): {
                        "\A3\ui_f\data\map\vehicleicons\iconShip_ca.paa";
                    };
                    case (_tooltip isKindOf "Truck_F"): {
                        "\A3\ui_f\data\map\vehicleicons\iconTruck_ca.paa";
                    };
                    case (_tooltip isKindOf "Tank"): {
                        "\A3\ui_f\data\map\vehicleicons\iconTank_ca.paa";
                    };
                    case (_tooltip isKindOf "Wheeled_APC_F"): {
                        "\A3\ui_f\data\map\vehicleicons\iconAPC_ca.paa";
                    };
                    case (_tooltip isKindOf "MRAP_01_base_F"): {
                        "\A3\ui_f\data\map\vehicleicons\iconAPC_ca.paa";
                    };
                    case (_tooltip isKindOf "Car"): {
                        "\A3\ui_f\data\map\vehicleicons\iconCar_ca.paa";
                    };
                    case (_tooltip isKindOf "StaticAAWeapon"): {
                        "\A3\ui_f\data\map\vehicleicons\iconStaticAA_ca.paa";
                    };
                    case (_tooltip isKindOf "StaticATWeapon"): {
                        "\A3\ui_f\data\map\vehicleicons\iconStaticCannon_ca.paa";
                    };
                    case (_tooltip isKindOf "StaticMGWeapon"): {
                        "\A3\ui_f\data\map\vehicleicons\iconStaticMG_ca.paa";
                    };
                    case (_tooltip isKindOf "StaticMortar"): {
                        "\A3\ui_f\data\map\vehicleicons\iconStaticMortar_ca.paa";
                    };
                    default {
                        "\A3\ui_f\data\map\vehicleicons\iconAPC_ca.paa";
                    };
                };
                _ctrl ctrlSetText _icon; 
            };
        } else {
            _state = (_ctrlIDC in _activeUnitControls);
            if !(_activeUnitArray isEqualTo []) then {
                _tooltip = _activeUnitArray deleteAt 0;
                private _config = [_tooltip] call CBA_fnc_getObjectConfig;
                _icon = [_config,"icon","iconMan"] call BIS_fnc_returnConfigEntry;
                _icon = "\A3\ui_f\data\map\vehicleicons\" + _icon + "_ca.paa";
                _ctrl ctrlSetText _icon; 
            };
        };
        _ctrl ctrlSetTooltip _tooltip;
        private _fade = [1,0] select _state;
        _ctrl ctrlenable _state;
        _ctrl ctrlShow _state;
        _ctrl ctrlsetfade _fade;
        _ctrl ctrlcommit 0;
        ctrlsetfocus _ctrl;
        ctrlsetfocus _ctrlCombo;
    };
};