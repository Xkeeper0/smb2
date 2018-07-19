;
; Bank 0 & Bank 1
; ===============
;
; What's inside:
;
;   - Title screen
;   - Player controls
;   - Player state handling
;   - Enemy handling
;

; .segment BANK0
; * =  $8000

; =============== S U B R O U T I N E =======================================

sub_BANK0_8000:
      LDA     byte_RAM_502
      BNE     loc_BANK0_805D

      LDA     #1
      JSR     ChangeNametableMirroring

_code_000A:
      LDA     CurrentLevelPage
      BNE     loc_BANK0_8013

loc_BANK0_800F:
      LDA     #9
      BNE     loc_BANK0_8016

loc_BANK0_8013:
      SEC
      SBC     #1

loc_BANK0_8016:
      ORA     #$C0
      STA     byte_RAM_CF
      SEC
      SBC     #$40
      STA     byte_RAM_CE
      LDA     CurrentLevelPage

loc_BANK0_8022:
      CLC
      ADC     #1
      CMP     #$A
      BNE     loc_BANK0_802B

      LDA     #0

loc_BANK0_802B:
      ORA     #$10
      STA     byte_RAM_D0
      LDA     CurrentLevelPage
      LDY     #0
      JSR     sub_BANK0_86EE

      LDA     #$20
      STA     byte_RAM_D3
      LDA     #$60
      STA     byte_RAM_D4
      INC     byte_RAM_502
      LDA     #$E0
      STA     byte_RAM_E2
      LDA     #1
      STA     byte_RAM_E4
      STA     byte_RAM_53A
      LSR     A
      STA     byte_RAM_D2
      LDY     CurrentLevelPage
      JSR     sub_BANK0_95AF

      STA     ScreenYLo
      STY     ScreenYHi
      JSR     sub_BANK0_946D

loc_BANK0_805D:
      LDA     #0
      STA     byte_RAM_6
      LDA     #$FF
      STA     byte_RAM_505

loc_BANK0_8066:
      LDA     #$A0
      STA     byte_RAM_507
      JSR     sub_BANK0_823D

      LDA     byte_RAM_53A
      BNE     locret_BANK0_8082

      INC     byte_RAM_13
      LDA     #$E8
      STA     byte_RAM_E1
      LDA     #$C8
      STA     byte_RAM_E2
      LDA     #0
      STA     byte_RAM_502

locret_BANK0_8082:
      RTS

; End of function sub_BANK0_8000

; =============== S U B R O U T I N E =======================================

sub_BANK0_8083:
      LDA     NeedVerticalScroll
      AND     #4
      BNE     loc_BANK0_809D

      LDA     NeedVerticalScroll
      AND     #7
      BNE     loc_BANK0_8092

      JMP     loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_8092:
      LDA     NeedVerticalScroll
      ORA     #4
      STA     NeedVerticalScroll
      LDA     #$12
      STA     byte_RAM_504

loc_BANK0_809D:
      LDA     NeedVerticalScroll
      LSR     A
      LDA     PPUScrollYMirror
      BCC     loc_BANK0_8103

      BNE     loc_BANK0_80B1

      LDA     byte_RAM_CF
      AND     #$F
      CMP     #9
      BNE     loc_BANK0_80B1

      JMP     loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_80B1:
      LDA     #1
      JSR     sub_BANK0_895D

      LDA     PPUScrollYMirror
      SEC
      SBC     #4
      STA     PPUScrollYMirror
      LDA     ScreenYLo
      SEC
      SBC     #4
      STA     ScreenYLo
      BCS     loc_BANK0_80C8

      DEC     ScreenYHi

loc_BANK0_80C8:
      LDA     PPUScrollYMirror
      CMP     #$FC
      BNE     loc_BANK0_80DB

      LDA     #$EC
      STA     PPUScrollYMirror
      LDA     byte_RAM_C8
      EOR     #2
      STA     byte_RAM_C8
      LSR     A
      STA     byte_RAM_C9

loc_BANK0_80DB:
      LDA     PPUScrollYMirror
      AND     #7
      BEQ     loc_BANK0_80E2

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_80E2:
      LDX     #0
      JSR     loc_BANK0_8287

      INX
      JSR     loc_BANK0_8287

      LDA     PPUScrollYMirror
      AND     #$F
      BNE     loc_BANK0_80FB

      LDX     #0
      JSR     sub_BANK0_8297

      LDX     #1
      JSR     sub_BANK0_8297

loc_BANK0_80FB:
      LDX     #1
      JSR     sub_BANK0_82E2

      JMP     loc_BANK0_8170

; ---------------------------------------------------------------------------

loc_BANK0_8103:
      BNE     loc_BANK0_8121

      LDA     byte_RAM_53F
      STA     byte_RAM_F
      CMP     #9
      BNE     loc_BANK0_8114

      LDA     #0
      STA     byte_RAM_F
      BEQ     loc_BANK0_8116

loc_BANK0_8114:
      INC     byte_RAM_F

loc_BANK0_8116:
      LDA     byte_RAM_D0
      AND     #$F
      CMP     byte_RAM_F
      BNE     loc_BANK0_8121

      JMP     loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_8121:
      LDA     #1
      JSR     sub_BANK0_895D

      LDA     PPUScrollYMirror
      CLC
      ADC     #4
      STA     PPUScrollYMirror
      LDA     ScreenYLo
      CLC
      ADC     #4
      STA     ScreenYLo
      BCC     loc_BANK0_8138

      INC     ScreenYHi

loc_BANK0_8138:
      LDA     PPUScrollYMirror
      AND     #7
      BEQ     loc_BANK0_813F

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_813F:
      LDA     PPUScrollYMirror
      CMP     #$F0
      BNE     loc_BANK0_8152

      LDA     #0
      STA     PPUScrollYMirror
      LDA     byte_RAM_C8
      EOR     #2
      STA     byte_RAM_C8
      LSR     A
      STA     byte_RAM_C9

loc_BANK0_8152:
      LDX     #2
      JSR     sub_BANK0_828F

      DEX
      JSR     sub_BANK0_828F

      LDA     byte_RAM_D4
      AND     #$20
      BNE     loc_BANK0_816B

      LDX     #2
      JSR     sub_BANK0_82BE

      LDX     #1
      JSR     sub_BANK0_82BE

loc_BANK0_816B:
      LDX     #2
      JSR     sub_BANK0_82E2

loc_BANK0_8170:
      LDA     byte_RAM_504
      CMP     #$12
      BNE     loc_BANK0_818F

      LDA     #1
      STA     byte_RAM_E4
      LDA     NeedVerticalScroll
      LSR     A
      BCC     loc_BANK0_8186

      LDX     #1
      LDA     #0
      BEQ     loc_BANK0_818A

loc_BANK0_8186:
      LDX     #2
      LDA     #$10

loc_BANK0_818A:
      STA     byte_RAM_1
      JSR     sub_BANK0_8314

loc_BANK0_818F:
      JSR     sub_BANK0_833E

      DEC     byte_RAM_504
      BNE     locret_BANK0_81A0

      LDA     #0
      JSR     sub_BANK0_895D

loc_BANK0_819C:
      LDA     #0
      STA     NeedVerticalScroll

locret_BANK0_81A0:
      RTS

; End of function sub_BANK0_8083

; ---------------------------------------------------------------------------
      .BYTE $01

; =============== S U B R O U T I N E =======================================

sub_BANK0_81A2:
      LDA     PPUScrollYMirror
      STA     byte_RAM_509
      LDA     PPUScrollXMirror
      STA     byte_RAM_50A
      LDA     byte_RAM_C8
      STA     byte_RAM_50B
      LDA     byte_RAM_C9
      STA     byte_RAM_50C
      LDA     ScreenYHi
      STA     byte_RAM_513
      LDA     ScreenYLo
      STA     byte_RAM_515
      LDA     ScreenBoundaryLeftHi
      STA     byte_RAM_514
      LDA     byte_RAM_E1
      STA     byte_RAM_517
      LDA     #0
      STA     PPUScrollYMirror
      STA     PPUScrollXMirror
      STA     byte_RAM_C8
      STA     byte_RAM_C9
      RTS

; End of function sub_BANK0_81A2

; =============== S U B R O U T I N E =======================================

sub_BANK0_81D6:
      LDA     byte_RAM_509
      STA     PPUScrollYMirror
      LDA     byte_RAM_50A
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      LDA     byte_RAM_50B
      STA     byte_RAM_C8
      LDA     byte_RAM_50C
      STA     byte_RAM_C9
      LDA     byte_RAM_514
      STA     ScreenBoundaryLeftHi
      LDA     byte_RAM_513
      STA     ScreenYHi
      LDA     byte_RAM_515
      STA     ScreenYLo
      RTS

; End of function sub_BANK0_81D6

; =============== S U B R O U T I N E =======================================

sub_BANK0_81FE:
      LDA     byte_RAM_CF
      AND     #$10
      BEQ     loc_BANK0_820B

      LDA     byte_RAM_E1
      SEC
      SBC     #8
      STA     byte_RAM_E1

loc_BANK0_820B:
      LDA     #1
      STA     byte_RAM_E4
      LDA     byte_RAM_CF
      STA     byte_RAM_CE
      LDA     #$10
      STA     byte_RAM_1
      LDX     #0
      JSR     sub_BANK0_8314

      LDA     byte_RAM_D3
      STA     byte_RAM_D2
      LDA     byte_RAM_E1
      STA     byte_RAM_E2
      LDX     #1
      JSR     sub_BANK0_846A

      LDA     #$F0
      STA     byte_RAM_506
      STA     byte_RAM_507
      LDA     byte_RAM_D0
      STA     byte_RAM_505
      INC     byte_RAM_D5
      LDA     #1
      STA     byte_RAM_6
      RTS

; End of function sub_BANK0_81FE

; =============== S U B R O U T I N E =======================================

sub_BANK0_823D:
      LDX     #0
      STX     byte_RAM_537
      JSR     sub_BANK0_82E2

      JSR     sub_BANK0_833E

      LDX     #0
      JSR     sub_BANK0_828F

      LDA     byte_RAM_506
      CMP     byte_RAM_D1
      BNE     loc_BANK0_8277

      LDA     byte_RAM_507
      CLC
      ADC     #$20
      CMP     byte_RAM_D2
      BNE     loc_BANK0_8277

loc_BANK0_825E:
      LDA     byte_RAM_6
      TAX
      BEQ     loc_BANK0_8268

      LDA     byte_RAM_517
      STA     byte_RAM_E1

loc_BANK0_8268:
      INC     byte_RAM_537
      LDA     #0
      STA     byte_RAM_53A,X
      STA     byte_RAM_53D
      STA     byte_RAM_53E
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8277:
      LDA     byte_RAM_D2
      AND     #$20
      BNE     locret_BANK0_828E

      LDA     byte_RAM_CE
      CMP     byte_RAM_505
      BEQ     loc_BANK0_825E

      JMP     sub_BANK0_82BE

; ---------------------------------------------------------------------------

loc_BANK0_8287:
      LDA     byte_RAM_D3,X
      SEC
      SBC     #$20
      STA     byte_RAM_D3,X

locret_BANK0_828E:
      RTS

; End of function sub_BANK0_823D

; =============== S U B R O U T I N E =======================================

sub_BANK0_828F:
      LDA     byte_RAM_D2,X
      CLC
      ADC     #$20
      STA     byte_RAM_D2,X
      RTS

; End of function sub_BANK0_828F

; =============== S U B R O U T I N E =======================================

sub_BANK0_8297:
      LDA     byte_RAM_CF,X
      SEC
      SBC     #$10
      STA     byte_RAM_CF,X
      AND     #$F0
      CMP     #$F0
      BNE     locret_BANK0_82BD

      LDA     byte_RAM_CF,X
      AND     #$F
      CLC
      ADC     #$E0
      STA     byte_RAM_CF,X
      DEC     byte_RAM_CF,X
      LDA     byte_RAM_CF,X
      CMP     #$DF
      BNE     loc_BANK0_82B9

loc_BANK0_82B5:
      LDA     #$E9
      STA     byte_RAM_CF,X

loc_BANK0_82B9:
      LDA     #$A0
      STA     byte_RAM_D3,X

locret_BANK0_82BD:
      RTS

; End of function sub_BANK0_8297

; =============== S U B R O U T I N E =======================================

sub_BANK0_82BE:
      LDA     byte_RAM_CE,X
      CLC
      ADC     #$10
      STA     byte_RAM_CE,X
      AND     #$F0
      CMP     #$F0
      BNE     locret_BANK0_82E1

      LDA     byte_RAM_CE,X
      AND     #$F
      STA     byte_RAM_CE,X
      INC     byte_RAM_CE,X
      LDA     byte_RAM_CE,X
      CMP     #$A
      BNE     loc_BANK0_82DD

      LDA     #0
      STA     byte_RAM_CE,X

loc_BANK0_82DD:
      LDA     #0
      STA     byte_RAM_D2,X

locret_BANK0_82E1:
      RTS

; End of function sub_BANK0_82BE

; =============== S U B R O U T I N E =======================================

sub_BANK0_82E2:
      LDA     byte_RAM_CE,X
      AND     #$F
      TAY
      LDA     byte_BANK1_BA5B,Y
      STA     byte_RAM_E9
      LDA     byte_BANK1_BA66,Y
      STA     byte_RAM_EA
      LDA     byte_RAM_CE,X
      AND     #$F0
      STA     byte_RAM_D7
      LDA     byte_RAM_CE,X
      LSR     A
      BCC     loc_BANK0_8300

      LDA     #$20
      BNE     loc_BANK0_8302

loc_BANK0_8300:
      LDA     #$28

loc_BANK0_8302:
      STA     byte_RAM_D1
      LDA     byte_RAM_CE,X
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      ADC     byte_RAM_D1
      STA     byte_RAM_D1

loc_BANK0_830F:
      LDA     byte_RAM_D2,X
      STA     byte_RAM_D2

locret_BANK0_8313:
      RTS

; End of function sub_BANK0_82E2

; =============== S U B R O U T I N E =======================================

sub_BANK0_8314:
      LDA     byte_RAM_CE,X
      AND     #$10
      BEQ     locret_BANK0_8313

      LDA     byte_RAM_CE,X
      STA     byte_RAM_3
      SEC
      SBC     byte_RAM_1
      STA     byte_RAM_CE,X
      JSR     sub_BANK0_82E2

loc_BANK0_8326:
      LDA     #$F
      STA     byte_RAM_E3
      LDA     #0
      STA     byte_RAM_D6

loc_BANK0_832E:
      JSR     sub_BANK0_84AC

      LDA     byte_RAM_E3
      BPL     loc_BANK0_832E

      LDA     byte_RAM_3
      STA     byte_RAM_CE,X
      DEC     byte_RAM_E4
      JMP     sub_BANK0_82E2

; End of function sub_BANK0_8314

; =============== S U B R O U T I N E =======================================

sub_BANK0_833E:
      LDX     byte_RAM_300
      LDA     byte_RAM_D1
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_D2
      STA     PPUBuffer_301,X
      INX
      LDA     #$20
      STA     PPUBuffer_301,X
      INX
      LDA     #0
      STA     byte_RAM_D6
      LDA     #$F
      STA     byte_RAM_E3
      LDA     byte_RAM_D5
      BEQ     loc_BANK0_836C

      LDY     byte_RAM_D7
      CPY     #$E0
      BNE     loc_BANK0_836C

      LDA     #0
      STA     byte_RAM_E4
      INC     byte_RAM_539

loc_BANK0_836C:
      LDY     byte_RAM_D7
      LDA     (byte_RAM_E9),Y
      STA     byte_RAM_51B
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      TAY
      LDA     TileQuadPointersLo,Y
      STA     byte_RAM_0
      LDA     TileQuadPointersHi,Y
      STA     byte_RAM_1
      LDY     byte_RAM_D7
      LDA     (byte_RAM_E9),Y
      ASL     A
      ASL     A
      TAY
      LDA     byte_RAM_D5
      BEQ     loc_BANK0_8390

      INY
      INY

loc_BANK0_8390:
      LDA     (byte_RAM_0),Y
      STA     PPUBuffer_301,X
      INC     byte_RAM_D6
      INX
      INY
      LDA     byte_RAM_D6
      LSR     A
      BCS     loc_BANK0_8390

      INC     byte_RAM_D7
      LDA     byte_RAM_D5
      BEQ     loc_BANK0_83A7

      JSR     sub_BANK0_8488

loc_BANK0_83A7:
      LDA     byte_RAM_D6
      CMP     #$20
      BCC     loc_BANK0_836C

      LDA     #0
      STA     PPUBuffer_301,X
      STX     byte_RAM_300
      LDA     byte_RAM_D5
      BEQ     loc_BANK0_840B

      LDA     byte_RAM_E4
      BEQ     loc_BANK0_83C2

      DEC     byte_RAM_E4
      JMP     loc_BANK0_83DE

; ---------------------------------------------------------------------------

loc_BANK0_83C2:
      LDA     NeedVerticalScroll
      LSR     A
      BCS     loc_BANK0_83D4

      LDX     #1
      JSR     sub_BANK0_8412

      LDX     #1
      JSR     sub_BANK0_846A

      JMP     loc_BANK0_83DE

; ---------------------------------------------------------------------------

loc_BANK0_83D4:
      LDX     #0
      JSR     sub_BANK0_8412

      LDX     #0
      JSR     sub_BANK0_8478

loc_BANK0_83DE:
      LDX     #0
      LDA     NeedVerticalScroll
      LSR     A
      BCC     loc_BANK0_83FA

      INX
      LDA     byte_RAM_CF,X
      AND     #$F0
      CMP     #$E0
      BEQ     loc_BANK0_83F4

      LDA     byte_RAM_CF,X
      AND     #$10
      BNE     loc_BANK0_840B

loc_BANK0_83F4:
      JSR     sub_BANK0_8478

      JMP     loc_BANK0_840B

; ---------------------------------------------------------------------------

loc_BANK0_83FA:
      LDA     byte_RAM_CF,X
      AND     #$F0
      CMP     #$E0
      BEQ     loc_BANK0_8408

      LDA     byte_RAM_CF,X
      AND     #$10
      BEQ     loc_BANK0_840B

loc_BANK0_8408:
      JSR     sub_BANK0_846A

loc_BANK0_840B:
      LDA     byte_RAM_D5
      EOR     #1
      STA     byte_RAM_D5
      RTS

; End of function sub_BANK0_833E

; =============== S U B R O U T I N E =======================================

; something to do with background tile palettes in vertical levels?
sub_BANK0_8412:
      LDY     byte_RAM_300
      LDA     byte_RAM_D1
      ORA     #3
      STA     PPUBuffer_301,Y
      INY
      LDA     byte_RAM_E1,X
      STA     PPUBuffer_301,Y
      INY
      LDA     #8
      STA     PPUBuffer_301,Y
      INY
      LDX     #7

loc_BANK0_842B:
      LDA     byte_RAM_539
      BEQ     loc_BANK0_843B

      LDA     EnemyArray_D9,X
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     EnemyArray_D9,X
      JMP     loc_BANK0_8452

; ---------------------------------------------------------------------------

loc_BANK0_843B:
      LDA     NeedVerticalScroll
      LSR     A
      BCC     loc_BANK0_8452

loc_BANK0_8440:
      LDA     EnemyArray_D9,X
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_1
      LDA     EnemyArray_D9,X
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      ORA     byte_RAM_1

loc_BANK0_8450:
      STA     EnemyArray_D9,X

loc_BANK0_8452:
      LDA     EnemyArray_D9,X
      STA     PPUBuffer_301,Y
      INY
      DEX
      BPL     loc_BANK0_842B

      LDA     #1
      STA     byte_RAM_E4
      LSR     A
      STA     byte_RAM_539
      STA     PPUBuffer_301,Y
      STY     byte_RAM_300
      RTS

; End of function sub_BANK0_8412

; =============== S U B R O U T I N E =======================================

sub_BANK0_846A:
      LDA     byte_RAM_E1,X
      CLC
      ADC     #8
      STA     byte_RAM_E1,X
      BCC     locret_BANK0_8477

      LDA     #$C0
      STA     byte_RAM_E1,X

locret_BANK0_8477:
      RTS

; End of function sub_BANK0_846A

; =============== S U B R O U T I N E =======================================

sub_BANK0_8478:
      LDA     byte_RAM_E1,X
      SEC
      SBC     #8
      STA     byte_RAM_E1,X
      CMP     #$C0
      BCS     locret_BANK0_8487

      LDA     #$F8
      STA     byte_RAM_E1,X

locret_BANK0_8487:
      RTS

; End of function sub_BANK0_8478

; =============== S U B R O U T I N E =======================================

sub_BANK0_8488:
      LDA     byte_RAM_E3
      LSR     A
      TAY
      LDA     EnemyArray_D9,Y
      LSR     A
      LSR     A
      STA     EnemyArray_D9,Y
      LDA     byte_RAM_51B
      AND     #$C0
      ORA     EnemyArray_D9,Y
      STA     EnemyArray_D9,Y
      DEC     byte_RAM_E3
      RTS

; End of function sub_BANK0_8488

; ---------------------------------------------------------------------------

_code_04A2:
      LDX     #7
      LDA     #0

loc_BANK0_84A6:
      STA     EnemyArray_D9,X
      DEX
      BNE     loc_BANK0_84A6

      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK0_84AC:
      LDY     byte_RAM_D7
      LDA     (byte_RAM_E9),Y
      STA     byte_RAM_51B
      INC     byte_RAM_D7
      JMP     sub_BANK0_8488

; End of function sub_BANK0_84AC

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $84B8 - $84FF
      .pad $8500, $FF
ENDIF


; =============== S U B R O U T I N E =======================================

sub_BANK0_8500:
      LDA     byte_RAM_502
      BNE     loc_BANK0_855C

      LDA     #0
      JSR     ChangeNametableMirroring

      JSR     sub_BANK0_946D

      LDA     #0
      STA     PPUScrollYMirror
      LDA     CurrentLevelPage
      BNE     loc_BANK0_851A

      LDA     #9
      BNE     loc_BANK0_851D

