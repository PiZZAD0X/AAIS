class GVAR(ConfigModule): EGVAR(core,BaseModule) {
    scope = 2;
    displayName = "AI Config Spawn";
    function = QFUNC(configModule);
    functionPriority = 0;
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    canSetArea = 0;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = QPATHTOF(resources\aitemplatemodule_ca.paa);

    class AttributeValues {
        size3[] = {0,0,0};
        IsRectangle = 0;
    };

    class Attributes {
        class GVAR(configSelect) {
            displayName = "Group Config";
            tooltip = "";
            property = QGVAR(configSelect);
            control = QGVAR(ConfigSelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'NONE'";
        };
        class GVAR(groupSide) {
            property = QGVAR(groupSide);
            displayName = "Group Side";
            tooltip = "Set the side of the group on spawn";
            control = QEGVAR(Core,SideSelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'WEST'";
        };
        class GVAR(groupName) {
            property = QGVAR(groupName);
            displayName = "Group Name";
            tooltip = "Set the name of the group on spawn";
            control = "EditCode";
            unique = 1;
            expression = MODULE_EXPRESSION;
            validate="variable";
            defaultValue = "''";
        };
        class GVAR(groupInit) {
            property = QGVAR(groupInit);
            displayName = "Group Init";
            tooltip = "Set the init of the group on spawn";
            control = "EditCodeMulti5";
            expression = MODULE_EXPRESSION;
            defaultValue = "''";
        };
        class GVAR(groupProbabilityPresence) {
            property = QGVAR(groupProbabilityPresence);
            displayName = "Probability of Presence";
            tooltip = "Probability that the group will be spawned.";
            control = QEGVAR(Core,0to100Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
        };
        class GVAR(groupStance) {
            property = QGVAR(groupStance);
            displayName = "Group Stance";
            tooltip = "Force the stance of the group. Default: AUTO";
            control = "UnitPos";
            expression = MODULE_EXPRESSION;
            defaultValue = "'auto'";
        };
        class GVAR(GroupforceLights) {
            property = QGVAR(GroupforceLights);
            displayName = "Force Flashlights";
            tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
            control = QGVAR(forcelightsControlAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(Grouptask) {
            property = QGVAR(Grouptask);
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
            control = QGVAR(TaskSelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'Patrol'";
        };
        class GVAR(GrouppatrolRadius) {
            property = QGVAR(GrouppatrolRadius);
            displayName = "Task Radius";
            tooltip = "Radius that Group will conduct the assigned task in. Default: 30m";
            control = QEGVAR(Core,0to250Step10_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "30";
        };
        class GVAR(GroupwaypointWait) {
            property = QGVAR(GroupwaypointWait);
            displayName = "Waypoint Wait Time";
            tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
            control = QEGVAR(Core,0to30Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "3";
        };
        class GVAR(GroupTaskTimer) {
            property = QGVAR(GroupTaskTimer);
            displayName = "Time";
            tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
            control = QEGVAR(Core,0to600Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(GroupCreateRadius) {
            property = QGVAR(GroupCreateRadius);
            displayName = "Creation Radius";
            tooltip = "Radius that Group will be randomly created in when activated. Default: 0";
            control = QEGVAR(Core,0to250Step10_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(GroupMultiplier) {
            property = QGVAR(GroupMultiplier);
            displayName = "Group Multiplier";
            tooltip = "Duplicates the group into multiple groups with same settings. Use Creation Radius to populate large areas randomly. Default: 1 (this group only)";
            control = QEGVAR(Core,1to10Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "1";
        };
        class GVAR(GroupOccupyOption) {
            property = QGVAR(GroupOccupyOption);
            displayName = "Occupy Building Options";
            tooltip = "Should the group occupy a building or group of buildings. Default: Off";
            control = QGVAR(OccupySelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'Off'";
        };
    };
};