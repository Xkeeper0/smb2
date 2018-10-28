; Level 6-3, Area 0

LevelData_6_3_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Horizontal, 1, 1, LevelMusic_Underground, 0, 0, $0a, $0

	.db $07, $A9
	.db $F5, $11, $11
	.db $F0, $50
	.db $F1, $CA
	.db $FF
