---
title: Spawning Groups in MAI
---

AAIS has its own framework for spawning groups of units in order to simplify and speed-up the mission creation process. Groups spawned using AAIS functions are not generated all at once; they spawn at regular intervals in order to minimise FPS drops. There are several options available for spawning AI groups:

- by directly defining a group of units.
- by defining the group composition in a configuration file.
- by defining templates of editor placed groups.

The following sections explain in more detail how each of these options work. At the end of the document, an additional feature is described: the populating marker function and enabling/disabling of AAIS enabled groups.

## Spawning a set of units

AAIS provides a custom function for spawning a group of units: *aais_spawn_fnc_spawnGroup*. This function is prefered to *BIS_fnc_spawnGroup* if the features of AAIS are used but it is not mandatory: one could combine *BIS_fnc_spawnGroup* with *aais_core_fnc_init* in order to achieve the same result. Below is an explanation of the function arguments:

- 0: Array of units to spawn. In case of infantry units, the first unit is going to be the group leader.
- 1: Assigned marker(s) of the AAIS group where the unit will randomly spawn if no position is defined in 4.
- 2: Specifies the type of the group (infantry, wheeled, armored, ship or air).
- 3: Side of the unit (west, east, resistance, civilian)
- 4: Specifies a fixed position for the unit to spawn instead of a random one. If the position is outside of the assigned marker, these will become waypoint or target markers.
- 5: AAIS group options.

**Example 1**

```cpp
[["b_infUnitLeader", "b_infUnit"], [["marker1", 30], ["marker2", 70]], "infantry", "east", [], [["task", "patrolRandom"]]] call aais_spawn_fnc_spawnGroup;
```

will create a group of two infantry units that will patrol marker1 and marker2 randomly with 30% of chances to have a waypoint at `marker1` and 70% chance to have it at `marker2`.

**Example 2**

```cpp
[["b_car1"[]], ["marker1", "marker2"], "infantry", "east", [], [["task", "patrol"]]] call aais_spawn_fnc_spawnGroup;
```

## Using a configuration entry

It is also possible to pre-generate groups and their options in a configuration file. Each configuration entry defined in `CfgGroupCompositions` specifies group composition and AAIS options. Below is an example:

