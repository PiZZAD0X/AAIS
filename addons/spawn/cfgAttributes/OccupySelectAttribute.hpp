class GVAR(OccupySelectAttribute): Combo {
    attributeSave = QUOTE([ARR_2(_this,_config)] call FUNC(OccupySelectAttribute_AttrSave));
    attributeLoad = QUOTE([ARR_3(_this,_value,_config)] call FUNC(OccupySelectAttribute_AttrLoad));
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged = QUOTE(_this call FUNC(OccupySelectAttribute_onLBSelChanged));
        };
    };
};
