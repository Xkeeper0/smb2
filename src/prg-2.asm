
      ;.segment	BANK2
;       *	=  $8000
byte_BANK2_8000:
	  .BYTE $FA

      .BYTE $F6
      .BYTE $FC
      .BYTE $F7
byte_BANK2_8004:
	  .BYTE $FF

      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
byte_BANK2_8008:
	  .BYTE 2

      .BYTE $FE
      .BYTE 4
      .BYTE $FF
byte_BANK2_800C:
	  .BYTE 0

      .BYTE $FF
      .BYTE 0
      .BYTE $FF

; =============== S U B	R O U T	I N E =======================================

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
      STA     byte_RAM_4C6
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
      LDA     byte_BANK3_BB6B,Y
      STA     ItemCarryOffsetsBig,Y
      DEY
      BPL     loc_BANK2_8058

      LDY     CurrentCharacter
      LDA     byte_BANK2_8000,Y

loc_BANK2_8066:
      STA     ItemCarryOffsetsBig
      LDA     byte_BANK2_8008,Y
      STA     ItemCarryOffsetsSmall
      LDA     byte_BANK2_8004,Y
      STA     byte_RAM_7F0E
      LDA     byte_BANK2_800C,Y
      STA     byte_RAM_7F15
      LDA     #$B6
      STA     byte_RAM_5AC
      LDA     byte_RAM_534

loc_BANK2_8083:
      ORA     CurrentLevel
      BNE     loc_BANK2_808D

      LDA     #$10
      STA     SoundEffectQueue2

loc_BANK2_808D:
      LDA     byte_RAM_4AF
      BEQ     loc_BANK2_8106

      LDX     #5
      STX     byte_RAM_12
      CMP     #$3F
      BEQ     loc_BANK2_8106

      STA     ObjectType,X
      LDY     #1
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
      JSR     sub_BANK2_8441

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
      CMP     #$3D
      BNE     loc_BANK2_8106

      INC     EnemyTimer,X
      DEX
      STX     byte_RAM_12
      LDA     #1
      STA     EnemyState,X
      LDA     #$17
      STA     ObjectType,X
      JSR     EnemyInit_Basic

      LDA     #0
      STA     byte_RAM_5BC
      LDA     byte_RAM_CB
      STA     ObjectYLo,X
      LDA     byte_RAM_CA
      STA     ObjectYHi,X
      LDA     byte_RAM_4C0
      STA     ObjectXLo,X
      LDA     byte_RAM_4BE
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
      LDA     byte_RAM_CB
      SBC     #$30
      AND     #$F0
      STA     byte_RAM_5
      LDA     byte_RAM_CA
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

; =============== S U B	R O U T	I N E =======================================

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
      LDA     byte_RAM_4C0
      SBC     #$30
      AND     #$F0
      STA     byte_RAM_5
      LDA     byte_RAM_4BE
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
      STY     SoundEffect1Queue

loc_BANK2_817F:
      LSR     A
      BCC     loc_BANK2_8185

      DEC     StopwatchTimer

loc_BANK2_8185:
      LDA     byte_RAM_4C0
      CLC
      ADC     #$FF
      STA     byte_RAM_4C1
      LDA     byte_RAM_4BE
      ADC     #0
      STA     byte_RAM_4BF
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
      CMP     #2
      BCS     loc_BANK2_81C4

      LDA     ObjectType,X
      CMP     #$32
      BCS     loc_BANK2_81C4

      LDA     StopwatchTimer
      BNE     loc_BANK2_81D2

loc_BANK2_81C4:
      LDA     BobombExplodeTimer,X
      BEQ     loc_BANK2_81CA

      DEC     BobombExplodeTimer,X

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
      JSR     sub_BANK2_820E

      JSR     sub_BANK2_9AB5

      JSR     EnemyStateHandling

      LDX     byte_RAM_12
      DEX
      BPL     loc_BANK2_8198

      LDA     byte_RAM_4B9
      BEQ     locret_BANK2_820D

      SEC
      SBC     #$47

loc_BANK2_81FD:
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK2_8B64
      .WORD loc_BANK2_8B90
      .WORD sub_BANK2_8208
      .WORD loc_BANK3_B180

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8208:
      LDA     #0
      STA     byte_RAM_4B9

locret_BANK2_820D:
      RTS

; End of function sub_BANK2_8208

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_820E:
      LDY     #0
      JSR     sub_BANK2_8214

      INY

; End of function sub_BANK2_820E

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8214:
      LDA     byte_RAM_5AC
      ASL     A
      ASL     A
      SEC
      ADC     byte_RAM_5AC
      STA     byte_RAM_5AC
      ASL     byte_RAM_5AD
      LDA     #$20
      BIT     byte_RAM_5AD
      BCC     loc_BANK2_822E

      BEQ     loc_BANK2_8233

      BNE     loc_BANK2_8230

loc_BANK2_822E:
      BNE     loc_BANK2_8233

loc_BANK2_8230:
      INC     byte_RAM_5AD

loc_BANK2_8233:
      LDA     byte_RAM_5AD
      EOR     byte_RAM_5AC
      STA     byte_RAM_5AE,Y
      RTS

; End of function sub_BANK2_8214

; ---------------------------------------------------------------------------

EnemyStateHandling:
      LDA     EnemyState,X
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD locret_BANK2_820D			  
      .WORD loc_BANK2_89B9			  ; Alive
      .WORD loc_BANK2_84FA			  ; Dead
      .WORD loc_BANK2_858F			  ; Block fizzle
      .WORD loc_BANK2_85F7			  ; Bomb exploding
      .WORD loc_BANK2_879C			  ; Puff of smoke
      .WORD loc_BANK2_8858
off_BANK2_8250:
	  .WORD loc_BANK2_85B2
      .BYTE $18
byte_BANK2_8253:
	  .BYTE $E0

      .BYTE 1
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
      LDY     byte_RAM_6E
      LDA     byte_RAM_4C0
      CLC
      ADC     off_BANK2_8250+1,Y
      AND     #$F0
      STA     byte_RAM_5
      LDA     byte_RAM_4BE
      ADC     byte_BANK2_8253,Y
      STA     byte_RAM_6
      CMP     #$A
      BCS     locret_BANK2_82AB

; =============== S U B	R O U T	I N E =======================================

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
      LDA     byte_RAM_D8
      BEQ     loc_BANK2_82FC

      AND     #3
      EOR     #3
      TAY

