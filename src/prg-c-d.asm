;
; Bank C & Bank D
; ===============
;
; What's inside:
;
;   - The ending sequence with Mario sleeping and the cast roll
;

MarioDream_Pointers:
      .dw PPUBuffer_301
      .dw MarioDream_Bed
      .dw MarioDream_Bubble
      .dw MarioDream_DoNothing
      .dw MarioDream_EraseBubble1
      .dw MarioDream_EraseBubble2
      .dw MarioDream_EraseBubble3
      .dw MarioDream_EraseBubble4
      .dw MarioDream_EraseBubble5
      .dw MarioDream_Palettes

; =============== S U B R O U T I N E =======================================

sub_BANKC_8014:
      LDA     #0
      BEQ     loc_BANKC_801A

; End of function sub_BANKC_8014

; =============== S U B R O U T I N E =======================================

sub_BANKC_8018:
      LDA     #PPUMask_ShowLeft8Pixels_BG|PPUMask_ShowLeft8Pixels_SPR|PPUMask_ShowBackground|PPUMask_ShowSprites

loc_BANKC_801A:
      STA     PPUMaskMirror

; End of function sub_BANKC_8018

; =============== S U B R O U T I N E =======================================

sub_BANKC_801C:
      LDA     ScreenUpdateIndex
      ASL     A
      TAX
      LDA     MarioDream_Pointers,X
      STA     RAM_PPUDataBufferPointer
      LDA     MarioDream_Pointers+1,X
      STA     RAM_PPUDataBufferPointer+1
      LDA     #0
      STA     NMIWaitFlag

loc_BANKC_802E:
      LDA     NMIWaitFlag
      BPL     loc_BANKC_802E

      RTS

; End of function sub_BANKC_801C


EnableNMI_BankC:
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIEnabled
      STA     PPUCtrlMirror
      STA     PPUCTRL
      RTS


DisableNMI_BankC:
      LDA     #PPUCtrl_Base2000|PPUCtrl_WriteHorizontal|PPUCtrl_Sprite0000|PPUCtrl_Background1000|PPUCtrl_SpriteSize8x16|PPUCtrl_NMIDisabled
      STA     PPUCTRL
      STA     PPUCtrlMirror
      RTS


MarioDream_Palettes:
      .db $3F, $00, $20
      .db $02, $22, $12, $0F
      .db $02, $30, $16, $0F
      .db $02, $30, $16, $28
      .db $02, $22, $31, $0F
      .db $02, $27, $16, $0F
      .db $02, $27, $2A, $0F
      .db $02, $27, $25, $0F
      .db $02, $27, $3C, $0F
      .db $00

MarioDream_Bed:
      .db $20, $00, $60, $FF
      .db $20, $20, $60, $FF
      .db $20, $40, $60, $FF
      .db $20, $60, $60, $FF
      .db $23, $40, $60, $FF
      .db $23, $60, $60, $FF
      .db $23, $80, $60, $FF
      .db $23, $A0, $60, $FF
      .db $20, $80, $D6, $FF
      .db $20, $81, $D6, $FF
      .db $20, $82, $D6, $FF
      .db $20, $83, $D6, $FF
      .db $20, $9C, $D6, $FF
      .db $20, $9D, $D6, $FF
      .db $20, $9E, $D6, $FF
      .db $20, $9F, $D6, $FF
      .db $20, $84, $58, $FC
      .db $20, $A4, $58, $FC
      .db $20, $C4, $58, $FC
      .db $20, $E4, $58, $FC
      .db $21, $04, $58, $FC
      .db $21, $24, $58, $FC
      .db $21, $44, $58, $FC
      .db $21, $64, $58, $FC
      .db $21, $84, $58, $FC
      .db $21, $A4, $58, $FC
      .db $21, $C4, $58, $FC
      .db $21, $E4, $58, $FC
      .db $22, $04, $58, $FC
      .db $22, $24, $58, $FC
      .db $22, $44, $58, $FC
      .db $22, $64, $58, $FC
      .db $22, $84, $58, $FC
      .db $22, $A4, $58, $FC
      .db $22, $C4, $58, $FC
      .db $21, $4E, $02, $60, $61
      .db $21, $6E, $02, $70, $71
      .db $21, $8E, $02, $80, $81
      .db $21, $AC, $06, $36, $37, $38, $39, $3A, $3B
      .db $21, $CA, $0C, $36, $37, $35, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
      .db $21, $E8, $0E, $36, $37, $35, $55, $56, $57, $58, $59, $5A, $5B, $5C, $5D
      .db $5E, $5F ; $F
      .db $22, $06, $10, $36, $37, $35, $FC, $64, $65, $66, $67, $68, $69, $6A, $6B
      .db $6C, $6D, $6E, $6F ; $F
      .db $22, $24, $12, $36, $37, $35, $FC, $FC, $FC, $74, $75, $76, $77, $78, $79
      .db $7A, $7B, $7C, $7D, $7E, $7F ; $F
      .db $22, $44, $18, $35, $FC, $FC, $FC, $82, $83, $84, $85, $86, $87, $88, $89
      .db $8A, $8B, $8C, $8D, $8E, $8F, $00, $01, $02, $03, $04, $05 ; $F
      .db $22, $68, $14, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D
      .db $9E, $9F, $10, $11, $12, $13, $14, $15 ; $F
      .db $22, $88, $14, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD
      .db $AE, $AF, $FE, $FE, $FE, $FE, $FE, $FE ; $F
      .db $22, $A7, $15, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC
      .db $BD, $BE, $BF, $FE, $FE, $FE, $FE, $FE, $FE ; $F
      .db $22, $C6, $16, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB
      .db $CC, $CD, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; $F
      .db $22, $E4, $18, $B1, $F1, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9
      .db $DA, $DB, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; $F
      .db $23, $04, $18, $F0, $FE, $FE, $FE, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9
      .db $EA, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; $F
      .db $23, $24, $18, $FE, $FE, $FE, $FE, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9
      .db $FA, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE ; $F
      .db $00

