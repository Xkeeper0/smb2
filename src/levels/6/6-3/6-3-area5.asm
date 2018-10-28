; Level 6-3, Area 5

LevelData_6_3_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 4, 0, LevelMusic_Boss, 0, 3, $0a, $4

	.db $86, $13
	.db $F5, $11, $42
	.db $F0, $AF
	.db $C3, $32
	.db $07, $36
	.db $46, $00
	.db $F0, $11
	.db $F0, $6C
	.db $F1, $4B
	.db $F1, $CA
	.db $F5, $11, $60
	.db $FF
