
      ;.segment	BANK0
;       *	=  $8000

loc_BANK0_8000:					  ; code used as data at 8000
      LDA     byte_RAM_502
      BNE     loc_BANK0_805D

      LDA     #1
      JSR     sub_BANKF_FFA0

_code_000A:
      LDA     byte_RAM_533
      BNE     loc_BANK0_8013

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
      LDA     byte_RAM_533

loc_BANK0_8022:
      CLC
      ADC     #1
      CMP     #$A
      BNE     loc_BANK0_802B

      LDA     #0

loc_BANK0_802B:
      ORA     #$10
      STA     byte_RAM_D0
      LDA     byte_RAM_533
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
      LDY     byte_RAM_533
      JSR     sub_BANK0_95AF

      STA     byte_RAM_CB
      STY     byte_RAM_CA
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

; ---------------------------------------------------------------------------
      LDA     byte_RAM_D8
      AND     #4
      BNE     loc_BANK0_809D

      LDA     byte_RAM_D8
      AND     #7
      BNE     loc_BANK0_8092

      JMP     loc_BANK0_819C

; ---------------------------------------------------------------------------

loc_BANK0_8092:
      LDA     byte_RAM_D8
      ORA     #4
      STA     byte_RAM_D8
      LDA     #$12
      STA     byte_RAM_504

loc_BANK0_809D:
      LDA     byte_RAM_D8
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
      LDA     byte_RAM_CB
      SEC
      SBC     #4
      STA     byte_RAM_CB
      BCS     loc_BANK0_80C8

      DEC     byte_RAM_CA

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
      LDA     byte_RAM_CB
      CLC
      ADC     #4
      STA     byte_RAM_CB
      BCC     loc_BANK0_8138

      INC     byte_RAM_CA

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
      LDA     byte_RAM_D8
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
      STA     byte_RAM_D8

locret_BANK0_81A0:
      RTS

; ---------------------------------------------------------------------------
      .BYTE   1
; ---------------------------------------------------------------------------
      LDA     PPUScrollYMirror
      STA     byte_RAM_509
      LDA     PPUScrollXMirror
      STA     byte_RAM_50A
      LDA     byte_RAM_C8
      STA     byte_RAM_50B
      LDA     byte_RAM_C9
      STA     byte_RAM_50C
      LDA     byte_RAM_CA
      STA     byte_RAM_513
      LDA     byte_RAM_CB
      STA     byte_RAM_515
      LDA     byte_RAM_4BE
      STA     byte_RAM_514
      LDA     byte_RAM_E1
      STA     byte_RAM_517
      LDA     #0
      STA     PPUScrollYMirror
      STA     PPUScrollXMirror
      STA     byte_RAM_C8
      STA     byte_RAM_C9
      RTS

; ---------------------------------------------------------------------------
      LDA     byte_RAM_509
      STA     PPUScrollYMirror
      LDA     byte_RAM_50A
      STA     PPUScrollXMirror
      STA     byte_RAM_4C0
      LDA     byte_RAM_50B
      STA     byte_RAM_C8
      LDA     byte_RAM_50C
      STA     byte_RAM_C9
      LDA     byte_RAM_514
      STA     byte_RAM_4BE
      LDA     byte_RAM_513
      STA     byte_RAM_CA
      LDA     byte_RAM_515
      STA     byte_RAM_CB
      RTS

; ---------------------------------------------------------------------------
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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_828F:
      LDA     byte_RAM_D2,X
      CLC
      ADC     #$20
      STA     byte_RAM_D2,X
      RTS

; End of function sub_BANK0_828F

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_833E:
      LDX     byte_RAM_300

loc_BANK0_8341:
      LDA     byte_RAM_D1
      STA     _RAM_PPUDataBuffer,X
      INX
      LDA     byte_RAM_D2
      STA     _RAM_PPUDataBuffer,X
      INX
      LDA     #$20
      STA     _RAM_PPUDataBuffer,X
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
      STA     _RAM_PPUDataBuffer,X
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
      STA     _RAM_PPUDataBuffer,X
      STX     byte_RAM_300
      LDA     byte_RAM_D5
      BEQ     loc_BANK0_840B

      LDA     byte_RAM_E4
      BEQ     loc_BANK0_83C2

      DEC     byte_RAM_E4
      JMP     loc_BANK0_83DE

; ---------------------------------------------------------------------------

loc_BANK0_83C2:
      LDA     byte_RAM_D8
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
      LDA     byte_RAM_D8
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8412:
      LDY     byte_RAM_300
      LDA     byte_RAM_D1
      ORA     #3
      STA     _RAM_PPUDataBuffer,Y
      INY
      LDA     byte_RAM_E1,X
      STA     _RAM_PPUDataBuffer,Y
      INY
      LDA     #8
      STA     _RAM_PPUDataBuffer,Y
      INY
      LDX     #7

loc_BANK0_842B:
      LDA     byte_RAM_539
      BEQ     loc_BANK0_843B

      LDA     unk_RAM_D9,X
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      STA     unk_RAM_D9,X
      JMP     loc_BANK0_8452

; ---------------------------------------------------------------------------

loc_BANK0_843B:
      LDA     byte_RAM_D8
      LSR     A
      BCC     loc_BANK0_8452

loc_BANK0_8440:
      LDA     unk_RAM_D9,X
      ASL     A
      ASL     A
      ASL     A
      ASL     A
      STA     byte_RAM_1
      LDA     unk_RAM_D9,X
      LSR     A
      LSR     A
      LSR     A
      LSR     A
      ORA     byte_RAM_1

loc_BANK0_8450:
      STA     unk_RAM_D9,X

loc_BANK0_8452:
      LDA     unk_RAM_D9,X
      STA     _RAM_PPUDataBuffer,Y
      INY
      DEX
      BPL     loc_BANK0_842B

      LDA     #1

loc_BANK0_845D:
      STA     byte_RAM_E4
      LSR     A
      STA     byte_RAM_539
      STA     _RAM_PPUDataBuffer,Y
      STY     byte_RAM_300
      RTS

; End of function sub_BANK0_8412

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8488:
      LDA     byte_RAM_E3
      LSR     A
      TAY
      LDA     unk_RAM_D9,Y
      LSR     A
      LSR     A

loc_BANK0_8491:
      STA     unk_RAM_D9,Y
      LDA     byte_RAM_51B
      AND     #$C0
      ORA     unk_RAM_D9,Y
      STA     unk_RAM_D9,Y
      DEC     byte_RAM_E3
      RTS

; End of function sub_BANK0_8488

; ---------------------------------------------------------------------------

_code_04A2:
      LDX     #7
      LDA     #0

loc_BANK0_84A6:
      STA     unk_RAM_D9,X
      DEX
      BNE     loc_BANK0_84A6

      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_84AC:
      LDY     byte_RAM_D7
      LDA     (byte_RAM_E9),Y
      STA     byte_RAM_51B
      INC     byte_RAM_D7
      JMP     sub_BANK0_8488

; End of function sub_BANK0_84AC

; ---------------------------------------------------------------------------
_empty_04B8:.BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF; 0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $40

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8500:
      LDA     byte_RAM_502
      BNE     loc_BANK0_855C

      LDA     #0
      JSR     sub_BANKF_FFA0

      JSR     sub_BANK0_946D

      LDA     #0
      STA     PPUScrollYMirror
      LDA     byte_RAM_533
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
      LDA     byte_RAM_533
      CLC
      ADC     #1
      CMP     #$A
      BNE     loc_BANK0_8532

      LDA     #0

loc_BANK0_8532:
      ORA     #$10
      STA     byte_RAM_D0
      LDA     byte_RAM_533
      LDY     #1
      JSR     sub_BANK0_86EE

      INC     byte_RAM_502
      LDA     byte_RAM_533
      STA     byte_RAM_4BE
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_856A:
      LDA     byte_RAM_533
      BNE     loc_BANK0_8576

      LDA     byte_RAM_BA
      BMI     loc_BANK0_85E7

      LDA     byte_RAM_533

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
      STA     byte_RAM_4C0
      AND     #$F0
      STA     byte_RAM_536
      LDA     byte_RAM_BA
      BPL     loc_BANK0_85E7

      DEC     byte_RAM_4BE
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

