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
    };
};