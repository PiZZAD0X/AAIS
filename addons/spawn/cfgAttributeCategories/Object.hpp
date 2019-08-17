class GVAR(HiddenUnitOptions) {
    displayName = "";
    collapsed = 1;
    class Attributes {
        class GVAR(unitPos) {
            property = QGVAR(unitPos);
            displayName = "unitPos";
            tooltip = "unitPos";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "3";
        };
        class GVAR(Init) {
            property = QGVAR(Init);
            displayName = "Init";
            tooltip = "Init";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "";
        };
        class GVAR(Name) {
            property = QGVAR(Name);
            displayName = "Name";
            tooltip = "Name";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "";
        };
    };
};

//class GVAR(UnitOptions) {
//    displayName = "AI Unit Options";
//    collapsed = 1;
//    class Attributes {
//        class GVAR(unitIdentity) {
//            displayName = "Identity";
//            tooltip = "Set the custom name to appear when the units Identity is checked. Default: Nil";
//            property = QGVAR(unitIdentity);
//            control = QGVAR(standardStringOneControl);
//            expression = ENTITY_EXPRESSION;
//            defaultValue = "''";
//        };
//        class GVAR(unitPersistent) {
//            displayName = "Persistent";
//            tooltip = "Is the unit persistent, will be it get cleaned up by the clean up script if it dies. Default: Persistent";
//            property = QGVAR(unitPersistent);
//            control = QGVAR(persistentControl);
//            expression = ENTITY_EXPRESSION;
//            defaultValue = "true";
//            typeName = "BOOL";
//        };
//        class GVAR(unitFlying) {
//            displayName = "Flying";
//            tooltip = "Is the unit spawning in flight. Default: False";
//            property = QGVAR(unitFlying);
//            control = QGVAR(flyingControl);
//            expression = ENTITY_EXPRESSION;
//            condition = "objectVehicle";
//            defaultValue = "false";
//            typeName = "BOOL";
//        };
//        class GVAR(unitFlyInHeight) {
//            displayName = "Flight Height";
//            tooltip = "Set the unit flying height. Default: 250";
//            property = QGVAR(unitFlyInHeight);
//            control = QGVAR(flyinheightControl);
//            expression = ENTITY_EXPRESSION;
//            condition = "objectVehicle";
//            defaultValue = 250;
//            typeName = "NUMBER";
//        };
//    };
//};
