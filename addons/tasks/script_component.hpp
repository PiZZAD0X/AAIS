#define COMPONENT tasks
#define COMPONENT_BEAUTIFIED Tasks
#include "\m\aais\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_TASKS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CORE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TASKS
#endif

#include "\m\aais\addons\main\script_macros.hpp"

#define CLOSE_ATTACK_DISTANCE 100

#define DEFENDRESPONSETASKS ["PATROL", "PERIMPATROL", "SENTRY", "BLDMOVE"]
#define MOVETASKS ["PATROL", "PERIMPATROL", "SENTRY", "BLDMOVE", "MOVE", "MANUAL"]
#define MARKERTASKSDEST ["PATROL", "PERIMPATROL", "SENTRY", "ATTACK", "ASSAULT", "FLANK", "MOVE", "MANUAL", "BLDMOVE", "BLDSEARCH", "PICKUP", "DROPOFF"]

#define GROUPSELECTTASKS ["PATROL", "PERIMPATROL", "GARRISON", "BUNKER", "LOITER"]
#define MODULESELECTTASKS ["PATROL", "PERIMPATROL", "SENTRY", "BLDMOVE"]