class EGVAR(Spawn,ConfigModule): EGVAR(core,BaseModule)  {
    class Attributes {
        class GVAR(TaskTitle) {
            property = QGVAR(TasksTitle);
            displayName = "Task Options";
            tooltip = "";
            control = "SubTitle";
            defaultValue = "";
        };
        class GVAR(Task) {
            property = QGVAR(Task);
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
            control = QGVAR(TaskSelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'Patrol'";
        };
        class GVAR(TaskRadius) {
            property = QGVAR(TaskRadius);
            displayName = "Task Radius";
            tooltip = "Radius that Group will conduct the assigned task in. Default: 30m";
            control = QEGVAR(Core,0to250Step10_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "30";
        };
        class GVAR(taskWait) {
            property = QGVAR(taskWait);
            displayName = "Waypoint Wait Time";
            tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
            control = QEGVAR(Core,0to30Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "3";
        };
        class GVAR(TaskTimer) {
            property = QGVAR(TaskTimer);
            displayName = "Time";
            tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
            control = QEGVAR(Core,0to600Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(ForceLights) {
            property = QGVAR(ForceLights);
            displayName = "Force Flashlights";
            tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
            control = QGVAR(forcelightsControlAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
    };
};