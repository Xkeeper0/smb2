; Level 5-2, Area 0

LevelData_5_2_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 0, $0a, $2

	.db $F0, $5B
	.db $F2
	.db $F0, $11
	.db $F1, $AA
	.db $0C, $A9
	.db $F5, $0D, $10
	.db $FF
