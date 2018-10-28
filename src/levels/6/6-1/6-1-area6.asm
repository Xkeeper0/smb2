; Level 6-1, Area 6

LevelData_6_1_Area6:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 0, LevelDirection_Vertical, 3, 0, LevelMusic_Underground, 0, 1, $03, $0

	.db $65, $31
	.db $09, $31
	.db $33, $31
	.db $0B, $31
	.db $17, $31
	.db $26, $26
	.db $F5, $0F, $02
	.db $F0, $44
	.db $F0, $65
	.db $F0, $86
	.db $F0, $A7
	.db $F1, $86
	.db $F1, $A8
	.db $F1, $CF
	.db $F6, $04
	.db $FF
