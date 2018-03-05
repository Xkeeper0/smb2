
      ;.segment	BANK3
;       *	=  $A000
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; 0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
MysteryData6030:.BYTE $2D
      .BYTE $2F
      .BYTE $2D
      .BYTE $2F
      .BYTE $E0
      .BYTE $E2
      .BYTE $E4
      .BYTE $E6
      .BYTE $E0
      .BYTE $E2
      .BYTE $E4
      .BYTE $E6
      .BYTE $E8
      .BYTE $EA
      .BYTE $EC
      .BYTE $EE
      .BYTE $E8
      .BYTE $EA
      .BYTE $EC
      .BYTE $EE
      .BYTE 1
      .BYTE 3
      .BYTE 9
      .BYTE 5
      .BYTE 7
      .BYTE $B
      .BYTE $D
      .BYTE $F
      .BYTE $15
      .BYTE $11
      .BYTE $13
      .BYTE $17
      .BYTE 1
      .BYTE 3
      .BYTE 9
      .BYTE 5
      .BYTE $19
      .BYTE $1B
      .BYTE 1
      .BYTE 3
      .BYTE 9
      .BYTE 5
      .BYTE $19
      .BYTE $1B
      .BYTE $1D
      .BYTE $1F
      .BYTE $25
      .BYTE $21
      .BYTE $23
      .BYTE $27
      .BYTE $1D
      .BYTE $1F
      .BYTE $25
      .BYTE $21
      .BYTE $23
      .BYTE $27
      .BYTE $9C
      .BYTE $9E
      .BYTE $9C
      .BYTE $9E
      .BYTE $D0
      .BYTE $D2
      .BYTE $D4
      .BYTE $D6
      .BYTE $F0
      .BYTE $F2
      .BYTE $F4
      .BYTE $F6
      .BYTE $F0
      .BYTE $F2
      .BYTE $F8
      .BYTE $FA
      .BYTE $F
      .BYTE $11
      .BYTE $13
      .BYTE $15
      .BYTE $1F
      .BYTE $11
      .BYTE $13
      .BYTE $15
      .BYTE $17
      .BYTE $19
      .BYTE $1B
      .BYTE $17
      .BYTE $19
      .BYTE $1D
      .BYTE 9
      .BYTE $B
      .BYTE 1
      .BYTE 3
      .BYTE 5
      .BYTE 7
      .BYTE $55
      .BYTE $59
      .BYTE $5B
      .BYTE $5D
      .BYTE $F0
      .BYTE $F2
      .BYTE $F4
      .BYTE $F6
      .BYTE $45
      .BYTE $59
      .BYTE $5B
      .BYTE $5D
      .BYTE $45
      .BYTE $59
      .BYTE $5B
      .BYTE $5D
      .BYTE $E8
      .BYTE $EA
      .BYTE $EC
      .BYTE $EE
      .BYTE $EC
      .BYTE $EE
      .BYTE $EC
      .BYTE $EE
      .BYTE $F0
      .BYTE $F2
      .BYTE $F0
      .BYTE $F2
      .BYTE $F4
      .BYTE $F6
      .BYTE $F8
      .BYTE $FA
      .BYTE $D0
      .BYTE $D2
      .BYTE $D4
      .BYTE $D6
      .BYTE 1
      .BYTE 3
      .BYTE 5
      .BYTE 7
      .BYTE 9
      .BYTE $B
      .BYTE $D
      .BYTE $F
      .BYTE 1
      .BYTE $11
      .BYTE 5
      .BYTE $15
      .BYTE $13
      .BYTE $B
      .BYTE $17
      .BYTE $F
      .BYTE $19
      .BYTE $1B
      .BYTE $2D
      .BYTE $2F
      .BYTE $3A
      .BYTE $3A
      .BYTE $E0
      .BYTE $E2
      .BYTE $E4
      .BYTE $E6
      .BYTE $E8
      .BYTE $EA
      .BYTE $EC
      .BYTE $EE
      .BYTE 1
      .BYTE 3
      .BYTE 5
      .BYTE 7
      .BYTE $4F
      .BYTE $5D
      .BYTE 5
      .BYTE 7
      .BYTE 9
      .BYTE $B
      .BYTE $D
      .BYTE $F
      .BYTE $27
      .BYTE $79
      .BYTE $7B
      .BYTE $2D
      .BYTE $4F
      .BYTE $2F
      .BYTE $45
      .BYTE $55
      .BYTE $11
      .BYTE $13
      .BYTE $15
      .BYTE $17
      .BYTE $1F
      .BYTE $21
      .BYTE $23
      .BYTE $25
      .BYTE $11
      .BYTE $13
      .BYTE $23
      .BYTE $25
      .BYTE $59
      .BYTE $59
      .BYTE $5B
      .BYTE $5B
      .BYTE 1
      .BYTE 3
      .BYTE 5
      .BYTE 7
      .BYTE 9
      .BYTE $B
      .BYTE $D
      .BYTE $F
      .BYTE $FB
      .BYTE $11
      .BYTE $15
      .BYTE $17
      .BYTE $13
      .BYTE $FB
      .BYTE $19
      .BYTE $1B
      .BYTE $1D
      .BYTE $1F
      .BYTE $21
      .BYTE $23
      .BYTE $25
      .BYTE $27
      .BYTE $25
      .BYTE $27
; ---------------------------------------------------------------------------

loc_BANK3_A10A:
      JSR     $8F52

      LDA     #4
      STA     unk_RAM_465,X
      LDA     #0
      STA     ObjectXAccel,X
      LDA     ObjectXLo,X
      CLC
      ADC     #4
      STA     ObjectXLo,X
      JMP     $8441

; ---------------------------------------------------------------------------
unk_BANK3_A120:.BYTE $C8
      .BYTE $D0
      .BYTE $E0
      .BYTE $F0
      .BYTE   0
      .BYTE $10
      .BYTE $20
      .BYTE $C8
unk_BANK3_A128:.BYTE $DC
      .BYTE $E2
      .BYTE $E8
      .BYTE $F0
      .BYTE $F8
      .BYTE $E8
      .BYTE $DC
      .BYTE $DC
; ---------------------------------------------------------------------------

EnemyBehavior_Clawgrip:
      LDA     unk_RAM_45C,X
      ORA     unk_RAM_438,X
      BEQ     loc_BANK3_A13B

      JMP     $9B1B

; ---------------------------------------------------------------------------

loc_BANK3_A13B:
      JSR     $997A

      LDA     ObjectYLo,X
      CMP     #$70
      BCC     loc_BANK3_A147

      JSR     $95CE

loc_BANK3_A147:
      LDA     unk_RAM_86,X
      BNE     loc_BANK3_A179

      LDA     EnemyTimer,X
      AND     #$3F
      BNE     loc_BANK3_A168

      LDA     byte_RAM_5AE
      AND     #3
      BEQ     loc_BANK3_A168

      LDY     byte_RAM_4C0
      DEY
      CPY     #$80
      BCC     loc_BANK3_A168

      LDA     #$7F
      STA     unk_RAM_86,X
      LDY     #0
      BEQ     loc_BANK3_A174

loc_BANK3_A168:
      INC     EnemyTimer,X
      LDY     #$F0
      LDA     EnemyTimer,X
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

      LDA     byte_RAM_5AE
      AND     #7
      TAY
      LDA     unk_BANK3_A128,Y
      STA     ObjectYAccel,X
      DEC     ObjectYLo,X
      JSR     $92C8

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
      LDA     byte_RAM_5AE
      AND     #7
      TAY
      LDA     unk_BANK3_A120,Y
      STA     ObjectYAccel,X
      LDA     #$D0
      STA     ObjectXAccel,X
      JSR     $8441

      LDX     byte_RAM_12

loc_BANK3_A1CD:
      JSR     $9E50

      JSR     $857F

loc_BANK3_A1D3:
      JMP     $9B1B

; ---------------------------------------------------------------------------
      .BYTE 8
      .BYTE 8
byte_BANK3_A1D8:.BYTE $1C

      .BYTE $F4
      .BYTE $11
      .BYTE $F
byte_BANK3_A1DC:.BYTE 4

      .BYTE 6
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 8
      .BYTE 6
      .BYTE 4
; ---------------------------------------------------------------------------
      LDA     byte_RAM_F4
      STA     unk_RAM_B1,X
      LDY     EnemyState,X
      DEY
      TYA
      ORA     unk_RAM_45C,X
      BEQ     loc_BANK3_A1FA

      LDY     #$D2
      LDA     #0
      STA     unk_RAM_86,X
      BEQ     loc_BANK3_A21C

loc_BANK3_A1FA:
      LDY     #$C2
      LDA     byte_RAM_10
      AND     #$10
      BNE     loc_BANK3_A204

      LDY     #$C6

loc_BANK3_A204:
      LDA     unk_RAM_86,X
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
      STA     unk_RAM_6F,X
      TYA
      JSR     $9BB3

      LDY     #$C6
      LDA     byte_RAM_10
      AND     #$10
      BNE     loc_BANK3_A22E

      LDY     #$C2

loc_BANK3_A22E:
      LDA     unk_RAM_86,X
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
      LDA     unk_RAM_45C,X
      BEQ     loc_BANK3_A24D

      LDY     #$D2

loc_BANK3_A24D:
      LDA     byte_RAM_429
      CLC
      ADC     #$10
      STA     byte_RAM_429
      ASL     byte_RAM_EE
      ASL     byte_RAM_EE
      LDA     unk_RAM_86,X
      CMP     #$60
      BCS     loc_BANK3_A262

      LSR     unk_RAM_6F,X

loc_BANK3_A262:
      TYA
      PHA
      JSR     loc_BANKF_FAFE

      STY     byte_RAM_F4
      PLA
      JSR     $9BB3

      LDA     unk_RAM_86,X
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
      SBC     byte_RAM_4C0
      STA     byte_RAM_429
      LDA     ObjectYLo,X
      CLC
      ADC     byte_BANK3_A1D8,Y
      STA     byte_RAM_42C
      LDA     unk_RAM_86,X
      CMP     #$30
      BCC     loc_BANK3_A2AA

      CMP     #$40
      BCS     loc_BANK3_A2AA

      LSR     A
      AND     #7
      TAY
      LDA     byte_RAM_42C
      SEC
      SBC     byte_BANK3_A1DC,Y
      STA     byte_RAM_42C

