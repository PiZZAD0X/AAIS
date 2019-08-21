class GVAR(Settings_Category) {
    displayName = "Commander Settings";
    collapsed = 0;
    class Attributes {
        class GVAR(Enabled) {
            property = QGVAR(Enabled);
            displayName = "Enabled";
            tooltip = "Enables the AI Commander System.";
            control = "CheckboxState";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class GVAR(CommanderSide) {
            property = QGVAR(CommanderSide);
            displayName = "Side";
            tooltip = "AI Commander Side.";
            control = QGVAR(CommanderSideAttribute);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'EAST'";
        };
        class GVAR(CommanderPersonality) {
            property = QGVAR(CommanderPersonality);
            displayName = "Personality";
            tooltip = "AI Commander Personality.";
            control = QGVAR(CommanderPersonalityAttribute);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'Random'";
        };
        class GVAR(CommanderDelay) {
            property = QGVAR(CommanderDelay);
            displayName = "Delay";
            tooltip = "AI Commander Delay.";
            control = QEGVAR(Core,3To10Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "3";
        };
        class GVAR(CommanderSkill) {
            property = QGVAR(CommanderSkill);
            displayName = "Skill";
            tooltip = "AI Commander Skill.";
            control = QEGVAR(Core,1To10Step1_Slider);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "5";
        };
        class GVAR(CommanderWithrawal) {
            property = QGVAR(CommanderWithrawal);
            displayName = "Withdrawal";
            tooltip = "Allows the Commander to withdraw.";
            control = "Checkbox";
            expression = SCENARIO_EXPRESSION;
            defaultValue = "false";
        };
        class GVAR(CommanderAssignMode) {
            property = QGVAR(CommanderAssignMode);
            displayName = "Assign Mode";
            tooltip = "Determines the automatic assign mode.";
            control = QGVAR(CommanderAssignModeAttribute);
            expression = SCENARIO_EXPRESSION;
            defaultValue = "'Fill Evenly'";
        };
    };
};
