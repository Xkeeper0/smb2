
      ;.segment	BANKC
;       *	=  $8000
MarioDream_Pointers:.BYTE 1

byte_BANKC_8001:.BYTE 3

      .WORD MarioDream_Bed
      .WORD MarioDream_Bubble
      .WORD MarioDream_DoNothing
      .WORD MarioDream_EraseBubble1
      .WORD MarioDream_EraseBubble2
      .WORD MarioDream_EraseBubble3
      .WORD MarioDream_EraseBubble4
      .WORD MarioDream_EraseBubble5
      .WORD MarioDream_Palettes

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_8014:
      LDA     #0
      BEQ     loc_BANKC_801A

; End of function sub_BANKC_8014

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_8018:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites ; code	used at	8000

loc_BANKC_801A:
      STA     PPUMaskMirror

; End of function sub_BANKC_8018

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_801C:
      LDA     byte_RAM_11
      ASL     A
      TAX
      LDA     MarioDream_Pointers,X
      STA     RAM_PPUDataBufferPointer
      LDA     byte_BANKC_8001,X
      STA     RAM_PPUDataBufferPointer+1
      LDA     #0
      STA     NMIWaitFlag

loc_BANKC_802E:
      LDA     NMIWaitFlag
      BPL     loc_BANKC_802E

      RTS

; End of function sub_BANKC_801C

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_8033:
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIEnabled ; code used	at 8000
      STA     PPUCtrlMirror
      STA     PPUCTRL
      RTS

; End of function sub_BANKC_8033

; ---------------------------------------------------------------------------
      LDA     #PPUCtrl_BaseAddr2000|PPUCtrl_WriteIncrementHorizontal|PPUCtrl_SpritePatternTable0000|PPUCtrl_BackgroundPatternTable1000|PPUCtrl_SpriteSize8x16|PPUControl_NMIDisabled
      STA     PPUCTRL
      STA     PPUCtrlMirror
      RTS

; ---------------------------------------------------------------------------
MarioDream_Palettes:.BYTE $3F ;	?

      .BYTE   0
      .BYTE $20
      .BYTE   2
      .BYTE $22
      .BYTE $12
      .BYTE  $F
      .BYTE   2
      .BYTE $30	; 0
      .BYTE $16
      .BYTE  $F
      .BYTE   2
      .BYTE $30	; 0
      .BYTE $16
      .BYTE $28
      .BYTE   2
      .BYTE $22
      .BYTE $31	; 1
      .BYTE  $F
      .BYTE   2
      .BYTE $27
      .BYTE $16
      .BYTE  $F
      .BYTE   2
      .BYTE $27
      .BYTE $2A
      .BYTE  $F
      .BYTE   2
      .BYTE $27
      .BYTE $25
      .BYTE  $F
      .BYTE   2
      .BYTE $27
      .BYTE $3C
      .BYTE  $F
      .BYTE   0
MarioDream_Bed:.BYTE $20

      .BYTE 0
      .BYTE $60
      .BYTE $FF
      .BYTE $20
      .BYTE $20
      .BYTE $60
      .BYTE $FF
      .BYTE $20
      .BYTE $40
      .BYTE $60
      .BYTE $FF
      .BYTE $20
      .BYTE $60
      .BYTE $60
      .BYTE $FF
      .BYTE $23
      .BYTE $40
      .BYTE $60
      .BYTE $FF
      .BYTE $23
      .BYTE $60
      .BYTE $60
      .BYTE $FF
      .BYTE $23
      .BYTE $80
      .BYTE $60
      .BYTE $FF
      .BYTE $23
      .BYTE $A0
      .BYTE $60
      .BYTE $FF
      .BYTE $20
      .BYTE $80
      .BYTE $D6
      .BYTE $FF
      .BYTE $20
      .BYTE $81
      .BYTE $D6
      .BYTE $FF
      .BYTE $20
      .BYTE $82
      .BYTE $D6
      .BYTE $FF
      .BYTE $20
      .BYTE $83
      .BYTE $D6
      .BYTE $FF
      .BYTE $20
      .BYTE $9C
      .BYTE $D6
      .BYTE $FF
      .BYTE $20
      .BYTE $9D
      .BYTE $D6
      .BYTE $FF
      .BYTE $20
      .BYTE $9E
      .BYTE $D6
      .BYTE $FF
      .BYTE $20
      .BYTE $9F
      .BYTE $D6
      .BYTE $FF
      .BYTE $20
      .BYTE $84
      .BYTE $58
      .BYTE $FC
      .BYTE $20
      .BYTE $A4
      .BYTE $58
      .BYTE $FC
      .BYTE $20
      .BYTE $C4
      .BYTE $58
      .BYTE $FC
      .BYTE $20
      .BYTE $E4
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE 4
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE $24
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE $44
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE $64
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE $84
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE $A4
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE $C4
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE $E4
      .BYTE $58
      .BYTE $FC
      .BYTE $22
      .BYTE 4
      .BYTE $58
      .BYTE $FC
      .BYTE $22
      .BYTE $24
      .BYTE $58
      .BYTE $FC
      .BYTE $22
      .BYTE $44
      .BYTE $58
      .BYTE $FC
      .BYTE $22
      .BYTE $64
      .BYTE $58
      .BYTE $FC
      .BYTE $22
      .BYTE $84
      .BYTE $58
      .BYTE $FC
      .BYTE $22
      .BYTE $A4
      .BYTE $58
      .BYTE $FC
      .BYTE $22
      .BYTE $C4
      .BYTE $58
      .BYTE $FC
      .BYTE $21
      .BYTE $4E
      .BYTE 2
      .BYTE $60
      .BYTE $61
      .BYTE $21
      .BYTE $6E
      .BYTE 2
      .BYTE $70
      .BYTE $71
      .BYTE $21
      .BYTE $8E
      .BYTE 2
      .BYTE $80
      .BYTE $81
      .BYTE $21
      .BYTE $AC
      .BYTE 6
      .BYTE $36
      .BYTE $37
      .BYTE $38
      .BYTE $39
      .BYTE $3A
      .BYTE $3B
      .BYTE $21
      .BYTE $CA
      .BYTE $C
      .BYTE $36
      .BYTE $37
      .BYTE $35
      .BYTE $47
      .BYTE $48
      .BYTE $49
      .BYTE $4A
      .BYTE $4B
      .BYTE $4C
      .BYTE $4D
      .BYTE $4E
      .BYTE $4F
      .BYTE $21
      .BYTE $E8
      .BYTE $E
      .BYTE $36
      .BYTE $37
      .BYTE $35
      .BYTE $55
      .BYTE $56
      .BYTE $57
      .BYTE $58
      .BYTE $59
      .BYTE $5A
      .BYTE $5B
      .BYTE $5C
      .BYTE $5D
      .BYTE $5E
      .BYTE $5F
      .BYTE $22
      .BYTE 6
      .BYTE $10
      .BYTE $36
      .BYTE $37
      .BYTE $35
      .BYTE $FC
      .BYTE $64
      .BYTE $65
      .BYTE $66
      .BYTE $67
      .BYTE $68
      .BYTE $69
      .BYTE $6A
      .BYTE $6B
      .BYTE $6C
      .BYTE $6D
      .BYTE $6E
      .BYTE $6F
      .BYTE $22
      .BYTE $24
      .BYTE $12
      .BYTE $36
      .BYTE $37
      .BYTE $35
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $74
      .BYTE $75
      .BYTE $76
      .BYTE $77
      .BYTE $78
      .BYTE $79
      .BYTE $7A
      .BYTE $7B
      .BYTE $7C
      .BYTE $7D
      .BYTE $7E
      .BYTE $7F
      .BYTE $22
      .BYTE $44
      .BYTE $18
      .BYTE $35
      .BYTE $FC
      .BYTE $FC
      .BYTE $FC
      .BYTE $82
      .BYTE $83
      .BYTE $84
      .BYTE $85
      .BYTE $86
      .BYTE $87
      .BYTE $88
      .BYTE $89
      .BYTE $8A
      .BYTE $8B
      .BYTE $8C
      .BYTE $8D
      .BYTE $8E
      .BYTE $8F
      .BYTE 0
      .BYTE 1
      .BYTE 2
      .BYTE 3
      .BYTE 4
      .BYTE 5
      .BYTE $22
      .BYTE $68
      .BYTE $14
      .BYTE $92
      .BYTE $93
      .BYTE $94
      .BYTE $95
      .BYTE $96
      .BYTE $97
      .BYTE $98
      .BYTE $99
      .BYTE $9A
      .BYTE $9B
      .BYTE $9C
      .BYTE $9D
      .BYTE $9E
      .BYTE $9F
      .BYTE $10
      .BYTE $11
      .BYTE $12
      .BYTE $13
      .BYTE $14
      .BYTE $15
      .BYTE $22
      .BYTE $88
      .BYTE $14
      .BYTE $A2
      .BYTE $A3
      .BYTE $A4
      .BYTE $A5
      .BYTE $A6
      .BYTE $A7
      .BYTE $A8
      .BYTE $A9
      .BYTE $AA
      .BYTE $AB
      .BYTE $AC
      .BYTE $AD
      .BYTE $AE
      .BYTE $AF
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $22
      .BYTE $A7
      .BYTE $15
      .BYTE $B1
      .BYTE $B2
      .BYTE $B3
      .BYTE $B4
      .BYTE $B5
      .BYTE $B6
      .BYTE $B7
      .BYTE $B8
      .BYTE $B9
      .BYTE $BA
      .BYTE $BB
      .BYTE $BC
      .BYTE $BD
      .BYTE $BE
      .BYTE $BF
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $22
      .BYTE $C6
      .BYTE $16
      .BYTE $C0
      .BYTE $C1
      .BYTE $C2
      .BYTE $C3
      .BYTE $C4
      .BYTE $C5
      .BYTE $C6
      .BYTE $C7
      .BYTE $C8
      .BYTE $C9
      .BYTE $CA
      .BYTE $CB
      .BYTE $CC
      .BYTE $CD
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $22
      .BYTE $E4
      .BYTE $18
      .BYTE $B1
      .BYTE $F1
      .BYTE $D0
      .BYTE $D1
      .BYTE $D2
      .BYTE $D3
      .BYTE $D4
      .BYTE $D5
      .BYTE $D6
      .BYTE $D7
      .BYTE $D8
      .BYTE $D9
      .BYTE $DA
      .BYTE $DB
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $23
      .BYTE 4
      .BYTE $18
      .BYTE $F0
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $E2
      .BYTE $E3
      .BYTE $E4
      .BYTE $E5
      .BYTE $E6
      .BYTE $E7
      .BYTE $E8
      .BYTE $E9
      .BYTE $EA
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $23
      .BYTE $24
      .BYTE $18
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $F2
      .BYTE $F3
      .BYTE $F4
      .BYTE $F5
      .BYTE $F6
      .BYTE $F7
      .BYTE $F8
      .BYTE $F9
      .BYTE $FA
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE $FE
      .BYTE 0
