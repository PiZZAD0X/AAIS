class GVAR(standardNumberControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 101) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 101);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 101;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
 class GVAR(stanceControl): Toolbox {
    attributeLoad = "_index = ['auto','down','middle','up'] find _value; missionNamespace setvariable ['AAIS_stance_value',_index]; (_this controlsGroupCtrl 110) lbsetcursel _index;";
    attributeSave = "['auto','down','middle','up'] select (missionNamespace getvariable ['AAIS_stance_value',0]);";
    h = 8 * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 8 * GRID_H;
        };
        class Value: Value {
            idc = 110;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 8 * GRID_H;
            rows = 1;
            columns = 4;
            strings[] = {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\down_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\middle_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\up_ca.paa"
            };
            tooltips[] = {
                $STR_3den_attributes_stance_default,
                $STR_3den_attributes_stance_down,
                $STR_3den_attributes_stance_middle,
                $STR_3den_attributes_stance_up
            };
            values[] = {-1,0,1,2};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_stance_value',_this select 1];";
        };
    };
};
class GVAR(patrolradiusControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 102) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 102); if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;}; [_value] spawn AAIS_fnc_setRadial; _value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 102;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class GVAR(behaviourControl) : Title    {
    attributeLoad = "_index = ['careless','safe','aware','combat','stealth'] find _value; missionNamespace setvariable ['AAIS_behaviour_value',_index]; (_this controlsGroupCtrl 103) lbsetcursel _index;";
    attributeSave = "['careless','safe','aware','combat','stealth'] select (missionNamespace getvariable ['AAIS_behaviour_value',1]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 103;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 5;
            values[] = {0,1,2,3,4};
            strings[] = {"Careless","Safe","Aware","Combat","Stealth"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_behaviour_value',_this select 1];";
        };
    };
};

class GVAR(waypointwaitControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 105) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 105);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 105;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
 
