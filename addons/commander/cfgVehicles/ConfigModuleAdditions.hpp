class EGVAR(Spawn,ConfigModule): EGVAR(core,BaseModule)  {
    class Attributes {
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
            tooltip = "Set group to a QRF";
            control = "CheckBox";
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
        };
    };
};