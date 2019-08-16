#define COMPONENT spawn
#define COMPONENT_BEAUTIFIED Spawn
#include "\m\aais\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_SPAWN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CORE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPAWN
#endif

#include "\m\aais\addons\main\script_macros.hpp"
