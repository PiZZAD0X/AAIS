#include "script_component.hpp"
EDEN_CHECK;

params ["_ctrl","_config"];

private _value = ((_ctrl controlsGroupCtrl 100) lbData lbCurSel (_ctrl controlsGroupCtrl 100));
private _group = ((get3denselected "group") select 0);
private _cfgname = gettext (_config >> 'property');
_group setvariable [_cfgname,_value];
_value