MarioDream_Bubble:.BYTE	$20

      .BYTE $8F
      .BYTE $84
      .BYTE 6
      .BYTE $16
      .BYTE 7
      .BYTE $17
      .BYTE $20
      .BYTE $D0
      .BYTE $85
      .BYTE 8
      .BYTE $18
      .BYTE 9
      .BYTE $19
      .BYTE $1D
      .BYTE $20
      .BYTE $90
      .BYTE $4C
      .BYTE $FD
      .BYTE $20
      .BYTE $B0
      .BYTE $4C
      .BYTE $FD
      .BYTE $20
      .BYTE $D1
      .BYTE $4B
      .BYTE $FD
      .BYTE $20
      .BYTE $F1
      .BYTE $B
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $28
      .BYTE $29
      .BYTE $29
      .BYTE $29
      .BYTE $29
      .BYTE $2A
      .BYTE $FD
      .BYTE $FD
      .BYTE $21
      .BYTE $11
      .BYTE $B
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $27
      .BYTE $FD
      .BYTE $FD
      .BYTE $27
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $21
      .BYTE $31
      .BYTE $B
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $27
      .BYTE $FD
      .BYTE $FD
      .BYTE $27
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $21
      .BYTE $51
      .BYTE $B
      .BYTE $FD
      .BYTE $FD
      .BYTE $23
      .BYTE $24
      .BYTE $25
      .BYTE $22
      .BYTE $23
      .BYTE $24
      .BYTE $25
      .BYTE $25
      .BYTE $FD
      .BYTE $21
      .BYTE $71
      .BYTE $B
      .BYTE $B
      .BYTE $C
      .BYTE $D
      .BYTE $E
      .BYTE $F
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $FD
      .BYTE $21
      .BYTE $95
      .BYTE 7
      .BYTE $1F
      .BYTE $1A
      .BYTE $30
      .BYTE $31
      .BYTE $32
      .BYTE $33
      .BYTE $1B
      .BYTE $21
      .BYTE $B5
      .BYTE 6
      .BYTE $53
      .BYTE $FC
      .BYTE $40
      .BYTE $41
      .BYTE $42
      .BYTE $43
      .BYTE $21
      .BYTE $D7
      .BYTE 3
      .BYTE $50
      .BYTE $51
      .BYTE $52
      .BYTE $21
      .BYTE $F6
      .BYTE 2
      .BYTE $20
      .BYTE $21
      .BYTE $23
      .BYTE $CB
      .BYTE 4
      .BYTE $44
      .BYTE $55
      .BYTE $A5
      .BYTE $65
      .BYTE $23
      .BYTE $D4
      .BYTE 3
      .BYTE $55
      .BYTE $5A
      .BYTE $56
      .BYTE $23
      .BYTE $DD
      .BYTE 2
      .BYTE $45
      .BYTE $15
      .BYTE $23
      .BYTE $E4
      .BYTE 1
      .BYTE $3F
      .BYTE 0
MarioDream_DoNothing:.BYTE 0

      .BYTE $23
      .BYTE $CB
      .BYTE $44
      .BYTE   0
      .BYTE $23
      .BYTE $D4
      .BYTE $43
      .BYTE   0
      .BYTE $23
      .BYTE $DD
      .BYTE $42
      .BYTE   0
      .BYTE   0
MarioDream_EraseBubble1:.BYTE $20

      .BYTE $8F
      .BYTE $4D
      .BYTE $FC
      .BYTE $20
      .BYTE $AF
      .BYTE $4D
      .BYTE $FC
      .BYTE 0
MarioDream_EraseBubble2:.BYTE $20

      .BYTE $CF
      .BYTE $4D
      .BYTE $FC
      .BYTE $20
      .BYTE $EF
      .BYTE $4D
      .BYTE $FC
      .BYTE 0
MarioDream_EraseBubble3:.BYTE $21

      .BYTE $10
      .BYTE $4C
      .BYTE $FC
      .BYTE $21
      .BYTE $30
      .BYTE $4C
      .BYTE $FC
      .BYTE 0
MarioDream_EraseBubble4:.BYTE $21

      .BYTE $50
      .BYTE $4C
      .BYTE $FC
      .BYTE $21
      .BYTE $71
      .BYTE $4B
      .BYTE $FC
      .BYTE 0
MarioDream_EraseBubble5:.BYTE $21

      .BYTE $95
      .BYTE $47
      .BYTE $FC
      .BYTE $21
      .BYTE $B5
      .BYTE $46
      .BYTE $FC
      .BYTE $21
      .BYTE $D7
      .BYTE $43
      .BYTE $FC
      .BYTE $21
      .BYTE $F6
      .BYTE $42
      .BYTE $FC
      .BYTE 0
