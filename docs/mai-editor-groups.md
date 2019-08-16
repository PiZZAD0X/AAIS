---
title: Using AAIS with Editor Placed Groups
---

## AAIS options

| Option             | Accepted values                     | Description |
| ------------------ | ----------------------------------- | ----------- |
| allowLand          | _true_, false                       |
| allowvehicles      | _true_, false                       |
| allowWater         | true, _false_                       |
| behaviour          | Any valid group behaviour           | Group behaviour. 1)
| blacklist          | Array of markers, triggers or areas | Blacklists the specified areas for spawn and waypoint generation
| combatMode         | Any valid combat mode               | Combat mode. 1)
| createTemplate     | String                              | Creates a group template
| deleteSpawnMarkers | true, _false_                       | Deletes all markers used for spawning units, leaving only waypoint markers.
| execWaypoint       | Any string code (default: "")       | Code executed at the end of each waypoint.
| flyInHeight        | Constant value or [min, max]        | Flight altitude.
| forceroads         | true, *false*                       | Forces waypoints on roads.
| formation          | Any valid group formation           | Group formation. 1)
| fullCache          | true, _false_                       | Hides and disables the simulation of a group upon spawn.
| init               | Any string code (default: "")       | Code executed when the group is created.
| marker             | Any valid marker name or array of markers in the format ["marker", weight] | Marker assigned to a group.
| patrolBuildings    | _true_, false                       | Group can enter and patrol buildings.
| preSpawn           | Any string code (default: "")       | Code executed before the units are spawned.
| randomBehaviour    | _true_, false                       | Randomise the group's behaviour, combatMode, formation and speed at each waypoint.
| randomPosition     | true, _false_                       | Randomise the position of the group.
| reinforcement      | _true_, false                       | Unit can be used as a reinforcement.
| release            | true, _false_                       | Group will be released from AAIS control.
| skill              |
| skillLeader        |
| spawnInBuilding    | true, _false_                       |
| speed              | Any valid group speed               | Group speed. 1)
| swimInDepth        | Constant value or [min, max]        | Depth the unit will swim at.
| task               | Any valid group task                | Assigned group task. See AAIS tasks
| type               | Any valid group type                |
| waitAtWaypoint     | _true_, false                       |
| waypointMarkers    | List of markers in the format ["marker", weight] |
1) If an array is given and randomBehaviour is enabled, a random value will be chosen at the start of each waypoint

## AAIS Tasks

- Attack: X
- Defend: --
- Do Nothing: X
- Garrisson: --
- Patrol (patrol): X
- Random patrol (patrolRandom): _Default behaviour_ X
- Ressupply: --
- Transport: --

## AAIS Types

- Air:
- Armored:
- Infantry:
- Ship:
- Wheeled:
