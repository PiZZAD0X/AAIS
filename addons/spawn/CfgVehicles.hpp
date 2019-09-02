class CfgVehicles {
    class Man; 
    class CAManBase: Man {
        class EventHandlers {
            #include "cfg3denEH\EH.hpp"
        };
    };

    class EGVAR(core,BaseModule);

    #include "cfgVehicles\ZoneModule.hpp"
    #include "cfgVehicles\ConfigModule.hpp"
    #include "cfgVehicles\TemplateModule.hpp"
};
