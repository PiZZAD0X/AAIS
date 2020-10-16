class Cfg3DEN {
    class Attributes {
        #include "CfgAttributes.hpp"
    };

    class Group {
        class AttributeCategories {
            #include "cfgAttributeCategories\Group.hpp"
        };
    };
    
    class Mission {
        #include "cfg3DEN\cfg3denMenuCategories.hpp"
    };
};