loc_BANK0_851A:
      SEC
      SBC     #1

loc_BANK0_851D:
      ORA     #$D0
      STA     byte_RAM_CF
      SEC
      SBC     #$20
      STA     byte_RAM_CE
      LDA     CurrentLevelPage
      CLC
      ADC     #1
      CMP     #$A
      BNE     loc_BANK0_8532

      LDA     #0

loc_BANK0_8532:
      ORA     #$10
      STA     byte_RAM_D0
      LDA     CurrentLevelPage
      LDY     #1
      JSR     sub_BANK0_86EE

      INC     byte_RAM_502
      LDA     CurrentLevelPage
      STA     ScreenBoundaryLeftHi
      LDA     #1
      STA     byte_RAM_53A
      LSR     A
      STA     byte_RAM_6
      LDA     #$FF
      STA     byte_RAM_505
      LDA     #$F
      STA     byte_RAM_507
      JSR     sub_BANK0_856A

loc_BANK0_855C:
      JSR     sub_BANK0_87AA

      LDA     byte_RAM_53A
      BNE     locret_BANK0_8569

      STA     byte_RAM_502
      INC     byte_RAM_13

locret_BANK0_8569:
      RTS

; End of function sub_BANK0_8500

; =============== S U B R O U T I N E =======================================

sub_BANK0_856A:
      LDA     CurrentLevelPage
      BNE     loc_BANK0_8576

      LDA     byte_RAM_BA
      BMI     loc_BANK0_85E7

      LDA     CurrentLevelPage

loc_BANK0_8576:
      CMP     byte_RAM_53F
      BNE     loc_BANK0_857F

      LDA     byte_RAM_BA
      BPL     loc_BANK0_85E7

loc_BANK0_857F:
      LDX     #2
      LDA     byte_RAM_BA
      BPL     loc_BANK0_858B

      LDA     #$FF
      STA     byte_RAM_B
      BNE     loc_BANK0_858F

loc_BANK0_858B:
      LDA     #0
      STA     byte_RAM_B

loc_BANK0_858F:
      LDA     byte_RAM_BA
      AND     #$F0
      CLC
      ADC     byte_RAM_CE,X
      PHP
      ADC     byte_RAM_B
      PLP
      STA     word_RAM_C
      LDA     byte_RAM_B
      BNE     loc_BANK0_85B1

      BCC     loc_BANK0_85C2

      LDA     byte_RAM_CE,X
      AND     #$F
      CMP     #9
      BNE     loc_BANK0_85C2

      LDA     word_RAM_C
      AND     #$F0
      JMP     loc_BANK0_85C4

; ---------------------------------------------------------------------------

loc_BANK0_85B1:
      BCS     loc_BANK0_85C2

      LDA     byte_RAM_CE,X
      AND     #$F
      BNE     loc_BANK0_85C2

      LDA     word_RAM_C
      AND     #$F0
      ADC     #9
      JMP     loc_BANK0_85C4

; ---------------------------------------------------------------------------

loc_BANK0_85C2:
      LDA     word_RAM_C

loc_BANK0_85C4:
      STA     byte_RAM_CE,X
      DEX
      BPL     loc_BANK0_858F

      LDA     byte_RAM_BA
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      AND     #$F0
      STA     byte_RAM_536
      LDA     byte_RAM_BA
      BPL     loc_BANK0_85E7

      DEC     ScreenBoundaryLeftHi
      LDA     byte_RAM_C9
      EOR     #1
      STA     byte_RAM_C9
      LDA     #1
      STA     byte_RAM_507

loc_BANK0_85E7:
      LDA     #0
      STA     byte_RAM_BA
      RTS

; End of function sub_BANK0_856A

; =============== S U B R O U T I N E =======================================

sub_BANK0_85EC:
      LDA     #0
      STA     byte_RAM_51C
      LDA     byte_RAM_538
      BEQ     loc_BANK0_862C

      LDA     byte_RAM_538
      LSR     A
      BCS     loc_BANK0_8618

      LDX     #2
      STX     byte_RAM_9
      LDA     #$10
      STA     byte_RAM_1
      DEX
      LDA     byte_RAM_538
      STA     NeedVerticalScroll
      JSR     sub_BANK0_8901

      LDA     byte_RAM_3
      STA     byte_RAM_D0
      LDA     #0
      STA     byte_RAM_538
      BEQ     loc_BANK0_862C

loc_BANK0_8618:
      LDX     #1
      STX     byte_RAM_9
      DEX
      STX     byte_RAM_1
      LDA     byte_RAM_538
      STA     NeedVerticalScroll
      JSR     sub_BANK0_8901

      LDA     #0
      STA     byte_RAM_538

loc_BANK0_862C:
      LDA     byte_RAM_BA
      BNE     loc_BANK0_8631

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8631:
      LDA     byte_RAM_BA
      BPL     loc_BANK0_863C

      LDA     #1
      STA     NeedVerticalScroll
      JMP     loc_BANK0_869A

; ---------------------------------------------------------------------------

loc_BANK0_863C:
      LDA     #2
      STA     NeedVerticalScroll
      LDX     byte_RAM_BA

loc_BANK0_8642:
      LDA     PPUScrollXMirror
      BNE     loc_BANK0_8651

      LDA     ScreenBoundaryLeftHi
      CMP     byte_RAM_53F
      BNE     loc_BANK0_8651

      JMP     loc_BANK0_86E9

; ---------------------------------------------------------------------------

loc_BANK0_8651:
      LDA     PPUScrollXMirror
      CLC
      ADC     #1
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      BCC     loc_BANK0_8669

      INC     ScreenBoundaryLeftHi
      LDA     byte_RAM_C9
      EOR     #1
      STA     byte_RAM_C9
      ASL     A
      STA     byte_RAM_C8

loc_BANK0_8669:
      LDA     ScreenBoundaryLeftHi
      CMP     byte_RAM_53F
      BEQ     loc_BANK0_8685

      LDA     PPUScrollXMirror
      AND     #$F0
      CMP     byte_RAM_536
      BEQ     loc_BANK0_8682

      STA     byte_RAM_536
      LDA     #1
      STA     byte_RAM_51C

loc_BANK0_8682:
      DEX
      BNE     loc_BANK0_8642

loc_BANK0_8685:
      LDA     byte_RAM_51C
      BEQ     loc_BANK0_86E9

      LDX     #2

loc_BANK0_868C:
      JSR     loc_BANK0_87FC

      DEX
      BNE     loc_BANK0_868C

      LDX     #2
      JSR     sub_BANK0_8812

      JMP     loc_BANK0_86E6

; ---------------------------------------------------------------------------

loc_BANK0_869A:
      LDX     byte_RAM_BA

loc_BANK0_869C:
      LDA     PPUScrollXMirror
      BNE     loc_BANK0_86A8

      LDA     ScreenBoundaryLeftHi
      BNE     loc_BANK0_86A8

      JMP     loc_BANK0_86E9

; ---------------------------------------------------------------------------

loc_BANK0_86A8:
      LDA     PPUScrollXMirror
      SEC
      SBC     #1
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      BCS     loc_BANK0_86C0

      DEC     ScreenBoundaryLeftHi
      LDA     byte_RAM_C9
      EOR     #1
      STA     byte_RAM_C9
      ASL     A
      STA     byte_RAM_C8

loc_BANK0_86C0:
      LDA     PPUScrollXMirror
      AND     #$F0
      CMP     byte_RAM_536
      BEQ     loc_BANK0_86D1

      STA     byte_RAM_536
      LDA     #1
      STA     byte_RAM_51C

loc_BANK0_86D1:
      INX
      BNE     loc_BANK0_869C

      LDA     byte_RAM_51C
      BEQ     loc_BANK0_86E9

      LDX     #2

loc_BANK0_86DB:
      JSR     loc_BANK0_87E6

      DEX
      BNE     loc_BANK0_86DB

      LDX     #1
      JSR     sub_BANK0_8812

loc_BANK0_86E6:
      JSR     sub_BANK0_8872

loc_BANK0_86E9:
      LDA     #0
      STA     NeedVerticalScroll
      RTS

; End of function sub_BANK0_85EC

; =============== S U B R O U T I N E =======================================

sub_BANK0_86EE:
      LSR     A
      BCS     loc_BANK0_86FC

      LDA     #1
      STA     byte_RAM_C9
      ASL     A
      STA     byte_RAM_C8
      LDA     #$20
      BNE     loc_BANK0_8705

loc_BANK0_86FC:
      LDA     #0
      STA     byte_RAM_C9
      STA     byte_RAM_C8
      LDA     byte_BANK0_8709,Y

loc_BANK0_8705:
      STA     byte_RAM_506
      RTS

; End of function sub_BANK0_86EE

; ---------------------------------------------------------------------------
byte_BANK0_8709:
      .BYTE $28
      .BYTE $24
byte_BANK0_870B:
      .BYTE $0A

; =============== S U B R O U T I N E =======================================

sub_BANK0_870C:
      LDA     PPUScrollXMirror
      STA     byte_RAM_50A
      LDA     byte_RAM_C9
      STA     byte_RAM_50C
      LDA     ScreenBoundaryLeftHi
      STA     byte_RAM_514
      INC     byte_RAM_53D
      LDA     byte_BANK0_870B
      STA     CurrentLevelPage
      JSR     sub_BANK0_86EE

      LDA     #0
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      LDA     byte_BANK0_870B
      STA     ScreenBoundaryLeftHi
      JSR     sub_BANK0_946D

      LDA     byte_BANK0_870B
      STA     byte_RAM_CE
      LDA     #$E0
      STA     byte_RAM_506
      LDA     byte_BANK0_870B
      CLC
      ADC     #$F0
      STA     byte_RAM_505
      RTS

; End of function sub_BANK0_870C

; =============== S U B R O U T I N E =======================================

sub_BANK0_874C:
      LDA     byte_RAM_50A
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      LDA     byte_RAM_50C
      STA     byte_RAM_C9
      LDA     byte_RAM_514
      STA     ScreenBoundaryLeftHi
      LDA     byte_RAM_53D
      BNE     locret_BANK0_8784

      INC     byte_RAM_53E
      INC     byte_RAM_53D
      INC     byte_RAM_D5
      JSR     sub_BANK0_9428

      LDA     byte_RAM_CF
      STA     byte_RAM_CE
      LDA     #$10
      STA     byte_RAM_1
      LDA     #$F0
      STA     byte_RAM_506
      STA     byte_RAM_507
      LDA     byte_RAM_D0
      STA     byte_RAM_505

locret_BANK0_8784:
      RTS

; End of function sub_BANK0_874C

; =============== S U B R O U T I N E =======================================

sub_BANK0_8785:
      LDA     byte_RAM_CF
      STA     byte_RAM_CE
      LDA     #$10
      STA     byte_RAM_1
      LDA     #$F0
      STA     byte_RAM_506
      STA     byte_RAM_507
      LDA     byte_RAM_D0
      CLC
      ADC     #$10
      ADC     #0
      CMP     #$A
      BNE     loc_BANK0_87A2

      LDA     #0

loc_BANK0_87A2:
      STA     byte_RAM_505
      LDA     #1
      STA     byte_RAM_6
      RTS

; End of function sub_BANK0_8785

; =============== S U B R O U T I N E =======================================

sub_BANK0_87AA:
      LDX     #0
      STX     byte_RAM_537
      STX     byte_RAM_51C
      STX     NeedVerticalScroll
      JSR     sub_BANK0_8812

      JSR     sub_BANK0_8872

      LDA     byte_RAM_506
      CMP     byte_RAM_D1
      BNE     loc_BANK0_87DA

      LDA     byte_RAM_507
      CLC
      ADC     #1
      CMP     byte_RAM_D2
      BNE     loc_BANK0_87DA

loc_BANK0_87CB:
      LDA     #0
      STA     byte_RAM_53A
      STA     byte_RAM_53D
      STA     byte_RAM_53E
      INC     byte_RAM_537
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_87DA:
      LDA     byte_RAM_CE
      CMP     byte_RAM_505
      BEQ     loc_BANK0_87CB

      LDX     #0
      JMP     loc_BANK0_87FC

; ---------------------------------------------------------------------------

loc_BANK0_87E6:
      LDA     byte_RAM_CE,X
      SEC
      SBC     #$10
      STA     byte_RAM_CE,X
      BCS     locret_BANK0_87FB

      DEC     byte_RAM_CE,X
      LDA     byte_RAM_CE,X
      CMP     #$EF
      BNE     locret_BANK0_87FB

      LDA     #$F9
      STA     byte_RAM_CE,X

locret_BANK0_87FB:
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_87FC:
      LDA     byte_RAM_CE,X
      CLC
      ADC     #$10
      STA     byte_RAM_CE,X
      BCC     locret_BANK0_8811

      INC     byte_RAM_CE,X
      LDA     byte_RAM_CE,X
      CMP     #$A
      BNE     locret_BANK0_8811

      LDA     #0
      STA     byte_RAM_CE,X

locret_BANK0_8811:
      RTS

; End of function sub_BANK0_87AA

; =============== S U B R O U T I N E =======================================

sub_BANK0_8812:
      STY     byte_RAM_F
      LDA     byte_RAM_CE,X
      AND     #$F
      TAY
      LDA     byte_BANK1_BA5B,Y
      STA     byte_RAM_E9
      LDA     byte_BANK1_BA66,Y
      STA     byte_RAM_EA
      LDA     byte_RAM_CE,X
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_D7
      ASL     A
      STA     byte_RAM_D2
      LDY     #$20
      LDA     byte_RAM_CE,X
      LSR     A
      BCS     loc_BANK0_8837

      LDY     #$24

loc_BANK0_8837:
      STY     byte_RAM_D1
      LDY     byte_RAM_F
      RTS

; End of function sub_BANK0_8812

; =============== S U B R O U T I N E =======================================

sub_BANK0_883C:
      STX     byte_RAM_8
      LDX     byte_RAM_9
      LDY     #2
      LDA     byte_RAM_CE,X
      STA     byte_RAM_3
      SEC
      SBC     byte_RAM_1
      STA     byte_RAM_CE,X
      JSR     sub_BANK0_8812

      LDA     #7
      STA     byte_RAM_E3
      LDA     #0
      STA     byte_RAM_D6

loc_BANK0_8856:
      JSR     sub_BANK0_8925

      LDA     byte_RAM_E3
      BPL     loc_BANK0_8856

      LDA     byte_RAM_D2
      AND     #$1C
      LSR     A
      LSR     A
      ORA     #$C0
      STA     byte_RAM_3BD
      LDA     byte_RAM_D1
      ORA     #3
      STA     byte_RAM_3BC
      LDX     byte_RAM_8
      RTS

; End of function sub_BANK0_883C

; =============== S U B R O U T I N E =======================================

sub_BANK0_8872:
      LDA     #$F
      STA     byte_RAM_E3
      LDA     #0
      STA     byte_RAM_D6
      STA     byte_RAM_D5
      TAX

loc_BANK0_887D:
      LDY     byte_RAM_D7
      LDA     (byte_RAM_E9),Y
      STA     byte_RAM_51B
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      TAY
      LDA     TileQuadPointersLo,Y
      STA     byte_RAM_0
      LDA     TileQuadPointersHi,Y
      STA     byte_RAM_1

loc_BANK0_8894:
      LDY     byte_RAM_D7
      LDA     (byte_RAM_E9),Y
      ASL     A
      ASL     A
      TAY
      LDA     byte_RAM_D5
      BEQ     loc_BANK0_88A0

      INY

loc_BANK0_88A0:
      LDA     (byte_RAM_0),Y
      STA     unk_RAM_380,X
      INY
      LDA     (byte_RAM_0),Y
      STA     unk_RAM_39E,X
      INY
      LDA     (byte_RAM_0),Y
      STA     unk_RAM_381,X
      INY
      LDA     (byte_RAM_0),Y
      STA     unk_RAM_39F,X
      INC     byte_RAM_D6
      INX
      INX
      LDA     byte_RAM_D7
      CLC
      ADC     #$10
      STA     byte_RAM_D7
      LDA     byte_RAM_D6
      CMP     #$F
      BCC     loc_BANK0_887D

      LDA     #0
      STA     byte_RAM_3BC
      LDA     NeedVerticalScroll
      LSR     A
      BCS     loc_BANK0_88F2

      LDA     byte_RAM_D2
      AND     #2
      BEQ     loc_BANK0_88FD

      LDA     NeedVerticalScroll
      BNE     loc_BANK0_88F8

      LDA     #$10
      STA     byte_RAM_1
      LDX     #0
      STX     byte_RAM_9
      INX
      JSR     sub_BANK0_8901

      LDA     byte_RAM_3
      STA     byte_RAM_CE
      JSR     sub_BANK0_8812

      JMP     loc_BANK0_88FD

; ---------------------------------------------------------------------------

loc_BANK0_88F2:
      LDA     byte_RAM_D2
      AND     #2
      BNE     loc_BANK0_88FD

loc_BANK0_88F8:
      LDA     NeedVerticalScroll
      STA     byte_RAM_538

loc_BANK0_88FD:
      INC     byte_RAM_51C
      RTS

; End of function sub_BANK0_8872

; =============== S U B R O U T I N E =======================================

sub_BANK0_8901:
      JSR     sub_BANK0_883C

      LDX     #7
      STX     byte_RAM_E
      LDY     #0

loc_BANK0_890A:
      LDX     byte_RAM_E
      LDA     EnemyArray_D9,X
      STA     unk_RAM_3BE,Y
      INY
      DEX
      DEX
      DEX
      DEX
      LDA     EnemyArray_D9,X
      STA     unk_RAM_3BE,Y
      INY
      DEC     byte_RAM_E
      LDA     byte_RAM_E
      CMP     #3
      BNE     loc_BANK0_890A

      RTS

; End of function sub_BANK0_8901

; =============== S U B R O U T I N E =======================================

sub_BANK0_8925:
      STY     byte_RAM_F
      LDA     #1
      STA     byte_RAM_4
      LDY     byte_RAM_D7
      LDX     byte_RAM_E3

loc_BANK0_892F:
      LDA     EnemyArray_D9,X
      LSR     A
      LSR     A
      STA     EnemyArray_D9,X
      LDA     (byte_RAM_E9),Y
      AND     #$C0
      ORA     EnemyArray_D9,X
      STA     EnemyArray_D9,X
      INY
      LDA     EnemyArray_D9,X
      LSR     A
      LSR     A
      STA     EnemyArray_D9,X
      LDA     (byte_RAM_E9),Y
      AND     #$C0
      ORA     EnemyArray_D9,X
      STA     EnemyArray_D9,X
      LDA     byte_RAM_D7
      CLC
      ADC     #$10
      TAY
      STA     byte_RAM_D7
      DEC     byte_RAM_4
      BPL     loc_BANK0_892F

      DEC     byte_RAM_E3
      LDY     byte_RAM_F
      RTS

; End of function sub_BANK0_8925

; =============== S U B R O U T I N E =======================================

sub_BANK0_895D:
      LDX     #7

loc_BANK0_895F:
      STA     byte_RAM_41B,X
      DEX
      BPL     loc_BANK0_895F

      RTS

; End of function sub_BANK0_895D

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $8966 - $89FF
      .pad $8A00, $FF
ENDIF

GrowShrinkSFXIndexes:
      .BYTE SoundEffect2_Shrinking, SoundEffect2_Growing ; ---------------------------------------------------------------------------

HandlePlayerState:
      LDA     PlayerState ; Handles player states?
      CMP     #PlayerState_Lifting
      BCS     loc_BANK0_8A26 ; If the player is changing size, just handle that

      LDA     #$00 ; Check if the player needs to change size
      LDY     #$10
      CPY     PlayerHealth
      ROL     A
      EOR     PlayerCurrentSize
      BEQ     loc_BANK0_8A26

      LDY     PlayerCurrentSize
      LDA     GrowShrinkSFXIndexes,Y
      STA     SoundEffectQueue2
      LDA     #$1E
      STA     PlayerStateTimer
      LDA     #PlayerState_ChangingSize
      STA     PlayerState

loc_BANK0_8A26:
      LDA     #0
      STA     PlayerAttributesMaybe
      LDA     PlayerState
      JSR     JumpToTableAfterJump ; Player state handling?

; ---------------------------------------------------------------------------
      .WORD HandlePlayerState_Normal ; Normal
      .WORD HandlePlayerState_Climbing ; Climbing
      .WORD HandlePlayerState_Lifting ; Lifting
      .WORD HandlePlayerState_ClimbingAreaTransition ; Climbing area transition
      .WORD HandlePlayerState_GoingDownJar ; Going down jar
      .WORD HandlePlayerState_ExitingJar ; Exiting jar
      .WORD HandlePlayerState_HawkmouthEating ; Hawkmouth eating
      .WORD HandlePlayerState_Dying ; Dying
      .WORD HandlePlayerState_ChangingSize ; Changing size
; ---------------------------------------------------------------------------

HandlePlayerState_Normal:
      JSR     sub_BANK0_8CD9

      JSR     sub_BANK0_8C1A

      JSR     sub_BANK0_8EFA

      JSR     sub_BANK0_9316

      JSR     sub_BANK0_8EA4

; =============== S U B R O U T I N E =======================================

sub_BANK0_8A50:
      LDX     #0
      JSR     sub_BANK0_8EA6

      LDA     IsHorizontalLevel
      BNE     locret_BANK0_8A5B

      STA     PlayerXHi

locret_BANK0_8A5B:
      RTS

; End of function sub_BANK0_8A50

; ---------------------------------------------------------------------------

HandlePlayerState_Dying:
      LDA     PlayerStateTimer
      BNE     locret_BANK0_8A86

      LDA     PlayerScreenYHi
      CMP     #2
      BEQ     LoseALife

      JSR     sub_BANK0_8EA4

      LDA     PlayerYAccel
      BMI     loc_BANK0_8A72

      CMP     #$39
      BCS     locret_BANK0_8A86

loc_BANK0_8A72:
      INC     PlayerYAccel
      INC     PlayerYAccel
      RTS

; ---------------------------------------------------------------------------

