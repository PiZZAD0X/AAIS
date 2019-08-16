#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"aais_main", "aais_vehicle", "aais_building"};
        authors[] = {"TheMagnetar"};
        author = "AAIS-Team";
        authorUrl = "https://gitlab.gruppe-w.de/Magnetar";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "StateMachine.hpp"
