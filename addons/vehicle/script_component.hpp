#define COMPONENT vehicle
#define COMPONENT_BEAUTIFIED Vehicle
#include "\m\aais\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_VEHICLE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CORE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_VEHICLE
#endif

#include "\m\aais\addons\main\script_macros.hpp"