class GVAR(combatmodeControl) : Title    {
    attributeLoad = "_index = (['blue','green','white','yellow','red'] find _value); missionNamespace setvariable ['AAIS_combatmode_value',_index]; (_this controlsGroupCtrl 106) lbsetcursel _index;";
    attributeSave = "['blue','green','white','yellow','red'] select (missionNamespace getvariable ['AAIS_combatmode_value',4]);";
    h = "25 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "25 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 106;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "25 * (pixelH * pixelGrid * 0.50)";
            rows = 5;
            columns = 1;
            values[] = {0,1,2,3,4};
            strings[] = {"$STR_3DEN_Attributes_CombatMode_Blue_text","$STR_3DEN_Attributes_CombatMode_Green_text","$STR_3DEN_Attributes_CombatMode_White_text","$STR_3DEN_Attributes_CombatMode_Yellow_text","$STR_3DEN_Attributes_CombatMode_Red_text"};
            tooltips[] = {
                "$STR_3DEN_Attributes_CombatMode_Blue_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Green_tooltip",
                "$STR_3DEN_Attributes_CombatMode_White_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Yellow_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Red_tooltip"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_combatmode_value',_this select 1];";
        };
    };
};
class GVAR(taskControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['AAIS_task_value',_value]; (_this controlsGroupCtrl 107) lbsetcursel (_value);";
    attributeSave = "missionNamespace getvariable ['AAIS_task_value',4];";
    h = "20 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "20 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 107;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "20 * (pixelH * pixelGrid * 0.50)";
            rows = 5;
            columns = 2;
            values[] = {0,1,2,3,4,5,6,7,8,9,10};
            strings[] = {
                "Loiter",
                "Hold Until",
                "Sentry",
                "Stationary",
                "Patrol",
                "Patrol Perimeter",
                "Move to Patrol Buildings",
                "Move to Defend Buildings",
                "Entrenched",
                "Reinforcments",
                "None"
            };
            tooltips[] = {
                "Loiter in position, ambient animations.",
                "Hold position until contacted.",
                "Perform basic sentry walk back and forth 10m.",
                "Used for placing units in difficult positions, will never move or turn.",
                "Random patrol area within task radius.",
                "Random Patrol on the edge of task radius.",
                "From start location move to buildings and patrol within them.",
                "From start location move to buildings and hold position until contacted.",
                "Stationary units with far engagement ranges",
                "Squad which holds until called by friendlies to reinforce",
                "None"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_task_value',_this select 1];";
        };
    };
};
class GVAR(formationControl) : Toolbox {
    attributeLoad = "_index = ['wedge','vee','line','column','file','stag_column','ech_left','ech_right','diamond'] find _value; missionNamespace setvariable ['AAIS_formation_value',_index]; (_this controlsGroupCtrl 108) lbsetcursel _index;";
    attributeSave = "['wedge','vee','line','column','file','stag_column','ech_left','ech_right','diamond'] select (missionNamespace getvariable ['AAIS_formation_value',0]);";
    h = 2 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 2 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 108;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 2 * SIZE_M * GRID_H;
            rows = 1;
            columns = 9;
            strings[] = {
                "\a3\3DEN\Data\Attributes\Formation\wedge_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\vee_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\line_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\column_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\file_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\stag_column_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\ech_left_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\ech_right_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\diamond_ca.paa"
            };
            values[] = {0,1,2,3,4,5,6,7,8};
            tooltips[] = {
                $STR_WEDGE,
                $STR_VEE,
                $STR_LINE,
                $STR_COLUMN,
                $STR_File,
                $STR_STAGGERED,
                $STR_ECHL,
                $STR_ECHR,
                $STR_DIAMOND
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_formation_value',_this select 1];";
        };
    };
};
class GVAR(speedControl) : Toolbox {
    attributeLoad = "_index = ['limited','normal','full'] find _value; missionNamespace setvariable ['AAIS_speed_value',_index]; (_this controlsGroupCtrl 109) lbsetcursel _index;";
    attributeSave = "['limited','normal','full'] select (missionNamespace getvariable ['AAIS_speed_value',0]);";
    h = 2 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 2 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 109;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 2 * SIZE_M * GRID_H;
            rows = 1;
            columns = 3;
            strings[] = {
                "\a3\3DEN\Data\Attributes\SpeedMode\limited_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\normal_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\full_ca.paa"
            };
            values[] = {0,1,2};
            tooltips[] = {
                $STR_3den_attributes_speedmode_limited,
                $STR_3den_attributes_speedmode_normal,
                $STR_3den_attributes_speedmode_full
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_speed_value',_this select 1];";
        };
    };
};
class GVAR(startbuildingControl) : Title    {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['AAIS_startbuilding_value',_index]; (_this controlsGroupCtrl 119) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['AAIS_startbuilding_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 119;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"OFF","ON"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_startbuilding_value',_this select 1];";
        };
    };
};
class GVAR(multiplierControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 120) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 120);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 120;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class GVAR(occupyoptionControl) : Title {
    attributeLoad = "missionNamespace setvariable ['AAIS_occupyoption_value',_value]; (_this controlsGroupCtrl 121) lbsetcursel (((_value) min 7) max 0);";
    attributeSave = "missionNamespace getvariable ['AAIS_occupyoption_value',0];";
    h = "20 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "20 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 121;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "20 * (pixelH * pixelGrid * 0.50)";
            rows = 4;
            columns = 2;
            values[] = {0,1,2,3,4,5,6,7};
            strings[] = {
                "OFF","Random Option Below",
                "Nearest Building","Random Building",
                "Near GROUP of Buildings","Random GROUP of Buildings",
                "Near MULTIPLE Buildings","Random MULTIPLE Buildings"
            };
            tooltips[] = {
                "Group will not occupy a building.","Random Occupy Option (From Below Options)",
                "Occupy nearest enterable building.","Occupy a random enterable building with in task radius.",
                "Occupy nearest group of buildings with in task radius.","Occupy random group of buildings with in task radius.",
                "Occupy nearest multiple buildings with in task radius.","Occupy random multiple buildings with in task radius."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_occupyoption_value',_this select 1];";
        };
    };
};