MarioDream_Bubble:
      .db $20, $8F, $84, $06, $16, $07, $17
      .db $20, $D0, $85, $08, $18, $09, $19, $1D
      .db $20, $90, $4C, $FD
      .db $20, $B0, $4C, $FD
      .db $20, $D1, $4B, $FD
      .db $20, $F1, $0B, $FD, $FD, $FD, $28, $29, $29, $29, $29, $2A, $FD, $FD
      .db $21, $11, $0B, $FD, $FD, $FD, $FD, $27, $FD, $FD, $27, $FD, $FD, $FD
      .db $21, $31, $0B, $FD, $FD, $FD, $FD, $27, $FD, $FD, $27, $FD, $FD, $FD
      .db $21, $51, $0B, $FD, $FD, $23, $24, $25, $22, $23, $24, $25, $25, $FD
      .db $21, $71, $0B, $0B, $0C, $0D, $0E, $0F, $FD, $FD, $FD, $FD, $FD, $FD
      .db $21, $95, $07, $1F, $1A, $30, $31, $32, $33, $1B
      .db $21, $B5, $06, $53, $FC, $40, $41, $42, $43
      .db $21, $D7, $03, $50, $51, $52
      .db $21, $F6, $02, $20, $21
      .db $23, $CB, $04, $44, $55, $A5, $65 ; Attribute table changes
      .db $23, $D4, $03, $55, $5A, $56
      .db $23, $DD, $02, $45, $15
      .db $23, $E4, $01, $3F
      .db $00

; This is pointed to, but the very first byte
; is the terminating 0, so nothing gets drawn.
; This would have undone the attribute changes
; done in the above PPU writing, but I guess
; Nintendo realized they were never going to
; use that part of the screen again
MarioDream_DoNothing:
      .db $00
      .db $23, $CB, $44, $00
      .db $23, $D4, $43, $00
      .db $23, $DD, $42, $00
      .db $00

MarioDream_EraseBubble1:
      .db $20, $8F, $4D, $FC
      .db $20, $AF, $4D, $FC
      .db $00

MarioDream_EraseBubble2:
      .db $20, $CF, $4D, $FC
      .db $20, $EF, $4D, $FC
      .db $00

MarioDream_EraseBubble3:
      .db $21, $10, $4C, $FC
      .db $21, $30, $4C, $FC
      .db $00

MarioDream_EraseBubble4:
      .db $21, $50, $4C, $FC
      .db $21, $71, $4B, $FC
      .db $00

MarioDream_EraseBubble5:
      .db $21, $95, $47, $FC
      .db $21, $B5, $46, $FC
      .db $21, $D7, $43, $FC
      .db $21, $F6, $42, $FC
      .db $00

MarioDream_BubbleSprites:
      .db $28, $00, $00, $A8
      .db $28, $04, $01, $B0
      .db $28, $08, $02, $C0
      .db $28, $0C, $03, $B8

byte_BANKC_8308:
      .db $28, $02, $00, $A8
      .db $28, $06, $01, $B0

byte_BANKC_8310:
      .db $28, $0A, $02, $C0
      .db $28, $0E, $03, $B8

MarioDream_SnoringFrameCounts:
      .db $20
      .db $0A
      .db $0A
      .db $0A
      .db $0A
      .db $0A
      .db $0A
      .db $20
      .db $0A
      .db $0A
      .db $0A
      .db $0A
      .db $0A
      .db $0A

MarioDream_WakingFrameCounts:
      .db $08
      .db $08
      .db $50
      .db $40
      .db $30
      .db $10
      .db $10

MarioDream_SnoringFrames:
      .db CHRBank_EndingBackground1
      .db CHRBank_EndingBackground2
      .db CHRBank_EndingBackground3
      .db CHRBank_EndingBackground4
      .db CHRBank_EndingBackground5
      .db CHRBank_EndingBackground6
      .db CHRBank_EndingBackground7
      .db CHRBank_EndingBackground8
      .db CHRBank_EndingBackground7
      .db CHRBank_EndingBackground6
      .db CHRBank_EndingBackground5
      .db CHRBank_EndingBackground4
      .db CHRBank_EndingBackground3
      .db CHRBank_EndingBackground2

MarioDream_WakingFrames:
      .db $78
      .db $74
      .db $70
      .db $7C
      .db $70
      .db $74
      .db $78


MarioSleepingScene:
      JSR     sub_BANKC_8014

      LDA     #VMirror
      JSR     ChangeNametableMirroring

      JSR     ClearNametablesAndSprites

      LDA     #Stack100_Menu
      STA     StackArea
      JSR     EnableNMI_BankC

      JSR     sub_BANKC_801C

      LDA     #9
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #1
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #2
      STA     ScreenUpdateIndex
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
      ADC     #$02
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
      STA     ScreenUpdateIndex
      LDA     #$F8
      STA     SpriteDMAArea
      STA     SpriteDMAArea+4
      STA     SpriteDMAArea+8
      STA     SpriteDMAArea+$C
      JSR     sub_BANKC_801C

      LDA     #4
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #5
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #6
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #7
      STA     ScreenUpdateIndex
      JSR     sub_BANKC_801C

      LDA     #8
      STA     ScreenUpdateIndex
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

loc_BANKC_848E:
      BPL     loc_BANKC_846D

loc_BANKC_8490:
      JMP     loc_BANKC_8462

; =============== S U B R O U T I N E =======================================

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
CastRoll_PaletteFadeIn:
      .db $22

      .db $32
      .db $30
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
      .dw loc_BANKC_8593
      .dw loc_BANKC_85D6
      .dw loc_BANKC_85E7
      .dw loc_BANKC_861C
      .dw loc_BANKC_8898
      .dw loc_BANKC_88D7
      .dw loc_BANKC_89B6
      .dw loc_BANKC_8A04
      .dw loc_BANKC_8A37
      .dw loc_BANKC_8A52
      .dw loc_BANKC_8A82
; ---------------------------------------------------------------------------
      RTS

; ---------------------------------------------------------------------------
CastRoll_CASTText:
      .db $60,$D4,$00,$28
      .db $60,$D0,$00,$38 ; 4
      .db $60,$F4,$00,$48 ; 8
      .db $60,$F6,$00,$58 ; $C

; =============== S U B R O U T I N E =======================================

sub_BANKC_84EC:
      LDY     ObjectXLo+2
      LDA     CastRoll_SpritePointersLo,Y
      STA     ObjectXLo+6
      LDA     CastRoll_SpritePointersHi,Y
      STA     ObjectXLo+7
      INC     ObjectXLo+2
      RTS

