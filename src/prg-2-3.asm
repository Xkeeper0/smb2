
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

; =============== S U B R O U T I N E =======================================

sub_BANK2_8010:
      LDA     byte_RAM_627
      BEQ     loc_BANK2_8016

      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8016:
      LDA     byte_RAM_4AE
      BEQ     loc_BANK2_801E

      JMP     loc_BANK2_816C

; ---------------------------------------------------------------------------

loc_BANK2_801E:
      INC     byte_RAM_4AE
      STA     byte_RAM_5BA
      STA     POWQuakeTimer
      STA     SkyFlashTimer
      STA     CrystalAndHawkmouthOpenSize
      STA     HawkmouthClosing
      STA     byte_RAM_4B9
      STA     HawkmouthOpenTimer
      STA     byte_RAM_4FA
      STA     byte_RAM_425
      STA     PlayerXAccel
      STA     DamageInvulnTime
      STA     HoldingItem
      STA     PlayerStateTimer
      STA     byte_RAM_4C5
      STA     byte_RAM_4FD
      STA     CrouchJumpTimer
      STA     byte_RAM_4C9
      STA     byte_RAM_4DF
      STA     byte_RAM_4B8
      LDY     #$1B

loc_BANK2_8058:
      LDA     ItemCarryYOffsets,Y ; Copy the global carrying Y offsets to memory
      STA     byte_RAM_7F00,Y ; These are used for every character for different
      DEY ; frames of the pickup animation
      BPL     loc_BANK2_8058

      LDY     CurrentCharacter ; Copy the character-specific
      LDA     CarryYOffsetBigLo,Y ; FINAL carrying heights into memory
      STA     byte_RAM_7F00
      LDA     CarryYOffsetSmallLo,Y
      STA     byte_RAM_7F00+7
      LDA     CarryYOffsetBigHi,Y
      STA     byte_RAM_7F00+$E
      LDA     CarryYOffsetSmallHi,Y
      STA     byte_RAM_7F00+$15
      LDA     #$B6
      STA     PseudoRNGValues
      LDA     TransitionType

loc_BANK2_8083:
      ORA     CurrentLevel
      BNE     loc_BANK2_808D

      LDA     #SoundEffect2_IntroFallSlide ; This is what plays the slide-whistle when
      STA     SoundEffectQueue2 ; you start the game and drop into 1-1

loc_BANK2_808D:
      LDA     byte_RAM_4AF
      BEQ     loc_BANK2_8106

      LDX     #5
      STX     byte_RAM_12
      CMP     #$3F
      BEQ     loc_BANK2_8106

      STA     ObjectType,X
      LDY     #EnemyState_Alive
      STY     EnemyState+5
      LDY     #$FF
      STY     byte_RAM_446
      CMP     #$38
      BNE     loc_BANK2_80C7

      STA     EnemyArray_B1,X
      STA     byte_RAM_4C7,X
      STA     EnemyArray_477,X
      LDA     #0
      STA     ObjectXHi,X
      STA     ObjectYHi,X
      JSR     SetEnemyAttributes

      LDA     #$F0
      STA     ObjectYAccel,X
      ASL     A
      STA     ObjectYLo,X
      LDA     #$78
      STA     ObjectXLo,X
      BNE     loc_BANK2_8106

loc_BANK2_80C7:
      PHA
      STX     byte_RAM_42D
      JSR     EnemyInit_Basic

      LDA     #1
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

      LDA     #0
      STA     byte_RAM_5BC
      LDA     ScreenYLo
      STA     ObjectYLo,X
      LDA     ScreenYHi
      STA     ObjectYHi,X
      LDA     ScreenBoundaryLeftLo
      STA     ObjectXLo,X
      LDA     ScreenBoundaryLeftHi
      STA     ObjectXHi,X
      JSR     sub_BANK2_8569

loc_BANK2_8106:
      LDA     #0
      STA     byte_RAM_CC
      LDA     #$7B
      STA     byte_RAM_CD
      LDA     IsHorizontalLevel
      BNE     loc_BANK2_8144

      LDA     #$14
      STA     byte_RAM_9
      LDA     ScreenYLo
      SBC     #$30
      AND     #$F0
      STA     byte_RAM_5
      LDA     ScreenYHi
      SBC     #0
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

; End of function sub_BANK2_8010

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
      SBC     #0
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
      ADC     #0
      STA     ScreenBoundaryRightHi
      LDX     #8

loc_BANK2_8198:
      STX     byte_RAM_12
      TXA
      CLC
      ADC     byte_RAM_400
      TAY

loc_BANK2_81A0:
      LDA     byte_BANKF_F4DA,Y
      LDY     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_81B1

      LDA     #$10
      LDY     ObjectType,X
      CMP     #$38
      BNE     loc_BANK2_81B1

      LDA     #0

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

      LDA     byte_RAM_4B9
      BEQ     HandleEnemyState_Inactive

      SEC
      SBC     #$47

loc_BANK2_81FD:
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK2_8B64
      .WORD loc_BANK2_8B90
      .WORD sub_BANK2_8208
      .WORD loc_BANK3_B180

; =============== S U B R O U T I N E =======================================

sub_BANK2_8208:
      LDA     #0
      STA     byte_RAM_4B9

HandleEnemyState_Inactive:
      RTS

; End of function sub_BANK2_8208

; =============== S U B R O U T I N E =======================================

; I am very good at figuring out what things do. Yes.

DoPRNGBullshitProbably:
      LDY     #0
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

; ---------------------------------------------------------------------------
      .WORD HandleEnemyState_Inactive ; 0 (not active)
      .WORD HandleEnemyState_Alive ; Alive
      .WORD HandleEnemyState_Dead ; Dead
      .WORD HandleEnemyState_BlockFizzle ; Block fizzle
      .WORD HandleEnemyState_BombExploding ; Bomb exploding
      .WORD HandleEnemyState_PuffOfSmoke ; Puff of smoke
      .WORD HandleEnemyState_6 ; 6 (?)
off_BANK2_8250:
      .WORD loc_BANK2_85B2
; Don't think this is part of state handling (?)
; but not sure at all
;
; Is this for being carried/thrown??
      .BYTE $18
byte_BANK2_8253:
      .BYTE $E0

      .BYTE $01
      .BYTE $FF
; ---------------------------------------------------------------------------

loc_BANK2_8256:
      LDA     byte_RAM_4B8
      BNE     locret_BANK2_82AB

      LDA     IsHorizontalLevel
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK2_82ED
      .WORD loc_BANK2_8264
; ---------------------------------------------------------------------------

loc_BANK2_8264:
      LDY     PlayerMovementDirection
      LDA     ScreenBoundaryLeftLo
      CLC
      ADC     off_BANK2_8250+1,Y
      AND     #$F0
      STA     byte_RAM_5
      LDA     ScreenBoundaryLeftHi
      ADC     byte_BANK2_8253,Y
      STA     byte_RAM_6
      CMP     #$A
      BCS     locret_BANK2_82AB

; =============== S U B R O U T I N E =======================================

sub_BANK2_827D:
      LDA     InSubspaceOrJar
      CMP     #2
      BEQ     locret_BANK2_82AB

      LDX     #0
      STX     byte_RAM_0

loc_BANK2_8288:
      CPX     byte_RAM_6
      BEQ     loc_BANK2_8298

      LDA     byte_RAM_0
      TAY
      CLC
      ADC     (byte_RAM_CC),Y
      STA     byte_RAM_0
      INX
      JMP     loc_BANK2_8288

; ---------------------------------------------------------------------------

loc_BANK2_8298:
      LDY     byte_RAM_0
      LDA     (byte_RAM_CC),Y
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
      LDA     (byte_RAM_CC),Y
      BMI     loc_BANK2_82A1

      INY
      LDA     (byte_RAM_CC),Y
      DEY

loc_BANK2_82B4:
      AND     #$F0
      CMP     byte_RAM_5
      BNE     loc_BANK2_82A1

      LDA     (byte_RAM_CC),Y
      CMP     #$5C
      BCS     loc_BANK2_82C8

      CMP     #$47
      BCC     loc_BANK2_82C8

      STA     byte_RAM_4B9
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_82C8:
      LDX     #4

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
      LDA     (byte_RAM_CC),Y
      DEY
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     ObjectYLo,X
      LDA     #0
      STA     ObjectYHi,X
      JMP     loc_BANK2_8377

; End of function sub_BANK2_827D

; ---------------------------------------------------------------------------

loc_BANK2_82ED:
      LDA     byte_RAM_10
      AND     #1
      TAY
      INY
      LDA     NeedVerticalScroll
      BEQ     loc_BANK2_82FC

      AND     #3
      EOR     #3
      TAY

loc_BANK2_82FC:
      LDA     ScreenYLo
      CLC
      ADC     off_BANK2_8250+1,Y
      AND     #$F0
      STA     byte_RAM_5
      LDA     ScreenYHi
      ADC     byte_BANK2_8253,Y
      STA     byte_RAM_6
      CMP     #$A

loc_BANK2_830F:
      BCS     locret_BANK2_82AB

loc_BANK2_8311:
      LDX     #0
      STX     byte_RAM_0

loc_BANK2_8315:
      CPX     byte_RAM_6
      BEQ     loc_BANK2_8325

      LDA     byte_RAM_0
      TAY
      CLC
      ADC     (byte_RAM_CC),Y
      STA     byte_RAM_0
      INX
      JMP     loc_BANK2_8315

; ---------------------------------------------------------------------------

loc_BANK2_8325:
      LDY     byte_RAM_0

loc_BANK2_8327:
      LDA     (byte_RAM_CC),Y
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
      LDA     (byte_RAM_CC),Y
      BMI     loc_BANK2_832E

      INY
      LDA     (byte_RAM_CC),Y
      DEY
      ASL     A

loc_BANK2_8342:
      ASL     A
      ASL     A
      ASL     A
      CMP     byte_RAM_5
      BNE     loc_BANK2_832E

      LDA     (byte_RAM_CC),Y
      CMP     #$5C
      BCS     loc_BANK2_8357

      CMP     #$47
      BCC     loc_BANK2_8357

      STA     byte_RAM_4B9
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8357:
      LDX     #4

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
      LDA     (byte_RAM_CC),Y
      DEY
      AND     #$F0
      STA     ObjectXLo,X
      LDA     #0
      STA     ObjectXHi,X

loc_BANK2_8377:
      STA     unk_RAM_49B,X
      STY     word_RAM_C
      LDA     (byte_RAM_CC),Y
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
      LDY     word_RAM_C
      LDA     (byte_RAM_CC),Y
      ORA     #$80
      STA     (byte_RAM_CC),Y
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
      LDA     #0
      STA     EnemyTimer,X

; End of function EnemyInit_Basic

; =============== S U B R O U T I N E =======================================

; Enemy initializing (sets most stuff to 0)

EnemyInit_BasicWithoutTimer:
      LDA     #0
      STA     EnemyVariable,X
      LDA     #$00 ; You do realize you already LDA #$00, right???
      STA     EnemyArray_B1,X
      STA     EnemyArray_42F,X
      STA     ObjectBeingCarriedTimer,X
      STA     EnemyArray_9F,X
      STA     EnemyArray_44A,X
      STA     EnemyCollision,X
      STA     EnemyArray_438,X
      STA     EnemyArray_453,X
      STA     EnemyArray_4CC,X
      STA     EnemyArray_4D6,X
      STA     EnemyArray_45C,X
      STA     EnemyArray_477,X
      STA     EnemyArray_480,X
      STA     EnemyHP,X
      STA     ObjectYAccel,X

loc_BANK2_848F:
      JSR     SetEnemyAttributes

loc_BANK2_8492:
      JSR     EnemyFindWhichSidePlayerIsOn

loc_BANK2_8495:
      INY
      STY     EnemyMovementDirection,X
      LDA     EnemyInitialAccelerationTable,Y
      STA     ObjectXAccel,X
      LDA     EnemyArray_46E,X
      AND     #$40
      BEQ     locret_BANK2_84A6

      ASL     ObjectXAccel,X ; Change the speed of certain objects?

locret_BANK2_84A6:
      RTS

; End of function EnemyInit_BasicWithoutTimer

; ---------------------------------------------------------------------------
BeezoXOffsetTable:
      .BYTE $FE
; If player moving right
      .BYTE $00 ; If moving left
BeezoDiveSpeedTable:
      .BYTE $12,$16,$1A,$1E,$22,$26,$2A,$2D
      .BYTE $30,$32,$34,$37,$39,$3B,$3D,$3E
; ---------------------------------------------------------------------------

EnemyInit_BeezoDiving:
      JSR     EnemyInit_Basic

      LDY     PlayerMovementDirection ; 2 if travelling left, $01 otherwise
      LDA     ScreenBoundaryLeftLo
      ADC     BeezoXOffsetTable-1,Y
      STA     ObjectXLo,X ; Spawn in front of the player to dive at them
      LDA     ScreenBoundaryLeftHi
      ADC     #0
      STA     ObjectXHi,X

; =============== S U B R O U T I N E =======================================

EnemyBeezoDiveSetup:
      LDA     PlayerYHi
      BPL     loc_BANK2_84D5

      LDY     #0
      BEQ     loc_BANK2_84DF ; If above the screen, just abort
; and use the least descend-y one

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
      STA     ObjectYAccel,X
      RTS

; End of function EnemyBeezoDiveSetup

; ---------------------------------------------------------------------------

EnemyInit_Phanto:
      JSR     EnemyInit_Basic

      LDA     #$C
      STA     ObjectXAccel,X
      LDA     #$A0
      STA     byte_RAM_5BC
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

      JSR     sub_BANK2_8208

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
      LDA     #$41
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
      LDA     #$07 ; what's this magic number for?
      STA     EnemyArray_46E,X
      LDA     #Enemy_Heart
      STA     ObjectType,X
      LDA     ObjectYLo,X
      SBC     #$60 ; subtract this amount from the y position where the enemy despawned
      STA     ObjectYLo,X
      LDA     ObjectYHi,X
      SBC     #0
      STA     ObjectYHi,X

; =============== S U B R O U T I N E =======================================

sub_BANK2_8569:
      LDA     #$FF
      STA     unk_RAM_441,X
      RTS

; End of function sub_BANK2_8569

; ---------------------------------------------------------------------------

MakeEnemyFlipUpsideDown:
      ASL     ObjectAttributes,X ; Shift left...
      SEC ; Set carry...
      ROR     ObjectAttributes,X ; Shift right. Effectively sets $80 bit

loc_BANK2_8574:
      JSR     RenderSprite

; =============== S U B R O U T I N E =======================================

sub_BANK2_8577:
      LDA     EnemyArray_44A,X
      BNE     HandleObjectGravity

      JSR     sub_BANK2_9E50

HandleObjectGravity:
      JSR     sub_BANK2_9E4B

      LDA     ObjectYAccel,X
      BMI     loc_BANK2_858A

      CMP     #$3E
      BCS     locret_BANK2_858E

loc_BANK2_858A:
      INC     ObjectYAccel,X ; Makes objects slowly fall down
      INC     ObjectYAccel,X ; Turning these into DECs causes...
;       problems.

locret_BANK2_858E:
      RTS

; End of function sub_BANK2_8577

; ---------------------------------------------------------------------------

HandleEnemyState_BlockFizzle:
      JSR     sub_BANK2_88E8

      LDA     EnemyTimer,X
      BEQ     loc_BANK2_85AF

      TAY
      LSR     A
      LSR     A
      AND     #1
      STA     EnemyMovementDirection,X
      LDA     #1
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
      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

loc_BANK2_85B2:
      JSR     sub_BANK2_88E8

      JSR     sub_BANK2_997A

      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_85C1

      LDA     #1
      STA     EnemyState,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_85C1:
      LDA     EnemyTimer,X
      BEQ     loc_BANK2_85AF

      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      BCS     loc_BANK2_85E1

      JSR     sub_BANK2_8B5B

      LDA     byte_RAM_10
      AND     #3
      STA     EnemyArray_44A,X
      LDA     byte_RAM_10
      AND     #$10
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      ADC     #1
      STA     EnemyMovementDirection,X

loc_BANK2_85E1:
      JSR     sub_BANK2_9486

      JMP     sub_BANK3_B5CC

; ---------------------------------------------------------------------------
byte_BANK2_85E7:
      .BYTE $F8

      .BYTE $00
      .BYTE $F8
      .BYTE $00
      .BYTE $08
byte_BANK2_85EC:
      .BYTE $10
      .BYTE $08
      .BYTE $10
byte_BANK2_85EF:
      .BYTE $F8

      .BYTE $F8
EnemyInitialAccelerationTable:
      .BYTE $08

      .BYTE $08
      .BYTE $F8
      .BYTE $F8
      .BYTE $08
      .BYTE $08
; ---------------------------------------------------------------------------

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
      LDX     #0
      LDY     #$40

loc_BANK2_8618:
      LDA     SpriteTempScreenY
      CLC
      ADC     byte_BANK2_85EF,X
      STA     SpriteDMAArea,Y
      LDA     SpriteTempScreenX
      CLC
      ADC     byte_BANK2_85E7,X
      STA     SpriteDMAArea+3,Y
      LDA     #1
      STA     SpriteDMAArea+2,Y
      LDA     byte_RAM_0
      STA     SpriteDMAArea+1,Y
      CLC
      ADC     #2
      STA     byte_RAM_0
      INY
      INY
      INY
      INY
      INX
      CPX     #8
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
      STA     word_RAM_C
      LDA     ObjectXHi,X
      ADC     byte_BANK2_8653,Y
      STA     word_RAM_C+1
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

      STY     word_RAM_C+1
      ADC     #$F
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_E

loc_BANK2_86BD:
      LDA     word_RAM_C
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_4
      ORA     byte_RAM_E
      STA     byte_RAM_5
      LDY     #0
      LDA     ScreenBoundaryLeftHi
      CMP     #$A
      BNE     loc_BANK2_86D5

      STY     word_RAM_C+1
      INY

loc_BANK2_86D5:
      LDA     #$10
      STA     byte_RAM_7
      LDA     byte_BANK2_866E,Y
      STA     byte_RAM_8
      LDY     word_RAM_C+1

loc_BANK2_86E0:
      LDA     byte_RAM_7
      CLC
      ADC     #$F0
      STA     byte_RAM_7
      LDA     byte_RAM_8
      ADC     #0
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
      LDA     word_RAM_C+1
      AND     #1
      EOR     #1
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
      LDA     word_RAM_C
      AND     #$F0
      STA     byte_RAM_3
      LDA     #8
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
      ADC     #0
      STA     byte_RAM_306,X

loc_BANK2_874B:
      LDA     #2
      STA     byte_RAM_303,X
      STA     byte_RAM_308,X
      LDA     #$FA
      STA     byte_RAM_304,X
      STA     byte_RAM_305,X
      STA     byte_RAM_309,X
      STA     byte_RAM_30A,X
      LDA     #0
      STA     byte_RAM_30B,X
      TXA
      CLC
      ADC     #$A
      STA     byte_RAM_300
      LDX     #8

loc_BANK2_876F:
      LDA     EnemyState,X
      BEQ     loc_BANK2_8778

      DEX
      BPL     loc_BANK2_876F

      BMI     loc_BANK2_8795

loc_BANK2_8778:
      LDA     word_RAM_C
      AND     #$F0
      STA     ObjectXLo,X
      LDA     word_RAM_C+1
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
      CMP     #3
      BNE     locret_BANK2_8797

      LDY     #$22
      LDA     ObjectType,X
      CMP     #Enemy_Clawgrip
      BNE     loc_BANK2_87CA

      DEY ; Clawgrip special hack:
; Move the "Draw the door" PPU command
; up 8 tile rows ($100) to be on the platform

loc_BANK2_87CA:
      STY     PPUBuffer_721B
      STY     byte_RAM_7222
      INY
      STY     byte_RAM_7229
      STY     byte_RAM_7232
      LDY     #3

loc_BANK2_87D9:
      LDA     unk_RAM_4EF,X
      AND     #1
      ASL     A
      ASL     A
      EOR     #4
      LDX     IsHorizontalLevel
      BNE     loc_BANK2_87E7

      ASL     A

loc_BANK2_87E7:
      LDX     byte_BANKF_FA9E,Y
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
      ADC     #0
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
      SBC     #0
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

      DEC     byte_RAM_4F8
      BPL     loc_BANK2_8855

      INC     unk_RAM_49B,X
      INC     ObjectType,X
      JMP     loc_BANK2_8509

; ---------------------------------------------------------------------------

loc_BANK2_8855:
      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

HandleEnemyState_6:
      JSR     sub_BANK2_88E8

      LDA     #$12
      STA     ObjectAttributes,X
      LDA     EnemyTimer,X
      BEQ     loc_BANK2_8888

      LDA     #$F8
      STA     ObjectYAccel,X
      JSR     sub_BANK2_9E4B

      LDA     #$B2
      LDY     EnemyTimer,X
      CPY     #$10
      BCS     loc_BANK2_8885

      LDA     #$80
      STA     EnemyArray_46E,X
      LDA     #1
      STA     ObjectAttributes,X
      ASL     A
      STA     EnemyMovementDirection,X
      INC     EnemyArray_9F,X
      JSR     sub_BANK2_8B5B

      LDA     #$B4

loc_BANK2_8885:
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

loc_BANK2_8888:
      CPX     byte_RAM_42D
      BNE     loc_BANK2_8891

      LDA     #0
      STA     HoldingItem

loc_BANK2_8891:
      JMP     sub_BANK2_89A9

