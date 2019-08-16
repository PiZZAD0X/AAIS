class AAIS_Caching_StateMachine {
    list = QUOTE(allGroups select {local _x && {_x getVariable [ARR_2(QQEGVAR(core,enabled), false)]}});
    skipNull = 1;

    class Init {
        onStateEntered = QFUNC(onCacheInit);
        class Cache {
            targetState = "Cache";
            events[] = {QGVAR(cache)};
        };

        class Uncache {
            targetState = "Uncache";
            events[] = {QGVAR(uncache)};
        };
    };

    class Cache {
        onStateEntered = QFUNC(cacheGroup);
        onState = QFUNC(handleCache);

        class LeaderChanged {
            targetState = "LeaderChanged";
            events[] = {QGVAR(leaderChanged)};
        };

        class MoveUnits {
            targetState = "MoveUnits";
            events[] = {QGVAR(moveUnits)};
        };

        class Uncache {
            targetState = "Uncache";
            events[] = {QGVAR(uncache)};
        };
    };

    class LeaderChanged {
        onStateEntered = QFUNC(changeLeader);

        class Cache {
            targetState = "Cache";
            events[] = {QGVAR(cache)};
        };
    };

    class MoveUnits {
        onStateEntered = QFUNC(moveCachedUnits);

        class Cache {
            targetState = "Cache";
            events[] = {QGVAR(cache)};
        };
    };

    class Uncache {
        onStateEntered = QFUNC(uncacheGroup);
        onState = QFUNC(handleUncache);

        class Cache {
            targetState = "Cache";
            events[] = {QGVAR(cache)};
        };
    };
};
