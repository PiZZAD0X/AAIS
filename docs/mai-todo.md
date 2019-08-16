---
title: TODO
---

# Existing modules

## Building

## Caching
* [ ] General testing
* [ ] Check if moving units that are cached in order to have them affected by explosions
* [ ] Do not cache units if they are in combat or know an enemy? (Check)
* [x] ~~Implement caching for empty vehicles and props?~~ (Should be done in other AI Mods. This mod should only affect the marked groups.

## Core

* [ ] Implement reinforcement option:
  * [ ] Evaluation of enemy capacity to call the best suiting reinforcement group.
  * [ ] Evaluation of allied groups to better reinforce an allied group under attack
* [x] Implement spawning in buildings
* [x] Activate/deactivate all units in a marker. Integration with caching state-machine

## Spawn

* [x] Remove sleep and convert to PFH.
* [x] Spawn inside buildings. Prevent a building position from being used twice.

## Tasks

* [ ] Add the following tasks:
  * [ ] Attack:
  * [ ] Defend:
  * [ ] Garrisson:
  * [ ] Ressupply/repair: When units/vehicles are low on munition or are damaged, implement a
  * [ ] Transport: transport units will be used to move other units from A->B if it is far enough
  * [ ] Move to land: units in a boat will move to land to start another task
* [ ] Improve the tasks:
  * [ ] All tasks:
    * [ ] Add support for air units and boats (swimInDepth, flyInHeight)
  * [ ] Random patrol: Vehicle cargo crews should also patrol when disembarking.

## Vehicles

* [ ] Adjust permiter depending on the surroundings (forest, urban,...)

## Waypoint

* [x] Implement marker blacklist
* [x] Implement creating a network of markers with different weights. Groups can travel between markers.
* [ ] Improvements to waypoint for other unit types (air units, boats, divers,...)?

# New modules (v0.2.0?)

* [ ] Implement combat behaviours, alertness, flanking and other AI enhancements (smoke, fire supression, retreat, surrender)
* [ ] Implementation using another state machine?  
