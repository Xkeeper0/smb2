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

      LDA     #$01
      JSR     ChangeNametableMirroring

      LDA     CurrentLevelEntryPage
      BNE     loc_BANK0_8013

loc_BANK0_800F:
      LDA     #$09
      BNE     loc_BANK0_8016

loc_BANK0_8013:
      SEC
      SBC     #$01

loc_BANK0_8016:
      ORA     #$C0
      STA     byte_RAM_CF
      SEC
      SBC     #$40
      STA     byte_RAM_CE
      LDA     CurrentLevelEntryPage

loc_BANK0_8022:
      CLC
      ADC     #$01
      CMP     #$0A
      BNE     loc_BANK0_802B

      LDA     #$00

loc_BANK0_802B:
      ORA     #$10
      STA     byte_RAM_D0
      LDA     CurrentLevelEntryPage
      LDY     #$00
      JSR     sub_BANK0_86EE

      LDA     #$20
      STA     byte_RAM_D3
      LDA     #$60
      STA     byte_RAM_D4
      INC     byte_RAM_502
      LDA     #$E0
      STA     byte_RAM_E2
      LDA     #$01
      STA     byte_RAM_E4
      STA     byte_RAM_53A
      LSR     A
      STA     byte_RAM_D2
      LDY     CurrentLevelEntryPage
      JSR     sub_BANK0_95AF

      STA     ScreenYLo
      STY     ScreenYHi
      JSR     sub_BANK0_946D

loc_BANK0_805D:
      LDA     #$00
      STA     byte_RAM_6
      LDA     #$0FF
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
      LDA     #$00
      STA     byte_RAM_502

locret_BANK0_8082:
      RTS

; End of function sub_BANK0_8000

; =============== S U B R O U T I N E =======================================

sub_BANK0_8083:
      LDA     NeedVerticalScroll
      AND     #$04
      BNE     loc_BANK0_809D

      LDA     NeedVerticalScroll
      AND     #$07
      BNE     loc_BANK0_8092

      JMP     loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_8092:
      LDA     NeedVerticalScroll
      ORA     #$04
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
      AND     #$0F
      CMP     #$09
      BNE     loc_BANK0_80B1

      JMP     loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_80B1:
      LDA     #$01
      JSR     SetObjectLocks

      LDA     PPUScrollYMirror
      SEC
      SBC     #$04
      STA     PPUScrollYMirror
      LDA     ScreenYLo
      SEC
      SBC     #$04
      STA     ScreenYLo
      BCS     loc_BANK0_80C8

      DEC     ScreenYHi

loc_BANK0_80C8:
      LDA     PPUScrollYMirror
      CMP     #$0FC
      BNE     loc_BANK0_80DB

      LDA     #$0EC
      STA     PPUScrollYMirror
      LDA     byte_RAM_C8
      EOR     #$02
      STA     byte_RAM_C8
      LSR     A
      STA     byte_RAM_C9

loc_BANK0_80DB:
      LDA     PPUScrollYMirror
      AND     #$07
      BEQ     loc_BANK0_80E2

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_80E2:
      LDX     #$00
      JSR     loc_BANK0_8287

      INX
      JSR     loc_BANK0_8287

      LDA     PPUScrollYMirror
      AND     #$0F
      BNE     loc_BANK0_80FB

      LDX     #$00
      JSR     sub_BANK0_8297

      LDX     #$01
      JSR     sub_BANK0_8297

loc_BANK0_80FB:
      LDX     #$01
      JSR     sub_BANK0_82E2

      JMP     loc_BANK0_8170

; ---------------------------------------------------------------------------

loc_BANK0_8103:
      BNE     loc_BANK0_8121

      LDA     byte_RAM_53F
      STA     byte_RAM_F
      CMP     #$09
      BNE     loc_BANK0_8114

      LDA     #$00
      STA     byte_RAM_F
      BEQ     loc_BANK0_8116

loc_BANK0_8114:
      INC     byte_RAM_F

loc_BANK0_8116:
      LDA     byte_RAM_D0
      AND     #$0F
      CMP     byte_RAM_F
      BNE     loc_BANK0_8121

      JMP     loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_8121:
      LDA     #$01
      JSR     SetObjectLocks

      LDA     PPUScrollYMirror
      CLC
      ADC     #$04
      STA     PPUScrollYMirror
      LDA     ScreenYLo
      CLC
      ADC     #$04
      STA     ScreenYLo
      BCC     loc_BANK0_8138

      INC     ScreenYHi

loc_BANK0_8138:
      LDA     PPUScrollYMirror
      AND     #$07
      BEQ     loc_BANK0_813F

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_813F:
      LDA     PPUScrollYMirror
      CMP     #$F0
      BNE     loc_BANK0_8152

      LDA     #$00
      STA     PPUScrollYMirror
      LDA     byte_RAM_C8
      EOR     #$02
      STA     byte_RAM_C8
      LSR     A
      STA     byte_RAM_C9

loc_BANK0_8152:
      LDX     #$02
      JSR     sub_BANK0_828F

      DEX
      JSR     sub_BANK0_828F

      LDA     byte_RAM_D4
      AND     #$20
      BNE     loc_BANK0_816B

      LDX     #$02
      JSR     sub_BANK0_82BE

      LDX     #$01
      JSR     sub_BANK0_82BE

loc_BANK0_816B:
      LDX     #$02
      JSR     sub_BANK0_82E2

loc_BANK0_8170:
      LDA     byte_RAM_504
      CMP     #$12
      BNE     loc_BANK0_818F

      LDA     #$01
      STA     byte_RAM_E4
      LDA     NeedVerticalScroll
      LSR     A
      BCC     loc_BANK0_8186

      LDX     #$01
      LDA     #$00
      BEQ     loc_BANK0_818A

loc_BANK0_8186:
      LDX     #$02
      LDA     #$10

loc_BANK0_818A:
      STA     byte_RAM_1
      JSR     sub_BANK0_8314

loc_BANK0_818F:
      JSR     sub_BANK0_833E

      DEC     byte_RAM_504
      BNE     locret_BANK0_81A0

      LDA     #$00
      JSR     SetObjectLocks

loc_BANK0_819C:
      LDA     #$00
      STA     NeedVerticalScroll

locret_BANK0_81A0:
      RTS

; End of function sub_BANK0_8083

; ---------------------------------------------------------------------------
      .BYTE $01


;
; Stashes screen scrolling information so that it can be restored after leaving
; the pause screen
;
StashScreenScrollPosition:
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
      LDA     #$00
      STA     PPUScrollYMirror
      STA     PPUScrollXMirror
      STA     byte_RAM_C8
      STA     byte_RAM_C9
      RTS


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
      SBC     #$08
      STA     byte_RAM_E1

loc_BANK0_820B:
      LDA     #$01
      STA     byte_RAM_E4
      LDA     byte_RAM_CF
      STA     byte_RAM_CE
      LDA     #$10
      STA     byte_RAM_1
      LDX     #$00
      JSR     sub_BANK0_8314

      LDA     byte_RAM_D3
      STA     byte_RAM_D2
      LDA     byte_RAM_E1
      STA     byte_RAM_E2
      LDX     #$01
      JSR     sub_BANK0_846A

      LDA     #$F0
      STA     byte_RAM_506
      STA     byte_RAM_507
      LDA     byte_RAM_D0
      STA     byte_RAM_505
      INC     byte_RAM_D5
      LDA     #$01
      STA     byte_RAM_6
      RTS

; End of function sub_BANK0_81FE

; =============== S U B R O U T I N E =======================================

sub_BANK0_823D:
      LDX     #$00
      STX     byte_RAM_537
      JSR     sub_BANK0_82E2

      JSR     sub_BANK0_833E

      LDX     #$00
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
      LDA     #$00
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
      AND     #$0F
      CLC
      ADC     #$E0
      STA     byte_RAM_CF,X
      DEC     byte_RAM_CF,X
      LDA     byte_RAM_CF,X
      CMP     #$0DF
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
      AND     #$0F
      STA     byte_RAM_CE,X
      INC     byte_RAM_CE,X
      LDA     byte_RAM_CE,X
      CMP     #$0A
      BNE     loc_BANK0_82DD

      LDA     #$00
      STA     byte_RAM_CE,X

loc_BANK0_82DD:
      LDA     #$00
      STA     byte_RAM_D2,X

locret_BANK0_82E1:
      RTS

; End of function sub_BANK0_82BE

; =============== S U B R O U T I N E =======================================

sub_BANK0_82E2:
      LDA     byte_RAM_CE,X
      AND     #$0F
      TAY
      LDA     DecodedLevelPageStartLo_Bank1,Y
      STA     byte_RAM_E9
      LDA     DecodedLevelPageStartHi_Bank1,Y
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
      LDA     #$0F
      STA     byte_RAM_E3
      LDA     #$00
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
      LDA     #$00
      STA     byte_RAM_D6
      LDA     #$0F
      STA     byte_RAM_E3
      LDA     byte_RAM_D5
      BEQ     loc_BANK0_836C

      LDY     byte_RAM_D7
      CPY     #$E0
      BNE     loc_BANK0_836C

      LDA     #$00
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

      LDA     #$00
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

      LDX     #$01
      JSR     sub_BANK0_8412

      LDX     #$01
      JSR     sub_BANK0_846A

      JMP     loc_BANK0_83DE

; ---------------------------------------------------------------------------

loc_BANK0_83D4:
      LDX     #$00
      JSR     sub_BANK0_8412

      LDX     #$00
      JSR     sub_BANK0_8478

loc_BANK0_83DE:
      LDX     #$00
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
      EOR     #$01
      STA     byte_RAM_D5
      RTS

; End of function sub_BANK0_833E

; =============== S U B R O U T I N E =======================================

; something to do with background tile palettes in vertical levels?
sub_BANK0_8412:
      LDY     byte_RAM_300
      LDA     byte_RAM_D1
      ORA     #$03
      STA     PPUBuffer_301,Y
      INY
      LDA     byte_RAM_E1,X
      STA     PPUBuffer_301,Y
      INY
      LDA     #$08
      STA     PPUBuffer_301,Y
      INY
      LDX     #$07

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

      LDA     #$01
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
      ADC     #$08
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
      SBC     #$08
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
      LDX     #$07
      LDA     #$00

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

      LDA     #$00
      JSR     ChangeNametableMirroring

      JSR     sub_BANK0_946D

      LDA     #$00
      STA     PPUScrollYMirror
      LDA     CurrentLevelEntryPage
      BNE     loc_BANK0_851A

      LDA     #$09
      BNE     loc_BANK0_851D

loc_BANK0_851A:
      SEC
      SBC     #$01

loc_BANK0_851D:
      ORA     #$D0
      STA     byte_RAM_CF
      SEC
      SBC     #$20
      STA     byte_RAM_CE
      LDA     CurrentLevelEntryPage
      CLC
      ADC     #$01
      CMP     #$0A
      BNE     loc_BANK0_8532

      LDA     #$00

loc_BANK0_8532:
      ORA     #$10
      STA     byte_RAM_D0
      LDA     CurrentLevelEntryPage
      LDY     #$01
      JSR     sub_BANK0_86EE

      INC     byte_RAM_502
      LDA     CurrentLevelEntryPage
      STA     ScreenBoundaryLeftHi
      LDA     #$01
      STA     byte_RAM_53A
      LSR     A
      STA     byte_RAM_6
      LDA     #$0FF
      STA     byte_RAM_505
      LDA     #$0F
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
      LDA     CurrentLevelEntryPage
      BNE     loc_BANK0_8576

      LDA     byte_RAM_BA
      BMI     loc_BANK0_85E7

      LDA     CurrentLevelEntryPage

loc_BANK0_8576:
      CMP     byte_RAM_53F
      BNE     loc_BANK0_857F

      LDA     byte_RAM_BA
      BPL     loc_BANK0_85E7

loc_BANK0_857F:
      LDX     #$02
      LDA     byte_RAM_BA
      BPL     loc_BANK0_858B

      LDA     #$0FF
      STA     byte_RAM_B
      BNE     loc_BANK0_858F

loc_BANK0_858B:
      LDA     #$00
      STA     byte_RAM_B

loc_BANK0_858F:
      LDA     byte_RAM_BA
      AND     #$F0
      CLC
      ADC     byte_RAM_CE,X
      PHP
      ADC     byte_RAM_B
      PLP
      STA     byte_RAM_C
      LDA     byte_RAM_B
      BNE     loc_BANK0_85B1

      BCC     loc_BANK0_85C2

      LDA     byte_RAM_CE,X
      AND     #$0F
      CMP     #$09
      BNE     loc_BANK0_85C2

      LDA     byte_RAM_C
      AND     #$F0
      JMP     loc_BANK0_85C4