; ---------------------------------------------------------------------------
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
      STA     byte_RAM_D8
      JSR     _code_0901

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
      STA     byte_RAM_D8
      JSR     _code_0901

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
      STA     byte_RAM_D8
      JMP     loc_BANK0_869A

; ---------------------------------------------------------------------------

loc_BANK0_863C:
      LDA     #2
      STA     byte_RAM_D8
      LDX     byte_RAM_BA

loc_BANK0_8642:
      LDA     PPUScrollXMirror
      BNE     loc_BANK0_8651

      LDA     byte_RAM_4BE
      CMP     byte_RAM_53F
      BNE     loc_BANK0_8651

      JMP     loc_BANK0_86E9

; ---------------------------------------------------------------------------

loc_BANK0_8651:
      LDA     PPUScrollXMirror
      CLC
      ADC     #1
      STA     PPUScrollXMirror
      STA     byte_RAM_4C0
      BCC     loc_BANK0_8669

      INC     byte_RAM_4BE
      LDA     byte_RAM_C9
      EOR     #1
      STA     byte_RAM_C9
      ASL     A
      STA     byte_RAM_C8

loc_BANK0_8669:
      LDA     byte_RAM_4BE
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

      LDA     byte_RAM_4BE
      BNE     loc_BANK0_86A8

      JMP     loc_BANK0_86E9

; ---------------------------------------------------------------------------

loc_BANK0_86A8:
      LDA     PPUScrollXMirror
      SEC
      SBC     #1
      STA     PPUScrollXMirror
      STA     byte_RAM_4C0
      BCS     loc_BANK0_86C0

      DEC     byte_RAM_4BE
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
      STA     byte_RAM_D8
      RTS

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK0_8709:.BYTE $28
      .BYTE $24
byte_BANK0_870B:.BYTE $A

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_870C:
      LDA     PPUScrollXMirror
      STA     byte_RAM_50A
      LDA     byte_RAM_C9
      STA     byte_RAM_50C
      LDA     byte_RAM_4BE
      STA     byte_RAM_514
      INC     byte_RAM_53D
      LDA     byte_BANK0_870B
      STA     byte_RAM_533
      JSR     sub_BANK0_86EE

      LDA     #0
      STA     PPUScrollXMirror
      STA     byte_RAM_4C0
      LDA     byte_BANK0_870B
      STA     byte_RAM_4BE
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

; ---------------------------------------------------------------------------
      LDA     byte_RAM_50A
      STA     PPUScrollXMirror
      STA     byte_RAM_4C0
      LDA     byte_RAM_50C
      STA     byte_RAM_C9
      LDA     byte_RAM_514
      STA     byte_RAM_4BE
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

; ---------------------------------------------------------------------------
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_87AA:
      LDX     #0
      STX     byte_RAM_537
      STX     byte_RAM_51C
      STX     byte_RAM_D8
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8812:
      STY     byte_RAM_F
      LDA     byte_RAM_CE,X
      AND     #$F
      TAY
      LDA     $BA5B,Y
      STA     byte_RAM_E9
      LDA     $BA66,Y
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

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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
      LDA     byte_RAM_D8
      LSR     A
      BCS     loc_BANK0_88F2

      LDA     byte_RAM_D2
      AND     #2
      BEQ     loc_BANK0_88FD

      LDA     byte_RAM_D8
      BNE     loc_BANK0_88F8

      LDA     #$10
      STA     byte_RAM_1
      LDX     #0
      STX     byte_RAM_9
      INX
      JSR     _code_0901

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
      LDA     byte_RAM_D8
      STA     byte_RAM_538

loc_BANK0_88FD:
      INC     byte_RAM_51C
      RTS

; End of function sub_BANK0_8872

; =============== S U B	R O U T	I N E =======================================

_code_0901:
      JSR     sub_BANK0_883C

      LDX     #7
      STX     byte_RAM_E
      LDY     #0

loc_BANK0_890A:
      LDX     byte_RAM_E
      LDA     unk_RAM_D9,X
      STA     unk_RAM_3BE,Y
      INY
      DEX
      DEX
      DEX
      DEX
      LDA     unk_RAM_D9,X
      STA     unk_RAM_3BE,Y
      INY
      DEC     byte_RAM_E
      LDA     byte_RAM_E
      CMP     #3
      BNE     loc_BANK0_890A

      RTS

; End of function _code_0901

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8925:
      STY     byte_RAM_F
      LDA     #1
      STA     byte_RAM_4
      LDY     byte_RAM_D7
      LDX     byte_RAM_E3

loc_BANK0_892F:
      LDA     unk_RAM_D9,X
      LSR     A
      LSR     A
      STA     unk_RAM_D9,X
      LDA     (byte_RAM_E9),Y
      AND     #$C0
      ORA     unk_RAM_D9,X
      STA     unk_RAM_D9,X
      INY
      LDA     unk_RAM_D9,X
      LSR     A
      LSR     A
      STA     unk_RAM_D9,X
      LDA     (byte_RAM_E9),Y
      AND     #$C0
      ORA     unk_RAM_D9,X
      STA     unk_RAM_D9,X
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_895D:
      LDX     #7

loc_BANK0_895F:
      STA     byte_RAM_41B,X
      DEX
      BPL     loc_BANK0_895F

      RTS

; End of function sub_BANK0_895D

; ---------------------------------------------------------------------------
_empty_0966:.BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF; 0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF; $90
byte_BANK0_8A00:.BYTE SoundEffect2_Shrinking, SoundEffect2_Growing; 0

; ---------------------------------------------------------------------------
      LDA     PlayerState
      CMP     #PlayerState_Lifting
      BCS     loc_BANK0_8A26

      LDA     #0
      LDY     #$10
      CPY     PlayerHealth
      ROL     A
      EOR     byte_RAM_6F6
      BEQ     loc_BANK0_8A26

      LDY     byte_RAM_6F6
      LDA     byte_BANK0_8A00,Y
      STA     SoundEffectQueue2
      LDA     #$1E
      STA     byte_RAM_82
      LDA     #PlayerState_ChangingSize
      STA     PlayerState

loc_BANK0_8A26:
      LDA     #0
      STA     byte_RAM_64
      LDA     PlayerState
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANK0_8A41
      .WORD loc_BANK0_8AD1
      .WORD loc_BANK0_8A87
      .WORD loc_BANK0_8B8D
      .WORD loc_BANK0_8B46
      .WORD loc_BANK0_8B78
      .WORD loc_BANK0_8BCB
      .WORD loc_BANK0_8A5C
      .WORD loc_BANK0_8BF1
; ---------------------------------------------------------------------------

loc_BANK0_8A41:
      JSR     sub_BANK0_8CD9

      JSR     sub_BANK0_8C1A

      JSR     sub_BANK0_8EFA

      JSR     sub_BANK0_9316

      JSR     sub_BANK0_8EA4

; =============== S U B	R O U T	I N E =======================================

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

loc_BANK0_8A5C:
      LDA     byte_RAM_82
      BNE     locret_BANK0_8A86

      LDA     byte_RAM_42A
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
      LDY     #1				  ; Set	game mode to title card
      DEC     ExtraLives
      BNE     SetGameModeAfterDeath

      INY					  ; If no lives, increase game mode
						  ; from 1 (title card)	to 2 (game over)

SetGameModeAfterDeath:
      STY     GameMode

locret_BANK0_8A86:
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8A87:
      LDA     byte_RAM_82
      BNE     locret_BANK0_8AC1

      LDX     byte_RAM_42D
      LDY     unk_RAM_A8,X
      CPY     #2
      BCC     loc_BANK0_8ABB

      CPY     #7
      BNE     loc_BANK0_8A9D

      LDA     #DPCM_ItemPull
      STA     DPCMQueue

