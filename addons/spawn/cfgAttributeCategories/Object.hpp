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
