class GVAR(ConfigSelectAttribute): Combo {
    h = "(7 * 5) * (pixelH * pixelGrid * 0.50)";
    attributeSave = QUOTE([ARR_2(_this,_config)] call FUNC(ConfigSelectAttribute_AttrSave));
    attributeLoad = QUOTE([ARR_3(_this,_value,_config)] call FUNC(ConfigSelectAttribute_AttrLoad));
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {
            onLBSelChanged = QUOTE(_this call FUNC(ConfigSelectAttribute_onLBSelChanged));
        };
        class Picture0: ctrlStaticPictureKeepAspect {
            idc = 220;
            h = "8 * (pixelH * pixelGrid * 0.50)";
            w = "6 * (pixelW * pixelGrid * 0.50)";
            y = "(2 * 5) * (pixelH * pixelGrid * 0.50)";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            text = "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa";
        };
        class Picture1: Picture0 {
            idc = 221;
            x = "(48 + 8) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture2: Picture0 {
            idc = 222;
            x = "(48 + (8 * 2)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture3: Picture0 {
            idc = 223;
            x = "(48 + (8 * 3)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture4: Picture0 {
            idc = 224;
            x = "(48 + (8 * 4)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture5: Picture0 {
            idc = 225;
            x = "(48 + (8 * 5)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture6: Picture0 {
            idc = 226;
            x = "(48 + (8 * 6)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture7: Picture0 {
            idc = 227;
            x = "(48 + (8 * 7)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture8: Picture0 {
            idc = 228;
            x = "(48 + (8 * 8)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture9: Picture0 {
            idc = 229;
            x = "(48 + (8 * 9)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture10: Picture0 {
            idc = 230;
            y = "(3 * 5) * (pixelH * pixelGrid * 0.50)";
            x = "48 * (pixelW * pixelGrid * 0.50)";
        };
        class Picture11: Picture10 {
            idc = 231;
            x = "(48 + 8) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture12: Picture10 {
            idc = 232;
            x = "(48 + (8 * 2)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture13: Picture10 {
            idc = 233;
            x = "(48 + (8 * 3)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture14: Picture10 {
            idc = 234;
            x = "(48 + (8 * 4)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture15: Picture10 {
            idc = 235;
            x = "(48 + (8 * 5)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture16: Picture10 {
            idc = 236;
            x = "(48 + (8 * 6)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture17: Picture10 {
            idc = 237;
            x = "(48 + (8 * 7)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture18: Picture10 {
            idc = 238;
            x = "(48 + (8 * 8)) * (pixelW * pixelGrid * 0.50)";
        };
        class Picture19: Picture10 {
            idc = 239;
            x = "(48 + (8 * 9)) * (pixelW * pixelGrid * 0.50)";
        };
        class PictureCar0: Picture0 {
            idc = 320;
            h = "8 * (pixelH * pixelGrid * 0.50)";
            w = "10 * (pixelW * pixelGrid * 0.50)";
            y = "(4.5 * 5) * (pixelH * pixelGrid * 0.50)";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            text = "\A3\ui_f\data\map\vehicleicons\iconAPC_ca.paa";
        };
        class PictureCar1: PictureCar0 {
            idc = 321;
            x = "(48 + 12) * (pixelW * pixelGrid * 0.50)";
        };
        class PictureCar2: PictureCar0 {
            idc = 322;
            x = "(48 + (12 * 2)) * (pixelW * pixelGrid * 0.50)";
        };
        class PictureCar3: PictureCar0 {
            idc = 323;
            x = "(48 + (12 * 3)) * (pixelW * pixelGrid * 0.50)";
        };
        class RandomText: ctrlStaticTitle {
            idc = 120;
            y = "(6 * 5) * (pixelH * pixelGrid * 0.50)";
            w = "(5) * (pixelH * pixelGrid * 0.50)";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            text = "Random";
        };
        class RandomPicture: ctrlStaticPictureKeepAspect {
            idc = 121;
            y = "(6 * 5) * (pixelH * pixelGrid * 0.50)";
            x = "(48 + 6) * (pixelW * pixelGrid * 0.50)";
            text = "\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa";
        };
    };
};
