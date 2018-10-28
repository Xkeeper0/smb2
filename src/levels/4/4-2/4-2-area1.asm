; Level 4-2, Area 1

LevelData_4_2_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 9, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $08, $2

	.db $32, $10
	.db $14, $11
	.db $17, $0C
	.db $F5, $0A, $01
	.db $0C, $10
	.db $4F, $38
	.db $2B, $34
	.db $23, $33
	.db $07, $03
	.db $08, $33
	.db $4C, $10
	.db $78, $3F
	.db $22, $10
	.db $0A, $11
	.db $7C, $10
	.db $68, $3F
	.db $A0, $11
	.db $58, $3F
	.db $26, $10
	.db $74, $10
	.db $12, $11
	.db $58, $3F
	.db $2C, $10
	.db $76, $10
	.db $3E, $10
	.db $38, $3F
	.db $88, $10
	.db $1A, $11
	.db $96, $3F
	.db $74, $10
	.db $52, $3F
	.db $3C, $10
	.db $54, $10
	.db $17, $11
	.db $62, $3A
	.db $19, $34
	.db $1A, $34
	.db $1B, $35
	.db $62, $10
	.db $0B, $10
	.db $1A, $11
	.db $27, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $0A, $21
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $0A, $21
ENDIF
	.db $26, $E2
	.db $33, $37
	.db $FF