```cpp
class CfgGroupCompositions {

    class Common {
        behaviour[] = {"careless", "safe", "aware", "combat", "stealth"};
        combatMode[] = {"blue", "green", "white", "yellow", "red"};
        formation[] = {"column", "stag column", "wedge", "ech left", "ech right", "vee", "line", "file", "diamond"};
        speed[] = {"limited", "normal", "full"};
        skill[] = {{0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}};
        skillLeader[] = {{0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}, {0.2, 0.8}};
        execInit = "";
        execWaypoint = "";
        task[] = {"patrolRandom"};
        random = 1; // Group composition will be made random
    };

    class rhs_usaf_marine : Common {
        type = "infantry";
        side = "west";
        leaders[] = {"rhsusf_usmc_marpat_wd_squadleader", "rhsusf_usmc_marpat_wd_teamleader"};
        units[] = {
            "rhsusf_usmc_marpat_wd_rifleman",              // Rifleman
            "rhsusf_usmc_marpat_wd_rifleman_light",        // Light Rifleman
            "rhsusf_usmc_marpat_wd_grenadier",             // Grenadier
            "rhsusf_usmc_marpat_wd_autorifleman_m249",     // Automatic Rifleman
            "rhsusf_usmc_marpat_wd_autorifleman_m249_ass", // Assistant Automatic Rifleman
            "rhsusf_usmc_marpat_wd_riflemanat",            // Rifleman AT (M136)
            "rhsusf_usmc_marpat_wd_javelin",               // Anti-Tank (Javelin)
            "rhsusf_usmc_marpat_wd_stinger",               // Anti-Aircraft (Stinger)
            "rhsusf_usmc_marpat_wd_explosives",            // Explosives
            "rhsusf_usmc_marpat_wd_engineer",              // Engineer
            "rhsusf_usmc_marpat_wd_machinegunner",         // Machinegunner
            "rhsusf_usmc_marpat_wd_machinegunner_ass",     // Assistant Machinegunner
            "rhsusf_usmc_marpat_wd_marksman",              // Designated Marksman
            "rhsusf_usmc_marpat_wd_sniper",                // Sniper
            "rhsusf_usmc_marpat_wd_spotter",               // Spotter
            "rhsusf_navy_marpat_wd_medic"                  // Medic
        };
        options[] = {{"allowWater", false}, {"forceRoads", false}, {"randomBehaviour", true}, {"waitAtWaypoint", true}, {"allowVehicles", false}, {"patrolBuildings", true}};
    };

    class rhs_usaf_marine_1 : rhs_usaf_marine {
    	leaders[] = {"rhsusf_usmc_marpat_wd_teamleader"};
    	units[] = {"rhsusf_usmc_marpat_wd_rifleman", "rhsusf_usmc_marpat_wd_grenadier", "rhsusf_usmc_marpat_wd_autorifleman_m249"};
    	random = 0; // Group composition is fixed
    };

    class Wheeled : Common {
        type = "wheeled";
        vehicles[] = {
            "rhsusf_rg33_usmc_wd",
            "rhsusf_rg33_m2_usmc_wd"
        };
        side = "west";
        crew[] = {"rhsusf_usmc_marpat_wd_combatcrewman"};
        cargoLeaders[] = {"rhsusf_usmc_marpat_wd_squadleader", "rhsusf_usmc_marpat_wd_teamleader"};
        cargo[] = {
            "rhsusf_usmc_marpat_wd_rifleman",              // Rifleman
            "rhsusf_usmc_marpat_wd_rifleman_light",        // Light Rifleman
            "rhsusf_usmc_marpat_wd_grenadier",             // Grenadier
            "rhsusf_usmc_marpat_wd_autorifleman_m249",     // Automatic Rifleman
            "rhsusf_usmc_marpat_wd_autorifleman_m249_ass", // Assistant Automatic Rifleman
            "rhsusf_usmc_marpat_wd_riflemanat",            // Rifleman AT (M136)
            "rhsusf_usmc_marpat_wd_javelin",               // Anti-Tank (Javelin)
            "rhsusf_usmc_marpat_wd_stinger",               // Anti-Aircraft (Stinger)
            "rhsusf_usmc_marpat_wd_explosives",            // Explosives
            "rhsusf_usmc_marpat_wd_engineer",              // Engineer
            "rhsusf_usmc_marpat_wd_machinegunner",         // Machinegunner
            "rhsusf_usmc_marpat_wd_machinegunner_ass",     // Assistant Machinegunner
            "rhsusf_usmc_marpat_wd_marksman",              // Designated Marksman
            "rhsusf_usmc_marpat_wd_sniper",                // Sniper
            "rhsusf_usmc_marpat_wd_spotter",               // Spotter
            "rhsusf_navy_marpat_wd_medic"                  // Medic
        };
        options[] = {{"allowWater", false}, {"forceRoads", true}, {"randomBehaviour", true}, {"waitAtWaypoint", true}, {"allowVehicles", false}, {"patrolBuildings", true}};
    };
};
```

The function arguments:

- 0: Configuration entry.
- 1: Group size either in [min, max] format or a defined number.
- 2: Marker or array of markers.
- 3: Specifies a fixed position for the unit to spawn instead of a random one. If the position is outside of the assigned marker, these will become waypoint or target markers.
- 4: AAIS group options that will be overwritten.

The following function calls will generate:

```cpp
["rhs_usaf_marine", [2, 5], "markerPatrol", []] call aais_spawn_fnc_spawnGroupFromConfig;
```

a group of size 2 to 5 (random) with random unit composition. Leader unit will chosen from `leaders` array while the rest of the units will be randomly selected from the `units` array. Behaviour, combat, formation and speed will be random, as well as AI skill, which will be between the specified boundaries. Group will randomly patrol in marker `markerPatrol`.