; =============== S U B R O U T I N E =======================================

sub_BANK2_8894:
      LDA     #0
      STA     byte_RAM_EE
      LDA     ObjectAttributes,X
      LDY     #1
      AND     #4
      BNE     loc_BANK2_88B9

      LDA     ObjectType,X
      CMP     #Enemy_Pokey
      BEQ     loc_BANK2_88B9

      CMP     #8
      BEQ     loc_BANK2_88B9

      CMP     #$2D
      BEQ     loc_BANK2_88B9

      CMP     #$21
      BEQ     loc_BANK2_88B9

      LDA     EnemyArray_46E,X
      AND     #$20
      BEQ     loc_BANK2_88BB

loc_BANK2_88B9:
      LDY     #3

loc_BANK2_88BB:
      LDA     ObjectXLo,X
      CLC
      ADC     byte_BANK2_88E4,Y
      STA     byte_RAM_E
      LDA     ObjectXHi,X
      ADC     #0
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
byte_BANK2_88E0:
      .BYTE $08

      .BYTE $04
      .BYTE $02
      .BYTE $01
byte_BANK2_88E4:
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
      ADC     #0
      STA     byte_RAM_1
      LDA     byte_RAM_0
      CMP     ScreenYLo
      LDA     byte_RAM_1
      SBC     ScreenYHi
      STA     byte_RAM_EF
      CPY     #$17
      BEQ     locret_BANK2_88DF

      CPY     #$41
      BEQ     locret_BANK2_88DF

      CPY     #$43
      BEQ     locret_BANK2_88DF

      CPY     #$2D
      BEQ     locret_BANK2_88DF

      TXA
      AND     #1
      STA     byte_RAM_0
      LDA     byte_RAM_10
      AND     #1
      EOR     byte_RAM_0
      BNE     locret_BANK2_88DF

      LDA     ScreenYLo
      SBC     #$30
      STA     byte_RAM_1
      LDA     ScreenYHi
      SBC     #0
      STA     byte_RAM_0
      INC     byte_RAM_0
      LDA     ScreenYLo
      ADC     #$FF
      PHP
      ADC     #$30
      STA     byte_RAM_3
      LDA     ScreenYHi
      ADC     #0
      PLP
      ADC     #0
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
      SBC     #0
      STA     byte_RAM_0
      INC     byte_RAM_0
      LDA     ScreenBoundaryRightLo
      ADC     #$30
      STA     byte_RAM_3
      LDA     ScreenBoundaryRightHi
      ADC     #0
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
      BMI     locret_BANK2_89B8

loc_BANK2_899C:
      LDY     ObjectType,X
      LDA     EnemyArray_46E_Data,Y
      AND     #8
      BNE     locret_BANK2_89B8

loc_BANK2_89A5:
      LDA     ObjectBeingCarriedTimer,X
      BNE     locret_BANK2_89B8

; End of function sub_BANK2_88E8

; =============== S U B R O U T I N E =======================================

sub_BANK2_89A9:
      LDY     unk_RAM_441,X
      BMI     loc_BANK2_89B4

      LDA     (byte_RAM_CC),Y
      AND     #$7F
      STA     (byte_RAM_CC),Y

loc_BANK2_89B4:
      LDA     #0
      STA     EnemyState,X

locret_BANK2_89B8:
      RTS

; End of function sub_BANK2_89A9

; ---------------------------------------------------------------------------

HandleEnemyState_Alive:
      LDA     #1
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
      AND     #4
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
      JSR     sub_BANK2_997A

      LDA     EnemyArray_42F,X
      BEQ     loc_BANK2_89FB

      JSR     sub_BANK2_8577

loc_BANK2_89FB:
      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_8A04

      DEC     EnemyArray_9F,X

loc_BANK2_8A01:
      JMP     CarryObject

; ---------------------------------------------------------------------------

loc_BANK2_8A04:
      JSR     sub_BANK3_B5CC

loc_BANK2_8A07:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK2_8A0A:
      LDY     #1
      LDA     ObjectXAccel,X
      BEQ     loc_BANK2_8A15

      BPL     loc_BANK2_8A13

      INY

loc_BANK2_8A13:
      STY     EnemyMovementDirection,X

loc_BANK2_8A15:
      LDY     ObjectType,X
      LDA     ObjectAttributeTable,Y
      AND     #ObjAttrib_Palette0|ObjAttrib_Unknown_20
      BNE     loc_BANK2_8A41

      LDA     ObjectAttributes,X
      AND     #ObjAttrib_Palette3|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08|ObjAttrib_Mirrored|ObjAttrib_16x32|ObjAttrib_UpsideDown
      STA     ObjectAttributes,X
      LDA     ObjectBeingCarriedTimer,X
      CMP     #2
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
      STA     EnemyArray_9F,X
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
      STA     ObjectXAccel,X
      LDA     SparkAccelerationTable-$2C,Y
      STA     ObjectYAccel,X
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
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_8B5B

      JSR     RenderSprite

      LDA     ObjectXLo,X
      ORA     ObjectYLo,X
      AND     #$F
      BNE     loc_BANK2_8B50

      JSR     sub_BANK3_B4F9

      LDY     EnemyArray_477,X
      LDA     EnemyCollision,X
      AND     SparkCollision,Y
      BEQ     loc_BANK2_8B47

      LDA     SparkCollision,Y
      EOR     #$F
      AND     EnemyCollision,X
      BEQ     loc_BANK2_8B50

      TYA
      EOR     #1
      STA     EnemyArray_477,X
      TAY

; =============== S U B R O U T I N E =======================================

sub_BANK2_8B36:
      TXA
      CLC
      ADC     byte_BANK2_8B06,Y
      TAY
      LDA     ObjectXAccel,Y
      EOR     #$FF
      ADC     #1
      STA     ObjectXAccel,Y
      RTS

; End of function sub_BANK2_8B36

; ---------------------------------------------------------------------------

loc_BANK2_8B47:
      TYA
      EOR     #1
      STA     EnemyArray_477,X
      JSR     sub_BANK2_8B36

loc_BANK2_8B50:
      LDA     EnemyArray_477,X
      BNE     loc_BANK2_8B58

      JMP     sub_BANK2_9E50

; ---------------------------------------------------------------------------

loc_BANK2_8B58:
      JMP     sub_BANK2_9E4B

; =============== S U B R O U T I N E =======================================

sub_BANK2_8B5B:
      INC     EnemyArray_9F,X
      INC     EnemyArray_9F,X
      RTS

; End of function sub_BANK2_8B5B

; ---------------------------------------------------------------------------
byte_BANK2_8B60:
      .BYTE $F0

      .BYTE $00
byte_BANK2_8B62:
      .BYTE $FF

      .BYTE $01
; ---------------------------------------------------------------------------

loc_BANK2_8B64:
      JSR     sub_BANK2_8BBD

      ADC     byte_BANK2_8B60,Y
      STA     ObjectXLo,X
      LDA     ScreenBoundaryLeftHi
      ADC     byte_BANK2_8B62,Y
      STA     ObjectXHi,X
      STY     byte_RAM_1
      LDA     #$A
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDA     PseudoRNGValues+2
      AND     #$1F
      ADC     #$20
      STA     ObjectYLo,X
      LDY     byte_RAM_1
      JSR     loc_BANK2_8495

      ASL     ObjectXAccel,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK2_8B8E:
      .BYTE $00

      .BYTE $FF
; ---------------------------------------------------------------------------

loc_BANK2_8B90:
      JSR     sub_BANK2_8BBD ; Beezo swarm handler?

      ADC     byte_BANK2_8B8E,Y
      STA     ObjectXLo,X
      LDA     IsHorizontalLevel
      BEQ     loc_BANK2_8BA1

      LDA     ScreenBoundaryLeftHi
      ADC     #0

loc_BANK2_8BA1:
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
      JSR     loc_BANK2_8495

      JSR     EnemyBeezoDiveSetup

      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK2_8BBD:
      LDA     StopwatchTimer
      BNE     loc_BANK2_8BE1

      LDA     byte_RAM_623
      CLC
      ADC     #3
      STA     byte_RAM_623
      BCC     loc_BANK2_8BE1

      JSR     CreateEnemy

      BMI     loc_BANK2_8BE1

      LDY     #0
      LDA     byte_RAM_10
      AND     #$40
      BNE     loc_BANK2_8BDB

      INY

loc_BANK2_8BDB:
      LDX     byte_RAM_0
      LDA     ScreenBoundaryLeftLo
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8BE1:
      PLA
      PLA
      RTS

; End of function sub_BANK2_8BBD

; ---------------------------------------------------------------------------

EnemyBehavior_Fireball:
      JSR     sub_BANK3_B4FD

      JSR     sub_BANK2_927A

      JSR     sub_BANK2_997A

      JSR     RenderSprite

      LDA     EnemyVariable,X
      BNE     loc_BANK2_8BF7

      JMP     sub_BANK2_8577

; ---------------------------------------------------------------------------

loc_BANK2_8BF7:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK2_8C00

      JSR     TurnIntoPuffOfSmoke

loc_BANK2_8C00:
      JMP     sub_BANK2_9430

; ---------------------------------------------------------------------------
byte_BANK2_8C03:
      .BYTE $10

      .BYTE $F0
; ---------------------------------------------------------------------------

EnemyBehavior_PanserPink:
      LDA     EnemyArray_9F,X
      ASL     A
      BNE     EnemyBehavior_PanserRedAndGray

      JSR     loc_BANK2_8492

EnemyBehavior_PanserRedAndGray:
      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     #4
      BEQ     loc_BANK2_8C1A

      JSR     sub_BANK2_95CE

loc_BANK2_8C1A:
      PLA
      AND     #3
      BEQ     loc_BANK2_8C22

      JSR     EnemyBehavior_TurnAround

loc_BANK2_8C22:
      JSR     sub_BANK2_8577

      LDA     #$83
      STA     EnemyArray_46E,X
      LDA     #2
      STA     EnemyMovementDirection,X
      JSR     sub_BANK2_997A

      INC     EnemyArray_9F,X
      LDA     EnemyArray_9F,X
      AND     #$2F
      BNE     loc_BANK2_8C3D

      LDA     #$10
      STA     EnemyTimer,X

loc_BANK2_8C3D:
      LDY     EnemyTimer,X
      BEQ     loc_BANK2_8C8E

      CPY     #6
      BNE     loc_BANK2_8C7C

      JSR     CreateEnemy

      BMI     loc_BANK2_8C7C

      LDA     ObjectType,X
      PHA
      LDX     byte_RAM_0
      LDA     PseudoRNGValues+2
      AND     #$F
      ORA     #$BC
      STA     ObjectYAccel,X
      JSR     EnemyFindWhichSidePlayerIsOn

      PLA
      CMP     #$25
      LDA     byte_BANK2_8C03,Y
      BCC     loc_BANK2_8C65

      LDA     #0

loc_BANK2_8C65:
      STA     ObjectXAccel,X
      LDA     ObjectXLo,X
      SBC     #5
      STA     ObjectXLo,X
      LDA     ObjectXHi,X
      SBC     #0
      STA     ObjectXHi,X
      LDA     #$20
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
      LDY     #5

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
      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

EnemyInit_CrystalBallStarmanStopwatch:
      LDY     #5

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
      ADC     #0
      STA     ObjectXHi,X
      LDA     ScreenYLo
      ADC     #$E0
      STA     ObjectYLo,X
      LDA     ScreenYHi
      ADC     #0
      STA     ObjectYHi,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

locret_BANK2_8CF7:
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Starman:
      LDA     #$FC
      STA     ObjectYAccel,X
      LDY     #$F8
      LDA     byte_RAM_10
      STA     EnemyArray_45C,X
      BPL     loc_BANK2_8D07

      LDY     #8

loc_BANK2_8D07:
      STY     ObjectXAccel,X
      JMP     loc_BANK2_8574

; ---------------------------------------------------------------------------

EnemyBehavior_JarGenerators:
      JSR     sub_BANK3_B4FD

      AND     #3
      BNE     loc_BANK2_8D16

      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

loc_BANK2_8D16:
      INC     EnemyArray_9F,X
      LDA     EnemyArray_9F,X
      ASL     A
      BNE     locret_BANK2_8D5E

      JSR     CreateEnemy

      BMI     locret_BANK2_8D5E

      LDY     byte_RAM_0
      LDA     ObjectXLo,Y
      SEC
      SBC     #6
      STA     ObjectXLo,Y
      LDA     ObjectYLo,Y
      SBC     #4
      STA     ObjectYLo,Y
      LDA     ObjectYHi,Y
      SBC     #0
      STA     ObjectYHi,Y
      LDA     #$1A
      STA     EnemyArray_480,Y
      LDA     #$F8
      STA     ObjectYAccel,Y
      LDA     ObjectType,X
      CMP     #Enemy_JarGeneratorBobOmb
      BNE     locret_BANK2_8D5E

      LDA     #Enemy_BobOmb
      STA     ObjectType,Y
      LDA     ObjectXAccel,Y
      ASL     A
      STA     ObjectXAccel,Y
      LDA     #$FF
      STA     EnemyTimer,Y

locret_BANK2_8D5E:
      RTS

; =============== S U B R O U T I N E =======================================

EnemyInit_Hawkmouth:
      DEC     ObjectYLo,X
      DEC     ObjectYLo,X
      LDY     #1
      STY     byte_RAM_711F
      INY
      STY     byte_RAM_710B

; End of function EnemyInit_Hawkmouth

; =============== S U B R O U T I N E =======================================

EnemyInit_Stationary:
; DATA XREF: ...
      JSR     EnemyInit_Basic

loc_BANK2_8D6F:
      LDA     #0
      STA     ObjectXAccel,X
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

      LDA     #0
      STA     HawkmouthClosing
      LDA     #1
      STA     TransitionType
      JSR     sub_BANKF_F6DA

      LDY     byte_RAM_629
      LDA     CurrentWorld
      CMP     #6
      BNE     loc_BANK2_8DAC

      INY

loc_BANK2_8DAC:
      CPY     #2
      BCC     loc_BANK2_8DB4

      INC     byte_RAM_627
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_8DB4:
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
      AND     #4
      BNE     loc_BANK2_8E05

      INC     CrystalAndHawkmouthOpenSize
      LDA     byte_RAM_10
      AND     #3
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

      LDA     #6
      STA     PlayerState
      LDA     #$30
      STA     PlayerStateTimer
      LDA     #$FC
      STA     PlayerYAccel
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
      ADC     #8
      CPY     #0
      BNE     loc_BANK2_8E44

      ADC     #7

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
      ADC     #8
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

; ---------------------------------------------------------------------------
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
; ---------------------------------------------------------------------------

EnemyBehavior_Trouter:
      JSR     sub_BANK2_997A

      INC     EnemyArray_9F,X
      JSR     sub_BANK2_98D6

      JSR     sub_BANK2_98CD

      LDA     #9
      LDY     ObjectYAccel,X
      BMI     loc_BANK2_8E9A

      LDA     #$89

loc_BANK2_8E9A:
      STA     ObjectAttributes,X
      LDY     IsHorizontalLevel
      LDA     ObjectYLo,X
      CMP     byte_BANK2_8E85,Y

loc_BANK2_8EA3:
      BCC     loc_BANK2_8EB6

      LDY     EnemyTimer,X
      BNE     locret_BANK2_8E78

      STA     ObjectYLo,X
      LDY     EnemyArray_B1,X
      LDA     byte_BANK2_8E79,Y
      STA     ObjectYAccel,X
      LDA     #$C0
      STA     EnemyTimer,X

loc_BANK2_8EB6:
      JSR     sub_BANK2_9430

      INC     ObjectYAccel,X
      JMP     RenderSprite

; ---------------------------------------------------------------------------
byte_BANK2_8EBE:
      .BYTE $FA

      .BYTE $0C
byte_BANK2_8EC0:
      .BYTE $91

      .BYTE $11
; ---------------------------------------------------------------------------

EnemyBehavior_Hoopstar:
      JSR     sub_BANK2_997A

      INC     EnemyArray_9F,X
      JSR     sub_BANK2_98CD

      JSR     RenderSprite

      JSR     sub_BANK2_98D6

      LDA     #0
      STA     ObjectXAccel,X
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
      AND     #1
      BPL     loc_BANK2_8EEF

loc_BANK2_8EEC:
      TYA
      EOR     #1

loc_BANK2_8EEF:
      STA     EnemyArray_477,X
      TAY

loc_BANK2_8EF3:
      LDA     byte_BANK2_8EBE,Y
      STA     ObjectYAccel,X
      LDA     byte_BANK2_8EC0,Y
      STA     ObjectAttributes,X
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_RAM_F
      ADC     #$10
      CMP     #$20
      BCS     loc_BANK2_8F0A

      ASL     ObjectYAccel,X

loc_BANK2_8F0A:
      JMP     sub_BANK2_9E4B

; ---------------------------------------------------------------------------

EnemyBehavior_00:
      LDA     byte_RAM_EF
      BEQ     loc_BANK2_8F14

      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

loc_BANK2_8F14:
      LDY     #$FC
      LDA     byte_RAM_10
      AND     #$20
      BEQ     loc_BANK2_8F1E

      LDY     #4

loc_BANK2_8F1E:
      STY     ObjectXAccel,X
      LDA     #$F8
      STA     ObjectYAccel,X
      JSR     sub_BANK2_9430

loc_BANK2_8F27:
      LDA     byte_RAM_EE
      AND     #8
      ORA     byte_RAM_EF
      BNE     locret_BANK2_8F4E

      LDY     byte_RAM_F4 ; This part of the code seems to only run
      LDA     SpriteTempScreenY ; if the graph we're trying to draw is
      STA     SpriteDMAArea,Y ; a heart sprite ...
      LDA     SpriteTempScreenX
      STA     SpriteDMAArea+3,Y
      LDA     #$D8
      STA     SpriteDMAArea+1,Y
      LDA     byte_RAM_10
      AND     #$20
      EOR     #$20
      ASL     A
      ORA     #1
      STA     SpriteDMAArea+2,Y

locret_BANK2_8F4E:
      RTS

; ---------------------------------------------------------------------------
Enemy_Birdo_Attributes:
      .BYTE ObjAttrib_Palette3|ObjAttrib_16x32
      .BYTE ObjAttrib_Palette1|ObjAttrib_16x32
      .BYTE ObjAttrib_Palette2|ObjAttrib_16x32

; =============== S U B R O U T I N E =======================================

EnemyInit_Birdo:
      JSR     EnemyInit_Basic

      LDY     #$00 ; Default to the Gray Birdo
; (fires only fireballs)
      LDA     ObjectXLo,X ; Check if this is a special Birdo.
      CMP     #$A0
; means this is a Pink Birdo
; (fires only eggs, slowly)
      BEQ     loc_BANK2_8F63

      INY
      CMP     #$B0
; X position on page = B
      BEQ     loc_BANK2_8F63 ; If yes, this is a Red Birdo
; (fires eggs and fireballs)

      INY

loc_BANK2_8F63:
      STY     EnemyVariable,X ; Set the Birdo type
      LDA     Enemy_Birdo_Attributes,Y
      STA     ObjectAttributes,X
      LDA     #2
      STA     EnemyHP,X

loc_BANK2_8F6F:
      LDA     ObjectXHi,X
      STA     unk_RAM_4EF,X
      RTS

; End of function EnemyInit_Birdo

; ---------------------------------------------------------------------------
ProjectileLaunchXOffsets:
      .BYTE $FE

      .BYTE $F8
; ---------------------------------------------------------------------------

EnemyBehavior_Birdo:
      JSR     sub_BANK2_997A

      JSR     sub_BANK3_B4FD

      LDA     #0
      STA     ObjectXAccel,X
      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      STY     EnemyMovementDirection,X
      JSR     RenderSprite

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_8FD2

      JSR     sub_BANK2_95CE

      LDA     byte_RAM_10
      BNE     loc_BANK2_8FA3

      LDA     #$E0
      STA     ObjectYAccel,X
      BNE     loc_BANK2_8FD2

; ---------------------------------------------------------------------------
byte_BANK2_8F9D:
      .BYTE $7F

      .BYTE $3F
      .BYTE $3F
BirdoHealthEggProbabilities:
      .BYTE $08
      .BYTE $06 ; Health-based Birdo egg/fire chances.
      .BYTE $04 ; If PRNG & $1F >= this, shoot an egg
; Otherwise, shoot a fireball
; ---------------------------------------------------------------------------

loc_BANK2_8FA3:
      LDY     EnemyVariable,X
      LDA     byte_BANK2_8F9D,Y
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

      JSR     sub_BANK2_8B5B

      LDA     #$A
      LDY     EnemyArray_B1,X
      BMI     loc_BANK2_8FCD

      LDA     #$F6

loc_BANK2_8FCD:
      STA     ObjectXAccel,X
      JMP     sub_BANK2_9E50

; ---------------------------------------------------------------------------

loc_BANK2_8FD2:
      JMP     HandleObjectGravity

; ---------------------------------------------------------------------------

BirdoBehavior_SpitProjectile:
      CPY     #8
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
      BNE     sub_BANK2_9004

_Birdo_SpitEgg:
      LDA     #Enemy_Egg ; Shoot an egg

; =============== S U B R O U T I N E =======================================

sub_BANK2_9004:
      STA     ObjectType,X
      LDA     ObjectYLo,X
      CLC
      ADC     #3
      STA     ObjectYLo,X
      LDY     EnemyMovementDirection,X
      LDA     ObjectXLo,X
      ADC     ProjectileLaunchXOffsets-1,Y
      STA     ObjectXLo,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

