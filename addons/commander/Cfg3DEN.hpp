class Cfg3DEN {

    class Attributes {
        #include "CfgAttributes.hpp"
    };

    class Group {
        class AttributeCategories {
            #include "cfgAttributeCategories\Group.hpp"
        };
    };

    class Object {
        class AttributeCategories {
            #include "cfgAttributeCategories\Object.hpp"
        };
    };

    class Logic {
        class AttributeCategories {
            #include "cfgAttributeCategories\Logic.hpp"
        };
    };

    class Mission {
        #include "cfg3DEN\cfg3denMenuCategories.hpp"
    };
};

class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                #include "display3DEN\Menu.hpp"
                class EGVAR(Core,MenuFolder) {
                    items[] += {
                        QGVAR(Configure_MainSettings)
                    };
                };
            };
        };
    };
};
