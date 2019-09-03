#### General
- debug map marker function

#### Behaviour
- group handler SM
-- track group vars and expose needed ones for map marker func
- unit handler SM
- commander SM

#### Editor Sync
- task module & function 
- task sync interrupt function -> if synced with control classes move to queue
- zone module <-> template/config module sync functionality
- editor sync -> pfh spawner

#### Config Spawn
- config module function
- config spawner switch -> spawns group if not synced to module, spawns group when zone activated when synced to zone,
creates/adds to template when synced to template module.
