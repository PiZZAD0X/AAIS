class Cfg3DEN {
    class Attributes {
        #include "CfgAttributes.hpp"
    };
    
    class Mission {
        #include "cfg3den\cfg3denMenuCategories.hpp"
    };
};

class display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                #include "display3DEN\Menu.hpp"
                class GVAR(MenuFolder) {
                    text = "AI Settings";
                    items[] = {
                        QGVAR(Configure_MainSettings)
                    };
                };
                items[] += {QGVAR(MenuFolder)};
            };
        };
    };
};