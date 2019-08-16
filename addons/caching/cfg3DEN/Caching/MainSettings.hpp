class GVAR(Settings_Category) {
    displayName = "Caching Settings";
    collapsed = 0;
    class Attributes {
        class GVAR(Enabled) {
            property = QGVAR(Enabled);
            displayName = "Enable Caching";
            tooltip = "";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class GVAR(cacheDistance) {
            property = QGVAR(cacheDistance);
            displayName = "Cache Distance";
            tooltip = "Distance from players at which AI will be cached";
            control = QEGVAR(Core,500To10000Step100_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "2500";
            typeName = "NUMBER";
        };
    };
};
