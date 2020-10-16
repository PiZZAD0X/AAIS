class GVAR(CheckboxRandom): Checkbox {
    attributeLoad = QUOTE([ARR_3(_this,_value,_config)] call FUNC(CheckboxRandom_AttrLoad));
    attributeSave = QUOTE([ARR_2(_this,_config)] call FUNC(CheckboxRandom_AttrSave));
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            idc = 100;
            onCheckedChanged = QUOTE(_this call FUNC(CheckboxRandom_onCheckedChanged));
        };
    };
};
