;
; Bank 2 & Bank 3
; ===============
;
; What's inside:
;
;   - Enemy initialization and logic
;

CarryYOffsets:
CarryYOffsetBigLo:
	.db $FA ; Mario
	.db $F6 ; Princess
	.db $FC ; Toad
	.db $F7 ; Luigi

CarryYOffsetBigHi:
	.db $FF ; Mario
	.db $FF ; Princess
	.db $FF ; Toad
	.db $FF ; Luigi

CarryYOffsetSmallLo:
	.db $02 ; Mario
	.db $FE ; Princess
	.db $04 ; Toad
	.db $FF ; Luigi

CarryYOffsetSmallHi:
	.db $00 ; Mario
	.db $FF ; Princess
	.db $00 ; Toad
	.db $FF ; Luigi


AreaMainRoutine:
	LDA DoAreaTransition
	BEQ AreaMainRoutine_NoTransition
	RTS

AreaMainRoutine_NoTransition:
	LDA AreaInitialized
	BEQ AreaInitialization

	JMP AreaMainRoutine_Gameplay

; ---------------------------------------------------------------------------

AreaInitialization:
	INC AreaInitialized
	STA byte_RAM_5BA
	STA POWQuakeTimer
	STA SkyFlashTimer
	STA CrystalAndHawkmouthOpenSize
	STA HawkmouthClosing
	STA SwarmType
	STA HawkmouthOpenTimer
	STA ScrollXLock
	STA VerticalScrollDirection
	STA PlayerXVelocity
	STA DamageInvulnTime
	STA HoldingItem
	STA PlayerStateTimer
	STA BackgroundYOffset
	STA PokeyTempScreenX
	STA CrouchJumpTimer
	STA JumpFloatTimer
	STA QuicksandDepth
	STA BossBeaten

IFDEF RESET_CHR_LATCH
	LDY #$FF
	STY BossTileset
	INC ResetCHRLatch
ENDIF

	LDY #$1B
AreaInitialization_CarryYOffsetLoop:
	; Copy the global carrying Y offsets to memory
	; These are used for every character for different frames of the pickup animation
	LDA ItemCarryYOffsets, Y
	STA ItemCarryYOffsetsRAM, Y
	DEY
	BPL AreaInitialization_CarryYOffsetLoop

IFDEF CONTROLLER_2_DEBUG
	JSR CopyCarryYOffsets
ENDIF

	; Copy the character-specific FINAL carrying heights into memory
	LDY CurrentCharacter
	LDA CarryYOffsetBigLo, Y
	STA ItemCarryYOffsetsRAM
	LDA CarryYOffsetSmallLo, Y
	STA ItemCarryYOffsetsRAM + $07
	LDA CarryYOffsetBigHi, Y
	STA ItemCarryYOffsetsRAM + $0E
	LDA CarryYOffsetSmallHi, Y
	STA ItemCarryYOffsetsRAM + $15

	LDA #$B6
	STA PseudoRNGSeed
	LDA TransitionType

	; Play the slide-whistle when you start the game and drop into 1-1
	ORA CurrentLevel
	BNE AreaInitialization_CheckObjectCarriedOver

	LDA #SoundEffect2_IntroFallSlide
	STA SoundEffectQueue2

AreaInitialization_CheckObjectCarriedOver:
	LDA ObjectCarriedOver
	BEQ AreaInitialization_SetEnemyData

	LDX #$05
	STX byte_RAM_12
	CMP #Enemy_Mushroom
	BEQ AreaInitialization_SetEnemyData

	STA ObjectType, X
	LDY #EnemyState_Alive
	STY EnemyState + 5
	LDY #$FF
	STY EnemyRawDataOffset + 5
	CMP #Enemy_Rocket
	BNE AreaInitialization_NonRocketCarryOver

AreaInitialization_Rocket:
	; A = $38 (Enemy_Rocket)
	; X = $05 (from above)
	STA EnemyArray_B1, X
	STA PlayerInRocket, X ; Bug? This sets ObjectXAcceleration for enemy 0
	STA EnemyArray_477, X
	LDA #$00
	STA ObjectXHi, X
	STA ObjectYHi, X
	JSR SetEnemyAttributes

	LDA #$F0
	STA ObjectYVelocity, X
	ASL A
	STA ObjectYLo, X
	LDA #$78
	STA ObjectXLo, X
	BNE AreaInitialization_SetEnemyData

AreaInitialization_NonRocketCarryOver:
	PHA
	STX ObjectBeingCarriedIndex
	JSR EnemyInit_Basic

	LDA #$01
	STA ObjectBeingCarriedTimer, X
	STA HoldingItem
	JSR CarryObject

	PLA
	CMP #Enemy_Key
	BNE AreaInitialization_SetEnemyData

AreaInitialization_KeyCarryOver:
	INC EnemyVariable, X
	DEX
	STX byte_RAM_12
	LDA #EnemyState_Alive
	STA EnemyState, X
	LDA #Enemy_Phanto
	STA ObjectType, X
	JSR EnemyInit_Basic

	LDA #$00
	STA PhantoActivateTimer
	LDA ScreenYLo
	STA ObjectYLo, X
	LDA ScreenYHi
	STA ObjectYHi, X
	LDA ScreenBoundaryLeftLo
	STA ObjectXLo, X
	LDA ScreenBoundaryLeftHi
	STA ObjectXHi, X
	JSR UnlinkEnemyFromRawData

AreaInitialization_SetEnemyData:
	LDA #<RawEnemyDataAddr
	STA RawEnemyData
	LDA #>RawEnemyDataAddr
	STA RawEnemyData + 1
	LDA IsHorizontalLevel
	BNE AreaInitialization_HorizontalArea

;
; Loads area enemies based on the vertical screen scroll
;
AreaInitialization_VerticalArea:
	LDA #$14
	STA byte_RAM_9
	LDA ScreenYLo
	SBC #$30
	AND #$F0
	STA byte_RAM_5
	LDA ScreenYHi
	SBC #$00
	STA byte_RAM_6

AreaInitialization_VerticalArea_Loop:
	LDA byte_RAM_6
	CMP #$0B
	BCS AreaInitialization_VerticalArea_Next

	JSR CheckObjectVerticalSpawnBoundaries_InitializePage
	JSR CheckObjectVerticalSpawnBoundaries_InitializePage

AreaInitialization_VerticalArea_Next:
	JSR IncrementSpawnBoundaryTile

	DEC byte_RAM_9
	BPL AreaInitialization_VerticalArea_Loop

	RTS

; End of function AreaMainRoutine

;
; Increments the spawn boundary by one tile, incrementing the page if necessary
;
IncrementSpawnBoundaryTile:
	LDA byte_RAM_5
	CLC
	ADC #$10
	STA byte_RAM_5
	BCC IncrementSpawnBoundaryTile_Exit

	INC byte_RAM_6

IncrementSpawnBoundaryTile_Exit:
	RTS


;
; Loads area enemies based on the horizontal screen scroll
;
AreaInitialization_HorizontalArea:
	; Start 3 tiles to the left of the screen boundary
	LDA ScreenBoundaryLeftLo
	SBC #$30
	AND #$F0
	STA byte_RAM_5
	LDA ScreenBoundaryLeftHi
	SBC #$00
	STA byte_RAM_6

	; Check a screen and a half screen's worth of objects
	LDA #$17
	STA byte_RAM_9
AreaInitialization_HorizontalArea_Loop:
	LDA byte_RAM_6
	CMP #$0B
	BCS AreaInitialization_HorizontalArea_Next

	JSR CheckObjectHorizontalSpawnBoundaries_InitializePage
	JSR CheckObjectHorizontalSpawnBoundaries_InitializePage

AreaInitialization_HorizontalArea_Next:
	JSR IncrementSpawnBoundaryTile

	DEC byte_RAM_9
	BPL AreaInitialization_HorizontalArea_Loop

	RTS

;
; Main routine handles
;
; 1. Check object spawn boundaries
; 2. Stopwatch
; 3. Calculate right screen boundary
; 4. Run enemy logic
;
AreaMainRoutine_Gameplay:
	JSR CheckObjectSpawnBoundaries

IFDEF RESET_CHR_LATCH
	JSR CheckResetCHRLatch
ENDIF

	LDA StopwatchTimer
	BEQ AreaMainRoutine_CalculateScreenBoundaryRight

	; Handle the stopwatch
	LDA byte_RAM_10
	AND #$1F
	BNE AreaMainRoutine_DecrementStopwatch

	LDY #SoundEffect1_StopwatchTick
	STY SoundEffectQueue1

AreaMainRoutine_DecrementStopwatch:
	LSR A
	BCC AreaMainRoutine_CalculateScreenBoundaryRight

	DEC StopwatchTimer

	; Calculate the screen boundary on the right
AreaMainRoutine_CalculateScreenBoundaryRight:
	LDA ScreenBoundaryLeftLo
	CLC
	ADC #$FF
	STA ScreenBoundaryRightLo
	LDA ScreenBoundaryLeftHi
	ADC #$00
	STA ScreenBoundaryRightHi

	; Loop through objects and
	LDX #$08
AreaMainRoutine_ObjectLoop:
	STX byte_RAM_12

	; Determine the DMA offset for the sprite, starting with the enemy ID offset
	; by the sprite flicker slot.
	TXA
	CLC
	ADC SpriteFlickerSlot
	TAY
	LDA SpriteFlickerDMAOffset, Y

	; If the object is being carried, it gets slot $10
	LDY ObjectBeingCarriedTimer, X
	BEQ AreaMainRoutine_SetObjectDMAOffset

	LDA #$10

	; Unless it's the rocket, in which case it takes slot $00
	LDY ObjectType, X
	CMP #Enemy_Rocket
	BNE AreaMainRoutine_SetObjectDMAOffset

	LDA #$00

AreaMainRoutine_SetObjectDMAOffset:
	STA byte_RAM_F4 ; Store object DMA offset

	; Is it dead?
	LDA EnemyState, X
	CMP #EnemyState_Dead
	BCS AreaMainRoutine_DecrementObjectTimer1

	; Is it affected by the stopwatch?
	LDA ObjectType, X
	CMP #Enemy_VegetableSmall
	BCS AreaMainRoutine_DecrementObjectTimer1

	; If the stopwatch is running, freeze object timers 1 and 2.
	LDA StopwatchTimer
	BNE AreaMainRoutine_DecrementObjectFlashTimer

	; General-purpose time-based behavior
AreaMainRoutine_DecrementObjectTimer1:
	LDA ObjectTimer1, X
	BEQ AreaMainRoutine_DecrementObjectTimer2

	DEC ObjectTimer1, X

AreaMainRoutine_DecrementObjectTimer2:
	LDA ObjectTimer2, X
	BEQ AreaMainRoutine_DecrementObjectFlashTimer

	DEC ObjectTimer2, X

	; Flashing palette
AreaMainRoutine_DecrementObjectFlashTimer:
	LDA ObjectFlashTimer, X
	BEQ AreaMainRoutine_DecrementObjectStunTimer

	DEC ObjectFlashTimer, X

	; Enemy stun timer
AreaMainRoutine_DecrementObjectStunTimer:
	LDA ObjectStunTimer, X
	BEQ AreaMainRoutine_ObjectBehavior

	LDA byte_RAM_10
	LSR A
	BCC AreaMainRoutine_ObjectBehavior

	DEC ObjectStunTimer, X

	; Tick PRNG, update the temprary screen position, and run the object behavior
AreaMainRoutine_ObjectBehavior:
	JSR TickPseudoRNG

	JSR SetSpriteTempScreenPosition

	JSR HandleEnemyState

	; Next object (previous index), if there is one
	LDX byte_RAM_12
	DEX
	BPL AreaMainRoutine_ObjectLoop

	; Done with the regular objects! Is there an active swarm currently?
	LDA SwarmType
	BEQ HandleEnemyState_Inactive

InitializeSwarm:
	SEC
	SBC #((EnemyInitializationTable_End - EnemyInitializationTable) / 2)

InitializeSwarmRelative:
	JSR JumpToTableAfterJump


GeneratorInitializationTable:
	.dw Swarm_AlbatossCarryingBobOmb
	.dw Swarm_BeezoDiving
	.dw Swarm_Stop
	.dw Generator_VegetableThrower
GeneratorInitializationTable_End:


Swarm_Stop:
	LDA #$00
	STA SwarmType

HandleEnemyState_Inactive:
	RTS


;
; The pseudo-random number generator uses four bytes to generate values.
; It runs once for each object slot.
;
TickPseudoRNG:
DoPRNGBullshitProbably:
	LDY #$00
	JSR TickPseudoRNG_Inner

	INY

TickPseudoRNG_Inner:
	LDA PseudoRNGSeed
	ASL A
	ASL A
	SEC
	ADC PseudoRNGSeed
	STA PseudoRNGSeed

	ASL PseudoRNGSeed + 1
	LDA #$20
	BIT PseudoRNGSeed + 1

	; Bit 7 of `PseudoRNGSeed + 1` before the shift determines whether the next
	; branch checks for `== $20` or `!= $20`
	BCC TickPseudoRNG_Reversed

	; Increment first for `!= $20`
	BEQ TickPseudoRNG_EOR
	BNE TickPseudoRNG_IncEOR

	; Increment first for `== $20`
TickPseudoRNG_Reversed:
	BNE TickPseudoRNG_EOR

TickPseudoRNG_IncEOR:
	INC PseudoRNGSeed + 1
TickPseudoRNG_EOR:
	LDA PseudoRNGSeed + 1
	EOR PseudoRNGSeed
	STA PseudoRNGValue, Y

	RTS


HandleEnemyState:
	LDA EnemyState, X
	JSR JumpToTableAfterJump

	.dw HandleEnemyState_Inactive ; 0 (not active)
	.dw HandleEnemyState_Alive ; Alive
	.dw HandleEnemyState_Dead ; Dead
	.dw HandleEnemyState_BlockFizzle ; Block fizzle
	.dw HandleEnemyState_BombExploding ; Bomb exploding
	.dw HandleEnemyState_PuffOfSmoke ; Puff of smoke
	.dw HandleEnemyState_Sand ; Sand after digging
	.dw HandleEnemyState_Sinking ; Sinking in quicksand


; Offset from left boundary of screen\
SpawnBoundaryOffsets:
	.db $18 ; rightward (lo)
	.db $E0 ; leftward (lo)
	.db $01 ; rightward (hi)
	.db $FF ; leftward (hi)


CheckObjectSpawnBoundaries:
	LDA BossBeaten
	BNE CheckObjectSpawnBoundaries_Exit

	LDA IsHorizontalLevel
	JSR JumpToTableAfterJump

	.dw CheckObjectVerticalSpawnBoundaries
	.dw CheckObjectHorizontalSpawnBoundaries


CheckObjectHorizontalSpawnBoundaries:
	LDY PlayerMovementDirection
	; Low offset (pixel)
	LDA ScreenBoundaryLeftLo
	CLC
	ADC SpawnBoundaryOffsets - 1, Y
	AND #$F0
	STA byte_RAM_5
	; High offset (page)
	LDA ScreenBoundaryLeftHi
	ADC SpawnBoundaryOffsets + 1, Y
	STA byte_RAM_6
	CMP #$0A
	BCS CheckObjectSpawnBoundaries_Exit


CheckObjectHorizontalSpawnBoundaries_InitializePage:
	LDA InSubspaceOrJar
	CMP #$02
	BEQ CheckObjectSpawnBoundaries_Exit

	; Initialize the enemy data page offset
	LDX #$00
	STX byte_RAM_0
CheckObjectHorizontalSpawnBoundaries_InitializePage_Loop:
	; Stop looping and start checking the individual enemies on the current page
	CPX byte_RAM_6
	BEQ CheckObjectHorizontalSpawnBoundaries_InitializePage_Next

	; Advance to the next page of enemy data
	LDA byte_RAM_0
	TAY
	CLC
	ADC (RawEnemyData), Y
	STA byte_RAM_0
	INX
	JMP CheckObjectHorizontalSpawnBoundaries_InitializePage_Loop


CheckObjectHorizontalSpawnBoundaries_InitializePage_Next:
	; We're on the page, now start counting bytes of enemy data
	LDY byte_RAM_0
	LDA (RawEnemyData), Y
	STA byte_RAM_1
	LDX #$FF
	DEY

CheckObjectHorizontalSpawnBoundaries_InitializePage_NextObject:
	INY
	INY
	INX
	INX
	CPX byte_RAM_1
	BCC CheckObjectHorizontalSpawnBoundaries_InitializePage_InitializeObject

	LDX byte_RAM_12

CheckObjectSpawnBoundaries_Exit:
	RTS


CheckObjectHorizontalSpawnBoundaries_InitializePage_InitializeObject:
	; If bit 7 of the enemy type is set, it's already active and we should not re-initialize
	LDA (RawEnemyData), Y
	BMI CheckObjectHorizontalSpawnBoundaries_InitializePage_NextObject

	; Load the x-position of the object
	INY
	LDA (RawEnemyData), Y
	DEY
	AND #$F0
	CMP byte_RAM_5
	BNE CheckObjectHorizontalSpawnBoundaries_InitializePage_NextObject

	; Check if it's a generator/swarm object (end of enemy init table < enemy type > boss types)
	LDA (RawEnemyData), Y
	CMP #Enemy_BossBirdo
	BCS CheckObjectHorizontalSpawnBoundaries_InitializePage_RegularObject
	CMP #((EnemyInitializationTable_End - EnemyInitializationTable) / 2)
	BCC CheckObjectHorizontalSpawnBoundaries_InitializePage_RegularObject

	STA SwarmType
	RTS


CheckObjectHorizontalSpawnBoundaries_InitializePage_RegularObject:
	; Look for an enmpy slot for the object
	LDX #$04
CheckObjectHorizontalSpawnBoundaries_InitializePage_RegularObject_Loop:
	LDA EnemyState, X
	BEQ CheckObjectHorizontalSpawnBoundaries_InitializePage_CreateObject

	DEX
	BPL CheckObjectHorizontalSpawnBoundaries_InitializePage_RegularObject_Loop

	RTS

CheckObjectHorizontalSpawnBoundaries_InitializePage_CreateObject:
	; Store the object slot used
	STX byte_RAM_12

	; Set the x-position of the object (we already looked it up)
	LDA byte_RAM_5
	STA ObjectXLo, X
	LDA byte_RAM_6
	STA ObjectXHi, X

	; Set the y-position of the object (fetch from the enemy data)
	INY
	LDA (RawEnemyData), Y
	DEY
	ASL A
	ASL A
	ASL A
	ASL A
	STA ObjectYLo, X
	LDA #$00
	STA ObjectYHi, X

	JMP CheckObjectSpawnBoundaries_InitializePage_PreInitObject


CheckObjectVerticalSpawnBoundaries:
	LDA byte_RAM_10
	AND #$01
	TAY
	INY
	LDA NeedsScroll
	BEQ loc_BANK2_82FC

	AND #$03
	EOR #$03
	TAY

loc_BANK2_82FC:
	LDA ScreenYLo
	CLC
	ADC SpawnBoundaryOffsets - 1, Y
	AND #$F0
	STA byte_RAM_5
	LDA ScreenYHi
	ADC SpawnBoundaryOffsets + 1, Y
	STA byte_RAM_6
	CMP #$0A
	BCS CheckObjectSpawnBoundaries_Exit

CheckObjectVerticalSpawnBoundaries_InitializePage:
	LDX #$00
	STX byte_RAM_0
CheckObjectVerticalSpawnBoundaries_InitializePage_Loop:
	; Stop looping and start checking the individual enemies on the current page
	CPX byte_RAM_6
	BEQ CheckObjectVerticalSpawnBoundaries_InitializePage_Next

	; Advance to the next page of enemy data
	LDA byte_RAM_0
	TAY
	CLC
	ADC (RawEnemyData), Y
	STA byte_RAM_0
	INX
	JMP CheckObjectVerticalSpawnBoundaries_InitializePage_Loop


CheckObjectVerticalSpawnBoundaries_InitializePage_Next:
	; We're on the page, now start counting bytes of enemy data
	LDY byte_RAM_0
	LDA (RawEnemyData), Y
	STA byte_RAM_1
	LDX #$FF
	DEY

CheckObjectVerticalSpawnBoundaries_InitializePage_NextObject:
	INY
	INY
	INX
	INX
	CPX byte_RAM_1
	BCC CheckObjectVerticalSpawnBoundaries_InitializePage_InitializeObject

	LDX byte_RAM_12

CheckObjectVerticalSpawnBoundaries_Exit:
	RTS


CheckObjectVerticalSpawnBoundaries_InitializePage_InitializeObject:
	; If bit 7 of the enemy type is set, it's already active and we should not re-initialize
	LDA (RawEnemyData), Y
	BMI CheckObjectVerticalSpawnBoundaries_InitializePage_NextObject

	; Load the y-position of the object
	INY
	LDA (RawEnemyData), Y
	DEY
	ASL A
	ASL A
	ASL A
	ASL A
	CMP byte_RAM_5
	BNE CheckObjectVerticalSpawnBoundaries_InitializePage_NextObject

	; Check if it's a generator/swarm object (end of enemy init table < enemy type > boss types)
	LDA (RawEnemyData), Y
	CMP #Enemy_BossBirdo
	BCS CheckObjectVerticalSpawnBoundaries_InitializePage_RegularObject
	CMP #((EnemyInitializationTable_End - EnemyInitializationTable) / 2)
	BCC CheckObjectVerticalSpawnBoundaries_InitializePage_RegularObject

	STA SwarmType
	RTS


CheckObjectVerticalSpawnBoundaries_InitializePage_RegularObject:
	LDX #$04
CheckObjectVerticalSpawnBoundaries_InitializePage_RegularObject_Loop:
	LDA EnemyState, X
	BEQ CheckObjectVerticalSpawnBoundaries_InitializePage_CreateObject

	DEX
	BPL CheckObjectVerticalSpawnBoundaries_InitializePage_RegularObject_Loop

	RTS


CheckObjectVerticalSpawnBoundaries_InitializePage_CreateObject:
	; Store the object slot used
	STX byte_RAM_12

	; Set the y-position of the object (we already looked it up)
	LDA byte_RAM_5
	STA ObjectYLo, X
	LDA byte_RAM_6
	STA ObjectYHi, X

	; Set the x-position of the object (fetch from the enemy data)
	INY
	LDA (RawEnemyData), Y
	DEY
	AND #$F0
	STA ObjectXLo, X
	LDA #$00
	STA ObjectXHi, X

CheckObjectSpawnBoundaries_InitializePage_PreInitObject:
	; Reset the flag to spawn a door
	STA EnemyArray_SpawnsDoor, X
	; Stash the enemy data offset
	STY byte_RAM_C

	; Face the player (horizontal levels only)
	LDA (RawEnemyData), Y
	AND #%00111111
	CMP #Enemy_VegetableSmall
	BCS CheckObjectSpawnBoundaries_InitializePage_MarkEnemyData

	LDA IsHorizontalLevel
	BEQ CheckObjectSpawnBoundaries_InitializePage_MarkEnemyData

	JSR EnemyFindWhichSidePlayerIsOn

	LDA byte_RAM_F
	ADC #$18
	CMP #$30
	BCC CheckObjectVerticalSpawnBoundaries_Exit

CheckObjectSpawnBoundaries_InitializePage_MarkEnemyData:
	; enable bit 7 of the raw enemy data to indicate that the enemy has spawned
	LDY byte_RAM_C
	LDA (RawEnemyData), Y
	ORA #%10000000
	STA (RawEnemyData), Y

	; Is this a boss type?
	CMP #%10000000 | Enemy_BossBirdo
	AND #%01111111
	BCC CheckObjectSpawnBoundaries_InitializePage_SetObjectType

	; Enable the flag to spawn a door for boss types
	AND #%00111111
	STA EnemyArray_SpawnsDoor, X

CheckObjectSpawnBoundaries_InitializePage_SetObjectType:
	STA ObjectType, X
	TYA
	STA EnemyRawDataOffset, X
	INC EnemyState, X
	LDA ObjectType, X

InitializeEnemy:
	JSR JumpToTableAfterJump

EnemyInitializationTable:
	.dw EnemyInit_Basic ; Heart
	.dw EnemyInit_Basic ; ShyguyRed
	.dw EnemyInit_Basic ; Tweeter
	.dw EnemyInit_Basic ; ShyguyPink
	.dw EnemyInit_Basic ; Porcupo
	.dw EnemyInit_Basic ; SnifitRed
	.dw EnemyInit_Stationary ; SnifitGray
	.dw EnemyInit_Basic ; SnifitPink
	.dw EnemyInit_Basic ; Ostro
	.dw EnemyInit_Bobomb ; BobOmb
	.dw EnemyInit_Basic ; AlbatossCarryingBobOmb
	.dw EnemyInit_AlbatossStartRight ; AlbatossStartRight
	.dw EnemyInit_AlbatossStartLeft ; AlbatossStartLeft
	.dw EnemyInit_Basic ; NinjiRunning
	.dw EnemyInit_Stationary ; NinjiJumping
	.dw EnemyInit_BeezoDiving ; BeezoDiving
	.dw EnemyInit_Basic ; BeezoStraight
	.dw EnemyInit_Basic ; WartBubble
	.dw EnemyInit_Basic ; Pidgit
	.dw EnemyInit_Trouter ; Trouter
	.dw EnemyInit_Basic ; Hoopstar
	.dw EnemyInit_JarGenerators ; JarGeneratorShyguy
	.dw EnemyInit_JarGenerators ; JarGeneratorBobOmb
	.dw EnemyInit_Phanto ; Phanto
	.dw EnemyInit_Cobrats ; CobratJar
	.dw EnemyInit_Cobrats ; CobratSand
	.dw EnemyInit_Pokey ; Pokey
	.dw EnemyInit_Basic ; Bullet
	.dw EnemyInit_Birdo ; Birdo
	.dw EnemyInit_Mouser ; Mouser
	.dw EnemyInit_Basic ; Egg
	.dw EnemyInit_Tryclyde ; Tryclyde
	.dw EnemyInit_Basic ; Fireball
	.dw EnemyInit_Clawgrip ; Clawgrip
	.dw EnemyInit_Basic ; ClawgripRock
	.dw EnemyInit_Stationary ; PanserStationaryFiresAngled
	.dw EnemyInit_Basic ; PanserWalking
	.dw EnemyInit_Stationary ; PanserStationaryFiresUp
	.dw EnemyInit_Basic ; Autobomb
	.dw EnemyInit_Basic ; AutobombFire
	.dw EnemyInit_WhaleSpout ; WhaleSpout
	.dw EnemyInit_Basic ; Flurry
	.dw EnemyInit_Fryguy ; Fryguy
	.dw EnemyInit_Fryguy ; FryguySplit
	.dw EnemyInit_Wart ; Wart
	.dw EnemyInit_HawkmouthBoss ; HawkmouthBoss
	.dw EnemyInit_Sparks ; Spark1
	.dw EnemyInit_Sparks ; Spark2
	.dw EnemyInit_Sparks ; Spark3
	.dw EnemyInit_Sparks ; Spark4
	.dw EnemyInit_Basic ; VegetableSmall
	.dw EnemyInit_Basic ; VegetableLarge
	.dw EnemyInit_Basic ; VegetableWart
	.dw EnemyInit_Basic ; Shell
	.dw EnemyInit_Basic ; Coin
	.dw EnemyInit_Basic ; Bomb
	.dw EnemyInit_Basic ; Rocket
	.dw EnemyInit_Basic ; MushroomBlock
	.dw EnemyInit_Basic ; POWBlock
	.dw EnemyInit_FallingLogs ; FallingLogs
	.dw EnemyInit_Basic ; SubspaceDoor
	.dw EnemyInit_Key ; Key
	.dw EnemyInit_Basic ; SubspacePotion
	.dw EnemyInit_Stationary ; Mushroom
	.dw EnemyInit_Stationary ; Mushroom1up
	.dw EnemyInit_Basic ; FlyingCarpet
	.dw EnemyInit_Hawkmouth ; HawkmouthRight
	.dw EnemyInit_Hawkmouth ; HawkmouthLeft
	.dw EnemyInit_CrystalBallStarmanStopwatch ; CrystalBall
	.dw EnemyInit_CrystalBallStarmanStopwatch ; Starman
	.dw EnemyInit_CrystalBallStarmanStopwatch ; Stopwatch
EnemyInitializationTable_End:


;
; Sets enemy attributes to the default for the object type
;
; Input
;   X = enemy index
;
SetEnemyAttributes:
	LDY ObjectType, X
	LDA ObjectAttributeTable, Y
	AND #$7F
	STA ObjectAttributes, X
	LDA EnemyArray_46E_Data, Y
	STA EnemyArray_46E, X
	LDA ObjectHitbox_Data, Y
	STA ObjectHitbox, X
	LDA EnemyArray_492_Data, Y
	STA EnemyArray_492, X
	RTS


;
; Enemy initialization with a timer reset
;
EnemyInit_Basic:
	LDA #$00
	STA ObjectTimer1, X

;
; Enemy initialization without an explicit timer reset
;
; Most things are set to $00
;
EnemyInit_BasicWithoutTimer:
	LDA #$00
	STA EnemyVariable, X
	LDA #$00 ; You do realize you already LDA #$00, right???
	STA EnemyArray_B1, X
	STA ObjectProjectileTimer, X
	STA ObjectBeingCarriedTimer, X
	STA ObjectAnimationTimer, X
	STA ObjectShakeTimer, X
	STA EnemyCollision, X
	STA ObjectStunTimer, X
	STA ObjectTimer2, X
	STA ObjectXAcceleration, X
	STA ObjectYAcceleration, X
	STA ObjectFlashTimer, X
	STA EnemyArray_477, X
	STA EnemyArray_480, X
	STA EnemyHP, X
	STA ObjectYVelocity, X

EnemyInit_BasicAttributes:
	JSR SetEnemyAttributes

; Initialize enemy movement in direction of player
EnemyInit_BasicMovementTowardPlayer:
	JSR EnemyFindWhichSidePlayerIsOn

; Initialize enemy movement
; Y = 1 (move to the left)
; Y = 0 (move to the right)
EnemyInit_BasicMovement:
	INY ; uses using index 1 or 2 of EnemyInitialAccelerationTable
	STY EnemyMovementDirection, X
	LDA EnemyInitialAccelerationTable, Y
	STA ObjectXVelocity, X

	; Double the speed of objects when bit 6 of 46E is set
	LDA EnemyArray_46E, X
	AND #%01000000
	BEQ EnemyInit_BasicMovementExit
	ASL ObjectXVelocity, X ; Change the speed of certain objects?

EnemyInit_BasicMovementExit:
	RTS


BeezoXOffsetTable:
	.db $FE ; If player moving right
	.db $00 ; If moving left

BeezoDiveSpeedTable:
	.db $12, $16, $1A, $1E, $22, $26, $2A, $2D
	.db $30, $32, $34, $37, $39, $3B, $3D, $3E

EnemyInit_BeezoDiving:
	JSR EnemyInit_Basic

	LDY PlayerMovementDirection ; $02 = left, $01 = right
	LDA ScreenBoundaryLeftLo
	ADC BeezoXOffsetTable - 1, Y
	STA ObjectXLo, X ; Spawn in front of the player to dive at them
	LDA ScreenBoundaryLeftHi
	ADC #$00
	STA ObjectXHi, X

; =============== S U B R O U T I N E =======================================

EnemyBeezoDiveSetup:
	LDA PlayerYHi
	BPL loc_BANK2_84D5

	; If above the screen, just abort and use the least descend-y one
	LDY #$00
	BEQ loc_BANK2_84DF

loc_BANK2_84D5:
	LDA PlayerYLo ; Check how far down on the screen the player is
	SEC
	SBC ScreenYLo
	LSR A ; And then take only the highest 4 bits
	LSR A ; (divide by 16)
	LSR A
	LSR A
	TAY

loc_BANK2_84DF:
	LDA BeezoDiveSpeedTable, Y
	STA ObjectYVelocity, X
	RTS

; End of function EnemyBeezoDiveSetup

; ---------------------------------------------------------------------------

EnemyInit_Phanto:
	JSR EnemyInit_Basic

	LDA #$0C
	STA ObjectXVelocity, X
	LDA #$A0
	STA PhantoActivateTimer
	RTS

; =============== S U B R O U T I N E =======================================

EnemyInit_Bobomb:
	JSR EnemyInit_Basic

	LDA #$FF
	STA ObjectTimer1, X
	RTS

; End of function EnemyInit_Bobomb

; ---------------------------------------------------------------------------

HandleEnemyState_Dead:
	JSR CheckObjectCollision ; collision detection

	JSR sub_BANK2_88E8

	LDA EnemyState, X
	BNE MakeEnemyFlipUpsideDown

	LDA EnemyArray_SpawnsDoor, X
	BEQ EnemyDeathMaybe

loc_BANK2_8509:
	STA BossBeaten
	JSR DestroyOnscreenEnemies

	JSR Swarm_Stop

	LDA #Music2_BossClearFanfare
	STA MusicQueue2
	LDA EndOfLevelDoorPage, X
	STA ObjectXHi, X
	LDA #$80
	STA ObjectXLo, X
	ASL A
	STA ObjectYHi, X
	LDA #$B0
	LDY ObjectType, X
	CPY #Enemy_Clawgrip
	BNE loc_BANK2_852D

	LDA #$70

loc_BANK2_852D:
	STA ObjectYLo, X
	LDA #%01000001
	STA ObjectAttributes, X
	STA EnemyArray_46E, X
	JMP TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------

EnemyDeathMaybe:
	LDA ObjectType, X
	CMP #Enemy_Bullet ; "Stray bullet" enemy type
	BEQ MakeEnemyFlipUpsideDown

	INC EnemiesKilledForHeart
	LDY EnemiesKilledForHeart
	CPY #$08 ; number of enemies to kill before a heart appears
	BCC MakeEnemyFlipUpsideDown

	LDA #$00 ; reset enemy kill counter for heart counter
	STA EnemiesKilledForHeart

	LDA #EnemyState_Alive ; convert dead enemy to living heart
	STA EnemyState, X
	STA ObjectAttributes, X
	LDA #%00000111 ; what's this magic number for?
	STA EnemyArray_46E, X
	LDA #Enemy_Heart
	STA ObjectType, X
	LDA ObjectYLo, X
	SBC #$60 ; subtract this amount from the y position where the enemy despawned
	STA ObjectYLo, X
	LDA ObjectYHi, X
	SBC #$00
	STA ObjectYHi, X


;
; Spawned enemies are linked to an offset in the raw enemy data, which prevents
; from being respawned until they are killed or moved offscreen.
;
; This subroutine ensures that the enemy in a particular slot is not linked to
; the raw enemy data
;s
; Input
;   X = enemy slot
;
UnlinkEnemyFromRawData:
	LDA #$FF
	STA EnemyRawDataOffset, X
	RTS


MakeEnemyFlipUpsideDown:
	ASL ObjectAttributes, X ; Shift left...
	SEC ; Set carry...
	ROR ObjectAttributes, X ; Shift right. Effectively sets $80 bit

RenderSpriteAndApplyObjectMovement:
	JSR RenderSprite


;
; Applies object physics
;
; Input
;   X = enemy index
;
ApplyObjectMovement:
	; disable horiziontal physics while shaking
	LDA ObjectShakeTimer, X
	BNE ApplyObjectMovement_Vertical

	JSR ApplyObjectPhysicsX

ApplyObjectMovement_Vertical:
	JSR ApplyObjectPhysicsY

	LDA ObjectYVelocity, X
	BMI ApplyObjectMovement_Gravity

	; Check terminal velocity
	CMP #$3E
	BCS ApplyObjectMovement_Exit

ApplyObjectMovement_Gravity:
	INC ObjectYVelocity, X
	INC ObjectYVelocity, X

ApplyObjectMovement_Exit:
	RTS


HandleEnemyState_BlockFizzle:
	JSR sub_BANK2_88E8

	LDA ObjectTimer1, X
	BEQ loc_BANK2_85AF

	TAY
	LSR A
	LSR A
	AND #$01
	STA EnemyMovementDirection, X
	LDA #%00000001
	STA ObjectAttributes, X
	STA EnemyArray_46E, X
	LDA #$3C
	CPY #$0C
	BCC loc_BANK2_85AC

	LDA #$3E

loc_BANK2_85AC:
	JMP RenderSprite_DrawObject

; ---------------------------------------------------------------------------

loc_BANK2_85AF:
	JMP EnemyDestroy


HandleEnemyState_Sinking:
	; Collision detection
	JSR sub_BANK2_88E8

	JSR EnemyBehavior_CheckDamagedInterrupt

	LDA ObjectBeingCarriedTimer, X
	BEQ loc_BANK2_85C1

	LDA #EnemyState_Alive
	STA EnemyState, X
	RTS


loc_BANK2_85C1:
	LDA ObjectTimer1, X
	BEQ loc_BANK2_85AF

	LDA ObjectType, X
	CMP #Enemy_VegetableSmall
	BCS loc_BANK2_85E1

	JSR IncrementAnimationTimerBy2

	LDA byte_RAM_10
	AND #$03
	STA ObjectShakeTimer, X
	LDA byte_RAM_10
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	ADC #$01
	STA EnemyMovementDirection, X

loc_BANK2_85E1:
	JSR sub_BANK2_9486

	JMP CheckObjectCollision


ExplosionTileXOffsets:
	.db $F8
	.db $00
	.db $F8
	.db $00
	.db $08
	.db $10
	.db $08
	.db $10

ExplosionTileYOffsets:
	.db $F8
	.db $F8

EnemyInitialAccelerationTable:
	; these values are shared with ExplosionTileYOffsets!
	.db $08
	.db $08
	.db $F8
	.db $F8
	.db $08
	.db $08


HandleEnemyState_BombExploding:
	JSR sub_BANK2_88E8

	LDA byte_RAM_EE
	ORA byte_RAM_EF
	BNE loc_BANK2_85AF

	LDA ObjectTimer1, X
	BEQ loc_BANK2_85AF

	CMP #$1A
	BCS loc_BANK2_8610

	SBC #$11
	BMI loc_BANK2_8610

	TAY
	JSR sub_BANK2_8670

loc_BANK2_8610:
	LDA #$60
	STA byte_RAM_0
	LDX #$00
	LDY #$40

loc_BANK2_8618:
	LDA SpriteTempScreenY
	CLC
	ADC ExplosionTileYOffsets, X
	STA SpriteDMAArea, Y
	LDA SpriteTempScreenX
	CLC
	ADC ExplosionTileXOffsets, X
	STA SpriteDMAArea + 3, Y
	LDA #$01
	STA SpriteDMAArea + 2, Y
	LDA byte_RAM_0
	STA SpriteDMAArea + 1, Y
	CLC
	ADC #$02
	STA byte_RAM_0
	INY
	INY
	INY
	INY
	INX
	CPX #$08
	BNE loc_BANK2_8618

	LDX byte_RAM_12
	JMP CheckObjectCollision

; ---------------------------------------------------------------------------

locret_BANK2_8649:
	RTS

; ---------------------------------------------------------------------------
byte_BANK2_864A:
	.db $FB
	.db $08
	.db $15
	.db $FB
	.db $08
	.db $15
	.db $FB
	.db $08
	.db $15

byte_BANK2_8653:
	.db $FF
	.db $00
	.db $00
	.db $FF
	.db $00
	.db $00
	.db $FF
	.db $00
	.db $00

byte_BANK2_865C:
	.db $FC
	.db $FC
	.db $FC
	.db $08
	.db $08
	.db $08
	.db $14
	.db $14
	.db $14

byte_BANK2_8665:
	.db $FF
	.db $FF
	.db $FF
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00

byte_BANK2_866E:
	.db $5F
	.db $06

; =============== S U B R O U T I N E =======================================

sub_BANK2_8670:
	LDA ObjectXLo, X
	CLC
	ADC byte_BANK2_864A, Y
	STA byte_RAM_C
	LDA ObjectXHi, X
	ADC byte_BANK2_8653, Y
	STA byte_RAM_D
	CMP #$B
	BCS locret_BANK2_8649

	LDA ObjectYLo, X
	ADC byte_BANK2_865C, Y
	AND #$F0
	STA byte_RAM_E
	STA byte_RAM_B
	LDA ObjectYHi, X
	ADC byte_BANK2_8665, Y
	STA byte_RAM_F
	CMP #$A
	BCS locret_BANK2_8649

	LDY IsHorizontalLevel
	BNE loc_BANK2_86BD

	LSR A
	ROR byte_RAM_E
	LSR A
	ROR byte_RAM_E
	LSR A
	ROR byte_RAM_E
	LSR A
	ROR byte_RAM_E
	LDA byte_RAM_E

	LDY #$FF
loc_BANK2_86AD:
	SEC
	SBC #$0F
	INY
	BCS loc_BANK2_86AD

	STY byte_RAM_D
	ADC #$0F
	ASL A
	ASL A
	ASL A
	ASL A
	STA byte_RAM_E

loc_BANK2_86BD:
	LDA byte_RAM_C
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_4
	ORA byte_RAM_E
	STA byte_RAM_5
	LDY #$00
	LDA ScreenBoundaryLeftHi
	CMP #$A
	BNE loc_BANK2_86D5

	STY byte_RAM_D
	INY

loc_BANK2_86D5:
	LDA #$10
	STA byte_RAM_7
	LDA byte_BANK2_866E, Y
	STA byte_RAM_8
	LDY byte_RAM_D

loc_BANK2_86E0:
	LDA byte_RAM_7
	CLC
	ADC #$F0
	STA byte_RAM_7
	LDA byte_RAM_8
	ADC #$00
	STA byte_RAM_8
	DEY
	BPL loc_BANK2_86E0

	LDY byte_RAM_5
	LDA (byte_RAM_7), Y
	CMP #$9D
	BEQ loc_BANK2_8701

	CMP #$93
	BEQ loc_BANK2_8701

	CMP #$72
	BEQ loc_BANK2_8701

	RTS

; ---------------------------------------------------------------------------

loc_BANK2_8701:
	LDA #$40
	STA (byte_RAM_7), Y
	LDA byte_RAM_D
	AND #$01
	EOR #$01
	ASL A

loc_BANK2_870C:
	ASL A
	LDY IsHorizontalLevel
	BNE loc_BANK2_8712

	ASL A

loc_BANK2_8712:
	PHA
	LDA byte_RAM_E
	STA byte_RAM_2
	LDA byte_RAM_C
	AND #$F0
	STA byte_RAM_3
	LDA #$08
	STA byte_RAM_0
	LDA byte_RAM_2
	ASL A
	ROL byte_RAM_0
	ASL A
	ROL byte_RAM_0
	AND #$E0
	STA byte_RAM_1
	LDA byte_RAM_3
	LSR A
	LSR A
	LSR A
	ORA byte_RAM_1
	LDX byte_RAM_300
	STA PPUBuffer_301 + 1, X
	CLC
	ADC #$20
	STA PPUBuffer_301 + 6, X
	PLA
	ORA byte_RAM_0
	STA PPUBuffer_301, X
	ADC #$00
	STA PPUBuffer_301 + 5, X

loc_BANK2_874B:
	LDA #$02
	STA PPUBuffer_301 + 2, X
	STA PPUBuffer_301 + 7, X
	LDA #$FA
	STA PPUBuffer_301 + 3, X
	STA PPUBuffer_301 + 4, X
	STA PPUBuffer_301 + 8, X
	STA PPUBuffer_301 + 9, X
	LDA #$00
	STA PPUBuffer_301 + 10, X
	TXA
	CLC
	ADC #$A
	STA byte_RAM_300
	LDX #$08

loc_BANK2_876F:
	LDA EnemyState, X
	BEQ loc_BANK2_8778

	DEX
	BPL loc_BANK2_876F

	BMI loc_BANK2_8795

loc_BANK2_8778:
	LDA byte_RAM_C
	AND #$F0
	STA ObjectXLo, X
	LDA byte_RAM_D
	LDY IsHorizontalLevel
	BNE loc_BANK2_8785

	TYA

loc_BANK2_8785:
	STA ObjectXHi, X
	LDA byte_RAM_B
	STA ObjectYLo, X
	LDA byte_RAM_F
	STA ObjectYHi, X
	JSR EnemyInit_BasicWithoutTimer

	JSR sub_BANK2_98C4

loc_BANK2_8795:
	LDX byte_RAM_12

locret_BANK2_8797:
	RTS

; End of function sub_BANK2_8670


PuffOfSmokeAnimationTable:
	.db $46
	.db $4A
	.db $4E
	.db $52


HandleEnemyState_PuffOfSmoke:
	JSR sub_BANK2_88E8

	LDA ObjectAttributes, X
	ORA #ObjAttrib_Mirrored
	STA ObjectAttributes, X
	LDA ObjectTimer1, X
	BNE loc_BANK2_87AC

	JMP loc_BANK2_8842

; ---------------------------------------------------------------------------

loc_BANK2_87AC:
	LSR A
	LSR A
	LSR A
	TAY
	LDA PuffOfSmokeAnimationTable, Y
	JSR RenderSprite_DrawObject

	LDA EnemyArray_SpawnsDoor, X
	BEQ locret_BANK2_8797

	LDA ObjectTimer1, X
	CMP #$03
	BNE locret_BANK2_8797

	LDY #$22
	LDA ObjectType, X
	CMP #Enemy_Clawgrip
	BNE loc_BANK2_87CA

	; Clawgrip special hack:
	; Move the "Draw the door" PPU command
	; up 8 tile rows ($100) to be on the platform
	DEY

loc_BANK2_87CA:
	STY PPUBuffer_EndOfLevelDoor
	STY PPUBuffer_EndOfLevelDoor + $07
	INY
	STY PPUBuffer_EndOfLevelDoor + $0E
	STY PPUBuffer_EndOfLevelDoor + $17
	LDY #$03

loc_BANK2_87D9:
	; Boss door PPU updates
	LDA EndOfLevelDoorPage, X
	AND #%00000001
	ASL A
	ASL A
	EOR #%00000100
	LDX IsHorizontalLevel
	BNE loc_BANK2_87E7

	ASL A

loc_BANK2_87E7:
	LDX EndOfLevelDoorRowOffsets, Y
	ORA PPUBuffer_EndOfLevelDoor, X
	STA PPUBuffer_EndOfLevelDoor, X
	LDX byte_RAM_12
	DEY
	BPL loc_BANK2_87D9

	LDA #$14
	STA ScreenUpdateIndex
	LDY EndOfLevelDoorPage, X
	LDA #$5F
	STA byte_RAM_1
	LDA #$10
	STA byte_RAM_0

loc_BANK2_8804:
	LDA byte_RAM_0
	CLC
	ADC #$F0
	STA byte_RAM_0
	LDA byte_RAM_1
	ADC #$00
	STA byte_RAM_1
	DEY
	BPL loc_BANK2_8804

	LDA ObjectType, X
	CMP #Enemy_Clawgrip
	BNE DrawEndOfLevelDoorTiles

	; Clawgrip special hack:
	; Move the "Draw the door" PPU command
	; up 8 tile rows ($100) to be on the platform
	LDA byte_RAM_0
	SEC
	SBC #$40
	STA byte_RAM_0
	LDA byte_RAM_1
	SBC #$00
	STA byte_RAM_1

DrawEndOfLevelDoorTiles:
	LDY #$B8
	LDA #BackgroundTile_LightDoorEndLevel
	STA (byte_RAM_0), Y
	LDY #$C8
	STA (byte_RAM_0), Y
	LDA #BackgroundTile_LightTrailRight
	LDY #$B9
	STA (byte_RAM_0), Y
	LDY #$CA
	STA (byte_RAM_0), Y
	LDA #BackgroundTile_LightTrail
	LDY #$C9
	STA (byte_RAM_0), Y
	RTS

; ---------------------------------------------------------------------------

loc_BANK2_8842:
	LDA ObjectType, X
	CMP #Enemy_FryguySplit
	BNE loc_BANK2_8855

	DEC FryguySplitFlames
	BPL loc_BANK2_8855

	INC EnemyArray_SpawnsDoor, X
	INC ObjectType, X
	JMP loc_BANK2_8509

; ---------------------------------------------------------------------------

loc_BANK2_8855:
	JMP EnemyDestroy

; ---------------------------------------------------------------------------

HandleEnemyState_Sand:
	JSR sub_BANK2_88E8

	LDA #$12
	STA ObjectAttributes, X
	LDA ObjectTimer1, X
	BEQ loc_BANK2_8888

	LDA #$F8
	STA ObjectYVelocity, X
	JSR ApplyObjectPhysicsY

	LDA #$B2
	LDY ObjectTimer1, X
	CPY #$10
	BCS loc_BANK2_8885

	LDA #%10000000
	STA EnemyArray_46E, X
	LDA #$01
	STA ObjectAttributes, X
	ASL A
	STA EnemyMovementDirection, X
	INC ObjectAnimationTimer, X
	JSR IncrementAnimationTimerBy2

	LDA #$B4

loc_BANK2_8885:
	JMP RenderSprite_DrawObject

; ---------------------------------------------------------------------------

loc_BANK2_8888:
	CPX ObjectBeingCarriedIndex
	BNE loc_BANK2_8891

	LDA #$00
	STA HoldingItem

loc_BANK2_8891:
	JMP EnemyDestroy

; =============== S U B R O U T I N E =======================================

sub_BANK2_8894:
	LDA #$00
	STA byte_RAM_EE
	LDA ObjectAttributes, X
	LDY #$01
	AND #ObjAttrib_Horizontal
	BNE loc_BANK2_88B9

	LDA ObjectType, X
	CMP #Enemy_Pokey
	BEQ loc_BANK2_88B9

	CMP #Enemy_Ostro
	BEQ loc_BANK2_88B9

	CMP #Enemy_HawkmouthBoss
	BEQ loc_BANK2_88B9

	CMP #Enemy_Clawgrip
	BEQ loc_BANK2_88B9

	LDA EnemyArray_46E, X
	AND #%00100000
	BEQ loc_BANK2_88BB

loc_BANK2_88B9:
	; something for double-wide sprites?
	LDY #$03

; seems to be logic for positioning sprites onscreen
loc_BANK2_88BB:
	LDA ObjectXLo, X
	CLC
	ADC byte_BANK2_88E4, Y
	STA byte_RAM_E
	LDA ObjectXHi, X
	ADC #$00
	STA byte_RAM_F
	LDA byte_RAM_E
	CMP ScreenBoundaryLeftLo
	LDA byte_RAM_F
	SBC ScreenBoundaryLeftHi
	BEQ loc_BANK2_88DC

	LDA byte_RAM_EE
	ORA byte_BANK2_88E0, Y
	STA byte_RAM_EE

loc_BANK2_88DC:
	DEY
	BPL loc_BANK2_88BB

locret_BANK2_88DF:
	RTS

; End of function sub_BANK2_8894

; ---------------------------------------------------------------------------
; threshold for x-wrapping sprites near the edge of the screen
byte_BANK2_88E0: ; hi
	.db $08
	.db $04
	.db $02
	.db $01
byte_BANK2_88E4: ; lo
	.db $00
	.db $08
	.db $10
	.db $18

; =============== S U B R O U T I N E =======================================

sub_BANK2_88E8:
	JSR sub_BANK2_8894

	LDA #$22
	LDY ObjectType, X
	CPY #Enemy_Wart
	BEQ loc_BANK2_88F9

	CPY #Enemy_Tryclyde
	BEQ loc_BANK2_88F9

	LDA #$10

loc_BANK2_88F9:
	ADC ObjectYLo, X
	STA byte_RAM_0
	LDA ObjectYHi, X
	ADC #$00
	STA byte_RAM_1
	LDA byte_RAM_0
	CMP ScreenYLo
	LDA byte_RAM_1
	SBC ScreenYHi
	STA byte_RAM_EF

	CPY #Enemy_Phanto
	BEQ locret_BANK2_88DF

	CPY #Enemy_FlyingCarpet
	BEQ locret_BANK2_88DF

	CPY #Enemy_HawkmouthLeft
	BEQ locret_BANK2_88DF

	CPY #Enemy_HawkmouthBoss
	BEQ locret_BANK2_88DF

	TXA
	AND #$01
	STA byte_RAM_0
	LDA byte_RAM_10
	AND #$01
	EOR byte_RAM_0
	BNE locret_BANK2_88DF

	LDA ScreenYLo
	SBC #$30
	STA byte_RAM_1
	LDA ScreenYHi
	SBC #$00
	STA byte_RAM_0
	INC byte_RAM_0
	LDA ScreenYLo
	ADC #$FF
	PHP
	ADC #$30
	STA byte_RAM_3
	LDA ScreenYHi
	ADC #$00
	PLP
	ADC #$00
	STA byte_RAM_2
	INC byte_RAM_2
	LDA ObjectYLo, X
	CMP byte_RAM_1
	LDY ObjectYHi, X
	INY
	TYA
	SBC byte_RAM_0
	BMI loc_BANK2_89A5

	LDA ObjectYLo, X
	CMP byte_RAM_3
	LDY ObjectYHi, X
	INY
	TYA
	SBC byte_RAM_2
	BPL loc_BANK2_89A5

	LDA ScreenBoundaryLeftLo
	SBC #$30
	STA byte_RAM_1
	LDA ScreenBoundaryLeftHi
	SBC #$00
	STA byte_RAM_0
	INC byte_RAM_0
	LDA ScreenBoundaryRightLo
	ADC #$30
	STA byte_RAM_3
	LDA ScreenBoundaryRightHi
	ADC #$00
	STA byte_RAM_2
	INC byte_RAM_2
	LDA ObjectXLo, X
	CMP byte_RAM_1
	LDY ObjectXHi, X
	INY
	TYA
	SBC byte_RAM_0
	BMI loc_BANK2_899C

	LDA ObjectXLo, X
	CMP byte_RAM_3
	LDY ObjectXHi, X
	INY
	TYA
	SBC byte_RAM_2
	BMI EnemyDestroy_Exit

loc_BANK2_899C:
	LDY ObjectType, X
	LDA EnemyArray_46E_Data, Y
	AND #$08
	BNE EnemyDestroy_Exit

loc_BANK2_89A5:
	LDA ObjectBeingCarriedTimer, X
	BNE EnemyDestroy_Exit

; End of function sub_BANK2_88E8

; =============== S U B R O U T I N E =======================================

EnemyDestroy:
	; load raw enemy data offset so we can allow the level object to respawn
	LDY EnemyRawDataOffset, X
	; nothing to reset if offset is invalid
	BMI EnemyDestroy_AfterAllowRespawn

	; disabling bit 7 allows the object to respawn
	LDA (RawEnemyData), Y
	AND #$7F
	STA (RawEnemyData), Y

EnemyDestroy_AfterAllowRespawn:
	LDA #EnemyState_Inactive
	STA EnemyState, X

EnemyDestroy_Exit:
	RTS

; End of function EnemyDestroy

; ---------------------------------------------------------------------------

HandleEnemyState_Alive:
	LDA #$01
	STA ObjectNonSticky, X
	LDY ObjectProjectileTimer, X
	DEY
	CPY #$1F
	BCS loc_BANK2_89C9

	INC ObjectProjectileTimer, X

loc_BANK2_89C9:
	JSR sub_BANK2_88E8

	LDA PlayerState
	CMP #PlayerState_ChangingSize
	BEQ loc_BANK2_89E2

	LDA NeedsScroll
	AND #%00000100
	BNE loc_BANK2_8A07

	LDA StopwatchTimer
	BNE loc_BANK2_89E2

	LDA ObjectStunTimer, X
	BEQ loc_BANK2_8A0A

loc_BANK2_89E2:
	LDA ObjectType, X

IFDEF REV_A
	CMP #Enemy_FryguySplit
	BEQ loc_BANK2_8A0A
ENDIF

	CMP #Enemy_Heart
	BEQ loc_BANK2_8A0A

	CMP #Enemy_FlyingCarpet
	BEQ loc_BANK2_89F0

	CMP #Enemy_VegetableSmall
	BCS loc_BANK2_8A0A

loc_BANK2_89F0:
	JSR EnemyBehavior_CheckDamagedInterrupt

	LDA ObjectProjectileTimer, X
	BEQ loc_BANK2_89FB

	JSR ApplyObjectMovement

loc_BANK2_89FB:
	LDA ObjectBeingCarriedTimer, X
	BEQ loc_BANK2_8A04

	DEC ObjectAnimationTimer, X

loc_BANK2_8A01:
	JMP CarryObject

; ---------------------------------------------------------------------------

loc_BANK2_8A04:
	JSR CheckObjectCollision

loc_BANK2_8A07:
	JMP RenderSprite

; ---------------------------------------------------------------------------

loc_BANK2_8A0A:
	LDY #$01
	LDA ObjectXVelocity, X
	BEQ loc_BANK2_8A15

	BPL loc_BANK2_8A13

	INY

loc_BANK2_8A13:
	STY EnemyMovementDirection, X

loc_BANK2_8A15:
	LDY ObjectType, X
	LDA ObjectAttributeTable, Y
	AND #ObjAttrib_Palette0 | ObjAttrib_BehindBackground
	BNE loc_BANK2_8A41

	LDA ObjectAttributes, X
	AND #ObjAttrib_Palette | ObjAttrib_Horizontal | ObjAttrib_FrontFacing | ObjAttrib_Mirrored | ObjAttrib_16x32 | ObjAttrib_UpsideDown
	STA ObjectAttributes, X
	LDA ObjectBeingCarriedTimer, X
	CMP #$02
	BCC loc_BANK2_8A41

	LDA ObjectType, X
	CMP #Enemy_BobOmb
	BNE loc_BANK2_8A36

	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BNE loc_BANK2_8A3B

loc_BANK2_8A36:
	LDA ObjectAttributeTable, Y
	BPL loc_BANK2_8A41

loc_BANK2_8A3B:
	LDA ObjectAttributes, X
	ORA #ObjAttrib_BehindBackground
	STA ObjectAttributes, X

loc_BANK2_8A41:
	JSR RunEnemyBehavior

	LDA ObjectYHi, X
	BMI loc_BANK2_8A50

	LDA SpriteTempScreenY
	CMP #$E8
	BCC loc_BANK2_8A50

	RTS

; ---------------------------------------------------------------------------

loc_BANK2_8A50:
	JMP CheckObjectCollision

; ---------------------------------------------------------------------------

RunEnemyBehavior:
	LDA ObjectType, X
	JSR JumpToTableAfterJump


EnemyBehaviorPointerTable:
	.dw EnemyBehavior_00 ; $00
	.dw EnemyBehavior_BasicWalker ; $01
	.dw EnemyBehavior_BasicWalker ; $02
	.dw EnemyBehavior_BasicWalker ; $03
	.dw EnemyBehavior_BasicWalker ; $04
	.dw EnemyBehavior_BasicWalker ; $05
	.dw EnemyBehavior_BasicWalker ; $06
	.dw EnemyBehavior_BasicWalker ; $07
	.dw EnemyBehavior_Ostro ; $08
	.dw EnemyBehavior_BobOmb ; $09
	.dw EnemyBehavior_Albatoss ; $0A
	.dw EnemyBehavior_Albatoss ; $0B
	.dw EnemyBehavior_Albatoss ; $0C
	.dw EnemyBehavior_NinjiRunning ; $0D
	.dw EnemyBehavior_NinjiJumping ; $0E
	.dw EnemyBehavior_Beezo ; $0F
	.dw EnemyBehavior_Beezo ; $10
	.dw EnemyBehavior_WartBubble ; $11
	.dw EnemyBehavior_Pidgit ; $12
	.dw EnemyBehavior_Trouter ; $13
	.dw EnemyBehavior_Hoopstar ; $14
	.dw EnemyBehavior_JarGenerators ; $15
	.dw EnemyBehavior_JarGenerators ; $16
	.dw EnemyBehavior_Phanto ; $17
	.dw EnemyBehavior_CobratJar ; $18
	.dw EnemyBehavior_CobratGround ; $19
	.dw EnemyBehavior_Pokey ; $1A
	.dw EnemyBehavior_BulletAndEgg ; $1B
	.dw EnemyBehavior_Birdo ; $1C
	.dw EnemyBehavior_Mouser ; $1D
	.dw EnemyBehavior_BulletAndEgg ; $1E
	.dw EnemyBehavior_Tryclyde ; $1F
	.dw EnemyBehavior_Fireball ; $20
	.dw EnemyBehavior_Clawgrip ; $21
	.dw EnemyBehavior_ClawgripRock ; $22
	.dw EnemyBehavior_PanserRedAndGray ; $23
	.dw EnemyBehavior_PanserPink ; $24
	.dw EnemyBehavior_PanserRedAndGray ; $25
	.dw EnemyBehavior_Autobomb ; $26
	.dw EnemyBehavior_AutobombFire ; $27
	.dw EnemyBehavior_WhaleSpout ; $28
	.dw EnemyBehavior_Flurry ; $29
	.dw EnemyBehavior_Fryguy ; $2A
	.dw EnemyBehavior_FryguySplit ; $2B
	.dw EnemyBehavior_Wart ; $2C
	.dw EnemyBehavior_HawkmouthBoss ; $2D
	.dw EnemyBehavior_Spark ; $2E
	.dw EnemyBehavior_Spark ; $2F
	.dw EnemyBehavior_Spark ; $30
	.dw EnemyBehavior_Spark ; $31
	.dw EnemyBehavior_Vegetable ; $32
	.dw EnemyBehavior_Vegetable ; $33
	.dw EnemyBehavior_Vegetable ; $34
	.dw EnemyBehavior_Shell ; $35
	.dw EnemyBehavior_Coin ; $36
	.dw EnemyBehavior_Bomb ; $37
	.dw EnemyBehavior_Rocket ; $38
	.dw EnemyBehavior_MushroomBlockAndPOW ; $39
	.dw EnemyBehavior_MushroomBlockAndPOW ; $3A
	.dw EnemyBehavior_FallingLogs ; $3B
	.dw EnemyBehavior_SubspaceDoor ; $3C
	.dw EnemyBehavior_Key ; $3D
	.dw EnemyBehavior_SubspacePotion ; $3E
	.dw EnemyBehavior_Mushroom ; $3F
	.dw EnemyBehavior_Mushroom1up ; $40
	.dw EnemyBehavior_FlyingCarpet ; $41
	.dw EnemyBehavior_Hawkmouth ; $42
	.dw EnemyBehavior_Hawkmouth ; $43
	.dw EnemyBehavior_CrystalBall ; $44
	.dw EnemyBehavior_Starman ; $45
	.dw EnemyBehavior_Mushroom ; $46
EnemyBehaviorPointerTable_End:


EnemyInit_JarGenerators:
	JSR EnemyInit_Basic

	LDA #$50
	STA ObjectAnimationTimer, X
	RTS


SparkAccelerationTable:
	.db $F0
	.db $E0
	.db $F0
	.db $E0
	.db $10
	.db $20


EnemyInit_Sparks:
	JSR EnemyInit_Basic

	LDY ObjectType, X
	LDA SparkAccelerationTable - Enemy_Spark1, Y
	STA ObjectXVelocity, X
	LDA SparkAccelerationTable - Enemy_Spark1 + 2, Y
	STA ObjectYVelocity, X
	RTS


SparkCollision: ; spark movement based on collision
	.db CollisionFlags_Up | CollisionFlags_Down ; horizontal
	.db CollisionFlags_Left | CollisionFlags_Right ; vertical

SparkTurnOffset:
	.db $00 ; clockwise
	.db $0A ; counter-clockwise


;
; Spark movement works by traveling along one axis at a time and turning when
; either colliding along the movement axis or running out of wall along the
; axis perpendicular to movement.
;
EnemyBehavior_Spark:
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR IncrementAnimationTimerBy2

	JSR RenderSprite

	LDA ObjectXLo, X
	ORA ObjectYLo, X
	AND #$0F
	BNE EnemyBehavior_Spark_Move

	JSR ObjectTileCollision_SolidBackground

	LDY EnemyArray_477, X
	LDA EnemyCollision, X
	AND SparkCollision, Y
	BEQ EnemyBehavior_Spark_Turn

	LDA SparkCollision, Y
	EOR #$0F
	AND EnemyCollision, X
	BEQ EnemyBehavior_Spark_Move

	TYA
	EOR #$01
	STA EnemyArray_477, X
	TAY

;
; Reverses the direction of movement for the specified axis
;
; Input
;   X = enemy slot
;   Y = movement axis
;
EnemyBehavior_Spark_FlipAxisVelocity:
	TXA
	CLC
	ADC SparkTurnOffset, Y
	TAY
	LDA ObjectXVelocity, Y
	EOR #$FF
	ADC #$01
	STA ObjectXVelocity, Y
	RTS


EnemyBehavior_Spark_Turn:
	TYA
	EOR #$01
	STA EnemyArray_477, X
	JSR EnemyBehavior_Spark_FlipAxisVelocity

EnemyBehavior_Spark_Move:
	LDA EnemyArray_477, X
	BNE EnemyBehavior_Spark_MoveVertical

EnemyBehavior_Spark_MoveHorizontal:
	JMP ApplyObjectPhysicsX

EnemyBehavior_Spark_MoveVertical:
	JMP ApplyObjectPhysicsY


IncrementAnimationTimerBy2:
	INC ObjectAnimationTimer, X
	INC ObjectAnimationTimer, X
	RTS


AlbatossSwarmStartXLo:
	.db $F0
	.db $00

AlbatossSwarmStartXHi:
	.db $FF
	.db $01


Swarm_AlbatossCarryingBobOmb:
	JSR Swarm_CreateEnemy

	ADC AlbatossSwarmStartXLo, Y
	STA ObjectXLo, X
	LDA ScreenBoundaryLeftHi
	ADC AlbatossSwarmStartXHi, Y
	STA ObjectXHi, X
	STY byte_RAM_1
	LDA #Enemy_AlbatossCarryingBobOmb
	STA ObjectType, X
	JSR SetEnemyAttributes

	LDA PseudoRNGValue
	AND #$1F
	ADC #$20
	STA ObjectYLo, X
	LDY byte_RAM_1
	JSR EnemyInit_BasicMovement

	ASL ObjectXVelocity, X
	RTS


BeezoSwarmStartXLo:
	.db $00
	.db $FF


Swarm_BeezoDiving:
	JSR Swarm_CreateEnemy

	ADC BeezoSwarmStartXLo, Y
	STA ObjectXLo, X
	LDA IsHorizontalLevel
	BEQ Swarm_BeezoDiving_Vertical

Swarm_BeezoDiving_Horizontal:
	LDA ScreenBoundaryLeftHi
	ADC #$00

Swarm_BeezoDiving_Vertical:
	STA ObjectXHi, X
	LDA ScreenYLo
	STA ObjectYLo, X
	LDA ScreenYHi
	STA ObjectYHi, X
	STY byte_RAM_1
	LDA #Enemy_BeezoDiving
	STA ObjectType, X
	JSR SetEnemyAttributes

	LDY byte_RAM_1
	JSR EnemyInit_BasicMovement

	JSR EnemyBeezoDiveSetup

	RTS


;
; Generates a swarm enemy
;
; Output
;   A = ScreenBoundaryLeftLo
;   X = enemy slot (byte_RAM_0)
;   Y = enemy direction
;
Swarm_CreateEnemy:
	; Pause for the Stopwatch
	LDA StopwatchTimer
	BNE Swarm_CreateEnemy_Fail

	; Generate an enemy when the counter overflows
	LDA SwarmCounter
	CLC
	ADC #$03
	STA SwarmCounter
	BCC Swarm_CreateEnemy_Fail

	; Create the enemy, but bail if it's not possible
	JSR CreateEnemy

	BMI Swarm_CreateEnemy_Fail

	; Pick a direction
	LDY #$00
	LDA byte_RAM_10
	AND #$40
	BNE Swarm_CreateEnemy_Exit

	INY

Swarm_CreateEnemy_Exit:
	LDX byte_RAM_0
	LDA ScreenBoundaryLeftLo
	RTS

Swarm_CreateEnemy_Fail:
	; Break out of the parent swarm subroutine
	PLA
	PLA
	RTS


EnemyBehavior_Fireball:
	JSR ObjectTileCollision

	JSR sub_BANK2_927A

	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR RenderSprite

	LDA EnemyVariable, X
	BNE EnemyBehavior_Fireball_CheckCollision

	JMP ApplyObjectMovement


EnemyBehavior_Fireball_CheckCollision:
	LDA EnemyCollision, X
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ EnemyBehavior_Fireball_Exit

	JSR TurnIntoPuffOfSmoke

EnemyBehavior_Fireball_Exit:
	JMP sub_BANK2_9430


PanserFireXVelocity:
	.db $10
	.db $F0


EnemyBehavior_PanserPink:
	LDA ObjectAnimationTimer, X
	ASL A
	BNE EnemyBehavior_PanserRedAndGray

	JSR EnemyInit_BasicMovementTowardPlayer

EnemyBehavior_PanserRedAndGray:
	JSR ObjectTileCollision

	LDA EnemyCollision, X
	PHA
	AND #CollisionFlags_Down
	BEQ loc_BANK2_8C1A

	JSR ResetObjectYVelocity

loc_BANK2_8C1A:
	PLA
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ loc_BANK2_8C22

	JSR EnemyBehavior_TurnAround

loc_BANK2_8C22:
	JSR ApplyObjectMovement

	LDA #%10000011
	STA EnemyArray_46E, X
	LDA #$02
	STA EnemyMovementDirection, X
	JSR EnemyBehavior_CheckDamagedInterrupt

	INC ObjectAnimationTimer, X
	LDA ObjectAnimationTimer, X
	AND #$2F
	BNE loc_BANK2_8C3D

	LDA #$10
	STA ObjectTimer1, X

loc_BANK2_8C3D:
	LDY ObjectTimer1, X
	BEQ loc_BANK2_8C8E

	CPY #$06
	BNE loc_BANK2_8C7C

	JSR CreateEnemy

	BMI loc_BANK2_8C7C

	LDA ObjectType, X
	PHA
	LDX byte_RAM_0
	LDA PseudoRNGValue
	AND #$0F
	ORA #$BC
	STA ObjectYVelocity, X
	JSR EnemyFindWhichSidePlayerIsOn

	PLA
	CMP #Enemy_PanserStationaryFiresUp
	LDA PanserFireXVelocity, Y
	BCC loc_BANK2_8C65

	LDA #$00

loc_BANK2_8C65:
	STA ObjectXVelocity, X
	LDA ObjectXLo, X
	SBC #$05
	STA ObjectXLo, X
	LDA ObjectXHi, X
	SBC #$00
	STA ObjectXHi, X
	LDA #Enemy_Fireball
	STA ObjectType, X
	JSR SetEnemyAttributes

	LDX byte_RAM_12

loc_BANK2_8C7C:
	LDA ObjectAttributes, X
	ORA #$10
	STA ObjectAttributes, X
	LDA #$AE
	JSR RenderSprite_DrawObject

	LDA ObjectAttributes, X
	AND #$EF
	STA ObjectAttributes, X
	RTS

; ---------------------------------------------------------------------------

loc_BANK2_8C8E:
	JMP RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_Key:
	LDY #$05

loc_BANK2_8C93:
	LDA EnemyState, Y
	BEQ loc_BANK2_8CA3

loc_BANK2_8C98:
	CPY byte_RAM_12
	BEQ loc_BANK2_8CA3

	LDA ObjectType, Y
	CMP #Enemy_Key
	BEQ loc_BANK2_8CAE

loc_BANK2_8CA3:
	DEY
	BPL loc_BANK2_8C93

	LDA KeyUsed
	BNE loc_BANK2_8CAE

loc_BANK2_8CAB:
	JMP EnemyInit_Stationary

; ---------------------------------------------------------------------------

loc_BANK2_8CAE:
	JMP EnemyDestroy

; ---------------------------------------------------------------------------

EnemyInit_CrystalBallStarmanStopwatch:
	LDY #$05

loc_BANK2_8CB3:
	LDA EnemyState, Y
	BEQ loc_BANK2_8CC3

	CPY byte_RAM_12
	BEQ loc_BANK2_8CC3

	LDA ObjectType, Y
	CMP #Enemy_CrystalBall
	BEQ loc_BANK2_8CAE

loc_BANK2_8CC3:
	DEY
	BPL loc_BANK2_8CB3

	LDA CrystalAndHawkmouthOpenSize
	BNE loc_BANK2_8CAE

	BEQ loc_BANK2_8CAB

	JSR CreateEnemy

	BMI locret_BANK2_8CF7

	LDX byte_RAM_0
	LDA #Enemy_Starman
	STA ObjectType, X
	LDA ScreenBoundaryLeftLo
	ADC #$D0
	STA ObjectXLo, X
	LDA ScreenBoundaryLeftHi
	ADC #$00
	STA ObjectXHi, X
	LDA ScreenYLo
	ADC #$E0
	STA ObjectYLo, X
	LDA ScreenYHi
	ADC #$00
	STA ObjectYHi, X
	JSR SetEnemyAttributes

	LDX byte_RAM_12

locret_BANK2_8CF7:
	RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Starman:
	LDA #$FC
	STA ObjectYVelocity, X
	LDY #$F8
	LDA byte_RAM_10
	STA ObjectFlashTimer, X
	BPL loc_BANK2_8D07

	LDY #$08

loc_BANK2_8D07:
	STY ObjectXVelocity, X
	JMP RenderSpriteAndApplyObjectMovement

; ---------------------------------------------------------------------------

EnemyBehavior_JarGenerators:
	JSR ObjectTileCollision

	AND #$03
	BNE EnemyBehavior_JarGenerators_Active

	JMP EnemyDestroy

EnemyBehavior_JarGenerators_Active:
	INC ObjectAnimationTimer, X
	LDA ObjectAnimationTimer, X
	ASL A
	BNE locret_BANK2_8D5E

	JSR CreateEnemy

	BMI locret_BANK2_8D5E

	LDY byte_RAM_0
	LDA ObjectXLo, Y
	SEC
	SBC #$06
	STA ObjectXLo, Y
	LDA ObjectYLo, Y
	SBC #$04
	STA ObjectYLo, Y
	LDA ObjectYHi, Y
	SBC #$00
	STA ObjectYHi, Y
	LDA #$1A
	STA EnemyArray_480, Y
	LDA #$F8
	STA ObjectYVelocity, Y
	LDA ObjectType, X
	CMP #Enemy_JarGeneratorBobOmb
	BNE locret_BANK2_8D5E

	LDA #Enemy_BobOmb
	STA ObjectType, Y
	LDA ObjectXVelocity, Y
	ASL A
	STA ObjectXVelocity, Y
	LDA #$FF
	STA ObjectTimer1, Y

locret_BANK2_8D5E:
	RTS


EnemyInit_Hawkmouth:
	DEC ObjectYLo, X
	DEC ObjectYLo, X
	LDY #$01
	STY ObjectCollisionHitboxTop_RAM + $0B
	INY
	STY ObjectCollisionHitboxLeft_RAM + $0B


EnemyInit_Stationary:
	JSR EnemyInit_Basic

	LDA #$00
	STA ObjectXVelocity, X
	RTS


EnemyBehavior_Hawkmouth:
	LDA byte_RAM_EE
	BEQ loc_BANK2_8D7B

loc_BANK2_8D78:
	JMP RenderSprite_HawkmouthLeft

; ---------------------------------------------------------------------------

loc_BANK2_8D7B:
	LDA HawkmouthOpenTimer
	BEQ loc_BANK2_8D8A

	DEC HawkmouthOpenTimer
	BNE loc_BANK2_8D78

	LDA #SoundEffect1_HawkOpen_WartBarf
	STA SoundEffectQueue1

loc_BANK2_8D8A:
	LDA HawkmouthClosing
	BEQ loc_BANK2_8DBA

	DEC CrystalAndHawkmouthOpenSize
	BNE loc_BANK2_8D78

	LDA #$00
	STA HawkmouthClosing
	LDA #TransitionType_Door
	STA TransitionType
	JSR DoAreaReset

	LDY CurrentLevelRelative
	LDA CurrentWorldTileset
	CMP #$06
	BNE loc_BANK2_8DAC

	INY

loc_BANK2_8DAC:
	CPY #$02
	BCC SetGameModeBonusChance

	INC DoAreaTransition
	RTS

; ---------------------------------------------------------------------------

SetGameModeBonusChance:
	LDA #GameMode_BonusChance
	STA GameMode
	RTS

; ---------------------------------------------------------------------------

loc_BANK2_8DBA:
	LDA CrystalAndHawkmouthOpenSize
	BEQ RenderSprite_HawkmouthLeft

	CMP #$30
	BEQ loc_BANK2_8DDB

	LDA byte_RAM_EE
	AND #$04
	BNE RenderSprite_HawkmouthLeft

	INC CrystalAndHawkmouthOpenSize
	LDA byte_RAM_10
	AND #$03
	BNE loc_BANK2_8DD8

	DEC ObjectCollisionHitboxTop_RAM + $0B
	INC ObjectCollisionHitboxLeft_RAM + $0B

loc_BANK2_8DD8:
	JMP RenderSprite_HawkmouthLeft

; ---------------------------------------------------------------------------

loc_BANK2_8DDB:
	LDA EnemyCollision, X
	AND #CollisionFlags_PlayerInsideMaybe
	BEQ RenderSprite_HawkmouthLeft

	LDA ObjectYLo, X
	CMP PlayerYLo
	BCS RenderSprite_HawkmouthLeft

	LDA PlayerCollision
	AND #CollisionFlags_Down
	BEQ RenderSprite_HawkmouthLeft

	LDA HoldingItem
	BNE RenderSprite_HawkmouthLeft

	LDA #PlayerState_HawkmouthEating
	STA PlayerState
	LDA #$30
	STA PlayerStateTimer
	LDA #$FC
	STA PlayerYVelocity
	LDA #SoundEffect1_HawkOpen_WartBarf
	STA SoundEffectQueue1
	INC HawkmouthClosing

RenderSprite_HawkmouthLeft:
	LDA byte_RAM_EF
	BNE loc_BANK2_8E60

	LDA ObjectType, X
	SEC
	SBC #$41
	STA EnemyMovementDirection, X
	LDA CrystalAndHawkmouthOpenSize

; =============== S U B R O U T I N E =======================================

sub_BANK2_8E13:
	STA byte_RAM_7
	LSR A
	LSR A
	EOR #$FF
	SEC
	ADC SpriteTempScreenY
	STA SpriteTempScreenY
	LDY DoorAnimationTimer
	BEQ loc_BANK2_8E27

	LDY #$10

loc_BANK2_8E27:
	STY byte_RAM_F4
	LDA #$8E
	LDY byte_RAM_7
	BEQ loc_BANK2_8E31

	LDA #$92

loc_BANK2_8E31:
	JSR RenderSprite_DrawObject

	LDA byte_RAM_7
	TAY
	LSR A
	CLC
	ADC SpriteTempScreenY
	ADC #$08
	CPY #$00
	BNE loc_BANK2_8E44

	ADC #$07

loc_BANK2_8E44:
	STA byte_RAM_0
	JSR FindSpriteSlot

	LDX #$9A
	LDA byte_RAM_7
	BEQ loc_BANK2_8E58

	LDA HawkmouthClosing
	BEQ loc_BANK2_8E56

	LDY #$10

loc_BANK2_8E56:
	LDX #$96

loc_BANK2_8E58:
	STY byte_RAM_F4
	JSR SetSpriteTiles

	JSR SetSpriteTiles

loc_BANK2_8E60:
	LDX byte_RAM_12
	RTS

; End of function sub_BANK2_8E13

; ---------------------------------------------------------------------------

EnemyInit_Trouter:
	JSR EnemyInit_Stationary

	LDA ObjectXLo, X
	ADC #$08
	STA ObjectXLo, X
	LDA ObjectYLo, X
	LSR A
	LSR A
	LSR A
	LSR A
	STA EnemyArray_B1, X
	LDA #$80
	STA ObjectTimer1, X

locret_BANK2_8E78:
	RTS


byte_BANK2_8E79:
	.db $AC
	.db $AE
	.db $B1
	.db $B5
	.db $B8
	.db $BC
	.db $C0
	.db $C4
	.db $C8
	.db $CC
	.db $D2
	.db $D8

byte_BANK2_8E85:
	.db $92
	.db $EA


EnemyBehavior_Trouter:
	JSR EnemyBehavior_CheckDamagedInterrupt

	INC ObjectAnimationTimer, X
	JSR EnemyBehavior_Check42FPhysicsInterrupt

	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	LDA #$09
	LDY ObjectYVelocity, X
	BMI loc_BANK2_8E9A

	LDA #$89

loc_BANK2_8E9A:
	STA ObjectAttributes, X
	LDY IsHorizontalLevel
	LDA ObjectYLo, X
	CMP byte_BANK2_8E85, Y
	BCC loc_BANK2_8EB6

	LDY ObjectTimer1, X
	BNE locret_BANK2_8E78

	STA ObjectYLo, X
	LDY EnemyArray_B1, X
	LDA byte_BANK2_8E79, Y
	STA ObjectYVelocity, X
	LDA #$C0
	STA ObjectTimer1, X

loc_BANK2_8EB6:
	JSR sub_BANK2_9430

	INC ObjectYVelocity, X
	JMP RenderSprite


Enemy_Hoopstar_YVelocity:
	.db $FA ; up
	.db $0C ; down

Enemy_Hoopstar_Attributes:
	.db $91 ; up
	.db $11 ; down


EnemyBehavior_Hoopstar:
	JSR EnemyBehavior_CheckDamagedInterrupt

	INC ObjectAnimationTimer, X
	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR RenderSprite

	JSR EnemyBehavior_Check42FPhysicsInterrupt

	LDA #$00
	STA ObjectXVelocity, X

	JSR EnemyBehavior_Hoopstar_Climb

	LDY EnemyArray_477, X
	BCC loc_BANK2_8EEC

	LDA ObjectYLo, X
	CMP ScreenYLo
	LDA ObjectYHi, X
	SBC ScreenYHi
	BEQ loc_BANK2_8EF3

	ASL A
	ROL A
	AND #$01
	BPL loc_BANK2_8EEF

loc_BANK2_8EEC:
	TYA
	EOR #$01

loc_BANK2_8EEF:
	STA EnemyArray_477, X
	TAY

loc_BANK2_8EF3:
	LDA Enemy_Hoopstar_YVelocity, Y
	STA ObjectYVelocity, X
	LDA Enemy_Hoopstar_Attributes, Y
	STA ObjectAttributes, X
	JSR EnemyFindWhichSidePlayerIsOn

	LDA byte_RAM_F
	ADC #$10
	CMP #$20
	BCS loc_BANK2_8F0A

	ASL ObjectYVelocity, X

loc_BANK2_8F0A:
	JMP ApplyObjectPhysicsY

; ---------------------------------------------------------------------------

EnemyBehavior_00:
	LDA byte_RAM_EF
	BEQ loc_BANK2_8F14

	JMP EnemyDestroy

; ---------------------------------------------------------------------------

loc_BANK2_8F14:
	LDY #$FC
	LDA byte_RAM_10
	AND #$20
	BEQ loc_BANK2_8F1E

	LDY #$04

loc_BANK2_8F1E:
	STY ObjectXVelocity, X
	LDA #$F8
	STA ObjectYVelocity, X
	JSR sub_BANK2_9430

RenderSprite_Heart:
	LDA byte_RAM_EE
	AND #$08
	ORA byte_RAM_EF
	BNE RenderSprite_Heart_Exit

	; This part of the code seems to only run
	; if the graph we're trying to draw is
	; a heart sprite ...
	LDY byte_RAM_F4
	LDA SpriteTempScreenY
	STA SpriteDMAArea, Y
	LDA SpriteTempScreenX
	STA SpriteDMAArea + 3, Y
SetHeartSprite:
	LDA #$D8
	STA SpriteDMAArea + 1, Y
	LDA byte_RAM_10
	AND #$20
	EOR #$20
	ASL A
	ORA #$01
	STA SpriteDMAArea + 2, Y

RenderSprite_Heart_Exit:
	RTS


Enemy_Birdo_Attributes:
	.db ObjAttrib_Palette3 | ObjAttrib_16x32
	.db ObjAttrib_Palette1 | ObjAttrib_16x32
	.db ObjAttrib_Palette2 | ObjAttrib_16x32


;
; Initializes a Birdo (and a few other boss enemies, such as Mouser and Clawgrip)
;
EnemyInit_Birdo:
	JSR EnemyInit_Basic

	LDY #$00 ; Default to the Gray Birdo (fires only fireballs)
	LDA ObjectXLo, X ; Check if this is a special Birdo.
	CMP #$A0 ; means this is a Pink Birdo (fires only eggs, slowly)
	BEQ EnemyInit_Birdo_SetType

	INY
	CMP #$B0 ; tile x-position on page = $B
	BEQ EnemyInit_Birdo_SetType ; If yes, this is a Red Birdo (fires eggs and fireballs)

	INY

EnemyInit_Birdo_SetType:
	STY EnemyVariable, X ; Set the Birdo type
	LDA Enemy_Birdo_Attributes, Y
	STA ObjectAttributes, X
	LDA #$02
	STA EnemyHP, X

EnemyInit_Birdo_Exit:
	LDA ObjectXHi, X
	STA EndOfLevelDoorPage, X
	RTS


ProjectileLaunchXOffsets:
	.db $FE
	.db $F8


EnemyBehavior_Birdo:
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR ObjectTileCollision

	LDA #$00
	STA ObjectXVelocity, X
	JSR EnemyFindWhichSidePlayerIsOn

	INY
	STY EnemyMovementDirection, X
	JSR RenderSprite

	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ loc_BANK2_8FD2

	JSR ResetObjectYVelocity

	LDA byte_RAM_10
	BNE loc_BANK2_8FA3

	LDA #$E0
	STA ObjectYVelocity, X
	BNE loc_BANK2_8FD2


BirdoSpitDelay:
	.db $7F
	.db $3F
	.db $3F


; Health-based Birdo egg/fire chances.
; If PRNG & $1F >= this, shoot an egg
; Otherwise, shoot a fireball
BirdoHealthEggProbabilities:
	.db $08
	.db $06
	.db $04


loc_BANK2_8FA3:
	LDY EnemyVariable, X
	LDA BirdoSpitDelay, Y
	AND byte_RAM_10
	BNE loc_BANK2_8FB6

	LDA byte_RAM_EE
	AND #$0C
	BNE loc_BANK2_8FB6

	LDA #$1C
	STA ObjectTimer1, X

loc_BANK2_8FB6:
	LDY ObjectTimer1, X
	BNE BirdoBehavior_SpitProjectile

	INC EnemyArray_B1, X
	LDA EnemyArray_B1, X
	AND #$40
	BEQ loc_BANK2_901B

	JSR IncrementAnimationTimerBy2

	LDA #$0A
	LDY EnemyArray_B1, X
	BMI loc_BANK2_8FCD

	LDA #$F6

loc_BANK2_8FCD:
	STA ObjectXVelocity, X
	JMP ApplyObjectPhysicsX

; ---------------------------------------------------------------------------

loc_BANK2_8FD2:
	JMP ApplyObjectMovement_Vertical

; ---------------------------------------------------------------------------

BirdoBehavior_SpitProjectile:
	CPY #$08
	BNE loc_BANK2_901B

	LDA #SoundEffect1_BirdoShot
	STA SoundEffectQueue1
	JSR sub_BANK2_95E5

	BMI loc_BANK2_901B

	LDY EnemyHP, X
	LDA EnemyVariable, X
	LDX byte_RAM_0
	CMP #$02 ; If we're a Gray Birdo, always shoot fire
	BEQ _Birdo_SpitFire

	CMP #$01 ; If we're a Pink Birdo, always shoot eggs
	BNE _Birdo_SpitEgg

	LDA PseudoRNGValue ; Otherwise, randomly determine what to fire
	AND #$1F ; If PRNG & $1F >= our health-probability number,
	CMP BirdoHealthEggProbabilities, Y ; fire an egg out
	BCS _Birdo_SpitEgg ; Otherwise just fall through to barfing fire

_Birdo_SpitFire:
	INC EnemyVariable, X ; Shoot a fireball
	LDA #Enemy_Fireball
	BNE EnemyBehavior_SpitProjectile

_Birdo_SpitEgg:
	LDA #Enemy_Egg ; Shoot an egg


;
; Spits an object (used by Birdo and Autobomb)
;
; Input
;   A = Object type
;   X = Enemy index
;
EnemyBehavior_SpitProjectile:
	STA ObjectType, X
	LDA ObjectYLo, X
	CLC
	ADC #$03
	STA ObjectYLo, X
	LDY EnemyMovementDirection, X
	LDA ObjectXLo, X
	ADC ProjectileLaunchXOffsets - 1, Y
	STA ObjectXLo, X
	JSR SetEnemyAttributes

	LDX byte_RAM_12

loc_BANK2_901B:
	JMP RenderSprite


; Unused?
	.db $18
	.db $E8

; Maps upper nybble of y-velocity to a corresponding bounce velocity
ObjectBounceVelocityY:
	.db $FE
	.db $F8
	.db $F0
	.db $E8


EnemyBehavior_Coin:
	JSR IncrementAnimationTimerBy2

	LDA ObjectYVelocity, X
	CMP #$EA
	BNE EnemyBehavior_Mushroom1up

	LDA #SoundEffect2_CoinGet
	STA SoundEffectQueue2

EnemyBehavior_Mushroom1up:
	LDA ObjectYVelocity, X
	CMP #$10
	BMI EnemyBehavior_Mushroom

	JSR TurnIntoPuffOfSmoke

	LDA ObjectType, X
	CMP #Enemy_Mushroom1up
	BEQ Award1upMushroom

	INC SlotMachineCoins
	RTS

; ---------------------------------------------------------------------------

Award1upMushroom:
	INC Mushroom1upPulled
	INC ExtraLives
	BNE loc_BANK2_9050 ; Check if lives overflow. If so, reduce by one again

	DEC ExtraLives

loc_BANK2_9050:
	LDA #SoundEffect1_1UP
	STA SoundEffectQueue1
	RTS

; ---------------------------------------------------------------------------

EnemyBehavior_CrystalBall:
	INC SpriteTempScreenY
	JSR AttachObjectToBirdo

;
; Behavior for objects that turn into smoke after you pick them up
; (eg. mushrooms, crystal ball, stopwatch)
;
EnemyBehavior_Mushroom:
	LDA ObjectBeingCarriedTimer, X
	CMP #$01
	BNE EnemyBehavior_Mushroom_StayMaterial

	LDA PlayerDucking
	BEQ EnemyBehavior_Mushroom_PickUp

EnemyBehavior_Mushroom_StayMaterial:
	JMP EnemyBehavior_Bomb

EnemyBehavior_Mushroom_PickUp:
	JSR CarryObject

	LDA #$00
	STA HoldingItem
	STA ObjectBeingCarriedTimer, X
	JSR TurnIntoPuffOfSmoke

	LDA ObjectType, X
	CMP #Enemy_CrystalBall
	BNE EnemyBehavior_PickUpNotCrystalBall

	LDA CrystalAndHawkmouthOpenSize
	BNE EnemyBehavior_CrystalBall_Exit

	LDA #Music2_CrystalGetFanfare
	STA MusicQueue2
	LDA #$60
	STA HawkmouthOpenTimer
	INC CrystalAndHawkmouthOpenSize

EnemyBehavior_CrystalBall_Exit:
	RTS

EnemyBehavior_PickUpNotCrystalBall:
	CMP #Enemy_Mushroom1up
	BEQ EnemyBehavior_PickUpMushroom1up

	CMP #Enemy_Stopwatch
	BEQ EnemyBehavior_PickUpStopwatch

	CMP #Enemy_Mushroom
	BNE EnemyBehavior_PickUpNotMushroom

EnemyBehavior_PickUpMushroom:
	LDX EnemyVariable
	INC Mushroom1Pulled, X
	LDX byte_RAM_12
	INC PlayerMaxHealth
	JSR RestorePlayerToFullHealth

	LDA #Music2_MushroomGetJingle
	STA MusicQueue2
	RTS

EnemyBehavior_PickUpMushroom1up:
	LDA #$09
	STA ObjectAttributes, X

EnemyBehavior_PickUpNotMushroom:
	LDA #$E0
	STA ObjectYVelocity, X
	LDA #$01
	STA EnemyState, X
	RTS

EnemyBehavior_PickUpStopwatch:
	LDA #$FF
	STA StopwatchTimer
	RTS


EnemyBehavior_Key:
	JSR AttachObjectToBirdo

;
; Behavior for objects that have background collision detection
;
EnemyBehavior_Bomb:
	JSR ObjectTileCollision

	LDA EnemyCollision, X
	PHA
	AND EnemyMovementDirection, X
	BEQ EnemyBehavior_CheckGround

	JSR EnemyBehavior_TurnAround

	JSR HalfObjectVelocityX
	JSR HalfObjectVelocityX
	JSR HalfObjectVelocityX

EnemyBehavior_CheckGround:
	PLA
	AND #CollisionFlags_Down
	BEQ EnemyBehavior_CheckBombTimer

	; object is touching ground
	LDA ObjectYVelocity, X
	CMP #$09
	BCC EnemyBehavior_Grounded

	; object is falling faster than $08
	LSR A
	LSR A
	LSR A
	LSR A
	TAY
	LDA ObjectBounceVelocityY, Y
	JSR ApplyVelocityYAndHalfObjectVelocityX

	JMP EnemyBehavior_CheckBombTimer

EnemyBehavior_Grounded:
	JSR ResetObjectYVelocity

	LDA byte_RAM_B
	BNE EnemyBehavior_CheckBombTimer

	STA ObjectXVelocity, X

EnemyBehavior_CheckBombTimer:
	LDA ObjectType, X
	CMP #Enemy_Bomb
	BNE EnemyBehavior_Vegetable

	LDA ObjectTimer1, X
	BNE EnemyBehavior_BombTick

	LDY ObjectBeingCarriedTimer, X
	BEQ EnemyBehavior_Bomb_Explode

	STA HoldingItem
	STA ObjectBeingCarriedTimer, X

EnemyBehavior_Bomb_Explode:
	LDA #EnemyState_BombExploding
	STA EnemyState, X
	LDA #$20
	STA ObjectTimer1, X
	STA SkyFlashTimer
	LDA #DPCM_DoorOpenBombBom
	STA DPCMQueue
	LSR A
	; A = $00
	STA ObjectProjectileTimer, X
	RTS


EnemyBehavior_BombTick:
	CMP #$40
	BCS EnemyBehavior_Vegetable

	; bomb flashing
	LSR A
	BCC EnemyBehavior_Vegetable

	INC ObjectAttributes, X
	LDA ObjectAttributes, X
	AND #$FB
	STA ObjectAttributes, X

EnemyBehavior_Vegetable:
	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR ApplyObjectMovement

RenderSprite_VegetableLarge:
	LDA EnemyArray_B1, X
	BNE loc_BANK2_913E

	JMP RenderSprite_NotAlbatoss

; ---------------------------------------------------------------------------

loc_BANK2_913E:
	JMP RenderSprite_DrawObject

; ---------------------------------------------------------------------------

EnemyBehavior_SubspacePotion:
	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR ObjectTileCollision

	LDA EnemyCollision, X
	PHA
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ EnemyBehavior_SubspacePotion_CheckGroundCollision

	JSR EnemyBehavior_TurnAround

	JSR HalfObjectVelocityX
	JSR HalfObjectVelocityX

EnemyBehavior_SubspacePotion_CheckGroundCollision:
	PLA
	AND #CollisionFlags_Down
	BEQ EnemyBehavior_Vegetable

	JSR ResetObjectYVelocity

	LDA ObjectYLo, X
	SEC
	SBC #$10
	STA ObjectYLo, X
	LDA ObjectXLo, X
	ADC #$07
	AND #$F0
	STA ObjectXLo, X
	LDA ObjectXHi, X
	ADC #$00
	STA ObjectXHi, X
	LDA #$10
	STA ObjectTimer2, X
	LDA #SoundEffect1_PotionDoorBong
	STA SoundEffectQueue1
	INC EnemyArray_B1, X
	LDA #Enemy_SubspaceDoor
	STA ObjectType, X
	JSR SetEnemyAttributes

	LDA #$10
	STA byte_RAM_5BB

	; No Subspace Doors allowed in vertical levels
	LDA IsHorizontalLevel
	BNE EnemyBehavior_SubspacePotion_CreateDoor

	LDA #DPCM_BossHurt
	STA DPCMQueue
	JSR EnemyDestroy

EnemyBehavior_SubspacePotion_CreateDoor:
	JSR CreateEnemy

	BMI TurnIntoPuffOfSmoke_Exit

	LDY byte_RAM_0
	LDA ObjectXLo, X
	STA ObjectXLo, Y
	LDA ObjectXHi, X
	STA ObjectXHi, Y
	LDA #$41
	STA ObjectAttributes, Y
	TYA
	TAX


;
; Turns an object into a puff of smoke
;
; Input
;   X = enemy index of object to poof
;
TurnIntoPuffOfSmoke:
	LDA ObjectAttributes, X ; Get current object sprite attributes...
	AND #ObjAttrib_Horizontal | ObjAttrib_FrontFacing | ObjAttrib_Mirrored | ObjAttrib_BehindBackground | ObjAttrib_16x32 | ObjAttrib_UpsideDown
	ORA #ObjAttrib_Palette1
	STA ObjectAttributes, X
	LDA #EnemyState_PuffOfSmoke
	STA EnemyState, X ; WINNERS DON'T SMOKE SHROOMS
	STA ObjectAnimationTimer, X ; No idea what this address is for
	LDA #$1F
	STA ObjectTimer1, X ; Puff-of-smoke animation timer?
	LDX byte_RAM_12

TurnIntoPuffOfSmoke_Exit:
	RTS


byte_BANK2_91C5:
	.db $F8
	.db $08


;
; Look for a Birdo to attach to
;
AttachObjectToBirdo:
	LDA EnemyVariable, X
	BNE AttachObjectToBirdo_Skip

	LDY #$05
AttachObjectToBirdo_Loop:
	LDA EnemyState, Y
	CMP #EnemyState_Alive
	BNE AttachObjectToBirdo_NotLiveBirdo

	LDA ObjectType, Y
	CMP #Enemy_Birdo
	BEQ AttachObjectToBirdo_DoAttach

AttachObjectToBirdo_NotLiveBirdo:
	DEY
	BPL AttachObjectToBirdo_Loop

AttachObjectToBirdo_Skip:
	LDA #$01
	STA EnemyVariable, X
	JMP SetEnemyAttributes

AttachObjectToBirdo_DoAttach:
	LDA ObjectXHi, Y
	CMP ObjectXHi, X
	BNE AttachObjectToBirdo_Skip

	LDA ObjectXLo, Y
	STA ObjectXLo, X
	LDA ObjectYLo, Y
	ADC #$0E
	STA ObjectYLo, X
	JSR EnemyFindWhichSidePlayerIsOn

	LDA byte_BANK2_91C5, Y
	STA ObjectXVelocity, X
	LDA #$E0
	STA ObjectYVelocity, X
	PLA
	PLA
	LDA #%00000111
	STA EnemyArray_46E, X
	LDA #$30
	STA byte_RAM_F4
	JMP RenderSprite



byte_BANK2_9212:
	.db $F0

byte_BANK2_9213:
	.db $FF
	.db $00
; ---------------------------------------------------------------------------

EnemyInit_AlbatossStartLeft:
	JSR EnemyInit_Basic

	LDA #$F0
	BNE loc_BANK2_9221

EnemyInit_AlbatossStartRight:
	JSR EnemyInit_Basic

	LDA #$10

loc_BANK2_9221:
	STA ObjectXVelocity, X
	INC EnemyArray_B1, X
	LDA ObjectType, X
	SEC

loc_BANK2_9228:
	SBC #$0B
	TAY
	LDA ScreenBoundaryLeftLo
	ADC byte_BANK2_9212, Y
	STA ObjectXLo, X
	LDA ScreenBoundaryLeftHi
	ADC byte_BANK2_9213, Y
	STA ObjectXHi, X
	RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Albatoss:
	JSR RenderSprite_Albatoss

	INC ObjectAnimationTimer, X
	LDA EnemyArray_B1, X
	BNE loc_BANK2_9271

	LDA EnemyCollision, X
	AND #CollisionFlags_Damage
	BNE loc_BANK2_9256

	JSR EnemyFindWhichSidePlayerIsOn

	LDA byte_RAM_F
	ADC #$30
	CMP #$60
	BCS loc_BANK2_926E

loc_BANK2_9256:
	JSR CreateEnemy

	BMI loc_BANK2_926E

	LDX byte_RAM_0
	LDA #Enemy_BobOmb
	STA ObjectType, X
	LDA ObjectYLo, X
	ADC #$10
	STA ObjectYLo, X
	JSR EnemyInit_Bobomb

	LDX byte_RAM_12
	INC EnemyArray_B1, X

loc_BANK2_926E:
	JMP loc_BANK2_9274

; ---------------------------------------------------------------------------

loc_BANK2_9271:
	JSR EnemyBehavior_CheckDamagedInterrupt

loc_BANK2_9274:
	JMP ApplyObjectPhysicsX

; ---------------------------------------------------------------------------

EnemyBehavior_AutobombFire:
	JSR sub_BANK2_9289

sub_BANK2_927A:
	ASL ObjectAttributes, X
	LDA byte_RAM_10
	LSR A
	LSR A
	LSR A
	ROR ObjectAttributes, X
	RTS


; Unused?
	.db $D0
	.db $03


EnemyBehavior_BulletAndEgg:
	JSR ObjectTileCollision

sub_BANK2_9289:
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	LDA EnemyArray_B1, X
	ORA ObjectProjectileTimer, X
	BEQ loc_BANK2_9299

	JMP RenderSpriteAndApplyObjectMovement

; ---------------------------------------------------------------------------

loc_BANK2_9299:
	LDA ObjectYVelocity, X
	BPL loc_BANK2_929F

	STA EnemyArray_B1, X

loc_BANK2_929F:
	LDA EnemyCollision, X
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ loc_BANK2_92BE

	STA EnemyArray_B1, X
	LDA ObjectType, X
	CMP #Enemy_Bullet
	BNE loc_BANK2_92B5

	LDA #EnemyState_Dead
	STA EnemyState, X
	INC ObjectYLo, X
	INC ObjectYLo, X

loc_BANK2_92B5:
	JSR EnemyBehavior_TurnAround

	JSR HalfObjectVelocityX

	JSR HalfObjectVelocityX

loc_BANK2_92BE:
	JSR ApplyObjectPhysicsX

	JMP RenderSprite

; End of function sub_BANK2_9289


;
; Creates a generic red Shyguy enemy and
; does some basic initialization for it.
;
; CreateEnemy_TryAllSlots checks all 9 object slots
; CreateEnemy only checks the first 6 object slots
;
; Output
;   N = enabled if no empty slot was found
;   Y = $FF if there no empty slot was found
;   byte_RAM_0 = slot used
;
CreateEnemy_TryAllSlots:
	LDY #$08
	BNE CreateEnemy_FindSlot

CreateEnemy:
	LDY #$05

CreateEnemy_FindSlot:
	LDA EnemyState, Y
	BEQ CreateEnemy_FoundSlot

	DEY
	BPL CreateEnemy_FindSlot

	RTS

CreateEnemy_FoundSlot:
	LDA #EnemyState_Alive
	STA EnemyState, Y
	LSR A
	STA EnemyArray_SpawnsDoor, Y
	LDA #Enemy_ShyguyRed
	STA ObjectType, Y
	LDA ObjectXLo, X
	ADC #$05
	STA ObjectXLo, Y
	LDA ObjectXHi, X
	ADC #$00
	STA ObjectXHi, Y
	LDA ObjectYLo, X
	STA ObjectYLo, Y
	LDA ObjectYHi, X
	STA ObjectYHi, Y
	STY byte_RAM_0
	TYA
	TAX

	JSR EnemyInit_Basic
	JSR UnlinkEnemyFromRawData

	LDX byte_RAM_12
	RTS


Phanto_AccelX:
	.db $01
	.db $FF
Phanto_MaxVelX:
	.db $30
	.db $D0
Phanto_AccelY:
	.db $01
	.db $FF ; Exit up
	.db $01 ; Exit down
Phanto_MaxVelY:
	.db $18
	.db $E8
	.db $18

EnemyBehavior_Phanto:
	LDA ObjectShakeTimer, X
	BEQ Phanto_AfterDecrementShakeTimer

	DEC ObjectShakeTimer, X

Phanto_AfterDecrementShakeTimer:
	JSR RenderSprite

	LDY #$01 ; Move away from player
	LDA HoldingItem
	BEQ Phanto_Movement

	LDX ObjectBeingCarriedIndex
	LDA ObjectType, X
	LDX byte_RAM_12

	; Strange code. Phanto only chases you if you have the key.
	; So you should just be able to use BEQ/BNE.
	; This way seems to imply that Phanto would
	; chase you if you were carrying a range of items,
	; but...  what could those items have been?
	; But instead we do it like this for... reasons.
	; Nintendo.
	CMP #Enemy_Key
	BCC Phanto_Movement

	; Subspace Potion is >= Enemy_Key, so ignore it
	CMP #Enemy_SubspacePotion
	BCS Phanto_Movement

	LDA PhantoActivateTimer
	CMP #$A0
	BNE Phanto_AfterStartTimer

	; Kick off Phanto activation timer
	DEC PhantoActivateTimer

Phanto_AfterStartTimer:
	DEY ; Move toward player

Phanto_Movement:
	LDA ObjectYHi, X
	CLC
	ADC #$01
	STA byte_RAM_5
	LDA PlayerYLo
	CMP ObjectYLo, X
	LDX PlayerYHi
	INX
	TXA
	LDX byte_RAM_12
	SBC byte_RAM_5
	BPL loc_BANK2_9351

	INY ; Other side of player vertically

loc_BANK2_9351:
	LDA ObjectYVelocity, X
	CMP Phanto_MaxVelY, Y
	BEQ loc_BANK2_935E

	CLC
	ADC Phanto_AccelY, Y
	STA ObjectYVelocity, X

loc_BANK2_935E:
	LDA EnemyArray_480, X
	CLC
	ADC #$A0
	STA EnemyArray_480, X
	BCC loc_BANK2_937F

	LDA EnemyArray_477, X
	AND #$01
	TAY
	LDA ObjectXVelocity, X
	CLC
	ADC Phanto_AccelX, Y
	STA ObjectXVelocity, X
	CMP Phanto_MaxVelX, Y
	BNE loc_BANK2_937F

	INC EnemyArray_477, X

loc_BANK2_937F:
	LDA IsHorizontalLevel
	BEQ loc_BANK2_9388

	LDA PlayerXVelocity
	STA ObjectXAcceleration, X

loc_BANK2_9388:
	LDY PhantoActivateTimer
	BEQ Phanto_Activated

	; Hold the timer at $A0
	CPY #$A0
	BEQ Phanto_AfterDecrementActivateTimer

	CPY #$80
	BNE Phanto_AfterFlashing

	; Start flashing
	LDA #$40
	STA ObjectFlashTimer, X

Phanto_AfterFlashing:
	CPY #$40
	BNE Phanto_AfterSound

	; Start vibrating
	LDA #$40
	STA ObjectShakeTimer, X

	; Play Phanto activation sound effect
	LDA #SoundEffect3_Rumble_B
	STA SoundEffectQueue3

Phanto_AfterSound:
	DEC PhantoActivateTimer

Phanto_AfterDecrementActivateTimer:
	LDA #$00
	STA ObjectXAcceleration, X
	STA ObjectXVelocity, X
	STA ObjectYVelocity, X

Phanto_Activated:
	JMP sub_BANK2_9430


Enemy_Ninji_JumpVelocity:
	.db $E8
	.db $D0
	.db $D8
	.db $D0


EnemyBehavior_NinjiJumping:
	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ EnemyBehavior_Ninji_MidAir

	LDA ObjectProjectileTimer, X
	BNE EnemyBehavior_NinjiJumping_DetermineJump

	; stop x-velocity
	STA ObjectXVelocity, X

EnemyBehavior_NinjiJumping_DetermineJump:
	TXA
	ASL A
	ASL A
	ASL A
	ADC byte_RAM_10
	AND #$3F
	BNE EnemyBehavior_Ninji_MidAir

	LDA ObjectAnimationTimer, X
	AND #$C0
	ASL A
	ROL A
	ROL A
	TAY
	LDA Enemy_Ninji_JumpVelocity, Y
	BNE EnemyBehavior_Ninji_Jump

EnemyBehavior_NinjiRunning:
	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ EnemyBehavior_Ninji_MidAir

	LDA PlayerYLo
	CLC
	ADC #$10
	CMP ObjectYLo, X
	BNE EnemyBehavior_Ninji_MidAir

	JSR EnemyFindWhichSidePlayerIsOn

	INY
	TYA
	CMP EnemyMovementDirection, X
	BNE EnemyBehavior_Ninji_MidAir

	LDA byte_RAM_F
	ADC #$28
	CMP #$50
	BCS EnemyBehavior_Ninji_MidAir

	LDA #$D8

EnemyBehavior_Ninji_Jump:
	STA ObjectYVelocity, X
	LDA ObjectAnimationTimer, X
	AND #$F0
	STA ObjectAnimationTimer, X
	JSR ApplyObjectPhysicsY

EnemyBehavior_Ninji_MidAir:
	JMP EnemyBehavior_BasicWalker

; ---------------------------------------------------------------------------

EnemyBehavior_Beezo:
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR RenderSprite

	INC ObjectAnimationTimer, X
	JSR EnemyBehavior_Check42FPhysicsInterrupt

	JSR IncrementAnimationTimerBy2

loc_BANK2_941D:
	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	LDA ObjectYVelocity, X
	BEQ loc_BANK2_9436

	BPL loc_BANK2_9429

	STA ObjectProjectileTimer, X

loc_BANK2_9429:
	LDA byte_RAM_10
	LSR A
	BCC sub_BANK2_9430

	DEC ObjectYVelocity, X

; =============== S U B R O U T I N E =======================================

sub_BANK2_9430:
	JSR ApplyObjectPhysicsX

	JMP ApplyObjectPhysicsY

; End of function sub_BANK2_9430

; ---------------------------------------------------------------------------

loc_BANK2_9436:
	JSR ApplyObjectPhysicsX

loc_BANK2_9439:
	JMP sub_BANK2_9430


BulletProjectileXSpeeds:
	.db $20
	.db $E0


EnemyBehavior_BobOmb:
	LDY ObjectTimer1, X
	CPY #$3A ; When to stop walking
	BCS EnemyBehavior_BasicWalker

	; Stop walking if the BobOmb is touching the ground
	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ EnemyBehavior_BobOmb_CheckFuse

	LDA #$00
	STA ObjectXVelocity, X

EnemyBehavior_BobOmb_CheckFuse:
	DEC ObjectAnimationTimer, X
	TYA
	BNE EnemyBehavior_BobOmb_Flash

	; Unset HoldingItem if this BobOmb is being carried
	LDA ObjectBeingCarriedTimer, X
	BEQ EnemyBehavior_BobOmb_Explode

	STY HoldingItem
	STY ObjectBeingCarriedTimer, X

EnemyBehavior_BobOmb_Explode:
	JMP EnemyBehavior_Bomb_Explode


EnemyBehavior_BobOmb_Flash:
	CMP #$30 ; When to start flashing
	BCS EnemyBehavior_BasicWalker

	; Palette cycle every other frame
	LSR A
	BCC EnemyBehavior_BasicWalker

	INC ObjectAttributes, X
	LDA ObjectAttributes, X
	AND #%11111011
	STA ObjectAttributes, X


EnemyBehavior_BasicWalker:
	JSR ObjectTileCollision

loc_BANK2_9470:
	JSR EnemyBehavior_CheckDamagedInterrupt

	LDA EnemyArray_480, X
	BEQ loc_BANK2_9492

	LDA EnemyCollision, X
	AND #CollisionFlags_Up
	BEQ loc_BANK2_9481

	JMP EnemyDestroy

; ---------------------------------------------------------------------------

loc_BANK2_9481:
	DEC EnemyArray_480, X
	INC ObjectTimer1, X

; =============== S U B R O U T I N E =======================================

sub_BANK2_9486:
	LDA ObjectAttributes, X
	ORA #ObjAttrib_BehindBackground
	STA ObjectAttributes, X
	JSR ApplyObjectPhysicsY

	JMP RenderSprite

; End of function sub_BANK2_9486

; ---------------------------------------------------------------------------

; Object collision with background tiles
loc_BANK2_9492:
	LDA EnemyCollision, X
	AND EnemyMovementDirection, X
	BEQ loc_BANK2_94A6

	JSR EnemyBehavior_TurnAround

	LDA ObjectProjectileTimer, X
	BEQ loc_BANK2_94A6

	JSR HalfObjectVelocityX

	JSR HalfObjectVelocityX

loc_BANK2_94A6:
	INC ObjectAnimationTimer, X
	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

loc_BANK2_94AB:
	JSR RenderSprite

	LDA ObjectType, X
	CMP #Enemy_SnifitGray
	BNE loc_BANK2_94BB

	LDA ObjectProjectileTimer, X
	BNE loc_BANK2_94BB

	STA ObjectXVelocity, X

loc_BANK2_94BB:
	JSR ApplyObjectMovement

	LDA EnemyCollision, X
	LDY ObjectYVelocity, X
	BPL loc_BANK2_9503

	AND #$08
	BEQ loc_BANK2_94CD

	LDA #$00
	STA ObjectYVelocity, X
	RTS

; ---------------------------------------------------------------------------

loc_BANK2_94CD:
	LDA ObjectProjectileTimer, X
	BNE EnemyBehavior_Walk

	; check if this enemy fires bullets when jumping
	LDA ObjectType, X
	CMP #Enemy_SnifitGray
	BNE EnemyBehavior_Walk

	; bullet generator
	LDA ObjectYVelocity, X ; check if enemy is starting to fall
	CMP #$FE
	BNE EnemyBehavior_Walk

	LDA PseudoRNGValue ; check random number generator
	BPL EnemyBehavior_Walk

	; jumper high bullet
	JSR CreateBullet

EnemyBehavior_Walk:
	DEC ObjectAnimationTimer, X
	LDA ObjectType, X
	CMP #Enemy_SnifitPink
	BEQ EnemyBehavior_TurnAtCliff

	CMP #Enemy_ShyguyPink
	BNE EnemyBehavior_BasicWalkerExit

EnemyBehavior_TurnAtCliff:
	; skip if being thrown
	LDA ObjectProjectileTimer, X
	BNE EnemyBehavior_BasicWalkerExit

	; skip if already turning around
	LDA EnemyArray_477, X
	BNE EnemyBehavior_BasicWalkerExit

	INC EnemyArray_477, X
	JMP EnemyBehavior_TurnAround

EnemyBehavior_BasicWalkerExit:
	RTS

; ---------------------------------------------------------------------------

loc_BANK2_9503:
	AND #$04
	BEQ loc_BANK2_94CD

	LDA #$00
	STA EnemyArray_477, X
	LDY ObjectType, X ; Get the current object ID
	CPY #Enemy_Tweeter ; Check if this enemy is a Tweeter
	BNE loc_BANK2_9528 ; If not, go handle some other enemies

	; ...but very, very, very rarely, only
	; when their timer (that increments once per bounce)
	; hits #$3F -- almost unnoticable
	LDA #$3F
	JSR sub_BANK2_9599

	INC EnemyVariable, X ; Make small jump 3 times, then make big jump
	LDY #$F0
	LDA EnemyVariable, X
	AND #$03 ; Check if the timer is a multiple of 4
	BNE loc_BANK2_9523 ; If not, skip over the next bit

	LDY #$E0

loc_BANK2_9523:
	STY ObjectYVelocity, X ; Set Y acceleration for bouncing
	JMP ApplyObjectPhysicsY

; ---------------------------------------------------------------------------

loc_BANK2_9528:
	LDA #$1F
	CPY #Enemy_BobOmb
	BEQ sub_BANK2_9599

	CPY #Enemy_Flurry
	BEQ sub_BANK2_9599

	LDA #$3F
	CPY #Enemy_NinjiRunning
	BEQ sub_BANK2_9599

	; this redundant red snifit check smells funny, almost like there was
	; some other follow-the-player enemy
	LDA #$7F ; unused
	CPY #Enemy_SnifitRed
	BEQ EnemyBehavior_Snifit

	CPY #Enemy_SnifitRed
	BEQ EnemyBehavior_Snifit

	CPY #Enemy_SnifitPink
	BEQ EnemyBehavior_Snifit

	CPY #Enemy_SnifitGray
	BNE loc_BANK2_959D

	LDA ObjectProjectileTimer, X
	BNE loc_BANK2_959D

	JSR EnemyFindWhichSidePlayerIsOn

	INY
	STY EnemyMovementDirection, X
	LDA ObjectAnimationTimer, X
	AND #$3F
	BNE EnemyBehavior_Snifit

	LDA #$E8
	STA ObjectYVelocity, X
	JMP ApplyObjectPhysicsY


EnemyBehavior_Snifit:
	LDA ObjectShakeTimer, X
	BEQ EnemyBehavior_Snifit_NoBullet

	DEC ObjectAnimationTimer, X
	DEC ObjectShakeTimer, X
	BNE EnemyBehavior_Snifit_NoBullet

	; telegraphed bullet (walking snifits)
	JSR CreateBullet

	JMP loc_BANK2_95BB

EnemyBehavior_Snifit_NoBullet:
loc_BANK2_9574:
	TXA
	ASL A
	ASL A
	ASL A
	ADC byte_RAM_10
	ASL A
	BNE EnemyBehavior_Snifit_AnimationTimer

	LDA ObjectType, X
	CMP #Enemy_SnifitGray
	BNE EnemyBehavior_Snifit_CheckPlayerY

	; jumper low bullet
	JSR CreateBullet

	JMP EnemyInit_DisableObjectAttributeBit8


EnemyBehavior_Snifit_CheckPlayerY:
	LDA ObjectYLo, X
	SEC
	SBC #$10
	CMP PlayerYLo
	BNE EnemyBehavior_Snifit_AnimationTimer

	LDA #$30 ; shake duration
	STA ObjectShakeTimer, X

EnemyBehavior_Snifit_AnimationTimer:
	LDA #$7F

;
; Gives em the ol' razzle-dazzle
;
; Input
;   A = timer mask
;
sub_BANK2_9599:
	AND ObjectAnimationTimer, X
	BEQ loc_BANK2_95B8

loc_BANK2_959D:
	LDA ObjectProjectileTimer, X
	BEQ loc_BANK2_95BB

	LDA ObjectYVelocity, X
	CMP #$1A
	BCC loc_BANK2_95B8

	LDA #$F0

;
; Sets the y-velocity, applies vertical physics, and cuts x-velocity in half
;
; Input
;   A = y-velocity
;   X = enemy index
;
ApplyVelocityYAndHalfObjectVelocityX:
	JSR SetObjectYVelocity
	JSR ApplyObjectPhysicsY

;
; Cuts the x-velocity of the current object in half
;
; Input
;   X = enemy index
; Output
;   RAM_0 = previous x-velocity
;
HalfObjectVelocityX:
	; Store the current X-velocity in RAM_0
	LDA ObjectXVelocity, X
	STA byte_RAM_0
	; Shift left to save the sign in the carry bit
	ASL A
	; Cut in half and preserve the sign
	ROR ObjectXVelocity, X
	RTS


; ---------------------------------------------------------------------------

loc_BANK2_95B8:
	JSR EnemyInit_BasicWithoutTimer

loc_BANK2_95BB:
	LDA ObjectType, X
	CMP #Enemy_ShyguyRed
	BNE EnemyInit_DisableObjectAttributeBit8

	LDA ObjectYVelocity, X
	CMP #$04
	BCC EnemyInit_DisableObjectAttributeBit8

	JSR EnemyInit_BasicWithoutTimer

;
; Disables bit 8 on the object attribute, which causes the object to appear
; behind the background while being pulled
;
EnemyInit_DisableObjectAttributeBit8:
	ASL ObjectAttributes, X
	LSR ObjectAttributes, X

;
; Does SetObjectYVelocity with y-velocity of 0
;
ResetObjectYVelocity:
	LDA #$00

;
; Sets the y-velocity of an object and shifts it half a tile down if it's not a
; a vegetable
;
; Input
;   A = y-velocity
;   X = enemy index
;
SetObjectYVelocity:
	STA ObjectYVelocity, X
	LDA ObjectType, X
	CMP #Enemy_VegetableSmall
	LDA ObjectYLo, X
	BCS SetObjectYVelocity_Exit

	ADC #$08
	BCC SetObjectYVelocity_Exit

	INC ObjectYHi, X

SetObjectYVelocity_Exit:
	AND #$F0
	STA ObjectYLo, X
	RTS


; =============== S U B R O U T I N E =======================================

sub_BANK2_95E5:
	JSR CreateEnemy_TryAllSlots

	JMP CreateBullet_WithSlotInY

; End of function sub_BANK2_95E5

; =============== S U B R O U T I N E =======================================

CreateBullet:
	JSR CreateEnemy

CreateBullet_WithSlotInY:
	BMI CreateBullet_Exit

	LDY EnemyMovementDirection, X
	LDX byte_RAM_0
	LDA BulletProjectileXSpeeds - 1, Y
	STA ObjectXVelocity, X
	LDA #$00
	STA ObjectYVelocity, X
	LDA #Enemy_Bullet
	STA ObjectType, X
	JSR SetEnemyAttributes

	LDX byte_RAM_12

CreateBullet_Exit:
	RTS


CharacterYOffsetCrouch:
	.db $0A ; Mario
	.db $0E ; Princess
	.db $0A ; Toad
	.db $0D ; Luigi
	.db $04 ; Small Mario
	.db $07 ; Small Princess
	.db $04 ; Small Toad
	.db $06 ; Small Luigi


; This is run when the player is carrying
; something, to update its position to
; wherever the player is above their head
CarryObject:
	LDA PlayerDirection
	EOR #$01
	TAY
	INY
	STY EnemyMovementDirection, X
	LDA PlayerXLo
	STA ObjectXLo, X
	LDA PlayerXHi
	STA ObjectXHi, X

	LDA PlayerYHi
	STA byte_RAM_7
	LDA PlayerYLo
	LDY ObjectHitbox, X
	CPY #$03
	BEQ loc_BANK2_9636

	CPY #$02
	BEQ loc_BANK2_9636

	SBC #$0E
	BCS loc_BANK2_9636

	DEC byte_RAM_7

loc_BANK2_9636:
	LDY PlayerAnimationFrame
	CPY #SpriteAnimation_Ducking
	CLC
	BNE loc_BANK2_964D

	LDY PlayerCurrentSize
	CPY #$01
	LDY CurrentCharacter
	BCC loc_BANK2_964A

	INY
	INY
	INY
	INY

loc_BANK2_964A:
	ADC CharacterYOffsetCrouch, Y

loc_BANK2_964D:
	PHP
	LDY ObjectBeingCarriedTimer, X
	CLC
	LDX PlayerCurrentSize
	BEQ loc_BANK2_965D

	INY
	INY
	INY
	INY
	INY
	INY
	INY

loc_BANK2_965D:
	ADC ItemCarryYOffsetsRAM - 1, Y
	LDX byte_RAM_12
	STA ObjectYLo, X
	LDA byte_RAM_7
	ADC ItemCarryYOffsetsRAM + $D, Y
	PLP
	ADC #$00
	STA ObjectYHi, X
	LDY ObjectBeingCarriedTimer, X
	CPY #$05
	BCS loc_BANK2_9686

	LDA ObjectType, X
	CMP #Enemy_VegetableSmall
	BCS loc_BANK2_9686

	LDA ObjectStunTimer, X
	BNE loc_BANK2_9681

	INC ObjectAnimationTimer, X

loc_BANK2_9681:
	ASL ObjectAttributes, X
	SEC
	ROR ObjectAttributes, X

loc_BANK2_9686:
	JSR SetSpriteTempScreenPosition

	JMP RenderSprite


; Unused?
	.db $10
	.db $F0


EnemyBehavior_MushroomBlockAndPOW:
	JSR sub_BANK2_9692

EnemyBehavior_MushroomBlockAndPOW_Exit:
	RTS

; =============== S U B R O U T I N E =======================================

sub_BANK2_9692:
	LDA ObjectBeingCarriedTimer, X
	BEQ loc_BANK2_969B

	PLA
	PLA
	JMP CarryObject

; ---------------------------------------------------------------------------

loc_BANK2_969B:
	JSR RenderSprite

	LDA ObjectType, X
	CMP #Enemy_POWBlock
	BCS loc_BANK2_96AA

	JSR ObjectTileCollision_SolidBackground

	JMP loc_BANK2_96AD

; ---------------------------------------------------------------------------

loc_BANK2_96AA:
	JSR ObjectTileCollision

loc_BANK2_96AD:
	LDA ObjectProjectileTimer, X
	BEQ EnemyBehavior_MushroomBlockAndPOW_Exit

	JSR ApplyObjectMovement

	PLA
	PLA
	LDA EnemyCollision, X
	PHA
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ loc_BANK2_96D4

	LDA #$00
	STA ObjectXVelocity, X
	LDA ObjectXLo, X
	ADC #$08
	AND #$F0
	STA ObjectXLo, X
	LDA IsHorizontalLevel
	BEQ loc_BANK2_96D4

	LDA ObjectXHi, X
	ADC #$00
	STA ObjectXHi, X

loc_BANK2_96D4:
	PLA
	LDY ObjectYVelocity, X
	BMI locret_BANK2_9718

	AND #CollisionFlags_Down
	BEQ locret_BANK2_9718

	LDA byte_RAM_E
	CMP #$16
	BNE loc_BANK2_96EC

	LDA ObjectXVelocity, X
	BEQ loc_BANK2_96EC

	LDA #$14
	JMP SetObjectYVelocity

; ---------------------------------------------------------------------------

loc_BANK2_96EC:
	LDA ObjectType, X
	CMP #Enemy_POWBlock
	BNE loc_BANK2_96FF

	LDA #$20
	STA POWQuakeTimer
	LDA #SoundEffect3_Rumble_B
	STA SoundEffectQueue3
	JMP sub_BANK2_98C4

; ---------------------------------------------------------------------------

loc_BANK2_96FF:
	LDA ObjectYVelocity, X
	CMP #$16
	BCC loc_BANK2_970D

	JSR ResetObjectYVelocity

	LDA #$F5
	JMP ApplyVelocityYAndHalfObjectVelocityX

; ---------------------------------------------------------------------------

loc_BANK2_970D:
	JSR ResetObjectYVelocity

	LDA EnemyVariable, X
	JSR ReplaceTile

	JMP EnemyDestroy

; ---------------------------------------------------------------------------

locret_BANK2_9718:
	RTS

; End of function sub_BANK2_9692

; ---------------------------------------------------------------------------

EnemyBehavior_SubspaceDoor:
	LDA #$04
	STA ObjectHitbox, X
	LDA #$02
	STA EnemyMovementDirection, X
	LDY SubspaceTimer
	BEQ loc_BANK2_9741

	LDA byte_RAM_10
	AND #$03
	BNE loc_BANK2_9741

	LDY PlayerState
	CPY #PlayerState_Dying
	BEQ loc_BANK2_9741

	DEC SubspaceTimer
	BNE loc_BANK2_9741

	STA InSubspaceOrJar
	JSR DoAreaReset

	JMP loc_BANK2_97FF

; ---------------------------------------------------------------------------

loc_BANK2_9741:
	LDA ObjectTimer2, X
	BNE locret_BANK2_9718

	LDA SubspaceDoorTimer
	BEQ loc_BANK2_9753

	DEC SubspaceDoorTimer
	BNE loc_BANK2_9753

	JMP TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------

loc_BANK2_9753:
	LDA ObjectAttributes, X
	ORA #ObjAttrib_16x32
	STA ObjectAttributes, X
	LDY DoorAnimationTimer
	LDA DoorSpriteAnimation, Y
	LDY #$00
	ASL A
	BCC loc_BANK2_9767

	INY
	STY EnemyMovementDirection, X

loc_BANK2_9767:
	LDA DoorAnimationTimer
	BEQ loc_BANK2_979A

	LDA byte_RAM_F4
	PHA
	JSR FindSpriteSlot

	CPY byte_RAM_F4
	PHP
	LDA EnemyMovementDirection, X
	CMP #$01
	BNE loc_BANK2_977F

	PLA
	EOR #$01
	PHA

loc_BANK2_977F:
	PLP
	BCC loc_BANK2_9784

	STY byte_RAM_F4

loc_BANK2_9784:
	LDA #$7A
	JSR RenderSprite_DrawObject

	LDY byte_RAM_F4
	LDA SpriteDMAArea + 7, Y
	SEC
	SBC #$04
	STA SpriteDMAArea + 7, Y
	STA SpriteDMAArea + $F, Y
	PLA
	STA byte_RAM_F4

loc_BANK2_979A:
	JSR FindSpriteSlot

	CPY byte_RAM_F4
	PHP
	LDA EnemyMovementDirection, X
	CMP #$01
	BNE loc_BANK2_97AA

	PLA
	EOR #$01
	PHA

loc_BANK2_97AA:
	PLP
	BCS loc_BANK2_97AF

	STY byte_RAM_F4

loc_BANK2_97AF:
	LDA DoorAnimationTimer
	CMP #$19
	BCC loc_BANK2_97BA

	LDY #$00
	STY byte_RAM_F4

loc_BANK2_97BA:
	LDA #$76
	LDY EnemyArray_477, X
	BEQ loc_BANK2_97C3

	LDA #$7E

loc_BANK2_97C3:
	JSR RenderSprite_DrawObject

	LDX DoorAnimationTimer
	BEQ loc_BANK2_9805

	INC DoorAnimationTimer
	LDY byte_RAM_F4
	LDA DoorSpriteAnimation, X
	BMI loc_BANK2_9805

	CLC
	ADC SpriteDMAArea + 3, Y
	STA SpriteDMAArea + 3, Y
	STA SpriteDMAArea + $B, Y
	CPX #(DoorSpriteAnimationEnd-DoorSpriteAnimation)
	BNE loc_BANK2_9805

	LDA #$00
	STA DoorAnimationTimer
	JSR DoAreaReset

	LDA TransitionType
	CMP #TransitionType_Door
	BNE loc_BANK2_97F7

	INC DoAreaTransition
	BNE loc_BANK2_97FF

loc_BANK2_97F7:
	LDA InSubspaceOrJar
	EOR #$02
	STA InSubspaceOrJar

loc_BANK2_97FF:
	PLA
	PLA
	PLA
	PLA
	PLA
	PLA

loc_BANK2_9805:
	LDX byte_RAM_12
	RTS


DoorSpriteAnimation:
	.db $00
	.db $01
	.db $01
	.db $02
	.db $02
	.db $03
	.db $04
	.db $06
	.db $08
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $08
	.db $06
	.db $04
	.db $03
	.db $02
	.db $02
	.db $02
	.db $02
	.db $01
	.db $01
	.db $01
	.db $01
	.db $01
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
DoorSpriteAnimationEnd:
	.db $00

; Unused?
	.db $A9
	.db $02
	.db $D0
	.db $06


;
; Note: Door animation code copied from Bank 1
;
; It's here, but seems to be unused?
;
DoorAnimation_Locked_Bank2:
	LDA #$01
	BNE DoorAnimation_Bank2

DoorAnimation_Unlocked_Bank2:
	LDA #$00

DoorAnimation_Bank2:
	PHA
	LDY #$08

DoorAnimation_Loop_Bank2:
	; skip if inactive
	LDA EnemyState, Y
	BEQ DoorAnimation_LoopNext_Bank2

	LDA ObjectType, Y
	CMP #Enemy_SubspaceDoor
	BNE DoorAnimation_LoopNext_Bank2

	LDA #EnemyState_PuffOfSmoke
	STA EnemyState, Y
	LDA #$20
	STA ObjectTimer1, Y

DoorAnimation_LoopNext_Bank2:
	DEY
	BPL DoorAnimation_Loop_Bank2

	JSR CreateEnemy_TryAllSlots

	BMI DoorAnimation_Exit_Bank2

	LDA #$00
	STA DoorAnimationTimer
	STA SubspaceDoorTimer
	LDX byte_RAM_0
	PLA
	STA EnemyArray_477, X
	LDA #Enemy_SubspaceDoor
	STA ObjectType, X
	JSR SetEnemyAttributes

	LDA PlayerXLo
	ADC #$08
	AND #$F0
	STA ObjectXLo, X
	LDA PlayerXHi
	ADC #$00
	STA ObjectXHi, X
	LDA PlayerYLo
	STA ObjectYLo, X
	LDA PlayerYHi
	STA ObjectYHi, X
	LDA #ObjAttrib_Palette1 | ObjAttrib_16x32
	STA ObjectAttributes, X
	LDX byte_RAM_12
	RTS

DoorAnimation_Exit_Bank2:
	PLA
	RTS


ShellSpeed:
	.db $1C
	.db $E4


EnemyBehavior_Shell:
	JSR ObjectTileCollision

	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	LDA EnemyCollision, X
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ EnemyBehavior_Shell_Slide

EnemyBehavior_Shell_Destroy:
	LDA #SoundEffect1_EnemyHit
	STA SoundEffectQueue1
	JMP TurnIntoPuffOfSmoke


EnemyBehavior_Shell_Slide:
	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ EnemyBehavior_Shell_Render

	JSR ResetObjectYVelocity

EnemyBehavior_Shell_Render:
	JSR RenderSprite

	LDY EnemyMovementDirection, X
	LDA ShellSpeed - 1, Y
	STA ObjectXVelocity, X
	JMP ApplyObjectMovement


; =============== S U B R O U T I N E =======================================

sub_BANK2_98C4:
	LDA #EnemyState_BlockFizzle
	STA EnemyState, X
	LDA #$18
	STA ObjectTimer1, X

locret_BANK2_98CC:
	RTS

; End of function sub_BANK2_98C4


;
; Intercepts the normal enemy behavior when the object is being carried
;
EnemyBehavior_CheckBeingCarriedTimerInterrupt:
	LDA ObjectBeingCarriedTimer, X
	BEQ locret_BANK2_98CC

	; Cancel previous subroutine and go into carry mode
	PLA
	PLA
	JMP CarryObject


;
; If ObjectProjectileTimer is set, interrupt the EnemyBehavior subroutine and just
; render the sprite and run physics
;
; Input
;   X = enemy index
;
EnemyBehavior_Check42FPhysicsInterrupt:
	LDA ObjectProjectileTimer, X
	BEQ locret_BANK2_98EA

	PLA
	PLA
	JMP RenderSpriteAndApplyObjectMovement


EnemyInit_FallingLogs:
	JSR EnemyInit_Stationary

	STA ObjectStunTimer, X
	LDA ObjectYLo, X
	STA EnemyVariable, X

locret_BANK2_98EA:
	RTS



; ---------------------------------------------------------------------------

EnemyBehavior_FallingLogs:
	ASL ObjectAttributes, X
	LDA byte_RAM_10
	ASL A
	ASL A
	ASL A
	ASL A
	ROR ObjectAttributes, X
	LDY EnemyArray_B1, X
	BNE loc_BANK2_9919

	; behind background
	LDA ObjectAttributes, X
	ORA #ObjAttrib_BehindBackground
	STA ObjectAttributes, X
	LDA EnemyVariable, X
	SEC
	SBC #$0C
	CMP ObjectYLo, X
	LDA #$FE
	BCC loc_BANK2_9914

	; in front of background
	LDA ObjectAttributes, X
	AND #$DF
	STA ObjectAttributes, X
	INC EnemyArray_B1, X
	LDA #$04

loc_BANK2_9914:
	STA ObjectYVelocity, X
	JMP loc_BANK2_9921

; ---------------------------------------------------------------------------

loc_BANK2_9919:
	LDA byte_RAM_10
	AND #$07
	BNE loc_BANK2_9921

	INC ObjectYVelocity, X

loc_BANK2_9921:
	JSR ApplyObjectPhysicsY

	LDA ObjectYLo, X
	CMP #$F0
	BCC loc_BANK2_9932

	LDA #$00
	STA EnemyArray_B1, X
	LDA EnemyVariable, X
	STA ObjectYLo, X

loc_BANK2_9932:
	JMP RenderSprite

; ---------------------------------------------------------------------------

;
; Kills all enemies on the screen (ie. POW block quake)
;
KillOnscreenEnemies:
	LDA #$00

;
; Destroys all enemies on the screen
;
; Input
;   A = 0 for POW
;
DestroyOnscreenEnemies:
	STA byte_RAM_0
	LDX #$08

DestroyOnscreenEnemies_Loop:
	LDA EnemyState, X
	CMP #EnemyState_Alive
	BNE DestroyOnscreenEnemies_Next

	LDA byte_RAM_0
	BEQ KillOnscreenEnemies_CheckCollision

	LDA ObjectType, X
	CMP #Enemy_Bomb
	BEQ DestroyOnscreenEnemies_DestroyItem

	CMP #Enemy_VegetableSmall
	BCS DestroyOnscreenEnemies_Next

DestroyOnscreenEnemies_DestroyItem:
	LDA HoldingItem
	BEQ DestroyOnscreenEnemies_Poof

	CPX ObjectBeingCarriedIndex
	BNE DestroyOnscreenEnemies_Poof

	LDA #$00
	STA HoldingItem

DestroyOnscreenEnemies_Poof:
	STX byte_RAM_E
	JSR TurnIntoPuffOfSmoke

	LDX byte_RAM_E
	JMP DestroyOnscreenEnemies_Next

KillOnscreenEnemies_CheckCollision:
	LDA EnemyCollision, X
	BEQ DestroyOnscreenEnemies_Next

IFDEF FIX_POW_LOG_GLITCH
	LDA ObjectType, X
	CMP #Enemy_VegetableSmall
	BCS KillOnscreenEnemies_SetCollision
ENDIF

	; BUG: For object that don't follow normal gravity rules, this will send
	; them flying into the air, ie. throwing a POW block from a falling log
	LDA #$D8
	STA ObjectYVelocity, X

KillOnscreenEnemies_SetCollision:
	LDA EnemyCollision, X
	ORA #CollisionFlags_Damage
	STA EnemyCollision, X

DestroyOnscreenEnemies_Next:
	DEX
	BPL DestroyOnscreenEnemies_Loop

	LDX byte_RAM_12
	RTS


;
; Checks whether the enemy is taking mortal damage
;
; If so, play the sound effect, kill the enemy, and cancel the previous enemy
; behavior subroutine.
;
; Input
;   X = enemy index
;
EnemyBehavior_CheckDamagedInterrupt:
	LDA EnemyCollision, X
	AND #CollisionFlags_Damage
	BEQ EnemyBehavior_CheckDamagedInterrupt_Exit

	LDA ObjectBeingCarriedTimer, X
	BEQ EnemyBehavior_CheckDamagedInterrupt_SoundEffect

	; remove the item from the player's hands
	LDA #$00
	STA HoldingItem

EnemyBehavior_CheckDamagedInterrupt_SoundEffect:
	LDY ObjectType, X
	; is this enemy a squawker?
	LDA EnemyArray_46E_Data, Y
	AND #%00001000
	ASL A ; then A = DPCM_BossDeath
	BNE EnemyBehavior_CheckDamagedInterrupt_BossDeathSound

	; normal enemy hit sound
	LDA DPCMQueue
	BNE EnemyBehavior_CheckDamagedInterrupt_CheckPidgit

	LDA #SoundEffect1_EnemyHit
	STA SoundEffectQueue1
	BNE EnemyBehavior_CheckDamagedInterrupt_CheckPidgit

EnemyBehavior_CheckDamagedInterrupt_BossDeathSound:
IFDEF EXPAND_MUSIC
	; `DPCM_BossDeath` index changed, but want to preserve addresses
	JSR EnemyBehavior_BossDeathSound
ELSE
	STA DPCMQueue
ENDIF

EnemyBehavior_CheckDamagedInterrupt_CheckPidgit:
	; killing pidgit leaves a flying carpet behind
	CPY #Enemy_Pidgit
	BNE EnemyBehavior_CheckDamagedInterrupt_SetDead

	LDA ObjectProjectileTimer, X
	BNE EnemyBehavior_CheckDamagedInterrupt_SetDead

	JSR CreateFlyingCarpet

EnemyBehavior_CheckDamagedInterrupt_SetDead:
	LDA #EnemyState_Dead
	STA EnemyState, X
	; interrupt the previous subroutine
	PLA
	PLA

EnemyBehavior_CheckDamagedInterrupt_Exit:
	RTS


EnemyTilemap1:
	; Shyguy
	.db $D0, $D2 ; $00
	.db $D4, $D6 ; $02
	; Wart vegetable? (onion)
	.db $F8, $F8 ; $04
	; Wart vegetable? (tomato)
	.db $FA, $FA ; $06
	; Tweeter
	.db $CC, $CE ; $08
	.db $CC, $CE ; $0A
	; Porcupo
	.db $C8, $CA ; $0C
	.db $C8, $CA ; $0E
	; Snifit
	.db $70, $72 ; $10
	.db $74, $76 ; $12
	; BobOmb
	.db $C0, $C2 ; $14
	.db $C4, $C6 ; $16
	; Albatoss
	.db $E1, $E3 ; $18
	.db $E5, $E7 ; $1A
	.db $E1 ,$E3 ; $1C
	.db $E5 ,$E7 ; $1E
	; Ninji
	.db $78, $7A ; $20
	.db $7C, $7E ; $22
	; Beezo
	.db $DC, $DA ; $24
	.db $DC, $DE ; $26
	; Small vegetable
	.db $FE, $FE ; $28
	; Large vegetable
	.db $FC, $FC ; $2A
	; Unused? (Leftover third vegetable?)
	.db $94 ,$94 ; $2C
	; Shell
	.db $96 ,$96 ; $2E
	; Coin
	.db $98, $98 ; $30
	.db $9A, $9A ; $32
	; Bomb
	.db $DB, $DD ; $34
	.db $DB, $DD ; $36
	; Mushroom block
	.db $7D, $7F ; $38
	; POW block
	.db $C1, $C3 ; $3A
	; Block fizzle
	.db $8C, $8C ; $3C
	.db $8E ,$8E ; $3E
	; Unused?
	.db $E0, $E2 ; $40
	; Falling log
	.db $6B, $6D ; $42
	.db $6D, $6F ; $44
	; Puff of smoke, which can be two sprites tall for doors!
	.db $3A, $3A ; $46
	.db $3A, $3A ; $48
	.db $38, $38 ; $4A
	.db $38, $38 ; $4C
	.db $36, $36 ; $4E
	.db $36, $36 ; $50
	.db $34, $34 ; $52
	.db $34, $34 ; $54
	; Bullet
	.db $AE, $FB ; $56
	.db $AE, $FB ; $58
	; Birdo
	.db $80, $82 ; $5A
	.db $84, $86 ; $5C
	.db $80, $82 ; $5E
	.db $AA, $AC ; $60
	; Birdo (spit)
	.db $88, $8A ; $62
	.db $84, $86 ; $64
	.db $88, $8A ; $66
	.db $AA, $AC ; $68
	; Birdo (hurt)
	.db $BC, $BE ; $6A
	.db $AA ,$AC ; $6C
	.db $BC, $BE ; $6E
	.db $AA, $AC ; $70
	; Egg
	.db $B5, $B9 ; $72
	.db $B5, $B9 ; $74
	; Door
	.db $81, $83 ; $76
	.db $85, $87 ; $78
	; Door opening
	.db $FF, $FF ; $7A
	.db $FF, $FF ; $7C
	; Door with lock
	.db $81, $83 ; $7E
	.db $F5, $87 ; $80
	; Key
	.db $C5, $C7 ; $82
	; Potion
	.db $C9, $CB ; $84
	; Trouter
	.db $92, $94 ; $86
	; Hoopstar
	.db $29, $29 ; $88
	.db $2B, $2B ; $8A
	; Phanto
	.db $3D, $3F ; $8C
	; Hawkmouth (closed top)
	.db $4C, $4E ; $8E
	.db $50, $52 ; $90
	; Hawkmouth (open top)
	.db $4C, $4E ; $92
	.db $56, $58 ; $94
	; Hawkmouth (jaw middle)
	.db $FB, $5C ; $96
	; Hawkmouth (jaw bottom)
	.db $FB, $5A ; $98
	; Hawkmouth (empty space)
	.db $FB, $FB ; $9A
	; Hawkmouth (neck)
	.db $FB, $54 ; $9C
	; Crystal Ball
	.db $CF, $CF ; $9E
	; Mushroom
	.db $A5, $A5 ; $A0
	; 1-Up
	.db $B0, $B2 ; $A2
	; Stopwatch
	.db $90, $90 ; $A4
	; Starman
	.db $CD, $CD ; $A6
	; Fireball
	.db $A8, $A8 ; $A8
	.db $A8, $A8 ; $AA
	; Panser
	.db $A0, $A2 ; $AC
	; Panser (spit)
	.db $A4, $A4 ; $AE
	; Panser (spit?)
	.db $A4, $A4 ; $B0
	;  Sand
	.db $4D, $4D ; $B2
	.db $8C, $8C ; $B4
	; Spark
	.db $A6, $A6 ; $B6
	.db $AB, $AB ; $B8
IFDEF EXPAND_TABLES
	unusedSpace EnemyTilemap1 + $100, $FB
ENDIF

;
; Enemy Animation table
; =====================
;
; These point to the tilemaps offset for an object's animation frames.
;
; There are two tilemaps, which are toggled via bit 4 of `EnemyArray_46E` data.
; See `EnemyArray_46E_Data` to reference the values for each enemy.
;
; $FF is used to make an enemy invisible
;
EnemyAnimationTable:
	.db $00 ; $00 Enemy_Heart
	.db $00 ; $01 Enemy_ShyguyRed
	.db $08 ; $02 Enemy_Tweeter
	.db $00 ; $03 Enemy_ShyguyPink
	.db $0C ; $04 Enemy_Porcupo
	.db $10 ; $05 Enemy_SnifitRed
	.db $10 ; $06 Enemy_SnifitGray
	.db $10 ; $07 Enemy_SnifitPink
	.db $40 ; $08 Enemy_Ostro
	.db $14 ; $09 Enemy_BobOmb
	.db $18 ; $0A Enemy_AlbatossCarryingBobOmb
	.db $18 ; $0B Enemy_AlbatossStartRight
	.db $18 ; $0C Enemy_AlbatossStartLeft
	.db $20 ; $0D Enemy_NinjiRunning
	.db $20 ; $0E Enemy_NinjiJumping
	.db $24 ; $0F Enemy_BeezoDiving
	.db $24 ; $10 Enemy_BeezoStraight
	.db $BE ; $11 Enemy_WartBubble
	.db $00 ; $12 Enemy_Pidgit
	.db $86 ; $13 Enemy_Trouter
	.db $88 ; $14 Enemy_Hoopstar
	.db $FF ; $15 Enemy_JarGeneratorShyguy
	.db $FF ; $16 Enemy_JarGeneratorBobOmb
	.db $8C ; $17 Enemy_Phanto
	.db $5C ; $18 Enemy_CobratJar
	.db $5C ; $19 Enemy_CobratSand
	.db $6C ; $1A Enemy_Pokey
	.db $56 ; $1B Enemy_Bullet
	.db $5A ; $1C Enemy_Birdo
	.db $14 ; $1D Enemy_Mouser
	.db $72 ; $1E Enemy_Egg
	.db $00 ; $1F Enemy_Tryclyde
	.db $A8 ; $20 Enemy_Fireball
	.db $00 ; $21 Enemy_Clawgrip
	.db $D6 ; $22 Enemy_ClawgripRock
	.db $AC ; $23 Enemy_PanserStationaryFiresAngled
	.db $AC ; $24 Enemy_PanserWalking
	.db $AC ; $25 Enemy_PanserStationaryFiresUp
	.db $74 ; $26 Enemy_Autobomb
	.db $7A ; $27 Enemy_AutobombFire
	.db $92 ; $28 Enemy_WhaleSpout
	.db $9A ; $29 Enemy_Flurry
	.db $80 ; $2A Enemy_Fryguy
	.db $90 ; $2B Enemy_FryguySplit
	.db $00 ; $2C Enemy_Wart
	.db $00 ; $2D Enemy_HawkmouthBoss
	.db $B6 ; $2E Enemy_Spark1
	.db $B6 ; $2F Enemy_Spark2
	.db $B6 ; $30 Enemy_Spark3
	.db $B6 ; $31 Enemy_Spark4
	.db $28 ; $32 Enemy_VegetableSmall
	.db $2A ; $33 Enemy_VegetableLarge
	.db $2C ; $34 Enemy_VegetableWart
	.db $2E ; $35 Enemy_Shell
	.db $30 ; $36 Enemy_Coin
	.db $34 ; $37 Enemy_Bomb
	.db $00 ; $38 Enemy_Rocket
	.db $38 ; $39 Enemy_MushroomBlock
	.db $3A ; $3A Enemy_POWBlock
	.db $42 ; $3B Enemy_FallingLogs
	.db $82 ; $3C Enemy_SubspaceDoor
	.db $82 ; $3D Enemy_Key
	.db $84 ; $3E Enemy_SubspacePotion
	.db $A0 ; $3F Enemy_Mushroom
	.db $A2 ; $40 Enemy_Mushroom1up
	.db $04 ; $41 Enemy_FlyingCarpet
	.db $8E ; $42 Enemy_HawkmouthRight
	.db $8E ; $43 Enemy_HawkmouthLeft
	.db $9E ; $44 Enemy_CrystalBall
	.db $A6 ; $45 Enemy_Starman
	.db $A4 ; $46 Enemy_Stopwatch


;
; Sets the temporary screen x- and y-position for the current object.
;
; If the object is being carried by the player (and it's not the Princess),
; this will bob the y-position along with the player animation.
;
SetSpriteTempScreenPosition:
	LDA ObjectYLo, X
	CLC
	SBC ScreenYLo
	LDY ObjectBeingCarriedTimer, X
	BEQ SetSpriteTempScreenPosition_Update

	LDY PlayerAnimationFrame
	BNE SetSpriteTempScreenPosition_Update

	; Skip making the carried object bob if playing as the Princess
	LDY CurrentCharacter
	DEY
	BEQ SetSpriteTempScreenPosition_Update

	SEC
	SBC #$01

SetSpriteTempScreenPosition_Update:
	STA SpriteTempScreenY
	LDA ObjectXLo, X
	SEC
	SBC ScreenBoundaryLeftLo
	STA SpriteTempScreenX

	RTS


RenderSprite_Birdo:
	LDA EnemyState, X
	CMP #EnemyState_Alive
	BNE loc_BANK2_9AE2

	LDA ObjectFlashTimer, X
	BEQ loc_BANK2_9AE6

loc_BANK2_9AE2:
	LDA #$6A
	BNE loc_BANK2_9AEC

loc_BANK2_9AE6:
	LDA ObjectTimer1, X
	BEQ loc_BANK2_9AEF

	LDA #$62

loc_BANK2_9AEC:
	JMP RenderSprite_DrawObject

; ---------------------------------------------------------------------------

loc_BANK2_9AEF:
	JMP RenderSprite_NotAlbatoss


RenderSprite_Albatoss:
	LDA byte_RAM_EE
	PHA
	JSR RenderSprite_NotAlbatoss

	PLA
	ASL A
	STA byte_RAM_EE
	LDA EnemyArray_B1, X
	ORA byte_RAM_EF
	BNE RenderSprite_Invisible

	LDA SpriteTempScreenX
	ADC #$08
	STA byte_RAM_1
	LDA EnemyMovementDirection, X
	STA byte_RAM_2
	LDA #$01
	STA byte_RAM_3
	STA byte_RAM_5
	JSR FindSpriteSlot

	LDX #$14
	JMP loc_BANK2_9C7A


; =============== S U B R O U T I N E =======================================

;
; Renders a sprite for an object based on the enemy animation table lookup
;
; There are a lot of special cases basd on ObjectType
;
; Input
;   X = enemy index
;
RenderSprite:
	LDY ObjectType, X
	LDA EnemyAnimationTable, Y
	CMP #$FF
	BEQ RenderSprite_Invisible

	CPY #Enemy_Mouser
	BNE RenderSprite_NotMouser

	JMP RenderSprite_Mouser

RenderSprite_NotMouser:
	CPY #Enemy_Clawgrip
	BNE RenderSprite_NotClawgrip

	JMP RenderSprite_Clawgrip

RenderSprite_NotClawgrip:
	CPY #Enemy_ClawgripRock
	BNE RenderSprite_NotClawgripRock

	JMP RenderSprite_ClawgripRock

RenderSprite_NotClawgripRock:
	CPY #Enemy_HawkmouthBoss
	BNE RenderSprite_NotHawkmouthBoss

	JMP RenderSprite_HawkmouthBoss

RenderSprite_Invisible:
	RTS

RenderSprite_NotHawkmouthBoss:
	CPY #Enemy_Pidgit
	BNE RenderSprite_NotPidgit

	JMP RenderSprite_Pidgit

RenderSprite_NotPidgit:
	CPY #Enemy_Porcupo
	BNE RenderSprite_NotPorcupo

	JMP RenderSprite_Porcupo

RenderSprite_NotPorcupo:
	CPY #Enemy_VegetableLarge
	BNE RenderSprite_NotVegetableLarge

	JMP RenderSprite_VegetableLarge

RenderSprite_NotVegetableLarge:
	CPY #Enemy_Autobomb
	BNE RenderSprite_NotAutobomb

	JMP RenderSprite_Autobomb

RenderSprite_NotAutobomb:
	CPY #Enemy_Fryguy
	BNE RenderSprite_NotFryguy

	JMP RenderSprite_Fryguy

RenderSprite_NotFryguy:
	CPY #Enemy_HawkmouthLeft
	BNE RenderSprite_NotHawkmouthLeft

	JMP RenderSprite_HawkmouthLeft

RenderSprite_NotHawkmouthLeft:
	CPY #Enemy_Wart
	BNE RenderSprite_NotWart

	JMP RenderSprite_Wart

RenderSprite_NotWart:
	CPY #Enemy_WhaleSpout
	BNE RenderSprite_NotWhaleSpout

	JMP RenderSprite_WhaleSpout

RenderSprite_NotWhaleSpout:
	CPY #Enemy_Pokey
	BNE RenderSprite_NotPokey

	JMP RenderSprite_Pokey

RenderSprite_NotPokey:
	CPY #Enemy_Heart
	BNE RenderSprite_NotHeart

	; This jump appears to never be taken;
	; I don't think this code even runs with an enemy ID of 0 (heart)
	JMP RenderSprite_Heart

RenderSprite_NotHeart:
	CPY #Enemy_Ostro
	BNE RenderSprite_NotOstro

	JMP RenderSprite_Ostro

RenderSprite_NotOstro:
	CPY #Enemy_Tryclyde
	BNE RenderSprite_NotTryclyde

	JMP RenderSprite_Tryclyde

RenderSprite_NotTryclyde:
	CPY #Enemy_Birdo
	BNE RenderSprite_NotBirdo

	JMP RenderSprite_Birdo

RenderSprite_NotBirdo:
	CPY #Enemy_AlbatossCarryingBobOmb
	BCC RenderSprite_NotAlbatoss

	CPY #Enemy_NinjiRunning
	BCS RenderSprite_NotAlbatoss

	JMP RenderSprite_Albatoss

RenderSprite_NotAlbatoss:
	LDY ObjectType, X
	CPY #Enemy_Rocket
	BNE RenderSprite_NotRocket

	JMP RenderSprite_Rocket

RenderSprite_NotRocket:
	LDA EnemyAnimationTable, Y


;
; Draws an object to the screen
;
; Input
;   A = tile index
;   X = enemy index
;   byte_RAM_EE = sprite clipping
;   byte_RAM_EF = whether the enemy should be invisible
;   byte_RAM_F4 = sprite slot offset
;   SpriteTempScreenX = screen x-position
;   SpriteTempScreenY = screen y-position
;
RenderSprite_DrawObject:
	STA byte_RAM_F
	LDA byte_RAM_EF
	BNE RenderSprite_Invisible

	; tilemap switcher
	LDA EnemyArray_46E, X
	AND #%00010000
	STA byte_RAM_B
	LDY EnemyMovementDirection, X
	LDA ObjectAttributes, X
	AND #ObjAttrib_FrontFacing | ObjAttrib_Mirrored
	BEQ loc_BANK2_9BD2

	LDY #$02
	LDA InSubspaceOrJar
	CMP #$02
	BNE loc_BANK2_9BD2

	DEY

loc_BANK2_9BD2:
	STY byte_RAM_2
	LDA ObjectAttributes, X
	AND #ObjAttrib_16x32 | ObjAttrib_Horizontal
	STA byte_RAM_5
	LDA SpriteTempScreenY
	STA byte_RAM_0
	LDA #$00
	STA byte_RAM_D
	LDA ObjectShakeTimer, X
	AND #$02
	LSR A
	LDY byte_RAM_EE
	BEQ loc_BANK2_9BEF

	LDA #$00

loc_BANK2_9BEF:
	ADC SpriteTempScreenX
	STA byte_RAM_1
	LDA ObjectAttributes, X
	AND #ObjAttrib_UpsideDown | ObjAttrib_BehindBackground | ObjAttrib_Palette
	LDY ObjectFlashTimer, X
	BEQ loc_BANK2_9C07

	AND #ObjAttrib_UpsideDown | ObjAttrib_BehindBackground
	STA byte_RAM_8
	TYA
	LSR A
	AND #$03
	ORA byte_RAM_8

loc_BANK2_9C07:
	STA byte_RAM_3
	LDA EnemyArray_46E, X
	STA byte_RAM_C
	ASL A
	LDA ObjectAnimationTimer, X
	LDX byte_RAM_F
	AND #$08
	BEQ loc_BANK2_9C31

	BCC loc_BANK2_9C1F

	LDA #$01
	STA byte_RAM_2
	BNE loc_BANK2_9C31

loc_BANK2_9C1F:
	INX
	INX
	LDA byte_RAM_5
	AND #$40
	BEQ loc_BANK2_9C31

	INX
	INX
	LDA byte_RAM_C
	AND #$20
	BEQ loc_BANK2_9C31

	INX
	INX

loc_BANK2_9C31:
	LDY byte_RAM_F4
	LDA byte_RAM_5
	AND #$40
	BEQ loc_BANK2_9C7A

	LDA byte_RAM_5
	AND #$04
	BEQ loc_BANK2_9C53

	LDA byte_RAM_EE
	STA byte_RAM_8
	LDA byte_RAM_2
	CMP #$01
	BNE loc_BANK2_9C53

	LDA byte_RAM_1
	ADC #$0F
	STA byte_RAM_1
	ASL byte_RAM_EE
	ASL byte_RAM_EE

loc_BANK2_9C53:
	JSR SetSpriteTiles

	LDA byte_RAM_5
	AND #$04
	BEQ loc_BANK2_9C7A

	LDA SpriteTempScreenY
	STA byte_RAM_0
	LDA SpriteTempScreenX
	STA byte_RAM_1
	LDA byte_RAM_8
	STA byte_RAM_EE
	LDA byte_RAM_2
	CMP #$01
	BEQ loc_BANK2_9C7A

	LDA byte_RAM_1
	ADC #$0F
	STA byte_RAM_1
	ASL byte_RAM_EE
	ASL byte_RAM_EE

loc_BANK2_9C7A:
	JSR SetSpriteTiles

	LDY byte_RAM_F4
	LDA byte_RAM_5
	CMP #$40
	BNE loc_BANK2_9CD9

	LDA byte_RAM_3
	BPL loc_BANK2_9CD9

	LDA byte_RAM_C
	AND #$20
	BEQ loc_BANK2_9CBD

	LDX byte_RAM_D
	LDA SpriteDMAArea + $00, X
	PHA
	LDA SpriteDMAArea + $00, Y
	STA SpriteDMAArea + $00, X
	PLA

loc_BANK2_9C9C:
	STA SpriteDMAArea + $00, Y
	LDA SpriteDMAArea + $04, X
	PHA
	LDA SpriteDMAArea + $04, Y
	STA SpriteDMAArea + $04, X
	PLA
	STA SpriteDMAArea + $04, Y
	LDA SpriteDMAArea + $08, X
	PHA
	LDA SpriteDMAArea + $08, Y
	STA SpriteDMAArea + $08, X
	PLA
	STA SpriteDMAArea + $08, Y
	BCS loc_BANK2_9CD9

loc_BANK2_9CBD:
	LDA SpriteDMAArea, Y
	PHA
	LDA SpriteDMAArea + $08, Y
	STA SpriteDMAArea + $00, Y
	PLA
	STA SpriteDMAArea + $08, Y
	LDA SpriteDMAArea + $04, Y
	PHA
	LDA SpriteDMAArea + $0C, Y
	STA SpriteDMAArea + $04, Y
	PLA
	STA SpriteDMAArea + $0C, Y

loc_BANK2_9CD9:
	LDX byte_RAM_12
	LDA ObjectAttributes, X
	AND #ObjAttrib_Mirrored
	BEQ locret_BANK2_9CF1

	LDA byte_RAM_3
	STA SpriteDMAArea + $02, Y
	STA SpriteDMAArea + $0A, Y
	ORA #$40
	STA SpriteDMAArea + $06, Y
	STA SpriteDMAArea + $0E, Y

locret_BANK2_9CF1:
	RTS


;
; Sets tiles for an object
;
; Input
;   X = tilemap offset
;   Y = sprite slot offset
;   byte_RAM_0 = screen y-offset
;   byte_RAM_1 = screen x-offset
;   byte_RAM_2 = sprite direction: $00 for left, $02 for right
;   byte_RAM_B = use EnemyTilemap2
;   byte_RAM_C = use 24x16 mode when set to $20
;   byte_RAM_EE = used for horizontal clipping/wrapping
; Output
;   X = next tilemap offset
;   Y = next sprite slot offset
;
SetSpriteTiles:
	LDA byte_RAM_C
	AND #$20
	BNE SetSpriteTiles_24x16

	LDA byte_RAM_B
	BNE SetSpriteTiles_Tilemap2

SetSpriteTiles_Tilemap1:
	LDA EnemyTilemap1, X
	STA SpriteDMAArea + 1, Y
	LDA EnemyTilemap1 + 1, X
	STA SpriteDMAArea + 5, Y
	BNE SetSpriteTiles_CheckDirection

SetSpriteTiles_Tilemap2:
	LDA EnemyTilemap2, X
	STA SpriteDMAArea + 1, Y
	LDA EnemyTilemap2 + 1, X
	STA SpriteDMAArea + 5, Y

SetSpriteTiles_CheckDirection:
	LDA byte_RAM_2
	LSR A
	LDA #$00
	BCC SetSpriteTiles_Left

SetSpriteTiles_Right:
	LDA SpriteDMAArea + 1, Y
	PHA
	LDA SpriteDMAArea + 5, Y
	STA SpriteDMAArea + 1, Y
	PLA
	STA SpriteDMAArea + 5, Y
	LDA #$40

SetSpriteTiles_Left:
	ORA byte_RAM_3
	STA SpriteDMAArea + 2, Y
	STA SpriteDMAArea + 6, Y
	LDA #$F8
	STA SpriteDMAArea, Y
	STA SpriteDMAArea + 4, Y

	LDA byte_RAM_EE
	AND #$08
	BNE loc_BANK2_9D48

	LDA byte_RAM_0
	STA SpriteDMAArea, Y

loc_BANK2_9D48:
	LDA byte_RAM_EE
	AND #$04
	BNE loc_BANK2_9D53

	LDA byte_RAM_0
	STA SpriteDMAArea + 4, Y

loc_BANK2_9D53:
	LDA byte_RAM_0
	CLC
	ADC #$10
	STA byte_RAM_0
	LDA byte_RAM_1
	STA SpriteDMAArea + 3, Y
	CLC
	ADC #$08
	STA SpriteDMAArea + 7, Y
	TYA
	CLC
	ADC #$08
	TAY
	INX
	INX
	RTS

SetSpriteTiles_24x16:
	LDA EnemyTilemap2, X
	STA SpriteDMAArea + 1, Y
	LDA EnemyTilemap2 + 1, X
	STA SpriteDMAArea + 5, Y
	LDA EnemyTilemap2 + 2, X
	STA SpriteDMAArea + 9, Y

	LDA byte_RAM_2
	LSR A
	LDA #$00
	BCC SetSpriteTiles_24x16_Left

SetSpriteTiles_24x16_Right:
	LDA SpriteDMAArea + 1, Y
	PHA
	LDA SpriteDMAArea + 9, Y
	STA SpriteDMAArea + 1, Y
	PLA
	STA SpriteDMAArea + 9, Y
	LDA #$40

SetSpriteTiles_24x16_Left:
	ORA byte_RAM_3
	STA SpriteDMAArea + 2, Y
	STA SpriteDMAArea + 6, Y
	STA SpriteDMAArea + $A, Y
	LDA #$F8
	STA SpriteDMAArea, Y
	STA SpriteDMAArea + 4, Y
	STA SpriteDMAArea + 8, Y

	LDA byte_RAM_EE
	AND #$08
	BNE loc_BANK2_9DB7

	LDA byte_RAM_0
	STA SpriteDMAArea, Y

loc_BANK2_9DB7:
	LDA byte_RAM_EE
	AND #$04
	BNE loc_BANK2_9DC2

	LDA byte_RAM_0
	STA SpriteDMAArea + 4, Y

loc_BANK2_9DC2:
	LDA byte_RAM_EE
	AND #$02
	BNE loc_BANK2_9DCD

	LDA byte_RAM_0
	STA SpriteDMAArea + 8, Y

loc_BANK2_9DCD:
	LDA byte_RAM_0
	CLC
	ADC #$10
	STA byte_RAM_0
	LDA byte_RAM_1
	STA SpriteDMAArea + 3, Y
	ADC #$08
	STA SpriteDMAArea + 7, Y
	ADC #$08
	STA SpriteDMAArea + $B, Y
	TXA
	PHA
	JSR FindSpriteSlot

	PLA
	TAX
	LDA byte_RAM_D
	BNE loc_BANK2_9DF0

	STY byte_RAM_D

loc_BANK2_9DF0:
	INX
	INX
	INX

	RTS


UNUSED_PorcupoOffset:
	.db $04
	.db $00
PorcupoOffsetXRight:
	.db $FF
	.db $FF
	.db $00
	.db $00
PorcupoOffsetXLeft:
	.db $01
	.db $01
	.db $00
	.db $00
PorcupoOffsetYRight:
	.db $01
	.db $00
	.db $00
	.db $01
PorcupoOffsetYLeft:
	.db $01
	.db $00
	.db $00
	.db $01


RenderSprite_Porcupo:
	JSR RenderSprite_NotAlbatoss

	LDA byte_RAM_EE
	AND #$0C
	BNE locret_BANK2_9E3A

	LDA ObjectAnimationTimer, X
	AND #$0C
	LSR A
	LSR A
	STA byte_RAM_0
	LDA EnemyMovementDirection, X
	TAX
	LDA PorcupoOffsetXRight - 3, X
	ADC byte_RAM_F4
	TAY
	TXA
	ASL A
	ASL A
	ADC byte_RAM_0
	TAX
	LDA SpriteDMAArea, Y
	ADC PorcupoOffsetYRight - 4, X
	STA SpriteDMAArea, Y
	LDA SpriteDMAArea + 3, Y
	ADC PorcupoOffsetXRight - 4, X
	STA SpriteDMAArea + 3, Y
	LDX byte_RAM_12

locret_BANK2_9E3A:
	RTS


;
; Compares our position to the player's and returns
;
; Ouput
;   Y = 1 when player is to the left, 0 when player is to the right
;
EnemyFindWhichSidePlayerIsOn:
	LDA PlayerXLo
	SBC ObjectXLo, X
	STA byte_RAM_F
	LDA PlayerXHi
	LDY #$00
	SBC ObjectXHi, X
	BCS EnemyFindWhichSidePlayerIsOn_Exit

	INY

EnemyFindWhichSidePlayerIsOn_Exit:
	RTS


;
; Applies object physics for the y-axis
;
; Input
;   X = enemy index
;
ApplyObjectPhysicsY:
	TXA
	CLC
	ADC #$0A
	TAX

;
; Applies object physics for the x-axis
;
; Input
;   X = enemy index, physics direction
;       ($00-$09 for horizontal, $0A-$13 for vertical)
;
; Output
;   X = RAM_12
;
ApplyObjectPhysicsX:
	; Add acceleration to velocity
	LDA ObjectXVelocity, X
	CLC
	ADC ObjectXAcceleration, X

	PHA
	; Lower nybble of velocity is for subpixel position
	ASL A
	ASL A
	ASL A
	ASL A
	STA byte_RAM_1

	; Upper nybble of velocity is for lo position
	PLA
	LSR A
	LSR A
	LSR A
	LSR A

	CMP #$08
	BCC ApplyObjectPhysics_StoreVelocityLo

	; Left/up: Carry negative bits through upper nybble
	ORA #$F0

ApplyObjectPhysics_StoreVelocityLo:
	STA byte_RAM_0

	LDY #$00
	ASL A
	BCC ApplyObjectPhysics_StoreDirection

	; Left/up
	DEY

ApplyObjectPhysics_StoreDirection:
	STY byte_RAM_2

	; Add lower nybble of velocity for subpixel position
	LDA ObjectXSubpixel, X
	CLC
	ADC byte_RAM_1
	STA ObjectXSubpixel, X

	; Add upper nybble of velocity for lo position
	LDA ObjectXLo, X
	ADC byte_RAM_0
	STA ObjectXLo, X

	ROL byte_RAM_1

	; X < 10 is horizontal physics, X >= 10 is vertical physics
	CPX #$0A
	BCS ApplyObjectPhysics_PositionHi

ApplyObjectPhysics_HorizontalSpecialCases:
	LDA #$00
	STA ObjectNonSticky, X
	LDA ObjectType, X
	CMP #Enemy_Bullet
	BEQ ApplyObjectPhysics_PositionHi

	CMP #Enemy_BeezoDiving
	BEQ ApplyObjectPhysics_PositionHi

	CMP #Enemy_BeezoStraight
	BEQ ApplyObjectPhysics_PositionHi

	LDY IsHorizontalLevel
	BEQ ApplyObjectPhysics_Exit

ApplyObjectPhysics_PositionHi:
	LSR byte_RAM_1
	LDA ObjectXHi, X
	ADC byte_RAM_2
	STA ObjectXHi, X

ApplyObjectPhysics_Exit:
	LDX byte_RAM_12
	RTS


EnemyBehavior_TurnAround:
	; flip x-velocity
	LDA ObjectXVelocity, X
	EOR #$FF
	CLC
	ADC #$01
	STA ObjectXVelocity, X
	; if the enemy is not moving, flip direction next
	BEQ EnemyBehavior_TurnAroundExit

	; flip enemy movement direction
	LDA EnemyMovementDirection, X
	EOR #$03 ; $01 XOR $03 = $02, $02 XOR $03 = $01
	STA EnemyMovementDirection, X

EnemyBehavior_TurnAroundExit:
	JMP ApplyObjectPhysicsX


IFDEF EXPAND_MUSIC
EnemyBehavior_BossDeathSound:
	LDA #DPCM_BossDeath
	STA DPCMQueue
	RTS
ENDIF

; Unused space in the original ($9EBD - $A02F)
unusedSpace $A030, $FF


EnemyTilemap2:
; Pidgit
	.db $2D, $2F ; $00
	.db $2D, $2F ; $02
	; Flying carpet
	.db $E0, $E2 ; $04
	.db $E4, $E6 ; $06
	.db $E0, $E2 ; $08
	.db $E4, $E6 ; $0A
	.db $E8, $EA ; $0C
	.db $EC, $EE ; $0E
	.db $E8, $EA ; $10
	.db $EC, $EE ; $12
	; Mouser (3-tiles wide)
	.db $01, $03, $09 ; $14
	.db $05, $07, $0B ; $17
	.db $0D, $0F, $15 ; $1A
	.db $11, $13, $17 ; $1D
	; Mouser (throw)
	.db $01, $03, $09 ; $20
	.db $05, $19, $1B ; $23
	.db $01, $03, $09 ; $26
	.db $05, $19, $1B ; $29
	; Mouser (hurt)
	.db $1D, $1F, $25 ; $2C
	.db $21, $23, $27 ; $2F
	.db $1D, $1F, $25 ; $32
	.db $21, $23, $27 ; $35
	; Mouser bomb
	.db $9C, $9E ; $38
	.db $9C, $9E ; $3A
	; Ostro Shyguy
	.db $D0, $D2 ; $3C
	.db $D4, $D6 ; $3E
	; Ostro
	.db $F0, $F2 ; $40
	.db $F4, $F6 ; $42
	.db $F0, $F2 ; $44
	.db $F8, $FA ; $46
	; Tryclyde upper body
	.db $0F, $11 ; $48
	.db $13, $15 ; $4A
	; Tryclyde upper body (hurt)
	.db $1F, $11 ; $4C
	.db $13, $15 ; $4E
	; Tryclyde lower body (tail up)
	.db $17, $19, $1B ; $50
	; Tryclyde lower body (tail down)
	.db $17, $19, $1D ; $53
	; Tryclyde head (hurt)
	.db $09, $0B ; $56
	; Tryclyde head
	.db $01, $03 ; $58
	; Tryclyde head (spit)
	.db $05, $07 ; $5A
	; Cobrat
	.db $55, $59 ; $5C
	.db $5B, $5D ; $5E
	.db $F0, $F2 ; $60
	.db $F4, $F6 ; $62
	; Cobrat (spit)
	.db $45, $59 ; $64
	.db $5B, $5D ; $66
	.db $45, $59 ; $68
	.db $5B, $5D ; $6A
	; Pokey
	.db $E8, $EA ; $6C
	.db $EC, $EE ; $6E
	.db $EC, $EE ; $70
	.db $EC, $EE ; $72
	; Autobomb
	.db $F0, $F2 ; $74
	.db $F0, $F2 ; $76
	.db $F4, $F6 ; $78
	; Autobomb Fire
	.db $F8, $FA ; $7A
	; Autobomb Shyguy
	.db $D0, $D2 ; $7C
	.db $D4, $D6 ; $7E
	; Fryguy
	.db $01, $03 ; $80
	.db $05, $07 ; $82
	.db $09, $0B ; $84
	.db $0D, $0F ; $86
	; Fryguy (hurt)
	.db $01, $11 ; $88
	.db $05, $15 ; $8A
	.db $13, $0B ; $8C
	.db $17, $0F ; $8E
	; Fryguy split
	.db $19,$1B ; $90
	; Whale spout
	.db $2D, $2F ; $92
	; Whale spout (falling)
	.db $3A, $3A ; $94
	; Rocket
	.db $E0, $E2 ; $96
	.db $E4, $E6 ; $98
	; Flurry
	.db $E8, $EA ; $9A
	.db $EC, $EE ; $9C
	; Wart top
	.db $01, $03, $05, $07 ; $9E
	; Wart top (spit)
	.db $4F, $5D, $05, $07 ; $A2
	; Wart middle
	.db $09, $0B, $0D, $0F ; $A6
	; Wart middle (spit)
	.db $27, $79, $7B, $2D ; $AA
	; Wart top (hurt)
	.db $4F, $2F, $45, $55 ; $AE
	; Wart bottom (left foot up)
	.db $11, $13, $15, $17 ; $B2
	; Wart bottom (right foot up)
	.db $1F, $21, $23, $25 ; $B6
	; Wart bottom (standing)
	.db $11, $13, $23, $25 ; $BA
	; Wart bubble
	.db $59, $59 ; $BE
	.db $5B, $5B ; $C0
	; Clawgrip (claw down)
	.db $01, $03 ; $C2
	.db $05, $07 ; $C4
	; Clawgrip (claw up)
	.db $09, $0B ; $C6
	.db $0D, $0F ; $C8
	; Clawgrip (reach)
	.db $FB, $11 ; $CA
	.db $15, $17 ; $CC
	.db $13, $FB ; $CE
	.db $19, $1B ; $D0
	; Clawgrip (pain)
	.db $1D, $1F ; $D2
	.db $21, $23 ; $D4
	; Clawgrip Rock
	.db $25, $27 ; $D6
	.db $25, $27 ; $D8
IFDEF EXPAND_TABLES
	unusedSpace EnemyTilemap2 + $100, $FB
ENDIF


EnemyInit_Clawgrip:
	JSR EnemyInit_Birdo

IFDEF RESET_CHR_LATCH
	LDA #$03
	JSR SetBossTileset
ENDIF

	LDA #$04
	STA EnemyHP, X
	LDA #$00
	STA ObjectXVelocity, X
	LDA ObjectXLo, X
	CLC
	ADC #$04
	STA ObjectXLo, X
	JMP SetEnemyAttributes


ClawgripRock_ThrowVelocityY:
	.db $C8
	.db $D0
	.db $E0
	.db $F0
	.db $00
	.db $10
	.db $20
	.db $C8

ClawgripRock_JumpVelocityY:
	.db $DC
	.db $E2
	.db $E8
	.db $F0
	.db $F8
	.db $E8
	.db $DC
	.db $DC


EnemyBehavior_Clawgrip:
	LDA ObjectFlashTimer, X
	ORA ObjectStunTimer, X
	BEQ loc_BANK3_A13B

	JMP RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_A13B:
	JSR EnemyBehavior_CheckDamagedInterrupt

	LDA ObjectYLo, X
	CMP #$70
	BCC loc_BANK3_A147

	JSR ResetObjectYVelocity

loc_BANK3_A147:
	LDA ObjectTimer1, X
	BNE loc_BANK3_A179

	LDA EnemyVariable, X
	AND #$3F
	BNE loc_BANK3_A168

	LDA PseudoRNGValue
	AND #$03
	BEQ loc_BANK3_A168

	LDY ScreenBoundaryLeftLo
	DEY
	CPY #$80
	BCC loc_BANK3_A168

	LDA #$7F
	STA ObjectTimer1, X
	LDY #$00
	BEQ loc_BANK3_A174

loc_BANK3_A168:
	INC EnemyVariable, X
	LDY #$F0
	LDA EnemyVariable, X
	AND #$20
	BEQ loc_BANK3_A174

	LDY #$10

loc_BANK3_A174:
	STY ObjectXVelocity, X
	JMP loc_BANK3_A1CD

; ---------------------------------------------------------------------------

loc_BANK3_A179:
	CMP #$50
	BNE loc_BANK3_A17D

loc_BANK3_A17D:
	CMP #$20
	BNE loc_BANK3_A1CD

	; Set jump velocity of Clawgrip
	LDA PseudoRNGValue
	AND #$07
	TAY
	LDA ClawgripRock_JumpVelocityY, Y
	STA ObjectYVelocity, X
	DEC ObjectYLo, X
	JSR CreateEnemy

	BMI loc_BANK3_A1CD

	; Set y-position of rock
	LDY byte_RAM_0
	LDA ObjectYLo, X
	SEC
	SBC #$00
	STA ObjectYLo, Y

	LDA ObjectYHi, X
	SBC #$00
	STA ObjectYHi, Y

	; Set x-position of rock
	LDA ObjectXLo, X
	CLC
	ADC #$08
	STA ObjectXLo, Y

	LDA ObjectXHi, X
	ADC #$00
	STA ObjectXHi, Y

	; Set object type of rock
	LDX byte_RAM_0
	LDA #Enemy_ClawgripRock
	STA ObjectType, X

	; Set y-velocity of rock
	LDA PseudoRNGValue
	AND #$07
	TAY
	LDA ClawgripRock_ThrowVelocityY, Y
	STA ObjectYVelocity, X

	; Set x-velocity of rock
	LDA #$D0
	STA ObjectXVelocity, X
	JSR SetEnemyAttributes

	LDX byte_RAM_12

loc_BANK3_A1CD:
	JSR ApplyObjectPhysicsX

	JSR ApplyObjectMovement_Vertical

loc_BANK3_A1D3:
	JMP RenderSprite


ClawgripRockPositionX:
	.db $08 ; hoisting
	.db $08 ; holding low
	.db $1C ; reaching

ClawgripRockPositionY:
	.db $F4 ; hoisting
	.db $11 ; holding low
	.db $0F ; reaching

ClawgripRockHoistOffset:
	.db $04
	.db $06
	.db $08
	.db $08
	.db $08
	.db $08
	.db $06
	.db $04


RenderSprite_Clawgrip:
	LDA_abs byte_RAM_F4

	; store sprite slot
	STA EnemyArray_B1, X
	LDY EnemyState, X
	DEY
	TYA
	ORA ObjectFlashTimer, X
	BEQ loc_BANK3_A1FA

	; Left side, pain
	LDY #$D2
	LDA #$00
	STA ObjectTimer1, X
	BEQ loc_BANK3_A21C

loc_BANK3_A1FA:
	; Left side, claw down
	LDY #$C2
	LDA byte_RAM_10
	AND #$10
	BNE loc_BANK3_A204

	; Left side, claw up
	LDY #$C6
loc_BANK3_A204:
	LDA ObjectTimer1, X
	BEQ loc_BANK3_A21C

	LDY #$CA
	CMP #$60
	BCS loc_BANK3_A21C

	LDY #$C2
	CMP #$40
	BCS loc_BANK3_A21C

	LDY #$C6
	CMP #$20
	BCS loc_BANK3_A21C

	LDY #$C2
loc_BANK3_A21C:
	LDA #$02
	STA EnemyMovementDirection, X
	TYA
	JSR RenderSprite_DrawObject

RenderSprite_Clawgrip_RightSide:
	LDY #$C6
	LDA byte_RAM_10
	AND #$10
	BNE loc_BANK3_A22E

	LDY #$C2

loc_BANK3_A22E:
	LDA ObjectTimer1, X
	BEQ loc_BANK3_A246

	LDY #$CE
	CMP #$60
	BCS loc_BANK3_A246

	LDY #$C2
	CMP #$40
	BCS loc_BANK3_A246

	LDY #$C6
	CMP #$20
	BCS loc_BANK3_A246

	LDY #$C2

loc_BANK3_A246:
	LDA ObjectFlashTimer, X
	BEQ loc_BANK3_A24D

	LDY #$D2

loc_BANK3_A24D:
	LDA SpriteTempScreenX
	CLC
	ADC #$10
	STA SpriteTempScreenX
	ASL byte_RAM_EE
	ASL byte_RAM_EE
	LDA ObjectTimer1, X
	CMP #$60
	BCS loc_BANK3_A262

	LSR EnemyMovementDirection, X

loc_BANK3_A262:
	TYA
	PHA
	JSR FindSpriteSlot

	STY byte_RAM_F4
	PLA
	JSR RenderSprite_DrawObject

RenderSprite_Clawgrip_Rock:
	LDA ObjectTimer1, X
	BEQ loc_BANK3_A2D2

	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	BEQ RenderSprite_Clawgrip_Exit

	; Rock x-position
	TAY
	LDA ObjectXLo, X
	PHA
	CLC
	ADC ClawgripRockPositionX - 1, Y
	STA ObjectXLo, X
	SEC
	SBC ScreenBoundaryLeftLo
	STA SpriteTempScreenX

	; Rock y-position
	LDA ObjectYLo, X
	CLC
	ADC ClawgripRockPositionY - 1, Y
	STA SpriteTempScreenY
	LDA ObjectTimer1, X
	CMP #$30
	BCC loc_BANK3_A2AA

	CMP #$40
	BCS loc_BANK3_A2AA

	; Little bounce while hoisting
	LSR A
	AND #$07
	TAY
	LDA SpriteTempScreenY
	SEC
	SBC ClawgripRockHoistOffset, Y
	STA SpriteTempScreenY

loc_BANK3_A2AA:
	JSR sub_BANK2_8894

	LDY #$00
	STY_abs byte_RAM_F4

	LDA ObjectAttributes, X
	PHA
	LDA #$02
	STA ObjectAttributes, X
	LDA EnemyArray_46E, X
	PHA
	LDA #%00010000
	STA EnemyArray_46E, X
	LDA #$D6
	JSR RenderSprite_DrawObject

	; Restore to Clawgrip
	PLA
	STA EnemyArray_46E, X
	PLA
	STA ObjectAttributes, X
	PLA
	STA ObjectXLo, X

RenderSprite_Clawgrip_Exit:
	RTS


loc_BANK3_A2D2:
	LDA byte_RAM_10
	AND #$04
	BEQ loc_BANK3_A2E1

	LDX_abs byte_RAM_F4

	DEC SpriteDMAArea + $C, X
	LDX byte_RAM_12
	RTS

loc_BANK3_A2E1:
	LDA EnemyArray_B1, X
	TAX
	DEC SpriteDMAArea + 8, X
	LDX byte_RAM_12
	RTS


EnemyBehavior_ClawgripRock:
	LDA #$00
	STA ObjectFlashTimer, X
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR ApplyObjectPhysicsX

	JSR ApplyObjectMovement_Vertical

	JSR ObjectTileCollision

	LDA EnemyCollision, X
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ loc_BANK3_A30A

	JSR EnemyBehavior_TurnAround

	JSR HalfObjectVelocityX

loc_BANK3_A30A:
	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ loc_BANK3_A320

	LDA ObjectYLo, X
	AND #$F0
	STA ObjectYLo, X
	LDA ObjectYVelocity, X
	LSR A
	EOR #$FF
	CLC
	ADC #$01
	STA ObjectYVelocity, X

loc_BANK3_A320:
	JMP RenderSprite

; ---------------------------------------------------------------------------

RenderSprite_ClawgripRock:
	LDA_abs_X ObjectBeingCarriedTimer ;, X

	ORA ObjectStunTimer, X
	BNE loc_BANK3_A362

	LDA byte_RAM_10
	STA byte_RAM_0
	LDA ObjectXVelocity, X
	BPL loc_BANK3_A338

	EOR #$FF
	CLC
	ADC #$01

loc_BANK3_A338:
	CMP #$20
	BCS loc_BANK3_A344

	LSR byte_RAM_0
	CMP #$08
	BCS loc_BANK3_A344

	LSR byte_RAM_0

loc_BANK3_A344:
	LDA byte_RAM_0
	CLC
	ADC #$04
	AND #$08
	LSR A
	LSR A
	LSR A
	LDY ObjectXVelocity, X
	BPL loc_BANK3_A354

	EOR #$01

loc_BANK3_A354:
	STA EnemyMovementDirection, X
	LDA byte_RAM_0
	AND #$08
	ASL A
	ASL A
	ASL A
	ASL A
	ORA #$02
	STA ObjectAttributes, X

loc_BANK3_A362:
	JMP RenderSprite_NotAlbatoss


FlyingCarpetSpeed:
	.db $00
	.db $15
	.db $EB
	.db $00


EnemyBehavior_FlyingCarpet:
	JSR ObjectTileCollision

	LDA byte_RAM_10
	AND #$03
	BNE loc_BANK3_A37C

	DEC EnemyArray_B1, X
	BNE loc_BANK3_A37C

	STA PlayerRidingCarpet
	JMP EnemyDestroy

; ---------------------------------------------------------------------------

loc_BANK3_A37C:
	LDA PlayerRidingCarpet
	BEQ loc_BANK3_A38F

	LDA PlayerYVelocity
	BPL loc_BANK3_A38F

	LDA #$00
	STA ObjectYVelocity, X
	STA PlayerRidingCarpet
	JMP RenderSprite_FlyingCarpet

; ---------------------------------------------------------------------------

loc_BANK3_A38F:
	LDA EnemyCollision, X
	AND #$20
	STA PlayerRidingCarpet
	BNE loc_BANK3_A39B

	JMP loc_BANK3_A42A

; ---------------------------------------------------------------------------

loc_BANK3_A39B:
	LDA ObjectXVelocity, X
	BEQ loc_BANK3_A3A5

	LDA EnemyMovementDirection, X
	AND #$01
	STA PlayerDirection

loc_BANK3_A3A5:
	LDA ObjectYLo, X
	SEC
	SBC #$1A
	STA PlayerYLo
	LDA ObjectYHi, X
	SBC #$00
	STA PlayerYHi
	LDA PlayerXLo
	SEC
	SBC #$08
	STA ObjectXLo, X
	LDA PlayerXHi
	SBC #$00
	STA ObjectXHi, X
	LDY #$01
	LDA ObjectXVelocity, X
	BMI loc_BANK3_A3C7

	LDY #$FF

loc_BANK3_A3C7:
	STY FlyingCarpetAcceleration_RAM
	LDA Player1JoypadHeld
	AND #ControllerInput_Right | ControllerInput_Left
	TAY
	AND_abs PlayerCollision

	BNE loc_BANK3_A3E6

	LDA FlyingCarpetSpeed, Y
	CMP ObjectXVelocity, X
	BEQ loc_BANK3_A3E3

	LDA ObjectXVelocity, X
	CLC
	ADC FlyingCarpetAcceleration_RAM, Y
	STA ObjectXVelocity, X

loc_BANK3_A3E3:
	JMP loc_BANK3_A3EA

; ---------------------------------------------------------------------------

loc_BANK3_A3E6:
	LDA #$00
	STA ObjectXVelocity, X

loc_BANK3_A3EA:
	LDY #$01
	LDA ObjectYVelocity, X
	BMI loc_BANK3_A3F2

	LDY #$FF

loc_BANK3_A3F2:
	STY FlyingCarpetAcceleration_RAM
	LDA #$20
	CMP SpriteTempScreenY
	LDA #$00
	ROL A
	ASL A
	ASL A
	ASL A
	AND Player1JoypadHeld
	BNE loc_BANK3_A417

	LDA EnemyCollision, X
	LSR A
	LSR A
	AND #$03
	STA byte_RAM_0
	LDA Player1JoypadHeld
	LSR A
	LSR A
	AND #$03
	TAY
	AND byte_RAM_0
	BEQ loc_BANK3_A41B

loc_BANK3_A417:
	LDA #$00
	BEQ loc_BANK3_A428

loc_BANK3_A41B:
	LDA FlyingCarpetSpeed, Y
	CMP ObjectYVelocity, X
	BEQ loc_BANK3_A42A

	LDA ObjectYVelocity, X
	CLC
	ADC FlyingCarpetAcceleration_RAM, Y

loc_BANK3_A428:
	STA ObjectYVelocity, X

loc_BANK3_A42A:
	JSR ApplyObjectPhysicsX

	JSR ApplyObjectPhysicsY

	LDA EnemyArray_B1, X
	CMP #$20
	BCS EnemyBehavior_FlyingCarpet_Render

	LDA byte_RAM_10
	AND #$02

loc_BANK3_A43A:
	BNE EnemyBehavior_FlyingCarpet_Render

	RTS

EnemyBehavior_FlyingCarpet_Render:
	JMP RenderSprite_FlyingCarpet


CreateFlyingCarpet:
	JSR CreateEnemy_TryAllSlots

	BMI CreateFlyingCarpet_Exit

	LDX byte_RAM_0
	LDY byte_RAM_12
	LDA #$00
	STA ObjectXVelocity, X
	STA ObjectYVelocity, X
	LDA #Enemy_FlyingCarpet
	STA ObjectType, X
	LDA ObjectXLo, Y
	SEC
	SBC #$08
	STA ObjectXLo, X
	LDA ObjectXHi, Y
	SBC #$00
	STA ObjectXHi, X
	LDA ObjectYLo, Y
	CLC
	ADC #$0E
	STA ObjectYLo, X
	LDA ObjectYHi, Y
	ADC #$00
	STA ObjectYHi, X
	JSR SetEnemyAttributes

	; life of carpet
	LDA #$A0
	STA EnemyArray_B1, X

CreateFlyingCarpet_Exit:
	LDX byte_RAM_12
	RTS


FlyingCarpetMirroring:
	.db $02
	.db $02
	.db $01
	.db $01

FlyingCarpetTilemapIndex:
	.db $04
	.db $0C
	.db $0C
	.db $04

PidgitYAcceleration:
	.db $01
	.db $FF

PidgitTurnYVelocity:
	.db $08
	.db $F8

PidgitXAcceleration:
	.db $01
	.db $FF

PidgitTurnXVelocity:
	.db $20
	.db $E0

PidgitDiveXVelocity:
	.db $14
	.db $EC


EnemyBehavior_Pidgit:
	JSR EnemyBehavior_CheckDamagedInterrupt

	INC ObjectAnimationTimer, X
	LDA ObjectProjectileTimer, X
	BEQ EnemyBehavior_Pidgit_Alive

	LDA ObjectAttributes, X
	ORA #ObjAttrib_UpsideDown
	STA ObjectAttributes, X
	JSR RenderSprite_Pidgit

	JMP ApplyObjectMovement

; ---------------------------------------------------------------------------

EnemyBehavior_Pidgit_Alive:
	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	LDA EnemyArray_B1, X
	BEQ loc_BANK3_A4C1

	DEC ObjectYVelocity, X
	BPL loc_BANK3_A4BE

	LDA ObjectYLo, X
	CMP #$30
	BCS loc_BANK3_A4BE

	LDA #$00
	STA EnemyArray_B1, X
	STA ObjectXVelocity, X
	STA ObjectYVelocity, X
	DEC ObjectTimer1, X

loc_BANK3_A4BE:
	JMP loc_BANK3_A502

; ---------------------------------------------------------------------------

loc_BANK3_A4C1:
	LDA ObjectTimer1, X
	BNE loc_BANK3_A4D6

	LDA #$30
	STA ObjectYVelocity, X
	JSR EnemyFindWhichSidePlayerIsOn

	LDA PidgitDiveXVelocity, Y
	STA ObjectXVelocity, X
	INC EnemyArray_B1, X
	JMP RenderSprite_Pidgit

; ---------------------------------------------------------------------------

loc_BANK3_A4D6:
	LDA EnemyArray_480, X
	AND #$01
	TAY
	LDA ObjectYVelocity, X
	CLC
	ADC PidgitYAcceleration, Y
	STA ObjectYVelocity, X
	CMP PidgitTurnYVelocity, Y
	BNE loc_BANK3_A4EC

	INC EnemyArray_480, X

loc_BANK3_A4EC:
	LDA EnemyArray_477, X
	AND #$01
	TAY
	LDA ObjectXVelocity, X
	CLC
	ADC PidgitXAcceleration, Y
	STA ObjectXVelocity, X
	CMP PidgitTurnXVelocity, Y
	BNE loc_BANK3_A502

	INC EnemyArray_477, X

loc_BANK3_A502:
	JSR ApplyObjectPhysicsY

	JSR ApplyObjectPhysicsX


RenderSprite_Pidgit:
	JSR RenderSprite_NotAlbatoss

	LDA EnemyState, X
	SEC
	SBC #$01
	ORA ObjectProjectileTimer, X
	ORA ObjectBeingCarriedTimer, X
	BNE RenderSprite_Pidgit_Exit

	; Render Pidgit's carpet
	JSR FindSpriteSlot

	STY_abs byte_RAM_F4

	LDA #ObjAttrib_Palette1 | ObjAttrib_Horizontal | ObjAttrib_16x32
	STA ObjectAttributes, X
	LDA ObjectXLo, X
	PHA
	SEC
	SBC #$08
	STA ObjectXLo, X
	LDA ObjectXHi, X
	PHA
	SBC #$00
	STA ObjectXHi, X
	JSR sub_BANK2_8894

	PLA
	STA ObjectXHi, X
	PLA
	STA ObjectXLo, X
	LDA SpriteTempScreenY
	CLC
	ADC #$0C
	STA SpriteTempScreenY
	LDA SpriteTempScreenX
	SBC #$07
	STA SpriteTempScreenX
	JSR RenderSprite_FlyingCarpet

	LDA #ObjAttrib_Palette1 | ObjAttrib_Horizontal | ObjAttrib_FrontFacing
	STA ObjectAttributes, X

RenderSprite_Pidgit_Exit:
	RTS


RenderSprite_FlyingCarpet:
	LDA byte_RAM_10
	LSR A
	LSR A
	LSR A
	AND #$03
	LDY ObjectXVelocity, X
	BMI loc_BANK3_A55F

	EOR #$03

loc_BANK3_A55F:
	TAY
	LDA FlyingCarpetMirroring, Y
	STA EnemyMovementDirection, X
	LDA FlyingCarpetTilemapIndex, Y
	JMP RenderSprite_DrawObject


EnemyInit_Mouser:
	JSR EnemyInit_Birdo

IFDEF RESET_CHR_LATCH
	LDA #$00
	JSR SetBossTileset
ENDIF

	LDA #$02
	LDY CurrentWorldTileset
	BEQ EnemyInit_Mouser_SetHP

	LDA #$04

EnemyInit_Mouser_SetHP:
	STA EnemyHP, X
	RTS

;
; Mouser
; ======
;
; Runs back and forth, throws bombs
;
; byte_RAM_10 = timer used for jumping and throwing
; ObjectFlashTimer = pauses Mouser when not $00
; ObjectTimer1 = counter used to time throwing (wind up and pitch)
; EnemyArray_B1 = counter used for movement direction and non-throw pauses
;
EnemyBehavior_Mouser:
	JSR EnemyBehavior_CheckDamagedInterrupt

	LDA ObjectFlashTimer, X
	BEQ EnemyBehavior_Mouser_Active

	JMP RenderSprite

EnemyBehavior_Mouser_Active:
	JSR ObjectTileCollision

	LDA #$02
	STA EnemyMovementDirection, X
	JSR RenderSprite

	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ EnemyBehavior_Mouser_Falling

	JSR ResetObjectYVelocity

	LDA byte_RAM_10
	AND #$FF
	BNE EnemyBehavior_Mouser_Move

EnemyBehavior_Mouser_Jump:
	LDA #$D8
	STA ObjectYVelocity, X
	BNE EnemyBehavior_Mouser_Falling

EnemyBehavior_Mouser_Move:
	LDA byte_RAM_10
	AND #$3F
	BNE loc_BANK3_A5AF

	; the wind-up
	LDA #$20
	STA ObjectTimer1, X

loc_BANK3_A5AF:
	LDY ObjectTimer1, X
	BNE EnemyBehavior_Mouser_MaybeThrow

	INC EnemyArray_B1, X
	LDA EnemyArray_B1, X
	AND #$20
	BEQ EnemyBehavior_Mouser_Exit

	INC ObjectAnimationTimer, X
	INC ObjectAnimationTimer, X
	LDY #$18 ; right
	LDA EnemyArray_B1, X
	AND #$40
	BNE EnemyBehavior_Mouser_PhysicsX

	LDY #$E8 ; left

EnemyBehavior_Mouser_PhysicsX:
	STY ObjectXVelocity, X
	JMP ApplyObjectPhysicsX

EnemyBehavior_Mouser_MaybeThrow:
	; the pitch
	CPY #$10
	BNE EnemyBehavior_Mouser_Exit

EnemyBehavior_Mouser_Throw:
	JSR CreateEnemy_TryAllSlots

	BMI EnemyBehavior_Mouser_Exit

	LDX byte_RAM_0
	LDA #Enemy_Bomb
	STA ObjectType, X
	LDA ObjectYLo, X
	ADC #$03
	STA ObjectYLo, X
	LDA #$E0 ; throw y-velocity
	STA ObjectYVelocity, X
	JSR SetEnemyAttributes

	LDA #$FF ; bomb fuse
	STA ObjectTimer1, X
	LDA #$E0 ; throw x-velocity
	STA ObjectXVelocity, X
	LDX byte_RAM_12

EnemyBehavior_Mouser_Exit:
	RTS

EnemyBehavior_Mouser_Falling:
	JMP ApplyObjectMovement_Vertical


RenderSprite_Mouser:
	LDA EnemyState, X
	CMP #EnemyState_Alive
	BNE RenderSprite_Mouser_Hurt

	LDA ObjectFlashTimer, X
	BEQ RenderSprite_Mouser_Throw

	INC ObjectAnimationTimer, X
	LDA #ObjAttrib_16x32 | ObjAttrib_FrontFacing | ObjAttrib_Palette2
	STA ObjectAttributes, X

RenderSprite_Mouser_Hurt:
	LDA #%10110011
	STA EnemyArray_46E, X
	LDA #$2C ; hurt sprite
	BNE RenderSprite_Mouser_DrawObject

RenderSprite_Mouser_Throw:
	LDY ObjectTimer1, X
	DEY
	CPY #$10
	BCS RenderSprite_Mouser_Walk

	LDA #$20 ; throwing sprite

RenderSprite_Mouser_DrawObject:
	JSR RenderSprite_DrawObject

	JMP RenderSprite_Mouser_Exit

RenderSprite_Mouser_Walk:
	JSR RenderSprite_NotAlbatoss

	LDA ObjectTimer1, X
	CMP #$10
	BCC RenderSprite_Mouser_Exit

RenderSprite_Mouser_Bomb:
	LDA #ObjAttrib_Palette1
	STA ObjectAttributes, X
	LDA #%00010000 ; use tilemap 2
	STA EnemyArray_46E, X
	LDA SpriteTempScreenX
	CLC
	ADC #$0B
	STA SpriteTempScreenX
	ASL byte_RAM_EE
	LDY #$00
	STY_abs byte_RAM_F4
	LDA #$38 ; could have been $34 from tilemap 1 instead
	JSR RenderSprite_DrawObject

RenderSprite_Mouser_Exit:
	; restore Mouser attributes after drawing the bomb
	LDA #ObjAttrib_16x32 | ObjAttrib_Palette3
	STA ObjectAttributes, X
	LDA #%00110011
	STA EnemyArray_46E, X

	RTS


; ---------------------------------------------------------------------------
byte_BANK3_A652:
	.db $FB
	.db $05
; ---------------------------------------------------------------------------

RenderSprite_Ostro:
	JSR RenderSprite_NotRocket

	LDA byte_RAM_EE
	AND #$0E
	ORA byte_RAM_EF
	ORA EnemyArray_B1, X
	BNE locret_BANK3_A67C

	LDA ObjectYLo, X
	SEC
	SBC #$02
	STA byte_RAM_0
	LDY EnemyMovementDirection, X
	LDA byte_RAM_1
	CLC
	ADC byte_BANK3_A652 - 1, Y
	STA byte_RAM_1
	JSR FindSpriteSlot

	LDX #$3C
	JSR SetSpriteTiles

	LDX byte_RAM_12

locret_BANK3_A67C:
	RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Ostro:
	LDA EnemyArray_B1, X
	BNE loc_BANK3_A6DB

	LDA ObjectBeingCarriedTimer, X
	BEQ loc_BANK3_A6BD

	LDA #Enemy_ShyguyRed
	STA ObjectType, X
	JSR SetEnemyAttributes

	JSR CreateEnemy

	BMI locret_BANK3_A6BC

	LDY byte_RAM_0
	LDA #Enemy_Ostro
	STA ObjectType, Y
	STA EnemyArray_B1, Y
	LDA ObjectXLo, X
	STA ObjectXLo, Y
	LDA ObjectXHi, X
	STA ObjectXHi, Y
	LDA EnemyRawDataOffset, X
	STA EnemyRawDataOffset, Y
	LDA #$FF
	STA EnemyRawDataOffset, X
	LDA ObjectXVelocity, X
	STA ObjectXVelocity, Y
	TYA
	TAX
	JSR SetEnemyAttributes

	LDX byte_RAM_12

locret_BANK3_A6BC:
	RTS

; ---------------------------------------------------------------------------

loc_BANK3_A6BD:
	LDA EnemyCollision, X
	AND #$10
	BEQ loc_BANK3_A6DB

	INC EnemyArray_B1, X
	STA ObjectAnimationTimer, X
	JSR CreateEnemy

	BMI loc_BANK3_A6DB

	LDY byte_RAM_0
	LDA ObjectXVelocity, X
	STA ObjectXVelocity, Y
	LDA #$20
	STA ObjectTimer2, Y
	JMP loc_BANK3_A6E1

; ---------------------------------------------------------------------------

loc_BANK3_A6DB:
	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR EnemyBehavior_CheckDamagedInterrupt

loc_BANK3_A6E1:
	JSR ObjectTileCollision

	LDA EnemyCollision, X
	AND EnemyMovementDirection, X
	BEQ loc_BANK3_A6ED

	JSR EnemyBehavior_TurnAround

loc_BANK3_A6ED:
	LDA EnemyCollision, X
	AND #$04
	BEQ loc_BANK3_A70D

	LDA ObjectProjectileTimer, X
	BEQ loc_BANK3_A700

	LDA #$00
	STA ObjectProjectileTimer, X
	JSR EnemyInit_BasicAttributes

loc_BANK3_A700:
	LDA ObjectAnimationTimer, X
	EOR #$08
	STA ObjectAnimationTimer, X
	JSR ResetObjectYVelocity

	LDA #$F0
	STA ObjectYVelocity, X

loc_BANK3_A70D:
	INC EnemyArray_477, X
	LDA EnemyArray_B1, X
	BNE loc_BANK3_A71E

	LDA EnemyArray_477, X
	AND #$3F
	BNE loc_BANK3_A71E

	JSR EnemyInit_BasicMovementTowardPlayer

loc_BANK3_A71E:
	JSR ApplyObjectMovement

	JMP RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_Tryclyde:
	JSR EnemyInit_Basic

IFDEF RESET_CHR_LATCH
	LDA #$01
	JSR SetBossTileset
ENDIF

	LDA #$40
	STA EnemyArray_477, X
	LDA #$02
	STA EnemyHP, X
	JMP EnemyInit_Birdo_Exit


TryclydeHeadPosition:
	.db $00
	.db $FF
	.db $FE
	.db $FD
	.db $FC
	.db $FB
	.db $FA
	.db $F9
	.db $F8
	.db $F9
	.db $FA
	.db $FB
	.db $FC
	.db $FD
	.db $FE
	.db $FF

TryclydeFireYVelocity:
	.db $0B
	.db $0C
	.db $0D
	.db $0F
	.db $10
	.db $12
	.db $14
	.db $17
	.db $1A
	.db $1D
	.db $1F
	.db $20

TryclydeFireXVelocity:
	.db $E2
	.db $E2
	.db $E2
	.db $E3
	.db $E4
	.db $E5
	.db $E7
	.db $E9
	.db $ED
	.db $F1
	.db $F8
	.db $00


locret_BANK3_A75C:
	RTS


;
; Tryclyde
; ========
;
; Drifts back and forth slightly, spits fire
;
; EnemyArray_477 = counter used to determine movement direction and top head position
; EnemyArray_B1 = counter used to determine whether or not the bottom head should move
; ObjectFlashTimer = used to determine whether Tryclyde is taking damage
; EnemyArray_480 = counter used to determine bottom head position
;
EnemyBehavior_Tryclyde:
	JSR EnemyBehavior_CheckDamagedInterrupt

	LDY #$00
	LDA EnemyArray_477, X
	ASL A
	BCC EnemyBehavior_Tryclyde_PhysicsX

	LDY #$02
	ASL A
	BCC EnemyBehavior_Tryclyde_PhysicsX

	LDY #$FE

EnemyBehavior_Tryclyde_PhysicsX:
	STY ObjectXVelocity, X
	JSR ApplyObjectPhysicsX

	INC EnemyArray_477, X
	LDA EnemyArray_B1, X
	CLC
	ADC #$D0
	STA EnemyArray_B1, X
	BCC RenderSprite_Tryclyde

	INC EnemyArray_480, X

RenderSprite_Tryclyde:
	LDA byte_RAM_EF
	BNE locret_BANK3_A75C

	LDA #ObjAttrib_16x32 | ObjAttrib_FrontFacing | ObjAttrib_Palette1
	STA ObjectAttributes, X
	LDY #$48 ; static head regular
	LDA EnemyState, X
	SEC
	SBC #$01
	ORA ObjectFlashTimer, X
	STA byte_RAM_7
	BEQ RenderSprite_Tryclyde_DrawBody

	LDY #$4C ; static head hurt

RenderSprite_Tryclyde_DrawBody:
	TYA
	LDY #$30
	STY_abs byte_RAM_F4
	JSR RenderSprite_DrawObject

	LDA #ObjAttrib_Palette1 | ObjAttrib_FrontFacing
	STA ObjectAttributes, X
	LDA #%00110011
	STA EnemyArray_46E, X
	LDA ObjectXLo, X
	PHA
	SEC
	SBC #$08
	STA ObjectXLo, X
	JSR sub_BANK2_8894

	LDX #$50 ; tail up
	LDA byte_RAM_10
	AND #$20
	BNE RenderSprite_Tryclyde_DrawTail

	LDA #$04
	AND byte_RAM_10
	BEQ RenderSprite_Tryclyde_DrawTail

	LDX #$53 ; tail down

RenderSprite_Tryclyde_DrawTail:
	; tail
	LDA byte_RAM_1
	SEC
	SBC #$08
	STA byte_RAM_1
	LDA #$20
	STA byte_RAM_C
	LDY #$E0
	JSR SetSpriteTiles

	; top head
	LDX byte_RAM_12
	LDA ObjectXLo, X
	SEC
	SBC #$08
	STA ObjectXLo, X
	JSR sub_BANK2_8894

	PLA
	STA ObjectXLo, X
	LDA #%00010011
	STA EnemyArray_46E, X
	LDA ObjectYLo, X
	STA byte_RAM_0
	LDA EnemyArray_477, X
	AND #$78
	LSR A
	LSR A
	LSR A
	TAY
	LDA TryclydeHeadPosition, Y
	ADC SpriteTempScreenX
	ADC #$F0
	STA byte_RAM_1
	LDX #$56
	LDA byte_RAM_7
	BNE RenderSprite_Tryclyde_DrawTopHead

	LDX #$58
	DEY
	DEY
	DEY
	DEY
	CPY #$07
	BCS RenderSprite_Tryclyde_DrawTopHead

	LDX #$5A

RenderSprite_Tryclyde_DrawTopHead:
	LDY #$00
	JSR SetSpriteTiles

	; bottom head
	LDX byte_RAM_12
	LDA ObjectYLo, X
	CLC
	ADC #$10
	STA byte_RAM_0
	LDA EnemyArray_480, X
	AND #$78
	LSR A
	LSR A
	LSR A
	TAY
	LDA TryclydeHeadPosition, Y
	ADC SpriteTempScreenX
	ADC #$F0
	STA byte_RAM_1
	LDA #$00
	STA byte_RAM_C
	LDX #$56
	LDA byte_RAM_7
	BNE RenderSprite_Tryclyde_DrawBottomHead

	LDX #$58
	DEY
	DEY
	DEY
	DEY
	CPY #$07
	BCS RenderSprite_Tryclyde_DrawBottomHead

	LDX #$5A

RenderSprite_Tryclyde_DrawBottomHead:
	LDY #$08
	JSR SetSpriteTiles

	LDX byte_RAM_12
	LDA #%00010011
	STA EnemyArray_46E, X
	LDA byte_RAM_EE
	BNE EnemyBehavior_Tryclyde_SpitFireballs

RenderSprite_Tryclyde_DrawBottomNeck:
	LDA ObjectYLo, X
	CLC
	ADC #$10
	STA SpriteDMAArea + $58
	LDA #$0D ; neck sprite
	STA SpriteDMAArea + $59
	STA SpriteDMAArea + $5D ; bottom neck
	LDA SpriteDMAArea + $32
	STA SpriteDMAArea + $5A
	STA SpriteDMAArea + $5E ; bottom neck
	LDA byte_RAM_1
	CLC
	ADC #$10
	STA SpriteDMAArea + $5B

RenderSprite_Tryclyde_DrawTopNeck:
	LDA ObjectYLo, X
	STA SpriteDMAArea + $5C
	LDA SpriteTempScreenX
	SEC
	SBC #$08
	STA SpriteDMAArea + $5F

EnemyBehavior_Tryclyde_SpitFireballs:
	LDA #$00
	STA byte_RAM_5
	LDA EnemyArray_477, X
	JSR EnemyBehavior_Tryclyde_SpitFireball

	INC byte_RAM_5
	LDA EnemyArray_480, X

EnemyBehavior_Tryclyde_SpitFireball:
	AND #$67
	CMP #$40
	BNE RenderSprite_Tryclyde_Exit

	LDA ObjectFlashTimer, X
	BNE RenderSprite_Tryclyde_Exit

	JSR CreateEnemy

	BMI RenderSprite_Tryclyde_Exit

	LDA #SoundEffect1_BirdoShot
	STA SoundEffectQueue1
	LDY byte_RAM_0
	LDA #Enemy_Fireball
	STA ObjectType, Y
	STA EnemyVariable, Y
	STA EnemyArray_B1, Y
	LDA ObjectXLo, X
	SBC #$18
	STA ObjectXLo, Y
	LDA byte_RAM_5
	BEQ EnemyBehavior_Tryclyde_GetFireAngle

	LDA ObjectYLo, X
	CLC
	ADC #$10
	STA ObjectYLo, Y

EnemyBehavior_Tryclyde_GetFireAngle:
	; angle the fireball based on the player's position
	LDA PlayerXLo
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$0F
	CMP #$0B
	BCC EnemyBehavior_Tryclyde_SetFireVelocity

	LDA #$0B

EnemyBehavior_Tryclyde_SetFireVelocity:
	TAX ; These may be fireball speed pointers
	LDA TryclydeFireYVelocity, X
	STA ObjectYVelocity, Y
	LDA TryclydeFireXVelocity, X
	STA ObjectXVelocity, Y

;
; Sets enemy attributes to defaults, restores X, and exits
;
; Input
;   Y = enemy index
; Output
;   X = enemy index
;
RenderSprite_Tryclyde_ResetAttributes:
	TYA
	TAX
	JSR SetEnemyAttributes

	LDX byte_RAM_12

RenderSprite_Tryclyde_Exit:
	RTS


EnemyInit_Cobrats:
	JSR EnemyInit_Basic

	LDA ObjectYLo, X
	SEC
	SBC #$08
	STA EnemyVariable, X
	RTS


;
; Cobrat (Ground)
; ===============
;
; Bobs up and down until the player gets close, then jumps up, chases, and shoots bullets
;
; EnemyVariable = target y-position
; EnemyArray_480 = flag that gets enabled when the player gets close
; EnemyArray_477 = counter used to determine bobbing direction
; ObjectAnimationTimer = counter used to determine how quickly Cobrat turns
; ObjectTimer2 = counter used to determine when to fire a bullet
;
EnemyBehavior_CobratGround:
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR EnemyBehavior_Check42FPhysicsInterrupt

	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR ObjectTileCollision

	LDA EnemyArray_480, X
	BNE EnemyBehavior_CobratGround_Jump

	STA ObjectXVelocity, X
	JSR EnemyFindWhichSidePlayerIsOn

	LDA byte_RAM_F
	ADC #$40
	CMP #$80
	BCS EnemyBehavior_CobratGround_Bob

	INC EnemyArray_480, X
	LDA #$C0
	STA ObjectYVelocity, X
	BNE EnemyBehavior_CobratGround_Jump

EnemyBehavior_CobratGround_Bob:
	INC EnemyArray_477, X
	LDY #$FC
	LDA EnemyArray_477, X
	AND #$20
	BEQ EnemyBehavior_CobratGround_BobMovement

	LDY #$04

EnemyBehavior_CobratGround_BobMovement:
	STY ObjectYVelocity, X
	JSR ApplyObjectPhysicsY

	LDA #ObjAttrib_16x32 | ObjAttrib_BehindBackground | ObjAttrib_Palette1
	STA ObjectAttributes, X
	JMP RenderSprite

EnemyBehavior_CobratGround_Jump:
	LDA ObjectYVelocity, X
	BMI EnemyBehavior_CobratGround_Movement

	LDA EnemyVariable, X
	SEC
	SBC #$18
	CMP ObjectYLo, X
	BCS EnemyBehavior_CobratGround_Movement

	STA ObjectYLo, X
	LDA #$00
	STA ObjectYVelocity, X

EnemyBehavior_CobratGround_Movement:
	JSR ApplyObjectMovement

	INC ObjectAnimationTimer, X
	LDA ObjectAnimationTimer, X
	PHA
	AND #$3F
	BNE EnemyBehavior_CobratGround_AfterBasicMovement

	JSR EnemyInit_BasicMovementTowardPlayer

EnemyBehavior_CobratGround_AfterBasicMovement:
	PLA
	BNE EnemyBehavior_CobratGround_CheckCollision

	LDA #$18
	STA ObjectTimer2, X

EnemyBehavior_CobratGround_CheckCollision:
	LDA EnemyCollision, X
	AND #$03
	BEQ EnemyBehavior_CobratGround_SetAttributes

	JSR EnemyBehavior_TurnAround

EnemyBehavior_CobratGround_SetAttributes:
	LDA #ObjAttrib_16x32 | ObjAttrib_Palette1
	LDY ObjectYVelocity, X
	BPL EnemyBehavior_CobratGround_Shoot

	LDA #ObjAttrib_16x32 | ObjAttrib_BehindBackground | ObjAttrib_Palette1

EnemyBehavior_CobratGround_Shoot:
	JMP EnemyBehavior_CobratJar_Shoot


;
; Cobrat (Jar)
; ============
;
; Bobs up and down, then occasionally jumps up to shoot a bullet at the player
;
; EnemyVariable = target y-position
; EnemyArray_B1 = flag that gets set when the Cobrat jumps
; byte_RAM_10 = counter used to determine when to jump and fire
; ObjectTimer2 = counter used to determine when to fire a bullet
;
EnemyBehavior_CobratJar:
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR EnemyBehavior_Check42FPhysicsInterrupt

	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR ObjectTileCollision

	LDA EnemyCollision, X
	AND #CollisionFlags_Up
	BEQ EnemyBehavior_CobratJar_Uncorked

EnemyBehavior_CobratJar_Corked:
	LDA EnemyVariable, X
	STA ObjectYLo, X
	RTS

EnemyBehavior_CobratJar_Uncorked:
	JSR EnemyFindWhichSidePlayerIsOn

	INY
	STY EnemyMovementDirection, X

	LDA EnemyArray_B1, X
	BNE EnemyBehavior_CobratJar_Jump

	LDA ObjectTimer1, X
	BNE EnemyBehavior_CobratJar_Bob

	LDA #$D0
	STA ObjectYVelocity, X
	INC EnemyArray_B1, X
	JMP EnemyBehavior_CobratJar_Movement

EnemyBehavior_CobratJar_Bob:
	LDY #$FC
	LDA byte_RAM_10
	AND #$20
	BEQ EnemyBehavior_CobratJar_BobMovement

	LDY #$04

EnemyBehavior_CobratJar_BobMovement:
	STY ObjectYVelocity, X
	JSR ApplyObjectPhysicsY

	JMP EnemyBehavior_CobratJar_SetAttributes

EnemyBehavior_CobratJar_Jump:
	INC ObjectAnimationTimer, X
	LDA ObjectYVelocity, X
	BMI EnemyBehavior_CobratJar_Movement

	BNE EnemyBehavior_CobratJar_CheckLanding

	LDA #$10
	STA ObjectTimer2, X

EnemyBehavior_CobratJar_CheckLanding:
	LDA ObjectYVelocity, X
	BMI EnemyBehavior_CobratJar_CheckReset

	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ EnemyBehavior_CobratJar_CheckReset

	LDA byte_RAM_E
	SEC
	SBC #$6F
	CMP #$06
	BCC EnemyBehavior_CobratJar_CheckReset

EnemyBehavior_CobratJar_Blocked:
	LDA #EnemyState_Dead
	STA EnemyState, X
	LDA #$E0
	STA ObjectYVelocity, X
	LDA #DPCM_BossHurt
	STA DPCMQueue

EnemyBehavior_CobratJar_CheckReset:
	LDA EnemyVariable, X
	CMP ObjectYLo, X
	BCS EnemyBehavior_CobratJar_Movement

	STA ObjectYLo, X
	LDA #$00
	STA EnemyArray_B1, X
	LDA #$A0
	STA ObjectTimer1, X

EnemyBehavior_CobratJar_Movement:
	JSR ApplyObjectMovement_Vertical

EnemyBehavior_CobratJar_SetAttributes:
	LDA #ObjAttrib_16x32 | ObjAttrib_BehindBackground | ObjAttrib_Palette1

EnemyBehavior_CobratJar_Shoot:
	STA ObjectAttributes, X
	LDA ObjectTimer2, X
	BEQ EnemyBehavior_CobratJar_Render

	CMP #$05
	BNE EnemyBehavior_CobratJar_RenderShot

	JSR CreateBullet

EnemyBehavior_CobratJar_RenderShot:
	LDA #$64 ; firing bullet
	JMP RenderSprite_DrawObject

EnemyBehavior_CobratJar_Render:
	JMP RenderSprite


EnemyInit_Pokey:
	JSR EnemyInit_Basic

	LDA #$03
	STA EnemyVariable, X
	RTS


PokeyHitbox:
	.db $02
	.db $04
	.db $0D
	.db $0E


EnemyBehavior_Pokey:
	LDA EnemyVariable, X
	BNE loc_BANK3_AA2D

	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR EnemyBehavior_Check42FPhysicsInterrupt

loc_BANK3_AA2D:
	LDA EnemyCollision, X
	AND #$10
	BEQ loc_BANK3_AA3A

	JSR sub_BANK3_AA3E

	INC ObjectProjectileTimer, X
	RTS

; ---------------------------------------------------------------------------

loc_BANK3_AA3A:
	LDA ObjectBeingCarriedTimer, X
	BEQ loc_BANK3_AA99

; =============== S U B R O U T I N E =======================================

sub_BANK3_AA3E:
	LDA EnemyVariable, X
	BEQ loc_BANK3_AA99

	STA EnemyArray_477, X
	LDA #$00
	STA EnemyVariable, X
	LDA #$02
	STA ObjectHitbox, X
	LDA EnemyRawDataOffset, X
	STA byte_RAM_6
	LDA #$FF
	STA EnemyRawDataOffset, X
	JSR CreateEnemy

	BMI loc_BANK3_AA99

	LDY byte_RAM_0
	LDA #Enemy_Pokey
	STA ObjectType, Y
	JSR RenderSprite_Tryclyde_ResetAttributes

	LDY byte_RAM_0
	LDA byte_RAM_6
	STA EnemyRawDataOffset, Y
	LDA EnemyArray_477, X
	SEC
	SBC #$01
	STA EnemyVariable, Y
	TAY

	LDA PokeyHitbox, Y
	LDY byte_RAM_0
	STA ObjectHitbox, Y
	LDA ObjectXLo, X
	STA ObjectXLo, Y
	LDA ObjectXHi, X
	STA ObjectXHi, Y
	LDA ObjectYLo, X
	CLC
	ADC #$10
	STA ObjectYLo, Y
	LDA ObjectYHi, X
	ADC #$00
	STA ObjectYHi, Y

loc_BANK3_AA99:
	INC ObjectAnimationTimer, X
	LDA ObjectAnimationTimer, X
	AND #$3F
	BNE loc_BANK3_AAA4

	JSR EnemyInit_BasicMovementTowardPlayer

loc_BANK3_AAA4:
	JSR ApplyObjectPhysicsX

	JMP RenderSprite

; End of function sub_BANK3_AA3E


PokeyWiggleOffset:
	.db $00
	.db $01
	.db $00
	.db $FF
	.db $00
	.db $01
	.db $00


RenderSprite_Pokey:
	LDY #$00
	LDA byte_RAM_EE
	BNE RenderSprite_Pokey_Segments

	LDA byte_RAM_10
	AND #$18
	LSR A
	LSR A
	LSR A
	TAY

RenderSprite_Pokey_Segments:
	STY byte_RAM_7
	LDA SpriteTempScreenX
	STA PokeyTempScreenX
	CLC
	ADC PokeyWiggleOffset, Y
	STA SpriteTempScreenX
	JSR RenderSprite_NotAlbatoss

	LDA EnemyVariable, X
	STA byte_RAM_9
	BEQ RenderSprite_Pokey_Exit

	TYA
	CLC
	ADC #$10
	TAY
	LDX byte_RAM_7
	LDA PokeyTempScreenX
	ADC PokeyWiggleOffset + 1, X
	STA byte_RAM_1
	LDX #$70
	JSR SetSpriteTiles

	DEC byte_RAM_9
	BEQ RenderSprite_Pokey_Exit

	JSR FindSpriteSlot

	LDX byte_RAM_7
	LDA PokeyTempScreenX
	CLC
	ADC PokeyWiggleOffset + 2, X
	STA byte_RAM_1
	LDX #$70
	JSR SetSpriteTiles

	DEC byte_RAM_9
	BEQ RenderSprite_Pokey_Exit

	LDX byte_RAM_7
	LDA PokeyTempScreenX
	CLC
	ADC PokeyWiggleOffset + 3, X
	STA byte_RAM_1
	LDX #$70
	JSR SetSpriteTiles

RenderSprite_Pokey_Exit:
	LDX byte_RAM_12
	RTS


EnemyBehavior_Rocket:
	LDA EnemyArray_B1, X
	BNE EnemyBehavior_Rocket_Flying
	JMP EnemyBehavior_Rocket_Launching

EnemyBehavior_Rocket_Flying:
	LDY #$03
	LDA ObjectYVelocity, X
	BEQ EnemyBehavior_Rocket_Slow

	CMP #$FD
	BCC EnemyBehavior_Rocket_Fast

EnemyBehavior_Rocket_Slow:
	LDY #$3F
	INC SpriteTempScreenX
	LDA byte_RAM_10
	AND #$02
	BNE EnemyBehavior_Rocket_Fast

	DEC SpriteTempScreenX
	DEC SpriteTempScreenX

EnemyBehavior_Rocket_Fast:
	TYA
	AND byte_RAM_10
	BNE EnemyBehavior_Rocket_ApplyPhysics

	DEC ObjectYVelocity, X

EnemyBehavior_Rocket_ApplyPhysics:
	JSR ApplyObjectPhysicsY

	LDA EnemyArray_477, X
	BNE EnemyBehavior_Rocket_DroppingOff

	LDY ObjectYHi, X
	BPL EnemyBehavior_Rocket_Render

	JSR DoAreaReset

	LDA #Enemy_Rocket
	STA ObjectCarriedOver
	INC DoAreaTransition
	LDA #TransitionType_Rocket
	STA TransitionType
	LDA #$00
	STA_abs PlayerState

	RTS

EnemyBehavior_Rocket_DroppingOff:
	LDA ObjectYLo, X
	CMP #$30
	BCS EnemyBehavior_Rocket_Render

	LDY PlayerInRocket
	BNE EnemyBehavior_Rocket_DropPlayer

	CMP #$18
	BCS EnemyBehavior_Rocket_Render

	JMP EnemyBehavior_Bomb_Explode

EnemyBehavior_Rocket_DropPlayer:
	LDA #$00
	STA PlayerInRocket
	STA HoldingItem
	STA PlayerXVelocity
	LDA ObjectYLo, X
	ADC #$20
	STA PlayerYLo
	STA PlayerScreenYLo

EnemyBehavior_Rocket_Render:
	JSR RenderSprite_Rocket

	LDA SpriteTempScreenX
	SEC
	SBC #$04
	STA SpriteDMAArea + $93
	ADC #$07
	STA SpriteDMAArea + $97
	ADC #$08
	STA SpriteDMAArea + $9B

	LDA #$20 ; long trail
	LDY ObjectYVelocity, X
	CPY #$FD
	BMI EnemyBehavior_Rocket_RenderTrails

	LDA #$15 ; short trail

EnemyBehavior_Rocket_RenderTrails:
	ADC SpriteTempScreenY
	STA SpriteDMAArea + $90
	STA SpriteDMAArea + $94
	STA SpriteDMAArea + $98
	LDA #$8C
	STA SpriteDMAArea + $91
	STA SpriteDMAArea + $95
	STA SpriteDMAArea + $99
	LDA byte_RAM_10
	LSR A
	AND #$03
	STA byte_RAM_0
	LSR A
	ROR A
	ROR A
	AND #$C0
	ORA byte_RAM_0
	STA SpriteDMAArea + $92
	STA SpriteDMAArea + $96
	STA SpriteDMAArea + $9A
	RTS

EnemyBehavior_Rocket_Launching:
	; Wait until ObjectBeingCarriedTimer reaches 1 to start the boosters
	LDA ObjectBeingCarriedTimer, X
	CMP #$01
	BNE EnemyBehavior_Rocket_Carry

	; Setting EnemyArray_B1 puts the rocket in the area
	STA EnemyArray_B1, X
	STA PlayerInRocket
	LDA #SoundEffect3_Rumble_A
	STA SoundEffectQueue3
	LDA #$FE
	STA ObjectYVelocity, X

EnemyBehavior_Rocket_Carry:
	JSR CarryObject

RenderSprite_Rocket:
	LDA SpriteTempScreenY
	STA byte_RAM_0
	LDA SpriteTempScreenX
	SEC
	SBC #$08
	STA byte_RAM_1
	LDA #$02
	STA byte_RAM_2
	STA byte_RAM_5
	STA byte_RAM_C
	LDA ObjectAttributes, X
	AND #$23
	STA byte_RAM_3
	LDY #$00
	LDX #$96
	JSR loc_BANK2_9C53

	LDA byte_RAM_1
	CLC
	ADC #$10
	STA byte_RAM_1
	DEC byte_RAM_2
	LDA SpriteTempScreenY
	STA byte_RAM_0
	LDY #$10
	LDX #$96
	JMP loc_BANK2_9C53


; ---------------------------------------------------------------------------
byte_BANK3_AC25:
	.db $F0

byte_BANK3_AC26:
	.db $00
	.db $F0


; =============== S U B R O U T I N E =======================================

RenderSprite_Fryguy:
	LDA #$00
	STA byte_RAM_EE
	LDA ObjectAnimationTimer, X
	AND #$08
	LSR A
	LSR A
	LSR A
	STA byte_RAM_7
	LDY byte_RAM_7
	LDA SpriteTempScreenX
	PHA
	CLC
	ADC byte_BANK3_AC25, Y
	STA SpriteTempScreenX
	LDA #$80
	LDY ObjectFlashTimer, X
	BEQ loc_BANK3_AC4B

	LDA #$88

loc_BANK3_AC4B:
	JSR RenderSprite_DrawObject

	JSR FindSpriteSlot

	STY_abs byte_RAM_F4
	PLA
	CLC
	LDY byte_RAM_7
	ADC byte_BANK3_AC26, Y
	STA SpriteTempScreenX
	LDA #$84
	LDY ObjectFlashTimer, X
	BEQ loc_BANK3_AC67

	LDA #$8C

loc_BANK3_AC67:
	JMP RenderSprite_DrawObject


; ---------------------------------------------------------------------------

EnemyInit_Fryguy:
	JSR EnemyInit_Basic

IFDEF RESET_CHR_LATCH
	LDA #$02
	JSR SetBossTileset
ENDIF

	LDA #$04
	STA EnemyHP, X
	LDA #$00
	STA EnemyVariable, X
	RTS

; ---------------------------------------------------------------------------
byte_BANK3_AC77:
	.db $E0
	.db $20
	.db $F0
	.db $10

byte_BANK3_AC7B:
	.db $04
	.db $0C
	.db $04
	.db $0C

byte_BANK3_AC7F:
	.db $04
	.db $04
	.db $0C
	.db $0C

byte_BANK3_AC83:
	.db $01
	.db $FF

byte_BANK3_AC85:
	.db $2A
	.db $D6

byte_BANK3_AC87:
	.db $01
	.db $FF

byte_BANK3_AC89:
	.db $18
	.db $E8
; ---------------------------------------------------------------------------

EnemyBehavior_Fryguy:
	LDA #$02
	STA EnemyMovementDirection, X
	INC ObjectAnimationTimer, X
	LDY EnemyHP, X
	DEY
	BNE loc_BANK3_ACE7

	LDA #$03
	STA byte_RAM_9
	STA FryguySplitFlames
	JSR EnemyDestroy

loc_BANK3_ACA1:
	JSR CreateEnemy

	BMI loc_BANK3_ACE3

	LDY byte_RAM_0
	LDA ObjectYHi, X
	STA EndOfLevelDoorPage, Y
	LDA #$F0
	STA ObjectYVelocity, Y
	LDA #Enemy_FryguySplit
	STA ObjectType, Y
	LDA #$30
	STA ObjectTimer2, Y
	LDA ObjectYLo, X
	PHA
	LDX byte_RAM_9
	LDA byte_BANK3_AC77, X
	STA ObjectXVelocity, Y
	LDA SpriteTempScreenX
	ADC byte_BANK3_AC7B, X
	STA ObjectXLo, Y
	PLA
	ADC byte_BANK3_AC7F, X
	STA ObjectYLo, Y
	LDA #$00
	STA ObjectXHi, Y
	TYA
	TAX
	JSR SetEnemyAttributes

	LDX byte_RAM_12

loc_BANK3_ACE3:
	DEC byte_RAM_9
	BPL loc_BANK3_ACA1

loc_BANK3_ACE7:
	LDA byte_RAM_10
	AND #$1F
	BNE loc_BANK3_AD07

	JSR CreateEnemy

	LDX byte_RAM_0
	LDA #Enemy_Fireball
	STA ObjectType, X
	LDA ObjectXLo, X
	SBC #$08
	STA ObjectXLo, X
	LDA ObjectYLo, X
	ADC #$18
	STA ObjectYLo, X
	JSR EnemyInit_BasicAttributes

	LDX byte_RAM_12

loc_BANK3_AD07:
	LDA byte_RAM_10
	AND #$01
	BNE loc_BANK3_AD37

	LDA EnemyVariable, X
	AND #$01
	TAY
	LDA ObjectYVelocity, X
	CLC
	ADC byte_BANK3_AC87, Y
	STA ObjectYVelocity, X
	CMP byte_BANK3_AC89, Y
	BNE loc_BANK3_AD21

	INC EnemyVariable, X

loc_BANK3_AD21:
	LDA EnemyArray_477, X
	AND #$01
	TAY
	LDA ObjectXVelocity, X
	CLC
	ADC byte_BANK3_AC83, Y
	STA ObjectXVelocity, X
	CMP byte_BANK3_AC85, Y
	BNE loc_BANK3_AD37

	INC EnemyArray_477, X

loc_BANK3_AD37:
	JSR RenderSprite_Fryguy

	JSR ApplyObjectPhysicsY

	JMP ApplyObjectPhysicsX

FryguyFlame_JumpTimeout:
	.db $3F
	.db $3F
	.db $3F
	.db $7F

FryguyFlame_JumpVelocityY:
	.db $D4
	.db $D8
	.db $DA
	.db $DE


EnemyBehavior_FryguySplit:
	LDA EnemyCollision, X
	AND #$10
	BEQ loc_BANK3_AD59

	JSR PlayBossHurtSound

	LDA #%00000000
	STA EnemyArray_46E, X
	JMP TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------

loc_BANK3_AD59:
	LDA #$02
	STA EnemyMovementDirection, X
	LDA byte_RAM_10
	STA ObjectShakeTimer, X
	INC ObjectAnimationTimer, X
	INC ObjectAnimationTimer, X
	JSR ObjectTileCollision

	JSR RenderSprite

	LDA EnemyCollision, X
	PHA
	AND #CollisionFlags_Down
	BEQ loc_BANK3_AD7A

	JSR ResetObjectYVelocity

	LDA #$00
	STA ObjectXVelocity, X

loc_BANK3_AD7A:
	PLA
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ loc_BANK3_AD85

	JSR EnemyBehavior_TurnAround

	JSR HalfObjectVelocityX

loc_BANK3_AD85:
	TXA
	ASL A
	ASL A
	ASL A
	ADC byte_RAM_10
	LDY FryguySplitFlames
	AND FryguyFlame_JumpTimeout, Y
	ORA ObjectYVelocity, X
	BNE loc_BANK3_ADAB

	LDA PseudoRNGValue
	AND #$1F
	ORA FryguyFlame_JumpVelocityY, Y
	STA ObjectYVelocity, X
	JSR EnemyInit_BasicMovementTowardPlayer

	LDA FryguySplitFlames
	CMP #$02
	BCS loc_BANK3_ADAB

	; Double x-velocity for the last flame
	ASL ObjectXVelocity, X

loc_BANK3_ADAB:
IFDEF REV_A
	LDA PlayerState
	CMP #PlayerState_ChangingSize
	BEQ +
ENDIF

	JSR ApplyObjectPhysicsX

	JMP ApplyObjectMovement_Vertical

IFDEF REV_A
	+ RTS
ENDIF

; ---------------------------------------------------------------------------

EnemyBehavior_Autobomb:
	LDA EnemyArray_B1, X
	BNE loc_BANK3_ADF9

	LDA EnemyCollision, X
	AND #$10
	ORA ObjectBeingCarriedTimer, X
	BEQ loc_BANK3_ADF9

	LDA #Enemy_ShyguyRed
	STA ObjectType, X
	JSR SetEnemyAttributes

	LDA EnemyRawDataOffset, X
	STA byte_RAM_6
	LDA #$FF
	STA EnemyRawDataOffset, X
	JSR CreateEnemy

	BMI loc_BANK3_ADF9

	LDY byte_RAM_0
	LDA byte_RAM_6
	STA EnemyRawDataOffset, Y
	LDA ObjectXLo, X
	STA ObjectXLo, Y
	LDA ObjectXHi, X
	STA ObjectXHi, Y
	LDX byte_RAM_0
	LDA #Enemy_Autobomb
	STA ObjectType, X
	JSR EnemyInit_BasicAttributes

	INC EnemyArray_B1, X
	JSR SetEnemyAttributes

	LDA #$04
	STA ObjectHitbox, X
	LDX byte_RAM_12

loc_BANK3_ADF9:
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR ObjectTileCollision

	LDA EnemyCollision, X
	PHA
	AND #CollisionFlags_Down
	BEQ loc_BANK3_AE09

	JSR ResetObjectYVelocity

loc_BANK3_AE09:
	PLA
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ loc_BANK3_AE14

	JSR EnemyBehavior_TurnAround

	JSR ApplyObjectPhysicsX

loc_BANK3_AE14:
	INC ObjectAnimationTimer, X
	LDA EnemyArray_B1, X
	BNE loc_BANK3_AE45

	TXA
	ASL A
	ASL A
	ASL A
	ASL A
	ADC byte_RAM_10
	AND #$7F
	BNE loc_BANK3_AE28

	JSR EnemyInit_BasicMovementTowardPlayer

loc_BANK3_AE28:
	LDA ObjectAnimationTimer, X
	AND #%01111111
	BNE loc_BANK3_AE45

	JSR EnemyInit_BasicMovementTowardPlayer

	; which bullet?
	JSR CreateBullet

	BMI loc_BANK3_AE45

	LDX byte_RAM_0 ; X has the new enemy index
	LDA #Enemy_AutobombFire
	; Set the enemy type and attributes
	; BUG: The subroutine overwrites RAM_0 (enemy index)
	; Should have pushed it to stack instead.
	JSR EnemyBehavior_SpitProjectile

	LDX byte_RAM_0
	DEC ObjectYLo, X
	DEC ObjectYLo, X
	LDX byte_RAM_12

loc_BANK3_AE45:
	JSR ApplyObjectMovement

	JMP RenderSprite

; ---------------------------------------------------------------------------

RenderSprite_Autobomb:
	LDA EnemyState, X
	CMP #EnemyState_Alive
	BEQ loc_BANK3_AE5C

	LDA #ObjAttrib_Palette1 | ObjAttrib_16x32 | ObjAttrib_UpsideDown
	STA ObjectAttributes, X
	STA ObjectAnimationTimer, X
	LDA #$76
	JMP RenderSprite_DrawObject

; ---------------------------------------------------------------------------

loc_BANK3_AE5C:
	LDA EnemyArray_B1, X
	BNE loc_BANK3_AE7C

	LDA_abs byte_RAM_F4
	PHA
	LDA SpriteTempScreenY
	CLC
	ADC #$F5
	STA SpriteTempScreenY
	JSR FindSpriteSlot

	STY_abs byte_RAM_F4
	LDA #$7C
	JSR RenderSprite_DrawObject

	PLA
	STA_abs byte_RAM_F4

loc_BANK3_AE7C:
	LDA ObjectYLo, X
	STA SpriteTempScreenY
	JSR RenderSprite_NotAlbatoss

	LDA #$02
	STA EnemyMovementDirection, X
	TYA
	CLC
	ADC #$08
	STA_abs byte_RAM_F4
	LDA byte_RAM_0
	STA SpriteTempScreenY
	LDA #%11010000
	STA EnemyArray_46E, X
	LDA #$78
	JSR RenderSprite_DrawObject

	LDA #$50
	LDY EnemyArray_B1, X
	BEQ loc_BANK3_AEA6

	LDA #%01010010

loc_BANK3_AEA6:
	STA EnemyArray_46E, X
	RTS

; ---------------------------------------------------------------------------

EnemyInit_WhaleSpout:
	JSR EnemyInit_Basic

	LDA ObjectYLo, X
	STA EnemyArray_B1, X
	RTS

; ---------------------------------------------------------------------------

EnemyBehavior_WhaleSpout:
	INC ObjectAnimationTimer, X
	INC ObjectAnimationTimer, X
	INC EnemyVariable, X
	LDA EnemyVariable, X
	CMP #$40
	BCS loc_BANK3_AEC3

	LDA #$E0
	STA ObjectYLo, X

locret_BANK3_AEC2:
	RTS

; ---------------------------------------------------------------------------

loc_BANK3_AEC3:
	BNE loc_BANK3_AECD

	LDA #$D0
	STA ObjectYVelocity, X
	LDA EnemyArray_B1, X
	STA ObjectYLo, X

loc_BANK3_AECD:
	LDA #SoundEffect3_ShortNoise
	STA SoundEffectQueue3
	LDA EnemyVariable, X
	CMP #$80
	BCC loc_BANK3_AEE6

	CMP #$DC
	BCS loc_BANK3_AEE6

	LDY #$03
	AND #$10
	BEQ loc_BANK3_AEE4

	LDY #$FB

loc_BANK3_AEE4:
	STY ObjectYVelocity, X

loc_BANK3_AEE6:
	INC ObjectYVelocity, X
	JSR ApplyObjectPhysicsY

RenderSprite_WhaleSpout:
	LDA byte_RAM_EE
	AND #$C
	BNE locret_BANK3_AEC2

	LDA EnemyVariable, X
	STA byte_RAM_7
	LDA #$29
	STA ObjectAttributes, X
	LDA #$92
	LDY EnemyVariable, X
	CPY #$DC
	BCC loc_BANK3_AF03

	LDA #$94

loc_BANK3_AF03:
	JSR RenderSprite_DrawObject

	JSR FindSpriteSlot

	LDA #$55
	LDX byte_RAM_7
	CPX #$E0
	BCC loc_BANK3_AF13

	LDA #$3A

loc_BANK3_AF13:
	STA SpriteDMAArea + 1, Y
	LDA #$55
	CPX #$E8
	BCC loc_BANK3_AF1E

	LDA #$3A

loc_BANK3_AF1E:
	STA SpriteDMAArea + 5, Y
	LDA #$55
	CPX #$F0
	BCC loc_BANK3_AF29

	LDA #$3A

loc_BANK3_AF29:
	STA SpriteDMAArea + 9, Y
	LDA #$55
	CPX #$F8
	BCC loc_BANK3_AF34

	LDA #$3A

loc_BANK3_AF34:
	STA SpriteDMAArea + $D, Y
	LDX_abs byte_RAM_F4
	LDA SpriteDMAArea + 2, X
	STA SpriteDMAArea + 2, Y
	STA SpriteDMAArea + 6, Y
	STA SpriteDMAArea + $A, Y
	STA SpriteDMAArea + $E, Y
	LDA SpriteTempScreenX
	CLC
	ADC #$04
	STA SpriteDMAArea + 3, Y
	STA SpriteDMAArea + 7, Y
	STA SpriteDMAArea + $B, Y
	STA SpriteDMAArea + $F, Y
	LDX byte_RAM_12
	LDA ObjectYLo, X
	CLC
	ADC #$F
	STA SpriteDMAArea, Y
	ADC #$10
	STA SpriteDMAArea + 4, Y
	ADC #$10
	STA SpriteDMAArea + 8, Y
	ADC #$10
	STA SpriteDMAArea + $C, Y

locret_BANK3_AF74:
	RTS

; ---------------------------------------------------------------------------
	.db $1C
byte_BANK3_AF76:
	.db $E4

	.db $01
	.db $FF
; ---------------------------------------------------------------------------

EnemyBehavior_Flurry:
	INC ObjectAnimationTimer, X
	JSR EnemyBehavior_CheckDamagedInterrupt

	JSR EnemyBehavior_CheckBeingCarriedTimerInterrupt

	JSR ObjectTileCollision

	LDA EnemyCollision, X
	AND #CollisionFlags_Right | CollisionFlags_Left
	BEQ loc_BANK3_AF8D

	JSR EnemyBehavior_TurnAround

loc_BANK3_AF8D:
	LDA EnemyCollision, X
	AND #CollisionFlags_Down
	BEQ loc_BANK3_AFB4

	LDA ObjectYVelocity, X
	PHA
	JSR ResetObjectYVelocity

	PLA
	LDY ObjectProjectileTimer, X
	BEQ loc_BANK3_AFB4

	CMP #$18
	BMI loc_BANK3_AFAC

	JSR HalfObjectVelocityX

	LDA #$F0
	STA ObjectYVelocity, X
	BNE loc_BANK3_AFDA

loc_BANK3_AFAC:
	LDA #$00
	STA ObjectProjectileTimer, X
	JSR SetEnemyAttributes

loc_BANK3_AFB4:
	LDA byte_RAM_E
	CMP #$16
	BEQ loc_BANK3_AFBF

	DEC ObjectAnimationTimer, X
	JMP loc_BANK2_9470

; ---------------------------------------------------------------------------

loc_BANK3_AFBF:
	JSR EnemyFindWhichSidePlayerIsOn

	INY
	STY EnemyMovementDirection, X
	LDA byte_RAM_10
	AND #$01
	BNE loc_BANK3_AFDA

	LDA ObjectXVelocity, X
	CMP locret_BANK3_AF74, Y
	BEQ loc_BANK3_AFDA

	CLC
	ADC byte_BANK3_AF76, Y
	STA ObjectXVelocity, X
	INC ObjectAnimationTimer, X

loc_BANK3_AFDA:
	JSR ApplyObjectMovement

	INC ObjectNonSticky, X
	JMP RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_HawkmouthBoss:
	JSR EnemyInit_Hawkmouth ; Falls through to EnemyInit_Stationary

	LDA #$03
	STA EnemyHP, X
	RTS

; ---------------------------------------------------------------------------
byte_BANK3_AFEC:
	.db $01
	.db $FF
byte_BANK3_AFEE:
	.db $28
	.db $D8
byte_BANK3_AFF0:
	.db $01
	.db $FF
byte_BANK3_AFF2:
	.db $10
	.db $F0
; ---------------------------------------------------------------------------

EnemyBehavior_HawkmouthBoss:
	JSR RenderSprite_HawkmouthBoss

	LDA #%00000110
	STA EnemyArray_46E, X
	LDA #$02
	STA EnemyPlayerCollisionTable_RAM + Enemy_HawkmouthBoss
	LDA CrystalAndHawkmouthOpenSize
	BEQ locret_BANK3_B05F

	CMP #$01
	BNE loc_BANK3_B01C

	STA EnemyArray_480, X
	LDA #$90
	STA ObjectTimer1, X
	LDA #$40
	STA ObjectStunTimer, X
	STA ObjectFlashTimer, X
	STA CrystalAndHawkmouthOpenSize

loc_BANK3_B01C:
	LDA EnemyArray_480, X
	CMP #$02
	BCC loc_BANK3_B09B

	LDA EnemyArray_B1, X
	BNE loc_BANK3_B03B

	INC EnemyArray_480, X
	LDA EnemyArray_480, X
	CMP #$31
	BNE HawkmouthEat

	LDA ObjectTimer2, X
	BNE loc_BANK3_B03B

	INC EnemyArray_B1, X
	JSR sub_BANK3_B095

loc_BANK3_B03B:
	DEC EnemyArray_480, X
	LDY EnemyArray_480, X
	DEY
	BNE HawkmouthEat

	DEC EnemyArray_B1, X
	LDA PlayerState
	CMP #PlayerState_HawkmouthEating
	BNE HawkmouthEat

	LDA #TransitionType_Door
	STA TransitionType
	JSR DoAreaReset

	LDA #$09
	STA PlayerXHi
	INC DoAreaTransition
	PLA
	PLA
	PLA
	PLA

locret_BANK3_B05F:
	RTS

; ---------------------------------------------------------------------------

HawkmouthEat:
	LDA EnemyArray_480, X ; Hawkmouth code?
	CMP #$30
	BNE locret_BANK3_B09A

	LDA EnemyCollision, X ; make sure the player is inside Hawkmouth
	AND #CollisionFlags_PlayerInsideMaybe
	BEQ locret_BANK3_B09A

	LDA HoldingItem ; make sure player is not holding something
	BNE locret_BANK3_B09A

	STA PlayerCollision ; start eating player
	INC EnemyArray_B1, X
	INC HawkmouthClosing
	DEC EnemyArray_480, X
	LDA ObjectXLo, X
	STA PlayerXLo
	LDA ObjectXHi, X
	STA PlayerXHi
	LDA ObjectYLo, X
	ADC #$10
	STA PlayerYLo
	LDA #PlayerState_HawkmouthEating
	STA PlayerState
	LDA #$60
	STA PlayerStateTimer
	LDA #$FC
	STA PlayerYVelocity

; =============== S U B R O U T I N E =======================================

sub_BANK3_B095:
	LDA #SoundEffect1_HawkOpen_WartBarf
	STA SoundEffectQueue1

locret_BANK3_B09A:
	RTS

; End of function sub_BANK3_B095

; ---------------------------------------------------------------------------

loc_BANK3_B09B:
	LDA #%00000011
	STA EnemyArray_46E, X
	LDA #$00
	STA EnemyPlayerCollisionTable_RAM + Enemy_HawkmouthBoss
	LDA EnemyHP, X
	BNE loc_BANK3_B0BA

	LDA #$03 ; Hawkmouth Boss health?
	STA EnemyHP, X
	JSR sub_BANK3_B095

	INC EnemyArray_480, X
	LDA #$FF
	STA ObjectTimer2, X

loc_BANK3_B0BA:
	LDA byte_RAM_10
	LSR A
	BCC loc_BANK3_B0E3

	LDA EnemyVariable, X
	AND #$01
	TAY
	LDA ObjectYVelocity, X
	CLC
	ADC byte_BANK3_AFF0, Y
	STA ObjectYVelocity, X
	CMP byte_BANK3_AFF2, Y
	BNE loc_BANK3_B0D3

	INC EnemyVariable, X

loc_BANK3_B0D3:
	JSR EnemyFindWhichSidePlayerIsOn

	LDA ObjectXVelocity, X
	CMP byte_BANK3_AFEE, Y
	BEQ loc_BANK3_B0E3

	CLC
	ADC byte_BANK3_AFEC, Y
	STA ObjectXVelocity, X

loc_BANK3_B0E3:
	JMP sub_BANK2_9430

; ---------------------------------------------------------------------------
byte_BANK3_B0E6:
	.db $F8
	.db $10

; =============== S U B R O U T I N E =======================================

RenderSprite_HawkmouthBoss:
	LDA EnemyArray_480, X
	JSR sub_BANK2_8E13

	LDA CrystalAndHawkmouthOpenSize
	BEQ loc_BANK3_B16D

	LDA byte_RAM_EE
	AND #$0C
	BNE loc_BANK3_B16D

	; draw the back of Hawkmouth
	LDA ObjectTimer1, X
	STA byte_RAM_7
	JSR FindSpriteSlot

	LDX byte_RAM_2
	LDA SpriteTempScreenX
	CLC
	ADC byte_BANK3_B0E6 - 1, X
	PHA
	PHP
	DEX
	BEQ loc_BANK3_B112

	PLA
	EOR #$01
	PHA

loc_BANK3_B112:
	PLP
	PLA
	BCC loc_BANK3_B16D

	STA SpriteDMAArea + 3, Y
	STA SpriteDMAArea + 7, Y
	STA SpriteDMAArea + $B, Y
	STA SpriteDMAArea + $F, Y
	LDX DoorAnimationTimer
	BEQ loc_BANK3_B129

	LDX #$10

loc_BANK3_B129:
	LDA SpriteDMAArea, X
	STA SpriteDMAArea, Y
	CLC
	ADC #$10
	STA SpriteDMAArea + 4, Y
	LDA byte_RAM_7
	BEQ loc_BANK3_B13B

	LDA #$20

loc_BANK3_B13B:
	ORA SpriteDMAArea + 2, X
	STA SpriteDMAArea + 2, Y
	STA SpriteDMAArea + 6, Y
	STA SpriteDMAArea + $A, Y
	STA SpriteDMAArea + $E, Y
	LDX_abs byte_RAM_F4
	LDA SpriteDMAArea, X
	STA SpriteDMAArea + 8, Y
	CLC
	ADC #$10
	STA SpriteDMAArea + $C, Y
	LDA #$F0
	STA SpriteDMAArea + 1, Y
	LDA #$F2
	STA SpriteDMAArea + 5, Y
	LDA #$F4
	STA SpriteDMAArea + 9, Y
	LDA #$F6
	STA SpriteDMAArea + $D, Y

loc_BANK3_B16D:
	LDX byte_RAM_12
	RTS


VegetableThrowerOffsetX:
	.db $08
	.db $28
	.db $48
	.db $28

VegetableThrowerOffsetY:
	.db $94
	.db $84
	.db $94
	.db $84

VegetableThrowerVelocity:
	.db $F8
	.db $08
	.db $F8
	.db $08
	.db $08
	.db $F8
	.db $08
	.db $F8


Generator_VegetableThrower:
	LDA HoldingItem
	BNE locret_BANK3_B1CC

	LDA byte_RAM_10
	AND #$FF
	BNE locret_BANK3_B1CC

	INC VegetableThrowerShotCounter
	JSR CreateEnemy_TryAllSlots

	BMI locret_BANK3_B1CC

	LDX byte_RAM_0
	LDA VegetableThrowerShotCounter
	AND #$07
	TAY
	LDA VegetableThrowerVelocity, Y
	STA ObjectXVelocity, X
	TYA
	AND #$03
	TAY
	LDA #$02
	STA ObjectXHi, X
	LDA VegetableThrowerOffsetX, Y
	STA ObjectXLo, X
	LDA VegetableThrowerOffsetY, Y
	STA ObjectYLo, X
	LDA #$00
	STA ObjectYHi, X
	LDA PseudoRNGValue
	AND #$03
	CMP #$02
	BCC loc_BANK3_B1C1

	ASL A
	STA EnemyArray_B1, X

loc_BANK3_B1C1:
	LDY #Enemy_VegetableLarge
	STY ObjectType, X
	JSR SetEnemyAttributes

	LDA #$D0
	STA ObjectYVelocity, X

locret_BANK3_B1CC:
	RTS

; ---------------------------------------------------------------------------

EnemyInit_Wart:
	JSR EnemyInit_Basic

IFDEF RESET_CHR_LATCH
	LDA #$04
	JSR SetBossTileset
ENDIF

	LDA #$06
	STA EnemyHP, X
	LDA ObjectXHi, X
	STA EndOfLevelDoorPage, X
	RTS


WartBubbleYVelocity:
	.db $E0
	.db $F0
	.db $E8
	.db $E4


;
; Wart
; ====
;
; Walks back and forth, spits bubbles
;
; ObjectTimer1 = counter used to determing the bubble spit distance
; EnemyVariable = counter used to pause while walking back and forth
; EnemyArray_480 = counter used to determine the bubble spit height
; EnemyArray_B1 = counter for death animation
; EnemyArray_477 = counter used for alternating steps
; ObjectFlashTimer = counter for blinking while hurt
;
EnemyBehavior_Wart:
	LDA EnemyArray_B1, X
	BNE EnemyBehavior_Wart_Death

	LDA EnemyHP, X
	BNE EnemyBehavior_Wart_Alive

	; start the death sequence
	LDA #$80
	STA ObjectTimer1, X
	STA EnemyArray_B1, X
	BNE EnemyBehavior_Wart_Exit

EnemyBehavior_Wart_Alive:
	INC EnemyVariable, X
	LDA byte_RAM_10
	AND #%11111111
	BNE EnemyBehavior_Wart_Movement

	; spit bubbles
	LDA #$5F
	STA ObjectTimer1, X
	; counter that determines which index of WartBubbleYVelocity to use
	INC EnemyArray_480, X

EnemyBehavior_Wart_Movement:
	LDA #$00
	STA ObjectXVelocity, X

	; pause at the end of movement
	LDA EnemyVariable, X
	AND #%01000000
	BEQ EnemyBehavior_Wart_PhysicsX

	; increment animation timer
	INC EnemyArray_477, X
	LDA #$F8 ; left movement
	LDY EnemyVariable, X
	BPL EnemyBehavior_Wart_SetXVelocity

	LDA #$08 ; right movement

EnemyBehavior_Wart_SetXVelocity:
	STA ObjectXVelocity, X

EnemyBehavior_Wart_PhysicsX:
	JSR ApplyObjectPhysicsX

	LDA ObjectFlashTimer, X
	BNE EnemyBehavior_Wart_Exit

	LDA ObjectTimer1, X
	BEQ EnemyBehavior_Wart_Exit

	AND #$0F
	BNE EnemyBehavior_Wart_Exit

	; try to create a new enemy for the bubble
	JSR CreateEnemy

	BMI EnemyBehavior_Wart_Exit

	LDA #SoundEffect1_HawkOpen_WartBarf
	STA SoundEffectQueue1
	; determines how high to spit the bubble
	LDA EnemyArray_480, X
	AND #$03
	TAY
	; determines how far to spit the bubble
	LDA ObjectTimer1, X

	; set up the bubble
	LDX byte_RAM_0
	LSR A
	EOR #$FF
	STA ObjectXVelocity, X
	LDA WartBubbleYVelocity, Y
	STA ObjectYVelocity, X
	LDA #Enemy_WartBubble
	STA ObjectType, X
	LDA ObjectYLo, X
	ADC #$08
	STA ObjectYLo, X
	JSR SetEnemyAttributes

	LDX byte_RAM_12

EnemyBehavior_Wart_Exit:
	JMP RenderSprite


EnemyBehavior_Wart_Death:
	LDA ObjectTimer1, X
	BEQ EnemyBehavior_Wart_DeathFall

	; going up
	STA ObjectFlashTimer, X
	INC EnemyArray_477, X
	INC EnemyArray_477, X
	LDA #$F0
	STA ObjectYVelocity, X
	BNE EnemyBehavior_Wart_Death_Exit

EnemyBehavior_Wart_DeathFall:
	LDA #$04
	STA ObjectXVelocity, X
	JSR ApplyObjectPhysicsX

	JSR ApplyObjectPhysicsY

	; every other frame
	LDA byte_RAM_10
	LSR A
	BCS EnemyBehavior_Wart_CheckDeathComplete

	INC ObjectYVelocity, X
	BMI EnemyBehavior_Wart_CheckDeathComplete

	LDA byte_RAM_10
	AND #$1F
	BNE EnemyBehavior_Wart_CheckDeathComplete

	LDA #DPCM_BossDeath
	STA DPCMQueue
	JSR CreateEnemy

	LDX byte_RAM_0
	LDA ObjectYLo, X
	ADC #$08
	STA ObjectYLo, X
	JSR TurnIntoPuffOfSmoke

EnemyBehavior_Wart_CheckDeathComplete:
	LDA ObjectYLo, X
	CMP #$D0
	BCC EnemyBehavior_Wart_Death_Exit

	LDA #EnemyState_Dead
	STA EnemyState, X

EnemyBehavior_Wart_Death_Exit:
	JMP RenderSprite


EnemyBehavior_WartBubble:
	INC ObjectAnimationTimer, X
	JSR ApplyObjectPhysicsX

	JSR ApplyObjectPhysicsY

	INC ObjectYVelocity, X
	JMP RenderSprite

EnemyBehavior_WartBubble_Exit:
	RTS


RenderSprite_Wart:
	LDA_abs byte_RAM_F4
	STA WartOAMOffsets_RAM + 2
	STA WartOAMOffsets_RAM + 6
	LDA byte_RAM_10
	AND #$03
	STA byte_RAM_7
	TAY
	LDA WartOAMOffsets_RAM, Y
	STA_abs byte_RAM_F4
	LDA byte_RAM_EF
	BNE EnemyBehavior_WartBubble_Exit

	LDY EnemyHP, X
	BNE RenderSprite_Wart_AfterObjAttrib

	; he dead
	LDA #ObjAttrib_Horizontal | ObjAttrib_FrontFacing | ObjAttrib_16x32 | ObjAttrib_Palette2
	STA ObjectAttributes, X

RenderSprite_Wart_AfterObjAttrib:
	LDA byte_RAM_EE
	PHA
	PHA
	LDY #$AE ; top row: shocked
	LDA EnemyArray_B1, X ; death counter
	BNE RenderSprite_Wart_TopHurt

	LDA ObjectFlashTimer, X ; enemy timer
	BEQ RenderSprite_Wart_TopRegular

	CMP #$30
	BCS RenderSprite_Wart_TopHurt

	AND #$08
	BNE RenderSprite_Wart_TopHurt

	LDY #$9E ; top row: blinking

RenderSprite_Wart_TopHurt:
	TYA
	BNE RenderSprite_Wart_DrawTop

RenderSprite_Wart_TopRegular:
	LDA #$9E ; top row: regular
	LDY ObjectTimer1, X
	BEQ RenderSprite_Wart_DrawTop

	LDA #$A2 ; top row: spitting

RenderSprite_Wart_DrawTop:
	JSR RenderSprite_DrawObject

	LDA byte_RAM_0
	STA SpriteTempScreenY
	LDY byte_RAM_7
	LDA WartOAMOffsets_RAM + 1, Y
	STA_abs byte_RAM_F4
	LDY #$A6 ; middle row: regular
	LDA EnemyArray_B1, X
	BNE RenderSprite_Wart_MiddleHurt

	LDA ObjectFlashTimer, X
	BEQ RenderSprite_Wart_MiddleRegular

	CMP #$30
	BCS RenderSprite_Wart_MiddleHurt

	AND #$08
	BNE RenderSprite_Wart_MiddleHurt

	BEQ RenderSprite_Wart_DrawMiddle

RenderSprite_Wart_MiddleRegular:
	LDA ObjectTimer1, X
	BEQ RenderSprite_Wart_DrawMiddle

RenderSprite_Wart_MiddleHurt:
	LDY #$AA ; middle row: spitting

RenderSprite_Wart_DrawMiddle:
	PLA
	STA byte_RAM_EE
	TYA
	JSR RenderSprite_DrawObject

	LDA byte_RAM_0
	STA SpriteTempScreenY
	LDY byte_RAM_7
	LDA WartOAMOffsets_RAM + 2, Y
	STA_abs byte_RAM_F4
	LDY #$BA ; bottom row: standing
	LDA ObjectXVelocity, X
	BEQ RenderSprite_Wart_DrawBottom

	LDY #$B2 ; bottom row: left foot up
	LDA EnemyArray_477, X
	AND #$10
	BEQ RenderSprite_Wart_DrawBottom

	LDY #$B6 ; bottom row: right foot up

RenderSprite_Wart_DrawBottom:
	PLA
	STA byte_RAM_EE
	TYA
	JSR RenderSprite_DrawObject

	LDA byte_RAM_EE
	BNE RenderSprite_Wart_Exit

	; draw backside
	LDY byte_RAM_7
	LDX WartOAMOffsets_RAM + 2, Y
	LDA WartOAMOffsets_RAM + 3, Y
	TAY
	LDA SpriteTempScreenX
	CLC
	ADC #$20
	BCS RenderSprite_Wart_Exit

	STA SpriteDMAArea + 3, Y
	STA SpriteDMAArea + 7, Y
	STA SpriteDMAArea + $B, Y
	LDA byte_RAM_0
	SBC #$2F
	STA SpriteDMAArea, Y
	ADC #$0F
	STA SpriteDMAArea + 4, Y
	ADC #$10
	STA SpriteDMAArea + 8, Y
	LDA SpriteDMAArea + 2, X
	STA SpriteDMAArea + 2, Y
	STA SpriteDMAArea + 6, Y
	STA SpriteDMAArea + $A, Y
	LDA #$19 ; top
	STA SpriteDMAArea + 1, Y
	LDA #$1B ; middle
	STA SpriteDMAArea + 5, Y
	LDA #$1D ; bottom
	STA SpriteDMAArea + 9, Y

RenderSprite_Wart_Exit:
	LDX byte_RAM_12
	RTS


; Unused space in the original ($B39B - $B4DF)
unusedSpace $B4E0, $FF


byte_BANK3_B4E0:
	.db $F0
	.db $10


;
; Determine whether the Hoopstar has reached the end of its climbable range.
;
; Output
;   C = whether or not the Hoopstar is on a climbable tile
;
EnemyBehavior_Hoopstar_Climb:
	JSR ClearDirectionalCollisionFlags

	TAY
	LDA ObjectYVelocity - 1, X
	BMI EnemyBehavior_Hoopstar_ClimbUp

EnemyBehavior_Hoopstar_ClimbDown:
	INY

EnemyBehavior_Hoopstar_ClimbUp:
	JSR EnemyBehavior_Hoopstar_CheckBackgroundTile

	BCS EnemyBehavior_Hoopstar_Climb_Exit

	LDA byte_RAM_0
	CMP #BackgroundTile_PalmTreeTrunk
	BEQ EnemyBehavior_Hoopstar_Climb_Exit

	CLC

EnemyBehavior_Hoopstar_Climb_Exit:
	DEX
	RTS


;
; Object/background collision that treats non-sky background tiles as solid,
; such as for Sparks and Mushroom Blocks
;
ObjectTileCollision_SolidBackground:
	LDA #$04
	BNE ObjectTileCollision_Main

;
; Normal object/background collision
;
ObjectTileCollision:
	LDA #$00

;
; Object Tile Collision
; =====================
;
; Handles object collision with background tiles
;
; Input
;   A = whether or not to treat walk-through tiles as solid
;   X = enemy index
; Output
;  EnemyCollision, X = collision flags
;
ObjectTileCollision_Main:
	STA byte_RAM_7
	LDA #$00
	STA byte_RAM_B
	STA byte_RAM_E
	JSR ClearDirectionalCollisionFlags

	STA byte_RAM_8
	LDA ObjectYVelocity - 1, X
	BPL ObjectTileCollision_Downward

ObjectTileCollision_Upward:
	JSR CheckEnemyTileCollision

	INC byte_RAM_7
	INC byte_RAM_8
	BNE loc_BANK3_B57B

ObjectTileCollision_Downward:
	INC byte_RAM_7
	INC byte_RAM_8
	JSR CheckEnemyTileCollision

ObjectTileCollision_CheckQuicksand:
	LDA ObjectType - 1, X
	CMP #Enemy_CobratJar
	BEQ ObjectTileCollision_CheckConveyor

	CMP #Enemy_CobratSand
	BEQ ObjectTileCollision_CheckConveyor

IFNDEF ENABLE_TILE_ATTRIBUTES_TABLE
	LDA byte_RAM_0
	SEC
	SBC #BackgroundTile_QuicksandSlow
	CMP #$02
	BCS ObjectTileCollision_CheckConveyor
ELSE
	LDY byte_RAM_0
	LDA TileInteractionAttributesTable, Y
	AND #%00001100
	CMP #%00001000
	BNE ObjectTileCollision_CheckConveyor

	LDA byte_RAM_0
	SEC
	SBC #BackgroundTile_QuicksandSlow
ENDIF

	ASL A
	ADC #$01
	STA ObjectYVelocity - 1, X
	LDA #EnemyState_Sinking
	STA EnemyState - 1, X
	LDA #$FF
	STA ObjectTimer1 - 1, X

ObjectTileCollision_CheckConveyor:
IFNDEF ENABLE_TILE_ATTRIBUTES_TABLE
	LDA byte_RAM_0
	STA byte_RAM_E

	SEC
	SBC #BackgroundTile_ConveyorLeft
	CMP #$02
	BCS loc_BANK3_B57B

ELSE
	LDY byte_RAM_0
	STY byte_RAM_E

	LDA TileInteractionAttributesTable, Y
	AND #%00001100
	CMP #%00001100

	BNE loc_BANK3_B57B

	TYA
	AND #%00000001
ENDIF

	LDY ObjectStunTimer - 1, X
	BNE loc_BANK3_B57B

	LDY ObjectType - 1, X
	CPY #Enemy_VegetableSmall
	BCC loc_BANK3_B56C

	TAY
	LDA ObjectYVelocity - 1, X
	CMP #$03
	BCS loc_BANK3_B57B

	LDA byte_RAM_D
	AND #$03
	BNE loc_BANK3_B57B

	LDA byte_BANK3_B4E0, Y
	STA ObjectXVelocity - 1, X
	STA byte_RAM_B
	BNE loc_BANK3_B57B

loc_BANK3_B56C:
	LDY ObjectXVelocity - 1, X
	BEQ loc_BANK3_B579

	EOR EnemyMovementDirection - 1, X
	LSR A
	BCS loc_BANK3_B579

	DEC ObjectAnimationTimer - 1, X
	DEC ObjectAnimationTimer - 1, X

loc_BANK3_B579:
	INC ObjectAnimationTimer - 1, X

loc_BANK3_B57B:
	LDA ObjectXVelocity - 1, X
	CLC
	ADC ObjectXAcceleration - 1, X
	BMI loc_BANK3_B587

	INC byte_RAM_7
	INC byte_RAM_8

loc_BANK3_B587:
	JSR CheckEnemyTileCollision

	DEX
	RTS



;
; Check collision attributes for the next two tiles
;
IFNDEF ENABLE_TILE_ATTRIBUTES_TABLE
CheckEnemyTileCollision:
	LDY byte_RAM_8
	JSR sub_BANK3_BB87

	LDY byte_RAM_7
	LDA EnemyTileCollisionTable, Y
	TAY
	LDA byte_RAM_0
	JSR CheckTileUsesCollisionType_Bank3

	BCC CheckEnemyTileCollision_Exit

	LDY byte_RAM_7
	LDA EnemyEnableCollisionFlagTable, Y
	ORA EnemyCollision - 1, X
	STA EnemyCollision - 1, X

ELSE
CheckEnemyTileCollision:
	LDY byte_RAM_8
	JSR sub_BANK3_BB87

	; check tile attributes
	LDY byte_RAM_0
	LDA TileCollisionAttributesTable, Y
	LDY byte_RAM_7
	AND CheckEnemyTileCollisionAttributesTable, Y

	BEQ CheckEnemyTileCollision_Exit

	LDA EnemyEnableCollisionFlagTable, Y
	ORA EnemyCollision - 1, X
	STA EnemyCollision - 1, X
ENDIF

CheckEnemyTileCollision_Exit:
	INC byte_RAM_7
	INC byte_RAM_8
	RTS


;
; Resets directional collision flags and loads collision data pointer
;
; Input
;   X = enemy index
; Output
;   byte_RAM_D = previous collision flags
;   EnemyCollision = collision flags with up/down/left/right disabled
;   A = collision data pointer
;   X = X + 1
;
ClearDirectionalCollisionFlags:
	INX
	LDA EnemyCollision - 1, X
	STA byte_RAM_D
	AND #CollisionFlags_Damage | CollisionFlags_PlayerOnTop | CollisionFlags_PlayerInsideMaybe | CollisionFlags_80
	STA EnemyCollision - 1, X
	LDY EnemyArray_492 - 1, X
	LDA TileCollisionHitboxIndex, Y

ClearDirectionalCollisionFlags_Exit:
	RTS


EnemyTileCollisionTable:
	.db $02 ; jumpthrough bottom (y-velocity < 0)
	.db $01 ; jumpthrough top (y-velocity > 0)
	.db $02 ; jumpthrough right (x-velocity < 0)
	.db $02 ; jumpthrough left (x-velocity > 0)
	.db $00 ; treat background as solid
	.db $00 ; treat background as solid
	.db $00 ; treat background as solid
	.db $00 ; treat background as solid


IFDEF ENABLE_TILE_ATTRIBUTES_TABLE
CheckEnemyTileCollisionAttributesTable:
	.db %00001000 ; bottom (y-velocity < 0)
	.db %00000100 ; top (y-velocity > 0)
	.db %00000010 ; right (x-velocity < 0)
	.db %00000001 ; left (x-velocity > 0)
	.db %10001000 ; background-interactive bottom (y-velocity < 0)
	.db %01000100 ; background-interactive top (y-velocity > 0)
	.db %00100010 ; background-interactive right (x-velocity < 0)
	.db %00010001 ; background-interactive left (x-velocity > 0)
ENDIF

EnemyEnableCollisionFlagTable:
	.db CollisionFlags_Up
	.db CollisionFlags_Down
	.db CollisionFlags_Left
	.db CollisionFlags_Right
	.db CollisionFlags_Up
	.db CollisionFlags_Down
	.db CollisionFlags_Left
	.db CollisionFlags_Right


;
; Collision detection between objects
;
CheckObjectCollision:
	LDA #$00
	STA ObjectXAcceleration, X
	LDA EnemyCollision, X
	AND #CollisionFlags_Right | CollisionFlags_Left | CollisionFlags_Down | CollisionFlags_Up
	STA EnemyCollision, X
	LDA EnemyState, X
	CMP #EnemyState_BombExploding
	BNE CheckObjectCollision_NotExplosion

	LDY #$06 ; bomb explosion hitbox
	BNE CheckObjectCollision_ReadHitbox

CheckObjectCollision_NotExplosion:
	CMP #EnemyState_Sinking
	BEQ CheckObjectCollision_CheckObjectBeingCarried

	LDY ObjectType, X
	CPY #Enemy_Egg
	BEQ CheckObjectCollision_CheckObjectAlive

	CPY #Enemy_Pokey
	BEQ CheckObjectCollision_CheckObjectAlive

	LDY ObjectProjectileTimer, X
	BNE CheckObjectCollision_CheckObjectBeingCarried

CheckObjectCollision_CheckObjectAlive:
	CMP #EnemyState_Alive
	BNE ClearDirectionalCollisionFlags_Exit

CheckObjectCollision_CheckObjectBeingCarried:
	LDA ObjectBeingCarriedTimer, X
	BNE ClearDirectionalCollisionFlags_Exit

	LDY ObjectHitbox, X

CheckObjectCollision_ReadHitbox:
	LDA ObjectCollisionHitboxWidth_RAM, Y
	STA byte_RAM_9 ; hitbox width
	LDA #$00
	STA byte_RAM_0
	LDA ObjectCollisionHitboxLeft_RAM, Y
	BPL CheckObjectCollision_ReadHitbox_Left

	DEC byte_RAM_0

CheckObjectCollision_ReadHitbox_Left:
	CLC
	ADC ObjectXLo, X
	STA byte_RAM_5 ; bounding box left low
	LDA ObjectXHi, X
	ADC byte_RAM_0
	STA byte_RAM_1 ; bounding box left high
	; Vertical levels wrap horizontally, so the high X position is discarded
	LDA IsHorizontalLevel
	BNE CheckObjectCollision_ReadHitbox_Height

	STA byte_RAM_1

CheckObjectCollision_ReadHitbox_Height:
	LDA ObjectCollisionHitboxHeight_RAM, Y
	STA byte_RAM_B ; hitbox height
	LDA #$00
	STA byte_RAM_0
	LDA ObjectCollisionHitboxTop_RAM, Y
	BPL CheckObjectCollision_ReadHitbox_Top

	DEC byte_RAM_0

CheckObjectCollision_ReadHitbox_Top:
	CLC
	ADC ObjectYLo, X
	STA byte_RAM_7 ; bounding box top low
	LDA ObjectYHi, X
	ADC byte_RAM_0
	STA byte_RAM_3 ; bounding box top high

CheckObjectCollision_Loop:
	STX byte_RAM_ED
	TXA
	BNE CheckObjectCollision_OtherObject

	; X = 0
	LDA PlayerInRocket
	ORA PlayerLock
	BNE CheckObjectCollision_PlayerCollisionDisabled

	LDA PlayerState, X
	CMP #PlayerState_Lifting
	BCC CheckObjectCollision_PlayerCollisionEnabled

CheckObjectCollision_PlayerCollisionDisabled:
	JMP CheckObjectCollision_Next

CheckObjectCollision_PlayerCollisionEnabled:
	LDY byte_RAM_12
	LDA ObjectProjectileTimer, Y
	BEQ CheckObjectCollision_ReadPlayerHitbox

	; Post-throw grace period
	CMP #$20
	BCC CheckObjectCollision_PlayerCollisionDisabled

CheckObjectCollision_ReadPlayerHitbox:
	LDY PlayerHitbox
	JMP CheckObjectCollision_OtherObjectReadHitbox


CheckObjectCollision_OtherObject:
	LDY byte_RAM_12
	LDA EnemyState, Y
	CMP #EnemyState_BombExploding
	BEQ CheckObjectCollision_CheckOtherObjectState

	; Check if collision is disabled
	LDA EnemyArray_46E, Y
	AND #%00000100
	BNE CheckObjectCollision_NextIfNotEqual ; effectively `JMP CheckObjectCollision_Next`

CheckObjectCollision_CheckOtherObjectState:
	LDA EnemyState - 1, X
	CMP #EnemyState_BombExploding ; what does this mean for an enemy?
	BNE CheckObjectCollision_OtherObjectNotExplosion

	LDY #$06 ; bomb explosion hitbox
	BNE CheckObjectCollision_OtherObjectReadHitbox

CheckObjectCollision_OtherObjectNotExplosion:
	CMP #EnemyState_Sinking
	BEQ CheckObjectCollision_CheckOtherObjectBeingCarried

	LDY ObjectType - 1, X
	CPY #Enemy_Egg
	BEQ CheckObjectCollision_CheckOtherObjectAlive

	CPY #Enemy_Pokey
	BEQ CheckObjectCollision_CheckOtherObjectAlive

	LDY ObjectProjectileTimer - 1, X
	BNE CheckObjectCollision_CheckOtherObjectBeingCarried

CheckObjectCollision_CheckOtherObjectAlive:
	CMP #EnemyState_Alive
CheckObjectCollision_NextIfNotEqual:
	BNE CheckObjectCollision_Next

CheckObjectCollision_CheckOtherObjectBeingCarried:
	LDA ObjectBeingCarriedTimer - 1, X
	BNE CheckObjectCollision_Next

	LDA EnemyCollision - 1, X
	AND #CollisionFlags_Damage
	BNE CheckObjectCollision_Next

	LDA EnemyArray_46E - 1, X
	AND #$04
	BNE CheckObjectCollision_Next

	LDY ObjectHitbox - 1, X

CheckObjectCollision_OtherObjectReadHitbox:
	LDA ObjectCollisionHitboxWidth_RAM, Y
	STA byte_RAM_A ; hitbox width
	LDA #$00
	STA byte_RAM_0
	LDA ObjectCollisionHitboxLeft_RAM, Y
	BPL CheckObjectCollision_OtherObjectReadHitbox_Left

	DEC byte_RAM_0

CheckObjectCollision_OtherObjectReadHitbox_Left:
	CLC
	ADC ObjectXLo - 1, X
	STA byte_RAM_6 ; bounding box left low
	LDA ObjectXHi - 1, X
	ADC byte_RAM_0
	STA byte_RAM_2 ; bounding box left high
	; Vertical levels wrap horizontally, so the high X position is discarded
	LDA IsHorizontalLevel
	BNE CheckObjectCollision_OtherObjectReadHitbox_Height

	STA byte_RAM_2

CheckObjectCollision_OtherObjectReadHitbox_Height:
	LDA ObjectCollisionHitboxHeight_RAM, Y
	STA byte_RAM_C ; hitbox height
	LDA #$00
	STA byte_RAM_0
	LDA ObjectCollisionHitboxTop_RAM, Y
	BPL CheckObjectCollision_OtherObjectReadHitbox_Top

	DEC byte_RAM_0

CheckObjectCollision_OtherObjectReadHitbox_Top:
	CLC
	ADC ObjectYLo - 1, X
	STA byte_RAM_8 ; bounding box top low
	LDA ObjectYHi - 1, X
	ADC byte_RAM_0
	STA byte_RAM_4 ; bounding box top high

	JSR CheckHitboxCollision

	BCS CheckObjectCollision_Next

	LDA byte_RAM_B
	PHA
	JSR EnemyCollisionBehavior

	PLA
	STA byte_RAM_B

CheckObjectCollision_Next:
	DEX
	BMI CheckObjectCollision_RestoreObjectSlotExit

	JMP CheckObjectCollision_Loop

CheckObjectCollision_RestoreObjectSlotExit:
	LDX byte_RAM_12

CheckObjectCollision_Exit:
	RTS


;
; Run the player/object collision handler
;
EnemyCollisionBehavior:
	TXA
	BNE EnemyCollisionBehavior_ReadCollisionType

	LDA HoldingItem
	BEQ EnemyCollisionBehavior_ReadCollisionType

	LDA ObjectBeingCarriedIndex
	CMP byte_RAM_12
	BEQ CheckObjectCollision_Exit

EnemyCollisionBehavior_ReadCollisionType:
	LDY byte_RAM_12
	LDA ObjectType, Y
	TAY
	LDA EnemyPlayerCollisionTable_RAM, Y
	JSR JumpToTableAfterJump

	.dw EnemyCollisionBehavior_Enemy
	.dw EnemyCollisionBehavior_ProjectileItem
	.dw EnemyCollisionBehavior_Object
	.dw EnemyCollisionBehavior_POW
	.dw EnemyCollisionBehavior_Door


EnemyCollisionBehavior_Door:
	TXA
	BNE EnemyCollisionBehavior_Exit

	LDA Player1JoypadPress
	AND #ControllerInput_Up
	BEQ EnemyCollisionBehavior_Exit

	LDA PlayerCollision
	AND #CollisionFlags_Down
	BEQ EnemyCollisionBehavior_Exit

	LDA CollisionResultX
	CMP #$FA
	BCS EnemyCollisionBehavior_Exit

	LDA DoorAnimationTimer
	ORA SubspaceDoorTimer
	BNE EnemyCollisionBehavior_Exit

	LDA HoldingItem
	BEQ loc_BANK3_B749

	LDY ObjectBeingCarriedIndex
	LDA ObjectType, Y
	CMP #Enemy_Key
	BNE EnemyCollisionBehavior_Exit

loc_BANK3_B749:
	LDY byte_RAM_12
	LDA ObjectXLo, Y
	STA PlayerXLo
	LDA ObjectXHi, Y
	STA PlayerXHi
	JSR StashPlayerPosition

	LDA #TransitionType_SubSpace
	STA TransitionType
	JMP DoorHandling_GoThroughDoor_Bank3

EnemyCollisionBehavior_Exit:
	RTS


EnemyCollisionBehavior_Enemy:
	LDY byte_RAM_12
	TXA
	BEQ CheckCollisionWithPlayer

	LDA ObjectFlashTimer, Y
	ORA ObjectFlashTimer - 1, X
	BNE EnemyCollisionBehavior_Exit

	LDA ObjectProjectileTimer, Y
	BNE loc_BANK3_B792

	LDA EnemyState, Y
	CMP #EnemyState_BombExploding
	BEQ loc_BANK3_B792

	TXA
	TAY
	DEY
	LDX byte_RAM_12
	INX
	LDA EnemyState, Y
	CMP #EnemyState_BombExploding
	BEQ loc_BANK3_B792

	LDA ObjectProjectileTimer, Y
	BEQ loc_BANK3_B7E0

	LDA EnemyCollision - 1, X
	AND #CollisionFlags_Damage
	BNE loc_BANK3_B7E0

loc_BANK3_B792:
	LDA ObjectTimer2, Y
	ORA ObjectFlashTimer, Y
	BNE loc_BANK3_B7D7

	LDA EnemyArray_46E, Y
	AND #%00001000
	BEQ loc_BANK3_B7A4

	JSR PlayBossHurtSound

loc_BANK3_B7A4:
	LDA EnemyHP, Y
	SEC
	SBC #$01
	STA EnemyHP, Y
	BMI loc_BANK3_B7BD

	JSR PlayBossHurtSound

	LDA #$21
	STA ObjectFlashTimer, Y
	LSR A
	STA ObjectStunTimer, Y
	BNE loc_BANK3_B7D7

loc_BANK3_B7BD:
	LDA EnemyCollision, Y
	ORA #CollisionFlags_Damage
	STA EnemyCollision, Y
	LDA #$E0
	STA ObjectYVelocity, Y
	LDA ObjectXVelocity, Y
	STA byte_RAM_0
	ASL A
	ROR byte_RAM_0
	LDA byte_RAM_0
	STA ObjectXVelocity, Y

loc_BANK3_B7D7:
	LDA ObjectType - 1, X
	CMP #Enemy_VegetableSmall
	BCS loc_BANK3_B7E0

	JSR sub_BANK3_BA5D

loc_BANK3_B7E0:
	LDX byte_RAM_ED
	RTS

; ---------------------------------------------------------------------------
InvincibilityKill_VelocityX:
	.db $F8 ; to the left
	.db $08 ; to the right
; ---------------------------------------------------------------------------

CheckCollisionWithPlayer:
	LDA byte_RAM_EE
	AND #CollisionFlags_Up
	BNE CheckCollisionWithPlayer_Exit

	; check if it's a heart
	LDA ObjectType, Y
	BNE CheckCollisionWithPlayer_NotHeart

	; accept the heart into your life
	STA EnemyState, Y
	LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1
	LDY PlayerMaxHealth
	LDA PlayerHealth
	CLC
	ADC #$10
	STA PlayerHealth
	CMP PlayerHealthValueByHeartCount, Y
	BCC CheckCollisionWithPlayer_Exit

	JMP RestorePlayerToFullHealth

; ---------------------------------------------------------------------------

CheckCollisionWithPlayer_NotHeart:
	CMP #Enemy_Phanto
	BNE CheckCollisionWithPlayer_NotPhanto

	LDY PhantoActivateTimer
	BNE CheckCollisionWithPlayer_Exit

CheckCollisionWithPlayer_NotPhanto:
	CMP #Enemy_Starman
	BNE CheckCollisionWithPlayer_NotStarman

	LDA #$3F
	STA StarInvincibilityTimer
	LDA #Music1_Invincible
	STA MusicQueue1
	LDA #EnemyState_Inactive
	STA EnemyState, Y

CheckCollisionWithPlayer_Exit:
	RTS

; ---------------------------------------------------------------------------

CheckCollisionWithPlayer_NotStarman:
	CMP #Enemy_WhaleSpout
	BNE CheckCollisionWithPlayer_NotWhaleSpout

	LDA EnemyVariable, Y
	CMP #$DC
	BCS CheckCollisionWithPlayer_Exit2

	LDA StarInvincibilityTimer
	BEQ CheckCollisionWithPlayer_NotInvincible

	LDA #$DC
	STA EnemyVariable, Y
	LDA #$00
	STA ObjectYVelocity, Y

CheckCollisionWithPlayer_Exit2:
	RTS

; ---------------------------------------------------------------------------

CheckCollisionWithPlayer_NotWhaleSpout:
	CMP #Enemy_Wart
	BNE CheckCollisionWithPlayer_NotWart

	LDA EnemyArray_B1, X
	BNE CheckCollisionWithPlayer_Exit2

CheckCollisionWithPlayer_NotWart:
	LDY StarInvincibilityTimer
	BEQ CheckCollisionWithPlayer_NotInvincible

	; player is invincible
	LDX byte_RAM_12
	CMP #Enemy_AutobombFire
	BEQ CheckCollisionWithPlayer_Poof

	CMP #Enemy_Fireball
	BNE CheckCollisionWithPlayer_KillEnemy

; turn into a puff of smoke
CheckCollisionWithPlayer_Poof:
	LDA #%00000000
	STA EnemyArray_46E, X
	JSR EnemyBehavior_Shell_Destroy

	JMP loc_BANK3_B878

; ---------------------------------------------------------------------------

; die and fall off
CheckCollisionWithPlayer_KillEnemy:
	JSR EnemyFindWhichSidePlayerIsOn

	LDA InvincibilityKill_VelocityX, Y
	STA ObjectXVelocity, X
	LDA #$E0
	STA ObjectYVelocity, X
	LDA EnemyCollision, X
	ORA #CollisionFlags_Damage
	STA EnemyCollision, X

loc_BANK3_B878:
	LDX byte_RAM_ED
	LDY byte_RAM_12
	RTS

; ---------------------------------------------------------------------------

CheckCollisionWithPlayer_NotInvincible:
	LDY byte_RAM_12
	LDA EnemyState, Y
	CMP #EnemyState_BombExploding
	BEQ CheckCollisionWithPlayer_HurtPlayer

	; should we damage the player for jumping on top?
	LDA EnemyArray_46E, Y
	AND #%00000001
	BNE CheckCollisionWithPlayer_HurtPlayer

	; let player land on top
	JSR DetermineCollisionFlags

	LDA byte_RAM_F
	AND #$0B
	BEQ CheckCollisionWithPlayer_StandingOnHead

CheckCollisionWithPlayer_HurtPlayer:
	JMP DamagePlayer


CheckCollisionWithPlayer_StandingOnHead:
	LDA #$00
	STA PlayerInAir
	LDX byte_RAM_12
	LDA EnemyCollision, X
	ORA #CollisionFlags_PlayerOnTop
	STA EnemyCollision, X

	; can you even lift
	LDA EnemyArray_46E, X
	AND #%00000010
	BNE CheckCollisionWithPlayer_NoLift

	; check B button
	BIT Player1JoypadPress
	BVC CheckCollisionWithPlayer_NoLift

	; bail if we already have an item or are ducking
	LDA HoldingItem
	ORA PlayerDucking
	BNE CheckCollisionWithPlayer_NoLift

	STA EnemyCollision, X
	STX ObjectBeingCarriedIndex
	STA ObjectShakeTimer, X
	LDA #$07
	STA ObjectBeingCarriedTimer, X
	JSR SetPlayerStateLifting

	; leave a flying carpet behind if we're picking up pidgit
	LDA ObjectType, X
	CMP #Enemy_Pidgit
	BNE CheckCollisionWithPlayer_NoLift

	JSR CreateFlyingCarpet

CheckCollisionWithPlayer_NoLift:
	LDX byte_RAM_ED
	RTS

; End of function CheckCollisionWithPlayer_StandingOnHead

; ---------------------------------------------------------------------------

EnemyCollisionBehavior_Object:
	LDY byte_RAM_12
	TXA
	BEQ loc_BANK3_B905

	LDA ObjectType, Y
	CMP #Enemy_Key
	BNE loc_BANK3_B8E4

	LDA EnemyCollision, Y
	AND #CollisionFlags_Down
	BNE locret_BANK3_B902

loc_BANK3_B8E4:
	LDA ObjectProjectileTimer, Y
	BNE loc_BANK3_B8FF

	JSR DetermineCollisionFlags

	LDA byte_RAM_F
	AND EnemyMovementDirection - 1, X
	BEQ loc_BANK3_B8F8

	DEX
	JSR EnemyBehavior_TurnAround

	LDX byte_RAM_ED

loc_BANK3_B8F8:
	JSR sub_BANK3_BB31

	CPY #$00
	BEQ locret_BANK3_B902

loc_BANK3_B8FF:
	JMP loc_BANK3_B9EA

; ---------------------------------------------------------------------------

locret_BANK3_B902:
	RTS


CheckCollisionDirectionTable:
	.db CollisionFlags_Up ; down
	.db CollisionFlags_Down ; up


; collision with items that the player can stand on
loc_BANK3_B905:
	LDA EnemyCollision, Y
	ORA #CollisionFlags_PlayerInsideMaybe
	STA EnemyCollision, Y
	JSR DetermineCollisionFlags

	LDA byte_RAM_F
	AND PlayerMovementDirection
	BEQ loc_BANK3_B919

	JSR PlayerHorizontalCollision

loc_BANK3_B919:
	LDA byte_RAM_F
	AND #%00000100
	BEQ loc_BANK3_B922

	JSR CheckCollisionWithPlayer_StandingOnHead

loc_BANK3_B922:
	JSR sub_BANK3_BB31

	CPY #$01
	BNE locret_BANK3_B955

	LDY byte_RAM_12
	LDA ObjectYVelocity, Y
	BEQ locret_BANK3_B955

	AND #%10000000
	ASL A
	ROL A
	TAY
	LDA byte_RAM_F
	AND CheckCollisionDirectionTable, Y
	BEQ locret_BANK3_B955

	; Reverse the y-velocity of the object
	LDY byte_RAM_12
	LDA ObjectYVelocity, Y
	EOR #$FF
	CLC
	ADC #$01
	STA ObjectYVelocity, Y

	; Force the player into a ducking position
	LDA #$01
	STA PlayerDucking
	LDA #$04
	STA PlayerAnimationFrame
	LDA #$10
	STA PlayerStateTimer

locret_BANK3_B955:
	RTS

EnemyCollisionBehavior_POW:
	TXA
	BEQ locret_BANK3_B955
	JMP loc_BANK3_B9EA

EnemyCollisionBehavior_ProjectileItem:
	LDY byte_RAM_12
	TXA

loc_BANK3_B95F:
	BNE loc_BANK3_B993

	LDA EnemyState, Y

loc_BANK3_B964:
	CMP #$04
	BNE loc_BANK3_B96E

	LDA StarInvincibilityTimer
	BEQ loc_BANK3_B990

locret_BANK3_B96D:
	RTS

; ---------------------------------------------------------------------------

loc_BANK3_B96E:
	JSR DetermineCollisionFlags

	LDA byte_RAM_F
	AND #$08
	BEQ loc_BANK3_B987

	LDA HoldingItem
	BNE locret_BANK3_B96D

	LDY byte_RAM_12
	STY ObjectBeingCarriedIndex
	LDA #$01
	STA ObjectBeingCarriedTimer, Y
	INC HoldingItem

loc_BANK3_B987:
	LDA byte_RAM_F
	AND #$04
	BEQ locret_BANK3_B96D

	JMP CheckCollisionWithPlayer_StandingOnHead

; ---------------------------------------------------------------------------

loc_BANK3_B990:
	JMP DamagePlayer

; ---------------------------------------------------------------------------

loc_BANK3_B993:
	LDA ObjectType - 1, X
	CMP #Enemy_Wart
	BNE loc_BANK3_B9B7

	LDA ObjectTimer1 - 1, X
	BEQ locret_BANK3_B9F9

	LDA #$00
	STA EnemyState, Y
	JSR sub_BANK3_BA5D

	LDA #$60
	STA ObjectFlashTimer - 1, X
	LSR A
	STA ObjectStunTimer - 1, X
	LDA EnemyHP - 1, X
	BNE locret_BANK3_B9B6

	INC ScrollXLock

locret_BANK3_B9B6:
	RTS

; ---------------------------------------------------------------------------

loc_BANK3_B9B7:
	CMP #$32
	BCS locret_BANK3_B9B6

	CMP #$11
	BNE loc_BANK3_B9CA

	LDA #$05
	STA EnemyState, Y
	LDA #$1E
	STA ObjectTimer1, Y
	RTS

; ---------------------------------------------------------------------------

loc_BANK3_B9CA:
	LDA EnemyState, Y
	CMP #$04
	BEQ loc_BANK3_B9EC

	LDA ObjectType, Y
	CMP #Enemy_Shell
	BEQ loc_BANK3_B9EA

	LDA #$E8
	STA ObjectYVelocity, Y
	STX byte_RAM_0
	LDX ObjectXVelocity, Y
	BMI loc_BANK3_B9E5

	LDA #$18

loc_BANK3_B9E5:
	STA ObjectXVelocity, Y
	LDX byte_RAM_0

loc_BANK3_B9EA:
	LDY byte_RAM_12

loc_BANK3_B9EC:
	JSR sub_BANK3_BA5D

	BNE locret_BANK3_B9F9

	LDA ObjectXVelocity - 1, X
	ASL A
	ROR ObjectXVelocity - 1, X
	ASL A
	ROR ObjectXVelocity - 1, X

locret_BANK3_B9F9:
	RTS

; ---------------------------------------------------------------------------

DamagePlayer:
	LDA DamageInvulnTime
	BNE locret_BANK3_BA31

	LDA PlayerHealth
	SEC
	SBC #$10
	BCC loc_BANK3_BA32

	STA PlayerHealth
	LDY #$7F
	STY DamageInvulnTime
	LDY #$00
	STY PlayerYVelocity
	STY PlayerXVelocity
	CMP #$10
	BCC loc_BANK3_BA2C

	LDA PlayerScreenX
	SEC
	SBC SpriteTempScreenX
	ASL A
	ASL A
	STA PlayerXVelocity
	LDA #$C0
	LDY PlayerYVelocity
	BPL loc_BANK3_BA2A

	LDA #$00

loc_BANK3_BA2A:
	STA PlayerYVelocity

loc_BANK3_BA2C:
	LDA #DPCM_PlayerHurt
	STA DPCMQueue

locret_BANK3_BA31:
	RTS

; ---------------------------------------------------------------------------

loc_BANK3_BA32:
	TXA

loc_BANK3_BA33:
	PHA
	LDX byte_RAM_12
	LDA ObjectType, X
	CMP #Enemy_BeezoDiving
	BCS loc_BANK3_BA48

	JSR EnemyFindWhichSidePlayerIsOn

	INY
	TYA
	CMP EnemyMovementDirection, X
	BEQ loc_BANK3_BA48

	JSR EnemyBehavior_TurnAround

loc_BANK3_BA48:
	PLA
	TAX
	LDA #$C0
	STA PlayerYVelocity

loc_BANK3_BA4E:
	LDA #$20
	STA PlayerStateTimer
	LDY byte_RAM_12
	BMI loc_BANK3_BA5A

	LSR A
	STA ObjectStunTimer, Y

loc_BANK3_BA5A:
	JMP KillPlayer

; =============== S U B R O U T I N E =======================================

; Damage enemy
sub_BANK3_BA5D:
	LDA ObjectTimer2 - 1, X
	ORA ObjectFlashTimer - 1, X
	BNE locret_BANK3_BA94

	LDA EnemyArray_46E - 1, X
	AND #Enemy_Ostro
	BEQ EnemyTakeDamage

	JSR PlayBossHurtSound

EnemyTakeDamage:
	DEC EnemyHP - 1, X ; Subtract hit point
	BMI EnemyKnockout

	LDA #$21 ; Flash
	STA ObjectFlashTimer - 1, X
	LSR A

loc_BANK3_BA7A:
	STA ObjectStunTimer - 1, X

; End of function sub_BANK3_BA5D

PlayBossHurtSound:
	LDA #DPCM_BossHurt
	STA DPCMQueue
	RTS

; ---------------------------------------------------------------------------

EnemyKnockout:
	LDA EnemyCollision - 1, X
	ORA #CollisionFlags_Damage
	STA EnemyCollision - 1, X
	LDA #$E0
	STA ObjectYVelocity - 1, X
	LDA ObjectXVelocity, Y
	STA ObjectXVelocity - 1, X
	LDA #$00

locret_BANK3_BA94:
	RTS

;
; Determines the collision flags for two objects
;
; Input:
;   RAM_12 = main object
;   X = collision object (usually player?)
; Output:
;   byte_RAM_F = collision flags
;
DetermineCollisionFlags:
	LDA #$00
	STA byte_RAM_F
	LDY byte_RAM_12 ; stash Y
	LDA CollisionResultY
	CMP #$F6
	BCS DetermineCollisionFlags_Y

	LDA ObjectXLo, Y
	LDY #CollisionFlags_Left
	CMP ObjectXLo - 1, X
	BMI DetermineCollisionFlags_SetFlagsX

	LDY #CollisionFlags_Right

DetermineCollisionFlags_SetFlagsX:
	STY byte_RAM_F
	TYA
	AND EnemyMovementDirection - 1, X
	BEQ DetermineCollisionFlags_ExitX

	LDY byte_RAM_12 ; restore Y
	LDA ObjectNonSticky, Y
	BNE DetermineCollisionFlags_ExitX

	; @TODO: Looks like a way to make objects move together horizontally
	LDA ObjectXVelocity, Y
	STA ObjectXAcceleration - 1, X

DetermineCollisionFlags_ExitX:
	RTS


DetermineCollisionFlags_Y:
	LDA ObjectYLo, Y
	CPX #$01
	BCS loc_BANK3_BAD1

IFNDEF PLAYER_HITBOX
	PHA
	LDY PlayerDucking
	PLA
	SEC
	SBC byte_BANK3_BB2F, Y
ELSE
	LDY PlayerHitbox
	SEC
	SBC #$21
	CLC
	ADC ObjectCollisionHitboxHeight, Y
ENDIF

loc_BANK3_BAD1:
	CMP ObjectYLo - 1, X
	BMI loc_BANK3_BB02

	LDA ObjectYVelocity - 1, X
	BMI DetermineCollisionFlags_ExitY

	LDY byte_RAM_12
	LDA ObjectNonSticky, Y
	BNE loc_BANK3_BAE6

	LDA ObjectXVelocity, Y
	STA ObjectXAcceleration - 1, X

loc_BANK3_BAE6:
	LDY #$00
	INC CollisionResultY
	INC CollisionResultY
	BPL loc_BANK3_BAF1

	DEY

loc_BANK3_BAF1:
	LDA CollisionResultY
	CLC
	ADC ObjectYLo - 1, X
	STA ObjectYLo - 1, X
	TYA
	ADC ObjectYHi - 1, X
	STA ObjectYHi - 1, X
	LDY #CollisionFlags_Down
	BNE loc_BANK3_BB13

loc_BANK3_BB02:
	LDA ObjectYVelocity - 1, X
	BEQ loc_BANK3_BB11

	BPL DetermineCollisionFlags_ExitY

	LDY byte_RAM_12
	LDA ObjectType, Y
	CMP #Enemy_Coin
	BEQ DetermineCollisionFlags_ExitY

loc_BANK3_BB11:
	LDY #CollisionFlags_Up

loc_BANK3_BB13:
	STY byte_RAM_F
	LDY byte_RAM_12
	LDA ObjectNonSticky, Y
	BNE loc_BANK3_BB22

	; @TODO: Looks like a way to make objects move together vertically
	LDA ObjectYVelocity, Y
	STA ObjectYAcceleration - 1, X

loc_BANK3_BB22:
	LDA #$00
	STA ObjectYVelocity - 1, X
	LDA ObjectYSubpixel, Y
	STA ObjectYSubpixel - 1, X
	INC ObjectAnimationTimer - 1, X

DetermineCollisionFlags_ExitY:
	RTS


byte_BANK3_BB2F:
	.db $0B
	.db $10

; =============== S U B R O U T I N E =======================================

sub_BANK3_BB31:
	LDY #$00
	LDA EnemyCollision - 1, X
	ORA byte_RAM_F
	AND #$0C
	CMP #$0C
	BEQ loc_BANK3_BB48

	LDA EnemyCollision - 1, X
	ORA byte_RAM_F
	AND #CollisionFlags_Right | CollisionFlags_Left
	CMP #CollisionFlags_Right | CollisionFlags_Left
	BNE locret_BANK3_BB49

	INY

loc_BANK3_BB48:
	INY

locret_BANK3_BB49:
	RTS

; End of function sub_BANK3_BB31

; ---------------------------------------------------------------------------
_unused_BANK3_BB4A:
	.db $FF ; May not be used, but wasn't marked as data
	.db $FF
	.db $FF
	.db $FF
	.db $FF
	.db $FF

; Hoopstar will climb up and down any of these tiles
HoopstarClimbTiles:
	.db BackgroundTile_Vine
	.db BackgroundTile_VineStandable
	.db BackgroundTile_VineBottom
	.db BackgroundTile_ClimbableSky
	.db BackgroundTile_Chain
	.db BackgroundTile_Ladder
	.db BackgroundTile_LadderShadow
	.db BackgroundTile_LadderStandable
	.db BackgroundTile_LadderStandableShadow
	.db BackgroundTile_ChainStandable


EnemyBehavior_Hoopstar_CheckBackgroundTile:
	JSR sub_BANK3_BB87

	LDA byte_RAM_0

	LDY #$09
EnemyBehavior_Hoopstar_CheckBackgroundTile_Loop:
	CMP HoopstarClimbTiles, Y
	BEQ EnemyBehavior_Hoopstar_CheckBackgroundTile_Exit
	DEY
	BPL EnemyBehavior_Hoopstar_CheckBackgroundTile_Loop

	CLC

EnemyBehavior_Hoopstar_CheckBackgroundTile_Exit:
	RTS


ItemCarryYOffsets:
	.db $F9
	.db $FF
	.db $00
	.db $08
	.db $0C
	.db $18
	.db $1A
	.db $01
	.db $06
	.db $0A
	.db $0C
	.db $18
	.db $1A
	.db $1C
	.db $FF
	.db $FF
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00
	.db $00


; =============== S U B R O U T I N E =======================================

;
; Seems to determine what kind of tile the object has collided with?
;
; Duplicate of subroutine in bank 0: sub_BANK0_924F
;
; Input
;   X = object index (0 = player)
;   Y = bounding box offset?
; Output
;   byte_RAM_0 = tile ID
;
sub_BANK3_BB87:
	TXA
	PHA

	LDA #$00
	STA byte_RAM_0
	STA byte_RAM_1
	LDA VerticalTileCollisionHitboxX, Y
	BPL loc_BANK3_BB96

	DEC byte_RAM_0

loc_BANK3_BB96:
	CLC
	ADC ObjectXLo - 1, X
	AND #$F0
	STA byte_RAM_5
	PHP
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_E5
	PLP
	LDA ObjectXHi - 1, X
	ADC byte_RAM_0
	STA byte_RAM_2
	STA byte_RAM_3
	LDA IsHorizontalLevel
	BNE loc_BANK3_BBB5

	STA byte_RAM_2
	STA byte_RAM_3

loc_BANK3_BBB5:
	LDA VerticalTileCollisionHitboxY, Y
	BPL loc_BANK3_BBBC

	DEC byte_RAM_1

loc_BANK3_BBBC:
	CLC
	ADC ObjectYLo - 1, X
	AND #$F0
	STA byte_RAM_6
	STA byte_RAM_E6
	LDA ObjectYHi - 1, X
	ADC byte_RAM_1
	STA byte_RAM_1
	STA byte_RAM_4
	JSR sub_BANK3_BC2E

	BCC loc_BANK3_BBD6

	LDA #$00
	BEQ loc_BANK3_BBDD

loc_BANK3_BBD6:
	JSR SetTileOffsetAndAreaPageAddr

	LDY byte_RAM_E7
	LDA (byte_RAM_1), Y

loc_BANK3_BBDD:
	STA byte_RAM_0
	PLA
	TAX
	RTS


;
; Check whether a tile should use the given collision handler type
;
; Input
;   A = tile ID
;   Y = collision handler type (0 = solid for mushroom blocks, 1 = jumpthrough, 2 = solid)
; Output
;   C = whether or not collision type Y is relevant
;
CheckTileUsesCollisionType_Bank3:
	PHA ; stash tile ID for later

	; determine which tile table to use (0-3)
	AND #$C0
	ASL A
	ROL A
	ROL A

	; add the offset for the type of collision we're checking
	ADC TileGroupTable_Bank3, Y
	TAY

	; check which side of the tile ID pivot we're on
	PLA
	CMP TileSolidnessTable, Y
	RTS


;
; These map the two high bits of a tile to offets in TileSolidnessTable
;
TileGroupTable_Bank3:
	.db $00 ; solid to mushroom blocks
	.db $04 ; solid on top
	.db $08 ; solid on all sides


DoorHandling_GoThroughDoor_Bank3:
	INC DoorAnimationTimer
	INC PlayerLock
	JSR SnapPlayerToTile_Bank3

	LDA #DPCM_DoorOpenBombBom
	STA DPCMQueue
	RTS


;
; Checks horizontal collision with the player and stops them if necessary
;
PlayerHorizontalCollision:
	LDX #$00
	LDY PlayerMovementDirection
	LDA PlayerXVelocity
	EOR PlayerCollisionResultTable - 1, Y
	BPL loc_BANK3_BC10

	STX PlayerXVelocity

loc_BANK3_BC10:
	LDA PlayerXAcceleration
	EOR PlayerCollisionResultTable - 1, Y
	BPL loc_BANK3_BC1B

	STX PlayerXAcceleration

loc_BANK3_BC1B:
	STX PlayerXSubpixel

locret_BANK3_BC1E:
	RTS


;
; Set the player state to lifting and Kick off the lifting animation
;
SetPlayerStateLifting:
	LDA #PlayerState_Lifting
	STA PlayerState
	LDA #$06
	STA PlayerStateTimer
	LDA #$08
	STA PlayerAnimationFrame
	INC HoldingItem
	RTS


;
; @TODO: Figure out what this does exactly
;
sub_BANK3_BC2E:
	LDY byte_RAM_1
	LDA byte_RAM_E6
	JSR sub_BANK3_BD6B

	STY byte_RAM_1
	STA byte_RAM_E6
	LDY IsHorizontalLevel
	LDA byte_RAM_1, Y
	STA byte_RAM_E8
	LDA byte_RAM_2
	CMP byte_BANK3_BC4D + 1, Y
	BCS locret_BANK3_BC4C

	LDA byte_RAM_1
	CMP byte_BANK3_BC4D, Y

locret_BANK3_BC4C:
	RTS


byte_BANK3_BC4D:
	.db $0A
	.db $01
	.db $0B


;
; Replaces a tile when something is thrown
;
; Input
;   A = target tile
;   X = enemy index of object being thrown
;
ReplaceTile:
	PHA
	LDA ObjectXLo, X
	CLC
	ADC #$08
	PHP
	LSR A
	LSR A
	LSR A
	LSR A
	STA byte_RAM_E5
	PLP
	LDA ObjectXHi, X
	LDY IsHorizontalLevel
	BEQ ReplaceTile_StoreXHi

	ADC #$00

ReplaceTile_StoreXHi:
	STA byte_RAM_2
	LDA ObjectYLo, X
	CLC
	ADC #$08
	AND #$F0
	STA byte_RAM_E6
	LDA ObjectYHi, X
	ADC #$00
	STA byte_RAM_1
	JSR sub_BANK3_BC2E

	PLA
	BCS locret_BANK3_BC1E

	STX byte_RAM_3
	PHA
	JSR SetTileOffsetAndAreaPageAddr

	PLA
	LDY byte_RAM_E7
	STA (byte_RAM_1), Y
	PHA
	LDX byte_RAM_300
	LDA #$00
	STA PPUBuffer_301, X
	TYA
	AND #$F0
	ASL A
	ROL PPUBuffer_301, X
	ASL A
	ROL PPUBuffer_301, X
	STA PPUBuffer_301 + 1, X
	TYA
	AND #$0F
	ASL A

	ADC PPUBuffer_301 + 1, X
	STA PPUBuffer_301 + 1, X
	CLC
	ADC #$20
	STA PPUBuffer_301 + 6, X
	LDA IsHorizontalLevel
	ASL A
	TAY
	LDA byte_RAM_1
	AND #$10
	BNE loc_BANK3_BCBA

	INY

loc_BANK3_BCBA:
	LDA PPUNametableHi, Y
	CLC
	ADC PPUBuffer_301, X
	STA PPUBuffer_301, X
	STA PPUBuffer_301 + 5, X
	LDA #$02
	STA PPUBuffer_301 + 2, X
	STA PPUBuffer_301 + 7, X
	PLA
	PHA
	AND #$C0
	ASL A
	ROL A
	ROL A
	TAY
	LDA TileQuadPointersLo, Y
	STA byte_RAM_0
	LDA TileQuadPointersHi, Y
	STA byte_RAM_1
	PLA
	ASL A
	ASL A
	TAY
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301 + 3, X
	INY
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301 + 4, X
	INY
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301 + 8, X
	INY
	LDA (byte_RAM_0), Y
	STA PPUBuffer_301 + 9, X
	LDA #$00
	STA PPUBuffer_301 + 10, X
	TXA
	CLC
	ADC #$A
	STA byte_RAM_300
	LDX byte_RAM_3
	RTS


; Another byte of PPU high addresses for horiz/vert levels
PPUNametableHi:
	.db $20 ; vertical, nametable A
	.db $28 ; vertical, nametable B
	.db $20 ; horizontal, nametable A
	.db $24 ; horizontal, nametable B


StashPlayerPosition:
	LDA InSubspaceOrJar
	BNE StashPlayerPosition_Exit

	LDA PlayerXHi
	STA PlayerXHi_Backup
	LDA PlayerXLo
	STA PlayerXLo_Backup
	LDA PlayerYHi
	STA PlayerYHi_Backup
	LDA PlayerYLo
	STA PlayerYLo_Backup

StashPlayerPosition_Exit:
	RTS


;
; Updates the area page and tile placement offset @TODO
;
; Input
;   byte_RAM_E8 = area page
;   byte_RAM_E5 = tile placement offset shift
;   byte_RAM_E6 = previous tile placement offset
; Output
;   RAM_1 = low byte of decoded level data RAM
;   RAM_2 = low byte of decoded level data RAM
;   byte_RAM_E7 = target tile placement offset
;
SetTileOffsetAndAreaPageAddr:
	LDX byte_RAM_E8
	JSR SetAreaPageAddr

	LDA byte_RAM_E6
	CLC
	ADC byte_RAM_E5
	STA byte_RAM_E7
	RTS


DecodedLevelPageStartLo:
	.db <DecodedLevelData
	.db <(DecodedLevelData+$00F0)
	.db <(DecodedLevelData+$01E0)
	.db <(DecodedLevelData+$02D0)
	.db <(DecodedLevelData+$03C0)
	.db <(DecodedLevelData+$04B0)
	.db <(DecodedLevelData+$05A0)
	.db <(DecodedLevelData+$0690)
	.db <(DecodedLevelData+$0780)
	.db <(DecodedLevelData+$0870)
	.db <(SubAreaTileLayout)

DecodedLevelPageStartHi:
	.db >DecodedLevelData
	.db >(DecodedLevelData+$00F0)
	.db >(DecodedLevelData+$01E0)
	.db >(DecodedLevelData+$02D0)
	.db >(DecodedLevelData+$03C0)
	.db >(DecodedLevelData+$04B0)
	.db >(DecodedLevelData+$05A0)
	.db >(DecodedLevelData+$0690)
	.db >(DecodedLevelData+$0780)
	.db >(DecodedLevelData+$0870)
	.db >(SubAreaTileLayout)



;
; Updates the area page that we're reading tiles from
;
; Input
;   X = area page
; Output
;   byte_RAM_1 = low byte of decoded level data RAM
;   byte_RAM_2 = low byte of decoded level data RAM
;
SetAreaPageAddr:
	LDA DecodedLevelPageStartLo, X
	STA byte_RAM_1
	LDA DecodedLevelPageStartHi, X
	STA byte_RAM_2
	RTS


PlayerCollisionResultTable:
	.db CollisionFlags_80
	.db CollisionFlags_00

; =============== S U B R O U T I N E =======================================

;
; Note: Door animation code copied from Bank 0
;
; Snaps the player to the closest tile (for entering doors and jars)
;
SnapPlayerToTile_Bank3:
	LDA PlayerXLo
	CLC
	ADC #$08
	AND #$F0
	STA PlayerXLo
	BCC SnapPlayerToTile_Exit_Bank3

	LDA IsHorizontalLevel
	BEQ SnapPlayerToTile_Exit_Bank3

	INC PlayerXHi

SnapPlayerToTile_Exit_Bank3:
	RTS


; =============== S U B R O U T I N E =======================================

sub_BANK3_BD6B:
	STA byte_RAM_F
	TYA
	BMI locret_BANK3_BD81

	ASL A
	ASL A
	ASL A
	ASL A
	CLC
	ADC byte_RAM_F
	BCS loc_BANK3_BD7D

	CMP #$F0
	BCC locret_BANK3_BD81

loc_BANK3_BD7D:
	CLC
	ADC #$10
	INY

locret_BANK3_BD81:
	RTS

; End of function sub_BANK3_BD6B


;
; Checks collision in one dimension (wrapping)
; Only run when checking horizontal collision in a vertical level
;
; ##### Input
;
; - `Y`: which dimension to compare `$00` = x, `$02` = y
; - `byte_RAM_5`/`byte_RAM_7`: bounding box A x/y offset low
; - `byte_RAM_6`/`byte_RAM_8`: bounding box B x/y offset low
; - `byte_RAM_9`: bounding box A width/height
; - `byte_RAM_A`: bounding box B width/height
;
; ##### Output
;
; - `C`: clear if there is a collision, set if there is no collision
; - `A`: distance between bounding boxes
;
CheckHitboxCollisionDimensionWrap:
	LDA byte_RAM_5, Y
	SEC
	SBC byte_RAM_6, Y
	BPL CheckHitboxCollisionDimensionWrap_Exit

	EOR #$FF
	CLC
	ADC #$01
	DEX

CheckHitboxCollisionDimensionWrap_Exit:
	SEC
	SBC byte_RAM_9, X
	RTS


;
; Checks collision in one dimension
;
; ##### Input
;
; - `Y`: which dimension to compare `$00` = x, `$02` = y
; - `byte_RAM_1`/`byte_RAM_3`: bounding box A x/y offset high
; - `byte_RAM_2`/`byte_RAM_4`: bounding box B x/y offset high
; - `byte_RAM_5`/`byte_RAM_7`: bounding box A x/y offset low
; - `byte_RAM_6`/`byte_RAM_8`: bounding box B x/y offset low
; - `byte_RAM_9`: bounding box A width/height
; - `byte_RAM_A`: bounding box B width/height
;
; ##### Output
;
; - `C`: clear if there is a collision, set if there is no collision
; - `A`: distance between bounding boxes
;
CheckHitboxCollisionDimension:
	LDA byte_RAM_5, Y
	SEC
	SBC byte_RAM_6, Y
	STA byte_RAM_6, Y
	LDA byte_RAM_1, Y
	SBC byte_RAM_2, Y
	BPL loc_BANK3_BDB9

	EOR #$FF
	PHA
	LDA byte_RAM_6, Y
	EOR #$FF
	CLC
	ADC #$01
	STA byte_RAM_6, Y
	PLA
	ADC #$00
	DEX

loc_BANK3_BDB9:
	CMP #$00
	BEQ CheckHitboxCollisionDimension_Exit

	SEC
	RTS

CheckHitboxCollisionDimension_Exit:
	LDA byte_RAM_6, Y
	SBC byte_RAM_9, X
	RTS


;
; Determines whether two bounding boxes collide
;
; ##### Input
;
; - `byte_RAM_1`: bounding box A left high
; - `byte_RAM_2`: bounding box B left high
; - `byte_RAM_3`: bounding box A top high
; - `byte_RAM_4`: bounding box B top high
; - `byte_RAM_5`: bounding box A left low
; - `byte_RAM_6`: bounding box B left low
; - `byte_RAM_7`: bounding box A top low
; - `byte_RAM_8`: bounding box B top low
; - `byte_RAM_9`: hitbox A width low
; - `byte_RAM_A`: hitbox B width low
; - `byte_RAM_B`: hitbox A height low
; - `byte_RAM_C`: hitbox B height low
;
; ##### Output
;
; - `C`: clear if there is a collision, set if there is no collision
;
CheckHitboxCollision:
	TXA
	PHA
	LDY #$02 ; check vertical collision

CheckHitboxCollision_Loop:
	TYA
	TAX
	INX
	CPY #$00 ; check horizontal collision
	BNE CheckHitboxCollision_CheckDimensionNoWrap

	LDA IsHorizontalLevel
	BNE CheckHitboxCollision_CheckDimensionNoWrap

	; Horizontal position wraps in a vertical level
CheckHitboxCollision_CheckDimensionWrap:
	JSR CheckHitboxCollisionDimensionWrap
	JMP CheckHitboxCollision_AfterCheckDimension

CheckHitboxCollision_CheckDimensionNoWrap:
	JSR CheckHitboxCollisionDimension

CheckHitboxCollision_AfterCheckDimension:
	BCS CheckHitboxCollision_Exit

	PHA
	TYA
	LSR A
	TAX
	PLA
	; store the result
	STA CollisionResultX, X
	DEY
	DEY
	BPL CheckHitboxCollision_Loop

	CLC

CheckHitboxCollision_Exit:
	PLA
	TAX
	RTS


; ---------------------------------------------------------------------------
HealthBarTiles:
	.db $BA ; 0
	.db $BA
	.db $BA
	.db $BA
	.db $B8 ; 1
	.db $BA
	.db $BA
	.db $BA
	.db $B8 ; 2
	.db $B8
	.db $BA
	.db $BA
	.db $B8 ; 3
	.db $B8
	.db $B8
	.db $BA
	.db $B8 ; 4
	.db $B8
	.db $B8
	.db $B8

POWQuakeOffsets:
	.db $00
	.db $03
	.db $00
	.db $FD

SkyFlashColors:
	.db $26
	.db $2A
	.db $22
	.db $26

; =============== S U B R O U T I N E =======================================

AreaSecondaryRoutine:
	LDA SkyFlashTimer
	BEQ AreaSecondaryRoutine_HealthBar

	; sky flash timer (ie. explosions)
	DEC SkyFlashTimer
	LDX byte_RAM_300
	LDA #$3F
	STA PPUBuffer_301, X
	LDA #$10
	STA PPUBuffer_301 + 1, X
	LDA #$04
	STA PPUBuffer_301 + 2, X
	LDA SkyColor
	LDY SkyFlashTimer
	BEQ AreaSecondaryRoutine_PlayerPalette

	TYA
	AND #$03
	TAY
	LDA SkyFlashColors, Y

AreaSecondaryRoutine_PlayerPalette:
	STA PPUBuffer_301 + 3, X
	LDA RestorePlayerPalette1
	STA PPUBuffer_301 + 4, X
	LDA RestorePlayerPalette2
	STA PPUBuffer_301 + 5, X
	LDA RestorePlayerPalette3
	STA PPUBuffer_301 + 6, X
	LDA #$00
	STA PPUBuffer_301 + 7, X
	TXA
	CLC
	ADC #$07
	STA byte_RAM_300

AreaSecondaryRoutine_HealthBar:
	LDA #$30
	STA byte_RAM_0
	JSR FindSpriteSlot

	LDA PlayerHealth
	BEQ AreaSecondaryRoutine_HealthBar_Draw

	AND #$F0
	LSR A
	LSR A
	ADC #$04 ; max health

AreaSecondaryRoutine_HealthBar_Draw:
	TAX

	LDA #$FE
	STA byte_RAM_3
AreaSecondaryRoutine_HealthBar_Loop:
	LDA HealthBarTiles, X
	STA SpriteDMAArea + 1, Y
	LDA #$10
	STA SpriteDMAArea + 3, Y
	LDA #$01
	STA SpriteDMAArea + 2, Y
	LDA byte_RAM_0
	STA SpriteDMAArea, Y
	CLC
	ADC #$10
	STA byte_RAM_0
	INX
	INY
	INY
	INY
	INY
	INC byte_RAM_3
	LDA byte_RAM_3
	CMP PlayerMaxHealth
	BNE AreaSecondaryRoutine_HealthBar_Loop

AreaSecondaryRoutine_POW:
	LDA POWQuakeTimer
	BEQ AreaSecondaryRoutine_Exit

	DEC POWQuakeTimer
	LSR A
	AND #$01
	TAY
	LDA PPUScrollYMirror
	BPL AreaSecondaryRoutine_POW_OffsetScreen

	INY
	INY

AreaSecondaryRoutine_POW_OffsetScreen:
	LDA POWQuakeOffsets, Y
	STA BackgroundYOffset
	JMP KillOnscreenEnemies

AreaSecondaryRoutine_Exit:
	RTS

IFDEF SM_USA
	.pad $BFE0, $FF
	.db "SUPER MARIO USA "
	.db $00, $00, $64, $45, $33, $04, $01, $0E, $01, $10
ENDIF

IFDEF RESET_CHR_LATCH
SetBossTileset:
	STA BossTileset
	INC ResetCHRLatch
	RTS
ENDIF


IFDEF CONTROLLER_2_DEBUG
;
; Copies all character stats to RAM for hot-swapping the current character
;
CopyCarryYOffsets:
	LDX #(AreaMainRoutine - CarryYOffsets - 1)
CopyCarryYOffsets_Loop:
	LDA CarryYOffsets, X
	STA CarryYOffsetsRAM, X
	DEX
	BPL CopyCarryYOffsets_Loop

	RTS

AreaDebugRoutine:
	LDA CreateObjectType
	BEQ AreaDebugRoutine_Exit

	JSR DebugCreateObject

AreaDebugRoutine_Exit:
	RTS

;
; Input
;   CreateObjectType = object type
;
DebugCreateObject:
	JSR CreateEnemy

	BMI AreaDebugRoutine_Exit

	LDX byte_RAM_0
	LDA CreateObjectType
	STA ObjectType, X
	LDA ScreenBoundaryLeftLo
	ADC #$80
	STA ObjectXLo, X
	LDA ScreenBoundaryLeftHi
	ADC #$00
	STA ObjectXHi, X
	LDA ScreenYLo
	STA ObjectYLo, X
	LDA ScreenYHi
	ADC #$00
	STA ObjectYHi, X

	JSR InitializeEnemy

	LDA CreateObjectAttributes
	BEQ DebugCreateObject_ClearObjectType

DebugCreateObject_ObjectCarried:
	ROL CreateObjectAttributes
	BCC DebugCreateObject_ObjectTimer

	LDA #$01
	STA HoldingItem
	STA ObjectBeingCarriedTimer, X
	STX ObjectBeingCarriedIndex

	LDA #SoundEffect1_CherryGet
	STA SoundEffectQueue1

DebugCreateObject_ObjectTimer:
	ROL CreateObjectAttributes
	BCC DebugCreateObject_ObjectBottomScreen

	LDA #$FF
	STA ObjectTimer1, X

DebugCreateObject_ObjectBottomScreen:
	ROL CreateObjectAttributes
	BCC DebugCreateObject_Bit4

	LDA ObjectYLo, X
	CLC
	ADC #$E0
	STA ObjectYLo, X
	LDA ObjectYHi, X
	ADC #$00
	STA ObjectYHi, X

DebugCreateObject_Bit4:
	ROL CreateObjectAttributes
	BCC DebugCreateObject_Bit3

DebugCreateObject_Bit3:
	ROL CreateObjectAttributes
	BCC DebugCreateObject_Bit2

DebugCreateObject_Bit2:
	ROL CreateObjectAttributes
	BCC DebugCreateObject_ObjectThrown

DebugCreateObject_ObjectThrown:
	ROL CreateObjectAttributes
	BCC DebugCreateObject_ObjectNoVelocityReset

	LDA #$01
	STA ObjectProjectileTimer, X

DebugCreateObject_ObjectNoVelocityReset:
	ROL CreateObjectAttributes
	BCS DebugCreateObject_ClearObjectType

	LDA #$00
	STA ObjectXVelocity, X
	STA ObjectYVelocity, X

DebugCreateObject_ClearObjectType:
	LDA #$00
	STA CreateObjectType

DebugCreateObject_Exit:
	RTS

ENDIF