; End of function sub_BANKC_84EC

; =============== S U B R O U T I N E =======================================

sub_BANKC_84FB:
      LDY     #CHRBank_EndingCast1
      STY     SpriteCHR1

loc_BANKC_8500:
      INY
      STY     SpriteCHR2
      INY
      STY     SpriteCHR3
      INY
      STY     SpriteCHR4
      LDX     #$07
      LDA     #$20
      STA     PlayerYHi
      LDY     #$00

loc_BANKC_8514:
      LDA     #$0F
      STA     SpriteDMAArea,Y
      INY
      LDA     #$3E
      STA     SpriteDMAArea,Y
      INY
      LDA     #$00
      STA     SpriteDMAArea,Y
      INY
      LDA     PlayerYHi
      STA     SpriteDMAArea,Y
      INY
      CLC
      ADC     #$08
      STA     PlayerYHi
      DEX
      BPL     loc_BANKC_8514

      LDX     #$07
      LDA     #$20
      STA     PlayerYHi

loc_BANKC_853A:
      LDA     #$D0
      STA     SpriteDMAArea,Y
      INY
      LDA     #$3E
      STA     SpriteDMAArea,Y
      INY
      LDA     #$00
      STA     SpriteDMAArea,Y
      INY
      LDA     PlayerYHi
      STA     SpriteDMAArea,Y
      INY
      CLC
      ADC     #$08
      STA     PlayerYHi
      DEX
      BPL     loc_BANKC_853A

      LDX     #$0F

loc_BANKC_855C:
      LDA     CastRoll_CASTText,X
      STA     SpriteDMAArea+$40,X
      DEX
      BPL     loc_BANKC_855C

      LDA     #$3F
      STA     PPUBuffer_301
      LDA     #$11
      STA     PPUBuffer_301+1
      LDA     #$01
      STA     PPUBuffer_301+2
      LDA     #$12
      STA     PPUBuffer_301+3
      LDA     #$00
      STA     PPUBuffer_301+4
      LDA     #$10
      STA     PlayerXLo
      LDA     #$00
      STA     ObjectXLo
      STA     ObjectXLo+1
      LDY     #$40

loc_BANKC_858A:
      LDA     #EnemyState_27 ; @TODO what is this
      STA     EnemyState-1,Y
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
      STA     PPUBuffer_301
      LDA     #$11
      STA     PPUBuffer_301+1
      LDA     #$01
      STA     PPUBuffer_301+2
      LDY     ObjectXLo+1
      LDA     CastRoll_PaletteFadeIn,Y
      STA     PPUBuffer_301+3

loc_BANKC_85B2:
      LDA     #$00
      STA     PPUBuffer_301+4
      INC     ObjectXLo+1
      LDA     ObjectXLo+1
      CMP     #$03
      BNE     locret_BANKC_85D5

      INC     ObjectXLo
      LDA     #$80
      STA     PlayerXLo
      LDA     #$60
      STA     ObjectYHi
      LDA     #$01
      STA     ObjectYLo+2
      STA     ObjectYLo+5
      LDA     #$00
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
      STA     ObjectXVelocity+2
      LDA     #1
      STA     ObjectYLo+7

locret_BANKC_85E6:
      RTS

; ---------------------------------------------------------------------------

loc_BANKC_85E7:
      LDA     ObjectXLo+5
      AND     #1

loc_BANKC_85EB:
      BEQ     loc_BANKC_861C

      LDA     ObjectYHi
      SEC
      SBC     #1
      STA     ObjectYHi
      STA     SpriteDMAArea+$40
      STA     SpriteDMAArea+$44
      STA     SpriteDMAArea+$48
      STA     SpriteDMAArea+$4C
      LDA     ObjectYHi
      CMP     #$10
      BNE     loc_BANKC_861C

      LDA     #$F8
      STA     SpriteDMAArea+$40
      STA     SpriteDMAArea+$44
      STA     SpriteDMAArea+$48
      STA     SpriteDMAArea+$4A
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
      STA     SpriteDMAArea+$40,Y
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
      STA     SpriteDMAArea+$80,Y
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
      STA     SpriteDMAArea+$C0,Y
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
      LDA     SpriteDMAArea+$40
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
      STA     SpriteDMAArea+$40
      STA     SpriteDMAArea+$44
      STA     SpriteDMAArea+$48
      STA     SpriteDMAArea+$4C

loc_BANKC_86C3:
      LDA     SpriteDMAArea+$50
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
      STA     SpriteDMAArea+$50
      STA     SpriteDMAArea+$54
      STA     SpriteDMAArea+$58
      STA     SpriteDMAArea+$5C

loc_BANKC_86F2:
      LDA     SpriteDMAArea+$60
      CMP     #$F8
      BEQ     loc_BANKC_873A

      DEC     ObjectYHi+2
      CMP     #$F9
      BNE     loc_BANKC_870C

      LDA     ObjectYHi+2
      CMP     #$D0
      BNE     loc_BANKC_873A

      LDY     ObjectXLo+2
      LDA     EnemyState-1,Y
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
      STA     SpriteDMAArea+$60
      STA     SpriteDMAArea+$64
      STA     SpriteDMAArea+$68
      STA     SpriteDMAArea+$6C
      STA     SpriteDMAArea+$70
      STA     SpriteDMAArea+$74
      STA     SpriteDMAArea+$78
      STA     SpriteDMAArea+$7C

loc_BANKC_873A:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_8743

      JMP     loc_BANKC_87D2

; ---------------------------------------------------------------------------

loc_BANKC_8743:
      LDA     SpriteDMAArea+$80
      CMP     #$F8
      BEQ     loc_BANKC_8763

      LDA     ObjectYHi+3

loc_BANKC_874C:
      SEC
      SBC     #1
      CMP     #$10
      BNE     loc_BANKC_8755

      LDA     #$F8

loc_BANKC_8755:
      STA     ObjectYHi+3
      STA     SpriteDMAArea+$80
      STA     SpriteDMAArea+$84
      STA     SpriteDMAArea+$88
      STA     SpriteDMAArea+$8C

loc_BANKC_8763:
      LDA     SpriteDMAArea+$90
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
      STA     SpriteDMAArea+$90
      STA     SpriteDMAArea+$94

