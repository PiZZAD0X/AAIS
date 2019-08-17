class GVAR(UnitCommander) {
    displayName = "AI Commander Options";
    collapsed = 1;
    class Attributes {
        class GVAR(CommanderRank) {
            property = QGVAR(CommanderRank);
            displayName = "Unit Commander Rank";
            tooltip = "Sets the rank of the unit in the Commander system.";
            control = QGVAR(CommanderRankAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'NONE'";
        };
    };
};