loc_BANK0_8A9D:
      DEC     unk_RAM_A8,X
      LDA     byte_BANK0_8AC6,Y
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
      STA     byte_RAM_82
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8ABB:
      STA     PlayerState
      INC     byte_RAM_99

loc_BANK0_8ABF:
      INC     byte_RAM_9A

locret_BANK0_8AC1:
      RTS

; ---------------------------------------------------------------------------
      .BYTE 0
      .BYTE 1
      .BYTE 1
      .BYTE 1
byte_BANK0_8AC6:.BYTE 1

      .BYTE 2
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 4
      .BYTE 8
      .BYTE 8
byte_BANK0_8ACE:.BYTE 0

      .BYTE $10
      .BYTE $F0
; ---------------------------------------------------------------------------

loc_BANK0_8AD1:
      LDA     Player1JoypadHeld			  ; code used as data at 8000
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8B19:
      LDA     byte_RAM_10
      AND     #7
      BNE     locret_BANK0_8B2A

      LDA     byte_RAM_9D
      EOR     #1
      STA     byte_RAM_9D
      LDA     #2
      STA     SoundEffectQueue2

locret_BANK0_8B2A:
      RTS

; End of function sub_BANK0_8B19

; ---------------------------------------------------------------------------
byte_BANK0_8B2B:.BYTE $C2

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

loc_BANK0_8B46:
      LDA     #$20
      STA     byte_RAM_64
      INC     PlayerYLo
      LDA     PlayerYLo
      AND     #$F
      BNE     locret_BANK0_8B77

      STA     PlayerState
      JSR     sub_BANKF_F6DA

      PLA
      PLA
      JSR     sub_BANK0_940E

      LDA     #2
      STA     byte_RAM_534
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

loc_BANK0_8B78:
      LDA     #$20
      STA     byte_RAM_64
      DEC     PlayerYLo
      LDA     PlayerYLo
      AND     #$F
      BNE     locret_BANK0_8B86

      STA     PlayerState

locret_BANK0_8B86:
      RTS

; ---------------------------------------------------------------------------
byte_BANK0_8B87:.BYTE 0

      .BYTE $FF
byte_BANK0_8B89:.BYTE $EE

      .BYTE $DE
byte_BANK0_8B8B:.BYTE 9

      .BYTE $A1
; ---------------------------------------------------------------------------

loc_BANK0_8B8D:
      LDA     PlayerYAccel
      ASL     A
      ROL     A
      AND     #1
      TAY
      LDA     byte_RAM_42A
      CMP     byte_BANK0_8B87,Y
      BNE     loc_BANK0_8BB0

      LDA     PlayerPageY
      CMP     byte_BANK0_8B89,Y
      BNE     loc_BANK0_8BB0

      JSR     sub_BANKF_F6DA

      INC     byte_RAM_627
      LDA     #3
      STA     byte_RAM_534
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8BB0:
      LDA     byte_RAM_42A
      BNE     loc_BANK0_8BBD

      LDA     PlayerPageY
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
      LDA     #1
      STA     PlayerState
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8BCB:
      LDA     byte_RAM_82
      BEQ     loc_BANK0_8BE9

      JSR     sub_BANK0_8EA4

      LDA     PlayerCollision
NOP ; @TODO fix abs-to-zp
BEQ     locret_BANK0_8BEB

      LDA     #$20
      STA     byte_RAM_64
      LDA     #4
      STA     PlayerXAccel
      LDA     #1
      STA     byte_RAM_9D

loc_BANK0_8BE3:
      JSR     sub_BANK0_8A50

      JMP     sub_BANK0_8D6F

; ---------------------------------------------------------------------------

loc_BANK0_8BE9:
      STA     PlayerState

locret_BANK0_8BEB:
      RTS

; ---------------------------------------------------------------------------
byte_BANK0_8BEC:.BYTE 5

      .BYTE $A
      .BYTE $F
      .BYTE $14
      .BYTE $19
; ---------------------------------------------------------------------------

loc_BANK0_8BF1:
      LDA     byte_RAM_82
      BEQ     loc_BANK0_8C0D

      INC     DamageInvulnTime
      LDY     #4

loc_BANK0_8BF9:
      CMP     byte_BANK0_8BEC,Y
      BNE     loc_BANK0_8C09

      LDA     byte_RAM_6F6
      EOR     #1

loc_BANK0_8C03:
      STA     byte_RAM_6F6
      JMP     loc_BANKF_FE33

; ---------------------------------------------------------------------------

loc_BANK0_8C09:
      DEY
      BPL     loc_BANK0_8BF9

      RTS

; ---------------------------------------------------------------------------

loc_BANK0_8C0D:
      LDY     PlayerAnimationFrame
      CPY     #$A
      BNE     loc_BANK0_8C15

      LDA     #1

loc_BANK0_8C15:
      STA     PlayerState
      RTS

; ---------------------------------------------------------------------------
byte_BANK0_8C18:.BYTE $FE

      .BYTE 2

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8C1A:
      JSR     sub_BANK0_8D6F

      LDA     byte_RAM_99
      BNE     loc_BANK0_8C63

      LDA     byte_RAM_9A
      BEQ     loc_BANK0_8C2B

      LDA     byte_RAM_82
      BNE     loc_BANK0_8C92

      DEC     byte_RAM_9A

loc_BANK0_8C2B:
      LDA     Player1JoypadPress
      BPL     loc_BANK0_8C3D

      INC     byte_RAM_99
      LDA     #6
      STA     PlayerAnimationFrame
      JSR     sub_BANK0_8C99

      LDA     #1
      STA     SoundEffectQueue2

loc_BANK0_8C3D:
      LDA     byte_RAM_4B2
      BNE     loc_BANK0_8C92

      LDA     byte_RAM_4DF
      BNE     loc_BANK0_8C63

      LDA     Player1JoypadHeld
      AND     #ControllerInput_Down
      BEQ     loc_BANK0_8C63

      INC     byte_RAM_9A
      LDA     #4
      STA     PlayerAnimationFrame
      LDA     byte_RAM_99
      BNE     loc_BANK0_8C63

      LDA     CrouchJumpTimer
      CMP     #$3C
      BCS     loc_BANK0_8C92

      INC     CrouchJumpTimer
      BNE     loc_BANK0_8C92

loc_BANK0_8C63:
      LDA     CrouchJumpTimer
      CMP     #$3C
      BCS     loc_BANK0_8C6F

      LDA     #0
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
      BNE     loc_BANK0_8C8B

      LDA     PlayerXAccel
      CLC
      ADC     byte_BANK0_8C18,Y
      STA     PlayerXAccel

loc_BANK0_8C8B:
      LDA     #0
      STA     CrouchJumpTimer
      BEQ     loc_BANK0_8C95

loc_BANK0_8C92:
      JSR     sub_BANK0_8D2C

loc_BANK0_8C95:
      JSR     sub_BANK0_8DC0

      RTS

; End of function sub_BANK0_8C1A

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8CD9:
      LDA     byte_RAM_4DF
      CMP     #2
      BCC     loc_BANK0_8CE5

      LDA     byte_RAM_556
      BNE     loc_BANK0_8D13

loc_BANK0_8CE5:
      LDA     byte_RAM_554
      LDY     Player1JoypadHeld
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
byte_BANK0_8D26:.BYTE $FC

      .BYTE 0
      .BYTE 4
      .BYTE 0
byte_BANK0_8D2A:.BYTE $FD

      .BYTE 3

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8D2C:
      LDA     byte_RAM_99
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
      LDA     byte_RAM_9A
      BNE     locret_BANK0_8D61

      LDA     PlayerAnimationFrame
      CMP     #9
      BEQ     locret_BANK0_8D61

      LDA     #2
      STA     PlayerAnimationFrame
      LDA     #0
      STA     byte_RAM_84
      STA     byte_RAM_9B

locret_BANK0_8D61:
      RTS

; End of function sub_BANK0_8D2C

; ---------------------------------------------------------------------------
byte_BANK0_8D62:.BYTE $C

      .BYTE $A
      .BYTE 8
      .BYTE 5
      .BYTE 3
      .BYTE 2
      .BYTE   2
      .BYTE   2
      .BYTE   2
      .BYTE   2