loc_BANK2_82FC:
      LDA     byte_RAM_CB
      CLC
      ADC     off_BANK2_8250+1,Y
      AND     #$F0
      STA     byte_RAM_5
      LDA     byte_RAM_CA
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
	  .WORD EnemyInit_Basic
      .WORD EnemyInit_Basic			  ; ShyguyRed
      .WORD EnemyInit_Basic			  ; Tweeter
      .WORD EnemyInit_Basic			  ; ShyguyPink
      .WORD EnemyInit_Basic			  ; Porcupo
      .WORD EnemyInit_Basic			  ; SnifitRed
      .WORD EnemyInit_Stationary		  ; SnifitGray
      .WORD EnemyInit_Basic			  ; SnifitPink
      .WORD EnemyInit_Basic			  ; Ostro
      .WORD EnemyInit_Bobomb			  ; BobOmb
      .WORD EnemyInit_Basic			  ; AlbatossCarryingBobOmb
      .WORD EnemyInit_AlbatossStartRight	  ; AlbatossStartRight
      .WORD EnemyInit_AlbatossStartLeft		  ; AlbatossStartLeft
      .WORD EnemyInit_Basic			  ; NinjiRunning
      .WORD EnemyInit_Stationary		  ; NinjiJumping
      .WORD loc_BANK2_84B9			  ; BeezoDiving
      .WORD EnemyInit_Basic			  ; BeezoStraight
      .WORD EnemyInit_Basic			  ; WartBubble
      .WORD EnemyInit_Basic			  ; Pidgit
      .WORD loc_BANK2_8E63			  ; Trouter
      .WORD EnemyInit_Basic			  ; Hoopstar
      .WORD loc_BANK2_8AE6			  ; JarGeneratorShyguy
      .WORD loc_BANK2_8AE6			  ; JarGeneratorBobOmb
      .WORD loc_BANK2_84E5			  ; Phanto
      .WORD loc_BANK3_A8F2			  ; CobratJar
      .WORD loc_BANK3_A8F2			  ; CobratSand
      .WORD loc_BANK3_AA14			  ; Pokey
      .WORD EnemyInit_Basic			  ; Bullet
      .WORD sub_BANK2_8F52			  ; Birdo
      .WORD loc_BANK3_A56B			  ; Mouser
      .WORD EnemyInit_Basic			  ; Egg
      .WORD loc_BANK3_A724			  ; Tryclyde
      .WORD EnemyInit_Basic			  ; Fireball
      .WORD loc_BANK3_A10A			  ; Clawgrip
      .WORD EnemyInit_Basic			  ; ClawgripRock
      .WORD EnemyInit_Stationary		  ; PanserStationaryFiresAngled
      .WORD EnemyInit_Basic			  ; PanserWalking
      .WORD EnemyInit_Stationary		  ; PanserStationaryFiresUp
      .WORD EnemyInit_Basic			  ; Autobomb
      .WORD EnemyInit_Basic			  ; AutobombFire
      .WORD loc_BANK3_AEAA			  ; WhaleSpout
      .WORD EnemyInit_Basic			  ; Flurry
      .WORD loc_BANK3_AC6A			  ; Fryguy
      .WORD loc_BANK3_AC6A			  ; FryguySplit
      .WORD loc_BANK3_B1CD			  ; Wart
      .WORD loc_BANK3_AFE3			  ; HawkmouthBoss
      .WORD loc_BANK2_8AF4			  ; Spark1
      .WORD loc_BANK2_8AF4			  ; Spark2
      .WORD loc_BANK2_8AF4			  ; Spark3
      .WORD loc_BANK2_8AF4			  ; Spark4
      .WORD EnemyInit_Basic			  ; VegetableSmall
      .WORD EnemyInit_Basic			  ; VegetableLarge
      .WORD EnemyInit_Basic			  ; VegetableWart
      .WORD EnemyInit_Basic			  ; Shell
      .WORD EnemyInit_Basic			  ; Coin
      .WORD EnemyInit_Basic			  ; Bomb
      .WORD EnemyInit_Basic			  ; Rocket
      .WORD EnemyInit_Basic			  ; MushroomBlock
      .WORD EnemyInit_Basic			  ; POWBlock
      .WORD loc_BANK2_98E0			  ; FallingLogs
      .WORD EnemyInit_Basic			  ; SubspaceDoor
      .WORD loc_BANK2_8C91			  ; Key
      .WORD EnemyInit_Basic			  ; SubspacePotion
      .WORD EnemyInit_Stationary		  ; Mushroom
      .WORD EnemyInit_Stationary		  ; Mushroom1up
      .WORD EnemyInit_Basic			  ; FlyingCarpet
      .WORD sub_BANK2_8D5F			  ; HawkmouthRight
      .WORD sub_BANK2_8D5F			  ; HawkmouthLeft
      .WORD loc_BANK2_8CB1			  ; CrystalBall
      .WORD loc_BANK2_8CB1			  ; Starman
      .WORD loc_BANK2_8CB1			  ; Stopwatch

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8441:
      LDY     ObjectType,X
      LDA     ObjectAttributeTable,Y
      AND     #$7F
      STA     ObjectAttributes,X
      LDA     byte_BANKF_F532,Y
      STA     unk_RAM_46E,X

loc_BANK2_8450:
      LDA     unk_BANKF_F5C0,Y
      STA     unk_RAM_489,X
      LDA     unk_BANKF_F579,Y
      STA     unk_RAM_492,X
      RTS

; End of function sub_BANK2_8441

; =============== S U B	R O U T	I N E =======================================

EnemyInit_Basic:
      LDA     #0
      STA     BobombExplodeTimer,X

; End of function EnemyInit_Basic

; =============== S U B	R O U T	I N E =======================================

; Enemy	initializing (sets most	stuff to 0)

sub_BANK2_8461:
      LDA     #0
      STA     EnemyTimer,X
      LDA     #0				  ; You	do realize you already LDA #0, right???
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
      JSR     sub_BANK2_8441

loc_BANK2_8492:
      JSR     EnemyFindWhichSidePlayerIsOn

loc_BANK2_8495:
      INY
      STY     unk_RAM_6F,X
      LDA     byte_BANK2_85F1,Y
      STA     ObjectXAccel,X
      LDA     unk_RAM_46E,X
      AND     #$40
      BEQ     locret_BANK2_84A6

      ASL     ObjectXAccel,X

locret_BANK2_84A6:
      RTS

; End of function sub_BANK2_8461

; ---------------------------------------------------------------------------
      .BYTE $FE
      .BYTE 0
unk_BANK2_84A9:
	  .BYTE $12
      .BYTE $16
      .BYTE $1A
      .BYTE $1E
      .BYTE $22
      .BYTE $26
      .BYTE $2A
      .BYTE $2D
      .BYTE $30
      .BYTE $32
      .BYTE $34
      .BYTE $37	; 7
      .BYTE $39	; 9
      .BYTE $3B
      .BYTE $3D
      .BYTE $3E
; ---------------------------------------------------------------------------

loc_BANK2_84B9:
      JSR     EnemyInit_Basic

      LDY     byte_RAM_6E
      LDA     byte_RAM_4C0
      ADC     locret_BANK2_84A6,Y
      STA     ObjectXLo,X
      LDA     byte_RAM_4BE
      ADC     #0
      STA     ObjectXHi,X

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_84CD:
      LDA     PlayerYHi
      BPL     loc_BANK2_84D5

      LDY     #0
      BEQ     loc_BANK2_84DF

loc_BANK2_84D5:
      LDA     PlayerYLo
      SEC
      SBC     byte_RAM_CB
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      TAY

loc_BANK2_84DF:
      LDA     unk_BANK2_84A9,Y
      STA     ObjectYAccel,X
      RTS

; End of function sub_BANK2_84CD

; ---------------------------------------------------------------------------

loc_BANK2_84E5:
      JSR     EnemyInit_Basic

      LDA     #$C
      STA     ObjectXAccel,X
      LDA     #$A0
      STA     byte_RAM_5BC
      RTS

; =============== S U B	R O U T	I N E =======================================

EnemyInit_Bobomb:
      JSR     EnemyInit_Basic

      LDA     #$FF
      STA     BobombExplodeTimer,X
      RTS

; End of function EnemyInit_Bobomb

; ---------------------------------------------------------------------------

loc_BANK2_84FA:
      JSR     sub_BANK3_B5CC

      JSR     sub_BANK2_88E8

loc_BANK2_8500:
      LDA     EnemyState,X
      BNE     loc_BANK2_856F

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
      STA     unk_RAM_46E,X
      JMP     MakeMushroomExplodeIntoPuffOfSmoke

; ---------------------------------------------------------------------------

EnemyDeathMaybe:
      LDA     ObjectType,X
      CMP     #$1B				  ; "Stray bullet" enemy type
      BEQ     loc_BANK2_856F

      INC     EnemiesKilledForHeart
      LDY     EnemiesKilledForHeart
      CPY     #8
      BCC     loc_BANK2_856F

      LDA     #0
      STA     EnemiesKilledForHeart
      LDA     #1
      STA     EnemyState,X
      STA     ObjectAttributes,X
      LDA     #7
      STA     unk_RAM_46E,X
      LDA     #0				  ; $00	= Heart
      STA     ObjectType,X
      LDA     ObjectYLo,X
      SBC     #$60
      STA     ObjectYLo,X
      LDA     ObjectYHi,X
      SBC     #0
      STA     ObjectYHi,X

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8569:
      LDA     #$FF
      STA     unk_RAM_441,X
      RTS

; End of function sub_BANK2_8569

; ---------------------------------------------------------------------------

loc_BANK2_856F:
      ASL     ObjectAttributes,X
      SEC
      ROR     ObjectAttributes,X

loc_BANK2_8574:
      JSR     sub_BANK2_9B1B

; =============== S U B	R O U T	I N E =======================================

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
      INC     ObjectYAccel,X			  ; Makes objects slowly fall down
      INC     ObjectYAccel,X			  ; Turning these into DECs causes...
						  ;			    problems.

locret_BANK2_858E:
      RTS

; End of function sub_BANK2_8577

; ---------------------------------------------------------------------------

loc_BANK2_858F:
      JSR     sub_BANK2_88E8

      LDA     BobombExplodeTimer,X
      BEQ     loc_BANK2_85AF

      TAY
      LSR     A
      LSR     A
      AND     #1
      STA     unk_RAM_6F,X
      LDA     #1
      STA     ObjectAttributes,X
      STA     unk_RAM_46E,X
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
      LDA     BobombExplodeTimer,X
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
      STA     unk_RAM_6F,X

loc_BANK2_85E1:
      JSR     sub_BANK2_9486

      JMP     sub_BANK3_B5CC

; ---------------------------------------------------------------------------
byte_BANK2_85E7:
	  .BYTE $F8

      .BYTE 0
      .BYTE $F8
      .BYTE 0
      .BYTE 8
byte_BANK2_85EC:
	  .BYTE $10
      .BYTE 8
      .BYTE $10
byte_BANK2_85EF:
	  .BYTE $F8

      .BYTE $F8
byte_BANK2_85F1:
	  .BYTE 8

      .BYTE 8
      .BYTE $F8
      .BYTE $F8
      .BYTE 8
      .BYTE 8
