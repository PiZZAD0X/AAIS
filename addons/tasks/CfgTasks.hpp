class CfgTasks {
    class Patrol {
        displayName = "Patrol";
        taskName = "PATROL";
        function = QFUNC(taskPatrol);
        requireModule = -1;
        type = "DEFENSIVE";
    };
    class Attack {
        displayName = "Attack";
        taskName = "ATTACK";
        function = QFUNC(taskAttack);
        requireModule = 1;
        type = "OFFENSIVE";
    };
};
