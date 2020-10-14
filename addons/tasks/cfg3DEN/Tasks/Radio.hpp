class GVAR(Settings_Category) {
    displayName = "Radio Comms Settings";
    collapsed = 0;
    class Attributes {
        class GVAR(RadioReinforcements) {
            property = QGVAR(RadioReinforcements);
            displayName = "Enable Radio Communications";
            tooltip = "";
            control = "CheckBoxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class GVAR(RadioNeedRadio) {
            property = QGVAR(RadioNeedRadio);
            displayName = "Require ACRE Radios for comms";
            tooltip = "";
            control = "CheckBox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "true";
        };
        class GVAR(RadioDistance) {
            property = QGVAR(RadioDistance);
            displayName = "Maximum distance between groups for radio communications.";
            tooltip = "";
            control = QEGVAR(Core,500To2500Step100_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "2000";
        };
        class GVAR(RadioWait) {
            property = QGVAR(RadioWait);
            displayName = "Minimum time between radio calls.";
            tooltip = "";
            control = QEGVAR(Core,60To300Step5_Slider);
            expression = SCENARIO_EXPRESSION;
            validate = "number";
            defaultValue = "120";
        };
    };
};
