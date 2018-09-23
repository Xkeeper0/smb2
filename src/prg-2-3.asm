;
; Bank 2 & Bank 3
; ===============
;
; What's inside:
;
;   - Enemy initialization and logic
;

; .segment BANK2
; * =  $8000

CarryYOffsetBigLo:
      .BYTE $FA ; Mario
      .BYTE $F6 ; Princess
      .BYTE $FC ; Toad
      .BYTE $F7 ; Luigi

CarryYOffsetBigHi:
      .BYTE $FF ; Mario
      .BYTE $FF ; Princess
      .BYTE $FF ; Toad
      .BYTE $FF ; Luigi

CarryYOffsetSmallLo:
      .BYTE $02 ; Mario
      .BYTE $FE ; Princess
      .BYTE $04 ; Toad
      .BYTE $FF ; Luigi

CarryYOffsetSmallHi:
      .BYTE $00 ; Mario
      .BYTE $FF ; Princess
      .BYTE $00 ; Toad
      .BYTE $FF ; Luigi


AreaMainRoutine:
      LDA     DoAreaTransition
      BEQ     AreaMainRoutine_NoTransition
      RTS

AreaMainRoutine_NoTransition:
      LDA     AreaInitialized
      BEQ     AreaInitialization

      JMP     loc_BANK2_816C

; ---------------------------------------------------------------------------

AreaInitialization:
      INC     AreaInitialized
      STA     byte_RAM_5BA
      STA     POWQuakeTimer
      STA     SkyFlashTimer
      STA     CrystalAndHawkmouthOpenSize
      STA     HawkmouthClosing
      STA     SwarmType
      STA     HawkmouthOpenTimer
      STA     ScrollXLock
      STA     byte_RAM_425
      STA     PlayerXVelocity
      STA     DamageInvulnTime
      STA     HoldingItem
      STA     PlayerStateTimer
      STA     BackgroundYOffset
      STA     PokeyTempScreenX
      STA     CrouchJumpTimer
      STA     byte_RAM_4C9
      STA     QuicksandDepth
      STA     byte_RAM_4B8

      LDY     #$1B
AreaInitialization_CarryYOffsetLoop:
      ; Copy the global carrying Y offsets to memory
      ; These are used for every character for different frames of the pickup animation
      LDA     ItemCarryYOffsets,Y
      STA     byte_RAM_7F00,Y
      DEY
      BPL     AreaInitialization_CarryYOffsetLoop

      ; Copy the character-specific FINAL carrying heights into memory
      LDY     CurrentCharacter
      LDA     CarryYOffsetBigLo,Y
      STA     byte_RAM_7F00
      LDA     CarryYOffsetSmallLo,Y
      STA     byte_RAM_7F00+$07
      LDA     CarryYOffsetBigHi,Y
      STA     byte_RAM_7F00+$0E
      LDA     CarryYOffsetSmallHi,Y
      STA     byte_RAM_7F00+$15
      LDA     #$B6
      STA     PseudoRNGValues
      LDA     TransitionType

      ; Play the slide-whistle when you start the game and drop into 1-1
      ORA     CurrentLevel
      BNE     NoIntroFallSlide

      LDA     #SoundEffect2_IntroFallSlide
      STA     SoundEffectQueue2

NoIntroFallSlide:
      LDA     ObjectCarriedOver
      BEQ     loc_BANK2_8106

      LDX     #$05
      STX     byte_RAM_12
      CMP     #Enemy_Mushroom
      BEQ     loc_BANK2_8106

      STA     ObjectType,X
      LDY     #EnemyState_Alive
      STY     EnemyState+5
      LDY     #$FF
      STY     byte_RAM_446
      CMP     #Enemy_Rocket
      BNE     loc_BANK2_80C7

      STA     EnemyArray_B1,X
      STA     byte_RAM_4C7,X
      STA     EnemyArray_477,X
      LDA     #$00
      STA     ObjectXHi,X
      STA     ObjectYHi,X
      JSR     SetEnemyAttributes

      LDA     #$F0
      STA     ObjectYVelocity,X
      ASL     A
      STA     ObjectYLo,X
      LDA     #$78
      STA     ObjectXLo,X
      BNE     loc_BANK2_8106

loc_BANK2_80C7:
      PHA
      STX     byte_RAM_42D
      JSR     EnemyInit_Basic

      LDA     #$01
      STA     ObjectBeingCarriedTimer,X
      STA     HoldingItem
      JSR     CarryObject

      PLA
      CMP     #Enemy_Key
      BNE     loc_BANK2_8106

      INC     EnemyVariable,X
      DEX
      STX     byte_RAM_12
      LDA     #EnemyState_Alive
      STA     EnemyState,X
      LDA     #Enemy_Phanto
      STA     ObjectType,X
      JSR     EnemyInit_Basic

      LDA     #$00
      STA     PhantoActivateTimer
      LDA     ScreenYLo
      STA     ObjectYLo,X
      LDA     ScreenYHi
      STA     ObjectYHi,X
      LDA     ScreenBoundaryLeftLo
      STA     ObjectXLo,X
      LDA     ScreenBoundaryLeftHi
      STA     ObjectXHi,X
      JSR     UnlinkEnemyFromRawData

loc_BANK2_8106:
      LDA     #<RawEnemyDataAddr
      STA     RawEnemyData
      LDA     #>RawEnemyDataAddr
      STA     RawEnemyData+1
      LDA     IsHorizontalLevel
      BNE     loc_BANK2_8144

      LDA     #$14
      STA     byte_RAM_9
      LDA     ScreenYLo
      SBC     #$30
      AND     #$F0
      STA     byte_RAM_5
      LDA     ScreenYHi
      SBC     #$00
      STA     byte_RAM_6

loc_BANK2_8124:
      LDA     byte_RAM_6
      CMP     #$B
      BCS     loc_BANK2_8130

      JSR     loc_BANK2_8311

      JSR     loc_BANK2_8311

loc_BANK2_8130:
      JSR     sub_BANK2_8138

      DEC     byte_RAM_9
      BPL     loc_BANK2_8124

      RTS

; End of function AreaMainRoutine

; =============== S U B R O U T I N E =======================================

sub_BANK2_8138:
      LDA     byte_RAM_5
      CLC
      ADC     #$10
      STA     byte_RAM_5
      BCC     locret_BANK2_8143

      INC     byte_RAM_6

locret_BANK2_8143:
      RTS

; End of function sub_BANK2_8138

; ---------------------------------------------------------------------------

loc_BANK2_8144:
      LDA     ScreenBoundaryLeftLo
      SBC     #$30
      AND     #$F0
      STA     byte_RAM_5
      LDA     ScreenBoundaryLeftHi
      SBC     #$00
      STA     byte_RAM_6
      LDA     #$17
      STA     byte_RAM_9

loc_BANK2_8158:
      LDA     byte_RAM_6
      CMP     #$B
      BCS     loc_BANK2_8164

      JSR     sub_BANK2_827D

      JSR     sub_BANK2_827D

loc_BANK2_8164:
      JSR     sub_BANK2_8138

      DEC     byte_RAM_9
      BPL     loc_BANK2_8158

      RTS

; ---------------------------------------------------------------------------

loc_BANK2_816C:
      JSR     loc_BANK2_8256

      LDA     StopwatchTimer
      BEQ     loc_BANK2_8185

      LDA     byte_RAM_10
      AND     #$1F
      BNE     loc_BANK2_817F

      LDY     #SoundEffect1_StopwatchTick
      STY     SoundEffectQueue1

loc_BANK2_817F:
      LSR     A
      BCC     loc_BANK2_8185

      DEC     StopwatchTimer

loc_BANK2_8185:
      LDA     ScreenBoundaryLeftLo
      CLC
      ADC     #$FF
      STA     ScreenBoundaryRightLo
      LDA     ScreenBoundaryLeftHi
      ADC     #$00
      STA     ScreenBoundaryRightHi
      LDX     #$08

loc_BANK2_8198:
      STX     byte_RAM_12
      TXA
      CLC
      ADC     SpriteFlickerSlot
      TAY

loc_BANK2_81A0:
      LDA     byte_BANKF_F4DA,Y
      LDY     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_81B1

      LDA     #Enemy_BeezoStraight
      LDY     ObjectType,X
      CMP     #Enemy_Rocket
      BNE     loc_BANK2_81B1

      LDA     #$00

loc_BANK2_81B1:
      STA     byte_RAM_F4
      LDA     EnemyState,X
      CMP     #EnemyState_Dead
      BCS     loc_BANK2_81C4

      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      BCS     loc_BANK2_81C4

      LDA     StopwatchTimer
      BNE     loc_BANK2_81D2

loc_BANK2_81C4:
      LDA     EnemyTimer,X
      BEQ     loc_BANK2_81CA

      DEC     EnemyTimer,X

loc_BANK2_81CA:
      LDA     EnemyArray_453,X
      BEQ     loc_BANK2_81D2

      DEC     EnemyArray_453,X

loc_BANK2_81D2:
      LDA     EnemyArray_45C,X

loc_BANK2_81D5:
      BEQ     loc_BANK2_81DA

      DEC     EnemyArray_45C,X

loc_BANK2_81DA:
      LDA     EnemyArray_438,X
      BEQ     loc_BANK2_81E7

      LDA     byte_RAM_10
      LSR     A
      BCC     loc_BANK2_81E7

      DEC     EnemyArray_438,X

loc_BANK2_81E7:
      JSR     DoPRNGBullshitProbably

      JSR     PutCarriedObjectInHands

      JSR     HandleEnemyState

      LDX     byte_RAM_12
      DEX
      BPL     loc_BANK2_8198

      LDA     SwarmType
      BEQ     HandleEnemyState_Inactive

      SEC
      SBC     #Enemy_AttackAlbatossCarryingBobOmb

      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD Swarm_AlbatossCarryingBobOmb
      .WORD Swarm_BeezoDiving
      .WORD Swarm_Stop
      .WORD Generator_VegetableThrower

; =============== S U B R O U T I N E =======================================

Swarm_Stop:
      LDA     #$00
      STA     SwarmType

HandleEnemyState_Inactive:
      RTS

; End of function Swarm_Stop

; =============== S U B R O U T I N E =======================================

; I am very good at figuring out what things do. Yes.

DoPRNGBullshitProbably:
      LDY     #$00
      JSR     sub_BANK2_8214

      INY

; End of function DoPRNGBullshitProbably

; =============== S U B R O U T I N E =======================================

sub_BANK2_8214:
      LDA     PseudoRNGValues
      ASL     A
      ASL     A
      SEC
      ADC     PseudoRNGValues
      STA     PseudoRNGValues
      ASL     PseudoRNGValues+1
      LDA     #$20
      BIT     PseudoRNGValues+1
      BCC     loc_BANK2_822E

      BEQ     loc_BANK2_8233

      BNE     loc_BANK2_8230

loc_BANK2_822E:
      BNE     loc_BANK2_8233

loc_BANK2_8230:
      INC     PseudoRNGValues+1

loc_BANK2_8233:
      LDA     PseudoRNGValues+1
      EOR     PseudoRNGValues
      STA     PseudoRNGValues+2,Y
      RTS

; End of function sub_BANK2_8214

; ---------------------------------------------------------------------------

HandleEnemyState:
      LDA     EnemyState,X
      JSR     JumpToTableAfterJump

      .WORD HandleEnemyState_Inactive ; 0 (not active)
      .WORD HandleEnemyState_Alive ; Alive
      .WORD HandleEnemyState_Dead ; Dead
      .WORD HandleEnemyState_BlockFizzle ; Block fizzle
      .WORD HandleEnemyState_BombExploding ; Bomb exploding
      .WORD HandleEnemyState_PuffOfSmoke ; Puff of smoke
      .WORD HandleEnemyState_Sand ; Sand after digging
      .WORD loc_BANK2_85B2 ; Object carried/thrown?


byte_BANK2_8252:
      .BYTE $18
      .BYTE $E0
      .BYTE $01
      .BYTE $FF


loc_BANK2_8256:
      LDA     byte_RAM_4B8
      BNE     locret_BANK2_82AB

      LDA     IsHorizontalLevel
      JSR     JumpToTableAfterJump

      .WORD loc_BANK2_82ED ; vertical
      .WORD loc_BANK2_8264 ; horizontal


loc_BANK2_8264:
      LDY     PlayerMovementDirection
      LDA     ScreenBoundaryLeftLo
      CLC
      ADC     byte_BANK2_8252-1,Y
      AND     #$F0
      STA     byte_RAM_5
      LDA     ScreenBoundaryLeftHi
      ADC     byte_BANK2_8252+1,Y
      STA     byte_RAM_6
      CMP     #$0A
      BCS     locret_BANK2_82AB

; =============== S U B R O U T I N E =======================================

sub_BANK2_827D:
      LDA     InSubspaceOrJar
      CMP     #$02
      BEQ     locret_BANK2_82AB

      LDX     #$00
      STX     byte_RAM_0

loc_BANK2_8288:
      CPX     byte_RAM_6
      BEQ     loc_BANK2_8298

      LDA     byte_RAM_0
      TAY
      CLC
      ADC     (RawEnemyData),Y
      STA     byte_RAM_0
      INX
      JMP     loc_BANK2_8288

; ---------------------------------------------------------------------------

loc_BANK2_8298:
      LDY     byte_RAM_0
      LDA     (RawEnemyData),Y
      STA     byte_RAM_1
      LDX     #$FF
      DEY

loc_BANK2_82A1:
      INY
      INY
      INX
      INX
      CPX     byte_RAM_1
      BCC     loc_BANK2_82AC

      LDX     byte_RAM_12

locret_BANK2_82AB:
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_82AC:
      LDA     (RawEnemyData),Y
      BMI     loc_BANK2_82A1

      INY
      LDA     (RawEnemyData),Y
      DEY

loc_BANK2_82B4:
      AND     #$F0
      CMP     byte_RAM_5
      BNE     loc_BANK2_82A1

      LDA     (RawEnemyData),Y
      CMP     #Enemy_BossBirdo
      BCS     loc_BANK2_82C8

      CMP     #Enemy_AttackAlbatossCarryingBobOmb
      BCC     loc_BANK2_82C8

      STA     SwarmType
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_82C8:
      LDX     #$04

loc_BANK2_82CA:
      LDA     EnemyState,X
      BEQ     loc_BANK2_82D2

      DEX
      BPL     loc_BANK2_82CA

      RTS

; ---------------------------------------------------------------------------

loc_BANK2_82D2:
      STX     byte_RAM_12
      LDA     byte_RAM_5
      STA     ObjectXLo,X
      LDA     byte_RAM_6
      STA     ObjectXHi,X
      INY
      LDA     (RawEnemyData),Y
      DEY
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     ObjectYLo,X
      LDA     #$00
      STA     ObjectYHi,X
      JMP     loc_BANK2_8377

; End of function sub_BANK2_827D

; ---------------------------------------------------------------------------

loc_BANK2_82ED:
      LDA     byte_RAM_10
      AND     #$01
      TAY
      INY
      LDA     NeedVerticalScroll
      BEQ     loc_BANK2_82FC

      AND     #$03
      EOR     #$03
      TAY

loc_BANK2_82FC:
      LDA     ScreenYLo
      CLC
      ADC     byte_BANK2_8252-1,Y
      AND     #$F0
      STA     byte_RAM_5
      LDA     ScreenYHi
      ADC     byte_BANK2_8252+1,Y
      STA     byte_RAM_6
      CMP     #$A

loc_BANK2_830F:
      BCS     locret_BANK2_82AB

loc_BANK2_8311:
      LDX     #$00
      STX     byte_RAM_0

loc_BANK2_8315:
      CPX     byte_RAM_6
      BEQ     loc_BANK2_8325

      LDA     byte_RAM_0
      TAY
      CLC
      ADC     (RawEnemyData),Y
      STA     byte_RAM_0
      INX
      JMP     loc_BANK2_8315

; ---------------------------------------------------------------------------

loc_BANK2_8325:
      LDY     byte_RAM_0

loc_BANK2_8327:
      LDA     (RawEnemyData),Y
      STA     byte_RAM_1
      LDX     #$FF
      DEY

loc_BANK2_832E:
      INY
      INY
      INX
      INX
      CPX     byte_RAM_1
      BCC     loc_BANK2_8339

      LDX     byte_RAM_12

locret_BANK2_8338:
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8339:
      LDA     (RawEnemyData),Y
      BMI     loc_BANK2_832E

      INY
      LDA     (RawEnemyData),Y
      DEY
      ASL     A

loc_BANK2_8342:
      ASL     A
      ASL     A
      ASL     A
      CMP     byte_RAM_5
      BNE     loc_BANK2_832E

      LDA     (RawEnemyData),Y
      CMP     #Enemy_BossBirdo
      BCS     loc_BANK2_8357

      CMP     #Enemy_AttackAlbatossCarryingBobOmb
      BCC     loc_BANK2_8357

      STA     SwarmType
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8357:
      LDX     #$04

loc_BANK2_8359:
      LDA     EnemyState,X
      BEQ     loc_BANK2_8361

      DEX
      BPL     loc_BANK2_8359

      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8361:
      STX     byte_RAM_12
      LDA     byte_RAM_5
      STA     ObjectYLo,X
      LDA     byte_RAM_6
      STA     ObjectYHi,X
      INY
      LDA     (RawEnemyData),Y
      DEY
      AND     #$F0
      STA     ObjectXLo,X
      LDA     #$00
      STA     ObjectXHi,X

loc_BANK2_8377:
      STA     unk_RAM_49B,X
      STY     byte_RAM_C
      LDA     (RawEnemyData),Y
      AND     #$3F
      CMP     #$32
      BCS     loc_BANK2_8393

      LDA     IsHorizontalLevel
      BEQ     loc_BANK2_8393

      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_RAM_F
      ADC     #$18
      CMP     #$30
      BCC     locret_BANK2_8338

loc_BANK2_8393:
      ; enable bit 7 of the raw enemy data to indicate that the enemy has spawned
      LDY     byte_RAM_C
      LDA     (RawEnemyData),Y
      ORA     #$80
      STA     (RawEnemyData),Y

      CMP     #$DC
      AND     #$7F
      BCC     loc_BANK2_83A6

      AND     #$3F
      STA     unk_RAM_49B,X

loc_BANK2_83A6:
      STA     ObjectType,X
      TYA
      STA     unk_RAM_441,X
      INC     EnemyState,X
      LDA     ObjectType,X
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
EnemyInitializationTable:
      .WORD EnemyInit_Basic ; Heart
      .WORD EnemyInit_Basic ; ShyguyRed
      .WORD EnemyInit_Basic ; Tweeter
      .WORD EnemyInit_Basic ; ShyguyPink
      .WORD EnemyInit_Basic ; Porcupo
      .WORD EnemyInit_Basic ; SnifitRed
      .WORD EnemyInit_Stationary ; SnifitGray
      .WORD EnemyInit_Basic ; SnifitPink
      .WORD EnemyInit_Basic ; Ostro
      .WORD EnemyInit_Bobomb ; BobOmb
      .WORD EnemyInit_Basic ; AlbatossCarryingBobOmb
      .WORD EnemyInit_AlbatossStartRight ; AlbatossStartRight
      .WORD EnemyInit_AlbatossStartLeft ; AlbatossStartLeft
      .WORD EnemyInit_Basic ; NinjiRunning
      .WORD EnemyInit_Stationary ; NinjiJumping
      .WORD EnemyInit_BeezoDiving ; BeezoDiving
      .WORD EnemyInit_Basic ; BeezoStraight
      .WORD EnemyInit_Basic ; WartBubble
      .WORD EnemyInit_Basic ; Pidgit
      .WORD EnemyInit_Trouter ; Trouter
      .WORD EnemyInit_Basic ; Hoopstar
      .WORD EnemyInit_JarGenerators ; JarGeneratorShyguy
      .WORD EnemyInit_JarGenerators ; JarGeneratorBobOmb
      .WORD EnemyInit_Phanto ; Phanto
      .WORD EnemyInit_Cobrats ; CobratJar
      .WORD EnemyInit_Cobrats ; CobratSand
      .WORD EnemyInit_Pokey ; Pokey
      .WORD EnemyInit_Basic ; Bullet
      .WORD EnemyInit_Birdo ; Birdo
      .WORD EnemyInit_Mouser ; Mouser
      .WORD EnemyInit_Basic ; Egg
      .WORD EnemyInit_Tryclyde ; Tryclyde
      .WORD EnemyInit_Basic ; Fireball
      .WORD EnemyInit_Clawgrip ; Clawgrip
      .WORD EnemyInit_Basic ; ClawgripRock
      .WORD EnemyInit_Stationary ; PanserStationaryFiresAngled
      .WORD EnemyInit_Basic ; PanserWalking
      .WORD EnemyInit_Stationary ; PanserStationaryFiresUp
      .WORD EnemyInit_Basic ; Autobomb
      .WORD EnemyInit_Basic ; AutobombFire
      .WORD EnemyInit_WhaleSpout ; WhaleSpout
      .WORD EnemyInit_Basic ; Flurry
      .WORD EnemyInit_Fryguy ; Fryguy
      .WORD EnemyInit_Fryguy ; FryguySplit
      .WORD EnemyInit_Wart ; Wart
      .WORD EnemyInit_HawkmouthBoss ; HawkmouthBoss
      .WORD EnemyInit_Sparks ; Spark1
      .WORD EnemyInit_Sparks ; Spark2
      .WORD EnemyInit_Sparks ; Spark3
      .WORD EnemyInit_Sparks ; Spark4
      .WORD EnemyInit_Basic ; VegetableSmall
      .WORD EnemyInit_Basic ; VegetableLarge
      .WORD EnemyInit_Basic ; VegetableWart
      .WORD EnemyInit_Basic ; Shell
      .WORD EnemyInit_Basic ; Coin
      .WORD EnemyInit_Basic ; Bomb
      .WORD EnemyInit_Basic ; Rocket
      .WORD EnemyInit_Basic ; MushroomBlock
      .WORD EnemyInit_Basic ; POWBlock
      .WORD EnemyInit_FallingLogs ; FallingLogs
      .WORD EnemyInit_Basic ; SubspaceDoor
      .WORD EnemyInit_Key ; Key
      .WORD EnemyInit_Basic ; SubspacePotion
      .WORD EnemyInit_Stationary ; Mushroom
      .WORD EnemyInit_Stationary ; Mushroom1up
      .WORD EnemyInit_Basic ; FlyingCarpet
      .WORD EnemyInit_Hawkmouth ; HawkmouthRight
      .WORD EnemyInit_Hawkmouth ; HawkmouthLeft
      .WORD EnemyInit_CrystalBallStarmanStopwatch ; CrystalBall
      .WORD EnemyInit_CrystalBallStarmanStopwatch ; Starman
      .WORD EnemyInit_CrystalBallStarmanStopwatch ; Stopwatch

; =============== S U B R O U T I N E =======================================

SetEnemyAttributes:
      LDY     ObjectType,X
      LDA     ObjectAttributeTable,Y
      AND     #$7F
      STA     ObjectAttributes,X
      LDA     EnemyArray_46E_Data,Y
      STA     EnemyArray_46E,X
      LDA     EnemyArray_489_Data,Y
      STA     EnemyArray_489,X
      LDA     EnemyArray_492_Data,Y
      STA     EnemyArray_492,X
      RTS

; End of function SetEnemyAttributes

; =============== S U B R O U T I N E =======================================

EnemyInit_Basic:
      LDA     #$00
      STA     EnemyTimer,X

; End of function EnemyInit_Basic

; =============== S U B R O U T I N E =======================================

; Enemy initializing (sets most stuff to 0)

EnemyInit_BasicWithoutTimer:
      LDA     #$00
      STA     EnemyVariable,X
      LDA     #$00 ; You do realize you already LDA #$00, right???
      STA     EnemyArray_B1,X
      STA     EnemyArray_42F,X
      STA     ObjectBeingCarriedTimer,X
      STA     ObjectAnimationTimer,X
      STA     ObjectShakeTimer,X
      STA     EnemyCollision,X
      STA     EnemyArray_438,X
      STA     EnemyArray_453,X
      STA     ObjectXAcceleration,X
      STA     ObjectYAcceleration,X
      STA     EnemyArray_45C,X
      STA     EnemyArray_477,X
      STA     EnemyArray_480,X
      STA     EnemyHP,X
      STA     ObjectYVelocity,X

EnemyInit_BasicAttributes:
      JSR     SetEnemyAttributes

; Initialize enemy movement in direction of player
EnemyInit_BasicMovementTowardPlayer:
      JSR     EnemyFindWhichSidePlayerIsOn

; Initialize enemy movement
; Y = 1 (move to the left)
; Y = 0 (move to the right)
EnemyInit_BasicMovement:
      INY ; uses using index 1 or 2 of EnemyInitialAccelerationTable
      STY     EnemyMovementDirection,X
      LDA     EnemyInitialAccelerationTable,Y
      STA     ObjectXVelocity,X

      ; Double the speed of objects when bit 6 of 46E is set
      LDA     EnemyArray_46E,X
      AND     #%01000000
      BEQ     EnemyInit_BasicMovementExit
      ASL     ObjectXVelocity,X ; Change the speed of certain objects?

EnemyInit_BasicMovementExit:
      RTS

; End of function EnemyInit_BasicWithoutTimer

; ---------------------------------------------------------------------------
BeezoXOffsetTable:
      .BYTE $FE ; If player moving right
      .BYTE $00 ; If moving left
BeezoDiveSpeedTable:
      .BYTE $12,$16,$1A,$1E,$22,$26,$2A,$2D
      .BYTE $30,$32,$34,$37,$39,$3B,$3D,$3E
; ---------------------------------------------------------------------------

EnemyInit_BeezoDiving:
      JSR     EnemyInit_Basic

      LDY     PlayerMovementDirection ; $02 = left, $01 = right
      LDA     ScreenBoundaryLeftLo
      ADC     BeezoXOffsetTable-1,Y
      STA     ObjectXLo,X ; Spawn in front of the player to dive at them
      LDA     ScreenBoundaryLeftHi
      ADC     #$00
      STA     ObjectXHi,X

; =============== S U B R O U T I N E =======================================

EnemyBeezoDiveSetup:
      LDA     PlayerYHi
      BPL     loc_BANK2_84D5

      ; If above the screen, just abort and use the least descend-y one
      LDY     #$00
      BEQ     loc_BANK2_84DF

loc_BANK2_84D5:
      LDA     PlayerYLo ; Check how far down on the screen the player is
      SEC
      SBC     ScreenYLo
      LSR     A ; And then take only the highest 4 bits
      LSR     A ; (divide by 16)
      LSR     A
      LSR     A
      TAY

loc_BANK2_84DF:
      LDA     BeezoDiveSpeedTable,Y
      STA     ObjectYVelocity,X
      RTS

; End of function EnemyBeezoDiveSetup

; ---------------------------------------------------------------------------

EnemyInit_Phanto:
      JSR     EnemyInit_Basic

      LDA     #$0C
      STA     ObjectXVelocity,X
      LDA     #$A0
      STA     PhantoActivateTimer
      RTS

; =============== S U B R O U T I N E =======================================

EnemyInit_Bobomb:
      JSR     EnemyInit_Basic

      LDA     #$FF
      STA     EnemyTimer,X
      RTS

; End of function EnemyInit_Bobomb

; ---------------------------------------------------------------------------

HandleEnemyState_Dead:
      JSR     sub_BANK3_B5CC

      JSR     sub_BANK2_88E8

loc_BANK2_8500:
      LDA     EnemyState,X
      BNE     MakeEnemyFlipUpsideDown

      LDA     unk_RAM_49B,X
      BEQ     EnemyDeathMaybe

loc_BANK2_8509:
      STA     byte_RAM_4B8
      JSR     sub_BANK2_9937

      JSR     Swarm_Stop

      LDA     #Music2_BossClearFanfare
      STA     MusicQueue2
      LDA     unk_RAM_4EF,X
      STA     ObjectXHi,X
      LDA     #$80
      STA     ObjectXLo,X
      ASL     A
      STA     ObjectYHi,X
      LDA     #$B0
      LDY     ObjectType,X
      CPY     #Enemy_Clawgrip
      BNE     loc_BANK2_852D

      LDA     #$70

loc_BANK2_852D:
      STA     ObjectYLo,X
      LDA     #%01000001
      STA     ObjectAttributes,X
      STA     EnemyArray_46E,X
      JMP     TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------

EnemyDeathMaybe:
      LDA     ObjectType,X
      CMP     #Enemy_Bullet ; "Stray bullet" enemy type
      BEQ     MakeEnemyFlipUpsideDown

      INC     EnemiesKilledForHeart
      LDY     EnemiesKilledForHeart
      CPY     #$08 ; number of enemies to kill before a heart appears
      BCC     MakeEnemyFlipUpsideDown

      LDA     #$00 ; reset enemy kill counter for heart counter
      STA     EnemiesKilledForHeart

      LDA     #EnemyState_Alive ; convert dead enemy to living heart
      STA     EnemyState,X
      STA     ObjectAttributes,X
      LDA     #%00000111 ; what's this magic number for?
      STA     EnemyArray_46E,X
      LDA     #Enemy_Heart
      STA     ObjectType,X
      LDA     ObjectYLo,X
      SBC     #$60 ; subtract this amount from the y position where the enemy despawned
      STA     ObjectYLo,X
      LDA     ObjectYHi,X
      SBC     #$00
      STA     ObjectYHi,X


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
      LDA     #$FF
      STA     unk_RAM_441,X
      RTS


MakeEnemyFlipUpsideDown:
      ASL     ObjectAttributes,X ; Shift left...
      SEC ; Set carry...
      ROR     ObjectAttributes,X ; Shift right. Effectively sets $80 bit

loc_BANK2_8574:
      JSR     RenderSprite


;
; Applies object physics
;
; Input
;   X = enemy index
;
ApplyObjectMovement:
      ; disable horiziontal physics while shaking
      LDA     ObjectShakeTimer,X
      BNE     ApplyObjectMovement_Vertical

      JSR     ApplyObjectPhysicsX

ApplyObjectMovement_Vertical:
      JSR     ApplyObjectPhysicsY

      LDA     ObjectYVelocity,X
      BMI     ApplyObjectMovement_Gravity

      ; Check terminal velocity
      CMP     #$3E
      BCS     ApplyObjectMovement_Exit

ApplyObjectMovement_Gravity:
      INC     ObjectYVelocity,X
      INC     ObjectYVelocity,X

ApplyObjectMovement_Exit:
      RTS


HandleEnemyState_BlockFizzle:
      JSR     sub_BANK2_88E8

      LDA     EnemyTimer,X
      BEQ     loc_BANK2_85AF

      TAY
      LSR     A
      LSR     A
      AND     #$01
      STA     EnemyMovementDirection,X
      LDA     #%00000001
      STA     ObjectAttributes,X
      STA     EnemyArray_46E,X
      LDA     #$3C
      CPY     #$C
      BCC     loc_BANK2_85AC

      LDA     #$3E

loc_BANK2_85AC:
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

loc_BANK2_85AF:
      JMP     EnemyDestroy

; ---------------------------------------------------------------------------

loc_BANK2_85B2:
      JSR     sub_BANK2_88E8

      JSR     EnemyBehavior_CheckDamaged

      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_85C1

      LDA     #EnemyState_Alive
      STA     EnemyState,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_85C1:
      LDA     EnemyTimer,X
      BEQ     loc_BANK2_85AF

      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      BCS     loc_BANK2_85E1

      JSR     IncrementAnimationTimerBy2

      LDA     byte_RAM_10
      AND     #$03
      STA     ObjectShakeTimer,X
      LDA     byte_RAM_10
      AND     #$10
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      ADC     #$01
      STA     EnemyMovementDirection,X

loc_BANK2_85E1:
      JSR     sub_BANK2_9486

      JMP     sub_BANK3_B5CC


ExplosionTileXOffsets:
      .BYTE $F8
      .BYTE $00
      .BYTE $F8
      .BYTE $00
      .BYTE $08
      .BYTE $10
      .BYTE $08
      .BYTE $10

ExplosionTileYOffsets:
      .BYTE $F8
      .BYTE $F8

EnemyInitialAccelerationTable:
      ; these values are shared with ExplosionTileYOffsets!
      .BYTE $08
      .BYTE $08
      .BYTE $F8
      .BYTE $F8
      .BYTE $08
      .BYTE $08


HandleEnemyState_BombExploding:
      JSR     sub_BANK2_88E8

      LDA     byte_RAM_EE
      ORA     byte_RAM_EF
      BNE     loc_BANK2_85AF

      LDA     EnemyTimer,X
      BEQ     loc_BANK2_85AF

      CMP     #$1A
      BCS     loc_BANK2_8610

      SBC     #$11
      BMI     loc_BANK2_8610

      TAY
      JSR     sub_BANK2_8670

loc_BANK2_8610:
      LDA     #$60
      STA     byte_RAM_0
      LDX     #$00
      LDY     #$40

loc_BANK2_8618:
      LDA     SpriteTempScreenY
      CLC
      ADC     ExplosionTileYOffsets,X
      STA     SpriteDMAArea,Y
      LDA     SpriteTempScreenX
      CLC
      ADC     ExplosionTileXOffsets,X
      STA     SpriteDMAArea+3,Y
      LDA     #$01
      STA     SpriteDMAArea+2,Y
      LDA     byte_RAM_0
      STA     SpriteDMAArea+1,Y
      CLC
      ADC     #$02
      STA     byte_RAM_0
      INY
      INY
      INY
      INY
      INX
      CPX     #$08
      BNE     loc_BANK2_8618

      LDX     byte_RAM_12
      JMP     sub_BANK3_B5CC

; ---------------------------------------------------------------------------

locret_BANK2_8649:
      RTS

; ---------------------------------------------------------------------------
byte_BANK2_864A:
      .BYTE $FB
      .BYTE $08
      .BYTE $15
      .BYTE $FB
      .BYTE $08
      .BYTE $15
      .BYTE $FB
      .BYTE $08
      .BYTE $15

byte_BANK2_8653:
      .BYTE $FF
      .BYTE $00
      .BYTE $00
      .BYTE $FF
      .BYTE $00
      .BYTE $00
      .BYTE $FF
      .BYTE $00
      .BYTE $00

byte_BANK2_865C:
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $08
      .BYTE $08
      .BYTE $08
      .BYTE $14
      .BYTE $14
      .BYTE $14

byte_BANK2_8665:
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00

byte_BANK2_866E:
      .BYTE $5F
      .BYTE $06

; =============== S U B R O U T I N E =======================================

sub_BANK2_8670:
      LDA     ObjectXLo,X
      CLC
      ADC     byte_BANK2_864A,Y
      STA     byte_RAM_C
      LDA     ObjectXHi,X
      ADC     byte_BANK2_8653,Y
      STA     byte_RAM_D
      CMP     #$B
      BCS     locret_BANK2_8649

      LDA     ObjectYLo,X
      ADC     byte_BANK2_865C,Y
      AND     #$F0
      STA     byte_RAM_E
      STA     byte_RAM_B
      LDA     ObjectYHi,X
      ADC     byte_BANK2_8665,Y
      STA     byte_RAM_F
      CMP     #$A
      BCS     locret_BANK2_8649

      LDY     IsHorizontalLevel
      BNE     loc_BANK2_86BD

      LSR     A
      ROR     byte_RAM_E
      LSR     A
      ROR     byte_RAM_E
      LSR     A
      ROR     byte_RAM_E
      LSR     A
      ROR     byte_RAM_E
      LDA     byte_RAM_E
      LDY     #$FF

loc_BANK2_86AD:
      SEC
      SBC     #$F
      INY
      BCS     loc_BANK2_86AD

      STY     byte_RAM_D
      ADC     #$F
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_E

loc_BANK2_86BD:
      LDA     byte_RAM_C
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_4
      ORA     byte_RAM_E
      STA     byte_RAM_5
      LDY     #$00
      LDA     ScreenBoundaryLeftHi
      CMP     #$A
      BNE     loc_BANK2_86D5

      STY     byte_RAM_D
      INY

loc_BANK2_86D5:
      LDA     #$10
      STA     byte_RAM_7
      LDA     byte_BANK2_866E,Y
      STA     byte_RAM_8
      LDY     byte_RAM_D

loc_BANK2_86E0:
      LDA     byte_RAM_7
      CLC
      ADC     #$F0
      STA     byte_RAM_7
      LDA     byte_RAM_8
      ADC     #$00
      STA     byte_RAM_8
      DEY
      BPL     loc_BANK2_86E0

      LDY     byte_RAM_5
      LDA     (byte_RAM_7),Y
      CMP     #$9D
      BEQ     loc_BANK2_8701

      CMP     #$93
      BEQ     loc_BANK2_8701

      CMP     #$72
      BEQ     loc_BANK2_8701

      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8701:
      LDA     #$40
      STA     (byte_RAM_7),Y
      LDA     byte_RAM_D
      AND     #$01
      EOR     #$01
      ASL     A

loc_BANK2_870C:
      ASL     A
      LDY     IsHorizontalLevel
      BNE     loc_BANK2_8712

      ASL     A

loc_BANK2_8712:
      PHA
      LDA     byte_RAM_E
      STA     byte_RAM_2
      LDA     byte_RAM_C
      AND     #$F0
      STA     byte_RAM_3
      LDA     #$08
      STA     byte_RAM_0
      LDA     byte_RAM_2
      ASL     A
      ROL     byte_RAM_0
      ASL     A
      ROL     byte_RAM_0
      AND     #$E0
      STA     byte_RAM_1
      LDA     byte_RAM_3
      LSR     A
      LSR     A
      LSR     A
      ORA     byte_RAM_1
      LDX     byte_RAM_300
      STA     byte_RAM_302,X
      CLC
      ADC     #$20
      STA     byte_RAM_307,X
      PLA
      ORA     byte_RAM_0
      STA     PPUBuffer_301,X
      ADC     #$00
      STA     byte_RAM_306,X