loc_BANKC_8784:
      STA     SpriteDMAArea+$98
      STA     SpriteDMAArea+$9C

loc_BANKC_878A:
      LDA     SpriteDMAArea+$A0
      CMP     #$F8
      BEQ     loc_BANKC_87D2

      DEC     ObjectYHi+5
      CMP     #$F9
      BNE     loc_BANKC_87A4

      LDA     ObjectYHi+5
      CMP     #$D0
      BNE     loc_BANKC_87D2

      LDY     ObjectXLo+2
      LDA     EnemyState-1,Y
      STA     ObjectYLo+8

loc_BANKC_87A4:
      LDA     ObjectYHi+5
      CMP     #$10
      BNE     loc_BANKC_87BA

loc_BANKC_87AA:
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
      STA     SpriteDMAArea+$A0
      STA     SpriteDMAArea+$A4
      STA     SpriteDMAArea+$A8
      STA     SpriteDMAArea+$AC
      STA     SpriteDMAArea+$B0
      STA     SpriteDMAArea+$B4
      STA     SpriteDMAArea+$B8
      STA     SpriteDMAArea+$BC

loc_BANKC_87D2:
      LDA     ObjectXLo+5
      AND     #1
      BNE     loc_BANKC_87DB

      JMP     locret_BANKC_8897

; ---------------------------------------------------------------------------

loc_BANKC_87DB:
      LDA     SpriteDMAArea+$C0
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
      STA     SpriteDMAArea+$C0
      STA     SpriteDMAArea+$C4
      STA     SpriteDMAArea+$C8
      STA     SpriteDMAArea+$CC

loc_BANKC_87FB:
      LDA     SpriteDMAArea+$D0
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
      STA     SpriteDMAArea+$D0
      STA     SpriteDMAArea+$D4
      STA     SpriteDMAArea+$D8
      STA     SpriteDMAArea+$DC

loc_BANKC_8822:
      LDA     SpriteDMAArea+$E0
      CMP     #$F8
      BEQ     locret_BANKC_8897

      DEC     ObjectYHi+8
      CMP     #$F9
      BNE     loc_BANKC_883C

      LDA     ObjectYHi+8
      CMP     #$D0
      BNE     locret_BANKC_8897

      LDY     ObjectXLo+2
      LDA     EnemyState-1,Y
      STA     ObjectYLo+6

loc_BANKC_883C:
      LDA     ObjectXLo+2
      CMP     #$1D
      BNE     loc_BANKC_884C

      LDA     ObjectYHi+8
      CMP     #$B8
      BNE     loc_BANKC_884C

      LDA     #1
      STA     ObjectXVelocity+2

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
      STA     SpriteDMAArea+$E0
      STA     SpriteDMAArea+$E4
      STA     SpriteDMAArea+$E8
      STA     SpriteDMAArea+$EC
      STA     SpriteDMAArea+$F0
      STA     SpriteDMAArea+$F4
      STA     SpriteDMAArea+$F8
      STA     SpriteDMAArea+$FC
      LDA     ObjectXVelocity+2
      BEQ     locret_BANKC_8897

      LDY     #$1F

loc_BANKC_8880:
      LDA     CastRoll_TriclydeText,Y
      STA     SpriteDMAArea+$40,Y
      DEY
      BPL     loc_BANKC_8880

      LDA     #$D0
      STA     ObjectYHi
      STA     ObjectYHi+1
      LDA     #0
      STA     ObjectXVelocity+2

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
      STA     SpriteDMAArea+$40,Y
      DEY
      BPL     loc_BANKC_88AB

      INC     ObjectXLo
      LDY     #0
      LDX     #$F
      LDA     #$C0

loc_BANKC_88BC:
      STA     SpriteDMAArea+1,Y
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
      LDA     SpriteDMAArea+$40
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
      STA     SpriteDMAArea+$40
      STA     SpriteDMAArea+$44
      STA     SpriteDMAArea+$48
      STA     SpriteDMAArea+$4C
      STA     SpriteDMAArea+$50

loc_BANKC_8906:
      LDA     SpriteDMAArea+$54
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
      STA     SpriteDMAArea+$54
      STA     SpriteDMAArea+$58
      STA     SpriteDMAArea+$5C
      STA     SpriteDMAArea+$60
      STA     SpriteDMAArea+$64

loc_BANKC_8930:
      LDA     SpriteDMAArea+$68
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
      STA     SpriteDMAArea+$68
      STA     SpriteDMAArea+$6C
      STA     SpriteDMAArea+$70
      STA     SpriteDMAArea+$74
      STA     SpriteDMAArea+$78

loc_BANKC_895A:
      LDA     SpriteDMAArea+$7C
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
      STA     SpriteDMAArea+$7C
      STA     SpriteDMAArea+$80
      STA     SpriteDMAArea+$84
      STA     SpriteDMAArea+$88
      STA     SpriteDMAArea+$8C
      STA     SpriteDMAArea+$90
      STA     SpriteDMAArea+$94
      STA     SpriteDMAArea+$98

loc_BANKC_898D:
      LDA     #0
      STA     ObjectXVelocity
      STA     PlayerXVelocity
      LDA     #$C
      STA     ObjectXVelocity+1
      RTS

; ---------------------------------------------------------------------------
byte_BANKC_8998:
      .db $9E

      .db $A0
      .db $A2
      .db $A4
      .db $88
      .db $A6
      .db $A8
      .db $AA
      .db $AC
      .db $92
      .db $94
      .db $96
      .db $98
      .db $9A
      .db $9C
byte_BANKC_89A7:
      .db $AE

      .db $B0
byte_BANKC_89A9:
      .db $B2
      .db $B4
      .db $BE
      .db $B6
      .db $B8
      .db $BA
      .db $BC
      .db $92
      .db $94
      .db $96
      .db $98
      .db $9A
      .db $9C
; ---------------------------------------------------------------------------

loc_BANKC_89B6:
      DEC     PlayerXVelocity
      BPL     locret_BANKC_8A00

      LDA     #8
      STA     PlayerXVelocity
      DEC     ObjectXVelocity+1
      BPL     loc_BANKC_89CD

      INC     ObjectXLo
      LDA     #0
      STA     PlayerXLo
      STA     ObjectXLo+1
      JMP     locret_BANKC_8A00