loc_BANK3_A2AA:
      JSR     $8894

      LDY     #0
      STY     byte_RAM_F4
      LDA     ObjectAttributes,X
      PHA
      LDA     #2
      STA     ObjectAttributes,X
      LDA     unk_RAM_46E,X
      PHA
      LDA     #$10
      STA     unk_RAM_46E,X
      LDA     #$D6
      JSR     $9BB3

      PLA
      STA     unk_RAM_46E,X
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

      LDX     byte_RAM_F4
      DEC     unk_RAM_20C,X
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A2E1:
      LDA     unk_RAM_B1,X
      TAX
      DEC     unk_RAM_208,X
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_ClawgripRock:
      LDA     #0
      STA     unk_RAM_45C,X
      JSR     $997A

      JSR     $98CD

      JSR     $9E50

      JSR     $857F

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #3
      BEQ     loc_BANK3_A30A

      JSR     $9EA9

      JSR     $95B0

loc_BANK3_A30A:
      LDA     EnemyCollision,X
      AND     #4
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
      JMP     $9B1B

; ---------------------------------------------------------------------------
      LDA     unk_RAM_A8,X
      ORA     unk_RAM_438,X
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
      STA     unk_RAM_6F,X
      LDA     byte_RAM_0
      AND     #8
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      ORA     #2
      STA     ObjectAttributes,X

loc_BANK3_A362:
      JMP     $9BA7

; ---------------------------------------------------------------------------
byte_BANK3_A365:.BYTE 0

      .BYTE $15
      .BYTE $EB
      .BYTE   0
; ---------------------------------------------------------------------------

EnemyBehavior_FlyingCarpet:
      JSR     sub_BANK3_B4FD

      LDA     byte_RAM_10
      AND     #3
      BNE     loc_BANK3_A37C

      DEC     unk_RAM_B1,X
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

      LDA     unk_RAM_6F,X
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
      AND     PlayerCollision
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
      CMP     byte_RAM_42C
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
      JSR     $9E50

      JSR     $9E4B

      LDA     unk_RAM_B1,X
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_A440:
      JSR     $92C4

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
      JSR     $8441

      LDA     #$A0
      STA     unk_RAM_B1,X

loc_BANK3_A478:
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK3_A440

; ---------------------------------------------------------------------------
byte_BANK3_A47B:.BYTE 2

      .BYTE 2
      .BYTE 1
      .BYTE 1
byte_BANK3_A47F:.BYTE 4

      .BYTE $C
      .BYTE $C
      .BYTE 4
unk_BANK3_A483:.BYTE   1
      .BYTE $FF
unk_BANK3_A485:.BYTE   8
      .BYTE $F8
unk_BANK3_A487:.BYTE   1
      .BYTE $FF
unk_BANK3_A489:.BYTE $20
      .BYTE $E0
unk_BANK3_A48B:.BYTE $14
      .BYTE $EC
; ---------------------------------------------------------------------------

EnemyBehavior_Pidgit:
      JSR     $997A

      INC     unk_RAM_9F,X
      LDA     unk_RAM_42F,X
      BEQ     loc_BANK3_A4A3

      LDA     ObjectAttributes,X
      ORA     #$80
      STA     ObjectAttributes,X
      JSR     sub_BANK3_A508

      JMP     $8577

; ---------------------------------------------------------------------------

loc_BANK3_A4A3:
      JSR     $98CD

      LDA     unk_RAM_B1,X
      BEQ     loc_BANK3_A4C1

      DEC     ObjectYAccel,X
      BPL     loc_BANK3_A4BE

      LDA     ObjectYLo,X
      CMP     #$30
      BCS     loc_BANK3_A4BE

      LDA     #0
      STA     unk_RAM_B1,X
      STA     ObjectXAccel,X
      STA     ObjectYAccel,X
      DEC     unk_RAM_86,X

loc_BANK3_A4BE:
      JMP     loc_BANK3_A502

; ---------------------------------------------------------------------------

loc_BANK3_A4C1:
      LDA     unk_RAM_86,X
      BNE     loc_BANK3_A4D6

      LDA     #$30
      STA     ObjectYAccel,X
      JSR     $9E3B

      LDA     unk_BANK3_A48B,Y
      STA     ObjectXAccel,X
      INC     unk_RAM_B1,X
      JMP     sub_BANK3_A508

; ---------------------------------------------------------------------------

loc_BANK3_A4D6:
      LDA     unk_RAM_480,X
      AND     #1
      TAY
      LDA     ObjectYAccel,X
      CLC
      ADC     unk_BANK3_A483,Y
      STA     ObjectYAccel,X
      CMP     unk_BANK3_A485,Y
      BNE     loc_BANK3_A4EC

      INC     unk_RAM_480,X

loc_BANK3_A4EC:
      LDA     unk_RAM_477,X
      AND     #1
      TAY
      LDA     ObjectXAccel,X
      CLC
      ADC     unk_BANK3_A487,Y
      STA     ObjectXAccel,X
      CMP     unk_BANK3_A489,Y
      BNE     loc_BANK3_A502

      INC     unk_RAM_477,X

loc_BANK3_A502:
      JSR     $9E4B

      JSR     $9E50

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_A508:
      JSR     $9BA7

      LDA     EnemyState,X
      SEC
      SBC     #1
      ORA     unk_RAM_42F,X
      ORA     unk_RAM_A8,X
      BNE     locret_BANK3_A551

      JSR     loc_BANKF_FAFE

      STY     byte_RAM_F4
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
      JSR     $8894

      PLA
      STA     ObjectXHi,X
      PLA
      STA     ObjectXLo,X
      LDA     byte_RAM_42C
      CLC
      ADC     #$C
      STA     byte_RAM_42C
      LDA     byte_RAM_429
      SBC     #7
      STA     byte_RAM_429
      JSR     sub_BANK3_A552

      LDA     #$D
      STA     ObjectAttributes,X

locret_BANK3_A551:
      RTS

; End of function sub_BANK3_A508

; =============== S U B	R O U T	I N E =======================================

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
      STA     unk_RAM_6F,X
      LDA     byte_BANK3_A47F,Y
      JMP     $9BB3

; End of function sub_BANK3_A552

; ---------------------------------------------------------------------------

loc_BANK3_A56B:
      JSR     $8F52

      LDA     #2
      LDY     BackgroundCHR2TimerIndex
      BEQ     loc_BANK3_A577

      LDA     #4

loc_BANK3_A577:
      STA     unk_RAM_465,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Mouser:
      JSR     $997A

      LDA     unk_RAM_45C,X
      BEQ     loc_BANK3_A586

      JMP     $9B1B

; ---------------------------------------------------------------------------

loc_BANK3_A586:
      JSR     sub_BANK3_B4FD

      LDA     #2
      STA     unk_RAM_6F,X
      JSR     $9B1B

      LDA     EnemyCollision,X
      AND     #4
      BEQ     loc_BANK3_A5F5

      JSR     $95CE

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
      STA     unk_RAM_86,X

loc_BANK3_A5AF:
      LDY     unk_RAM_86,X
      BNE     loc_BANK3_A5CE

      INC     unk_RAM_B1,X
      LDA     unk_RAM_B1,X
      AND     #$20
      BEQ     locret_BANK3_A5F4

      INC     unk_RAM_9F,X
      INC     unk_RAM_9F,X
      LDY     #$18
      LDA     unk_RAM_B1,X
      AND     #$40
      BNE     loc_BANK3_A5C9

      LDY     #$E8

loc_BANK3_A5C9:
      STY     ObjectXAccel,X
      JMP     $9E50

; ---------------------------------------------------------------------------

loc_BANK3_A5CE:
      CPY     #$10
      BNE     locret_BANK3_A5F4

      JSR     $92C4

      BMI     locret_BANK3_A5F4

      LDX     byte_RAM_0
      LDA     #$37
      STA     ObjectType,X
      LDA     ObjectYLo,X
      ADC     #3
      STA     ObjectYLo,X
      LDA     #$E0
      STA     ObjectYAccel,X
      JSR     $8441

      LDA     #$FF
      STA     unk_RAM_86,X
      LDA     #$E0
      STA     ObjectXAccel,X
      LDX     byte_RAM_12

locret_BANK3_A5F4:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A5F5:
      JMP     $857F

; ---------------------------------------------------------------------------
      LDA     EnemyState,X
      CMP     #1
      BNE     loc_BANK3_A609

      LDA     unk_RAM_45C,X
      BEQ     loc_BANK3_A612

      INC     unk_RAM_9F,X
      LDA     #$4A
      STA     ObjectAttributes,X

loc_BANK3_A609:
      LDA     #$B3
      STA     unk_RAM_46E,X
      LDA     #$2C
      BNE     loc_BANK3_A61B

loc_BANK3_A612:
      LDY     unk_RAM_86,X
      DEY
      CPY     #$10
      BCS     loc_BANK3_A621

      LDA     #$20

loc_BANK3_A61B:
      JSR     $9BB3

      JMP     loc_BANK3_A648

; ---------------------------------------------------------------------------

loc_BANK3_A621:
      JSR     $9BA7

      LDA     unk_RAM_86,X
      CMP     #$10
      BCC     loc_BANK3_A648

      LDA     #1
      STA     ObjectAttributes,X
      LDA     #$10
      STA     unk_RAM_46E,X
      LDA     byte_RAM_429
      CLC
      ADC     #$B
      STA     byte_RAM_429
      ASL     byte_RAM_EE
      LDY     #0
      STY     byte_RAM_F4
      LDA     #$38
      JSR     $9BB3

loc_BANK3_A648:
      LDA     #$43
      STA     ObjectAttributes,X
      LDA     #$33
      STA     unk_RAM_46E,X

locret_BANK3_A651:
      RTS

; ---------------------------------------------------------------------------
      .BYTE $FB
      .BYTE 5