; ---------------------------------------------------------------------------

loc_BANK2_85F7:
      JSR     sub_BANK2_88E8

      LDA     byte_RAM_EE
      ORA     byte_RAM_EF
      BNE     loc_BANK2_85AF

      LDA     BobombExplodeTimer,X
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
      LDA     byte_RAM_42C
      CLC
      ADC     byte_BANK2_85EF,X
      STA     SpriteDMAArea,Y
      LDA     byte_RAM_429
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

      .BYTE 8
      .BYTE $15
      .BYTE $FB
      .BYTE 8
      .BYTE $15
      .BYTE $FB
      .BYTE 8
      .BYTE $15
byte_BANK2_8653:
	  .BYTE $FF

      .BYTE 0
      .BYTE 0
      .BYTE $FF
      .BYTE 0
      .BYTE 0
      .BYTE $FF
      .BYTE 0
      .BYTE   0
byte_BANK2_865C:
	  .BYTE $FC

      .BYTE $FC
      .BYTE $FC
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE $14
      .BYTE $14
      .BYTE $14
byte_BANK2_8665:
	  .BYTE $FF

      .BYTE $FF
      .BYTE $FF
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE   0
byte_BANK2_866E:
	  .BYTE $5F

      .BYTE   6

; =============== S U B	R O U T	I N E =======================================

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
      LDA     byte_RAM_4BE
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
      JSR     sub_BANK2_8461

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

loc_BANK2_879C:
      JSR     sub_BANK2_88E8

      LDA     ObjectAttributes,X
      ORA     #$10
      STA     ObjectAttributes,X
      LDA     BobombExplodeTimer,X
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

      LDA     BobombExplodeTimer,X
      CMP     #3
      BNE     locret_BANK2_8797

      LDY     #$22
      LDA     ObjectType,X
      CMP     #Enemy_Clawgrip
      BNE     loc_BANK2_87CA

      DEY

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
      CMP     #$2B
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

loc_BANK2_8858:
      JSR     sub_BANK2_88E8

      LDA     #$12
      STA     ObjectAttributes,X
      LDA     BobombExplodeTimer,X
      BEQ     loc_BANK2_8888

      LDA     #$F8
      STA     ObjectYAccel,X
      JSR     sub_BANK2_9E4B

      LDA     #$B2
      LDY     BobombExplodeTimer,X
      CPY     #$10
      BCS     loc_BANK2_8885

      LDA     #$80
      STA     unk_RAM_46E,X
      LDA     #1
      STA     ObjectAttributes,X
      ASL     A
      STA     unk_RAM_6F,X
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8894:
      LDA     #0
      STA     byte_RAM_EE
      LDA     ObjectAttributes,X
      LDY     #1
      AND     #4
      BNE     loc_BANK2_88B9

      LDA     ObjectType,X
      CMP     #$1A
      BEQ     loc_BANK2_88B9

      CMP     #8
      BEQ     loc_BANK2_88B9

      CMP     #$2D
      BEQ     loc_BANK2_88B9

      CMP     #$21
      BEQ     loc_BANK2_88B9

      LDA     unk_RAM_46E,X
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
      CMP     byte_RAM_4C0
      LDA     byte_RAM_F
      SBC     byte_RAM_4BE
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
	  .BYTE 8

      .BYTE 4
      .BYTE 2
      .BYTE 1
byte_BANK2_88E4:
	  .BYTE 0

      .BYTE 8
      .BYTE $10
      .BYTE $18

; =============== S U B	R O U T	I N E =======================================

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
      CMP     byte_RAM_CB
      LDA     byte_RAM_1
      SBC     byte_RAM_CA
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

      LDA     byte_RAM_CB
      SBC     #$30
      STA     byte_RAM_1
      LDA     byte_RAM_CA
      SBC     #0
      STA     byte_RAM_0
      INC     byte_RAM_0
      LDA     byte_RAM_CB
      ADC     #$FF
      PHP
      ADC     #$30
      STA     byte_RAM_3
      LDA     byte_RAM_CA
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

      LDA     byte_RAM_4C0
      SBC     #$30
      STA     byte_RAM_1
      LDA     byte_RAM_4BE
      SBC     #0
      STA     byte_RAM_0
      INC     byte_RAM_0
      LDA     byte_RAM_4C1
      ADC     #$30
      STA     byte_RAM_3
      LDA     byte_RAM_4BF
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
      LDA     byte_BANKF_F532,Y
      AND     #8
      BNE     locret_BANK2_89B8

loc_BANK2_89A5:
      LDA     ObjectBeingCarriedTimer,X
      BNE     locret_BANK2_89B8

; End of function sub_BANK2_88E8

; =============== S U B	R O U T	I N E =======================================

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

loc_BANK2_89B9:
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

      LDA     byte_RAM_D8
      AND     #4
      BNE     loc_BANK2_8A07

      LDA     StopwatchTimer
      BNE     loc_BANK2_89E2

      LDA     EnemyArray_438,X
      BEQ     loc_BANK2_8A0A

loc_BANK2_89E2:
      LDA     ObjectType,X
      CMP     #0
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
      JMP     sub_BANK2_9B1B

; ---------------------------------------------------------------------------

loc_BANK2_8A0A:
      LDY     #1
      LDA     ObjectXAccel,X
      BEQ     loc_BANK2_8A15

      BPL     loc_BANK2_8A13

      INY

loc_BANK2_8A13:
      STY     unk_RAM_6F,X

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
      CMP     #9
      BNE     loc_BANK2_8A36

      LDA     EnemyCollision,X
      AND     #4
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

      LDA     byte_RAM_42C
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
	  .WORD	EnemyBehavior_00
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_BasicWalker
      .WORD EnemyBehavior_Ostro
      .WORD EnemyBehavior_BobOmb
      .WORD EnemyBehavior_Albatoss		  ; 10
      .WORD EnemyBehavior_Albatoss
      .WORD EnemyBehavior_Albatoss
      .WORD EnemyBehavior_NinjiRunning
      .WORD EnemyBehavior_NinjiJumping
      .WORD EnemyBehavior_Beezo
      .WORD EnemyBehavior_Beezo
      .WORD EnemyBehavior_WartBubble
      .WORD EnemyBehavior_Pidgit
      .WORD EnemyBehavior_Trouter
      .WORD EnemyBehavior_Hoopstar		  ; 20
      .WORD EnemyBehavior_JarGenerators
      .WORD EnemyBehavior_JarGenerators
      .WORD EnemyBehavior_Phanto
      .WORD EnemyBehavior_CobratJar
      .WORD EnemyBehavior_CobratGround
      .WORD EnemyBehavior_Pokey
      .WORD EnemyBehavior_BulletAndEgg
      .WORD EnemyBehavior_Birdo
      .WORD EnemyBehavior_Mouser
      .WORD EnemyBehavior_BulletAndEgg		  ; 30
      .WORD EnemyBehavior_Tryclyde
      .WORD EnemyBehavior_Fireball
      .WORD EnemyBehavior_Clawgrip
      .WORD EnemyBehavior_ClawgripRock
      .WORD EnemyBehavior_PanserRedAndGray
      .WORD EnemyBehavior_PanserPink
      .WORD EnemyBehavior_PanserRedAndGray
      .WORD EnemyBehavior_Autobomb
      .WORD EnemyBehavior_AutobombFire
      .WORD EnemyBehavior_WhaleSpout		  ; 40
      .WORD EnemyBehavior_Flurry
      .WORD EnemyBehavior_Fryguy
      .WORD EnemyBehavior_FryguySplit
      .WORD EnemyBehavior_Wart
      .WORD EnemyBehavior_HawkmouthBoss
      .WORD EnemyBehavior_Spark
      .WORD EnemyBehavior_Spark
      .WORD EnemyBehavior_Spark
      .WORD EnemyBehavior_Spark
      .WORD EnemyBehavior_Vegetable		  ; 50
      .WORD EnemyBehavior_Vegetable
off_BANK2_8AC0:
	  .WORD EnemyBehavior_Vegetable
off_BANK2_8AC2:
	  .WORD loc_BANK2_989A
      .WORD EnemyBehavior_Coin
      .WORD EnemyBehavior_Bomb
      .WORD EnemyBehavior_Rocket
      .WORD EnemyBehavior_MushroomBlockAndPOW
      .WORD EnemyBehavior_MushroomBlockAndPOW
      .WORD EnemyBehavior_FallingLogs
      .WORD EnemyBehavior_SubspaceDoor		  ; 60
      .WORD EnemyBehavior_Key
      .WORD EnemyBehavior_SubspacePotion
      .WORD EnemyBehavior_Mushroom
      .WORD EnemyBehavior_Mushroom1up
      .WORD EnemyBehavior_FlyingCarpet
      .WORD EnemyBehavior_Hawkmouth
      .WORD EnemyBehavior_Hawkmouth
      .WORD EnemyBehavior_CrystalBall
      .WORD EnemyBehavior_Starman
      .WORD EnemyBehavior_Mushroom		  ; 70