loc_BANK2_901B:
      JMP     RenderSprite

; End of function sub_BANK2_9004

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
      JSR     sub_BANK2_8B5B

      LDA     ObjectYAccel,X
      CMP     #$EA
      BNE     EnemyBehavior_Mushroom1up

      LDA     #SoundEffect2_CoinGet
      STA     SoundEffectQueue2

EnemyBehavior_Mushroom1up:
      LDA     ObjectYAccel,X
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
      JSR     sub_BANK2_91C7

EnemyBehavior_Mushroom:
      LDA     ObjectBeingCarriedTimer,X
      CMP     #1
      BNE     loc_BANK2_9066

      LDA     PlayerDucking
      BEQ     loc_BANK2_9069

loc_BANK2_9066:
      JMP     EnemyBehavior_Bomb

; ---------------------------------------------------------------------------

loc_BANK2_9069:
      JSR     CarryObject

      LDA     #0
      STA     HoldingItem
      STA     ObjectBeingCarriedTimer,X
      JSR     TurnIntoPuffOfSmoke

      LDA     ObjectType,X
      CMP     #$44
      BNE     SomethingAboutPickingShitUp

      LDA     CrystalAndHawkmouthOpenSize
      BNE     locret_BANK2_908D

      LDA     #Music2_CrystalGetFanfare
      STA     MusicQueue2
      LDA     #$60
      STA     HawkmouthOpenTimer
      INC     CrystalAndHawkmouthOpenSize

locret_BANK2_908D:
      RTS

; ---------------------------------------------------------------------------

SomethingAboutPickingShitUp:
      CMP     #$40
      BEQ     loc_BANK2_90AD

      CMP     #$46
      BEQ     loc_BANK2_90BA

      CMP     #$3F
      BNE     loc_BANK2_90B1

      LDX     EnemyVariable
      INC     Mushroom1Pulled,X
      LDX     byte_RAM_12
      INC     PlayerMaxHealth
      JSR     RestorePlayerToFullHealth

      LDA     #Music2_MushroomGetJingle
      STA     MusicQueue2
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_90AD:
      LDA     #9
      STA     ObjectAttributes,X

loc_BANK2_90B1:
      LDA     #$E0
      STA     ObjectYAccel,X
      LDA     #1
      STA     EnemyState,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_90BA:
      LDA     #$FF
      STA     StopwatchTimer
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Key:
      JSR     sub_BANK2_91C7

EnemyBehavior_Bomb:
      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     EnemyMovementDirection,X
      BEQ     loc_BANK2_90D9

      JSR     EnemyBehavior_TurnAround

      JSR     sub_BANK2_95B0

loc_BANK2_90D3:
      JSR     sub_BANK2_95B0

      JSR     sub_BANK2_95B0

loc_BANK2_90D9:
      PLA
      AND     #4
      BEQ     loc_BANK2_90FB

      LDA     ObjectYAccel,X
      CMP     #9
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
      JSR     sub_BANK2_95CE

      LDA     byte_RAM_B
      BNE     loc_BANK2_90FB

      STA     ObjectXAccel,X

loc_BANK2_90FB:
      LDA     ObjectType,X
      CMP     #Enemy_Bomb
      BNE     EnemyBehavior_Vegetable

      LDA     EnemyTimer,X
      BNE     loc_BANK2_9122

      LDY     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_910D

      STA     HoldingItem
      STA     ObjectBeingCarriedTimer,X

loc_BANK2_910D:
      LDA     #EnemyState_BombExploding
      STA     EnemyState,X
      LDA     #$20
      STA     EnemyTimer,X
      STA     SkyFlashTimer
      LDA     #DPCM_DoorOpenBombBom
      STA     DPCMQueue
      LSR     A
      STA     EnemyArray_42F,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_9122:
      CMP     #$40
      BCS     EnemyBehavior_Vegetable

      LSR     A
      BCC     EnemyBehavior_Vegetable

      INC     ObjectAttributes,X
      LDA     ObjectAttributes,X
      AND     #$FB
      STA     ObjectAttributes,X

EnemyBehavior_Vegetable:
      JSR     sub_BANK2_98CD

      JSR     sub_BANK2_8577

loc_BANK2_9137:
      LDA     EnemyArray_B1,X
      BNE     loc_BANK2_913E

      JMP     sub_BANK2_9BA7

; ---------------------------------------------------------------------------

loc_BANK2_913E:
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

EnemyBehavior_SubspacePotion:
      JSR     sub_BANK2_98CD

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK2_9157

      JSR     EnemyBehavior_TurnAround

      JSR     sub_BANK2_95B0

      JSR     sub_BANK2_95B0

loc_BANK2_9157:
      PLA
      AND     #CollisionFlags_Down
      BEQ     EnemyBehavior_Vegetable

      JSR     sub_BANK2_95CE

      LDA     ObjectYLo,X
      SEC
      SBC     #$10
      STA     ObjectYLo,X
      LDA     ObjectXLo,X
      ADC     #7
      AND     #$F0
      STA     ObjectXLo,X
      LDA     ObjectXHi,X
      ADC     #0
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
      JSR     sub_BANK2_89A9

loc_BANK2_9198:
      JSR     CreateEnemy

      BMI     locret_BANK2_91C4

      LDY     byte_RAM_0
      LDA     ObjectXLo,X
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      STA     ObjectXHi,Y
      LDA     #$41
      STA     ObjectAttributes,Y
      TYA
      TAX

; =============== S U B R O U T I N E =======================================

; X = Enemy index of object to poof

TurnIntoPuffOfSmoke:
      LDA     ObjectAttributes,X ; Get current object sprite attributes...
      AND     #ObjAttrib_Palette0|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08|ObjAttrib_Mirrored|ObjAttrib_Unknown_20|ObjAttrib_16x32|ObjAttrib_UpsideDown
      ORA     #$01 ; Clear current palette, then set to $01
      STA     ObjectAttributes,X
      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,X ; WINNERS DON'T
; SMOKE SHROOMS
      STA     EnemyArray_9F,X ; No idea what this address is for
      LDA     #$1F
      STA     EnemyTimer,X ; Puff-of-smoke animation timer?
      LDX     byte_RAM_12

locret_BANK2_91C4:
      RTS

; End of function TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------
byte_BANK2_91C5:
      .BYTE $F8

      .BYTE $08

; =============== S U B R O U T I N E =======================================

sub_BANK2_91C7:
      LDA     EnemyVariable,X
      BNE     loc_BANK2_91DE

      LDY     #5

loc_BANK2_91CD:
      LDA     EnemyState,Y
      CMP     #EnemyState_Alive
      BNE     loc_BANK2_91DB

      LDA     ObjectType,Y
      CMP     #Enemy_Birdo
      BEQ     loc_BANK2_91E5

loc_BANK2_91DB:
      DEY
      BPL     loc_BANK2_91CD

loc_BANK2_91DE:
      LDA     #1
      STA     EnemyVariable,X
      JMP     SetEnemyAttributes

; ---------------------------------------------------------------------------

loc_BANK2_91E5:
      LDA     ObjectXHi,Y
      CMP     ObjectXHi,X
      BNE     loc_BANK2_91DE

      LDA     ObjectXLo,Y
      STA     ObjectXLo,X
      LDA     ObjectYLo,Y
      ADC     #$E
      STA     ObjectYLo,X
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_BANK2_91C5,Y
      STA     ObjectXAccel,X
      LDA     #$E0
      STA     ObjectYAccel,X
      PLA
      PLA
      LDA     #7
      STA     EnemyArray_46E,X
      LDA     #$30
      STA     byte_RAM_F4
      JMP     RenderSprite

; End of function sub_BANK2_91C7

; ---------------------------------------------------------------------------
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
      STA     ObjectXAccel,X
      INC     EnemyArray_B1,X
      LDA     ObjectType,X
      SEC

loc_BANK2_9228:
      SBC     #$B
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

      INC     EnemyArray_9F,X
      LDA     EnemyArray_B1,X
      BNE     loc_BANK2_9271

      LDA     EnemyCollision,X
      AND     #CollisionFlags_10
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
      JSR     sub_BANK2_997A

loc_BANK2_9274:
      JMP     sub_BANK2_9E50

; ---------------------------------------------------------------------------

EnemyBehavior_AutobombFire:
      JSR     sub_BANK2_9289

; =============== S U B R O U T I N E =======================================

sub_BANK2_927A:
      ASL     ObjectAttributes,X
      LDA     byte_RAM_10
      LSR     A
      LSR     A
      LSR     A
      ROR     ObjectAttributes,X
      RTS

; End of function sub_BANK2_927A

; ---------------------------------------------------------------------------
      .BYTE $D0
      .BYTE $03
; ---------------------------------------------------------------------------

EnemyBehavior_BulletAndEgg:
      JSR     sub_BANK3_B4FD

; =============== S U B R O U T I N E =======================================

sub_BANK2_9289:
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_98CD

      LDA     EnemyArray_B1,X
      ORA     EnemyArray_42F,X
      BEQ     loc_BANK2_9299

      JMP     loc_BANK2_8574

; ---------------------------------------------------------------------------

loc_BANK2_9299:
      LDA     ObjectYAccel,X
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

      JSR     sub_BANK2_95B0

      JSR     sub_BANK2_95B0

loc_BANK2_92BE:
      JSR     sub_BANK2_9E50

      JMP     RenderSprite

; End of function sub_BANK2_9289

; =============== S U B R O U T I N E =======================================

; See CreateEnemy, but this tests all 6 slots instead of just the first 6.

CreateEnemy_TryAllSlots:
      LDY     #8
      BNE     loc_BANK2_92CA

; End of function CreateEnemy_TryAllSlots

; =============== S U B R O U T I N E =======================================

; Creates a generic red Shyguy enemy and
; does some basic initialization for it.
;
; Checks the first 6 object slots.
;
; Returns Y=FF if couldn't create one.

CreateEnemy:
      LDY     #5

loc_BANK2_92CA:
      LDA     EnemyState,Y
      BEQ     loc_BANK2_92D3

      DEY
      BPL     loc_BANK2_92CA

      RTS

; ---------------------------------------------------------------------------

loc_BANK2_92D3:
      LDA     #EnemyState_Alive
      STA     EnemyState,Y
      LSR     A
      STA     unk_RAM_49B,Y
      LDA     #Enemy_ShyguyRed
      STA     ObjectType,Y
      LDA     ObjectXLo,X
      ADC     #5
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      ADC     #0
      STA     ObjectXHi,Y
      LDA     ObjectYLo,X
      STA     ObjectYLo,Y
      LDA     ObjectYHi,X
      STA     ObjectYHi,Y
      STY     byte_RAM_0
      TYA
      TAX
      JSR     EnemyInit_Basic

      JSR     sub_BANK2_8569

      LDX     byte_RAM_12
      RTS

; End of function CreateEnemy

; ---------------------------------------------------------------------------
byte_BANK2_9306:
      .BYTE $01

      .BYTE $FF
byte_BANK2_9308:
      .BYTE $30

      .BYTE $D0
byte_BANK2_930A:
      .BYTE $01

      .BYTE $FF
      .BYTE $01
byte_BANK2_930D:
      .BYTE $18

      .BYTE $E8
      .BYTE $18
; ---------------------------------------------------------------------------

EnemyBehavior_Phanto:
      LDA     EnemyArray_44A,X
      BEQ     loc_BANK2_9318

      DEC     EnemyArray_44A,X

loc_BANK2_9318:
      JSR     RenderSprite

      LDY     #1
      LDA     HoldingItem
      BEQ     loc_BANK2_933B

      LDX     byte_RAM_42D
      LDA     ObjectType,X
      LDX     byte_RAM_12
      CMP     #Enemy_Key ; Strange code. Phanto only chases you if you have the key.
      BCC     loc_BANK2_933B ; So you should just be able to use BEQ/BNE.
; This way seems to imply that Phanto would
; chase you if you were carrying a range of items,
; but...  what could those items have been?

      CMP     #Enemy_SubspacePotion ; BuT Instead we do it like this for... reasons.
      BCS     loc_BANK2_933B ; Nintendo.

      LDA     byte_RAM_5BC
      CMP     #$A0
      BNE     loc_BANK2_933A

      DEC     byte_RAM_5BC

loc_BANK2_933A:
      DEY

loc_BANK2_933B:
      LDA     ObjectYHi,X
      CLC
      ADC     #1
      STA     byte_RAM_5
      LDA     PlayerYLo
      CMP     ObjectYLo,X
      LDX     PlayerYHi
      INX
      TXA
      LDX     byte_RAM_12
      SBC     byte_RAM_5
      BPL     loc_BANK2_9351

      INY

loc_BANK2_9351:
      LDA     ObjectYAccel,X
      CMP     byte_BANK2_930D,Y
      BEQ     loc_BANK2_935E

      CLC
      ADC     byte_BANK2_930A,Y
      STA     ObjectYAccel,X

loc_BANK2_935E:
      LDA     EnemyArray_480,X
      CLC
      ADC     #$A0
      STA     EnemyArray_480,X
      BCC     loc_BANK2_937F

      LDA     EnemyArray_477,X
      AND     #1
      TAY
      LDA     ObjectXAccel,X
      CLC
      ADC     byte_BANK2_9306,Y
      STA     ObjectXAccel,X
      CMP     byte_BANK2_9308,Y
      BNE     loc_BANK2_937F

      INC     EnemyArray_477,X

loc_BANK2_937F:
      LDA     IsHorizontalLevel
      BEQ     loc_BANK2_9388

      LDA     PlayerXAccel
      STA     EnemyArray_4CC,X

loc_BANK2_9388:
      LDY     byte_RAM_5BC
      BEQ     loc_BANK2_93B4

      CPY     #$A0
      BEQ     loc_BANK2_93AB

      CPY     #$80
      BNE     loc_BANK2_939A

      LDA     #$40
      STA     EnemyArray_45C,X

loc_BANK2_939A:
      CPY     #$40
      BNE     loc_BANK2_93A8

      LDA     #$40
      STA     EnemyArray_44A,X

loc_BANK2_93A3:
      LDA     #SoundEffect3_Rumble_B
      STA     SoundEffectQueue3

loc_BANK2_93A8:
      DEC     byte_RAM_5BC

loc_BANK2_93AB:
      LDA     #0
      STA     EnemyArray_4CC,X
      STA     ObjectXAccel,X
      STA     ObjectYAccel,X

loc_BANK2_93B4:
      JMP     sub_BANK2_9430

; ---------------------------------------------------------------------------
byte_BANK2_93B7:
      .BYTE $E8

      .BYTE $D0
      .BYTE $D8
      .BYTE $D0
; ---------------------------------------------------------------------------

EnemyBehavior_NinjiJumping:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_940C

      LDA     EnemyArray_42F,X
      BNE     loc_BANK2_93C8

      STA     ObjectXAccel,X

loc_BANK2_93C8:
      TXA
      ASL     A
      ASL     A
      ASL     A
      ADC     byte_RAM_10
      AND     #$3F
      BNE     loc_BANK2_940C

      LDA     EnemyArray_9F,X
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      TAY
      LDA     byte_BANK2_93B7,Y
      BNE     loc_BANK2_9401

EnemyBehavior_NinjiRunning:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_940C

      LDA     PlayerYLo
      CLC
      ADC     #$10
      CMP     ObjectYLo,X
      BNE     loc_BANK2_940C

      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      TYA
      CMP     EnemyMovementDirection,X
      BNE     loc_BANK2_940C

      LDA     byte_RAM_F
      ADC     #$28
      CMP     #$50
      BCS     loc_BANK2_940C

      LDA     #$D8

loc_BANK2_9401:
      STA     ObjectYAccel,X
      LDA     EnemyArray_9F,X
      AND     #$F0
      STA     EnemyArray_9F,X
      JSR     sub_BANK2_9E4B

loc_BANK2_940C:
      JMP     EnemyBehavior_BasicWalker

; ---------------------------------------------------------------------------

EnemyBehavior_Beezo:
      JSR     sub_BANK2_997A

      JSR     RenderSprite

      INC     EnemyArray_9F,X
      JSR     sub_BANK2_98D6

      JSR     sub_BANK2_8B5B

loc_BANK2_941D:
      JSR     sub_BANK2_98CD

      LDA     ObjectYAccel,X
      BEQ     loc_BANK2_9436

      BPL     loc_BANK2_9429

      STA     EnemyArray_42F,X

loc_BANK2_9429:
      LDA     byte_RAM_10
      LSR     A
      BCC     sub_BANK2_9430

      DEC     ObjectYAccel,X

; =============== S U B R O U T I N E =======================================

sub_BANK2_9430:
      JSR     sub_BANK2_9E50

      JMP     sub_BANK2_9E4B

; End of function sub_BANK2_9430

; ---------------------------------------------------------------------------

loc_BANK2_9436:
      JSR     sub_BANK2_9E50

loc_BANK2_9439:
      JMP     sub_BANK2_9430

; ---------------------------------------------------------------------------
BulletProjectileXSpeeds:
      .BYTE $20

      .BYTE $E0
; ---------------------------------------------------------------------------

EnemyBehavior_BobOmb:
      LDY     EnemyTimer,X
      CPY     #$3A
      BCS     EnemyBehavior_BasicWalker

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_944E

      LDA     #0
      STA     ObjectXAccel,X

loc_BANK2_944E:
      DEC     EnemyArray_9F,X
      TYA
      BNE     loc_BANK2_945E

      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_945B

      STY     HoldingItem
      STY     ObjectBeingCarriedTimer,X

loc_BANK2_945B:
      JMP     loc_BANK2_910D

; ---------------------------------------------------------------------------

loc_BANK2_945E:
      CMP     #$30
      BCS     EnemyBehavior_BasicWalker

      LSR     A
      BCC     EnemyBehavior_BasicWalker

      INC     ObjectAttributes,X
      LDA     ObjectAttributes,X
      AND     #$FB
      STA     ObjectAttributes,X

EnemyBehavior_BasicWalker:
      JSR     sub_BANK3_B4FD

loc_BANK2_9470:
      JSR     sub_BANK2_997A

      LDA     EnemyArray_480,X
      BEQ     loc_BANK2_9492

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Up
      BEQ     loc_BANK2_9481

      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

loc_BANK2_9481:
      DEC     EnemyArray_480,X
      INC     EnemyTimer,X

; =============== S U B R O U T I N E =======================================

sub_BANK2_9486:
      LDA     ObjectAttributes,X
      ORA     #$20
      STA     ObjectAttributes,X
      JSR     sub_BANK2_9E4B

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

      JSR     sub_BANK2_95B0

      JSR     sub_BANK2_95B0

loc_BANK2_94A6:
      INC     EnemyArray_9F,X
      JSR     sub_BANK2_98CD

loc_BANK2_94AB:
      JSR     RenderSprite

      LDA     ObjectType,X
      CMP     #Enemy_SnifitGray
      BNE     loc_BANK2_94BB

      LDA     EnemyArray_42F,X
      BNE     loc_BANK2_94BB

      STA     ObjectXAccel,X

loc_BANK2_94BB:
      JSR     sub_BANK2_8577

      LDA     EnemyCollision,X
      LDY     ObjectYAccel,X
      BPL     loc_BANK2_9503

      AND     #8
      BEQ     loc_BANK2_94CD

      LDA     #0
      STA     ObjectYAccel,X
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
      LDA     ObjectYAccel,X ; check if enemy is starting to fall
      CMP     #$FE
      BNE     EnemyBehavior_Walk

      LDA     PseudoRNGValues+2 ; check random number generator
      BPL     EnemyBehavior_Walk

      JSR     CreateBullet

EnemyBehavior_Walk:
      DEC     EnemyArray_9F,X
      LDA     ObjectType,X
      CMP     #Enemy_SnifitPink
      BEQ     EnemyBehavior_TurnAtCliff

      CMP     #Enemy_ShyguyPink
      BNE     EnemyBehavior_BasicWalkerExit

EnemyBehavior_TurnAtCliff:
      LDA     EnemyArray_42F,X
      BNE     EnemyBehavior_BasicWalkerExit

      LDA     EnemyArray_477,X
      BNE     EnemyBehavior_BasicWalkerExit

      INC     EnemyArray_477,X
      JMP     EnemyBehavior_TurnAround

; ---------------------------------------------------------------------------

; exit enemy movement
EnemyBehavior_BasicWalkerExit:
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_9503:
      AND     #4
      BEQ     loc_BANK2_94CD

      LDA     #0
      STA     EnemyArray_477,X
      LDY     ObjectType,X ; Get the current object ID
      CPY     #Enemy_Tweeter ; Check if this enemy is a Tweeter
      BNE     loc_BANK2_9528 ; If not, go handle some other enemies

      LDA     #$3F
      JSR     sub_BANK2_9599 ; ...but very, very, very rarely, only
; when their timer (that incremenets once per bounce)
; hits #$3F -- almost unnoticable

      INC     EnemyVariable,X ; Make small jump 3 times, then make big jump
      LDY     #$F0
      LDA     EnemyVariable,X
      AND     #$03 ; Check if the timer is a multiple of 4
      BNE     loc_BANK2_9523 ; If not, skip over the next bit

      LDY     #$E0