loc_BANK2_874B:
      LDA     #$02
      STA     byte_RAM_303,X
      STA     byte_RAM_308,X
      LDA     #$FA
      STA     byte_RAM_304,X
      STA     byte_RAM_305,X
      STA     byte_RAM_309,X
      STA     byte_RAM_30A,X
      LDA     #$00
      STA     byte_RAM_30B,X
      TXA
      CLC
      ADC     #$A
      STA     byte_RAM_300
      LDX     #$08

loc_BANK2_876F:
      LDA     EnemyState,X
      BEQ     loc_BANK2_8778

      DEX
      BPL     loc_BANK2_876F

      BMI     loc_BANK2_8795

loc_BANK2_8778:
      LDA     byte_RAM_C
      AND     #$F0
      STA     ObjectXLo,X
      LDA     byte_RAM_D
      LDY     IsHorizontalLevel
      BNE     loc_BANK2_8785

      TYA

loc_BANK2_8785:
      STA     ObjectXHi,X
      LDA     byte_RAM_B
      STA     ObjectYLo,X
      LDA     byte_RAM_F
      STA     ObjectYHi,X
      JSR     EnemyInit_BasicWithoutTimer

      JSR     sub_BANK2_98C4

loc_BANK2_8795:
      LDX     byte_RAM_12

locret_BANK2_8797:
      RTS

; End of function sub_BANK2_8670

; ---------------------------------------------------------------------------
byte_BANK2_8798:
      .BYTE $46
      .BYTE $4A
      .BYTE $4E
      .BYTE $52
; ---------------------------------------------------------------------------

HandleEnemyState_PuffOfSmoke:
      JSR     sub_BANK2_88E8

      LDA     ObjectAttributes,X
      ORA     #ObjAttrib_Palette0|ObjAttrib_Mirrored
      STA     ObjectAttributes,X
      LDA     EnemyTimer,X
      BNE     loc_BANK2_87AC

loc_BANK2_87A9:
      JMP     loc_BANK2_8842

; ---------------------------------------------------------------------------

loc_BANK2_87AC:
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     byte_BANK2_8798,Y
      JSR     sub_BANK2_9BB3

      LDA     unk_RAM_49B,X
      BEQ     locret_BANK2_8797

      LDA     EnemyTimer,X
      CMP     #$03
      BNE     locret_BANK2_8797

      LDY     #$22
      LDA     ObjectType,X
      CMP     #Enemy_Clawgrip
      BNE     loc_BANK2_87CA

      ; Clawgrip special hack:
      ; Move the "Draw the door" PPU command
      ; up 8 tile rows ($100) to be on the platform
      DEY

loc_BANK2_87CA:
      STY     PPUBuffer_721B
      STY     byte_RAM_7222
      INY
      STY     byte_RAM_7229
      STY     byte_RAM_7232
      LDY     #$03

loc_BANK2_87D9:
      LDA     unk_RAM_4EF,X
      AND     #$01
      ASL     A
      ASL     A
      EOR     #$04
      LDX     IsHorizontalLevel
      BNE     loc_BANK2_87E7

      ASL     A

loc_BANK2_87E7:
      LDX     EndOfLevelDoorRowOffsets,Y
      ORA     PPUBuffer_721B,X
      STA     PPUBuffer_721B,X
      LDX     byte_RAM_12
      DEY
      BPL     loc_BANK2_87D9

      LDA     #$14
      STA     ScreenUpdateIndex
      LDY     unk_RAM_4EF,X
      LDA     #$5F
      STA     byte_RAM_1
      LDA     #$10
      STA     byte_RAM_0

loc_BANK2_8804:
      LDA     byte_RAM_0
      CLC
      ADC     #$F0
      STA     byte_RAM_0
      LDA     byte_RAM_1
      ADC     #$00
      STA     byte_RAM_1
      DEY
      BPL     loc_BANK2_8804

      LDA     ObjectType,X
      CMP     #Enemy_Clawgrip
      BNE     loc_BANK2_8827

      LDA     byte_RAM_0
      SEC
      SBC     #$40
      STA     byte_RAM_0
      LDA     byte_RAM_1
      SBC     #$00
      STA     byte_RAM_1

loc_BANK2_8827:
      LDY     #$B8
      LDA     #$56
      STA     (byte_RAM_0),Y
      LDY     #$C8
      STA     (byte_RAM_0),Y
      LDA     #$53
      LDY     #$B9
      STA     (byte_RAM_0),Y
      LDY     #$CA
      STA     (byte_RAM_0),Y
      LDA     #$54
      LDY     #$C9
      STA     (byte_RAM_0),Y
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8842:
      LDA     ObjectType,X
      CMP     #Enemy_FryguySplit
      BNE     loc_BANK2_8855

      DEC     FryguySplitFlames
      BPL     loc_BANK2_8855

      INC     unk_RAM_49B,X
      INC     ObjectType,X
      JMP     loc_BANK2_8509

; ---------------------------------------------------------------------------

loc_BANK2_8855:
      JMP     EnemyDestroy

; ---------------------------------------------------------------------------

HandleEnemyState_Sand:
      JSR     sub_BANK2_88E8

      LDA     #$12
      STA     ObjectAttributes,X
      LDA     EnemyTimer,X
      BEQ     loc_BANK2_8888

      LDA     #$F8
      STA     ObjectYVelocity,X
      JSR     ApplyObjectPhysicsY

      LDA     #$B2
      LDY     EnemyTimer,X
      CPY     #$10
      BCS     loc_BANK2_8885

      LDA     #%10000000
      STA     EnemyArray_46E,X
      LDA     #$01
      STA     ObjectAttributes,X
      ASL     A
      STA     EnemyMovementDirection,X
      INC     ObjectAnimationTimer,X
      JSR     IncrementAnimationTimerBy2

      LDA     #$B4

loc_BANK2_8885:
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

loc_BANK2_8888:
      CPX     byte_RAM_42D
      BNE     loc_BANK2_8891

      LDA     #$00
      STA     HoldingItem

loc_BANK2_8891:
      JMP     EnemyDestroy

; =============== S U B R O U T I N E =======================================

sub_BANK2_8894:
      LDA     #$00
      STA     byte_RAM_EE
      LDA     ObjectAttributes,X
      LDY     #$01
      AND     #ObjAttrib_Horizontal
      BNE     loc_BANK2_88B9

      LDA     ObjectType,X
      CMP     #Enemy_Pokey
      BEQ     loc_BANK2_88B9

      CMP     #Enemy_Ostro
      BEQ     loc_BANK2_88B9

      CMP     #Enemy_HawkmouthBoss
      BEQ     loc_BANK2_88B9

      CMP     #Enemy_Clawgrip
      BEQ     loc_BANK2_88B9

      LDA     EnemyArray_46E,X
      AND     #%00100000
      BEQ     loc_BANK2_88BB

loc_BANK2_88B9:
      ; something for double-wide sprites?
      LDY     #$03

; seems to be logic for positioning sprites onscreen
loc_BANK2_88BB:
      LDA     ObjectXLo,X
      CLC
      ADC     byte_BANK2_88E4,Y
      STA     byte_RAM_E
      LDA     ObjectXHi,X
      ADC     #$00
      STA     byte_RAM_F
      LDA     byte_RAM_E
      CMP     ScreenBoundaryLeftLo
      LDA     byte_RAM_F
      SBC     ScreenBoundaryLeftHi
      BEQ     loc_BANK2_88DC

      LDA     byte_RAM_EE
      ORA     byte_BANK2_88E0,Y
      STA     byte_RAM_EE

loc_BANK2_88DC:
      DEY
      BPL     loc_BANK2_88BB

locret_BANK2_88DF:
      RTS

; End of function sub_BANK2_8894

; ---------------------------------------------------------------------------
; threshold for x-wrapping sprites near the edge of the screen
byte_BANK2_88E0: ; hi
      .BYTE $08
      .BYTE $04
      .BYTE $02
      .BYTE $01
byte_BANK2_88E4: ; lo
      .BYTE $00
      .BYTE $08
      .BYTE $10
      .BYTE $18

; =============== S U B R O U T I N E =======================================

sub_BANK2_88E8:
      JSR     sub_BANK2_8894

      LDA     #$22
      LDY     ObjectType,X
      CPY     #Enemy_Wart
      BEQ     loc_BANK2_88F9

      CPY     #Enemy_Tryclyde
      BEQ     loc_BANK2_88F9

      LDA     #$10

loc_BANK2_88F9:
      ADC     ObjectYLo,X
      STA     byte_RAM_0
      LDA     ObjectYHi,X
      ADC     #$00
      STA     byte_RAM_1
      LDA     byte_RAM_0
      CMP     ScreenYLo
      LDA     byte_RAM_1
      SBC     ScreenYHi
      STA     byte_RAM_EF

      CPY     #Enemy_Phanto
      BEQ     locret_BANK2_88DF

      CPY     #Enemy_FlyingCarpet
      BEQ     locret_BANK2_88DF

      CPY     #Enemy_HawkmouthLeft
      BEQ     locret_BANK2_88DF

      CPY     #Enemy_HawkmouthBoss
      BEQ     locret_BANK2_88DF

      TXA
      AND     #$01
      STA     byte_RAM_0
      LDA     byte_RAM_10
      AND     #$01
      EOR     byte_RAM_0
      BNE     locret_BANK2_88DF

      LDA     ScreenYLo
      SBC     #$30
      STA     byte_RAM_1
      LDA     ScreenYHi
      SBC     #$00
      STA     byte_RAM_0
      INC     byte_RAM_0
      LDA     ScreenYLo
      ADC     #$FF
      PHP
      ADC     #$30
      STA     byte_RAM_3
      LDA     ScreenYHi
      ADC     #$00
      PLP
      ADC     #$00
      STA     byte_RAM_2
      INC     byte_RAM_2
      LDA     ObjectYLo,X
      CMP     byte_RAM_1
      LDY     ObjectYHi,X
      INY
      TYA
      SBC     byte_RAM_0
      BMI     loc_BANK2_89A5

      LDA     ObjectYLo,X
      CMP     byte_RAM_3
      LDY     ObjectYHi,X
      INY
      TYA
      SBC     byte_RAM_2
      BPL     loc_BANK2_89A5

      LDA     ScreenBoundaryLeftLo
      SBC     #$30
      STA     byte_RAM_1
      LDA     ScreenBoundaryLeftHi
      SBC     #$00
      STA     byte_RAM_0
      INC     byte_RAM_0
      LDA     ScreenBoundaryRightLo
      ADC     #$30
      STA     byte_RAM_3
      LDA     ScreenBoundaryRightHi
      ADC     #$00
      STA     byte_RAM_2
      INC     byte_RAM_2
      LDA     ObjectXLo,X
      CMP     byte_RAM_1
      LDY     ObjectXHi,X
      INY
      TYA
      SBC     byte_RAM_0
      BMI     loc_BANK2_899C

      LDA     ObjectXLo,X
      CMP     byte_RAM_3
      LDY     ObjectXHi,X
      INY
      TYA
      SBC     byte_RAM_2
      BMI     EnemyDestroy_Exit

loc_BANK2_899C:
      LDY     ObjectType,X
      LDA     EnemyArray_46E_Data,Y
      AND     #$08
      BNE     EnemyDestroy_Exit

loc_BANK2_89A5:
      LDA     ObjectBeingCarriedTimer,X
      BNE     EnemyDestroy_Exit

; End of function sub_BANK2_88E8

; =============== S U B R O U T I N E =======================================

EnemyDestroy:
      ; load raw enemy data offset so we can allow the level object to respawn
      LDY     unk_RAM_441,X
      ; nothing to reset if offset is invalid
      BMI     EnemyDestroy_AfterAllowRespawn

      ; disabling bit 7 allows the object to respawn
      LDA     (RawEnemyData),Y
      AND     #$7F
      STA     (RawEnemyData),Y

EnemyDestroy_AfterAllowRespawn:
      LDA     #EnemyState_Inactive
      STA     EnemyState,X

EnemyDestroy_Exit:
      RTS

; End of function EnemyDestroy

; ---------------------------------------------------------------------------

HandleEnemyState_Alive:
      LDA     #$01
      STA     unk_RAM_4A4,X
      LDY     EnemyArray_42F,X
      DEY
      CPY     #$1F
      BCS     loc_BANK2_89C9

      INC     EnemyArray_42F,X

loc_BANK2_89C9:
      JSR     sub_BANK2_88E8

      LDA     PlayerState
      CMP     #PlayerState_ChangingSize
      BEQ     loc_BANK2_89E2

      LDA     NeedVerticalScroll
      AND     #$04
      BNE     loc_BANK2_8A07

      LDA     StopwatchTimer
      BNE     loc_BANK2_89E2

      LDA     EnemyArray_438,X
      BEQ     loc_BANK2_8A0A

loc_BANK2_89E2:
      LDA     ObjectType,X
      CMP     #Enemy_Heart
      BEQ     loc_BANK2_8A0A

      CMP     #Enemy_FlyingCarpet
      BEQ     loc_BANK2_89F0

      CMP     #Enemy_VegetableSmall
      BCS     loc_BANK2_8A0A

loc_BANK2_89F0:
      JSR     EnemyBehavior_CheckDamaged

      LDA     EnemyArray_42F,X
      BEQ     loc_BANK2_89FB

      JSR     ApplyObjectMovement

loc_BANK2_89FB:
      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_8A04

      DEC     ObjectAnimationTimer,X

loc_BANK2_8A01:
      JMP     CarryObject

; ---------------------------------------------------------------------------

loc_BANK2_8A04:
      JSR     sub_BANK3_B5CC

loc_BANK2_8A07:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK2_8A0A:
      LDY     #$01
      LDA     ObjectXVelocity,X
      BEQ     loc_BANK2_8A15

      BPL     loc_BANK2_8A13

      INY

loc_BANK2_8A13:
      STY     EnemyMovementDirection,X

loc_BANK2_8A15:
      LDY     ObjectType,X
      LDA     ObjectAttributeTable,Y
      AND     #ObjAttrib_Palette0|ObjAttrib_BehindBackground
      BNE     loc_BANK2_8A41

      LDA     ObjectAttributes,X
      AND     #ObjAttrib_Palette3|ObjAttrib_Horizontal|ObjAttrib_FrontFacing|ObjAttrib_Mirrored|ObjAttrib_16x32|ObjAttrib_UpsideDown
      STA     ObjectAttributes,X
      LDA     ObjectBeingCarriedTimer,X
      CMP     #$02
      BCC     loc_BANK2_8A41

      LDA     ObjectType,X
      CMP     #Enemy_BobOmb
      BNE     loc_BANK2_8A36

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BNE     loc_BANK2_8A3B

loc_BANK2_8A36:
      LDA     ObjectAttributeTable,Y
      BPL     loc_BANK2_8A41

loc_BANK2_8A3B:
      LDA     ObjectAttributes,X
      ORA     #$20
      STA     ObjectAttributes,X

loc_BANK2_8A41:
      JSR     loc_BANK2_8A53

      LDA     ObjectYHi,X
      BMI     loc_BANK2_8A50

      LDA     SpriteTempScreenY
      CMP     #$E8
      BCC     loc_BANK2_8A50

      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8A50:
      JMP     sub_BANK3_B5CC

; ---------------------------------------------------------------------------

loc_BANK2_8A53:
      LDA     ObjectType,X
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
EnemyBehaviorPointerTable:
      .WORD EnemyBehavior_00
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_Ostro
      .WORD EnemyBehavior_BobOmb
      .WORD EnemyBehavior_Albatoss ; 10
      .WORD EnemyBehavior_Albatoss
      .WORD EnemyBehavior_Albatoss
      .WORD EnemyBehavior_NinjiRunning
      .WORD EnemyBehavior_NinjiJumping
      .WORD EnemyBehavior_Beezo
      .WORD EnemyBehavior_Beezo
      .WORD EnemyBehavior_WartBubble
      .WORD EnemyBehavior_Pidgit
      .WORD EnemyBehavior_Trouter
      .WORD EnemyBehavior_Hoopstar ; 20
      .WORD EnemyBehavior_JarGenerators
      .WORD EnemyBehavior_JarGenerators
      .WORD EnemyBehavior_Phanto
      .WORD EnemyBehavior_CobratJar
      .WORD EnemyBehavior_CobratGround
      .WORD EnemyBehavior_Pokey
      .WORD EnemyBehavior_BulletAndEgg
      .WORD EnemyBehavior_Birdo
      .WORD EnemyBehavior_Mouser
      .WORD EnemyBehavior_BulletAndEgg ; 30
      .WORD EnemyBehavior_Tryclyde
      .WORD EnemyBehavior_Fireball
      .WORD EnemyBehavior_Clawgrip
      .WORD EnemyBehavior_ClawgripRock
      .WORD EnemyBehavior_PanserRedAndGray
      .WORD EnemyBehavior_PanserPink
      .WORD EnemyBehavior_PanserRedAndGray
      .WORD EnemyBehavior_Autobomb
      .WORD EnemyBehavior_AutobombFire
      .WORD EnemyBehavior_WhaleSpout ; 40
      .WORD EnemyBehavior_Flurry
      .WORD EnemyBehavior_Fryguy
      .WORD EnemyBehavior_FryguySplit
      .WORD EnemyBehavior_Wart
      .WORD EnemyBehavior_HawkmouthBoss
      .WORD EnemyBehavior_Spark
      .WORD EnemyBehavior_Spark
      .WORD EnemyBehavior_Spark
      .WORD EnemyBehavior_Spark
      .WORD EnemyBehavior_Vegetable ; 50
      .WORD EnemyBehavior_Vegetable
      .WORD EnemyBehavior_Vegetable
      .WORD EnemyBehavior_Shell
      .WORD EnemyBehavior_Coin
      .WORD EnemyBehavior_Bomb
      .WORD EnemyBehavior_Rocket
      .WORD EnemyBehavior_MushroomBlockAndPOW
      .WORD EnemyBehavior_MushroomBlockAndPOW
      .WORD EnemyBehavior_FallingLogs
      .WORD EnemyBehavior_SubspaceDoor ; 60
      .WORD EnemyBehavior_Key
      .WORD EnemyBehavior_SubspacePotion
      .WORD EnemyBehavior_Mushroom
      .WORD EnemyBehavior_Mushroom1up
      .WORD EnemyBehavior_FlyingCarpet
      .WORD EnemyBehavior_Hawkmouth
      .WORD EnemyBehavior_Hawkmouth
      .WORD EnemyBehavior_CrystalBall
      .WORD EnemyBehavior_Starman
      .WORD EnemyBehavior_Mushroom ; 70
; ---------------------------------------------------------------------------

EnemyInit_JarGenerators:
      JSR     EnemyInit_Basic

      LDA     #$50
      STA     ObjectAnimationTimer,X
      RTS

; ---------------------------------------------------------------------------
SparkAccelerationTable:
      .BYTE $F0
      .BYTE $E0
      .BYTE $F0
      .BYTE $E0
      .BYTE $10
      .BYTE $20
; ---------------------------------------------------------------------------

EnemyInit_Sparks:
      JSR     EnemyInit_Basic

      LDY     ObjectType,X
      LDA     SparkAccelerationTable-$2E,Y
      STA     ObjectXVelocity,X
      LDA     SparkAccelerationTable-$2C,Y
      STA     ObjectYVelocity,X
      RTS

; ---------------------------------------------------------------------------
SparkCollision: ; spark movement based on collision
      .BYTE %00001100 ; top/bottom (horizontal)
      .BYTE %00000011 ; left/right (vertical)
byte_BANK2_8B06:
      .BYTE $00
      .BYTE $0A
; ---------------------------------------------------------------------------

EnemyBehavior_Spark:
      JSR     EnemyBehavior_CheckDamaged

      JSR     IncrementAnimationTimerBy2

      JSR     RenderSprite

      LDA     ObjectXLo,X
      ORA     ObjectYLo,X
      AND     #$0F
      BNE     loc_BANK2_8B50

      JSR     sub_BANK3_B4F9

      LDY     EnemyArray_477,X
      LDA     EnemyCollision,X
      AND     SparkCollision,Y
      BEQ     loc_BANK2_8B47

      LDA     SparkCollision,Y
      EOR     #$0F
      AND     EnemyCollision,X
      BEQ     loc_BANK2_8B50

      TYA
      EOR     #$01
      STA     EnemyArray_477,X
      TAY

; =============== S U B R O U T I N E =======================================

sub_BANK2_8B36:
      TXA
      CLC
      ADC     byte_BANK2_8B06,Y
      TAY
      LDA     ObjectXVelocity,Y
      EOR     #$FF
      ADC     #$01
      STA     ObjectXVelocity,Y
      RTS

; End of function sub_BANK2_8B36

; ---------------------------------------------------------------------------

loc_BANK2_8B47:
      TYA
      EOR     #$01
      STA     EnemyArray_477,X
      JSR     sub_BANK2_8B36

loc_BANK2_8B50:
      LDA     EnemyArray_477,X
      BNE     loc_BANK2_8B58

      JMP     ApplyObjectPhysicsX

; ---------------------------------------------------------------------------

loc_BANK2_8B58:
      JMP     ApplyObjectPhysicsY


IncrementAnimationTimerBy2:
      INC     ObjectAnimationTimer,X
      INC     ObjectAnimationTimer,X
      RTS


AlbatossSwarmStartXLo:
      .BYTE $F0
      .BYTE $00

AlbatossSwarmStartXHi:
      .BYTE $FF
      .BYTE $01


Swarm_AlbatossCarryingBobOmb:
      JSR     Swarm_CreateEnemy

      ADC     AlbatossSwarmStartXLo,Y
      STA     ObjectXLo,X
      LDA     ScreenBoundaryLeftHi
      ADC     AlbatossSwarmStartXHi,Y
      STA     ObjectXHi,X
      STY     byte_RAM_1
      LDA     #Enemy_AlbatossCarryingBobOmb
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDA     PseudoRNGValues+2
      AND     #$1F
      ADC     #$20
      STA     ObjectYLo,X
      LDY     byte_RAM_1
      JSR     EnemyInit_BasicMovement

      ASL     ObjectXVelocity,X
      RTS


BeezoSwarmStartXLo:
      .BYTE $00
      .BYTE $FF


Swarm_BeezoDiving:
      JSR     Swarm_CreateEnemy

      ADC     BeezoSwarmStartXLo,Y
      STA     ObjectXLo,X
      LDA     IsHorizontalLevel
      BEQ     Swarm_BeezoDiving_Vertical

Swarm_BeezoDiving_Horizontal:
      LDA     ScreenBoundaryLeftHi
      ADC     #$00

Swarm_BeezoDiving_Vertical:
      STA     ObjectXHi,X
      LDA     ScreenYLo
      STA     ObjectYLo,X
      LDA     ScreenYHi
      STA     ObjectYHi,X
      STY     byte_RAM_1
      LDA     #Enemy_BeezoDiving
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDY     byte_RAM_1
      JSR     EnemyInit_BasicMovement

      JSR     EnemyBeezoDiveSetup

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
      LDA     StopwatchTimer
      BNE     Swarm_CreateEnemy_Fail

      ; Generate an enemy when the counter overflows
      LDA     SwarmCounter
      CLC
      ADC     #$03
      STA     SwarmCounter
      BCC     Swarm_CreateEnemy_Fail

      ; Create the enemy, but bail if it's not possible
      JSR     CreateEnemy

      BMI     Swarm_CreateEnemy_Fail

      ; Pick a direction
      LDY     #$00
      LDA     byte_RAM_10
      AND     #$40
      BNE     Swarm_CreateEnemy_Exit

      INY

Swarm_CreateEnemy_Exit:
      LDX     byte_RAM_0
      LDA     ScreenBoundaryLeftLo
      RTS

Swarm_CreateEnemy_Fail:
      ; Break out of the parent swarm subroutine
      PLA
      PLA
      RTS


EnemyBehavior_Fireball:
      JSR     sub_BANK3_B4FD

      JSR     sub_BANK2_927A

      JSR     EnemyBehavior_CheckDamaged

      JSR     RenderSprite

      LDA     EnemyVariable,X
      BNE     EnemyBehavior_Fireball_CheckCollision

      JMP     ApplyObjectMovement


EnemyBehavior_Fireball_CheckCollision:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     EnemyBehavior_Fireball_Exit

      JSR     TurnIntoPuffOfSmoke

EnemyBehavior_Fireball_Exit:
      JMP     sub_BANK2_9430


PanserFireXVelocity:
      .BYTE $10
      .BYTE $F0


EnemyBehavior_PanserPink:
      LDA     ObjectAnimationTimer,X
      ASL     A
      BNE     EnemyBehavior_PanserRedAndGray

      JSR     EnemyInit_BasicMovementTowardPlayer

EnemyBehavior_PanserRedAndGray:
      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_8C1A

      JSR     ResetObjectYVelocity

loc_BANK2_8C1A:
      PLA
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK2_8C22

      JSR     EnemyBehavior_TurnAround

loc_BANK2_8C22:
      JSR     ApplyObjectMovement

      LDA     #%10000011
      STA     EnemyArray_46E,X
      LDA     #$02
      STA     EnemyMovementDirection,X
      JSR     EnemyBehavior_CheckDamaged

      INC     ObjectAnimationTimer,X
      LDA     ObjectAnimationTimer,X
      AND     #$2F
      BNE     loc_BANK2_8C3D

      LDA     #$10
      STA     EnemyTimer,X

loc_BANK2_8C3D:
      LDY     EnemyTimer,X
      BEQ     loc_BANK2_8C8E

      CPY     #$06
      BNE     loc_BANK2_8C7C

      JSR     CreateEnemy

      BMI     loc_BANK2_8C7C

      LDA     ObjectType,X
      PHA
      LDX     byte_RAM_0
      LDA     PseudoRNGValues+2
      AND     #$0F
      ORA     #$BC
      STA     ObjectYVelocity,X
      JSR     EnemyFindWhichSidePlayerIsOn

      PLA
      CMP     #Enemy_PanserStationaryFiresUp
      LDA     PanserFireXVelocity,Y
      BCC     loc_BANK2_8C65

      LDA     #$00

loc_BANK2_8C65:
      STA     ObjectXVelocity,X
      LDA     ObjectXLo,X
      SBC     #$05
      STA     ObjectXLo,X
      LDA     ObjectXHi,X
      SBC     #$00
      STA     ObjectXHi,X
      LDA     #Enemy_Fireball
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

loc_BANK2_8C7C:
      LDA     ObjectAttributes,X
      ORA     #$10
      STA     ObjectAttributes,X
      LDA     #$AE
      JSR     sub_BANK2_9BB3

      LDA     ObjectAttributes,X
      AND     #$EF
      STA     ObjectAttributes,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8C8E:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_Key:
      LDY     #$05

loc_BANK2_8C93:
      LDA     EnemyState,Y
      BEQ     loc_BANK2_8CA3

loc_BANK2_8C98:
      CPY     byte_RAM_12
      BEQ     loc_BANK2_8CA3

      LDA     ObjectType,Y
      CMP     #Enemy_Key
      BEQ     loc_BANK2_8CAE

loc_BANK2_8CA3:
      DEY
      BPL     loc_BANK2_8C93

      LDA     KeyUsed
      BNE     loc_BANK2_8CAE

loc_BANK2_8CAB:
      JMP     EnemyInit_Stationary

; ---------------------------------------------------------------------------

loc_BANK2_8CAE:
      JMP     EnemyDestroy

; ---------------------------------------------------------------------------

EnemyInit_CrystalBallStarmanStopwatch:
      LDY     #$05

loc_BANK2_8CB3:
      LDA     EnemyState,Y
      BEQ     loc_BANK2_8CC3

      CPY     byte_RAM_12
      BEQ     loc_BANK2_8CC3

      LDA     ObjectType,Y
      CMP     #Enemy_CrystalBall
      BEQ     loc_BANK2_8CAE

loc_BANK2_8CC3:
      DEY
      BPL     loc_BANK2_8CB3

      LDA     CrystalAndHawkmouthOpenSize
      BNE     loc_BANK2_8CAE

      BEQ     loc_BANK2_8CAB

      JSR     CreateEnemy

      BMI     locret_BANK2_8CF7

      LDX     byte_RAM_0
      LDA     #Enemy_Starman
      STA     ObjectType,X
      LDA     ScreenBoundaryLeftLo
      ADC     #$D0
      STA     ObjectXLo,X
      LDA     ScreenBoundaryLeftHi
      ADC     #$00
      STA     ObjectXHi,X
      LDA     ScreenYLo
      ADC     #$E0
      STA     ObjectYLo,X
      LDA     ScreenYHi
      ADC     #$00
      STA     ObjectYHi,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

locret_BANK2_8CF7:
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Starman:
      LDA     #$FC
      STA     ObjectYVelocity,X
      LDY     #$F8
      LDA     byte_RAM_10
      STA     EnemyArray_45C,X
      BPL     loc_BANK2_8D07

      LDY     #$08

loc_BANK2_8D07:
      STY     ObjectXVelocity,X
      JMP     loc_BANK2_8574

; ---------------------------------------------------------------------------

EnemyBehavior_JarGenerators:
      JSR     sub_BANK3_B4FD

      AND     #$03
      BNE     loc_BANK2_8D16

      JMP     EnemyDestroy

; ---------------------------------------------------------------------------

loc_BANK2_8D16:
      INC     ObjectAnimationTimer,X
      LDA     ObjectAnimationTimer,X
      ASL     A
      BNE     locret_BANK2_8D5E

      JSR     CreateEnemy

      BMI     locret_BANK2_8D5E

      LDY     byte_RAM_0
      LDA     ObjectXLo,Y
      SEC
      SBC     #$06
      STA     ObjectXLo,Y
      LDA     ObjectYLo,Y
      SBC     #$04
      STA     ObjectYLo,Y
      LDA     ObjectYHi,Y
      SBC     #$00
      STA     ObjectYHi,Y
      LDA     #$1A
      STA     EnemyArray_480,Y
      LDA     #$F8
      STA     ObjectYVelocity,Y
      LDA     ObjectType,X
      CMP     #Enemy_JarGeneratorBobOmb
      BNE     locret_BANK2_8D5E

      LDA     #Enemy_BobOmb
      STA     ObjectType,Y
      LDA     ObjectXVelocity,Y
      ASL     A
      STA     ObjectXVelocity,Y
      LDA     #$FF
      STA     EnemyTimer,Y

locret_BANK2_8D5E:
      RTS

; =============== S U B R O U T I N E =======================================

EnemyInit_Hawkmouth:
      DEC     ObjectYLo,X
      DEC     ObjectYLo,X
      LDY     #$01
      STY     byte_RAM_711F
      INY
      STY     byte_RAM_710B

; End of function EnemyInit_Hawkmouth

; =============== S U B R O U T I N E =======================================

EnemyInit_Stationary:
; DATA XREF: ...
      JSR     EnemyInit_Basic

loc_BANK2_8D6F:
      LDA     #$00
      STA     ObjectXVelocity,X
      RTS

; End of function EnemyInit_Stationary

; ---------------------------------------------------------------------------

EnemyBehavior_Hawkmouth:
      LDA     byte_RAM_EE
      BEQ     loc_BANK2_8D7B

loc_BANK2_8D78:
      JMP     loc_BANK2_8E05

; ---------------------------------------------------------------------------

loc_BANK2_8D7B:
      LDA     HawkmouthOpenTimer
      BEQ     loc_BANK2_8D8A

      DEC     HawkmouthOpenTimer
      BNE     loc_BANK2_8D78

      LDA     #SoundEffect1_HawkOpen_WartBarf
      STA     SoundEffectQueue1

loc_BANK2_8D8A:
      LDA     HawkmouthClosing
      BEQ     loc_BANK2_8DBA

      DEC     CrystalAndHawkmouthOpenSize
      BNE     loc_BANK2_8D78

      LDA     #$00
      STA     HawkmouthClosing
      LDA     #TransitionType_Door
      STA     TransitionType
      JSR     DoAreaReset

      LDY     byte_RAM_629
      LDA     CurrentWorld
      CMP     #$06
      BNE     loc_BANK2_8DAC

      INY

loc_BANK2_8DAC:
      CPY     #$02
      BCC     SetGameModeBonusChance

      INC     DoAreaTransition
      RTS

; ---------------------------------------------------------------------------

SetGameModeBonusChance:
      LDA     #GameMode_BonusChance
      STA     GameMode
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8DBA:
      LDA     CrystalAndHawkmouthOpenSize
      BEQ     loc_BANK2_8E05

      CMP     #$30
      BEQ     loc_BANK2_8DDB

      LDA     byte_RAM_EE
      AND     #$04
      BNE     loc_BANK2_8E05

      INC     CrystalAndHawkmouthOpenSize
      LDA     byte_RAM_10
      AND     #$03
      BNE     loc_BANK2_8DD8

      DEC     byte_RAM_711F
      INC     byte_RAM_710B

loc_BANK2_8DD8:
      JMP     loc_BANK2_8E05

; ---------------------------------------------------------------------------

loc_BANK2_8DDB:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_PlayerInsideMaybe
      BEQ     loc_BANK2_8E05

      LDA     ObjectYLo,X
      CMP     PlayerYLo
      BCS     loc_BANK2_8E05

      LDA     PlayerCollision
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_8E05

      LDA     HoldingItem
      BNE     loc_BANK2_8E05

      LDA     #PlayerState_HawkmouthEating
      STA     PlayerState
      LDA     #$30
      STA     PlayerStateTimer
      LDA     #$FC
      STA     PlayerYVelocity
      LDA     #SoundEffect1_HawkOpen_WartBarf
      STA     SoundEffectQueue1
      INC     HawkmouthClosing

loc_BANK2_8E05:
      LDA     byte_RAM_EF
      BNE     loc_BANK2_8E60

      LDA     ObjectType,X
      SEC
      SBC     #$41
      STA     EnemyMovementDirection,X
      LDA     CrystalAndHawkmouthOpenSize

; =============== S U B R O U T I N E =======================================

sub_BANK2_8E13:
      STA     byte_RAM_7
      LSR     A
      LSR     A
      EOR     #$FF
      SEC
      ADC     SpriteTempScreenY
      STA     SpriteTempScreenY
      LDY     byte_RAM_4BD
      BEQ     loc_BANK2_8E27

      LDY     #$10

loc_BANK2_8E27:
      STY     byte_RAM_F4
      LDA     #$8E
      LDY     byte_RAM_7
      BEQ     loc_BANK2_8E31

      LDA     #$92

loc_BANK2_8E31:
      JSR     sub_BANK2_9BB3

      LDA     byte_RAM_7
      TAY
      LSR     A
      CLC
      ADC     SpriteTempScreenY
      ADC     #$08
      CPY     #$00
      BNE     loc_BANK2_8E44

      ADC     #$07

loc_BANK2_8E44:
      STA     byte_RAM_0
      JSR     loc_BANKF_FAFE

      LDX     #$9A
      LDA     byte_RAM_7
      BEQ     loc_BANK2_8E58

      LDA     HawkmouthClosing
      BEQ     loc_BANK2_8E56

      LDY     #$10

loc_BANK2_8E56:
      LDX     #$96

loc_BANK2_8E58:
      STY     byte_RAM_F4
      JSR     sub_BANK2_9CF2

      JSR     sub_BANK2_9CF2

loc_BANK2_8E60:
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK2_8E13

; ---------------------------------------------------------------------------

EnemyInit_Trouter:
      JSR     EnemyInit_Stationary

      LDA     ObjectXLo,X
      ADC     #$08
      STA     ObjectXLo,X
      LDA     ObjectYLo,X
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     EnemyArray_B1,X
      LDA     #$80
      STA     EnemyTimer,X

locret_BANK2_8E78:
      RTS


byte_BANK2_8E79:
      .BYTE $AC
      .BYTE $AE
      .BYTE $B1
      .BYTE $B5
      .BYTE $B8
      .BYTE $BC
      .BYTE $C0
      .BYTE $C4
      .BYTE $C8
      .BYTE $CC
      .BYTE $D2
      .BYTE $D8

byte_BANK2_8E85:
      .BYTE $92
      .BYTE $EA


EnemyBehavior_Trouter:
      JSR     EnemyBehavior_CheckDamaged

      INC     ObjectAnimationTimer,X
      JSR     sub_BANK2_98D6

      JSR     EnemyBehavior_CheckBeingCarriedTimer

      LDA     #$09
      LDY     ObjectYVelocity,X
      BMI     loc_BANK2_8E9A

      LDA     #$89

loc_BANK2_8E9A:
      STA     ObjectAttributes,X
      LDY     IsHorizontalLevel
      LDA     ObjectYLo,X
      CMP     byte_BANK2_8E85,Y
      BCC     loc_BANK2_8EB6

      LDY     EnemyTimer,X
      BNE     locret_BANK2_8E78

      STA     ObjectYLo,X
      LDY     EnemyArray_B1,X
      LDA     byte_BANK2_8E79,Y
      STA     ObjectYVelocity,X
      LDA     #$C0
      STA     EnemyTimer,X

loc_BANK2_8EB6:
      JSR     sub_BANK2_9430

      INC     ObjectYVelocity,X
      JMP     RenderSprite


Enemy_Hoopstar_YVelocity:
      .BYTE $FA ; up
      .BYTE $0C ; down

Enemy_Hoopstar_Attributes:
      .BYTE $91 ; up
      .BYTE $11 ; down


EnemyBehavior_Hoopstar:
      JSR     EnemyBehavior_CheckDamaged

      INC     ObjectAnimationTimer,X
      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     RenderSprite

      JSR     sub_BANK2_98D6

      LDA     #$00
      STA     ObjectXVelocity,X
      JSR     sub_BANK3_B4E2

      LDY     EnemyArray_477,X
      BCC     loc_BANK2_8EEC

      LDA     ObjectYLo,X
      CMP     ScreenYLo
      LDA     ObjectYHi,X
      SBC     ScreenYHi
      BEQ     loc_BANK2_8EF3

      ASL     A
      ROL     A
      AND     #$01
      BPL     loc_BANK2_8EEF