; ---------------------------------------------------------------------------

loc_BANK2_8AE6:
      JSR     EnemyInit_Basic

      LDA     #$50
      STA     EnemyArray_9F,X
      RTS

; ---------------------------------------------------------------------------
      .BYTE $F0
      .BYTE $E0
      .BYTE $F0
      .BYTE $E0
      .BYTE $10
      .BYTE $20
; ---------------------------------------------------------------------------

loc_BANK2_8AF4:
      JSR     EnemyInit_Basic

      LDY     ObjectType,X
      LDA     off_BANK2_8AC0,Y
      STA     ObjectXAccel,X
      LDA     off_BANK2_8AC2,Y
      STA     ObjectYAccel,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK2_8B04:
	  .BYTE $C

      .BYTE 3
byte_BANK2_8B06:
	  .BYTE 0

      .BYTE $A
; ---------------------------------------------------------------------------

EnemyBehavior_Spark:
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_8B5B

      JSR     sub_BANK2_9B1B

      LDA     ObjectXLo,X
      ORA     ObjectYLo,X
      AND     #$F
      BNE     loc_BANK2_8B50

      JSR     sub_BANK3_B4F9

      LDY     EnemyArray_477,X
      LDA     EnemyCollision,X
      AND     byte_BANK2_8B04,Y
      BEQ     loc_BANK2_8B47

      LDA     byte_BANK2_8B04,Y
      EOR     #$F
      AND     EnemyCollision,X
      BEQ     loc_BANK2_8B50

      TYA
      EOR     #1
      STA     EnemyArray_477,X
      TAY

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8B5B:
      INC     EnemyArray_9F,X
      INC     EnemyArray_9F,X
      RTS

; End of function sub_BANK2_8B5B

; ---------------------------------------------------------------------------
byte_BANK2_8B60:
	  .BYTE $F0

      .BYTE 0
byte_BANK2_8B62:
	  .BYTE $FF

      .BYTE 1
; ---------------------------------------------------------------------------

loc_BANK2_8B64:
      JSR     sub_BANK2_8BBD

      ADC     byte_BANK2_8B60,Y
      STA     ObjectXLo,X
      LDA     byte_RAM_4BE
      ADC     byte_BANK2_8B62,Y
      STA     ObjectXHi,X
      STY     byte_RAM_1
      LDA     #$A
      STA     ObjectType,X
      JSR     sub_BANK2_8441

      LDA     byte_RAM_5AE
      AND     #$1F
      ADC     #$20
      STA     ObjectYLo,X
      LDY     byte_RAM_1
      JSR     loc_BANK2_8495

      ASL     ObjectXAccel,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK2_8B8E:
	  .BYTE 0

      .BYTE $FF
; ---------------------------------------------------------------------------

loc_BANK2_8B90:
      JSR     sub_BANK2_8BBD

      ADC     byte_BANK2_8B8E,Y
      STA     ObjectXLo,X
      LDA     IsHorizontalLevel
      BEQ     loc_BANK2_8BA1

      LDA     byte_RAM_4BE
      ADC     #0

loc_BANK2_8BA1:
      STA     ObjectXHi,X
      LDA     byte_RAM_CB
      STA     ObjectYLo,X
      LDA     byte_RAM_CA
      STA     ObjectYHi,X
      STY     byte_RAM_1
      LDA     #Enemy_BeezoDiving
      STA     ObjectType,X
      JSR     sub_BANK2_8441

      LDY     byte_RAM_1
      JSR     loc_BANK2_8495

      JSR     sub_BANK2_84CD

      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8BBD:
      LDA     StopwatchTimer
      BNE     loc_BANK2_8BE1

      LDA     byte_RAM_623
      CLC
      ADC     #3
      STA     byte_RAM_623
      BCC     loc_BANK2_8BE1

      JSR     sub_BANK2_92C8

      BMI     loc_BANK2_8BE1

      LDY     #0
      LDA     byte_RAM_10
      AND     #$40
      BNE     loc_BANK2_8BDB

      INY

loc_BANK2_8BDB:
      LDX     byte_RAM_0
      LDA     byte_RAM_4C0
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

      JSR     sub_BANK2_9B1B

      LDA     EnemyTimer,X
      BNE     loc_BANK2_8BF7

      JMP     sub_BANK2_8577

; ---------------------------------------------------------------------------

loc_BANK2_8BF7:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK2_8C00

      JSR     MakeMushroomExplodeIntoPuffOfSmoke

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

      JSR     sub_BANK2_9EA9

loc_BANK2_8C22:
      JSR     sub_BANK2_8577

      LDA     #$83
      STA     unk_RAM_46E,X
      LDA     #2
      STA     unk_RAM_6F,X
      JSR     sub_BANK2_997A

      INC     EnemyArray_9F,X
      LDA     EnemyArray_9F,X
      AND     #$2F
      BNE     loc_BANK2_8C3D

      LDA     #$10
      STA     BobombExplodeTimer,X

loc_BANK2_8C3D:
      LDY     BobombExplodeTimer,X
      BEQ     loc_BANK2_8C8E

      CPY     #6
      BNE     loc_BANK2_8C7C

      JSR     sub_BANK2_92C8

      BMI     loc_BANK2_8C7C

      LDA     ObjectType,X
      PHA
      LDX     byte_RAM_0
      LDA     byte_RAM_5AE
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
      JSR     sub_BANK2_8441

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
      JMP     sub_BANK2_9B1B

; ---------------------------------------------------------------------------

loc_BANK2_8C91:
      LDY     #5

loc_BANK2_8C93:
      LDA     EnemyState,Y
      BEQ     loc_BANK2_8CA3

loc_BANK2_8C98:
      CPY     byte_RAM_12
      BEQ     loc_BANK2_8CA3

      LDA     ObjectType,Y
      CMP     #$3D
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

loc_BANK2_8CB1:
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

      JSR     sub_BANK2_92C8

      BMI     locret_BANK2_8CF7

      LDX     byte_RAM_0
      LDA     #$45
      STA     ObjectType,X
      LDA     byte_RAM_4C0
      ADC     #$D0
      STA     ObjectXLo,X
      LDA     byte_RAM_4BE
      ADC     #0
      STA     ObjectXHi,X
      LDA     byte_RAM_CB
      ADC     #$E0
      STA     ObjectYLo,X
      LDA     byte_RAM_CA
      ADC     #0
      STA     ObjectYHi,X
      JSR     sub_BANK2_8441

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

      JSR     sub_BANK2_92C8

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

      LDA     #9
      STA     ObjectType,Y
      LDA     ObjectXAccel,Y
      ASL     A
      STA     ObjectXAccel,Y
      LDA     #$FF
      STA     BobombExplodeTimer,Y

locret_BANK2_8D5E:
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8D5F:
      DEC     ObjectYLo,X
      DEC     ObjectYLo,X
      LDY     #1
      STY     byte_RAM_711F
      INY
      STY     byte_RAM_710B

; End of function sub_BANK2_8D5F

; =============== S U B	R O U T	I N E =======================================

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
      STA     SoundEffect1Queue

loc_BANK2_8D8A:
      LDA     HawkmouthClosing
      BEQ     loc_BANK2_8DBA

      DEC     CrystalAndHawkmouthOpenSize
      BNE     loc_BANK2_8D78

      LDA     #0
      STA     HawkmouthClosing
      LDA     #1
      STA     byte_RAM_534
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
      AND     #$40
      BEQ     loc_BANK2_8E05

      LDA     ObjectYLo,X
      CMP     PlayerYLo
      BCS     loc_BANK2_8E05

      LDA     PlayerCollision
      AND     #4
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
      STA     SoundEffect1Queue
      INC     HawkmouthClosing

loc_BANK2_8E05:
      LDA     byte_RAM_EF
      BNE     loc_BANK2_8E60

      LDA     ObjectType,X
      SEC
      SBC     #$41
      STA     unk_RAM_6F,X
      LDA     CrystalAndHawkmouthOpenSize

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8E13:
      STA     byte_RAM_7
      LSR     A
      LSR     A
      EOR     #$FF
      SEC
      ADC     byte_RAM_42C
      STA     byte_RAM_42C
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
      ADC     byte_RAM_42C
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

loc_BANK2_8E63:
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
      STA     BobombExplodeTimer,X

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

      LDY     BobombExplodeTimer,X
      BNE     locret_BANK2_8E78

      STA     ObjectYLo,X
      LDY     EnemyArray_B1,X
      LDA     byte_BANK2_8E79,Y
      STA     ObjectYAccel,X
      LDA     #$C0
      STA     BobombExplodeTimer,X