loc_BANK2_9523:
      STY     ObjectYAccel,X ; Set Y accelleration for bouncing
      JMP     sub_BANK2_9E4B

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

      LDA     #$7F
      CPY     #Enemy_SnifitRed
      BEQ     loc_BANK2_9562

      CPY     #Enemy_SnifitRed
      BEQ     loc_BANK2_9562

      CPY     #Enemy_SnifitPink
      BEQ     loc_BANK2_9562

      CPY     #Enemy_SnifitGray
      BNE     loc_BANK2_959D

      LDA     EnemyArray_42F,X
      BNE     loc_BANK2_959D

      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      STY     EnemyMovementDirection,X
      LDA     EnemyArray_9F,X
      AND     #$3F
      BNE     loc_BANK2_9562

      LDA     #$E8
      STA     ObjectYAccel,X
      JMP     sub_BANK2_9E4B

; ---------------------------------------------------------------------------

loc_BANK2_9562:
      LDA     EnemyArray_44A,X
      BEQ     loc_BANK2_9574

loc_BANK2_9567:
      DEC     EnemyArray_9F,X
      DEC     EnemyArray_44A,X
      BNE     loc_BANK2_9574

      JSR     CreateBullet

      JMP     loc_BANK2_95BB

; ---------------------------------------------------------------------------

loc_BANK2_9574:
      TXA
      ASL     A
      ASL     A
      ASL     A
      ADC     byte_RAM_10
      ASL     A
      BNE     loc_BANK2_9597

      LDA     ObjectType,X
      CMP     #6
      BNE     loc_BANK2_9589

      JSR     CreateBullet

      JMP     loc_BANK2_95CA

; ---------------------------------------------------------------------------

loc_BANK2_9589:
      LDA     ObjectYLo,X
      SEC
      SBC     #$10
      CMP     PlayerYLo
      BNE     loc_BANK2_9597

      LDA     #$30
      STA     EnemyArray_44A,X

loc_BANK2_9597:
      LDA     #$7F

; =============== S U B R O U T I N E =======================================

sub_BANK2_9599:
      AND     EnemyArray_9F,X
      BEQ     loc_BANK2_95B8

loc_BANK2_959D:
      LDA     EnemyArray_42F,X
      BEQ     loc_BANK2_95BB

      LDA     ObjectYAccel,X
      CMP     #$1A
      BCC     loc_BANK2_95B8

      LDA     #$F0

; End of function sub_BANK2_9599

; =============== S U B R O U T I N E =======================================

sub_BANK2_95AA:
      JSR     sub_BANK2_95D0

      JSR     sub_BANK2_9E4B

; End of function sub_BANK2_95AA

; =============== S U B R O U T I N E =======================================

sub_BANK2_95B0:
      LDA     ObjectXAccel,X
      STA     byte_RAM_0
      ASL     A
      ROR     ObjectXAccel,X
      RTS

; End of function sub_BANK2_95B0

; ---------------------------------------------------------------------------

loc_BANK2_95B8:
      JSR     EnemyInit_BasicWithoutTimer

loc_BANK2_95BB:
      LDA     ObjectType,X
      CMP     #1
      BNE     loc_BANK2_95CA

      LDA     ObjectYAccel,X
      CMP     #4
      BCC     loc_BANK2_95CA

      JSR     EnemyInit_BasicWithoutTimer

loc_BANK2_95CA:
      ASL     ObjectAttributes,X
      LSR     ObjectAttributes,X

; =============== S U B R O U T I N E =======================================

sub_BANK2_95CE:
      LDA     #0

; End of function sub_BANK2_95CE

; =============== S U B R O U T I N E =======================================

sub_BANK2_95D0:
      STA     ObjectYAccel,X
      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      LDA     ObjectYLo,X
      BCS     loc_BANK2_95E0

      ADC     #8
      BCC     loc_BANK2_95E0

      INC     ObjectYHi,X

loc_BANK2_95E0:
      AND     #$F0
      STA     ObjectYLo,X
      RTS

; End of function sub_BANK2_95D0

; =============== S U B R O U T I N E =======================================

sub_BANK2_95E5:
      JSR     CreateEnemy_TryAllSlots

      JMP     CreateBullet_WithSlotInY

; End of function sub_BANK2_95E5

; =============== S U B R O U T I N E =======================================

CreateBullet:
      JSR     CreateEnemy

CreateBullet_WithSlotInY:
      BMI     locret_BANK2_9606

      LDY     EnemyMovementDirection,X
      LDX     byte_RAM_0
      LDA     BulletProjectileXSpeeds-1,Y
      STA     ObjectXAccel,X
      LDA     #0
      STA     ObjectYAccel,X
      LDA     #Enemy_Bullet
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

locret_BANK2_9606:
      RTS

; End of function CreateBullet

; ---------------------------------------------------------------------------
byte_BANK2_9607:
      .BYTE $0A

      .BYTE $0E
      .BYTE $0A
      .BYTE $0D
      .BYTE $04
      .BYTE $07
      .BYTE $04
      .BYTE $06

; =============== S U B R O U T I N E =======================================

; This is run when the player is carrying
; something, to update its position to
; wherever the player is above their head

CarryObject:
      LDA     byte_RAM_9D
      EOR     #1
      TAY
      INY
      STY     EnemyMovementDirection,X
      LDA     PlayerXLo
      STA     ObjectXLo,X
      LDA     PlayerXHi
      STA     ObjectXHi,X

loc_BANK2_961F:
      LDA     PlayerYHi
      STA     byte_RAM_7
      LDA     PlayerYLo
      LDY     EnemyArray_489,X
      CPY     #3
      BEQ     loc_BANK2_9636

      CPY     #2
      BEQ     loc_BANK2_9636

      SBC     #$E
      BCS     loc_BANK2_9636

      DEC     byte_RAM_7

loc_BANK2_9636:
      LDY     PlayerAnimationFrame
      CPY     #SpriteAnimation_Ducking
      CLC
      BNE     loc_BANK2_964D

      LDY     PlayerCurrentSize
      CPY     #1
      LDY     CurrentCharacter
      BCC     loc_BANK2_964A

      INY
      INY
      INY
      INY

loc_BANK2_964A:
      ADC     byte_BANK2_9607,Y

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
      ADC     #0
      STA     ObjectYHi,X
      LDY     ObjectBeingCarriedTimer,X
      CPY     #5
      BCS     loc_BANK2_9686

      LDA     ObjectType,X
      CMP     #$32
      BCS     loc_BANK2_9686

      LDA     EnemyArray_438,X

loc_BANK2_967D:
      BNE     loc_BANK2_9681

      INC     EnemyArray_9F,X

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

      JSR     sub_BANK2_8577

      PLA
      PLA
      LDA     EnemyCollision,X
      PHA
      AND     #3
      BEQ     loc_BANK2_96D4

      LDA     #0
      STA     ObjectXAccel,X
      LDA     ObjectXLo,X
      ADC     #8
      AND     #$F0
      STA     ObjectXLo,X
      LDA     IsHorizontalLevel
      BEQ     loc_BANK2_96D4

      LDA     ObjectXHi,X
      ADC     #0
      STA     ObjectXHi,X

loc_BANK2_96D4:
      PLA
      LDY     ObjectYAccel,X
      BMI     locret_BANK2_9718

      AND     #4
      BEQ     locret_BANK2_9718

      LDA     byte_RAM_E
      CMP     #$16
      BNE     loc_BANK2_96EC

      LDA     ObjectXAccel,X
      BEQ     loc_BANK2_96EC

      LDA     #$14
      JMP     sub_BANK2_95D0

; ---------------------------------------------------------------------------

loc_BANK2_96EC:
      LDA     ObjectType,X
      CMP     #$3A
      BNE     loc_BANK2_96FF

      LDA     #$20
      STA     POWQuakeTimer
      LDA     #SoundEffect3_Rumble_B
      STA     SoundEffectQueue3
      JMP     sub_BANK2_98C4

; ---------------------------------------------------------------------------

loc_BANK2_96FF:
      LDA     ObjectYAccel,X
      CMP     #$16
      BCC     loc_BANK2_970D

      JSR     sub_BANK2_95CE

      LDA     #$F5
      JMP     sub_BANK2_95AA

; ---------------------------------------------------------------------------

loc_BANK2_970D:
      JSR     sub_BANK2_95CE

      LDA     EnemyVariable,X
      JSR     sub_BANK3_BC50

      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

locret_BANK2_9718:
      RTS

; End of function sub_BANK2_9692

; ---------------------------------------------------------------------------

EnemyBehavior_SubspaceDoor:
      LDA     #4
      STA     EnemyArray_489,X
      LDA     #2
      STA     EnemyMovementDirection,X
      LDY     SubspaceTimer
      BEQ     loc_BANK2_9741

      LDA     byte_RAM_10
      AND     #3
      BNE     loc_BANK2_9741

      LDY     PlayerState
      CPY     #7
      BEQ     loc_BANK2_9741

      DEC     SubspaceTimer
      BNE     loc_BANK2_9741

      STA     InSubspaceOrJar
      JSR     sub_BANKF_F6DA

      JMP     loc_BANK2_97FF

; ---------------------------------------------------------------------------

loc_BANK2_9741:
      LDA     EnemyArray_453,X
      BNE     locret_BANK2_9718

      LDA     byte_RAM_4B3
      BEQ     loc_BANK2_9753

      DEC     byte_RAM_4B3
      BNE     loc_BANK2_9753

      JMP     TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------

loc_BANK2_9753:
      LDA     ObjectAttributes,X
      ORA     #$40
      STA     ObjectAttributes,X
      LDY     byte_RAM_4BD
      LDA     byte_BANK2_9808,Y
      LDY     #0
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
      CMP     #1
      BNE     loc_BANK2_977F

      PLA
      EOR     #1
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
      SBC     #4
      STA     SpriteDMAArea+7,Y
      STA     SpriteDMAArea+$F,Y
      PLA
      STA     byte_RAM_F4

loc_BANK2_979A:
      JSR     loc_BANKF_FAFE

      CPY     byte_RAM_F4
      PHP
      LDA     EnemyMovementDirection,X
      CMP     #1
      BNE     loc_BANK2_97AA

      PLA
      EOR     #1
      PHA

loc_BANK2_97AA:
      PLP
      BCS     loc_BANK2_97AF

      STY     byte_RAM_F4

loc_BANK2_97AF:
      LDA     byte_RAM_4BD
      CMP     #$19
      BCC     loc_BANK2_97BA

      LDY     #0
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

      LDA     #0
      STA     byte_RAM_4BD
      JSR     sub_BANKF_F6DA

      LDA     TransitionType
      CMP     #1
      BNE     loc_BANK2_97F7

      INC     byte_RAM_627
      BNE     loc_BANK2_97FF

loc_BANK2_97F7:
      LDA     InSubspaceOrJar
      EOR     #2
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
; ---------------------------------------------------------------------------
      LDA     #1
      BNE     loc_BANK2_9843

      LDA     #0

loc_BANK2_9843:
      PHA
      LDY     #8

loc_BANK2_9846:
      LDA     EnemyState,Y
      BEQ     loc_BANK2_985C

      LDA     ObjectType,Y
      CMP     #Enemy_SubspaceDoor
      BNE     loc_BANK2_985C

      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,Y
      LDA     #$20
      STA     EnemyTimer,Y

loc_BANK2_985C:
      DEY
      BPL     loc_BANK2_9846

      JSR     CreateEnemy_TryAllSlots

      BMI     loc_BANK2_9896

      LDA     #0
      STA     byte_RAM_4BD
      STA     byte_RAM_4B3
      LDX     byte_RAM_0
      PLA
      STA     EnemyArray_477,X
      LDA     #$3C
      STA     ObjectType,X
      JSR     SetEnemyAttributes

      LDA     PlayerXLo
      ADC     #8
      AND     #$F0
      STA     ObjectXLo,X
      LDA     PlayerXHi
      ADC     #0
      STA     ObjectXHi,X
      LDA     PlayerYLo
      STA     ObjectYLo,X
      LDA     PlayerYHi
      STA     ObjectYHi,X
      LDA     #$41
      STA     ObjectAttributes,X
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_9896:
      PLA

locret_BANK2_9897:
      RTS

; ---------------------------------------------------------------------------
      .BYTE $1C
      .BYTE $E4
; ---------------------------------------------------------------------------

EnemyBehavior_Shell:
      JSR     sub_BANK3_B4FD

      JSR     sub_BANK2_98CD

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK2_98AE

; =============== S U B R O U T I N E =======================================

sub_BANK2_98A6:
      LDA     #SoundEffect1_EnemyHit
      STA     SoundEffectQueue1
      JMP     TurnIntoPuffOfSmoke

; End of function sub_BANK2_98A6

; ---------------------------------------------------------------------------

loc_BANK2_98AE:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_98B7

      JSR     sub_BANK2_95CE

loc_BANK2_98B7:
      JSR     RenderSprite

      LDY     EnemyMovementDirection,X
      LDA     locret_BANK2_9897,Y
      STA     ObjectXAccel,X
      JMP     sub_BANK2_8577

; =============== S U B R O U T I N E =======================================

sub_BANK2_98C4:
      LDA     #EnemyState_BlockFizzle
      STA     EnemyState,X
      LDA     #$18
      STA     EnemyTimer,X

locret_BANK2_98CC:
      RTS

; End of function sub_BANK2_98C4

; =============== S U B R O U T I N E =======================================

sub_BANK2_98CD:
      LDA     ObjectBeingCarriedTimer,X
      BEQ     locret_BANK2_98CC

      PLA
      PLA
      JMP     CarryObject

; End of function sub_BANK2_98CD

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
      LDA     #4

loc_BANK2_9914:
      STA     ObjectYAccel,X
      JMP     loc_BANK2_9921

; ---------------------------------------------------------------------------

loc_BANK2_9919:
      LDA     byte_RAM_10
      AND     #7
      BNE     loc_BANK2_9921

      INC     ObjectYAccel,X

loc_BANK2_9921:
      JSR     sub_BANK2_9E4B

      LDA     ObjectYLo,X
      CMP     #$F0
      BCC     loc_BANK2_9932

      LDA     #0
      STA     EnemyArray_B1,X
      LDA     EnemyVariable,X
      STA     ObjectYLo,X

loc_BANK2_9932:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK2_9935:
      LDA     #0

; =============== S U B R O U T I N E =======================================

sub_BANK2_9937:
      STA     byte_RAM_0
      LDX     #8

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

      LDA     #0
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
      STA     ObjectYAccel,X
      LDA     EnemyCollision,X
      ORA     #CollisionFlags_10
      STA     EnemyCollision,X

loc_BANK2_9974:
      DEX
      BPL     loc_BANK2_993B

      LDX     byte_RAM_12
      RTS

; End of function sub_BANK2_9937

; =============== S U B R O U T I N E =======================================

sub_BANK2_997A:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_10
      BEQ     locret_BANK2_99B3

      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_9988

      LDA     #0
      STA     HoldingItem

loc_BANK2_9988:
      LDY     ObjectType,X
      LDA     EnemyArray_46E_Data,Y
      AND     #8
      ASL     A
      BNE     loc_BANK2_999E

      LDA     DPCMQueue
      BNE     loc_BANK2_99A1

      LDA     #SoundEffect1_EnemyHit
      STA     SoundEffectQueue1
      BNE     loc_BANK2_99A1

loc_BANK2_999E:
      STA     DPCMQueue

loc_BANK2_99A1:
      CPY     #Enemy_Pidgit
      BNE     loc_BANK2_99AD

      LDA     EnemyArray_42F,X
      BNE     loc_BANK2_99AD

      JSR     sub_BANK3_A440

loc_BANK2_99AD:
      LDA     #EnemyState_Dead
      STA     EnemyState,X
      PLA
      PLA

locret_BANK2_99B3:
      RTS

; End of function sub_BANK2_997A

; ---------------------------------------------------------------------------
EnemyTilemap1:
      .BYTE $D0,$D2
      .BYTE $D4,$D6 ; @TODO Figure out what the difference is
      .BYTE $F8,$F8 ; between this and EnemyTilemap2
      .BYTE $FA,$FA
      .BYTE $CC,$CE
      .BYTE $CC,$CE
      .BYTE $C8,$CA
      .BYTE $C8,$CA
      .BYTE $70,$72
      .BYTE $74,$76
      .BYTE $C0,$C2
      .BYTE $C4,$C6
      .BYTE $E1,$E3
      .BYTE $E5,$E7
      .BYTE $E1,$E3
      .BYTE $E5,$E7
      .BYTE $78,$7A
      .BYTE $7C,$7E
      .BYTE $DC,$DA
      .BYTE $DC,$DE
      .BYTE $FE,$FE
      .BYTE $FC,$FC
      .BYTE $94,$94
      .BYTE $96,$96
      .BYTE $98,$98
      .BYTE $9A,$9A
      .BYTE $DB,$DD
      .BYTE $DB,$DD
      .BYTE $7D,$7F
      .BYTE $C1,$C3
      .BYTE $8C,$8C
      .BYTE $8E,$8E
      .BYTE $E0,$E2
      .BYTE $6B,$6D
      .BYTE $6D,$6F
      .BYTE $3A,$3A
      .BYTE $3A,$3A
      .BYTE $38,$38
      .BYTE $38,$38
      .BYTE $36,$36
      .BYTE $36,$36
      .BYTE $34,$34
      .BYTE $34,$34
      .BYTE $AE,$FB
      .BYTE $AE,$FB
      .BYTE $80,$82
      .BYTE $84,$86
      .BYTE $80,$82
      .BYTE $AA,$AC
      .BYTE $88,$8A
      .BYTE $84,$86
      .BYTE $88,$8A
      .BYTE $AA,$AC
      .BYTE $BC,$BE
      .BYTE $AA,$AC
      .BYTE $BC,$BE
      .BYTE $AA,$AC
      .BYTE $B5,$B9
      .BYTE $B5,$B9
      .BYTE $81,$83
      .BYTE $85,$87
      .BYTE $FF,$FF
      .BYTE $FF,$FF
      .BYTE $81,$83
      .BYTE $F5,$87
      .BYTE $C5,$C7
      .BYTE $C9,$CB
      .BYTE $92,$94
      .BYTE $29,$29
      .BYTE $2B,$2B
      .BYTE $3D,$3F
      .BYTE $4C,$4E
      .BYTE $50,$52
      .BYTE $4C,$4E
      .BYTE $56,$58
      .BYTE $FB,$5C
      .BYTE $FB,$5A
      .BYTE $FB,$FB
      .BYTE $FB,$54
      .BYTE $CF,$CF
      .BYTE $A5,$A5
      .BYTE $B0,$B2
      .BYTE $90,$90
      .BYTE $CD,$CD
      .BYTE $A8,$A8
      .BYTE $A8,$A8
      .BYTE $A0,$A2
      .BYTE $A4,$A4
      .BYTE $A4,$A4
      .BYTE $4D,$4D
      .BYTE $8C,$8C
      .BYTE $A6,$A6
      .BYTE $AB,$AB
EnemyAnimationTable:
      .BYTE $00
      .BYTE $00 ; 1 ; Not sure what this does, but it's some sort of
      .BYTE $08 ; 2 ; pointer that determines where an enemy's animation
      .BYTE $00 ; 3 ; frames are hiding.
      .BYTE $0C ; 4 ;
      .BYTE $10 ; 5 ; $FF means "none", used for the enemy-generating jars.
      .BYTE $10 ; 6 ; You could theoretically make them visible that way...
      .BYTE $10 ; 7 ;
      .BYTE $40 ; 8 ; These go in order of enemy indexes.
      .BYTE $14 ; 9
      .BYTE $18 ; $A
      .BYTE $18 ; $B
      .BYTE $18 ; $C
      .BYTE $20 ; $D
      .BYTE $20 ; $E
      .BYTE $24 ; $F
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
      SBC     #1

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
      ADC     #8
      STA     byte_RAM_1
      LDA     EnemyMovementDirection,X
      STA     byte_RAM_2
      LDA     #1
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

      JMP     loc_BANK3_AAB1

; ---------------------------------------------------------------------------

loc_BANK2_9B80:
      CPY     #Enemy_Heart ; ??? Compare against a Heart
      BNE     loc_BANK2_9B87

      JMP     loc_BANK2_8F27 ; This jump appears to never be taken;
; I don't think this code even runs with
; an enemy ID of 0 (heart)

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

      LDA     EnemyArray_46E,X
      AND     #$10
      STA     byte_RAM_B
      LDY     EnemyMovementDirection,X
      LDA     ObjectAttributes,X
      AND     #ObjAttrib_Palette0|ObjAttrib_Unknown_08|ObjAttrib_Mirrored
      BEQ     loc_BANK2_9BD2

      LDY     #2
      LDA     InSubspaceOrJar
      CMP     #2
      BNE     loc_BANK2_9BD2

      DEY

loc_BANK2_9BD2:
      STY     byte_RAM_2
      LDA     ObjectAttributes,X
      AND     #$44
      STA     byte_RAM_5
      LDA     SpriteTempScreenY
      STA     byte_RAM_0
      LDA     #0
      STA     word_RAM_C+1
      LDA     EnemyArray_44A,X
      AND     #2
      LSR     A
      LDY     byte_RAM_EE
      BEQ     loc_BANK2_9BEF

      LDA     #0

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
      AND     #3
      ORA     byte_RAM_8

