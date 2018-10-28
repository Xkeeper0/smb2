; Level 2-1, Area 4

LevelData_2_1_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 3, 0, LevelMusic_Underground, 0, 1, $03, $0

	.db $54, $32
	.db $09, $32
	.db $15, $30
	.db $0A, $30
	.db $27, $31
	.db $24, $31
	.db $0A, $31
	.db $15, $31
	.db $09, $31
	.db $16, $33
	.db $1B, $24
	.db $F0, $44
	.db $F0, $65
	.db $F0, $86
	.db $F0, $A7
	.db $F1, $86
	.db $F1, $A3
	.db $F1, $C8
	.db $FF