byte_BANK0_8D6C:.BYTE 2

      .BYTE 0
      .BYTE 9

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8D6F:
      LDA     byte_RAM_9A
      BNE     locret_BANK0_8DB1

loc_BANK0_8D73:
      LDA     byte_RAM_99
      BEQ     loc_BANK0_8D85

      LDA     CurrentCharacter
      CMP     #3
      BNE     locret_BANK0_8DB1

      LDA     byte_RAM_84
      BNE     loc_BANK0_8DAA

      LDA     #2
      BNE     loc_BANK0_8DA0

loc_BANK0_8D85:
      LDA     byte_RAM_84
      BNE     loc_BANK0_8DAA

      LDA     #5
      LDY     byte_RAM_624
      BNE     loc_BANK0_8DA0

      LDA     PlayerXAccel
      BPL     loc_BANK0_8D99

      EOR     #$FF
      CLC
      ADC     #1

loc_BANK0_8D99:
      LSR     A
      LSR     A
      LSR     A
      TAY
      LDA     byte_BANK0_8D62,Y

loc_BANK0_8DA0:
      STA     byte_RAM_84
      DEC     byte_RAM_9B
      BPL     loc_BANK0_8DAA

      LDA     #1
      STA     byte_RAM_9B

loc_BANK0_8DAA:
      LDY     byte_RAM_9B
      LDA     byte_BANK0_8D6C,Y
      STA     PlayerAnimationFrame

locret_BANK0_8DB1:
      RTS

; End of function sub_BANK0_8D6F

; ---------------------------------------------------------------------------
byte_BANK0_8DB2:.BYTE 0

      .BYTE 0
      .BYTE $D0
      .BYTE $30
      .BYTE $D0
      .BYTE $30
      .BYTE $D0
      .BYTE $30
byte_BANK0_8DBA:.BYTE $18

      .BYTE 0
      .BYTE $18
      .BYTE $F8
byte_BANK0_8DBE:.BYTE $F0

      .BYTE $10

; =============== S U B	R O U T	I N E =======================================

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
      CMP     #$32
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
      LDA     EnemyState,X
      CMP     #6
      BEQ     locret_BANK0_8E41

      LDA     ObjectType,X
      CMP     #$39
      BCC     loc_BANK0_8E22

      CMP     #$3A
      BCC     loc_BANK0_8E28

loc_BANK0_8E22:
      CMP     #$37
      BCC     loc_BANK0_8E42

      LDY     #2

loc_BANK0_8E28:
      STY     byte_RAM_7
      LDA     byte_RAM_9D
      ASL     A
      ORA     byte_RAM_9A
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
      LDA     #9
      STA     PlayerAnimationFrame
      LDA     #2
      STA     byte_RAM_9B
      LDA     #$A
      STA     byte_RAM_84
      DEC     HoldingItem
      LDA     #8
      STA     SoundEffect1Queue
      LDA     #0
      STA     byte_RAM_9A
      STA     Player1JoypadPress
      STA     byte_RAM_1
      LDX     byte_RAM_42D
      LDA     #$36
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
      STA     unk_RAM_42F,X
      LSR     A
      STA     unk_RAM_A8,X
      RTS

; End of function sub_BANK0_8DC0

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8EA4:
      LDX     #$A

; End of function sub_BANK0_8EA4

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK0_8EE8:.BYTE 2

      .BYTE 2
      .BYTE 1
      .BYTE 1
      .BYTE 2
      .BYTE 2
      .BYTE 2
      .BYTE 2
byte_BANK0_8EF0:.BYTE 8

      .BYTE 8
      .BYTE 4
      .BYTE 4
      .BYTE 2
      .BYTE 2
      .BYTE 1
      .BYTE 1
byte_BANK0_8EF8:.BYTE $F0

      .BYTE $10

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8EFA:
      LDA     #0
      STA     PlayerCollision
      STA     byte_RAM_624
      STA     byte_RAM_7
      STA     byte_RAM_A
      STA     byte_RAM_E
      STA     word_RAM_C
      JSR     sub_BANK0_8FFD

loc_BANK0_8F0C:
      LDA     byte_RAM_9A
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
      LDY     BackgroundCHR2TimerIndex
      CPY     #1
      BEQ     loc_BANK0_8F44

      CPY     #5
      BNE     loc_BANK0_8F47

loc_BANK0_8F44:
      JSR     $BA7C

loc_BANK0_8F47:
      STA     byte_RAM_4DF
      STX     byte_RAM_99
      JMP     loc_BANK0_8F95

; ---------------------------------------------------------------------------

loc_BANK0_8F4F:
      LDA     #0
      STA     byte_RAM_4DF
      LDA     PlayerYLo
      AND     #$C
      BNE     loc_BANK0_8F95

      STA     byte_RAM_99
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

      LDA     PlayerPageX
      STA     byte_RAM_429
      ROR     byte_RAM_12
      JSR     $BABF

loc_BANK0_8F95:
      LDY     #2
      LDA     PlayerXAccel
      CLC
      ADC     byte_RAM_4CB
      BMI     loc_BANK0_8FA3

      DEY
      JSR     sub_BANK0_8FF5

loc_BANK0_8FA3:
      STY     byte_RAM_6E
      JSR     sub_BANK0_8FB2

      LDA     PlayerCollision
      AND     #3
      BEQ     locret_BANK0_8FB1

      JMP     loc_BANK0_9333

; ---------------------------------------------------------------------------

locret_BANK0_8FB1:
      RTS

; End of function sub_BANK0_8EFA

; =============== S U B	R O U T	I N E =======================================

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
      LDA     byte_BANK0_8EF0,X
      ORA     PlayerCollision
      STA     PlayerCollision

loc_BANK0_8FF2:
      JMP     loc_BANK0_8FF8

; End of function sub_BANK0_8FB2

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8FF5:
      JSR     loc_BANK0_8FF8

loc_BANK0_8FF8:
      INC     byte_RAM_7
      INC     byte_RAM_8
      RTS

; End of function sub_BANK0_8FF5

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_8FFD:
      LDY     byte_BANKF_F00A
      LDA     byte_RAM_10
      LSR     A

loc_BANK0_9003:
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
      JSR     sub_BANK1_B9B8

loc_BANK0_9023:
      LDA     #SoundEffect1_CherryGet
      STA     SoundEffect1Queue
      LDA     #$40
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

      LDA     #1
      STA     PlayerState
      STY     byte_RAM_99
      STY     byte_RAM_9A
      LDA     #$A
      STA     PlayerAnimationFrame
      PLA
      PLA
      PLA
      PLA

locret_BANK0_9052:
      RTS

; End of function sub_BANK0_8FFD

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_9053:
      PHA
      AND     #$C0

loc_BANK0_9056:
      ASL     A
      ROL     A
      ROL     A
      ADC     byte_BANK0_9062,Y

loc_BANK0_905C:
      TAY
      PLA
      CMP     byte_BANKF_F64E,Y
      RTS

; End of function sub_BANK0_9053

; ---------------------------------------------------------------------------
byte_BANK0_9062:.BYTE 0

      .BYTE 4
      .BYTE 8
byte_BANK0_9065:.BYTE $39

      .BYTE $39	; 9
      .BYTE $39	; 9
      .BYTE $3A
      .BYTE $36	; 6
      .BYTE $33
      .BYTE $32
      .BYTE $38
      .BYTE $35	; 5
      .BYTE $37
      .BYTE $3E
      .BYTE $40
      .BYTE $3A
      .BYTE 9
      .BYTE $39
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
      STA     EnemyTimer,X
      LDA     byte_RAM_3
      STA     ObjectXHi,X
      LDA     byte_RAM_4
      STA     ObjectYHi,X
      LDA     byte_RAM_5
      STA     ObjectXLo,X
      LDA     byte_RAM_6
      STA     ObjectYLo,X
      LDA     #0
      STA     unk_RAM_42F,X
      STA     unk_RAM_9F,X
      STA     unk_RAM_B1,X
      JSR     $BA48

      LDA     #1
      LDY     byte_RAM_9
      CPY     #$E
      BNE     loc_BANK0_90AE

      LDA     #$20
      STA     unk_RAM_86,X
      LDA     #6

