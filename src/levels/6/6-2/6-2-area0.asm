; Level 6-2, Area 0

LevelData_6_2_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 0, $0a, $3

	.db $F0, $54
	.db $F1, $8F
	.db $F2
	.db $4C, $14
	.db $F5, $10, $10
	.db $F0, $CE
	.db $F1, $EA
	.db $FF
