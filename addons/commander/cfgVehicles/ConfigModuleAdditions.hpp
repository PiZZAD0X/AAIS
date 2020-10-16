class EGVAR(Spawn,ConfigModule): EGVAR(core,BaseModule)  {
    class Attributes {
        class GVAR(CommanderTitle) {
            property = QGVAR(CommanderTitle);
            displayName = "Commander Options";
            tooltip = "";
            control = "SubTitle";
            defaultValue = "";
        };
        class GVAR(CommanderIgnore) {
            property = QGVAR(CommanderIgnore);
            displayName = "Ignore Group";
            tooltip = "Ignore this group in the list of assets for the AI Commander. Default: false";
            control = "Checkbox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "true";
        };
        class GVAR(areaAssigned) {
            property = QGVAR(areaAssigned);
            displayName = "Set Area";
            tooltip = "Set group to an Area instead of automatically being assigned to an area by the Commander. Default: 'NONE'";
            control = QEGVAR(Commander,GroupAreaSelectAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'No Area Selected'";
        };
        class GVAR(AssetType) {
            property = QGVAR(AssetType);
            displayName = "Group Asset Type";
            tooltip = "Sets the asset type for the group. AUTO will determine this automatically.";
            control = QEGVAR(Commander,GroupAssetTypeAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'AUTO'";
        };
        class GVAR(QRF) {
            property = QGVAR(QRF);
            displayName = "Quick Reaction Force";
            tooltip = "Set group to a QRF";
            control = "CheckBox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
        };
    };
};