; ---------------------------------------------------------------------------

loc_BANK0_85B1:
      BCS     loc_BANK0_85C2

      LDA     byte_RAM_CE,X
      AND     #$0F
      BNE     loc_BANK0_85C2

      LDA     byte_RAM_C
      AND     #$F0
      ADC     #$09
      JMP     loc_BANK0_85C4

; ---------------------------------------------------------------------------

loc_BANK0_85C2:
      LDA     byte_RAM_C

loc_BANK0_85C4:
      STA     byte_RAM_CE,X
      DEX
      BPL     loc_BANK0_858F

      LDA     byte_RAM_BA
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      AND     #$F0
      STA     CurrentLevelPageX
      LDA     byte_RAM_BA
      BPL     loc_BANK0_85E7

      DEC     ScreenBoundaryLeftHi
      LDA     byte_RAM_C9
      EOR     #$01
      STA     byte_RAM_C9
      LDA     #$01
      STA     byte_RAM_507

loc_BANK0_85E7:
      LDA     #$00
      STA     byte_RAM_BA
      RTS

; End of function sub_BANK0_856A

; =============== S U B R O U T I N E =======================================

sub_BANK0_85EC:
      LDA     #$00
      STA     byte_RAM_51C
      LDA     byte_RAM_538
      BEQ     loc_BANK0_862C

      LDA     byte_RAM_538
      LSR     A
      BCS     loc_BANK0_8618

      LDX     #$02
      STX     byte_RAM_9
      LDA     #$10
      STA     byte_RAM_1
      DEX
      LDA     byte_RAM_538
      STA     NeedVerticalScroll
      JSR     sub_BANK0_8901

      LDA     byte_RAM_3
      STA     byte_RAM_D0
      LDA     #$00
      STA     byte_RAM_538
      BEQ     loc_BANK0_862C

loc_BANK0_8618:
      LDX     #$01
      STX     byte_RAM_9
      DEX
      STX     byte_RAM_1
      LDA     byte_RAM_538
      STA     NeedVerticalScroll
      JSR     sub_BANK0_8901

      LDA     #$00
      STA     byte_RAM_538

loc_BANK0_862C:
      LDA     byte_RAM_BA
      BNE     loc_BANK0_8631

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8631:
      LDA     byte_RAM_BA
      BPL     loc_BANK0_863C

      LDA     #$01
      STA     NeedVerticalScroll
      JMP     loc_BANK0_869A

; ---------------------------------------------------------------------------

loc_BANK0_863C:
      LDA     #$02
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
      ADC     #$01
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      BCC     loc_BANK0_8669

      INC     ScreenBoundaryLeftHi
      LDA     byte_RAM_C9
      EOR     #$01
      STA     byte_RAM_C9
      ASL     A
      STA     byte_RAM_C8

loc_BANK0_8669:
      LDA     ScreenBoundaryLeftHi
      CMP     byte_RAM_53F
      BEQ     loc_BANK0_8685

      LDA     PPUScrollXMirror
      AND     #$F0
      CMP     CurrentLevelPageX
      BEQ     loc_BANK0_8682

      STA     CurrentLevelPageX
      LDA     #$01
      STA     byte_RAM_51C

loc_BANK0_8682:
      DEX
      BNE     loc_BANK0_8642

loc_BANK0_8685:
      LDA     byte_RAM_51C
      BEQ     loc_BANK0_86E9

      LDX     #$02

loc_BANK0_868C:
      JSR     loc_BANK0_87FC

      DEX
      BNE     loc_BANK0_868C

      LDX     #$02
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
      SBC     #$01
      STA     PPUScrollXMirror
      STA     ScreenBoundaryLeftLo
      BCS     loc_BANK0_86C0

      DEC     ScreenBoundaryLeftHi
      LDA     byte_RAM_C9
      EOR     #$01
      STA     byte_RAM_C9
      ASL     A
      STA     byte_RAM_C8

loc_BANK0_86C0:
      LDA     PPUScrollXMirror
      AND     #$F0
      CMP     CurrentLevelPageX
      BEQ     loc_BANK0_86D1

      STA     CurrentLevelPageX
      LDA     #$01
      STA     byte_RAM_51C

loc_BANK0_86D1:
      INX
      BNE     loc_BANK0_869C

      LDA     byte_RAM_51C
      BEQ     loc_BANK0_86E9

      LDX     #$02

loc_BANK0_86DB:
      JSR     loc_BANK0_87E6

      DEX
      BNE     loc_BANK0_86DB

      LDX     #$01
      JSR     sub_BANK0_8812

loc_BANK0_86E6:
      JSR     sub_BANK0_8872

loc_BANK0_86E9:
      LDA     #$00
      STA     NeedVerticalScroll
      RTS

; End of function sub_BANK0_85EC

; =============== S U B R O U T I N E =======================================

sub_BANK0_86EE:
      LSR     A
      BCS     loc_BANK0_86FC

      LDA     #$01
      STA     byte_RAM_C9
      ASL     A
      STA     byte_RAM_C8
      LDA     #$20
      BNE     loc_BANK0_8705

loc_BANK0_86FC:
      LDA     #$00
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
      STA     CurrentLevelEntryPage
      JSR     sub_BANK0_86EE

      LDA     #$00
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
      ADC     #$00
      CMP     #$0A
      BNE     loc_BANK0_87A2

      LDA     #$00

loc_BANK0_87A2:
      STA     byte_RAM_505
      LDA     #$01
      STA     byte_RAM_6
      RTS

; End of function sub_BANK0_8785

; =============== S U B R O U T I N E =======================================

sub_BANK0_87AA:
      LDX     #$00
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
      ADC     #$01
      CMP     byte_RAM_D2
      BNE     loc_BANK0_87DA

loc_BANK0_87CB:
      LDA     #$00
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

      LDX     #$00
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
      CMP     #$0EF
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
      CMP     #$0A
      BNE     locret_BANK0_8811

      LDA     #$00
      STA     byte_RAM_CE,X

locret_BANK0_8811:
      RTS

; End of function sub_BANK0_87AA

; =============== S U B R O U T I N E =======================================

sub_BANK0_8812:
      STY     byte_RAM_F
      LDA     byte_RAM_CE,X
      AND     #$0F
      TAY
      LDA     DecodedLevelPageStartLo_Bank1,Y
      STA     byte_RAM_E9
      LDA     DecodedLevelPageStartHi_Bank1,Y
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
      LDY     #$02
      LDA     byte_RAM_CE,X
      STA     byte_RAM_3
      SEC
      SBC     byte_RAM_1
      STA     byte_RAM_CE,X
      JSR     sub_BANK0_8812

      LDA     #$07
      STA     byte_RAM_E3
      LDA     #$00
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
      ORA     #$03
      STA     byte_RAM_3BC
      LDX     byte_RAM_8
      RTS

; End of function sub_BANK0_883C

; =============== S U B R O U T I N E =======================================

sub_BANK0_8872:
      LDA     #$0F
      STA     byte_RAM_E3
      LDA     #$00
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
      CMP     #$0F
      BCC     loc_BANK0_887D

      LDA     #$00
      STA     byte_RAM_3BC
      LDA     NeedVerticalScroll
      LSR     A
      BCS     loc_BANK0_88F2

      LDA     byte_RAM_D2
      AND     #$02
      BEQ     loc_BANK0_88FD

      LDA     NeedVerticalScroll
      BNE     loc_BANK0_88F8

      LDA     #$10
      STA     byte_RAM_1
      LDX     #$00
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
      AND     #$02
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

      LDX     #$07
      STX     byte_RAM_E
      LDY     #$00

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
      CMP     #03
      BNE     loc_BANK0_890A

      RTS

; End of function sub_BANK0_8901

; =============== S U B R O U T I N E =======================================

sub_BANK0_8925:
      STY     byte_RAM_F
      LDA     #01
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

SetObjectLocks:
      LDX     #$07

SetObjectLocks_Loop:
      STA     ObjectLock-1,X
      DEX
      BPL     SetObjectLocks_Loop

      RTS

; End of function SetObjectLocks

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
      LDA     #ObjAttrib_Palette0
      STA     PlayerAttributes
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
      JSR     PlayerGravity

      ; player animation frame, crouch jump charging
      JSR     sub_BANK0_8C1A

      ; maybe only y-collision?
      JSR     PlayerTileCollision

      ; screen boundary x-collision
      JSR     PlayerAreaBoundaryCollision

      JSR     sub_BANK0_8EA4

; =============== S U B R O U T I N E =======================================

sub_BANK0_8A50:
      LDX     #$00
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
      CMP     #02
      BEQ     LoseALife

      JSR     sub_BANK0_8EA4

      LDA     PlayerYVelocity
      BMI     loc_BANK0_8A72

      CMP     #$39
      BCS     locret_BANK0_8A86

loc_BANK0_8A72:
      INC     PlayerYVelocity
      INC     PlayerYVelocity
      RTS

; ---------------------------------------------------------------------------

LoseALife:
      LDA     #02
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
      CPY     #$02
      BCC     loc_BANK0_8ABB

      CPY     #$07
      BNE     loc_BANK0_8A9D

      LDA     #DPCM_ItemPull
      STA     DPCMQueue

loc_BANK0_8A9D:
      DEC     ObjectBeingCarriedTimer,X
      LDA     PlayerLiftFrames,Y
      STA     PlayerAnimationFrame
      LDA     EnemyState,X
      CMP     #$06
      BEQ     loc_BANK0_8AB0

      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      BNE     loc_BANK0_8AB5

loc_BANK0_8AB0:
      LDA     PlayerLiftTimer-2,Y
      BPL     loc_BANK0_8AB8

loc_BANK0_8AB5:
      LDA     PickupSpeedAnimation-2,Y

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


PlayerLiftTimer:
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
      CPY     #$02
      BNE     loc_BANK0_8ADF

      JSR     sub_BANK0_8B19

loc_BANK0_8ADF:
      LDA     byte_BANKF_F225,Y
      STA     PlayerYVelocity
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Right|ControllerInput_Left
      TAY
      LDA     byte_BANK0_8ACE,Y
      STA     PlayerXVelocity
      LDA     PlayerXLo
      CLC
      ADC     #$04
      AND     #$0F
      CMP     #$08
      BCS     loc_BANK0_8B14

      LDY     byte_BANKF_F00B
      LDA     PlayerYVelocity
      BMI     loc_BANK0_8B01

      INY

loc_BANK0_8B01:
      LDX     #$00
      JSR     PlayerTileCollision_CheckClimbable

      BCS     loc_BANK0_8B0E

loc_BANK0_8B08:
      LDA     PlayerYVelocity
      BPL     loc_BANK0_8B14

      STX     PlayerYVelocity

loc_BANK0_8B0E:
      JSR     sub_BANK0_8A50

      JMP     sub_BANK0_8EA4

; ---------------------------------------------------------------------------

loc_BANK0_8B14:
      LDA     #$00
      STA     PlayerState
      RTS

; =============== S U B R O U T I N E =======================================

sub_BANK0_8B19:
      LDA     byte_RAM_10
      AND     #$07
      BNE     locret_BANK0_8B2A

      LDA     byte_RAM_9D
      EOR     #$01
      STA     byte_RAM_9D
      LDA     #SoundEffect2_Climbing
      STA     SoundEffectQueue2

locret_BANK0_8B2A:
      RTS

; End of function sub_BANK0_8B19


ClimbableTiles:
      .BYTE BackgroundTile_Vine
      .BYTE BackgroundTile_VineStandable
      .BYTE BackgroundTile_VineBottom
      .BYTE BackgroundTile_UnusedC4
      .BYTE BackgroundTile_Chain
      .BYTE BackgroundTile_Ladder
      .BYTE BackgroundTile_LadderShadow
      .BYTE BackgroundTile_LadderStandable
      .BYTE BackgroundTile_LadderStandableShadow
      .BYTE BackgroundTile_ChainStandable


;
; Checks whether the player is on a climbable tile
;
; Input
;   byte_RAM_0 = tile ID
; Output
;   C = set if the player is on a climbable tile
;
PlayerTileCollision_CheckClimbable:
      JSR     sub_BANK0_924F

      LDA     byte_RAM_0
      LDY     #$09