loc_BANK0_90AE:
      STA     EnemyState,X
      LDA     byte_BANK0_9065,Y
      STA     ObjectType,X
      LDY     #$FF
      CMP     #$37
      BEQ     loc_BANK0_90C1

      CMP     #9
      BNE     loc_BANK0_90C5

loc_BANK0_90BF:
      LDY     #$50

loc_BANK0_90C1:
      STY     unk_RAM_86,X

loc_BANK0_90C3:
      BNE     loc_BANK0_90EA

loc_BANK0_90C5:
      CMP     #$40
      BNE     loc_BANK0_90D5

      LDA     Mushroom1upPulled
      BEQ     loc_BANK0_90EA

      LDA     #$32
      STA     ObjectType,X

loc_BANK0_90D2:
      JMP     loc_BANK0_90EA

; ---------------------------------------------------------------------------

loc_BANK0_90D5:
      CMP     #$33
      BNE     loc_BANK0_90EA

      LDY     BigVeggiesPulled
      INY
      CPY     #5
      BCC     loc_BANK0_90E7

      LDA     #$46
      STA     ObjectType,X
      LDY     #0

loc_BANK0_90E7:
      STY     BigVeggiesPulled

loc_BANK0_90EA:
      JSR     $B9EB

      LDA     #4
      STA     EnemyCollision,X
      LDA     #$40
      JSR     sub_BANK0_934F

      LDA     #7
      STA     unk_RAM_A8,X
      STX     byte_RAM_42D
      LDA     #2
      STA     PlayerState
      LDA     #6
      STA     byte_RAM_82
      LDA     #8
      STA     PlayerAnimationFrame
      INC     HoldingItem
      RTS

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_910C:
      LDY     HoldingItem
      BNE     loc_BANK0_917C

      LDA     byte_RAM_9A
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
      LDA     #4
      STA     PlayerState

loc_BANK0_9140:
      STY     byte_RAM_4EE

; End of function sub_BANK0_910C

; =============== S U B	R O U T	I N E =======================================

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
      LDA     byte_RAM_9A
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
      CPX     #2
      BNE     loc_BANK0_91E3

      LDA     SubspaceVisits
      CMP     #2
      BCS     loc_BANK0_91E2

      INC     byte_RAM_622
      LDX     #0

loc_BANK0_91E2:
      TXA

loc_BANK0_91E3:
      CLC
      ADC     #4
      STA     byte_RAM_9
      JMP     loc_BANK0_9074

; ---------------------------------------------------------------------------

loc_BANK0_91EB:
      LDA     Player1JoypadPress
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
      STA     byte_RAM_534
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
byte_BANK0_924A:.BYTE $51

      .BYTE $50
      .BYTE $83
      .BYTE $52
      .BYTE $56

; =============== S U B	R O U T	I N E =======================================

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
      JSR     $BA4E

      LDY     byte_RAM_E7
      LDA     (byte_RAM_1),Y

loc_BANK0_92A5:
      STA     byte_RAM_0
      PLA
      TAX
      RTS

; End of function sub_BANK0_924F

; =============== S U B	R O U T	I N E =======================================

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

; =============== S U B	R O U T	I N E =======================================

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
byte_BANK0_92E0:.BYTE $A

byte_BANK0_92E1:.BYTE 1

      .BYTE $B
; ---------------------------------------------------------------------------

_code_12E3:
      LDX     byte_RAM_D8
      BNE     locret_BANK0_9311

      LDA     PlayerState
      CMP     #2
      BCS     locret_BANK0_9311

      LDA     PlayerPageY
      LDY     byte_RAM_42A
      BMI     loc_BANK0_92FF

      BNE     loc_BANK0_9305

      CMP     #$B4
      BCS     loc_BANK0_9305

      CMP     #$21
      BCS     loc_BANK0_9307

loc_BANK0_92FF:
      LDY     byte_RAM_99
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
      STX     byte_RAM_D8

locret_BANK0_9311:
						  ; DATA XREF: ...
      RTS

; ---------------------------------------------------------------------------
      .BYTE 1
byte_BANK0_9313:.BYTE 2

      .BYTE $80
      .BYTE 0

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_9316:
      LDA     IsHorizontalLevel
      BEQ     locret_BANK0_9327

      LDA     PlayerPageX
      LDY     byte_RAM_6E
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
      ORA     locret_BANK0_9311,Y
      STA     PlayerCollision

loc_BANK0_9333:
      LDX     #0
      LDY     byte_RAM_6E
      LDA     PlayerXAccel
      EOR     byte_BANK0_9313,Y
      BPL     loc_BANK0_9340

      STX     PlayerXAccel

loc_BANK0_9340:
      LDA     byte_RAM_4CB
      EOR     byte_BANK0_9313,Y
      BPL     loc_BANK0_934B

      STX     byte_RAM_4CB

loc_BANK0_934B:
      STX     ObjectXSubpixel

locret_BANK0_934E:
      RTS

; End of function sub_BANK0_9316

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_934F:
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

loc_BANK0_937C:
      STX     byte_RAM_3
      PHA
      JSR     $BA4E

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
byte_BANK0_940A:.BYTE $20

      .BYTE $28
      .BYTE $20
      .BYTE $24

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_940E:
      LDA     InSubspaceOrJar
      BNE     locret_BANK0_9427

      LDA     PlayerXHi
      STA     byte_RAM_50F
      LDA     PlayerXLo
      STA     byte_RAM_511

loc_BANK0_941D:
      LDA     PlayerYHi
      STA     byte_RAM_510
      LDA     PlayerYLo
      STA     byte_RAM_512

locret_BANK0_9427:
      RTS

; End of function sub_BANK0_940E

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_9428:
      LDA     byte_RAM_50F
      STA     PlayerXHi
      LDA     byte_RAM_511

loc_BANK0_9430:
      STA     PlayerXLo
      LDA     byte_RAM_510
      STA     PlayerYHi
      LDA     byte_RAM_512
      STA     PlayerYLo
      LDA     PlayerXLo

loc_BANK0_943E:
      SEC
      SBC     byte_RAM_4C0
      STA     PlayerPageX
      LDA     PlayerYLo
      SEC
      SBC     byte_RAM_CB
      STA     PlayerPageY
      LDA     PlayerYHi
      SBC     byte_RAM_CA
      STA     byte_RAM_42A
      LDA     byte_RAM_534
      SEC
      SBC     #4
      BNE     locret_BANK0_9427

      STA     PlayerState
      STA     byte_RAM_41B
      STA     SubspaceTimer
      JSR     $B964

      LDA     #$A
      STA     byte_RAM_4B3
      RTS

; End of function sub_BANK0_9428

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_946D:
      LDA     byte_RAM_534

loc_BANK0_9470:
      CMP     #2
      BNE     loc_BANK0_947F

      LDA     byte_RAM_4EE
      BNE     loc_BANK0_947F

      JSR     sub_BANK0_9428

      JMP     loc_BANK0_94C2

; ---------------------------------------------------------------------------

loc_BANK0_947F:
      LDA     byte_RAM_533
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
      SBC     byte_RAM_4C0
      STA     PlayerPageX
      LDA     PlayerYLo
      SEC

loc_BANK0_94AC:
      SBC     byte_RAM_CB
      STA     PlayerPageY
      LDA     PlayerYHi
      SBC     byte_RAM_CA
      STA     byte_RAM_42A
      LDA     byte_RAM_534
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_94CA:
      LDA     byte_RAM_534
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
      LDA     byte_RAM_533
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

; =============== S U B	R O U T	I N E =======================================

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
      LDA     byte_RAM_533
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

; =============== S U B	R O U T	I N E =======================================

sub_BANK0_9561:
      LDA     #1
      STA     byte_RAM_99
      LDA     #$78
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
      LDA     PlayerPageY
      CLC
      ADC     #8
      AND     #$F0
      EOR     #$10
      STA     PlayerYLo
      CMP     #$F0
      BEQ     loc_BANK0_9587

      DEC     PlayerYHi

