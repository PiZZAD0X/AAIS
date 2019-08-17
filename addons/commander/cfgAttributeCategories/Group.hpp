class GVAR(GroupCommander) {
    displayName = "AI Commander Options";
    collapsed = 1;
    class Attributes {
        class GVAR(CommanderIgnore) {
            property = QGVAR(CommanderIgnore);
            displayName = "Ignore Group";
            tooltip = "Ignore this group in the list of assets for the AI Commander. Default: false";
            control = EGVAR(Core,CheckboxStateReversed);
            expression = ENTITY_EXPRESSION;
            defaultValue = "true";
        };
        class GVAR(GroupSetArea) {
            property = QGVAR(GroupSetArea);
            displayName = "Set Area";
            tooltip = "Set group to an Area instead of automatically being assigned to an area by the Commander. Default: 'NONE'";
            control = QGVAR(GroupAreaSelectAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'No Area Selected'";
        };
        class GVAR(GroupQRF) {
            property = QGVAR(GroupQRF);
            displayName = "Quick Reaction Force";
            tooltip = "Set this group as a QRF. Default: false";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
        };
        class GVAR(GroupAssetType) {
            property = QGVAR(GroupAssetType);
            displayName = "Group Asset Type";
            tooltip = "Sets the asset type for the group. AUTO will determine this automatically.";
            control = QGVAR(GroupAssetTypeAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'AUTO'";
        };
    };
};