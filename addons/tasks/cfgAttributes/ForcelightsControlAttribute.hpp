class GVAR(forcelightsControlAttribute) : ToolBox {
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 100;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 2;
            values[] = {0,1};
            strings[] = {"Default","Force Flashlights"};
        };
    };
};