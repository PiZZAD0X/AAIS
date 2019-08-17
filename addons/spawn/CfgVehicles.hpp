class CfgVehicles {
    
    class CAManBase {
        class EventHandlers {
            #include "cfg3denEH\EH.hpp"
        };
    };
    
    class EGVAR(core,BaseModule);
    
    class GVAR(ZoneModule): EGVAR(core,BaseModule) {
        scope = 2;
        displayName = "AI Zone (Circle)";
        function = QFUNC(zoneModule);
        functionPriority = 0;
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 0;
        is3DEN = 1;
        canSetArea = 1;
        canSetAreaHeight = 0;
        canSetAreaShape = 0;
        icon = QPATHTOF(resources\aizonemodule_ca.paa);

        class AttributeValues {
            size3[] = {100,100,0};
            IsRectangle = 0;
        };

        class Attributes {
            class GVAR(zoneActivation) {
                property = QGVAR(zoneActivation);
                displayName = "Activation Type";
                tooltip = "Initial activates and spawns the AI at mission start, Conditional checks the presence condition, Custom Conditional checks the condition once the scripted condition is true, and Custom activates the zone as soon as the scripted condition is true.";
                control = QGVAR(ZoneActivationAttribute);
                expression = MODULE_EXPRESSION;
                defaultValue = "'Conditional'";
            };
            class GVAR(zoneDelay) {
                property = QGVAR(zoneDelay);
                displayName = "Delay";
                tooltip = "Delay after zone is activated that actual spawning occurs. Default 0 seconds";
                control = QEGVAR(Core,0To30Step1_Slider);
                expression = MODULE_EXPRESSION;
                defaultValue = "0";
                activationTypes[] = {"Conditional","CustomConditional","Custom"};
            };
            class GVAR(zoneSides) {
                property = QGVAR(zoneSides);
                displayName = "Activating Unit Side";
                tooltip = "Sides that can activate the presence condition.";
                control = QEGVAR(Core,TeamsSelectBoxAttribute);
                expression = MODULE_EXPRESSION;
                defaultValue = "['BLUFOR','OPFOR','INDFOR','CIVILIAN']";
                activationTypes[] = {"Conditional","CustomConditional"};
            };
            class GVAR(zoneActivatorType) {
                displayName = "Activating Unit Type";
                tooltip = "Type of unit the player is that activates the zone. Default all Units";
                property = QGVAR(zoneActivatorType);
                control = QGVAR(zoneActivatorAttribute);
                expression = MODULE_EXPRESSION;
                defaultValue = "0";
                activationTypes[] = {"Conditional","CustomConditional"};
            };
            class GVAR(zoneCondition) {
                displayName = "Custom Condition";
                tooltip = "Enter a custom condition that must be met for this zone to be activated, condition true will spawn the zone. Default: Nil";
                property = QGVAR(zoneCondition);
                control = "EditCodeMulti3";
                expression = MODULE_EXPRESSION;
                defaultValue = "'true'";
                activationTypes[] = {"Custom","CustomConditional"};
            };
            class GVAR(zoneCode) {
                displayName = "Custom Code";
                tooltip = "Pass custom code to be executed when zone is activated. Default: Nil";
                property = QGVAR(zoneCode);
                control = "EditCodeMulti3";
                expression = MODULE_EXPRESSION;
                defaultValue = "''";
                activationTypes[] = {"Custom","CustomConditional","Conditional"};
            };
        };
    };

    class GVAR(ZoneModule_R): GVAR(ZoneModule) {
        displayName = "AI Zone (Square)";
        class AttributeValues {
            size3[] = {100,100,0};
            IsRectangle = 1;
        };
    };
    
    class GVAR(TemplateModule): EGVAR(core,BaseModule) {
        scope = 2;
        displayName = "AI Template";
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
                control = "CheckboxStateReversed";
                expression = MODULE_EXPRESSION;
                defaultValue = "false";
            };
        };
    };
};