```cpp
["rhs_usaf_marine", 6, "markerAttack", [], [["task", "attack"]]] call aais_spawn_fnc_spawnGroupFromConfig;
```

This is the same as the previous example but the group will have a fixed size of 6. Additionally, the defined task is overwritten and this group will attack the area under `markerAttack`.

```cpp
["rhs_usaf_marine_1", 0, "markerPatrol", enemyLeader, [["patrolBuildings", false]]] call aais_spawn_fnc_spawnGroupFromConfig;
```

will spawn a fixed group at the position of the unit `enemyLeader`. The `patrolBuildings` option is also overwritten and the group will not check buildings.

```cpp
["Wheeled", [2 [3, 5]], "markerPatrol"] call aais_spawn_fnc_spawnGroupFromConfig;
```

will spawn a group with two random vehicles with its crew units selected from the `crew` array, and 3 to 5 cargo units. The cargo leaders from `cargoLeaders` while the rest of the cargo units will be selected from the `cargo` array.

## Using a template

If the *createTemplate* option is used, a group template with the given name will be created if it does not exist. This functionality is useful for cloning editor placed groups and spawning them as the mission progresses or to populate some areas quickly with predetermined compositions.

Once a template has been created, it can be used using the functions *aais_spawn_spawnGroupFromTemplate* or *aais_spawn_populateMarker* (see Populating a Marker section).

The function arguments are similar to spawning a group from a configuration entry:

- 0: Template name.
- 1: Number of groups to spawn either in [min, max] format or a defined number.
- 2: Marker or array of markers.
- 3: Specifies a fixed position for the unit to spawn instead of a random one. If the position is outside of the assigned marker, these will become waypoint or target markers.
- 4: AAIS group options that will be overwritten.

Given a template name `infantryUSMC` the following function call

```cpp
["infantryUSMC", [2, 5], "markerPatrol", [["spawnInBuilding", true]]] call aais_spawn_fnc_spawnGroupFromConfig;
```

will spawn between 2 and 5 groups equal to the original template in terms of skill, equipment, formation, ... within `markerPatrol`. Additionally, these groups will, as opposite to the original group, spawn in buildings.

## Populating a marker

It is also possible to quickly populate a marker using the `aais_spawn_fnc_populateMarker` function. Using it, allows combining templates, configuration entries and defined groups together in order to spawn groups of units in the specified marker(s). In case one or more markers are specified, units will spawn in one of the markers and use the rest as waypoint markers.

The function arguments are the following:

 * 0: Marker or array of markers.
 * 1: Groups to Spawn <ARRAY>
 *  0: Group count either in [min, max] format or a defined number
 *  1: Config/template entry or array of units
 *  2: Group size either in [min, max] format or a defined number or group side
 *  3: Specifies a fixed position for the unit to spawn instead of a random one. If the position is outside of the assigned marker, these will become waypoint or target markers.
 *  4: AAIS group options that will be overwritten or specified when using an array of units.
 *  5: Group type (only necessary when specifying an array of units)
 * 2: Common options to overwrite to all spawned groups

```cpp
["marker", [[1, 3], "infantryUSMC"], [2, "rhs_usaf_marine", 4], [2, ["b_infUnitLeader", "b_infUnit"], "west", [], [["task", "attack"]], "infantry"]], [["spawnInBuilding", true]]] call aais_spawn_fnc_populateMarker;
```

This will generate:

- 1 to 3 groups using the template `infantryUSMC`.
- 2 groups of size 4 using the config entry of `rhs_usaf_marine`.
- 2 groups with the units `b_infUnitLeader` and `b_infUnit` with the task `attack`

All units will have their default option `spawnInBuilding` overwritten and set to `true`, which means that all groups will spawn inside buildings.

## Activating and deactivating markers

It is also possible to activate or deactivate all units in the marker they spawned or the group designated marker. If deactivated, all simulation will be disabled and units will be hidden. In addition **all** AAIS scripts will be put on hold.

The functions `aais_core_fnc_activateMarkerGroups` and `aais_core_fnc_deactivateMarkerGroups` take care of this functionality, taking as an argument the desired marker.
