class GVAR(MainSettings) {
    displayName = "Main Settings";
    class AttributeCategories {
        #include "AI\MainSettings.hpp"
        #include "AI\TimeAndVisibilitySettings.hpp"
    };
};

class GVAR(Version_DummyCategory) {
    displayName = "Dummy attribute, should never show up";
    class AttributeCategories {
        class GVAR(Version_Attributes) {
            displayName = "Dummy attribute, should never show up";
            collapsed = 0;
            class Attributes {
                class GVAR(Version_Created) {
                    property = QGVAR(Version_Created);
                    displayName = "";
                    tooltip = "";
                    control = "EditShort";
                    expression = SCENARIO_EXPRESSION;
                    defaultValue = "''";
                };
                class GVAR(Version_Updated) {
                    property = QGVAR(Version_Updated);
                    displayName = "";
                    tooltip = "";
                    control = "EditShort";
                    expression = SCENARIO_EXPRESSION;
                    defaultValue = "''";
                };
            };
        };
    };
};