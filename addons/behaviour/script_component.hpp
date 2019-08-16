#define COMPONENT behaviour
#define COMPONENT_BEAUTIFIED AI Bhaviour
#include "\m\aais\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_BEHAVIOUR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CORE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BEHAVIOUR
#endif

#include "\m\aais\addons\main\script_macros.hpp"

#define HUMAN_VIEW_ANGLE 120
