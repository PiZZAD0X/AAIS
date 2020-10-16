class GVAR(GroupTaskBehaviour) {
    displayName = "Task Options";
    collapsed = 1;
    class Attributes {
        class GVAR(task) {
            property = QGVAR(task);
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
            control = QGVAR(GroupTaskSelectAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'Patrol'";
            disableOnTaskSync = 1;
        };
        class GVAR(taskRadius) {
            property = QGVAR(taskRadius);
            displayName = "Task Radius";
            tooltip = "Radius that Group will conduct the assigned task in. Default: 100m";
            control = QEGVAR(Core,50to500Step10_Slider);
            expression = ENTITY_EXPRESSION;
            defaultValue = "100";
            disableOnTaskSync = 1;
        };
        class GVAR(taskWait) {
            property = QGVAR(taskWait);
            displayName = "Waypoint Wait Time";
            tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
            control = QEGVAR(Core,0to30Step1_Slider);
            expression = ENTITY_EXPRESSION;
            defaultValue = "3";
            disableOnTaskSync = 1;
        };
        class GVAR(TaskTimer) {
            property = QGVAR(TaskTimer);
            displayName = "Time";
            tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
            control = QEGVAR(Core,0to600Step1_Slider);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
            disableOnTaskSync = 1;
        };
        class GVAR(forceLights) {
            property = QGVAR(forceLights);
            displayName = "Force Flashlights";
            tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
            control = QGVAR(forcelightsControlAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
    };
};
