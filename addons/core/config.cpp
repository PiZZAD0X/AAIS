#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"aais_main"};
        authors[] = {"TheMagnetar","PiZZADOX"};
        author = "AAIS-Team";
        authorUrl = "https://gitlab.gruppe-w.de/Magnetar";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "RscTitles.hpp"
#include "Cfg3DEN.hpp"
#include "CfgVehicles.hpp"

