; Level 5-3, Area 0

LevelData_5_3_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 2, 1, LevelMusic_Underground, 0, 0, $0a, $2

	.db $F0, $70
	.db $F2
	.db $09, $A9
	.db $F5, $0E, $10
	.db $F0, $0F
	.db $F1, $8A
	.db $FF