; ---------------------------------------------------------------------------
      JSR     $9BB0

      LDA     byte_RAM_EE
      AND     #$E
      ORA     byte_RAM_EF
      ORA     unk_RAM_B1,X
      BNE     locret_BANK3_A67C

      LDA     ObjectYLo,X
      SEC
      SBC     #2
      STA     byte_RAM_0
      LDY     unk_RAM_6F,X
      LDA     byte_RAM_1
      CLC
      ADC     locret_BANK3_A651,Y
      STA     byte_RAM_1
      JSR     loc_BANKF_FAFE

      LDX     #$3C
      JSR     $9CF2

      LDX     byte_RAM_12

locret_BANK3_A67C:
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Ostro:
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_A6DB

      LDA     unk_RAM_A8,X
      BEQ     loc_BANK3_A6BD

      LDA     #1
      STA     ObjectType,X
      JSR     $8441

      JSR     $92C8

      BMI     locret_BANK3_A6BC

      LDY     byte_RAM_0
      LDA     #8
      STA     ObjectType,Y
      STA     unk_RAM_B1,Y
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
      JSR     $8441

      LDX     byte_RAM_12

locret_BANK3_A6BC:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A6BD:
      LDA     EnemyCollision,X
      AND     #$10
      BEQ     loc_BANK3_A6DB

      INC     unk_RAM_B1,X
      STA     unk_RAM_9F,X
      JSR     $92C8

      BMI     loc_BANK3_A6DB

      LDY     byte_RAM_0
      LDA     ObjectXAccel,X
      STA     ObjectXAccel,Y
      LDA     #$20
      STA     unk_RAM_453,Y
      JMP     loc_BANK3_A6E1

; ---------------------------------------------------------------------------

loc_BANK3_A6DB:
      JSR     $98CD

      JSR     $997A

loc_BANK3_A6E1:
      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     unk_RAM_6F,X
      BEQ     loc_BANK3_A6ED

      JSR     $9EA9

loc_BANK3_A6ED:
      LDA     EnemyCollision,X
      AND     #4
      BEQ     loc_BANK3_A70D

      LDA     unk_RAM_42F,X
      BEQ     loc_BANK3_A700

      LDA     #0
      STA     unk_RAM_42F,X
      JSR     $848F

loc_BANK3_A700:
      LDA     unk_RAM_9F,X
      EOR     #8
      STA     unk_RAM_9F,X
      JSR     $95CE

      LDA     #$F0
      STA     ObjectYAccel,X

loc_BANK3_A70D:
      INC     unk_RAM_477,X
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_A71E

      LDA     unk_RAM_477,X
      AND     #$3F
      BNE     loc_BANK3_A71E

      JSR     $8492

loc_BANK3_A71E:
      JSR     $8577

      JMP     $9B1B

; ---------------------------------------------------------------------------

loc_BANK3_A724:
      JSR     $845D

      LDA     #$40
      STA     unk_RAM_477,X
      LDA     #2
      STA     unk_RAM_465,X
      JMP     $8F6F

; ---------------------------------------------------------------------------
byte_BANK3_A734:.BYTE 0

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
unk_BANK3_A744:.BYTE  $B
      .BYTE  $C
      .BYTE $D
      .BYTE $F
      .BYTE $10
      .BYTE $12
      .BYTE $14
      .BYTE $17
      .BYTE $1A
      .BYTE $1D
      .BYTE $1F
      .BYTE $20
unk_BANK3_A750:.BYTE $E2
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
      .BYTE   0
; ---------------------------------------------------------------------------

locret_BANK3_A75C:
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Tryclyde:
      JSR     sub_BANK2_997A

      LDY     #0
      LDA     unk_RAM_477,X
      ASL     A
      BCC     loc_BANK3_A76F

      LDY     #2
      ASL     A
      BCC     loc_BANK3_A76F

      LDY     #$FE

loc_BANK3_A76F:
      STY     ObjectXAccel,X
      JSR     sub_BANK2_9E50

      INC     unk_RAM_477,X
      LDA     unk_RAM_B1,X
      CLC
      ADC     #$D0
      STA     unk_RAM_B1,X
      BCC     loc_BANK3_A783

      INC     unk_RAM_480,X

loc_BANK3_A783:
      LDA     byte_RAM_EF
      BNE     locret_BANK3_A75C

      LDA     #$49
      STA     ObjectAttributes,X
      LDY     #$48
      LDA     EnemyState,X
      SEC
      SBC     #1
      ORA     unk_RAM_45C,X
      STA     byte_RAM_7
      BEQ     loc_BANK3_A79B

      LDY     #$4C

loc_BANK3_A79B:
      TYA
      LDY     #$30
      STY     byte_RAM_F4
      JSR     sub_BANK2_9BB3

      LDA     #9
      STA     ObjectAttributes,X
      LDA     #$33
      STA     unk_RAM_46E,X
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
      STA     unk_RAM_46E,X
      LDA     ObjectYLo,X
      STA     byte_RAM_0
      LDA     unk_RAM_477,X
      AND     #$78
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     byte_BANK3_A734,Y
      ADC     byte_RAM_429
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
      LDA     unk_RAM_480,X
      AND     #$78
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     byte_BANK3_A734,Y
      ADC     byte_RAM_429
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
      STA     unk_RAM_46E,X
      LDA     byte_RAM_EE
      BNE     loc_BANK3_A88B

      LDA     ObjectYLo,X
      CLC
      ADC     #$10
      STA     unk_RAM_258
      LDA     #$D
      STA     unk_RAM_259
      STA     unk_RAM_25D
      LDA     unk_RAM_232
      STA     unk_RAM_25A
      STA     unk_RAM_25E
      LDA     byte_RAM_1
      CLC
      ADC     #$10
      STA     unk_RAM_25B
      LDA     ObjectYLo,X
      STA     unk_RAM_25C
      LDA     byte_RAM_429
      SEC
      SBC     #8
      STA     unk_RAM_25F

loc_BANK3_A88B:
      LDA     #0
      STA     byte_RAM_5
      LDA     unk_RAM_477,X
      JSR     sub_BANK3_A89A

      INC     byte_RAM_5
      LDA     unk_RAM_480,X

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_A89A:
      AND     #$67
      CMP     #$40
      BNE     locret_BANK3_A8F1

      LDA     unk_RAM_45C,X
      BNE     locret_BANK3_A8F1

      JSR     sub_BANK2_92C8

      BMI     locret_BANK3_A8F1

      LDA     #SoundEffect1_BirdoShot
      STA     SoundEffect1Queue
      LDY     byte_RAM_0
      LDA     #Enemy_Fireball
      STA     ObjectType,Y
      STA     EnemyTimer,Y
      STA     unk_RAM_B1,Y
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
      TAX					  ; These may be fireball speed	pointers
      LDA     unk_BANK3_A744,X
      STA     ObjectYAccel,Y
      LDA     unk_BANK3_A750,X
      STA     ObjectXAccel,Y

; End of function sub_BANK3_A89A

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_A8EA:
      TYA
      TAX
      JSR     sub_BANK2_8441

      LDX     byte_RAM_12

locret_BANK3_A8F1:
      RTS

; End of function sub_BANK3_A8EA

; ---------------------------------------------------------------------------

loc_BANK3_A8F2:
      JSR     sub_BANK2_845D

      LDA     ObjectYLo,X
      SEC
      SBC     #8
      STA     EnemyTimer,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_CobratGround:
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_98D6

      JSR     sub_BANK2_98CD

      JSR     sub_BANK3_B4FD

      LDA     unk_RAM_480,X
      BNE     loc_BANK3_A93E

      STA     ObjectXAccel,X
      JSR     sub_BANK2_9E3B

      LDA     byte_RAM_F
      ADC     #$40
      CMP     #$80
      BCS     loc_BANK3_A924

      INC     unk_RAM_480,X
      LDA     #$C0
      STA     ObjectYAccel,X
      BNE     loc_BANK3_A93E

loc_BANK3_A924:
      INC     unk_RAM_477,X
      LDY     #$FC
      LDA     unk_RAM_477,X
      AND     #$20
      BEQ     loc_BANK3_A932

      LDY     #4

loc_BANK3_A932:
      STY     ObjectYAccel,X
      JSR     sub_BANK2_9E4B

      LDA     #$61
      STA     ObjectAttributes,X
      JMP     sub_BANK2_9B1B

; ---------------------------------------------------------------------------

loc_BANK3_A93E:
      LDA     ObjectYAccel,X
      BMI     loc_BANK3_A951

      LDA     EnemyTimer,X
      SEC
      SBC     #$18
      CMP     ObjectYLo,X
      BCS     loc_BANK3_A951

      STA     ObjectYLo,X
      LDA     #0
      STA     ObjectYAccel,X

loc_BANK3_A951:
      JSR     $8577

      INC     unk_RAM_9F,X
      LDA     unk_RAM_9F,X
      PHA
      AND     #$3F
      BNE     loc_BANK3_A960

      JSR     $8492

loc_BANK3_A960:
      PLA
      BNE     loc_BANK3_A968

      LDA     #$18
      STA     unk_RAM_453,X

loc_BANK3_A968:
      LDA     EnemyCollision,X
      AND     #3
      BEQ     loc_BANK3_A971

      JSR     $9EA9

loc_BANK3_A971:
      LDA     #$41
      LDY     ObjectYAccel,X
      BPL     loc_BANK3_A979

      LDA     #$61

loc_BANK3_A979:
      JMP     loc_BANK3_A9FE

; ---------------------------------------------------------------------------

EnemyBehavior_CobratJar:
      JSR     $997A

      JSR     $98D6

      JSR     $98CD

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #8
      BEQ     loc_BANK3_A993

      LDA     EnemyTimer,X
      STA     ObjectYLo,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_A993:
      JSR     $9E3B

      INY
      STY     unk_RAM_6F,X
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_A9BC

      LDA     unk_RAM_86,X
      BNE     loc_BANK3_A9AA

      LDA     #$D0
      STA     ObjectYAccel,X
      INC     unk_RAM_B1,X
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
      JSR     $9E4B

      JMP     loc_BANK3_A9FC

; ---------------------------------------------------------------------------

loc_BANK3_A9BC:
      INC     unk_RAM_9F,X
      LDA     ObjectYAccel,X
      BMI     loc_BANK3_A9F9

      BNE     loc_BANK3_A9C9

      LDA     #$10
      STA     unk_RAM_453,X

