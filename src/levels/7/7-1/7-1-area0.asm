; Level 7-1, Area 0

LevelData_7_1_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 0, 0, LevelMusic_Overworld, 0, 0, $13, $0

	.db $03, $A3
	.db $F5, $12, $12
	.db $43, $E5
	.db $20, $86
	.db $01, $86
	.db $18, $E3
	.db $3A, $E3
	.db $30, $EF
	.db $FF