class GVAR(persistentControl) : Title {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['AAIS_persistent_value',_index]; (_this controlsGroupCtrl 124) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['AAIS_persistent_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 124;
              style = "0x02";
              x = "48 * (pixelW * pixelGrid * 0.50)";
              w = "82 * (pixelW * pixelGrid * 0.50)";
              h = "5 * (pixelH * pixelGrid * 0.50)";
              rows = 1;
              columns = 2;
            values[] = {0,1};
              strings[] = {"Not Persistent","Persistent"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_persistent_value',_this select 1];";
        };
    };
};

class GVAR(unitnameControl) : Edit {
        onLoad="\
            private ['_isUnitPlayable'];\
            private _unit = ((get3denselected 'object') select 0);\
            private _ctrl = _this select 0;\
            private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;\
            {\
                if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
                    if !(isNull player) then {\
                         _isUnitPlayable = ((_unit in playableUnits) || (_unit isEqualto player));\
                    } else {\
                         _isUnitPlayable = (_unit in playableUnits);\
                    };\
                    _state = [true,false] select (_isUnitPlayable);\
                    _fade = [0.75,0] select _state;\
                    _x ctrlenable _state;\
                    _x ctrlsetfade _fade;\
                    _x ctrlshow _state;\
                    _x ctrlcommit 0;\
                    ctrlsetfocus _x;\
                    ctrlsetfocus _ctrl;\
                };\
            } foreach (allcontrols (ctrlparent _ctrl));\
        ";
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 125) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 125);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 125;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
            canModify = 1;
         };
     };
 };
 
class GVAR(multioccupyControl) : Title {
    attributeLoad = "missionNamespace setvariable ['AAIS_multioccupy_value',_value]; (_this controlsGroupCtrl 126) lbsetcursel (((_value) min 9) max 0);";
    attributeSave = "missionNamespace getvariable ['AAIS_multioccupy_value',1];";
    h = "10 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "10 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 126;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "10 * (pixelH * pixelGrid * 0.50)";
            rows = 2;
            columns = 5;
            values[] = {0,1,2,3,4,5,6,7,8,9};
            strings[] = {
                "ALL","25%","50%","75%","RANDOM",
                "ONE","TWO","THREE","FOUR","FIVE"
            };
            tooltips[] = {
                "All generated groups will use the same occupy option as this group.",
                "25% generated groups will use the occupy options.",
                "50% generated groups will use the occupy options.",
                "75% generated groups will use the occupy options.",
                "A random number of generated groups will use the occupy options.",
                "One generated group will use the occupy options.",
                "Two generated groups will use the occupy options.",
                "Three generated groups will use the occupy options.",
                "Four generated groups will use the occupy options.",
                "Five generated groups will use the occupy options."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_multioccupy_value',_this select 1];";
        };
    };
};
class GVAR(moduleradiusControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 127) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 127);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 127;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
 
class GVAR(moduleradiusControl2) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 227) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 227);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
            idc = 227;
            style = ST_LEFT;
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
 
class GVAR(zoneDelayControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 128) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 128);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
            idc = 128;
            style = ST_LEFT;
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
 class GVAR(zoneInitialSpawn) : Title {
    attributeLoad = "missionNamespace setvariable ['AAIS_intial_value',_value]; (_this controlsGroupCtrl 129) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['AAIS_intial_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 129;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"Yes","No"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_intial_value',_this select 1];";
        };
    };
};
class GVAR(zoneSuspendControl) : Title {
    attributeLoad = "missionNamespace setvariable ['AAIS_zoneSuspend_value',_value]; (_this controlsGroupCtrl 129) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['AAIS_zoneSuspend_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 129;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"Enabled","Suspended"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_zoneSuspend_value',_this select 1];";
        };
    };
};
class GVAR(moduleconditionControl) : Edit {
    attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 130) ctrlSetText _value;";
    attributeSave = "_value = ctrlText (_this controlsGroupCtrl 130);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
    h = 3 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 3 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 130;
            style = ST_MULTI;
            h = 3 * SIZE_M * GRID_H;
            autocomplete = "scripting";
        };
    };
};

