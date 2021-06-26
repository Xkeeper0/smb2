; Bank C & Bank D subfile
; ===============
;
; What's inside:
;
;   - Data for mario dream sequence
;

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

MarioDream_BubbleSprites2:
	.db $28, $02, $00, $A8
	.db $28, $06, $01, $B0
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
