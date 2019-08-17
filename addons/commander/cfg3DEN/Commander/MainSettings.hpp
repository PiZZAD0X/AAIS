class GVAR(Settings_Category) {
    displayName = "Commander Settings";
    collapsed = 0;
    class Attributes {
        class GVAR(SpawningDelay) {
            property = QGVAR(SpawningDelay);
            displayName = "Spawn Delay";
            tooltip = "Frames between entities are spawned on the frame handler.";
            control = QEGVAR(Core,1To5Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "1";
            typeName = "NUMBER";
        };
    };
};