loc_BANK2_8EEC:
      TYA
      EOR     #$01

loc_BANK2_8EEF:
      STA     EnemyArray_477,X
      TAY

loc_BANK2_8EF3:
      LDA     Enemy_Hoopstar_YVelocity,Y
      STA     ObjectYVelocity,X
      LDA     Enemy_Hoopstar_Attributes,Y
      STA     ObjectAttributes,X
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_RAM_F
      ADC     #$10
      CMP     #$20
      BCS     loc_BANK2_8F0A

      ASL     ObjectYVelocity,X

loc_BANK2_8F0A:
      JMP     ApplyObjectPhysicsY

; ---------------------------------------------------------------------------

EnemyBehavior_00:
      LDA     byte_RAM_EF
      BEQ     loc_BANK2_8F14

      JMP     EnemyDestroy

; ---------------------------------------------------------------------------

loc_BANK2_8F14:
      LDY     #$FC
      LDA     byte_RAM_10
      AND     #$20
      BEQ     loc_BANK2_8F1E

      LDY     #$04

loc_BANK2_8F1E:
      STY     ObjectXVelocity,X
      LDA     #$F8
      STA     ObjectYVelocity,X
      JSR     sub_BANK2_9430

loc_BANK2_8F27:
      LDA     byte_RAM_EE
      AND     #$08
      ORA     byte_RAM_EF
      BNE     locret_BANK2_8F4E

      ; This part of the code seems to only run
      ; if the graph we're trying to draw is
      ; a heart sprite ...
      LDY     byte_RAM_F4
      LDA     SpriteTempScreenY
      STA     SpriteDMAArea,Y
      LDA     SpriteTempScreenX
      STA     SpriteDMAArea+3,Y
      LDA     #$D8
      STA     SpriteDMAArea+1,Y
      LDA     byte_RAM_10
      AND     #$20
      EOR     #$20
      ASL     A
      ORA     #$01
      STA     SpriteDMAArea+2,Y

locret_BANK2_8F4E:
      RTS


Enemy_Birdo_Attributes:
      .BYTE ObjAttrib_Palette3|ObjAttrib_16x32
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32
      .BYTE ObjAttrib_Palette2|ObjAttrib_16x32


;
; Initializes a Birdo (and a few other boss enemies)
;
EnemyInit_Birdo:
      JSR     EnemyInit_Basic

      LDY     #$00 ; Default to the Gray Birdo (fires only fireballs)
      LDA     ObjectXLo,X ; Check if this is a special Birdo.
      CMP     #$A0 ; means this is a Pink Birdo (fires only eggs, slowly)
      BEQ     EnemyInit_Birdo_SetType

      INY
      CMP     #$B0 ; tile x-position on page = $B
      BEQ     EnemyInit_Birdo_SetType ; If yes, this is a Red Birdo (fires eggs and fireballs)

      INY

EnemyInit_Birdo_SetType:
      STY     EnemyVariable,X ; Set the Birdo type
      LDA     Enemy_Birdo_Attributes,Y
      STA     ObjectAttributes,X
      LDA     #$02
      STA     EnemyHP,X

EnemyInit_Birdo_Exit:
      LDA     ObjectXHi,X
      STA     unk_RAM_4EF,X
      RTS


ProjectileLaunchXOffsets:
      .BYTE $FE
      .BYTE $F8


EnemyBehavior_Birdo:
      JSR     EnemyBehavior_CheckDamaged

      JSR     sub_BANK3_B4FD

      LDA     #$00
      STA     ObjectXVelocity,X
      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      STY     EnemyMovementDirection,X
      JSR     RenderSprite

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_8FD2

      JSR     ResetObjectYVelocity

      LDA     byte_RAM_10
      BNE     loc_BANK2_8FA3

      LDA     #$E0
      STA     ObjectYVelocity,X
      BNE     loc_BANK2_8FD2


BirdoSpitDelay:
      .BYTE $7F
      .BYTE $3F
      .BYTE $3F


; Health-based Birdo egg/fire chances.
; If PRNG & $1F >= this, shoot an egg
; Otherwise, shoot a fireball
BirdoHealthEggProbabilities:
      .BYTE $08
      .BYTE $06
      .BYTE $04


loc_BANK2_8FA3:
      LDY     EnemyVariable,X
      LDA     BirdoSpitDelay,Y
      AND     byte_RAM_10
      BNE     loc_BANK2_8FB6

      LDA     byte_RAM_EE
      AND     #$C
      BNE     loc_BANK2_8FB6

      LDA     #$1C
      STA     EnemyTimer,X

loc_BANK2_8FB6:
      LDY     EnemyTimer,X
      BNE     BirdoBehavior_SpitProjectile

      INC     EnemyArray_B1,X
      LDA     EnemyArray_B1,X
      AND     #$40
      BEQ     loc_BANK2_901B

      JSR     IncrementAnimationTimerBy2

      LDA     #$0A
      LDY     EnemyArray_B1,X
      BMI     loc_BANK2_8FCD

      LDA     #$F6

loc_BANK2_8FCD:
      STA     ObjectXVelocity,X
      JMP     ApplyObjectPhysicsX

; ---------------------------------------------------------------------------

loc_BANK2_8FD2:
      JMP     ApplyObjectMovement_Vertical

; ---------------------------------------------------------------------------

BirdoBehavior_SpitProjectile:
      CPY     #$08
      BNE     loc_BANK2_901B

      LDA     #SoundEffect1_BirdoShot
      STA     SoundEffectQueue1
      JSR     sub_BANK2_95E5

      BMI     loc_BANK2_901B

      LDY     EnemyHP,X
      LDA     EnemyVariable,X
      LDX     byte_RAM_0
      CMP     #$02 ; If we're a Gray Birdo, always shoot fire
      BEQ     _Birdo_SpitFire

      CMP     #$01 ; If we're a Pink Birdo, always shoot eggs
      BNE     _Birdo_SpitEgg

      LDA     PseudoRNGValues+2 ; Otherwise, randomly determine what to fire
      AND     #$1F ; If PRNG & $1F >= our health-probability number,
      CMP     BirdoHealthEggProbabilities,Y ; fire an egg out
      BCS     _Birdo_SpitEgg ; Otherwise just fall through to barfing fire

_Birdo_SpitFire:
      INC     EnemyVariable,X ; Shoot a fireball
      LDA     #Enemy_Fireball
      BNE     EnemyBehavior_SpitProjectile

_Birdo_SpitEgg:
      LDA     #Enemy_Egg ; Shoot an egg


;
; Spits an object (used by Birdo and Autobomb)
;
; Input
;   A = Object type
;   X = Enemy index
;
EnemyBehavior_SpitProjectile:
      STA     ObjectType,X
      LDA     ObjectYLo,X
      CLC
      ADC     #$03
      STA     ObjectYLo,X
      LDY     EnemyMovementDirection,X
      LDA     ObjectXLo,X
      ADC     ProjectileLaunchXOffsets-1,Y
      STA     ObjectXLo,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

loc_BANK2_901B:
      JMP     RenderSprite


; ---------------------------------------------------------------------------
      .BYTE $18
      .BYTE $E8

byte_BANK2_9020:
      .BYTE $FE
      .BYTE $F8
      .BYTE $F0
      .BYTE $E8
; ---------------------------------------------------------------------------

EnemyBehavior_Coin:
      JSR     IncrementAnimationTimerBy2

      LDA     ObjectYVelocity,X
      CMP     #$EA
      BNE     EnemyBehavior_Mushroom1up

      LDA     #SoundEffect2_CoinGet
      STA     SoundEffectQueue2

EnemyBehavior_Mushroom1up:
      LDA     ObjectYVelocity,X
      CMP     #$10
      BMI     EnemyBehavior_Mushroom

      JSR     TurnIntoPuffOfSmoke

      LDA     ObjectType,X
      CMP     #Enemy_Mushroom1up
      BEQ     Award1upMushroom

      INC     SlotMachineCoins
      RTS

; ---------------------------------------------------------------------------

Award1upMushroom:
      INC     Mushroom1upPulled
      INC     ExtraLives
      BNE     loc_BANK2_9050 ; Check if lives overflow. If so, reduce by one again

      DEC     ExtraLives

loc_BANK2_9050:
      LDA     #SoundEffect1_1UP
      STA     SoundEffectQueue1
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_CrystalBall:
      INC     SpriteTempScreenY
      JSR     AttachObjectToBirdo

;
; Behavior for objects that turn into smoke after you pick them up
; (eg. mushrooms, crystal ball, stopwatch)
;
EnemyBehavior_Mushroom:
      LDA     ObjectBeingCarriedTimer,X
      CMP     #$01
      BNE     EnemyBehavior_Mushroom_StayMaterial

      LDA     PlayerDucking
      BEQ     EnemyBehavior_Mushroom_PickUp

EnemyBehavior_Mushroom_StayMaterial:
      JMP     EnemyBehavior_Bomb

EnemyBehavior_Mushroom_PickUp:
      JSR     CarryObject

      LDA     #$00
      STA     HoldingItem
      STA     ObjectBeingCarriedTimer,X
      JSR     TurnIntoPuffOfSmoke

      LDA     ObjectType,X
      CMP     #Enemy_CrystalBall
      BNE     EnemyBehavior_PickUpNotCrystalBall

      LDA     CrystalAndHawkmouthOpenSize
      BNE     EnemyBehavior_CrystalBall_Exit

      LDA     #Music2_CrystalGetFanfare
      STA     MusicQueue2
      LDA     #$60
      STA     HawkmouthOpenTimer
      INC     CrystalAndHawkmouthOpenSize

EnemyBehavior_CrystalBall_Exit:
      RTS

EnemyBehavior_PickUpNotCrystalBall:
      CMP     #Enemy_Mushroom1up
      BEQ     EnemyBehavior_PickUpMushroom1up

      CMP     #Enemy_Stopwatch
      BEQ     EnemyBehavior_PickUpStopwatch

      CMP     #Enemy_Mushroom
      BNE     EnemyBehavior_PickUpNotMushroom

EnemyBehavior_PickUpMushroom:
      LDX     EnemyVariable
      INC     Mushroom1Pulled,X
      LDX     byte_RAM_12
      INC     PlayerMaxHealth
      JSR     RestorePlayerToFullHealth

      LDA     #Music2_MushroomGetJingle
      STA     MusicQueue2
      RTS

EnemyBehavior_PickUpMushroom1up:
      LDA     #$09
      STA     ObjectAttributes,X

EnemyBehavior_PickUpNotMushroom:
      LDA     #$E0
      STA     ObjectYVelocity,X
      LDA     #$01
      STA     EnemyState,X
      RTS

EnemyBehavior_PickUpStopwatch:
      LDA     #$FF
      STA     StopwatchTimer
      RTS


EnemyBehavior_Key:
      JSR     AttachObjectToBirdo

;
; Behavior for objects that have background collision detection
;
EnemyBehavior_Bomb:
      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     EnemyMovementDirection,X
      BEQ     loc_BANK2_90D9

      JSR     EnemyBehavior_TurnAround

      JSR     HalfObjectVelocityX
      JSR     HalfObjectVelocityX
      JSR     HalfObjectVelocityX

loc_BANK2_90D9:
      PLA
      AND     #$04
      BEQ     loc_BANK2_90FB

      LDA     ObjectYVelocity,X
      CMP     #$09
      BCC     loc_BANK2_90F2

      LSR     A
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     byte_BANK2_9020,Y
      JSR     sub_BANK2_95AA

      JMP     loc_BANK2_90FB

; ---------------------------------------------------------------------------

loc_BANK2_90F2:
      JSR     ResetObjectYVelocity

      LDA     byte_RAM_B
      BNE     loc_BANK2_90FB

      STA     ObjectXVelocity,X

loc_BANK2_90FB:
      LDA     ObjectType,X
      CMP     #Enemy_Bomb
      BNE     EnemyBehavior_Vegetable

      LDA     EnemyTimer,X
      BNE     loc_BANK2_9122

      LDY     ObjectBeingCarriedTimer,X
      BEQ     EnemyBehavior_Bomb_Explode

      STA     HoldingItem
      STA     ObjectBeingCarriedTimer,X

EnemyBehavior_Bomb_Explode:
      LDA     #EnemyState_BombExploding
      STA     EnemyState,X
      LDA     #$20
      STA     EnemyTimer,X
      STA     SkyFlashTimer
      LDA     #DPCM_DoorOpenBombBom
      STA     DPCMQueue
      LSR     A
      ; A = $00
      STA     EnemyArray_42F,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_9122:
      CMP     #Enemy_Mushroom1up
      BCS     EnemyBehavior_Vegetable

      LSR     A
      BCC     EnemyBehavior_Vegetable

      INC     ObjectAttributes,X
      LDA     ObjectAttributes,X
      AND     #$FB
      STA     ObjectAttributes,X

EnemyBehavior_Vegetable:
      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     ApplyObjectMovement

loc_BANK2_9137:
      LDA     EnemyArray_B1,X
      BNE     loc_BANK2_913E

      JMP     sub_BANK2_9BA7

; ---------------------------------------------------------------------------

loc_BANK2_913E:
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

EnemyBehavior_SubspacePotion:
      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     EnemyBehavior_SubspacePotion_CheckGroundCollision

      JSR     EnemyBehavior_TurnAround

      JSR     HalfObjectVelocityX
      JSR     HalfObjectVelocityX

EnemyBehavior_SubspacePotion_CheckGroundCollision:
      PLA
      AND     #CollisionFlags_Down
      BEQ     EnemyBehavior_Vegetable

      JSR     ResetObjectYVelocity

      LDA     ObjectYLo,X
      SEC
      SBC     #$10
      STA     ObjectYLo,X
      LDA     ObjectXLo,X
      ADC     #$07
      AND     #$F0
      STA     ObjectXLo,X
      LDA     ObjectXHi,X
      ADC     #$00
      STA     ObjectXHi,X
      LDA     #$10
      STA     EnemyArray_453,X
      LDA     #SoundEffect1_PotionDoorBong
      STA     SoundEffectQueue1
      INC     EnemyArray_B1,X
      LDA     #Enemy_SubspaceDoor
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDA     #$10
      STA     byte_RAM_5BB
      LDA     IsHorizontalLevel
      BNE     loc_BANK2_9198

      LDA     #DPCM_BossHurt
      STA     DPCMQueue
      JSR     EnemyDestroy

loc_BANK2_9198:
      JSR     CreateEnemy

      BMI     TurnIntoPuffOfSmoke_Exit

      LDY     byte_RAM_0
      LDA     ObjectXLo,X
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      STA     ObjectXHi,Y
      LDA     #$41
      STA     ObjectAttributes,Y
      TYA
      TAX


;
; Turns an object into a puff of smoke
;
; Input
;   X = enemy index of object to poof
;
TurnIntoPuffOfSmoke:
      LDA     ObjectAttributes,X ; Get current object sprite attributes...
      AND     #ObjAttrib_Palette0|ObjAttrib_Horizontal|ObjAttrib_FrontFacing|ObjAttrib_Mirrored|ObjAttrib_BehindBackground|ObjAttrib_16x32|ObjAttrib_UpsideDown
      ORA     #$01 ; Clear current palette, then set to $01
      STA     ObjectAttributes,X
      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,X ; WINNERS DON'T SMOKE SHROOMS
      STA     ObjectAnimationTimer,X ; No idea what this address is for
      LDA     #$1F
      STA     EnemyTimer,X ; Puff-of-smoke animation timer?
      LDX     byte_RAM_12

TurnIntoPuffOfSmoke_Exit:
      RTS


byte_BANK2_91C5:
      .BYTE $F8
      .BYTE $08


;
; Look for a Birdo to attach to
;
AttachObjectToBirdo:
      LDA     EnemyVariable,X
      BNE     AttachObjectToBirdo_Skip

      LDY     #$05
AttachObjectToBirdo_Loop:
      LDA     EnemyState,Y
      CMP     #EnemyState_Alive
      BNE     AttachObjectToBirdo_NotLiveBirdo

      LDA     ObjectType,Y
      CMP     #Enemy_Birdo
      BEQ     AttachObjectToBirdo_DoAttach

AttachObjectToBirdo_NotLiveBirdo:
      DEY
      BPL     AttachObjectToBirdo_Loop

AttachObjectToBirdo_Skip:
      LDA     #$01
      STA     EnemyVariable,X
      JMP     SetEnemyAttributes

AttachObjectToBirdo_DoAttach:
      LDA     ObjectXHi,Y
      CMP     ObjectXHi,X
      BNE     AttachObjectToBirdo_Skip

      LDA     ObjectXLo,Y
      STA     ObjectXLo,X
      LDA     ObjectYLo,Y
      ADC     #$0E
      STA     ObjectYLo,X
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_BANK2_91C5,Y
      STA     ObjectXVelocity,X
      LDA     #$E0
      STA     ObjectYVelocity,X
      PLA
      PLA
      LDA     #%00000111
      STA     EnemyArray_46E,X
      LDA     #$30
      STA     byte_RAM_F4
      JMP     RenderSprite



byte_BANK2_9212:
      .BYTE $F0

byte_BANK2_9213:
      .BYTE $FF
      .BYTE $00
; ---------------------------------------------------------------------------

EnemyInit_AlbatossStartLeft:
      JSR     EnemyInit_Basic

      LDA     #$F0
      BNE     loc_BANK2_9221

EnemyInit_AlbatossStartRight:
      JSR     EnemyInit_Basic

      LDA     #$10

loc_BANK2_9221:
      STA     ObjectXVelocity,X
      INC     EnemyArray_B1,X
      LDA     ObjectType,X
      SEC

loc_BANK2_9228:
      SBC     #$0B
      TAY
      LDA     ScreenBoundaryLeftLo
      ADC     byte_BANK2_9212,Y
      STA     ObjectXLo,X
      LDA     ScreenBoundaryLeftHi
      ADC     byte_BANK2_9213,Y
      STA     ObjectXHi,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Albatoss:
      JSR     sub_BANK2_9AF2

      INC     ObjectAnimationTimer,X
      LDA     EnemyArray_B1,X
      BNE     loc_BANK2_9271

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Disabled
      BNE     loc_BANK2_9256

      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_RAM_F
      ADC     #$30
      CMP     #$60
      BCS     loc_BANK2_926E

loc_BANK2_9256:
      JSR     CreateEnemy

      BMI     loc_BANK2_926E

      LDX     byte_RAM_0
      LDA     #Enemy_BobOmb
      STA     ObjectType,X
      LDA     ObjectYLo,X
      ADC     #$10
      STA     ObjectYLo,X
      JSR     EnemyInit_Bobomb

      LDX     byte_RAM_12
      INC     EnemyArray_B1,X

loc_BANK2_926E:
      JMP     loc_BANK2_9274

; ---------------------------------------------------------------------------

loc_BANK2_9271:
      JSR     EnemyBehavior_CheckDamaged

loc_BANK2_9274:
      JMP     ApplyObjectPhysicsX

; ---------------------------------------------------------------------------

EnemyBehavior_AutobombFire:
      JSR     sub_BANK2_9289

sub_BANK2_927A:
      ASL     ObjectAttributes,X
      LDA     byte_RAM_10
      LSR     A
      LSR     A
      LSR     A
      ROR     ObjectAttributes,X
      RTS


; Unused?
      .BYTE $D0
      .BYTE $03


EnemyBehavior_BulletAndEgg:
      JSR     sub_BANK3_B4FD

sub_BANK2_9289:
      JSR     EnemyBehavior_CheckDamaged

      JSR     EnemyBehavior_CheckBeingCarriedTimer

      LDA     EnemyArray_B1,X
      ORA     EnemyArray_42F,X
      BEQ     loc_BANK2_9299

      JMP     loc_BANK2_8574

; ---------------------------------------------------------------------------

loc_BANK2_9299:
      LDA     ObjectYVelocity,X
      BPL     loc_BANK2_929F

      STA     EnemyArray_B1,X

loc_BANK2_929F:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK2_92BE

      STA     EnemyArray_B1,X
      LDA     ObjectType,X
      CMP     #Enemy_Bullet
      BNE     loc_BANK2_92B5

      LDA     #EnemyState_Dead
      STA     EnemyState,X
      INC     ObjectYLo,X
      INC     ObjectYLo,X

loc_BANK2_92B5:
      JSR     EnemyBehavior_TurnAround

      JSR     HalfObjectVelocityX

      JSR     HalfObjectVelocityX

loc_BANK2_92BE:
      JSR     ApplyObjectPhysicsX

      JMP     RenderSprite

; End of function sub_BANK2_9289


;
; Creates a generic red Shyguy enemy and
; does some basic initialization for it.
;
; CreateEnemy_TryAllSlots checks all 9 object slots
; CreateEnemy only checks the first 6 object slots
;
; Output
;   Y = $FF if there no empty slot was found
;   byte_RAM_0 = slot used
;
CreateEnemy_TryAllSlots:
      LDY     #$08
      BNE     CreateEnemy_FindSlot

CreateEnemy:
      LDY     #$05

CreateEnemy_FindSlot:
      LDA     EnemyState,Y
      BEQ     CreateEnemy_FoundSlot

      DEY
      BPL     CreateEnemy_FindSlot

      RTS

CreateEnemy_FoundSlot:
      LDA     #EnemyState_Alive
      STA     EnemyState,Y
      LSR     A
      STA     unk_RAM_49B,Y
      LDA     #Enemy_ShyguyRed
      STA     ObjectType,Y
      LDA     ObjectXLo,X
      ADC     #$05
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      ADC     #$00
      STA     ObjectXHi,Y
      LDA     ObjectYLo,X
      STA     ObjectYLo,Y
      LDA     ObjectYHi,X
      STA     ObjectYHi,Y
      STY     byte_RAM_0
      TYA
      TAX

      JSR     EnemyInit_Basic
      JSR     UnlinkEnemyFromRawData

      LDX     byte_RAM_12
      RTS


Phanto_AccelX:
      .BYTE $01
      .BYTE $FF
Phanto_MaxVelX:
      .BYTE $30
      .BYTE $D0
Phanto_AccelY:
      .BYTE $01
      .BYTE $FF ; Exit up
      .BYTE $01 ; Exit down
Phanto_MaxVelY:
      .BYTE $18
      .BYTE $E8
      .BYTE $18

EnemyBehavior_Phanto:
      LDA     ObjectShakeTimer,X
      BEQ     Phanto_AfterDecrementShakeTimer

      DEC     ObjectShakeTimer,X

Phanto_AfterDecrementShakeTimer:
      JSR     RenderSprite

      LDY     #$01 ; Move away from player
      LDA     HoldingItem
      BEQ     Phanto_Movement

      LDX     byte_RAM_42D
      LDA     ObjectType,X
      LDX     byte_RAM_12

      ; Strange code. Phanto only chases you if you have the key.
      ; So you should just be able to use BEQ/BNE.
      ; This way seems to imply that Phanto would
      ; chase you if you were carrying a range of items,
      ; but...  what could those items have been?
      ; But instead we do it like this for... reasons.
      ; Nintendo.
      CMP     #Enemy_Key
      BCC     Phanto_Movement

      ; Subspace Potion is >= Enemy_Key, so ignore it
      CMP     #Enemy_SubspacePotion
      BCS     Phanto_Movement

      LDA     PhantoActivateTimer
      CMP     #$A0
      BNE     Phanto_AfterStartTimer

      ; Kick off Phanto activation timer
      DEC     PhantoActivateTimer

Phanto_AfterStartTimer:
      DEY ; Move toward player

Phanto_Movement:
      LDA     ObjectYHi,X
      CLC
      ADC     #$01
      STA     byte_RAM_5
      LDA     PlayerYLo
      CMP     ObjectYLo,X
      LDX     PlayerYHi
      INX
      TXA
      LDX     byte_RAM_12
      SBC     byte_RAM_5
      BPL     loc_BANK2_9351

      INY ; Other side of player vertically

loc_BANK2_9351:
      LDA     ObjectYVelocity,X
      CMP     Phanto_MaxVelY,Y
      BEQ     loc_BANK2_935E

      CLC
      ADC     Phanto_AccelY,Y
      STA     ObjectYVelocity,X

loc_BANK2_935E:
      LDA     EnemyArray_480,X
      CLC
      ADC     #$A0
      STA     EnemyArray_480,X
      BCC     loc_BANK2_937F

      LDA     EnemyArray_477,X
      AND     #$01
      TAY
      LDA     ObjectXVelocity,X
      CLC
      ADC     Phanto_AccelX,Y
      STA     ObjectXVelocity,X
      CMP     Phanto_MaxVelX,Y
      BNE     loc_BANK2_937F

      INC     EnemyArray_477,X

loc_BANK2_937F:
      LDA     IsHorizontalLevel
      BEQ     loc_BANK2_9388

      LDA     PlayerXVelocity
      STA     ObjectXAcceleration,X

loc_BANK2_9388:
      LDY     PhantoActivateTimer
      BEQ     Phanto_Activated

      ; Hold the timer at $A0
      CPY     #$A0
      BEQ     Phanto_AfterDecrementActivateTimer

      CPY     #$80
      BNE     Phanto_AfterFlashing

      ; Start flashing
      LDA     #$40
      STA     EnemyArray_45C,X

Phanto_AfterFlashing:
      CPY     #$40
      BNE     Phanto_AfterSound

      ; Start vibrating
      LDA     #$40
      STA     ObjectShakeTimer,X

      ; Play Phanto activation sound effect
      LDA     #SoundEffect3_Rumble_B
      STA     SoundEffectQueue3

Phanto_AfterSound:
      DEC     PhantoActivateTimer

Phanto_AfterDecrementActivateTimer:
      LDA     #$00
      STA     ObjectXAcceleration,X
      STA     ObjectXVelocity,X
      STA     ObjectYVelocity,X

Phanto_Activated:
      JMP     sub_BANK2_9430


Enemy_Ninji_JumpVelocity:
      .BYTE $E8
      .BYTE $D0
      .BYTE $D8
      .BYTE $D0


EnemyBehavior_NinjiJumping:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     EnemyBehavior_Ninji_MidAir

      LDA     EnemyArray_42F,X
      BNE     EnemyBehavior_NinjiJumping_DetermineJump

      ; stop x-velocity
      STA     ObjectXVelocity,X

EnemyBehavior_NinjiJumping_DetermineJump:
      TXA
      ASL     A
      ASL     A
      ASL     A
      ADC     byte_RAM_10
      AND     #$3F
      BNE     EnemyBehavior_Ninji_MidAir

      LDA     ObjectAnimationTimer,X
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      TAY
      LDA     Enemy_Ninji_JumpVelocity,Y
      BNE     EnemyBehavior_Ninji_Jump

EnemyBehavior_NinjiRunning:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     EnemyBehavior_Ninji_MidAir

      LDA     PlayerYLo
      CLC
      ADC     #$10
      CMP     ObjectYLo,X
      BNE     EnemyBehavior_Ninji_MidAir

      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      TYA
      CMP     EnemyMovementDirection,X
      BNE     EnemyBehavior_Ninji_MidAir

      LDA     byte_RAM_F
      ADC     #$28
      CMP     #$50
      BCS     EnemyBehavior_Ninji_MidAir

      LDA     #$D8

EnemyBehavior_Ninji_Jump:
      STA     ObjectYVelocity,X
      LDA     ObjectAnimationTimer,X
      AND     #$F0
      STA     ObjectAnimationTimer,X
      JSR     ApplyObjectPhysicsY

EnemyBehavior_Ninji_MidAir:
      JMP     EnemyBehavior_BasicWalker

; ---------------------------------------------------------------------------

EnemyBehavior_Beezo:
      JSR     EnemyBehavior_CheckDamaged

      JSR     RenderSprite

      INC     ObjectAnimationTimer,X
      JSR     sub_BANK2_98D6

      JSR     IncrementAnimationTimerBy2

loc_BANK2_941D:
      JSR     EnemyBehavior_CheckBeingCarriedTimer

      LDA     ObjectYVelocity,X
      BEQ     loc_BANK2_9436

      BPL     loc_BANK2_9429

      STA     EnemyArray_42F,X

loc_BANK2_9429:
      LDA     byte_RAM_10
      LSR     A
      BCC     sub_BANK2_9430

      DEC     ObjectYVelocity,X

; =============== S U B R O U T I N E =======================================

sub_BANK2_9430:
      JSR     ApplyObjectPhysicsX

      JMP     ApplyObjectPhysicsY

; End of function sub_BANK2_9430

; ---------------------------------------------------------------------------

loc_BANK2_9436:
      JSR     ApplyObjectPhysicsX

loc_BANK2_9439:
      JMP     sub_BANK2_9430


BulletProjectileXSpeeds:
      .BYTE $20
      .BYTE $E0


EnemyBehavior_BobOmb:
      LDY     EnemyTimer,X
      CPY     #$3A ; When to stop walking
      BCS     EnemyBehavior_BasicWalker

      ; Stop walking if the BobOmb is touching the ground
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     EnemyBehavior_BobOmb_CheckFuse

      LDA     #$00
      STA     ObjectXVelocity,X

EnemyBehavior_BobOmb_CheckFuse:
      DEC     ObjectAnimationTimer,X
      TYA
      BNE     EnemyBehavior_BobOmb_Flash

      ; Unset HoldingItem if this BobOmb is being carried
      LDA     ObjectBeingCarriedTimer,X
      BEQ     EnemyBehavior_BobOmb_Explode

      STY     HoldingItem
      STY     ObjectBeingCarriedTimer,X

EnemyBehavior_BobOmb_Explode:
      JMP     EnemyBehavior_Bomb_Explode


EnemyBehavior_BobOmb_Flash:
      CMP     #$30 ; When to start flashing
      BCS     EnemyBehavior_BasicWalker

      ; Palette cycle every other frame
      LSR     A
      BCC     EnemyBehavior_BasicWalker

      INC     ObjectAttributes,X
      LDA     ObjectAttributes,X
      AND     #%11111011
      STA     ObjectAttributes,X


EnemyBehavior_BasicWalker:
      JSR     sub_BANK3_B4FD

loc_BANK2_9470:
      JSR     EnemyBehavior_CheckDamaged

      LDA     EnemyArray_480,X
      BEQ     loc_BANK2_9492

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Up
      BEQ     loc_BANK2_9481

      JMP     EnemyDestroy

; ---------------------------------------------------------------------------

loc_BANK2_9481:
      DEC     EnemyArray_480,X
      INC     EnemyTimer,X

; =============== S U B R O U T I N E =======================================

sub_BANK2_9486:
      LDA     ObjectAttributes,X
      ORA     #ObjAttrib_BehindBackground
      STA     ObjectAttributes,X
      JSR     ApplyObjectPhysicsY

      JMP     RenderSprite

; End of function sub_BANK2_9486

; ---------------------------------------------------------------------------

loc_BANK2_9492:
      LDA     EnemyCollision,X
      AND     EnemyMovementDirection,X
      BEQ     loc_BANK2_94A6

      JSR     EnemyBehavior_TurnAround

      LDA     EnemyArray_42F,X
      BEQ     loc_BANK2_94A6

      JSR     HalfObjectVelocityX

      JSR     HalfObjectVelocityX

loc_BANK2_94A6:
      INC     ObjectAnimationTimer,X
      JSR     EnemyBehavior_CheckBeingCarriedTimer

loc_BANK2_94AB:
      JSR     RenderSprite

      LDA     ObjectType,X
      CMP     #Enemy_SnifitGray
      BNE     loc_BANK2_94BB

      LDA     EnemyArray_42F,X
      BNE     loc_BANK2_94BB

      STA     ObjectXVelocity,X

loc_BANK2_94BB:
      JSR     ApplyObjectMovement

      LDA     EnemyCollision,X
      LDY     ObjectYVelocity,X
      BPL     loc_BANK2_9503

      AND     #$08
      BEQ     loc_BANK2_94CD

      LDA     #$00
      STA     ObjectYVelocity,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_94CD:
      LDA     EnemyArray_42F,X
      BNE     EnemyBehavior_Walk

      ; check if this enemy fires bullets when jumping
      LDA     ObjectType,X
      CMP     #Enemy_SnifitGray
      BNE     EnemyBehavior_Walk

      ; bullet generator
      LDA     ObjectYVelocity,X ; check if enemy is starting to fall
      CMP     #$FE
      BNE     EnemyBehavior_Walk

      LDA     PseudoRNGValues+2 ; check random number generator
      BPL     EnemyBehavior_Walk

      ; jumper high bullet
      JSR     CreateBullet

EnemyBehavior_Walk:
      DEC     ObjectAnimationTimer,X
      LDA     ObjectType,X
      CMP     #Enemy_SnifitPink
      BEQ     EnemyBehavior_TurnAtCliff

      CMP     #Enemy_ShyguyPink
      BNE     EnemyBehavior_BasicWalkerExit

EnemyBehavior_TurnAtCliff:
      ; skip if being thrown
      LDA     EnemyArray_42F,X
      BNE     EnemyBehavior_BasicWalkerExit

      ; skip if already turning around
      LDA     EnemyArray_477,X
      BNE     EnemyBehavior_BasicWalkerExit

      INC     EnemyArray_477,X
      JMP     EnemyBehavior_TurnAround

EnemyBehavior_BasicWalkerExit:
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_9503:
      AND     #$04
      BEQ     loc_BANK2_94CD

      LDA     #$00
      STA     EnemyArray_477,X
      LDY     ObjectType,X ; Get the current object ID
      CPY     #Enemy_Tweeter ; Check if this enemy is a Tweeter
      BNE     loc_BANK2_9528 ; If not, go handle some other enemies

      ; ...but very, very, very rarely, only
      ; when their timer (that incremenets once per bounce)
      ; hits #$3F -- almost unnoticable
      LDA     #$3F
      JSR     sub_BANK2_9599

      INC     EnemyVariable,X ; Make small jump 3 times, then make big jump
      LDY     #$F0
      LDA     EnemyVariable,X
      AND     #$03 ; Check if the timer is a multiple of 4
      BNE     loc_BANK2_9523 ; If not, skip over the next bit

      LDY     #$E0

loc_BANK2_9523:
      STY     ObjectYVelocity,X ; Set Y acceleration for bouncing
      JMP     ApplyObjectPhysicsY

; ---------------------------------------------------------------------------

loc_BANK2_9528:
      LDA     #$1F
      CPY     #Enemy_BobOmb
      BEQ     sub_BANK2_9599

      CPY     #Enemy_Flurry
      BEQ     sub_BANK2_9599

      LDA     #$3F
      CPY     #Enemy_NinjiRunning
      BEQ     sub_BANK2_9599

      ; this redundant red snifit check smells funny, almost like there was
      ; some other follow-the-player enemy
      LDA     #$7F ; unused
      CPY     #Enemy_SnifitRed
      BEQ     EnemyBehavior_Snifit

      CPY     #Enemy_SnifitRed
      BEQ     EnemyBehavior_Snifit

      CPY     #Enemy_SnifitPink
      BEQ     EnemyBehavior_Snifit

      CPY     #Enemy_SnifitGray
      BNE     loc_BANK2_959D

      LDA     EnemyArray_42F,X
      BNE     loc_BANK2_959D

      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      STY     EnemyMovementDirection,X
      LDA     ObjectAnimationTimer,X
      AND     #$3F
      BNE     EnemyBehavior_Snifit

      LDA     #$E8
      STA     ObjectYVelocity,X
      JMP     ApplyObjectPhysicsY


EnemyBehavior_Snifit:
      LDA     ObjectShakeTimer,X
      BEQ     EnemyBehavior_Snifit_NoBullet

      DEC     ObjectAnimationTimer,X
      DEC     ObjectShakeTimer,X
      BNE     EnemyBehavior_Snifit_NoBullet

      ; telegraphed bullet (walking snifits)
      JSR     CreateBullet

      JMP     loc_BANK2_95BB

EnemyBehavior_Snifit_NoBullet:
loc_BANK2_9574:
      TXA
      ASL     A
      ASL     A
      ASL     A
      ADC     byte_RAM_10
      ASL     A
      BNE     EnemyBehavior_Snifit_AnimationTimer

      LDA     ObjectType,X
      CMP     #Enemy_SnifitGray
      BNE     EnemyBehavior_Snifit_CheckPlayerY

      ; jumper low bullet
      JSR     CreateBullet

      JMP     EnemyInit_DisableObjectAttributeBit8


EnemyBehavior_Snifit_CheckPlayerY:
      LDA     ObjectYLo,X
      SEC
      SBC     #$10
      CMP     PlayerYLo
      BNE     EnemyBehavior_Snifit_AnimationTimer

      LDA     #$30 ; shake duration
      STA     ObjectShakeTimer,X

EnemyBehavior_Snifit_AnimationTimer:
      LDA     #$7F

;
; Gives em the ol' razzle-dazzle
;
; Input
;   A = timer mask
;
sub_BANK2_9599:
      AND     ObjectAnimationTimer,X
      BEQ     loc_BANK2_95B8

loc_BANK2_959D:
      LDA     EnemyArray_42F,X
      BEQ     loc_BANK2_95BB

      LDA     ObjectYVelocity,X
      CMP     #$1A
      BCC     loc_BANK2_95B8

      LDA     #$F0

;
; Sets the y-velocity, applies vertical physics, and cuts x-velocity in half
;
; Input
;   A = y-velocity
;   X = enemy index
;
sub_BANK2_95AA:
      JSR     SetObjectYVelocity
      JSR     ApplyObjectPhysicsY

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
      LDA     ObjectXVelocity,X
      STA     byte_RAM_0
      ; Shift left to save the sign in the carry bit
      ASL     A
      ; Cut in half and preserve the sign
      ROR     ObjectXVelocity,X
      RTS