loc_BANK3_A9C9:
      LDA     ObjectYAccel,X
      BMI     loc_BANK3_A9E9

      LDA     EnemyCollision,X
      AND     #4
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
      LDA     EnemyTimer,X
      CMP     ObjectYLo,X
      BCS     loc_BANK3_A9F9

      STA     ObjectYLo,X
      LDA     #0
      STA     unk_RAM_B1,X
      LDA     #$A0
      STA     unk_RAM_86,X

loc_BANK3_A9F9:
      JSR     $857F

loc_BANK3_A9FC:
      LDA     #$61

loc_BANK3_A9FE:
      STA     ObjectAttributes,X
      LDA     unk_RAM_453,X
      BEQ     loc_BANK3_AA11

      CMP     #5
      BNE     loc_BANK3_AA0C

      JSR     $95EB

loc_BANK3_AA0C:
      LDA     #$64
      JMP     $9BB3

; ---------------------------------------------------------------------------

loc_BANK3_AA11:
      JMP     $9B1B

; ---------------------------------------------------------------------------

loc_BANK3_AA14:
      JSR     $845D

      LDA     #3
      STA     EnemyTimer,X
      RTS

; ---------------------------------------------------------------------------
unk_BANK3_AA1C:.BYTE   2
      .BYTE   4
      .BYTE  $D
      .BYTE  $E
; ---------------------------------------------------------------------------

EnemyBehavior_Pokey:
      LDA     EnemyTimer,X
      BNE     loc_BANK3_AA2D

      JSR     $997A

      JSR     $98CD

      JSR     $98D6

loc_BANK3_AA2D:
      LDA     EnemyCollision,X
      AND     #$10
      BEQ     loc_BANK3_AA3A

      JSR     sub_BANK3_AA3E

      INC     unk_RAM_42F,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_AA3A:
      LDA     unk_RAM_A8,X
      BEQ     loc_BANK3_AA99

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_AA3E:
      LDA     EnemyTimer,X
      BEQ     loc_BANK3_AA99

      STA     unk_RAM_477,X
      LDA     #0
      STA     EnemyTimer,X
      LDA     #2
      STA     unk_RAM_489,X
      LDA     unk_RAM_441,X
      STA     byte_RAM_6
      LDA     #$FF
      STA     unk_RAM_441,X
      JSR     $92C8

      BMI     loc_BANK3_AA99

      LDY     byte_RAM_0
      LDA     #$1A
      STA     ObjectType,Y
      JSR     sub_BANK3_A8EA

      LDY     byte_RAM_0
      LDA     byte_RAM_6
      STA     unk_RAM_441,Y
      LDA     unk_RAM_477,X
      SEC
      SBC     #1
      STA     EnemyTimer,Y
      TAY

loc_BANK3_AA78:
      LDA     unk_BANK3_AA1C,Y
      LDY     byte_RAM_0
      STA     unk_RAM_489,Y
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
      INC     unk_RAM_9F,X
      LDA     unk_RAM_9F,X
      AND     #$3F
      BNE     loc_BANK3_AAA4

      JSR     $8492

loc_BANK3_AAA4:
      JSR     $9E50

      JMP     $9B1B

; End of function sub_BANK3_AA3E

; ---------------------------------------------------------------------------
byte_BANK3_AAAA:.BYTE 0

byte_BANK3_AAAB:.BYTE 1

byte_BANK3_AAAC:.BYTE 0

byte_BANK3_AAAD:.BYTE $FF

      .BYTE 0
      .BYTE 1
      .BYTE 0
; ---------------------------------------------------------------------------
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
      LDA     byte_RAM_429
      STA     byte_RAM_4FD
      CLC
      ADC     byte_BANK3_AAAA,Y
      STA     byte_RAM_429
      JSR     $9BA7

      LDA     EnemyTimer,X
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
      JSR     $9CF2

      DEC     byte_RAM_9
      BEQ     loc_BANK3_AB16

      JSR     loc_BANKF_FAFE

      LDX     byte_RAM_7
      LDA     byte_RAM_4FD
      CLC
      ADC     byte_BANK3_AAAC,X
      STA     byte_RAM_1
      LDX     #$70
      JSR     $9CF2

      DEC     byte_RAM_9
      BEQ     loc_BANK3_AB16

      LDX     byte_RAM_7
      LDA     byte_RAM_4FD
      CLC
      ADC     byte_BANK3_AAAD,X
      STA     byte_RAM_1
      LDX     #$70
      JSR     $9CF2

loc_BANK3_AB16:
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_Rocket:
      LDA     unk_RAM_B1,X
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
      INC     byte_RAM_429
      LDA     byte_RAM_10
      AND     #2
      BNE     loc_BANK3_AB3B

      DEC     byte_RAM_429
      DEC     byte_RAM_429

loc_BANK3_AB3B:
      TYA
      AND     byte_RAM_10
      BNE     loc_BANK3_AB42

      DEC     ObjectYAccel,X

loc_BANK3_AB42:
      JSR     $9E4B

      LDA     unk_RAM_477,X
      BNE     loc_BANK3_AB64

      LDY     ObjectYHi,X
      BPL     loc_BANK3_AB88

      JSR     sub_BANKF_F6DA

      LDA     #$38
      STA     byte_RAM_4AF
      INC     byte_RAM_627
      LDA     #5
      STA     byte_RAM_534
      LDA     #0
      STA     PlayerState
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

      JMP     $910D

; ---------------------------------------------------------------------------

loc_BANK3_AB76:
      LDA     #0
      STA     byte_RAM_4C7
      STA     HoldingItem
      STA     PlayerXAccel
      LDA     ObjectYLo,X
      ADC     #$20
      STA     PlayerYLo
      STA     PlayerPageY

loc_BANK3_AB88:
      JSR     sub_BANK3_ABEE

      LDA     byte_RAM_429
      SEC
      SBC     #4
      STA     unk_RAM_293
      ADC     #7
      STA     unk_RAM_297
      ADC     #8
      STA     unk_RAM_29B
      LDA     #$20
      LDY     ObjectYAccel,X
      CPY     #$FD
      BMI     loc_BANK3_ABA8

      LDA     #$15

loc_BANK3_ABA8:
      ADC     byte_RAM_42C
      STA     unk_RAM_290
      STA     unk_RAM_294
      STA     unk_RAM_298
      LDA     #$8C
      STA     unk_RAM_291
      STA     unk_RAM_295
      STA     unk_RAM_299
      LDA     byte_RAM_10
      LSR     A
      AND     #3
      STA     byte_RAM_0
      LSR     A
      ROR     A
      ROR     A
      AND     #$C0
      ORA     byte_RAM_0
      STA     unk_RAM_292
      STA     unk_RAM_296
      STA     unk_RAM_29A
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_ABD7:
      LDA     unk_RAM_A8,X
      CMP     #1
      BNE     loc_BANK3_ABEB

      STA     unk_RAM_B1,X
      STA     byte_RAM_4C7
      LDA     #SoundEffect3_Rumble_A
      STA     SoundEffectQueue3
      LDA     #$FE
      STA     ObjectYAccel,X

loc_BANK3_ABEB:
      JSR     $960F

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_ABEE:
      LDA     byte_RAM_42C
      STA     byte_RAM_0
      LDA     byte_RAM_429
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
      JSR     $9C53

      LDA     byte_RAM_1
      CLC
      ADC     #$10
      STA     byte_RAM_1
      DEC     byte_RAM_2
      LDA     byte_RAM_42C
      STA     byte_RAM_0
      LDY     #$10
      LDX     #$96
      JMP     $9C53

; End of function sub_BANK3_ABEE

; ---------------------------------------------------------------------------
byte_BANK3_AC25:.BYTE $F0

byte_BANK3_AC26:.BYTE 0

      .BYTE $F0

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_AC28:
      LDA     #0
      STA     byte_RAM_EE
      LDA     unk_RAM_9F,X
      AND     #8
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_7
      LDY     byte_RAM_7
      LDA     byte_RAM_429
      PHA
      CLC
      ADC     byte_BANK3_AC25,Y
      STA     byte_RAM_429
      LDA     #$80
      LDY     unk_RAM_45C,X
      BEQ     loc_BANK3_AC4B

      LDA     #$88

loc_BANK3_AC4B:
      JSR     $9BB3

      JSR     loc_BANKF_FAFE

      STY     byte_RAM_F4
      PLA
      CLC
      LDY     byte_RAM_7
      ADC     byte_BANK3_AC26,Y
      STA     byte_RAM_429
      LDA     #$84
      LDY     unk_RAM_45C,X
      BEQ     loc_BANK3_AC67

      LDA     #$8C

loc_BANK3_AC67:
      JMP     $9BB3

; End of function sub_BANK3_AC28

; ---------------------------------------------------------------------------

loc_BANK3_AC6A:
      JSR     $845D

      LDA     #4
      STA     unk_RAM_465,X
      LDA     #0
      STA     EnemyTimer,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK3_AC77:.BYTE $E0

      .BYTE $20
      .BYTE $F0
      .BYTE $10
byte_BANK3_AC7B:.BYTE 4

      .BYTE $C
      .BYTE 4
      .BYTE $C
byte_BANK3_AC7F:.BYTE 4

      .BYTE 4
      .BYTE $C
      .BYTE $C
byte_BANK3_AC83:.BYTE 1

      .BYTE $FF
byte_BANK3_AC85:.BYTE $2A

      .BYTE $D6
byte_BANK3_AC87:.BYTE 1

      .BYTE $FF
byte_BANK3_AC89:.BYTE $18

      .BYTE $E8
; ---------------------------------------------------------------------------

EnemyBehavior_Fryguy:
      LDA     #2
      STA     unk_RAM_6F,X
      INC     unk_RAM_9F,X
      LDY     unk_RAM_465,X
      DEY
      BNE     loc_BANK3_ACE7

      LDA     #3
      STA     byte_RAM_9
      STA     byte_RAM_4F8
      JSR     $89A9

