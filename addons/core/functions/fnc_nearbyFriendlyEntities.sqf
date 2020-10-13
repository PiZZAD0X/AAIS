#include "script_component.hpp"


params ["_unit", ["_distance", 25, [25]]];

private _nearbyEntities = _unit nearEntities [["CAManBase", "Car", "TrackedAPC", "WheeledAPC", "Tank"], _distance];
private _nearbyFriendlies = _nearbyEntities select {side _x isEqualTo side _unit};

private _nearbyInfantry = 0;
private _nearbyCars = 0;
private _nearbyAPCs = 0;
private _nearbyTanks = 0;

_nearbyFriendlies apply {
    private _unit = _x;
    switch (true) do {
        case (_unit isKindOf "CAManBase"): {
            _nearbyInfantry = _nearbyInfantry + 1;
        };
        case (_unit isKindOf "Car"): {
            _nearbyCars = _nearbyCars + 1;
        };
        case (_unit isKindOf "TrackedAPC" || {_unit isKindOf "WheeledAPC"}): {
            _nearbyAPCs = _nearbyAPCs + 1;
        };
        case (_unit isKindOf "Tank"): {
            _nearbyTanks = _nearbyTanks + 1;
        };
        default {};
    };
};

private _nearbyEntities = [_nearbyInfantry, _nearbyCars, _nearbyAPCs, _nearbyTanks];

_nearbyEntities