loc_BANK2_9C07:
      STA     byte_RAM_3
      LDA     EnemyArray_46E,X
      STA     word_RAM_C
      ASL     A
      LDA     EnemyArray_9F,X
      LDX     byte_RAM_F
      AND     #8
      BEQ     loc_BANK2_9C31

      BCC     loc_BANK2_9C1F

      LDA     #1
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
      LDA     word_RAM_C
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
      AND     #4
      BEQ     loc_BANK2_9C53

      LDA     byte_RAM_EE
      STA     byte_RAM_8
      LDA     byte_RAM_2
      CMP     #1
      BNE     loc_BANK2_9C53

      LDA     byte_RAM_1
      ADC     #$F
      STA     byte_RAM_1
      ASL     byte_RAM_EE
      ASL     byte_RAM_EE

loc_BANK2_9C53:
      JSR     sub_BANK2_9CF2

      LDA     byte_RAM_5
      AND     #4
      BEQ     loc_BANK2_9C7A

      LDA     SpriteTempScreenY
      STA     byte_RAM_0
      LDA     SpriteTempScreenX
      STA     byte_RAM_1
      LDA     byte_RAM_8
      STA     byte_RAM_EE
      LDA     byte_RAM_2
      CMP     #1
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

      LDA     word_RAM_C
      AND     #$20
      BEQ     loc_BANK2_9CBD

      LDX     word_RAM_C+1
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

sub_BANK2_9CF2:
      LDA     word_RAM_C
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
      LDA     #0
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
      AND     #8
      BNE     loc_BANK2_9D48

      LDA     byte_RAM_0
      STA     SpriteDMAArea,Y

loc_BANK2_9D48:
      LDA     byte_RAM_EE
      AND     #4
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
      ADC     #8
      STA     SpriteDMAArea+7,Y
      TYA
      CLC
      ADC     #8
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
      LDA     #0
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
      AND     #8
      BNE     loc_BANK2_9DB7

      LDA     byte_RAM_0
      STA     SpriteDMAArea,Y

loc_BANK2_9DB7:
      LDA     byte_RAM_EE
      AND     #4
      BNE     loc_BANK2_9DC2

      LDA     byte_RAM_0
      STA     SpriteDMAArea+4,Y

loc_BANK2_9DC2:
      LDA     byte_RAM_EE
      AND     #2
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
      ADC     #8
      STA     SpriteDMAArea+7,Y
      ADC     #8
      STA     SpriteDMAArea+$B,Y
      TXA
      PHA
      JSR     loc_BANKF_FAFE

      PLA
      TAX
      LDA     word_RAM_C+1
      BNE     loc_BANK2_9DF0

      STY     word_RAM_C+1

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
      AND     #$C
      BNE     locret_BANK2_9E3A

      LDA     EnemyArray_9F,X
      AND     #$C
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

; =============== S U B R O U T I N E =======================================

; Compares our position to the player's, and returns
; Y = 1 (Player to left)
; Y = 0 (Player to right)

EnemyFindWhichSidePlayerIsOn:
      LDA     PlayerXLo
      SBC     ObjectXLo,X
      STA     byte_RAM_F
      LDA     PlayerXHi
      LDY     #0
      SBC     ObjectXHi,X
      BCS     locret_BANK2_9E4A

      INY

locret_BANK2_9E4A:
      RTS

; End of function EnemyFindWhichSidePlayerIsOn

; =============== S U B R O U T I N E =======================================

sub_BANK2_9E4B:
      TXA
      CLC
      ADC     #$A
      TAX

; End of function sub_BANK2_9E4B

; =============== S U B R O U T I N E =======================================

sub_BANK2_9E50:
      LDA     ObjectXAccel,X
      CLC
      ADC     EnemyArray_4CC,X
      PHA
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_1
      PLA
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      CMP     #8
      BCC     loc_BANK2_9E68

      ORA     #$F0

loc_BANK2_9E68:
      STA     byte_RAM_0
      LDY     #0
      ASL     A
      BCC     loc_BANK2_9E70

      DEY

loc_BANK2_9E70:
      STY     byte_RAM_2
      LDA     unk_RAM_408,X
      CLC
      ADC     byte_RAM_1
      STA     unk_RAM_408,X
      LDA     ObjectXLo,X
      ADC     byte_RAM_0
      STA     ObjectXLo,X
      ROL     byte_RAM_1
      CPX     #$A
      BCS     loc_BANK2_9E9E

      LDA     #0
      STA     unk_RAM_4A4,X
      LDA     ObjectType,X
      CMP     #Enemy_Bullet
      BEQ     loc_BANK2_9E9E

      CMP     #Enemy_BeezoDiving
      BEQ     loc_BANK2_9E9E

      CMP     #Enemy_BeezoStraight
      BEQ     loc_BANK2_9E9E

      LDY     IsHorizontalLevel
      BEQ     loc_BANK2_9EA6

loc_BANK2_9E9E:
      LSR     byte_RAM_1
      LDA     ObjectXHi,X
      ADC     byte_RAM_2
      STA     ObjectXHi,X

loc_BANK2_9EA6:
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK2_9E50

; =============== S U B R O U T I N E =======================================

EnemyBehavior_TurnAround:
; flip x-velocity
      LDA     ObjectXAccel,X
      EOR     #$FF
      CLC
      ADC     #$01
      STA     ObjectXAccel,X
; if the enemy is not moving, flip direction next
      BEQ     EnemyBehavior_TurnAroundExit

; flip enemy movement direction
      LDA     EnemyMovementDirection,X
      EOR     #$03 ; $01 XOR $03 = $02, $02 XOR $03 = $01
      STA     EnemyMovementDirection,X

EnemyBehavior_TurnAroundExit:
      JMP     sub_BANK2_9E50

; End of function EnemyBehavior_TurnAround

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $9EBD - $A02F
     .pad $A030, $FF
ENDIF

; ===========================================================================



; -------------------------------------------


EnemyTilemap2:
      .BYTE $2D,$2F
      .BYTE $2D,$2F ; 2 ; @TODO Figure out how this differs from
      .BYTE $E0,$E2 ; 4 ; EnemyTilemap1 and why
      .BYTE $E4,$E6 ; 6
      .BYTE $E0,$E2 ; 8
      .BYTE $E4,$E6 ; $A
      .BYTE $E8,$EA ; $C
      .BYTE $EC,$EE ; $E
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

      LDA     #4
      STA     EnemyHP,X
      LDA     #0
      STA     ObjectXAccel,X
      LDA     ObjectXLo,X
      CLC
      ADC     #4
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
      JSR     sub_BANK2_997A

      LDA     ObjectYLo,X
      CMP     #$70
      BCC     loc_BANK3_A147

      JSR     sub_BANK2_95CE

loc_BANK3_A147:
      LDA     EnemyTimer,X
      BNE     loc_BANK3_A179

      LDA     EnemyVariable,X
      AND     #$3F
      BNE     loc_BANK3_A168

      LDA     PseudoRNGValues+2
      AND     #3
      BEQ     loc_BANK3_A168

      LDY     ScreenBoundaryLeftLo
      DEY
      CPY     #$80
      BCC     loc_BANK3_A168

      LDA     #$7F
      STA     EnemyTimer,X
      LDY     #0
      BEQ     loc_BANK3_A174

loc_BANK3_A168:
      INC     EnemyVariable,X
      LDY     #$F0
      LDA     EnemyVariable,X
      AND     #$20
      BEQ     loc_BANK3_A174

      LDY     #$10

loc_BANK3_A174:
      STY     ObjectXAccel,X
      JMP     loc_BANK3_A1CD

; ---------------------------------------------------------------------------

loc_BANK3_A179:
      CMP     #$50
      BNE     loc_BANK3_A17D

loc_BANK3_A17D:
      CMP     #$20
      BNE     loc_BANK3_A1CD

      LDA     PseudoRNGValues+2
      AND     #7
      TAY
      LDA     unk_BANK3_A128,Y
      STA     ObjectYAccel,X
      DEC     ObjectYLo,X
      JSR     CreateEnemy

      BMI     loc_BANK3_A1CD

      LDY     byte_RAM_0
      LDA     ObjectYLo,X
      SEC
      SBC     #0
      STA     ObjectYLo,Y
      LDA     ObjectYHi,X
      SBC     #0
      STA     ObjectYHi,Y
      LDA     ObjectXLo,X
      CLC
      ADC     #8
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      ADC     #0
      STA     ObjectXHi,Y
      LDX     byte_RAM_0
      LDA     #$22
      STA     ObjectType,X
      LDA     PseudoRNGValues+2
      AND     #7
      TAY
      LDA     unk_BANK3_A120,Y
      STA     ObjectYAccel,X
      LDA     #$D0
      STA     ObjectXAccel,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

loc_BANK3_A1CD:
      JSR     sub_BANK2_9E50

      JSR     HandleObjectGravity

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
      LDA     #0
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
      LDA     #2
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
      AND     #7
      TAY
      LDA     SpriteTempScreenY
      SEC
      SBC     byte_BANK3_A1DC,Y
      STA     SpriteTempScreenY

loc_BANK3_A2AA:
      JSR     sub_BANK2_8894

      LDY     #0
IFDEF COMPATIBILITY
      .db $8c, $f4, $00 ; STY $00F4
ENDIF
IFNDEF COMPATIBILITY
      STY     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     ObjectAttributes,X
      PHA
      LDA     #2
      STA     ObjectAttributes,X
      LDA     EnemyArray_46E,X
      PHA
      LDA     #$10
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
      AND     #4
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
      LDA     #0
      STA     EnemyArray_45C,X
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_98CD

      JSR     sub_BANK2_9E50

      JSR     HandleObjectGravity

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #3
      BEQ     loc_BANK3_A30A

      JSR     EnemyBehavior_TurnAround

      JSR     sub_BANK2_95B0

loc_BANK3_A30A:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK3_A320

      LDA     ObjectYLo,X
      AND     #$F0
      STA     ObjectYLo,X
      LDA     ObjectYAccel,X
      LSR     A
      EOR     #$FF
      CLC
      ADC     #1
      STA     ObjectYAccel,X

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
      LDA     ObjectXAccel,X
      BPL     loc_BANK3_A338

      EOR     #$FF
      CLC
      ADC     #1

loc_BANK3_A338:
      CMP     #$20
      BCS     loc_BANK3_A344

      LSR     byte_RAM_0
      CMP     #8
      BCS     loc_BANK3_A344

      LSR     byte_RAM_0

loc_BANK3_A344:
      LDA     byte_RAM_0
      CLC
      ADC     #4
      AND     #8
      LSR     A
      LSR     A
      LSR     A
      LDY     ObjectXAccel,X
      BPL     loc_BANK3_A354

      EOR     #1

loc_BANK3_A354:
      STA     EnemyMovementDirection,X
      LDA     byte_RAM_0
      AND     #8
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      ORA     #2
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
      AND     #3
      BNE     loc_BANK3_A37C

      DEC     EnemyArray_B1,X
      BNE     loc_BANK3_A37C

      STA     byte_RAM_4B2
      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

loc_BANK3_A37C:
      LDA     byte_RAM_4B2
      BEQ     loc_BANK3_A38F

      LDA     PlayerYAccel
      BPL     loc_BANK3_A38F

      LDA     #0
      STA     ObjectYAccel,X
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
      LDA     ObjectXAccel,X
      BEQ     loc_BANK3_A3A5

      LDA     EnemyMovementDirection,X
      AND     #1
      STA     byte_RAM_9D

loc_BANK3_A3A5:
      LDA     ObjectYLo,X
      SEC
      SBC     #$1A
      STA     PlayerYLo
      LDA     ObjectYHi,X
      SBC     #0
      STA     PlayerYHi
      LDA     PlayerXLo
      SEC
      SBC     #8
      STA     ObjectXLo,X
      LDA     PlayerXHi
      SBC     #0
      STA     ObjectXHi,X
      LDY     #1
      LDA     ObjectXAccel,X
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
      CMP     ObjectXAccel,X
      BEQ     loc_BANK3_A3E3

      LDA     ObjectXAccel,X
      CLC
      ADC     byte_RAM_71CC,Y
      STA     ObjectXAccel,X

loc_BANK3_A3E3:
      JMP     loc_BANK3_A3EA

; ---------------------------------------------------------------------------

loc_BANK3_A3E6:
      LDA     #0
      STA     ObjectXAccel,X

loc_BANK3_A3EA:
      LDY     #1
      LDA     ObjectYAccel,X
      BMI     loc_BANK3_A3F2

      LDY     #$FF

loc_BANK3_A3F2:
      STY     byte_RAM_71CC
      LDA     #$20
      CMP     SpriteTempScreenY
      LDA     #0
      ROL     A
      ASL     A
      ASL     A
      ASL     A
      AND     Player1JoypadHeld
      BNE     loc_BANK3_A417

      LDA     EnemyCollision,X
      LSR     A
      LSR     A
      AND     #3
      STA     byte_RAM_0
      LDA     Player1JoypadHeld
      LSR     A
      LSR     A
      AND     #3
      TAY
      AND     byte_RAM_0
      BEQ     loc_BANK3_A41B

loc_BANK3_A417:
      LDA     #0
      BEQ     loc_BANK3_A428

loc_BANK3_A41B:
      LDA     byte_BANK3_A365,Y
      CMP     ObjectYAccel,X
      BEQ     loc_BANK3_A42A

      LDA     ObjectYAccel,X
      CLC
      ADC     byte_RAM_71CC,Y

loc_BANK3_A428:
      STA     ObjectYAccel,X

loc_BANK3_A42A:
      JSR     sub_BANK2_9E50

      JSR     sub_BANK2_9E4B

      LDA     EnemyArray_B1,X
      CMP     #$20
      BCS     loc_BANK3_A43D

      LDA     byte_RAM_10
      AND     #2

loc_BANK3_A43A:
      BNE     loc_BANK3_A43D

      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A43D:
      JMP     sub_BANK3_A552

; =============== S U B R O U T I N E =======================================

sub_BANK3_A440:
      JSR     CreateEnemy_TryAllSlots

      BMI     loc_BANK3_A478

      LDX     byte_RAM_0
      LDY     byte_RAM_12
      LDA     #0
      STA     ObjectXAccel,X
      STA     ObjectYAccel,X
      LDA     #$41
      STA     ObjectType,X
      LDA     ObjectXLo,Y
      SEC
      SBC     #8
      STA     ObjectXLo,X
      LDA     ObjectXHi,Y
      SBC     #0
      STA     ObjectXHi,X
      LDA     ObjectYLo,Y
      CLC
      ADC     #$E
      STA     ObjectYLo,X
      LDA     ObjectYHi,Y
      ADC     #0
      STA     ObjectYHi,X
      JSR     SetEnemyAttributes

      LDA     #$A0
      STA     EnemyArray_B1,X

loc_BANK3_A478:
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK3_A440

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
      JSR     sub_BANK2_997A

      INC     EnemyArray_9F,X
      LDA     EnemyArray_42F,X
      BEQ     loc_BANK3_A4A3

      LDA     ObjectAttributes,X
      ORA     #$80
      STA     ObjectAttributes,X
      JSR     sub_BANK3_A508

      JMP     sub_BANK2_8577

; ---------------------------------------------------------------------------

loc_BANK3_A4A3:
      JSR     sub_BANK2_98CD

      LDA     EnemyArray_B1,X
      BEQ     loc_BANK3_A4C1

      DEC     ObjectYAccel,X
      BPL     loc_BANK3_A4BE

      LDA     ObjectYLo,X
      CMP     #$30
      BCS     loc_BANK3_A4BE

      LDA     #0
      STA     EnemyArray_B1,X
      STA     ObjectXAccel,X
      STA     ObjectYAccel,X
      DEC     EnemyTimer,X

loc_BANK3_A4BE:
      JMP     loc_BANK3_A502

; ---------------------------------------------------------------------------

loc_BANK3_A4C1:
      LDA     EnemyTimer,X
      BNE     loc_BANK3_A4D6

      LDA     #$30
      STA     ObjectYAccel,X
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     unk_BANK3_A48B,Y
      STA     ObjectXAccel,X
      INC     EnemyArray_B1,X
      JMP     sub_BANK3_A508

; ---------------------------------------------------------------------------

loc_BANK3_A4D6:
      LDA     EnemyArray_480,X
      AND     #1
      TAY
      LDA     ObjectYAccel,X
      CLC
      ADC     unk_BANK3_A483,Y
      STA     ObjectYAccel,X
      CMP     unk_BANK3_A485,Y
      BNE     loc_BANK3_A4EC

      INC     EnemyArray_480,X

loc_BANK3_A4EC:
      LDA     EnemyArray_477,X
      AND     #1
      TAY
      LDA     ObjectXAccel,X
      CLC
      ADC     unk_BANK3_A487,Y
      STA     ObjectXAccel,X
      CMP     unk_BANK3_A489,Y
      BNE     loc_BANK3_A502

      INC     EnemyArray_477,X

loc_BANK3_A502:
      JSR     sub_BANK2_9E4B

      JSR     sub_BANK2_9E50

; =============== S U B R O U T I N E =======================================

sub_BANK3_A508:
      JSR     sub_BANK2_9BA7

      LDA     EnemyState,X
      SEC
      SBC     #1
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
      SBC     #8
      STA     ObjectXLo,X
      LDA     ObjectXHi,X
      PHA
      SBC     #0
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
      SBC     #7
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
      AND     #3
      LDY     ObjectXAccel,X
      BMI     loc_BANK3_A55F

      EOR     #3

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

      LDA     #2
      LDY     CurrentWorld
      BEQ     loc_BANK3_A577

      LDA     #4

loc_BANK3_A577:
      STA     EnemyHP,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Mouser:
      JSR     sub_BANK2_997A

      LDA     EnemyArray_45C,X
      BEQ     loc_BANK3_A586

      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_A586:
      JSR     sub_BANK3_B4FD

      LDA     #2
      STA     EnemyMovementDirection,X
      JSR     RenderSprite

      LDA     EnemyCollision,X
      AND     #4
      BEQ     loc_BANK3_A5F5

      JSR     sub_BANK2_95CE

      LDA     byte_RAM_10
      AND     #$FF
      BNE     loc_BANK3_A5A5

      LDA     #$D8
      STA     ObjectYAccel,X
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

      INC     EnemyArray_9F,X
      INC     EnemyArray_9F,X
      LDY     #$18
      LDA     EnemyArray_B1,X
      AND     #$40
      BNE     loc_BANK3_A5C9

      LDY     #$E8

loc_BANK3_A5C9:
      STY     ObjectXAccel,X
      JMP     sub_BANK2_9E50

; ---------------------------------------------------------------------------

loc_BANK3_A5CE:
      CPY     #$10
      BNE     locret_BANK3_A5F4

      JSR     CreateEnemy_TryAllSlots

      BMI     locret_BANK3_A5F4

      LDX     byte_RAM_0
      LDA     #$37
      STA     ObjectType,X
      LDA     ObjectYLo,X
      ADC     #3
      STA     ObjectYLo,X
      LDA     #$E0
      STA     ObjectYAccel,X
      JSR     SetEnemyAttributes

      LDA     #$FF
      STA     EnemyTimer,X
      LDA     #$E0
      STA     ObjectXAccel,X
      LDX     byte_RAM_12

locret_BANK3_A5F4:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A5F5:
      JMP     HandleObjectGravity

; ---------------------------------------------------------------------------

loc_BANK3_A5F8:
      LDA     EnemyState,X
      CMP     #1
      BNE     loc_BANK3_A609

      LDA     EnemyArray_45C,X
      BEQ     loc_BANK3_A612

      INC     EnemyArray_9F,X
      LDA     #$4A
      STA     ObjectAttributes,X

loc_BANK3_A609:
      LDA     #$B3
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

      LDA     #1
      STA     ObjectAttributes,X
      LDA     #$10
      STA     EnemyArray_46E,X
      LDA     SpriteTempScreenX
      CLC
      ADC     #$B
      STA     SpriteTempScreenX
      ASL     byte_RAM_EE
      LDY     #0
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
      LDA     #$33
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
      SBC     #2
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
      LDA     ObjectXAccel,X
      STA     ObjectXAccel,Y
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
      STA     EnemyArray_9F,X
      JSR     CreateEnemy

      BMI     loc_BANK3_A6DB

      LDY     byte_RAM_0
      LDA     ObjectXAccel,X
      STA     ObjectXAccel,Y
      LDA     #$20
      STA     EnemyArray_453,Y
      JMP     loc_BANK3_A6E1

; ---------------------------------------------------------------------------

loc_BANK3_A6DB:
      JSR     sub_BANK2_98CD

      JSR     sub_BANK2_997A

loc_BANK3_A6E1:
      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     EnemyMovementDirection,X
      BEQ     loc_BANK3_A6ED

      JSR     EnemyBehavior_TurnAround

loc_BANK3_A6ED:
      LDA     EnemyCollision,X
      AND     #4
      BEQ     loc_BANK3_A70D

      LDA     EnemyArray_42F,X
      BEQ     loc_BANK3_A700

      LDA     #0
      STA     EnemyArray_42F,X
      JSR     loc_BANK2_848F

loc_BANK3_A700:
      LDA     EnemyArray_9F,X
      EOR     #8
      STA     EnemyArray_9F,X
      JSR     sub_BANK2_95CE

      LDA     #$F0
      STA     ObjectYAccel,X

loc_BANK3_A70D:
      INC     EnemyArray_477,X
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_A71E

      LDA     EnemyArray_477,X
      AND     #$3F
      BNE     loc_BANK3_A71E

      JSR     loc_BANK2_8492

loc_BANK3_A71E:
      JSR     sub_BANK2_8577

      JMP     RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_Tryclyde:
      JSR     EnemyInit_Basic

      LDA     #$40
      STA     EnemyArray_477,X
      LDA     #2
      STA     EnemyHP,X
      JMP     loc_BANK2_8F6F