loc_BANK3_ACA1:
      JSR     $92C8

      BMI     loc_BANK3_ACE3

      LDY     byte_RAM_0
      LDA     ObjectYHi,X
      STA     unk_RAM_4EF,Y
      LDA     #$F0
      STA     ObjectYAccel,Y
      LDA     #$2B
      STA     ObjectType,Y
      LDA     #$30
      STA     unk_RAM_453,Y
      LDA     ObjectYLo,X
      PHA
      LDX     byte_RAM_9
      LDA     byte_BANK3_AC77,X
      STA     ObjectXAccel,Y
      LDA     byte_RAM_429
      ADC     byte_BANK3_AC7B,X
      STA     ObjectXLo,Y
      PLA
      ADC     byte_BANK3_AC7F,X
      STA     ObjectYLo,Y
      LDA     #0
      STA     ObjectXHi,Y
      TYA
      TAX
      JSR     $8441

      LDX     byte_RAM_12

loc_BANK3_ACE3:
      DEC     byte_RAM_9
      BPL     loc_BANK3_ACA1

loc_BANK3_ACE7:
      LDA     byte_RAM_10
      AND     #$1F
      BNE     loc_BANK3_AD07

      JSR     $92C8

      LDX     byte_RAM_0
      LDA     #$20
      STA     ObjectType,X
      LDA     ObjectXLo,X
      SBC     #8
      STA     ObjectXLo,X
      LDA     ObjectYLo,X
      ADC     #$18
      STA     ObjectYLo,X
      JSR     $848F

      LDX     byte_RAM_12

loc_BANK3_AD07:
      LDA     byte_RAM_10
      AND     #1
      BNE     loc_BANK3_AD37

      LDA     EnemyTimer,X
      AND     #1
      TAY
      LDA     ObjectYAccel,X
      CLC
      ADC     byte_BANK3_AC87,Y
      STA     ObjectYAccel,X
      CMP     byte_BANK3_AC89,Y
      BNE     loc_BANK3_AD21

      INC     EnemyTimer,X

loc_BANK3_AD21:
      LDA     unk_RAM_477,X
      AND     #1
      TAY
      LDA     ObjectXAccel,X
      CLC
      ADC     byte_BANK3_AC83,Y
      STA     ObjectXAccel,X
      CMP     byte_BANK3_AC85,Y
      BNE     loc_BANK3_AD37

      INC     unk_RAM_477,X

loc_BANK3_AD37:
      JSR     sub_BANK3_AC28

      JSR     $9E4B

      JMP     $9E50

; ---------------------------------------------------------------------------
unk_BANK3_AD40:.BYTE $3F
      .BYTE $3F
      .BYTE $3F
      .BYTE $7F
unk_BANK3_AD44:.BYTE $D4
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
      STA     unk_RAM_46E,X
      JMP     $91B0

; ---------------------------------------------------------------------------

loc_BANK3_AD59:
      LDA     #2
      STA     unk_RAM_6F,X
      LDA     byte_RAM_10
      STA     unk_RAM_44A,X
      INC     unk_RAM_9F,X
      INC     unk_RAM_9F,X
      JSR     sub_BANK3_B4FD

      JSR     $9B1B

      LDA     EnemyCollision,X
      PHA
      AND     #4
      BEQ     loc_BANK3_AD7A

      JSR     $95CE

      LDA     #0
      STA     ObjectXAccel,X

loc_BANK3_AD7A:
      PLA
      AND     #3
      BEQ     loc_BANK3_AD85

      JSR     $9EA9

      JSR     $95B0

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

      LDA     byte_RAM_5AE
      AND     #$1F
      ORA     unk_BANK3_AD44,Y
      STA     ObjectYAccel,X
      JSR     $8492

      LDA     byte_RAM_4F8
      CMP     #2
      BCS     loc_BANK3_ADAB

      ASL     ObjectXAccel,X

loc_BANK3_ADAB:
      JSR     $9E50

      JMP     $857F

; ---------------------------------------------------------------------------

EnemyBehavior_Autobomb:
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_ADF9

      LDA     EnemyCollision,X
      AND     #$10
      ORA     unk_RAM_A8,X
      BEQ     loc_BANK3_ADF9

      LDA     #1
      STA     ObjectType,X
      JSR     $8441

      LDA     unk_RAM_441,X
      STA     byte_RAM_6
      LDA     #$FF
      STA     unk_RAM_441,X
      JSR     $92C8

      BMI     loc_BANK3_ADF9

      LDY     byte_RAM_0
      LDA     byte_RAM_6
      STA     unk_RAM_441,Y
      LDA     ObjectXLo,X
      STA     ObjectXLo,Y
      LDA     ObjectXHi,X
      STA     ObjectXHi,Y
      LDX     byte_RAM_0
      LDA     #$26
      STA     ObjectType,X
      JSR     $848F

      INC     unk_RAM_B1,X
      JSR     $8441

      LDA     #4
      STA     unk_RAM_489,X
      LDX     byte_RAM_12

loc_BANK3_ADF9:
      JSR     $997A

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      PHA
      AND     #4
      BEQ     loc_BANK3_AE09

      JSR     $95CE

loc_BANK3_AE09:
      PLA
      AND     #3
      BEQ     loc_BANK3_AE14

      JSR     $9EA9

      JSR     $9E50

loc_BANK3_AE14:
      INC     unk_RAM_9F,X
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_AE45

      TXA
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      ADC     byte_RAM_10
      AND     #$7F
      BNE     loc_BANK3_AE28

      JSR     $8492

loc_BANK3_AE28:
      LDA     unk_RAM_9F,X
      AND     #$7F
      BNE     loc_BANK3_AE45

      JSR     $8492

      JSR     $95EB

      BMI     loc_BANK3_AE45

      LDX     byte_RAM_0
      LDA     #$27
      JSR     $9004

      LDX     byte_RAM_0
      DEC     ObjectYLo,X
      DEC     ObjectYLo,X
      LDX     byte_RAM_12

loc_BANK3_AE45:
      JSR     $8577

      JMP     $9B1B

; ---------------------------------------------------------------------------
      LDA     EnemyState,X
      CMP     #1
      BEQ     loc_BANK3_AE5C

      LDA     #$C1
      STA     ObjectAttributes,X
      STA     unk_RAM_9F,X
      LDA     #$76
      JMP     $9BB3

; ---------------------------------------------------------------------------

loc_BANK3_AE5C:
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_AE7C

      LDA     byte_RAM_F4
      PHA
      LDA     byte_RAM_42C
      CLC
      ADC     #$F5
      STA     byte_RAM_42C
      JSR     loc_BANKF_FAFE

      STY     byte_RAM_F4
      LDA     #$7C
      JSR     $9BB3

      PLA
      STA     byte_RAM_F4

loc_BANK3_AE7C:
      LDA     ObjectYLo,X
      STA     byte_RAM_42C
      JSR     $9BA7

      LDA     #2
      STA     unk_RAM_6F,X
      TYA
      CLC
      ADC     #8
      STA     byte_RAM_F4
      LDA     byte_RAM_0
      STA     byte_RAM_42C
      LDA     #$D0
      STA     unk_RAM_46E,X
      LDA     #$78
      JSR     $9BB3

      LDA     #$50
      LDY     unk_RAM_B1,X
      BEQ     loc_BANK3_AEA6

      LDA     #$52

loc_BANK3_AEA6:
      STA     unk_RAM_46E,X
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_AEAA:
      JSR     $845D

      LDA     ObjectYLo,X
      STA     unk_RAM_B1,X
      RTS

; ---------------------------------------------------------------------------

EnemyBehavior_WhaleSpout:
      INC     unk_RAM_9F,X
      INC     unk_RAM_9F,X
      INC     EnemyTimer,X
      LDA     EnemyTimer,X
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
      LDA     unk_RAM_B1,X
      STA     ObjectYLo,X

loc_BANK3_AECD:
      LDA     #1
      STA     SoundEffectQueue3
      LDA     EnemyTimer,X
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
      JSR     $9E4B

      LDA     byte_RAM_EE
      AND     #$C
      BNE     locret_BANK3_AEC2

      LDA     EnemyTimer,X
      STA     byte_RAM_7
      LDA     #$29
      STA     ObjectAttributes,X
      LDA     #$92
      LDY     EnemyTimer,X
      CPY     #$DC
      BCC     loc_BANK3_AF03

      LDA     #$94

loc_BANK3_AF03:
      JSR     $9BB3

      JSR     loc_BANKF_FAFE

      LDA     #$55
      LDX     byte_RAM_7
      CPX     #$E0
      BCC     loc_BANK3_AF13

      LDA     #$3A

loc_BANK3_AF13:
      STA     unk_RAM_201,Y
      LDA     #$55
      CPX     #$E8
      BCC     loc_BANK3_AF1E

      LDA     #$3A

loc_BANK3_AF1E:
      STA     unk_RAM_205,Y
      LDA     #$55
      CPX     #$F0
      BCC     loc_BANK3_AF29

      LDA     #$3A

loc_BANK3_AF29:
      STA     unk_RAM_209,Y
      LDA     #$55
      CPX     #$F8
      BCC     loc_BANK3_AF34

      LDA     #$3A

loc_BANK3_AF34:
      STA     unk_RAM_20D,Y
      LDX     byte_RAM_F4
      LDA     unk_RAM_202,X
      STA     unk_RAM_202,Y
      STA     unk_RAM_206,Y
      STA     unk_RAM_20A,Y
      STA     unk_RAM_20E,Y
      LDA     byte_RAM_429
      CLC
      ADC     #4
      STA     unk_RAM_203,Y
      STA     unk_RAM_207,Y
      STA     unk_RAM_20B,Y
      STA     unk_RAM_20F,Y
      LDX     byte_RAM_12
      LDA     ObjectYLo,X
      CLC
      ADC     #$F
      STA     SpriteDMAArea,Y
      ADC     #$10
      STA     unk_RAM_204,Y
      ADC     #$10
      STA     unk_RAM_208,Y
      ADC     #$10
      STA     unk_RAM_20C,Y

locret_BANK3_AF74:
      RTS

; ---------------------------------------------------------------------------
      .BYTE $1C
byte_BANK3_AF76:.BYTE $E4

      .BYTE 1
      .BYTE $FF
; ---------------------------------------------------------------------------

EnemyBehavior_Flurry:
      INC     unk_RAM_9F,X
      JSR     sub_BANK2_997A

      JSR     sub_BANK2_98CD

      JSR     sub_BANK3_B4FD

      LDA     EnemyCollision,X
      AND     #3
      BEQ     loc_BANK3_AF8D

      JSR     sub_BANK2_9EA9

