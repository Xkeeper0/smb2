; Level 1-2, Area 4

LevelData_1_2_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 3, 0, LevelMusic_Underground, 0, 1, $03, $0

	.db $64, $32
	.db $09, $32
	.db $32, $32
	.db $0B, $32
	.db $24, $31
	.db $0A, $31
	.db $17, $27
	.db $F0, $44
	.db $F0, $65
	.db $F0, $86
	.db $F0, $A7
	.db $F1, $86
	.db $F1, $A8
	.db $F1, $C4
	.db $FF