PlayerTileCollision_CheckClimbable_Loop:
      CMP     ClimbableTiles,Y
      BEQ     PlayerTileCollision_CheckClimbable_Exit

      DEY
      BPL     PlayerTileCollision_CheckClimbable_Loop

      CLC

PlayerTileCollision_CheckClimbable_Exit:
      RTS


HandlePlayerState_GoingDownJar:
      LDA     #ObjAttrib_BehindBackground
      STA     PlayerAttributes
      INC     PlayerYLo
      LDA     PlayerYLo
      AND     #$0F
      BNE     HandlePlayerState_GoingDownJar_Exit

      STA     PlayerState
      JSR     DoAreaReset

      PLA
      PLA
      JSR     StashPlayerPosition_Bank0

      LDA     #TransitionType_Jar
      STA     TransitionType
      LDA     InJarType
      BNE     HandlePlayerState_GoingDownJar_NonWarp

      LDA     #GameMode_Warp
      STA     GameMode
      RTS

HandlePlayerState_GoingDownJar_NonWarp:
      CMP     #$01
      BEQ     HandlePlayerState_GoingDownJar_Regular

      STA     DoAreaTransition
      RTS

HandlePlayerState_GoingDownJar_Regular:
      STA     InSubspaceOrJar

HandlePlayerState_GoingDownJar_Exit:
      RTS


HandlePlayerState_ExitingJar:
      LDA     #ObjAttrib_BehindBackground
      STA     PlayerAttributes
      DEC     PlayerYLo
      LDA     PlayerYLo
      AND     #$0F
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
      LDA     PlayerYVelocity
      ASL     A
      ROL     A
      AND     #$01
      TAY
      LDA     PlayerScreenYHi
      CMP     byte_BANK0_8B87,Y
      BNE     loc_BANK0_8BB0

      LDA     PlayerScreenYLo
      CMP     byte_BANK0_8B89,Y
      BNE     loc_BANK0_8BB0

      JSR     DoAreaReset

      INC     DoAreaTransition
      LDA     #TransitionType_Vine
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

      LDA     #ObjAttrib_BehindBackground
      STA     PlayerAttributes
      LDA     #$04
      STA     PlayerXVelocity
      LDA     #$01
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
      LDY     #$04

loc_BANK0_8BF9:
      CMP     byte_BANK0_8BEC,Y
      BNE     loc_BANK0_8C09

      LDA     PlayerCurrentSize
      EOR     #$01

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
      JSR     PlayerStartJump

      LDA     #SoundEffect2_Jump
      STA     SoundEffectQueue2

loc_BANK0_8C3D:
      LDA     byte_RAM_4B2
      BNE     loc_BANK0_8C92

      LDA     QuicksandDepth
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

      AND     #$01
      STA     byte_RAM_9D
      TAY
      LDA     GroundSlipperiness
      LSR     A
      LSR     A
      AND     byte_RAM_10
      BNE     ResetCrouchJumpTimer

      LDA     PlayerXVelocity
      CLC
      ADC     byte_BANK0_8C18,Y
      STA     PlayerXVelocity

ResetCrouchJumpTimer:
      LDA     #$00
      STA     CrouchJumpTimer
      BEQ     loc_BANK0_8C95 ; unconditional branch?

loc_BANK0_8C92:
      JSR     sub_BANK0_8D2C

loc_BANK0_8C95:
      JSR     sub_BANK0_8DC0

      RTS

; End of function sub_BANK0_8C1A


;
; Starts a jump
;
; The jump height is based on a lookup table using the following bitfield:
;
; %xxxxxRCI
;   R = whether the player is running
;   C = whether the crouch timer is charged
;   I = whether the player is holding an item
;
PlayerStartJump:
      LDA     QuicksandDepth
      CMP     #$02
      BCC     PlayerStartJump_LoadXVelocity

      ; Quicksand
      LDA     byte_RAM_552
      STA     PlayerYVelocity
      BNE     PlayerStartJump_Exit

PlayerStartJump_LoadXVelocity:
      ; The x-velocity may affect the jump
      LDA     PlayerXVelocity
      BPL     PlayerStartJump_CheckXSpeed

      ; Absolute value of x-velocity
      EOR     #$0FF
      CLC
      ADC     #$01

PlayerStartJump_CheckXSpeed:
      ; Set carry flag if the x-speed is fast enough
      CMP     #$08
      ; Clear y subpixel
      LDA     #$00
      STA     PlayerYSubpixel
      ; Set bit for x-speed using carry flag
      ROL     A

      ; Check crouch jump timer
      LDY     CrouchJumpTimer
      CPY     #$3C
      BCC     PlayerStartJump_SetYVelocity

      ; Clear Player1JoypadHeld for a crouch jump
      LDA     #$00
      STA     Player1JoypadHeld

PlayerStartJump_SetYVelocity:
      ; Set bit for charged jump using carry flag
      ROL     A
      ; Set bit for whether player is holding an item
      ASL     A
      ORA     HoldingItem
      TAY
      LDA     JumpHeightStanding,Y
      STA     PlayerYVelocity

      LDA     JumpFloatLength
      STA     byte_RAM_4C9

PlayerStartJump_Exit:
      LDA     #$00
      STA     CrouchJumpTimer
      RTS


; =============== S U B R O U T I N E =======================================

;
; Apply gravity to the player's y-velocity
;
; This also handles floating
;
PlayerGravity:
      LDA     QuicksandDepth
      CMP     #$02
      BCC     loc_BANK0_8CE5

      LDA     byte_RAM_556
      BNE     loc_BANK0_8D13

loc_BANK0_8CE5:
      LDA     byte_RAM_554
      LDY     Player1JoypadHeld ; holding jump button to fight physics
      BPL     PlayerGravity_Falling

      LDA     JumpPhysicsShit
      LDY     PlayerYVelocity
      CPY     #$0FC
      BMI     PlayerGravity_Falling

      LDY     byte_RAM_4C9
      BEQ     PlayerGravity_Falling

      DEC     byte_RAM_4C9
      LDA     byte_RAM_10
      LSR     A
      LSR     A
      LSR     A
      AND     #$03
      TAY
      LDA     FloatingYVelocity,Y
      STA     PlayerYVelocity
      RTS

PlayerGravity_Falling:
      LDY     PlayerYVelocity
      BMI     loc_BANK0_8D13

      CPY     #$39
      BCS     loc_BANK0_8D18

loc_BANK0_8D13:
      CLC
      ADC     PlayerYVelocity
      STA     PlayerYVelocity

loc_BANK0_8D18:
      LDA     byte_RAM_4C9
      CMP     JumpFloatLength
      BEQ     PlayerGravity_Exit

      LDA     #$00
      STA     byte_RAM_4C9

PlayerGravity_Exit:
      RTS


FloatingYVelocity:
      .BYTE $FC
      .BYTE $00
      .BYTE $04
      .BYTE $00

PlayerXDeceleration:
      .BYTE $FD
      .BYTE $03


; =============== S U B R O U T I N E =======================================

sub_BANK0_8D2C:
      LDA     PlayerInAir
      BNE     locret_BANK0_8D61

      LDA     byte_RAM_10
      AND     GroundSlipperiness
      BNE     loc_BANK0_8D4D

      LDA     PlayerXVelocity
      AND     #$80
      ASL     A
      ROL     A
      TAY
      LDA     PlayerXVelocity
      ADC     PlayerXDeceleration,Y
      TAX
      EOR     byte_BANK0_8C18,Y
      BMI     loc_BANK0_8D4B

      LDX     #$00

loc_BANK0_8D4B:
      STX     PlayerXVelocity

loc_BANK0_8D4D:
      LDA     PlayerDucking
      BNE     locret_BANK0_8D61

      LDA     PlayerAnimationFrame
      CMP     #SpriteAnimation_Throwing
      BEQ     locret_BANK0_8D61

      LDA     #SpriteAnimation_Standing
      STA     PlayerAnimationFrame
      LDA     #$00
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
      LDY     GroundSlipperiness
      BNE     NextPlayerWalkFrame

      LDA     PlayerXVelocity
      BPL     PlayerWalkFrameDuration

; use absolute value of PlayerXVelocity
      EOR     #$0FF
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
      LDY     #$02
      LDA     QuicksandDepth
      CMP     #$02
      BCS     loc_BANK0_8DE0

      DEY
      LDA     HoldingItem
      BEQ     loc_BANK0_8DDF

      LDX     byte_RAM_42D
      LDA     ObjectType,X
      CMP     #Enemy_VegetableSmall
      BCC     loc_BANK0_8DE0

      CMP     #Enemy_MushroomBlock
      BCC     loc_BANK0_8DDF

      CMP     #Enemy_FallingLogs
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
      CMP     PlayerXVelocity
      BPL     loc_BANK0_8DF2

      STA     PlayerXVelocity

loc_BANK0_8DF2:
      LDA     unk_RAM_55A,Y
      BIT     Player1JoypadHeld
      BVC     loc_BANK0_8DFF

      SEC
      ROR     A
      CLC
      ADC     unk_RAM_55A,Y

loc_BANK0_8DFF:
      CMP     PlayerXVelocity
      BMI     loc_BANK0_8E05

      STA     PlayerXVelocity

loc_BANK0_8E05:
      BIT     Player1JoypadPress
      BVC     locret_BANK0_8E41

      LDA     HoldingItem
      BEQ     locret_BANK0_8E41

      LDY     #$00
      LDX     byte_RAM_42D
      LDA     EnemyState,X
      CMP     #EnemyState_Sand
      BEQ     locret_BANK0_8E41

      LDA     ObjectType,X
      CMP     #Enemy_MushroomBlock
      BCC     loc_BANK0_8E22

      CMP     #Enemy_POWBlock
      BCC     loc_BANK0_8E28

loc_BANK0_8E22:
      CMP     #Enemy_Bomb
      BCC     loc_BANK0_8E42

      LDY     #$02

loc_BANK0_8E28:
      STY     byte_RAM_7
      LDA     byte_RAM_9D
      ASL     A
      ORA     PlayerDucking
      TAX
      LDY     byte_BANKF_F006,X
      LDX     #$00
      JSR     sub_BANK0_924F

      LDA     byte_RAM_0
      LDY     byte_RAM_7
      JSR     sub_BANK0_9053

      BCC     loc_BANK0_8E42
      ; else carried item can't be thrown

locret_BANK0_8E41:
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8E42:
      LDA     #SpriteAnimation_Throwing
      STA     PlayerAnimationFrame
      LDA     #$02
      STA     PlayerWalkFrame
      LDA     #$0A
      STA     PlayerWalkFrameCounter
      DEC     HoldingItem
      LDA     #SoundEffect1_ThrowItem
      STA     SoundEffectQueue1
      LDA     #$00
      STA     PlayerDucking
      STA     Player1JoypadPress
      STA     byte_RAM_1
      LDX     byte_RAM_42D
      LDA     #Enemy_Coin
      CMP     ObjectType,X
      ROL     byte_RAM_1
      LDA     PlayerXVelocity
      BPL     loc_BANK0_8E6F

      EOR     #$0FF
      CLC
      ADC     #$01

loc_BANK0_8E6F:
      CMP     #$08
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
      STA     ObjectYVelocity,X
      LDA     byte_RAM_1
      ASL     A
      ORA     byte_RAM_9D
      TAY
      LDA     byte_BANK0_8DB2,Y
      STA     ObjectXVelocity,X
      LDA     #$01
      STA     EnemyArray_42F,X
      LSR     A
      STA     ObjectBeingCarriedTimer,X
      RTS


; =============== S U B R O U T I N E =======================================

sub_BANK0_8EA4:
      LDX     #$0A

; End of function sub_BANK0_8EA4

; =============== S U B R O U T I N E =======================================

sub_BANK0_8EA6:
      LDA     ObjectXVelocity-1,X
      CLC
      ADC     ObjectXAcceleration-1,X
      PHP
      BPL     loc_BANK0_8EB4

      EOR     #$0FF
      CLC
      ADC     #$01

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
      ADC     ObjectXSubpixel-1,X
      STA     ObjectXSubpixel-1,X
      TYA
      ADC     #$00
      PLP
      BPL     loc_BANK0_8ED1

      EOR     #$0FF
      CLC
      ADC     #$01

loc_BANK0_8ED1:
      LDY     #$00
      CMP     #$00
      BPL     loc_BANK0_8ED8

      DEY

loc_BANK0_8ED8:
      CLC
      ADC     PlayerXLo,X
      STA     PlayerXLo,X
      TYA
      ADC     PlayerXHi,X
      STA     PlayerXHi,X
      LDA     #$00
      STA     ObjectXAcceleration-1,X
      RTS