loc_BANK2_8EB6:
      JSR     sub_BANK2_9430

      INC     ObjectYAccel,X
      JMP     sub_BANK2_9B1B

; ---------------------------------------------------------------------------
byte_BANK2_8EBE:
	  .BYTE $FA

      .BYTE $C
byte_BANK2_8EC0:
	  .BYTE $91

      .BYTE $11
; ---------------------------------------------------------------------------

EnemyBehavior_Hoopstar:
      JSR     sub_BANK2_997A

      INC     EnemyArray_9F,X
      JSR     sub_BANK2_98CD

      JSR     sub_BANK2_9B1B

      JSR     sub_BANK2_98D6

      LDA     #0
      STA     ObjectXAccel,X
      JSR     sub_BANK3_B4E2

      LDY     EnemyArray_477,X
      BCC     loc_BANK2_8EEC

      LDA     ObjectYLo,X
      CMP     byte_RAM_CB
      LDA     ObjectYHi,X
      SBC     byte_RAM_CA
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

      LDY     byte_RAM_F4
      LDA     byte_RAM_42C
      STA     SpriteDMAArea,Y
      LDA     byte_RAM_429
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
byte_BANK2_8F4F:
	  .BYTE $43

      .BYTE $41
      .BYTE $42

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_8F52:
      JSR     EnemyInit_Basic

      LDY     #0
      LDA     ObjectXLo,X
      CMP     #$A0
      BEQ     loc_BANK2_8F63

      INY
      CMP     #$B0
      BEQ     loc_BANK2_8F63

      INY

loc_BANK2_8F63:
      STY     EnemyTimer,X
      LDA     byte_BANK2_8F4F,Y
      STA     ObjectAttributes,X
      LDA     #2
      STA     EnemyHP,X

loc_BANK2_8F6F:
      LDA     ObjectXHi,X
      STA     unk_RAM_4EF,X

locret_BANK2_8F74:
      RTS

; End of function sub_BANK2_8F52

; ---------------------------------------------------------------------------
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
      STY     unk_RAM_6F,X
      JSR     sub_BANK2_9B1B

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
unk_BANK2_8FA0:
	  .BYTE   8
      .BYTE   6
      .BYTE 4
; ---------------------------------------------------------------------------

loc_BANK2_8FA3:
      LDY     EnemyTimer,X
      LDA     byte_BANK2_8F9D,Y
      AND     byte_RAM_10
      BNE     loc_BANK2_8FB6

      LDA     byte_RAM_EE
      AND     #$C
      BNE     loc_BANK2_8FB6

      LDA     #$1C
      STA     BobombExplodeTimer,X

loc_BANK2_8FB6:
      LDY     BobombExplodeTimer,X
      BNE     BirdoBehavior_SpitEgg

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

BirdoBehavior_SpitEgg:
      CPY     #8
      BNE     loc_BANK2_901B

      LDA     #SoundEffect1_BirdoShot
      STA     SoundEffect1Queue
      JSR     sub_BANK2_95E5

      BMI     loc_BANK2_901B

      LDY     EnemyHP,X
      LDA     EnemyTimer,X
      LDX     byte_RAM_0
      CMP     #2
      BEQ     loc_BANK2_8FFC

      CMP     #1
      BNE     loc_BANK2_9002

      LDA     byte_RAM_5AE
      AND     #$1F
      CMP     unk_BANK2_8FA0,Y
      BCS     loc_BANK2_9002

loc_BANK2_8FFC:
      INC     EnemyTimer,X
      LDA     #Enemy_Fireball
      BNE     sub_BANK2_9004

loc_BANK2_9002:
      LDA     #Enemy_Egg

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9004:
      STA     ObjectType,X
      LDA     ObjectYLo,X
      CLC
      ADC     #3
      STA     ObjectYLo,X
      LDY     unk_RAM_6F,X
      LDA     ObjectXLo,X
      ADC     locret_BANK2_8F74,Y
      STA     ObjectXLo,X
      JSR     sub_BANK2_8441

      LDX     byte_RAM_12

loc_BANK2_901B:
      JMP     sub_BANK2_9B1B

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

      JSR     MakeMushroomExplodeIntoPuffOfSmoke

      LDA     ObjectType,X
      CMP     #Enemy_Mushroom1up
      BEQ     Award1upMushroom

      INC     SlotMachineCoins
      RTS

; ---------------------------------------------------------------------------

Award1upMushroom:
      INC     Mushroom1upPulled
      INC     ExtraLives
      BNE     loc_BANK2_9050			  ; Check if lives overflow. If	so, reduce by one again

      DEC     ExtraLives

loc_BANK2_9050:
      LDA     #SoundEffect1_1UP
      STA     SoundEffect1Queue
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_CrystalBall:
      INC     byte_RAM_42C
      JSR     sub_BANK2_91C7

EnemyBehavior_Mushroom:
      LDA     ObjectBeingCarriedTimer,X
      CMP     #1
      BNE     loc_BANK2_9066

      LDA     byte_RAM_9A
      BEQ     loc_BANK2_9069

loc_BANK2_9066:
      JMP     EnemyBehavior_Bomb

; ---------------------------------------------------------------------------

loc_BANK2_9069:
      JSR     CarryObject

      LDA     #0
      STA     HoldingItem
      STA     ObjectBeingCarriedTimer,X
      JSR     MakeMushroomExplodeIntoPuffOfSmoke

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

      LDX     EnemyTimer
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
      AND     unk_RAM_6F,X
      BEQ     loc_BANK2_90D9

      JSR     sub_BANK2_9EA9

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

      LDA     BobombExplodeTimer,X
      BNE     loc_BANK2_9122

      LDY     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_910D

      STA     HoldingItem
      STA     ObjectBeingCarriedTimer,X

loc_BANK2_910D:
      LDA     #EnemyState_BombExploding
      STA     EnemyState,X
      LDA     #$20
      STA     BobombExplodeTimer,X
      STA     byte_RAM_4C6
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

      JSR     sub_BANK2_9EA9

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
      STA     SoundEffect1Queue
      INC     EnemyArray_B1,X
      LDA     #Enemy_SubspaceDoor
      STA     ObjectType,X
      JSR     sub_BANK2_8441

      LDA     #$10
      STA     byte_RAM_5BB
      LDA     IsHorizontalLevel
      BNE     loc_BANK2_9198

      LDA     #DPCM_BossHurt
      STA     DPCMQueue
      JSR     sub_BANK2_89A9

loc_BANK2_9198:
      JSR     sub_BANK2_92C8

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

; =============== S U B	R O U T	I N E =======================================

; X = Enemy index of mushroom to poof

MakeMushroomExplodeIntoPuffOfSmoke:
      LDA     ObjectAttributes,X		  ; Get	current	object sprite attributes...
      AND     #ObjAttrib_Palette0|ObjAttrib_Unknown_04|ObjAttrib_Unknown_08|ObjAttrib_Mirrored|ObjAttrib_Unknown_20|ObjAttrib_16x32|ObjAttrib_UpsideDown
      ORA     #1				  ; Clear current palette, then	set to $01
      STA     ObjectAttributes,X
      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,X			  ; WINNERS DON'T
						  ; SMOKE SHROOMS
      STA     EnemyArray_9F,X			  ; No idea what this address is for
      LDA     #$1F
      STA     BobombExplodeTimer,X		  ; Puff-of-smoke animation timer?
      LDX     byte_RAM_12

locret_BANK2_91C4:
      RTS

; End of function MakeMushroomExplodeIntoPuffOfSmoke

; ---------------------------------------------------------------------------
byte_BANK2_91C5:
	  .BYTE $F8

      .BYTE 8

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_91C7:
      LDA     EnemyTimer,X
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
      STA     EnemyTimer,X
      JMP     sub_BANK2_8441

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
      STA     unk_RAM_46E,X
      LDA     #$30
      STA     byte_RAM_F4
      JMP     sub_BANK2_9B1B

; End of function sub_BANK2_91C7

; ---------------------------------------------------------------------------
byte_BANK2_9212:
	  .BYTE $F0

byte_BANK2_9213:
	  .BYTE $FF

      .BYTE 0
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
      LDA     byte_RAM_4C0
      ADC     byte_BANK2_9212,Y
      STA     ObjectXLo,X
      LDA     byte_RAM_4BE
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
      JSR     sub_BANK2_92C8

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

; =============== S U B	R O U T	I N E =======================================

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
      .BYTE   3
; ---------------------------------------------------------------------------

EnemyBehavior_BulletAndEgg:
      JSR     sub_BANK3_B4FD

; =============== S U B	R O U T	I N E =======================================

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
      JSR     sub_BANK2_9EA9

      JSR     sub_BANK2_95B0

      JSR     sub_BANK2_95B0