MarioDream_BubbleSprites:.BYTE $28

      .BYTE 0
      .BYTE 0
      .BYTE $A8
      .BYTE $28
      .BYTE 4
      .BYTE 1
      .BYTE $B0
      .BYTE $28
      .BYTE 8
      .BYTE 2
      .BYTE $C0
      .BYTE $28
      .BYTE $C
      .BYTE 3
      .BYTE $B8
byte_BANKC_8308:.BYTE $28

      .BYTE 2
      .BYTE 0
      .BYTE $A8
      .BYTE $28
      .BYTE 6
      .BYTE 1
      .BYTE $B0
byte_BANKC_8310:.BYTE $28
      .BYTE $A
      .BYTE 2
      .BYTE $C0
      .BYTE $28
      .BYTE $E
      .BYTE 3
      .BYTE $B8
MarioDream_SnoringFrameCounts:.BYTE $20

      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $20
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
      .BYTE $A
MarioDream_WakingFrameCounts:.BYTE 8

      .BYTE 8
      .BYTE $50
      .BYTE $40
      .BYTE $30
      .BYTE $10
      .BYTE $10
MarioDream_SnoringFrames:.BYTE $50

      .BYTE $54
      .BYTE $58
      .BYTE $5C
      .BYTE $60
      .BYTE $64
      .BYTE $68
      .BYTE $6C
      .BYTE $68
      .BYTE $64
      .BYTE $60
      .BYTE $5C
      .BYTE $58
      .BYTE $54
MarioDream_WakingFrames:.BYTE $78

      .BYTE $74
      .BYTE $70
      .BYTE $7C
      .BYTE $70
      .BYTE $74
      .BYTE $78
; ---------------------------------------------------------------------------

loc_BANKC_8342:
      JSR     sub_BANKC_8014

      LDA     #0
      JSR     sub_BANKF_FFA0

      JSR     ClearNametables

      LDA     #$40
      STA     StackArea
      JSR     sub_BANKC_8033

      JSR     sub_BANKC_801C

      LDA     #9
      STA     byte_RAM_11
      JSR     sub_BANKC_801C

      LDA     #1
      STA     byte_RAM_11
      JSR     sub_BANKC_801C

      LDA     #2
      STA     byte_RAM_11
      JSR     sub_BANKC_801C

      LDA     #$10
      STA     ObjectXHi+3
      LDA     #4
      STA     PlayerXHi

loc_BANKC_8375:
      LDA     #0
      STA     ObjectXHi
      LDA     #$D
      STA     ObjectXHi+1
      LDA     #0
      STA     ObjectXHi+2
      JSR     sub_BANKC_8493

      JSR     sub_BANKC_8018

loc_BANKC_8387:
      LDY     ObjectXHi
      LDA     MarioDream_SnoringFrames,Y
      STA     BackgroundCHR1
      CLC
      ADC     #2
      STA     BackgroundCHR2
      LDA     MarioDream_SnoringFrameCounts,Y
      STA     byte_RAM_10

loc_BANKC_839A:
      DEC     ObjectXHi+3
      BPL     loc_BANKC_83A7

      LDA     #$10
      STA     ObjectXHi+3
      INC     ObjectXHi+2
      JSR     sub_BANKC_8493

loc_BANKC_83A7:
      JSR     sub_BANKC_801C

      DEC     byte_RAM_10
      BPL     loc_BANKC_839A

      INC     ObjectXHi
      DEC     ObjectXHi+1
      BPL     loc_BANKC_8387

      DEC     PlayerXHi
      BMI     loc_BANKC_83BB

      JMP     loc_BANKC_8375

; ---------------------------------------------------------------------------

loc_BANKC_83BB:
      LDA     #3
      STA     byte_RAM_11
      LDA     #$F8
      STA     SpriteDMAArea
      STA     unk_RAM_204
      STA     unk_RAM_208
      STA     unk_RAM_20C
      JSR     sub_BANKC_801C

      LDA     #4
      STA     byte_RAM_11
      JSR     sub_BANKC_801C

      LDA     #5
      STA     byte_RAM_11
      JSR     sub_BANKC_801C

      LDA     #6
      STA     byte_RAM_11
      JSR     sub_BANKC_801C

      LDA     #7
      STA     byte_RAM_11
      JSR     sub_BANKC_801C

      LDA     #8
      STA     byte_RAM_11
      JSR     sub_BANKC_801C

      LDA     #0
      STA     ObjectXHi
      LDA     #6
      STA     ObjectXHi+1
      LDA     #0
      STA     PlayerXHi
      JSR     sub_BANKC_8018

loc_BANKC_8402:
      LDY     ObjectXHi
      LDA     MarioDream_WakingFrames,Y
      STA     BackgroundCHR1
      CLC
      ADC     #2
      STA     BackgroundCHR2
      LDA     MarioDream_WakingFrameCounts,Y
      STA     byte_RAM_10

loc_BANKC_8415:
      JSR     sub_BANKC_801C

      DEC     byte_RAM_10
      BPL     loc_BANKC_8415

      INC     ObjectXHi
      DEC     ObjectXHi+1
      BPL     loc_BANKC_8402

      LDA     #$10
      STA     ObjectXHi+3
      LDA     #1
      STA     PlayerXHi

loc_BANKC_842A:
      LDA     #0
      STA     ObjectXHi
      LDA     #$D
      STA     ObjectXHi+1
      JSR     sub_BANKC_8018

loc_BANKC_8435:
      LDY     ObjectXHi
      LDA     MarioDream_SnoringFrames,Y
      STA     BackgroundCHR1
      CLC
      ADC     #2

loc_BANKC_8440:
      STA     BackgroundCHR2
      LDA     MarioDream_SnoringFrameCounts,Y
      STA     byte_RAM_10

loc_BANKC_8448:
      JSR     sub_BANKC_801C

      DEC     byte_RAM_10
      BPL     loc_BANKC_8448

      INC     ObjectXHi

loc_BANKC_8451:
      DEC     ObjectXHi+1
      BPL     loc_BANKC_8435

      DEC     PlayerXHi
      BMI     loc_BANKC_845C

      JMP     loc_BANKC_842A

; ---------------------------------------------------------------------------

loc_BANKC_845C:
      JSR     sub_BANKC_84FB

      JSR     sub_BANKC_801C

loc_BANKC_8462:
      LDA     #0
      STA     ObjectXHi
      LDA     #$D
      STA     ObjectXHi+1
      JSR     sub_BANKC_8018

loc_BANKC_846D:
      LDY     ObjectXHi
      LDA     MarioDream_SnoringFrames,Y
      STA     BackgroundCHR1
      CLC
      ADC     #2
      STA     BackgroundCHR2
      LDA     MarioDream_SnoringFrameCounts,Y
      STA     byte_RAM_10

loc_BANKC_8480:
      JSR     loc_BANKC_84B2

      JSR     sub_BANKC_801C

      DEC     byte_RAM_10
      BPL     loc_BANKC_8480

      INC     ObjectXHi
      DEC     ObjectXHi+1
      BPL     loc_BANKC_846D

      JMP     loc_BANKC_8462

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_8493:
      LDY     #$F
      LDA     ObjectXHi+2
      AND     #1
      BNE     loc_BANKC_84A5

loc_BANKC_849B:
      LDA     MarioDream_BubbleSprites,Y
      STA     SpriteDMAArea,Y
      DEY
      BPL     loc_BANKC_849B

      RTS

; ---------------------------------------------------------------------------

loc_BANKC_84A5:
      LDA     byte_BANKC_8308,Y
      STA     SpriteDMAArea,Y
      DEY
      BPL     loc_BANKC_84A5

      RTS

; End of function sub_BANKC_8493