; End of function sub_BANK0_8EA6


;
; Jumpthrough collision results
;
; This table determines per direction whether a tile is solid (for jumpthrough
; blocks) or interactive (for spikes/ice/conveyors)
;
;   $01 = true
;   $02 = false
;
JumpthroughTileCollisionTable:
InteractiveTileCollisionTable:
      .BYTE $02 ; jumpthrough bottom (y-velocity < 0)
      .BYTE $02
      .BYTE $01 ; jumpthrough top (y-velocity > 0)
      .BYTE $01
      .BYTE $02 ; jumpthrough right (x-velocity < 0)
      .BYTE $02
      .BYTE $02 ; jumpthrough left (x-velocity > 0)
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

ConveyorSpeedTable:
      .BYTE $F0
      .BYTE $10


;
; Player Tile Collision
; =====================
;
; Handles player collision with background tiles
;
PlayerTileCollision:
      ; Reset a bunch of collision flags
      LDA     #$00
      STA     PlayerCollision
      STA     GroundSlipperiness
      STA     byte_RAM_7
      STA     byte_RAM_A ; conveyor
      STA     byte_RAM_E ; spikes
      STA     byte_RAM_C ; ice

      JSR     PlayerTileCollision_CheckCherryAndClimbable

      ; Determine bounding box lookup index
      LDA     PlayerDucking
      ASL     A
      ORA     HoldingItem
      TAX

      ; Look up the bounding box for collision detection
      LDA     byte_BANKF_F000,X
      STA     byte_RAM_8

      ; Determine whether the player is going up
      LDA     PlayerYVelocity
      CLC
      ADC     PlayerYAcceleration
      BPL     PlayerTileCollision_Downward

PlayerTileCollision_Upward:
      JSR     sub_BANK0_8FB2 ; use top two tiles
      JSR     sub_BANK0_8FF5 ; skip bottom two tiles

      LDA     PlayerCollision
      BNE     PlayerTileCollision_CheckDamageTile
      BEQ     PlayerTileCollision_Horizontal

PlayerTileCollision_Downward:
      JSR     sub_BANK0_8FF5
      JSR     sub_BANK0_8FB2

      LDA     PlayerCollision
      BNE     PlayerTileCollision_CheckInteractiveTiles

      LDA     #$00
      LDX     #$01

      ; Do the quicksand check in worlds 2 and 6
      LDY     CurrentWorld
      CPY     #$01
      BEQ     PlayerTileCollision_Downward_CheckQuicksand

      CPY     #$05
      BNE     PlayerTileCollision_Downward_AfterCheckQuicksand

PlayerTileCollision_Downward_CheckQuicksand:
      JSR     PlayerTileCollision_CheckQuicksand

PlayerTileCollision_Downward_AfterCheckQuicksand:
      STA     QuicksandDepth
      STX     PlayerInAir
      JMP     PlayerTileCollision_Horizontal

PlayerTileCollision_CheckInteractiveTiles:
      ; Reset quicksand depth
      LDA     #$00
      STA     QuicksandDepth

      LDA     PlayerYLo
      AND     #$0C
      BNE     PlayerTileCollision_Horizontal

      STA     PlayerInAir
      LDA     PlayerYLo
      AND     #$F0
      STA     PlayerYLo

PlayerTileCollision_CheckConveyorTile:
      LSR     byte_RAM_A
      BCC     PlayerTileCollision_CheckSlipperyTile

      LDX     byte_RAM_A
      LDA     ConveyorSpeedTable,X
      STA     PlayerXAcceleration

PlayerTileCollision_CheckSlipperyTile:
      LSR     byte_RAM_C
      BCC     PlayerTileCollision_CheckJar

      LDA     #$0F
      STA     GroundSlipperiness

PlayerTileCollision_CheckJar:
      JSR     TileBehavior_CheckJar

PlayerTileCollision_CheckDamageTile:
      LDA     #$00
      STA     PlayerYVelocity
      STA     PlayerYAcceleration
      LDA     StarInvincibilityTimer
      BNE     PlayerTileCollision_Horizontal

      LSR     byte_RAM_E
      BCC     PlayerTileCollision_Horizontal

      LDA     PlayerScreenX
      STA     SpriteTempScreenX
      ROR     byte_RAM_12
      JSR     PlayerTileCollision_HurtPlayer

PlayerTileCollision_Horizontal:
      LDY     #$02
      LDA     PlayerXVelocity
      CLC
      ADC     PlayerXAcceleration
      BMI     loc_BANK0_8FA3

      DEY
      JSR     sub_BANK0_8FF5

loc_BANK0_8FA3:
      STY     PlayerMovementDirection
      JSR     sub_BANK0_8FB2

      LDA     PlayerCollision
      AND     #CollisionFlags_Right|CollisionFlags_Left
      BEQ     PlayerTileCollision_Exit

      JMP     PlayerHorizontalCollision_Bank0

PlayerTileCollision_Exit:
      RTS


; =============== S U B R O U T I N E =======================================

;
; Check two tiles?
;
; Output
;   byte_RAM_7 += 2
;   byte_RAM_8 += 2
;
sub_BANK0_8FB2:
      JSR     loc_BANK0_8FB5

loc_BANK0_8FB5:
      LDX     #$00
      LDY     byte_RAM_8
      JSR     sub_BANK0_924F

      LDX     byte_RAM_7
      LDY     JumpthroughTileCollisionTable,X
      LDA     byte_RAM_0
      JSR     sub_BANK0_9053

      BCC     loc_BANK0_8FF2

      CMP     #BackgroundTile_Spikes
      BNE     loc_BANK0_8FD3

      ; Spikes behavior
      LDA     InteractiveTileCollisionTable,X
      STA     byte_RAM_E
      BNE     loc_BANK0_8FEB

loc_BANK0_8FD3:
      CMP     #BackgroundTile_JumpThroughIce
      BNE     loc_BANK0_8FDE

      ; Ice behavior
      LDA     InteractiveTileCollisionTable,X
      STA     byte_RAM_C
      BNE     loc_BANK0_8FEB

loc_BANK0_8FDE:
      SEC
      SBC     #BackgroundTile_ConveyorLeft
      CMP     #$02
      BCS     loc_BANK0_8FEB

      ; Conveyor behavior
      ASL     A
      ORA     InteractiveTileCollisionTable,X
      STA     byte_RAM_A

loc_BANK0_8FEB:
      LDA     CollisionFlagTableThing,X
      ORA     PlayerCollision
      STA     PlayerCollision

loc_BANK0_8FF2:
      JMP     loc_BANK0_8FF8

; End of function sub_BANK0_8FB2

; =============== S U B R O U T I N E =======================================

;
; Skip two tiles?
;
; Output
;   byte_RAM_7 += 2
;   byte_RAM_8 += 2
;
sub_BANK0_8FF5:
      JSR     loc_BANK0_8FF8

loc_BANK0_8FF8:
      INC     byte_RAM_7
      INC     byte_RAM_8
      RTS


PlayerTileCollision_CheckCherryAndClimbable:
      LDY     byte_BANKF_F00A

      ; byte_RAM_10 seems to be a global counter
      ; this code increments Y every other frame, but why?
      LDA     byte_RAM_10
      LSR     A
      BCS     PlayerTileCollision_CheckCherryAndClimbable_AfterTick
      INY

PlayerTileCollision_CheckCherryAndClimbable_AfterTick:
      LDX     #$00
      JSR     PlayerTileCollision_CheckClimbable

      BCS     PlayerTileCollision_Climbable

      LDA     byte_RAM_0
      CMP     #BackgroundTile_Cherry
      BNE     PlayerTileCollision_Climbable_Exit

      INC     CherryCount
      LDA     CherryCount
      SBC     #$05
      BNE     PlayerTileCollision_Cherry

      STA     CherryCount
      JSR     CreateStarman

PlayerTileCollision_Cherry:
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffectQueue1
      LDA     #BackgroundTile_Sky
      JMP     loc_BANK0_937C

PlayerTileCollision_Climbable:
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Down|ControllerInput_Up
      BEQ     PlayerTileCollision_Climbable_Exit

      LDY     HoldingItem
      BNE     PlayerTileCollision_Climbable_Exit

      LDA     PlayerXLo
      CLC
      ADC     #$04
      AND     #$0F
      CMP     #$08
      BCS     PlayerTileCollision_Climbable_Exit

      LDA     #PlayerState_Climbing
      STA     PlayerState
      STY     PlayerInAir
      STY     PlayerDucking
      LDA     #SpriteAnimation_Climbing
      STA     PlayerAnimationFrame

      ; Break JSR PlayerTileCollision_CheckCherryAndClimbable
      PLA
      PLA
      ; Break JSR PlayerTileCollision
      PLA
      PLA

PlayerTileCollision_Climbable_Exit:
      RTS


;
; Check whether a collision has occured
;
; Input
;   A = tile ID ???
;   Y = collision table offset
; Output
;   C = whether or not a collision occurred
;
sub_BANK0_9053:
      PHA
      AND     #$C0
      ASL     A
      ROL     A
      ROL     A
      ADC     TileGroupTable,Y
      TAY
      PLA
      CMP     TileSolidnessTable,Y
      RTS


;
; These map the two high bits of a tile to offets in TileSolidnessTable
;
TileGroupTable:
      .BYTE $00
      .BYTE $04
      .BYTE $08


PickUpToEnemyTypeTable:
      .BYTE Enemy_MushroomBlock ; $00
      .BYTE Enemy_MushroomBlock ; $01
      .BYTE Enemy_MushroomBlock ; $02
      .BYTE Enemy_POWBlock ; $03
      .BYTE Enemy_Coin ; $04
      .BYTE Enemy_VegetableLarge ; $05
      .BYTE Enemy_VegetableSmall ; $06
      .BYTE Enemy_Rocket ; $07
      .BYTE Enemy_Shell ; $08
      .BYTE Enemy_Bomb ; $09
      .BYTE Enemy_SubspacePotion ; $0A
      .BYTE Enemy_Mushroom1up ; $0B
      .BYTE Enemy_POWBlock ; $0C
      .BYTE Enemy_BobOmb ; $0D
      .BYTE Enemy_MushroomBlock ; $0E ; this one seems to be overridden for digging in sand


; find a slot for the item being lifted
loc_BANK0_9074:
      LDX     #$06

loc_BANK0_9076:
      LDA     EnemyState,X
      BEQ     loc_BANK0_9080

      INX
      CPX     #$09
      BCC     loc_BANK0_9076

      RTS

; create the sprite for the item being picked up
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
      LDA     #$00
      STA     EnemyArray_42F,X
      STA     EnemyArray_9F,X
      STA     EnemyArray_B1,X
      JSR     UnlinkEnemyFromRawData_Bank1

      LDA     #EnemyState_Alive
      LDY     byte_RAM_9
      CPY     #$0E
      BNE     loc_BANK0_90AE

      LDA     #$20
      STA     EnemyTimer,X
      LDA     #EnemyState_Sand

loc_BANK0_90AE:
      STA     EnemyState,X
      LDA     PickUpToEnemyTypeTable,Y ; What sprite is spawned for you when lifting a bg object
      STA     ObjectType,X

      LDY     #$0FF ; regular bomb fuse
      CMP     #Enemy_Bomb
      BEQ     loc_BANK0_90C1

      CMP     #Enemy_BobOmb
      BNE     loc_BANK0_90C5

      LDY     #$50 ; BobOmb fuse

loc_BANK0_90C1:
      STY     EnemyTimer,X
      BNE     loc_BANK0_90EA

loc_BANK0_90C5:
      CMP     #Enemy_Mushroom1up
      BNE     loc_BANK0_90D5

      LDA     Mushroom1upPulled
      BEQ     loc_BANK0_90EA

      LDA     #Enemy_VegetableSmall
      STA     ObjectType,X

      JMP     loc_BANK0_90EA

loc_BANK0_90D5:
      CMP     #Enemy_VegetableLarge
      BNE     loc_BANK0_90EA

      LDY     BigVeggiesPulled
      INY
      CPY     #$05
      BCC     loc_BANK0_90E7

      LDA     #Enemy_Stopwatch
      STA     ObjectType,X
      LDY     #$00

loc_BANK0_90E7:
      STY     BigVeggiesPulled

