class GVAR(SideSelectAttribute): Combo {
    attributeSave = QUOTE([ARR_2(_this,_config)] call FUNC(SideSelectAttribute_AttrSave));
    attributeLoad = QUOTE([ARR_3(_this,_value,_config)] call FUNC(SideSelectAttribute_AttrLoad));
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged = QUOTE(_this call FUNC(SideSelectAttribute_onLBSelChanged));
        };
    };
};