LoseALife:
      LDA     #2
      STA     PlayerAnimationFrame
      LDY     #$01 ; Set game mode to title card
      DEC     ExtraLives
      BNE     SetGameModeAfterDeath

      INY ; If no lives, increase game mode
; from 1 (title card) to 2 (game over)

SetGameModeAfterDeath:
      STY     GameMode

locret_BANK0_8A86:
      RTS

; ---------------------------------------------------------------------------

HandlePlayerState_Lifting:
      LDA     PlayerStateTimer
      BNE     locret_BANK0_8AC1

      LDX     byte_RAM_42D
      LDY     ObjectBeingCarriedTimer,X
      CPY     #2
      BCC     loc_BANK0_8ABB

      CPY     #7
      BNE     loc_BANK0_8A9D

      LDA     #DPCM_ItemPull
      STA     DPCMQueue

loc_BANK0_8A9D:
      DEC     ObjectBeingCarriedTimer,X
      LDA     PlayerLiftFrames,Y
      STA     PlayerAnimationFrame
      LDA     EnemyState,X
      CMP     #6
      BEQ     loc_BANK0_8AB0

      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      BNE     loc_BANK0_8AB5

loc_BANK0_8AB0:
      LDA     loc_BANK0_8ABF+1,Y
      BPL     loc_BANK0_8AB8

loc_BANK0_8AB5:
      LDA     byte_RAM_544,Y

loc_BANK0_8AB8:
      STA     PlayerStateTimer
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8ABB:
      STA     PlayerState
      INC     PlayerInAir

loc_BANK0_8ABF:
      INC     PlayerDucking

locret_BANK0_8AC1:
      RTS

; ---------------------------------------------------------------------------
      .BYTE $00
      .BYTE $01
      .BYTE $01
      .BYTE $01

PlayerLiftFrames:
      .BYTE $01
      .BYTE $02
      .BYTE $04
      .BYTE $04
      .BYTE $04
      .BYTE $04
      .BYTE $08
      .BYTE $08

byte_BANK0_8ACE:
      .BYTE $00
      .BYTE $10
      .BYTE $F0
; ---------------------------------------------------------------------------

HandlePlayerState_Climbing:
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Down|ControllerInput_Up
      LSR     A
      LSR     A
      TAY
      CPY     #2
      BNE     loc_BANK0_8ADF

      JSR     sub_BANK0_8B19

loc_BANK0_8ADF:
      LDA     byte_BANKF_F225,Y
      STA     PlayerYAccel
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Right|ControllerInput_Left
      TAY
      LDA     byte_BANK0_8ACE,Y
      STA     PlayerXAccel
      LDA     PlayerXLo
      CLC
      ADC     #4
      AND     #$F
      CMP     #8
      BCS     loc_BANK0_8B14

      LDY     byte_BANKF_F00B
      LDA     PlayerYAccel
      BMI     loc_BANK0_8B01

      INY

loc_BANK0_8B01:
      LDX     #0
      JSR     sub_BANK0_8B35

      BCS     loc_BANK0_8B0E

loc_BANK0_8B08:
      LDA     PlayerYAccel
      BPL     loc_BANK0_8B14

      STX     PlayerYAccel

loc_BANK0_8B0E:
      JSR     sub_BANK0_8A50

      JMP     sub_BANK0_8EA4

; ---------------------------------------------------------------------------

loc_BANK0_8B14:
      LDA     #0
      STA     PlayerState
      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK0_8B19:
      LDA     byte_RAM_10
      AND     #7
      BNE     locret_BANK0_8B2A

      LDA     byte_RAM_9D
      EOR     #1
      STA     byte_RAM_9D
      LDA     #SoundEffect2_Climbing
      STA     SoundEffectQueue2

locret_BANK0_8B2A:
      RTS

; End of function sub_BANK0_8B19

; ---------------------------------------------------------------------------
byte_BANK0_8B2B:
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

sub_BANK0_8B35:
      JSR     sub_BANK0_924F

      LDA     byte_RAM_0
      LDY     #9

loc_BANK0_8B3C:
      CMP     byte_BANK0_8B2B,Y
      BEQ     locret_BANK0_8B45

      DEY
      BPL     loc_BANK0_8B3C

      CLC

locret_BANK0_8B45:
      RTS

; End of function sub_BANK0_8B35

; ---------------------------------------------------------------------------

HandlePlayerState_GoingDownJar:
      LDA     #$20
      STA     PlayerAttributesMaybe
      INC     PlayerYLo
      LDA     PlayerYLo
      AND     #$F
      BNE     locret_BANK0_8B77

      STA     PlayerState
      JSR     sub_BANKF_F6DA

      PLA
      PLA
      JSR     sub_BANK0_940E

      LDA     #$02
      STA     TransitionType
      LDA     byte_RAM_4EE
      BNE     loc_BANK0_8B6C

      LDA     #GameMode_Warp
      STA     GameMode
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8B6C:
      CMP     #1
      BEQ     loc_BANK0_8B74

      STA     byte_RAM_627
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8B74:
      STA     InSubspaceOrJar

locret_BANK0_8B77:
      RTS

; ---------------------------------------------------------------------------

HandlePlayerState_ExitingJar:
      LDA     #$20
      STA     PlayerAttributesMaybe
      DEC     PlayerYLo
      LDA     PlayerYLo
      AND     #$F
      BNE     locret_BANK0_8B86

      STA     PlayerState

locret_BANK0_8B86:
      RTS

; ---------------------------------------------------------------------------
byte_BANK0_8B87:
      .BYTE $00

      .BYTE $FF
byte_BANK0_8B89:
      .BYTE $EE

      .BYTE $DE
byte_BANK0_8B8B:
      .BYTE $09

      .BYTE $A1
; ---------------------------------------------------------------------------

HandlePlayerState_ClimbingAreaTransition:
      LDA     PlayerYAccel
      ASL     A
      ROL     A
      AND     #1
      TAY
      LDA     PlayerScreenYHi
      CMP     byte_BANK0_8B87,Y
      BNE     loc_BANK0_8BB0

      LDA     PlayerScreenYLo
      CMP     byte_BANK0_8B89,Y
      BNE     loc_BANK0_8BB0

      JSR     sub_BANKF_F6DA

      INC     byte_RAM_627
      LDA     #3
      STA     TransitionType
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8BB0:
      LDA     PlayerScreenYHi
      BNE     loc_BANK0_8BBD

      LDA     PlayerScreenYLo
      CMP     byte_BANK0_8B8B,Y
      BEQ     loc_BANK0_8BC6

loc_BANK0_8BBD:
      TYA
      BEQ     loc_BANK0_8BC3

      JSR     sub_BANK0_8B19

loc_BANK0_8BC3:
      JMP     sub_BANK0_8EA4

; ---------------------------------------------------------------------------

loc_BANK0_8BC6:
      LDA     #PlayerState_Climbing
      STA     PlayerState
      RTS

; ---------------------------------------------------------------------------

HandlePlayerState_HawkmouthEating:
      LDA     PlayerStateTimer
      BEQ     loc_BANK0_8BE9

      JSR     sub_BANK0_8EA4

IFDEF COMPATIBILITY
      .db $ad, $5a, $00 ; LDA $0000 + PlayerCollision
ENDIF
IFNDEF COMPATIBILITY
      LDA     PlayerCollision ; Absolute address for zero-page
      NOP ; Alignment fix
ENDIF

      BEQ     locret_BANK0_8BEB

      LDA     #$20
      STA     PlayerAttributesMaybe
      LDA     #4
      STA     PlayerXAccel
      LDA     #1
      STA     byte_RAM_9D

loc_BANK0_8BE3:
      JSR     sub_BANK0_8A50

      JMP     PlayerWalkJumpAnim

; ---------------------------------------------------------------------------

loc_BANK0_8BE9:
      STA     PlayerState

locret_BANK0_8BEB:
      RTS

; ---------------------------------------------------------------------------
byte_BANK0_8BEC:
      .BYTE $05

      .BYTE $0A
      .BYTE $0F
      .BYTE $14
      .BYTE $19
; ---------------------------------------------------------------------------

HandlePlayerState_ChangingSize:
      LDA     PlayerStateTimer
      BEQ     loc_BANK0_8C0D

      INC     DamageInvulnTime
      LDY     #4

loc_BANK0_8BF9:
      CMP     byte_BANK0_8BEC,Y
      BNE     loc_BANK0_8C09

      LDA     PlayerCurrentSize
      EOR     #1

loc_BANK0_8C03:
      STA     PlayerCurrentSize
      JMP     LoadCharacterCHRBanks

; ---------------------------------------------------------------------------

loc_BANK0_8C09:
      DEY
      BPL     loc_BANK0_8BF9

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8C0D:
      LDY     PlayerAnimationFrame
      CPY     #$0A
      BNE     loc_BANK0_8C15

      LDA     #PlayerState_Climbing

loc_BANK0_8C15:
      STA     PlayerState
      RTS

; ---------------------------------------------------------------------------
byte_BANK0_8C18:
      .BYTE $FE

      .BYTE $02

; =============== S U B R O U T I N E =======================================

; player crouch subroutine
sub_BANK0_8C1A:
      JSR     PlayerWalkJumpAnim

      LDA     PlayerInAir
      BNE     ResetPartialCrouchJumpTimer

      LDA     PlayerDucking
      BEQ     loc_BANK0_8C2B

      LDA     PlayerStateTimer
      BNE     loc_BANK0_8C92

      DEC     PlayerDucking

loc_BANK0_8C2B:
      LDA     Player1JoypadPress
      BPL     loc_BANK0_8C3D ; branch if not pressing A Button

      INC     PlayerInAir
      LDA     #SpriteAnimation_Jumping
      STA     PlayerAnimationFrame
      JSR     sub_BANK0_8C99

      LDA     #SoundEffect2_Jump
      STA     SoundEffectQueue2

loc_BANK0_8C3D:
      LDA     byte_RAM_4B2
      BNE     loc_BANK0_8C92

      LDA     byte_RAM_4DF
      BNE     ResetPartialCrouchJumpTimer

      LDA     Player1JoypadHeld ; skip if down button is not pressed
      AND     #ControllerInput_Down
      BEQ     ResetPartialCrouchJumpTimer

      INC     PlayerDucking ; set ducking state?
      LDA     #SpriteAnimation_Ducking ; set ducking animation
      STA     PlayerAnimationFrame
      LDA     PlayerInAir ; skip ahead if player is in air
      BNE     ResetPartialCrouchJumpTimer

      LDA     CrouchJumpTimer ; check if crouch jump is charged
      CMP     #$3C
      BCS     loc_BANK0_8C92

      INC     CrouchJumpTimer ; increment crouch jump charge
      BNE     loc_BANK0_8C92

ResetPartialCrouchJumpTimer: ; reset crouch jump timer if it isn't full
      LDA     CrouchJumpTimer
      CMP     #$3C ; max crouch jump timer
      BCS     loc_BANK0_8C6F

      LDA     #$00 ; reset crouch jump timer to zero
      STA     CrouchJumpTimer

loc_BANK0_8C6F:
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Right|ControllerInput_Left
      BEQ     loc_BANK0_8C92

      AND     #1
      STA     byte_RAM_9D
      TAY
      LDA     byte_RAM_624
      LSR     A
      LSR     A
      AND     byte_RAM_10
      BNE     ResetCrouchJumpTimer

      LDA     PlayerXAccel
      CLC
      ADC     byte_BANK0_8C18,Y
      STA     PlayerXAccel

ResetCrouchJumpTimer:
      LDA     #0
      STA     CrouchJumpTimer
      BEQ     loc_BANK0_8C95 ; unconditional branch?

loc_BANK0_8C92:
      JSR     sub_BANK0_8D2C

loc_BANK0_8C95:
      JSR     sub_BANK0_8DC0

      RTS

; End of function sub_BANK0_8C1A

; =============== S U B R O U T I N E =======================================

sub_BANK0_8C99:
      LDA     byte_RAM_4DF
      CMP     #2
      BCC     loc_BANK0_8CA7

      LDA     byte_RAM_552
      STA     PlayerYAccel
      BNE     loc_BANK0_8CD3

loc_BANK0_8CA7:
      LDA     PlayerXAccel
      BPL     loc_BANK0_8CB0

      EOR     #$FF
      CLC

loc_BANK0_8CAE:
      ADC     #1

loc_BANK0_8CB0:
      CMP     #8
      LDA     #0
      STA     ObjectYSubpixel
      ROL     A
      LDY     CrouchJumpTimer
      CPY     #$3C
      BCC     loc_BANK0_8CC3

      LDA     #0
      STA     Player1JoypadHeld

loc_BANK0_8CC3:
      ROL     A
      ASL     A
      ORA     HoldingItem
      TAY
      LDA     unk_RAM_54C,Y
      STA     PlayerYAccel
      LDA     JumpFloatLength
      STA     byte_RAM_4C9

loc_BANK0_8CD3:
      LDA     #0
      STA     CrouchJumpTimer
      RTS

; End of function sub_BANK0_8C99

; =============== S U B R O U T I N E =======================================

sub_BANK0_8CD9:
      LDA     byte_RAM_4DF
      CMP     #2
      BCC     loc_BANK0_8CE5

      LDA     byte_RAM_556
      BNE     loc_BANK0_8D13

loc_BANK0_8CE5:
      LDA     byte_RAM_554
      LDY     Player1JoypadHeld ; holding jump button to fight physics
      BPL     loc_BANK0_8D0B

      LDA     JumpPhysicsShit
      LDY     PlayerYAccel
      CPY     #$FC
      BMI     loc_BANK0_8D0B

      LDY     byte_RAM_4C9

loc_BANK0_8CF8:
      BEQ     loc_BANK0_8D0B

      DEC     byte_RAM_4C9
      LDA     byte_RAM_10
      LSR     A
      LSR     A
      LSR     A
      AND     #3
      TAY
      LDA     byte_BANK0_8D26,Y
      STA     PlayerYAccel
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8D0B:
      LDY     PlayerYAccel
      BMI     loc_BANK0_8D13

      CPY     #$39
      BCS     loc_BANK0_8D18

loc_BANK0_8D13:
      CLC
      ADC     PlayerYAccel
      STA     PlayerYAccel

loc_BANK0_8D18:
      LDA     byte_RAM_4C9
      CMP     JumpFloatLength
      BEQ     locret_BANK0_8D25

      LDA     #0
      STA     byte_RAM_4C9

locret_BANK0_8D25:
      RTS

; End of function sub_BANK0_8CD9

; ---------------------------------------------------------------------------
byte_BANK0_8D26:
      .BYTE $FC

      .BYTE $00
      .BYTE $04
      .BYTE $00
byte_BANK0_8D2A:
      .BYTE $FD

      .BYTE $03

; =============== S U B R O U T I N E =======================================

sub_BANK0_8D2C:
      LDA     PlayerInAir
      BNE     locret_BANK0_8D61

      LDA     byte_RAM_10
      AND     byte_RAM_624
      BNE     loc_BANK0_8D4D

      LDA     PlayerXAccel
      AND     #$80
      ASL     A
      ROL     A
      TAY
      LDA     PlayerXAccel
      ADC     byte_BANK0_8D2A,Y
      TAX
      EOR     byte_BANK0_8C18,Y
      BMI     loc_BANK0_8D4B

      LDX     #0

loc_BANK0_8D4B:
      STX     PlayerXAccel

loc_BANK0_8D4D:
      LDA     PlayerDucking
      BNE     locret_BANK0_8D61

      LDA     PlayerAnimationFrame
      CMP     #SpriteAnimation_Throwing
      BEQ     locret_BANK0_8D61

      LDA     #SpriteAnimation_Standing
      STA     PlayerAnimationFrame
      LDA     #0
      STA     PlayerWalkFrameCounter

loc_BANK0_8D5F:
      STA     PlayerWalkFrame

locret_BANK0_8D61:
      RTS

; End of function sub_BANK0_8D2C

; ---------------------------------------------------------------------------
PlayerWalkFrameDurations:
      .BYTE $0C
      .BYTE $0A
      .BYTE $08
      .BYTE $05
      .BYTE $03
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $02
PlayerWalkFrames:
      .BYTE SpriteAnimation_Standing ; $00
      .BYTE SpriteAnimation_Walking ; $01
      .BYTE SpriteAnimation_Throwing ; ; $02

; =============== S U B R O U T I N E =======================================

; jump animation subroutine
PlayerWalkJumpAnim:
      LDA     PlayerDucking ; exit if we're ducking, since the player will be ducking
      BNE     ExitPlayerWalkJumpAnim

; if we're not in the air, skip ahead
      LDA     PlayerInAir
      BEQ     PlayerWalkAnim

      LDA     CurrentCharacter ; does this character get to flutter jump?
      CMP     #Character_Luigi
      BNE     ExitPlayerWalkJumpAnim

      LDA     PlayerWalkFrameCounter
      BNE     UpdatePlayerAnimationFrame ; maintain current frame

      LDA     #$02 ; fast animation
      BNE     NextPlayerWalkFrame

PlayerWalkAnim:
      LDA     PlayerWalkFrameCounter
      BNE     UpdatePlayerAnimationFrame ; maintain current frame

      LDA     #$05
      LDY     byte_RAM_624
      BNE     NextPlayerWalkFrame

      LDA     PlayerXAccel
      BPL     PlayerWalkFrameDuration

; use absolute value of PlayerXAccel
      EOR     #$FF
      CLC
      ADC     #$01

PlayerWalkFrameDuration:
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     PlayerWalkFrameDurations,Y

NextPlayerWalkFrame:
      STA     PlayerWalkFrameCounter ; hold frame for duration specified in accumulator
      DEC     PlayerWalkFrame
      BPL     UpdatePlayerAnimationFrame

      LDA     #$01 ; next walk frame
      STA     PlayerWalkFrame

UpdatePlayerAnimationFrame:
      LDY     PlayerWalkFrame
      LDA     PlayerWalkFrames,Y
      STA     PlayerAnimationFrame

ExitPlayerWalkJumpAnim:
      RTS

; End of function PlayerWalkJumpAnim

; ---------------------------------------------------------------------------
byte_BANK0_8DB2:
      .BYTE $00

      .BYTE $00
      .BYTE $D0
      .BYTE $30
      .BYTE $D0
      .BYTE $30
      .BYTE $D0
      .BYTE $30
byte_BANK0_8DBA:
      .BYTE $18

      .BYTE $00
      .BYTE $18
      .BYTE $F8
byte_BANK0_8DBE:
      .BYTE $F0

      .BYTE $10

; =============== S U B R O U T I N E =======================================

sub_BANK0_8DC0:
      LDY     #2
      LDA     byte_RAM_4DF
      CMP     #2
      BCS     loc_BANK0_8DE0

      DEY
      LDA     HoldingItem
      BEQ     loc_BANK0_8DDF

      LDX     byte_RAM_42D
      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      BCC     loc_BANK0_8DE0

      CMP     #$39
      BCC     loc_BANK0_8DDF

      CMP     #$3B
      BCC     loc_BANK0_8DE0

loc_BANK0_8DDF:
      DEY

loc_BANK0_8DE0:
      LDA     unk_RAM_557,Y
      BIT     Player1JoypadHeld
      BVC     loc_BANK0_8DEC

      LSR     A
      CLC
      ADC     unk_RAM_557,Y

loc_BANK0_8DEC:
      CMP     PlayerXAccel
      BPL     loc_BANK0_8DF2

      STA     PlayerXAccel

loc_BANK0_8DF2:
      LDA     unk_RAM_55A,Y
      BIT     Player1JoypadHeld
      BVC     loc_BANK0_8DFF

      SEC
      ROR     A
      CLC
      ADC     unk_RAM_55A,Y

loc_BANK0_8DFF:
      CMP     PlayerXAccel
      BMI     loc_BANK0_8E05

      STA     PlayerXAccel

loc_BANK0_8E05:
      BIT     Player1JoypadPress
      BVC     locret_BANK0_8E41

      LDA     HoldingItem
      BEQ     locret_BANK0_8E41

      LDY     #0
      LDX     byte_RAM_42D

loc_BANK0_8E12:
      LDA     EnemyState,X
      CMP     #EnemyState_6
      BEQ     locret_BANK0_8E41

      LDA     ObjectType,X
      CMP     #Enemy_MushroomBlock
      BCC     loc_BANK0_8E22

      CMP     #Enemy_POWBlock
      BCC     loc_BANK0_8E28

loc_BANK0_8E22:
      CMP     #Enemy_Bomb
      BCC     loc_BANK0_8E42

      LDY     #2

loc_BANK0_8E28:
      STY     byte_RAM_7
      LDA     byte_RAM_9D
      ASL     A
      ORA     PlayerDucking
      TAX
      LDY     byte_BANKF_F006,X
      LDX     #0
      JSR     sub_BANK0_924F

      LDA     byte_RAM_0
      LDY     byte_RAM_7
      JSR     sub_BANK0_9053

      BCC     loc_BANK0_8E42

locret_BANK0_8E41:
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8E42:
      LDA     #SpriteAnimation_Throwing
      STA     PlayerAnimationFrame
      LDA     #2
      STA     PlayerWalkFrame
      LDA     #$A
      STA     PlayerWalkFrameCounter
      DEC     HoldingItem
      LDA     #SoundEffect1_ThrowItem
      STA     SoundEffectQueue1
      LDA     #0
      STA     PlayerDucking
      STA     Player1JoypadPress
      STA     byte_RAM_1
      LDX     byte_RAM_42D
      LDA     #Enemy_Coin
      CMP     ObjectType,X
      ROL     byte_RAM_1
      LDA     PlayerXAccel
      BPL     loc_BANK0_8E6F

      EOR     #$FF
      CLC
      ADC     #1

loc_BANK0_8E6F:
      CMP     #8
      ROL     byte_RAM_1
      BNE     loc_BANK0_8E89

      LDY     byte_RAM_9D
      LDA     byte_BANK0_8DBE,Y
      CLC
      ADC     ObjectXLo,X
      STA     ObjectXLo,X
      LDA     IsHorizontalLevel
      BEQ     loc_BANK0_8E89

      DEY
      TYA
      ADC     ObjectXHi,X