loc_BANK0_90EA:
      JSR     loc_BANK1_B9EB

      LDA     #CollisionFlags_Down
      STA     EnemyCollision,X
      LDA     #BackgroundTile_Sky
      JSR     ReplaceTile_Bank0

      LDA     #$07
      STA     ObjectBeingCarriedTimer,X
      STX     byte_RAM_42D
      LDA     #PlayerState_Lifting
      STA     PlayerState
      LDA     #$06
      STA     PlayerStateTimer
      LDA     #SpriteAnimation_Pulling
      STA     PlayerAnimationFrame
      INC     HoldingItem
      RTS


TileBehavior_CheckJar:
      LDY     HoldingItem
      BNE     loc_BANK0_917C

      LDA     PlayerDucking
      BEQ     TileBehavior_CheckPickUp

      LDA     byte_RAM_0
      LDX     InSubspaceOrJar
      CPX     #$02
      BNE     TileBehavior_CheckJar_NotSubspace

      ; In SubSpace, a non-enterable jar can be entered
      ; Now Y = $00
      CMP     #BackgroundTile_JarTopNonEnterable
      BEQ     TileBehavior_GoDownJar

      BNE     loc_BANK0_917C

TileBehavior_CheckJar_NotSubspace:
      INY
      ; Now Y = $01
      CMP     #BackgroundTile_JarTopGeneric
      BEQ     TileBehavior_GoDownJar

      CMP     #BackgroundTile_JarTopPointer
      BNE     loc_BANK0_917C

      INY
      ; Now Y = $02

TileBehavior_GoDownJar:
      LDA     PlayerXLo
      CLC
      ADC     #$04
      AND     #$0F
      CMP     #$08
      BCS     loc_BANK0_917C

      ; Stop horiziontal movement
      LDA     #$00
      STA     PlayerXVelocity

      ; We're going down the jar!
      LDA     #PlayerState_GoingDownJar
      STA     PlayerState

      ; What kind of jar are we going down?
      ; $00 = warp, $01 = regular, $02 = pointer
      STY     InJarType

;
; Snaps the player to the closest tile (for entering doors and jars)
;
SnapPlayerToTile:
      LDA     PlayerXLo
      CLC
      ADC     #$08
      AND     #$F0
      STA     PlayerXLo
      BCC     SnapPlayerToTile_Exit

      LDA     IsHorizontalLevel
      BEQ     SnapPlayerToTile_Exit

      INC     PlayerXHi

SnapPlayerToTile_Exit:
      RTS


TileBehavior_CheckPickUp:
      BIT     Player1JoypadPress
      BVC     loc_BANK0_917C

      ; B button pressed

      LDA     PlayerXLo
      CLC
      ADC     #$06
      AND     #$0F
      CMP     #$0C
      BCS     loc_BANK0_917C

      LDA     byte_RAM_0
      CMP     #BackgroundTile_DiggableSand
      BNE     loc_BANK0_916E

      LDA     #$0E
      BNE     loc_BANK0_9177

; blocks that can be picked up
loc_BANK0_916E:
      CMP     #BackgroundTile_Unused6D
      BCS     loc_BANK0_917C

      ; convert to an index in PickUpToEnemyTypeTable
      SEC
      SBC     #BackgroundTile_MushroomBlock
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
      SBC     #$00
      STA     byte_RAM_4
      STA     byte_RAM_1
      LDA     byte_RAM_3
      STA     byte_RAM_2
      JSR     sub_BANK0_92C1

      BCS     locret_BANK0_91CE

      JSR     SetTileOffsetAndAreaPageAddr_Bank1

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
      CPX     #$02
      BEQ     loc_BANK0_91BF

      LDY     #$04

; check to see if the tile matches one of the door tiles
loc_BANK0_91B7:
      CMP     DoorTiles,Y
      BEQ     loc_BANK0_91EB

      DEY
      BPL     loc_BANK0_91B7

loc_BANK0_91BF:
      BIT     Player1JoypadPress
      BVC     locret_BANK0_91CE

      STA     byte_RAM_0
      CMP     #BackgroundTile_GrassInactive
      BCS     locret_BANK0_91CE

      SEC
      SBC     #BackgroundTile_GrassCoin
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
      ADC     #$04
      STA     byte_RAM_9
      JMP     loc_BANK0_9074

; ---------------------------------------------------------------------------

;
; Checks to see if we're trying to go through the door
;
; Input
;   Y = tile index in DoorTiles
loc_BANK0_91EB:
      LDA     Player1JoypadPress
      AND     #ControllerInput_Up
      BEQ     locret_BANK0_91CE

      ; player is holding up and is trying to go through this door
      LDA     PlayerXLo
      CLC
      ADC     #$05
      AND     #$0F
      CMP     #$0A
      BCS     locret_BANK0_91CE

      CPY     #$04 ; index of BackgroundTile_LightDoorEndLevel
      BNE     loc_BANK0_9205

      ; setting GameMode to $03 to go to Bonus Chance
      DEY
      STY     GameMode
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_9205:
      LDA     #TransitionType_Door
      STA     TransitionType
      TYA
      JSR     JumpToTableAfterJump

DoorHandlingPointers:
      .WORD DoorHandling_UnlockedDoor ; unlocked door
      .WORD DoorHandling_LockedDoor ; locked door
      .WORD DoorHandling_Entrance ; dark door
      .WORD DoorHandling_Entrance ; light door


DoorHandling_UnlockedDoor:
      JSR     DoorAnimation_Unlocked

DoorHandling_GoThroughDoor:
      INC     byte_RAM_4BD
      INC     PlayerLock
      JSR     SnapPlayerToTile

      LDA     #DPCM_DoorOpenBombBom
      STA     DPCMQueue

DoorHandling_Exit:
      RTS


DoorHandling_LockedDoor:
      LDA     HoldingItem
      ; don't come to a locked door empty-handed
      BEQ     DoorHandling_Exit

      ; and make sure you have a key
      LDY     byte_RAM_42D
      LDA     ObjectType,Y
      CMP     #Enemy_Key
      BNE     DoorHandling_Exit

      ; the key has been used
      INC     KeyUsed
      TYA
      TAX

      JSR     TurnKeyIntoPuffOfSmoke
      JSR     DoorAnimation_Locked
      JMP     DoorHandling_GoThroughDoor


DoorHandling_Entrance:
      INC     DoAreaTransition
      JMP     DoAreaReset


DoorTiles:
      .BYTE BackgroundTile_DoorBottom
      .BYTE BackgroundTile_DoorBottomLock
      .BYTE BackgroundTile_DarkDoor
      .BYTE BackgroundTile_LightDoor
      .BYTE BackgroundTile_LightDoorEndLevel

; =============== S U B R O U T I N E =======================================

;
; Seems to determine what kind of tile the player has collided with?
;
; Input
;   Y = bounding box offset?
; Output
;   byte_RAM_0 = tile ID
;
sub_BANK0_924F:
      TXA
      PHA
      LDA     #$00
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

      LDA     #$00
      BEQ     loc_BANK0_92A5

loc_BANK0_929E:
      JSR     SetTileOffsetAndAreaPageAddr_Bank1

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y

loc_BANK0_92A5:
      STA     byte_RAM_0
      PLA
      TAX
      RTS


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


;
; NOTE: This is a copy of the "sub_BANK3_BC2E" routine in Bank 3
;
;
sub_BANK0_92C1:
      LDY     byte_RAM_1
      LDA     byte_RAM_E6
      JSR     sub_BANK0_92AA

      STY     byte_RAM_1
      STA     byte_RAM_E6
      LDY     IsHorizontalLevel
      LDA     byte_RAM_1,Y
      STA     byte_RAM_E8
      LDA     byte_RAM_2
      CMP     byte_BANK0_92E0+1,Y
      BCS     locret_BANK0_92DF

      LDA     byte_RAM_1
      CMP     byte_BANK0_92E0,Y

locret_BANK0_92DF:
      RTS


byte_BANK0_92E0:
      .BYTE $0A
      .BYTE $01
      .BYTE $0B


; Unused?
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


PlayerCollisionDirectionTable:
      .BYTE CollisionFlags_Right
      .BYTE CollisionFlags_Left

PlayerCollisionResultTable_Bank0:
      .BYTE CollisionFlags_80
      .BYTE CollisionFlags_00


;
; Enforces the left/right boundaries of horizontal areas
;
PlayerAreaBoundaryCollision:
      LDA     IsHorizontalLevel
      BEQ     PlayerAreaBoundaryCollision_Exit

      LDA     PlayerScreenX
      LDY     PlayerMovementDirection
      CPY     #$01
      BEQ     PlayerAreaBoundaryCollision_CheckRight

PlayerAreaBoundaryCollision_CheckLeft:
      CMP     #$08
      BCC     PlayerAreaBoundaryCollision_BoundaryHit

PlayerAreaBoundaryCollision_Exit:
      RTS

PlayerAreaBoundaryCollision_CheckRight:
      CMP     #$E8
      BCC     PlayerAreaBoundaryCollision_Exit

PlayerAreaBoundaryCollision_BoundaryHit:
      LDA     PlayerCollision
      ORA     PlayerCollisionDirectionTable-1,Y
      STA     PlayerCollision

;
; NOTE: This is a copy of the "PlayerHorizontalCollision" routine in Bank 3
;
PlayerHorizontalCollision_Bank0:
      LDX     #$00
      LDY     PlayerMovementDirection
      LDA     PlayerXVelocity
      EOR     PlayerCollisionResultTable_Bank0-1,Y
      BPL     loc_BANK0_9340

      STX     PlayerXVelocity

loc_BANK0_9340:
      LDA     PlayerXAcceleration
      EOR     PlayerCollisionResultTable_Bank0-1,Y
      BPL     loc_BANK0_934B

      STX     PlayerXAcceleration

loc_BANK0_934B:
      STX     PlayerXSubpixel

locret_BANK0_934E:
      RTS


; =============== S U B R O U T I N E =======================================

;
; NOTE: This is a copy of the "sub_BANK3_BC50" routine in Bank 3
;
; Replaces tile when something is picked up
;
; Input
;   A = Target tile
;   X = Enemy index of object being picked up
;
ReplaceTile_Bank0:
      PHA ; Something to update the PPU for some tile change
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
      BEQ     ReplaceTile_StoreXHi_Bank0

      ADC     #$00

ReplaceTile_StoreXHi_Bank0:
      STA     byte_RAM_2
      LDA     ObjectYLo,X
      CLC
      ADC     #$08
      AND     #$F0
      STA     byte_RAM_E6
      LDA     ObjectYHi,X
      ADC     #$00
      STA     byte_RAM_1
      JSR     sub_BANK0_92C1

      PLA
      BCS     locret_BANK0_934E

;
; Input
;   A = Target tile
;
loc_BANK0_937C:
      STX     byte_RAM_3
      PHA
      JSR     SetTileOffsetAndAreaPageAddr_Bank1

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
      BNE     loc_BANK0_93B9

      INY

loc_BANK0_93B9:
      LDA     byte_BANK0_940A,Y
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
      ADC     #$0A
      STA     byte_RAM_300
      LDX     byte_RAM_3
      RTS


; Another byte of PPU high addresses for horiz/vert levels
byte_BANK0_940A:
      .BYTE $20
      .BYTE $28
      .BYTE $20
      .BYTE $24


;
; NOTE: This is a copy of the "StashPlayerPosition" routine in Bank 3
;
StashPlayerPosition_Bank0:
      LDA     InSubspaceOrJar
      BNE     StashPlayerPosition_Exit_Bank0

      LDA     PlayerXHi
      STA     PlayerXHi_Backup
      LDA     PlayerXLo
      STA     PlayerXLo_Backup
      LDA     PlayerYHi
      STA     PlayerYHi_Backup
      LDA     PlayerYLo
      STA     PlayerYLo_Backup

StashPlayerPosition_Exit_Bank0:
      RTS


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
      SBC     #TransitionType_SubSpace
      BNE     StashPlayerPosition_Exit_Bank0

      ; resetting these to zero (A=$00, otherwise we would have branched)
      STA     PlayerState
      STA     PlayerLock
      STA     SubspaceTimer
      JSR     DoorAnimation_Unlocked

      LDA     #$0A
      STA     SubspaceDoorTimer
      RTS

; End of function sub_BANK0_9428

; =============== S U B R O U T I N E =======================================

; area transition
sub_BANK0_946D:
      LDA     TransitionType
      CMP     #TransitionType_Jar
      BNE     loc_BANK0_947F

      LDA     InJarType
      BNE     loc_BANK0_947F

      JSR     sub_BANK0_9428

      JMP     loc_BANK0_94C2

