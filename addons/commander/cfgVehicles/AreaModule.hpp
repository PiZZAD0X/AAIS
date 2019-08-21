class GVAR(AreaModule): EGVAR(Core,BaseModule) {
    displayName = "Commander Area";
    scope = 2;
    function = QFUNC(AreaModule);
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    canSetArea = 1;

    class AttributeValues {
        size3[] = {100, 100, -1};
        IsRectangle = 0;
    };

    class Attributes {
        class GVAR(AreaName) {
            displayName = "Area Name";
            tooltip = "Area name displayed in referenced in module select";
            control = "EditShort";
            typeName = "STRING";
            unique = 1;
            property = QGVAR(AreaName);
            expression = MODULE_EXPRESSION;
            validate = "STRING";
            defaultValue = "'Area0'";
        };
    };
};

class GVAR(AreaModule_R): GVAR(AreaModule) {
    displayName = "Commander Area (Rectangle)";
    class AttributeValues {
        size3[] = {100, 100, -1};
        IsRectangle = 1;
    };
};