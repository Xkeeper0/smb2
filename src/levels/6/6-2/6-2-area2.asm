; Level 6-2, Area 2

LevelData_6_2_Area2:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Horizontal, 2, 1, LevelMusic_Boss, 0, 0, $0a, $3

	.db $43, $13
	.db $F5, $10, $19
	.db $F0, $4E
	.db $F2
	.db $6A, $00
	.db $18, $32
	.db $0E, $31
	.db $34, $31
	.db $28, $00
	.db $09, $44
	.db $F0, $90
	.db $AA, $82
	.db $0B, $82
	.db $0C, $82
	.db $0D, $82
	.db $F5, $11, $00
	.db $F0, $0E
	.db $F1, $0F
	.db $F1, $CA
	.db $FF