; ---------------------------------------------------------------------------

loc_BANK2_95B8:
      JSR     EnemyInit_BasicWithoutTimer

loc_BANK2_95BB:
      LDA     ObjectType,X
      CMP     #Enemy_ShyguyRed
      BNE     EnemyInit_DisableObjectAttributeBit8

      LDA     ObjectYVelocity,X
      CMP     #$04
      BCC     EnemyInit_DisableObjectAttributeBit8

      JSR     EnemyInit_BasicWithoutTimer

;
; Disables bit 8 on the object attribute, which causes the object to appear
; behind the background while being pulled
;
EnemyInit_DisableObjectAttributeBit8:
      ASL     ObjectAttributes,X
      LSR     ObjectAttributes,X

;
; Does SetObjectYVelocity with y-velocity of 0
;
ResetObjectYVelocity:
      LDA     #$00

;
; Sets the y-velocity of an object and shifts it half a tile down if it's not a
; a vegetable
;
; Input
;   A = y-velocity
;   X = enemy index
;
SetObjectYVelocity:
      STA     ObjectYVelocity,X
      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      LDA     ObjectYLo,X
      BCS     SetObjectYVelocity_Exit

      ADC     #$08
      BCC     SetObjectYVelocity_Exit

      INC     ObjectYHi,X

SetObjectYVelocity_Exit:
      AND     #$F0
      STA     ObjectYLo,X
      RTS


; =============== S U B R O U T I N E =======================================

sub_BANK2_95E5:
      JSR     CreateEnemy_TryAllSlots

      JMP     CreateBullet_WithSlotInY

; End of function sub_BANK2_95E5

; =============== S U B R O U T I N E =======================================

CreateBullet:
      JSR     CreateEnemy

CreateBullet_WithSlotInY:
      BMI     CreateBullet_Exit

      LDY     EnemyMovementDirection,X
      LDX     byte_RAM_0
      LDA     BulletProjectileXSpeeds-1,Y
      STA     ObjectXVelocity,X
      LDA     #$00
      STA     ObjectYVelocity,X
      LDA     #Enemy_Bullet
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

CreateBullet_Exit:
      RTS


CharacterYOffsetCrouch:
      .BYTE $0A ; Mario
      .BYTE $0E ; Princess
      .BYTE $0A ; Toad
      .BYTE $0D ; Luigi
      .BYTE $04 ; Small Mario
      .BYTE $07 ; Small Princess
      .BYTE $04 ; Small Toad
      .BYTE $06 ; Small Luigi


; This is run when the player is carrying
; something, to update its position to
; wherever the player is above their head
CarryObject:
      LDA     byte_RAM_9D
      EOR     #$01
      TAY
      INY
      STY     EnemyMovementDirection,X
      LDA     PlayerXLo
      STA     ObjectXLo,X
      LDA     PlayerXHi
      STA     ObjectXHi,X

      LDA     PlayerYHi
      STA     byte_RAM_7
      LDA     PlayerYLo
      LDY     EnemyArray_489,X
      CPY     #$03
      BEQ     loc_BANK2_9636

      CPY     #$02
      BEQ     loc_BANK2_9636

      SBC     #$0E
      BCS     loc_BANK2_9636

      DEC     byte_RAM_7

loc_BANK2_9636:
      LDY     PlayerAnimationFrame
      CPY     #SpriteAnimation_Ducking
      CLC
      BNE     loc_BANK2_964D

      LDY     PlayerCurrentSize
      CPY     #$01
      LDY     CurrentCharacter
      BCC     loc_BANK2_964A

      INY
      INY
      INY
      INY

loc_BANK2_964A:
      ADC     CharacterYOffsetCrouch,Y

loc_BANK2_964D:
      PHP
      LDY     ObjectBeingCarriedTimer,X
      CLC
      LDX     PlayerCurrentSize
      BEQ     loc_BANK2_965D

      INY
      INY
      INY
      INY
      INY
      INY
      INY

loc_BANK2_965D:
      ADC     unk_RAM_7EFF,Y
      LDX     byte_RAM_12
      STA     ObjectYLo,X
      LDA     byte_RAM_7
      ADC     byte_RAM_7F00+$D,Y
      PLP
      ADC     #$00
      STA     ObjectYHi,X
      LDY     ObjectBeingCarriedTimer,X
      CPY     #$05
      BCS     loc_BANK2_9686

      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      BCS     loc_BANK2_9686

      LDA     EnemyArray_438,X

loc_BANK2_967D:
      BNE     loc_BANK2_9681

      INC     ObjectAnimationTimer,X

loc_BANK2_9681:
      ASL     ObjectAttributes,X
      SEC
      ROR     ObjectAttributes,X

loc_BANK2_9686:
      JSR     PutCarriedObjectInHands

      JMP     RenderSprite

; End of function CarryObject

; ---------------------------------------------------------------------------
      .BYTE $10
      .BYTE $F0
; ---------------------------------------------------------------------------

EnemyBehavior_MushroomBlockAndPOW:
      JSR     sub_BANK2_9692

locret_BANK2_9691:
      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK2_9692:
      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_969B

      PLA
      PLA
      JMP     CarryObject

; ---------------------------------------------------------------------------

loc_BANK2_969B:
      JSR     RenderSprite

      LDA     ObjectType,X
      CMP     #Enemy_POWBlock
      BCS     loc_BANK2_96AA

      JSR     sub_BANK3_B4F9

      JMP     loc_BANK2_96AD

; ---------------------------------------------------------------------------

loc_BANK2_96AA:
      JSR     sub_BANK3_B4FD

loc_BANK2_96AD:
      LDA     EnemyArray_42F,X
      BEQ     locret_BANK2_9691

      JSR     ApplyObjectMovement

      PLA
      PLA
      LDA     EnemyCollision,X
      PHA
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK2_96D4

      LDA     #$00
      STA     ObjectXVelocity,X
      LDA     ObjectXLo,X
      ADC     #$08
      AND     #$F0
      STA     ObjectXLo,X
      LDA     IsHorizontalLevel
      BEQ     loc_BANK2_96D4

      LDA     ObjectXHi,X
      ADC     #$00
      STA     ObjectXHi,X

loc_BANK2_96D4:
      PLA
      LDY     ObjectYVelocity,X
      BMI     locret_BANK2_9718

      AND     #CollisionFlags_Down
      BEQ     locret_BANK2_9718

      LDA     byte_RAM_E
      CMP     #$16
      BNE     loc_BANK2_96EC

      LDA     ObjectXVelocity,X
      BEQ     loc_BANK2_96EC

      LDA     #$14
      JMP     SetObjectYVelocity

; ---------------------------------------------------------------------------

loc_BANK2_96EC:
      LDA     ObjectType,X
      CMP     #Enemy_POWBlock
      BNE     loc_BANK2_96FF

      LDA     #$20
      STA     POWQuakeTimer
      LDA     #SoundEffect3_Rumble_B
      STA     SoundEffectQueue3
      JMP     sub_BANK2_98C4

; ---------------------------------------------------------------------------

loc_BANK2_96FF:
      LDA     ObjectYVelocity,X
      CMP     #$16
      BCC     loc_BANK2_970D

      JSR     ResetObjectYVelocity

      LDA     #$F5
      JMP     sub_BANK2_95AA

; ---------------------------------------------------------------------------

loc_BANK2_970D:
      JSR     ResetObjectYVelocity

      LDA     EnemyVariable,X
      JSR     ReplaceTile

      JMP     EnemyDestroy

; ---------------------------------------------------------------------------

locret_BANK2_9718:
      RTS

; End of function sub_BANK2_9692

; ---------------------------------------------------------------------------

EnemyBehavior_SubspaceDoor:
      LDA     #$04
      STA     EnemyArray_489,X
      LDA     #$02
      STA     EnemyMovementDirection,X
      LDY     SubspaceTimer
      BEQ     loc_BANK2_9741

      LDA     byte_RAM_10
      AND     #$03
      BNE     loc_BANK2_9741

      LDY     PlayerState
      CPY     #PlayerState_Dying
      BEQ     loc_BANK2_9741

      DEC     SubspaceTimer
      BNE     loc_BANK2_9741

      STA     InSubspaceOrJar
      JSR     DoAreaReset

      JMP     loc_BANK2_97FF

; ---------------------------------------------------------------------------

loc_BANK2_9741:
      LDA     EnemyArray_453,X
      BNE     locret_BANK2_9718

      LDA     SubspaceDoorTimer
      BEQ     loc_BANK2_9753

      DEC     SubspaceDoorTimer
      BNE     loc_BANK2_9753

      JMP     TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------

loc_BANK2_9753:
      LDA     ObjectAttributes,X
      ORA     #$40
      STA     ObjectAttributes,X
      LDY     byte_RAM_4BD
      LDA     byte_BANK2_9808,Y
      LDY     #$00
      ASL     A
      BCC     loc_BANK2_9767

      INY
      STY     EnemyMovementDirection,X

loc_BANK2_9767:
      LDA     byte_RAM_4BD
      BEQ     loc_BANK2_979A

      LDA     byte_RAM_F4
      PHA
      JSR     loc_BANKF_FAFE

      CPY     byte_RAM_F4
      PHP
      LDA     EnemyMovementDirection,X
      CMP     #$01
      BNE     loc_BANK2_977F

      PLA
      EOR     #$01
      PHA

loc_BANK2_977F:
      PLP
      BCC     loc_BANK2_9784

      STY     byte_RAM_F4

loc_BANK2_9784:
      LDA     #$7A
      JSR     sub_BANK2_9BB3

      LDY     byte_RAM_F4
      LDA     SpriteDMAArea+7,Y
      SEC
      SBC     #$04
      STA     SpriteDMAArea+7,Y
      STA     SpriteDMAArea+$F,Y
      PLA
      STA     byte_RAM_F4

loc_BANK2_979A:
      JSR     loc_BANKF_FAFE

      CPY     byte_RAM_F4
      PHP
      LDA     EnemyMovementDirection,X
      CMP     #$01
      BNE     loc_BANK2_97AA

      PLA
      EOR     #$01
      PHA

loc_BANK2_97AA:
      PLP
      BCS     loc_BANK2_97AF

      STY     byte_RAM_F4

loc_BANK2_97AF:
      LDA     byte_RAM_4BD
      CMP     #$19
      BCC     loc_BANK2_97BA

      LDY     #$00
      STY     byte_RAM_F4

loc_BANK2_97BA:
      LDA     #$76
      LDY     EnemyArray_477,X
      BEQ     loc_BANK2_97C3

      LDA     #$7E

loc_BANK2_97C3:
      JSR     sub_BANK2_9BB3

      LDX     byte_RAM_4BD
      BEQ     loc_BANK2_9805

      INC     byte_RAM_4BD
      LDY     byte_RAM_F4
      LDA     byte_BANK2_9808,X
      BMI     loc_BANK2_9805

      CLC
      ADC     SpriteDMAArea+3,Y
      STA     SpriteDMAArea+3,Y
      STA     SpriteDMAArea+$B,Y
      CPX     #$30
      BNE     loc_BANK2_9805

      LDA     #$00
      STA     byte_RAM_4BD
      JSR     DoAreaReset

      LDA     TransitionType
      CMP     #TransitionType_Door
      BNE     loc_BANK2_97F7

      INC     DoAreaTransition
      BNE     loc_BANK2_97FF

loc_BANK2_97F7:
      LDA     InSubspaceOrJar
      EOR     #$02
      STA     InSubspaceOrJar

loc_BANK2_97FF:
      PLA
      PLA
      PLA
      PLA
      PLA
      PLA

loc_BANK2_9805:
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------
byte_BANK2_9808:
      .BYTE $00
      .BYTE $01
      .BYTE $01
      .BYTE $02

DoorSpriteAnimation:
      .BYTE $02
      .BYTE $03
      .BYTE $04
      .BYTE $06
      .BYTE $08
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $08
      .BYTE $06
      .BYTE $04
      .BYTE $03
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $01
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $A9
      .BYTE $02
      .BYTE $D0
      .BYTE $06

;
; Note: Door animation code copied from Bank 1
;
; It's here, but seems to be unused?
;
DoorAnimation_Locked_Bank2:
      LDA     #$01
      BNE     DoorAnimation_Bank2

DoorAnimation_Unlocked_Bank2:
      LDA     #$00

DoorAnimation_Bank2:
      PHA
      LDY     #$08

DoorAnimation_Loop_Bank2:
      ; skip if inactive
      LDA     EnemyState,Y
      BEQ     DoorAnimation_LoopNext_Bank2

      LDA     ObjectType,Y
      CMP     #Enemy_SubspaceDoor
      BNE     DoorAnimation_LoopNext_Bank2

      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,Y
      LDA     #$20
      STA     EnemyTimer,Y

DoorAnimation_LoopNext_Bank2:
      DEY
      BPL     DoorAnimation_Loop_Bank2

      JSR     CreateEnemy_TryAllSlots

      BMI     DoorAnimation_Exit_Bank2

      LDA     #$00
      STA     byte_RAM_4BD
      STA     SubspaceDoorTimer
      LDX     byte_RAM_0
      PLA
      STA     EnemyArray_477,X
      LDA     #Enemy_SubspaceDoor
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDA     PlayerXLo
      ADC     #$08
      AND     #$F0
      STA     ObjectXLo,X
      LDA     PlayerXHi
      ADC     #$00
      STA     ObjectXHi,X
      LDA     PlayerYLo
      STA     ObjectYLo,X
      LDA     PlayerYHi
      STA     ObjectYHi,X
      LDA     #ObjAttrib_Palette1|ObjAttrib_16x32
      STA     ObjectAttributes,X
      LDX     byte_RAM_12
      RTS

DoorAnimation_Exit_Bank2:
      PLA
      RTS


ShellSpeed:
      .BYTE $1C
      .BYTE $E4


EnemyBehavior_Shell:
      JSR     sub_BANK3_B4FD

      JSR     EnemyBehavior_CheckBeingCarriedTimer

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     EnemyBehavior_Shell_Slide

EnemyBehavior_Shell_Destroy:
      LDA     #SoundEffect1_EnemyHit
      STA     SoundEffectQueue1
      JMP     TurnIntoPuffOfSmoke


EnemyBehavior_Shell_Slide:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     EnemyBehavior_Shell_Render

      JSR     ResetObjectYVelocity

EnemyBehavior_Shell_Render:
      JSR     RenderSprite

      LDY     EnemyMovementDirection,X
      LDA     ShellSpeed-1,Y
      STA     ObjectXVelocity,X
      JMP     ApplyObjectMovement


; =============== S U B R O U T I N E =======================================

sub_BANK2_98C4:
      LDA     #EnemyState_BlockFizzle
      STA     EnemyState,X
      LDA     #$18
      STA     EnemyTimer,X

locret_BANK2_98CC:
      RTS

; End of function sub_BANK2_98C4


;
; Intercepts the normal enemy behavior when the object is being carried
;
EnemyBehavior_CheckBeingCarriedTimer:
      LDA     ObjectBeingCarriedTimer,X
      BEQ     locret_BANK2_98CC

      ; Cancel previous subroutine and go into carry mode
      PLA
      PLA
      JMP     CarryObject


; =============== S U B R O U T I N E =======================================

sub_BANK2_98D6:
      LDA     EnemyArray_42F,X
      BEQ     locret_BANK2_98EA

      PLA
      PLA
      JMP     loc_BANK2_8574

; ---------------------------------------------------------------------------

EnemyInit_FallingLogs:
      JSR     EnemyInit_Stationary

      STA     EnemyArray_438,X
      LDA     ObjectYLo,X
      STA     EnemyVariable,X

locret_BANK2_98EA:
      RTS

; End of function sub_BANK2_98D6

; ---------------------------------------------------------------------------

EnemyBehavior_FallingLogs:
      ASL     ObjectAttributes,X
      LDA     byte_RAM_10
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      ROR     ObjectAttributes,X
      LDY     EnemyArray_B1,X
      BNE     loc_BANK2_9919

      LDA     ObjectAttributes,X
      ORA     #$20
      STA     ObjectAttributes,X
      LDA     EnemyVariable,X
      SEC
      SBC     #$C
      CMP     ObjectYLo,X
      LDA     #$FE
      BCC     loc_BANK2_9914

      LDA     ObjectAttributes,X
      AND     #$DF
      STA     ObjectAttributes,X
      INC     EnemyArray_B1,X
      LDA     #$04

loc_BANK2_9914:
      STA     ObjectYVelocity,X
      JMP     loc_BANK2_9921

; ---------------------------------------------------------------------------

loc_BANK2_9919:
      LDA     byte_RAM_10
      AND     #$07
      BNE     loc_BANK2_9921

      INC     ObjectYVelocity,X

loc_BANK2_9921:
      JSR     ApplyObjectPhysicsY

      LDA     ObjectYLo,X
      CMP     #$F0
      BCC     loc_BANK2_9932

      LDA     #$00
      STA     EnemyArray_B1,X
      LDA     EnemyVariable,X
      STA     ObjectYLo,X

loc_BANK2_9932:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK2_9935:
      LDA     #$00

; =============== S U B R O U T I N E =======================================

sub_BANK2_9937:
      STA     byte_RAM_0
      LDX     #$08

loc_BANK2_993B:
      LDA     EnemyState,X
      CMP     #EnemyState_Alive
      BNE     loc_BANK2_9974

      LDA     byte_RAM_0
      BEQ     loc_BANK2_9966

      LDA     ObjectType,X
      CMP     #Enemy_Bomb
      BEQ     loc_BANK2_994F

      CMP     #Enemy_VegetableSmall
      BCS     loc_BANK2_9974

loc_BANK2_994F:
      LDA     HoldingItem
      BEQ     loc_BANK2_995C

      CPX     byte_RAM_42D
      BNE     loc_BANK2_995C

      LDA     #$00
      STA     HoldingItem

loc_BANK2_995C:
      STX     byte_RAM_E
      JSR     TurnIntoPuffOfSmoke

      LDX     byte_RAM_E
      JMP     loc_BANK2_9974

; ---------------------------------------------------------------------------

loc_BANK2_9966:
      LDA     EnemyCollision,X
      BEQ     loc_BANK2_9974

      LDA     #$D8
      STA     ObjectYVelocity,X
      LDA     EnemyCollision,X
      ORA     #CollisionFlags_Disabled
      STA     EnemyCollision,X

loc_BANK2_9974:
      DEX
      BPL     loc_BANK2_993B

      LDX     byte_RAM_12
      RTS

; End of function sub_BANK2_9937


;
; Checks whether the enemy is taking mortal damage
;
; If so, play the sound effect, kill the enemy, and cancel the previous enemy
; behavior subroutine.
;
; Input
;   X = enemy index
;
EnemyBehavior_CheckDamaged:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Disabled
      BEQ     EnemyBehavior_CheckDamaged_Exit

      LDA     ObjectBeingCarriedTimer,X
      BEQ     EnemyBehavior_CheckDamaged_SoundEffect

      ; remove the item from the player's hands
      LDA     #$00
      STA     HoldingItem

EnemyBehavior_CheckDamaged_SoundEffect:
      LDY     ObjectType,X
      ; is this enemy a squawker?
      LDA     EnemyArray_46E_Data,Y
      AND     #%00001000
      ASL     A ; then A = DPCM_BossDeath
      BNE     EnemyBehavior_CheckDamaged_BossDeathSound

      ; normal enemy hit sound
      LDA     DPCMQueue
      BNE     EnemyBehavior_CheckDamaged_CheckPidgit

      LDA     #SoundEffect1_EnemyHit
      STA     SoundEffectQueue1
      BNE     EnemyBehavior_CheckDamaged_CheckPidgit

EnemyBehavior_CheckDamaged_BossDeathSound:
      STA     DPCMQueue

EnemyBehavior_CheckDamaged_CheckPidgit:
      ; killing pidgit leaves a flying carpet behind
      CPY     #Enemy_Pidgit
      BNE     EnemyBehavior_CheckDamaged_SetDead

      LDA     EnemyArray_42F,X
      BNE     EnemyBehavior_CheckDamaged_SetDead

      JSR     CreateFlyingCarpet

EnemyBehavior_CheckDamaged_SetDead:
      LDA     #EnemyState_Dead
      STA     EnemyState,X
      ; interrupt the previous subroutine
      PLA
      PLA

EnemyBehavior_CheckDamaged_Exit:
      RTS


EnemyTilemap1:
      .BYTE $D0,$D2 ; $00
      .BYTE $D4,$D6 ; $02
      .BYTE $F8,$F8 ; $04
      .BYTE $FA,$FA ; $06
      .BYTE $CC,$CE ; $08
      .BYTE $CC,$CE ; $0A
      .BYTE $C8,$CA ; $0C
      .BYTE $C8,$CA ; $0E
      .BYTE $70,$72 ; $10
      .BYTE $74,$76 ; $12
      .BYTE $C0,$C2 ; $14
      .BYTE $C4,$C6 ; $16
      .BYTE $E1,$E3 ; $18
      .BYTE $E5,$E7 ; $1A
      .BYTE $E1,$E3 ; $1C
      .BYTE $E5,$E7 ; $1E
      .BYTE $78,$7A ; $20
      .BYTE $7C,$7E ; $22
      .BYTE $DC,$DA ; $24
      .BYTE $DC,$DE ; $26
      .BYTE $FE,$FE ; $28
      .BYTE $FC,$FC ; $2A
      .BYTE $94,$94 ; $2C
      .BYTE $96,$96 ; $2E
      .BYTE $98,$98 ; $30
      .BYTE $9A,$9A ; $32
      .BYTE $DB,$DD ; $34
      .BYTE $DB,$DD ; $36
      .BYTE $7D,$7F ; $38
      .BYTE $C1,$C3 ; $3A
      .BYTE $8C,$8C ; $3C
      .BYTE $8E,$8E ; $3E
      .BYTE $E0,$E2 ; $40
      .BYTE $6B,$6D ; $42
      .BYTE $6D,$6F ; $44
      .BYTE $3A,$3A ; $46
      .BYTE $3A,$3A ; $48
      .BYTE $38,$38 ; $4A
      .BYTE $38,$38 ; $4C
      .BYTE $36,$36 ; $4E
      .BYTE $36,$36 ; $50
      .BYTE $34,$34 ; $52
      .BYTE $34,$34 ; $54
      .BYTE $AE,$FB ; $56
      .BYTE $AE,$FB ; $58
      .BYTE $80,$82 ; $5A
      .BYTE $84,$86 ; $5C
      .BYTE $80,$82 ; $5E
      .BYTE $AA,$AC ; $60
      .BYTE $88,$8A ; $62
      .BYTE $84,$86 ; $64
      .BYTE $88,$8A ; $66
      .BYTE $AA,$AC ; $68
      .BYTE $BC,$BE ; $6A
      .BYTE $AA,$AC ; $6C
      .BYTE $BC,$BE ; $6E
      .BYTE $AA,$AC ; $70
      .BYTE $B5,$B9 ; $72
      .BYTE $B5,$B9 ; $74
      .BYTE $81,$83 ; $76
      .BYTE $85,$87 ; $78
      .BYTE $FF,$FF ; $7A
      .BYTE $FF,$FF ; $7C
      .BYTE $81,$83 ; $7E
      .BYTE $F5,$87 ; $80
      .BYTE $C5,$C7 ; $82
      .BYTE $C9,$CB ; $84
      .BYTE $92,$94 ; $86
      .BYTE $29,$29 ; $88
      .BYTE $2B,$2B ; $8A
      .BYTE $3D,$3F ; $8C
      .BYTE $4C,$4E ; $8E
      .BYTE $50,$52 ; $90
      .BYTE $4C,$4E ; $92
      .BYTE $56,$58 ; $94
      .BYTE $FB,$5C ; $96
      .BYTE $FB,$5A ; $98
      .BYTE $FB,$FB ; $9A
      .BYTE $FB,$54 ; $9C
      .BYTE $CF,$CF ; $9E
      .BYTE $A5,$A5 ; $A0
      .BYTE $B0,$B2 ; $A2
      .BYTE $90,$90 ; $A4
      .BYTE $CD,$CD ; $A6
      .BYTE $A8,$A8 ; $A8
      .BYTE $A8,$A8 ; $AA
      .BYTE $A0,$A2 ; $AC
      .BYTE $A4,$A4 ; $AE
      .BYTE $A4,$A4 ; $B0
      .BYTE $4D,$4D ; $B2
      .BYTE $8C,$8C ; $B4
      .BYTE $A6,$A6 ; $B6
      .BYTE $AB,$AB ; $B8


;
; Enemy Animation table
; =====================
;
; These point to the tilemaps offset for an object's animation frames.
;
; $FF is used to make an enemy invisible
;
EnemyAnimationTable:
      .BYTE $00 ; $00
      .BYTE $00 ; $01
      .BYTE $08 ; $02
      .BYTE $00 ; $03
      .BYTE $0C ; $04
      .BYTE $10 ; $05
      .BYTE $10 ; $06
      .BYTE $10 ; $07
      .BYTE $40 ; $08
      .BYTE $14 ; $09
      .BYTE $18 ; $0A
      .BYTE $18 ; $0B
      .BYTE $18 ; $0C
      .BYTE $20 ; $0D
      .BYTE $20 ; $0E
      .BYTE $24 ; $0F
      .BYTE $24 ; $10
      .BYTE $BE ; $11
      .BYTE $00 ; $12
      .BYTE $86 ; $13
      .BYTE $88 ; $14
      .BYTE $FF ; $15
      .BYTE $FF ; $16
      .BYTE $8C ; $17
      .BYTE $5C ; $18
      .BYTE $5C ; $19
      .BYTE $6C ; $1A
      .BYTE $56 ; $1B
      .BYTE $5A ; $1C
      .BYTE $14 ; $1D
      .BYTE $72 ; $1E
      .BYTE $00 ; $1F
      .BYTE $A8 ; $20
      .BYTE $00 ; $21
      .BYTE $D6 ; $22
      .BYTE $AC ; $23
      .BYTE $AC ; $24
      .BYTE $AC ; $25
      .BYTE $74 ; $26
      .BYTE $7A ; $27
      .BYTE $92 ; $28
      .BYTE $9A ; $29
      .BYTE $80 ; $2A
      .BYTE $90 ; $2B
      .BYTE $00 ; $2C
      .BYTE $00 ; $2D
      .BYTE $B6 ; $2E
      .BYTE $B6 ; $2F
      .BYTE $B6 ; $30
      .BYTE $B6 ; $31
      .BYTE $28 ; $32
      .BYTE $2A ; $33
      .BYTE $2C ; $34
      .BYTE $2E ; $35
      .BYTE $30 ; $36
      .BYTE $34 ; $37
      .BYTE $00 ; $38
      .BYTE $38 ; $39
      .BYTE $3A ; $3A
      .BYTE $42 ; $3B
      .BYTE $82 ; $3C
      .BYTE $82 ; $3D
      .BYTE $84 ; $3E
      .BYTE $A0 ; $3F
      .BYTE $A2 ; $40
      .BYTE $04 ; $41
      .BYTE $8E ; $42
      .BYTE $8E ; $43
      .BYTE $9E ; $44
      .BYTE $A6 ; $45
      .BYTE $A4 ; $46

; =============== S U B R O U T I N E =======================================

; The first part of this routine determines if we are the Princess,
; who does not bob her vegetables (or whatever other Subcon detritus
; she happens to be holding)
;
; After that it just moves the sprite into the player's hands.

PutCarriedObjectInHands:
      LDA     ObjectYLo,X
      CLC
      SBC     ScreenYLo
      LDY     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_9ACA

      LDY     PlayerAnimationFrame
      BNE     loc_BANK2_9ACA

      LDY     CurrentCharacter ; Check if we are Princess
      DEY
      BEQ     loc_BANK2_9ACA ; If so, skip making it bob sometimes.

      SEC
      SBC     #$01

loc_BANK2_9ACA:
      STA     SpriteTempScreenY ; Determine where it should show up on
      LDA     ObjectXLo,X ; the screen and put it in that place.
      SEC
      SBC     ScreenBoundaryLeftLo
      STA     SpriteTempScreenX
      RTS

; End of function PutCarriedObjectInHands

; ---------------------------------------------------------------------------

loc_BANK2_9AD7:
      LDA     EnemyState,X
      CMP     #EnemyState_Alive
      BNE     loc_BANK2_9AE2

      LDA     EnemyArray_45C,X
      BEQ     loc_BANK2_9AE6

loc_BANK2_9AE2:
      LDA     #$6A
      BNE     loc_BANK2_9AEC

loc_BANK2_9AE6:
      LDA     EnemyTimer,X
      BEQ     loc_BANK2_9AEF

      LDA     #$62

loc_BANK2_9AEC:
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

loc_BANK2_9AEF:
      JMP     sub_BANK2_9BA7

; =============== S U B R O U T I N E =======================================

sub_BANK2_9AF2:
      LDA     byte_RAM_EE
      PHA
      JSR     sub_BANK2_9BA7

      PLA
      ASL     A
      STA     byte_RAM_EE
      LDA     EnemyArray_B1,X
      ORA     byte_RAM_EF
      BNE     locret_BANK2_9B40

      LDA     SpriteTempScreenX
      ADC     #$08
      STA     byte_RAM_1
      LDA     EnemyMovementDirection,X
      STA     byte_RAM_2
      LDA     #$01
      STA     byte_RAM_3
      STA     byte_RAM_5
      JSR     loc_BANKF_FAFE

      LDX     #$14
      JMP     loc_BANK2_9C7A

; End of function sub_BANK2_9AF2

; =============== S U B R O U T I N E =======================================

RenderSprite:
      LDY     ObjectType,X
      LDA     EnemyAnimationTable,Y
      CMP     #$FF
      BEQ     locret_BANK2_9B40

      CPY     #Enemy_Mouser
      BNE     loc_BANK2_9B2B

      JMP     loc_BANK3_A5F8

; ---------------------------------------------------------------------------

loc_BANK2_9B2B:
      CPY     #Enemy_Clawgrip
      BNE     loc_BANK2_9B32

      JMP     loc_BANK3_A1E4

; ---------------------------------------------------------------------------

loc_BANK2_9B32:
      CPY     #Enemy_ClawgripRock
      BNE     loc_BANK2_9B39

      JMP     loc_BANK3_A323

; ---------------------------------------------------------------------------

loc_BANK2_9B39:
      CPY     #Enemy_HawkmouthBoss
      BNE     loc_BANK2_9B41

      JMP     sub_BANK3_B0E8

; ---------------------------------------------------------------------------

locret_BANK2_9B40:
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_9B41:
      CPY     #Enemy_Pidgit
      BNE     loc_BANK2_9B48

      JMP     sub_BANK3_A508

; ---------------------------------------------------------------------------

loc_BANK2_9B48:
      CPY     #Enemy_Porcupo
      BNE     loc_BANK2_9B4F

      JMP     loc_BANK2_9E06

; ---------------------------------------------------------------------------

loc_BANK2_9B4F:
      CPY     #Enemy_VegetableLarge
      BNE     loc_BANK2_9B56

      JMP     loc_BANK2_9137

; ---------------------------------------------------------------------------

loc_BANK2_9B56:
      CPY     #Enemy_Autobomb
      BNE     loc_BANK2_9B5D

      JMP     loc_BANK3_AE4B

; ---------------------------------------------------------------------------

loc_BANK2_9B5D:
      CPY     #Enemy_Fryguy
      BNE     loc_BANK2_9B64

      JMP     sub_BANK3_AC28

; ---------------------------------------------------------------------------

loc_BANK2_9B64:
      CPY     #Enemy_HawkmouthLeft
      BNE     loc_BANK2_9B6B

      JMP     loc_BANK2_8E05

; ---------------------------------------------------------------------------

loc_BANK2_9B6B:
      CPY     #Enemy_Wart
      BNE     loc_BANK2_9B72

      JMP     loc_BANK3_B2B0

; ---------------------------------------------------------------------------

loc_BANK2_9B72:
      CPY     #Enemy_WhaleSpout
      BNE     loc_BANK2_9B79

      JMP     loc_BANK3_AEEB

; ---------------------------------------------------------------------------

loc_BANK2_9B79:
      CPY     #Enemy_Pokey
      BNE     loc_BANK2_9B80

      JMP     DrawPokey

; ---------------------------------------------------------------------------

loc_BANK2_9B80:
      CPY     #Enemy_Heart ; ??? Compare against a Heart
      BNE     loc_BANK2_9B87

      ; This jump appears to never be taken;
      ; I don't think this code even runs with an enemy ID of 0 (heart)
      JMP     loc_BANK2_8F27

; ---------------------------------------------------------------------------

loc_BANK2_9B87:
      CPY     #Enemy_Ostro
      BNE     loc_BANK2_9B8E

      JMP     loc_BANK3_A654

; ---------------------------------------------------------------------------

loc_BANK2_9B8E:
      CPY     #Enemy_Tryclyde
      BNE     loc_BANK2_9B95

      JMP     loc_BANK3_A783

; ---------------------------------------------------------------------------

loc_BANK2_9B95:
      CPY     #Enemy_Birdo
      BNE     loc_BANK2_9B9C

      JMP     loc_BANK2_9AD7

; ---------------------------------------------------------------------------

loc_BANK2_9B9C:
      CPY     #Enemy_AlbatossCarryingBobOmb
      BCC     sub_BANK2_9BA7

      CPY     #Enemy_NinjiRunning
      BCS     sub_BANK2_9BA7

      JMP     sub_BANK2_9AF2

; End of function RenderSprite

; =============== S U B R O U T I N E =======================================

sub_BANK2_9BA7:
      LDY     ObjectType,X
      CPY     #Enemy_Rocket
      BNE     loc_BANK2_9BB0

      JMP     sub_BANK3_ABEE

; ---------------------------------------------------------------------------

loc_BANK2_9BB0:
      LDA     EnemyAnimationTable,Y

; End of function sub_BANK2_9BA7

; =============== S U B R O U T I N E =======================================

sub_BANK2_9BB3:
      STA     byte_RAM_F
      LDA     byte_RAM_EF
      BNE     locret_BANK2_9B40

      ; tilemap switcher
      LDA     EnemyArray_46E,X
      AND     #%00010000
      STA     byte_RAM_B
      LDY     EnemyMovementDirection,X
      LDA     ObjectAttributes,X
      AND     #ObjAttrib_Palette0|ObjAttrib_FrontFacing|ObjAttrib_Mirrored
      BEQ     loc_BANK2_9BD2

      LDY     #$02
      LDA     InSubspaceOrJar
      CMP     #$02
      BNE     loc_BANK2_9BD2

      DEY

loc_BANK2_9BD2:
      STY     byte_RAM_2
      LDA     ObjectAttributes,X
      AND     #ObjAttrib_16x32|ObjAttrib_Horizontal
      STA     byte_RAM_5
      LDA     SpriteTempScreenY
      STA     byte_RAM_0
      LDA     #$00
      STA     byte_RAM_D
      LDA     ObjectShakeTimer,X
      AND     #$02
      LSR     A
      LDY     byte_RAM_EE
      BEQ     loc_BANK2_9BEF

      LDA     #$00

loc_BANK2_9BEF:
      ADC     SpriteTempScreenX
      STA     byte_RAM_1
      LDA     ObjectAttributes,X
      AND     #$A3
      LDY     EnemyArray_45C,X
      BEQ     loc_BANK2_9C07

      AND     #$A0
      STA     byte_RAM_8
      TYA
      LSR     A
      AND     #$03
      ORA     byte_RAM_8

loc_BANK2_9C07:
      STA     byte_RAM_3
      LDA     EnemyArray_46E,X
      STA     byte_RAM_C
      ASL     A
      LDA     ObjectAnimationTimer,X
      LDX     byte_RAM_F
      AND     #$08 ; maybe a bitfield?
      BEQ     loc_BANK2_9C31

      BCC     loc_BANK2_9C1F

      LDA     #$01
      STA     byte_RAM_2
      BNE     loc_BANK2_9C31

loc_BANK2_9C1F:
      INX
      INX
      LDA     byte_RAM_5
      AND     #$40
      BEQ     loc_BANK2_9C31

      INX
      INX
      LDA     byte_RAM_C
      AND     #$20
      BEQ     loc_BANK2_9C31

      INX
      INX

loc_BANK2_9C31:
      LDY     byte_RAM_F4
      LDA     byte_RAM_5
      AND     #$40
      BEQ     loc_BANK2_9C7A

      LDA     byte_RAM_5
      AND     #$04
      BEQ     loc_BANK2_9C53

      LDA     byte_RAM_EE
      STA     byte_RAM_8
      LDA     byte_RAM_2
      CMP     #$01
      BNE     loc_BANK2_9C53

      LDA     byte_RAM_1
      ADC     #$F
      STA     byte_RAM_1
      ASL     byte_RAM_EE
      ASL     byte_RAM_EE

loc_BANK2_9C53:
      JSR     sub_BANK2_9CF2

      LDA     byte_RAM_5
      AND     #$04
      BEQ     loc_BANK2_9C7A

      LDA     SpriteTempScreenY
      STA     byte_RAM_0
      LDA     SpriteTempScreenX
      STA     byte_RAM_1
      LDA     byte_RAM_8
      STA     byte_RAM_EE
      LDA     byte_RAM_2
      CMP     #$01
      BEQ     loc_BANK2_9C7A

      LDA     byte_RAM_1
      ADC     #$F
      STA     byte_RAM_1
      ASL     byte_RAM_EE
      ASL     byte_RAM_EE

