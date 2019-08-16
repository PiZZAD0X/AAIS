#include "\m\aais\addons\core\RscTitles.hpp"

class Cfg3DEN {
    class Mission {
        #include "cfg3den\cfg3denMenuCategories.hpp"
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