loc_BANK0_9587:
      LDA     #$A
      STA     PlayerAnimationFrame
      RTS

; ---------------------------------------------------------------------------

loc_BANK0_958C:
      LDA     PlayerPageX
      SEC
      SBC     byte_RAM_BA
      EOR     #$FF
      CLC
      ADC     #$F1
      STA     PlayerXLo
      LDA     PlayerPageY
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

; =============== S U B	R O U T	I N E =======================================

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
_empty_15C3:.BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF; 0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF; $30
TitleScreenPPUDataPointers:.WORD _RAM_PPUDataBuffer

      .WORD TitleLayout1

; =============== S U B	R O U T	I N E =======================================

WaitForNMI_TitleScreen_TurnOnPPU:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites ; code	used at	8000
      STA     PPUMaskMirror

; End of function WaitForNMI_TitleScreen_TurnOnPPU

; =============== S U B	R O U T	I N E =======================================

WaitForNMI_TitleScreen:
      LDA     byte_RAM_11
      ASL     A
      TAX
      LDA     TitleScreenPPUDataPointers,X
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
TitleLayout1:.BYTE $20

      .BYTE   0
      .BYTE $DE
      .BYTE $FD, $20, 1, $DE, $FD, $20,	2, $DE,	$FD, $20, 3, $DE, $FD, $20, $1C, $DE; 0
      .BYTE $FD, $20, $1D, $DE,	$FD, $20, $1E, $DE, $FD, $20, $1F, $DE,	$FD, $20, 3, $5D; $10
      .BYTE $FD, $20, $23, $5D,	$FD, $20, $43, $5D, $FD, $20, $63, $5D,	$FD, $23, $63, $5D; $20
      .BYTE $FD, $23, $83, $5D,	$FD, $23, $A3, $5D, $FD, $20, $68, $10,	$48, $4A, $4C, $4E; $30
      .BYTE $50, $51, $52, $53,	$54, $55, $56, $57, $58, $5A, $5C, $5E,	$20, $84, 8, $FD; $40
      .BYTE $22, $23, $24, $49,	$4B, $4D, $4F, $20, $94, 8, $59, $5B, $5D, $5F;	$50
      .BYTE $2E
      .BYTE $2F
      .BYTE $30	; 0
      .BYTE $FD
      .BYTE $20
      .BYTE $A4
      .BYTE   3
      .BYTE $25
      .BYTE $26
      .BYTE $27
      .BYTE $20
      .BYTE $B9
      .BYTE   3
      .BYTE $31	; 1
      .BYTE $32	; 2
      .BYTE $33	; 3
      .BYTE $20
      .BYTE $C4
      .BYTE   3
      .BYTE $28
      .BYTE $29
      .BYTE $2A
      .BYTE $20
      .BYTE $D9
      .BYTE   3
      .BYTE $34	; 4
      .BYTE $35	; 5
      .BYTE $36	; 6
      .BYTE $20
      .BYTE $E3
      .BYTE   3
      .BYTE $2B
      .BYTE $2C
      .BYTE $2D
      .BYTE $20
      .BYTE $FA
      .BYTE   3
      .BYTE $37	; 7
      .BYTE $38	; 8
      .BYTE $39	; 9
      .BYTE $21
      .BYTE   3
      .BYTE   2
      .BYTE $3A
      .BYTE $3B
      .BYTE $21
      .BYTE $1B
      .BYTE   2
      .BYTE $40
      .BYTE $41
      .BYTE $21
      .BYTE $23
      .BYTE $C6
      .BYTE $3C
      .BYTE $21
      .BYTE $3C
      .BYTE $C6
      .BYTE $42
      .BYTE $21
      .BYTE $E3
      .BYTE   1
      .BYTE $3D
      .BYTE $21
      .BYTE $FC
      .BYTE   1
      .BYTE $60
      .BYTE $22
      .BYTE   2
      .BYTE   2
      .BYTE $3E
      .BYTE $3F
      .BYTE $22
      .BYTE $1C
      .BYTE   2
      .BYTE $61
      .BYTE $62
      .BYTE $22
      .BYTE $22
      .BYTE   2
      .BYTE $43
      .BYTE $44
      .BYTE $22
      .BYTE $3C
      .BYTE   2
      .BYTE $63
      .BYTE $64
      .BYTE $22
      .BYTE $43
      .BYTE   1
      .BYTE $45
      .BYTE $22
      .BYTE $5C
      .BYTE   1
      .BYTE $65
      .BYTE $22
      .BYTE $63
      .BYTE $C6
      .BYTE $3C
      .BYTE $22
      .BYTE $7C
      .BYTE $C4
      .BYTE $42
      .BYTE $22
      .BYTE $C4
      .BYTE   2
      .BYTE $A6
      .BYTE $A8
      .BYTE $22
      .BYTE $E4
      .BYTE   2
      .BYTE $A7
      .BYTE $A9
      .BYTE $22
      .BYTE $FA
      .BYTE   4
      .BYTE $80
      .BYTE $82
      .BYTE $88
      .BYTE $8A
      .BYTE $23
      .BYTE   4
      .BYTE   2
      .BYTE $90
      .BYTE $92
      .BYTE $23
      .BYTE $14
      .BYTE   2
      .BYTE $9E
      .BYTE $A0
      .BYTE $23
      .BYTE $1A
      .BYTE   4
      .BYTE $81
      .BYTE $83
      .BYTE $89
      .BYTE $8B
      .BYTE $23
      .BYTE $23
      .BYTE   3
      .BYTE $46
      .BYTE $91
      .BYTE $93
      .BYTE $23
      .BYTE $2A
      .BYTE   2
      .BYTE $A2
      .BYTE $A4
      .BYTE $23
      .BYTE $2E
      .BYTE  $B
      .BYTE $67
      .BYTE $6C
      .BYTE $6E
      .BYTE $70
      .BYTE $72
      .BYTE $69
      .BYTE $9F
      .BYTE $A1
      .BYTE $75
      .BYTE $98
      .BYTE $9A
      .BYTE $23
      .BYTE $3A
      .BYTE   4
      .BYTE $84
      .BYTE $86
      .BYTE $8C
      .BYTE $8E
      .BYTE $23
      .BYTE $43
      .BYTE $1B
      .BYTE $47
      .BYTE $94
      .BYTE $96
      .BYTE $74
      .BYTE $74
      .BYTE $74
      .BYTE $74
      .BYTE $A3
      .BYTE $A5
      .BYTE $74
      .BYTE $66
      .BYTE $68
      .BYTE $6D
      .BYTE $6F
      .BYTE $71
      .BYTE $73
      .BYTE $6A
      .BYTE $6B
      .BYTE $74
      .BYTE $74
      .BYTE $99
      .BYTE $9B
      .BYTE $74
      .BYTE $85
      .BYTE $87
      .BYTE $8D
      .BYTE $8F
      .BYTE $23
      .BYTE $64
      .BYTE   5
      .BYTE $95
      .BYTE $97
      .BYTE $FD
      .BYTE $AA
      .BYTE $AB
      .BYTE $23
      .BYTE $77
      .BYTE   4
      .BYTE $9C
      .BYTE $9D
      .BYTE $AA
      .BYTE $AB
      .BYTE $23
      .BYTE $89
      .BYTE   2
      .BYTE $AA
      .BYTE $AB
TitleLogoSuper_Line1:.BYTE $20
      .BYTE $CB
      .BYTE  $A
      .BYTE   0
      .BYTE   1
      .BYTE   8
      .BYTE   8
      .BYTE $FC
      .BYTE   1
      .BYTE $FC
      .BYTE   8
      .BYTE $FC
      .BYTE   1
TitleLogoSuper_Line2:.BYTE $20
      .BYTE $EB
      .BYTE  $A
      .BYTE   2
      .BYTE   3
      .BYTE   8
      .BYTE   8
      .BYTE  $A
      .BYTE   5
      .BYTE  $B
      .BYTE  $C
      .BYTE  $A
      .BYTE  $D