loc_BANK2_92BE:
      JSR     sub_BANK2_9E50

      JMP     sub_BANK2_9B1B

; End of function sub_BANK2_9289

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_92C4:
      LDY     #8
      BNE     loc_BANK2_92CA

; End of function sub_BANK2_92C4

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_92C8:
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

; End of function sub_BANK2_92C8

; ---------------------------------------------------------------------------
byte_BANK2_9306:
	  .BYTE 1

      .BYTE $FF
byte_BANK2_9308:
	  .BYTE $30

      .BYTE $D0
byte_BANK2_930A:
	  .BYTE 1

      .BYTE $FF
      .BYTE 1
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
      JSR     sub_BANK2_9B1B

      LDY     #1
      LDA     HoldingItem
      BEQ     loc_BANK2_933B

      LDX     byte_RAM_42D
      LDA     ObjectType,X
      LDX     byte_RAM_12
      CMP     #Enemy_Key			  ; Strange code. Phanto only chases you if you	have the key.
      BCC     loc_BANK2_933B			  ; So you should just be able to use BEQ/BNE.

      CMP     #Enemy_SubspacePotion		  ; But	instead	we do it like this for... reasons.
      BCS     loc_BANK2_933B			  ; Nintendo.

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
      CMP     unk_RAM_6F,X
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

      JSR     sub_BANK2_9B1B

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

; =============== S U B	R O U T	I N E =======================================

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
      .BYTE $20
      .BYTE $E0
; ---------------------------------------------------------------------------

EnemyBehavior_BobOmb:
      LDY     BobombExplodeTimer,X
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
      INC     BobombExplodeTimer,X

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9486:
      LDA     ObjectAttributes,X
      ORA     #$20
      STA     ObjectAttributes,X
      JSR     sub_BANK2_9E4B

      JMP     sub_BANK2_9B1B

; End of function sub_BANK2_9486

; ---------------------------------------------------------------------------

loc_BANK2_9492:
      LDA     EnemyCollision,X
      AND     unk_RAM_6F,X
      BEQ     loc_BANK2_94A6

      JSR     sub_BANK2_9EA9

      LDA     EnemyArray_42F,X
      BEQ     loc_BANK2_94A6

      JSR     sub_BANK2_95B0

      JSR     sub_BANK2_95B0

loc_BANK2_94A6:
      INC     EnemyArray_9F,X
      JSR     sub_BANK2_98CD

loc_BANK2_94AB:
      JSR     sub_BANK2_9B1B

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
      BNE     loc_BANK2_94E6

      LDA     ObjectType,X
      CMP     #Enemy_SnifitGray
      BNE     loc_BANK2_94E6

      LDA     ObjectYAccel,X
      CMP     #$FE
      BNE     loc_BANK2_94E6

      LDA     byte_RAM_5AE
      BPL     loc_BANK2_94E6

      JSR     sub_BANK2_95EB

loc_BANK2_94E6:
      DEC     EnemyArray_9F,X
      LDA     ObjectType,X
      CMP     #Enemy_SnifitPink
      BEQ     loc_BANK2_94F2

      CMP     #Enemy_ShyguyPink
      BNE     locret_BANK2_9502

loc_BANK2_94F2:
      LDA     EnemyArray_42F,X
      BNE     locret_BANK2_9502

      LDA     EnemyArray_477,X
      BNE     locret_BANK2_9502

      INC     EnemyArray_477,X
      JMP     sub_BANK2_9EA9

; ---------------------------------------------------------------------------

locret_BANK2_9502:
      RTS

; ---------------------------------------------------------------------------

loc_BANK2_9503:
      AND     #4
      BEQ     loc_BANK2_94CD

      LDA     #0
      STA     EnemyArray_477,X
      LDY     ObjectType,X			  ; Get	the current object ID
      CPY     #Enemy_Tweeter			  ; Check if this enemy	is a Tweeter
      BNE     loc_BANK2_9528			  ; If not, go handle some other enemies

      LDA     #$3F
      JSR     sub_BANK2_9599			  ; ...but very, very, very rarely, only
						  ; when their timer (that incremenets once per	bounce)
						  ; hits #$3F -- almost	unnoticable

      INC     EnemyTimer,X			  ; Make small jump 3 times, then make big jump
      LDY     #$F0
      LDA     EnemyTimer,X
      AND     #3				  ; Check if the timer is a multiple of	4
      BNE     loc_BANK2_9523			  ; If not, skip over the next bit

      LDY     #$E0

loc_BANK2_9523:
      STY     ObjectYAccel,X			  ; Set	Y accelleration	for bouncing
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
      STY     unk_RAM_6F,X
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

      JSR     sub_BANK2_95EB

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

      JSR     sub_BANK2_95EB

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_95AA:
      JSR     sub_BANK2_95D0

      JSR     sub_BANK2_9E4B

; End of function sub_BANK2_95AA

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_95B0:
      LDA     ObjectXAccel,X
      STA     byte_RAM_0
      ASL     A
      ROR     ObjectXAccel,X
      RTS

; End of function sub_BANK2_95B0

; ---------------------------------------------------------------------------

loc_BANK2_95B8:
      JSR     sub_BANK2_8461

loc_BANK2_95BB:
      LDA     ObjectType,X
      CMP     #1
      BNE     loc_BANK2_95CA

      LDA     ObjectYAccel,X
      CMP     #4
      BCC     loc_BANK2_95CA

      JSR     sub_BANK2_8461

loc_BANK2_95CA:
      ASL     ObjectAttributes,X
      LSR     ObjectAttributes,X

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_95CE:
      LDA     #0

; End of function sub_BANK2_95CE

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_95E5:
      JSR     sub_BANK2_92C4

      JMP     loc_BANK2_95EE

; End of function sub_BANK2_95E5

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_95EB:
      JSR     sub_BANK2_92C8

loc_BANK2_95EE:
      BMI     locret_BANK2_9606

      LDY     unk_RAM_6F,X
      LDX     byte_RAM_0
      LDA     loc_BANK2_9439+2,Y
      STA     ObjectXAccel,X
      LDA     #0
      STA     ObjectYAccel,X
      LDA     #$1B
      STA     ObjectType,X
      JSR     sub_BANK2_8441

      LDX     byte_RAM_12

locret_BANK2_9606:
      RTS

; End of function sub_BANK2_95EB

; ---------------------------------------------------------------------------
byte_BANK2_9607:
	  .BYTE $A

      .BYTE  $E
      .BYTE $A
      .BYTE $D
      .BYTE   4
      .BYTE   7
      .BYTE 4
      .BYTE 6

; =============== S U B	R O U T	I N E =======================================

; This is run when the player is carrying
; something, to	update its position to
; wherever the player is above their head

CarryObject:
      LDA     byte_RAM_9D
      EOR     #1
      TAY
      INY
      STY     unk_RAM_6F,X
      LDA     PlayerXLo
      STA     ObjectXLo,X
      LDA     PlayerXHi
      STA     ObjectXHi,X

loc_BANK2_961F:
      LDA     PlayerYHi
      STA     byte_RAM_7
      LDA     PlayerYLo
      LDY     unk_RAM_489,X
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
      ADC     unk_RAM_7F0D,Y
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
      JSR     sub_BANK2_9AB5

      JMP     sub_BANK2_9B1B

; End of function CarryObject

; ---------------------------------------------------------------------------
      .BYTE $10
      .BYTE $F0
; ---------------------------------------------------------------------------

EnemyBehavior_MushroomBlockAndPOW:
      JSR     sub_BANK2_9692

locret_BANK2_9691:
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9692:
      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_969B

      PLA
      PLA
      JMP     CarryObject

; ---------------------------------------------------------------------------

loc_BANK2_969B:
      JSR     sub_BANK2_9B1B

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
      LDA     #4
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

      LDA     EnemyTimer,X
      JSR     sub_BANK3_BC50

      JMP     sub_BANK2_89A9

; ---------------------------------------------------------------------------

locret_BANK2_9718:
      RTS

; End of function sub_BANK2_9692

; ---------------------------------------------------------------------------

EnemyBehavior_SubspaceDoor:
      LDA     #4
      STA     unk_RAM_489,X
      LDA     #2
      STA     unk_RAM_6F,X
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

      JMP     MakeMushroomExplodeIntoPuffOfSmoke

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
      STY     unk_RAM_6F,X

loc_BANK2_9767:
      LDA     byte_RAM_4BD
      BEQ     loc_BANK2_979A

      LDA     byte_RAM_F4
      PHA
      JSR     loc_BANKF_FAFE

      CPY     byte_RAM_F4
      PHP
      LDA     unk_RAM_6F,X
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
      LDA     unk_RAM_6F,X
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

      LDA     byte_RAM_534
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
	  .BYTE 0

      .BYTE 1
      .BYTE 1
      .BYTE 2