loc_BANK0_8E87:
      STA     ObjectXHi,X

loc_BANK0_8E89:
      LDY     byte_RAM_1
      LDA     byte_BANK0_8DBA,Y
      STA     ObjectYAccel,X
      LDA     byte_RAM_1
      ASL     A
      ORA     byte_RAM_9D
      TAY
      LDA     byte_BANK0_8DB2,Y
      STA     ObjectXAccel,X
      LDA     #1
      STA     EnemyArray_42F,X
      LSR     A
      STA     ObjectBeingCarriedTimer,X
      RTS

; End of function sub_BANK0_8DC0

; =============== S U B R O U T I N E =======================================

sub_BANK0_8EA4:
      LDX     #$A

; End of function sub_BANK0_8EA4

; =============== S U B R O U T I N E =======================================

sub_BANK0_8EA6:
      LDA     PlayerXAccel,X
      CLC
      ADC     byte_RAM_4CB,X
      PHP
      BPL     loc_BANK0_8EB4

      EOR     #$FF
      CLC
      ADC     #1

loc_BANK0_8EB4:
      PHA
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      TAY
      PLA
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      CLC

loc_BANK0_8EC0:
      ADC     ObjectXSubpixel,X
      STA     ObjectXSubpixel,X
      TYA
      ADC     #0
      PLP
      BPL     loc_BANK0_8ED1

      EOR     #$FF
      CLC
      ADC     #1

loc_BANK0_8ED1:
      LDY     #0
      CMP     #0
      BPL     loc_BANK0_8ED8

      DEY

loc_BANK0_8ED8:
      CLC
      ADC     PlayerXLo,X
      STA     PlayerXLo,X
      TYA
      ADC     PlayerXHi,X
      STA     PlayerXHi,X
      LDA     #0
      STA     byte_RAM_4CB,X
      RTS

; End of function sub_BANK0_8EA6

; ---------------------------------------------------------------------------
byte_BANK0_8EE8:
      .BYTE $02

      .BYTE $02
      .BYTE $01
      .BYTE $01
      .BYTE $02
      .BYTE $02
      .BYTE $02
      .BYTE $02
CollisionFlagTableThing:
      .BYTE CollisionFlags_Up
      .BYTE CollisionFlags_Up
      .BYTE CollisionFlags_Down
      .BYTE CollisionFlags_Down
      .BYTE CollisionFlags_Left
      .BYTE CollisionFlags_Left
      .BYTE CollisionFlags_Right
      .BYTE CollisionFlags_Right
byte_BANK0_8EF8:
      .BYTE $F0

      .BYTE $10

; =============== S U B R O U T I N E =======================================

sub_BANK0_8EFA:
      LDA     #$00
      STA     PlayerCollision
      STA     byte_RAM_624
      STA     byte_RAM_7
      STA     byte_RAM_A
      STA     byte_RAM_E
      STA     word_RAM_C
      JSR     sub_BANK0_8FFD

loc_BANK0_8F0C:
      LDA     PlayerDucking
      ASL     A
      ORA     HoldingItem
      TAX
      LDA     byte_BANKF_F000,X
      STA     byte_RAM_8
      LDA     PlayerYAccel
      CLC
      ADC     byte_RAM_4D5
      BPL     loc_BANK0_8F2B

      JSR     sub_BANK0_8FB2

      JSR     sub_BANK0_8FF5

      LDA     PlayerCollision
      BNE     loc_BANK0_8F7A

      BEQ     loc_BANK0_8F95

loc_BANK0_8F2B:
      JSR     sub_BANK0_8FF5

      JSR     sub_BANK0_8FB2

      LDA     PlayerCollision
      BNE     loc_BANK0_8F4F

      LDA     #0
      LDX     #1
      LDY     CurrentWorld
      CPY     #1
      BEQ     loc_BANK0_8F44

      CPY     #5
      BNE     loc_BANK0_8F47

loc_BANK0_8F44:
      JSR     sub_BANK1_BA7C

loc_BANK0_8F47:
      STA     byte_RAM_4DF
      STX     PlayerInAir
      JMP     loc_BANK0_8F95

; ---------------------------------------------------------------------------

loc_BANK0_8F4F:
      LDA     #0

loc_BANK0_8F51:
      STA     byte_RAM_4DF
      LDA     PlayerYLo
      AND     #$C
      BNE     loc_BANK0_8F95

      STA     PlayerInAir
      LDA     PlayerYLo
      AND     #$F0
      STA     PlayerYLo
      LSR     byte_RAM_A
      BCC     loc_BANK0_8F6E

      LDX     byte_RAM_A
      LDA     byte_BANK0_8EF8,X
      STA     byte_RAM_4CB

loc_BANK0_8F6E:
      LSR     word_RAM_C
      BCC     loc_BANK0_8F77

      LDA     #$F
      STA     byte_RAM_624

loc_BANK0_8F77:
      JSR     sub_BANK0_910C

loc_BANK0_8F7A:
      LDA     #0
      STA     PlayerYAccel
      STA     byte_RAM_4D5
      LDA     StarInvincibilityTimer
      BNE     loc_BANK0_8F95

      LSR     byte_RAM_E
      BCC     loc_BANK0_8F95

      LDA     PlayerScreenX
      STA     SpriteTempScreenX
      ROR     byte_RAM_12
      JSR     sub_BANK1_BABF

loc_BANK0_8F95:
      LDY     #2
      LDA     PlayerXAccel
      CLC
      ADC     byte_RAM_4CB
      BMI     loc_BANK0_8FA3

      DEY
      JSR     sub_BANK0_8FF5

loc_BANK0_8FA3:
      STY     PlayerMovementDirection
      JSR     sub_BANK0_8FB2

      LDA     PlayerCollision
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     locret_BANK0_8FB1

      JMP     loc_BANK0_9333

; ---------------------------------------------------------------------------

locret_BANK0_8FB1:
      RTS

; End of function sub_BANK0_8EFA

; =============== S U B R O U T I N E =======================================

sub_BANK0_8FB2:
      JSR     loc_BANK0_8FB5

loc_BANK0_8FB5:
      LDX     #0
      LDY     byte_RAM_8
      JSR     sub_BANK0_924F

      LDX     byte_RAM_7
      LDY     byte_BANK0_8EE8,X
      LDA     byte_RAM_0
      JSR     sub_BANK0_9053

      BCC     loc_BANK0_8FF2

      CMP     #$1A
      BNE     loc_BANK0_8FD3

      LDA     byte_BANK0_8EE8,X
      STA     byte_RAM_E
      BNE     loc_BANK0_8FEB

loc_BANK0_8FD3:
      CMP     #$16
      BNE     loc_BANK0_8FDE

      LDA     byte_BANK0_8EE8,X
      STA     word_RAM_C
      BNE     loc_BANK0_8FEB

loc_BANK0_8FDE:
      SEC
      SBC     #$67
      CMP     #2
      BCS     loc_BANK0_8FEB

      ASL     A
      ORA     byte_BANK0_8EE8,X
      STA     byte_RAM_A

loc_BANK0_8FEB:
      LDA     CollisionFlagTableThing,X
      ORA     PlayerCollision
      STA     PlayerCollision

loc_BANK0_8FF2:
      JMP     loc_BANK0_8FF8

; End of function sub_BANK0_8FB2

; =============== S U B R O U T I N E =======================================

sub_BANK0_8FF5:
      JSR     loc_BANK0_8FF8

loc_BANK0_8FF8:
      INC     byte_RAM_7
      INC     byte_RAM_8
      RTS

; End of function sub_BANK0_8FF5

; =============== S U B R O U T I N E =======================================

; collision detection for vines (and cherries?)
sub_BANK0_8FFD:
      LDY     byte_BANKF_F00A

; byte_RAM_10 seems to be a global counter
; this code increments y every other frame
      LDA     byte_RAM_10
      LSR     A
      BCS     loc_BANK0_9006
      INY

loc_BANK0_9006:
      LDX     #0
      JSR     sub_BANK0_8B35

      BCS     loc_BANK0_902D

      LDA     byte_RAM_0
      CMP     #$4E
      BNE     locret_BANK0_9052

      INC     CherryCount
      LDA     CherryCount
      SBC     #5
      BNE     loc_BANK0_9023

      STA     CherryCount
      JSR     CreateStarman

; play sound and clear cherry
loc_BANK0_9023:
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffectQueue1
      LDA     #$40 ; blank tile to replace cherry tile
      JMP     loc_BANK0_937C

; ---------------------------------------------------------------------------

loc_BANK0_902D:
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Down|ControllerInput_Up

loc_BANK0_9031:
      BEQ     locret_BANK0_9052

      LDY     HoldingItem
      BNE     locret_BANK0_9052

      LDA     PlayerXLo
      CLC
      ADC     #4
      AND     #$F
      CMP     #8
      BCS     locret_BANK0_9052

      LDA     #PlayerState_Climbing
      STA     PlayerState
      STY     PlayerInAir
      STY     PlayerDucking
      LDA     #SpriteAnimation_Climbing
      STA     PlayerAnimationFrame
      PLA
      PLA
      PLA
      PLA

locret_BANK0_9052:
      RTS

; End of function sub_BANK0_8FFD

; =============== S U B R O U T I N E =======================================

sub_BANK0_9053:
      PHA
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      ADC     byte_BANK0_9062,Y
      TAY
      PLA
      CMP     byte_BANKF_F64E,Y
      RTS

; End of function sub_BANK0_9053

; ---------------------------------------------------------------------------
byte_BANK0_9062:
      .BYTE $00
      .BYTE $04
      .BYTE $08

PickUpToEnemyTypeTable:
      .BYTE Enemy_MushroomBlock
      .BYTE Enemy_MushroomBlock ; 1
      .BYTE Enemy_MushroomBlock ; 2
      .BYTE Enemy_POWBlock ; 3
      .BYTE Enemy_Coin ; 4
      .BYTE Enemy_VegetableLarge ; 5
      .BYTE Enemy_VegetableSmall ; 6
      .BYTE Enemy_Rocket ; 7
      .BYTE Enemy_Shell ; 8
      .BYTE Enemy_Bomb ; 9
      .BYTE Enemy_SubspacePotion ; $A
      .BYTE Enemy_Mushroom1up ; $B
      .BYTE Enemy_POWBlock ; $C
      .BYTE Enemy_BobOmb ; $D
      .BYTE Enemy_MushroomBlock ; $E
; ---------------------------------------------------------------------------

loc_BANK0_9074:
      LDX     #6

loc_BANK0_9076:
      LDA     EnemyState,X
      BEQ     loc_BANK0_9080

      INX
      CPX     #9
      BCC     loc_BANK0_9076

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_9080:
      LDA     byte_RAM_0
      STA     EnemyVariable,X
      LDA     byte_RAM_3
      STA     ObjectXHi,X
      LDA     byte_RAM_4
      STA     ObjectYHi,X
      LDA     byte_RAM_5
      STA     ObjectXLo,X
      LDA     byte_RAM_6
      STA     ObjectYLo,X
      LDA     #0
      STA     EnemyArray_42F,X
      STA     EnemyArray_9F,X
      STA     EnemyArray_B1,X
      JSR     sub_BANK1_BA48

      LDA     #1
      LDY     byte_RAM_9
      CPY     #$E
      BNE     loc_BANK0_90AE

      LDA     #$20
      STA     EnemyTimer,X
      LDA     #EnemyState_6

loc_BANK0_90AE:
      STA     EnemyState,X
      LDA     PickUpToEnemyTypeTable,Y ; What sprite is spawned for you when lifting a bg object
      STA     ObjectType,X
      LDY     #$FF
      CMP     #$37
      BEQ     loc_BANK0_90C1

      CMP     #9
      BNE     loc_BANK0_90C5

loc_BANK0_90BF:
      LDY     #$50

loc_BANK0_90C1:
      STY     EnemyTimer,X

loc_BANK0_90C3:
      BNE     loc_BANK0_90EA

loc_BANK0_90C5:
      CMP     #$40
      BNE     loc_BANK0_90D5

      LDA     Mushroom1upPulled
      BEQ     loc_BANK0_90EA

      LDA     #Enemy_VegetableSmall
      STA     ObjectType,X

loc_BANK0_90D2:
      JMP     loc_BANK0_90EA

; ---------------------------------------------------------------------------

loc_BANK0_90D5:
      CMP     #Enemy_VegetableLarge
      BNE     loc_BANK0_90EA

      LDY     BigVeggiesPulled
      INY
      CPY     #5
      BCC     loc_BANK0_90E7

      LDA     #Enemy_Stopwatch
      STA     ObjectType,X
      LDY     #0

loc_BANK0_90E7:
      STY     BigVeggiesPulled

loc_BANK0_90EA:
      JSR     loc_BANK1_B9EB

      LDA     #CollisionFlags_Down
      STA     EnemyCollision,X
      LDA     #$40 ; blank tile to replace lifted tile
      JSR     sub_BANK0_934F

      LDA     #7
      STA     ObjectBeingCarriedTimer,X
      STX     byte_RAM_42D
      LDA     #PlayerState_Lifting
      STA     PlayerState
      LDA     #6
      STA     PlayerStateTimer
      LDA     #SpriteAnimation_Pulling
      STA     PlayerAnimationFrame
      INC     HoldingItem
      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK0_910C:
      LDY     HoldingItem
      BNE     loc_BANK0_917C

      LDA     PlayerDucking
      BEQ     loc_BANK0_9155

      LDA     byte_RAM_0
      LDX     InSubspaceOrJar
      CPX     #2
      BNE     loc_BANK0_9123

      CMP     #$74
      BEQ     loc_BANK0_912D

      BNE     loc_BANK0_917C

loc_BANK0_9123:
      INY
      CMP     #$73
      BEQ     loc_BANK0_912D

      CMP     #$6F
      BNE     loc_BANK0_917C

      INY

loc_BANK0_912D:
      LDA     PlayerXLo
      CLC

loc_BANK0_9130:
      ADC     #4
      AND     #$F
      CMP     #8
      BCS     loc_BANK0_917C

      LDA     #0
      STA     PlayerXAccel
      LDA     #PlayerState_GoingDownJar
      STA     PlayerState

loc_BANK0_9140:
      STY     byte_RAM_4EE

; End of function sub_BANK0_910C

; =============== S U B R O U T I N E =======================================

sub_BANK0_9143:
      LDA     PlayerXLo
      CLC
      ADC     #8
      AND     #$F0
      STA     PlayerXLo
      BCC     locret_BANK0_9154

      LDA     IsHorizontalLevel
      BEQ     locret_BANK0_9154

      INC     PlayerXHi

locret_BANK0_9154:
      RTS

; End of function sub_BANK0_9143

; ---------------------------------------------------------------------------

loc_BANK0_9155:
      BIT     Player1JoypadPress
      BVC     loc_BANK0_917C

      LDA     PlayerXLo
      CLC
      ADC     #6
      AND     #$F
      CMP     #$C
      BCS     loc_BANK0_917C

      LDA     byte_RAM_0
      CMP     #$93
      BNE     loc_BANK0_916E

      LDA     #$E
      BNE     loc_BANK0_9177

loc_BANK0_916E:
      CMP     #$6D
      BCS     loc_BANK0_917C

      SEC
      SBC     #$69
      BCC     loc_BANK0_917C

loc_BANK0_9177:
      STA     byte_RAM_9
      JMP     loc_BANK0_9074

; ---------------------------------------------------------------------------

loc_BANK0_917C:
      LDA     PlayerDucking
      BNE     locret_BANK0_91CE

      LDA     byte_RAM_6
      SEC
      SBC     #$10
      STA     byte_RAM_6
      STA     byte_RAM_E6
      LDA     byte_RAM_4
      SBC     #0
      STA     byte_RAM_4
      STA     byte_RAM_1
      LDA     byte_RAM_3
      STA     byte_RAM_2
      JSR     sub_BANK0_92C1

      BCS     locret_BANK0_91CE

      JSR     sub_BANK1_BA4E

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y
      LDX     HoldingItem
      BEQ     loc_BANK0_91AE

      LDX     byte_RAM_42D
      LDY     ObjectType,X
      CPY     #Enemy_Key
      BNE     locret_BANK0_91CE

loc_BANK0_91AE:
      LDX     InSubspaceOrJar
      CPX     #2
      BEQ     loc_BANK0_91BF

      LDY     #4

loc_BANK0_91B7:
      CMP     byte_BANK0_924A,Y
      BEQ     loc_BANK0_91EB

      DEY
      BPL     loc_BANK0_91B7

loc_BANK0_91BF:
      BIT     Player1JoypadPress
      BVC     locret_BANK0_91CE

      STA     byte_RAM_0
      CMP     #$4D
      BCS     locret_BANK0_91CE

      SEC
      SBC     #$43
      BCS     loc_BANK0_91CF

locret_BANK0_91CE:
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_91CF:
      LDX     InSubspaceOrJar
      CPX     #$02
      BNE     loc_BANK0_91E3

      LDA     SubspaceVisits
      CMP     #$02
      BCS     loc_BANK0_91E2 ; skip if we've already visited Subspace twice

      INC     SubspaceCoins
      LDX     #$00

loc_BANK0_91E2:
      TXA

loc_BANK0_91E3:
      CLC
      ADC     #4
      STA     byte_RAM_9
      JMP     loc_BANK0_9074

; ---------------------------------------------------------------------------

loc_BANK0_91EB:
      LDA     Player1JoypadPress ; @TODO Seems to be code for handling doors
      AND     #ControllerInput_Up
      BEQ     locret_BANK0_91CE

      LDA     PlayerXLo
      CLC
      ADC     #5
      AND     #$F
      CMP     #$A
      BCS     locret_BANK0_91CE

      CPY     #4
      BNE     loc_BANK0_9205

      DEY
      STY     GameMode
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_9205:
      LDA     #1
      STA     TransitionType
      TYA
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK0_9216
      .WORD loc_BANK0_9228
      .WORD loc_BANK0_9244
      .WORD loc_BANK0_9244
; ---------------------------------------------------------------------------

loc_BANK0_9216:
      JSR     loc_BANK1_B964

loc_BANK0_9219:
      INC     byte_RAM_4BD
      INC     byte_RAM_41B
      JSR     sub_BANK0_9143

      LDA     #DPCM_DoorOpenBombBom
      STA     DPCMQueue

locret_BANK0_9227:
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_9228:
      LDA     HoldingItem
      BEQ     locret_BANK0_9227

      LDY     byte_RAM_42D
      LDA     ObjectType,Y
      CMP     #Enemy_Key
      BNE     locret_BANK0_9227

      INC     KeyUsed
      TYA
      TAX

loc_BANK0_923B:
      JSR     sub_BANK1_BA33

      JSR     sub_BANK1_B960

      JMP     loc_BANK0_9219

; ---------------------------------------------------------------------------

loc_BANK0_9244:
      INC     byte_RAM_627

loc_BANK0_9247:
      JMP     sub_BANKF_F6DA

; ---------------------------------------------------------------------------
byte_BANK0_924A:
      .BYTE $51

      .BYTE $50
      .BYTE $83
      .BYTE $52
      .BYTE $56

; =============== S U B R O U T I N E =======================================

sub_BANK0_924F:
      TXA
      PHA
      LDA     #0
      STA     byte_RAM_0
      STA     byte_RAM_1
      LDA     byte_BANKF_F011,Y
      BPL     loc_BANK0_925E

      DEC     byte_RAM_0

loc_BANK0_925E:
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

loc_BANK0_9277:
      BNE     loc_BANK0_927D

      STA     byte_RAM_2
      STA     byte_RAM_3

loc_BANK0_927D:
      LDA     byte_BANKF_F055,Y
      BPL     loc_BANK0_9284

      DEC     byte_RAM_1

loc_BANK0_9284:
      CLC

loc_BANK0_9285:
      ADC     PlayerYLo,X
      AND     #$F0
      STA     byte_RAM_6
      STA     byte_RAM_E6
      LDA     PlayerYHi,X
      ADC     byte_RAM_1
      STA     byte_RAM_1
      STA     byte_RAM_4
      JSR     sub_BANK0_92C1

      BCC     loc_BANK0_929E

      LDA     #0
      BEQ     loc_BANK0_92A5

loc_BANK0_929E:
      JSR     sub_BANK1_BA4E

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y

loc_BANK0_92A5:
      STA     byte_RAM_0
      PLA
      TAX
      RTS

; End of function sub_BANK0_924F

; =============== S U B R O U T I N E =======================================

sub_BANK0_92AA:
      STA     byte_RAM_F
      TYA
      BMI     locret_BANK0_92C0

      ASL     A
      ASL     A
      ASL     A
      ASL     A
      CLC
      ADC     byte_RAM_F
      BCS     loc_BANK0_92BC

      CMP     #$F0
      BCC     locret_BANK0_92C0

loc_BANK0_92BC:
      CLC
      ADC     #$10
      INY

locret_BANK0_92C0:
      RTS

; End of function sub_BANK0_92AA

; =============== S U B R O U T I N E =======================================

sub_BANK0_92C1:
      LDY     byte_RAM_1

loc_BANK0_92C3:
      LDA     byte_RAM_E6
      JSR     sub_BANK0_92AA

loc_BANK0_92C8:
      STY     byte_RAM_1
      STA     byte_RAM_E6
      LDY     IsHorizontalLevel
      LDA     byte_RAM_1,Y
      STA     byte_RAM_E8
      LDA     byte_RAM_2
      CMP     byte_BANK0_92E1,Y
      BCS     locret_BANK0_92DF

      LDA     byte_RAM_1
      CMP     byte_BANK0_92E0,Y

locret_BANK0_92DF:
      RTS

; End of function sub_BANK0_92C1

; ---------------------------------------------------------------------------
byte_BANK0_92E0:
      .BYTE $0A

byte_BANK0_92E1:
      .BYTE $01

      .BYTE $0B
; ---------------------------------------------------------------------------