; ---------------------------------------------------------------------------

loc_BANK0_947F:
      LDA     CurrentLevelEntryPage
      LDY     #$00
      LDX     IsHorizontalLevel
      BNE     loc_BANK0_948E

      STY     PlayerXHi
      STA     PlayerYHi
      BEQ     loc_BANK0_9492

loc_BANK0_948E:
      STA     PlayerXHi
      STY     PlayerYHi

loc_BANK0_9492:
      JSR     AreaTransitionPlacement

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
      CMP     #TransitionType_SubSpace
      BNE     loc_BANK0_94C2

      JSR     DoorAnimation_Unlocked

loc_BANK0_94C2:
      LDA     PlayerXLo
      SEC
      SBC     #$78
      STA     byte_RAM_BA
      RTS

; End of function sub_BANK0_946D


;
; Do the player placement after an area transition
;
AreaTransitionPlacement:
      LDA     TransitionType
      JSR     JumpToTableAfterJump

      .WORD AreaTransitionPlacement_Reset
      .WORD AreaTransitionPlacement_Door
      .WORD AreaTransitionPlacement_Jar
      .WORD AreaTransitionPlacement_Climbing
      .WORD AreaTransitionPlacement_Subspace
      .WORD AreaTransitionPlacement_Rocket


AreaTransitionPlacement_Reset:
      LDA     #$01
      STA     byte_RAM_9D
      JSR     AreaTransitionPlacement_Middle

      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5
      LDA     #$D0
      STA     PlayerYLo
      STA     byte_RAM_E6
      LDA     CurrentLevelEntryPage
      STA     byte_RAM_E8
      LDA     #$0C
      STA     byte_RAM_3

loc_BANK0_94F8:
      JSR     SetTileOffsetAndAreaPageAddr_Bank1

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y
      CMP     #$40
      BEQ     AreaTransitionPlacement_MovePlayerUp1Tile

      JSR     AreaTransitionPlacement_MovePlayerUp1Tile

      STA     byte_RAM_E6
      DEC     byte_RAM_3
      BNE     loc_BANK0_94F8


;
; Moves the player up by one tile
;
AreaTransitionPlacement_MovePlayerUp1Tile:
      LDA     PlayerYLo
      SEC
      SBC     #$10
      STA     PlayerYLo
      RTS


;
; Looks for a door and positions the player at it
;
; The implementation of this requires the destination door to be at the
; OPPOSITE side of the screen from the origin door horizontally, but it can be
; at any position vertically.
;
; If no suitable door is found, the player is positioned to fall from the
; top-middle of the screen instead
;
AreaTransitionPlacement_Door:
      LDA     PlayerXLo
      ; Switch the x-position to the opposite side of the screen
      CLC
      ADC     #$08
      AND     #$F0
      EOR     #$F0
      STA     PlayerXLo

      ; Convert to a tile offset
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5

      ; Start at the bottom of the page
      LDA     #$E0
      STA     PlayerYLo
      STA     byte_RAM_E6
      LDA     CurrentLevelEntryPage
      STA     byte_RAM_E8
      LDA     #$0D
      STA     byte_RAM_3

AreaTransitionPlacement_Door_Loop:
      JSR     SetTileOffsetAndAreaPageAddr_Bank1

      ; Read the target tile
      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y
      LDY     #$05

AreaTransitionPlacement_Door_InnerLoop:
      ; See if it matches any door tile
      CMP     DoorTiles-1,Y
      BEQ     AreaTransitionPlacement_Door_Exit
      DEY
      BNE     AreaTransitionPlacement_Door_InnerLoop

      ; Nothing matched on this row, so check the next row or give up
      DEC     byte_RAM_3
IFNDEF ROBUST_TRANSITION_SEARCH
      BEQ     AreaTransitionPlacement_Door_Fallback
ENDIF
IFDEF ROBUST_TRANSITION_SEARCH
      BEQ     AreaTransitionPlacement_DoorCustom
ENDIF

      JSR     AreaTransitionPlacement_MovePlayerUp1Tile

      STA     byte_RAM_E6
      JMP     AreaTransitionPlacement_Door_Loop

AreaTransitionPlacement_Door_Fallback:
      ; Place in the middle of the screen if no door is found
      JSR     AreaTransitionPlacement_Middle

AreaTransitionPlacement_Door_Exit:
      JSR     AreaTransitionPlacement_MovePlayerUp1Tile

      LDA     #$00
      STA     PlayerLock
      RTS


IFDEF ROBUST_TRANSITION_SEARCH
;
; Looks for a door and positions the player at it
;
; In contrast to the normal door placement routine, this will search all
; x-positions rather than just one opposite the door
;
AreaTransitionPlacement_DoorCustom:
      ; Start on the correct page
      LDX     CurrentLevelEntryPage
      JSR     SetAreaPageAddr_Bank1

      ; Start at the bottom right and work backwards
      LDA     #$0EF
      STA     byte_RAM_E7

AreaTransitionPlacement_DoorCustom_Loop:
      ; Read the target tile
      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y
      LDY     #$05

AreaTransitionPlacement_DoorCustom_InnerLoop:
      ; See if it matches any door tile
      CMP     DoorTiles-1,Y
      BEQ     AreaTransitionPlacement_DoorCustom_Exit
      DEY
      BNE     AreaTransitionPlacement_DoorCustom_InnerLoop

      ; No matches on this tile, check the next one or give up
      DEC     byte_RAM_E7
      BEQ     AreaTransitionPlacement_DoorCustom_Fallback

      JMP     AreaTransitionPlacement_DoorCustom_Loop

AreaTransitionPlacement_DoorCustom_Fallback:
      LDA     #$20
      STA     PlayerYLo
      JSR     AreaTransitionPlacement_Middle
      JMP     AreaTransitionPlacement_Door_Exit

AreaTransitionPlacement_DoorCustom_Exit:
      LDA     byte_RAM_E7
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     PlayerXLo
      LDA     byte_RAM_E7
      AND     #$F0
      STA     PlayerYLo
      JMP     AreaTransitionPlacement_Door_Exit
ENDIF


;
; Place the player at the top of the screen in the middle horizontally
;
AreaTransitionPlacement_Jar:
      LDA     #$00
      STA     PlayerYLo

;
; Place the player in the air in the middle of the screen horizontally
;
AreaTransitionPlacement_Middle:
      LDA     #$01
      STA     PlayerInAir
      LDA     #$78
      STA     PlayerXLo
      RTS

;
; Looks for a climbable tile (vine/chain/ladder) and positions the player at it
;
; The implementation of this requires the destination to be at the OPPOSITE
; side of the screen from the origin horizontally, otherwise the player will
; be climbing on nothing.
;
AreaTransitionPlacement_Climbing:
      LDA     PlayerXLo
      ; Switch the x-position to the opposite side of the screen
      CLC
      ADC     #$08
      AND     #$F0
      EOR     #$F0
      STA     PlayerXLo

      ; Switch the y-position to the opposite side of the screen
      LDA     PlayerScreenYLo
      CLC
      ADC     #$08
      AND     #$F0
      EOR     #$10
      STA     PlayerYLo
      CMP     #$F0
      BEQ     AreaTransitionPlacement_Climbing_Exit

      DEC     PlayerYHi

AreaTransitionPlacement_Climbing_Exit:
IFDEF ROBUST_TRANSITION_SEARCH
      JSR     AreaTransitionPlacement_ClimbingCustom
ENDIF

      LDA     #SpriteAnimation_Climbing
      STA     PlayerAnimationFrame
      RTS


IFDEF ROBUST_TRANSITION_SEARCH
AreaTransitionPlacement_ClimbingCustom:
      ; Target x-position
      LDA     PlayerXLo
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     byte_RAM_E5

      ; Target y-position
      LDA     PlayerYLo
      EOR     #$10
      CLC
      ADC     #$10
      CMP     #$F0
      BNE     AreaTransitionPlacement_ClimbingCustom_AfterNudge
      SEC
      SBC     #$10
AreaTransitionPlacement_ClimbingCustom_AfterNudge:
      STA     byte_RAM_E6

      ; Read the target tile
      LDA     CurrentLevelEntryPage
      STA     byte_RAM_E8
      JSR     SetTileOffsetAndAreaPageAddr_Bank1
      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y

      ; Check if the target tile is climbable
      LDY     #$09
AreaTransitionPlacement_ClimbingCustom_CheckLoop:
      CMP     ClimbableTiles,Y
      BEQ     AreaTransitionPlacement_ClimbingCustom_Exit
      DEY
      BPL     AreaTransitionPlacement_ClimbingCustom_CheckLoop

      ; Target tile is not climbable; start at the right and work backwards
      LDA     byte_RAM_E7
      AND     #$F0
      STA     byte_RAM_E6

      LDA     #$0F
      STA     byte_RAM_3
      CLC
      ADC     byte_RAM_E6
      STA     byte_RAM_E7

AreaTransitionPlacement_ClimbingCustom_Loop:
      ; Read the target tile
      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y
      LDY     #$09

AreaTransitionPlacement_ClimbingCustom_InnerLoop:
      CMP     ClimbableTiles,Y
      BEQ     AreaTransitionPlacement_ClimbingCustom_SetXPosition
      DEY
      BPL     AreaTransitionPlacement_ClimbingCustom_InnerLoop

      ; No matches on this tile, check the next one or give up
      DEC     byte_RAM_E7
      DEC     byte_RAM_3
      BMI     AreaTransitionPlacement_ClimbingCustom_Exit

      JMP     AreaTransitionPlacement_ClimbingCustom_Loop

AreaTransitionPlacement_ClimbingCustom_SetXPosition:
      LDA     byte_RAM_3
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     PlayerXLo

AreaTransitionPlacement_ClimbingCustom_Exit:
      RTS
ENDIF


AreaTransitionPlacement_Subspace:
      LDA     PlayerScreenX
      SEC
      SBC     byte_RAM_BA
      EOR     #$0FF
      CLC
      ADC     #$F1
      STA     PlayerXLo
      LDA     PlayerScreenYLo
      STA     PlayerYLo
      DEC     PlayerLock
      LDA     #$60
      STA     SubspaceTimer
      RTS


AreaTransitionPlacement_Rocket:
      JSR     AreaTransitionPlacement_Middle
      LDA     #$60
      STA     PlayerYLo
      RTS


;
; @TODO
;
; Input
;   Y = PlayerYHi
;   A = PlayerYLo
; Output
;   Y = PlayerYHi
;   A = PlayerYLo
;
sub_BANK0_95AF:
      CPY     #$00
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


IFNDEF ROBUST_TRANSITION_SEARCH
IFDEF PRESERVE_UNUSED_SPACE
; Unused space in the original
; $95C3 - $95FF
      .pad $9600, $FF
ENDIF
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
      LDA     #$00
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
      LDY     #$00
      STY     byte_RAM_0
      TYA

InitMemoryLoop:
      STA     (byte_RAM_0),Y ; I'm not sure if a different method of initializing memory
; would work better in this case.
      DEY
      BNE     InitMemoryLoop

      DEC     byte_RAM_1
      LDX     byte_RAM_1
      CPX     #$02
      BCS     InitMemoryLoop ; Stop initialization after we hit $200.

loc_BANK0_9A53:
      LDA     #$00
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
      LDY     #$00
      STA     PPUADDR
      STY     PPUADDR

loc_BANK0_9A6F:
      LDA     TitleBackgroundPalettes,Y
      STA     PPUDATA
      INY
      CPY     #$20
      BCC     loc_BANK0_9A6F

      LDA     #$01
      STA     RAM_PPUDataBufferPointer
      LDA     #$03
      STA     RAM_PPUDataBufferPointer+1
      LDA     #Stack100_Menu
      STA     StackArea
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x8|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      JSR     WaitForNMI_TitleScreen

      LDA     #$01 ; @TODO
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_TitleScreen

      LDA     #Music1_Title
      STA     MusicQueue1
      JSR     WaitForNMI_TitleScreen_TurnOnPPU

      LDA     #$03
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
      AND     #$0F
      BEQ     loc_BANK0_9AC6

      JMP     loc_BANK0_9B4D

; ---------------------------------------------------------------------------

loc_BANK0_9AC6:
      DEC     byte_RAM_2
      LDA     byte_RAM_2
      CMP     #$06
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
      LDA     #$0FB
      STA     byte_RAM_304
      LDA     #$00
      STA     byte_RAM_305
      BEQ     loc_BANK0_9B4D