loc_BANK2_9C7A:
      JSR     sub_BANK2_9CF2

      LDY     byte_RAM_F4
      LDA     byte_RAM_5
      CMP     #$40
      BNE     loc_BANK2_9CD9

      LDA     byte_RAM_3
      BPL     loc_BANK2_9CD9

      LDA     byte_RAM_C
      AND     #$20
      BEQ     loc_BANK2_9CBD

      LDX     byte_RAM_D
      LDA     SpriteDMAArea,X
      PHA
      LDA     SpriteDMAArea,Y
      STA     SpriteDMAArea,X
      PLA

loc_BANK2_9C9C:
      STA     SpriteDMAArea,Y
      LDA     SpriteDMAArea+4,X
      PHA
      LDA     SpriteDMAArea+4,Y
      STA     SpriteDMAArea+4,X
      PLA
      STA     SpriteDMAArea+4,Y
      LDA     SpriteDMAArea+8,X
      PHA
      LDA     SpriteDMAArea+8,Y
      STA     SpriteDMAArea+8,X
      PLA
      STA     SpriteDMAArea+8,Y
      BCS     loc_BANK2_9CD9

loc_BANK2_9CBD:
      LDA     SpriteDMAArea,Y
      PHA
      LDA     SpriteDMAArea+8,Y
      STA     SpriteDMAArea,Y
      PLA
      STA     SpriteDMAArea+8,Y
      LDA     SpriteDMAArea+4,Y
      PHA
      LDA     SpriteDMAArea+$C,Y
      STA     SpriteDMAArea+4,Y
      PLA
      STA     SpriteDMAArea+$C,Y

loc_BANK2_9CD9:
      LDX     byte_RAM_12
      LDA     ObjectAttributes,X
      AND     #$10
      BEQ     locret_BANK2_9CF1

      LDA     byte_RAM_3
      STA     SpriteDMAArea+2,Y
      STA     SpriteDMAArea+$A,Y
      ORA     #$40
      STA     SpriteDMAArea+6,Y
      STA     SpriteDMAArea+$E,Y

locret_BANK2_9CF1:
      RTS

; End of function sub_BANK2_9BB3

; =============== S U B R O U T I N E =======================================

; Set tiles for an object
sub_BANK2_9CF2:
      LDA     byte_RAM_C
      AND     #$20
      BNE     loc_BANK2_9D6D

      LDA     byte_RAM_B
      BNE     loc_BANK2_9D0A

      LDA     EnemyTilemap1,X
      STA     SpriteDMAArea+1,Y
      LDA     EnemyTilemap1+1,X
      STA     SpriteDMAArea+5,Y
      BNE     loc_BANK2_9D16

loc_BANK2_9D0A:
      LDA     EnemyTilemap2,X
      STA     SpriteDMAArea+1,Y
      LDA     EnemyTilemap2+1,X
      STA     SpriteDMAArea+5,Y

loc_BANK2_9D16:
      LDA     byte_RAM_2
      LSR     A
      LDA     #$00
      BCC     loc_BANK2_9D2D

      LDA     SpriteDMAArea+1,Y
      PHA
      LDA     SpriteDMAArea+5,Y
      STA     SpriteDMAArea+1,Y
      PLA
      STA     SpriteDMAArea+5,Y
      LDA     #$40

loc_BANK2_9D2D:
      ORA     byte_RAM_3
      STA     SpriteDMAArea+2,Y
      STA     SpriteDMAArea+6,Y
      LDA     #$F8
      STA     SpriteDMAArea,Y
      STA     SpriteDMAArea+4,Y
      LDA     byte_RAM_EE
      AND     #$08
      BNE     loc_BANK2_9D48

      LDA     byte_RAM_0
      STA     SpriteDMAArea,Y

loc_BANK2_9D48:
      LDA     byte_RAM_EE
      AND     #$04
      BNE     loc_BANK2_9D53

      LDA     byte_RAM_0
      STA     SpriteDMAArea+4,Y

loc_BANK2_9D53:
      LDA     byte_RAM_0
      CLC
      ADC     #$10
      STA     byte_RAM_0
      LDA     byte_RAM_1
      STA     SpriteDMAArea+3,Y
      CLC
      ADC     #$08
      STA     SpriteDMAArea+7,Y
      TYA
      CLC
      ADC     #$08
      TAY
      INX
      INX
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_9D6D:
      LDA     EnemyTilemap2,X
      STA     SpriteDMAArea+1,Y
      LDA     EnemyTilemap2+1,X
      STA     SpriteDMAArea+5,Y
      LDA     EnemyTilemap2+2,X
      STA     SpriteDMAArea+9,Y
      LDA     byte_RAM_2
      LSR     A
      LDA     #$00
      BCC     loc_BANK2_9D96

      LDA     SpriteDMAArea+1,Y
      PHA
      LDA     SpriteDMAArea+9,Y
      STA     SpriteDMAArea+1,Y
      PLA
      STA     SpriteDMAArea+9,Y
      LDA     #$40

loc_BANK2_9D96:
      ORA     byte_RAM_3
      STA     SpriteDMAArea+2,Y
      STA     SpriteDMAArea+6,Y
      STA     SpriteDMAArea+$A,Y
      LDA     #$F8
      STA     SpriteDMAArea,Y
      STA     SpriteDMAArea+4,Y
      STA     SpriteDMAArea+8,Y
      LDA     byte_RAM_EE
      AND     #$08
      BNE     loc_BANK2_9DB7

      LDA     byte_RAM_0
      STA     SpriteDMAArea,Y

loc_BANK2_9DB7:
      LDA     byte_RAM_EE
      AND     #$04
      BNE     loc_BANK2_9DC2

      LDA     byte_RAM_0
      STA     SpriteDMAArea+4,Y

loc_BANK2_9DC2:
      LDA     byte_RAM_EE
      AND     #$02
      BNE     loc_BANK2_9DCD

      LDA     byte_RAM_0
      STA     SpriteDMAArea+8,Y

loc_BANK2_9DCD:
      LDA     byte_RAM_0
      CLC
      ADC     #$10
      STA     byte_RAM_0
      LDA     byte_RAM_1
      STA     SpriteDMAArea+3,Y
      ADC     #$08
      STA     SpriteDMAArea+7,Y
      ADC     #$08
      STA     SpriteDMAArea+$B,Y
      TXA
      PHA
      JSR     loc_BANKF_FAFE

      PLA
      TAX
      LDA     byte_RAM_D
      BNE     loc_BANK2_9DF0

      STY     byte_RAM_D

loc_BANK2_9DF0:
      INX
      INX

loc_BANK2_9DF2:
      INX

locret_BANK2_9DF3:
      RTS

; End of function sub_BANK2_9CF2

; ---------------------------------------------------------------------------
      .BYTE $04
      .BYTE $00
      .BYTE $FF
      .BYTE $FF
      .BYTE $00
      .BYTE $00

byte_BANK2_9DFA:
      .BYTE $01
      .BYTE $01
      .BYTE $00
      .BYTE $00
      .BYTE $01
      .BYTE $00
      .BYTE $00
      .BYTE $01
      .BYTE $01
      .BYTE $00
      .BYTE $00
      .BYTE $01
; ---------------------------------------------------------------------------

loc_BANK2_9E06:
      JSR     sub_BANK2_9BA7

      LDA     byte_RAM_EE
      AND     #$0C
      BNE     locret_BANK2_9E3A

      LDA     ObjectAnimationTimer,X
      AND     #$0C
      LSR     A
      LSR     A
      STA     byte_RAM_0
      LDA     EnemyMovementDirection,X
      TAX
      LDA     locret_BANK2_9DF3,X
      ADC     byte_RAM_F4
      TAY
      TXA
      ASL     A
      ASL     A
      ADC     byte_RAM_0
      TAX
      LDA     SpriteDMAArea,Y
      ADC     byte_BANK2_9DFA,X
      STA     SpriteDMAArea,Y
      LDA     SpriteDMAArea+3,Y
      ADC     loc_BANK2_9DF2,X
      STA     SpriteDMAArea+3,Y
      LDX     byte_RAM_12

locret_BANK2_9E3A:
      RTS


;
; Compares our position to the player's and returns
;
; Ouput
;   Y = 1 when player is to the left, 0 when player is to the right
;
EnemyFindWhichSidePlayerIsOn:
      LDA     PlayerXLo
      SBC     ObjectXLo,X
      STA     byte_RAM_F
      LDA     PlayerXHi
      LDY     #$00
      SBC     ObjectXHi,X
      BCS     EnemyFindWhichSidePlayerIsOn_Exit

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
      ADC     #$0A
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
      LDA     ObjectXVelocity,X
      CLC
      ADC     ObjectXAcceleration,X

      PHA
      ; Lower nybble of velocity is for subpixel position
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_1

      ; Upper nybble of velocity is for lo position
      PLA
      LSR     A
      LSR     A
      LSR     A
      LSR     A

      CMP     #$08
      BCC     ApplyObjectPhysics_StoreVelocityLo

      ; Left/up: Carry negative bits through upper nybble
      ORA     #$F0

ApplyObjectPhysics_StoreVelocityLo:
      STA     byte_RAM_0

      LDY     #$00
      ASL     A
      BCC     ApplyObjectPhysics_StoreDirection

      ; Left/up
      DEY

ApplyObjectPhysics_StoreDirection:
      STY     byte_RAM_2

      ; Add lower nybble of velocity for subpixel position
      LDA     ObjectXSubpixel,X
      CLC
      ADC     byte_RAM_1
      STA     ObjectXSubpixel,X

      ; Add upper nybble of velocity for lo position
      LDA     ObjectXLo,X
      ADC     byte_RAM_0
      STA     ObjectXLo,X

      ROL     byte_RAM_1

      ; X < 10 is horizontal physics, X >= 10 is vertical physics
      CPX     #$0A
      BCS     ApplyObjectPhysics_PositionHi

ApplyObjectPhysics_HorizontalSpecialCases:
      LDA     #$00
      STA     unk_RAM_4A4,X
      LDA     ObjectType,X
      CMP     #Enemy_Bullet
      BEQ     ApplyObjectPhysics_PositionHi

      CMP     #Enemy_BeezoDiving
      BEQ     ApplyObjectPhysics_PositionHi

      CMP     #Enemy_BeezoStraight
      BEQ     ApplyObjectPhysics_PositionHi

      LDY     IsHorizontalLevel
      BEQ     ApplyObjectPhysics_Exit

ApplyObjectPhysics_PositionHi:
      LSR     byte_RAM_1
      LDA     ObjectXHi,X
      ADC     byte_RAM_2
      STA     ObjectXHi,X

ApplyObjectPhysics_Exit:
      LDX     byte_RAM_12
      RTS


EnemyBehavior_TurnAround:
      ; flip x-velocity
      LDA     ObjectXVelocity,X
      EOR     #$FF
      CLC
      ADC     #$01
      STA     ObjectXVelocity,X
      ; if the enemy is not moving, flip direction next
      BEQ     EnemyBehavior_TurnAroundExit

      ; flip enemy movement direction
      LDA     EnemyMovementDirection,X
      EOR     #$03 ; $01 XOR $03 = $02, $02 XOR $03 = $01
      STA     EnemyMovementDirection,X

EnemyBehavior_TurnAroundExit:
      JMP     ApplyObjectPhysicsX


IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $9EBD - $A02F
     .pad $A030, $FF
ENDIF


EnemyTilemap2:
      .BYTE $2D,$2F ; $00
      .BYTE $2D,$2F ; $02
      .BYTE $E0,$E2 ; $04
      .BYTE $E4,$E6 ; $06
      .BYTE $E0,$E2 ; $08
      .BYTE $E4,$E6 ; $0A
      .BYTE $E8,$EA ; $0C
      .BYTE $EC,$EE ; $0E
      .BYTE $E8,$EA ; $10
      .BYTE $EC,$EE ; $12
      .BYTE $01,$03 ; $14
      .BYTE $09,$05 ; $16
      .BYTE $07,$0B ; $18
      .BYTE $0D,$0F ; $1A
      .BYTE $15,$11 ; $1C
      .BYTE $13,$17 ; $1E
      .BYTE $01,$03 ; $20
      .BYTE $09,$05 ; $22
      .BYTE $19,$1B ; $24
      .BYTE $01,$03 ; $26
      .BYTE $09,$05 ; $28
      .BYTE $19,$1B ; $2A
      .BYTE $1D,$1F ; $2C
      .BYTE $25,$21 ; $2E
      .BYTE $23,$27 ; $30
      .BYTE $1D,$1F ; $32
      .BYTE $25,$21 ; $34
      .BYTE $23,$27 ; $36
      .BYTE $9C,$9E ; $38
      .BYTE $9C,$9E ; $3A
      .BYTE $D0,$D2 ; $3C
      .BYTE $D4,$D6 ; $3E
      .BYTE $F0,$F2 ; $40
      .BYTE $F4,$F6 ; $42
      .BYTE $F0,$F2 ; $44
      .BYTE $F8,$FA ; $46
      .BYTE $0F,$11 ; $48
      .BYTE $13,$15 ; $4A
      .BYTE $1F,$11 ; $4C
      .BYTE $13,$15 ; $4E
      .BYTE $17,$19 ; $50
      .BYTE $1B,$17 ; $52
      .BYTE $19,$1D ; $54
      .BYTE $09,$0B ; $56
      .BYTE $01,$03 ; $58
      .BYTE $05,$07 ; $5A
      .BYTE $55,$59 ; $5C
      .BYTE $5B,$5D ; $5E
      .BYTE $F0,$F2 ; $60
      .BYTE $F4,$F6 ; $62
      .BYTE $45,$59 ; $64
      .BYTE $5B,$5D ; $66
      .BYTE $45,$59 ; $68
      .BYTE $5B,$5D ; $6A
      .BYTE $E8,$EA ; $6C
      .BYTE $EC,$EE ; $6E
      .BYTE $EC,$EE ; $70
      .BYTE $EC,$EE ; $72
      .BYTE $F0,$F2 ; $74
      .BYTE $F0,$F2 ; $76
      .BYTE $F4,$F6 ; $78
      .BYTE $F8,$FA ; $7A
      .BYTE $D0,$D2 ; $7C
      .BYTE $D4,$D6 ; $7E
      .BYTE $01,$03 ; $80
      .BYTE $05,$07 ; $82
      .BYTE $09,$0B ; $84
      .BYTE $0D,$0F ; $86
      .BYTE $01,$11 ; $88
      .BYTE $05,$15 ; $8A
      .BYTE $13,$0B ; $8C
      .BYTE $17,$0F ; $8E
      .BYTE $19,$1B ; $90
      .BYTE $2D,$2F ; $92
      .BYTE $3A,$3A ; $94
      .BYTE $E0,$E2 ; $96
      .BYTE $E4,$E6 ; $98
      .BYTE $E8,$EA ; $9A
      .BYTE $EC,$EE ; $9C
      .BYTE $01,$03 ; $9E
      .BYTE $05,$07 ; $A0
      .BYTE $4F,$5D ; $A2
      .BYTE $05,$07 ; $A4
      .BYTE $09,$0B ; $A6
      .BYTE $0D,$0F ; $A8
      .BYTE $27,$79 ; $AA
      .BYTE $7B,$2D ; $AC
      .BYTE $4F,$2F ; $AE
      .BYTE $45,$55 ; $B0
      .BYTE $11,$13 ; $B2
      .BYTE $15,$17 ; $B4
      .BYTE $1F,$21 ; $B6
      .BYTE $23,$25 ; $B8
      .BYTE $11,$13 ; $BA
      .BYTE $23,$25 ; $BC
      .BYTE $59,$59 ; $BE
      .BYTE $5B,$5B ; $C0
      .BYTE $01,$03 ; $C2
      .BYTE $05,$07 ; $C4
      .BYTE $09,$0B ; $C6
      .BYTE $0D,$0F ; $C8
      .BYTE $FB,$11 ; $CA
      .BYTE $15,$17 ; $CC
      .BYTE $13,$FB ; $CE
      .BYTE $19,$1B ; $D0
      .BYTE $1D,$1F ; $D2
      .BYTE $21,$23 ; $D4
      .BYTE $25,$27 ; $D6
      .BYTE $25,$27 ; $D8
; ---------------------------------------------------------------------------

EnemyInit_Clawgrip:
      JSR     EnemyInit_Birdo

      LDA     #$04
      STA     EnemyHP,X
      LDA     #$00
      STA     ObjectXVelocity,X
      LDA     ObjectXLo,X
      CLC
      ADC     #$04
      STA     ObjectXLo,X
      JMP     SetEnemyAttributes

; ---------------------------------------------------------------------------
unk_BANK3_A120:
      .BYTE $C8
      .BYTE $D0
      .BYTE $E0
      .BYTE $F0
      .BYTE $00
      .BYTE $10
      .BYTE $20
      .BYTE $C8
unk_BANK3_A128:
      .BYTE $DC
      .BYTE $E2
      .BYTE $E8
      .BYTE $F0
      .BYTE $F8
      .BYTE $E8
      .BYTE $DC
      .BYTE $DC
; ---------------------------------------------------------------------------

EnemyBehavior_Clawgrip:
      LDA     EnemyArray_45C,X
      ORA     EnemyArray_438,X
      BEQ     loc_BANK3_A13B

      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_A13B:
      JSR     EnemyBehavior_CheckDamaged

      LDA     ObjectYLo,X
      CMP     #$70
      BCC     loc_BANK3_A147

      JSR     ResetObjectYVelocity

loc_BANK3_A147:
      LDA     EnemyTimer,X
      BNE     loc_BANK3_A179

      LDA     EnemyVariable,X
      AND     #$3F
      BNE     loc_BANK3_A168

      LDA     PseudoRNGValues+2
      AND     #$03
      BEQ     loc_BANK3_A168

      LDY     ScreenBoundaryLeftLo
      DEY
      CPY     #$80
      BCC     loc_BANK3_A168

      LDA     #$7F
      STA     EnemyTimer,X
      LDY     #$00
      BEQ     loc_BANK3_A174

loc_BANK3_A168:
      INC     EnemyVariable,X
      LDY     #$F0
      LDA     EnemyVariable,X
      AND     #$20
      BEQ     loc_BANK3_A174

      LDY     #$10

loc_BANK3_A174:
      STY     ObjectXVelocity,X
      JMP     loc_BANK3_A1CD

; ---------------------------------------------------------------------------

loc_BANK3_A179:
      CMP     #$50
      BNE     loc_BANK3_A17D

loc_BANK3_A17D:
      CMP     #$20
      BNE     loc_BANK3_A1CD

      LDA     PseudoRNGValues+2
      AND     #$07
      TAY
      LDA     unk_BANK3_A128,Y
      STA     ObjectYVelocity,X
      DEC     ObjectYLo,X
      JSR     CreateEnemy

      BMI     loc_BANK3_A1CD

      LDY     byte_RAM_0
      LDA     ObjectYLo,X
      SEC
      SBC     #$00
      STA     ObjectYLo,Y
      LDA     ObjectYHi,X
      SBC     #$00
      STA     ObjectYHi,Y
      LDA     ObjectXLo,X
      CLC
      ADC     #$08
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      ADC     #$00
      STA     ObjectXHi,Y
      LDX     byte_RAM_0
      LDA     #Enemy_ClawgripRock
      STA     ObjectType,X
      LDA     PseudoRNGValues+2
      AND     #$07
      TAY
      LDA     unk_BANK3_A120,Y
      STA     ObjectYVelocity,X
      LDA     #$D0
      STA     ObjectXVelocity,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

loc_BANK3_A1CD:
      JSR     ApplyObjectPhysicsX

      JSR     ApplyObjectMovement_Vertical

loc_BANK3_A1D3:
      JMP     RenderSprite

; ---------------------------------------------------------------------------
      .BYTE $08
      .BYTE $08

byte_BANK3_A1D8:
      .BYTE $1C
      .BYTE $F4
      .BYTE $11
      .BYTE $0F

byte_BANK3_A1DC:
      .BYTE $04
      .BYTE $06
      .BYTE $08
      .BYTE $08
      .BYTE $08
      .BYTE $08
      .BYTE $06
      .BYTE $04
; ---------------------------------------------------------------------------

loc_BANK3_A1E4:
IFDEF COMPATIBILITY
      .db $ad, $f4, $00 ; LDA $00F4
ENDIF
IFNDEF COMPATIBILITY
      LDA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      STA     EnemyArray_B1,X
      LDY     EnemyState,X
      DEY
      TYA
      ORA     EnemyArray_45C,X
      BEQ     loc_BANK3_A1FA

      LDY     #$D2
      LDA     #$00
      STA     EnemyTimer,X
      BEQ     loc_BANK3_A21C

loc_BANK3_A1FA:
      LDY     #$C2
      LDA     byte_RAM_10
      AND     #$10
      BNE     loc_BANK3_A204

      LDY     #$C6

loc_BANK3_A204:
      LDA     EnemyTimer,X
      BEQ     loc_BANK3_A21C

      LDY     #$CA
      CMP     #$60
      BCS     loc_BANK3_A21C

      LDY     #$C2
      CMP     #$40
      BCS     loc_BANK3_A21C

      LDY     #$C6
      CMP     #$20
      BCS     loc_BANK3_A21C

      LDY     #$C2

loc_BANK3_A21C:
      LDA     #$02
      STA     EnemyMovementDirection,X
      TYA
      JSR     sub_BANK2_9BB3

      LDY     #$C6
      LDA     byte_RAM_10
      AND     #$10
      BNE     loc_BANK3_A22E

      LDY     #$C2

loc_BANK3_A22E:
      LDA     EnemyTimer,X
      BEQ     loc_BANK3_A246

      LDY     #$CE
      CMP     #$60
      BCS     loc_BANK3_A246

      LDY     #$C2
      CMP     #$40
      BCS     loc_BANK3_A246

      LDY     #$C6
      CMP     #$20
      BCS     loc_BANK3_A246

      LDY     #$C2

loc_BANK3_A246:
      LDA     EnemyArray_45C,X
      BEQ     loc_BANK3_A24D

      LDY     #$D2

loc_BANK3_A24D:
      LDA     SpriteTempScreenX
      CLC
      ADC     #$10
      STA     SpriteTempScreenX
      ASL     byte_RAM_EE
      ASL     byte_RAM_EE
      LDA     EnemyTimer,X
      CMP     #$60
      BCS     loc_BANK3_A262

      LSR     EnemyMovementDirection,X

loc_BANK3_A262:
      TYA
      PHA
      JSR     loc_BANKF_FAFE

      STY     byte_RAM_F4
      PLA
      JSR     sub_BANK2_9BB3

      LDA     EnemyTimer,X
      BEQ     loc_BANK3_A2D2

      LSR     A
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      BEQ     locret_BANK3_A2D1

      TAY
      LDA     ObjectXLo,X
      PHA
      CLC
      ADC     loc_BANK3_A1D3+2,Y
      STA     ObjectXLo,X
      SEC
      SBC     ScreenBoundaryLeftLo
      STA     SpriteTempScreenX
      LDA     ObjectYLo,X
      CLC
      ADC     byte_BANK3_A1D8,Y
      STA     SpriteTempScreenY
      LDA     EnemyTimer,X
      CMP     #$30
      BCC     loc_BANK3_A2AA

      CMP     #$40
      BCS     loc_BANK3_A2AA

      LSR     A
      AND     #$07
      TAY
      LDA     SpriteTempScreenY
      SEC
      SBC     byte_BANK3_A1DC,Y
      STA     SpriteTempScreenY

loc_BANK3_A2AA:
      JSR     sub_BANK2_8894

      LDY     #$00
IFDEF COMPATIBILITY
      .db $8c, $f4, $00 ; STY $00F4
ENDIF
IFNDEF COMPATIBILITY
      STY     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     ObjectAttributes,X
      PHA
      LDA     #$02
      STA     ObjectAttributes,X
      LDA     EnemyArray_46E,X
      PHA
      LDA     #%00010000
      STA     EnemyArray_46E,X
      LDA     #$D6
      JSR     sub_BANK2_9BB3

      PLA
      STA     EnemyArray_46E,X
      PLA
      STA     ObjectAttributes,X
      PLA
      STA     ObjectXLo,X

locret_BANK3_A2D1:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A2D2:
      LDA     byte_RAM_10
      AND     #$04
      BEQ     loc_BANK3_A2E1

IFDEF COMPATIBILITY
      .db $ae, $f4, $00 ; LDX $00F4
ENDIF
IFNDEF COMPATIBILITY
      LDX     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      DEC     SpriteDMAArea+$C,X
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A2E1:
      LDA     EnemyArray_B1,X
      TAX
      DEC     SpriteDMAArea+8,X
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_ClawgripRock:
      LDA     #$00
      STA     EnemyArray_45C,X
      JSR     EnemyBehavior_CheckDamaged

      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     ApplyObjectPhysicsX

      JSR     ApplyObjectMovement_Vertical

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK3_A30A

      JSR     EnemyBehavior_TurnAround

      JSR     HalfObjectVelocityX

loc_BANK3_A30A:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK3_A320

      LDA     ObjectYLo,X
      AND     #$F0
      STA     ObjectYLo,X
      LDA     ObjectYVelocity,X
      LSR     A
      EOR     #$FF
      CLC
      ADC     #$01
      STA     ObjectYVelocity,X

loc_BANK3_A320:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_A323:
IFDEF COMPATIBILITY
      .db $bd, $a8, $00 ; LDA $00A8, X
ENDIF
IFNDEF COMPATIBILITY
      LDA     ObjectBeingCarriedTimer,X ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      ORA     EnemyArray_438,X
      BNE     loc_BANK3_A362

      LDA     byte_RAM_10
      STA     byte_RAM_0
      LDA     ObjectXVelocity,X
      BPL     loc_BANK3_A338

      EOR     #$FF
      CLC
      ADC     #$01

loc_BANK3_A338:
      CMP     #$20
      BCS     loc_BANK3_A344

      LSR     byte_RAM_0
      CMP     #$08
      BCS     loc_BANK3_A344

      LSR     byte_RAM_0

loc_BANK3_A344:
      LDA     byte_RAM_0
      CLC
      ADC     #$04
      AND     #$08
      LSR     A
      LSR     A
      LSR     A
      LDY     ObjectXVelocity,X
      BPL     loc_BANK3_A354

      EOR     #$01

loc_BANK3_A354:
      STA     EnemyMovementDirection,X
      LDA     byte_RAM_0
      AND     #$08
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      ORA     #$02
      STA     ObjectAttributes,X

loc_BANK3_A362:
      JMP     sub_BANK2_9BA7

; ---------------------------------------------------------------------------
byte_BANK3_A365:
      .BYTE $00

      .BYTE $15
      .BYTE $EB
      .BYTE $00
; ---------------------------------------------------------------------------

EnemyBehavior_FlyingCarpet:
      JSR     sub_BANK3_B4FD

      LDA     byte_RAM_10
      AND     #$03
      BNE     loc_BANK3_A37C

      DEC     EnemyArray_B1,X
      BNE     loc_BANK3_A37C

      STA     byte_RAM_4B2
      JMP     EnemyDestroy

; ---------------------------------------------------------------------------

loc_BANK3_A37C:
      LDA     byte_RAM_4B2
      BEQ     loc_BANK3_A38F

      LDA     PlayerYVelocity
      BPL     loc_BANK3_A38F

      LDA     #$00
      STA     ObjectYVelocity,X
      STA     byte_RAM_4B2
      JMP     sub_BANK3_A552

; ---------------------------------------------------------------------------

loc_BANK3_A38F:
      LDA     EnemyCollision,X
      AND     #$20
      STA     byte_RAM_4B2
      BNE     loc_BANK3_A39B

      JMP     loc_BANK3_A42A

; ---------------------------------------------------------------------------

loc_BANK3_A39B:
      LDA     ObjectXVelocity,X
      BEQ     loc_BANK3_A3A5

      LDA     EnemyMovementDirection,X
      AND     #$01
      STA     byte_RAM_9D

loc_BANK3_A3A5:
      LDA     ObjectYLo,X
      SEC
      SBC     #$1A
      STA     PlayerYLo
      LDA     ObjectYHi,X
      SBC     #$00
      STA     PlayerYHi
      LDA     PlayerXLo
      SEC
      SBC     #$08
      STA     ObjectXLo,X
      LDA     PlayerXHi
      SBC     #$00
      STA     ObjectXHi,X
      LDY     #$01
      LDA     ObjectXVelocity,X
      BMI     loc_BANK3_A3C7

      LDY     #$FF

loc_BANK3_A3C7:
      STY     byte_RAM_71CC
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Right|ControllerInput_Left
      TAY
IFDEF COMPATIBILITY
      .db $2d, $5a, $00 ; AND $0000 + PlayerCollision
ENDIF
IFNDEF COMPATIBILITY
      AND     PlayerCollision ; Absolute address for zero-page
      NOP ; Alignment fix
ENDIF

      BNE     loc_BANK3_A3E6

      LDA     byte_BANK3_A365,Y
      CMP     ObjectXVelocity,X
      BEQ     loc_BANK3_A3E3

      LDA     ObjectXVelocity,X
      CLC
      ADC     byte_RAM_71CC,Y
      STA     ObjectXVelocity,X

loc_BANK3_A3E3:
      JMP     loc_BANK3_A3EA

; ---------------------------------------------------------------------------

loc_BANK3_A3E6:
      LDA     #$00
      STA     ObjectXVelocity,X

loc_BANK3_A3EA:
      LDY     #$01
      LDA     ObjectYVelocity,X
      BMI     loc_BANK3_A3F2

      LDY     #$FF

loc_BANK3_A3F2:
      STY     byte_RAM_71CC
      LDA     #$20
      CMP     SpriteTempScreenY
      LDA     #$00
      ROL     A
      ASL     A
      ASL     A
      ASL     A
      AND     Player1JoypadHeld
      BNE     loc_BANK3_A417

      LDA     EnemyCollision,X
      LSR     A
      LSR     A
      AND     #$03
      STA     byte_RAM_0
      LDA     Player1JoypadHeld
      LSR     A
      LSR     A
      AND     #$03
      TAY
      AND     byte_RAM_0
      BEQ     loc_BANK3_A41B

loc_BANK3_A417:
      LDA     #$00
      BEQ     loc_BANK3_A428

loc_BANK3_A41B:
      LDA     byte_BANK3_A365,Y
      CMP     ObjectYVelocity,X
      BEQ     loc_BANK3_A42A

      LDA     ObjectYVelocity,X
      CLC
      ADC     byte_RAM_71CC,Y

loc_BANK3_A428:
      STA     ObjectYVelocity,X

loc_BANK3_A42A:
      JSR     ApplyObjectPhysicsX

      JSR     ApplyObjectPhysicsY

      LDA     EnemyArray_B1,X
      CMP     #$20
      BCS     loc_BANK3_A43D

      LDA     byte_RAM_10
      AND     #$02

loc_BANK3_A43A:
      BNE     loc_BANK3_A43D

      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A43D:
      JMP     sub_BANK3_A552

; =============== S U B R O U T I N E =======================================

CreateFlyingCarpet:
      JSR     CreateEnemy_TryAllSlots

      BMI     loc_BANK3_A478

      LDX     byte_RAM_0
      LDY     byte_RAM_12
      LDA     #$00
      STA     ObjectXVelocity,X
      STA     ObjectYVelocity,X
      LDA     #Enemy_FlyingCarpet
      STA     ObjectType,X
      LDA     ObjectXLo,Y
      SEC
      SBC     #$08
      STA     ObjectXLo,X
      LDA     ObjectXHi,Y
      SBC     #$00
      STA     ObjectXHi,X
      LDA     ObjectYLo,Y
      CLC
      ADC     #$E
      STA     ObjectYLo,X
      LDA     ObjectYHi,Y
      ADC     #$00
      STA     ObjectYHi,X
      JSR     SetEnemyAttributes

      LDA     #$A0
      STA     EnemyArray_B1,X

loc_BANK3_A478:
      LDX     byte_RAM_12
      RTS

; End of function CreateFlyingCarpet

; ---------------------------------------------------------------------------
byte_BANK3_A47B:
      .BYTE $02

      .BYTE $02
      .BYTE $01
      .BYTE $01
byte_BANK3_A47F:
      .BYTE $04

      .BYTE $0C
      .BYTE $0C
      .BYTE $04
unk_BANK3_A483:
      .BYTE $01
      .BYTE $FF
unk_BANK3_A485:
      .BYTE $08
      .BYTE $F8
unk_BANK3_A487:
      .BYTE $01
      .BYTE $FF
unk_BANK3_A489:
      .BYTE $20
      .BYTE $E0
unk_BANK3_A48B:
      .BYTE $14
      .BYTE $EC
; ---------------------------------------------------------------------------

EnemyBehavior_Pidgit:
      JSR     EnemyBehavior_CheckDamaged

      INC     ObjectAnimationTimer,X
      LDA     EnemyArray_42F,X
      BEQ     loc_BANK3_A4A3

      LDA     ObjectAttributes,X
      ORA     #$80
      STA     ObjectAttributes,X
      JSR     sub_BANK3_A508

      JMP     ApplyObjectMovement

; ---------------------------------------------------------------------------

loc_BANK3_A4A3:
      JSR     EnemyBehavior_CheckBeingCarriedTimer

      LDA     EnemyArray_B1,X
      BEQ     loc_BANK3_A4C1

      DEC     ObjectYVelocity,X
      BPL     loc_BANK3_A4BE

      LDA     ObjectYLo,X
      CMP     #$30
      BCS     loc_BANK3_A4BE

      LDA     #$00
      STA     EnemyArray_B1,X
      STA     ObjectXVelocity,X
      STA     ObjectYVelocity,X
      DEC     EnemyTimer,X

loc_BANK3_A4BE:
      JMP     loc_BANK3_A502

; ---------------------------------------------------------------------------

loc_BANK3_A4C1:
      LDA     EnemyTimer,X
      BNE     loc_BANK3_A4D6

      LDA     #$30
      STA     ObjectYVelocity,X
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     unk_BANK3_A48B,Y
      STA     ObjectXVelocity,X
      INC     EnemyArray_B1,X
      JMP     sub_BANK3_A508

; ---------------------------------------------------------------------------

loc_BANK3_A4D6:
      LDA     EnemyArray_480,X
      AND     #$01
      TAY
      LDA     ObjectYVelocity,X
      CLC
      ADC     unk_BANK3_A483,Y
      STA     ObjectYVelocity,X
      CMP     unk_BANK3_A485,Y
      BNE     loc_BANK3_A4EC

      INC     EnemyArray_480,X

loc_BANK3_A4EC:
      LDA     EnemyArray_477,X
      AND     #$01
      TAY
      LDA     ObjectXVelocity,X
      CLC
      ADC     unk_BANK3_A487,Y
      STA     ObjectXVelocity,X
      CMP     unk_BANK3_A489,Y
      BNE     loc_BANK3_A502

      INC     EnemyArray_477,X

loc_BANK3_A502:
      JSR     ApplyObjectPhysicsY

      JSR     ApplyObjectPhysicsX

; =============== S U B R O U T I N E =======================================

sub_BANK3_A508:
      JSR     sub_BANK2_9BA7

      LDA     EnemyState,X
      SEC
      SBC     #$01
      ORA     EnemyArray_42F,X
      ORA     ObjectBeingCarriedTimer,X
      BNE     locret_BANK3_A551

      JSR     loc_BANKF_FAFE

IFDEF COMPATIBILITY
      .db $8c, $f4, $00 ; STY $00F4
ENDIF
IFNDEF COMPATIBILITY
      STY     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     #$45
      STA     ObjectAttributes,X
      LDA     ObjectXLo,X
      PHA
      SEC
      SBC     #$08
      STA     ObjectXLo,X
      LDA     ObjectXHi,X
      PHA
      SBC     #$00
      STA     ObjectXHi,X
      JSR     sub_BANK2_8894

      PLA
      STA     ObjectXHi,X
      PLA
      STA     ObjectXLo,X
      LDA     SpriteTempScreenY
      CLC
      ADC     #$C
      STA     SpriteTempScreenY
      LDA     SpriteTempScreenX
      SBC     #$07
      STA     SpriteTempScreenX
      JSR     sub_BANK3_A552

      LDA     #$D
      STA     ObjectAttributes,X

locret_BANK3_A551:
      RTS

; End of function sub_BANK3_A508

; =============== S U B R O U T I N E =======================================

sub_BANK3_A552:
      LDA     byte_RAM_10
      LSR     A
      LSR     A
      LSR     A
      AND     #$03
      LDY     ObjectXVelocity,X
      BMI     loc_BANK3_A55F

      EOR     #$03

loc_BANK3_A55F:
      TAY
      LDA     byte_BANK3_A47B,Y
      STA     EnemyMovementDirection,X
      LDA     byte_BANK3_A47F,Y
      JMP     sub_BANK2_9BB3

; End of function sub_BANK3_A552

; ---------------------------------------------------------------------------

EnemyInit_Mouser:
      JSR     EnemyInit_Birdo

      LDA     #$02
      LDY     CurrentWorld
      BEQ     loc_BANK3_A577

      LDA     #$04

loc_BANK3_A577:
      STA     EnemyHP,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Mouser:
      JSR     EnemyBehavior_CheckDamaged

      LDA     EnemyArray_45C,X
      BEQ     loc_BANK3_A586

      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_A586:
      JSR     sub_BANK3_B4FD

      LDA     #$02
      STA     EnemyMovementDirection,X
      JSR     RenderSprite

      LDA     EnemyCollision,X
      AND     #$04
      BEQ     loc_BANK3_A5F5

      JSR     ResetObjectYVelocity

      LDA     byte_RAM_10
      AND     #$FF
      BNE     loc_BANK3_A5A5

      LDA     #$D8
      STA     ObjectYVelocity,X
      BNE     loc_BANK3_A5F5

loc_BANK3_A5A5:
      LDA     byte_RAM_10
      AND     #$3F
      BNE     loc_BANK3_A5AF

      LDA     #$20
      STA     EnemyTimer,X

