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
