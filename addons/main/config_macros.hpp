#define SCENARIO_EXPRESSION QUOTE(missionNamespace setVariable [ARR_2('%s',_value)];)

#define ENTITY_EXPRESSION QUOTE(_this setVariable [ARR_2('%s',_value)];)

#define OBJECT_FNC_EXPRESSION(var1,var2) QUOTE(\
_this setVariable [ARR_2('%s',_value)];\
[ARR_2(_this,_value)] call EFUNC(var1,var2);\
)

#define MODULE_EXPRESSION QUOTE([ARR_3(_this,'%s',_value)] call EFUNC(core,ModuleExpression);)