loc_BANK0_9AF3:
      LDA     PlayerXHi
      STA     PPUBuffer_301
      LDA     ObjectXHi
      STA     byte_RAM_302
      LDA     ObjectXHi+1
      STA     byte_RAM_303
      LDA     #$0FB
      STA     byte_RAM_304
      LDA     #$00
      STA     byte_RAM_305
      LDA     ObjectXHi
      CLC
      ADC     #$20
      STA     ObjectXHi
      LDA     PlayerXHi
      ADC     #$00
      STA     PlayerXHi
      CMP     #$23

loc_BANK0_9B1B:
      BCC     loc_BANK0_9B4D

      LDA     #$20
      STA     byte_RAM_10
      LDX     #$17
      LDY     #$00

loc_BANK0_9B25:
      LDA     TitleAttributeData1,Y
      STA     byte_RAM_305,Y
      INY
      DEX
      BPL     loc_BANK0_9B25

      LDA     #$00
      STA     byte_RAM_305,Y
      JSR     WaitForNMI_TitleScreen

      LDX     #$1B
      LDY     #$00

loc_BANK0_9B3B:
      LDA     TitleAttributeData2,Y
      STA     PPUBuffer_301,Y
      INY
      DEX
      BPL     loc_BANK0_9B3B

      LDA     #$00
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
      CMP     #$09
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
      LDA     #$0AE
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
      LDA     #$06
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
      LDY     #$00
      LDX     #$13

loc_BANK0_9BCB:
      LDA     (byte_RAM_3),Y
      STA     byte_RAM_304,Y
      INY
      DEX
      BPL     loc_BANK0_9BCB

      LDA     #$00
      STA     byte_RAM_304,Y
      INC     ObjectXHi+3
      LDA     ObjectXHi
      CLC
      ADC     #$40
      STA     ObjectXHi
      LDA     PlayerXHi
      ADC     #$00
      STA     PlayerXHi
      LDA     ObjectXHi+3
      CMP     #$09
      BCC     loc_BANK0_9C19

      BNE     loc_BANK0_9C0B

      LDA     #$09
      STA     byte_RAM_2
      LDA     #$03
      STA     byte_RAM_10
      LDA     #$20
      STA     PlayerXHi
      LDA     #$C7
      STA     ObjectXHi
      LDA     #$52
      STA     ObjectXHi+1
      LDA     #$00
      STA     ObjectXHi+2
      JMP     loc_BANK0_9ABB

; ---------------------------------------------------------------------------

loc_BANK0_9C0B:
      CMP     #$12
      BCC     loc_BANK0_9C19

      INC     ObjectXHi+4
      LDA     #$25
      STA     byte_RAM_2
      LDA     #$03
      STA     byte_RAM_10

loc_BANK0_9C19:
      LDA     Player1JoypadHeld
      AND     #ControllerInput_Start
      BEQ     loc_BANK0_9C35

loc_BANK0_9C1F:
      LDA     #Music2_StopMusic
      STA     MusicQueue2
      JSR     WaitForNMI_TitleScreen

      LDA     #$00
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
      AND     #$0F
      BNE     loc_BANK0_9C4B

      DEC     byte_RAM_2
      LDA     byte_RAM_2
      CMP     #$06
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
      LDA     #$00
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
      LDA     #$00
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
; initial x positions
unk_BANK1_A3FF:
      .BYTE $30 ; player
      .BYTE $80 ; subcon 8
      .BYTE $80 ; subcon 7
      .BYTE $80 ; subcon 6
      .BYTE $80 ; subcon 5
      .BYTE $80 ; subcon 4
      .BYTE $80 ; subcon 3
      .BYTE $80 ; subcon 2
      .BYTE $80 ; subcon 1
      .BYTE $80 ; cork
; initial y positions
byte_BANK1_A409:
      .BYTE $B0 ; player
      .BYTE $A0 ; subcon 8
      .BYTE $A0 ; subcon 7
      .BYTE $A0 ; subcon 6
      .BYTE $A0 ; subcon 5
      .BYTE $A0 ; subcon 4
      .BYTE $A0 ; subcon 3
      .BYTE $A0 ; subcon 2
      .BYTE $A0 ; subcon 1
      .BYTE $95 ; cork
; target x positions
byte_BANK1_A413:
      .BYTE $10 ; player
      .BYTE $F4 ; subcon 8
      .BYTE $0C ; subcon 7
      .BYTE $E8 ; subcon 6
      .BYTE $18 ; subcon 5
      .BYTE $EC ; subcon 4
      .BYTE $14 ; subcon 3
      .BYTE $F8 ; subcon 2
      .BYTE $08 ; subcon 1
      .BYTE $00 ; cork
; target y positions
byte_BANK1_A41D:
      .BYTE $00 ; player
      .BYTE $C4 ; subcon 8
      .BYTE $C4 ; subcon 7
      .BYTE $B8 ; subcon 6
      .BYTE $B8 ; subcon 5
      .BYTE $A8 ; subcon 4
      .BYTE $A8 ; subcon 3
      .BYTE $A0 ; subcon 2
      .BYTE $A0 ; subcon 1
      .BYTE $00 ; cork
; delays
byte_BANK1_A427:
      .BYTE $00 ; player
      .BYTE $F0 ; subcon 8
      .BYTE $E0 ; subcon 7
      .BYTE $C0 ; subcon 6
      .BYTE $A0 ; subcon 5
      .BYTE $80 ; subcon 4
      .BYTE $60 ; subcon 3
      .BYTE $40 ; subcon 2
      .BYTE $20 ; subcon 1
      .BYTE $00 ; cork
; attributes
byte_BANK1_A431:
      .BYTE $00 ; player
byte_BANK1_A432:
      .BYTE $21 ; subcon 8
      .BYTE $61 ; subcon 7
      .BYTE $21 ; subcon 6
      .BYTE $61 ; subcon 5
      .BYTE $21 ; subcon 4
      .BYTE $61 ; subcon 3
      .BYTE $21 ; subcon 2
      .BYTE $61 ; subcon 1
      .BYTE $22 ; cork

; =============== S U B R O U T I N E =======================================

FreeSubconsScene:
      JSR     WaitForNMI_Ending_TurnOffPPU
      JSR     ClearNametablesAndSprites

      LDA     #Stack100_Menu
      STA     StackArea
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      JSR     WaitForNMI_Ending

      LDA     #EndingUpdateBuffer_JarRoom
      STA     ScreenUpdateIndex
      JSR     WaitForNMI_Ending

      LDA     #$60
      STA     byte_RAM_83
      LDA     #$01
      STA     byte_RAM_9D
      LSR     A
      STA     PlayerState ; A=$00
      STA     byte_RAM_8E
      STA     CrouchJumpTimer
      STA     byte_RAM_E6
      STA     byte_RAM_E5
      STA     SpriteFlickerSlot
      LDX     #$09

loc_BANK1_A470:
      LDA     unk_BANK1_A3FF,X
      STA     ObjectXLo-1,X
      LDA     byte_BANK1_A409,X
      STA     ObjectYLo-1,X
      LDA     byte_BANK1_A413,X
      STA     ObjectXVelocity-1,X
      LDA     byte_BANK1_A41D,X
      STA     ObjectYVelocity-1,X
      LDA     byte_BANK1_A427,X
      STA     EnemyTimer-1,X
      LDA     byte_BANK1_A431,X
      STA     ObjectAttributes-1,X
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
      AND     #$07
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
      JMP     PlayerStartJump

; ---------------------------------------------------------------------------

loc_BANK1_A504:
      JSR     PlayerWalkJumpAnim

loc_BANK1_A507:
      JSR     sub_BANK0_8A50

      JSR     sub_BANK1_A596

      JSR     sub_BANK0_8EA4

      LDA     PlayerYVelocity
      BMI     locret_BANK1_A52F

      LDA     PlayerYLo
      CMP     #$A0
      BCC     loc_BANK1_A521

      LDA     #$0C
      STA     PlayerXVelocity
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
      LDA     #$05
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
      STA     ObjectYVelocity+8
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

      LDA     PlayerYVelocity
      BMI     locret_BANK1_A591

      LDA     PlayerYLo
      CMP     #$80
      BCC     locret_BANK1_A591

      JMP     PlayerStartJump

; ---------------------------------------------------------------------------

locret_BANK1_A591:
      RTS

; ---------------------------------------------------------------------------
; character gravity in ending jar room
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
      ADC     PlayerYVelocity
      STA     PlayerYVelocity
      RTS

; End of function sub_BANK1_A596

; =============== S U B R O U T I N E =======================================

sub_BANK1_A5A1:
      LDX     #$07

loc_BANK1_A5A3:
      STX     byte_RAM_12
      LDA     EnemyTimer,X
      BEQ     loc_BANK1_A5B4

      CMP     #$01
      BNE     loc_BANK1_A5D8

      LDA     #SoundEffect1_ThrowItem
      STA     SoundEffectQueue1
      BNE     loc_BANK1_A5D8

loc_BANK1_A5B4:
      JSR     sub_BANK1_B948

      LDA     ObjectYVelocity,X
      CMP     #$08
      BMI     loc_BANK1_A5CC

      LDA     #$00
      STA     ObjectXVelocity,X
      LDA     #$F9
      STA     ObjectYVelocity,X
      LDA     byte_BANK1_A432,X
      EOR     #ObjAttrib_Palette0|ObjAttrib_16x32
      STA     ObjectAttributes,X

loc_BANK1_A5CC:
      LDA     byte_RAM_10
      ASL     A
      AND     #$02
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
      LDA     #$04
      STA     byte_RAM_F
      LDX     #$08
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
      ADC     #$08
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

      LDA     #$00
      JSR     ChangeNametableMirroring

      JSR     ClearNametablesAndSprites

      LDA     #Stack100_Menu
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

      LDA     #$01
      JSR     ChangeNametableMirroring

      LDY     #$03

loc_BANK1_AAAA:
      LDA     byte_BANK1_AA35,Y
      STA     SpriteDMAArea,Y
      DEY

loc_BANK1_AAB1:
      BPL     loc_BANK1_AAAA

      LDA     #$00
      STA     byte_RAM_F3
      STA     byte_RAM_E6
      LDY     #$3F

loc_BANK1_AABB:
      LDA     byte_BANK1_AA39,Y
      STA     SpriteDMAArea+$10,Y
      DEY
      BPL     loc_BANK1_AABB

      LDA     #$0FF
      STA     PlayerXHi
      LDA     #$A0
      STA     PlayerXLo
      LDA     #$08
      STA     PlayerXVelocity
      LDA     #$01
      STA     IsHorizontalLevel

loc_BANK1_AAD4:
      JSR     WaitForNMI_Ending_TurnOnPPU

      INC     byte_RAM_F3
      INC     byte_RAM_10
      JSR     sub_BANK1_ADF1

      JSR     loc_BANK1_ABCC

      LDA     byte_RAM_E6
      CMP     #$03
      BCS     loc_BANK1_AB20

loc_BANK1_AAE7:
      BIT     PPUSTATUS
      BVS     loc_BANK1_AAE7

loc_BANK1_AAEC:
      BIT     PPUSTATUS
      BVC     loc_BANK1_AAEC

      LDX     #$02

loc_BANK1_AAF3:
      LDY     #$00

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
      LDA     #$00
      STA     PPUSCROLL
      LDA     byte_RAM_F3
      CMP     #$0A
      BCC     loc_BANK1_AB1D

      LDA     #$00
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
      LDA     #$00
      JSR     ChangeNametableMirroring

      LDA     #$01
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

      LDX     #$02

loc_BANK1_AB4C:
      LDY     #$00

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
      LDA     #$00
      STA     PPUSCROLL
      LDA     #$00
      STA     PPUSCROLL
      LDA     byte_RAM_F3
      CMP     #$14
      BCC     loc_BANK1_AB80

      LDA     #$00
      STA     byte_RAM_F3
      LDA     byte_RAM_F2
      EOR     #$01
      STA     byte_RAM_F2
      INC     byte_RAM_7

loc_BANK1_AB80:
      LDA     byte_RAM_7
      CMP     #$29
      BCC     loc_BANK1_AB32

      JSR     sub_BANK1_AB90

      LDA     byte_RAM_E6
      CMP     #$04
      BCC     loc_BANK1_AB32

      RTS

; End of function sub_BANK1_AA79

; =============== S U B R O U T I N E =======================================

