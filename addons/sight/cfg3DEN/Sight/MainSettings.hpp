class GVAR(Settings_Category) {
    displayName = "Sight Settings";
    collapsed = 0;
    class Attributes {
        class GVAR(Enabled) {
            property = QGVAR(Enabled);
            displayName = "Enable Sight Aid";
            tooltip = "";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class GVAR(SightAidVehicles) {
            property = QGVAR(SightAidVehicles);
            displayName = "Applies sight aid to vehicle crew.";
            tooltip = "";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class GVAR(SightAidDistance) {
            property = QGVAR(SightAidDistance);
            displayName = "Distance";
            tooltip = "Max distance of sight aid";
            control = QEGVAR(Core,500To2500Step100_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "800";
            typeName = "NUMBER";
        };
        class GVAR(SightAidMinIncrease) {
            property = QGVAR(SightAidMinIncrease);
            displayName = "Knowledge Increase";
            tooltip = "Minimum knowledge increase from sight aid check.";
            control = QEGVAR(Core,0To1Step01_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0.25";
            typeName = "NUMBER";
        };
        class GVAR(SightAidEngage) {
            property = QGVAR(SightAidEngage);
            displayName = "Forces AI to engage within engage distance.";
            tooltip = "";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class GVAR(SightAidEngageDistance) {
            property = QGVAR(SightAidEngageDistance);
            displayName = "Engage Distance";
            tooltip = "Distance that forces AI to engage enemy.";
            control = QEGVAR(Core,100To1000Step100_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "100";
            typeName = "NUMBER";
        };
    };
};
