class GVAR(GroupAreaSelectAttribute): Combo {
    attributeLoad = QUOTE([ARR_3(_this,_value,_config)] call FUNC(GroupAreaSelectAttribute_attrload));
    attributeSave = QUOTE([ARR_2(_this,_config)] call FUNC(GroupAreaSelectAttribute_attrsave));
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};
