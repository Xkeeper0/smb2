; Level 6-1, Area 4

LevelData_6_1_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 3, 0, LevelMusic_Underground, 0, 1, $03, $0

	.db $64, $32
	.db $09, $32
	.db $34, $30
	.db $0B, $30
	.db $15, $35
	.db $28, $24
	.db $F0, $44
	.db $F0, $65
	.db $F0, $86
	.db $F0, $A7
	.db $F1, $66
	.db $F1, $83
	.db $F1, $A0
	.db $FF