; ---------------------------------------------------------------------------

loc_BANKC_89CD:
      LDA     ObjectXVelocity
      AND     #1
      BNE     loc_BANKC_89EB

      LDY     #0
      LDX     #0

loc_BANKC_89D7:
      INC     ObjectXVelocity
      LDA     byte_BANKC_8998,X
      STA     SpriteDMAArea+$41,Y
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
      INC     ObjectXVelocity
      LDX     #0
      LDY     #0

loc_BANKC_89F1:
      LDA     byte_BANKC_89A7,X
      STA     SpriteDMAArea+$41,Y
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
CastRoll_PaletteFadeOut:
      .db $32

byte_BANKC_8A02:
      .db $22
      .db $12
; ---------------------------------------------------------------------------

loc_BANKC_8A04:
      DEC     PlayerXLo
      BPL     locret_BANKC_8A36

      LDA     #$10
      STA     PlayerXLo
      LDA     #$3F
      STA     PPUBuffer_301
      LDA     #$11
      STA     PPUBuffer_301+1
      LDA     #$01
      STA     PPUBuffer_301+2
      LDY     ObjectXLo+1
      LDA     CastRoll_PaletteFadeOut,Y
      STA     PPUBuffer_301+3
      LDA     #$00
      STA     PPUBuffer_301+4
      INC     ObjectXLo+1
      LDA     ObjectXLo+1
      CMP     #$03
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
      STA     SpriteDMAArea+$40,Y
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

      LDA     #$00
      STA     ObjectXHi+4
      STA     ObjectXHi+5

loc_BANKC_8A5C:
      STA     ObjectXHi+6
      LDA     #$05
      STA     ObjectXHi+7
      LDA     #$14
      STA     ObjectXHi+8
      LDA     #$3F
      STA     PPUBuffer_301
      LDA     #$11
      STA     PPUBuffer_301+1
      LDA     #$01
      STA     PPUBuffer_301+2
      LDA     #$30
      STA     PPUBuffer_301+3
      LDA     #$00
      STA     PPUBuffer_301+4
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
      STA     SpriteDMAArea+$10,X
      INX
      LDA     byte_BANKC_93A6,Y
      STA     SpriteDMAArea+$10,X
      INY
      INX
      LDA     #0
      STA     SpriteDMAArea+$10,X
      INX
      LDA     byte_BANKC_93A6,Y
      STA     SpriteDMAArea+$10,X
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
CastRoll_SpritePointersHi:
      .db >CastRoll_Mario ; DATA XREF: sub_BANKC_84EC+7r

      .db >CastRoll_Luigi
      .db >CastRoll_Princess
      .db >CastRoll_Toad
      .db >CastRoll_Shyguy
      .db >CastRoll_Snifit
      .db >CastRoll_Ninji
      .db >CastRoll_Beezo
      .db >CastRoll_Porcupo
      .db >CastRoll_Tweeter
      .db >CastRoll_BobOmb
      .db >CastRoll_Hoopstar
      .db >CastRoll_Trouter
      .db >CastRoll_Pidgit
      .db >CastRoll_Panser
      .db >CastRoll_Flurry
      .db >CastRoll_Albatoss
      .db >CastRoll_Phanto
      .db >CastRoll_Spark
      .db >CastRoll_Subcon
      .db >CastRoll_Pokey
      .db >CastRoll_Birdo
      .db >CastRoll_Ostro
      .db >CastRoll_Autobomb
      .db >CastRoll_Cobrat
      .db >CastRoll_Mouser
      .db >CastRoll_Fryguy
      .db >CastRoll_Clawglip
      .db >CastRoll_Triclyde
CastRoll_SpritePointersLo:
      .db <CastRoll_Mario

      .db <CastRoll_Luigi
      .db <CastRoll_Princess
      .db <CastRoll_Toad
      .db <CastRoll_Shyguy
      .db <CastRoll_Snifit
      .db <CastRoll_Ninji
      .db <CastRoll_Beezo
      .db <CastRoll_Porcupo
      .db <CastRoll_Tweeter
      .db <CastRoll_BobOmb
      .db <CastRoll_Hoopstar
      .db <CastRoll_Trouter
      .db <CastRoll_Pidgit
      .db <CastRoll_Panser
      .db <CastRoll_Flurry
      .db <CastRoll_Albatoss
      .db <CastRoll_Phanto
      .db <CastRoll_Spark
      .db <CastRoll_Subcon
      .db <CastRoll_Pokey
      .db <CastRoll_Birdo
      .db <CastRoll_Ostro
      .db <CastRoll_Autobomb
      .db <CastRoll_Cobrat
      .db <CastRoll_Mouser
      .db <CastRoll_Fryguy
      .db <CastRoll_Clawglip
      .db <CastRoll_Triclyde
CastRoll_Mario:
      .db $D0, $3E, $00, $30
      .db $D0, $00, $00, $38 ; 4
      .db $D0, $02, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $04, $00, $38 ; $14
      .db $F9, $06, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $E8, $00, $2C ; $24
      .db $F9, $D0, $00, $34 ; $28
      .db $F9, $F2, $00, $3C ; $2C
      .db $F9, $E0, $00, $44 ; $30
      .db $F9, $EC, $00, $4C ; $34
      .db $F9, $3E, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Luigi:
      .db $D0, $3E, $00, $30
      .db $D0, $08, $00, $38 ; 4
      .db $D0, $0A, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $0C, $00, $38 ; $14
      .db $F9, $0E, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $E6, $00, $2C ; $24
      .db $F9, $F8, $00, $34 ; $28
      .db $F9, $E0, $00, $3C ; $2C
      .db $F9, $DC, $00, $44 ; $30
      .db $F9, $E0, $00, $4C ; $34
      .db $F9, $3E, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Princess:
      .db $D0, $3E, $00, $30
      .db $D0, $10, $00, $38 ; 4
      .db $D0, $12, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $14, $00, $38 ; $14
      .db $F9, $16, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $EE, $00, $20 ; $20
      .db $F9, $F2, $00, $28 ; $24
      .db $F9, $E0, $00, $30 ; $28
      .db $F9, $EA, $00, $38 ; $2C
      .db $F9, $D4, $00, $40 ; $30
      .db $F9, $D8, $00, $48 ; $34
      .db $F9, $F4, $00, $50 ; $38
      .db $F9, $F4, $00, $58 ; $3C
