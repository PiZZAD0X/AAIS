class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
        clientinit = QUOTE(call COMPILE_FILE(XEH_preInitClient));
        serverinit = QUOTE(call COMPILE_FILE(XEH_preInitServer));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};