loc_BANK3_A5AF:
      LDY     EnemyTimer,X
      BNE     loc_BANK3_A5CE

      INC     EnemyArray_B1,X
      LDA     EnemyArray_B1,X
      AND     #$20
      BEQ     locret_BANK3_A5F4

      INC     ObjectAnimationTimer,X
      INC     ObjectAnimationTimer,X
      LDY     #$18
      LDA     EnemyArray_B1,X
      AND     #$40
      BNE     loc_BANK3_A5C9

      LDY     #$E8

loc_BANK3_A5C9:
      STY     ObjectXVelocity,X
      JMP     ApplyObjectPhysicsX

; ---------------------------------------------------------------------------

loc_BANK3_A5CE:
      CPY     #$10
      BNE     locret_BANK3_A5F4

      JSR     CreateEnemy_TryAllSlots

      BMI     locret_BANK3_A5F4

      LDX     byte_RAM_0
      LDA     #Enemy_Bomb
      STA     ObjectType,X
      LDA     ObjectYLo,X
      ADC     #$03
      STA     ObjectYLo,X
      LDA     #$E0
      STA     ObjectYVelocity,X
      JSR     SetEnemyAttributes

      LDA     #$FF
      STA     EnemyTimer,X
      LDA     #$E0
      STA     ObjectXVelocity,X
      LDX     byte_RAM_12

locret_BANK3_A5F4:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A5F5:
      JMP     ApplyObjectMovement_Vertical

; ---------------------------------------------------------------------------

loc_BANK3_A5F8:
      LDA     EnemyState,X
      CMP     #$01
      BNE     loc_BANK3_A609

      LDA     EnemyArray_45C,X
      BEQ     loc_BANK3_A612

      INC     ObjectAnimationTimer,X
      LDA     #$4A
      STA     ObjectAttributes,X

loc_BANK3_A609:
      LDA     #%10110011
      STA     EnemyArray_46E,X
      LDA     #$2C
      BNE     loc_BANK3_A61B

loc_BANK3_A612:
      LDY     EnemyTimer,X
      DEY
      CPY     #$10
      BCS     loc_BANK3_A621

      LDA     #$20

loc_BANK3_A61B:
      JSR     sub_BANK2_9BB3

      JMP     loc_BANK3_A648

; ---------------------------------------------------------------------------

loc_BANK3_A621:
      JSR     sub_BANK2_9BA7

      LDA     EnemyTimer,X
      CMP     #$10
      BCC     loc_BANK3_A648

      LDA     #$01
      STA     ObjectAttributes,X
      LDA     #%00010000
      STA     EnemyArray_46E,X
      LDA     SpriteTempScreenX
      CLC
      ADC     #$B
      STA     SpriteTempScreenX
      ASL     byte_RAM_EE
      LDY     #$00
IFDEF COMPATIBILITY
      .db $8c, $f4, $00 ; STY $00F4
ENDIF
IFNDEF COMPATIBILITY
      STY     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     #$38
      JSR     sub_BANK2_9BB3

loc_BANK3_A648:
      LDA     #$43
      STA     ObjectAttributes,X
      LDA     #%00110011
      STA     EnemyArray_46E,X

locret_BANK3_A651:
      RTS

; ---------------------------------------------------------------------------
      .BYTE $FB
      .BYTE $05
; ---------------------------------------------------------------------------

loc_BANK3_A654:
      JSR     loc_BANK2_9BB0

      LDA     byte_RAM_EE
      AND     #$E
      ORA     byte_RAM_EF
      ORA     EnemyArray_B1,X
      BNE     locret_BANK3_A67C

      LDA     ObjectYLo,X
      SEC
      SBC     #$02
      STA     byte_RAM_0
      LDY     EnemyMovementDirection,X
      LDA     byte_RAM_1
      CLC
      ADC     locret_BANK3_A651,Y
      STA     byte_RAM_1
      JSR     loc_BANKF_FAFE

      LDX     #$3C
      JSR     sub_BANK2_9CF2

      LDX     byte_RAM_12

locret_BANK3_A67C:
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Ostro:
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_A6DB

      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK3_A6BD

      LDA     #Enemy_ShyguyRed
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      JSR     CreateEnemy

      BMI     locret_BANK3_A6BC

      LDY     byte_RAM_0
      LDA     #Enemy_Ostro
      STA     ObjectType,Y
      STA     EnemyArray_B1,Y
      LDA     ObjectXLo,X
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      STA     ObjectXHi,Y
      LDA     unk_RAM_441,X
      STA     unk_RAM_441,Y
      LDA     #$FF
      STA     unk_RAM_441,X
      LDA     ObjectXVelocity,X
      STA     ObjectXVelocity,Y
      TYA
      TAX
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

locret_BANK3_A6BC:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A6BD:
      LDA     EnemyCollision,X
      AND     #$10
      BEQ     loc_BANK3_A6DB

      INC     EnemyArray_B1,X
      STA     ObjectAnimationTimer,X
      JSR     CreateEnemy

      BMI     loc_BANK3_A6DB

      LDY     byte_RAM_0
      LDA     ObjectXVelocity,X
      STA     ObjectXVelocity,Y
      LDA     #$20
      STA     EnemyArray_453,Y
      JMP     loc_BANK3_A6E1

; ---------------------------------------------------------------------------

loc_BANK3_A6DB:
      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     EnemyBehavior_CheckDamaged

loc_BANK3_A6E1:
      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     EnemyMovementDirection,X
      BEQ     loc_BANK3_A6ED

      JSR     EnemyBehavior_TurnAround

loc_BANK3_A6ED:
      LDA     EnemyCollision,X
      AND     #$04
      BEQ     loc_BANK3_A70D

      LDA     EnemyArray_42F,X
      BEQ     loc_BANK3_A700

      LDA     #$00
      STA     EnemyArray_42F,X
      JSR     EnemyInit_BasicAttributes

loc_BANK3_A700:
      LDA     ObjectAnimationTimer,X
      EOR     #$08
      STA     ObjectAnimationTimer,X
      JSR     ResetObjectYVelocity

      LDA     #$F0
      STA     ObjectYVelocity,X

loc_BANK3_A70D:
      INC     EnemyArray_477,X
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_A71E

      LDA     EnemyArray_477,X
      AND     #$3F
      BNE     loc_BANK3_A71E

      JSR     EnemyInit_BasicMovementTowardPlayer

loc_BANK3_A71E:
      JSR     ApplyObjectMovement

      JMP     RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_Tryclyde:
      JSR     EnemyInit_Basic

      LDA     #$40
      STA     EnemyArray_477,X
      LDA     #$02
      STA     EnemyHP,X
      JMP     EnemyInit_Birdo_Exit


byte_BANK3_A734:
      .BYTE $00
      .BYTE $FF
      .BYTE $FE
      .BYTE $FD
      .BYTE $FC
      .BYTE $FB
      .BYTE $FA
      .BYTE $F9
      .BYTE $F8
      .BYTE $F9
      .BYTE $FA
      .BYTE $FB
      .BYTE $FC
      .BYTE $FD
      .BYTE $FE
      .BYTE $FF

unk_BANK3_A744:
      .BYTE $0B
      .BYTE $0C
      .BYTE $0D
      .BYTE $0F
      .BYTE $10
      .BYTE $12
      .BYTE $14
      .BYTE $17
      .BYTE $1A
      .BYTE $1D
      .BYTE $1F
      .BYTE $20

unk_BANK3_A750:
      .BYTE $E2
      .BYTE $E2
      .BYTE $E2
      .BYTE $E3
      .BYTE $E4
      .BYTE $E5
      .BYTE $E7
      .BYTE $E9
      .BYTE $ED
      .BYTE $F1
      .BYTE $F8
      .BYTE $00


locret_BANK3_A75C:
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Tryclyde:
      JSR     EnemyBehavior_CheckDamaged

      LDY     #$00
      LDA     EnemyArray_477,X
      ASL     A
      BCC     loc_BANK3_A76F

      LDY     #$02
      ASL     A
      BCC     loc_BANK3_A76F

      LDY     #$FE

loc_BANK3_A76F:
      STY     ObjectXVelocity,X
      JSR     ApplyObjectPhysicsX

      INC     EnemyArray_477,X
      LDA     EnemyArray_B1,X
      CLC
      ADC     #$D0
      STA     EnemyArray_B1,X
      BCC     loc_BANK3_A783

      INC     EnemyArray_480,X

loc_BANK3_A783:
      LDA     byte_RAM_EF
      BNE     locret_BANK3_A75C

      LDA     #$49
      STA     ObjectAttributes,X
      LDY     #$48
      LDA     EnemyState,X
      SEC
      SBC     #$01
      ORA     EnemyArray_45C,X
      STA     byte_RAM_7
      BEQ     loc_BANK3_A79B

      LDY     #$4C

loc_BANK3_A79B:
      TYA
      LDY     #$30
IFDEF COMPATIBILITY
      .db $8c, $f4, $00 ; STY $00F4
ENDIF
IFNDEF COMPATIBILITY
      STY     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      JSR     sub_BANK2_9BB3

      LDA     #ObjAttrib_Palette1|ObjAttrib_FrontFacing
      STA     ObjectAttributes,X
      LDA     #%00110011
      STA     EnemyArray_46E,X
      LDA     ObjectXLo,X
      PHA
      SEC
      SBC     #$08
      STA     ObjectXLo,X
      JSR     sub_BANK2_8894

      LDX     #$50
      LDA     byte_RAM_10
      AND     #$20
      BNE     loc_BANK3_A7C8

      LDA     #$04
      AND     byte_RAM_10
      BEQ     loc_BANK3_A7C8

      LDX     #$53

loc_BANK3_A7C8:
      LDA     byte_RAM_1
      SEC
      SBC     #$08
      STA     byte_RAM_1
      LDA     #$20
      STA     byte_RAM_C
      LDY     #$E0
      JSR     sub_BANK2_9CF2

      LDX     byte_RAM_12
      LDA     ObjectXLo,X
      SEC
      SBC     #$08
      STA     ObjectXLo,X
      JSR     sub_BANK2_8894

      PLA
      STA     ObjectXLo,X
      LDA     #%00010011
      STA     EnemyArray_46E,X
      LDA     ObjectYLo,X
      STA     byte_RAM_0
      LDA     EnemyArray_477,X
      AND     #$78
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     byte_BANK3_A734,Y
      ADC     SpriteTempScreenX
      ADC     #$F0
      STA     byte_RAM_1
      LDX     #$56
      LDA     byte_RAM_7
      BNE     loc_BANK3_A815

      LDX     #$58
      DEY
      DEY
      DEY
      DEY
      CPY     #$07
      BCS     loc_BANK3_A815

      LDX     #$5A

loc_BANK3_A815:
      LDY     #$00
      JSR     sub_BANK2_9CF2

      LDX     byte_RAM_12
      LDA     ObjectYLo,X
      CLC
      ADC     #$10
      STA     byte_RAM_0
      LDA     EnemyArray_480,X
      AND     #$78
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     byte_BANK3_A734,Y
      ADC     SpriteTempScreenX
      ADC     #$F0
      STA     byte_RAM_1
      LDA     #$00
      STA     byte_RAM_C
      LDX     #$56
      LDA     byte_RAM_7
      BNE     loc_BANK3_A84C

      LDX     #$58
      DEY
      DEY
      DEY
      DEY
      CPY     #$07
      BCS     loc_BANK3_A84C

      LDX     #$5A

loc_BANK3_A84C:
      LDY     #$08
      JSR     sub_BANK2_9CF2

      LDX     byte_RAM_12
      LDA     #%00010011
      STA     EnemyArray_46E,X
      LDA     byte_RAM_EE
      BNE     loc_BANK3_A88B

      LDA     ObjectYLo,X
      CLC
      ADC     #$10
      STA     SpriteDMAArea+$58
      LDA     #$D
      STA     SpriteDMAArea+$59
      STA     SpriteDMAArea+$5D
      LDA     SpriteDMAArea+$32
      STA     SpriteDMAArea+$5A
      STA     SpriteDMAArea+$5E
      LDA     byte_RAM_1
      CLC
      ADC     #$10
      STA     SpriteDMAArea+$5B
      LDA     ObjectYLo,X
      STA     SpriteDMAArea+$5C
      LDA     SpriteTempScreenX
      SEC
      SBC     #$08
      STA     SpriteDMAArea+$5F

loc_BANK3_A88B:
      LDA     #$00
      STA     byte_RAM_5
      LDA     EnemyArray_477,X
      JSR     sub_BANK3_A89A

      INC     byte_RAM_5
      LDA     EnemyArray_480,X

; =============== S U B R O U T I N E =======================================

sub_BANK3_A89A:
      AND     #$67
      CMP     #$40
      BNE     locret_BANK3_A8F1

      LDA     EnemyArray_45C,X
      BNE     locret_BANK3_A8F1

      JSR     CreateEnemy

      BMI     locret_BANK3_A8F1

      LDA     #SoundEffect1_BirdoShot
      STA     SoundEffectQueue1
      LDY     byte_RAM_0
      LDA     #Enemy_Fireball
      STA     ObjectType,Y
      STA     EnemyVariable,Y
      STA     EnemyArray_B1,Y
      LDA     ObjectXLo,X
      SBC     #$18
      STA     ObjectXLo,Y
      LDA     byte_RAM_5
      BEQ     loc_BANK3_A8CF

      LDA     ObjectYLo,X
      CLC
      ADC     #$10
      STA     ObjectYLo,Y

loc_BANK3_A8CF:
      LDA     PlayerXLo
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      AND     #$F
      CMP     #$B
      BCC     loc_BANK3_A8DD

      LDA     #$B

loc_BANK3_A8DD:
      TAX ; These may be fireball speed pointers
      LDA     unk_BANK3_A744,X
      STA     ObjectYVelocity,Y
      LDA     unk_BANK3_A750,X
      STA     ObjectXVelocity,Y

; End of function sub_BANK3_A89A

; =============== S U B R O U T I N E =======================================

sub_BANK3_A8EA:
      TYA
      TAX
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

locret_BANK3_A8F1:
      RTS

; End of function sub_BANK3_A8EA

; ---------------------------------------------------------------------------

EnemyInit_Cobrats:
      JSR     EnemyInit_Basic

      LDA     ObjectYLo,X
      SEC
      SBC     #$08
      STA     EnemyVariable,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_CobratGround:
      JSR     EnemyBehavior_CheckDamaged

      JSR     sub_BANK2_98D6

      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     sub_BANK3_B4FD

      LDA     EnemyArray_480,X
      BNE     loc_BANK3_A93E

      STA     ObjectXVelocity,X
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_RAM_F
      ADC     #$40
      CMP     #$80
      BCS     loc_BANK3_A924

      INC     EnemyArray_480,X
      LDA     #$C0
      STA     ObjectYVelocity,X
      BNE     loc_BANK3_A93E

loc_BANK3_A924:
      INC     EnemyArray_477,X
      LDY     #$FC
      LDA     EnemyArray_477,X
      AND     #$20
      BEQ     loc_BANK3_A932

      LDY     #$04

loc_BANK3_A932:
      STY     ObjectYVelocity,X
      JSR     ApplyObjectPhysicsY

      LDA     #$61
      STA     ObjectAttributes,X
      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_A93E:
      LDA     ObjectYVelocity,X
      BMI     loc_BANK3_A951

      LDA     EnemyVariable,X
      SEC
      SBC     #$18
      CMP     ObjectYLo,X
      BCS     loc_BANK3_A951

      STA     ObjectYLo,X
      LDA     #$00
      STA     ObjectYVelocity,X

loc_BANK3_A951:
      JSR     ApplyObjectMovement

      INC     ObjectAnimationTimer,X
      LDA     ObjectAnimationTimer,X
      PHA
      AND     #$3F
      BNE     loc_BANK3_A960

      JSR     EnemyInit_BasicMovementTowardPlayer

loc_BANK3_A960:
      PLA
      BNE     loc_BANK3_A968

      LDA     #$18
      STA     EnemyArray_453,X

loc_BANK3_A968:
      LDA     EnemyCollision,X
      AND     #$03
      BEQ     loc_BANK3_A971

      JSR     EnemyBehavior_TurnAround

loc_BANK3_A971:
      LDA     #$41
      LDY     ObjectYVelocity,X
      BPL     loc_BANK3_A979

      LDA     #$61

loc_BANK3_A979:
      JMP     loc_BANK3_A9FE

; ---------------------------------------------------------------------------

EnemyBehavior_CobratJar:
      JSR     EnemyBehavior_CheckDamaged

      JSR     sub_BANK2_98D6

      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #$08
      BEQ     loc_BANK3_A993

      LDA     EnemyVariable,X
      STA     ObjectYLo,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A993:
      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      STY     EnemyMovementDirection,X
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_A9BC

      LDA     EnemyTimer,X
      BNE     loc_BANK3_A9AA

      LDA     #$D0
      STA     ObjectYVelocity,X
      INC     EnemyArray_B1,X
      JMP     loc_BANK3_A9F9

; ---------------------------------------------------------------------------

loc_BANK3_A9AA:
      LDY     #$FC
      LDA     byte_RAM_10
      AND     #$20
      BEQ     loc_BANK3_A9B4

      LDY     #$04

loc_BANK3_A9B4:
      STY     ObjectYVelocity,X
      JSR     ApplyObjectPhysicsY

      JMP     loc_BANK3_A9FC

; ---------------------------------------------------------------------------

loc_BANK3_A9BC:
      INC     ObjectAnimationTimer,X
      LDA     ObjectYVelocity,X
      BMI     loc_BANK3_A9F9

      BNE     loc_BANK3_A9C9

      LDA     #$10
      STA     EnemyArray_453,X

loc_BANK3_A9C9:
      LDA     ObjectYVelocity,X
      BMI     loc_BANK3_A9E9

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK3_A9E9

      LDA     byte_RAM_E
      SEC
      SBC     #$6F
      CMP     #$06
      BCC     loc_BANK3_A9E9

      LDA     #EnemyState_Dead
      STA     EnemyState,X
      LDA     #$E0
      STA     ObjectYVelocity,X
      LDA     #DPCM_BossHurt
      STA     DPCMQueue

loc_BANK3_A9E9:
      LDA     EnemyVariable,X
      CMP     ObjectYLo,X
      BCS     loc_BANK3_A9F9

      STA     ObjectYLo,X
      LDA     #$00
      STA     EnemyArray_B1,X
      LDA     #$A0
      STA     EnemyTimer,X

loc_BANK3_A9F9:
      JSR     ApplyObjectMovement_Vertical

loc_BANK3_A9FC:
      LDA     #$61

loc_BANK3_A9FE:
      STA     ObjectAttributes,X
      LDA     EnemyArray_453,X
      BEQ     loc_BANK3_AA11

      CMP     #$05
      BNE     loc_BANK3_AA0C

      JSR     CreateBullet

loc_BANK3_AA0C:
      LDA     #$64
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

loc_BANK3_AA11:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_Pokey:
      JSR     EnemyInit_Basic

      LDA     #$03
      STA     EnemyVariable,X
      RTS

; ---------------------------------------------------------------------------
unk_BANK3_AA1C:
      .BYTE $02
      .BYTE $04
      .BYTE $0D
      .BYTE $0E
; ---------------------------------------------------------------------------

EnemyBehavior_Pokey:
      LDA     EnemyVariable,X
      BNE     loc_BANK3_AA2D

      JSR     EnemyBehavior_CheckDamaged

      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     sub_BANK2_98D6

loc_BANK3_AA2D:
      LDA     EnemyCollision,X
      AND     #$10
      BEQ     loc_BANK3_AA3A

      JSR     sub_BANK3_AA3E

      INC     EnemyArray_42F,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_AA3A:
      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK3_AA99

; =============== S U B R O U T I N E =======================================

sub_BANK3_AA3E:
      LDA     EnemyVariable,X
      BEQ     loc_BANK3_AA99

      STA     EnemyArray_477,X
      LDA     #$00
      STA     EnemyVariable,X
      LDA     #$02
      STA     EnemyArray_489,X
      LDA     unk_RAM_441,X
      STA     byte_RAM_6
      LDA     #$FF
      STA     unk_RAM_441,X
      JSR     CreateEnemy

      BMI     loc_BANK3_AA99

      LDY     byte_RAM_0
      LDA     #Enemy_Pokey
      STA     ObjectType,Y
      JSR     sub_BANK3_A8EA

      LDY     byte_RAM_0
      LDA     byte_RAM_6
      STA     unk_RAM_441,Y
      LDA     EnemyArray_477,X
      SEC
      SBC     #$01
      STA     EnemyVariable,Y
      TAY

loc_BANK3_AA78:
      LDA     unk_BANK3_AA1C,Y
      LDY     byte_RAM_0
      STA     EnemyArray_489,Y
      LDA     ObjectXLo,X
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      STA     ObjectXHi,Y
      LDA     ObjectYLo,X
      CLC
      ADC     #$10
      STA     ObjectYLo,Y
      LDA     ObjectYHi,X
      ADC     #$00
      STA     ObjectYHi,Y

loc_BANK3_AA99:
      INC     ObjectAnimationTimer,X
      LDA     ObjectAnimationTimer,X
      AND     #$3F
      BNE     loc_BANK3_AAA4

      JSR     EnemyInit_BasicMovementTowardPlayer

loc_BANK3_AAA4:
      JSR     ApplyObjectPhysicsX

      JMP     RenderSprite

; End of function sub_BANK3_AA3E


PokeyWiggleOffset:
      .BYTE $00
      .BYTE $01
      .BYTE $00
      .BYTE $FF
      .BYTE $00
      .BYTE $01
      .BYTE $00


DrawPokey:
      LDY     #$00
      LDA     byte_RAM_EE
      BNE     DrawPokey_Segments

      LDA     byte_RAM_10
      AND     #$18
      LSR     A
      LSR     A
      LSR     A
      TAY

DrawPokey_Segments:
      STY     byte_RAM_7
      LDA     SpriteTempScreenX
      STA     PokeyTempScreenX
      CLC
      ADC     PokeyWiggleOffset,Y
      STA     SpriteTempScreenX
      JSR     sub_BANK2_9BA7

      LDA     EnemyVariable,X
      STA     byte_RAM_9
      BEQ     DrawPokey_Exit

      TYA
      CLC
      ADC     #$10
      TAY
      LDX     byte_RAM_7
      LDA     PokeyTempScreenX
      ADC     PokeyWiggleOffset+1,X
      STA     byte_RAM_1
      LDX     #$70
      JSR     sub_BANK2_9CF2

      DEC     byte_RAM_9
      BEQ     DrawPokey_Exit

      JSR     loc_BANKF_FAFE

      LDX     byte_RAM_7
      LDA     PokeyTempScreenX
      CLC
      ADC     PokeyWiggleOffset+2,X
      STA     byte_RAM_1
      LDX     #$70
      JSR     sub_BANK2_9CF2

      DEC     byte_RAM_9
      BEQ     DrawPokey_Exit

      LDX     byte_RAM_7
      LDA     PokeyTempScreenX
      CLC
      ADC     PokeyWiggleOffset+3,X
      STA     byte_RAM_1
      LDX     #$70
      JSR     sub_BANK2_9CF2

DrawPokey_Exit:
      LDX     byte_RAM_12
      RTS


EnemyBehavior_Rocket:
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_AB20

      JMP     loc_BANK3_ABD7

; ---------------------------------------------------------------------------

loc_BANK3_AB20:
      LDY     #$03
      LDA     ObjectYVelocity,X
      BEQ     loc_BANK3_AB2A

      CMP     #$FD
      BCC     loc_BANK3_AB3B

loc_BANK3_AB2A:
      LDY     #$3F
      INC     SpriteTempScreenX
      LDA     byte_RAM_10
      AND     #$02
      BNE     loc_BANK3_AB3B

      DEC     SpriteTempScreenX
      DEC     SpriteTempScreenX

loc_BANK3_AB3B:
      TYA
      AND     byte_RAM_10
      BNE     loc_BANK3_AB42

      DEC     ObjectYVelocity,X

loc_BANK3_AB42:
      JSR     ApplyObjectPhysicsY

      LDA     EnemyArray_477,X
      BNE     loc_BANK3_AB64

      LDY     ObjectYHi,X
      BPL     loc_BANK3_AB88

      JSR     DoAreaReset

      LDA     #Enemy_Rocket
      STA     ObjectCarriedOver
      INC     DoAreaTransition
      LDA     #TransitionType_Rocket
      STA     TransitionType
      LDA     #$00
IFDEF COMPATIBILITY
      .db $8d, $50, $00 ; STA $0000 + PlayerState
ENDIF
IFNDEF COMPATIBILITY
      STA     PlayerState ; Absolute address for zero-page
      NOP ; Alignment fix
ENDIF

      RTS

; ---------------------------------------------------------------------------

; rocket explosion
loc_BANK3_AB64:
      LDA     ObjectYLo,X
      CMP     #$30
      BCS     loc_BANK3_AB88

      LDY     byte_RAM_4C7
      BNE     loc_BANK3_AB76

      CMP     #$18
      BCS     loc_BANK3_AB88

      JMP     EnemyBehavior_Bomb_Explode

; ---------------------------------------------------------------------------

loc_BANK3_AB76:
      LDA     #$00
      STA     byte_RAM_4C7
      STA     HoldingItem
      STA     PlayerXVelocity
      LDA     ObjectYLo,X
      ADC     #$20
      STA     PlayerYLo
      STA     PlayerScreenYLo

loc_BANK3_AB88:
      JSR     sub_BANK3_ABEE

      LDA     SpriteTempScreenX
      SEC
      SBC     #$04
      STA     SpriteDMAArea+$93
      ADC     #$07
      STA     SpriteDMAArea+$97
      ADC     #$08
      STA     SpriteDMAArea+$9B
      LDA     #$20
      LDY     ObjectYVelocity,X
      CPY     #$FD
      BMI     loc_BANK3_ABA8

      LDA     #$15

loc_BANK3_ABA8:
      ADC     SpriteTempScreenY
      STA     SpriteDMAArea+$90
      STA     SpriteDMAArea+$94
      STA     SpriteDMAArea+$98
      LDA     #$8C
      STA     SpriteDMAArea+$91
      STA     SpriteDMAArea+$95
      STA     SpriteDMAArea+$99
      LDA     byte_RAM_10
      LSR     A
      AND     #$03
      STA     byte_RAM_0
      LSR     A
      ROR     A
      ROR     A
      AND     #$C0
      ORA     byte_RAM_0
      STA     SpriteDMAArea+$92
      STA     SpriteDMAArea+$96
      STA     SpriteDMAArea+$9A
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_ABD7:
      LDA     ObjectBeingCarriedTimer,X
      CMP     #$01
      BNE     loc_BANK3_ABEB

      STA     EnemyArray_B1,X
      STA     byte_RAM_4C7
      LDA     #SoundEffect3_Rumble_A
      STA     SoundEffectQueue3
      LDA     #$FE
      STA     ObjectYVelocity,X

loc_BANK3_ABEB:
      JSR     CarryObject

; =============== S U B R O U T I N E =======================================

sub_BANK3_ABEE:
      LDA     SpriteTempScreenY
      STA     byte_RAM_0
      LDA     SpriteTempScreenX
      SEC
      SBC     #$08
      STA     byte_RAM_1
      LDA     #$02
      STA     byte_RAM_2
      STA     byte_RAM_5
      STA     byte_RAM_C
      LDA     ObjectAttributes,X
      AND     #$23
      STA     byte_RAM_3
      LDY     #$00
      LDX     #$96
      JSR     loc_BANK2_9C53

      LDA     byte_RAM_1
      CLC
      ADC     #$10
      STA     byte_RAM_1
      DEC     byte_RAM_2
      LDA     SpriteTempScreenY
      STA     byte_RAM_0
      LDY     #$10
      LDX     #$96
      JMP     loc_BANK2_9C53

; End of function sub_BANK3_ABEE

; ---------------------------------------------------------------------------
byte_BANK3_AC25:
      .BYTE $F0

byte_BANK3_AC26:
      .BYTE $00
      .BYTE $F0

; =============== S U B R O U T I N E =======================================

sub_BANK3_AC28:
      LDA     #$00
      STA     byte_RAM_EE
      LDA     ObjectAnimationTimer,X
      AND     #$08
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_7
      LDY     byte_RAM_7
      LDA     SpriteTempScreenX
      PHA
      CLC
      ADC     byte_BANK3_AC25,Y
      STA     SpriteTempScreenX
      LDA     #$80
      LDY     EnemyArray_45C,X
      BEQ     loc_BANK3_AC4B

      LDA     #$88

loc_BANK3_AC4B:
      JSR     sub_BANK2_9BB3

      JSR     loc_BANKF_FAFE

IFDEF COMPATIBILITY
      .db $8c, $f4, $00 ; STY $00F4
ENDIF
IFNDEF COMPATIBILITY
      STY     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      PLA
      CLC
      LDY     byte_RAM_7
      ADC     byte_BANK3_AC26,Y
      STA     SpriteTempScreenX
      LDA     #$84
      LDY     EnemyArray_45C,X
      BEQ     loc_BANK3_AC67

      LDA     #$8C

loc_BANK3_AC67:
      JMP     sub_BANK2_9BB3

; End of function sub_BANK3_AC28

; ---------------------------------------------------------------------------

EnemyInit_Fryguy:
      JSR     EnemyInit_Basic

      LDA     #$04
      STA     EnemyHP,X
      LDA     #$00
      STA     EnemyVariable,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK3_AC77:
      .BYTE $E0
      .BYTE $20
      .BYTE $F0
      .BYTE $10

byte_BANK3_AC7B:
      .BYTE $04
      .BYTE $0C
      .BYTE $04
      .BYTE $0C

byte_BANK3_AC7F:
      .BYTE $04
      .BYTE $04
      .BYTE $0C
      .BYTE $0C

byte_BANK3_AC83:
      .BYTE $01
      .BYTE $FF

byte_BANK3_AC85:
      .BYTE $2A
      .BYTE $D6

byte_BANK3_AC87:
      .BYTE $01
      .BYTE $FF

byte_BANK3_AC89:
      .BYTE $18
      .BYTE $E8
; ---------------------------------------------------------------------------

EnemyBehavior_Fryguy:
      LDA     #$02
      STA     EnemyMovementDirection,X
      INC     ObjectAnimationTimer,X
      LDY     EnemyHP,X
      DEY
      BNE     loc_BANK3_ACE7

      LDA     #$03
      STA     byte_RAM_9
      STA     FryguySplitFlames
      JSR     EnemyDestroy

loc_BANK3_ACA1:
      JSR     CreateEnemy

      BMI     loc_BANK3_ACE3

      LDY     byte_RAM_0
      LDA     ObjectYHi,X
      STA     unk_RAM_4EF,Y
      LDA     #$F0
      STA     ObjectYVelocity,Y
      LDA     #Enemy_FryguySplit
      STA     ObjectType,Y
      LDA     #$30
      STA     EnemyArray_453,Y
      LDA     ObjectYLo,X
      PHA
      LDX     byte_RAM_9
      LDA     byte_BANK3_AC77,X
      STA     ObjectXVelocity,Y
      LDA     SpriteTempScreenX
      ADC     byte_BANK3_AC7B,X
      STA     ObjectXLo,Y
      PLA
      ADC     byte_BANK3_AC7F,X
      STA     ObjectYLo,Y
      LDA     #$00
      STA     ObjectXHi,Y
      TYA
      TAX
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

loc_BANK3_ACE3:
      DEC     byte_RAM_9
      BPL     loc_BANK3_ACA1

loc_BANK3_ACE7:
      LDA     byte_RAM_10
      AND     #$1F
      BNE     loc_BANK3_AD07

      JSR     CreateEnemy

      LDX     byte_RAM_0
      LDA     #Enemy_Fireball
      STA     ObjectType,X
      LDA     ObjectXLo,X
      SBC     #$08
      STA     ObjectXLo,X
      LDA     ObjectYLo,X
      ADC     #$18
      STA     ObjectYLo,X
      JSR     EnemyInit_BasicAttributes

      LDX     byte_RAM_12

loc_BANK3_AD07:
      LDA     byte_RAM_10
      AND     #$01
      BNE     loc_BANK3_AD37

      LDA     EnemyVariable,X
      AND     #$01
      TAY
      LDA     ObjectYVelocity,X
      CLC
      ADC     byte_BANK3_AC87,Y
      STA     ObjectYVelocity,X
      CMP     byte_BANK3_AC89,Y
      BNE     loc_BANK3_AD21

      INC     EnemyVariable,X

loc_BANK3_AD21:
      LDA     EnemyArray_477,X
      AND     #$01
      TAY
      LDA     ObjectXVelocity,X
      CLC
      ADC     byte_BANK3_AC83,Y
      STA     ObjectXVelocity,X
      CMP     byte_BANK3_AC85,Y
      BNE     loc_BANK3_AD37

      INC     EnemyArray_477,X

loc_BANK3_AD37:
      JSR     sub_BANK3_AC28

      JSR     ApplyObjectPhysicsY

      JMP     ApplyObjectPhysicsX

; ---------------------------------------------------------------------------
unk_BANK3_AD40:
      .BYTE $3F
      .BYTE $3F
      .BYTE $3F
      .BYTE $7F
unk_BANK3_AD44:
      .BYTE $D4
      .BYTE $D8
      .BYTE $DA
      .BYTE $DE
; ---------------------------------------------------------------------------

EnemyBehavior_FryguySplit:
      LDA     EnemyCollision,X
      AND     #$10
      BEQ     loc_BANK3_AD59

      JSR     PlayBossHurtSound

      LDA     #%00000000
      STA     EnemyArray_46E,X
      JMP     TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------

loc_BANK3_AD59:
      LDA     #$02
      STA     EnemyMovementDirection,X
      LDA     byte_RAM_10
      STA     ObjectShakeTimer,X
      INC     ObjectAnimationTimer,X
      INC     ObjectAnimationTimer,X
      JSR     sub_BANK3_B4FD

      JSR     RenderSprite

      LDA     EnemyCollision,X
      PHA
      AND     #CollisionFlags_Down
      BEQ     loc_BANK3_AD7A

      JSR     ResetObjectYVelocity

      LDA     #$00
      STA     ObjectXVelocity,X

loc_BANK3_AD7A:
      PLA
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK3_AD85

      JSR     EnemyBehavior_TurnAround

      JSR     HalfObjectVelocityX

loc_BANK3_AD85:
      TXA
      ASL     A
      ASL     A
      ASL     A
      ADC     byte_RAM_10
      LDY     FryguySplitFlames
      AND     unk_BANK3_AD40,Y
      ORA     ObjectYVelocity,X
      BNE     loc_BANK3_ADAB

      LDA     PseudoRNGValues+2
      AND     #$1F
      ORA     unk_BANK3_AD44,Y
      STA     ObjectYVelocity,X
      JSR     EnemyInit_BasicMovementTowardPlayer

      LDA     FryguySplitFlames
      CMP     #$02
      BCS     loc_BANK3_ADAB

      ASL     ObjectXVelocity,X

loc_BANK3_ADAB:
      JSR     ApplyObjectPhysicsX

      JMP     ApplyObjectMovement_Vertical

; ---------------------------------------------------------------------------

EnemyBehavior_Autobomb:
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_ADF9

      LDA     EnemyCollision,X
      AND     #$10
      ORA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK3_ADF9

      LDA     #Enemy_ShyguyRed
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDA     unk_RAM_441,X
      STA     byte_RAM_6
      LDA     #$FF
      STA     unk_RAM_441,X
      JSR     CreateEnemy

      BMI     loc_BANK3_ADF9

      LDY     byte_RAM_0
      LDA     byte_RAM_6
      STA     unk_RAM_441,Y
      LDA     ObjectXLo,X
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      STA     ObjectXHi,Y
      LDX     byte_RAM_0
      LDA     #Enemy_Autobomb
      STA     ObjectType,X
      JSR     EnemyInit_BasicAttributes

      INC     EnemyArray_B1,X
      JSR     SetEnemyAttributes

      LDA     #$04
      STA     EnemyArray_489,X
      LDX     byte_RAM_12

loc_BANK3_ADF9:
      JSR     EnemyBehavior_CheckDamaged

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     #CollisionFlags_Down
      BEQ     loc_BANK3_AE09

      JSR     ResetObjectYVelocity

loc_BANK3_AE09:
      PLA
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK3_AE14

      JSR     EnemyBehavior_TurnAround

      JSR     ApplyObjectPhysicsX

loc_BANK3_AE14:
      INC     ObjectAnimationTimer,X
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_AE45

      TXA
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      ADC     byte_RAM_10
      AND     #$7F
      BNE     loc_BANK3_AE28

      JSR     EnemyInit_BasicMovementTowardPlayer

loc_BANK3_AE28:
      LDA     ObjectAnimationTimer,X
      AND     #%01111111
      BNE     loc_BANK3_AE45

      JSR     EnemyInit_BasicMovementTowardPlayer

      ; which bullet?
      JSR     CreateBullet

      BMI     loc_BANK3_AE45

      LDX     byte_RAM_0 ; X has the new enemy index
      LDA     #Enemy_AutobombFire
      ; Set the enemy type and attributes
      ; BUG: The subroutine overwrites RAM_0 (enemy index)
      ; Should have pushed it to stack instead.
      JSR     EnemyBehavior_SpitProjectile

      LDX     byte_RAM_0
      DEC     ObjectYLo,X
      DEC     ObjectYLo,X
      LDX     byte_RAM_12

loc_BANK3_AE45:
      JSR     ApplyObjectMovement

      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_AE4B:
      LDA     EnemyState,X
      CMP     #EnemyState_Alive
      BEQ     loc_BANK3_AE5C

      LDA     #ObjAttrib_Palette1|ObjAttrib_16x32|ObjAttrib_UpsideDown
      STA     ObjectAttributes,X
      STA     ObjectAnimationTimer,X
      LDA     #$76
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

loc_BANK3_AE5C:
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_AE7C

