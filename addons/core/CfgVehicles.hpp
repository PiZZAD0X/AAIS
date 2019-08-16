class CfgVehicles {
    class All {
        class EventHandlers {};
    };
    class Logic;
    class Module_F: Logic {
        class EventHandlers;
        class ArgumentsBaseUnits {
            class Units;
        };
        class ModuleDescription {
            class AnyBrain;
        };
    };

    class GVAR(BaseModule): Module_F {
        category = QGVAR(FactionClass);
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        is3DEN = 0;
        scope = 1;
        icon = "\a3\3DEN\Data\CfgWaypoints\scripted_ca.paa";
        editorCategory = QGVAR(Category);
        editorSubCategory = QGVAR(SubCategory);
    };
};
