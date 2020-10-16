class GVAR(ConfigModule): EGVAR(core,BaseModule) {
    scope = 2;
    displayName = "Config Spawn";
    function = QFUNC(configModule);
    functionPriority = 0;
    isGlobal = 1;
    isTriggerActivated = 0;
    isDisposable = 0;
    is3DEN = 1;
    canSetArea = 0;
    canSetAreaHeight = 0;
    canSetAreaShape = 0;
    icon = QPATHTOF(resources\aitemplatemodule_ca.paa);

    class AttributeValues {
        size3[] = {0,0,0};
        IsRectangle = 0;
    };

    class Attributes {
        class GVAR(configSelect) {
            displayName = "Group Config";
            tooltip = "";
            property = QGVAR(configSelect);
            control = QGVAR(ConfigSelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'NONE'";
        };
        class GVAR(Random) {
            property = QGVAR(Random);
            displayName = "Random";
            tooltip = "Set whether unit generation for the group is random.";
            control = EGVAR(Core,CheckboxRandom);
            expression = MODULE_EXPRESSION;
            defaultValue = "(false)";
        };
        class GVAR(MinSize) {
            property = QGVAR(MinSize);
            displayName = "Min Size";
            tooltip = "Set the minimum size of the unit if it is random.";
            control = "EditCode";
            expression = MODULE_EXPRESSION;
            defaultValue = "'3'";
            randomMode = 1;
        };
        class GVAR(MaxSize) {
            property = QGVAR(MaxSize);
            displayName = "Max Size";
            tooltip = "Set the maximum size of the unit if it is random.";
            control = "EditCode";
            expression = MODULE_EXPRESSION;
            defaultValue = "'8'";
            randomMode = 1;
        };
        class GVAR(Side) {
            property = QGVAR(Side);
            displayName = "Group Side";
            tooltip = "Set the side the group spawns on.";
            control = EGVAR(Core,SideSelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'EAST'";
        };
        class GVAR(Name) {
            property = QGVAR(Name);
            displayName = "Group Name";
            tooltip = "Set the name of the group on spawn";
            control = "EditCode";
            unique = 1;
            expression = MODULE_EXPRESSION;
            validate="variable";
            defaultValue = "''";
        };
        class GVAR(Init) {
            property = QGVAR(Init);
            displayName = "Group Init";
            tooltip = "Set the init of the group on spawn";
            control = "EditCodeMulti5";
            expression = MODULE_EXPRESSION;
            defaultValue = "''";
        };
        class GVAR(Probability) {
            property = QGVAR(Probability);
            displayName = "Probability of Presence";
            tooltip = "Probability that the group will be spawned.";
            control = QEGVAR(Core,0to100Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "100";
        };
        class GVAR(Stance) {
            property = QGVAR(Stance);
            displayName = "Group Stance";
            tooltip = "Force the stance of the group. Default: AUTO";
            control = "UnitPos";
            expression = MODULE_EXPRESSION;
            defaultValue = "'auto'";
        };
        class GVAR(CreateRadius) {
            property = QGVAR(CreateRadius);
            displayName = "Creation Radius";
            tooltip = "Radius that Group will be randomly created in when activated. Default: 0";
            control = QEGVAR(Core,0to250Step10_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(Multiplier) {
            property = QGVAR(Multiplier);
            displayName = "Group Multiplier";
            tooltip = "Duplicates the group into multiple groups with same settings. Use Creation Radius to populate large areas randomly. Default: 1 (this group only)";
            control = QEGVAR(Core,1to10Step1_Slider);
            expression = MODULE_EXPRESSION;
            defaultValue = "1";
        };
        class GVAR(Occupy) {
            property = QGVAR(Occupy);
            displayName = "Occupy Building Options";
            tooltip = "Should the group occupy a building or group of buildings. Default: Off";
            control = QGVAR(OccupySelectAttribute);
            expression = MODULE_EXPRESSION;
            defaultValue = "'Off'";
        };
        class GVAR(CombatMode) {
            property = QGVAR(CombatMode);
            displayName = "CombatMode";
            tooltip = "CombatMode";
            control = "CombatModeGroup";
            expression = ENTITY_EXPRESSION;
            defaultValue = "'YELLOW'";
        };
        class GVAR(Behaviour) {
            property = QGVAR(Behaviour);
            displayName = "Behaviour";
            tooltip = "Behaviour";
            control = "BehaviourGroup";
            expression = ENTITY_EXPRESSION;
            defaultValue = "'AWARE'";
        };
        class GVAR(Formation) {
            property = QGVAR(Formation);
            displayName = "Formation";
            tooltip = "Formation";
            control = "FormationGroup";
            expression = ENTITY_EXPRESSION;
            defaultValue = "'wedge'";
        };
        class GVAR(SpeedMode) {
            property = QGVAR(SpeedMode);
            displayName = "SpeedMode";
            tooltip = "SpeedMode";
            control = "SpeedModeGroup";
            expression = ENTITY_EXPRESSION;
            defaultValue = "'normal'";
        };
    };
};