loc_BANK3_AF8D:
      LDA     EnemyCollision,X
      AND     #4
      BEQ     loc_BANK3_AFB4

      LDA     ObjectYAccel,X
      PHA
      JSR     $95CE

      PLA
      LDY     unk_RAM_42F,X
      BEQ     loc_BANK3_AFB4

      CMP     #$18
      BMI     loc_BANK3_AFAC

      JSR     $95B0

      LDA     #$F0
      STA     ObjectYAccel,X
      BNE     loc_BANK3_AFDA

loc_BANK3_AFAC:
      LDA     #0
      STA     unk_RAM_42F,X
      JSR     $8441

loc_BANK3_AFB4:
      LDA     byte_RAM_E
      CMP     #$16
      BEQ     loc_BANK3_AFBF

      DEC     unk_RAM_9F,X
      JMP     $9470

; ---------------------------------------------------------------------------

loc_BANK3_AFBF:
      JSR     $9E3B

      INY
      STY     unk_RAM_6F,X
      LDA     byte_RAM_10
      AND     #1
      BNE     loc_BANK3_AFDA

      LDA     ObjectXAccel,X
      CMP     locret_BANK3_AF74,Y
      BEQ     loc_BANK3_AFDA

      CLC
      ADC     byte_BANK3_AF76,Y
      STA     ObjectXAccel,X
      INC     unk_RAM_9F,X

loc_BANK3_AFDA:
      JSR     $8577

      INC     unk_RAM_4A4,X
      JMP     $9B1B

; ---------------------------------------------------------------------------

loc_BANK3_AFE3:
      JSR     $8D5F

      LDA     #3
      STA     unk_RAM_465,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK3_AFEC:.BYTE 1

      .BYTE $FF
byte_BANK3_AFEE:.BYTE $28

      .BYTE $D8
byte_BANK3_AFF0:.BYTE 1

      .BYTE $FF
byte_BANK3_AFF2:.BYTE $10

      .BYTE $F0
; ---------------------------------------------------------------------------

EnemyBehavior_HawkmouthBoss:
      JSR     sub_BANK3_B0E8

      LDA     #6
      STA     unk_RAM_46E,X
      LDA     #2
      STA     byte_RAM_71FE
      LDA     CrystalAndHawkmouthOpenSize
      BEQ     locret_BANK3_B05F

      CMP     #1
      BNE     loc_BANK3_B01C

      STA     unk_RAM_480,X
      LDA     #$90
      STA     unk_RAM_86,X
      LDA     #$40
      STA     unk_RAM_438,X
      STA     unk_RAM_45C,X
      STA     CrystalAndHawkmouthOpenSize

loc_BANK3_B01C:
      LDA     unk_RAM_480,X
      CMP     #2
      BCC     loc_BANK3_B09B

      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_B03B

      INC     unk_RAM_480,X
      LDA     unk_RAM_480,X
      CMP     #$31
      BNE     loc_BANK3_B060

      LDA     unk_RAM_453,X
      BNE     loc_BANK3_B03B

      INC     unk_RAM_B1,X
      JSR     sub_BANK3_B095

loc_BANK3_B03B:
      DEC     unk_RAM_480,X
      LDY     unk_RAM_480,X
      DEY
      BNE     loc_BANK3_B060

      DEC     unk_RAM_B1,X
      LDA     PlayerState
      CMP     #6
      BNE     loc_BANK3_B060

      LDA     #1
      STA     byte_RAM_534
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

loc_BANK3_B060:
      LDA     unk_RAM_480,X
      CMP     #$30
      BNE     locret_BANK3_B09A

      LDA     EnemyCollision,X
      AND     #$40
      BEQ     locret_BANK3_B09A

      LDA     HoldingItem
      BNE     locret_BANK3_B09A

      STA     PlayerCollision
      INC     unk_RAM_B1,X
      INC     HawkmouthClosing
      DEC     unk_RAM_480,X
      LDA     ObjectXLo,X
      STA     PlayerXLo
      LDA     ObjectXHi,X
      STA     PlayerXHi
      LDA     ObjectYLo,X
      ADC     #$10
      STA     PlayerYLo
      LDA     #6
      STA     PlayerState
      LDA     #$60
      STA     byte_RAM_82
      LDA     #$FC
      STA     PlayerYAccel

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_B095:
      LDA     #$80
      STA     SoundEffect1Queue

locret_BANK3_B09A:
      RTS

; End of function sub_BANK3_B095

; ---------------------------------------------------------------------------

loc_BANK3_B09B:
      LDA     #3
      STA     unk_RAM_46E,X
      LDA     #0
      STA     byte_RAM_71FE
      LDA     unk_RAM_465,X
      BNE     loc_BANK3_B0BA

      LDA     #3
      STA     unk_RAM_465,X
      JSR     sub_BANK3_B095

      INC     unk_RAM_480,X
      LDA     #$FF
      STA     unk_RAM_453,X

loc_BANK3_B0BA:
      LDA     byte_RAM_10
      LSR     A
      BCC     loc_BANK3_B0E3

      LDA     EnemyTimer,X
      AND     #1
      TAY
      LDA     ObjectYAccel,X
      CLC
      ADC     byte_BANK3_AFF0,Y
      STA     ObjectYAccel,X
      CMP     byte_BANK3_AFF2,Y
      BNE     loc_BANK3_B0D3

      INC     EnemyTimer,X

loc_BANK3_B0D3:
      JSR     $9E3B

      LDA     ObjectXAccel,X
      CMP     byte_BANK3_AFEE,Y
      BEQ     loc_BANK3_B0E3

      CLC
      ADC     byte_BANK3_AFEC,Y
      STA     ObjectXAccel,X

loc_BANK3_B0E3:
      JMP     $9430

; ---------------------------------------------------------------------------
      .BYTE $F8
      .BYTE $10

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_B0E8:
      LDA     unk_RAM_480,X
      JSR     $8E13

      LDA     CrystalAndHawkmouthOpenSize
      BEQ     loc_BANK3_B16D

      LDA     byte_RAM_EE
      AND     #$C
      BNE     loc_BANK3_B16D

      LDA     unk_RAM_86,X
      STA     byte_RAM_7
      JSR     loc_BANKF_FAFE

      LDX     byte_RAM_2
      LDA     byte_RAM_429
      CLC
      ADC     loc_BANK3_B0E3+2,X
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

      STA     unk_RAM_203,Y
      STA     unk_RAM_207,Y
      STA     unk_RAM_20B,Y
      STA     unk_RAM_20F,Y
      LDX     byte_RAM_4BD
      BEQ     loc_BANK3_B129

      LDX     #$10

loc_BANK3_B129:
      LDA     SpriteDMAArea,X
      STA     SpriteDMAArea,Y
      CLC
      ADC     #$10
      STA     unk_RAM_204,Y
      LDA     byte_RAM_7
      BEQ     loc_BANK3_B13B

      LDA     #$20

loc_BANK3_B13B:
      ORA     unk_RAM_202,X
      STA     unk_RAM_202,Y
      STA     unk_RAM_206,Y
      STA     unk_RAM_20A,Y
      STA     unk_RAM_20E,Y
      LDX     byte_RAM_F4
      LDA     SpriteDMAArea,X
      STA     unk_RAM_208,Y
      CLC
      ADC     #$10
      STA     unk_RAM_20C,Y
      LDA     #$F0
      STA     unk_RAM_201,Y
      LDA     #$F2
      STA     unk_RAM_205,Y
      LDA     #$F4
      STA     unk_RAM_209,Y
      LDA     #$F6
      STA     unk_RAM_20D,Y

loc_BANK3_B16D:
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK3_B0E8

; ---------------------------------------------------------------------------
byte_BANK3_B170:.BYTE 8

      .BYTE $28
      .BYTE $48
      .BYTE $28
byte_BANK3_B174:.BYTE $94

      .BYTE $84
      .BYTE $94
      .BYTE $84
unk_BANK3_B178:.BYTE $F8
      .BYTE 8
      .BYTE $F8
      .BYTE 8
      .BYTE 8
      .BYTE $F8
      .BYTE 8
      .BYTE $F8
; ---------------------------------------------------------------------------

loc_BANK3_B180:
      LDA     HoldingItem
      BNE     locret_BANK3_B1CC

      LDA     byte_RAM_10
      AND     #$FF
      BNE     locret_BANK3_B1CC

      INC     byte_RAM_4F9
      JSR     $92C4

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
      LDA     byte_RAM_5AE
      AND     #3
      CMP     #2
      BCC     loc_BANK3_B1C1

      ASL     A
      STA     unk_RAM_B1,X

loc_BANK3_B1C1:
      LDY     #$33
      STY     ObjectType,X
      JSR     $8441

      LDA     #$D0
      STA     ObjectYAccel,X

locret_BANK3_B1CC:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B1CD:
      JSR     $845D

      LDA     #6
      STA     unk_RAM_465,X
      LDA     ObjectXHi,X
      STA     unk_RAM_4EF,X
      RTS

; ---------------------------------------------------------------------------
byte_BANK3_B1DB:.BYTE $E0

      .BYTE $F0
      .BYTE $E8
      .BYTE $E4
; ---------------------------------------------------------------------------

EnemyBehavior_Wart:
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_B256

      LDA     unk_RAM_465,X
      BNE     loc_BANK3_B1F0

      LDA     #$80
      STA     unk_RAM_86,X
      STA     unk_RAM_B1,X
      BNE     loc_BANK3_B253

loc_BANK3_B1F0:
      INC     EnemyTimer,X
      LDA     byte_RAM_10
      AND     #$FF
      BNE     loc_BANK3_B1FF

      LDA     #$5F
      STA     unk_RAM_86,X
      INC     unk_RAM_480,X

loc_BANK3_B1FF:
      LDA     #0
      STA     ObjectXAccel,X
      LDA     EnemyTimer,X
      AND     #$40
      BEQ     loc_BANK3_B216

      INC     unk_RAM_477,X
      LDA     #$F8
      LDY     EnemyTimer,X
      BPL     loc_BANK3_B214

      LDA     #8

loc_BANK3_B214:
      STA     ObjectXAccel,X