; ---------------------------------------------------------------------------
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
; ---------------------------------------------------------------------------

locret_BANK3_A75C:
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Tryclyde:
      JSR     sub_BANK2_997A

      LDY     #0
      LDA     EnemyArray_477,X
      ASL     A
      BCC     loc_BANK3_A76F

      LDY     #2
      ASL     A
      BCC     loc_BANK3_A76F

      LDY     #$FE

loc_BANK3_A76F:
      STY     ObjectXAccel,X
      JSR     sub_BANK2_9E50

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
      SBC     #1
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

      LDA     #ObjAttrib_Palette1|ObjAttrib_Unknown_08
      STA     ObjectAttributes,X
      LDA     #$33
      STA     EnemyArray_46E,X
      LDA     ObjectXLo,X
      PHA
      SEC
      SBC     #8
      STA     ObjectXLo,X
      JSR     sub_BANK2_8894

      LDX     #$50
      LDA     byte_RAM_10
      AND     #$20
      BNE     loc_BANK3_A7C8

      LDA     #4
      AND     byte_RAM_10
      BEQ     loc_BANK3_A7C8

      LDX     #$53

loc_BANK3_A7C8:
      LDA     byte_RAM_1
      SEC
      SBC     #8
      STA     byte_RAM_1
      LDA     #$20
      STA     word_RAM_C
      LDY     #$E0
      JSR     sub_BANK2_9CF2

      LDX     byte_RAM_12
      LDA     ObjectXLo,X
      SEC
      SBC     #8
      STA     ObjectXLo,X
      JSR     sub_BANK2_8894

      PLA
      STA     ObjectXLo,X
      LDA     #$13
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
      CPY     #7
      BCS     loc_BANK3_A815

      LDX     #$5A

loc_BANK3_A815:
      LDY     #0
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
      LDA     #0
      STA     word_RAM_C
      LDX     #$56
      LDA     byte_RAM_7
      BNE     loc_BANK3_A84C

      LDX     #$58
      DEY
      DEY
      DEY
      DEY
      CPY     #7
      BCS     loc_BANK3_A84C

      LDX     #$5A

loc_BANK3_A84C:
      LDY     #8
      JSR     sub_BANK2_9CF2

      LDX     byte_RAM_12
      LDA     #$13
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
      SBC     #8
      STA     SpriteDMAArea+$5F

loc_BANK3_A88B:
      LDA     #0
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
      STA     ObjectYAccel,Y
      LDA     unk_BANK3_A750,X
      STA     ObjectXAccel,Y

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
      SBC     #8
      STA     EnemyVariable,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_CobratGround:
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_98D6

      JSR     sub_BANK2_98CD

      JSR     sub_BANK3_B4FD

      LDA     EnemyArray_480,X
      BNE     loc_BANK3_A93E

      STA     ObjectXAccel,X
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_RAM_F
      ADC     #$40
      CMP     #$80
      BCS     loc_BANK3_A924

      INC     EnemyArray_480,X
      LDA     #$C0
      STA     ObjectYAccel,X
      BNE     loc_BANK3_A93E

loc_BANK3_A924:
      INC     EnemyArray_477,X
      LDY     #$FC
      LDA     EnemyArray_477,X
      AND     #$20
      BEQ     loc_BANK3_A932

      LDY     #4

loc_BANK3_A932:
      STY     ObjectYAccel,X
      JSR     sub_BANK2_9E4B

      LDA     #$61
      STA     ObjectAttributes,X
      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_A93E:
      LDA     ObjectYAccel,X
      BMI     loc_BANK3_A951

      LDA     EnemyVariable,X
      SEC
      SBC     #$18
      CMP     ObjectYLo,X
      BCS     loc_BANK3_A951

      STA     ObjectYLo,X
      LDA     #0
      STA     ObjectYAccel,X

loc_BANK3_A951:
      JSR     sub_BANK2_8577

      INC     EnemyArray_9F,X
      LDA     EnemyArray_9F,X
      PHA
      AND     #$3F
      BNE     loc_BANK3_A960

      JSR     loc_BANK2_8492

loc_BANK3_A960:
      PLA
      BNE     loc_BANK3_A968

      LDA     #$18
      STA     EnemyArray_453,X

loc_BANK3_A968:
      LDA     EnemyCollision,X
      AND     #3
      BEQ     loc_BANK3_A971

      JSR     EnemyBehavior_TurnAround

loc_BANK3_A971:
      LDA     #$41
      LDY     ObjectYAccel,X
      BPL     loc_BANK3_A979

      LDA     #$61

loc_BANK3_A979:
      JMP     loc_BANK3_A9FE

; ---------------------------------------------------------------------------

EnemyBehavior_CobratJar:
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_98D6

      JSR     sub_BANK2_98CD

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #8
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
      STA     ObjectYAccel,X
      INC     EnemyArray_B1,X
      JMP     loc_BANK3_A9F9

; ---------------------------------------------------------------------------

loc_BANK3_A9AA:
      LDY     #$FC
      LDA     byte_RAM_10
      AND     #$20
      BEQ     loc_BANK3_A9B4

      LDY     #4

loc_BANK3_A9B4:
      STY     ObjectYAccel,X
      JSR     sub_BANK2_9E4B

      JMP     loc_BANK3_A9FC

; ---------------------------------------------------------------------------

loc_BANK3_A9BC:
      INC     EnemyArray_9F,X
      LDA     ObjectYAccel,X
      BMI     loc_BANK3_A9F9

      BNE     loc_BANK3_A9C9

      LDA     #$10
      STA     EnemyArray_453,X

loc_BANK3_A9C9:
      LDA     ObjectYAccel,X
      BMI     loc_BANK3_A9E9

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK3_A9E9

      LDA     byte_RAM_E
      SEC
      SBC     #$6F
      CMP     #6
      BCC     loc_BANK3_A9E9

      LDA     #2
      STA     EnemyState,X
      LDA     #$E0
      STA     ObjectYAccel,X
      LDA     #$40
      STA     DPCMQueue

loc_BANK3_A9E9:
      LDA     EnemyVariable,X
      CMP     ObjectYLo,X
      BCS     loc_BANK3_A9F9

      STA     ObjectYLo,X
      LDA     #0
      STA     EnemyArray_B1,X
      LDA     #$A0
      STA     EnemyTimer,X

loc_BANK3_A9F9:
      JSR     HandleObjectGravity

loc_BANK3_A9FC:
      LDA     #$61

loc_BANK3_A9FE:
      STA     ObjectAttributes,X
      LDA     EnemyArray_453,X
      BEQ     loc_BANK3_AA11

      CMP     #5
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

      LDA     #3
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

      JSR     sub_BANK2_997A

      JSR     sub_BANK2_98CD

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
      LDA     #0
      STA     EnemyVariable,X
      LDA     #2
      STA     EnemyArray_489,X
      LDA     unk_RAM_441,X
      STA     byte_RAM_6
      LDA     #$FF
      STA     unk_RAM_441,X
      JSR     CreateEnemy

      BMI     loc_BANK3_AA99

      LDY     byte_RAM_0
      LDA     #$1A
      STA     ObjectType,Y
      JSR     sub_BANK3_A8EA

      LDY     byte_RAM_0
      LDA     byte_RAM_6
      STA     unk_RAM_441,Y
      LDA     EnemyArray_477,X
      SEC
      SBC     #1
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
      ADC     #0
      STA     ObjectYHi,Y

loc_BANK3_AA99:
      INC     EnemyArray_9F,X
      LDA     EnemyArray_9F,X
      AND     #$3F
      BNE     loc_BANK3_AAA4

      JSR     loc_BANK2_8492

loc_BANK3_AAA4:
      JSR     sub_BANK2_9E50

      JMP     RenderSprite

; End of function sub_BANK3_AA3E

; ---------------------------------------------------------------------------
byte_BANK3_AAAA:
      .BYTE $00

byte_BANK3_AAAB:
      .BYTE $01

byte_BANK3_AAAC:
      .BYTE $00

byte_BANK3_AAAD:
      .BYTE $FF

      .BYTE $00
      .BYTE $01
      .BYTE $00
; ---------------------------------------------------------------------------

loc_BANK3_AAB1:
      LDY     #0
      LDA     byte_RAM_EE
      BNE     loc_BANK3_AABF

      LDA     byte_RAM_10
      AND     #$18
      LSR     A
      LSR     A
      LSR     A
      TAY

loc_BANK3_AABF:
      STY     byte_RAM_7
      LDA     SpriteTempScreenX
      STA     byte_RAM_4FD
      CLC
      ADC     byte_BANK3_AAAA,Y
      STA     SpriteTempScreenX
      JSR     sub_BANK2_9BA7

      LDA     EnemyVariable,X
      STA     byte_RAM_9
      BEQ     loc_BANK3_AB16

      TYA
      CLC
      ADC     #$10
      TAY
      LDX     byte_RAM_7
      LDA     byte_RAM_4FD
      ADC     byte_BANK3_AAAB,X
      STA     byte_RAM_1
      LDX     #$70
      JSR     sub_BANK2_9CF2

      DEC     byte_RAM_9
      BEQ     loc_BANK3_AB16

      JSR     loc_BANKF_FAFE

      LDX     byte_RAM_7
      LDA     byte_RAM_4FD
      CLC
      ADC     byte_BANK3_AAAC,X
      STA     byte_RAM_1
      LDX     #$70
      JSR     sub_BANK2_9CF2

      DEC     byte_RAM_9
      BEQ     loc_BANK3_AB16

      LDX     byte_RAM_7
      LDA     byte_RAM_4FD
      CLC
      ADC     byte_BANK3_AAAD,X
      STA     byte_RAM_1
      LDX     #$70
      JSR     sub_BANK2_9CF2

loc_BANK3_AB16:
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Rocket:
      LDA     EnemyArray_B1,X
      BNE     loc_BANK3_AB20

      JMP     loc_BANK3_ABD7

; ---------------------------------------------------------------------------

loc_BANK3_AB20:
      LDY     #3
      LDA     ObjectYAccel,X
      BEQ     loc_BANK3_AB2A

      CMP     #$FD
      BCC     loc_BANK3_AB3B

loc_BANK3_AB2A:
      LDY     #$3F
      INC     SpriteTempScreenX
      LDA     byte_RAM_10
      AND     #2
      BNE     loc_BANK3_AB3B

      DEC     SpriteTempScreenX
      DEC     SpriteTempScreenX

loc_BANK3_AB3B:
      TYA
      AND     byte_RAM_10
      BNE     loc_BANK3_AB42

      DEC     ObjectYAccel,X

loc_BANK3_AB42:
      JSR     sub_BANK2_9E4B

      LDA     EnemyArray_477,X
      BNE     loc_BANK3_AB64

      LDY     ObjectYHi,X
      BPL     loc_BANK3_AB88

      JSR     sub_BANKF_F6DA

      LDA     #$38
      STA     byte_RAM_4AF
      INC     byte_RAM_627
      LDA     #5
      STA     TransitionType
      LDA     #0
IFDEF COMPATIBILITY
      .db $8d, $50, $00 ; STA $0000 + PlayerState
ENDIF
IFNDEF COMPATIBILITY
      STA     PlayerState ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      RTS

; ---------------------------------------------------------------------------

loc_BANK3_AB64:
      LDA     ObjectYLo,X
      CMP     #$30
      BCS     loc_BANK3_AB88

      LDY     byte_RAM_4C7
      BNE     loc_BANK3_AB76

      CMP     #$18
      BCS     loc_BANK3_AB88

      JMP     loc_BANK2_910D

; ---------------------------------------------------------------------------

loc_BANK3_AB76:
      LDA     #0
      STA     byte_RAM_4C7
      STA     HoldingItem
      STA     PlayerXAccel
      LDA     ObjectYLo,X
      ADC     #$20
      STA     PlayerYLo
      STA     PlayerScreenYLo

loc_BANK3_AB88:
      JSR     sub_BANK3_ABEE

      LDA     SpriteTempScreenX
      SEC
      SBC     #4
      STA     SpriteDMAArea+$93
      ADC     #7
      STA     SpriteDMAArea+$97
      ADC     #8
      STA     SpriteDMAArea+$9B
      LDA     #$20
      LDY     ObjectYAccel,X
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
      AND     #3
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
      CMP     #1
      BNE     loc_BANK3_ABEB

      STA     EnemyArray_B1,X
      STA     byte_RAM_4C7
      LDA     #SoundEffect3_Rumble_A
      STA     SoundEffectQueue3
      LDA     #$FE
      STA     ObjectYAccel,X

loc_BANK3_ABEB:
      JSR     CarryObject

; =============== S U B R O U T I N E =======================================

sub_BANK3_ABEE:
      LDA     SpriteTempScreenY
      STA     byte_RAM_0
      LDA     SpriteTempScreenX
      SEC
      SBC     #8
      STA     byte_RAM_1
      LDA     #2
      STA     byte_RAM_2
      STA     byte_RAM_5
      STA     word_RAM_C
      LDA     ObjectAttributes,X
      AND     #$23
      STA     byte_RAM_3
      LDY     #0
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
      LDA     #0
      STA     byte_RAM_EE
      LDA     EnemyArray_9F,X
      AND     #8
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

      LDA     #4
      STA     EnemyHP,X
      LDA     #0
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
      LDA     #2
      STA     EnemyMovementDirection,X
      INC     EnemyArray_9F,X
      LDY     EnemyHP,X
      DEY
      BNE     loc_BANK3_ACE7

      LDA     #3
      STA     byte_RAM_9
      STA     byte_RAM_4F8
      JSR     sub_BANK2_89A9

loc_BANK3_ACA1:
      JSR     CreateEnemy

      BMI     loc_BANK3_ACE3

      LDY     byte_RAM_0
      LDA     ObjectYHi,X
      STA     unk_RAM_4EF,Y
      LDA     #$F0
      STA     ObjectYAccel,Y
      LDA     #Enemy_FryguySplit
      STA     ObjectType,Y
      LDA     #$30
      STA     EnemyArray_453,Y
      LDA     ObjectYLo,X
      PHA
      LDX     byte_RAM_9
      LDA     byte_BANK3_AC77,X
      STA     ObjectXAccel,Y
      LDA     SpriteTempScreenX
      ADC     byte_BANK3_AC7B,X
      STA     ObjectXLo,Y
      PLA
      ADC     byte_BANK3_AC7F,X
      STA     ObjectYLo,Y
      LDA     #0
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
      LDA     #$20
      STA     ObjectType,X
      LDA     ObjectXLo,X
      SBC     #8
      STA     ObjectXLo,X
      LDA     ObjectYLo,X
      ADC     #$18
      STA     ObjectYLo,X
      JSR     loc_BANK2_848F

      LDX     byte_RAM_12

loc_BANK3_AD07:
      LDA     byte_RAM_10
      AND     #1
      BNE     loc_BANK3_AD37

      LDA     EnemyVariable,X
      AND     #1
      TAY
      LDA     ObjectYAccel,X
      CLC
      ADC     byte_BANK3_AC87,Y
      STA     ObjectYAccel,X
      CMP     byte_BANK3_AC89,Y
      BNE     loc_BANK3_AD21

      INC     EnemyVariable,X

loc_BANK3_AD21:
      LDA     EnemyArray_477,X
      AND     #1
      TAY
      LDA     ObjectXAccel,X
      CLC
      ADC     byte_BANK3_AC83,Y
      STA     ObjectXAccel,X
      CMP     byte_BANK3_AC85,Y
      BNE     loc_BANK3_AD37

      INC     EnemyArray_477,X

loc_BANK3_AD37:
      JSR     sub_BANK3_AC28

      JSR     sub_BANK2_9E4B

      JMP     sub_BANK2_9E50

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

      JSR     sub_BANK3_BA7D

      LDA     #0
      STA     EnemyArray_46E,X
      JMP     TurnIntoPuffOfSmoke

; ---------------------------------------------------------------------------

loc_BANK3_AD59:
      LDA     #2
      STA     EnemyMovementDirection,X
      LDA     byte_RAM_10
      STA     EnemyArray_44A,X
      INC     EnemyArray_9F,X
      INC     EnemyArray_9F,X
      JSR     sub_BANK3_B4FD

      JSR     RenderSprite

      LDA     EnemyCollision,X
      PHA
      AND     #4
      BEQ     loc_BANK3_AD7A

      JSR     sub_BANK2_95CE

      LDA     #0
      STA     ObjectXAccel,X

loc_BANK3_AD7A:
      PLA
      AND     #3
      BEQ     loc_BANK3_AD85

      JSR     EnemyBehavior_TurnAround

      JSR     sub_BANK2_95B0

loc_BANK3_AD85:
      TXA
      ASL     A
      ASL     A
      ASL     A
      ADC     byte_RAM_10
      LDY     byte_RAM_4F8
      AND     unk_BANK3_AD40,Y
      ORA     ObjectYAccel,X
      BNE     loc_BANK3_ADAB

      LDA     PseudoRNGValues+2
      AND     #$1F
      ORA     unk_BANK3_AD44,Y
      STA     ObjectYAccel,X
      JSR     loc_BANK2_8492

      LDA     byte_RAM_4F8
      CMP     #2
      BCS     loc_BANK3_ADAB

      ASL     ObjectXAccel,X

loc_BANK3_ADAB:
      JSR     sub_BANK2_9E50

      JMP     HandleObjectGravity

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
      JSR     loc_BANK2_848F

      INC     EnemyArray_B1,X
      JSR     SetEnemyAttributes

      LDA     #4
      STA     EnemyArray_489,X
      LDX     byte_RAM_12

loc_BANK3_ADF9:
      JSR     sub_BANK2_997A

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     #4
      BEQ     loc_BANK3_AE09

      JSR     sub_BANK2_95CE

loc_BANK3_AE09:
      PLA
      AND     #3
      BEQ     loc_BANK3_AE14

      JSR     EnemyBehavior_TurnAround

      JSR     sub_BANK2_9E50

loc_BANK3_AE14:
      INC     EnemyArray_9F,X
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

      JSR     loc_BANK2_8492

loc_BANK3_AE28:
      LDA     EnemyArray_9F,X
      AND     #$7F
      BNE     loc_BANK3_AE45

      JSR     loc_BANK2_8492

      JSR     CreateBullet

      BMI     loc_BANK3_AE45

      LDX     byte_RAM_0 ; X has the new enemy index
      LDA     #Enemy_AutobombFire
      JSR     sub_BANK2_9004 ; Set the enemy type and attributes
; Bug: sets RAM $0!
; Should have pushed it to stack instead.

      LDX     byte_RAM_0
      DEC     ObjectYLo,X
      DEC     ObjectYLo,X
      LDX     byte_RAM_12

loc_BANK3_AE45:
      JSR     sub_BANK2_8577

      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_AE4B:
      LDA     EnemyState,X
      CMP     #EnemyState_Alive
      BEQ     loc_BANK3_AE5C

      LDA     #ObjAttrib_Palette1|ObjAttrib_16x32|ObjAttrib_UpsideDown
      STA     ObjectAttributes,X
      STA     EnemyArray_9F,X
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

      LDA     #2
      STA     EnemyMovementDirection,X
      TYA
      CLC
      ADC     #8
IFDEF COMPATIBILITY
      .db $8d, $f4, $00 ; STA $00F4
ENDIF
IFNDEF COMPATIBILITY
      STA     byte_RAM_F4 ; Absolute address for zero-page
   NOP ; Alignment fix
ENDIF

      LDA     byte_RAM_0
      STA     SpriteTempScreenY
      LDA     #$D0
      STA     EnemyArray_46E,X
      LDA     #$78
      JSR     sub_BANK2_9BB3

      LDA     #$50
      LDY     EnemyArray_B1,X
      BEQ     loc_BANK3_AEA6

      LDA     #$52

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
      INC     EnemyArray_9F,X
      INC     EnemyArray_9F,X
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
      STA     ObjectYAccel,X
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

      LDY     #3
      AND     #$10
      BEQ     loc_BANK3_AEE4

      LDY     #$FB

loc_BANK3_AEE4:
      STY     ObjectYAccel,X

loc_BANK3_AEE6:
      INC     ObjectYAccel,X
      JSR     sub_BANK2_9E4B

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
      ADC     #4
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
      INC     EnemyArray_9F,X
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_98CD

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK3_AF8D

      JSR     EnemyBehavior_TurnAround

loc_BANK3_AF8D:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK3_AFB4

      LDA     ObjectYAccel,X
      PHA
      JSR     sub_BANK2_95CE

      PLA
      LDY     EnemyArray_42F,X
      BEQ     loc_BANK3_AFB4

      CMP     #$18
      BMI     loc_BANK3_AFAC

      JSR     sub_BANK2_95B0

      LDA     #$F0
      STA     ObjectYAccel,X
      BNE     loc_BANK3_AFDA

loc_BANK3_AFAC:
      LDA     #0
      STA     EnemyArray_42F,X
      JSR     SetEnemyAttributes

loc_BANK3_AFB4:
      LDA     byte_RAM_E
      CMP     #$16
      BEQ     loc_BANK3_AFBF

      DEC     EnemyArray_9F,X
      JMP     loc_BANK2_9470

; ---------------------------------------------------------------------------

loc_BANK3_AFBF:
      JSR     EnemyFindWhichSidePlayerIsOn

      INY
      STY     EnemyMovementDirection,X
      LDA     byte_RAM_10
      AND     #1
      BNE     loc_BANK3_AFDA

      LDA     ObjectXAccel,X
      CMP     locret_BANK3_AF74,Y
      BEQ     loc_BANK3_AFDA

      CLC
      ADC     byte_BANK3_AF76,Y
      STA     ObjectXAccel,X
      INC     EnemyArray_9F,X