DoorSpriteAnimation:
	  .BYTE 2
      .BYTE 3
      .BYTE 4
      .BYTE 6
      .BYTE 8
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
      .BYTE 8
      .BYTE 6
      .BYTE 4
      .BYTE 3
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 1
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE $A9
      .BYTE   2
      .BYTE $D0
      .BYTE   6
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
      STA     BobombExplodeTimer,Y

loc_BANK2_985C:
      DEY
      BPL     loc_BANK2_9846

      JSR     sub_BANK2_92C4

      BMI     loc_BANK2_9896

      LDA     #0
      STA     byte_RAM_4BD
      STA     byte_RAM_4B3
      LDX     byte_RAM_0
      PLA
      STA     EnemyArray_477,X
      LDA     #$3C
      STA     ObjectType,X
      JSR     sub_BANK2_8441

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

loc_BANK2_989A:
      JSR     sub_BANK3_B4FD

      JSR     sub_BANK2_98CD

      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     loc_BANK2_98AE

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_98A6:
      LDA     #SoundEffect1_EnemyHit
      STA     SoundEffect1Queue
      JMP     MakeMushroomExplodeIntoPuffOfSmoke

; End of function sub_BANK2_98A6

; ---------------------------------------------------------------------------

loc_BANK2_98AE:
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Down
      BEQ     loc_BANK2_98B7

      JSR     sub_BANK2_95CE

loc_BANK2_98B7:
      JSR     sub_BANK2_9B1B

      LDY     unk_RAM_6F,X
      LDA     locret_BANK2_9897,Y
      STA     ObjectXAccel,X
      JMP     sub_BANK2_8577

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_98C4:
      LDA     #EnemyState_BlockFizzle
      STA     EnemyState,X
      LDA     #$18
      STA     BobombExplodeTimer,X

locret_BANK2_98CC:
      RTS

; End of function sub_BANK2_98C4

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_98CD:
      LDA     ObjectBeingCarriedTimer,X
      BEQ     locret_BANK2_98CC

      PLA
      PLA
      JMP     CarryObject

; End of function sub_BANK2_98CD

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_98D6:
      LDA     EnemyArray_42F,X
      BEQ     locret_BANK2_98EA

      PLA
      PLA
      JMP     loc_BANK2_8574

; ---------------------------------------------------------------------------

loc_BANK2_98E0:
      JSR     EnemyInit_Stationary

      STA     EnemyArray_438,X
      LDA     ObjectYLo,X
      STA     EnemyTimer,X

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
      LDA     EnemyTimer,X
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
      LDA     EnemyTimer,X
      STA     ObjectYLo,X

loc_BANK2_9932:
      JMP     sub_BANK2_9B1B

; ---------------------------------------------------------------------------

loc_BANK2_9935:
      LDA     #0

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9937:
      STA     byte_RAM_0
      LDX     #8

loc_BANK2_993B:
      LDA     EnemyState,X
      CMP     #1
      BNE     loc_BANK2_9974

      LDA     byte_RAM_0
      BEQ     loc_BANK2_9966

      LDA     ObjectType,X
      CMP     #$37
      BEQ     loc_BANK2_994F

      CMP     #$32
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
      JSR     MakeMushroomExplodeIntoPuffOfSmoke

      LDX     byte_RAM_E
      JMP     loc_BANK2_9974

; ---------------------------------------------------------------------------

loc_BANK2_9966:
      LDA     EnemyCollision,X
      BEQ     loc_BANK2_9974

      LDA     #$D8
      STA     ObjectYAccel,X
      LDA     EnemyCollision,X
      ORA     #$10
      STA     EnemyCollision,X

loc_BANK2_9974:
      DEX
      BPL     loc_BANK2_993B

      LDX     byte_RAM_12
      RTS

; End of function sub_BANK2_9937

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_997A:
      LDA     EnemyCollision,X
      AND     #$10
      BEQ     locret_BANK2_99B3

      LDA     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_9988

      LDA     #0
      STA     HoldingItem

loc_BANK2_9988:
      LDY     ObjectType,X
      LDA     byte_BANKF_F532,Y
      AND     #8
      ASL     A
      BNE     loc_BANK2_999E

      LDA     DPCMQueue
      BNE     loc_BANK2_99A1

      LDA     #SoundEffect1_EnemyHit
      STA     SoundEffect1Queue
      BNE     loc_BANK2_99A1

loc_BANK2_999E:
      STA     DPCMQueue

loc_BANK2_99A1:
      CPY     #$12
      BNE     loc_BANK2_99AD

      LDA     EnemyArray_42F,X
      BNE     loc_BANK2_99AD

      JSR     sub_BANK3_A440

loc_BANK2_99AD:
      LDA     #2
      STA     EnemyState,X
      PLA
      PLA

locret_BANK2_99B3:
      RTS

; End of function sub_BANK2_997A

; ---------------------------------------------------------------------------
byte_BANK2_99B4:
	  .BYTE $D0

byte_BANK2_99B5:
	  .BYTE $D2

      .BYTE $D4
      .BYTE $D6
      .BYTE $F8
      .BYTE $F8
      .BYTE $FA
      .BYTE $FA
      .BYTE $CC
      .BYTE $CE
      .BYTE $CC
      .BYTE $CE
      .BYTE $C8
      .BYTE $CA
      .BYTE $C8
      .BYTE $CA
      .BYTE $70
      .BYTE $72
      .BYTE $74
      .BYTE $76
      .BYTE $C0
      .BYTE $C2
      .BYTE $C4
      .BYTE $C6
      .BYTE $E1
      .BYTE $E3
      .BYTE $E5
      .BYTE $E7
      .BYTE $E1
      .BYTE $E3
      .BYTE $E5
      .BYTE $E7
      .BYTE $78
      .BYTE $7A
      .BYTE $7C
      .BYTE $7E
      .BYTE $DC
      .BYTE $DA
      .BYTE $DC
      .BYTE $DE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FC
      .BYTE $FC
      .BYTE $94
      .BYTE $94
      .BYTE $96
      .BYTE $96
      .BYTE $98
      .BYTE $98
      .BYTE $9A
      .BYTE $9A
      .BYTE $DB
      .BYTE $DD
      .BYTE $DB
      .BYTE $DD
      .BYTE $7D
      .BYTE $7F
      .BYTE $C1
      .BYTE $C3
      .BYTE $8C
      .BYTE $8C
      .BYTE $8E
      .BYTE $8E
      .BYTE $E0
      .BYTE $E2
      .BYTE $6B
      .BYTE $6D
      .BYTE $6D
      .BYTE $6F
      .BYTE $3A
      .BYTE $3A
      .BYTE $3A
      .BYTE $3A
      .BYTE $38
      .BYTE $38
      .BYTE $38
      .BYTE $38
      .BYTE $36
      .BYTE $36
      .BYTE $36
      .BYTE $36
      .BYTE $34
      .BYTE $34
      .BYTE $34
      .BYTE $34
      .BYTE $AE
      .BYTE $FB
      .BYTE $AE
      .BYTE $FB
      .BYTE $80
      .BYTE $82
      .BYTE $84
      .BYTE $86
      .BYTE $80
      .BYTE $82
      .BYTE $AA
      .BYTE $AC
      .BYTE $88
      .BYTE $8A
      .BYTE $84
      .BYTE $86
      .BYTE $88
      .BYTE $8A
      .BYTE $AA
      .BYTE $AC
      .BYTE $BC
      .BYTE $BE
      .BYTE $AA
      .BYTE $AC
      .BYTE $BC
      .BYTE $BE
      .BYTE $AA
      .BYTE $AC
      .BYTE $B5
      .BYTE $B9
      .BYTE $B5
      .BYTE $B9
      .BYTE $81
      .BYTE $83
      .BYTE $85
      .BYTE $87
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $81
      .BYTE $83
      .BYTE $F5
      .BYTE $87
      .BYTE $C5
      .BYTE $C7
      .BYTE $C9
      .BYTE $CB
      .BYTE $92
      .BYTE $94
      .BYTE $29
      .BYTE $29
      .BYTE $2B
      .BYTE $2B
      .BYTE $3D
      .BYTE $3F
      .BYTE $4C
      .BYTE $4E
      .BYTE $50
      .BYTE $52
      .BYTE $4C
      .BYTE $4E
      .BYTE $56
      .BYTE $58
      .BYTE $FB
      .BYTE $5C
      .BYTE $FB
      .BYTE $5A
      .BYTE $FB
      .BYTE $FB
      .BYTE $FB
      .BYTE $54
      .BYTE $CF
      .BYTE $CF
      .BYTE $A5
      .BYTE $A5
      .BYTE $B0
      .BYTE $B2
      .BYTE $90
      .BYTE $90
      .BYTE $CD
      .BYTE $CD
      .BYTE $A8
      .BYTE $A8
      .BYTE $A8
      .BYTE $A8
      .BYTE $A0
      .BYTE $A2
      .BYTE $A4
      .BYTE $A4
      .BYTE $A4
      .BYTE $A4
      .BYTE $4D
      .BYTE $4D
      .BYTE $8C
      .BYTE $8C
      .BYTE $A6
      .BYTE $A6
      .BYTE $AB
      .BYTE $AB