CastRoll_Toad:
      .db $D0, $3E, $00, $30 ; DATA XREF: BANKC:8B0Bo
      .db $D0, $18, $00, $38 ; 4
      .db $D0, $1A, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $1C, $00, $38 ; $14
      .db $F9, $1E, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $3E, $00, $28 ; $24
      .db $F9, $F6, $00, $30 ; $28
      .db $F9, $EC, $00, $38 ; $2C
      .db $F9, $D0, $00, $40 ; $30
      .db $F9, $D6, $00, $48 ; $34
      .db $F9, $3E, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Shyguy:
      .db $D0, $3E, 0, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $20, $00, $38 ; $14
      .db $F9, $22, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $F4, $00, $28 ; $24
      .db $F9, $DE, $00, $30 ; $28
      .db $F9, $CC, $00, $38 ; $2C
      .db $F9, $DC, $00, $40 ; $30
      .db $F9, $F8, $00, $48 ; $34
      .db $F9, $CC, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Snifit:
      .db $D0, $3E, 0, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $24, $00, $38 ; $14
      .db $F9, $26, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $F4, $00, $28 ; $24
      .db $F9, $EA, $00, $30 ; $28
      .db $F9, $E0, $00, $38 ; $2C
      .db $F9, $DA, $00, $40 ; $30
      .db $F9, $E0, $00, $48 ; $34
      .db $F9, $F6, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Ninji:
      .db $D0, $3E, $00, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $28, $00, $38 ; $14
      .db $F9, $2A, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $EA, $00, $2C ; $24
      .db $F9, $E0, $00, $34 ; $28
      .db $F9, $EA, $00, $3C ; $2C
      .db $F9, $E2, $00, $44 ; $30
      .db $F9, $E0, $00, $4C ; $34
      .db $F9, $3E, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Beezo:
      .db $D0, $3E, $00, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $2C, $00, $38 ; $14
      .db $F9, $2E, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $D2, $00, $2C ; $24
      .db $F9, $D8, $00, $34 ; $28
      .db $F9, $D8, $00, $3C ; $2C
      .db $F9, $CE, $00, $44 ; $30
      .db $F9, $EC, $00, $4C ; $34
      .db $F9, $3E, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Porcupo:
      .db $D0, $3E, $00, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $30, $00, $38 ; $14
      .db $F9, $32, $00, $40 ; $18
      .db $F9 ; $1C
byte_BANKC_8D5F:
      .db $3E, $00, $48, $F9
      .db $EE, $00, $24, $F9 ; 4
      .db $EC, $00, $2C, $F9 ; 8
      .db $F2, $00, $34, $F9 ; $C
      .db $D4, $00, $3C, $F9 ; $10
      .db $F8, $00, $44, $F9 ; $14
      .db $EE, $00, $4C, $F9 ; $18
      .db $EC, $00, $54, $F9 ; $1C
      .db $3E, $00, $5C ; $20
CastRoll_Tweeter:
      .db $D0, $3E, $00, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $34, $00, $38 ; $14
      .db $F9, $36, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $F6, $00, $24 ; $20
      .db $F9, $FC, $00, $2C ; $24
      .db $F9, $D8, $00, $34 ; $28
      .db $F9, $D8, $00, $3C ; $2C
      .db $F9, $F6, $00, $44 ; $30
      .db $F9, $D8, $00, $4C ; $34
      .db $F9, $F2, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_BobOmb:
      .db $D0, $3E, 0, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $38, $00, $38 ; $14
      .db $F9, $3A, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $D2, $00, $24 ; $20
      .db $F9, $EC, $00, $2C ; $24
      .db $F9, $D2, $00, $34 ; $28
      .db $F9, $3E, $00, $3C ; $2C
      .db $F9, $EC, $00, $44 ; $30
      .db $F9, $E8, $00, $4C ; $34
      .db $F9, $D2, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Hoopstar:
      .db $D0, $3E, $00, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $3C, $00, $38 ; $14
      .db $F9, $3C, $40, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $DE, $00, $20 ; $20
      .db $F9, $EC, $00, $28 ; $24
      .db $F9, $EC, $00, $30 ; $28
      .db $F9, $EE, $00, $38 ; $2C
      .db $F9, $F4, $00, $40 ; $30
      .db $F9, $F6, $00, $48 ; $34
      .db $F9, $D0, $00, $50 ; $38
      .db $F9, $F2, $00, $58 ; $3C
CastRoll_Trouter:
      .db $D0, $3E, $00, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $40, $00, $38 ; $14
      .db $F9, $42, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $F6, $00, $24 ; $20
      .db $F9, $F2, $00, $2C ; $24
      .db $F9, $EC, $00, $34 ; $28
      .db $F9, $F8, $00, $3C ; $2C
      .db $F9, $F6, $00, $44 ; $30
      .db $F9, $D8, $00, $4C ; $34
      .db $F9, $F2, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Pidgit:
      .db $D0, $3E, 0, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $44, $00, $38 ; $14
      .db $F9, $46, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $EE, $00, $28 ; $24
      .db $F9, $E0, $00, $30 ; $28
      .db $F9, $D6, $00, $38 ; $2C
      .db $F9, $DC, $00, $40 ; $30
      .db $F9, $E0, $00, $48 ; $34
      .db $F9, $F6, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Panser:
      .db $D0, $3E, 0, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $48, $00, $38 ; $14
      .db $F9, $4A, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $EE, $00, $28 ; $24
      .db $F9, $D0, $00, $30 ; $28
      .db $F9, $EA, $00, $38 ; $2C
      .db $F9, $F4, $00, $40 ; $30
      .db $F9, $D8, $00, $48 ; $34
      .db $F9, $F2, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Flurry:
      .db $D0, $3E, 0, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $4C, $00, $38 ; $14
      .db $F9, $4E, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $DA, $00, $28 ; $24
      .db $F9, $E6, $00, $30 ; $28
      .db $F9, $F8, $00, $38 ; $2C
      .db $F9, $F2, $00, $40 ; $30
      .db $F9, $F2, $00, $48 ; $34
      .db $F9, $CC, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Albatoss:
      .db $D0, $3E, $00, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $50, $00, $30 ; $10
      .db $F9, $52, $00, $38 ; $14
      .db $F9, $54, $00, $40 ; $18
      .db $F9, $56, $00, $48 ; $1C
      .db $F9, $D0, $00, $20 ; $20
      .db $F9, $E6, $00, $28 ; $24
      .db $F9, $D2, $00, $30 ; $28
      .db $F9, $D0, $00, $38 ; $2C
      .db $F9, $F6, $00, $40 ; $30
      .db $F9, $EC, $00, $48 ; $34
      .db $F9, $F4, $00, $50 ; $38
      .db $F9, $F4, $00, $58 ; $3C