loc_BANK3_B216:
      JSR     $9E50

      LDA     unk_RAM_45C,X
      BNE     loc_BANK3_B253

      LDA     unk_RAM_86,X
      BEQ     loc_BANK3_B253

      AND     #$F
      BNE     loc_BANK3_B253

      JSR     $92C8

      BMI     loc_BANK3_B253

      LDA     #$80
      STA     SoundEffect1Queue
      LDA     unk_RAM_480,X
      AND     #3
      TAY
      LDA     unk_RAM_86,X
      LDX     byte_RAM_0
      LSR     A
      EOR     #$FF
      STA     ObjectXAccel,X
      LDA     byte_BANK3_B1DB,Y
      STA     ObjectYAccel,X
      LDA     #$11
      STA     ObjectType,X
      LDA     ObjectYLo,X
      ADC     #8
      STA     ObjectYLo,X
      JSR     $8441

      LDX     byte_RAM_12

loc_BANK3_B253:
      JMP     $9B1B

; ---------------------------------------------------------------------------

loc_BANK3_B256:
      LDA     unk_RAM_86,X
      BEQ     loc_BANK3_B269

      STA     unk_RAM_45C,X
      INC     unk_RAM_477,X
      INC     unk_RAM_477,X
      LDA     #$F0
      STA     ObjectYAccel,X
      BNE     loc_BANK3_B29F

loc_BANK3_B269:
      LDA     #4
      STA     ObjectXAccel,X
      JSR     $9E50

      JSR     $9E4B

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
      JSR     $92C8

      LDX     byte_RAM_0
      LDA     ObjectYLo,X
      ADC     #8
      STA     ObjectYLo,X
      JSR     $91B0

loc_BANK3_B295:
      LDA     ObjectYLo,X
      CMP     #$D0
      BCC     loc_BANK3_B29F

      LDA     #2
      STA     EnemyState,X

loc_BANK3_B29F:
      JMP     $9B1B

; ---------------------------------------------------------------------------

EnemyBehavior_WartBubble:
      INC     unk_RAM_9F,X
      JSR     $9E50

      JSR     $9E4B

      INC     ObjectYAccel,X
      JMP     $9B1B

; ---------------------------------------------------------------------------

locret_BANK3_B2AF:
      RTS

; ---------------------------------------------------------------------------
      LDA     byte_RAM_F4
      STA     byte_RAM_7267
      STA     byte_RAM_726B
      LDA     byte_RAM_10
      AND     #3
      STA     byte_RAM_7
      TAY
      LDA     unk_RAM_7265,Y
      STA     byte_RAM_F4
      LDA     byte_RAM_EF
      BNE     locret_BANK3_B2AF

      LDY     unk_RAM_465,X
      BNE     loc_BANK3_B2D3

      LDA     #$4E
      STA     ObjectAttributes,X

loc_BANK3_B2D3:
      LDA     byte_RAM_EE
      PHA
      PHA
      LDY     #$AE
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_B2EC

      LDA     unk_RAM_45C,X
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
      LDY     unk_RAM_86,X
      BEQ     loc_BANK3_B2F7

      LDA     #$A2

loc_BANK3_B2F7:
      JSR     $9BB3

      LDA     byte_RAM_0
      STA     byte_RAM_42C
      LDY     byte_RAM_7
      LDA     unk_RAM_7266,Y
      STA     byte_RAM_F4
      LDY     #$A6
      LDA     unk_RAM_B1,X
      BNE     loc_BANK3_B320

      LDA     unk_RAM_45C,X
      BEQ     loc_BANK3_B31C

      CMP     #$30
      BCS     loc_BANK3_B320

      AND     #8
      BNE     loc_BANK3_B320

      BEQ     loc_BANK3_B322

loc_BANK3_B31C:
      LDA     unk_RAM_86,X
      BEQ     loc_BANK3_B322

loc_BANK3_B320:
      LDY     #$AA

loc_BANK3_B322:
      PLA
      STA     byte_RAM_EE
      TYA
      JSR     $9BB3

      LDA     byte_RAM_0
      STA     byte_RAM_42C
      LDY     byte_RAM_7
      LDA     byte_RAM_7267,Y
      STA     byte_RAM_F4
      LDY     #$BA
      LDA     ObjectXAccel,X
      BEQ     loc_BANK3_B347

      LDY     #$B2
      LDA     unk_RAM_477,X
      AND     #$10
      BEQ     loc_BANK3_B347

      LDY     #$B6

loc_BANK3_B347:
      PLA
      STA     byte_RAM_EE
      TYA
      JSR     $9BB3

      LDA     byte_RAM_EE
      BNE     loc_BANK3_B398

      LDY     byte_RAM_7
      LDX     byte_RAM_7267,Y
      LDA     unk_RAM_7268,Y
      TAY
      LDA     byte_RAM_429
      CLC
      ADC     #$20
      BCS     loc_BANK3_B398

      STA     unk_RAM_203,Y
      STA     unk_RAM_207,Y
      STA     unk_RAM_20B,Y
      LDA     byte_RAM_0
      SBC     #$2F
      STA     SpriteDMAArea,Y
      ADC     #$F
      STA     unk_RAM_204,Y
      ADC     #$10
      STA     unk_RAM_208,Y
      LDA     unk_RAM_202,X
      STA     unk_RAM_202,Y
      STA     unk_RAM_206,Y
      STA     unk_RAM_20A,Y
      LDA     #$19
      STA     unk_RAM_201,Y
      LDA     #$1B
      STA     unk_RAM_205,Y
      LDA     #$1D
      STA     unk_RAM_209,Y

loc_BANK3_B398:
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; 0
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
      .BYTE $FF, $FF, $FF, $FF,	$FF		  ; $140
unk_BANK3_B4E0:.BYTE $F0
      .BYTE $10

; =============== S U B	R O U T	I N E =======================================

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

; ---------------------------------------------------------------------------
      LDA     #4
      BNE     loc_BANK3_B4FF

; =============== S U B	R O U T	I N E =======================================

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

      LDA     unk_BANK3_B4E0,Y
      STA     PlayerXAccel,X
      STA     byte_RAM_B
      BNE     loc_BANK3_B57B

loc_BANK3_B56C:
      LDY     PlayerXAccel,X
      BEQ     loc_BANK3_B579

      EOR     byte_RAM_6E,X
      LSR     A
      BCS     loc_BANK3_B579

      DEC     unk_RAM_9E,X
      DEC     unk_RAM_9E,X

loc_BANK3_B579:
      INC     unk_RAM_9E,X

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK3_B5BC:.BYTE 2

      .BYTE 1
      .BYTE 2
      .BYTE 2
      .BYTE 0
      .BYTE 0
      .BYTE 0
      .BYTE 0
byte_BANK3_B5C4:.BYTE 8

      .BYTE 4
      .BYTE 2
      .BYTE 1
      .BYTE 8
      .BYTE 4
      .BYTE 2
      .BYTE 1

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_B5CC:
      LDA     #0
      STA     unk_RAM_4CC,X
      LDA     EnemyCollision,X
      AND     #CollisionFlags_Right|CollisionFlags_Left|CollisionFlags_Down|CollisionFlags_Up ;	code used at a000
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

      LDY     unk_RAM_42F,X
      BNE     loc_BANK3_B5F8

loc_BANK3_B5F4:
      CMP     #1
      BNE     locret_BANK3_B5BB

loc_BANK3_B5F8:
      LDA     unk_RAM_A8,X
      BNE     locret_BANK3_B5BB

      LDY     unk_RAM_489,X

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
      LDA     unk_RAM_42F,Y
      BEQ     loc_BANK3_B65C

      CMP     #$20
      BCC     loc_BANK3_B64E

loc_BANK3_B65C:
      LDY     byte_RAM_9A
      JMP     loc_BANK3_B6A6

; ---------------------------------------------------------------------------

loc_BANK3_B661:
      LDY     byte_RAM_12
      LDA     EnemyState,Y
      CMP     #4
      BEQ     loc_BANK3_B671

      LDA     unk_RAM_46E,Y
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
      LDA     unk_RAM_A7,X
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

; =============== S U B	R O U T	I N E =======================================

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
      STA     byte_RAM_534
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

      LDA     unk_RAM_45C,Y
      ORA     unk_RAM_45B,X
      BNE     locret_BANK3_B760

      LDA     unk_RAM_42F,Y
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

      LDA     unk_RAM_42F,Y
      BEQ     loc_BANK3_B7E0

      LDA     PlayerCollision,X
      AND     #$10
      BNE     loc_BANK3_B7E0

loc_BANK3_B792:
      LDA     unk_RAM_453,Y
      ORA     unk_RAM_45C,Y
      BNE     loc_BANK3_B7D7

      LDA     unk_RAM_46E,Y
      AND     #8
      BEQ     loc_BANK3_B7A4

      JSR     sub_BANK3_BA7D

loc_BANK3_B7A4:
      LDA     unk_RAM_465,Y
      SEC
      SBC     #1
      STA     unk_RAM_465,Y
      BMI     loc_BANK3_B7BD

      JSR     sub_BANK3_BA7D

      LDA     #$21
      STA     unk_RAM_45C,Y
      LSR     A
      STA     unk_RAM_438,Y
      BNE     loc_BANK3_B7D7

loc_BANK3_B7BD:
      LDA     EnemyCollision,Y
      ORA     #$10
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
byte_BANK3_B7E3:.BYTE $F8

      .BYTE 8
; ---------------------------------------------------------------------------

loc_BANK3_B7E5:
      LDA     byte_RAM_EE
      AND     #8
      BNE     locret_BANK3_B828

      LDA     ObjectType,Y
      BNE     loc_BANK3_B80C

      STA     EnemyState,Y
      LDA     #4
      STA     SoundEffect1Queue
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
      CMP     #$17				  ; Phanto
      BNE     loc_BANK3_B815

      LDY     byte_RAM_5BC
      BNE     locret_BANK3_B828

loc_BANK3_B815:
      CMP     #$45
      BNE     loc_BANK3_B829

      LDA     #$3F
      STA     StarInvincibilityTimer
      LDA     #$10
      STA     Music1Queue
      LDA     #0
      STA     EnemyState,Y

