/*    Description: Compiles global arrays from 3DEN mission property values and default settings
 *    Arguments:
 *         N/A
 *    Return Value:
 *         ARRAY
 *    Author
 *        PiZZADOX
 */

#include "script_component.hpp"

private _sections = QUOTE(((str(configname _x)) select [0,4]) isEqualTo QN(PREFIX)) configClasses (configFile >> "Cfg3DEN" >> "Mission");
_sections apply {
    private _section = configName _x;
    private _children = [configFile >> "Cfg3DEN" >> "Mission" >> _section >> "AttributeCategories", 2, false] call BIS_fnc_returnChildren;
    _children apply {
        private _propertyname = getText (_x >> "property");
        if !(_propertyname isEqualTo "") then {
            private _missionvalue = getMissionConfigValue [_propertyname, "NONE"];
            if (_missionvalue isEqualTo "NONE") then {
                if ((missionNamespace getvariable [_propertyname, "NOTSET"]) isEqualTo "NOTSET") then {
                    if (isText(_x >> "defaultValue")) then {
                        private _valuetext = getText(_x >> "defaultValue");
                        missionNamespace setvariable [_propertyname, (call compile _valuetext), true];
                    } else {
                        ERROR_1("_propertyname: %1 null default value! not set!",_propertyname);
                    };
                };
            } else {
                missionNamespace setvariable [_propertyname, _missionvalue];
            };
        };
    };
};

SETMVAR(Initialized,true);
[QGVAR(SettingsLoaded), []] call CBA_fnc_localEvent;
