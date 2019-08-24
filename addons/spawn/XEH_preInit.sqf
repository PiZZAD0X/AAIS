#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer || {!hasInterface}) then {
    GVAR(spawnGroupPFH) = -1;
    GVAR(spawnQueue) = [];
};

ADDON = true;