_code_12E3:
      LDX     NeedVerticalScroll
      BNE     locret_BANK0_9311

      LDA     PlayerState
      CMP     #PlayerState_Lifting
      BCS     locret_BANK0_9311

      LDA     PlayerScreenYLo
      LDY     PlayerScreenYHi
      BMI     loc_BANK0_92FF

      BNE     loc_BANK0_9305

      CMP     #$B4
      BCS     loc_BANK0_9305

      CMP     #$21
      BCS     loc_BANK0_9307

loc_BANK0_92FF:
      LDY     PlayerInAir
      BNE     loc_BANK0_9307

      BEQ     loc_BANK0_9306

loc_BANK0_9305:
      INX

loc_BANK0_9306:
      INX

loc_BANK0_9307:
      LDA     byte_RAM_425
      STX     byte_RAM_425
      BNE     locret_BANK0_9311

loc_BANK0_930F:
      STX     NeedVerticalScroll

locret_BANK0_9311:
      RTS

; ---------------------------------------------------------------------------
CollisionResultTable:
      .BYTE CollisionFlags_Right
      .BYTE CollisionFlags_Left
TableUsedAt_BANK0_9333:
      .BYTE $80

      .BYTE $00

; =============== S U B R O U T I N E =======================================

sub_BANK0_9316:
      LDA     IsHorizontalLevel
      BEQ     locret_BANK0_9327

      LDA     PlayerScreenX
      LDY     PlayerMovementDirection
      CPY     #1
      BEQ     loc_BANK0_9328

      CMP     #8
      BCC     loc_BANK0_932C

locret_BANK0_9327:
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_9328:
      CMP     #$E8
      BCC     locret_BANK0_9327

loc_BANK0_932C:
      LDA     PlayerCollision
      ORA     CollisionResultTable-1,Y
      STA     PlayerCollision

loc_BANK0_9333:
      LDX     #0
      LDY     PlayerMovementDirection
      LDA     PlayerXAccel
      EOR     TableUsedAt_BANK0_9333-1,Y
      BPL     loc_BANK0_9340

      STX     PlayerXAccel

loc_BANK0_9340:
      LDA     byte_RAM_4CB
      EOR     CollisionResultTable+1,Y
      BPL     loc_BANK0_934B

      STX     byte_RAM_4CB

loc_BANK0_934B:
      STX     ObjectXSubpixel

locret_BANK0_934E:
      RTS

; End of function sub_BANK0_9316

; =============== S U B R O U T I N E =======================================

; replace tile when something is picked up
sub_BANK0_934F:
      PHA ; Something to update the PPU for some tile change
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
      BEQ     loc_BANK0_9365

      ADC     #0

loc_BANK0_9365:
      STA     byte_RAM_2
      LDA     ObjectYLo,X
      CLC
      ADC     #8
      AND     #$F0
      STA     byte_RAM_E6
      LDA     ObjectYHi,X
      ADC     #0
      STA     byte_RAM_1
      JSR     sub_BANK0_92C1

      PLA
      BCS     locret_BANK0_934E

; replace tile for cherry
loc_BANK0_937C:
      STX     byte_RAM_3
      PHA
      JSR     sub_BANK1_BA4E

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

loc_BANK0_93A2:
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
      BNE     loc_BANK0_93B9

      INY

loc_BANK0_93B9:
      LDA     byte_BANK0_940A,Y
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

loc_BANK0_93DE:
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

; End of function sub_BANK0_934F

; ---------------------------------------------------------------------------
byte_BANK0_940A:
      .BYTE $20
; Another byte of PPU high addresses for horiz/vert levels
      .BYTE $28
      .BYTE $20
      .BYTE $24

; =============== S U B R O U T I N E =======================================

sub_BANK0_940E:
      LDA     InSubspaceOrJar
      BNE     locret_BANK0_9427

      LDA     PlayerXHi
      STA     PlayerXHi_Backup
      LDA     PlayerXLo
      STA     PlayerXLo_Backup
      LDA     PlayerYHi
      STA     PlayerYHi_Backup
      LDA     PlayerYLo
      STA     PlayerYLo_Backup

locret_BANK0_9427:
      RTS

; End of function sub_BANK0_940E

; =============== S U B R O U T I N E =======================================

; player placement after exiting subspace (maybe other times?)
sub_BANK0_9428:
      LDA     PlayerXHi_Backup
      STA     PlayerXHi
      LDA     PlayerXLo_Backup
      STA     PlayerXLo
      LDA     PlayerYHi_Backup
      STA     PlayerYHi
      LDA     PlayerYLo_Backup
      STA     PlayerYLo
      LDA     PlayerXLo
      SEC
      SBC     ScreenBoundaryLeftLo
      STA     PlayerScreenX
      LDA     PlayerYLo
      SEC
      SBC     ScreenYLo
      STA     PlayerScreenYLo
      LDA     PlayerYHi
      SBC     ScreenYHi
      STA     PlayerScreenYHi
      LDA     TransitionType
      SEC
      SBC     #4
      BNE     locret_BANK0_9427

      ; resetting these to zero (A=$00, otherwise we would have branched)
      STA     PlayerState
      STA     byte_RAM_41B
      STA     SubspaceTimer
      JSR     loc_BANK1_B964

      LDA     #$A
      STA     byte_RAM_4B3
      RTS

; End of function sub_BANK0_9428

; =============== S U B R O U T I N E =======================================

sub_BANK0_946D:
      LDA     TransitionType

loc_BANK0_9470:
      CMP     #2
      BNE     loc_BANK0_947F

      LDA     byte_RAM_4EE
      BNE     loc_BANK0_947F

      JSR     sub_BANK0_9428

      JMP     loc_BANK0_94C2

; ---------------------------------------------------------------------------

loc_BANK0_947F:
      LDA     CurrentLevelPage
      LDY     #0
      LDX     IsHorizontalLevel
      BNE     loc_BANK0_948E

      STY     PlayerXHi
      STA     PlayerYHi
      BEQ     loc_BANK0_9492

loc_BANK0_948E:
      STA     PlayerXHi
      STY     PlayerYHi

loc_BANK0_9492:
      JSR     sub_BANK0_94CA

      LDY     PlayerYHi
      LDA     PlayerYLo
      JSR     sub_BANK0_95AF

      STY     PlayerYHi
      STA     PlayerYLo
      LDA     PlayerXLo
      SEC
      SBC     ScreenBoundaryLeftLo
      STA     PlayerScreenX
      LDA     PlayerYLo
      SEC

loc_BANK0_94AC:
      SBC     ScreenYLo
      STA     PlayerScreenYLo
      LDA     PlayerYHi
      SBC     ScreenYHi
      STA     PlayerScreenYHi
      LDA     TransitionType
      CMP     #4
      BNE     loc_BANK0_94C2

      JSR     loc_BANK1_B964

loc_BANK0_94C2:
      LDA     PlayerXLo
      SEC
      SBC     #$78
      STA     byte_RAM_BA
      RTS

; End of function sub_BANK0_946D

; =============== S U B R O U T I N E =======================================

sub_BANK0_94CA:
      LDA     TransitionType
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK0_94DC
      .WORD loc_BANK0_9514
      .WORD loc_BANK0_955D
      .WORD loc_BANK0_956A
      .WORD loc_BANK0_958C
      .WORD loc_BANK0_95A7
; ---------------------------------------------------------------------------

loc_BANK0_94DC:
      LDA     #1
      STA     byte_RAM_9D
      JSR     sub_BANK0_9561

      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5
      LDA     #$D0
      STA     PlayerYLo
      STA     byte_RAM_E6
      LDA     CurrentLevelPage
      STA     byte_RAM_E8
      LDA     #$C
      STA     byte_RAM_3

loc_BANK0_94F8:
      JSR     sub_BANK1_BA4E

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BEQ     sub_BANK0_950C

      JSR     sub_BANK0_950C

      STA     byte_RAM_E6
      DEC     byte_RAM_3
      BNE     loc_BANK0_94F8

; End of function sub_BANK0_94CA

; =============== S U B R O U T I N E =======================================

sub_BANK0_950C:
      LDA     PlayerYLo
      SEC
      SBC     #$10
      STA     PlayerYLo
      RTS

; End of function sub_BANK0_950C

; ---------------------------------------------------------------------------

loc_BANK0_9514:
      LDA     PlayerXLo
      CLC
      ADC     #8
      AND     #$F0
      EOR     #$F0
      STA     PlayerXLo
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5
      LDA     #$E0
      STA     PlayerYLo
      STA     byte_RAM_E6
      LDA     CurrentLevelPage
      STA     byte_RAM_E8
      LDA     #$D
      STA     byte_RAM_3

loc_BANK0_9534:
      JSR     sub_BANK1_BA4E

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y
      LDY     #5

loc_BANK0_953D:
      CMP     loc_BANK0_9247+2,Y
      BEQ     loc_BANK0_9554

      DEY
      BNE     loc_BANK0_953D

      DEC     byte_RAM_3
      BEQ     loc_BANK0_9551

      JSR     sub_BANK0_950C

      STA     byte_RAM_E6
      JMP     loc_BANK0_9534

; ---------------------------------------------------------------------------

loc_BANK0_9551:
      JSR     sub_BANK0_9561

loc_BANK0_9554:
      JSR     sub_BANK0_950C

      LDA     #0
      STA     byte_RAM_41B
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_955D:
      LDA     #0
      STA     PlayerYLo

; =============== S U B R O U T I N E =======================================

sub_BANK0_9561:
      LDA     #1
      STA     PlayerInAir
      LDA     #$78

loc_BANK0_9567:
      STA     PlayerXLo
      RTS

; End of function sub_BANK0_9561

; ---------------------------------------------------------------------------

loc_BANK0_956A:
      LDA     PlayerXLo
      CLC
      ADC     #8
      AND     #$F0
      EOR     #$F0
      STA     PlayerXLo
      LDA     PlayerScreenYLo
      CLC
      ADC     #8
      AND     #$F0
      EOR     #$10
      STA     PlayerYLo
      CMP     #$F0
      BEQ     loc_BANK0_9587

      DEC     PlayerYHi

loc_BANK0_9587:
      LDA     #SpriteAnimation_Climbing
      STA     PlayerAnimationFrame
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_958C:
      LDA     PlayerScreenX
      SEC
      SBC     byte_RAM_BA
      EOR     #$FF
      CLC
      ADC     #$F1
      STA     PlayerXLo
      LDA     PlayerScreenYLo
      STA     PlayerYLo
      DEC     byte_RAM_41B
      LDA     #$60
      STA     SubspaceTimer
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_95A7:
      JSR     sub_BANK0_9561

      LDA     #$60
      STA     PlayerYLo
      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK0_95AF:
      CPY     #0
      BMI     locret_BANK0_95C2

      PHA
      TYA
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_F
      PLA
      SEC
      SBC     byte_RAM_F
      BCS     locret_BANK0_95C2

      DEY

locret_BANK0_95C2:
      RTS

; End of function sub_BANK0_95AF

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $95C3 - $95FF
      .pad $9600, $FF
ENDIF

TitleScreenPPUDataPointers:
      .WORD PPUBuffer_301

      .WORD TitleLayout1

; =============== S U B R O U T I N E =======================================

WaitForNMI_TitleScreen_TurnOnPPU:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites
      STA     PPUMaskMirror

; End of function WaitForNMI_TitleScreen_TurnOnPPU

; =============== S U B R O U T I N E =======================================

WaitForNMI_TitleScreen:
      LDA     ScreenUpdateIndex
      ASL     A
      TAX
      LDA     TitleScreenPPUDataPointers,X

loc_BANK0_960F:
      STA     RAM_PPUDataBufferPointer
      LDA     TitleScreenPPUDataPointers+1,X
      STA     RAM_PPUDataBufferPointer+1
      LDA     #0
      STA     NMIWaitFlag

WaitForNMI_TitleScreenLoop:
      LDA     NMIWaitFlag
      BPL     WaitForNMI_TitleScreenLoop

      RTS

; End of function WaitForNMI_TitleScreen

; ---------------------------------------------------------------------------
TitleLayout1:
      .BYTE $20,$00,$DE,$FD
      .BYTE $20,$01,$DE,$FD
      .BYTE $20,$02,$DE,$FD
      .BYTE $20,$03,$DE,$FD
      .BYTE $20,$1C,$DE,$FD
      .BYTE $20,$1D,$DE,$FD
      .BYTE $20,$1E,$DE,$FD
      .BYTE $20,$1F,$DE,$FD
      .BYTE $20,$03,$5D,$FD
      .BYTE $20,$23,$5D,$FD
      .BYTE $20,$43,$5D,$FD
      .BYTE $20,$63,$5D,$FD
      .BYTE $23,$63,$5D,$FD
      .BYTE $23,$83,$5D,$FD
      .BYTE $23,$A3,$5D,$FD
      .BYTE $20,$68,$10,$48,$4A,$4C,$4E,$50,$51,$52,$53,$54,$55,$56,$57
      .BYTE $58,$5A,$5C,$5E ; $F
      .BYTE $20,$84,$08,$FD,$22,$23,$24,$49,$4B,$4D,$4F
      .BYTE $20,$94,$08,$59,$5B,$5D,$5F,$2E,$2F,$30,$FD
      .BYTE $20,$A4,$03,$25,$26,$27
      .BYTE $20,$B9,$03,$31,$32,$33
      .BYTE $20,$C4,$03,$28,$29,$2A
      .BYTE $20,$D9,$03,$34,$35,$36
      .BYTE $20,$E3,$03,$2B,$2C,$2D
      .BYTE $20,$FA,$03,$37,$38,$39
      .BYTE $21,$03,$02,$3A,$3B
      .BYTE $21,$1B,$02,$40,$41
      .BYTE $21,$23,$C6,$3C
      .BYTE $21,$3C,$C6,$42
      .BYTE $21,$E3,$01,$3D
      .BYTE $21,$FC,$01,$60
      .BYTE $22,$02,$02,$3E,$3F
      .BYTE $22,$1C,$02,$61,$62
      .BYTE $22,$22,$02,$43,$44
      .BYTE $22,$3C,$02,$63,$64
      .BYTE $22,$43,$01,$45
      .BYTE $22,$5C,$01,$65
      .BYTE $22,$63,$C6,$3C
      .BYTE $22,$7C,$C4,$42
      .BYTE $22,$C4,$02,$A6,$A8
      .BYTE $22,$E4,$02,$A7,$A9
      .BYTE $22,$FA,$04,$80,$82,$88,$8A
      .BYTE $23,$04,$02,$90,$92
      .BYTE $23,$14,$02,$9E,$A0
      .BYTE $23,$1A,$04,$81,$83,$89,$8B
      .BYTE $23,$23,$03,$46,$91,$93
      .BYTE $23,$2A,$02,$A2,$A4
      .BYTE $23,$2E,$0B,$67,$6C,$6E,$70,$72,$69,$9F,$A1,$75,$98,$9A
      .BYTE $23,$3A,$04,$84,$86,$8C,$8E
      .BYTE $23,$43,$1B,$47,$94,$96,$74,$74,$74,$74,$A3,$A5,$74,$66,$68
      .BYTE $6D,$6F,$71,$73,$6A,$6B,$74,$74,$99,$9B,$74,$85,$87,$8D,$8F ; $F
      .BYTE $23,$64,$05,$95,$97,$FD,$AA,$AB
      .BYTE $23,$77,$04,$9C,$9D,$AA,$AB
      .BYTE $23,$89,$02,$AA,$AB
      .BYTE $20,$CB,$0A,$00,$01,$08,$08,$FC,$01,$FC,$08,$FC,$01 ; "SUPER" logo
      .BYTE $20,$EB,$0A,$02,$03,$08,$08,$0A,$05,$0B,$C,$0A,$D
      .BYTE $21,$0B,$A,$04,$05,$04,$05,$0E,$07,$FC,$08,$0E,8
      .BYTE $21,$2B,$05,$06,$07,$06,$07,9
      .BYTE $21,$31,$04,$76,$09,$09,9
      .BYTE $21,$38,$02,$F9,$FA ; TM
      .BYTE $21,$46,$0A,$00,$0F,$01,$00,$01,$FC,$01,$08,$00,1
      .BYTE $21,$66,$0A,$10,$10,$08,$10,$08,$10,$08,$08,$10,8
      .BYTE $21,$86,$0A,$08,$08,$08,$08,$08,$13,$0D,$08,$08,8
      .BYTE $21,$A6,$0A,$08,$08,$08,$FC,$08,$0E,$08,$08,$08,8
      .BYTE $21,$C6,$0A,$08,$08,$08,$10,$08,$08,$08,$08,$04,5
      .BYTE $21,$E6,$0A,$09,$09,$09,$09,$09,$09,$09,$09,$06,7
      .BYTE $21,$51,$08,$FC,$01,$FC,$01,$00,$01,$00,1
      .BYTE $21,$71,$08,$10,$08,$10,$08,$10,$08,$10,8
      .BYTE $21,$91,$08,$13,$0D,$13,$0D,$08,$08,$77,3
      .BYTE $21,$B1,$08,$0E,$08,$0E,$08,$08,$08,$12,8
      .BYTE $21,$D1,$09,$13,$05,$08,$08,$04,$05,$04,$05,8
      .BYTE $21,$F1,$09,$11,$07,$09,$09,$06,$07,$06,$07,9
      .BYTE $22,$0E,$04,$14,$15,$16,$17
      .BYTE $22,$2E,$04,$18,$19,$1A,$1B
      .BYTE $22,$4E,$04,$1C,$1D,$1E,$1F
      .BYTE $22,$6E,$04,$FC,$FC,$FC,$20
      .BYTE $22,$8E,$04,$76,$76,$76,$21
      .BYTE $22,$E9,$05,$F8,$D1,$D9,$D8,$D8 ; (C) 1988
      .BYTE $22,$EF,$08,$E7,$E2,$E7,$ED,$DE,$E7,$DD,$E8 ; NINTENDO
; (these could have been combined, but... Nintendo)
      .BYTE $23,$CA,$04,$80,$A0,$A0,$20
      .BYTE $23,$D1,$0E,$80,$A8,$AA,$AA,$A2,$22,$00,$00,$88,$AA,$AA,$AA,$AA
      .BYTE $22 ; $10
      .BYTE $23,$E3,$02,$88,$22
      .BYTE $23,$EA,$04,$F0,$F8,$F2,$F0
      .BYTE $00
TitleBackgroundPalettes:
      .BYTE $22,$37,$16,7
      .BYTE $22,$30,$31,$0F ; 1: Most of screen, outline, etc.
      .BYTE $22,$30,$0F,$F ; 2: Not used (?)
      .BYTE $22,$30,$0F,$F ; 3: SUPER MARIO BROS. 2 logo
; 4: (C) 1988 NINTENDO
; (this is the same palette
;    as the logo, though...)
TitleSpritePalettes:
      .BYTE $22,$30,$28,$0F ; Unused DDP character palettes
      .BYTE $22,$30,$25,$0F ; There are no sprites on the title screen,
      .BYTE $22,$30,$12,$0F ; so these are totally unused
      .BYTE $22,$30,$23,$F
TitleStoryText_STORY:
      .BYTE $EC, $ED, $E8, $EB, $F2 ; STORY
TitleStoryTextPointersHi:
      .BYTE >TitleStoryText_Line01

      .BYTE >TitleStoryText_Line02
      .BYTE >TitleStoryText_Line03
      .BYTE >TitleStoryText_Line04
      .BYTE >TitleStoryText_Line05
      .BYTE >TitleStoryText_Line06
      .BYTE >TitleStoryText_Line07
      .BYTE >TitleStoryText_Line08
      .BYTE >TitleStoryText_Line08 ; For some reason line 8 is referenced twice here, but not used
      .BYTE >TitleStoryText_Line09
      .BYTE >TitleStoryText_Line10
      .BYTE >TitleStoryText_Line11
      .BYTE >TitleStoryText_Line12
      .BYTE >TitleStoryText_Line13
      .BYTE >TitleStoryText_Line14
      .BYTE >TitleStoryText_Line15
      .BYTE >TitleStoryText_Line16
TitleStoryTextPointersLo:
      .BYTE <TitleStoryText_Line01

      .BYTE <TitleStoryText_Line02
      .BYTE <TitleStoryText_Line03
      .BYTE <TitleStoryText_Line04
      .BYTE <TitleStoryText_Line05
      .BYTE <TitleStoryText_Line06
      .BYTE <TitleStoryText_Line07
      .BYTE <TitleStoryText_Line08
      .BYTE <TitleStoryText_Line08
      .BYTE <TitleStoryText_Line09
      .BYTE <TitleStoryText_Line10
      .BYTE <TitleStoryText_Line11
      .BYTE <TitleStoryText_Line12
      .BYTE <TitleStoryText_Line13
      .BYTE <TitleStoryText_Line14
      .BYTE <TitleStoryText_Line15
      .BYTE <TitleStoryText_Line16
TitleStoryText_Line01:
      .BYTE $F0, $E1, $DE, $E7, $FB, $FB, $E6, $DA, $EB, $E2, $E8, $FB, $E8, $E9, $DE, $E7
      .BYTE $DE, $DD, $FB, $DA ; WHEN MARIO OPENED A
TitleStoryText_Line02:
      .BYTE $DD, $E8, $E8, $EB, $FB, $DA, $DF, $ED, $DE, $EB, $FB, $FB, $DC, $E5, $E2, $E6
      .BYTE $DB, $E2, $E7, $E0 ; DOOR AFTER CLIMBING
TitleStoryText_Line03:
      .BYTE $DA, $FB, $E5, $E8, $E7, $E0, $FB, $EC, $ED, $DA, $E2, $EB, $FB, $E2, $E7, $FB
      .BYTE $FB, $E1, $E2, $EC ; A LONG STAIR IN HIS
TitleStoryText_Line04:
      .BYTE $DD, $EB, $DE, $DA, $E6, $F7, $FB, $DA, $E7, $E8, $ED, $E1, $DE, $EB, $FB, $F0
      .BYTE $E8, $EB, $E5, $DD ; DREAM, ANOTHER WORLD
TitleStoryText_Line05:
      .BYTE $EC, $E9, $EB, $DE, $DA, $DD, $FB, $FB, $FB, $DB, $DE, $DF, $E8, $EB, $DE, $FB
      .BYTE $FB, $E1, $E2, $E6 ; SPREAD BEFORE HIM
