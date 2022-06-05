# List of all NCS Core events

### Each event is prefixed with `ncs:`, but are auto_formatted by the NCS events functions.

<hr>

### Server

|      Event      |                                   Description                                    |              Variables              |
|:---------------:|:--------------------------------------------------------------------------------:|:-----------------------------------:|
|  databaseReady  |                             Emited when db is ready                              |                                     |
|  serverInvoked  |                      Emited when the server is starting up                       |                                     |
|   serverReady   | Emited when the server is ready to server<br/>and all components has been loaded |                                     |
|  serverStopped  |                            Emited when NCS shut down                             |                                     |
|  playerJoining  |                  Emited when a player reach the loading screen                   | `_src`, `identifier`, `characterId` |
| playerNowInGame |      Emited when a player finished the loading screen and game initialized       |     `_src`, `needToCreateSkin`      |

<hr>

### Server → Client

|         Event          |                                 Description                                  |    Variables     |
|:----------------------:|:----------------------------------------------------------------------------:|:----------------:|
| invokeCharacterCreator | Emited when the character need to be teleported into character customization | `alreadySpawned` |

<hr>

### Client

|     Event     |              Description              | Variables |
|:-------------:|:-------------------------------------:|:---------:|
| clientInvoked | Emited when the client is starting up |           |

<hr>

### Client → Server

|   Event   |              Description              | Variables |
|:---------:|:-------------------------------------:|:---------:|
| nowInGame | Emited when the client is now in game |           |