class GVAR(zoneTypeControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['AAIS_zoneType_value',_value]; (_this controlsGroupCtrl 131) lbsetcursel (((_value) min 11) max 0);";
    attributeSave = "missionNamespace getvariable ['AAIS_zoneType_value',1];";
    h = "25 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "25 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 131;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "25 * (pixelH * pixelGrid * 0.50)";
            rows = 5;
            columns = 2;
            values[] = {0,1,2,3,4,5,6,7,8,9,10,11};
            strings[] = {
                "All","All Ground",
                "All Air","All Ground and Helicopter",
                "All Ground and Water","All Ground and Plane",
                "All Air and Water","Ground Unit Only",
                "Ground Vehicle Only","Water Vehicle Only",
                "Helicopter Unit Only","Plane Unit Only"
            };
            tooltips[] = {
                "Activate zone on All type of units present in zone.","Activate zone on All Ground type of units present in zone.",
                "Activate zone on All Air type of units present in zone.","Activate zone on All Ground and Helicopter type of units present in zone.",
                "Activate zone on All Ground and Water type of units present in zone.","Activate zone on All Ground and Plane type of units present in zone.",
                "Activate zone on All Air and Water type of units present in zone.","Activate zone on Ground Unit Only type of units present in zone.",
                "Activate zone on Ground Vehicle Only type of units present in zone.","Activate zone on Water Vehicle Only type of units present in zone.",
                "Activate zone on Helicopter Unit Only type of units present in zone.","Activate zone on Plane Unit Only type of units present in zone."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_zoneType_value',_this select 1];";
        };
    };
};
class GVAR(behaviourchangeControl) : Title    {
    attributeLoad = "_index = ['unchanged','careless','safe','aware','combat','stealth'] find _value; missionNamespace setvariable ['AAIS_behaviour_value',_index]; (_this controlsGroupCtrl 134) lbsetcursel _index;";
    attributeSave = "['unchanged','careless','safe','aware','combat','stealth'] select (missionNamespace getvariable ['AAIS_behaviourchange_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 134;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 6;
            values[] = {0,1,2,3,4,5};
            strings[] = {"No Change","Careless","Safe","Aware","Combat","Stealth"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_behaviourchange_value',_this select 1];";
        };
    };
};
class GVAR(combatmodechangeControl) : Title    {
    attributeLoad = "_index = (['unchanged','blue','green','white','yellow','red'] find _value); missionNamespace setvariable ['AAIS_combatmodechange_value',_index]; (_this controlsGroupCtrl 135) lbsetcursel _index;";
    attributeSave = "['unchanged','blue','green','white','yellow','red'] select (missionNamespace getvariable ['AAIS_combatmodechange_value',0]);";
    h = "25 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "25 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 135;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "25 * (pixelH * pixelGrid * 0.50)";
            rows = 6;
            columns = 1;
            values[] = {0,1,2,3,4,5};
            strings[] = {"$STR_3den_attributes_default_unchanged_text","$STR_3DEN_Attributes_CombatMode_Blue_text","$STR_3DEN_Attributes_CombatMode_Green_text","$STR_3DEN_Attributes_CombatMode_White_text","$STR_3DEN_Attributes_CombatMode_Yellow_text","$STR_3DEN_Attributes_CombatMode_Red_text"};
            tooltips[] = {
                "$STR_3den_attributes_default_unchanged_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Blue_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Green_tooltip",
                "$STR_3DEN_Attributes_CombatMode_White_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Yellow_tooltip",
                "$STR_3DEN_Attributes_CombatMode_Red_tooltip"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_combatmodechange_value',_this select 1];";
        };
    };
};
class GVAR(speedchangeControl) : Toolbox {
    attributeLoad = "_index = ['unchanged','limited','normal','full'] find _value; missionNamespace setvariable ['AAIS_speedchange_value',_index]; (_this controlsGroupCtrl 136) lbsetcursel _index;";
    attributeSave = "['unchanged','limited','normal','full'] select (missionNamespace getvariable ['AAIS_speedchange_value',0]);";
    h = 2 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 2 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 136;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 2 * SIZE_M * GRID_H;
            rows = 1;
            columns = 4;
            strings[] = {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\limited_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\normal_ca.paa",
                "\a3\3DEN\Data\Attributes\SpeedMode\full_ca.paa"
            };
            values[] = {0,1,2,4};
            tooltips[] = {
                $STR_3den_attributes_default_unchanged_text,
                $STR_3den_attributes_speedmode_limited,
                $STR_3den_attributes_speedmode_normal,
                $STR_3den_attributes_speedmode_full
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_speedchange_value',_this select 1];";
        };
    };
};
class GVAR(formationchangeControl) : Toolbox {
    attributeLoad = "_index = ['unchanged','wedge','vee','line','column','file','stag_column','ech_left','ech_right','diamond'] find _value; missionNamespace setvariable ['AAIS_formationchange_value',_index]; (_this controlsGroupCtrl 137) lbsetcursel _index;";
    attributeSave = "['unchanged','wedge','vee','line','column','file','stag_column','ech_left','ech_right','diamond'] select (missionNamespace getvariable ['AAIS_formationchange_value',0]);";
    h = 2 * SIZE_M * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 2 * SIZE_M * GRID_H;
        };
        class Value: Value {
            idc = 137;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 2 * SIZE_M * GRID_H;
            rows = 1;
            columns = 10;
            strings[] = {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\wedge_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\vee_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\line_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\column_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\file_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\stag_column_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\ech_left_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\ech_right_ca.paa",
                "\a3\3DEN\Data\Attributes\Formation\diamond_ca.paa"
            };
            values[] = {0,1,2,3,4,5,6,7,8};
            tooltips[] = {
                $STR_3den_attributes_default_unchanged_text,
                $STR_WEDGE,
                $STR_VEE,
                $STR_LINE,
                $STR_COLUMN,
                $STR_File,
                $STR_STAGGERED,
                $STR_ECHL,
                $STR_ECHR,
                $STR_DIAMOND
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_formationchange_value',_this select 1];";
        };
    };
};
class GVAR(stancechangeControl): Toolbox {
    attributeLoad = "_index = ['unchanged','auto','down','middle','up'] find _value; missionNamespace setvariable ['AAIS_stancechange_value',_index]; (_this controlsGroupCtrl 138) lbsetcursel _index;";
    attributeSave = "['unchanged','auto','down','middle','up'] select (missionNamespace getvariable ['AAIS_stancechange_value',0]);";
    h = 8 * GRID_H;
    class Controls: Controls {
        class Title: Title {
            h = 8 * GRID_H;
        };
        class Value: Value {
            idc = 138;
            style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
            h = 8 * GRID_H;
            rows = 1;
            columns = 5;
            strings[] = {
                "\a3\3DEN\Data\Attributes\default_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\up_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\down_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\middle_ca.paa",
                "\a3\3DEN\Data\Attributes\Stance\up_ca.paa"
            };
            tooltips[] = {
                $STR_3den_attributes_default_unchanged_text,
                $STR_3den_attributes_stance_default,
                $STR_3den_attributes_stance_down,
                $STR_3den_attributes_stance_middle,
                $STR_3den_attributes_stance_up
            };
            values[] = {0,1,2,3,4};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_stancechange_value',_this select 1];";
        };
    };
};
class GVAR(taskpriorityControl) : Title {
    attributeLoad = "missionNamespace setvariable ['AAIS_taskpriority_value',_value]; (_this controlsGroupCtrl 139) lbsetcursel (((_value) min 2) max 0);";
    attributeSave = "missionNamespace getvariable ['AAIS_taskpriority_value',1];";
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 139;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 3;
            values[] = {0,1,2};
            strings[] = {
                "HIGH","MEDIUM","LOW"
            };
            tooltips[] = {
                "High Priority","Medium Priority","Low Priority"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_taskpriority_value',_this select 1];";
        };
    };
};
class GVAR(standardNumberAltControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 140) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 140);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 140;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
             canModify = 1;
         };
     };
 };
