#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"aais_main", "aais_vehicle", "aais_building"};
        authors[] = {"TheMagnetar","PiZZADOX"};
        author = "AAIS-Team";
        authorUrl = "https://gitlab.gruppe-w.de/Magnetar";
        VERSION_CONFIG;
    };
};

#include "\m\aais\addons\main\RscTitles.hpp"
#include "CfgEventHandlers.hpp"
#include "StateMachine.hpp"
#include "Cfg3DEN.hpp"
#include "CfgVehicles.hpp"