sub_BANK1_AB90:
      LDA     byte_RAM_10
      AND     #$03
      BNE     locret_BANK1_ABA6

      INC     byte_RAM_E5
      LDY     byte_RAM_E5
      CPY     #$03
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
      AND     #$03
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
      CMP     #$01
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
      LDX     #$05

loc_BANK1_AC22:
      LDA     #$20
      STA     ObjectXLo,X
      LDA     #$A8

loc_BANK1_AC28:
      STA     ObjectYLo,X
      LDA     byte_BANK1_ABDA,X
      STA     ObjectXVelocity,X
      LDA     byte_BANK1_ABE0,X
      STA     ObjectYVelocity,X
      DEX
      BPL     loc_BANK1_AC22

loc_BANK1_AC37:
      LDY     #$A0
      LDA     byte_RAM_10
      AND     #$38
      BNE     loc_BANK1_AC40

      DEY

loc_BANK1_AC40:
      AND     #$08
      BNE     loc_BANK1_AC45

      DEY

loc_BANK1_AC45:
      STY     PlayerYLo
      LDX     #$0B
      LDY     #$70

loc_BANK1_AC4B:
      LDA     PlayerYLo
      CLC
      ADC     byte_BANK1_ABFE,X
      STA     SpriteDMAArea,Y
      LDA     byte_BANK1_ABE6,X
      STA     SpriteDMAArea+1,Y
      LDA     #$01
      STA     SpriteDMAArea+2,Y
      LDA     PlayerXLo
      CLC
      ADC     byte_BANK1_ABF2,X
      STA     SpriteDMAArea+3,Y
      LDA     PlayerXHi

loc_BANK1_AC6A:
      ADC     #$00
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
      STA     ObjectXSubpixel+6
      STA     ObjectYSubpixel+6
      STA     ObjectXLo+6
      STA     byte_RAM_10
      LDA     #$6F
      STA     ObjectYLo+6
      LDA     #$E6
      STA     ObjectXVelocity+6
      LDA     #$0DA
      STA     ObjectYVelocity+6
IFDEF COMPATIBILITY
      .db $ee, $e6, $00 ; INC $00E6
ENDIF
IFNDEF COMPATIBILITY
      INC     byte_RAM_E6 ; Absolute address for zero-page
      NOP ; Alignment fix
ENDIF


loc_BANK1_ACA4:
      LDX     #$05

loc_BANK1_ACA6:
      STX     byte_RAM_12
      JSR     sub_BANK1_B90C

      JSR     sub_BANK1_B907

      LDY     #$F0
      LDA     byte_RAM_10
      BEQ     loc_BANK1_ACC1

      AND     #$0F
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
      LDA     #$00
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
      LDA     #$03
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
      LDA     #$03
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
      LDA     #$00
      STA     byte_RAM_631
      LDY     #$03

loc_BANK1_AD47:
      LDA     CharacterLevelsCompleted,Y
      CMP     byte_RAM_631
      BCC     loc_BANK1_AD55

      LDA     CharacterLevelsCompleted,Y
      STA     byte_RAM_631

loc_BANK1_AD55:
      DEY
      BPL     loc_BANK1_AD47

      LDX     #$00
      LDY     #$03

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
      LDX     #$00
      LDA     #$21
      STA     PPUBuffer_301,X
      INX
      LDA     #$2A
      STA     PPUBuffer_301,X
      INX
      LDA     #$0C
      STA     PPUBuffer_301,X
      INX
      LDY     #$00
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #$0FB
      STA     PPUBuffer_301,X
      INX
      LDY     #$03
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX

loc_BANK1_ADB0:
      LDA     #$0FB
      STA     PPUBuffer_301,X
      INX
      STA     PPUBuffer_301,X
      INX
      LDY     #$02
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #$0FB
      STA     PPUBuffer_301,X
      INX
      LDY     #$01
      LDA     CharacterLevelsCompleted,Y
      JSR     sub_BANK1_AE43

      TYA
      STA     PPUBuffer_301,X
      INX
      LDA     byte_RAM_1
      STA     PPUBuffer_301,X
      INX
      LDA     #$00
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
      ADC     #$09
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
      CMP     #$0A
      BCC     loc_BANK1_AE4F

      SBC     #$0A

loc_BANK1_AE4B:
      INY
      JMP     loc_BANK1_AE45

; ---------------------------------------------------------------------------

loc_BANK1_AE4F:
      ORA     #$D0
      CPY     #$D0
      BNE     loc_BANK1_AE57

      LDY     #$0FB

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
      ADC     #$0A
      TAX

; End of function sub_BANK1_B907

; =============== S U B R O U T I N E =======================================

sub_BANK1_B90C:
      LDA     ObjectXVelocity,X
      CLC
      ADC     ObjectXAcceleration,X
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
      CMP     #$08
      BCC     loc_BANK1_B924

      ORA     #$F0

loc_BANK1_B924:
      STA     byte_RAM_0
      LDY     #$00
      ASL     A
      BCC     loc_BANK1_B92C

      DEY

loc_BANK1_B92C:
      STY     byte_RAM_2
      LDA     ObjectXSubpixel,X
      CLC
      ADC     byte_RAM_1
      STA     ObjectXSubpixel,X
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

      LDA     ObjectYVelocity,X
      BMI     loc_BANK1_B95B

      CMP     #$3E
      BCS     locret_BANK1_B95F

loc_BANK1_B95B:
      INC     ObjectYVelocity,X
      INC     ObjectYVelocity,X

locret_BANK1_B95F:
      RTS

; End of function sub_BANK1_B948


DoorAnimation_Locked:
      LDA     #$01
      BNE     DoorAnimation

DoorAnimation_Unlocked:
      LDA     #$00

DoorAnimation:
      PHA
      LDY     #$08

DoorAnimation_Loop:
      ; skip if inactive
      LDA     EnemyState,Y
      BEQ     DoorAnimation_LoopNext

      ; skip enemies that aren't the door
      LDA     ObjectType,Y
      CMP     #Enemy_SubspaceDoor
      BNE     DoorAnimation_LoopNext

      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,Y
      LDA     #$20
      STA     EnemyTimer,Y

DoorAnimation_LoopNext:
      DEY
      BPL     DoorAnimation_Loop

      JSR     CreateEnemy_TryAllSlots_Bank1

      BMI     DoorAnimation_Exit

      LDA     #$00
      STA     byte_RAM_4BD
      STA     SubspaceDoorTimer
      LDX     byte_RAM_0
      PLA
      STA     EnemyArray_477,X
      LDA     #Enemy_SubspaceDoor
      STA     ObjectType,X
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

DoorAnimation_Exit:
      PLA
      RTS


CreateStarman:
      JSR     CreateEnemy_Bank1

      BMI     CreateStarman_Exit

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
      JSR     loc_BANK1_BA17

      LDX     byte_RAM_12

CreateStarman_Exit:
      RTS


; =============== S U B R O U T I N E =======================================

EnemyInit_Basic_Bank1:
      LDA     #$00
      STA     EnemyTimer,X
      LDA     #$00
      STA     EnemyVariable,X

loc_BANK1_B9EB:
      LDA     #$00
      STA     EnemyArray_B1,X
      STA     EnemyArray_42F,X
      STA     ObjectBeingCarriedTimer,X
      STA     EnemyArray_9F,X
      STA     EnemyArray_44A,X
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
      STA     ObjectXVelocity,X

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


;
; Turns the key into a puff of smoke
;
; Input
;   X = enemy slot
; Output
;   X = value of byte_RAM_12
;
TurnKeyIntoPuffOfSmoke:
      LDA     ObjectAttributes,X
      AND     #%11111100
      ORA     #ObjAttrib_Palette1
      STA     ObjectAttributes,X
      LDA     #EnemyState_PuffOfSmoke
      STA     EnemyState,X
      STA     EnemyArray_9F,X
      LDA     #$1F
      STA     EnemyTimer,X
      LDX     byte_RAM_12
      RTS


;
; NOTE: This is a copy of the "UnlinkEnemyFromRawData" routine in Bank 2, but
; it is used here for spawning the door animation and Starman objects.
;
; Spawned enemies are linked to an offset in the raw enemy data, which prevents
; from being respawned until they are killed or moved offscreen.
;
; This subroutine ensures that the enemy in a particular slot is not linked to
; the raw enemy data
;
; Input
;   X = enemy slot
;
UnlinkEnemyFromRawData_Bank1:
      LDA     #$0FF
      STA     unk_RAM_441,X
      RTS


;
; Updates the area page and tile placement offset
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
SetTileOffsetAndAreaPageAddr_Bank1:
      LDX     byte_RAM_E8
      JSR     SetAreaPageAddr_Bank1

      LDA     byte_RAM_E6
      CLC
      ADC     byte_RAM_E5
      STA     byte_RAM_E7
      RTS


DecodedLevelPageStartLo_Bank1:
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

DecodedLevelPageStartHi_Bank1:
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
SetAreaPageAddr_Bank1:
      LDA     DecodedLevelPageStartLo_Bank1,X
      STA     byte_RAM_1
      LDA     DecodedLevelPageStartHi_Bank1,X
      STA     byte_RAM_2
      RTS


;
; Checks whether the player is on a quicksand tile
;
; Input
;   byte_RAM_0 = tile ID
; Output
;   A = Whether the player is sinking in quicksand
;   X = PlayerInAir flag
;
PlayerTileCollision_CheckQuicksand:
      LDA     #$01
      LDY     byte_RAM_0
      CPY     #BackgroundTile_QuicksandSlow
      BEQ     PlayerTileCollision_QuicksandSlow

      CPY     #BackgroundTile_QuicksandFast
      BEQ     PlayerTileCollision_QuicksandFast

      LDA     #$00
      RTS

PlayerTileCollision_QuicksandFast:
      LDA     #$08

PlayerTileCollision_QuicksandSlow:
      STA     PlayerYVelocity
      LDA     QuicksandDepth
      BNE     loc_BANK1_BA9B

      LDA     PlayerYLo
      AND     #$10
      STA     byte_RAM_4EB

loc_BANK1_BA9B:
      ; check if player is too far under
      LDA     PlayerYLo
      AND     #$0F
      TAY
      LDA     byte_RAM_4EB
      EOR     PlayerYLo
      AND     #$10
      BEQ     loc_BANK1_BAB6

      ; kill if >= this check
      CPY     #$0C
      BCC     loc_BANK1_BAB4

      LDA     #$00
      STA     PlayerStateTimer
      JSR     KillPlayer

loc_BANK1_BAB4:
      LDY     #$04

loc_BANK1_BAB6:
      CPY     #$04
      BCS     loc_BANK1_BABC

      LDY     #$01

loc_BANK1_BABC:
      TYA
      DEX
      RTS


PlayerTileCollision_HurtPlayer:
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
      STA     PlayerXVelocity
      LDA     #$C0
      LDY     PlayerYVelocity
      BPL     loc_BANK1_BAE5

      LDA     #$00

loc_BANK1_BAE5:
      STA     PlayerYVelocity
      LDA     #DPCM_PlayerHurt
      STA     DPCMQueue

locret_BANK1_BAEC:
      RTS

; ---------------------------------------------------------------------------

loc_BANK1_BAED:
      LDA     #$C0
      STA     PlayerYVelocity
      LDA     #$20
      STA     PlayerStateTimer
      LDY     byte_RAM_12
      BMI     loc_BANK1_BAFD

      LSR     A
      STA     EnemyArray_438,Y

loc_BANK1_BAFD:
      JMP     KillPlayer


; ---------------------------------------------------------------------------

_code_3B00:
      LDY     unk_RAM_441,X
      BMI     loc_BANK1_BB0B

      LDA     (RawEnemyData),Y
      AND     #$7F
      STA     (RawEnemyData),Y

loc_BANK1_BB0B:
      LDA     #$00
      STA     EnemyState,X
      RTS


;
; NOTE: This is a copy of the "CreateEnemy" routine in Bank 2, but it is used
; here for spawning the door animation and Starman objects.
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
CreateEnemy_TryAllSlots_Bank1:
      LDY     #$08
      BNE     CreateEnemy_Bank1_FindSlot

CreateEnemy_Bank1:
      LDY     #$05

CreateEnemy_Bank1_FindSlot:
      LDA     EnemyState,Y
      BEQ     CreateEnemy_Bank1_FoundSlot

      DEY
      BPL     CreateEnemy_Bank1_FindSlot

      RTS

CreateEnemy_Bank1_FoundSlot:
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

      JSR     EnemyInit_Basic_Bank1
      JSR     UnlinkEnemyFromRawData_Bank1

      LDX     byte_RAM_12
      RTS
