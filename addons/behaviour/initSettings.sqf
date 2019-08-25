[
    QGVAR(reactDeadBodies),
    "CHECKBOX",
    "React to dead bodies",
    "AAIS",
    false,
    true,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(useSmoke),
    "CHECKBOX",
    "Use smoke grenades?",
    "AAIS",
    false,
    true,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(grenadeChance),
    "SLIDER",
    "Grenade chance in %",
    "AAIS",
    [0, 100, 45, 0],
    true,
    {}
] call CBA_fnc_addSetting;

[
    QGVAR(shareDistance),
    "SLIDER",
    "Share information distance",
    "AAIS",
    [0, 5000, 500, 0],
    true,
    {}
] call CBA_fnc_addSetting;