CastRoll_Phanto:
      .db $D0, $3E, 0, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $68, $00, $38 ; $14
      .db $F9, $68, $40, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $EE, $00, $28 ; $24
      .db $F9, $DE, $00, $30 ; $28
      .db $F9, $D0, $00, $38 ; $2C
      .db $F9, $EA, $00, $40 ; $30
      .db $F9, $F6, $00, $48 ; $34
      .db $F9, $EC, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Spark:
      .db $D0, $3E, $00, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $6A, $00, $38 ; $14
      .db $F9, $6A, $40, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $F4, $00, $2C ; $24
      .db $F9, $EE, $00, $34 ; $28
      .db $F9, $D0, $00, $3C ; $2C
      .db $F9, $F2, $00, $44 ; $30
      .db $F9, $E4, $00, $4C ; $34
      .db $F9, $3E, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Subcon:
      .db $D0, $3E, 0, $30
      .db $D0, $3E, $00, $38 ; 4
      .db $D0, $3E, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $6C, $00, $38 ; $14
      .db $F9, $6E, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $F4, $00, $2C ; $24
      .db $F9, $F8, $00, $34 ; $28
      .db $F9, $D2, $00, $3C ; $2C
      .db $F9, $D4, $00, $44 ; $30
      .db $F9, $EC, $00, $4C ; $34
      .db $F9, $EA, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Pokey:
      .db $D0, $3E, $00, $30
      .db $D0, $60, $00, $38 ; 4
      .db $D0, $62, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $64, $00, $38 ; $14
      .db $F9, $66, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $EE, $00, $2C ; $24
      .db $F9, $EC, $00, $34 ; $28
      .db $F9, $E4, $00, $3C ; $2C
      .db $F9, $D8, $00, $44 ; $30
      .db $F9, $CC, $00, $4C ; $34
      .db $F9, $3E, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Birdo:
      .db $D0, $3E, $00, $30
      .db $D0, $70, $00, $38 ; 4
      .db $D0, $72, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $74, $00, $38 ; $14
      .db $F9, $76, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $D2, $00, $2C ; $24
      .db $F9, $E0, $00, $34 ; $28
      .db $F9, $F2, $00, $3C ; $2C
      .db $F9, $D6, $00, $44 ; $30
      .db $F9, $EC, $00, $4C ; $34
      .db $F9, $3E, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Ostro:
      .db $D0, $3E, $00, $30
      .db $D0, $78, $00, $38 ; 4
      .db $D0, $7A, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $7C, $00, $38 ; $14
      .db $F9, $7E, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $24 ; $20
      .db $F9, $EC, $00, $2C ; $24
      .db $F9, $F4, $00, $34 ; $28
      .db $F9, $F6, $00, $3C ; $2C
      .db $F9, $F2, $00, $44 ; $30
      .db $F9, $EC, $00, $4C ; $34
      .db $F9, $3E, $00, $54 ; $38
      .db $F9, $3E, $00, $5C ; $3C
CastRoll_Autobomb:
      .db $D0, $3E, $00, $30
      .db $D0, $80, $00, $38 ; 4
      .db $D0, $82, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $84, $00, $38 ; $14
      .db $F9, $86, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $D0, $00, $20 ; $20
      .db $F9, $F8, $00, $28 ; $24
      .db $F9, $F6, $00, $30 ; $28
      .db $F9, $EC, $00, $38 ; $2C
      .db $F9, $D2, $00, $40 ; $30
      .db $F9, $EC, $00, $48 ; $34
      .db $F9, $E8, $00, $50 ; $38
      .db $F9, $D2, $00, $58 ; $3C
CastRoll_Cobrat:
      .db $D0, $3E, 0, $30
      .db $D0, $58, $00, $38 ; 4
      .db $D0, $5A, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $3E, $00, $30 ; $10
      .db $F9, $5C, $00, $38 ; $14
      .db $F9, $5E, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $D4, $00, $28 ; $24
      .db $F9, $EC, $00, $30 ; $28
      .db $F9, $D2, $00, $38 ; $2C
      .db $F9, $F2, $00, $40 ; $30
      .db $F9, $D0, $00, $48 ; $34
      .db $F9, $F6, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Mouser:
      .db $D0, $88, 0, $30
      .db $D0, $8A, $00, $38 ; 4
      .db $D0, $8C, $00, $40 ; 8
      .db $D0, $3E, $00, $48 ; $C
      .db $F9, $8E, $00, $30 ; $10
      .db $F9, $90, $00, $38 ; $14
      .db $F9, $92, $00, $40 ; $18
      .db $F9, $3E, $00, $48 ; $1C
      .db $F9, $3E, $00, $1C ; $20
      .db $F9, $E8, $00, $24 ; $24
      .db $F9, $EC, $00, $2C ; $28
      .db $F9, $F8, $00, $34 ; $2C
      .db $F9, $F4, $00, $3C ; $30
      .db $F9, $D8, $00, $44 ; $34
      .db $F9, $F2, $00, $4C ; $38
      .db $F9, $3E, $00, $54 ; $3C
CastRoll_Fryguy:
      .db $D0, $AA, 0, $30
      .db $D0, $AC, $00, $38 ; 4
      .db $D0, $AE, $00, $40 ; 8
      .db $D0, $B0, $00, $48 ; $C
      .db $F9, $B2, $00, $30 ; $10
      .db $F9, $B4, $00, $38 ; $14
      .db $F9, $B6, $00, $40 ; $18
      .db $F9, $B8, $00, $48 ; $1C
      .db $F9, $3E, $00, $20 ; $20
      .db $F9, $DA, $00, $28 ; $24
      .db $F9, $F2, $00, $30 ; $28
      .db $F9, $CC, $00, $38 ; $2C
      .db $F9, $DC, $00, $40 ; $30
      .db $F9, $F8, $00, $48 ; $34
      .db $F9, $CC, $00, $50 ; $38
      .db $F9, $3E, $00, $58 ; $3C