TitleStoryText_Line06:
      .BYTE $DA, $E7, $DD, $FB, $E1, $DE, $FB, $E1, $DE, $DA, $EB, $DD, $FB, $DA, $FB, $EF
      .BYTE $E8, $E2, $DC, $DE ; AND HE HEARD A VOICE
TitleStoryText_Line07:
      .BYTE $DC, $DA, $E5, $E5, $FB, $DF, $E8, $EB, $FB, $E1, $DE, $E5, $E9, $FB, $ED, $E8
      .BYTE $FB, $FB, $DB, $DE ; CALL FOR HELP TO BE
TitleStoryText_Line08:
      .BYTE $FB, $DF, $EB, $DE, $DE, $DD, $FB, $FB, $DF, $EB, $E8, $E6, $FB, $DA, $FB, $EC
      .BYTE $E9, $DE, $E5, $E5 ; FREED FROM A SPELL
TitleStoryText_Line09:
      .BYTE $DA, $DF, $ED, $DE, $EB, $FB, $FB, $DA, $F0, $DA, $E4, $DE, $E7, $E2, $E7, $E0
      .BYTE $F7, $FB, $FB, $FB ; AFTER AWAKENING,
TitleStoryText_Line10:
      .BYTE $E6, $DA, $EB, $E2, $E8, $FB, $FB, $F0, $DE, $E7, $ED, $FB, $ED, $E8, $FB, $FB
      .BYTE $DA, $FB, $FB, $FB ; MARIO WENT TO A
TitleStoryText_Line11:
      .BYTE $DC, $DA, $EF, $DE, $FB, $FB, $E7, $DE, $DA, $EB, $DB, $F2, $FB, $DA, $E7, $DD
      .BYTE $FB, $FB, $ED, $E8 ; CAVE NEARBY AND TO
TitleStoryText_Line12:
      .BYTE $E1, $E2, $EC, $FB, $FB, $EC, $EE, $EB, $E9, $EB, $E2, $EC, $DE, $FB, $E1, $DE
      .BYTE $FB, $EC, $DA, $F0 ; HIS SURPRISE HE SAW
TitleStoryText_Line13:
      .BYTE $DE, $F1, $DA, $DC, $ED, $E5, $F2, $FB, $FB, $F0, $E1, $DA, $ED, $FB, $E1, $DE
      .BYTE $FB, $EC, $DA, $F0 ; EXACTLY WHAT HE SAW
TitleStoryText_Line14:
      .BYTE $E2, $E7, $FB, $E1, $E2, $EC, $FB, $DD, $EB, $DE, $DA, $E6, $CF, $CF, $CF, $CF
      .BYTE $FB, $FB, $FB, $FB ; IN HIS DREAM....
TitleStoryText_Line15:
      .BYTE $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
      .BYTE $FB, $FB, $FB, $FB ; (blank)
TitleStoryText_Line16:
      .BYTE $FB, $FB, $E9, $EE, $EC, $E1, $FB, $EC, $ED, $DA, $EB, $ED, $FB, $DB, $EE, $ED
      .BYTE $ED, $E8, $E7, $FB ; PUSH START BUTTON
TitleAttributeData1:
      .BYTE $23, $CB, $42, $FF

      .BYTE $23, $D1, $01, $CC
      .BYTE $23, $D2, $44, $FF
      .BYTE $23, $D6, $01, $33
      .BYTE $23, $D9, $01, $CC
      .BYTE $23, $DA, $44, $FF
TitleAttributeData2:
      .BYTE $23, $DE, $01, $33

      .BYTE $23, $E1, $01, $CC
      .BYTE $23, $E2, $44, $FF
      .BYTE $23, $E6, $01, $33
      .BYTE $23, $EA, $44, $FF
      .BYTE $23, $E9, $01, $CC
      .BYTE $23, $EE, $01, $33

; =============== S U B R O U T I N E =======================================

TitleScreen:
      LDY     #$07 ; Does initialization of RAM.
      STY     byte_RAM_1 ; This clears $200 to $7FF.
      LDY     #0
      STY     byte_RAM_0
      TYA

InitMemoryLoop:
      STA     (byte_RAM_0),Y ; I'm not sure if a different method of initializing memory
; would work better in this case.
      DEY
      BNE     InitMemoryLoop

      DEC     byte_RAM_1
      LDX     byte_RAM_1
      CPX     #2
      BCS     InitMemoryLoop ; Stop initialization after we hit $200.

loc_BANK0_9A53:
      LDA     #0
      TAY

InitMemoryLoop2:
      STA     byte_RAM_0,Y ; Now we clear $00-$FF.
      INY ; Notably, this leaves the stack area,
; $100-$1FF, uninitialized.
      BNE     InitMemoryLoop2 ; This is not super important, but you might want to
; do this yourself to track stack corruption or whatever.

      JSR     LoadTitleScreenCHRBanks

      JSR     ClearNametablesAndSprites

      LDA     PPUSTATUS
      LDA     #$3F
      LDY     #0
      STA     PPUADDR
      STY     PPUADDR

loc_BANK0_9A6F:
      LDA     TitleBackgroundPalettes,Y
      STA     PPUDATA
      INY
      CPY     #$20
      BCC     loc_BANK0_9A6F

      LDA     #1
      STA     RAM_PPUDataBufferPointer
      LDA     #3
      STA     RAM_PPUDataBufferPointer+1
      LDA     #$40
      STA     StackArea
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x8|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      JSR     WaitForNMI_TitleScreen

      LDA     #1
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_TitleScreen

      LDA     #Music1_Title
      STA     Music1Queue
      JSR     WaitForNMI_TitleScreen_TurnOnPPU

      LDA     #3
      STA     byte_RAM_10
      LDA     #$25
      STA     byte_RAM_2
      LDA     #$20
      STA     PlayerXHi
      LDA     #$C7
      STA     ObjectXHi
      LDA     #$52
      STA     ObjectXHi+1

loc_BANK0_9AB4:
      JSR     WaitForNMI_TitleScreen

      LDA     ObjectXHi+2
      BNE     loc_BANK0_9AF3

loc_BANK0_9ABB:
      INC     byte_RAM_10
      LDA     byte_RAM_10
      AND     #$F
      BEQ     loc_BANK0_9AC6

      JMP     loc_BANK0_9B4D

; ---------------------------------------------------------------------------

loc_BANK0_9AC6:
      DEC     byte_RAM_2
      LDA     byte_RAM_2
      CMP     #6
      BNE     loc_BANK0_9B4D

      INC     ObjectXHi+2
      LDA     PlayerXHi
      STA     PPUBuffer_301
      LDA     ObjectXHi
      STA     byte_RAM_302
      LDA     ObjectXHi+1
      STA     byte_RAM_303
      LDA     #$E6
      STA     ObjectXHi
      LDA     #$54
      STA     ObjectXHi+1
      LDA     #$FB
      STA     byte_RAM_304
      LDA     #0
      STA     byte_RAM_305
      BEQ     loc_BANK0_9B4D

loc_BANK0_9AF3:
      LDA     PlayerXHi
      STA     PPUBuffer_301
      LDA     ObjectXHi
      STA     byte_RAM_302
      LDA     ObjectXHi+1
      STA     byte_RAM_303
      LDA     #$FB
      STA     byte_RAM_304
      LDA     #0
      STA     byte_RAM_305
      LDA     ObjectXHi
      CLC
      ADC     #$20
      STA     ObjectXHi
      LDA     PlayerXHi
      ADC     #0
      STA     PlayerXHi
      CMP     #$23

loc_BANK0_9B1B:
      BCC     loc_BANK0_9B4D

      LDA     #$20
      STA     byte_RAM_10
      LDX     #$17
      LDY     #0

loc_BANK0_9B25:
      LDA     TitleAttributeData1,Y
      STA     byte_RAM_305,Y
      INY
      DEX
      BPL     loc_BANK0_9B25

      LDA     #0
      STA     byte_RAM_305,Y
      JSR     WaitForNMI_TitleScreen

      LDX     #$1B
      LDY     #0

loc_BANK0_9B3B:
      LDA     TitleAttributeData2,Y
      STA     PPUBuffer_301,Y
      INY
      DEX
      BPL     loc_BANK0_9B3B

      LDA     #0
      STA     PPUBuffer_301,Y
      JMP     loc_BANK0_9B59

; ---------------------------------------------------------------------------

loc_BANK0_9B4D:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Start
      BEQ     loc_BANK0_9B56

      JMP     loc_BANK0_9C1F

; ---------------------------------------------------------------------------

loc_BANK0_9B56:
      JMP     loc_BANK0_9AB4

; ---------------------------------------------------------------------------

loc_BANK0_9B59:
      JSR     WaitForNMI_TitleScreen

      LDA     ObjectXHi+4
      BEQ     loc_BANK0_9B63

      JMP     loc_BANK0_9C19

; ---------------------------------------------------------------------------

loc_BANK0_9B63:
      LDA     ObjectXHi+3
      CMP     #9
      BEQ     loc_BANK0_9B93

      LDA     ObjectXHi+3
      BNE     loc_BANK0_9BA3

      DEC     byte_RAM_10
      BMI     TitleScreen_WriteSTORYText

      JMP     loc_BANK0_9C19

; ---------------------------------------------------------------------------

TitleScreen_WriteSTORYText:
      LDA     #$20
      STA     PPUBuffer_301
      LDA     #$AE
      STA     byte_RAM_302
      LDA     #$05 ; Length of STORY text (5 bytes)
      STA     byte_RAM_303
      LDY     #$04 ; Bytes to copy minus one (5-1=4)

TitleScreen_WriteSTORYTextLoop:
      LDA     TitleStoryText_STORY,Y ; Copy STORY text to PPU write buffer
      STA     byte_RAM_304,Y
      DEY
      BPL     TitleScreen_WriteSTORYTextLoop

      LDA     #$00 ; Terminate STORY text in buffer
      STA     byte_RAM_309

loc_BANK0_9B93:
      INC     ObjectXHi+3
      LDA     #$21
      STA     PlayerXHi
      LDA     #6
      STA     ObjectXHi
      LDA     #$40
      STA     ObjectXHi+5
      BNE     loc_BANK0_9C19

loc_BANK0_9BA3:
      DEC     ObjectXHi+5
      BPL     loc_BANK0_9C19

loc_BANK0_9BA7:
      LDA     #$40
      STA     ObjectXHi+5
      LDA     PlayerXHi
      STA     PPUBuffer_301

loc_BANK0_9BB0:
      LDA     ObjectXHi

loc_BANK0_9BB2:
      STA     byte_RAM_302
      LDA     #$14
      STA     byte_RAM_303
      LDX     ObjectXHi+3
      DEX
      LDA     TitleStoryTextPointersHi,X
      STA     byte_RAM_4
      LDA     TitleStoryTextPointersLo,X
      STA     byte_RAM_3
      LDY     #0
      LDX     #$13

loc_BANK0_9BCB:
      LDA     (byte_RAM_3),Y
      STA     byte_RAM_304,Y
      INY
      DEX
      BPL     loc_BANK0_9BCB

      LDA     #0
      STA     byte_RAM_304,Y
      INC     ObjectXHi+3
      LDA     ObjectXHi
      CLC
      ADC     #$40
      STA     ObjectXHi
      LDA     PlayerXHi
      ADC     #0
      STA     PlayerXHi
      LDA     ObjectXHi+3
      CMP     #9
      BCC     loc_BANK0_9C19

      BNE     loc_BANK0_9C0B

      LDA     #9
      STA     byte_RAM_2
      LDA     #3
      STA     byte_RAM_10
      LDA     #$20
      STA     PlayerXHi
      LDA     #$C7
      STA     ObjectXHi
      LDA     #$52
      STA     ObjectXHi+1
      LDA     #0
      STA     ObjectXHi+2
      JMP     loc_BANK0_9ABB

; ---------------------------------------------------------------------------

loc_BANK0_9C0B:
      CMP     #$12
      BCC     loc_BANK0_9C19

      INC     ObjectXHi+4
      LDA     #$25
      STA     byte_RAM_2
      LDA     #3
      STA     byte_RAM_10

loc_BANK0_9C19:
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Start
      BEQ     loc_BANK0_9C35

loc_BANK0_9C1F:
      LDA     #Music2_StopMusic
      STA     MusicQueue2
      JSR     WaitForNMI_TitleScreen

      LDA     #0
      TAY

loc_BANK0_9C2A:
      STA     byte_RAM_0,Y
      INY
      CPY     #$F0
      BCC     loc_BANK0_9C2A

      JMP     HideAllSprites

; ---------------------------------------------------------------------------

loc_BANK0_9C35:
      LDA     ObjectXHi+4
      BEQ     loc_BANK0_9C4B

      INC     byte_RAM_10
      LDA     byte_RAM_10
      AND     #$F
      BNE     loc_BANK0_9C4B

      DEC     byte_RAM_2
      LDA     byte_RAM_2
      CMP     #6
      BNE     loc_BANK0_9C4B

      BEQ     loc_BANK0_9C4E

loc_BANK0_9C4B:
      JMP     loc_BANK0_9B59

; ---------------------------------------------------------------------------

loc_BANK0_9C4E:
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x8|PPUCtrl_NMIDisabled
      STA     PPUCtrlMirror

loc_BANK0_9C52:
      STA     PPUCTRL
      JMP     loc_BANK0_9A53

; End of function TitleScreen

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $9C58 - $A1FF
      .pad $A200, $FF
ENDIF


; -------------------------------------------


; [00000200 BYTES: END OF AREA UNUSED-BANK1_A000. PRESS KEYPAD "-" TO COLLAPSE]
EndingPPUDataPointers:
      .WORD PPUBuffer_301

      .WORD EndingCorkJarRoom
      .WORD EndingCelebrationCeilingTextAndPodium
      .WORD EndingCelebrationFloorAndSubconParade
      .WORD EndingCelebrationPaletteFade1
      .WORD EndingCelebrationPaletteFade2
      .WORD EndingCelebrationPaletteFade3
      .WORD EndingCelebrationSubconStandStill
      .WORD EndingCelebrationUnusedText_THE_END
      .WORD EndingCelebrationText_MARIO
      .WORD EndingCelebrationText_PRINCESS
      .WORD EndingCelebrationText_TOAD
      .WORD EndingCelebrationText_LUIGI

; =============== S U B R O U T I N E =======================================

WaitForNMI_Ending_TurnOffPPU:
      LDA     #0
      BEQ     loc_BANK1_A220

; End of function WaitForNMI_Ending_TurnOffPPU

; =============== S U B R O U T I N E =======================================

WaitForNMI_Ending_TurnOnPPU:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites

loc_BANK1_A220:
      STA     PPUMaskMirror

; End of function WaitForNMI_Ending_TurnOnPPU

; =============== S U B R O U T I N E =======================================

WaitForNMI_Ending:
      LDA     ScreenUpdateIndex
      ASL     A
      TAX
      LDA     EndingPPUDataPointers,X
      STA     RAM_PPUDataBufferPointer
      LDA     EndingPPUDataPointers+1,X
      STA     RAM_PPUDataBufferPointer+1
      LDA     #0
      STA     NMIWaitFlag

WaitForNMI_EndingLoop:
      LDA     NMIWaitFlag
      BPL     WaitForNMI_EndingLoop

      RTS

; End of function WaitForNMI_Ending

; ---------------------------------------------------------------------------
EndingCorkJarRoom:
      .BYTE $20,$00,$9E,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $73,$72,$73
      .BYTE $20,$01,$9E,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $72,$73,$72
      .BYTE $22,$02,$8E,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $72,$73
      .BYTE $22,$03,$8E,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $73,$72
      .BYTE $23,$44,$18,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $23,$64,$18,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $23,$84,$18,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $23,$A4,$18,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $22,$1C,$8E,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $72,$73
      .BYTE $22,$1D,$8E,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $73,$72
      .BYTE $20,$1E,$9E,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $73,$72,$73
      .BYTE $20,$1F,$9E,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72
      .BYTE $73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73,$72,$73
      .BYTE $72,$73,$72
      .BYTE $22,$C6,$C4,$FC
      .BYTE $22,$C7,$C4,$FC
      .BYTE $22,$C8,$84,$AD,$AC,$AC,$AC
      .BYTE $22,$E9,$83,$AD,$AC,$AC
      .BYTE $23,$0A,$82,$AD,$AC
      .BYTE $23,$2B,$01,$AD
      .BYTE $22,$90,$84,$88,$89,$89,$8C
      .BYTE $22,$91,$84,$8A,$8B,$8B,$8D
      .BYTE $23,$0E,$06,$74,$76,$74,$76,$74,$76
      .BYTE $23,$2E,$06,$75,$77,$75,$77,$75,$77
      .BYTE $23,$C0,$20,$22,$00,$00,$00,$00,$00,$00,$88,$22,$00,$00,$00,$00,$00,$00,$88,$22,0
      .BYTE $00,$00,$00,$00,$00,$88,$22,$00,$00,$00,$00,$00,$00,$88
      .BYTE $23,$E0,$20,$AA,$00,$00,$00,$00,$00,$00,$AA,$AA,$00,$00,$00,$11,$00,$00,$AA,$AA
      .BYTE $A0,$A0,$A4,$A5,$A0,$A0,$AA,$0A,$A,$0A,$A,$0A,$A,$0A,$A
      .BYTE $00
EndingCelebrationUnusedText_THANK_YOU:
      .BYTE $21,$0C,$09,$ED,$E1,$DA,$E7,$E4,$FB,$F2,$E8,$EE
      .BYTE $00
unk_BANK1_A3FF:
      .BYTE $30
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
      .BYTE $80
byte_BANK1_A409:
      .BYTE $B0

      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $A0
      .BYTE $95
byte_BANK1_A413:
      .BYTE $10

      .BYTE $F4
      .BYTE $0C
      .BYTE $E8
      .BYTE $18
      .BYTE $EC
      .BYTE $14
      .BYTE $F8
      .BYTE $08
      .BYTE $00
byte_BANK1_A41D:
      .BYTE $00

      .BYTE $C4
      .BYTE $C4
      .BYTE $B8
      .BYTE $B8
      .BYTE $A8
      .BYTE $A8
      .BYTE $A0
      .BYTE $A0
      .BYTE $00
byte_BANK1_A427:
      .BYTE $00

      .BYTE $F0
      .BYTE $E0
      .BYTE $C0
      .BYTE $A0
      .BYTE $80
      .BYTE $60
      .BYTE $40
      .BYTE $20
      .BYTE $00
byte_BANK1_A431:
      .BYTE $00

byte_BANK1_A432:
      .BYTE $21

      .BYTE $61
      .BYTE $21
      .BYTE $61
      .BYTE $21
      .BYTE $61
      .BYTE $21
      .BYTE $61
      .BYTE $22

; =============== S U B R O U T I N E =======================================

FreeSubconsScene:
      JSR     WaitForNMI_Ending_TurnOffPPU
      JSR     ClearNametablesAndSprites

      LDA     #$40
      STA     StackArea
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      JSR     WaitForNMI_Ending

      LDA     #1
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_Ending

      LDA     #$60
      STA     byte_RAM_83
      LDA     #1
      STA     byte_RAM_9D
      LSR     A
      STA     PlayerState ; A=$00
      STA     byte_RAM_8E
      STA     CrouchJumpTimer
      STA     byte_RAM_E6
      STA     byte_RAM_E5
      STA     byte_RAM_400
      LDX     #9

loc_BANK1_A470:
      LDA     unk_BANK1_A3FF,X
      STA     PlayerXLo,X
      LDA     byte_BANK1_A409,X
      STA     PlayerYLo,X
      LDA     byte_BANK1_A413,X
      STA     PlayerXAccel,X
      LDA     byte_BANK1_A41D,X
      STA     PlayerYAccel,X
      LDA     byte_BANK1_A427,X
      STA     DamageInvulnTime,X
      LDA     byte_BANK1_A431,X
      STA     PlayerAttributesMaybe,X
      DEX
      BPL     loc_BANK1_A470

loc_BANK1_A491:
      JSR     WaitForNMI_Ending_TurnOnPPU

      INC     byte_RAM_10
      JSR     HideAllSprites

      JSR     loc_BANK1_A4C0

      JSR     sub_BANK1_A5DE

      LDA     byte_RAM_83
      BEQ     loc_BANK1_A4B8

      LDA     byte_RAM_10
      AND     #7
      BNE     loc_BANK1_A491

      DEC     byte_RAM_83
      LDA     byte_RAM_83
      CMP     #$25
      BNE     loc_BANK1_A491

      LDY     #Music2_EndingAndCast
      STY     MusicQueue2
      BNE     loc_BANK1_A491

loc_BANK1_A4B8:
      JSR     sub_BANK1_AB90

      LDA     byte_RAM_E6
      BEQ     loc_BANK1_A491

      RTS

; End of function FreeSubconsScene

; ---------------------------------------------------------------------------

loc_BANK1_A4C0:
      LDA     PlayerWalkFrameCounter
      BEQ     loc_BANK1_A4C6

      DEC     PlayerWalkFrameCounter

loc_BANK1_A4C6:
      LDA     PlayerStateTimer
      BEQ     loc_BANK1_A4CC

      DEC     PlayerStateTimer

loc_BANK1_A4CC:
      LDA     PlayerXLo
      STA     PlayerScreenX
      LDA     PlayerYLo
      STA     PlayerScreenYLo
      JSR     sub_BANKF_F31A

      LDA     PlayerState
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK1_A4E8
      .WORD loc_BANK1_A504
      .WORD loc_BANK1_A530
      .WORD loc_BANK1_A556
      .WORD loc_BANK1_A578
; ---------------------------------------------------------------------------

loc_BANK1_A4E8:
      JSR     PlayerWalkJumpAnim

      JSR     sub_BANK0_8A50

      LDA     PlayerXLo
      CMP     #$3E
      BCC     locret_BANK1_A52F

      INC     PlayerState
      INC     PlayerInAir
      LDA     #SpriteAnimation_Jumping
      STA     PlayerAnimationFrame

