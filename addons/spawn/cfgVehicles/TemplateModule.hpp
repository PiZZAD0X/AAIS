class GVAR(TemplateModule): EGVAR(core,BaseModule) {
    scope = 2;
    displayName = "Template";
    function = QFUNC(templateModule);
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
        class GVAR(zoneInitial) {
            displayName = "Initial Spawn";
            tooltip = "Enabling activates the zone on init, spawning units on the start of the mission. Default disabled.";
            property = QGVAR(zoneInitial);
            control = QEGVAR(Core,CheckboxStateReversed);
            expression = MODULE_EXPRESSION;
            defaultValue = "false";
        };
    };
};