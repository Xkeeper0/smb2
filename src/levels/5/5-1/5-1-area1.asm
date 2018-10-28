; Level 5-1, Area 1

LevelData_5_1_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 8, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 0, $0a, $2

	.db $83, $13
IFNDEF DISABLE_DOOR_POINTERS
	.db $0C, $01
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0C, $01
ENDIF
	.db $1B, $2A
	.db $0D, $26
	.db $3E, $54
	.db $F0, $71
	.db $F1, $D4
	.db $73, $FC
	.db $38, $87
	.db $09, $87
	.db $0A, $87
	.db $35, $84
	.db $06, $84
	.db $07, $84
	.db $F0, $68
	.db $90, $FF
	.db $F2
	.db $40, $FF
	.db $62, $84
	.db $03, $84
	.db $04, $84
	.db $05, $84
	.db $06, $84
	.db $07, $84
	.db $90, $FF
	.db $2D, $88
	.db $0E, $88
	.db $0F, $88
	.db $24, $86
	.db $05, $86
	.db $06, $86
	.db $07, $86
	.db $B0, $FF
	.db $20, $88
	.db $01, $88
	.db $4F, $84
	.db $79, $2B
	.db $11, $27
	.db $02, $26
	.db $10, $FF
	.db $00, $81
	.db $01, $81
	.db $02, $81
	.db $2D, $88
	.db $0E, $88
	.db $0F, $88
	.db $40, $84
	.db $01, $84
	.db $02, $84
	.db $03, $84
	.db $26, $82
	.db $07, $82
	.db $08, $82
	.db $09, $82
	.db $70, $FF
	.db $23, $88
	.db $04, $88
	.db $05, $88
	.db $9A, $2D
	.db $36, $00
	.db $0A, $00
	.db $10, $F0
	.db $32, $80
	.db $03, $82
	.db $04, $80
	.db $08, $81
	.db $4E, $0B
IFNDEF DISABLE_DOOR_POINTERS
	.db $0C, $20
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0C, $20
ENDIF
	.db $14, $26
	.db $06, $53
	.db $F0, $34
	.db $F0, $CD
	.db $F0, $F4
	.db $F1, $4D
	.db $F1, $74
	.db $F1, $92
	.db $FF
