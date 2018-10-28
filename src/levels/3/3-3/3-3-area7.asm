; Level 3-3, Area 7

LevelData_3_3_Area7:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 4, LevelDirection_Horizontal, 0, 0, LevelMusic_Boss, 0, 0, $1d, $3

	.db $3A, $10
	.db $27, $11
	.db $35, $34
	.db $15, $34
	.db $15, $34
	.db $15, $34
	.db $07, $0A
IFNDEF DISABLE_DOOR_POINTERS
	.db $08, $30
ENDIF
IFDEF DISABLE_DOOR_POINTERS
	.db $F5, $08, $30
ENDIF
	.db $15, $31
	.db $08, $31
	.db $0E, $24
	.db $6A, $10
	.db $25, $11
	.db $54, $40
	.db $05, $6B
	.db $8A, $10
	.db $2E, $11
	.db $50, $6F
	.db $F0, $08
	.db $98, $10
	.db $60, $63
	.db $06, $68
	.db $0F, $40
	.db $F2
	.db $29, $10
	.db $14, $10
	.db $95, $42
	.db $F0, $4D
	.db $F1, $6B
	.db $F1, $E8
	.db $F5, $08, $80
	.db $FF
