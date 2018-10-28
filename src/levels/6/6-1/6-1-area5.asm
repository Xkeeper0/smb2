; Level 6-1, Area 5

LevelData_6_1_Area5:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 2, LevelDirection_Vertical, 3, 0, LevelMusic_Underground, 0, 1, $03, $3

	.db $F5, $0F, $11
	.db $65, $31
	.db $09, $31
	.db $36, $33
	.db $24, $31
	.db $0A, $31
	.db $F0, $44
	.db $F0, $65
	.db $F0, $86
	.db $F0, $A7
	.db $F1, $86
	.db $F1, $A8
	.db $F1, $CF
	.db $C6, $82
	.db $07, $82
	.db $08, $82
	.db $09, $82
	.db $26, $27
	.db $07, $22
	.db $08, $22
	.db $09, $27
	.db $F0, $4A
	.db $F0, $CD
	.db $F1, $6B
	.db $F1, $A0
	.db $FF
