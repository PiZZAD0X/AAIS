class GVAR(HiddenGroupOptions) {
    displayName = "";
    collapsed = 1;
    class Attributes {
        class GVAR(Name) {
            property = QGVAR(Name);
            displayName = "Name";
            tooltip = "Name";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "''";
        };
        class GVAR(Init) {
            property = QGVAR(Init);
            displayName = "Init";
            tooltip = "Init";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "''";
        };
        class GVAR(Callsign) {
            property = QGVAR(Callsign);
            displayName = "Callsign";
            tooltip = "Callsign";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "''";
        };
        class GVAR(Placement) {
            property = QGVAR(Placement);
            displayName = "Placement";
            tooltip = "Placement";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(CombatMode) {
            property = QGVAR(CombatMode);
            displayName = "CombatMode";
            tooltip = "CombatMode";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'YELLOW'";
        };
        class GVAR(Behaviour) {
            property = QGVAR(Behaviour);
            displayName = "Behaviour";
            tooltip = "Behaviour";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'AWARE'";
        };
        class GVAR(Formation) {
            property = QGVAR(Formation);
            displayName = "Formation";
            tooltip = "Formation";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'wedge'";
        };
        class GVAR(SpeedMode) {
            property = QGVAR(SpeedMode);
            displayName = "SpeedMode";
            tooltip = "SpeedMode";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'normal'";
        };
        class GVAR(DynamicSimulation) {
            property = QGVAR(DynamicSimulation);
            displayName = "DynamicSimulation";
            tooltip = "DynamicSimulation";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
        };
    };
};

class GVAR(GroupBehaviour) {
    displayName = "AI Group Options";
    collapsed = 1;
    class Attributes {
        class GVAR(groupStance) {
            property = QGVAR(groupStance);
            displayName = "Group Stance";
            tooltip = "Force the stance of the group. Default: AUTO";
            control = "UnitPos";
            expression = ENTITY_EXPRESSION;
            defaultValue = "'auto'";
        };
        class GVAR(forceLights) {
            property = QGVAR(forceLights);
            displayName = "Force Flashlights";
            tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
            control = QGVAR(forcelightsControlAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(task) {
            property = QGVAR(task);
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
            control = QGVAR(TaskSelectAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'Patrol'";
        };
        class GVAR(patrolRadius) {
            property = QGVAR(patrolRadius);
            displayName = "Task Radius";
            tooltip = "Radius that Group will conduct the assigned task in. Default: 100m";
            control = QEGVAR(Core,50to500Step10_Slider);
            expression = ENTITY_EXPRESSION;
            defaultValue = "100";
        };
        class GVAR(waypointWait) {
            property = QGVAR(waypointWait);
            displayName = "Waypoint Wait Time";
            tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
            control = QEGVAR(Core,0to30Step1_Slider);
            expression = ENTITY_EXPRESSION;
            defaultValue = "3";
        };
        class GVAR(TaskTimer) {
            property = QGVAR(TaskTimer);
            displayName = "Time";
            tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
            control = QEGVAR(Core,0to600Step1_Slider);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(createRadius) {
            property = QGVAR(createRadius);
            displayName = "Creation Radius";
            tooltip = "Radius that Group will be randomly created in when activated. Default: 0";
            control = QEGVAR(Core,0to250Step10_Slider);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(multiplier) {
            property = QGVAR(multiplier);
            displayName = "Group Multiplier";
            tooltip = "Duplicates the group into multiple groups with same settings. Use Creation Radius to populate large areas randomly. Default: 1 (this group only)";
            control = QEGVAR(Core,1to10Step1_Slider);
            expression = ENTITY_EXPRESSION;
            defaultValue = "1";
        };
        class GVAR(occupyOption) {
            property = QGVAR(occupyOption);
            displayName = "Occupy Building Options";
            tooltip = "Should the group occupy a building or group of buildings. Default: Off";
            control = QGVAR(OccupySelectAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'Off'";
        };
    };
};