IFDEF COMPATIBILITY
      .db $ad, $f4, $00 ; LDA $00F4
ENDIF
IFNDEF COMPATIBILITY
      LDA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      PHA
      LDA     SpriteTempScreenY
      CLC
      ADC     #$F5
      STA     SpriteTempScreenY
      JSR     loc_BANKF_FAFE

IFDEF COMPATIBILITY
      .db $8c, $f4, $00 ; STY $00F4
ENDIF
IFNDEF COMPATIBILITY
      STY     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     #$7C
      JSR     sub_BANK2_9BB3

      PLA
IFDEF COMPATIBILITY
      .db $8d, $f4, $00 ; STA $00F4
ENDIF
IFNDEF COMPATIBILITY
      STA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF


loc_BANK3_AE7C:
      LDA     ObjectYLo,X
      STA     SpriteTempScreenY
      JSR     sub_BANK2_9BA7

      LDA     #$02
      STA     EnemyMovementDirection,X
      TYA
      CLC
      ADC     #$08
IFDEF COMPATIBILITY
      .db $8d, $f4, $00 ; STA $00F4
ENDIF
IFNDEF COMPATIBILITY
      STA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     byte_RAM_0
      STA     SpriteTempScreenY
      LDA     #%11010000
      STA     EnemyArray_46E,X
      LDA     #$78
      JSR     sub_BANK2_9BB3

      LDA     #$50
      LDY     EnemyArray_B1,X
      BEQ     loc_BANK3_AEA6

      LDA     #%01010010

loc_BANK3_AEA6:
      STA     EnemyArray_46E,X
      RTS

; ---------------------------------------------------------------------------

EnemyInit_WhaleSpout:
      JSR     EnemyInit_Basic

      LDA     ObjectYLo,X
      STA     EnemyArray_B1,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_WhaleSpout:
      INC     ObjectAnimationTimer,X
      INC     ObjectAnimationTimer,X
      INC     EnemyVariable,X
      LDA     EnemyVariable,X
      CMP     #$40
      BCS     loc_BANK3_AEC3

      LDA     #$E0
      STA     ObjectYLo,X

locret_BANK3_AEC2:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_AEC3:
      BNE     loc_BANK3_AECD

      LDA     #$D0
      STA     ObjectYVelocity,X
      LDA     EnemyArray_B1,X
      STA     ObjectYLo,X

loc_BANK3_AECD:
      LDA     #SoundEffect3_ShortNoise
      STA     SoundEffectQueue3
      LDA     EnemyVariable,X
      CMP     #$80
      BCC     loc_BANK3_AEE6

      CMP     #$DC
      BCS     loc_BANK3_AEE6

      LDY     #$03
      AND     #$10
      BEQ     loc_BANK3_AEE4

      LDY     #$FB

loc_BANK3_AEE4:
      STY     ObjectYVelocity,X

loc_BANK3_AEE6:
      INC     ObjectYVelocity,X
      JSR     ApplyObjectPhysicsY

loc_BANK3_AEEB:
      LDA     byte_RAM_EE
      AND     #$C
      BNE     locret_BANK3_AEC2

      LDA     EnemyVariable,X
      STA     byte_RAM_7
      LDA     #$29
      STA     ObjectAttributes,X
      LDA     #$92
      LDY     EnemyVariable,X
      CPY     #$DC
      BCC     loc_BANK3_AF03

      LDA     #$94

loc_BANK3_AF03:
      JSR     sub_BANK2_9BB3

      JSR     loc_BANKF_FAFE

      LDA     #$55
      LDX     byte_RAM_7
      CPX     #$E0
      BCC     loc_BANK3_AF13

      LDA     #$3A

loc_BANK3_AF13:
      STA     SpriteDMAArea+1,Y
      LDA     #$55
      CPX     #$E8
      BCC     loc_BANK3_AF1E

      LDA     #$3A

loc_BANK3_AF1E:
      STA     SpriteDMAArea+5,Y
      LDA     #$55
      CPX     #$F0
      BCC     loc_BANK3_AF29

      LDA     #$3A

loc_BANK3_AF29:
      STA     SpriteDMAArea+9,Y
      LDA     #$55
      CPX     #$F8
      BCC     loc_BANK3_AF34

      LDA     #$3A

loc_BANK3_AF34:
      STA     SpriteDMAArea+$D,Y
IFDEF COMPATIBILITY
      .db $ae, $f4, $00 ; LDX $00F4
ENDIF
IFNDEF COMPATIBILITY
      LDX     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     SpriteDMAArea+2,X
      STA     SpriteDMAArea+2,Y
      STA     SpriteDMAArea+6,Y
      STA     SpriteDMAArea+$A,Y
      STA     SpriteDMAArea+$E,Y
      LDA     SpriteTempScreenX
      CLC
      ADC     #$04
      STA     SpriteDMAArea+3,Y
      STA     SpriteDMAArea+7,Y
      STA     SpriteDMAArea+$B,Y
      STA     SpriteDMAArea+$F,Y
      LDX     byte_RAM_12
      LDA     ObjectYLo,X
      CLC
      ADC     #$F
      STA     SpriteDMAArea,Y
      ADC     #$10
      STA     SpriteDMAArea+4,Y
      ADC     #$10
      STA     SpriteDMAArea+8,Y
      ADC     #$10
      STA     SpriteDMAArea+$C,Y

locret_BANK3_AF74:
      RTS

; ---------------------------------------------------------------------------
      .BYTE $1C
byte_BANK3_AF76:
      .BYTE $E4

      .BYTE $01
      .BYTE $FF
; ---------------------------------------------------------------------------

EnemyBehavior_Flurry:
      INC     ObjectAnimationTimer,X
      JSR     EnemyBehavior_CheckDamaged

      JSR     EnemyBehavior_CheckBeingCarriedTimer

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK3_AF8D

      JSR     EnemyBehavior_TurnAround

loc_BANK3_AF8D:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK3_AFB4

      LDA     ObjectYVelocity,X
      PHA
      JSR     ResetObjectYVelocity

      PLA
      LDY     EnemyArray_42F,X
      BEQ     loc_BANK3_AFB4

      CMP     #$18
      BMI     loc_BANK3_AFAC

      JSR     HalfObjectVelocityX

      LDA     #$F0
      STA     ObjectYVelocity,X
      BNE     loc_BANK3_AFDA

loc_BANK3_AFAC:
      LDA     #$00
      STA     EnemyArray_42F,X
      JSR     SetEnemyAttributes

loc_BANK3_AFB4:
      LDA     byte_RAM_E
      CMP     #$16
      BEQ     loc_BANK3_AFBF

      DEC     ObjectAnimationTimer,X
      JMP     loc_BANK2_9470

; ---------------------------------------------------------------------------

loc_BANK3_AFBF:
      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      STY     EnemyMovementDirection,X
      LDA     byte_RAM_10
      AND     #$01
      BNE     loc_BANK3_AFDA

      LDA     ObjectXVelocity,X
      CMP     locret_BANK3_AF74,Y
      BEQ     loc_BANK3_AFDA

      CLC
      ADC     byte_BANK3_AF76,Y
      STA     ObjectXVelocity,X
      INC     ObjectAnimationTimer,X

loc_BANK3_AFDA:
      JSR     ApplyObjectMovement

      INC     unk_RAM_4A4,X
      JMP     RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_HawkmouthBoss:
      JSR     EnemyInit_Hawkmouth ; Falls through to EnemyInit_Stationary

      LDA     #$03
      STA     EnemyHP,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK3_AFEC:
      .BYTE $01
      .BYTE $FF
byte_BANK3_AFEE:
      .BYTE $28
      .BYTE $D8
byte_BANK3_AFF0:
      .BYTE $01
      .BYTE $FF
byte_BANK3_AFF2:
      .BYTE $10
      .BYTE $F0
; ---------------------------------------------------------------------------

EnemyBehavior_HawkmouthBoss:
      JSR     sub_BANK3_B0E8

      LDA     #%00000110
      STA     EnemyArray_46E,X
      LDA     #$02
      STA     byte_RAM_71FE
      LDA     CrystalAndHawkmouthOpenSize
      BEQ     locret_BANK3_B05F

      CMP     #$01
      BNE     loc_BANK3_B01C

      STA     EnemyArray_480,X
      LDA     #$90
      STA     EnemyTimer,X
      LDA     #$40
      STA     EnemyArray_438,X
      STA     EnemyArray_45C,X
      STA     CrystalAndHawkmouthOpenSize

loc_BANK3_B01C:
      LDA     EnemyArray_480,X
      CMP     #$02
      BCC     loc_BANK3_B09B

      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_B03B

      INC     EnemyArray_480,X
      LDA     EnemyArray_480,X
      CMP     #$31
      BNE     HawkmouthEat

      LDA     EnemyArray_453,X
      BNE     loc_BANK3_B03B

      INC     EnemyArray_B1,X
      JSR     sub_BANK3_B095

loc_BANK3_B03B:
      DEC     EnemyArray_480,X
      LDY     EnemyArray_480,X
      DEY
      BNE     HawkmouthEat

      DEC     EnemyArray_B1,X
      LDA     PlayerState
      CMP     #PlayerState_HawkmouthEating
      BNE     HawkmouthEat

      LDA     #TransitionType_Door
      STA     TransitionType
      JSR     DoAreaReset

      LDA     #$09
      STA     PlayerXHi
      INC     DoAreaTransition
      PLA
      PLA
      PLA
      PLA

locret_BANK3_B05F:
      RTS

; ---------------------------------------------------------------------------

HawkmouthEat:
      LDA     EnemyArray_480,X ; Hawkmouth code?
      CMP     #$30
      BNE     locret_BANK3_B09A

      LDA     EnemyCollision,X ; make sure the player is inside Hawkmouth
      AND     #CollisionFlags_PlayerInsideMaybe
      BEQ     locret_BANK3_B09A

      LDA     HoldingItem ; make sure player is not holding something
      BNE     locret_BANK3_B09A

      STA     PlayerCollision ; start eating player
      INC     EnemyArray_B1,X
      INC     HawkmouthClosing
      DEC     EnemyArray_480,X
      LDA     ObjectXLo,X
      STA     PlayerXLo
      LDA     ObjectXHi,X
      STA     PlayerXHi
      LDA     ObjectYLo,X
      ADC     #$10
      STA     PlayerYLo
      LDA     #PlayerState_HawkmouthEating
      STA     PlayerState
      LDA     #$60
      STA     PlayerStateTimer
      LDA     #$FC
      STA     PlayerYVelocity

; =============== S U B R O U T I N E =======================================

sub_BANK3_B095:
      LDA     #SoundEffect1_HawkOpen_WartBarf
      STA     SoundEffectQueue1

locret_BANK3_B09A:
      RTS

; End of function sub_BANK3_B095

; ---------------------------------------------------------------------------

loc_BANK3_B09B:
      LDA     #%00000011
      STA     EnemyArray_46E,X
      LDA     #$00
      STA     byte_RAM_71FE
      LDA     EnemyHP,X
      BNE     loc_BANK3_B0BA

      LDA     #$03 ; Hawkmouth Boss health?
      STA     EnemyHP,X
      JSR     sub_BANK3_B095

      INC     EnemyArray_480,X
      LDA     #$FF
      STA     EnemyArray_453,X

loc_BANK3_B0BA:
      LDA     byte_RAM_10
      LSR     A
      BCC     loc_BANK3_B0E3

      LDA     EnemyVariable,X
      AND     #$01
      TAY
      LDA     ObjectYVelocity,X
      CLC
      ADC     byte_BANK3_AFF0,Y
      STA     ObjectYVelocity,X
      CMP     byte_BANK3_AFF2,Y
      BNE     loc_BANK3_B0D3

      INC     EnemyVariable,X

loc_BANK3_B0D3:
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     ObjectXVelocity,X
      CMP     byte_BANK3_AFEE,Y
      BEQ     loc_BANK3_B0E3

      CLC
      ADC     byte_BANK3_AFEC,Y
      STA     ObjectXVelocity,X

loc_BANK3_B0E3:
      JMP     sub_BANK2_9430

; ---------------------------------------------------------------------------
byte_BANK3_B0E6:
      .BYTE $F8
      .BYTE $10

; =============== S U B R O U T I N E =======================================

sub_BANK3_B0E8:
      LDA     EnemyArray_480,X
      JSR     sub_BANK2_8E13

      LDA     CrystalAndHawkmouthOpenSize
      BEQ     loc_BANK3_B16D

      LDA     byte_RAM_EE
      AND     #$C
      BNE     loc_BANK3_B16D

      LDA     EnemyTimer,X
      STA     byte_RAM_7
      JSR     loc_BANKF_FAFE

      LDX     byte_RAM_2
      LDA     SpriteTempScreenX
      CLC
      ADC     byte_BANK3_B0E6-1,X
      PHA
      PHP
      DEX
      BEQ     loc_BANK3_B112

      PLA
      EOR     #$01
      PHA

loc_BANK3_B112:
      PLP
      PLA
      BCC     loc_BANK3_B16D

      STA     SpriteDMAArea+3,Y
      STA     SpriteDMAArea+7,Y
      STA     SpriteDMAArea+$B,Y
      STA     SpriteDMAArea+$F,Y
      LDX     byte_RAM_4BD
      BEQ     loc_BANK3_B129

      LDX     #$10

loc_BANK3_B129:
      LDA     SpriteDMAArea,X
      STA     SpriteDMAArea,Y
      CLC
      ADC     #$10
      STA     SpriteDMAArea+4,Y
      LDA     byte_RAM_7
      BEQ     loc_BANK3_B13B

      LDA     #$20

loc_BANK3_B13B:
      ORA     SpriteDMAArea+2,X
      STA     SpriteDMAArea+2,Y
      STA     SpriteDMAArea+6,Y
      STA     SpriteDMAArea+$A,Y
      STA     SpriteDMAArea+$E,Y
IFDEF COMPATIBILITY
      .db $ae, $f4, $00 ; LDX $00F4
ENDIF
IFNDEF COMPATIBILITY
      LDX     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     SpriteDMAArea,X
      STA     SpriteDMAArea+8,Y
      CLC
      ADC     #$10
      STA     SpriteDMAArea+$C,Y
      LDA     #$F0
      STA     SpriteDMAArea+1,Y
      LDA     #$F2
      STA     SpriteDMAArea+5,Y
      LDA     #$F4
      STA     SpriteDMAArea+9,Y
      LDA     #$F6
      STA     SpriteDMAArea+$D,Y

loc_BANK3_B16D:
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK3_B0E8

; ---------------------------------------------------------------------------
; used by vegetable thrower
byte_BANK3_B170:
      .BYTE $08
      .BYTE $28
      .BYTE $48
      .BYTE $28
byte_BANK3_B174:
      .BYTE $94
      .BYTE $84
      .BYTE $94
      .BYTE $84
unk_BANK3_B178:
      .BYTE $F8
      .BYTE $08
      .BYTE $F8
      .BYTE $08
      .BYTE $08
      .BYTE $F8
      .BYTE $08
      .BYTE $F8
; ---------------------------------------------------------------------------

Generator_VegetableThrower:
      LDA     HoldingItem
      BNE     locret_BANK3_B1CC

      LDA     byte_RAM_10
      AND     #$FF
      BNE     locret_BANK3_B1CC

      INC     byte_RAM_4F9
      JSR     CreateEnemy_TryAllSlots

      BMI     locret_BANK3_B1CC

      LDX     byte_RAM_0
      LDA     byte_RAM_4F9
      AND     #$07
      TAY
      LDA     unk_BANK3_B178,Y
      STA     ObjectXVelocity,X
      TYA
      AND     #$03
      TAY
      LDA     #$02
      STA     ObjectXHi,X
      LDA     byte_BANK3_B170,Y
      STA     ObjectXLo,X
      LDA     byte_BANK3_B174,Y
      STA     ObjectYLo,X
      LDA     #$00
      STA     ObjectYHi,X
      LDA     PseudoRNGValues+2
      AND     #$03
      CMP     #$02
      BCC     loc_BANK3_B1C1

      ASL     A
      STA     EnemyArray_B1,X

loc_BANK3_B1C1:
      LDY     #Enemy_VegetableLarge
      STY     ObjectType,X
      JSR     SetEnemyAttributes

      LDA     #$D0
      STA     ObjectYVelocity,X

locret_BANK3_B1CC:
      RTS

; ---------------------------------------------------------------------------

EnemyInit_Wart:
      JSR     EnemyInit_Basic

      LDA     #$06
      STA     EnemyHP,X
      LDA     ObjectXHi,X
      STA     unk_RAM_4EF,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK3_B1DB:
      .BYTE $E0
      .BYTE $F0
      .BYTE $E8
      .BYTE $E4
; ---------------------------------------------------------------------------

EnemyBehavior_Wart:
      LDA     EnemyArray_B1,X
      BNE     EnemyBehavior_Wart_Death

      LDA     EnemyHP,X
      BNE     loc_BANK3_B1F0

      LDA     #$80
      STA     EnemyTimer,X
      STA     EnemyArray_B1,X
      BNE     EnemyBehavior_Wart_Exit

loc_BANK3_B1F0:
      INC     EnemyVariable,X
      LDA     byte_RAM_10
      AND     #$FF
      BNE     loc_BANK3_B1FF

      LDA     #$5F
      STA     EnemyTimer,X
      INC     EnemyArray_480,X

loc_BANK3_B1FF:
      LDA     #$00
      STA     ObjectXVelocity,X
      LDA     EnemyVariable,X
      AND     #$40
      BEQ     loc_BANK3_B216

      INC     EnemyArray_477,X
      LDA     #$F8
      LDY     EnemyVariable,X
      BPL     loc_BANK3_B214

      LDA     #$08

loc_BANK3_B214:
      STA     ObjectXVelocity,X

loc_BANK3_B216:
      JSR     ApplyObjectPhysicsX

      LDA     EnemyArray_45C,X
      BNE     EnemyBehavior_Wart_Exit

      LDA     EnemyTimer,X
      BEQ     EnemyBehavior_Wart_Exit

      AND     #$0F
      BNE     EnemyBehavior_Wart_Exit

      JSR     CreateEnemy

      BMI     EnemyBehavior_Wart_Exit

      LDA     #SoundEffect1_HawkOpen_WartBarf
      STA     SoundEffectQueue1
      LDA     EnemyArray_480,X
      AND     #$03
      TAY
      LDA     EnemyTimer,X
      LDX     byte_RAM_0
      LSR     A
      EOR     #$FF
      STA     ObjectXVelocity,X
      LDA     byte_BANK3_B1DB,Y
      STA     ObjectYVelocity,X
      LDA     #Enemy_WartBubble
      STA     ObjectType,X
      LDA     ObjectYLo,X
      ADC     #$08
      STA     ObjectYLo,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

EnemyBehavior_Wart_Exit:
      JMP     RenderSprite


EnemyBehavior_Wart_Death:
      LDA     EnemyTimer,X
      BEQ     loc_BANK3_B269

      STA     EnemyArray_45C,X
      INC     EnemyArray_477,X
      INC     EnemyArray_477,X
      LDA     #$F0
      STA     ObjectYVelocity,X
      BNE     EnemyBehavior_Wart_Death_Exit

loc_BANK3_B269:
      LDA     #$04
      STA     ObjectXVelocity,X
      JSR     ApplyObjectPhysicsX

      JSR     ApplyObjectPhysicsY

      LDA     byte_RAM_10
      LSR     A
      BCS     loc_BANK3_B295

      INC     ObjectYVelocity,X
      BMI     loc_BANK3_B295

      LDA     byte_RAM_10
      AND     #$1F
      BNE     loc_BANK3_B295

      LDA     #DPCM_BossDeath
      STA     DPCMQueue
      JSR     CreateEnemy

      LDX     byte_RAM_0
      LDA     ObjectYLo,X
      ADC     #$08
      STA     ObjectYLo,X
      JSR     TurnIntoPuffOfSmoke

loc_BANK3_B295:
      LDA     ObjectYLo,X
      CMP     #$D0
      BCC     EnemyBehavior_Wart_Death_Exit

      LDA     #EnemyState_Dead
      STA     EnemyState,X

EnemyBehavior_Wart_Death_Exit:
      JMP     RenderSprite


EnemyBehavior_WartBubble:
      INC     ObjectAnimationTimer,X
      JSR     ApplyObjectPhysicsX

      JSR     ApplyObjectPhysicsY

      INC     ObjectYVelocity,X
      JMP     RenderSprite

; ---------------------------------------------------------------------------

locret_BANK3_B2AF:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B2B0:
IFDEF COMPATIBILITY
      .db $ad, $f4, $00 ; LDA $00F4
ENDIF
IFNDEF COMPATIBILITY
      LDA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      STA     byte_RAM_7267
      STA     byte_RAM_726B
      LDA     byte_RAM_10
      AND     #$03
      STA     byte_RAM_7
      TAY
      LDA     unk_RAM_7265,Y
IFDEF COMPATIBILITY
      .db $8d, $f4, $00 ; STA $00F4
ENDIF
IFNDEF COMPATIBILITY
      STA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     byte_RAM_EF
      BNE     locret_BANK3_B2AF

      LDY     EnemyHP,X
      BNE     loc_BANK3_B2D3

      LDA     #$4E
      STA     ObjectAttributes,X

loc_BANK3_B2D3:
      LDA     byte_RAM_EE
      PHA
      PHA
      LDY     #$AE
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_B2EC

      LDA     EnemyArray_45C,X
      BEQ     loc_BANK3_B2EF

      CMP     #$30
      BCS     loc_BANK3_B2EC

      AND     #$08
      BNE     loc_BANK3_B2EC

      LDY     #$9E

loc_BANK3_B2EC:
      TYA
      BNE     loc_BANK3_B2F7

loc_BANK3_B2EF:
      LDA     #$9E
      LDY     EnemyTimer,X
      BEQ     loc_BANK3_B2F7

      LDA     #$A2

loc_BANK3_B2F7:
      JSR     sub_BANK2_9BB3

      LDA     byte_RAM_0
      STA     SpriteTempScreenY
      LDY     byte_RAM_7
      LDA     unk_RAM_7266,Y
IFDEF COMPATIBILITY
      .db $8d, $f4, $00 ; STA $00F4
ENDIF
IFNDEF COMPATIBILITY
      STA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDY     #$A6
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_B320

      LDA     EnemyArray_45C,X
      BEQ     loc_BANK3_B31C

      CMP     #$30
      BCS     loc_BANK3_B320

      AND     #$08
      BNE     loc_BANK3_B320

      BEQ     loc_BANK3_B322

loc_BANK3_B31C:
      LDA     EnemyTimer,X
      BEQ     loc_BANK3_B322

loc_BANK3_B320:
      LDY     #$AA

loc_BANK3_B322:
      PLA
      STA     byte_RAM_EE
      TYA
      JSR     sub_BANK2_9BB3

      LDA     byte_RAM_0
      STA     SpriteTempScreenY
      LDY     byte_RAM_7
      LDA     byte_RAM_7267,Y
IFDEF COMPATIBILITY
      .db $8d, $f4, $00 ; STA $00F4
ENDIF
IFNDEF COMPATIBILITY
      STA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDY     #$BA
      LDA     ObjectXVelocity,X
      BEQ     loc_BANK3_B347

      LDY     #$B2
      LDA     EnemyArray_477,X
      AND     #$10
      BEQ     loc_BANK3_B347

      LDY     #$B6

loc_BANK3_B347:
      PLA
      STA     byte_RAM_EE
      TYA
      JSR     sub_BANK2_9BB3

      LDA     byte_RAM_EE
      BNE     loc_BANK3_B398

      LDY     byte_RAM_7
      LDX     byte_RAM_7267,Y
      LDA     unk_RAM_7268,Y
      TAY
      LDA     SpriteTempScreenX
      CLC
      ADC     #$20
      BCS     loc_BANK3_B398

      STA     SpriteDMAArea+3,Y
      STA     SpriteDMAArea+7,Y
      STA     SpriteDMAArea+$B,Y
      LDA     byte_RAM_0
      SBC     #$2F
      STA     SpriteDMAArea,Y
      ADC     #$0F
      STA     SpriteDMAArea+4,Y
      ADC     #$10
      STA     SpriteDMAArea+8,Y
      LDA     SpriteDMAArea+2,X
      STA     SpriteDMAArea+2,Y
      STA     SpriteDMAArea+6,Y
      STA     SpriteDMAArea+$A,Y
      LDA     #$19
      STA     SpriteDMAArea+1,Y
      LDA     #$1B
      STA     SpriteDMAArea+5,Y
      LDA     #$1D
      STA     SpriteDMAArea+9,Y

loc_BANK3_B398:
      LDX     byte_RAM_12
      RTS


IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $B39B - $B4DF
     .pad $B4E0, $FF
ENDIF


byte_BANK3_B4E0:
      .BYTE $F0
      .BYTE $10

; =============== S U B R O U T I N E =======================================

sub_BANK3_B4E2:
      JSR     sub_BANK3_B5AC

      TAY
      LDA     ObjectYVelocity-1,X
      BMI     loc_BANK3_B4EB

      INY

loc_BANK3_B4EB:
      JSR     sub_BANK3_BB5A

      BCS     loc_BANK3_B4F7

      LDA     byte_RAM_0
      CMP     #$82
      BEQ     loc_BANK3_B4F7

      CLC

loc_BANK3_B4F7:
      DEX
      RTS

; End of function sub_BANK3_B4E2

; =============== S U B R O U T I N E =======================================

sub_BANK3_B4F9:
      LDA     #$04
      BNE     loc_BANK3_B4FF

; End of function sub_BANK3_B4F9

; =============== S U B R O U T I N E =======================================

sub_BANK3_B4FD:
      LDA     #$00

loc_BANK3_B4FF:
      STA     byte_RAM_7
      LDA     #$00
      STA     byte_RAM_B
      STA     byte_RAM_E
      JSR     sub_BANK3_B5AC

      STA     byte_RAM_8
      LDA     ObjectYVelocity-1,X
      BPL     loc_BANK3_B519

      JSR     sub_BANK3_B58C

      INC     byte_RAM_7
      INC     byte_RAM_8
      BNE     loc_BANK3_B57B

loc_BANK3_B519:
      INC     byte_RAM_7
      INC     byte_RAM_8
      JSR     sub_BANK3_B58C

      LDA     ObjectType-1,X
      CMP     #Enemy_CobratJar
      BEQ     loc_BANK3_B540

      CMP     #Enemy_CobratSand
      BEQ     loc_BANK3_B540

      LDA     byte_RAM_0
      SEC
      SBC     #$8A
      CMP     #$02
      BCS     loc_BANK3_B540

      ASL     A
      ADC     #$01
      STA     ObjectYVelocity-1,X
      LDA     #EnemyState_7
      STA     EnemyState-1,X
      LDA     #$FF
      STA     EnemyTimer-1,X

loc_BANK3_B540:
      LDA     byte_RAM_0
      STA     byte_RAM_E
      SEC
      SBC     #$67
      CMP     #$02
      BCS     loc_BANK3_B57B

      LDY     unk_RAM_437,X
      BNE     loc_BANK3_B57B

      LDY     ObjectType-1,X
      CPY     #Enemy_VegetableSmall
      BCC     loc_BANK3_B56C

      TAY
      LDA     ObjectYVelocity-1,X
      CMP     #$03
      BCS     loc_BANK3_B57B

      LDA     byte_RAM_D
      AND     #$03
      BNE     loc_BANK3_B57B

      LDA     byte_BANK3_B4E0,Y
      STA     ObjectXVelocity-1,X
      STA     byte_RAM_B
      BNE     loc_BANK3_B57B

loc_BANK3_B56C:
      LDY     ObjectXVelocity-1,X
      BEQ     loc_BANK3_B579

      EOR     EnemyMovementDirection-1,X
      LSR     A
      BCS     loc_BANK3_B579

      DEC     ObjectAnimationTimer-1,X
      DEC     ObjectAnimationTimer-1,X

loc_BANK3_B579:
      INC     ObjectAnimationTimer-1,X

loc_BANK3_B57B:
      LDA     ObjectXVelocity-1,X
      CLC
      ADC     ObjectXAcceleration-1,X
      BMI     loc_BANK3_B587

      INC     byte_RAM_7
      INC     byte_RAM_8

loc_BANK3_B587:
      JSR     sub_BANK3_B58C

      DEX
      RTS

; End of function sub_BANK3_B4FD

; =============== S U B R O U T I N E =======================================

sub_BANK3_B58C:
      LDY     byte_RAM_8
      JSR     sub_BANK3_BB87

      LDY     byte_RAM_7
      LDA     byte_BANK3_B5BC,Y
      TAY
      LDA     byte_RAM_0
      JSR     sub_BANK3_BBE2

      BCC     loc_BANK3_B5A7

      LDY     byte_RAM_7
      LDA     byte_BANK3_B5C4,Y
      ORA     EnemyCollision-1,X
      STA     EnemyCollision-1,X

loc_BANK3_B5A7:
      INC     byte_RAM_7
      INC     byte_RAM_8
      RTS

; End of function sub_BANK3_B58C


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
sub_BANK3_B5AC:
      INX
      LDA     EnemyCollision-1,X
      STA     byte_RAM_D
      AND     #CollisionFlags_Disabled|CollisionFlags_PlayerOnTop|CollisionFlags_PlayerInsideMaybe|CollisionFlags_80
      STA     EnemyCollision-1,X
      LDY     EnemyArray_492-1,X
      LDA     byte_BANKF_F000,Y

locret_BANK3_B5BB:
      RTS


byte_BANK3_B5BC:
      .BYTE $02
      .BYTE $01
      .BYTE $02
      .BYTE $02
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00

byte_BANK3_B5C4:
      .BYTE $08
      .BYTE $04
      .BYTE $02
      .BYTE $01
      .BYTE $08
      .BYTE $04
      .BYTE $02
      .BYTE $01

; =============== S U B R O U T I N E =======================================

sub_BANK3_B5CC:
      LDA     #$00
      STA     ObjectXAcceleration,X
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left|CollisionFlags_Down|CollisionFlags_Up
      STA     EnemyCollision,X
      LDA     EnemyState,X
      CMP     #EnemyState_BombExploding
      BNE     loc_BANK3_B5E1

      LDY     #$06
      BNE     loc_BANK3_B5FF

loc_BANK3_B5E1:
      CMP     #$07
      BEQ     loc_BANK3_B5F8

      LDY     ObjectType,X
      CPY     #Enemy_Egg
      BEQ     loc_BANK3_B5F4

      CPY     #$1A
      BEQ     loc_BANK3_B5F4

      LDY     EnemyArray_42F,X
      BNE     loc_BANK3_B5F8

loc_BANK3_B5F4:
      CMP     #$01
      BNE     locret_BANK3_B5BB

loc_BANK3_B5F8:
      LDA     ObjectBeingCarriedTimer,X
      BNE     locret_BANK3_B5BB

      LDY     EnemyArray_489,X

loc_BANK3_B5FF:
      LDA     unk_RAM_7128,Y
      STA     byte_RAM_9
      LDA     #$00
      STA     byte_RAM_0
      LDA     unk_RAM_7100,Y
      BPL     loc_BANK3_B60F

      DEC     byte_RAM_0

loc_BANK3_B60F:
      CLC
      ADC     ObjectXLo,X
      STA     byte_RAM_5
      LDA     ObjectXHi,X
      ADC     byte_RAM_0
      STA     byte_RAM_1
      LDA     IsHorizontalLevel
      BNE     loc_BANK3_B620

      STA     byte_RAM_1

loc_BANK3_B620:
      LDA     unk_RAM_713C,Y
      STA     byte_RAM_B
      LDA     #$00
      STA     byte_RAM_0
      LDA     unk_RAM_7114,Y
      BPL     loc_BANK3_B630

      DEC     byte_RAM_0

loc_BANK3_B630:
      CLC
      ADC     ObjectYLo,X
      STA     byte_RAM_7
      LDA     ObjectYHi,X
      ADC     byte_RAM_0
      STA     byte_RAM_3

loc_BANK3_B63B:
      STX     byte_RAM_ED
      TXA
      BNE     loc_BANK3_B661

      LDA     byte_RAM_4C7
      ORA     PlayerLock
      BNE     loc_BANK3_B64E

      LDA     EnemyState-1,X
      CMP     #$02
      BCC     loc_BANK3_B651 ; branch if A < $02

loc_BANK3_B64E:
      JMP     loc_BANK3_B6F0

; ---------------------------------------------------------------------------

loc_BANK3_B651:
      LDY     byte_RAM_12
      LDA     EnemyArray_42F,Y
      BEQ     loc_BANK3_B65C

      CMP     #$20
      BCC     loc_BANK3_B64E

loc_BANK3_B65C:
      LDY     PlayerDucking
      JMP     loc_BANK3_B6A6

; ---------------------------------------------------------------------------

loc_BANK3_B661:
      LDY     byte_RAM_12
      LDA     EnemyState,Y
      CMP     #$04
      BEQ     loc_BANK3_B671

      LDA     EnemyArray_46E,Y
      AND     #%00000100
      BNE     loc_BANK3_B690

loc_BANK3_B671:
      LDA     EnemyState-1,X
      CMP     #EnemyState_BombExploding ; what does this mean for an enemy?
      BNE     loc_BANK3_B67B

      LDY     #$06
      BNE     loc_BANK3_B6A6

loc_BANK3_B67B:
      CMP     #$07
      BEQ     loc_BANK3_B692

      LDY     ObjectType-1,X
      CPY     #Enemy_Egg
      BEQ     loc_BANK3_B68E

      CPY     #$1A
      BEQ     loc_BANK3_B68E

      LDY     unk_RAM_42E,X
      BNE     loc_BANK3_B692

loc_BANK3_B68E:
      CMP     #$01

loc_BANK3_B690:
      BNE     loc_BANK3_B6F0

loc_BANK3_B692:
      LDA     ObjectBeingCarriedTimer-1,X
      BNE     loc_BANK3_B6F0

      LDA     EnemyCollision-1,X
      AND     #CollisionFlags_Disabled
      BNE     loc_BANK3_B6F0

      LDA     unk_RAM_46D,X
      AND     #$04
      BNE     loc_BANK3_B6F0

      LDY     EnemyArray_489-1,X

loc_BANK3_B6A6:
      LDA     unk_RAM_7128,Y
      STA     byte_RAM_A
      LDA     #$00
      STA     byte_RAM_0
      LDA     unk_RAM_7100,Y
      BPL     loc_BANK3_B6B6

      DEC     byte_RAM_0

loc_BANK3_B6B6:
      CLC
      ADC     ObjectXLo-1,X
      STA     byte_RAM_6
      LDA     ObjectXHi-1,X
      ADC     byte_RAM_0
      STA     byte_RAM_2
      LDA     IsHorizontalLevel
      BNE     loc_BANK3_B6C7

      STA     byte_RAM_2

loc_BANK3_B6C7:
      LDA     unk_RAM_713C,Y
      STA     byte_RAM_C
      LDA     #$00
      STA     byte_RAM_0
      LDA     unk_RAM_7114,Y
      BPL     loc_BANK3_B6D7

      DEC     byte_RAM_0

loc_BANK3_B6D7:
      CLC
      ADC     ObjectYLo-1,X
      STA     byte_RAM_8
      LDA     ObjectYHi-1,X
      ADC     byte_RAM_0
      STA     byte_RAM_4
      JSR     sub_BANK3_BDC5

      BCS     loc_BANK3_B6F0

      LDA     byte_RAM_B
      PHA
      JSR     EnemyCollisionBehavior

      PLA
      STA     byte_RAM_B

loc_BANK3_B6F0:
      DEX
      BMI     loc_BANK3_B6F6

      JMP     loc_BANK3_B63B

; ---------------------------------------------------------------------------

loc_BANK3_B6F6:
      LDX     byte_RAM_12

locret_BANK3_B6F8:
      RTS

; End of function sub_BANK3_B5CC

; =============== S U B R O U T I N E =======================================

EnemyCollisionBehavior:
      TXA
      BNE     EnemyCollisionBehavior_ReadCollisionType

      LDA     HoldingItem
      BEQ     EnemyCollisionBehavior_ReadCollisionType

      LDA     byte_RAM_42D
      CMP     byte_RAM_12
      BEQ     locret_BANK3_B6F8

EnemyCollisionBehavior_ReadCollisionType:
      LDY     byte_RAM_12
      LDA     ObjectType,Y
      TAY
      LDA     unk_RAM_71D1,Y
      JSR     JumpToTableAfterJump

      .WORD EnemyCollisionBehavior_Enemy
      .WORD EnemyCollisionBehavior_ProjectileItem
      .WORD EnemyCollisionBehavior_Object
      .WORD EnemyCollisionBehavior_POW
      .WORD EnemyCollisionBehavior_Door


EnemyCollisionBehavior_Door:
      TXA
      BNE     EnemyCollisionBehavior_Exit

      LDA     Player1JoypadPress
      AND     #ControllerInput_Up
      BEQ     EnemyCollisionBehavior_Exit

      LDA     PlayerCollision
      AND     #CollisionFlags_Down
      BEQ     EnemyCollisionBehavior_Exit

      LDA     byte_RAM_426
      CMP     #$FA
      BCS     EnemyCollisionBehavior_Exit

      LDA     byte_RAM_4BD
      ORA     SubspaceDoorTimer
      BNE     EnemyCollisionBehavior_Exit

      LDA     HoldingItem
      BEQ     loc_BANK3_B749

      LDY     byte_RAM_42D
      LDA     ObjectType,Y
      CMP     #Enemy_Key
      BNE     EnemyCollisionBehavior_Exit

loc_BANK3_B749:
      LDY     byte_RAM_12
      LDA     ObjectXLo,Y
      STA     PlayerXLo
      LDA     ObjectXHi,Y
      STA     PlayerXHi
      JSR     StashPlayerPosition

      LDA     #TransitionType_SubSpace
      STA     TransitionType
      JMP     loc_BANK3_BBF4

