class AAIS_Tasks_StateMachine {
    list = QUOTE(allGroups select {local _x && {_x getVariable [ARR_2(QQEGVAR(core,enabled), false)]}});
    skipNull = 1;

    class Init {
        onStateEntered = QFUNC(onInitEntered);
        class DoTask {
            targetState = "DoTask";
            condition = QUOTE(CBA_missionTime > 0);
        };
    };

    class DoTask {
        onStateEntered = QFUNC(onDoTaskEntered);
        class TaskAttack {
            targetState = "TaskAttack";
            events[] = {QGVAR(attack)};
        };
        class TaskDefend {
            targetState = "TaskDefend";
            events[] = {QGVAR(defend)};
        };
        class TaskGarrison {
            targetState = "TaskGarrison";
            events[] = {QGVAR(garrison)};
        };
        class TaskPatrol {
            targetState = "TaskPatrol";
            events[] = {QGVAR(patrol)};
        };
        class TaskPatrolRandom {
            targetState = "TaskPatrolRandom";
            events[] = {QGVAR(patrolRandom)};
        };
        class TaskTransport {
            targetState = "TaskTransport";
            events[] = {QGVAR(transport)};
        };
        class DoNothing {
            targetState = "DoNothing";
            events[] = {QGVAR(doNothing)};
        };
    };

    class TaskAttack {
        onStateEntered = QFUNC(onAttackEntered);
        onState = QFUNC(onAttack);

        class DoTask {
            targetState = "DoTask";
            condition = QFUNC(checkDoTask);
        };

        class Flank {
            targetState = "Flank";
            events[] = {QGVAR(flankManeuver)};
        };

        class Retreat {
            targetState = "Retreat";
            events[] = {QGVAR(retreatManeuver)};
        };

        class TaskDefend {
            targetState = "TaskDefend";
            events[] = {QGVAR(defend)};
        };

        class TaskGarrison {
            targetState = "TaskGarrison";
            events[] = {QGVAR(garrison)};
        };
    };

    class Flank {
        onStateEntered = QFUNC(onFlankEntered);
        onState = QFUNC(onFlank);

        class DoTask {
            targetState = "DoTask";
            events[] = {QGVAR(doTask)};
        };

        class TaskAttack {
            targetState = "TaskAttack";
            events[] = {QGVAR(attack)};
        };

        class Retreat {
            targetState = "Retreat";
            events[] = {QGVAR(retreatManeuver)};
        };

        class TaskDefend {
            targetState = "TaskDefend";
            events[] = {QGVAR(defend)};
        };

        class TaskGarrison {
            targetState = "TaskGarrison";
            events[] = {QGVAR(garrison)};
        };
    };

    class Retreat {
        onStateEntered = QFUNC(onRetreatEntered);
        onState = QFUNC(onRetreat);

        class DoTask {
            targetState = "DoTask";
            events[] = {QGVAR(doTask)};
        };

        class TaskAttack {
            targetState = "TaskAttack";
            events[] = {QGVAR(attack)};
        };

        class Flank {
            targetState = "Flank";
            events[] = {QGVAR(flankManeuver)};
        };

        class TaskDefend {
            targetState = "TaskDefend";
            events[] = {QGVAR(defend)};
        };

        class TaskGarrison {
            targetState = "TaskGarrison";
            events[] = {QGVAR(garrison)};
        };
    };

    class TaskDefend {
        onStateEntered = QFUNC(onDefendEntered);
        onState = QFUNC(onDefend);
    };

    class TaskGarrison {
        onStateEntered = QFUNC(onGarrisonEntered);
        onState = QFUNC(onGarrison);

        class DoTask {
            targetState = "DoTask";
            condition = QFUNC(checkDoTask);
        };

        class Flank {
            targetState = "Flank";
            events[] = {QGVAR(flankManeuver)};
        };

        class Retreat {
            targetState = "Retreat";
            events[] = {QGVAR(retreatManeuver)};
        };

        class TaskDefend {
            targetState = "TaskDefend";
            events[] = {QGVAR(defend)};
        };

        class TaskAttack {
            targetState = "TaskAttack";
            events[] = {QGVAR(attack)};
        };
    };

    class TaskPatrolRandom {
        onStateEntered = QFUNC(onPatrolRandomEntered);
        onState = QFUNC(onPatrolRandom);

        class DoTask {
            targetState = "DoTask";
            events[] = {QGVAR(doTask)};
        };

        class PatrolBuildings {
            targetState = "PatrolBuildings";
            events[] = {QGVAR(patrolBuildings)};
        };
        class SearchVehicles {
            targetState = "SearchVehciles";
            events[] = {QGVAR(searchVehicles)};
        };
        class Disembark {
            targetState = "Disembark";
            events[] = {QGVAR(disembark)};
        };
        class Wait {
            targetState = "Wait";
            events[] = {QGVAR(wait)};
        };
    };

    class TaskPatrol {
        onStateEntered = QFUNC(onPatrolEntered);
        onState = QFUNC(onPatrolRandom);

        class DoTask {
            targetState = "DoTask";
            events[] = {QGVAR(doTask)};
        };

        class PatrolBuildings {
            targetState = "PatrolBuildings";
            events[] = {QGVAR(patrolBuildings)};
        };

        class Embark {
            targetState = "Embark";
            events[] = {QGVAR(embark)};
        };

        class Disembark {
            targetState = "Disembark";
            events[] = {QGVAR(disembark)};
        };

        class Wait {
            targetState = "Wait";
            events[] = {QGVAR(wait)};
        };
    };

    class TaskTransport {
        class DoTask {
            targetState = "DoTask";
            events[] = {QGVAR(doTask)};
        };

        class Transport {
            targetState = "Transport";
            condition = QUOTE(_this getVariable [ARR_2(QQGVAR(inMission), false)]);
        };
    };

    class DoNothing {
        onStateEntered = "";
        class DoTask {
            targetState = "DoTask";
            condition = QFUNC(checkDoTask);
        };
    };

    class PatrolBuildings {
        onStateEntered = QFUNC(onPatrolBuildingEntered);
        onState = QFUNC(onPatrolBuilding);

        class DoTask {
            targetState = "DoTask";
            events[] = {QGVAR(doTask)};
        };
    };

    class SearchVehicles {

    };

    class Disembark {
        onStateEntered = QFUNC(onDisembarkEntered);
        onState = QFUNC(onDisembark);

        class PatrolBuildings {
            targetState = "PatrolBuildings";
            events[] = {QGVAR(patrolBuildings)};
        };

        class TaskPatrol {
            targetState = "TaskPatrol";
            events[] = {QGVAR(patrol)};
        };

        class Embark {
            targetState = "Embark";
            events[] = {QGVAR(embark)};
        };

        class Wait {
            targetState = "Wait";
            events[] = {QGVAR(wait)};
        };
    };

    class Embark {
        onStateEntered = QFUNC(onEmbarkEntered);
        onState = QFUNC(onEmbark);

        class DoTask {
            targetState = "DoTask";
            events[] = {QGVAR(doTask)};
        };
    };

    class Transport {
        onStateEntered = QFUNC(onTransportEntered);
    };

    class Wait {
        onStateEntered = QUOTE(_this setVariable [ARR_2(QQGVAR(waitUntil), CBA_missionTime + 30 + random 30)]); // killing a ; // killing a unit also exits the state machine for this unit

        class DoTask {
            targetState = "DoTask";
            condition = QUOTE(CBA_missionTime >= _this getVariable [ARR_2(QQGVAR(waitUntil), CBA_missionTime)]);
        };
    };
};
