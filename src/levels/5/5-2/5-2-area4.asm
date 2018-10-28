; Level 5-2, Area 4

LevelData_5_2_Area4:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Vertical, 3, 0, LevelMusic_Underground, 0, 1, $03, $0

	.db $F5, $0D, $13
	.db $64, $31
	.db $0A, $31
	.db $13, $30
	.db $06, $30
	.db $09, $30
	.db $0C, $30
	.db $35, $35
	.db $28, $25
	.db $F0, $44
	.db $F0, $65
	.db $F0, $86
	.db $F0, $A7
	.db $F1, $86
	.db $F1, $A8
	.db $F1, $C4
	.db $45, $35
	.db $23, $32
	.db $0A, $32
	.db $25, $21
	.db $08, $26
	.db $F0, $02
	.db $F0, $21
	.db $F0, $C0
	.db $FF
