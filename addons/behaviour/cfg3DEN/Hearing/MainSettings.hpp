class GVAR(Settings_Category) {
    displayName = "Hearing Aid";
    collapsed = 0;
    class Attributes {
        class GVAR(HearingAid) {
            property = QGVAR(HearingAid);
            displayName = "Enable Hearing Aid";
            tooltip = "";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class GVAR(HearingDistance) {
            property = QGVAR(HearingDistance);
            displayName = "Maximum distance AI can hear gunshots.";
            tooltip = "";
            control = QEGVAR(Core,500To2500Step100_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "1400";
        };
        class GVAR(HearingMinIncrease) {
            property = QGVAR(HearingMinIncrease);
            displayName = "Knowledge Increase";
            tooltip = "Minimum knowledge increase from hearing aid check.";
            control = QEGVAR(Core,0To1Step01_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "0.25";
            typeName = "NUMBER";
        };
        class GVAR(OnlyPlayers) {
            property = QGVAR(OnlyPlayers);
            displayName = "Enable shot hearing only from shots by players";
            tooltip = "";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
    };
};