loc_BANK1_A4FC:
      LDA     #SoundEffect2_Jump
      STA     SoundEffectQueue2
      JMP     sub_BANK0_8C99

; ---------------------------------------------------------------------------

loc_BANK1_A504:
      JSR     PlayerWalkJumpAnim

loc_BANK1_A507:
      JSR     sub_BANK0_8A50

      JSR     sub_BANK1_A596

      JSR     sub_BANK0_8EA4

      LDA     PlayerYAccel
      BMI     locret_BANK1_A52F

      LDA     PlayerYLo
      CMP     #$A0
      BCC     loc_BANK1_A521

      LDA     #$C
      STA     PlayerXAccel
      JMP     loc_BANK1_A4FC

; ---------------------------------------------------------------------------

loc_BANK1_A521:
      CMP     #$75
      BCC     locret_BANK1_A52F

      LDA     PlayerXLo
      CMP     #$70
      BCC     locret_BANK1_A52F

      INC     PlayerState
      DEC     PlayerInAir

locret_BANK1_A52F:
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_A530:
      JSR     PlayerWalkJumpAnim

      JSR     sub_BANK0_8A50

      LDA     PlayerXLo
      CMP     #$80
      BCC     locret_BANK1_A52F

      INC     PlayerState
      INC     HoldingItem
      LDA     #SpriteAnimation_Pulling
      STA     PlayerAnimationFrame
      LDA     #5
      STA     byte_RAM_8E
      LDA     #$28
      STA     PlayerStateTimer
      RTS

; ---------------------------------------------------------------------------
byte_BANK1_A54D:
      .BYTE $14

      .BYTE $0A
      .BYTE $14
byte_BANK1_A550:
      .BYTE $0A

      .BYTE $1C
      .BYTE $1B
      .BYTE $1E
      .BYTE $1D
      .BYTE $1F
; ---------------------------------------------------------------------------

loc_BANK1_A556:
      LDA     PlayerStateTimer
      BNE     locret_BANK1_A577

      DEC     byte_RAM_8E
      BNE     loc_BANK1_A570

      INC     PlayerState
      INC     PlayerInAir
      LDA     #SpriteAnimation_Jumping
      STA     PlayerAnimationFrame
      LDA     #DPCM_ItemPull
      STA     DPCMQueue

loc_BANK1_A56B:
      LDA     #$A0
      STA     ObjectYAccel+8
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_A570:
      LDY     byte_RAM_8E
      LDA     byte_BANK1_A54D-1,Y
      STA     PlayerStateTimer

locret_BANK1_A577:
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_A578:
      JSR     sub_BANK1_A5A1

loc_BANK1_A57B:
      JSR     sub_BANK1_A596

      JSR     PlayerWalkJumpAnim

      JSR     sub_BANK0_8EA4

      LDA     PlayerYAccel
      BMI     locret_BANK1_A591

      LDA     PlayerYLo
      CMP     #$80
      BCC     locret_BANK1_A591

      JMP     sub_BANK0_8C99

; ---------------------------------------------------------------------------

locret_BANK1_A591:
      RTS

; ---------------------------------------------------------------------------
unk_BANK1_A592:
      .BYTE $04
      .BYTE $04
      .BYTE $04
      .BYTE $01

; =============== S U B R O U T I N E =======================================

sub_BANK1_A596:
      LDY     CurrentCharacter
      LDA     unk_BANK1_A592,Y
      CLC
      ADC     PlayerYAccel
      STA     PlayerYAccel
      RTS

; End of function sub_BANK1_A596

; =============== S U B R O U T I N E =======================================

sub_BANK1_A5A1:
      LDX     #7

loc_BANK1_A5A3:
      STX     byte_RAM_12
      LDA     EnemyTimer,X
      BEQ     loc_BANK1_A5B4

      CMP     #1
      BNE     loc_BANK1_A5D8

      LDA     #SoundEffect1_ThrowItem
      STA     SoundEffectQueue1
      BNE     loc_BANK1_A5D8

loc_BANK1_A5B4:
      JSR     sub_BANK1_B948

      LDA     ObjectYAccel,X
      CMP     #8
      BMI     loc_BANK1_A5CC

      LDA     #0
      STA     ObjectXAccel,X
      LDA     #$F9
      STA     ObjectYAccel,X
      LDA     byte_BANK1_A432,X
      EOR     #ObjAttrib_Palette0|ObjAttrib_16x32
      STA     ObjectAttributes,X

loc_BANK1_A5CC:
      LDA     byte_RAM_10
      ASL     A
      AND     #2
      STA     byte_RAM_F
      JSR     sub_BANK1_A60E

      INC     EnemyTimer,X

loc_BANK1_A5D8:
      DEC     EnemyTimer,X
      DEX
      BPL     loc_BANK1_A5A3

      RTS

; End of function sub_BANK1_A5A1

; =============== S U B R O U T I N E =======================================

sub_BANK1_A5DE:
      LDA     #4
      STA     byte_RAM_F
      LDX     #8
      STX     byte_RAM_12
      JSR     sub_BANK1_A60E

      LDY     byte_RAM_8E
      BNE     loc_BANK1_A5F6

      LDA     ObjectYLo+8
      CMP     #$F0
      BCS     locret_BANK1_A5FE

      JMP     sub_BANK1_B907

; ---------------------------------------------------------------------------

loc_BANK1_A5F6:
      LDA     byte_BANK1_A550,Y
      CLC
      ADC     PlayerYLo
      STA     ObjectYLo+8

locret_BANK1_A5FE:
      RTS

; End of function sub_BANK1_A5DE

; ---------------------------------------------------------------------------
byte_BANK1_A5FF:
      .BYTE $E8

byte_BANK1_A600:
      .BYTE $EA

      .BYTE $EC
      .BYTE $EE
      .BYTE $61
      .BYTE $63
byte_BANK1_A605:
      .BYTE $30

      .BYTE $38
      .BYTE $40
      .BYTE $48
      .BYTE $50
      .BYTE $58
      .BYTE $60
      .BYTE $68
      .BYTE $00

; =============== S U B R O U T I N E =======================================

sub_BANK1_A60E:
      LDY     byte_BANK1_A605,X
      LDA     ObjectYLo,X
      STA     SpriteDMAArea,Y
      STA     SpriteDMAArea+4,Y
      LDA     ObjectXLo,X
      STA     SpriteDMAArea+3,Y
      CLC
      ADC     #8
      STA     SpriteDMAArea+7,Y
      LDA     ObjectAttributes,X
      STA     SpriteDMAArea+2,Y
      STA     SpriteDMAArea+6,Y
      LDX     byte_RAM_F
      AND     #$40
      BNE     loc_BANK1_A63D

      LDA     byte_BANK1_A5FF,X
      STA     SpriteDMAArea+1,Y
      LDA     byte_BANK1_A600,X
      BNE     loc_BANK1_A646

loc_BANK1_A63D:
      LDA     byte_BANK1_A600,X
      STA     SpriteDMAArea+1,Y
      LDA     byte_BANK1_A5FF,X

loc_BANK1_A646:
      STA     SpriteDMAArea+5,Y
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK1_A60E

; ---------------------------------------------------------------------------
EndingCelebrationCeilingTextAndPodium:
      .BYTE $20,$00,$20,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81
      .BYTE $80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80 ; $F
      .BYTE $81,$80,$81,$80,$81 ; $1E
      .BYTE $20,$20,$20,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80
      .BYTE $81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81 ; $F
      .BYTE $80,$81,$80,$81,$80 ; $1E
      .BYTE $20,$40,$20,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81
      .BYTE $80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80 ; $F
      .BYTE $81,$80,$81,$80,$81 ; $1E
      .BYTE $20,$60,$20,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80
      .BYTE $81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81 ; $F
      .BYTE $80,$81,$80,$81,$80 ; $1E
      .BYTE $20,$88,$01,$5A
      .BYTE $20,$89,$4E,$9A
      .BYTE $20,$97,$01,$5C
      .BYTE $20,$A8,$C3,$9B
      .BYTE $20,$B7,$C3,$9B
      .BYTE $21,$08,$01,$5B
      .BYTE $21,$09,$4E,$9A
      .BYTE $21,$17,$01,$5D
      .BYTE $20,$AB,$0B,$DC,$E8,$E7,$ED,$EB,$E2,$DB,$EE,$ED,$E8,$EB
      .BYTE $20,$E3,$04,$40,$42,$44,$46
      .BYTE $20,$F9,$04,$40,$42,$44,$46
      .BYTE $21,$23,$C9,$48
      .BYTE $21,$24,$C9,$49
      .BYTE $21,$25,$C9,$4A
      .BYTE $21,$26,$C9,$4B
      .BYTE $22,$43,$04,$4C,$4D,$4E,$4F
      .BYTE $21,$03,$04,$41,$43,$45,$47
      .BYTE $21,$19,$04,$41,$43,$45,$47
      .BYTE $21,$39,$C9,$48
      .BYTE $21,$3A,$C9,$49
      .BYTE $21,$3B,$C9,$4A
      .BYTE $21,$3C,$C9,$4B
      .BYTE $22,$59,$04,$4C,$4D,$4E,$4F
      .BYTE $21,$CA,$4C,$54
      .BYTE $21,$EA,$4C,$55
      .BYTE $22,$0B,$A,$50,$52,$50,$52,$50,$52,$50,$52,$50,$52
      .BYTE $22,$2B,$0A,$51,$53,$51,$53,$51,$53,$51,$53,$51,$53
      .BYTE $22,$4C,$02,$3A,$3B
      .BYTE $22,$6C,$C5,$3C
      .BYTE $22,$6D,$C5,$3D
      .BYTE $22,$52,$02,$3A,$3B
      .BYTE $22,$72,$C5,$3C
      .BYTE $22,$73,$C5,$3D
      .BYTE $00
EndingCelebrationFloorAndSubconParade:
      .BYTE $23,$00,$20,$00,$02,$08,$0A,$C,$0E,$04,$06,$08,$0A,$04,$06,$0C,$E,$04,$06,$08,$0A,$00,$02,$C
      .BYTE $0E,$0C,$E,$00,$02,$04,$06,$04,$06,$08,$0A ; $18
      .BYTE $23,$20,$20,$01,$03,$09,$0B,$D,$0F,$05,$07,$09,$0B,$05,$07,$0D,$F,$05,$07,$09,$0B,$01,3
      .BYTE $0D,$0F,$D,$0F,$01,$03,$05,$07,$05,$07,$09,$0B ; $17
      .BYTE $27,$00,$20,$74,$76,$74,$76,$74,$76,$74,$76,$74,$76,$74,$76
      .BYTE $74,$76,$74,$76,$74,$76,$74,$76,$74,$76,$74,$76,$74,$76,$74 ; $F
      .BYTE $76,$74,$76,$74,$76 ; $1E
      .BYTE $27,$20,$20,$75,$77,$75,$77,$75,$77,$75,$77,$75,$77,$75,$77
      .BYTE $75,$77,$75,$77,$75,$77,$75,$77,$75,$77,$75,$77,$75,$77,$75 ; $F
      .BYTE $77,$75,$77,$75,$77 ; $1E
      .BYTE $23,$40,$20,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81
      .BYTE $80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80 ; $F
      .BYTE $81,$80,$81,$80,$81 ; $1E
      .BYTE $23,$60,$20,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80
      .BYTE $81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81 ; $F
      .BYTE $80,$81,$80,$81,$80 ; $1E
      .BYTE $23,$80,$20,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81
      .BYTE $80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80 ; $F
      .BYTE $81,$80,$81,$80,$81 ; $1E
      .BYTE $23,$A0,$20,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80
      .BYTE $81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81 ; $F
      .BYTE $80,$81,$80,$81,$80 ; $1E
      .BYTE $27,$40,$20,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81
      .BYTE $80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80 ; $F
      .BYTE $81,$80,$81,$80,$81 ; $1E
      .BYTE $27,$60,$20,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80
      .BYTE $81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81 ; $F
      .BYTE $80,$81,$80,$81,$80 ; $1E
      .BYTE $27,$80,$20,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81
      .BYTE $80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80 ; $F
      .BYTE $81,$80,$81,$80,$81 ; $1E
      .BYTE $27,$A0,$20,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80
      .BYTE $81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81,$80,$81 ; $F
      .BYTE $80,$81,$80,$81,$80 ; $1E
      .BYTE $23,$C0,$48,$AA
      .BYTE $23,$C8,$08,$15,$05,$FF,$FF,$FF,$FF,$15,$45
      .BYTE $23,$D0,$20,$31,$00,$FF,$FF,$FF,$FF,$00,$44,$33,$00,$A6,$A5,$A5
      .BYTE $A6,$00,$44,$F3,$F0,$59,$AA,$AA,$96,$F0,$74,$DD,$FF,$55,$AA ; $10
      .BYTE $AA,$95,$55,$55 ; $1F
      .BYTE $23,$F0,$48,$A5
      .BYTE $23,$F8,$48,$A
      .BYTE $27,$F0,$48,$A5
      .BYTE $27,$F8,$48,$A
      .BYTE $00
EndingCelebrationSubconStandStill:
      .BYTE $23,$00,$20,$70,$72,$70,$72,$70,$72,$70,$72,$70,$72,$70,$72
      .BYTE $70,$72,$70,$72,$70,$72,$70,$72,$70,$72,$70,$72,$70,$72,$70 ; $F
      .BYTE $72,$70,$72,$70,$72 ; $1E
      .BYTE $23,$20,$20,$71,$73,$71,$73,$71,$73,$71,$73,$71,$73,$71,$73
      .BYTE $71,$73,$71,$73,$71,$73,$71,$73,$71,$73,$71,$73,$71,$73,$71 ; $F
      .BYTE $73,$71,$73,$71,$73 ; $1E
      .BYTE $00
EndingCelebrationUnusedText_THE_END:
      .BYTE $21,$AC,$07,$ED,$E1,$DE,$FB,$DE,$E7,$DD,0
EndingCelebrationPaletteFade1:
      .BYTE $3F,$00,$20,1
      .BYTE $30,$21,$0F,$01 ; 4
      .BYTE $30,$16,$0F,$01 ; 8
      .BYTE $28,$18,$0F,$01 ; $C
      .BYTE $30,$30,$01,$01 ; $10
      .BYTE $27,$16,$0F,$01 ; $14
      .BYTE $37,$2A,$0F,$01 ; $18
      .BYTE $27,$30,$0F,$01 ; $1C
      .BYTE $36,$25,$0F,$00 ; $20
EndingCelebrationPaletteFade2:
      .BYTE $3F,$00,$20,$F
      .BYTE $10,$00,$0F,$F ; 4
      .BYTE $10,$00,$0F,$F ; 8
      .BYTE $10,$00,$0F,$F ; $C
      .BYTE $10,$00,$0F,$F ; $10
      .BYTE $10,$00,$0F,$F ; $14
      .BYTE $10,$00,$0F,$F ; $18
      .BYTE $10,$00,$0F,$F ; $1C
      .BYTE $10,$00,$0F,$00 ; $20
EndingCelebrationPaletteFade3:
      .BYTE $3F,$00,$20,$F
      .BYTE $00,$0F,$F,$0F ; 4
      .BYTE $00,$0F,$F,$0F ; 8
      .BYTE $00,$0F,$F,$0F ; $C
      .BYTE $00,$0F,$F,$0F ; $10
      .BYTE $00,$0F,$F,$0F ; $14
      .BYTE $00,$0F,$F,$0F ; $18
      .BYTE $00,$0F,$F,$0F ; $1C
      .BYTE $00,$0F,$F,$00 ; $20
byte_BANK1_AA32:
      .BYTE EndingUpdateBuffer_PaletteFade1
      .BYTE EndingUpdateBuffer_PaletteFade2 ; 1 ; @TODO This seems wrong, somehow
      .BYTE EndingUpdateBuffer_PaletteFade3 ; 2
byte_BANK1_AA35:
      .BYTE $8C,$FC,$20,$94
byte_BANK1_AA39:
      .BYTE $4F,$61,$20,$50
      .BYTE $4F,$63,$20,$58 ; 4
      .BYTE $5F,$65,$20,$50 ; 8
      .BYTE $5F,$67,$20,$58 ; $C
      .BYTE $4F,$69,$21,$68 ; $10
      .BYTE $4F,$6B,$21,$70 ; $14
      .BYTE $5F,$6D,$21,$68 ; $18
      .BYTE $5F,$6F,$21,$70 ; $1C
      .BYTE $4F,$83,$22,$88 ; $20
      .BYTE $4F,$83,$62,$90 ; $24
      .BYTE $5F,$87,$22,$88 ; $28
      .BYTE $5F,$87,$62,$90 ; $2C
      .BYTE $4F,$8B,$23,$A0 ; $30
      .BYTE $4F,$8D,$23,$A8 ; $34
      .BYTE $5F,$8F,$23,$A0 ; $38
      .BYTE $5F,$91,$23,$A8 ; $3C

; =============== S U B R O U T I N E =======================================

sub_BANK1_AA79:
      JSR     WaitForNMI_Ending_TurnOffPPU

      LDA     #0
      JSR     ChangeNametableMirroring

      JSR     ClearNametablesAndSprites

      LDA     #$40
      STA     StackArea
      JSR     sub_BANK1_ABBC

      JSR     WaitForNMI_Ending

      LDA     #EndingUpdateBuffer_CeilingTextAndPodium
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_Ending

      LDA     #EndingUpdateBuffer_FloorAndSubconParade
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_Ending

      JSR     Ending_GetContributor

      JSR     WaitForNMI_Ending

      LDA     #1
      JSR     ChangeNametableMirroring

      LDY     #3

loc_BANK1_AAAA:
      LDA     byte_BANK1_AA35,Y
      STA     SpriteDMAArea,Y
      DEY

loc_BANK1_AAB1:
      BPL     loc_BANK1_AAAA

      LDA     #0
      STA     byte_RAM_F3
      STA     byte_RAM_E6
      LDY     #$3F

loc_BANK1_AABB:
      LDA     byte_BANK1_AA39,Y
      STA     SpriteDMAArea+$10,Y
      DEY
      BPL     loc_BANK1_AABB

      LDA     #$FF
      STA     PlayerXHi
      LDA     #$A0
      STA     PlayerXLo
      LDA     #8
      STA     PlayerXAccel
      LDA     #1
      STA     IsHorizontalLevel

loc_BANK1_AAD4:
      JSR     WaitForNMI_Ending_TurnOnPPU

      INC     byte_RAM_F3
      INC     byte_RAM_10
      JSR     sub_BANK1_ADF1

      JSR     loc_BANK1_ABCC

      LDA     byte_RAM_E6
      CMP     #3
      BCS     loc_BANK1_AB20

loc_BANK1_AAE7:
      BIT     PPUSTATUS
      BVS     loc_BANK1_AAE7

loc_BANK1_AAEC:
      BIT     PPUSTATUS
      BVC     loc_BANK1_AAEC

      LDX     #2

loc_BANK1_AAF3:
      LDY     #0

loc_BANK1_AAF5:
      LDA     byte_RAM_0
      LDA     byte_RAM_0
      DEY
      BNE     loc_BANK1_AAF5

      DEX
      BNE     loc_BANK1_AAF3

      LDA     PPUSTATUS
      LDA     byte_RAM_F2
      STA     PPUSCROLL
      LDA     #0
      STA     PPUSCROLL
      LDA     byte_RAM_F3
      CMP     #$A
      BCC     loc_BANK1_AB1D

      LDA     #0
      STA     byte_RAM_F3
      LDA     byte_RAM_F2
      SEC

loc_BANK1_AB19:
      SBC     #$30
      STA     byte_RAM_F2

loc_BANK1_AB1D:
      JMP     loc_BANK1_AAD4

; ---------------------------------------------------------------------------

loc_BANK1_AB20:
      LDA     #0
      JSR     ChangeNametableMirroring

      LDA     #1
      STA     byte_RAM_F2
      LSR     A
      STA     byte_RAM_F3
      STA     byte_RAM_7
      LDA     #EndingUpdateBuffer_SubconStandStill
      STA     ScreenUpdateIndex

loc_BANK1_AB32:
      JSR     WaitForNMI_Ending

      JSR     sub_BANK1_ABBC

      INC     byte_RAM_F3
      JSR     sub_BANK1_ADF1

      JSR     sub_BANK1_AD0C

loc_BANK1_AB40:
      BIT     PPUSTATUS
      BVS     loc_BANK1_AB40

loc_BANK1_AB45:
      BIT     PPUSTATUS
      BVC     loc_BANK1_AB45

      LDX     #2

loc_BANK1_AB4C:
      LDY     #0

loc_BANK1_AB4E:
      LDA     byte_RAM_0
      LDA     byte_RAM_0
      DEY
      BNE     loc_BANK1_AB4E

      DEX
      BNE     loc_BANK1_AB4C

      LDA     #$B0
      ORA     byte_RAM_F2
      STA     PPUCtrlMirror
      STA     PPUCTRL
      LDA     PPUSTATUS
      LDA     #0
      STA     PPUSCROLL
      LDA     #0
      STA     PPUSCROLL
      LDA     byte_RAM_F3
      CMP     #$14
      BCC     loc_BANK1_AB80

      LDA     #0
      STA     byte_RAM_F3
      LDA     byte_RAM_F2
      EOR     #1
      STA     byte_RAM_F2
      INC     byte_RAM_7

loc_BANK1_AB80:
      LDA     byte_RAM_7
      CMP     #$29
      BCC     loc_BANK1_AB32

      JSR     sub_BANK1_AB90

      LDA     byte_RAM_E6
      CMP     #4
      BCC     loc_BANK1_AB32

      RTS

; End of function sub_BANK1_AA79

; =============== S U B R O U T I N E =======================================

sub_BANK1_AB90:
      LDA     byte_RAM_10
      AND     #3
      BNE     locret_BANK1_ABA6

      INC     byte_RAM_E5
      LDY     byte_RAM_E5
      CPY     #3
      BCS     loc_BANK1_ABA4

      LDA     byte_BANK1_AA32,Y
      STA     ScreenUpdateIndex
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_ABA4:
      INC     byte_RAM_E6