; ---------------------------------------------------------------------------
CastRoll_PaletteFadeIn:.BYTE $22

      .BYTE $32
      .BYTE $30
; ---------------------------------------------------------------------------

loc_BANKC_84B2:
      INC     ObjectXLo+5
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_84C0

      DEC     ObjectYLo+6
      DEC     ObjectYLo+7
      DEC     ObjectYLo+8

loc_BANKC_84C0:
      LDA     ObjectXLo
      JSR     JumpToTableAfterJump

; ---------------------------------------------------------------------------
      .WORD loc_BANKC_8593
      .WORD loc_BANKC_85D6
      .WORD loc_BANKC_85E7
      .WORD loc_BANKC_861C
      .WORD loc_BANKC_8898
      .WORD loc_BANKC_88D7
      .WORD loc_BANKC_89B6
      .WORD loc_BANKC_8A04
      .WORD loc_BANKC_8A37
      .WORD loc_BANKC_8A52
      .WORD loc_BANKC_8A82
; ---------------------------------------------------------------------------
      RTS

; ---------------------------------------------------------------------------
CastRoll_CASTText:.BYTE	$60 ; `

      .BYTE $D4
      .BYTE   0
      .BYTE $28
      .BYTE $60
      .BYTE $D0
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $60
      .BYTE $F4
      .BYTE   0
      .BYTE $48
      .BYTE $60
      .BYTE $F6
      .BYTE   0
      .BYTE $58
; =============== S U B	R O U T	I N E =======================================

sub_BANKC_84EC:
      LDY     ObjectXLo+2
      LDA     CastRoll_SpritePointersLo,Y
      STA     ObjectXLo+6
      LDA     CastRoll_SpritePointersHi,Y
      STA     ObjectXLo+7
      INC     ObjectXLo+2
      RTS

; End of function sub_BANKC_84EC

; =============== S U B	R O U T	I N E =======================================

sub_BANKC_84FB:
      LDY     #$4C
      STY     SpriteCHR1

loc_BANKC_8500:
      INY
      STY     SpriteCHR2
      INY
      STY     SpriteCHR3
      INY
      STY     SpriteCHR4
      LDX     #7
      LDA     #$20
      STA     PlayerYHi
      LDY     #0

loc_BANKC_8514:
      LDA     #$F
      STA     SpriteDMAArea,Y
      INY
      LDA     #$3E
      STA     SpriteDMAArea,Y
      INY
      LDA     #0
      STA     SpriteDMAArea,Y
      INY
      LDA     PlayerYHi
      STA     SpriteDMAArea,Y
      INY
      CLC
      ADC     #8
      STA     PlayerYHi
      DEX
      BPL     loc_BANKC_8514

      LDX     #7
      LDA     #$20
      STA     PlayerYHi

loc_BANKC_853A:
      LDA     #$D0
      STA     SpriteDMAArea,Y
      INY
      LDA     #$3E
      STA     SpriteDMAArea,Y
      INY
      LDA     #0
      STA     SpriteDMAArea,Y
      INY
      LDA     PlayerYHi
      STA     SpriteDMAArea,Y
      INY
      CLC
      ADC     #8
      STA     PlayerYHi
      DEX
      BPL     loc_BANKC_853A

      LDX     #$F

loc_BANKC_855C:
      LDA     CastRoll_CASTText,X
      STA     unk_RAM_240,X
      DEX
      BPL     loc_BANKC_855C

      LDA     #$3F
      STA     _RAM_PPUDataBuffer
      LDA     #$11
      STA     byte_RAM_302
      LDA     #1
      STA     byte_RAM_303
      LDA     #$12
      STA     byte_RAM_304
      LDA     #0
      STA     byte_RAM_305
      LDA     #$10
      STA     PlayerXLo
      LDA     #0
      STA     ObjectXLo
      STA     ObjectXLo+1
      LDY     #$40

loc_BANKC_858A:
      LDA     #$27
      STA     PlayerState,Y
      DEY
      BPL     loc_BANKC_858A

      RTS

; End of function sub_BANKC_84FB

; ---------------------------------------------------------------------------

loc_BANKC_8593:
      DEC     PlayerXLo
      BPL     locret_BANKC_85D5

      LDA     #$10
      STA     PlayerXLo
      LDA     #$3F
      STA     _RAM_PPUDataBuffer
      LDA     #$11
      STA     byte_RAM_302
      LDA     #1
      STA     byte_RAM_303
      LDY     ObjectXLo+1
      LDA     CastRoll_PaletteFadeIn,Y
      STA     byte_RAM_304

loc_BANKC_85B2:
      LDA     #0
      STA     byte_RAM_305
      INC     ObjectXLo+1
      LDA     ObjectXLo+1
      CMP     #3
      BNE     locret_BANKC_85D5

      INC     ObjectXLo
      LDA     #$80
      STA     PlayerXLo
      LDA     #$60
      STA     ObjectYHi
      LDA     #1
      STA     ObjectYLo+2
      STA     ObjectYLo+5
      LDA     #0
      STA     ObjectYLo+3
      STA     ObjectYLo+4

locret_BANKC_85D5:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_85D6:
      DEC     PlayerXLo
      BPL     locret_BANKC_85E6

      INC     ObjectXLo
      LDA     #0
      STA     ObjectXLo+2
      STA     ObjectXAccel+2
      LDA     #1
      STA     ObjectYLo+7

locret_BANKC_85E6:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_85E7:
      LDA     ObjectXLo+5
      AND     #1
      BEQ     loc_BANKC_861C

      LDA     ObjectYHi
      SEC
      SBC     #1
      STA     ObjectYHi
      STA     unk_RAM_240
      STA     unk_RAM_244
      STA     unk_RAM_248
      STA     unk_RAM_24C
      LDA     ObjectYHi
      CMP     #$10
      BNE     loc_BANKC_861C

      LDA     #$F8
      STA     unk_RAM_240
      STA     unk_RAM_244
      STA     unk_RAM_248
      STA     unk_RAM_24A
      INC     ObjectXLo
      LDA     #0
      STA     ObjectYLo+5
      STA     ObjectYLo+2

loc_BANKC_861C:
      LDA     ObjectYLo+2
      BNE     loc_BANKC_8641

      LDA     ObjectYLo+6
      BNE     loc_BANKC_8641

      JSR     sub_BANKC_84EC

      LDY     #$3F

loc_BANKC_8629:
      LDA     (ObjectXLo+6),Y
      STA     unk_RAM_240,Y
      DEY
      BPL     loc_BANKC_8629

      LDA     #1
      STA     ObjectYLo+2
      LDA     #$D0
      STA     ObjectYHi
      LDA     #$E0
      STA     ObjectYHi+1
      LDA     #$F8
      STA     ObjectYHi+2

loc_BANKC_8641:
      LDA     ObjectYLo+3
      BNE     loc_BANKC_8666

      LDA     ObjectYLo+7
      BNE     loc_BANKC_8666

      JSR     sub_BANKC_84EC

      LDY     #$3F

loc_BANKC_864E:
      LDA     (ObjectXLo+6),Y
      STA     unk_RAM_280,Y
      DEY
      BPL     loc_BANKC_864E

      LDA     #1
      STA     ObjectYLo+3
      LDA     #$D0
      STA     ObjectYHi+3
      LDA     #$E0
      STA     ObjectYHi+4
      LDA     #$F8
      STA     ObjectYHi+5

loc_BANKC_8666:
      LDA     ObjectYLo+4
      BNE     loc_BANKC_8693

      LDA     ObjectYLo+8
      BNE     loc_BANKC_8693

      JSR     sub_BANKC_84EC

      LDY     #$3F

loc_BANKC_8673:
      LDA     (ObjectXLo+6),Y
      STA     unk_RAM_2C0,Y
      DEY
      BPL     loc_BANKC_8673

      LDA     #1
      STA     ObjectYLo+4
      LDA     #$D0
      STA     ObjectYHi+6
      LDA     #$E0
      STA     ObjectYHi+7
      LDY     #$F8
      LDA     ObjectXLo+2
      CMP     #$1D
      BNE     loc_BANKC_8691

      LDY     #$F0

loc_BANKC_8691:
      STY     ObjectYHi+8

loc_BANKC_8693:
      LDA     ObjectYLo+5
      BEQ     loc_BANKC_869A

      JMP     loc_BANKC_873A

; ---------------------------------------------------------------------------

loc_BANKC_869A:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_86A3

      JMP     loc_BANKC_873A

; ---------------------------------------------------------------------------

loc_BANKC_86A3:
      LDA     unk_RAM_240
      CMP     #$F8
      BEQ     loc_BANKC_86C3

      LDA     ObjectYHi
      SEC
      SBC     #1
      CMP     #$10
      BNE     loc_BANKC_86B5

      LDA     #$F8

loc_BANKC_86B5:
      STA     ObjectYHi
      STA     unk_RAM_240
      STA     unk_RAM_244
      STA     unk_RAM_248
      STA     unk_RAM_24C

loc_BANKC_86C3:
      LDA     unk_RAM_250
      CMP     #$F8
      BEQ     loc_BANKC_86F2

      DEC     ObjectYHi+1
      CMP     #$F9
      BNE     loc_BANKC_86D6

      LDA     ObjectYHi+1
      CMP     #$D0
      BNE     loc_BANKC_86F2

loc_BANKC_86D6:
      LDA     ObjectYHi+1
      CMP     #$10
      BNE     loc_BANKC_86E6

      LDA     ObjectXLo+2
      CMP     #$FF
      BNE     loc_BANKC_86E4

      INC     ObjectXLo

loc_BANKC_86E4:
      LDA     #$F8

loc_BANKC_86E6:
      STA     unk_RAM_250
      STA     unk_RAM_254
      STA     unk_RAM_258
      STA     unk_RAM_25C

loc_BANKC_86F2:
      LDA     unk_RAM_260
      CMP     #$F8
      BEQ     loc_BANKC_873A

      DEC     ObjectYHi+2
      CMP     #$F9
      BNE     loc_BANKC_870C

      LDA     ObjectYHi+2
      CMP     #$D0
      BNE     loc_BANKC_873A

      LDY     ObjectXLo+2
      LDA     PlayerState,Y
      STA     ObjectYLo+7

loc_BANKC_870C:
      LDA     ObjectYHi+2
      CMP     #$10
      BNE     loc_BANKC_8722

      LDA     #0
      STA     ObjectYLo+2
      LDA     ObjectXLo+2
      CMP     #$FF
      BNE     loc_BANKC_8720

      LDA     #$FF
      STA     ObjectYLo+2

loc_BANKC_8720:
      LDA     #$F8

loc_BANKC_8722:
      STA     unk_RAM_260
      STA     unk_RAM_264
      STA     unk_RAM_268
      STA     unk_RAM_26C
      STA     unk_RAM_270
      STA     unk_RAM_274
      STA     unk_RAM_278
      STA     unk_RAM_27C

loc_BANKC_873A:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_8743

      JMP     loc_BANKC_87D2

; ---------------------------------------------------------------------------

loc_BANKC_8743:
      LDA     unk_RAM_280
      CMP     #$F8
      BEQ     loc_BANKC_8763

      LDA     ObjectYHi+3
      SEC
      SBC     #1
      CMP     #$10
      BNE     loc_BANKC_8755

      LDA     #$F8

loc_BANKC_8755:
      STA     ObjectYHi+3
      STA     unk_RAM_280
      STA     unk_RAM_284
      STA     unk_RAM_288
      STA     unk_RAM_28C

loc_BANKC_8763:
      LDA     unk_RAM_290
      CMP     #$F8
      BEQ     loc_BANKC_878A

      DEC     ObjectYHi+4
      CMP     #$F9
      BNE     loc_BANKC_8776

      LDA     ObjectYHi+4
      CMP     #$D0
      BNE     loc_BANKC_878A

loc_BANKC_8776:
      LDA     ObjectYHi+4
      CMP     #$10
      BNE     loc_BANKC_877E

      LDA     #$F8

loc_BANKC_877E:
      STA     unk_RAM_290
      STA     unk_RAM_294
      STA     unk_RAM_298
      STA     unk_RAM_29C

loc_BANKC_878A:
      LDA     unk_RAM_2A0
      CMP     #$F8
      BEQ     loc_BANKC_87D2

      DEC     ObjectYHi+5
      CMP     #$F9
      BNE     loc_BANKC_87A4

      LDA     ObjectYHi+5
      CMP     #$D0
      BNE     loc_BANKC_87D2

      LDY     ObjectXLo+2
      LDA     PlayerState,Y
      STA     ObjectYLo+8

loc_BANKC_87A4:
      LDA     ObjectYHi+5
      CMP     #$10
      BNE     loc_BANKC_87BA

      LDA     #0
      STA     ObjectYLo+3
      LDA     ObjectXLo+2
      CMP     #$FF
      BNE     loc_BANKC_87B8

      LDA     #$FF
      STA     ObjectYLo+3

loc_BANKC_87B8:
      LDA     #$F8

loc_BANKC_87BA:
      STA     unk_RAM_2A0
      STA     unk_RAM_2A4
      STA     unk_RAM_2A8
      STA     unk_RAM_2AC
      STA     unk_RAM_2B0
      STA     unk_RAM_2B4
      STA     unk_RAM_2B8
      STA     unk_RAM_2BC

loc_BANKC_87D2:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_87DB

      JMP     locret_BANKC_8897

; ---------------------------------------------------------------------------

loc_BANKC_87DB:
      LDA     unk_RAM_2C0
      CMP     #$F8
      BEQ     loc_BANKC_87FB

      LDA     ObjectYHi+6
      SEC
      SBC     #1
      CMP     #$10
      BNE     loc_BANKC_87ED

      LDA     #$F8

loc_BANKC_87ED:
      STA     ObjectYHi+6
      STA     unk_RAM_2C0
      STA     unk_RAM_2C4
      STA     unk_RAM_2C8
      STA     unk_RAM_2CC

loc_BANKC_87FB:
      LDA     unk_RAM_2D0
      CMP     #$F8
      BEQ     loc_BANKC_8822

      DEC     ObjectYHi+7
      CMP     #$F9
      BNE     loc_BANKC_880E

      LDA     ObjectYHi+7
      CMP     #$D0
      BNE     loc_BANKC_8822

loc_BANKC_880E:
      LDA     ObjectYHi+7
      CMP     #$10
      BNE     loc_BANKC_8816

      LDA     #$F8

loc_BANKC_8816:
      STA     unk_RAM_2D0
      STA     unk_RAM_2D4
      STA     unk_RAM_2D8
      STA     unk_RAM_2DC

loc_BANKC_8822:
      LDA     unk_RAM_2E0
      CMP     #$F8
      BEQ     locret_BANKC_8897

      DEC     ObjectYHi+8
      CMP     #$F9
      BNE     loc_BANKC_883C

      LDA     ObjectYHi+8
      CMP     #$D0
      BNE     locret_BANKC_8897

      LDY     ObjectXLo+2
      LDA     PlayerState,Y
      STA     ObjectYLo+6

loc_BANKC_883C:
      LDA     ObjectXLo+2
      CMP     #$1D
      BNE     loc_BANKC_884C

      LDA     ObjectYHi+8
      CMP     #$B8
      BNE     loc_BANKC_884C

      LDA     #1
      STA     ObjectXAccel+2

loc_BANKC_884C:
      LDA     ObjectYHi+8
      CMP     #$10
      BNE     loc_BANKC_8862

      LDA     #0
      STA     ObjectYLo+4
      LDA     ObjectXLo+2
      CMP     #$FF
      BNE     loc_BANKC_8860

      LDA     #$FF
      STA     ObjectYLo+4

loc_BANKC_8860:
      LDA     #$F8

loc_BANKC_8862:
      STA     unk_RAM_2E0
      STA     unk_RAM_2E4
      STA     unk_RAM_2E8
      STA     unk_RAM_2EC
      STA     unk_RAM_2F0
      STA     unk_RAM_2F4
      STA     unk_RAM_2F8
      STA     unk_RAM_2FC
      LDA     ObjectXAccel+2
      BEQ     locret_BANKC_8897

      LDY     #$1F

loc_BANKC_8880:
      LDA     CastRoll_TriclydeText,Y
      STA     unk_RAM_240,Y
      DEY
      BPL     loc_BANKC_8880

      LDA     #$D0
      STA     ObjectYHi
      STA     ObjectYHi+1
      LDA     #0
      STA     ObjectXAccel+2

loc_BANKC_8893:
      LDA     #$FF
      STA     ObjectXLo+2

locret_BANKC_8897:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8898:
      LDY     #$48
      STY     SpriteCHR1
      INY
      STY     SpriteCHR2
      INY
      STY     SpriteCHR3
      INY
      STY     SpriteCHR4
      LDY     #$5B

loc_BANKC_88AB:
      LDA     CastRoll_Wart,Y
      STA     unk_RAM_240,Y
      DEY
      BPL     loc_BANKC_88AB

      INC     ObjectXLo
      LDY     #0
      LDX     #$F
      LDA     #$C0

loc_BANKC_88BC:
      STA     unk_RAM_201,Y
      INY
      INY
      INY
      INY
      DEX
      BPL     loc_BANKC_88BC

      LDA     #$D0
      STA     ObjectYHi
      LDA     #$E0
      STA     ObjectYHi+1
      LDA     #$F0
      STA     ObjectYHi+2
      LDA     #8
      STA     ObjectYHi+3
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_88D7:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_88E0

      JMP     loc_BANKC_898D

; ---------------------------------------------------------------------------

loc_BANKC_88E0:
      LDA     unk_RAM_240
      CMP     #$F8
      BEQ     loc_BANKC_8906

      LDA     ObjectYHi
      SEC
      SBC     #1
      CMP     #$50
      BNE     loc_BANKC_88F5

      INC     ObjectXLo
      JMP     loc_BANKC_898D

; ---------------------------------------------------------------------------

loc_BANKC_88F5:
      STA     ObjectYHi
      STA     unk_RAM_240
      STA     unk_RAM_244
      STA     unk_RAM_248
      STA     unk_RAM_24C
      STA     unk_RAM_250

loc_BANKC_8906:
      LDA     unk_RAM_254
      CMP     #$F8
      BEQ     loc_BANKC_8930

      DEC     ObjectYHi+1
      CMP     #$F9
      BNE     loc_BANKC_8919

      LDA     ObjectYHi+1
      CMP     #$D0
      BNE     loc_BANKC_8930

loc_BANKC_8919:
      LDA     ObjectYHi+1
      CMP     #$10
      BNE     loc_BANKC_8921

      LDA     #$F8

loc_BANKC_8921:
      STA     unk_RAM_254
      STA     unk_RAM_258
      STA     unk_RAM_25C
      STA     unk_RAM_260
      STA     unk_RAM_264

loc_BANKC_8930:
      LDA     unk_RAM_268
      CMP     #$F8
      BEQ     loc_BANKC_895A

      DEC     ObjectYHi+2
      CMP     #$F9
      BNE     loc_BANKC_8943

      LDA     ObjectYHi+2
      CMP     #$D0
      BNE     loc_BANKC_895A

loc_BANKC_8943:
      LDA     ObjectYHi+2
      CMP     #$10
      BNE     loc_BANKC_894B

      LDA     #$F8

loc_BANKC_894B:
      STA     unk_RAM_268
      STA     unk_RAM_26C
      STA     unk_RAM_270
      STA     unk_RAM_274
      STA     unk_RAM_278

loc_BANKC_895A:
      LDA     unk_RAM_27C
      CMP     #$F8
      BEQ     loc_BANKC_898D

      DEC     ObjectYHi+3
      CMP     #$F9
      BNE     loc_BANKC_896D

      LDA     ObjectYHi+3
      CMP     #$D0
      BNE     loc_BANKC_898D

loc_BANKC_896D:
      LDA     ObjectYHi+3
      CMP     #$10
      BNE     loc_BANKC_8975

      LDA     #$F8

loc_BANKC_8975:
      STA     unk_RAM_27C
      STA     unk_RAM_280
      STA     unk_RAM_284
      STA     unk_RAM_288
      STA     unk_RAM_28C
      STA     unk_RAM_290
      STA     unk_RAM_294
      STA     unk_RAM_298

loc_BANKC_898D:
      LDA     #0
      STA     ObjectXAccel
      STA     PlayerXAccel
      LDA     #$C
      STA     ObjectXAccel+1
      RTS

; ---------------------------------------------------------------------------
byte_BANKC_8998:.BYTE $9E

      .BYTE $A0
      .BYTE $A2
      .BYTE $A4
      .BYTE $88
      .BYTE $A6
      .BYTE $A8
      .BYTE $AA
      .BYTE $AC
      .BYTE $92
      .BYTE $94
      .BYTE $96
      .BYTE $98
      .BYTE $9A
      .BYTE $9C
byte_BANKC_89A7:.BYTE $AE

      .BYTE $B0
byte_BANKC_89A9:.BYTE $B2
      .BYTE $B4
      .BYTE $BE
      .BYTE $B6
      .BYTE $B8
      .BYTE $BA
      .BYTE $BC
      .BYTE $92
      .BYTE $94
      .BYTE $96
      .BYTE $98
      .BYTE $9A
      .BYTE $9C
; ---------------------------------------------------------------------------

loc_BANKC_89B6:
      DEC     PlayerXAccel
      BPL     locret_BANKC_8A00

      LDA     #8
      STA     PlayerXAccel
      DEC     ObjectXAccel+1
      BPL     loc_BANKC_89CD

      INC     ObjectXLo
      LDA     #0
      STA     PlayerXLo
      STA     ObjectXLo+1
      JMP     locret_BANKC_8A00

; ---------------------------------------------------------------------------

loc_BANKC_89CD:
      LDA     ObjectXAccel
      AND     #1
      BNE     loc_BANKC_89EB

      LDY     #0
      LDX     #0

loc_BANKC_89D7:
      INC     ObjectXAccel
      LDA     byte_BANKC_8998,X
      STA     unk_RAM_241,Y
      INY
      INY
      INY
      INY
      INX
      CPX     #$F
      BNE     loc_BANKC_89D7

      JMP     locret_BANKC_8A00

; ---------------------------------------------------------------------------

loc_BANKC_89EB:
      INC     ObjectXAccel
      LDX     #0
      LDY     #0

loc_BANKC_89F1:
      LDA     byte_BANKC_89A7,X
      STA     unk_RAM_241,Y
      INY
      INY
      INY
      INY
      INX
      CPX     #$F
      BNE     loc_BANKC_89F1

locret_BANKC_8A00:
      RTS

; ---------------------------------------------------------------------------
CastRoll_PaletteFadeOut:.BYTE $32

      .BYTE $22
      .BYTE $12
; ---------------------------------------------------------------------------

loc_BANKC_8A04:
      DEC     PlayerXLo
      BPL     locret_BANKC_8A36

      LDA     #$10
      STA     PlayerXLo
      LDA     #$3F
      STA     _RAM_PPUDataBuffer
      LDA     #$11
      STA     byte_RAM_302
      LDA     #1
      STA     byte_RAM_303
      LDY     ObjectXLo+1
      LDA     CastRoll_PaletteFadeOut,Y
      STA     byte_RAM_304
      LDA     #0
      STA     byte_RAM_305
      INC     ObjectXLo+1
      LDA     ObjectXLo+1
      CMP     #3
      BNE     locret_BANKC_8A36

      INC     ObjectXLo
      LDA     #$16
      STA     PlayerXLo

locret_BANKC_8A36:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8A37:
      DEC     PlayerXLo
      BPL     locret_BANKC_8A51

      LDX     #$16
      LDY     #0
      LDA     #$F8

loc_BANKC_8A41:
      STA     unk_RAM_240,Y
      INY
      INY
      INY
      INY
      DEX
      BPL     loc_BANKC_8A41

      LDA     #$30
      STA     PlayerXLo

loc_BANKC_8A4F:
      INC     ObjectXLo

locret_BANKC_8A51:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8A52:
      DEC     PlayerXLo
      BPL     locret_BANKC_8A81

      LDA     #0
      STA     ObjectXHi+4
      STA     ObjectXHi+5

loc_BANKC_8A5C:
      STA     ObjectXHi+6
      LDA     #5
      STA     ObjectXHi+7
      LDA     #$14
      STA     ObjectXHi+8
      LDA     #$3F
      STA     _RAM_PPUDataBuffer
      LDA     #$11
      STA     byte_RAM_302
      LDA     #1
      STA     byte_RAM_303
      LDA     #$30
      STA     byte_RAM_304
      LDA     #0
      STA     byte_RAM_305
      INC     ObjectXLo

locret_BANKC_8A81:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8A82:
      LDA     ObjectXHi+5
      AND     #$80
      BNE     locret_BANKC_8ACC

      LDA     ObjectXHi+5
      BNE     loc_BANKC_8ACD

      DEC     ObjectXHi+7
      BPL     locret_BANKC_8ACC

      LDA     #5
      STA     ObjectXHi+7
      LDA     #3
      STA     ObjectXHi+6
      LDX     #0
      LDY     ObjectXHi+4

loc_BANKC_8A9C:
      LDA     #$40
      STA     SpriteDMAArea,X
      INX
      LDA     byte_BANKC_92FE,Y
      STA     SpriteDMAArea,X
      INY
      INX
      LDA     #0
      STA     SpriteDMAArea,X
      INX
      LDA     byte_BANKC_92FE,Y
      STA     SpriteDMAArea,X
      INY
      INX
      DEC     ObjectXHi+6
      BPL     loc_BANKC_8A9C

      STY     ObjectXHi+4
      DEC     ObjectXHi+8
      BPL     locret_BANKC_8ACC

      INC     ObjectXHi+5
      LDA     #$12
      STA     ObjectXHi+8
      LDA     #0
      STA     ObjectXHi+4

locret_BANKC_8ACC:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_8ACD:
      DEC     ObjectXHi+7
      BPL     locret_BANKC_8B07

      LDA     #5
      STA     ObjectXHi+7
      LDA     #3
      STA     ObjectXHi+6
      LDX     #0
      LDY     ObjectXHi+4

loc_BANKC_8ADD:
      LDA     #$40
      STA     unk_RAM_210,X
      INX
      LDA     byte_BANKC_93A6,Y
      STA     unk_RAM_210,X
      INY
      INX
      LDA     #0
      STA     unk_RAM_210,X
      INX
      LDA     byte_BANKC_93A6,Y
      STA     unk_RAM_210,X
      INY
      INX
      DEC     ObjectXHi+6
      BPL     loc_BANKC_8ADD

      STY     ObjectXHi+4
      DEC     ObjectXHi+8
      BPL     locret_BANKC_8B07

      LDA     #$FF
      STA     ObjectXHi+5

locret_BANKC_8B07:
      RTS

; ---------------------------------------------------------------------------
CastRoll_SpritePointersHi:.BYTE	>CastRoll_Mario ;	DATA XREF: sub_BANKC_84EC+7r

      .BYTE >CastRoll_Luigi
      .BYTE >CastRoll_Princess
      .BYTE >CastRoll_Toad
      .BYTE >CastRoll_Shyguy
      .BYTE >CastRoll_Snifit
      .BYTE >CastRoll_Ninji
      .BYTE >CastRoll_Beezo
      .BYTE >CastRoll_Porcupo
      .BYTE >CastRoll_Tweeter
      .BYTE >CastRoll_BobOmb
      .BYTE >CastRoll_Hoopstar
      .BYTE >CastRoll_Trouter
      .BYTE >CastRoll_Pidgit
      .BYTE >CastRoll_Panser
      .BYTE >CastRoll_Flurry
      .BYTE >CastRoll_Albatoss
      .BYTE >CastRoll_Phanto
      .BYTE >CastRoll_Spark
      .BYTE >CastRoll_Subcon
      .BYTE >CastRoll_Pokey
      .BYTE >CastRoll_Birdo
      .BYTE >CastRoll_Ostro
      .BYTE >CastRoll_Autobomb
      .BYTE >CastRoll_Cobrat
      .BYTE >CastRoll_Mouser
      .BYTE >CastRoll_Fryguy
      .BYTE >CastRoll_Clawglip
      .BYTE >CastRoll_Triclyde
CastRoll_SpritePointersLo:.BYTE	<CastRoll_Mario

      .BYTE <CastRoll_Luigi
      .BYTE <CastRoll_Princess
      .BYTE <CastRoll_Toad
      .BYTE <CastRoll_Shyguy
      .BYTE <CastRoll_Snifit
      .BYTE <CastRoll_Ninji
      .BYTE <CastRoll_Beezo
      .BYTE <CastRoll_Porcupo
      .BYTE <CastRoll_Tweeter
      .BYTE <CastRoll_BobOmb
      .BYTE <CastRoll_Hoopstar
      .BYTE <CastRoll_Trouter
      .BYTE <CastRoll_Pidgit
      .BYTE <CastRoll_Panser
      .BYTE <CastRoll_Flurry
      .BYTE <CastRoll_Albatoss
      .BYTE <CastRoll_Phanto
      .BYTE <CastRoll_Spark
      .BYTE <CastRoll_Subcon
      .BYTE <CastRoll_Pokey
      .BYTE <CastRoll_Birdo
      .BYTE <CastRoll_Ostro
      .BYTE <CastRoll_Autobomb
      .BYTE <CastRoll_Cobrat
      .BYTE <CastRoll_Mouser
      .BYTE <CastRoll_Fryguy
      .BYTE <CastRoll_Clawglip
      .BYTE <CastRoll_Triclyde
CastRoll_Mario:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE   0
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE   2
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE   4
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE   6
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $E8
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Luigi:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE   8
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE  $A
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE  $C
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE  $E
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $E6
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $DC
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Princess:.BYTE	$D0 ; Ð

      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $10
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $12
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $14
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $16
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $EA
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $D4
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $58
CastRoll_Toad:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $18
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $1A
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $1C
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $1E
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $D6
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Shyguy:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $20
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $22
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $DE
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $CC
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $DC
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $CC
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Snifit:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $24
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $26
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $EA
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $DA
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Ninji:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $28
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $2A
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $EA
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $EA
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $E2
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Beezo:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $2C
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $2E
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $CE
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Porcupo:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $30	; 0
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $32	; 2
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $D4
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Tweeter:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $34	; 4
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $36	; 6
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $FC
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_BobOmb:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $38	; 8
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $3A
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $E8
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Hoopstar:.BYTE	$D0 ; Ð

      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $3C
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $3C
      .BYTE $40
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $DE
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $58
CastRoll_Trouter:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $40
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $42
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Pidgit:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $44
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $46
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $D6
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $DC
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Panser:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $48
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $4A
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $EA
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Flurry:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $4C
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $4E
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $DA
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $E6
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $CC
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Albatoss:.BYTE	$D0 ; Ð

      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $50
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $52
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $54
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $56
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $E6
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $58
CastRoll_Phanto:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $68
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $68
      .BYTE $40
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $DE
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $EA
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Spark:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $6A
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $6A
      .BYTE $40
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $E4
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Subcon:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $6C
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $6E
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $D4
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $EA
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Pokey:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $60
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $62
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $64
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $66
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $E4
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $CC
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Birdo:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $70
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $72
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $74
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $76
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $D6
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Ostro:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $78
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $7A
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $7C
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $7E
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $5C
CastRoll_Autobomb:.BYTE	$D0 ; Ð

      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $80
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $82
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $84
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $86
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $E8
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $58
CastRoll_Cobrat:.BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $58
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $5A
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $5C
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $5E
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $D4
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $D2
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Mouser:.BYTE $D0
      .BYTE $88
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $8A
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $8C
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $8E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $90
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $92
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $1C
      .BYTE $F9
      .BYTE $E8
      .BYTE   0
      .BYTE $24
      .BYTE $F9
      .BYTE $EC
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $F4
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $D8
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $4C
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $54
CastRoll_Fryguy:.BYTE $D0
      .BYTE $AA
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $AC
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $AE
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $B0
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $B2
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $B4
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $B6
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $B8
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $DA
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $CC
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $DC
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $F8
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $CC
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
CastRoll_Clawglip:.BYTE	$D0 ; Ð

      .BYTE $BA
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $BC
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $BE
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $C0
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $C2
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $C4
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $C6
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $C8
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $D4
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $E6
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $FC
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $DC
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $E6
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $E0
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $EE
      .BYTE   0
      .BYTE $58
CastRoll_Triclyde:.BYTE	$D0 ; Ð

      .BYTE $94
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $96
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $98
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $9A
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $9C
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $9E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $A0
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $A2
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $A4
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $A6
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $A8
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $58
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $60
      .BYTE $F9
      .BYTE $3E
      .BYTE   0
      .BYTE $68
CastRoll_TriclydeText:.BYTE $D0
      .BYTE $F6
      .BYTE   0
      .BYTE $20
      .BYTE $D0
      .BYTE $F2
      .BYTE   0
      .BYTE $28
      .BYTE $D0
      .BYTE $E0
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $D4
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $E6
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $CC
      .BYTE   0
      .BYTE $48
      .BYTE $D0
      .BYTE $D6
      .BYTE   0
      .BYTE $50
      .BYTE $D0
      .BYTE $D8
      .BYTE   0
      .BYTE $58
CastRoll_Wart:.BYTE $D0
      .BYTE $80
      .BYTE   0
      .BYTE $28
      .BYTE $D0
      .BYTE $82
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $D0
      .BYTE $84
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $D0
      .BYTE $86
      .BYTE   0
      .BYTE $40
      .BYTE $D0
      .BYTE $88
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $8A
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $8C
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $8E
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $90
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $92
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $94
      .BYTE   0
      .BYTE $28
      .BYTE $F9
      .BYTE $96
      .BYTE   0
      .BYTE $30	; 0
      .BYTE $F9
      .BYTE $98
      .BYTE   0
      .BYTE $38	; 8
      .BYTE $F9
      .BYTE $9A
      .BYTE   0
      .BYTE $40
      .BYTE $F9
      .BYTE $9C
      .BYTE   0
      .BYTE $48
      .BYTE $F9
      .BYTE $C0
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $C0
      .BYTE   0
      .BYTE $20
      .BYTE $F9
      .BYTE $FC
      .BYTE   0
      .BYTE $2C
      .BYTE $F9
      .BYTE $D0
      .BYTE   0
      .BYTE $34	; 4
      .BYTE $F9
      .BYTE $F2
      .BYTE   0
      .BYTE $3C
      .BYTE $F9
      .BYTE $F6
      .BYTE   0
      .BYTE $44
      .BYTE $F9
      .BYTE $C0
      .BYTE   0
      .BYTE $50
      .BYTE $F9
      .BYTE $C0
      .BYTE   0
      .BYTE $58
byte_BANKC_92FE:.BYTE $10

      .BYTE $90
      .BYTE $7C
      .BYTE $98
CastRoll_MysteryData:.BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $12
      .BYTE $90
      .BYTE $7C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $14
      .BYTE $90
byte_BANKC_9310:.BYTE $7C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $7C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $18
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $1A
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $1C
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $16
      .BYTE $90
      .BYTE $1E
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $20
      .BYTE $90
      .BYTE $1E
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $1E
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $28
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $2A
      .BYTE $98
      .BYTE $7C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $2A
      .BYTE $98
      .BYTE $2C
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $2A
      .BYTE $98
      .BYTE $2E
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $32
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $34
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $36
      .BYTE $A0
      .BYTE $7C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $36
      .BYTE $A0
      .BYTE $38
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $3A
      .BYTE $A0
      .BYTE $3C
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $3E
      .BYTE $A0
      .BYTE $40
      .BYTE $A8
      .BYTE $24
      .BYTE $90
      .BYTE $30
      .BYTE $98
      .BYTE $3E
      .BYTE $A0
byte_BANKC_93A4:.BYTE $42
      .BYTE $A8
byte_BANKC_93A6:.BYTE $44

      .BYTE $B0
      .BYTE $46
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $48
      .BYTE $B0
      .BYTE $4A
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $4C
      .BYTE $B0
      .BYTE $4E
      .BYTE $B8
      .BYTE $7C
byte_BANKC_93BB:.BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $50
      .BYTE $B0
      .BYTE $52
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $54
      .BYTE $B0
      .BYTE $56
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $58
      .BYTE $B0
      .BYTE $5A
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $5E
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
byte_BANKC_93DF:.BYTE $B0
      .BYTE $60
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $62
      .BYTE $B8
      .BYTE $7C
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $66
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $68
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6A
      .BYTE $C0
      .BYTE $7C
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $6E
      .BYTE $C8
      .BYTE $5C
byte_BANKC_940F:.BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $70
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $72
byte_BANKC_941D:.BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $74
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $76
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $78
      .BYTE $C8
      .BYTE $5C
      .BYTE $B0
      .BYTE $64
      .BYTE $B8
      .BYTE $6C
      .BYTE $C0
      .BYTE $7A
      .BYTE $C8
unk_BANKC_943E:.BYTE $60
; [00000BC1 BYTES: BEGIN OF AREA UNUSED-BANKC:943F. PRESS KEYPAD "-" TO	COLLAPSE]
byte_BANKC_943F:.BYTE $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF; 0
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
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $3F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $400
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $410
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $420
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $430
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $440
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $450
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $460
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $470
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $480
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $490
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $4F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $500
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $510
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $520
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $530
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $540
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $550
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $560
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $570
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $580
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $590
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $5F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $600
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $610
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $620
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $630
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $640
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $650
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $660
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $670
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $680
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $690
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $6F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $700
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $710
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $720
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $730
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $740
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $750
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $760
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $770
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $780
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $790
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $7F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $800
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $810
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $820
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $830
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $840
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $850
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $860
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $870
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $880
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $890
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $8F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $900
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $910
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $920
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $930
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $940
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $950
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $960
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $970
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $980
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $990
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9A0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9B0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9C0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9D0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9E0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $9F0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A00
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $A90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AA0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AB0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AC0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AD0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AE0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $AF0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B00
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B10
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B20
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B30
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B40
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B50
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B60
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B70
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B80
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $B90
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $BA0
      .BYTE $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $FF, $FF, $FF; $BB0
      .BYTE $FF					  ; $BC0
; end of 'BANKC'

; [00000BC1 BYTES: END OF AREA UNUSED-BANKC:943F. PRESS	KEYPAD "-" TO COLLAPSE]
; ===========================================================================