loc_BANK3_AFDA:
      JSR     sub_BANK2_8577

      INC     unk_RAM_4A4,X
      JMP     RenderSprite

; ---------------------------------------------------------------------------

EnemyInit_HawkmouthBoss:
      JSR     EnemyInit_Hawkmouth ; Falls through to EnemyInit_Stationary

      LDA     #3
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

      LDA     #6
      STA     EnemyArray_46E,X
      LDA     #2
      STA     byte_RAM_71FE
      LDA     CrystalAndHawkmouthOpenSize
      BEQ     locret_BANK3_B05F

      CMP     #1
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
      CMP     #2
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

      LDA     #1
      STA     TransitionType
      JSR     sub_BANKF_F6DA

      LDA     #9
      STA     PlayerXHi
      INC     byte_RAM_627
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
      STA     PlayerYAccel

; =============== S U B R O U T I N E =======================================

sub_BANK3_B095:
      LDA     #SoundEffect1_HawkOpen_WartBarf
      STA     SoundEffectQueue1

locret_BANK3_B09A:
      RTS

; End of function sub_BANK3_B095

; ---------------------------------------------------------------------------

loc_BANK3_B09B:
      LDA     #3
      STA     EnemyArray_46E,X
      LDA     #0
      STA     byte_RAM_71FE
      LDA     EnemyHP,X
      BNE     loc_BANK3_B0BA

      LDA     #3
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
      AND     #1
      TAY
      LDA     ObjectYAccel,X
      CLC
      ADC     byte_BANK3_AFF0,Y
      STA     ObjectYAccel,X
      CMP     byte_BANK3_AFF2,Y
      BNE     loc_BANK3_B0D3

      INC     EnemyVariable,X

loc_BANK3_B0D3:
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     ObjectXAccel,X
      CMP     byte_BANK3_AFEE,Y
      BEQ     loc_BANK3_B0E3

      CLC
      ADC     byte_BANK3_AFEC,Y
      STA     ObjectXAccel,X

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
      EOR     #1
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

loc_BANK3_B180:
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
      AND     #7
      TAY
      LDA     unk_BANK3_B178,Y
      STA     ObjectXAccel,X
      TYA
      AND     #3
      TAY
      LDA     #2
      STA     ObjectXHi,X
      LDA     byte_BANK3_B170,Y
      STA     ObjectXLo,X
      LDA     byte_BANK3_B174,Y
      STA     ObjectYLo,X
      LDA     #0
      STA     ObjectYHi,X
      LDA     PseudoRNGValues+2
      AND     #3
      CMP     #2
      BCC     loc_BANK3_B1C1

      ASL     A
      STA     EnemyArray_B1,X

loc_BANK3_B1C1:
      LDY     #$33
      STY     ObjectType,X
      JSR     SetEnemyAttributes

      LDA     #$D0
      STA     ObjectYAccel,X

locret_BANK3_B1CC:
      RTS

; ---------------------------------------------------------------------------

EnemyInit_Wart:
      JSR     EnemyInit_Basic

      LDA     #6
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
      BNE     loc_BANK3_B256

      LDA     EnemyHP,X
      BNE     loc_BANK3_B1F0

      LDA     #$80
      STA     EnemyTimer,X
      STA     EnemyArray_B1,X
      BNE     loc_BANK3_B253

loc_BANK3_B1F0:
      INC     EnemyVariable,X
      LDA     byte_RAM_10
      AND     #$FF
      BNE     loc_BANK3_B1FF

      LDA     #$5F
      STA     EnemyTimer,X
      INC     EnemyArray_480,X

loc_BANK3_B1FF:
      LDA     #0
      STA     ObjectXAccel,X
      LDA     EnemyVariable,X
      AND     #$40
      BEQ     loc_BANK3_B216

      INC     EnemyArray_477,X
      LDA     #$F8
      LDY     EnemyVariable,X
      BPL     loc_BANK3_B214

      LDA     #8

loc_BANK3_B214:
      STA     ObjectXAccel,X

loc_BANK3_B216:
      JSR     sub_BANK2_9E50

      LDA     EnemyArray_45C,X
      BNE     loc_BANK3_B253

      LDA     EnemyTimer,X
      BEQ     loc_BANK3_B253

      AND     #$F
      BNE     loc_BANK3_B253

      JSR     CreateEnemy

      BMI     loc_BANK3_B253

      LDA     #SoundEffect1_HawkOpen_WartBarf
      STA     SoundEffectQueue1
      LDA     EnemyArray_480,X
      AND     #3
      TAY
      LDA     EnemyTimer,X
      LDX     byte_RAM_0
      LSR     A
      EOR     #$FF
      STA     ObjectXAccel,X
      LDA     byte_BANK3_B1DB,Y
      STA     ObjectYAccel,X
      LDA     #Enemy_WartBubble
      STA     ObjectType,X
      LDA     ObjectYLo,X
      ADC     #8
      STA     ObjectYLo,X
      JSR     SetEnemyAttributes

      LDX     byte_RAM_12

loc_BANK3_B253:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

loc_BANK3_B256:
      LDA     EnemyTimer,X
      BEQ     loc_BANK3_B269

      STA     EnemyArray_45C,X
      INC     EnemyArray_477,X
      INC     EnemyArray_477,X
      LDA     #$F0
      STA     ObjectYAccel,X
      BNE     loc_BANK3_B29F

loc_BANK3_B269:
      LDA     #4
      STA     ObjectXAccel,X
      JSR     sub_BANK2_9E50

      JSR     sub_BANK2_9E4B

      LDA     byte_RAM_10
      LSR     A
      BCS     loc_BANK3_B295

      INC     ObjectYAccel,X
      BMI     loc_BANK3_B295

      LDA     byte_RAM_10
      AND     #$1F
      BNE     loc_BANK3_B295

      LDA     #$10
      STA     DPCMQueue
      JSR     CreateEnemy

      LDX     byte_RAM_0
      LDA     ObjectYLo,X
      ADC     #8
      STA     ObjectYLo,X
      JSR     TurnIntoPuffOfSmoke

loc_BANK3_B295:
      LDA     ObjectYLo,X
      CMP     #$D0
      BCC     loc_BANK3_B29F

      LDA     #2
      STA     EnemyState,X

loc_BANK3_B29F:
      JMP     RenderSprite

; ---------------------------------------------------------------------------

EnemyBehavior_WartBubble:
      INC     EnemyArray_9F,X
      JSR     sub_BANK2_9E50

      JSR     sub_BANK2_9E4B

      INC     ObjectYAccel,X
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
      AND     #3
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

      AND     #8
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

      AND     #8
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
      LDA     ObjectXAccel,X
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
      ADC     #$F
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

; ---------------------------------------------------------------------------
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
      LDA     PlayerYAccel,X
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
      LDA     #4
      BNE     loc_BANK3_B4FF

; End of function sub_BANK3_B4F9

; =============== S U B R O U T I N E =======================================

sub_BANK3_B4FD:
      LDA     #0

loc_BANK3_B4FF:
      STA     byte_RAM_7
      LDA     #0
      STA     byte_RAM_B
      STA     byte_RAM_E
      JSR     sub_BANK3_B5AC

      STA     byte_RAM_8
      LDA     PlayerYAccel,X
      BPL     loc_BANK3_B519

      JSR     sub_BANK3_B58C

      INC     byte_RAM_7
      INC     byte_RAM_8
      BNE     loc_BANK3_B57B

loc_BANK3_B519:
      INC     byte_RAM_7
      INC     byte_RAM_8
      JSR     sub_BANK3_B58C

      LDA     CurrentCharacter,X
      CMP     #$18
      BEQ     loc_BANK3_B540

      CMP     #$19
      BEQ     loc_BANK3_B540

      LDA     byte_RAM_0
      SEC
      SBC     #$8A
      CMP     #2
      BCS     loc_BANK3_B540

      ASL     A
      ADC     #1
      STA     PlayerYAccel,X
      LDA     #7
      STA     PlayerState,X
      LDA     #$FF
      STA     DamageInvulnTime,X

loc_BANK3_B540:
      LDA     byte_RAM_0
      STA     byte_RAM_E
      SEC
      SBC     #$67
      CMP     #2
      BCS     loc_BANK3_B57B

      LDY     unk_RAM_437,X
      BNE     loc_BANK3_B57B

      LDY     CurrentCharacter,X
      CPY     #$32
      BCC     loc_BANK3_B56C

      TAY
      LDA     PlayerYAccel,X
      CMP     #3
      BCS     loc_BANK3_B57B

      LDA     word_RAM_C+1
      AND     #3
      BNE     loc_BANK3_B57B

      LDA     byte_BANK3_B4E0,Y
      STA     PlayerXAccel,X
      STA     byte_RAM_B
      BNE     loc_BANK3_B57B

loc_BANK3_B56C:
      LDY     PlayerXAccel,X
      BEQ     loc_BANK3_B579

      EOR     PlayerMovementDirection,X
      LSR     A
      BCS     loc_BANK3_B579

      DEC     byte_RAM_9E,X
      DEC     byte_RAM_9E,X

loc_BANK3_B579:
      INC     byte_RAM_9E,X

loc_BANK3_B57B:
      LDA     PlayerXAccel,X
      CLC
      ADC     byte_RAM_4CB,X
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
      ORA     PlayerCollision,X
      STA     PlayerCollision,X

loc_BANK3_B5A7:
      INC     byte_RAM_7
      INC     byte_RAM_8
      RTS

; End of function sub_BANK3_B58C

; =============== S U B R O U T I N E =======================================

sub_BANK3_B5AC:
      INX
      LDA     PlayerCollision,X
      STA     word_RAM_C+1
      AND     #$F0
      STA     PlayerCollision,X
      LDY     unk_RAM_491,X
      LDA     byte_BANKF_F000,Y

locret_BANK3_B5BB:
      RTS

; End of function sub_BANK3_B5AC

; ---------------------------------------------------------------------------
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
      LDA     #0
      STA     EnemyArray_4CC,X
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left|CollisionFlags_Down|CollisionFlags_Up
      STA     EnemyCollision,X
      LDA     EnemyState,X
      CMP     #EnemyState_BombExploding
      BNE     loc_BANK3_B5E1

      LDY     #6
      BNE     loc_BANK3_B5FF

loc_BANK3_B5E1:
      CMP     #7
      BEQ     loc_BANK3_B5F8

      LDY     ObjectType,X
      CPY     #Enemy_Egg
      BEQ     loc_BANK3_B5F4

      CPY     #$1A
      BEQ     loc_BANK3_B5F4

      LDY     EnemyArray_42F,X
      BNE     loc_BANK3_B5F8

loc_BANK3_B5F4:
      CMP     #1
      BNE     locret_BANK3_B5BB

loc_BANK3_B5F8:
      LDA     ObjectBeingCarriedTimer,X
      BNE     locret_BANK3_B5BB

      LDY     EnemyArray_489,X

loc_BANK3_B5FF:
      LDA     unk_RAM_7128,Y
      STA     byte_RAM_9
      LDA     #0
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
      LDA     #0
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
      ORA     byte_RAM_41B
      BNE     loc_BANK3_B64E

      LDA     PlayerState,X
      CMP     #2
      BCC     loc_BANK3_B651

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
      CMP     #4
      BEQ     loc_BANK3_B671

      LDA     EnemyArray_46E,Y
      AND     #4
      BNE     loc_BANK3_B690

loc_BANK3_B671:
      LDA     PlayerState,X
      CMP     #4
      BNE     loc_BANK3_B67B

      LDY     #6
      BNE     loc_BANK3_B6A6

loc_BANK3_B67B:
      CMP     #7
      BEQ     loc_BANK3_B692

      LDY     CurrentCharacter,X
      CPY     #$1E
      BEQ     loc_BANK3_B68E

      CPY     #$1A
      BEQ     loc_BANK3_B68E

      LDY     unk_RAM_42E,X
      BNE     loc_BANK3_B692

loc_BANK3_B68E:
      CMP     #1

loc_BANK3_B690:
      BNE     loc_BANK3_B6F0

loc_BANK3_B692:
      LDA     EnemyArray_9F+8,X
      BNE     loc_BANK3_B6F0

      LDA     PlayerCollision,X
      AND     #$10
      BNE     loc_BANK3_B6F0

      LDA     unk_RAM_46D,X
      AND     #4
      BNE     loc_BANK3_B6F0

      LDY     unk_RAM_488,X

loc_BANK3_B6A6:
      LDA     unk_RAM_7128,Y
      STA     byte_RAM_A
      LDA     #0
      STA     byte_RAM_0
      LDA     unk_RAM_7100,Y
      BPL     loc_BANK3_B6B6

      DEC     byte_RAM_0

loc_BANK3_B6B6:
      CLC
      ADC     PlayerXLo,X
      STA     byte_RAM_6
      LDA     PlayerXHi,X
      ADC     byte_RAM_0
      STA     byte_RAM_2
      LDA     IsHorizontalLevel
      BNE     loc_BANK3_B6C7

      STA     byte_RAM_2

loc_BANK3_B6C7:
      LDA     unk_RAM_713C,Y

loc_BANK3_B6CA:
      STA     word_RAM_C
      LDA     #0
      STA     byte_RAM_0
      LDA     unk_RAM_7114,Y
      BPL     loc_BANK3_B6D7

      DEC     byte_RAM_0

loc_BANK3_B6D7:
      CLC
      ADC     PlayerYLo,X
      STA     byte_RAM_8
      LDA     PlayerYHi,X
      ADC     byte_RAM_0
      STA     byte_RAM_4
      JSR     sub_BANK3_BDC5

      BCS     loc_BANK3_B6F0

      LDA     byte_RAM_B
      PHA
      JSR     sub_BANK3_B6F9

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

sub_BANK3_B6F9:
      TXA
      BNE     loc_BANK3_B707

      LDA     HoldingItem
      BEQ     loc_BANK3_B707

      LDA     byte_RAM_42D
      CMP     byte_RAM_12
      BEQ     locret_BANK3_B6F8

loc_BANK3_B707:
      LDY     byte_RAM_12
      LDA     ObjectType,Y
      TAY
      LDA     unk_RAM_71D1,Y
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK3_B761
      .WORD loc_BANK3_B95C
      .WORD loc_BANK3_B8D1
      .WORD unk_BANK3_B956
      .WORD loc_BANK3_B71D
; ---------------------------------------------------------------------------

loc_BANK3_B71D:
      TXA
      BNE     locret_BANK3_B760

      LDA     Player1JoypadPress
      AND     #8
      BEQ     locret_BANK3_B760

      LDA     PlayerCollision
      AND     #4
      BEQ     locret_BANK3_B760

      LDA     byte_RAM_426
      CMP     #$FA
      BCS     locret_BANK3_B760

      LDA     byte_RAM_4BD
      ORA     byte_RAM_4B3
      BNE     locret_BANK3_B760

      LDA     HoldingItem
      BEQ     loc_BANK3_B749

      LDY     byte_RAM_42D
      LDA     ObjectType,Y
      CMP     #$3D
      BNE     locret_BANK3_B760

loc_BANK3_B749:
      LDY     byte_RAM_12
      LDA     ObjectXLo,Y
      STA     PlayerXLo
      LDA     ObjectXHi,Y
      STA     PlayerXHi
      JSR     sub_BANK3_BD0F

      LDA     #4
      STA     TransitionType
      JMP     loc_BANK3_BBF4

; ---------------------------------------------------------------------------

locret_BANK3_B760:
      RTS

; End of function sub_BANK3_B6F9

; ---------------------------------------------------------------------------

loc_BANK3_B761:
      LDY     byte_RAM_12
      TXA
      BEQ     loc_BANK3_B7E5

      LDA     EnemyArray_45C,Y
      ORA     unk_RAM_45B,X
      BNE     locret_BANK3_B760

      LDA     EnemyArray_42F,Y
      BNE     loc_BANK3_B792

      LDA     EnemyState,Y
      CMP     #4
      BEQ     loc_BANK3_B792

      TXA
      TAY
      DEY
      LDX     byte_RAM_12
      INX
      LDA     EnemyState,Y
      CMP     #4
      BEQ     loc_BANK3_B792

      LDA     EnemyArray_42F,Y
      BEQ     loc_BANK3_B7E0

      LDA     PlayerCollision,X
      AND     #$10
      BNE     loc_BANK3_B7E0

loc_BANK3_B792:
      LDA     EnemyArray_453,Y
      ORA     EnemyArray_45C,Y
      BNE     loc_BANK3_B7D7

      LDA     EnemyArray_46E,Y
      AND     #8
      BEQ     loc_BANK3_B7A4

      JSR     sub_BANK3_BA7D

loc_BANK3_B7A4:
      LDA     EnemyHP,Y
      SEC
      SBC     #1
      STA     EnemyHP,Y
      BMI     loc_BANK3_B7BD

      JSR     sub_BANK3_BA7D

      LDA     #$21
      STA     EnemyArray_45C,Y
      LSR     A
      STA     EnemyArray_438,Y
      BNE     loc_BANK3_B7D7

loc_BANK3_B7BD:
      LDA     EnemyCollision,Y
      ORA     #CollisionFlags_10
      STA     EnemyCollision,Y
      LDA     #$E0
      STA     ObjectYAccel,Y
      LDA     ObjectXAccel,Y
      STA     byte_RAM_0
      ASL     A
      ROR     byte_RAM_0
      LDA     byte_RAM_0
      STA     ObjectXAccel,Y

loc_BANK3_B7D7:
      LDA     CurrentCharacter,X
      CMP     #$32
      BCS     loc_BANK3_B7E0

      JSR     sub_BANK3_BA5D

loc_BANK3_B7E0:
      LDX     byte_RAM_ED
      RTS

; ---------------------------------------------------------------------------
byte_BANK3_B7E3:
      .BYTE $F8

      .BYTE $08
; ---------------------------------------------------------------------------

loc_BANK3_B7E5:
      LDA     byte_RAM_EE
      AND     #8
      BNE     locret_BANK3_B828

      LDA     ObjectType,Y
      BNE     loc_BANK3_B80C

      STA     EnemyState,Y
      LDA     #4
      STA     SoundEffectQueue1
      LDY     PlayerMaxHealth
      LDA     PlayerHealth
      CLC
      ADC     #$10
      STA     PlayerHealth
      CMP     PlayerHealthValueByHeartCount,Y
      BCC     locret_BANK3_B828

      JMP     RestorePlayerToFullHealth

; ---------------------------------------------------------------------------

loc_BANK3_B80C:
      CMP     #Enemy_Phanto
      BNE     loc_BANK3_B815

      LDY     byte_RAM_5BC
      BNE     locret_BANK3_B828

loc_BANK3_B815:
      CMP     #Enemy_Starman
      BNE     loc_BANK3_B829

      LDA     #$3F
      STA     StarInvincibilityTimer
      LDA     #Music1_Invincible
      STA     Music1Queue
      LDA     #0
      STA     EnemyState,Y

locret_BANK3_B828:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B829:
      CMP     #Enemy_WhaleSpout
      BNE     loc_BANK3_B844

      LDA     EnemyVariable,Y
      CMP     #$DC
      BCS     locret_BANK3_B843

      LDA     StarInvincibilityTimer
      BEQ     loc_BANK3_B87D

      LDA     #$DC
      STA     EnemyVariable,Y
      LDA     #0
      STA     ObjectYAccel,Y

locret_BANK3_B843:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B844:
      CMP     #Enemy_Wart
      BNE     loc_BANK3_B84C

      LDA     EnemyArray_B1,X
      BNE     locret_BANK3_B843

loc_BANK3_B84C:
      LDY     StarInvincibilityTimer
      BEQ     loc_BANK3_B87D

      LDX     byte_RAM_12
      CMP     #$27
      BEQ     loc_BANK3_B85B

      CMP     #$20
      BNE     loc_BANK3_B866

loc_BANK3_B85B:
      LDA     #0
      STA     EnemyArray_46E,X
      JSR     sub_BANK2_98A6

      JMP     loc_BANK3_B878

; ---------------------------------------------------------------------------

loc_BANK3_B866:
      JSR     EnemyFindWhichSidePlayerIsOn

      LDA     byte_BANK3_B7E3,Y
      STA     ObjectXAccel,X
      LDA     #$E0
      STA     ObjectYAccel,X
      LDA     EnemyCollision,X
      ORA     #CollisionFlags_10
      STA     EnemyCollision,X

loc_BANK3_B878:
      LDX     byte_RAM_ED
      LDY     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B87D:
      LDY     byte_RAM_12
      LDA     EnemyState,Y
      CMP     #4
      BEQ     loc_BANK3_B896

      LDA     EnemyArray_46E,Y
      AND     #1
      BNE     loc_BANK3_B896

      JSR     sub_BANK3_BA95

      LDA     byte_RAM_F
      AND     #$B
      BEQ     sub_BANK3_B899

loc_BANK3_B896:
      JMP     DamagePlayer

; =============== S U B R O U T I N E =======================================

