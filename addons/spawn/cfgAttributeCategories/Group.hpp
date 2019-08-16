class Init : Init {
    collapsed = 1;
};

class State : State {
    collapsed = 1;
};

class GVAR(GroupBehaviour) {
    displayName = "AI Group Behavour Options";
    collapsed = 1;
    class Attributes {
        class GVAR(behaviour) {
            displayName = "Behaviour";
            tooltip = "Behaviour of the group or unit on activation. Default: SAFE";
            property = QGVAR(behaviour);
            control = QGVAR(behaviourControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'safe'";
        };
        class GVAR(combatMode) {
            displayName = "CombatMode";
            tooltip = "Combat Mode of the group or unit on activation. Default: Fire at Will, Engage at Will";
            property = QGVAR(combatMode);
            control = QGVAR(combatModeControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'red'";
        };
        class GVAR(speed) {
            displayName = "Speed";
            tooltip = "Speed of the group or unit on activation. Default: Limited";
            property = QGVAR(speed);
            control = QGVAR(speedControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'limited'";
        };
        class GVAR(formation) {
            displayName = "Formation";
            tooltip = "Formation of the group or unit on activation. Default: WEDGE";
            property = QGVAR(formation);
            control = QGVAR(formationControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'wedge'";
        };
        class GVAR(groupStance) {
            displayName = "Group Stance";
            tooltip = "Force the stance of the group. Default: AUTO";
            property = QGVAR(groupStance);
            control = QGVAR(stanceControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'auto'";
        };
        class GVAR(forceLights) {
            displayName = "Force Flashlights";
            tooltip = "Force group to use flashlights if dark. Removes NVG Goggles. Default: Off";
            property = QGVAR(forceLights);
            control = QGVAR(forcelightsControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class GVAR(surrender) {
            displayName = "Will Surrender";
            tooltip = "This group will surrender if there team leader dies or they take greater than 50% casualties. Default: False";
            property = QGVAR(surrender);
            control = QGVAR(boolControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class GVAR(groupInit) {
            displayName = "Group Init";
            tooltip = "Pass custom parameters or code to the group of units. ( _this = GROUP ) Default: Nil";
            property = QGVAR(groupInit);
            control = QGVAR(codeControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "'true'";
        };
    };
};
class GVAR(GroupTask) {
    displayName = "AI Group Task Options";
    collapsed = 1;
    class Attributes {
        class GVAR(createRadius) {
            displayName = "Creation Radius";
            tooltip = "Radius that Group will be randomly created in when activated. Default: 0";
            property = QGVAR(createRadius);
            control = QGVAR(standardNumberControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class GVAR(patrolRadius) {
            displayName = "Task Radius";
            tooltip = "Radius that Group will conduct the assigned task in. Default: 30m";
            property = QGVAR(patrolRadius);
            control = QGVAR(patrolradiusControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "30";
            typeName = "NUMBER";
            validate = "number";
        };
        class GVAR(waypointWait) {
            displayName = "Waypoint Wait Time";
            tooltip = "Time unit or group will wait at each auto generated waypoint. Default: 3 secs.";
            property = QGVAR(waypointWait);
            control = QGVAR(waypointwaitControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "3";
            typeName = "NUMBER";
            validate = "number";
        };
        class GVAR(startBuilding) {
            displayName = "Start in Building";
            tooltip = "Group will start inside nearest building then move out to conduct set task. Building Occupy tasks overide this setting. Default: Off";
            property = QGVAR(startBuilding);
            control = QGVAR(startbuildingControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "false";
            typeName = "BOOL";
        };
        class GVAR(task) {
            displayName = "Task";
            tooltip = "Task the unit or group will conduct on activation. Default: Patrol";
            property = QGVAR(task);
            control = QGVAR(taskControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "4";
        };
        class GVAR(TaskTimer) {
            displayName = "Time";
            tooltip = "How long the group will perform this task before continuing to another. Default: 0 (forever).";
            property = QGVAR(TaskTimer);
            control = QGVAR(standardNumberAltControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
    };
};
class GVAR(GroupPopulate) {
    displayName = "AI Populate Options";
    collapsed = 1;
    class Attributes {
        class GVAR(multiplier) {
            displayName = "Group Multiplier";
            tooltip = "Duplicates the group into multiple groups with same settings. Use Creation Radius to populate large areas randomly. Default: 1 (this group only)";
            property = QGVAR(multiplier);
            control = QGVAR(multiplierControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
            typeName = "NUMBER";
            validate = "number";
        };
        class GVAR(multiOccupy) {
            displayName = "Multiplied Groups Occupy Options";
            tooltip = "How many generated groups from the group muliplier will use the occupy options below. Default: NO CHANGE";
            property = QGVAR(multiOccupy);
            control = QGVAR(multioccupyControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
        class GVAR(occupyOption) {
            displayName = "Occupy Building Options";
            tooltip = "Should the group occupy a building or buildings. Default: OFF";
            property = QGVAR(occupyOption);
            control = QGVAR(occupyoptionControl);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
    };
};
