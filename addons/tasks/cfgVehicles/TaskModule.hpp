class GVAR(TaskModule): EGVAR(core,BaseModule) {
    scope = 2;
    displayName = "Task";
    function = QFUNC(taskModule);
    functionPriority = 0;
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    canSetArea = 1;
    canSetAreaHeight = 0;
    canSetAreaShape = 1;
    icon = QPATHTOF(resources\aizonemodule_ca.paa);

    class AttributeValues {
        size3[] = {100,100,0};
        IsRectangle = 0;
    };

    class Attributes {
        class GVAR(Task) {
            property = QGVAR(Task);
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
            control = QGVAR(TaskSelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'Patrol'";
        };
        class GVAR(TaskWait) {
            property = QGVAR(TaskWait);
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
        class GVAR(Condition) {
            displayName = "Custom Condition";
            tooltip = "Enter a custom condition that must be met for this task to be activated.";
            property = QGVAR(Condition);
            control = "EditCodeMulti3";
            expression = MODULE_EXPRESSION;
            defaultValue = "'true'";
        };
        class GVAR(Code) {
            displayName = "Custom Code";
            tooltip = "Pass custom code to be executed when task is activated. Default: Nil";
            property = QGVAR(Code);
            control = "EditCodeMulti3";
            expression = MODULE_EXPRESSION;
            defaultValue = "''";
        };
    };
};