EnemyCollisionBehavior_Exit:
      RTS


EnemyCollisionBehavior_Enemy:
      LDY     byte_RAM_12
      TXA
      BEQ     CheckCollisionWithPlayer

      LDA     EnemyArray_45C,Y
      ORA     EnemyArray_45C-1,X
      BNE     EnemyCollisionBehavior_Exit

      LDA     EnemyArray_42F,Y
      BNE     loc_BANK3_B792

      LDA     EnemyState,Y
      CMP     #EnemyState_BombExploding
      BEQ     loc_BANK3_B792

      TXA
      TAY
      DEY
      LDX     byte_RAM_12
      INX
      LDA     EnemyState,Y
      CMP     #EnemyState_BombExploding
      BEQ     loc_BANK3_B792

      LDA     EnemyArray_42F,Y
      BEQ     loc_BANK3_B7E0

      LDA     EnemyCollision-1,X
      AND     #CollisionFlags_Disabled
      BNE     loc_BANK3_B7E0

loc_BANK3_B792:
      LDA     EnemyArray_453,Y
      ORA     EnemyArray_45C,Y
      BNE     loc_BANK3_B7D7

      LDA     EnemyArray_46E,Y
      AND     #%00001000
      BEQ     loc_BANK3_B7A4

      JSR     PlayBossHurtSound

loc_BANK3_B7A4:
      LDA     EnemyHP,Y
      SEC
      SBC     #$01
      STA     EnemyHP,Y
      BMI     loc_BANK3_B7BD

      JSR     PlayBossHurtSound

      LDA     #$21
      STA     EnemyArray_45C,Y
      LSR     A
      STA     EnemyArray_438,Y
      BNE     loc_BANK3_B7D7

loc_BANK3_B7BD:
      LDA     EnemyCollision,Y
      ORA     #CollisionFlags_Disabled
      STA     EnemyCollision,Y
      LDA     #$E0
      STA     ObjectYVelocity,Y
      LDA     ObjectXVelocity,Y
      STA     byte_RAM_0
      ASL     A
      ROR     byte_RAM_0
      LDA     byte_RAM_0
      STA     ObjectXVelocity,Y

loc_BANK3_B7D7:
      LDA     ObjectType-1,X
      CMP     #Enemy_VegetableSmall
      BCS     loc_BANK3_B7E0

      JSR     sub_BANK3_BA5D

loc_BANK3_B7E0:
      LDX     byte_RAM_ED
      RTS

; ---------------------------------------------------------------------------
InvincibilityKill_VelocityX:
      .BYTE $F8 ; to the left
      .BYTE $08 ; to the right
; ---------------------------------------------------------------------------

CheckCollisionWithPlayer:
      LDA     byte_RAM_EE
      AND     #CollisionFlags_Up
      BNE     CheckCollisionWithPlayer_Exit

      ; check if it's a heart
      LDA     ObjectType,Y
      BNE     CheckCollisionWithPlayer_NotHeart

      ; accept the heart into your life
      STA     EnemyState,Y
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffectQueue1
      LDY     PlayerMaxHealth
      LDA     PlayerHealth
      CLC
      ADC     #$10
      STA     PlayerHealth
      CMP     PlayerHealthValueByHeartCount,Y
      BCC     CheckCollisionWithPlayer_Exit

      JMP     RestorePlayerToFullHealth

; ---------------------------------------------------------------------------

CheckCollisionWithPlayer_NotHeart:
      CMP     #Enemy_Phanto
      BNE     CheckCollisionWithPlayer_NotPhanto

      LDY     PhantoActivateTimer
      BNE     CheckCollisionWithPlayer_Exit

CheckCollisionWithPlayer_NotPhanto:
      CMP     #Enemy_Starman
      BNE     CheckCollisionWithPlayer_NotStarman

      LDA     #$3F
      STA     StarInvincibilityTimer
      LDA     #Music1_Invincible
      STA     MusicQueue1
      LDA     #EnemyState_Inactive
      STA     EnemyState,Y

CheckCollisionWithPlayer_Exit:
      RTS

; ---------------------------------------------------------------------------

CheckCollisionWithPlayer_NotStarman:
      CMP     #Enemy_WhaleSpout
      BNE     CheckCollisionWithPlayer_NotWhaleSpout

      LDA     EnemyVariable,Y
      CMP     #$DC
      BCS     CheckCollisionWithPlayer_Exit2

      LDA     StarInvincibilityTimer
      BEQ     CheckCollisionWithPlayer_NotInvincible

      LDA     #$DC
      STA     EnemyVariable,Y
      LDA     #$00
      STA     ObjectYVelocity,Y

CheckCollisionWithPlayer_Exit2:
      RTS

; ---------------------------------------------------------------------------

CheckCollisionWithPlayer_NotWhaleSpout:
      CMP     #Enemy_Wart
      BNE     CheckCollisionWithPlayer_NotWart

      LDA     EnemyArray_B1,X
      BNE     CheckCollisionWithPlayer_Exit2

CheckCollisionWithPlayer_NotWart:
      LDY     StarInvincibilityTimer
      BEQ     CheckCollisionWithPlayer_NotInvincible

      ; player is invincible
      LDX     byte_RAM_12
      CMP     #Enemy_AutobombFire
      BEQ     CheckCollisionWithPlayer_Poof

      CMP     #Enemy_Fireball
      BNE     CheckCollisionWithPlayer_KillEnemy

; turn into a puff of smoke
CheckCollisionWithPlayer_Poof:
      LDA     #%00000000
      STA     EnemyArray_46E,X
      JSR     EnemyBehavior_Shell_Destroy

      JMP     loc_BANK3_B878

; ---------------------------------------------------------------------------

; die and fall off
CheckCollisionWithPlayer_KillEnemy:
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     InvincibilityKill_VelocityX,Y
      STA     ObjectXVelocity,X
      LDA     #$E0
      STA     ObjectYVelocity,X
      LDA     EnemyCollision,X
      ORA     #CollisionFlags_Disabled
      STA     EnemyCollision,X

loc_BANK3_B878:
      LDX     byte_RAM_ED
      LDY     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

CheckCollisionWithPlayer_NotInvincible:
      LDY     byte_RAM_12
      LDA     EnemyState,Y
      CMP     #EnemyState_BombExploding
      BEQ     CheckCollisionWithPlayer_HurtPlayer

      ; should we damage the player for jumping on top?
      LDA     EnemyArray_46E,Y
      AND     #%00000001
      BNE     CheckCollisionWithPlayer_HurtPlayer

      ; let player land on top
      JSR     DetermineCollisionFlags

      LDA     byte_RAM_F
      AND     #$0B
      BEQ     CheckCollisionWithPlayer_StandingOnHead

CheckCollisionWithPlayer_HurtPlayer:
      JMP     DamagePlayer


CheckCollisionWithPlayer_StandingOnHead:
      LDA     #$00
      STA     PlayerInAir
      LDX     byte_RAM_12
      LDA     EnemyCollision,X
      ORA     #CollisionFlags_PlayerOnTop
      STA     EnemyCollision,X

      ; can you even lift
      LDA     EnemyArray_46E,X
      AND     #%00000010
      BNE     CheckCollisionWithPlayer_NoLift

      ; check B button
      BIT     Player1JoypadPress
      BVC     CheckCollisionWithPlayer_NoLift

      ; bail if we already have an item or are ducking
      LDA     HoldingItem
      ORA     PlayerDucking
      BNE     CheckCollisionWithPlayer_NoLift

      STA     EnemyCollision,X
      STX     byte_RAM_42D
      STA     ObjectShakeTimer,X
      LDA     #$07
      STA     ObjectBeingCarriedTimer,X
      JSR     SetPlayerStateLifting

      ; leave a flying carpet behind if we're picking up pidgit
      LDA     ObjectType,X
      CMP     #Enemy_Pidgit
      BNE     CheckCollisionWithPlayer_NoLift

      JSR     CreateFlyingCarpet

CheckCollisionWithPlayer_NoLift:
      LDX     byte_RAM_ED
      RTS

; End of function CheckCollisionWithPlayer_StandingOnHead

; ---------------------------------------------------------------------------

EnemyCollisionBehavior_Object:
      LDY     byte_RAM_12
      TXA
      BEQ     loc_BANK3_B905

      LDA     ObjectType,Y
      CMP     #Enemy_Key
      BNE     loc_BANK3_B8E4

      LDA     EnemyCollision,Y
      AND     #CollisionFlags_Down
      BNE     locret_BANK3_B902

loc_BANK3_B8E4:
      LDA     EnemyArray_42F,Y
      BNE     loc_BANK3_B8FF

      JSR     DetermineCollisionFlags

      LDA     byte_RAM_F
      AND     EnemyMovementDirection-1,X
      BEQ     loc_BANK3_B8F8

      DEX
      JSR     EnemyBehavior_TurnAround

      LDX     byte_RAM_ED

loc_BANK3_B8F8:
      JSR     sub_BANK3_BB31

      CPY     #$00
      BEQ     locret_BANK3_B902

loc_BANK3_B8FF:
      JMP     loc_BANK3_B9EA

; ---------------------------------------------------------------------------

locret_BANK3_B902:
      RTS

; ---------------------------------------------------------------------------
unk_BANK3_B903:
      .BYTE $08
      .BYTE $04
; ---------------------------------------------------------------------------

; collision with items that the player can stand on
loc_BANK3_B905:
      LDA     EnemyCollision,Y
      ORA     #CollisionFlags_PlayerInsideMaybe
      STA     EnemyCollision,Y
      JSR     DetermineCollisionFlags

      LDA     byte_RAM_F
      AND     PlayerMovementDirection
      BEQ     loc_BANK3_B919

      JSR     PlayerHorizontalCollision

loc_BANK3_B919:
      LDA     byte_RAM_F
      AND     #$04
      BEQ     loc_BANK3_B922

      JSR     CheckCollisionWithPlayer_StandingOnHead

loc_BANK3_B922:
      JSR     sub_BANK3_BB31

      CPY     #$01
      BNE     locret_BANK3_B955

      LDY     byte_RAM_12
      LDA     ObjectYVelocity,Y
      BEQ     locret_BANK3_B955

      AND     #$80
      ASL     A
      ROL     A
      TAY
      LDA     byte_RAM_F
      AND     unk_BANK3_B903,Y
      BEQ     locret_BANK3_B955

      LDY     byte_RAM_12
      LDA     ObjectYVelocity,Y
      EOR     #$FF
      CLC
      ADC     #$01
      STA     ObjectYVelocity,Y
      LDA     #$01
      STA     PlayerDucking
      LDA     #$04
      STA     PlayerAnimationFrame
      LDA     #$10
      STA     PlayerStateTimer

locret_BANK3_B955:
      RTS

EnemyCollisionBehavior_POW:
      TXA
      BEQ     locret_BANK3_B955
      JMP     loc_BANK3_B9EA

EnemyCollisionBehavior_ProjectileItem:
      LDY     byte_RAM_12
      TXA

loc_BANK3_B95F:
      BNE     loc_BANK3_B993

      LDA     EnemyState,Y

loc_BANK3_B964:
      CMP     #$04
      BNE     loc_BANK3_B96E

      LDA     StarInvincibilityTimer
      BEQ     loc_BANK3_B990

locret_BANK3_B96D:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B96E:
      JSR     DetermineCollisionFlags

      LDA     byte_RAM_F
      AND     #$08
      BEQ     loc_BANK3_B987

      LDA     HoldingItem
      BNE     locret_BANK3_B96D

      LDY     byte_RAM_12
      STY     byte_RAM_42D
      LDA     #$01
      STA     ObjectBeingCarriedTimer,Y
      INC     HoldingItem

loc_BANK3_B987:
      LDA     byte_RAM_F
      AND     #$04
      BEQ     locret_BANK3_B96D

      JMP     CheckCollisionWithPlayer_StandingOnHead

; ---------------------------------------------------------------------------

loc_BANK3_B990:
      JMP     DamagePlayer

; ---------------------------------------------------------------------------

loc_BANK3_B993:
      LDA     ObjectType-1,X
      CMP     #Enemy_Wart
      BNE     loc_BANK3_B9B7

      LDA     EnemyTimer-1,X
      BEQ     locret_BANK3_B9F9

      LDA     #$00
      STA     EnemyState,Y
      JSR     sub_BANK3_BA5D

      LDA     #$60
      STA     EnemyArray_45C-1,X
      LSR     A
      STA     unk_RAM_437,X
      LDA     unk_RAM_464,X
      BNE     locret_BANK3_B9B6

      INC     ScrollXLock

locret_BANK3_B9B6:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B9B7:
      CMP     #$32
      BCS     locret_BANK3_B9B6

      CMP     #$11
      BNE     loc_BANK3_B9CA

      LDA     #$05
      STA     EnemyState,Y
      LDA     #$1E
      STA     EnemyTimer,Y
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B9CA:
      LDA     EnemyState,Y
      CMP     #$04
      BEQ     loc_BANK3_B9EC

      LDA     ObjectType,Y
      CMP     #Enemy_Shell
      BEQ     loc_BANK3_B9EA

      LDA     #$E8
      STA     ObjectYVelocity,Y
      STX     byte_RAM_0
      LDX     ObjectXVelocity,Y
      BMI     loc_BANK3_B9E5

      LDA     #$18

loc_BANK3_B9E5:
      STA     ObjectXVelocity,Y
      LDX     byte_RAM_0

loc_BANK3_B9EA:
      LDY     byte_RAM_12

loc_BANK3_B9EC:
      JSR     sub_BANK3_BA5D

      BNE     locret_BANK3_B9F9

      LDA     ObjectXVelocity-1,X
      ASL     A
      ROR     ObjectXVelocity-1,X
      ASL     A
      ROR     ObjectXVelocity-1,X

locret_BANK3_B9F9:
      RTS

; ---------------------------------------------------------------------------

DamagePlayer:
      LDA     DamageInvulnTime
      BNE     locret_BANK3_BA31

      LDA     PlayerHealth
      SEC
      SBC     #$10
      BCC     loc_BANK3_BA32

      STA     PlayerHealth
      LDY     #$7F
      STY     DamageInvulnTime
      LDY     #$00
      STY     PlayerYVelocity
      STY     PlayerXVelocity
      CMP     #$10
      BCC     loc_BANK3_BA2C

      LDA     PlayerScreenX
      SEC
      SBC     SpriteTempScreenX
      ASL     A
      ASL     A
      STA     PlayerXVelocity
      LDA     #$C0
      LDY     PlayerYVelocity
      BPL     loc_BANK3_BA2A

      LDA     #$00

loc_BANK3_BA2A:
      STA     PlayerYVelocity

loc_BANK3_BA2C:
      LDA     #DPCM_PlayerHurt
      STA     DPCMQueue

locret_BANK3_BA31:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_BA32:
      TXA

loc_BANK3_BA33:
      PHA
      LDX     byte_RAM_12
      LDA     ObjectType,X
      CMP     #Enemy_BeezoDiving
      BCS     loc_BANK3_BA48

      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      TYA
      CMP     EnemyMovementDirection,X
      BEQ     loc_BANK3_BA48

      JSR     EnemyBehavior_TurnAround

loc_BANK3_BA48:
      PLA
      TAX
      LDA     #$C0
      STA     PlayerYVelocity

loc_BANK3_BA4E:
      LDA     #$20
      STA     PlayerStateTimer
      LDY     byte_RAM_12
      BMI     loc_BANK3_BA5A

      LSR     A
      STA     EnemyArray_438,Y

loc_BANK3_BA5A:
      JMP     KillPlayer

; =============== S U B R O U T I N E =======================================

; Damage enemy
sub_BANK3_BA5D:
      LDA     EnemyArray_453-1,X
      ORA     EnemyArray_45C-1,X
      BNE     locret_BANK3_BA94

      LDA     unk_RAM_46D,X
      AND     #Enemy_Ostro
      BEQ     EnemyTakeDamage

      JSR     PlayBossHurtSound

EnemyTakeDamage:
      DEC     unk_RAM_464,X ; Subtract hit point
      BMI     EnemyKnockout

      LDA     #$21 ; Flash
      STA     EnemyArray_45C-1,X
      LSR     A

loc_BANK3_BA7A:
      STA     unk_RAM_437,X

; End of function sub_BANK3_BA5D

PlayBossHurtSound:
      LDA     #DPCM_BossHurt
      STA     DPCMQueue
      RTS

; ---------------------------------------------------------------------------

EnemyKnockout:
      LDA     EnemyCollision-1,X
      ORA     #CollisionFlags_Disabled
      STA     EnemyCollision-1,X
      LDA     #$E0
      STA     ObjectYVelocity-1,X
      LDA     ObjectXVelocity,Y
      STA     ObjectXVelocity-1,X
      LDA     #$00

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
      LDA     #$00
      STA     byte_RAM_F
      LDY     byte_RAM_12 ; stash Y
      LDA     byte_RAM_427
      CMP     #$F6
      BCS     DetermineCollisionFlags_Y

      LDA     ObjectXLo,Y
      LDY     #CollisionFlags_Left
      CMP     ObjectXLo-1,X
      BMI     DetermineCollisionFlags_SetFlagsX

      LDY     #CollisionFlags_Right

DetermineCollisionFlags_SetFlagsX:
      STY     byte_RAM_F
      TYA
      AND     EnemyMovementDirection-1,X
      BEQ     DetermineCollisionFlags_ExitX

      LDY     byte_RAM_12 ; restore Y
      LDA     unk_RAM_4A4,Y
      BNE     DetermineCollisionFlags_ExitX

      ; @TODO: Looks like a way to make objects move together horizontally
      LDA     ObjectXVelocity,Y
      STA     ObjectXAcceleration-1,X

DetermineCollisionFlags_ExitX:
      RTS


DetermineCollisionFlags_Y:
      LDA     ObjectYLo,Y
      CPX     #$01
      BCS     loc_BANK3_BAD1

      PHA
      LDY     PlayerDucking
      PLA
      SEC
      SBC     byte_BANK3_BB2F,Y

loc_BANK3_BAD1:
      CMP     ObjectYLo-1,X
      BMI     loc_BANK3_BB02

      LDA     ObjectYVelocity-1,X
      BMI     DetermineCollisionFlags_ExitY

      LDY     byte_RAM_12
      LDA     unk_RAM_4A4,Y
      BNE     loc_BANK3_BAE6

      LDA     ObjectXVelocity,Y
      STA     ObjectXAcceleration-1,X

loc_BANK3_BAE6:
      LDY     #$00
      INC     byte_RAM_427
      INC     byte_RAM_427
      BPL     loc_BANK3_BAF1

      DEY

loc_BANK3_BAF1:
      LDA     byte_RAM_427
      CLC
      ADC     ObjectYLo-1,X
      STA     ObjectYLo-1,X
      TYA
      ADC     ObjectYHi-1,X
      STA     ObjectYHi-1,X
      LDY     #CollisionFlags_Down
      BNE     loc_BANK3_BB13

loc_BANK3_BB02:
      LDA     ObjectYVelocity-1,X
      BEQ     loc_BANK3_BB11

      BPL     DetermineCollisionFlags_ExitY

      LDY     byte_RAM_12
      LDA     ObjectType,Y
      CMP     #Enemy_Coin
      BEQ     DetermineCollisionFlags_ExitY

loc_BANK3_BB11:
      LDY     #CollisionFlags_Up

loc_BANK3_BB13:
      STY     byte_RAM_F
      LDY     byte_RAM_12
      LDA     unk_RAM_4A4,Y
      BNE     loc_BANK3_BB22

      ; @TODO: Looks like a way to make objects move together vertically
      LDA     ObjectYVelocity,Y
      STA     ObjectYAcceleration-1,X

loc_BANK3_BB22:
      LDA     #$00
      STA     ObjectYVelocity-1,X
      LDA     ObjectYSubpixel,Y
      STA     ObjectYSubpixel-1,X
      INC     ObjectAnimationTimer-1,X

DetermineCollisionFlags_ExitY:
      RTS


byte_BANK3_BB2F:
      .BYTE $0B
      .BYTE $10

; =============== S U B R O U T I N E =======================================

sub_BANK3_BB31:
      LDY     #$00
      LDA     EnemyCollision-1,X
      ORA     byte_RAM_F
      AND     #$0C
      CMP     #$0C
      BEQ     loc_BANK3_BB48

      LDA     EnemyCollision-1,X
      ORA     byte_RAM_F
      AND     #CollisionFlags_Right|CollisionFlags_Left
      CMP     #CollisionFlags_Right|CollisionFlags_Left
      BNE     locret_BANK3_BB49

      INY

loc_BANK3_BB48:
      INY

locret_BANK3_BB49:
      RTS

; End of function sub_BANK3_BB31

; ---------------------------------------------------------------------------
_unused_BANK3_BB4A:
      .BYTE $FF ; May not be used, but wasn't marked as data
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF

byte_BANK3_BB50:
      .BYTE $C2
      .BYTE $D4
      .BYTE $C3
      .BYTE $C4
      .BYTE $07
      .BYTE $80
      .BYTE $81
      .BYTE $94
      .BYTE $95
      .BYTE $17

; =============== S U B R O U T I N E =======================================

sub_BANK3_BB5A:
      JSR     sub_BANK3_BB87

      LDA     byte_RAM_0

      LDY     #$09
loc_BANK3_BB61:
      CMP     byte_BANK3_BB50,Y
      BEQ     locret_BANK3_BB6A
      DEY
      BPL     loc_BANK3_BB61

      CLC

locret_BANK3_BB6A:
      RTS


ItemCarryYOffsets:
      .BYTE $F9
      .BYTE $FF
      .BYTE $00
      .BYTE $08
      .BYTE $0C
      .BYTE $18
      .BYTE $1A
      .BYTE $01
      .BYTE $06
      .BYTE $0A
      .BYTE $0C
      .BYTE $18
      .BYTE $1A
      .BYTE $1C
      .BYTE $FF
      .BYTE $FF
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00


; =============== S U B R O U T I N E =======================================

sub_BANK3_BB87:
      TXA
      PHA

      LDA     #$00
      STA     byte_RAM_0
      STA     byte_RAM_1
      LDA     byte_BANKF_F011,Y
      BPL     loc_BANK3_BB96

      DEC     byte_RAM_0

loc_BANK3_BB96:
      CLC
      ADC     ObjectXLo-1,X
      AND     #$F0
      STA     byte_RAM_5
      PHP
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5
      PLP
      LDA     ObjectXHi-1,X
      ADC     byte_RAM_0
      STA     byte_RAM_2
      STA     byte_RAM_3
      LDA     IsHorizontalLevel
      BNE     loc_BANK3_BBB5

      STA     byte_RAM_2
      STA     byte_RAM_3

loc_BANK3_BBB5:
      LDA     byte_BANKF_F055,Y
      BPL     loc_BANK3_BBBC

      DEC     byte_RAM_1

loc_BANK3_BBBC:
      CLC
      ADC     ObjectYLo-1,X
      AND     #$F0
      STA     byte_RAM_6
      STA     byte_RAM_E6
      LDA     ObjectYHi-1,X
      ADC     byte_RAM_1
      STA     byte_RAM_1
      STA     byte_RAM_4
      JSR     sub_BANK3_BC2E

      BCC     loc_BANK3_BBD6

      LDA     #$00
      BEQ     loc_BANK3_BBDD

loc_BANK3_BBD6:
      JSR     SetTileOffsetAndAreaPageAddr

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y

loc_BANK3_BBDD:
      STA     byte_RAM_0
      PLA
      TAX
      RTS


sub_BANK3_BBE2:
      PHA
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      ADC     TileGroupTable_Bank3,Y
      TAY
      PLA
      CMP     TileSolidnessTable,Y
      RTS


;
; These map the two high bits of a tile to offets in TileSolidnessTable
;
TileGroupTable_Bank3:
      .BYTE $00 ; solid to mushroom blocks
      .BYTE $04 ; solid on top
      .BYTE $08 ; solid on all sides


loc_BANK3_BBF4:
      INC     byte_RAM_4BD
      INC     PlayerLock
      JSR     sub_BANK3_BD59

      LDA     #DPCM_DoorOpenBombBom
      STA     DPCMQueue
      RTS


;
; Checks horizontal collision with the player and stops them if necessary
;
PlayerHorizontalCollision:
      LDX     #$00
      LDY     PlayerMovementDirection
      LDA     PlayerXVelocity
      EOR     PlayerCollisionResultTable-1,Y
      BPL     loc_BANK3_BC10

      STX     PlayerXVelocity

loc_BANK3_BC10:
      LDA     PlayerXAcceleration
      EOR     PlayerCollisionResultTable-1,Y
      BPL     loc_BANK3_BC1B

      STX     PlayerXAcceleration

loc_BANK3_BC1B:
      STX     PlayerXSubpixel

locret_BANK3_BC1E:
      RTS


;
; Set the player state to lifting and Kick off the lifting animation
;
SetPlayerStateLifting:
      LDA     #PlayerState_Lifting
      STA     PlayerState
      LDA     #$06
      STA     PlayerStateTimer
      LDA     #$08
      STA     PlayerAnimationFrame
      INC     HoldingItem
      RTS


;
; @TODO: Figure out what this does exactly
;
sub_BANK3_BC2E:
      LDY     byte_RAM_1
      LDA     byte_RAM_E6
      JSR     sub_BANK3_BD6B

      STY     byte_RAM_1
      STA     byte_RAM_E6
      LDY     IsHorizontalLevel
      LDA     byte_RAM_1,Y
      STA     byte_RAM_E8
      LDA     byte_RAM_2
      CMP     byte_BANK3_BC4D+1,Y
      BCS     locret_BANK3_BC4C

      LDA     byte_RAM_1
      CMP     byte_BANK3_BC4D,Y

locret_BANK3_BC4C:
      RTS


byte_BANK3_BC4D:
      .BYTE $0A
      .BYTE $01
      .BYTE $0B


;
; Replaces a tile when something is thrown
;
; Input
;   A = target tile
;   X = enemy index of object being thrown
;
ReplaceTile:
      PHA
      LDA     ObjectXLo,X
      CLC
      ADC     #$08
      PHP
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5
      PLP
      LDA     ObjectXHi,X
      LDY     IsHorizontalLevel
      BEQ     ReplaceTile_StoreXHi

      ADC     #$00

ReplaceTile_StoreXHi:
      STA     byte_RAM_2
      LDA     ObjectYLo,X
      CLC
      ADC     #$08
      AND     #$F0
      STA     byte_RAM_E6
      LDA     ObjectYHi,X
      ADC     #$00
      STA     byte_RAM_1
      JSR     sub_BANK3_BC2E

      PLA
      BCS     locret_BANK3_BC1E

      STX     byte_RAM_3
      PHA
      JSR     SetTileOffsetAndAreaPageAddr

      PLA
      LDY     byte_RAM_E7
      STA     (byte_RAM_1),Y
      PHA
      LDX     byte_RAM_300
      LDA     #$00
      STA     PPUBuffer_301,X
      TYA
      AND     #$F0
      ASL     A
      ROL     PPUBuffer_301,X
      ASL     A
      ROL     PPUBuffer_301,X
      STA     byte_RAM_302,X
      TYA
      AND     #$0F
      ASL     A

      ADC     byte_RAM_302,X
      STA     byte_RAM_302,X
      CLC
      ADC     #$20
      STA     byte_RAM_307,X
      LDA     IsHorizontalLevel
      ASL     A
      TAY
      LDA     byte_RAM_1
      AND     #$10
      BNE     loc_BANK3_BCBA

      INY

loc_BANK3_BCBA:
      LDA     unk_BANK3_BD0B,Y
      CLC
      ADC     PPUBuffer_301,X
      STA     PPUBuffer_301,X
      STA     byte_RAM_306,X
      LDA     #$02
      STA     byte_RAM_303,X
      STA     byte_RAM_308,X
      PLA
      PHA
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      TAY
      LDA     TileQuadPointersLo,Y
      STA     byte_RAM_0
      LDA     TileQuadPointersHi,Y
      STA     byte_RAM_1
      PLA
      ASL     A
      ASL     A
      TAY
      LDA     (byte_RAM_0),Y
      STA     byte_RAM_304,X
      INY
      LDA     (byte_RAM_0),Y
      STA     byte_RAM_305,X
      INY
      LDA     (byte_RAM_0),Y
      STA     byte_RAM_309,X
      INY
      LDA     (byte_RAM_0),Y
      STA     byte_RAM_30A,X
      LDA     #$00
      STA     byte_RAM_30B,X
      TXA
      CLC
      ADC     #$A
      STA     byte_RAM_300
      LDX     byte_RAM_3
      RTS


; Another byte of PPU high addresses for horiz/vert levels
unk_BANK3_BD0B:
      .BYTE $20
      .BYTE $28
      .BYTE $20
      .BYTE $24


StashPlayerPosition:
      LDA     InSubspaceOrJar
      BNE     StashPlayerPosition_Exit

      LDA     PlayerXHi
      STA     PlayerXHi_Backup
      LDA     PlayerXLo
      STA     PlayerXLo_Backup
      LDA     PlayerYHi
      STA     PlayerYHi_Backup
      LDA     PlayerYLo
      STA     PlayerYLo_Backup

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
      LDX     byte_RAM_E8
      JSR     SetAreaPageAddr

      LDA     byte_RAM_E6
      CLC
      ADC     byte_RAM_E5
      STA     byte_RAM_E7
      RTS


DecodedLevelPageStartLo:
      .BYTE <DecodedLevelData
      .BYTE <(DecodedLevelData+$00F0)
      .BYTE <(DecodedLevelData+$01E0)
      .BYTE <(DecodedLevelData+$02D0)
      .BYTE <(DecodedLevelData+$03C0)
      .BYTE <(DecodedLevelData+$04B0)
      .BYTE <(DecodedLevelData+$05A0)
      .BYTE <(DecodedLevelData+$0690)
      .BYTE <(DecodedLevelData+$0780)
      .BYTE <(DecodedLevelData+$0870)
      .BYTE <(SubAreaTileLayout)

DecodedLevelPageStartHi:
      .BYTE >DecodedLevelData
      .BYTE >(DecodedLevelData+$00F0)
      .BYTE >(DecodedLevelData+$01E0)
      .BYTE >(DecodedLevelData+$02D0)
      .BYTE >(DecodedLevelData+$03C0)
      .BYTE >(DecodedLevelData+$04B0)
      .BYTE >(DecodedLevelData+$05A0)
      .BYTE >(DecodedLevelData+$0690)
      .BYTE >(DecodedLevelData+$0780)
      .BYTE >(DecodedLevelData+$0870)
      .BYTE >(SubAreaTileLayout)



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
      LDA     DecodedLevelPageStartLo,X
      STA     byte_RAM_1
      LDA     DecodedLevelPageStartHi,X
      STA     byte_RAM_2
      RTS


PlayerCollisionResultTable:
      .BYTE CollisionFlags_80
      .BYTE CollisionFlags_00

; =============== S U B R O U T I N E =======================================

sub_BANK3_BD59:
      LDA     PlayerXLo
      CLC
      ADC     #$08
      AND     #$F0
      STA     PlayerXLo
      BCC     locret_BANK3_BD6A

      LDA     IsHorizontalLevel
      BEQ     locret_BANK3_BD6A

      INC     PlayerXHi

locret_BANK3_BD6A:
      RTS

; End of function sub_BANK3_BD59

; =============== S U B R O U T I N E =======================================

sub_BANK3_BD6B:
      STA     byte_RAM_F
      TYA
      BMI     locret_BANK3_BD81

      ASL     A
      ASL     A
      ASL     A
      ASL     A
      CLC
      ADC     byte_RAM_F
      BCS     loc_BANK3_BD7D

      CMP     #$F0
      BCC     locret_BANK3_BD81

loc_BANK3_BD7D:
      CLC
      ADC     #$10
      INY

locret_BANK3_BD81:
      RTS

; End of function sub_BANK3_BD6B

; =============== S U B R O U T I N E =======================================

sub_BANK3_BD82:
      LDA     byte_RAM_5,Y
      SEC
      SBC     byte_RAM_6,Y
      BPL     loc_BANK3_BD91

      EOR     #$FF
      CLC
      ADC     #$01
      DEX

loc_BANK3_BD91:
      SEC
      SBC     byte_RAM_9,X
      RTS

; End of function sub_BANK3_BD82

; =============== S U B R O U T I N E =======================================

sub_BANK3_BD95:
      LDA     byte_RAM_5,Y
      SEC
      SBC     byte_RAM_6,Y
      STA     byte_RAM_6,Y
      LDA     byte_RAM_1,Y
      SBC     byte_RAM_2,Y
      BPL     loc_BANK3_BDB9

      EOR     #$FF
      PHA
      LDA     byte_RAM_6,Y
      EOR     #$FF
      CLC
      ADC     #$01
      STA     byte_RAM_6,Y
      PLA
      ADC     #$00
      DEX

loc_BANK3_BDB9:
      CMP     #$00
      BEQ     loc_BANK3_BDBF

      SEC
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_BDBF:
      LDA     byte_RAM_6,Y
      SBC     byte_RAM_9,X
      RTS

; End of function sub_BANK3_BD95

; =============== S U B R O U T I N E =======================================

sub_BANK3_BDC5:
      TXA
      PHA
      LDY     #$02

loc_BANK3_BDC9:
      TYA
      TAX
      INX
      CPY     #$00
      BNE     loc_BANK3_BDDA

      LDA     IsHorizontalLevel
      BNE     loc_BANK3_BDDA

      JSR     sub_BANK3_BD82

      JMP     loc_BANK3_BDDD

; ---------------------------------------------------------------------------

loc_BANK3_BDDA:
      JSR     sub_BANK3_BD95

loc_BANK3_BDDD:
      BCS     loc_BANK3_BDEC

      PHA
      TYA
      LSR     A
      TAX
      PLA
      STA     byte_RAM_426,X
      DEY
      DEY
      BPL     loc_BANK3_BDC9

      CLC

loc_BANK3_BDEC:
      PLA
      TAX
      RTS

; End of function sub_BANK3_BDC5

; ---------------------------------------------------------------------------
HealthBarTiles:
      .BYTE $BA ; 0
      .BYTE $BA
      .BYTE $BA
      .BYTE $BA
      .BYTE $B8 ; 1
      .BYTE $BA
      .BYTE $BA
      .BYTE $BA
      .BYTE $B8 ; 2
      .BYTE $B8
      .BYTE $BA
      .BYTE $BA
      .BYTE $B8 ; 3
      .BYTE $B8
      .BYTE $B8
      .BYTE $BA
      .BYTE $B8 ; 4
      .BYTE $B8
      .BYTE $B8
      .BYTE $B8

POWQuakeOffsets:
      .BYTE $00
      .BYTE $03
      .BYTE $00
      .BYTE $FD

SkyFlashColors:
      .BYTE $26
      .BYTE $2A
      .BYTE $22
      .BYTE $26

; =============== S U B R O U T I N E =======================================

AreaSecondaryRoutine:
      LDA     SkyFlashTimer
      BEQ     loc_BANK3_BE55

      ; sky flash timer (ie. explosions)
      DEC     SkyFlashTimer
      LDX     byte_RAM_300
      LDA     #$3F
      STA     PPUBuffer_301,X
      LDA     #$10
      STA     byte_RAM_302,X
      LDA     #$04
      STA     byte_RAM_303,X
      LDA     byte_RAM_4BC
      LDY     SkyFlashTimer
      BEQ     loc_BANK3_BE34

      TYA
      AND     #$03
      TAY
      LDA     SkyFlashColors,Y

; some kind of palette copying routine
loc_BANK3_BE34:
      STA     byte_RAM_304,X
      LDA     RestorePlayerPalette1
      STA     byte_RAM_305,X
      LDA     RestorePlayerPalette2
      STA     byte_RAM_306,X
      LDA     RestorePlayerPalette3
      STA     byte_RAM_307,X
      LDA     #$00
      STA     byte_RAM_308,X
      TXA
      CLC
      ADC     #$07
      STA     byte_RAM_300

; draw health bar
loc_BANK3_BE55:
      LDA     #$30
      STA     byte_RAM_0
      JSR     loc_BANKF_FAFE

      LDA     PlayerHealth
      BEQ     loc_BANK3_BE67

      AND     #$F0
      LSR     A
      LSR     A
      ADC     #$04 ; max health

loc_BANK3_BE67:
      TAX
      LDA     #$FE
      STA     byte_RAM_3

loc_BANK3_BE6C:
      LDA     HealthBarTiles,X
      STA     SpriteDMAArea+1,Y
      LDA     #$10
      STA     SpriteDMAArea+3,Y
      LDA     #$01
      STA     SpriteDMAArea+2,Y
      LDA     byte_RAM_0
      STA     SpriteDMAArea,Y
      CLC
      ADC     #$10
      STA     byte_RAM_0
      INX
      INY
      INY
      INY
      INY
      INC     byte_RAM_3
      LDA     byte_RAM_3
      CMP     PlayerMaxHealth
      BNE     loc_BANK3_BE6C

      ; pow quake timer (shake screen)
      LDA     POWQuakeTimer
      BEQ     AreaSecondaryRoutine_Exit

      DEC     POWQuakeTimer
      LSR     A
      AND     #$01
      TAY
      LDA     PPUScrollYMirror
      BPL     loc_BANK3_BEA6

      INY
      INY

loc_BANK3_BEA6:
      LDA     POWQuakeOffsets,Y
      STA     BackgroundYOffset
      JMP     loc_BANK2_9935

; ---------------------------------------------------------------------------

AreaSecondaryRoutine_Exit:
      RTS

; End of function AreaSecondaryRoutine

; ---------------------------------------------------------------------------
; The rest of this bank is empty

; ===========================================================================

