; Level 5-3, Area 5

LevelData_5_3_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 5, 2, LevelMusic_Boss, 0, 2, $0a, $4

	.db $F0, $4F
	.db $F0, $CC
	.db $F1, $4F
	.db $F1, $D7
	.db $F1, $EF
	.db $F2
	.db $F0, $16
	.db $F0, $88
	.db $F0, $B6
	.db $F0, $C1
	.db $F0, $EC
	.db $F1, $EA
	.db $7D, $91
	.db $0E, $91
	.db $1C, $90
	.db $18, $37
	.db $FF
