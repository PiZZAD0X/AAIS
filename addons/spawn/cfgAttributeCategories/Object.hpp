class Init : Init {
    class Attributes {
        class Name {
            property = QGVAR(Name);
            expression = ENTITY_EXPRESSION;
        };
        class Init {
            property = QGVAR(Init);
            expression = ENTITY_EXPRESSION;
        };
    };
};

class State : State {
    class Attributes {
        class Lock {
            property = QGVAR(Lock);
            expression = ENTITY_EXPRESSION;
		};
        class Skill {
            property = QGVAR(Skill);
            expression = ENTITY_EXPRESSION;
		};
        class Health {
            property = QGVAR(Health);
            expression = ENTITY_EXPRESSION;
		};
        class Fuel {
            property = QGVAR(Fuel);
            expression = ENTITY_EXPRESSION;
		};
        class Ammo {
            property = QGVAR(Ammo);
            expression = ENTITY_EXPRESSION;
		};
        class Rank {
            property = QGVAR(Rank);
            expression = ENTITY_EXPRESSION;
		};
        class UnitPos {
            property = QGVAR(UnitPos);
            expression = ENTITY_EXPRESSION;
		};
    };
};

class GVAR(HiddenUnitOptions) {
    displayName = "";
    class Attributes {
        class GVAR(unitPos_Hidden) {
            property = QGVAR(unitPos_Hidden);
            displayName = "";
            tooltip = "";
            control = QEGVAR(core,HiddenAttribute);
            expression = ENTITY_EXPRESSION;
            defaultValue = "0";
        };
    };
};

//class GVAR(UnitOptions) {
//    displayName = "AI Unit Options";
//    collapsed = 1;
//    class Attributes {
//        class GVAR(unitIdentity) {
//            displayName = "Identity";
//            tooltip = "Set the custom name to appear when the units Identity is checked. Default: Nil";
//            property = QGVAR(unitIdentity);
//            control = QGVAR(standardStringOneControl);
//            expression = ENTITY_EXPRESSION;
//            defaultValue = "''";
//        };
//        class GVAR(unitPersistent) {
//            displayName = "Persistent";
//            tooltip = "Is the unit persistent, will be it get cleaned up by the clean up script if it dies. Default: Persistent";
//            property = QGVAR(unitPersistent);
//            control = QGVAR(persistentControl);
//            expression = ENTITY_EXPRESSION;
//            defaultValue = "true";
//            typeName = "BOOL";
//        };
//        class GVAR(unitFlying) {
//            displayName = "Flying";
//            tooltip = "Is the unit spawning in flight. Default: False";
//            property = QGVAR(unitFlying);
//            control = QGVAR(flyingControl);
//            expression = ENTITY_EXPRESSION;
//            condition = "objectVehicle";
//            defaultValue = "false";
//            typeName = "BOOL";
//        };
//        class GVAR(unitFlyInHeight) {
//            displayName = "Flight Height";
//            tooltip = "Set the unit flying height. Default: 250";
//            property = QGVAR(unitFlyInHeight);
//            control = QGVAR(flyinheightControl);
//            expression = ENTITY_EXPRESSION;
//            condition = "objectVehicle";
//            defaultValue = 250;
//            typeName = "NUMBER";
//        };
//    };
//};
