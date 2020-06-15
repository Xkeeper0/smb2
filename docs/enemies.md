## Object/Enemy RAM

### `$0015`  (`ObjectXHi`)
- high byte for x-position

### `$001F`  (`ObjectYHi`)
- high byte for y-position

### `$0029`  (`ObjectXLo`)
- low byte for x-position

### `$0032`  (`ObjectYLo`)
- low byte for y-position

### `$003D`  (`ObjectXVelocity`)
- x-velocity

### `$0047`  (`ObjectYVelocity`)
- y-velocity

### `$0051`  (`EnemyState`)
- enemy state (eg. alive/dead/puff of smoke)

### `$005B`  (`EnemyCollision`)
- enemy collision flags

### `$0065`  (`ObjectAttributes`)
- attributes used for rendering an object (eg. mirroring, size, layering)

### `$006F`  (`EnemyMovementDirection`)
- direction of enemy movement (used for velocity lookups)

### `$0079`  (`EnemyVariable`)
- Birdo type
- Whether item is attached to Birdo
- Mushroom index
- Tweeter bounce counter
- Background tile for Mushroom Block
- Starting y-position for falling logs
- Clawgrip's movement cycle
- Cobrat target Y
- Pokey number of segments
- Fryguy's movement cycle?
- Whale spout timer?
- Wart's movement cycle

### `$0086`  (`ObjectTimer1`)
- BobOmb fuse
- Bomb fuse
- Panser spit
- Trouter jump
- Birdo spit
- Puff of smoke
- Block fizzle
- Pidgit dive
- ...

### `$0090`  (`ObjectType`)
- enemy type ID

### `$009F`  (`ObjectAnimationTimer`)
- time animation frames

### `$00A8`  (`ObjectBeingCarriedTimer`)

### `$00B1`  (`EnemyArray_B1`)

### `$042F` (`ObjectProjectileTimer`)
 - stun timer

### `$0438` (`ObjectStunTimer`)

### `$0453` (`ObjectTimer2`)

### `$045C` (`ObjectFlashTimer`)
  - flashing timer

### `$0465` (`EnemyHP`)

### `$046E` (`EnemyArray_46E`)

### `$0477` (`EnemyArray_477`)

### `$0480` (`EnemyArray_480`)

### `$0489` (`ObjectHitbox`)

### `$0492` (`EnemyArray_492`)

### `$049B` (`EnemyArray_SpawnsDoor`)
- if set, an end-of-level door spawns when the enemy is defeated

### `$04A4` (`ObjectNonSticky`)

### `$04CC` (`ObjectXAcceleration`)

### `$04D6` (`ObjectYAcceleration`)

### `$04EF` (`EndOfLevelDoorPage`)

