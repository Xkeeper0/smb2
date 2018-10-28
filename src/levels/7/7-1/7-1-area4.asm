; Level 7-1, Area 4

LevelData_7_1_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 4, 1, LevelMusic_Boss, 0, 0, $0a, $0

	.db $48, $0A
	.db $F5, $12, $30
	.db $0C, $33
	.db $F0, $8B
	.db $F1, $6C
	.db $F2
	.db $74, $39
	.db $1A, $43
	.db $1A, $43
	.db $00, $00
	.db $F0, $8D
	.db $F1, $4C
	.db $F1, $CA
	.db $F5, $13, $00
	.db $FF