locret_BANK1_ABA6:
      RTS

; End of function sub_BANK1_AB90

; ---------------------------------------------------------------------------

loc_BANK1_ABA7:
      LDA     byte_RAM_10
      AND     #3
      BNE     locret_BANK1_ABA6

      DEC     byte_RAM_E5
      LDY     byte_RAM_E5
      LDA     byte_BANK1_AA32,Y
      STA     ScreenUpdateIndex
      TYA
      BNE     locret_BANK1_ABA6

      INC     byte_RAM_E6
      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK1_ABBC:
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      RTS

; End of function sub_BANK1_ABBC

; ---------------------------------------------------------------------------

loc_BANK1_ABC4:
; ? Not marked as used
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIDisabled
      STA     PPUCTRL
      STA     PPUCtrlMirror
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_ABCC:
      JSR     sub_BANK1_AD0C

      LDA     byte_RAM_E6
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK1_ABA7
      .WORD loc_BANK1_AC0A
      .WORD loc_BANK1_AC87
byte_BANK1_ABDA:
      .BYTE $C0

      .BYTE $C8
      .BYTE $B8
      .BYTE $B8
      .BYTE $C8
      .BYTE $C0
byte_BANK1_ABE0:
      .BYTE $C0

      .BYTE $08
      .BYTE $E0
      .BYTE $F0
      .BYTE $D0
      .BYTE $E8
byte_BANK1_ABE6:
      .BYTE $11

      .BYTE $13
      .BYTE $19
      .BYTE $1B
      .BYTE $21
      .BYTE $23
      .BYTE $15
      .BYTE $17
      .BYTE $1D
      .BYTE $1F
      .BYTE $25
      .BYTE $27
byte_BANK1_ABF2:
      .BYTE $00

      .BYTE $08
      .BYTE $10
      .BYTE $18
      .BYTE $20
      .BYTE $28
      .BYTE $00
      .BYTE $08
      .BYTE $10
      .BYTE $18
      .BYTE $20
      .BYTE $28
byte_BANK1_ABFE:
      .BYTE $00

      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $00
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE $10
      .BYTE $10
; ---------------------------------------------------------------------------

loc_BANK1_AC0A:
      JSR     sub_BANK0_8A50

      LDA     PlayerXHi
      CMP     #1
      BNE     loc_BANK1_AC37

      LDA     PlayerXLo
      CMP     #$20
      BCC     loc_BANK1_AC37

IFDEF COMPATIBILITY
      .db $ee, $e6, $00 ; INC $00E6
ENDIF
IFNDEF COMPATIBILITY
      INC     byte_RAM_E6 ; Absolute address for zero-page
      NOP ; Alignment fix
ENDIF

      LDA     #$A0
      STA     byte_RAM_10
      LDX     #5

loc_BANK1_AC22:
      LDA     #$20
      STA     ObjectXLo,X
      LDA     #$A8

loc_BANK1_AC28:
      STA     ObjectYLo,X
      LDA     byte_BANK1_ABDA,X
      STA     ObjectXAccel,X
      LDA     byte_BANK1_ABE0,X
      STA     ObjectYAccel,X
      DEX
      BPL     loc_BANK1_AC22

loc_BANK1_AC37:
      LDY     #$A0
      LDA     byte_RAM_10
      AND     #$38
      BNE     loc_BANK1_AC40

      DEY

loc_BANK1_AC40:
      AND     #8
      BNE     loc_BANK1_AC45

      DEY

loc_BANK1_AC45:
      STY     PlayerYLo
      LDX     #$B
      LDY     #$70

loc_BANK1_AC4B:
      LDA     PlayerYLo
      CLC
      ADC     byte_BANK1_ABFE,X
      STA     SpriteDMAArea,Y
      LDA     byte_BANK1_ABE6,X
      STA     SpriteDMAArea+1,Y
      LDA     #1
      STA     SpriteDMAArea+2,Y
      LDA     PlayerXLo
      CLC
      ADC     byte_BANK1_ABF2,X
      STA     SpriteDMAArea+3,Y
      LDA     PlayerXHi

loc_BANK1_AC6A:
      ADC     #0
      BEQ     loc_BANK1_AC73

      LDA     #$F0
      STA     SpriteDMAArea,Y

loc_BANK1_AC73:
      INY
      INY
      INY
      INY
      DEX
      BPL     loc_BANK1_AC4B

      RTS

; ---------------------------------------------------------------------------
byte_BANK1_AC7B:
      .BYTE $39

      .BYTE $35
      .BYTE $37
      .BYTE $35
      .BYTE $37
      .BYTE $39
byte_BANK1_AC81:
      .BYTE $00

      .BYTE $06
      .BYTE $03
      .BYTE $09
      .BYTE $0F
      .BYTE $0C
; ---------------------------------------------------------------------------

loc_BANK1_AC87:
      LDA     byte_RAM_10
      BNE     loc_BANK1_ACA4

loc_BANK1_AC8B:
      STA     byte_RAM_40E
      STA     byte_RAM_418
      STA     ObjectXLo+6
      STA     byte_RAM_10
      LDA     #$6F
      STA     ObjectYLo+6
      LDA     #$E6
      STA     ObjectXAccel+6
      LDA     #$DA
      STA     ObjectYAccel+6
IFDEF COMPATIBILITY
      .db $ee, $e6, $00 ; INC $00E6
ENDIF
IFNDEF COMPATIBILITY
      INC     byte_RAM_E6 ; Absolute address for zero-page
      NOP ; Alignment fix
ENDIF


loc_BANK1_ACA4:
      LDX     #5

loc_BANK1_ACA6:
      STX     byte_RAM_12
      JSR     sub_BANK1_B90C

      JSR     sub_BANK1_B907

      LDY     #$F0
      LDA     byte_RAM_10
      BEQ     loc_BANK1_ACC1

      AND     #$F
      CMP     byte_BANK1_AC81,X
      BNE     loc_BANK1_ACC3

      LDA     #$20
      STA     ObjectXLo,X
      LDY     #$A8

loc_BANK1_ACC1:
      STY     ObjectYLo,X

loc_BANK1_ACC3:
      TXA
      ASL     A
      ASL     A
      TAY
      LDA     ObjectXLo,X
      CMP     #$80
      BCS     loc_BANK1_ACD1

      LDA     #$F0
      BNE     loc_BANK1_ACD6

loc_BANK1_ACD1:
      STA     SpriteDMAArea+$73,Y
      LDA     ObjectYLo,X

loc_BANK1_ACD6:
      STA     SpriteDMAArea+$70,Y
      LDA     byte_BANK1_AC7B,X
      STA     SpriteDMAArea+$71,Y
      LDA     #0
      STA     SpriteDMAArea+$72,Y
      DEX
      BPL     loc_BANK1_ACA6

      RTS

; ---------------------------------------------------------------------------
byte_BANK1_ACE8:
      .BYTE $61

      .BYTE $61
      .BYTE $63
      .BYTE $93
      .BYTE $65
      .BYTE $65
      .BYTE $67
      .BYTE $67
      .BYTE $69
      .BYTE $69
      .BYTE $95
      .BYTE $6B
      .BYTE $6D
      .BYTE $6D
      .BYTE $97
      .BYTE $6F
      .BYTE $83
      .BYTE $85
      .BYTE $83
      .BYTE $85
      .BYTE $87
      .BYTE $89
      .BYTE $87
      .BYTE $89
      .BYTE $8B
      .BYTE $8B
      .BYTE $99
      .BYTE $8D
      .BYTE $8F
      .BYTE $8F
      .BYTE $91
      .BYTE $91
byte_BANK1_AD08:
      .BYTE $06

      .BYTE $0E
      .BYTE $16
      .BYTE $1E

; =============== S U B R O U T I N E =======================================

sub_BANK1_AD0C:
      INC     PlayerWalkFrame
      LDA     #3
      STA     byte_RAM_0
      LDA     PlayerWalkFrame
      STA     byte_RAM_1
      LDY     #$3C

loc_BANK1_AD18:
      LDX     byte_RAM_0
      LDA     byte_BANK1_AD08,X
      TAX
      INC     byte_RAM_1
      LDA     byte_RAM_1
      AND     #$10
      BEQ     loc_BANK1_AD27

      INX

loc_BANK1_AD27:
      LDA     #3
      STA     byte_RAM_2

loc_BANK1_AD2B:
      LDA     byte_BANK1_ACE8,X
      STA     SpriteDMAArea+$11,Y
      DEX
      DEX
      DEY
      DEY
      DEY
      DEY
      DEC     byte_RAM_2
      BPL     loc_BANK1_AD2B

      DEC     byte_RAM_0
      BPL     loc_BANK1_AD18

      RTS

; End of function sub_BANK1_AD0C

; =============== S U B R O U T I N E =======================================

Ending_GetContributor:
      LDA     #0
      STA     byte_RAM_631
      LDY     #3

loc_BANK1_AD47:
      LDA     CharacterLevelsCompleted,Y
      CMP     byte_RAM_631
      BCC     loc_BANK1_AD55

      LDA     CharacterLevelsCompleted,Y
      STA     byte_RAM_631

loc_BANK1_AD55:
      DEY
      BPL     loc_BANK1_AD47

      LDX     #0
      LDY     #3

loc_BANK1_AD5C:
      LDA     CharacterLevelsCompleted,Y
      CMP     byte_RAM_631
      BNE     loc_BANK1_AD69

      TYA
      STA     unk_RAM_5BE,X
      INX

loc_BANK1_AD69:
      DEY
      BPL     loc_BANK1_AD5C

      DEX
      STX     byte_RAM_5C2
      LDX     #0
      LDA     #$21
      STA     PPUBuffer_301,X
      INX
      LDA     #$2A
      STA     PPUBuffer_301,X
      INX
      LDA     #$C
      STA     PPUBuffer_301,X
      INX
      LDY     #0
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #$FB
      STA     PPUBuffer_301,X
      INX
      LDY     #3
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX

loc_BANK1_ADB0:
      LDA     #$FB
      STA     PPUBuffer_301,X
      INX
      STA     PPUBuffer_301,X
      INX
      LDY     #2
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #$FB
      STA     PPUBuffer_301,X
      INX
      LDY     #1
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #0
      STA     PPUBuffer_301,X
      LDA     #$3C
      STA     byte_RAM_5C4
      RTS

; End of function Ending_GetContributor

; =============== S U B R O U T I N E =======================================

sub_BANK1_ADF1:
      DEC     byte_RAM_5C4
      BPL     locret_BANK1_AE12

      LDA     #$3C
      STA     byte_RAM_5C4
      LDY     byte_RAM_5C3
      LDA     unk_RAM_5BE,Y
      CLC
      ADC     #9
IFDEF COMPATIBILITY
      .db $8d, $11, $00 ; STA $0011
ENDIF
IFNDEF COMPATIBILITY
      STA     ScreenUpdateIndex ; Absolute address for zero-page
      NOP ; Alignment fix
ENDIF

      DEC     byte_RAM_5C3
      BPL     locret_BANK1_AE12

      LDA     byte_RAM_5C2
      STA     byte_RAM_5C3

locret_BANK1_AE12:
      RTS

; End of function sub_BANK1_ADF1

; ---------------------------------------------------------------------------
EndingCelebrationText_MARIO:
      .BYTE $20,$ED,$08,$E6,$DA,$EB,$E2,$E8,$FB,$FB,$FB
      .BYTE $00
EndingCelebrationText_PRINCESS:
      .BYTE $20,$ED,$08,$E9,$EB,$E2,$E7,$DC,$DE,$EC,$EC
      .BYTE $00
EndingCelebrationText_TOAD:
      .BYTE $20,$ED,$08,$ED,$E8,$DA,$DD,$FB,$FB,$FB,$FB
      .BYTE $00
EndingCelebrationText_LUIGI:
      .BYTE $20,$ED,$08,$E5,$EE,$E2,$E0,$E2,$FB,$FB,$FB
      .BYTE $00

; =============== S U B R O U T I N E =======================================

sub_BANK1_AE43:
      LDY     #$D0

loc_BANK1_AE45:
      CMP     #$A
      BCC     loc_BANK1_AE4F

      SBC     #$A

loc_BANK1_AE4B:
      INY
      JMP     loc_BANK1_AE45

; ---------------------------------------------------------------------------

loc_BANK1_AE4F:
      ORA     #$D0
      CPY     #$D0
      BNE     loc_BANK1_AE57

      LDY     #$FB

loc_BANK1_AE57:
      STA     byte_RAM_1
      RTS

; End of function sub_BANK1_AE43

; ---------------------------------------------------------------------------
IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $AE5A - $B8FF
      .pad $B900, $FF
ENDIF

; [00000AA6 BYTES: END OF AREA UNUSED-BANK1:AE5A. PRESS KEYPAD "-" TO COLLAPSE]
MysteryCharacterData3900:
      .BYTE $FB ; � ; @TODO ??? Not sure what this is
      .BYTE $FF
      .BYTE $00
      .BYTE $08
      .BYTE $0C
      .BYTE $18
      .BYTE $1A

; =============== S U B R O U T I N E =======================================

sub_BANK1_B907:
      TXA
      CLC
      ADC     #$A
      TAX

; End of function sub_BANK1_B907

; =============== S U B R O U T I N E =======================================

sub_BANK1_B90C:
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
      BCC     loc_BANK1_B924

      ORA     #$F0

loc_BANK1_B924:
      STA     byte_RAM_0
      LDY     #0
      ASL     A
      BCC     loc_BANK1_B92C

      DEY

loc_BANK1_B92C:
      STY     byte_RAM_2
      LDA     unk_RAM_408,X
      CLC
      ADC     byte_RAM_1
      STA     unk_RAM_408,X
      LDA     ObjectXLo,X
      ADC     byte_RAM_0
      STA     ObjectXLo,X
      LSR     byte_RAM_1
      LDA     ObjectXHi,X
      ADC     byte_RAM_2
      STA     ObjectXHi,X
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK1_B90C

; =============== S U B R O U T I N E =======================================

sub_BANK1_B948:
      LDA     EnemyArray_44A,X
      BNE     loc_BANK1_B950

      JSR     sub_BANK1_B90C

loc_BANK1_B950:
      JSR     sub_BANK1_B907

      LDA     ObjectYAccel,X
      BMI     loc_BANK1_B95B

      CMP     #$3E
      BCS     locret_BANK1_B95F

loc_BANK1_B95B:
      INC     ObjectYAccel,X
      INC     ObjectYAccel,X

locret_BANK1_B95F:
      RTS

; End of function sub_BANK1_B948

; =============== S U B R O U T I N E =======================================

sub_BANK1_B960:
      LDA     #1
      BNE     loc_BANK1_B966

loc_BANK1_B964:
      LDA     #0

loc_BANK1_B966:
      PHA
      LDY     #8

loc_BANK1_B969:
      LDA     EnemyState,Y
      BEQ     loc_BANK1_B97F

      LDA     ObjectType,Y
      CMP     #Enemy_SubspaceDoor
      BNE     loc_BANK1_B97F

      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,Y
      LDA     #$20
      STA     EnemyTimer,Y

loc_BANK1_B97F:
      DEY
      BPL     loc_BANK1_B969

      JSR     CreateEnemy_TryAllSlots_Bank1

      BMI     loc_BANK1_B9B6

      LDA     #0
      STA     byte_RAM_4BD
      STA     byte_RAM_4B3
      LDX     byte_RAM_0
      PLA
      STA     EnemyArray_477,X
      LDA     #Enemy_SubspaceDoor
      STA     ObjectType,X
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
      LDA     #ObjAttrib_Palette1|ObjAttrib_16x32
      STA     ObjectAttributes,X
      LDX     byte_RAM_12
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_B9B6:
      PLA
      RTS

; End of function sub_BANK1_B960

; =============== S U B R O U T I N E =======================================

CreateStarman:
      JSR     CreateEnemy_Bank1

      BMI     locret_BANK1_B9E2

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
      JSR     loc_BANK1_BA17

      LDX     byte_RAM_12

locret_BANK1_B9E2:
      RTS

; End of function CreateStarman

; =============== S U B R O U T I N E =======================================

EnemyInit_Basic_Bank1:
      LDA     #0
      STA     EnemyTimer,X
      LDA     #0
      STA     EnemyVariable,X

loc_BANK1_B9EB:
      LDA     #0
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
      STA     ObjectXAccel,X

; look up object attributes
loc_BANK1_BA17:
      LDY     ObjectType,X
      LDA     ObjectAttributeTable,Y
      AND     #ObjAttrib_Palette3|ObjAttrib_Horizontal|ObjAttrib_FrontFacing|ObjAttrib_Mirrored|ObjAttrib_BehindBackground|ObjAttrib_16x32
      STA     ObjectAttributes,X
      LDA     EnemyArray_46E_Data,Y
      STA     EnemyArray_46E,X
      LDA     EnemyArray_489_Data,Y
      STA     EnemyArray_489,X
      LDA     EnemyArray_492_Data,Y
      STA     EnemyArray_492,X
      RTS

; End of function EnemyInit_Basic_Bank1

; =============== S U B R O U T I N E =======================================

sub_BANK1_BA33:
      LDA     ObjectAttributes,X
      AND     #$FC
      ORA     #1
      STA     ObjectAttributes,X
      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,X
      STA     EnemyArray_9F,X
      LDA     #$1F
      STA     EnemyTimer,X
      LDX     byte_RAM_12
      RTS

; End of function sub_BANK1_BA33

; =============== S U B R O U T I N E =======================================

sub_BANK1_BA48:
      LDA     #$FF
      STA     unk_RAM_441,X
      RTS

; End of function sub_BANK1_BA48

; =============== S U B R O U T I N E =======================================

sub_BANK1_BA4E:
      LDX     byte_RAM_E8
      JSR     sub_BANK1_BA71

      LDA     byte_RAM_E6
      CLC
      ADC     byte_RAM_E5
      STA     byte_RAM_E7
      RTS

; End of function sub_BANK1_BA4E

; ---------------------------------------------------------------------------
byte_BANK1_BA5B:
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
byte_BANK1_BA66:
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

sub_BANK1_BA71:
      LDA     byte_BANK1_BA5B,X
      STA     byte_RAM_1
      LDA     byte_BANK1_BA66,X
      STA     byte_RAM_2
      RTS

; End of function sub_BANK1_BA71

; =============== S U B R O U T I N E =======================================

sub_BANK1_BA7C:
      LDA     #1
      LDY     byte_RAM_0
      CPY     #$8A
      BEQ     loc_BANK1_BA8D

      CPY     #$8B
      BEQ     loc_BANK1_BA8B

      LDA     #0
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_BA8B:
      LDA     #8

loc_BANK1_BA8D:
      STA     PlayerYAccel
      LDA     byte_RAM_4DF
      BNE     loc_BANK1_BA9B

      LDA     PlayerYLo
      AND     #$10
      STA     byte_RAM_4EB

loc_BANK1_BA9B:
      LDA     PlayerYLo
      AND     #$F
      TAY
      LDA     byte_RAM_4EB
      EOR     PlayerYLo
      AND     #$10
      BEQ     loc_BANK1_BAB6

      CPY     #$C
      BCC     loc_BANK1_BAB4

      LDA     #0
      STA     PlayerStateTimer
      JSR     KillPlayer

loc_BANK1_BAB4:
      LDY     #4

loc_BANK1_BAB6:
      CPY     #4
      BCS     loc_BANK1_BABC

      LDY     #1

loc_BANK1_BABC:
      TYA
      DEX
      RTS

; End of function sub_BANK1_BA7C

; =============== S U B R O U T I N E =======================================

sub_BANK1_BABF:
      LDA     DamageInvulnTime
      BNE     locret_BANK1_BAEC

      LDA     PlayerHealth
      SEC
      SBC     #$10
      BCC     loc_BANK1_BAED

      STA     PlayerHealth
      LDA     #$7F
      STA     DamageInvulnTime
      LDA     PlayerScreenX
      SEC
      SBC     SpriteTempScreenX
      ASL     A
      ASL     A
      STA     PlayerXAccel
      LDA     #$C0
      LDY     PlayerYAccel
      BPL     loc_BANK1_BAE5

      LDA     #0

loc_BANK1_BAE5:
      STA     PlayerYAccel
      LDA     #4
      STA     DPCMQueue

locret_BANK1_BAEC:
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_BAED:
      LDA     #$C0
      STA     PlayerYAccel
      LDA     #$20
      STA     PlayerStateTimer
      LDY     byte_RAM_12
      BMI     loc_BANK1_BAFD

      LSR     A
      STA     EnemyArray_438,Y

loc_BANK1_BAFD:
      JMP     KillPlayer

; End of function sub_BANK1_BABF

; ---------------------------------------------------------------------------

_code_3B00:
      LDY     unk_RAM_441,X
      BMI     loc_BANK1_BB0B

      LDA     (byte_RAM_CC),Y
      AND     #$7F
      STA     (byte_RAM_CC),Y

loc_BANK1_BB0B:
      LDA     #0
      STA     EnemyState,X
      RTS

; =============== S U B R O U T I N E =======================================

; Creates a generic red Shyguy enemy and
; does some basic initialization for it.
;
; This is a copy of the "CreateEnemy" routine
; in bank 2, but it's here instead for... reasons.

CreateEnemy_TryAllSlots_Bank1:
      LDY     #8
      BNE     loc_BANK1_BB16

CreateEnemy_Bank1:
      LDY     #5

loc_BANK1_BB16:
      LDA     EnemyState,Y
      BEQ     loc_BANK1_BB1F

      DEY
      BPL     loc_BANK1_BB16

      RTS

; ---------------------------------------------------------------------------

loc_BANK1_BB1F:
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
      JSR     EnemyInit_Basic_Bank1

      JSR     sub_BANK1_BA48

      LDX     byte_RAM_12
      RTS

; End of function CreateEnemy_TryAllSlots_Bank1

; ---------------------------------------------------------------------------
; The rest of this bank is empty

; [000004AE BYTES: END OF AREA UNUSED_empty_3B52. PRESS KEYPAD "-" TO COLLAPSE]
; ===========================================================================