sub_BANK3_B899:
      LDA     #0
      STA     PlayerInAir
      LDX     byte_RAM_12
      LDA     EnemyCollision,X
      ORA     #CollisionFlags_PlayerOnTop
      STA     EnemyCollision,X
      LDA     EnemyArray_46E,X
      AND     #2
      BNE     loc_BANK3_B8CE

      BIT     Player1JoypadPress
      BVC     loc_BANK3_B8CE

      LDA     HoldingItem
      ORA     PlayerDucking
      BNE     loc_BANK3_B8CE

      STA     EnemyCollision,X
      STX     byte_RAM_42D
      STA     EnemyArray_44A,X
      LDA     #7
      STA     ObjectBeingCarriedTimer,X
      JSR     sub_BANK3_BC1F

      LDA     ObjectType,X
      CMP     #$12
      BNE     loc_BANK3_B8CE

      JSR     sub_BANK3_A440

loc_BANK3_B8CE:
      LDX     byte_RAM_ED
      RTS

; End of function sub_BANK3_B899

; ---------------------------------------------------------------------------

loc_BANK3_B8D1:
      LDY     byte_RAM_12
      TXA
      BEQ     loc_BANK3_B905

      LDA     ObjectType,Y
      CMP     #$3D
      BNE     loc_BANK3_B8E4

      LDA     EnemyCollision,Y
      AND     #4
      BNE     locret_BANK3_B902

loc_BANK3_B8E4:
      LDA     EnemyArray_42F,Y
      BNE     loc_BANK3_B8FF

      JSR     sub_BANK3_BA95

      LDA     byte_RAM_F
      AND     PlayerMovementDirection,X
      BEQ     loc_BANK3_B8F8

      DEX
      JSR     EnemyBehavior_TurnAround

      LDX     byte_RAM_ED

loc_BANK3_B8F8:
      JSR     sub_BANK3_BB31

      CPY     #0
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

loc_BANK3_B905:
      LDA     EnemyCollision,Y
      ORA     #CollisionFlags_PlayerInsideMaybe
      STA     EnemyCollision,Y
      JSR     sub_BANK3_BA95

      LDA     byte_RAM_F
      AND     PlayerMovementDirection
      BEQ     loc_BANK3_B919

      JSR     sub_BANK3_BC03

loc_BANK3_B919:
      LDA     byte_RAM_F
      AND     #4
      BEQ     loc_BANK3_B922

      JSR     sub_BANK3_B899

loc_BANK3_B922:
      JSR     sub_BANK3_BB31

      CPY     #1
      BNE     locret_BANK3_B955

      LDY     byte_RAM_12
      LDA     ObjectYAccel,Y
      BEQ     locret_BANK3_B955

      AND     #$80
      ASL     A
      ROL     A
      TAY
      LDA     byte_RAM_F
      AND     unk_BANK3_B903,Y
      BEQ     locret_BANK3_B955

      LDY     byte_RAM_12
      LDA     ObjectYAccel,Y
      EOR     #$FF
      CLC
      ADC     #1
      STA     ObjectYAccel,Y
      LDA     #1
      STA     PlayerDucking
      LDA     #4
      STA     PlayerAnimationFrame
      LDA     #$10
      STA     PlayerStateTimer

locret_BANK3_B955:
      RTS

; ---------------------------------------------------------------------------
unk_BANK3_B956:
      .BYTE $8A
      .BYTE $F0
      .BYTE $FC
      .BYTE $4C
      .BYTE $EA
      .BYTE $B9
; ---------------------------------------------------------------------------

loc_BANK3_B95C:
      LDY     byte_RAM_12
      TXA

loc_BANK3_B95F:
      BNE     loc_BANK3_B993

      LDA     EnemyState,Y

loc_BANK3_B964:
      CMP     #4
      BNE     loc_BANK3_B96E

      LDA     StarInvincibilityTimer
      BEQ     loc_BANK3_B990

locret_BANK3_B96D:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B96E:
      JSR     sub_BANK3_BA95

      LDA     byte_RAM_F
      AND     #8
      BEQ     loc_BANK3_B987

      LDA     HoldingItem
      BNE     locret_BANK3_B96D

      LDY     byte_RAM_12
      STY     byte_RAM_42D
      LDA     #1
      STA     ObjectBeingCarriedTimer,Y
      INC     HoldingItem

loc_BANK3_B987:
      LDA     byte_RAM_F
      AND     #4
      BEQ     locret_BANK3_B96D

      JMP     sub_BANK3_B899

; ---------------------------------------------------------------------------

loc_BANK3_B990:
      JMP     DamagePlayer

; ---------------------------------------------------------------------------

loc_BANK3_B993:
      LDA     CurrentCharacter,X
      CMP     #$2C
      BNE     loc_BANK3_B9B7

      LDA     DamageInvulnTime,X
      BEQ     locret_BANK3_B9F9

      LDA     #0
      STA     EnemyState,Y
      JSR     sub_BANK3_BA5D

      LDA     #$60
      STA     unk_RAM_45B,X
      LSR     A
      STA     unk_RAM_437,X
      LDA     unk_RAM_464,X
      BNE     locret_BANK3_B9B6

      INC     byte_RAM_4FA

locret_BANK3_B9B6:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B9B7:
      CMP     #$32
      BCS     locret_BANK3_B9B6

      CMP     #$11
      BNE     loc_BANK3_B9CA

      LDA     #5
      STA     EnemyState,Y
      LDA     #$1E
      STA     EnemyTimer,Y
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B9CA:
      LDA     EnemyState,Y
      CMP     #4
      BEQ     loc_BANK3_B9EC

      LDA     ObjectType,Y
      CMP     #$35
      BEQ     loc_BANK3_B9EA

      LDA     #$E8
      STA     ObjectYAccel,Y
      STX     byte_RAM_0
      LDX     ObjectXAccel,Y
      BMI     loc_BANK3_B9E5

      LDA     #$18

loc_BANK3_B9E5:
      STA     ObjectXAccel,Y
      LDX     byte_RAM_0

loc_BANK3_B9EA:
      LDY     byte_RAM_12

loc_BANK3_B9EC:
      JSR     sub_BANK3_BA5D

      BNE     locret_BANK3_B9F9

      LDA     PlayerXAccel,X
      ASL     A
      ROR     PlayerXAccel,X
      ASL     A
      ROR     PlayerXAccel,X

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
      LDY     #0
      STY     PlayerYAccel
      STY     PlayerXAccel
      CMP     #$10
      BCC     loc_BANK3_BA2C

      LDA     PlayerScreenX
      SEC
      SBC     SpriteTempScreenX
      ASL     A
      ASL     A
      STA     PlayerXAccel
      LDA     #$C0
      LDY     PlayerYAccel
      BPL     loc_BANK3_BA2A

      LDA     #0

loc_BANK3_BA2A:
      STA     PlayerYAccel

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
      STA     PlayerYAccel

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

sub_BANK3_BA5D:
      LDA     unk_RAM_452,X
      ORA     unk_RAM_45B,X
      BNE     locret_BANK3_BA94

      LDA     unk_RAM_46D,X
      AND     #8
      BEQ     loc_BANK3_BA6F

      JSR     sub_BANK3_BA7D

loc_BANK3_BA6F:
      DEC     unk_RAM_464,X
      BMI     loc_BANK3_BA83

      LDA     #$21
      STA     unk_RAM_45B,X
      LSR     A

loc_BANK3_BA7A:
      STA     unk_RAM_437,X

; End of function sub_BANK3_BA5D

; =============== S U B R O U T I N E =======================================

sub_BANK3_BA7D:
      LDA     #$40
      STA     DPCMQueue
      RTS

; End of function sub_BANK3_BA7D

; ---------------------------------------------------------------------------

loc_BANK3_BA83:
      LDA     PlayerCollision,X ; Seems to be if the player is standing on something
      ORA     #CollisionFlags_10
      STA     PlayerCollision,X
      LDA     #$E0
      STA     PlayerYAccel,X
      LDA     ObjectXAccel,Y
      STA     PlayerXAccel,X
      LDA     #0

locret_BANK3_BA94:
      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK3_BA95:
      LDA     #0
      STA     byte_RAM_F
      LDY     byte_RAM_12
      LDA     byte_RAM_427
      CMP     #$F6
      BCS     loc_BANK3_BAC2

      LDA     ObjectXLo,Y
      LDY     #2
      CMP     PlayerXLo,X
      BMI     loc_BANK3_BAAD

      LDY     #1

loc_BANK3_BAAD:
      STY     byte_RAM_F
      TYA
      AND     PlayerMovementDirection,X
      BEQ     locret_BANK3_BAC1

      LDY     byte_RAM_12
      LDA     unk_RAM_4A4,Y
      BNE     locret_BANK3_BAC1

      LDA     ObjectXAccel,Y

loc_BANK3_BABE:
      STA     byte_RAM_4CB,X

locret_BANK3_BAC1:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_BAC2:
      LDA     ObjectYLo,Y
      CPX     #1
      BCS     loc_BANK3_BAD1

      PHA
      LDY     PlayerDucking
      PLA
      SEC
      SBC     byte_BANK3_BB2F,Y

loc_BANK3_BAD1:
      CMP     PlayerYLo,X
      BMI     loc_BANK3_BB02

      LDA     PlayerYAccel,X
      BMI     locret_BANK3_BB2E

      LDY     byte_RAM_12
      LDA     unk_RAM_4A4,Y
      BNE     loc_BANK3_BAE6

      LDA     ObjectXAccel,Y
      STA     byte_RAM_4CB,X

loc_BANK3_BAE6:
      LDY     #0
      INC     byte_RAM_427
      INC     byte_RAM_427
      BPL     loc_BANK3_BAF1

      DEY

loc_BANK3_BAF1:
      LDA     byte_RAM_427
      CLC
      ADC     PlayerYLo,X
      STA     PlayerYLo,X
      TYA
      ADC     PlayerYHi,X
      STA     PlayerYHi,X
      LDY     #4
      BNE     loc_BANK3_BB13

loc_BANK3_BB02:
      LDA     PlayerYAccel,X
      BEQ     loc_BANK3_BB11

      BPL     locret_BANK3_BB2E

      LDY     byte_RAM_12
      LDA     ObjectType,Y
      CMP     #$36
      BEQ     locret_BANK3_BB2E

loc_BANK3_BB11:
      LDY     #8

loc_BANK3_BB13:
      STY     byte_RAM_F
      LDY     byte_RAM_12
      LDA     unk_RAM_4A4,Y
      BNE     loc_BANK3_BB22

      LDA     ObjectYAccel,Y
      STA     byte_RAM_4D5,X

loc_BANK3_BB22:
      LDA     #0
      STA     PlayerYAccel,X
      LDA     unk_RAM_412,Y
      STA     ObjectYSubpixel,X
      INC     byte_RAM_9E,X

locret_BANK3_BB2E:
      RTS

; End of function sub_BANK3_BA95

; ---------------------------------------------------------------------------
byte_BANK3_BB2F:
      .BYTE $0B

      .BYTE $10

; =============== S U B R O U T I N E =======================================

sub_BANK3_BB31:
      LDY     #0
      LDA     PlayerCollision,X
      ORA     byte_RAM_F
      AND     #$C
      CMP     #$C
      BEQ     loc_BANK3_BB48

      LDA     PlayerCollision,X
      ORA     byte_RAM_F
      AND     #3
      CMP     #3
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
      LDY     #9

loc_BANK3_BB61:
      CMP     byte_BANK3_BB50,Y
      BEQ     locret_BANK3_BB6A

      DEY
      BPL     loc_BANK3_BB61

      CLC

locret_BANK3_BB6A:
      RTS

; End of function sub_BANK3_BB5A

; ---------------------------------------------------------------------------
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
      LDA     #0

loc_BANK3_BB8B:
      STA     byte_RAM_0
      STA     byte_RAM_1
      LDA     byte_BANKF_F011,Y
      BPL     loc_BANK3_BB96

      DEC     byte_RAM_0

loc_BANK3_BB96:
      CLC
      ADC     PlayerXLo,X
      AND     #$F0
      STA     byte_RAM_5
      PHP
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5
      PLP
      LDA     PlayerXHi,X
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
      ADC     PlayerYLo,X
      AND     #$F0
      STA     byte_RAM_6
      STA     byte_RAM_E6
      LDA     PlayerYHi,X
      ADC     byte_RAM_1
      STA     byte_RAM_1
      STA     byte_RAM_4
      JSR     sub_BANK3_BC2E

      BCC     loc_BANK3_BBD6

      LDA     #0
      BEQ     loc_BANK3_BBDD

loc_BANK3_BBD6:
      JSR     sub_BANK3_BD29

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y

loc_BANK3_BBDD:
      STA     byte_RAM_0
      PLA
      TAX
      RTS

; End of function sub_BANK3_BB87

; =============== S U B R O U T I N E =======================================

sub_BANK3_BBE2:
      PHA
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      ADC     byte_BANK3_BBF1,Y
      TAY
      PLA
      CMP     byte_BANKF_F64E,Y
      RTS

; End of function sub_BANK3_BBE2

; ---------------------------------------------------------------------------
byte_BANK3_BBF1:
      .BYTE $00

      .BYTE $04
      .BYTE $08
; ---------------------------------------------------------------------------

loc_BANK3_BBF4:
      INC     byte_RAM_4BD
      INC     byte_RAM_41B
      JSR     sub_BANK3_BD59

      LDA     #1
      STA     DPCMQueue
      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK3_BC03:
      LDX     #0
      LDY     PlayerMovementDirection
      LDA     PlayerXAccel
      EOR     locret_BANK3_BD56,Y
      BPL     loc_BANK3_BC10

      STX     PlayerXAccel

loc_BANK3_BC10:
      LDA     byte_RAM_4CB
      EOR     locret_BANK3_BD56,Y
      BPL     loc_BANK3_BC1B

      STX     byte_RAM_4CB

loc_BANK3_BC1B:
      STX     ObjectXSubpixel

locret_BANK3_BC1E:
      RTS

; End of function sub_BANK3_BC03

; =============== S U B R O U T I N E =======================================

sub_BANK3_BC1F:
      LDA     #2
      STA     PlayerState
      LDA     #6
      STA     PlayerStateTimer
      LDA     #8
      STA     PlayerAnimationFrame
      INC     HoldingItem
      RTS

; End of function sub_BANK3_BC1F

; =============== S U B R O U T I N E =======================================

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
      CMP     byte_BANK3_BC4E,Y
      BCS     locret_BANK3_BC4C

      LDA     byte_RAM_1
      CMP     byte_BANK3_BC4D,Y

locret_BANK3_BC4C:
      RTS

; End of function sub_BANK3_BC2E

; ---------------------------------------------------------------------------
byte_BANK3_BC4D:
      .BYTE $0A

byte_BANK3_BC4E:
      .BYTE $01

      .BYTE $0B

; =============== S U B R O U T I N E =======================================

sub_BANK3_BC50:
      PHA
      LDA     ObjectXLo,X
      CLC
      ADC     #8
      PHP
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5
      PLP
      LDA     ObjectXHi,X
      LDY     IsHorizontalLevel
      BEQ     loc_BANK3_BC66

      ADC     #0

loc_BANK3_BC66:
      STA     byte_RAM_2
      LDA     ObjectYLo,X
      CLC
      ADC     #8
      AND     #$F0
      STA     byte_RAM_E6
      LDA     ObjectYHi,X
      ADC     #0
      STA     byte_RAM_1
      JSR     sub_BANK3_BC2E

      PLA
      BCS     locret_BANK3_BC1E

      STX     byte_RAM_3
      PHA
      JSR     sub_BANK3_BD29

      PLA
      LDY     byte_RAM_E7
      STA     (byte_RAM_1),Y
      PHA
      LDX     byte_RAM_300
      LDA     #0
      STA     PPUBuffer_301,X
      TYA
      AND     #$F0
      ASL     A
      ROL     PPUBuffer_301,X
      ASL     A
      ROL     PPUBuffer_301,X
      STA     byte_RAM_302,X
      TYA
      AND     #$F
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
      LDA     #2
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
      LDA     #0
      STA     byte_RAM_30B,X
      TXA
      CLC
      ADC     #$A
      STA     byte_RAM_300
      LDX     byte_RAM_3
      RTS

; End of function sub_BANK3_BC50

; ---------------------------------------------------------------------------
unk_BANK3_BD0B:
      .BYTE $20
      .BYTE $28
      .BYTE $20
      .BYTE $24

; =============== S U B R O U T I N E =======================================

sub_BANK3_BD0F:
      LDA     InSubspaceOrJar
      BNE     locret_BANK3_BD28

      LDA     PlayerXHi
      STA     PlayerXHi_Backup
      LDA     PlayerXLo
      STA     PlayerXLo_Backup
      LDA     PlayerYHi
      STA     PlayerYHi_Backup
      LDA     PlayerYLo
      STA     PlayerYLo_Backup

locret_BANK3_BD28:
      RTS

; End of function sub_BANK3_BD0F

; =============== S U B R O U T I N E =======================================

sub_BANK3_BD29:
      LDX     byte_RAM_E8
      JSR     sub_BANK3_BD4C

      LDA     byte_RAM_E6
      CLC
      ADC     byte_RAM_E5
      STA     byte_RAM_E7
      RTS

; End of function sub_BANK3_BD29

; ---------------------------------------------------------------------------
byte_BANK3_BD36:
      .BYTE $00

      .BYTE $F0
      .BYTE $E0
      .BYTE $D0
      .BYTE $C0
      .BYTE $B0
      .BYTE $A0
      .BYTE $90
      .BYTE $80
      .BYTE $70
      .BYTE $00
byte_BANK3_BD41:
      .BYTE $60

      .BYTE $60
      .BYTE $61
      .BYTE $62
      .BYTE $63
      .BYTE $64
      .BYTE $65
      .BYTE $66
      .BYTE $67
      .BYTE $68
      .BYTE $07

; =============== S U B R O U T I N E =======================================

sub_BANK3_BD4C:
      LDA     byte_BANK3_BD36,X
      STA     byte_RAM_1
      LDA     byte_BANK3_BD41,X
      STA     byte_RAM_2

locret_BANK3_BD56:
      RTS

; End of function sub_BANK3_BD4C

; ---------------------------------------------------------------------------
      .BYTE $80
      .BYTE $00

; =============== S U B R O U T I N E =======================================

sub_BANK3_BD59:
      LDA     PlayerXLo
      CLC
      ADC     #8
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
      ADC     #1
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
      ADC     #1
      STA     byte_RAM_6,Y
      PLA
      ADC     #0
      DEX

loc_BANK3_BDB9:
      CMP     #0
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
      LDY     #2

loc_BANK3_BDC9:
      TYA
      TAX
      INX
      CPY     #0
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
byte_BANK3_BDEF:
      .BYTE $BA

      .BYTE $BA
      .BYTE $BA
      .BYTE $BA
      .BYTE $B8
      .BYTE $BA
      .BYTE $BA
      .BYTE $BA
      .BYTE $B8
      .BYTE $B8
      .BYTE $BA
      .BYTE $BA
      .BYTE $B8
      .BYTE $B8
      .BYTE $B8
      .BYTE $BA
      .BYTE $B8
      .BYTE $B8
      .BYTE $B8
      .BYTE $B8
byte_BANK3_BE03:
      .BYTE $00

      .BYTE $03
      .BYTE $00
      .BYTE $FD
byte_BANK3_BE07:
      .BYTE $26

      .BYTE $2A
      .BYTE $22
      .BYTE $26

; =============== S U B R O U T I N E =======================================

sub_BANK3_BE0B:
      LDA     SkyFlashTimer
      BEQ     loc_BANK3_BE55

      DEC     SkyFlashTimer
      LDX     byte_RAM_300
      LDA     #$3F
      STA     PPUBuffer_301,X
      LDA     #$10
      STA     byte_RAM_302,X
      LDA     #4
      STA     byte_RAM_303,X
      LDA     byte_RAM_4BC
      LDY     SkyFlashTimer
      BEQ     loc_BANK3_BE34

      TYA
      AND     #3
      TAY
      LDA     byte_BANK3_BE07,Y

; some kind of palette copying routine
loc_BANK3_BE34:
      STA     byte_RAM_304,X
      LDA     RestorePlayerPalette1
      STA     byte_RAM_305,X
      LDA     RestorePlayerPalette2
      STA     byte_RAM_306,X
      LDA     RestorePlayerPalette3
      STA     byte_RAM_307,X
      LDA     #0
      STA     byte_RAM_308,X
      TXA
      CLC
      ADC     #7
      STA     byte_RAM_300

loc_BANK3_BE55:
      LDA     #$30
      STA     byte_RAM_0
      JSR     loc_BANKF_FAFE

      LDA     PlayerHealth
      BEQ     loc_BANK3_BE67

      AND     #$F0
      LSR     A
      LSR     A
      ADC     #4

loc_BANK3_BE67:
      TAX
      LDA     #$FE
      STA     byte_RAM_3

loc_BANK3_BE6C:
      LDA     byte_BANK3_BDEF,X
      STA     SpriteDMAArea+1,Y
      LDA     #$10
      STA     SpriteDMAArea+3,Y
      LDA     #1
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

      LDA     POWQuakeTimer
      BEQ     locret_BANK3_BEAF

      DEC     POWQuakeTimer
      LSR     A
      AND     #1
      TAY
      LDA     PPUScrollYMirror
      BPL     loc_BANK3_BEA6

      INY
      INY

loc_BANK3_BEA6:
      LDA     byte_BANK3_BE03,Y
      STA     byte_RAM_4C5
      JMP     loc_BANK2_9935

; ---------------------------------------------------------------------------

locret_BANK3_BEAF:
      RTS

; End of function sub_BANK3_BE0B

; ---------------------------------------------------------------------------
; The rest of this bank is empty

; ===========================================================================