CastRoll_Clawglip:
      .db $D0, $BA, $00, $30
      .db $D0, $BC, $00, $38 ; 4
      .db $D0, $BE, $00, $40 ; 8
      .db $D0, $C0, $00, $48 ; $C
      .db $F9, $C2, $00, $30 ; $10
      .db $F9, $C4, $00, $38 ; $14
      .db $F9, $C6, $00, $40 ; $18
      .db $F9, $C8, $00, $48 ; $1C
      .db $F9, $D4, $00, $20 ; $20
      .db $F9, $E6, $00, $28 ; $24
      .db $F9, $D0, $00, $30 ; $28
      .db $F9, $FC, $00, $38 ; $2C
      .db $F9, $DC, $00, $40 ; $30
      .db $F9, $E6, $00, $48 ; $34
      .db $F9, $E0, $00, $50 ; $38
      .db $F9, $EE, $00, $58 ; $3C
CastRoll_Triclyde:
      .db $D0, $94, $00, $30
      .db $D0, $96, $00, $38 ; 4
      .db $D0, $98, $00, $40 ; 8
      .db $D0, $9A, $00, $48 ; $C
      .db $F9, $9C, $00, $30 ; $10
      .db $F9, $9E, $00, $38 ; $14
      .db $F9, $A0, $00, $40 ; $18
      .db $F9, $A2, $00, $48 ; $1C
      .db $F9, $3E, $00, $30 ; $20
      .db $F9, $A4, $00, $38 ; $24
      .db $F9, $A6, $00, $40 ; $28
      .db $F9, $A8, $00, $48 ; $2C
      .db $F9, $3E, $00, $50 ; $30
      .db $F9, $3E, $00, $58 ; $34
      .db $F9, $3E, $00, $60 ; $38
      .db $F9, $3E, $00, $68 ; $3C
CastRoll_TriclydeText:
      .db $D0, $F6, $00, $20
      .db $D0, $F2, $00, $28 ; 4
      .db $D0, $E0, $00, $30 ; 8
      .db $D0, $D4, $00, $38 ; $C
      .db $D0, $E6, $00, $40 ; $10
      .db $D0, $CC, $00, $48 ; $14
      .db $D0, $D6, $00, $50 ; $18
      .db $D0, $D8, $00, $58 ; $1C
CastRoll_Wart:
      .db $D0, $80, $00, $28
      .db $D0, $82, $00, $30 ; 4
      .db $D0, $84, $00, $38 ; 8
      .db $D0, $86, $00, $40 ; $C
      .db $D0, $88, $00, $48 ; $10
      .db $F9, $8A, $00, $28 ; $14
      .db $F9, $8C, $00, $30 ; $18
      .db $F9, $8E, $00, $38 ; $1C
      .db $F9, $90, $00, $40 ; $20
      .db $F9, $92, $00, $48 ; $24
      .db $F9, $94, $00, $28 ; $28
      .db $F9, $96, $00, $30 ; $2C
      .db $F9, $98, $00, $38 ; $30
      .db $F9, $9A, $00, $40 ; $34
      .db $F9, $9C, $00, $48 ; $38
      .db $F9, $C0, $00, $20 ; $3C
      .db $F9, $C0, $00, $20 ; $40
      .db $F9, $FC, $00, $2C ; $44
      .db $F9, $D0, $00, $34 ; $48
      .db $F9, $F2, $00, $3C ; $4C
      .db $F9, $F6, $00, $44 ; $50
      .db $F9, $C0, $00, $50 ; $54
      .db $F9, $C0, $00, $58 ; $58
byte_BANKC_92FE:
      .db $10

      .db $90
      .db $7C
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $12
      .db $90
      .db $7C
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $14
      .db $90
      .db $7C
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $16
      .db $90
      .db $7C
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $16
      .db $90
      .db $18
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $16
      .db $90
      .db $1A
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $16
      .db $90
      .db $1C
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $16
      .db $90
      .db $1E
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $20
      .db $90
      .db $1E
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $1E
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $28
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $2A
      .db $98
      .db $7C
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $2A
      .db $98
      .db $2C
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $2A
      .db $98
      .db $2E
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $30
      .db $98
      .db $32
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $30
      .db $98
      .db $34
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $30
      .db $98
      .db $36
      .db $A0
      .db $7C
      .db $A8
      .db $24
      .db $90
      .db $30
      .db $98
      .db $36
      .db $A0
      .db $38
      .db $A8
      .db $24
      .db $90
      .db $30
      .db $98
      .db $3A
      .db $A0
      .db $3C
      .db $A8
      .db $24
      .db $90
      .db $30
      .db $98
      .db $3E
      .db $A0
      .db $40
      .db $A8
      .db $24
      .db $90
      .db $30
      .db $98
      .db $3E
      .db $A0
      .db $42
      .db $A8
byte_BANKC_93A6:
      .db $44

      .db $B0
      .db $46
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $48
      .db $B0
      .db $4A
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $4C
      .db $B0
      .db $4E
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $50
      .db $B0
      .db $52
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $54
      .db $B0
      .db $56
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $58
      .db $B0
      .db $5A
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $5C
      .db $B0
      .db $5E
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $5C
      .db $B0
      .db $60
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $5C
      .db $B0
      .db $62
      .db $B8
      .db $7C
      .db $C0
      .db $7C
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $66
      .db $C0
      .db $7C
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $68
      .db $C0
      .db $7C
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $6A
      .db $C0
      .db $7C
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $6C
      .db $C0
      .db $6E
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $6C
      .db $C0
      .db $70
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $6C
      .db $C0
      .db $72
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $6C
      .db $C0
      .db $74
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $6C
      .db $C0
      .db $76
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $6C
      .db $C0
      .db $78
      .db $C8
      .db $5C
      .db $B0
      .db $64
      .db $B8
      .db $6C
      .db $C0
      .db $7A
      .db $C8
      .db $60