class GVAR(forcelightsControl) : Title {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['AAIS_persistent_value',_index]; (_this controlsGroupCtrl 142) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['AAIS_persistent_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 142;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"Off","Force Flashlights"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_persistent_value',_this select 1];";
        };
    };
};

class GVAR(positiontypeControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['AAIS_postiontype_value',_value]; (_this controlsGroupCtrl 149) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['AAIS_postiontype_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 149;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"STANDARD","START"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_postiontype_value',_this select 1];";
        };
    };
};
class GVAR(flyingControl) : Title    {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['AAIS_flying_value',_index]; (_this controlsGroupCtrl 150) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['AAIS_flying_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 150;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"NOT FLYING","FLYING"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_flying_value',_this select 1];";
        };
    };
};
class GVAR(heliControl) : Title    {
    attributeLoad = "missionNamespace setvariable ['AAIS_helitype_value',_value]; (_this controlsGroupCtrl 151) lbsetcursel _value;";
    attributeSave = "missionNamespace getvariable ['AAIS_helitype_value',0];";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 151;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"RAPPEL","LAND"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_helitype_value',_this select 1];";
        };
    };
};
class GVAR(initActionControl) : Title {
    attributeLoad = "missionNamespace setvariable ['AAIS_initAction_value',_value]; (_this controlsGroupCtrl 152) lbsetcursel (((_value) min 2) max 0);";
    attributeSave = "missionNamespace getvariable ['AAIS_initAction_value',1];";
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 152;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 3;
            values[] = {0,1,2};
            strings[] = {
                "OFF","DISABLE","Enable"
            };
            tooltips[] = {
                "Do Nothing to linked zones","Disable linked zones","Enable linked zones"
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_initAction_value',_this select 1];";
        };
    };
};
class GVAR(actionControl) : Title {
    attributeLoad = "missionNamespace setvariable ['AAIS_action_value',_value]; (_this controlsGroupCtrl 153) lbsetcursel (((_value) min 2) max 0);";
    attributeSave = "missionNamespace getvariable ['AAIS_action_value',1];";
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 153;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 3;
            values[] = {0,1,2};
            strings[] = {
                "Enable","DISABLE","TOGGLE"
            };
            tooltips[] = {
                "Enable linked zones","Disable linked zones","If linked zone is disabled, enable it. If linked zone enabled, disabled it."
            };
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_action_value',_this select 1];";
        };
    };
};
class GVAR(flyinheightControl) : Edit {
     attributeLoad = "if !(_value isEqualType '') then {_value = str _value;};(_this controlsGroupCtrl 154) ctrlSetText _value;";
     attributeSave = "_value = ctrlText (_this controlsGroupCtrl 154);if (gettext (_config >> 'typeName') == 'NUMBER') then {_value = parsenumber _value;};_value";
     class Controls: Controls {
         class Title: Title {};
         class Value: ctrlEdit {
             idc = 154;
             style = ST_LEFT;
             x = "48 * (pixelW * pixelGrid * 0.50)";
             w = "82 * (pixelW * pixelGrid * 0.50)";
             h = "5 * (pixelH * pixelGrid * 0.50)";
         };
     };
 };