TitleLogoSuper_Line3:.BYTE $21
      .BYTE  $B
      .BYTE  $A
      .BYTE   4
      .BYTE   5
      .BYTE   4
      .BYTE   5
      .BYTE  $E
      .BYTE   7
      .BYTE $FC
      .BYTE   8
      .BYTE  $E
      .BYTE   8
TitleLogoSuper_Line4a:.BYTE $21
      .BYTE $2B
      .BYTE   5
      .BYTE   6
      .BYTE   7
      .BYTE   6
      .BYTE   7
      .BYTE   9
TitleLogoSuper_Line4b:.BYTE $21
      .BYTE $31	; 1
      .BYTE   4
      .BYTE $76
      .BYTE   9
      .BYTE   9
      .BYTE   9
TitleLogo_TM:.BYTE $21
      .BYTE $38	; 8
      .BYTE   2
      .BYTE $F9
      .BYTE $FA
TitleLayout2:.BYTE $21
      .BYTE $46
      .BYTE  $A
      .BYTE   0
      .BYTE  $F
      .BYTE   1
      .BYTE   0
      .BYTE   1
      .BYTE $FC
      .BYTE   1
      .BYTE   8
      .BYTE   0
      .BYTE   1
      .BYTE $21
      .BYTE $66
      .BYTE  $A
      .BYTE $10
      .BYTE $10
      .BYTE   8
      .BYTE $10
      .BYTE   8
      .BYTE $10
      .BYTE   8
      .BYTE   8
      .BYTE $10
      .BYTE   8
      .BYTE $21
      .BYTE $86
      .BYTE  $A
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE $13
      .BYTE  $D
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE $21
      .BYTE $A6
      .BYTE  $A
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE $FC
      .BYTE   8
      .BYTE  $E
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE $21
      .BYTE $C6
      .BYTE  $A
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE $10
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE   4
      .BYTE   5
      .BYTE $21
      .BYTE $E6
      .BYTE  $A
      .BYTE   9
      .BYTE   9
      .BYTE   9
      .BYTE   9
      .BYTE   9
      .BYTE   9
      .BYTE   9
      .BYTE   9
      .BYTE   6
      .BYTE   7
      .BYTE $21
      .BYTE $51
      .BYTE   8
      .BYTE $FC
      .BYTE   1
      .BYTE $FC
      .BYTE   1
      .BYTE   0
      .BYTE   1
      .BYTE   0
      .BYTE   1
      .BYTE $21
      .BYTE $71
      .BYTE   8
      .BYTE $10
      .BYTE   8
      .BYTE $10
      .BYTE   8
      .BYTE $10
      .BYTE   8
      .BYTE $10
      .BYTE   8
      .BYTE $21
      .BYTE $91
      .BYTE   8
      .BYTE $13
      .BYTE  $D
      .BYTE $13
      .BYTE  $D
      .BYTE   8
      .BYTE   8
      .BYTE $77
      .BYTE   3
      .BYTE $21
      .BYTE $B1
      .BYTE   8
      .BYTE  $E
      .BYTE   8
      .BYTE  $E
      .BYTE   8
      .BYTE   8
      .BYTE   8
      .BYTE $12
      .BYTE   8
      .BYTE $21
      .BYTE $D1
      .BYTE   9
      .BYTE $13
      .BYTE   5
      .BYTE   8
      .BYTE   8
      .BYTE   4
      .BYTE   5
      .BYTE   4
      .BYTE   5
      .BYTE   8
      .BYTE $21
      .BYTE $F1
      .BYTE   9
      .BYTE $11
      .BYTE   7
      .BYTE   9
      .BYTE   9
      .BYTE   6
      .BYTE   7
      .BYTE   6
      .BYTE   7
      .BYTE   9
      .BYTE $22
      .BYTE  $E
      .BYTE   4
      .BYTE $14
      .BYTE $15
      .BYTE $16
      .BYTE $17
      .BYTE $22
      .BYTE $2E
      .BYTE   4
      .BYTE $18
      .BYTE $19
      .BYTE $1A
      .BYTE $1B
      .BYTE $22
      .BYTE $4E
      .BYTE   4
      .BYTE $1C
      .BYTE $1D
      .BYTE $1E
      .BYTE $1F
      .BYTE $22
      .BYTE $6E
      .BYTE   4
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $20
      .BYTE $22
      .BYTE $8E
      .BYTE   4
      .BYTE $76
      .BYTE $76
      .BYTE $76
      .BYTE $21
TitleText_C_1988:.BYTE $22
      .BYTE $E9
      .BYTE   5
      .BYTE $F8
      .BYTE $D1
      .BYTE $D9
      .BYTE $D8
      .BYTE $D8
TitleText_Nintendo:.BYTE $22
      .BYTE $EF
      .BYTE   8
      .BYTE $E7
      .BYTE $E2
      .BYTE $E7
      .BYTE $ED
      .BYTE $DE
      .BYTE $E7
      .BYTE $DD
      .BYTE $E8
      .BYTE $23
      .BYTE $CA
      .BYTE   4
      .BYTE $80
      .BYTE $A0
      .BYTE $A0
      .BYTE $20
      .BYTE $23
      .BYTE $D1
      .BYTE  $E
      .BYTE $80
      .BYTE $A8
      .BYTE $AA
      .BYTE $AA
      .BYTE $A2
      .BYTE $22
      .BYTE   0
      .BYTE   0
      .BYTE $88
      .BYTE $AA
      .BYTE $AA
      .BYTE $AA
      .BYTE $AA
      .BYTE $22
      .BYTE $23
      .BYTE $E3
      .BYTE   2
      .BYTE $88
      .BYTE $22
      .BYTE $23
      .BYTE $EA
      .BYTE   4
      .BYTE $F0
      .BYTE $F8
      .BYTE $F2
      .BYTE $F0
      .BYTE 0
TitleBackgroundPalettes:.BYTE $22
      .BYTE $37	; 7
      .BYTE $16
      .BYTE   7
      .BYTE $22
      .BYTE $30	; 0
      .BYTE $31	; 1
      .BYTE  $F
      .BYTE $22
      .BYTE $30	; 0
      .BYTE  $F
      .BYTE  $F
      .BYTE $22
      .BYTE $30	; 0
      .BYTE  $F
      .BYTE  $F
TitleSpritePalettes:.BYTE $22 ;	"		  ; Unused DDP character palettes!
      .BYTE $30	; 0
      .BYTE $28
      .BYTE  $F
      .BYTE $22
      .BYTE $30	; 0
      .BYTE $25
      .BYTE  $F
      .BYTE $22
      .BYTE $30	; 0
      .BYTE $12
      .BYTE  $F
      .BYTE $22
      .BYTE $30	; 0
      .BYTE $23
      .BYTE  $F
TitleStoryText_STORY:.BYTE $EC,	$ED, $E8, $EB, $F2		 ; 0

TitleStoryTextPointersHi:.BYTE >TitleStoryText_Line01

      .BYTE >TitleStoryText_Line02
      .BYTE >TitleStoryText_Line03
      .BYTE >TitleStoryText_Line04
      .BYTE >TitleStoryText_Line05
      .BYTE >TitleStoryText_Line06
      .BYTE >TitleStoryText_Line07
      .BYTE >TitleStoryText_Line08
      .BYTE >TitleStoryText_Line08
      .BYTE >TitleStoryText_Line09
      .BYTE >TitleStoryText_Line10
      .BYTE >TitleStoryText_Line11
      .BYTE >TitleStoryText_Line12
      .BYTE >TitleStoryText_Line13
      .BYTE >TitleStoryText_Line14
      .BYTE >TitleStoryText_Line15
      .BYTE >TitleStoryText_Line16
TitleStoryTextPointersLo:.BYTE <TitleStoryText_Line01

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
TitleStoryText_Line01:.BYTE $F0, $E1, $DE, $E7,	$FB, $FB, $E6, $DA, $EB, $E2, $E8, $FB,	$E8, $E9, $DE, $E7; 0
      .BYTE $DE, $DD, $FB, $DA			  ; $10