UnkEnemyDisplayData:
	  .BYTE 0					
      .BYTE 0					  ; 1 ;	@TODO figure this out.
      .BYTE 8					  ; 2 ;	$FF means "don't display this";
      .BYTE 0					  ; 3 ;	otherwise seems	to be some sort	of
      .BYTE $C					  ; 4 ;	index to graphics
      .BYTE $10					  ; 5 ;	Setting	everything to $0 results in a
      .BYTE $10					  ; 6 ;	lot of shyguys and not much else
      .BYTE $10					  ; 7
      .BYTE $40					  ; 8
      .BYTE $14					  ; 9
      .BYTE $18					  ; $A
      .BYTE $18					  ; $B
      .BYTE $18					  ; $C
      .BYTE $20					  ; $D
      .BYTE $20					  ; $E
      .BYTE $24					  ; $F
      .BYTE $24					  ; $10
      .BYTE $BE					  ; $11
      .BYTE 0					  ; $12
      .BYTE $86					  ; $13
      .BYTE $88					  ; $14
      .BYTE $FF					  ; $15
      .BYTE $FF					  ; $16
      .BYTE $8C					  ; $17
      .BYTE $5C					  ; $18
      .BYTE $5C					  ; $19
      .BYTE $6C					  ; $1A
      .BYTE $56					  ; $1B
      .BYTE $5A					  ; $1C
      .BYTE $14					  ; $1D
      .BYTE $72					  ; $1E
      .BYTE 0					  ; $1F
      .BYTE $A8					  ; $20
      .BYTE 0					  ; $21
      .BYTE $D6					  ; $22
      .BYTE $AC					  ; $23
      .BYTE $AC					  ; $24
      .BYTE $AC					  ; $25
      .BYTE $74					  ; $26
      .BYTE $7A					  ; $27
      .BYTE $92					  ; $28
      .BYTE $9A					  ; $29
      .BYTE $80					  ; $2A
      .BYTE $90					  ; $2B
      .BYTE 0					  ; $2C
      .BYTE 0					  ; $2D
      .BYTE $B6					  ; $2E
      .BYTE $B6					  ; $2F
      .BYTE $B6					  ; $30
      .BYTE $B6					  ; $31
      .BYTE $28					  ; $32
      .BYTE $2A					  ; $33
      .BYTE $2C					  ; $34
      .BYTE $2E					  ; $35
      .BYTE $30					  ; $36
      .BYTE $34					  ; $37
      .BYTE 0					  ; $38
      .BYTE $38					  ; $39
      .BYTE $3A					  ; $3A
      .BYTE $42					  ; $3B
      .BYTE $82					  ; $3C
      .BYTE $82					  ; $3D
      .BYTE $84					  ; $3E
      .BYTE $A0					  ; $3F
      .BYTE $A2					  ; $40
      .BYTE 4					  ; $41
      .BYTE $8E					  ; $42
      .BYTE $8E					  ; $43
      .BYTE $9E					  ; $44
      .BYTE $A6					  ; $45
      .BYTE $A4					  ; $46

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9AB5:
      LDA     ObjectYLo,X
      CLC
      SBC     byte_RAM_CB
      LDY     ObjectBeingCarriedTimer,X
      BEQ     loc_BANK2_9ACA

      LDY     PlayerAnimationFrame
      BNE     loc_BANK2_9ACA

      LDY     CurrentCharacter
      DEY
      BEQ     loc_BANK2_9ACA

      SEC
      SBC     #1

loc_BANK2_9ACA:
      STA     byte_RAM_42C
      LDA     ObjectXLo,X
      SEC
      SBC     byte_RAM_4C0
      STA     byte_RAM_429
      RTS

; End of function sub_BANK2_9AB5

; ---------------------------------------------------------------------------

loc_BANK2_9AD7:
      LDA     EnemyState,X
      CMP     #1
      BNE     loc_BANK2_9AE2

      LDA     EnemyArray_45C,X
      BEQ     loc_BANK2_9AE6

loc_BANK2_9AE2:
      LDA     #$6A
      BNE     loc_BANK2_9AEC

loc_BANK2_9AE6:
      LDA     BobombExplodeTimer,X
      BEQ     loc_BANK2_9AEF

      LDA     #$62

loc_BANK2_9AEC:
      JMP     sub_BANK2_9BB3

; ---------------------------------------------------------------------------

loc_BANK2_9AEF:
      JMP     sub_BANK2_9BA7

; =============== S U B	R O U T	I N E =======================================

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

      LDA     byte_RAM_429
      ADC     #8
      STA     byte_RAM_1
      LDA     unk_RAM_6F,X
      STA     byte_RAM_2
      LDA     #1
      STA     byte_RAM_3
      STA     byte_RAM_5
      JSR     loc_BANKF_FAFE

      LDX     #$14
      JMP     loc_BANK2_9C7A

; End of function sub_BANK2_9AF2

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9B1B:
      LDY     ObjectType,X
      LDA     UnkEnemyDisplayData,Y
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
      CPY     #0
      BNE     loc_BANK2_9B87

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

; End of function sub_BANK2_9B1B

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9BA7:
      LDY     ObjectType,X
      CPY     #Enemy_Rocket
      BNE     loc_BANK2_9BB0

      JMP     sub_BANK3_ABEE

; ---------------------------------------------------------------------------

loc_BANK2_9BB0:
      LDA     UnkEnemyDisplayData,Y

; End of function sub_BANK2_9BA7

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9BB3:
      STA     byte_RAM_F
      LDA     byte_RAM_EF
      BNE     locret_BANK2_9B40

      LDA     unk_RAM_46E,X
      AND     #$10
      STA     byte_RAM_B
      LDY     unk_RAM_6F,X
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
      LDA     byte_RAM_42C
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
      ADC     byte_RAM_429
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
      LDA     unk_RAM_46E,X
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

      LDA     byte_RAM_42C
      STA     byte_RAM_0
      LDA     byte_RAM_429
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9CF2:
      LDA     word_RAM_C
      AND     #$20
      BNE     loc_BANK2_9D6D

      LDA     byte_RAM_B
      BNE     loc_BANK2_9D0A

      LDA     byte_BANK2_99B4,X
      STA     SpriteDMAArea+1,Y
      LDA     byte_BANK2_99B5,X
      STA     SpriteDMAArea+5,Y
      BNE     loc_BANK2_9D16

loc_BANK2_9D0A:
      LDA     _Mystery_BANK3_A030,X
      STA     SpriteDMAArea+1,Y
      LDA     _Mystery_BANK3_A030+1,X
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
      LDA     _Mystery_BANK3_A030,X
      STA     SpriteDMAArea+1,Y
      LDA     _Mystery_BANK3_A030+1,X
      STA     SpriteDMAArea+5,Y
      LDA     _Mystery_BANK3_A030+2,X
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
      .BYTE 4
      .BYTE 0
      .BYTE $FF
      .BYTE $FF
      .BYTE   0
      .BYTE   0
byte_BANK2_9DFA:
	  .BYTE 1

      .BYTE 1
      .BYTE 0
      .BYTE 0
      .BYTE 1
      .BYTE   0
      .BYTE   0
      .BYTE   1
      .BYTE 1
      .BYTE 0
      .BYTE 0
      .BYTE 1
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
      LDA     unk_RAM_6F,X
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

; =============== S U B	R O U T	I N E =======================================

; Compares our position	to the player's, and returns
; Y = 1	(Player	to left)
; Y = 0	(Player	to right)

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9E4B:
      TXA
      CLC
      ADC     #$A
      TAX

; End of function sub_BANK2_9E4B

; =============== S U B	R O U T	I N E =======================================

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
      CMP     #$1B
      BEQ     loc_BANK2_9E9E

      CMP     #$F
      BEQ     loc_BANK2_9E9E

      CMP     #$10
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK2_9EA9:
      LDA     ObjectXAccel,X
      EOR     #$FF
      CLC
      ADC     #1
      STA     ObjectXAccel,X
      BEQ     loc_BANK2_9EBA

      LDA     unk_RAM_6F,X
      EOR     #3
      STA     unk_RAM_6F,X

loc_BANK2_9EBA:
      JMP     sub_BANK2_9E50

; End of function sub_BANK2_9EA9

; ---------------------------------------------------------------------------
_unused_BANK2_9EBD:
	  .BYTE $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $100
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $110
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $120
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $130
      .BYTE $FF, $FF, $FF			  ; $140
; end of 'BANK2'

; ===========================================================================

