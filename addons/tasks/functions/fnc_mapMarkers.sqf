#include "script_component.hpp"

params [
    "_group",
    "_side",
    "_group",
    "_leader",
    "_groupcount",
    "_task",
    "_behaviour",
    "_target",
    "_position",
    "_areaAssigned",
    "_assetType"
];

if (!alive _leader || {!local _leader}) then {
    private _index = GVAR(MarkerArray) findIf {_x select 0 isEqualTo _group};
    if (_index > -1) then {
        GVAR(MarkerArray) deleteAt _index;
    };
} else {
    private _rankshort = [rank _leader,"displayNameShort"] call BIS_fnc_rankparams;
    private _lastName = name _leader;
    private _markercolour = switch (_side) do {
        case west: {"ColorBlue"};
        case east: {"ColorRed"};
        case independent: {"ColorGreen"};
        case civilian: {"ColorYellow"};
        default {"ColorBlack"};
    };
    private _index = GVAR(MarkerArray) findIf {_x select 0 isEqualTo _group};
    private _markerArray = if (_index isEqualTo -1) then {
        [_group]
    } else {
        GVAR(MarkerArray) select _index
    };
    _markerArray params [
        "_group",
        ["_trackername", "", [""]],
        ["_destname", "", [""]],
        ["_destlinename", "", [""]],
        ["_targetname", "", [""]]
    ];
    if (_trackername isEqualTo "") then {
        _trackername = format ["trk_%1_%2",_side,_group];
        createMarker [_trackername,[0,0]];
        _markerArray set [1, _trackername];
        private _drawicon = switch (_assetType) do {
            case "Infantry": {"b_inf"};
            case "Motorized": {"b_motor_inf"};
            default {"b_inf"};
        };
        _trackername setMarkerShape "ICON";
        _trackername setMarkerSize [0.5, 0.5];
        _trackername setMarkerType _drawicon;
        _trackername setmarkercolor _markercolour;
    };
    _trackername setmarkerpos [getpos _leader select 0, getpos _leader select 1];
    private _usedest = (_task in MARKERTASKSDEST);
    private _usetarget = if (_target isEqualTo objnull) then {
        _target = "NONE";
        false
    } else {
        true
    };
    private _text = if ((GETMVAR(CommanderEnabled,false)) && {(GETMVAR(CommanderSide,east)) isEqualTo _side}) then {
        format ["%1. %2 - Grpcount: %3 - Task: %4 - Area: %7 - Type: %8 - CombatMode: %5 - Target: %6",_rankshort, _lastname, _groupcount, _task, _behaviour, _target, _areaAssigned, _assetType];
    } else {
        format ["%1. %2 - Grpcount: %3 - Task: %4 - CombatMode: %5 - Target: %6",_rankshort, _lastname, _groupcount, _task, _behaviour, _target];
    };
    //LOG_1("MarkerText: %1",_text);
    _trackername setMarkerText _text;
    if (_usedest) then {
        if (_destname isEqualTo "") then {
            _destname = format ["dest_%1_%2",_side,_group];
            createMarker [_destname,[0,0]];
            _markerArray set [2, _destname];
            _destname setMarkerShape "ICON";
            _destname setMarkerType "mil_marker";
            _destname setMarkerSize [0.25,0.25];
            _destname setmarkercolor _markercolour;
        };
        private _wpArray = waypoints _group;
        private _wpPos = [0,0,0];
        if !(_wpArray isEqualto []) then {
            private _wpindex = currentWaypoint _group;
            _wpPos = waypointPosition [_group, _wpindex];
            _destname setMarkerPos _wpPos;
        } else {
            _destname setMarkerAlpha 0;
        };
        private _dist = (_position distance2D _wpPos) / 2;
        private _ang = _position getDir _wpPos;
        private _center = _position getPos [_dist, _ang];
        if (_destlinename isEqualTo "") then {
            _destlinename = format ["destline_%1_%2",_side,_group];
            createMarker [_destlinename,[0,0]];
            _markerArray set [3, _destlinename];
            _destlinename setMarkerShape "RECTANGLE";
            _destlinename setMarkerBrush "SOLID";
            _destlinename setmarkercolor _markercolour;
        };
        _destlinename setMarkerSize [1,_dist];
        _destlinename setMarkerDir _ang;
        _destlinename setMarkerPos _center;
    } else {
        if !(_destname isEqualTo "") then {
            deletemarker _destname;
            _markerArray set [2, ""];
        };
        if !(_destlinename isEqualTo "") then {
            deletemarker _destlinename;
            _markerArray set [3, ""];
        };
    };
    if (_usetarget) then {
        if (_targetname isEqualTo "") then {
            _targetname = format ["target_%1_%2",_side,_group];
            createMarker [_targetname,[0,0]];
            _markerArray set [4, _targetname];
            private _targettext = format ["%1. %2",_rankshort,_lastname];
            _targetname setMarkerShape "ICON";
            _targetname setMarkerType "mil_objective";
            _targetname setMarkerSize [0.5,0.5];
            _targetname setmarkercolor _markercolour;
            _targetname setMarkerText _targettext;
        };
        _targetname setMarkerPos [getpos _target select 0, getpos _target select 1];
    } else {
        if !(_targetname isEqualTo "") then {
            deletemarker _targetname;
            _markerArray set [4, ""];
        };
    };
    if (_index == -1) then {
        GVAR(MarkerArray) pushBack _markerArray;
    } else {
        GVAR(MarkerArray) set [_index, _markerArray];
    };
};
