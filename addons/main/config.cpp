#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Data_F_Tank_Loadorder",
            // CBA
            "cba_main",
            "cba_xeh"
        };
        author = ECSTRING(core,AAISTeam);
        url = CSTRING(URL);
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@aais";
        name = "ArmA AI System";
        picture = QPATHTOF(resources\MMFWLogo);
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = CSTRING(URL);
        description = "Issue Tracker: https://github.com/PiZZAD0X/AAIS/issues";
    };
};

#include "CfgSettings.hpp"
