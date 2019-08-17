#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"aais_main", "aais_core"};
        authors[] = {"TheMagnetar","PiZZADOX"};
        author = "AAIS-Team";
        authorUrl = "https://gitlab.gruppe-w.de/Magnetar";
        VERSION_CONFIG;
    };
};

#include "\z\MMFW\addons\main\RscTitles.hpp"
#include "CfgEventHandlers.hpp"
#include "Cfg3DEN.hpp"
#include "CfgVehicles.hpp"