locret_BANK3_B828:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B829:
      CMP     #$28
      BNE     loc_BANK3_B844

      LDA     EnemyTimer,Y
      CMP     #$DC
      BCS     locret_BANK3_B843

      LDA     StarInvincibilityTimer
      BEQ     loc_BANK3_B87D

      LDA     #$DC
      STA     EnemyTimer,Y
      LDA     #0
      STA     ObjectYAccel,Y

locret_BANK3_B843:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_B844:
      CMP     #$2C
      BNE     loc_BANK3_B84C

      LDA     unk_RAM_B1,X
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
      STA     unk_RAM_46E,X
      JSR     sub_BANK2_98A6

      JMP     loc_BANK3_B878

; ---------------------------------------------------------------------------

loc_BANK3_B866:
      JSR     sub_BANK2_9E3B

      LDA     byte_BANK3_B7E3,Y
      STA     ObjectXAccel,X
      LDA     #$E0
      STA     ObjectYAccel,X
      LDA     EnemyCollision,X
      ORA     #$10
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

      LDA     unk_RAM_46E,Y
      AND     #1
      BNE     loc_BANK3_B896

      JSR     sub_BANK3_BA95

      LDA     byte_RAM_F
      AND     #$B
      BEQ     sub_BANK3_B899

loc_BANK3_B896:
      JMP     DamagePlayer

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_B899:
      LDA     #0
      STA     byte_RAM_99
      LDX     byte_RAM_12
      LDA     EnemyCollision,X
      ORA     #$20
      STA     EnemyCollision,X
      LDA     unk_RAM_46E,X
      AND     #2
      BNE     loc_BANK3_B8CE

      BIT     Player1JoypadPress
      BVC     loc_BANK3_B8CE

      LDA     HoldingItem
      ORA     byte_RAM_9A
      BNE     loc_BANK3_B8CE

      STA     EnemyCollision,X
      STX     byte_RAM_42D
      STA     unk_RAM_44A,X
      LDA     #7
      STA     unk_RAM_A8,X
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
      LDA     unk_RAM_42F,Y
      BNE     loc_BANK3_B8FF

      JSR     sub_BANK3_BA95

      LDA     byte_RAM_F
      AND     byte_RAM_6E,X
      BEQ     loc_BANK3_B8F8

      DEX
      JSR     $9EA9

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
unk_BANK3_B903:.BYTE   8
      .BYTE   4
; ---------------------------------------------------------------------------

loc_BANK3_B905:
      LDA     EnemyCollision,Y
      ORA     #$40
      STA     EnemyCollision,Y
      JSR     sub_BANK3_BA95

      LDA     byte_RAM_F
      AND     byte_RAM_6E
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
      STA     byte_RAM_9A
      LDA     #4
      STA     PlayerAnimationFrame
      LDA     #$10
      STA     byte_RAM_82

locret_BANK3_B955:
      RTS

; ---------------------------------------------------------------------------
unk_BANK3_B956:.BYTE $8A
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
      STA     unk_RAM_A8,Y
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
      STA     unk_RAM_86,Y
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

      LDA     PlayerPageX
      SEC
      SBC     byte_RAM_429
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
      CMP     #$F
      BCS     loc_BANK3_BA48

      JSR     sub_BANK2_9E3B

      INY
      TYA
      CMP     unk_RAM_6F,X
      BEQ     loc_BANK3_BA48

      JSR     sub_BANK2_9EA9

loc_BANK3_BA48:
      PLA
      TAX
      LDA     #$C0
      STA     PlayerYAccel

loc_BANK3_BA4E:
      LDA     #$20
      STA     byte_RAM_82
      LDY     byte_RAM_12
      BMI     loc_BANK3_BA5A

      LSR     A
      STA     unk_RAM_438,Y

loc_BANK3_BA5A:
      JMP     KillPlayer

; =============== S U B	R O U T	I N E =======================================

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
      STA     unk_RAM_437,X

; End of function sub_BANK3_BA5D

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_BA7D:
      LDA     #$40
      STA     DPCMQueue
      RTS

; End of function sub_BANK3_BA7D

; ---------------------------------------------------------------------------

loc_BANK3_BA83:
      LDA     PlayerCollision,X
      ORA     #$10
      STA     PlayerCollision,X
      LDA     #$E0
      STA     PlayerYAccel,X
      LDA     ObjectXAccel,Y
      STA     PlayerXAccel,X
      LDA     #0

locret_BANK3_BA94:
      RTS

; =============== S U B	R O U T	I N E =======================================

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
      AND     byte_RAM_6E,X
      BEQ     locret_BANK3_BAC1

      LDY     byte_RAM_12
      LDA     unk_RAM_4A4,Y
      BNE     locret_BANK3_BAC1

      LDA     ObjectXAccel,Y
      STA     byte_RAM_4CB,X

locret_BANK3_BAC1:
      RTS

; ---------------------------------------------------------------------------

loc_BANK3_BAC2:
      LDA     ObjectYLo,Y
      CPX     #1
      BCS     loc_BANK3_BAD1

      PHA
      LDY     byte_RAM_9A
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
      INC     unk_RAM_9E,X

locret_BANK3_BB2E:
      RTS

; End of function sub_BANK3_BA95

; ---------------------------------------------------------------------------
byte_BANK3_BB2F:.BYTE $B

      .BYTE $10

; =============== S U B	R O U T	I N E =======================================

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
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
      .BYTE $FF
byte_BANK3_BB50:.BYTE $C2

      .BYTE $D4
      .BYTE $C3
      .BYTE $C4
      .BYTE 7
      .BYTE $80
      .BYTE $81
      .BYTE $94
      .BYTE $95
      .BYTE $17

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK3_BB6B:.BYTE $F9

      .BYTE $FF
      .BYTE 0
      .BYTE 8
      .BYTE $C
      .BYTE $18
      .BYTE $1A
      .BYTE 1
      .BYTE 6
      .BYTE $A
      .BYTE $C
      .BYTE $18
      .BYTE $1A
      .BYTE $1C
      .BYTE $FF
      .BYTE $FF
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
      .BYTE 0

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK3_BBF1:.BYTE 0

      .BYTE 4
      .BYTE 8
; ---------------------------------------------------------------------------

loc_BANK3_BBF4:
      INC     byte_RAM_4BD
      INC     byte_RAM_41B
      JSR     sub_BANK3_BD59

      LDA     #1
      STA     DPCMQueue
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_BC03:
      LDX     #0
      LDY     byte_RAM_6E
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_BC1F:
      LDA     #2
      STA     PlayerState
      LDA     #6
      STA     byte_RAM_82
      LDA     #8
      STA     PlayerAnimationFrame
      INC     HoldingItem
      RTS

; End of function sub_BANK3_BC1F

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK3_BC4D:.BYTE $A

byte_BANK3_BC4E:.BYTE 1

      .BYTE $B
; ---------------------------------------------------------------------------
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
      STA     _RAM_PPUDataBuffer,X
      TYA
      AND     #$F0
      ASL     A
      ROL     _RAM_PPUDataBuffer,X
      ASL     A
      ROL     _RAM_PPUDataBuffer,X
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
      ADC     _RAM_PPUDataBuffer,X
      STA     _RAM_PPUDataBuffer,X
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

; ---------------------------------------------------------------------------
unk_BANK3_BD0B:.BYTE $20
      .BYTE $28
      .BYTE $20
      .BYTE $24

; =============== S U B	R O U T	I N E =======================================

sub_BANK3_BD0F:
      LDA     InSubspaceOrJar
      BNE     locret_BANK3_BD28

      LDA     PlayerXHi
      STA     byte_RAM_50F
      LDA     PlayerXLo
      STA     byte_RAM_511
      LDA     PlayerYHi
      STA     byte_RAM_510
      LDA     PlayerYLo
      STA     byte_RAM_512

locret_BANK3_BD28:
      RTS

; End of function sub_BANK3_BD0F

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK3_BD36:.BYTE 0

      .BYTE $F0
      .BYTE $E0
      .BYTE $D0
      .BYTE $C0
      .BYTE $B0
      .BYTE $A0
      .BYTE $90
      .BYTE $80
      .BYTE $70
      .BYTE 0
byte_BANK3_BD41:.BYTE $60

      .BYTE $60
      .BYTE $61
      .BYTE $62
      .BYTE $63
      .BYTE $64
      .BYTE $65
      .BYTE $66
      .BYTE $67
      .BYTE $68
      .BYTE 7

; =============== S U B	R O U T	I N E =======================================

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
      .BYTE   0

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK3_BDEF:.BYTE $BA

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
byte_BANK3_BE03:.BYTE 0

      .BYTE 3
      .BYTE   0
      .BYTE $FD
byte_BANK3_BE07:.BYTE $26

      .BYTE $2A
      .BYTE $22
      .BYTE $26
; ---------------------------------------------------------------------------
      LDA     byte_RAM_4C6
      BEQ     loc_BANK3_BE55

      DEC     byte_RAM_4C6
      LDX     byte_RAM_300
      LDA     #$3F
      STA     _RAM_PPUDataBuffer,X
      LDA     #$10
      STA     byte_RAM_302,X
      LDA     #4
      STA     byte_RAM_303,X
      LDA     byte_RAM_4BC
      LDY     byte_RAM_4C6
      BEQ     loc_BANK3_BE34

      TYA
      AND     #3
      TAY
      LDA     byte_BANK3_BE07,Y

loc_BANK3_BE34:
      STA     byte_RAM_304,X
      LDA     byte_RAM_638
      STA     byte_RAM_305,X
      LDA     byte_RAM_639
      STA     byte_RAM_306,X
      LDA     byte_RAM_63A
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
      STA     unk_RAM_201,Y
      LDA     #$10
      STA     unk_RAM_203,Y
      LDA     #1
      STA     unk_RAM_202,Y
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
      JMP     $9935

; ---------------------------------------------------------------------------

locret_BANK3_BEAF:
      RTS

; ---------------------------------------------------------------------------
_empty_7EB0:.BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF; 0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$C
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$18
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$24
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$3C
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$48
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$54
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$6C
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$78
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$84
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$9C
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$A8
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$B4
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$CC
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$D8
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$E4
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$FC
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$108
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$114
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$120
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$12C
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$138
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF;	$144
; end of 'BANK3'

; ===========================================================================

