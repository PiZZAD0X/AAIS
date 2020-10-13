#include "script_component.hpp"

class GVAR(sightAidStateMachine) {
    list = QUOTE(allUnits select {\
        local _x && \
        {!isNull _x} && \
        {alive _x} && \
        {!isPlayer (leader _x)} && \
        {!(QEGETVAR(_x,Spawn,NOAI,false))} && \
        {QEGETVAR(group _x,Spawn,Spawned,false)} && \
        {!((QEGETVAR(group _x,Tasks,Task,'NONE')) isEqualTo 'BUNKER') && {!(QEGETVAR(_x,Spawn,Bunker,false))}} && \
        {(QGETMVAR(SightAidVehicles,true)) || {vehicle _x isEqualTo _x}} \
    });
    skipNull = 1;
    repeatPerFrame = 2;
    class Initial {
        onStateEntered = "";
        class isInitialized {
            targetState = QUOTE(Enemy_Check_);

            condition = QUOTE(true);
        };
    };
    class Enemy_Check_ {
        onStateEntered = QFUNC(onSEEnemyInRange);
        class Enemy_in__Range {
            targetState = QUOTE(Check_Nearby_Ene);

            condition = QUOTE(!((QGETVAR(_this,enemyInRange,[])) isEqualTo []));
        };
        class No_Enemy__in_Ran {
            targetState = QUOTE(Wait);

            condition = QUOTE(true);
        };
    };
    class Check_Nearby_Ene {
        onStateEntered = QFUNC(onSECheckNearbyEnemies);
        class Can_See {
            targetState = QUOTE(CombatMode);

            condition = QUOTE(([ARR_2((vehicle _this),QGETVAR(_this,enemyTarget,objnull))] call EFUNC(Core,LOSCheck)));
        };
        class Can_Not_See {
            targetState = QUOTE(Remove_Cant_See);

            condition = QUOTE(true);
        };
    };
    class CombatMode {
        onStateEntered = QFUNC(onSECombatMode);
        class Wait {
            targetState = QUOTE(Enemy_Check_);
            conditionFrequency = 2;
            condition = QUOTE(true);
        };
    };
    class Remove_Cant_See {
        onStateEntered = QFUNC(onSERemoveCantSeeEnemy);
        class Max_Checks {
            targetState = QUOTE(Wait);

            condition = QUOTE(QGETVAR(_this,seeChecks,0) > 8);
        };
        class Check_Next_Enemy {
            targetState = QUOTE(Check_Nearby_Ene);

            condition = QUOTE(!((QGETVAR(_this,enemyInRange,[])) isEqualTo []));
        };
        class No_Enemy__in_Ran {
            targetState = QUOTE(Wait);

            condition = QUOTE(true);
        };
    };
    class Wait {
        onStateEntered = "";
        class Wait_Completed {
            targetState = QUOTE(Enemy_Check_);
            conditionFrequency = 2;
            condition = QUOTE(true);
        };
    };
};