class GVAR(boolControl) : Title    {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['AAIS_bool_value',_index]; (_this controlsGroupCtrl 155) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['AAIS_bool_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 155;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"FALSE","TRUE"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_bool_value',_this select 1];";
        };
    };
};
class GVAR(boolControl2) : Title    {
    attributeLoad = "_index = (if (_value isequaltype 0) then {_value} else {[false,true] find _value}); missionNamespace setvariable ['AAIS_bool2_value',_index]; (_this controlsGroupCtrl 156) lbsetcursel _index;";
    attributeSave = "[false,true] select (missionNamespace getvariable ['AAIS_bool2_value',0]);";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 156;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"FALSE","TRUE"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_bool2_value',_this select 1];";
        };
    };
};
class GVAR(numberSelect1Control) : Title    {
    attributeLoad = "missionNamespace setvariable ['AAIS_numberSelect1_value',_value]; (_this controlsGroupCtrl 159) lbsetcursel (((_value) min 6) max 0);";
    attributeSave = "missionNamespace getvariable ['AAIS_numberSelect1_value',0];";
    h = "5 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class Value: ctrlToolbox {
            idc = 159;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 7;
            values[] = {0,1,2,3,4,5,6};
            strings[] = {"OFF","1","2","3","4","5","6"};
            onToolboxSelChanged = "missionNamespace setvariable ['AAIS_numberSelect1_value',_this select 1];";
        };
    };
};