TitleStoryText_Line02:.BYTE $DD, $E8, $E8, $EB,	$FB, $DA, $DF, $ED, $DE, $EB, $FB, $FB,	$DC, $E5, $E2, $E6; 0
      .BYTE $DB, $E2, $E7, $E0			  ; $10
TitleStoryText_Line03:.BYTE $DA, $FB, $E5, $E8,	$E7, $E0, $FB, $EC, $ED, $DA, $E2, $EB,	$FB, $E2, $E7, $FB; 0
      .BYTE $FB, $E1, $E2, $EC			  ; $10
TitleStoryText_Line04:.BYTE $DD, $EB, $DE, $DA,	$E6, $F7, $FB, $DA, $E7, $E8, $ED, $E1,	$DE, $EB, $FB, $F0; 0
      .BYTE $E8, $EB, $E5, $DD			  ; $10
TitleStoryText_Line05:.BYTE $EC, $E9, $EB, $DE,	$DA, $DD, $FB, $FB, $FB, $DB, $DE, $DF,	$E8, $EB, $DE, $FB; 0
      .BYTE $FB, $E1, $E2, $E6			  ; $10
TitleStoryText_Line06:.BYTE $DA, $E7, $DD, $FB,	$E1, $DE, $FB, $E1, $DE, $DA, $EB, $DD,	$FB, $DA, $FB, $EF; 0
      .BYTE $E8, $E2, $DC, $DE			  ; $10
TitleStoryText_Line07:.BYTE $DC, $DA, $E5, $E5,	$FB, $DF, $E8, $EB, $FB, $E1, $DE, $E5,	$E9, $FB, $ED, $E8; 0
      .BYTE $FB, $FB, $DB, $DE			  ; $10
TitleStoryText_Line08:.BYTE $FB, $DF, $EB, $DE,	$DE, $DD, $FB, $FB, $DF, $EB, $E8, $E6,	$FB, $DA, $FB, $EC; 0
      .BYTE $E9, $DE, $E5, $E5			  ; $10
TitleStoryText_Line09:.BYTE $DA, $DF, $ED, $DE,	$EB, $FB, $FB, $DA, $F0, $DA, $E4, $DE,	$E7, $E2, $E7, $E0; 0
      .BYTE $F7, $FB, $FB, $FB			  ; $10
TitleStoryText_Line10:.BYTE $E6, $DA, $EB, $E2,	$E8, $FB, $FB, $F0, $DE, $E7, $ED, $FB,	$ED, $E8, $FB, $FB; 0
      .BYTE $DA, $FB, $FB, $FB			  ; $10
TitleStoryText_Line11:.BYTE $DC, $DA, $EF, $DE,	$FB, $FB, $E7, $DE, $DA, $EB, $DB, $F2,	$FB, $DA, $E7, $DD; 0
      .BYTE $FB, $FB, $ED, $E8			  ; $10
TitleStoryText_Line12:.BYTE $E1, $E2, $EC, $FB,	$FB, $EC, $EE, $EB, $E9, $EB, $E2, $EC,	$DE, $FB, $E1, $DE; 0
      .BYTE $FB, $EC, $DA, $F0			  ; $10
TitleStoryText_Line13:.BYTE $DE, $F1, $DA, $DC,	$ED, $E5, $F2, $FB, $FB, $F0, $E1, $DA,	$ED, $FB, $E1, $DE; 0
      .BYTE $FB, $EC, $DA, $F0			  ; $10
TitleStoryText_Line14:.BYTE $E2, $E7, $FB, $E1,	$E2, $EC, $FB, $DD, $EB, $DE, $DA, $E6,	$CF, $CF, $CF, $CF; 0
      .BYTE $FB, $FB, $FB, $FB			  ; $10
TitleStoryText_Line15:.BYTE $FB, $FB, $FB, $FB,	$FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB,	$FB, $FB, $FB, $FB; 0
      .BYTE $FB, $FB, $FB, $FB			  ; $10
TitleStoryText_Line16:.BYTE $FB, $FB, $E9, $EE,	$EC, $E1, $FB, $EC, $ED, $DA, $EB, $ED,	$FB, $DB, $EE, $ED; 0
      .BYTE $ED, $E8, $E7, $FB			  ; $10
TitleAttributeData1A09:.BYTE $23, $CB, $42, $FF, $23, $D1, 1, $CC, $23,	$D2, $44, $FF, $23, $D6, 1, $33; 0
      .BYTE $23, $D9, 1, $CC, $23, $DA,	$44, $FF  ; $10
byte_BANK0_9A21:.BYTE $23

      .BYTE $DE
      .BYTE 1
      .BYTE $33
      .BYTE $23
      .BYTE $E1
      .BYTE 1
      .BYTE $CC
      .BYTE $23
      .BYTE $E2
      .BYTE $44
      .BYTE $FF
      .BYTE $23
      .BYTE $E6
      .BYTE 1
      .BYTE $33
      .BYTE $23
      .BYTE $EA
      .BYTE $44
      .BYTE $FF
      .BYTE $23
      .BYTE $E9
      .BYTE 1
      .BYTE $CC
      .BYTE $23
      .BYTE $EE
      .BYTE 1
      .BYTE $33
; ---------------------------------------------------------------------------
      LDY     #7
      STY     byte_RAM_1
      LDY     #0
      STY     byte_RAM_0
      TYA

loc_BANK0_9A46:
      STA     (byte_RAM_0),Y
      DEY
      BNE     loc_BANK0_9A46

      DEC     byte_RAM_1
      LDX     byte_RAM_1
      CPX     #2
      BCS     loc_BANK0_9A46

loc_BANK0_9A53:
      LDA     #0
      TAY

loc_BANK0_9A56:
      STA     byte_RAM_0,Y
      INY
      BNE     loc_BANK0_9A56

      JSR     sub_BANKF_FE41

      JSR     ClearNametables

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
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x8|PPUControl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      JSR     WaitForNMI_TitleScreen

      LDA     #1
      STA     byte_RAM_11
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
      STA     _RAM_PPUDataBuffer
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
      STA     _RAM_PPUDataBuffer
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
      LDA     TitleAttributeData1A09,Y
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
      LDA     byte_BANK0_9A21,Y
      STA     _RAM_PPUDataBuffer,Y
      INY
      DEX
      BPL     loc_BANK0_9B3B

      LDA     #0
      STA     _RAM_PPUDataBuffer,Y
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
      STA     _RAM_PPUDataBuffer
      LDA     #$AE
      STA     byte_RAM_302
      LDA     #5				  ; Length of STORY text (5 bytes)
      STA     byte_RAM_303
      LDY     #4				  ; Bytes to copy minus	one (5-1=4)

TitleScreen_WriteSTORYTextLoop:
      LDA     TitleStoryText_STORY,Y		  ; Copy STORY text to PPU write buffer
      STA     byte_RAM_304,Y
      DEY
      BPL     TitleScreen_WriteSTORYTextLoop

      LDA     #0				  ; Terminate STORY text in buffer
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
      STA     _RAM_PPUDataBuffer
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
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x8|PPUControl_NMIDisabled ; code used	at 8000
      STA     PPUCtrlMirror
      STA     PPUCTRL
      JMP     loc_BANK0_9A53

; ---------------------------------------------------------------------------
; [000003A8 BYTES: BEGIN OF AREA UNUSED-BANK0-9C58. PRESS KEYPAD "-" TO	COLLAPSE]
_empty_1C58:.BYTE $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF; 0
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
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $140
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $150
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $160
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $170
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $180
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $190
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $1F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $200
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $210
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $220
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $230
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $240
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $250
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $260
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $270
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $280
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $290
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $2F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $300
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $310
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $320
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $330
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $340
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $350
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $360
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $370
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $380
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $390
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3A0
; end of 'BANK0'

; [000003A8 BYTES: END OF AREA UNUSED-BANK0-9C58. PRESS	KEYPAD "-" TO COLLAPSE]
; ===========================================================================

